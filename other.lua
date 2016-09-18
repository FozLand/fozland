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
