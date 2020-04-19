local gui        = require "lib.Gspot"
local bump       = require "lib.bump"
local bump_debug = require "lib.bump_debug"
require "lib.gelato"
require "menuHandler"
require "mapHandler"
require "dialogueHandler"
require "soundHandler"

function love.load()
	gamePhase = "splash"
	level = "test"
	setupMenu()
	currMap = setupMap("assets/maps/"..level..".lua")
	setupSound()
	love.graphics.setNewFont("assets/ui/manrope.ttf", 14)
end

function love.update(dt)
	map:update(dt)
	gui:update(dt)
end

function love.draw()
	scale = 1
	screenWidth  = love.graphics.getWidth()  / scale
	screenHeight = love.graphics.getHeight() / scale
	
	previousPhase = gamePhase

	if gamePhase == "splash" then
		if logoInc < (250 - (logo:getHeight() / 4)) then
			love.graphics.draw(logo, 400 - (logo:getWidth() / 4), logoInc, 0, 0.5, 0.5)
		else
			love.timer.sleep(1)
			gamePhase = "menu"
		end
		if love.keyboard.isDown("space") then
			gamePhase = "menu"
		end
		logoInc = logoInc + 1
	end
	if (gamePhase == "menu") or (gamePhase == "storyline") or (gamePhase == "about") then
		menuDraw()
	end
	if gamePhase == "map" then
		local player = getItem(map.layers["spritesRender"].sprites, "player")
		local tx = math.floor(player.x - screenWidth  / 2)
		local ty = math.floor(player.y - screenHeight / 2)
		map:draw(-tx, -ty, scale, scale)
	end
	if gamePhase == "dialogue" then -- dialogue
		dialogueDraw()
	end
	soundManager()
	--map:bump_draw(world)
	--bump_debug.draw(world)
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
