minetest.register_node('fozland:setts', {
	description = 'Setts (Belgian Block)',
	tiles = {'fozland_setts.png'},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('fozland:gneiss', {
	description = 'Slate',
	tiles = {'fozland_gneiss.png'},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'fozland:setts 6',
	recipe = {
		{'default:cobble', 'default:cobble', ''              },
		{'',               'default:cobble', 'default:cobble'},
		{'default:cobble', 'default:cobble', ''              },
	}
})

minetest.register_craft({
	output = 'default:cobble',
	recipe = {
		{'fozland:setts'},
	}
})

minetest.register_craft({
	type = 'cooking',
	output = 'fozland:gneiss',
	recipe = 'default:stone',
})
