local gui = require "lib.Gspot"
local sti = require "lib.sti"

function love.load()
	setupMenu()
	setupMap()
	setupSound()
end

function setupMenu()
	gamePhase = "splash"
	logoInc = 0

	logo = love.graphics.newImage("assets/ui/logo.png")
	buttons = {"Start", "Install Gelato", "Other Shit", "(this thing currently doesn't work, press Spacebar to continue"}
end

function setupMap()
	map = sti("assets/maps/test.lua")

	local layer = map:addCustomLayer("sprites", 4)

	local player
	for k, object in pairs(map.objects) do
		if object.name == "player" then
			player = object
			break
		end
	end

	local sprite = love.graphics.newImage("assets/sprites/player.png")
	layer.player = {
		sprite = sprite,
		x      = player.x,
		y      = player.y,
		ox     = sprite:getWidth() / 2,
		oy     = sprite:getHeight() / 1.35,
		speedx = 0,
		speedy = 0
	}

	layer.update = function(self, dt)
		if math.abs(self.player.speedx) < 0.1 then
			self.player.speedx = 0
		end
		if math.abs(self.player.speedy) < 0.1 then
			self.player.speedy = 0
		end

		if love.keyboard.isDown("w", "up") then
			self.player.speedy = self.player.speedy - 0.2
		end
		if love.keyboard.isDown("s", "down") then
			self.player.speedy = self.player.speedy + 0.2
		end
		if love.keyboard.isDown("a", "left") then
			self.player.speedx = self.player.speedx - 0.2
		end
		if love.keyboard.isDown("d", "right") then
			self.player.speedx = self.player.speedx + 0.2
		end

		if self.player.speedx > 0 then
			self.player.speedx = self.player.speedx - 0.1
		elseif self.player.speedx < 0 then
			self.player.speedx = self.player.speedx + 0.1
		end
		if self.player.speedy > 0 then
			self.player.speedy = self.player.speedy - 0.1
		elseif self.player.speedy < 0 then
			self.player.speedy = self.player.speedy + 0.1
		end

		self.player.x = self.player.x + self.player.speedx
		self.player.y = self.player.y + self.player.speedy
	end

	layer.draw = function(self)
		love.graphics.draw(
			self.player.sprite,
			math.floor(self.player.x),
			math.floor(self.player.y),
			0,
			1,
			1,
			self.player.ox,
			self.player.oy
		)
	end

	map:removeLayer("spawn")
end

function setupSound()
	titleMusic1 = love.audio.newSource("assets/music/title-intro.ogg", "stream")
	titleMusic2 = love.audio.newSource("assets/music/title-loop.ogg", "stream")	
	
	titleMusic1:play()
	currentMusic = "titlemusic1"
end
	
function soundManager()
	if gamePhase == "menu" then
		if not titleMusic1:isPlaying() and not titleMusic2:isPlaying() then
			titleMusic2:play()
		end
	end
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
		logoInc = logoInc + 1
	elseif gamePhase == "menu" then
		love.graphics.setNewFont(24)
		for i=1,4 do
		--	love.graphics.printf(buttons[i],0, 300 + 25*i, 800, "center")
			local button = gui:button("Start Button "..i, {x = 325, y = 300 + 25*i, w = 128, h = gui.style.unit}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
			button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
				gamePhase = "map"
			end
		end
		if love.keyboard.isDown("space") then
			gamePhase = "map"
		end
		gui:draw()
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
