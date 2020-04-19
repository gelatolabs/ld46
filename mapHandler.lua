local sti        = require "lib.sti"
local bump       = require "lib.bump"
local bump_debug = require "lib.bump_debug"

function setupMap(m)
	map = sti(m,{"bump"})
	world = bump.newWorld(32)
	map:bump_init(world)

	speedx = 0
	speedy = 0
	
	inEncounter = false
	
	local layer = map:addCustomLayer("spritesRender", #map.layers)
	local player = getItem(map.objects, "player")
	layer.sprites = {}
	for _, sprite in pairs(map.objects) do
		local img = love.graphics.newImage("assets/sprites/"..sprite.name..".png")
		layer.sprites[sprite.id] = {
			name   = sprite.name,
			sprite = img,
			x      = sprite.x,
			y      = sprite.y,
			ox     = img:getWidth() / 2,
			oy     = img:getHeight() / 2,
			width  = img:getWidth(),
			height = img:getHeight(),
			talkedTo = false;
			properties = sprite.properties
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
				sprite.attx = sprite.x + speedx
				sprite.atty = sprite.y + speedy
				sprite.x, sprite.y, cols, cols_len = world:move(player, sprite.attx, sprite.atty)
				if not (sprite.attx == sprite.x) then
					speedx = 0
				end
				if not (sprite.atty == sprite.y) then
					speedy = 0
				end	
				checkEncounters(sprite)				
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
	if inEncounter == false then
		for _, sprite in pairs(map.layers["spritesRender"].sprites) do
			if player.x+player.sprite:getWidth() >= sprite.x and
			player.x <= sprite.x+sprite.width and
			player.y+player.sprite:getHeight() >= sprite.y and
			player.y <= sprite.y+sprite.height then
				-- print(sprite.properties["Is"])
				if sprite.properties["Is"] == "enemy" and sprite.talkedTo == false then
					inEncounter = true
					setupDialogue()
					gamePhase = "dialogue"
					sprite.talkedTo = true;
					break
				elseif sprite.talkedTo == true then
					love.graphics.printf("You already talked to this person!", 0,700,800, 'center')
				elseif sprite.properties["Is"] == "door" then
					level = sprite.properties["LeadsTo"]
				break
				end
			end
		end
	end
	if love.keyboard.isDown("t") then
		setupDialogue()
		gamePhase = "dialogue"
	end
	if love.keyboard.isDown("f") then
		inventoryAdd("poutine")
	end
	if love.keyboard.isDown("g") then
		inventoryAdd("maplesyrup")
	end
end
