local sti = require "lib.sti"

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
