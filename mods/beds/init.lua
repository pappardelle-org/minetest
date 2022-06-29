 -- Load support for MT game translation.
local S
if minetest.get_translator ~= nil then
	S = minetest.get_translator("beds") -- 5.x translation function
else
	if minetest.get_modpath("intllib") then
		dofile(minetest.get_modpath("intllib") .. "/init.lua")
		if intllib.make_gettext_pair then
			gettext, ngettext = intllib.make_gettext_pair() -- new gettext method
		else
			gettext = intllib.Getter() -- old text file method
		end
		S = gettext
	else -- boilerplate function for 0.4
		S = function(str, ...)
			local args = {...}
			return str:gsub("@%d+", function(match)
				return args[tonumber(match:sub(2))]
			end)
		end
	end
end


beds = {
	mod = "redo",
	player = {},
	bed_position = {},
	pos = {},
	spawn = {},
	respawn = {},
	get_translator = S,
	formspec = "size[8,11;true]"
	.. "no_prepend[]"
	.. "bgcolor[#080808BB;true]"
	.. "button_exit[2,10;4,0.75;leave;" .. minetest.formspec_escape(S("Leave Bed")) .. "]"
}


local modpath = minetest.get_modpath("beds")

dofile(modpath .. "/functions.lua")
dofile(modpath .. "/api.lua")
dofile(modpath .. "/beds.lua")
dofile(modpath .. "/spawns.lua")


print("[MOD] Beds loaded")
