local gui = require "lib.Gspot"

function setupMenu()
	logoInc = 0

	logo = love.graphics.newImage("assets/ui/logo.png")
	buttons = {"Start", "Install Gelato", "Other Shit", "(this thing currently doesn't work, press Spacebar to continue"}
end

function menuDraw()
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
end
