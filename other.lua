if minetest.get_modpath('bones') then
	minetest.register_craft({
		output = 'bones:bones',
		recipe = {
			{'group:stick', 'default:clay_lump', 'group:stick'},
			{''           , 'default:clay_lump', ''           },
			{'group:stick', ''                 , 'group:stick'}
		}
	})
end

-- Make strip mining unnecessary
minetest.register_craft({
	type = 'shapeless',
	output = 'default:gravel',
	recipe = {'default:cobble', 'default:cobble'}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:sand',
	recipe = {'default:gravel', 'default:gravel'}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:clay',
	recipe = {'group:sand', 'group:sand'}
})

minetest.register_craft({
	output = 'default:dirt 6',
	recipe = {
		{'group:leaves', 'group:leaves', 'group:leaves'},
	  {'default:clay', 'default:clay', 'default:clay'},
		{'group:sand',   'group:sand',   'group:sand'  }
	}
})

-- Sand to Sand Conversions
minetest.register_craft({
	type = 'shapeless',
	output = 'default:desert_sand',
	recipe = {'default:sand'}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:sand',
	recipe = {'default:desert_sand'}
})
