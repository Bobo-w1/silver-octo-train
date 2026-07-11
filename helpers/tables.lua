--more advanced table module

tables = {}

--[[
(outdated)
@desc:
print out table
use pprint() instead
@params:
	from_table : {}
@return: none
]]
function tables.print(from_table)
	for index, value in pairs(from_table) do
		if type(value) == "table" then
			print("value is another table")
			print(index)
			return 
		end
		print("[".. index.. "] = ".. value)
	end
end

--[[
@desc:
	find value from table
@params:
	from_table : {}
	find_value : any (type from from_table)
@return: number (number if found, else nil)
]]
function tables.find(from_table, find_value)
	for index, value in ipairs(from_table) do
		if value == find_value then
			return index
		end
	end
	return nil
end

--[[
@desc:
	move stuffs from table to another
@params:
	from_table
	from_start_index
	from_end_index
	to_start_index
	to_table
@return: number (number if found, else nil)
]]
function tables.move(from_table, from_start_index, from_end_index, to_start_index, to_table)
	local index_offset = 0 --start at one since it start to insert on the end of to_table
	for index = from_start_index, from_end_index, 1 do
		local value = from_table[index]
		table.insert(to_table, to_start_index + index_offset, value)
		index_offset = index_offset + 1
	end

	return to_table
end