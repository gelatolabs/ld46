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
		if sprite.name == "maplesyrup" then
			img = love.graphics.newImage("assets/sprites/maplesyrupsmol.png")
		end
		layer.sprites[sprite.id] = {
			name   = sprite.name,
			sprite = img,
			x      = sprite.x,
			y      = sprite.y,
			ox     = img:getWidth() / 4,
			oy     = img:getHeight() / 4,
			width  = img:getWidth(),
			height = img:getHeight(),
			talkedTo = false;
			properties = sprite.properties
		}
		world:add(sprite, sprite.x, sprite.y, math.floor(img:getWidth() / 2), math.floor(img:getHeight() / 2))
	end
	getItem(layer.sprites, "player").sprite = love.graphics.newImage("assets/sprites/"..playerSprite.."e.png")

	if level == "home" then
		narration = "Hey look, there you are, all ready to go out on your epic quest. Better put on some clothes and grab your trusty backpack for storing food before you go, you probably won’t be coming back anytime soon."
	elseif level == "tutorial" then
		narration = "Oh hey, look at that person over there, they’ve got tons of food! I’m sure they’d be more than happy to share some with you. Go over and talk to them."
	elseif level == "level1" then
		narration = ""
	elseif level == "level6" then
		narration = "Oh hey, you finally made it? Wait, did you walk all the way here? Wow, good for you, that must have been a ton of work. I just took the train, was really nice, great picturesque views. Anyway, here it is the Great Refrigerator, go forward and claim your prize!"
	end

	layer.update = function(self, dt)
		if math.abs(speedx) < 0.1 then
			speedx = 0
		end
		if math.abs(speedy) < 0.1 then
			speedy = 0
		end

		if love.keyboard.isDown("w", "up") then
			getItem(self.sprites, "player").sprite = love.graphics.newImage("assets/sprites/"..playerSprite.."n.png")
			speedy = speedy - 0.2
		end
		if love.keyboard.isDown("s", "down") then
			getItem(self.sprites, "player").sprite = love.graphics.newImage("assets/sprites/"..playerSprite.."s.png")
			speedy = speedy + 0.2
		end
		if love.keyboard.isDown("a", "left") then
			getItem(self.sprites, "player").sprite = love.graphics.newImage("assets/sprites/"..playerSprite.."w.png")
			speedx = speedx - 0.2
		end
		if love.keyboard.isDown("d", "right") then
			getItem(self.sprites, "player").sprite = love.graphics.newImage("assets/sprites/"..playerSprite.."e.png")
			speedx = speedx + 0.2
		end

		hunger = hunger + math.random()/200
		if hunger >= 10 then
			gamePhase = "gameover"
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
			if object.name == "player" then
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
			else
				love.graphics.draw(
					object.sprite,
					math.floor(object.x),
					math.floor(object.y),
					0,
					1,
					1,
					0,
					0
				)
			end
		end
		local nWidth, nLines = font24:getWrap(narration, screenWidth - 100)
		local nHeight = (#nLines) * (font24:getHeight() + font24:getLineHeight())
		love.graphics.setColor(0.1,0,0,0.5)
		love.graphics.rectangle("fill", 0, screenHeight - nHeight + ty, screenWidth + tx, nHeight)
		love.graphics.setColor(1,1,1,1)
		love.graphics.printf(narration, 50 + tx, screenHeight - nHeight + ty, screenWidth - 100, 'center')
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
				if sprite.properties["Is"] == "enemy" and sprite.talkedTo == false then
					inEncounter = true
					setupDialogue(sprite.properties["Dialogue"])
					gamePhase = "dialogue"
					sprite.talkedTo = true;

					if level == "tutorial" then
						narration = "Nice going, you’re a natural at this stuff! And look at the delicious food you’ve got now! You can click on your food to eat it. Make sure you eat enough food to avoid starving to death. Wouldn’t want that. You can always eat some Maple Syrup to satiate your hunger, but eating too much Maple Syrup will cause you to gain weight. Gain too much weight and, well, best you just don’t do that. Alright, well, guess I’ll leave you to it. Best of luck, and try not to die!"
					end
					break
				elseif sprite.properties["Is"] == "door" then
					if sprite.name == "homeDoor" then
						if not clothed == true then
							narration = "Easy there pal, I get it’s the apocalypse, but we’re not savages. Go put some clothes on."
							break
						elseif not backpacked == true then
							narration = "I think you’re forgetting the whole reason you have to leave the house. You know, food. Go get your backpack so you can hold any food you find along the way."
							break
						end
					elseif sprite.name == "tutorialDoor" then
						if not tutorialComplete == true then
							break
						end
					end
					level = sprite.properties["LeadsTo"]
					currMap = setupMap("assets/maps/"..level..".lua")
					break
				elseif sprite.properties["Is"] == "maplesyrup" and sprite.talkedTo == false then
					inventoryAdd("Maple syrup")
					sprite.talkedTo = true;
					break
				elseif sprite.name == "clothes" and not clothed == true then
					narration = "Oh hey, looks like your shirt’s got a name tag on it, how handy. Too bad I can't read."
					clothed = true
					playerSprite = "player"
				elseif sprite.name == "backpack" and not backpacked == true then
					narration = "Backpack get! Now you can store all the food!"
					backpacked = true
				elseif sprite.name == "smeg" then
					gamePhase = "gameover"
				end
			end
		end
	end
end
