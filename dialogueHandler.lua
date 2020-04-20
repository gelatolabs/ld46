local gui = require "lib.Gspot"
require "dialogue"

newDialogue = true

function setupDialogue(dude)
	bg = love.graphics.newImage("assets/bgs/"..level..".png")
	d = dialogue[level][dude]
	ds = 1
	score = 0
	nextDialogue(d["intro"], d["stages"][ds]["options"])
end

function nextDialogue(t, b)
	newDialogue = true
	text = t
	buttons = b
end

function dialogueSelector(selection)
	ds = ds + 1
	if d["stages"][ds-1]["outcomes"][selection] == "positive" then
		score = score + 1
	end
	if ds <= #d["stages"] then
		nextDialogue(d["stages"][ds-1]["responses"][selection], d["stages"][ds]["options"])
	else
		if score >= d["minscore"] then
			if level == "tutorial" then
				tutorialComplete = true
			end
			inventoryAdd(d["food"])
			nextDialogue(d["stages"][ds-1]["responses"][selection].."\n"..d["success"], {"Back"})
		else
			nextDialogue(d["stages"][ds-1]["responses"][selection].."\n"..d["fail"], {"Back"})
		end
	end
end
	
function dialogueDraw()
	love.graphics.draw(bg, 0, 0)
	love.graphics.setFont(font24)
	love.graphics.printf(text, 0, 25, screenWidth, "center")
	if newDialogue == true then
		gui:clear()
		for i=1,#buttons do
			tempText = love.graphics.newText(font20, buttons[i])
			buttonWidth = tempText:getWidth()+ 40
			local button = gui:button(buttons[i], {x = (800 - buttonWidth) / 2, y = 300 + 50*i, w = buttonWidth, h = gui.style.unit * 2})
			button.click = function(this, x, y)
				if buttons[i] == "Back" then
					gamePhase = "map"
					gui:clear()
					inEncounter = false;
					inventoryDraw()
				else
					dialogueSelector(i)
				end
			end
		end
		newDialogue = false;
	end
	gui:draw()
end
