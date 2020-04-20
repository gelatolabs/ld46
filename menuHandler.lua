local gui = require "lib.Gspot"

local storyScrollInc = 600
local abootScrollInc = 600

function setupMenu()
	logoInc = 0

	logo = love.graphics.newImage("assets/ui/logo.png")
	gameLogo = love.graphics.newImage("assets/ui/theothermaplestory.png")
	buttons = {"Start", "Story", "Credits"}
end

function buttonSelector(selection)
	if selection == 1 then
		gui:clear()
		gamePhase = "map"
	elseif selection == 2 then
		gamePhase = "storyline"
	else
		gamePhase = "aboot"
	end
end
	
function renderMainMenuUI()
	for i=1,3 do
		local button = gui:button(buttons[i], {x = (800 - 256) / 2, y = 300 + 50*i, w = 256, h = gui.style.unit * 2})
		button.click = function(this, x, y)
			buttonSelector(i)
		end
	end
end

function renderStory()
	storyBody = 
		[[
The year is 2025. 
		
Borders between countries are still closed due to the fear of the spread of viral diseases, forcing countries to produce all the things necessary to keep their citizens alive.

For some countries, this is not a problem, and life carries on as if nothing has changed. But for others, this is proving to be quite the problem indeed. 
	
Take Canada for instance. It is a widely known fact that the only food source available in Canada’s barren, snowy wastelands is Maple Syrup. Their only other possible food sources, such as Moose and Cod, have long since been hunted to extinction.
		
Now, with the fear of a massive obesity epidemic caused by a diet solely consisting of Maple Syrup, citizens are forced to fight one another for what little healthy food remains.
		
There are, however, rumours, that far in the North, beyond the last igloo, there exists a Great Refrigerator that contains enough food to feed a person for many years.
		
And this is where our story begins. With a young Canadian, aboot to venture out into the barren tundra of their home in an attempt to gather what food they can, and make the long and treacherous journey in search of this Great Refrigerator.
		
Will they succeed and find enough food to survive this apocalypse, or will they be forced to succumb to the sweet, sugary goodness that may very well be this country’s undoing?
		
Only time will tell. Perhaps they will find love, or an old friend out there in the tundra. Maybe a lost relative who will bestow upon them some great wisdom of years past. 
		
Or mayhaps a great… oh, sorry, you probably just want to get to it, eh? Yeah, that’s my bad… anywho, on with the show!
		]]
		
	prettyScroller(storyBody, 1.5, "menu")
end

function renderAbout()
	gui:clear()
	love.graphics.setColor(1,1,1)
	love.graphics.setFont(font24)
	abootBody = 
		[[
The Other Maple Story
A Gelato Labs Production
for Ludum Dare 46
		
The Gelato Labs LD46 'G-Team' is:

Programming:
Kyle 'kfarwell' Farwell
Matthew 'fireTwoOneNine' Petry

Game Art:
Matt 'MTRooster' Rose
Lizzie 'Airessy' Parrish

Game Logo:
Matthew 'fireTwoOneNine' Petry

Music and Sound:
Lizzie 'Airessy' Parrish
Matthew 'fireTwoOneNine' Petry
		
Writing:
Matt 'MTRooster' Rose
Lizzie 'Airessy' Parrish
		
		
"The Other Maple Story" uses:
	
LOVE 11.3 2D framework
	
STI (Simple Tiled Implementation)
by Landon Manning (karai17)
		
bump.lua
by Enrique García Cota (kikito)
		
Gspot
by trubblegum and Pedro Gimeno Fortea (pgimeno)


All assets created for this game are licensed under the ISC License -- see COPYING file for details

See documentation for above listed libraries for respective licensing details.

]]
	if abootScrollInc > -1600 and not love.keyboard.isDown("space", "return") then
		love.graphics.printf(abootBody, 100, abootScrollInc ,600, 'center')
		if (1600 + abootScrollInc) > 250 then
			love.graphics.draw(logo, 400 - (logo:getWidth() / 4), 1600 + abootScrollInc, 0, 0.5, 0.5)
		else
			love.graphics.draw(logo, 400 - (logo:getWidth() / 4), 250, 0, 0.5, 0.5)
		end
		abootScrollInc = abootScrollInc - 1
		love.timer.sleep(0.015)
	else 
		abootScrollInc = 600
		gamePhase = "menu"
		menuDraw()
	end	
end

function menuDraw()
	if gamePhase == "menu" then
		love.graphics.setBackgroundColor(0.3,0,0)
		love.graphics.draw(gameLogo, 400 - (gameLogo:getWidth() / 4), 25, 0, 0.5, 0.5)
		if not (previousPhase == "menu") then
			renderMainMenuUI()
		end
	elseif gamePhase == "storyline" then
		renderStory()
	elseif gamePhase == "aboot" then
		renderAbout()
	end
	gui:draw()
end
