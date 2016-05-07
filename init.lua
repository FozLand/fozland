local load_time_start = os.clock()

local modpath = minetest.get_modpath('fozland')

dofile(modpath..'/migrate.lua')
dofile(modpath..'/dig_up.lua')

minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs',
		os.clock() - load_time_start
	)
)
