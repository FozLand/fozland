local load_time_start = os.clock()

local modpath = minetest.get_modpath('fozland')

dofile(modpath..'/migrate.lua')
dofile(modpath..'/dig_up.lua')
dofile(modpath..'/stack_max.lua')
dofile(modpath..'/drop_leaves.lua')
dofile(modpath..'/sawables.lua')
dofile(modpath..'/other.lua')
dofile(modpath..'/rightclick.lua')
dofile(modpath..'/stone_with_ore.lua')
dofile(modpath..'/bookmarks.lua')

minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs',
		os.clock() - load_time_start
	)
)
