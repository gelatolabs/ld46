local gui = require "lib.Gspot"


function setupInventory()
	inventory = {}
	hunger = 0
	bmi = 20
end

function inventoryAdd(item)
	inventory[#inventory+1] = item
	inventoryDraw()
end

function inventoryRemove(idx)
	hunger = hunger - 1
	if inventory[idx] == "Maple syrup" then
		bmi = bmi + 0.2
		if bmi >= 26.5 then
			gamePhase = "gameover"
		end
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
		local icon = love.graphics.newImage("assets/ui/food/"..item:gsub('%W', ''):lower()..".png")
		local button = gui:imgbutton(nil, {x = icon:getWidth() * i + (i*5) - icon:getWidth(), y = 5, w = icon:getWidth(), h = icon:getHeight()}, nil, icon)
		button.click = function(this, x, y)
			inventoryRemove(i)
		end
		button.tip = item
	end
	love.graphics.setFont(font14)

	gui:draw()
end
