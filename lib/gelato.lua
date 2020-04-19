-- return table item by name (for STI)
function getItem(table, name)
	for _, item in pairs(table) do
		if item.name == name then
			return item
		end
	end
end

-- print tables for debugging
-- stolen from https://stackoverflow.com/a/27028488 :)
function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end
