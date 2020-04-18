local gui = require "lib.Gspot"

require "mapHandler"
require "soundHandler"
require "menuHandler"

gamePhase = "splash"

function love.load()
	setupMenu()
	setupMap("assets/maps/test.lua")
	setupSound()
end

function love.update(dt)
	map:update(dt)
	gui:update(dt)
end

function love.draw()
	local scale = 1
	local screenWidth  = love.graphics.getWidth()  / scale
	local screenHeight = love.graphics.getHeight() / scale

	if gamePhase == "splash" then
		if logoInc < (300 - (logo:getHeight() / 4)) then
			love.graphics.draw(logo, 400 - (logo:getWidth() / 4), logoInc, 0, 0.5, 0.5)
		else
			love.timer.sleep(1)
			gamePhase = "menu"
		end
		if love.keyboard.isDown("space") then
			gamePhase = "menu"
		end
		logoInc = logoInc + 1
	elseif gamePhase == "menu" then
		menuDraw()
	elseif gamePhase == "map" then
		local player = map.layers["sprites"].player
		local tx = math.floor(player.x - screenWidth  / 2)
		local ty = math.floor(player.y - screenHeight / 2)

		map:draw(-tx, -ty, scale, scale)
	end
	soundManager()
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
