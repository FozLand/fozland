local load_time_start = os.clock()

local modpath = minetest.get_modpath('fozland')

dofile(modpath..'/migrate.lua')
dofile(modpath..'/stonework.lua')
dofile(modpath..'/dig_up.lua')
dofile(modpath..'/stack_max.lua')
dofile(modpath..'/drop_leaves.lua')
dofile(modpath..'/sawables.lua')
dofile(modpath..'/other.lua')
dofile(modpath..'/rightclick.lua')
dofile(modpath..'/stone_with_ore.lua')
dofile(modpath..'/physics.lua')
dofile(modpath..'/doors.lua')
dofile(modpath..'/admin_wand.lua')

local count = 0
for _ in pairs(minetest.registered_nodes) do
	count = count + 1
end
minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs '..
		'('..count..') registered nodes',
		os.clock() - load_time_start
	)
)
