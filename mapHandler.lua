local sti        = require "lib.sti"
local bump       = require "lib.bump"
local bump_debug = require "lib.bump_debug"

function setupMap(m)
	map = sti(m,{"bump"})
	world = bump.newWorld(32)
	map:bump_init(world)

	speedx = 0
	speedy = 0
	
	local layer = map:addCustomLayer("spritesRender", #map.layers)
	layer.sprites = {}
	for _, sprite in pairs(map.objects) do
		local img = love.graphics.newImage("assets/sprites/"..sprite.name..".png")
		layer.sprites[sprite.id] = {
			name   = sprite.name,
			sprite = img,
			x      = sprite.x,
			y      = sprite.y,
			ox     = img:getWidth() / 2,
			oy     = img:getHeight() / 2
		}
		world:add(sprite, sprite.x, sprite.y, math.floor(img:getWidth() / 2), math.floor(img:getHeight() / 2))
	end

	layer.update = function(self, dt)
		if math.abs(speedx) < 0.1 then
			speedx = 0
		end
		if math.abs(speedy) < 0.1 then
			speedy = 0
		end

		if love.keyboard.isDown("w", "up") then
			speedy = speedy - 0.2
		end
		if love.keyboard.isDown("s", "down") then
			speedy = speedy + 0.2
		end
		if love.keyboard.isDown("a", "left") then
			speedx = speedx - 0.2
		end
		if love.keyboard.isDown("d", "right") then
			speedx = speedx + 0.2
		end

		if speedx > 0 then
			speedx = speedx - 0.1
		elseif speedx < 0 then
			speedx = speedx + 0.1
		end
		if speedy > 0 then
			speedy = speedy - 0.1
		elseif speedy < 0 then
			speedy = speedy + 0.1
		end
		
		for _, sprite in pairs(self.sprites) do
			if sprite.name == "player" then
				sprite.x = sprite.x + speedx
				sprite.y = sprite.y + speedy
				checkEncounters(sprite)
			else
				sprite.x = sprite.x + math.random(-2,2)
				sprite.y = sprite.y + math.random(-2,2)
			end
		end
	end

	layer.draw = function(self)
		for _, object in pairs(self.sprites) do
			love.graphics.draw(
				object.sprite,
				math.floor(object.x),
				math.floor(object.y),
				0,
				1,
				1,
				object.ox,
				object.oy
			)
		end
	end

	map:removeLayer("sprites")
end

function checkEncounters(player)
	for _, object in pairs(getItem(map.layers, "doors").objects) do
		if player.x+player.sprite:getWidth() >= object.x and
		   player.x <= object.x+object.width and
		   player.y+player.sprite:getHeight() >= object.y and
		   player.y <= object.y+object.height then
			setupMap("assets/maps/"..object.properties["LeadsTo"]..".lua")
			break
		end
	end
end
