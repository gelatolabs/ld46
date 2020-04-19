local gui = require "lib.Gspot"

function setupInventory()
	inventory = {}
end

function inventoryAdd(item)
	inventory[#inventory+1] = item
	inventoryDraw()
end

function inventoryRemove(idx)
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
	for i, item in pairs(inventory) do
		local icon = love.graphics.newImage("assets/ui/food/"..item..".png")
		local button = gui:imgbutton(item, {x = icon:getWidth() * i, y = screenHeight - icon:getHeight(), w = icon:getWidth(), h = icon:getHeight()}, nil, icon)
		button.click = function(this, x, y)
			inventoryRemove(i)
		end
	end
	gui:draw()
end
