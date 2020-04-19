local gui = require "lib.Gspot"

local aboutScrollInc = 600

function setupMenu()
	logoInc = 0

	logo = love.graphics.newImage("assets/ui/logo.png")
	gameLogo = love.graphics.newImage("assets/ui/theothermaplestory.png")
	buttons = {"Start", "Story", "Other Shit"}
end

function buttonSelector(selection)
	if selection == 1 then
		gamePhase = "map"
	elseif selection == 2 then
		gamePhase = "storyline"
	else
		gamePhase = "about"
	end
end
	
function renderMainMenuUI()
	for i=1,3 do
		local button = gui:button(buttons[i], {x = (800 - 256) / 2, y = 300 + 50*i, w = 256, h = gui.style.unit * 2}) -- a button(label, pos, optional parent) gui.style.unit is a standard gui unit (default 16), used to keep the interface tidy
		button.click = function(this, x, y) -- set element:click() to make it respond to gui's click event
			buttonSelector(i)
		end
	end
	if love.keyboard.isDown("space") then
		--gamePhase = "map"
	end
end

function renderStory()
	gui:clear()
	love.graphics.setColor(1,1,1)
	love.graphics.setNewFont("assets/ui/manrope.ttf",24)
	storyBody = "The year is 2025. Borders between countries are still closed due to the fear of the spread of viral diseases, forcing countries to produce all the things necessary to keep their citizens alive. For some countries, this is not a problem, and life carries on as if nothing has changed. But for other countries, this is proving to be quite the problem indeed. Take Canada for instance. It is a widely known fact that Canada’s only food source it can produce in its barren, snowy wastelands, is Maple Syrup. Their only other possible food sources, such as Moose and Cod, having long since been hunted to extinction. Now, with the fear of a massive obesity epidemic caused by a diet solely consisting of Maple Syrup, citizens are forced to fight one another for what little healthy food remains. There is, however, rumours, that far in the North, beyond the last igloo, there exists a Great Refrigerator that contains enough food to feed a person for many years. And thus, is where our story begins. With a young Canadian, about to venture out into the barren tundra of their home in an attempt to gather what food they can, and make the long and treacherous journey in search of this Great Refrigerator. Will they succeed and find enough food to survive this apocalypse, or will they be forced to succumb to the sweet, sugary goodness that may very well be this country’s undoing. Only time will tell. Perhaps they will find love, or an old friend out there in the tundra. Maybe a lost relative who will bestow upon them some great wisdom of years past. Or mayhaps a great… Oh, sorry, you probably just want to get to it, right? Yeah, that’s my bad… Anywho, on with the show!"
	if aboutScrollInc > -1000 and not love.keyboard.isDown("space", "return") then
		love.graphics.printf(storyBody, 100, aboutScrollInc ,600, 'center')
		aboutScrollInc = aboutScrollInc - 1
		love.timer.sleep(0.025)
	else 
		aboutScrollInc = 600
		gamePhase = "menu"
		menuDraw()
	end
end

function menuDraw()
	love.graphics.setBackgroundColor(0.3,0,0)
	--print("previous is "..previousPhase.." current is "..gamePhase)
	if gamePhase == "menu" then
		love.graphics.draw(gameLogo, 400 - (gameLogo:getWidth() / 4), 25, 0, 0.5, 0.5)
		if not (previousPhase == "menu") then
			renderMainMenuUI()
		end
	elseif gamePhase == "storyline" then
		renderStory()
	elseif gamePhase == "about" and not (previousPhase == "about") then
		renderAbout()
	end
	gui:draw()
end
