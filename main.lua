local map
local mapWidth, mapHeight -- in tiles

local mapX, mapY -- position in tiles, can be fractional
local speedX, speedY

local tilesDisplayWidth, tilesDisplayHeight -- number of tiles in view
local zoomX, zoomY

local tilesetImage
local tileSize -- in pixels
local tileQuads = {} -- parts of the tileset used for different tiles
local tilesetSprite

local gamePhase = "menu"
local logoinc = 0

gui = require("Gspot")

function love.load()
	setupMap()
	setupMapView()
	setupTileset()
	setupUI()
	setupMenuGraphics()
end

function setupMenuGraphics()
	logo = love.graphics.newImage("logo-green.png")
	buttons = {"Start", "Install Gelato", "Other Shit", "(this thing currently doesn't work, press Spacebar to continue"}
end


function setupMap()
	mapWidth = 60
	mapHeight = 40

	map = {}
	for x=1,mapWidth do
		map[x] = {}
		for y=1,mapHeight do
			map[x][y] = love.math.random(0,3)
		end
	end
end

function setupMapView()
	mapX = 1
	mapY = 1
	speedX = 0
	speedY = 0
	tilesDisplayWidth = 26
	tilesDisplayHeight = 20
	zoomX = 1
	zoomY = 1
end

function setupTileset()
	tilesetImage = love.graphics.newImage( "tileset.png" )
	tilesetImage:setFilter("nearest", "linear") -- fix scaling artifacts
	tileSize = 32

	-- grass
	tileQuads[0] = love.graphics.newQuad(0 * tileSize, 20 * tileSize, tileSize, tileSize,
		tilesetImage:getWidth(), tilesetImage:getHeight())
	-- kitchen floor tile
	tileQuads[1] = love.graphics.newQuad(2 * tileSize, 0 * tileSize, tileSize, tileSize,
		tilesetImage:getWidth(), tilesetImage:getHeight())
	-- parquet flooring
	tileQuads[2] = love.graphics.newQuad(4 * tileSize, 0 * tileSize, tileSize, tileSize,
		tilesetImage:getWidth(), tilesetImage:getHeight())
	-- middle of red carpet
	tileQuads[3] = love.graphics.newQuad(3 * tileSize, 9 * tileSize, tileSize, tileSize,
		tilesetImage:getWidth(), tilesetImage:getHeight())

	tilesetBatch = love.graphics.newSpriteBatch(tilesetImage, tilesDisplayWidth * tilesDisplayHeight)

	updateTilesetBatch()
end

function updateTilesetBatch()
	tilesetBatch:clear()
	for x=0, tilesDisplayWidth-1 do
		for y=0, tilesDisplayHeight-1 do
			tilesetBatch:add(tileQuads[map[x+math.floor(mapX)][y+math.floor(mapY)]],
				x*tileSize, y*tileSize)
		end
	end
	tilesetBatch:flush()
end

function setupUI()
	bob = love.graphics.newImage("bob.png")
end

function moveMap(dx, dy)
	oldMapX = mapX
	oldMapY = mapY
	mapX = math.max(math.min(mapX + dx, mapWidth - tilesDisplayWidth), 1)
	mapY = math.max(math.min(mapY + dy, mapHeight - tilesDisplayHeight), 1)
	-- only update if we actually moved
	if math.floor(mapX) ~= math.floor(oldMapX) or math.floor(mapY) ~= math.floor(oldMapY) then
		updateTilesetBatch()
	end
end

function love.update(dt)
	if math.abs(speedX) < 0.1 then
		speedX = 0
	end
	if math.abs(speedY) < 0.1 then
		speedY = 0
	end

	if love.keyboard.isDown("up")  then
		speedY = speedY - 0.2
	end
	if love.keyboard.isDown("down")  then
		speedY = speedY + 0.2
	end
	if love.keyboard.isDown("left")  then
		speedX = speedX - 0.2
	end
	if love.keyboard.isDown("right")  then
		speedX = speedX + 0.2
	end

	if speedX > 0 then
		speedX = speedX - 0.1
	elseif speedX < 0 then
		speedX = speedX + 0.1
	end
	if speedY > 0 then
		speedY = speedY - 0.1
	elseif speedY < 0 then
		speedY = speedY + 0.1
	end

	moveMap(speedX * tileSize * dt, speedY * tileSize * dt)
	gui:update(dt)
end

function love.draw()
	if gamePhase == "initial" then
		if logoinc < (300 - (logo:getHeight() / 4)) then
			love.graphics.draw(logo, 400 - (logo:getWidth() / 4), logoinc, 0, .5, .5)
		else
			love.timer.sleep(1)
			gamePhase = "menu"
		end
		logoinc = logoinc + 1
	end
	if gamePhase == "menu" then
		love.graphics.setNewFont(24)
		for i=1,4 do
		--	love.graphics.printf(buttons[i],0, 300 + 25*i, 800, "center")
			local button = gui:button('Start Button '..i, {x = 325, y = 300 + 25*i, w = 128, h = gui.style.unit}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
			button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
				gamePhase = "tiles"
			end
		end
		if love.keyboard.isDown("space") then
			gamePhase = "tiles"
		end
		gui:draw()
	end
	if gamePhase == "tiles" then
		love.graphics.draw(tilesetBatch,
			math.floor(-zoomX*(mapX%1)*tileSize), math.floor(-zoomY*(mapY%1)*tileSize),
			0, zoomX, zoomY)
		love.graphics.draw(bob,
			(love.graphics.getWidth() - bob:getWidth())/2, (love.graphics.getHeight() - bob:getHeight())/2,
			0, zoomX, zoomY)
		love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
	end
end

love.mousepressed = function(x, y, button)
	gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
end
love.mousereleased = function(x, y, button)
	gui:mouserelease(x, y, button)
end
love.wheelmoved = function(x, y)
	gui:mousewheel(x, y)
end
