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

minetest.register_craft({
	type = 'shapeless',
	output = 'default:sand',
	recipe = {'default:cobble'}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:dirt 2',
	recipe = {'default:sand', 'default:sand'}
 })
