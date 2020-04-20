local gui = require "lib.Gspot"


function setupInventory()
	inventory = {}
	hunger = 5
	bmi = 20
end

function inventoryAdd(item)
	inventory[#inventory+1] = item
	inventoryDraw()
end

function inventoryRemove(idx)
	hunger = math.max(hunger - 1, 0)
	if inventory[idx] == "maplesyrup" then
		bmi = bmi + 0.2
	end

	local n = #inventory
	inventory[idx] = nil
	for i=idx,n-1 do
		inventory[i] = inventory[i+1]
	end
	inventory[n] = nil

	inventoryDraw()
end

function inventoryDraw()
	gui:clear()
	love.graphics.setFont(font10)
	for i, item in pairs(inventory) do
		local icon = love.graphics.newImage("assets/ui/food/"..item..".png")
		local button = gui:imgbutton(nil, {x = icon:getWidth() * i + (i*5), y = screenHeight - icon:getHeight(), w = icon:getWidth(), h = icon:getHeight()}, nil, icon)
		button.click = function(this, x, y)
			inventoryRemove(i)
		end
		button.tip = item
	end
	love.graphics.setFont(font14)
	local hungerText = gui:text("Hunger: "..hunger.."/10", {x = 0, y = 0, w = screenWidth, h = 25})
	local bmiText = gui:text("BMI: "..bmi.."/26.5", {x = 0, y = 25, w = screenWidth, h = 25})

	gui:draw()
end
