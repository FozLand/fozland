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
	output = 'default:dirt 4',
	recipe = {
		{'group:leaves', 'group:leaves', 'group:leaves'},
		{'default:clay', 'default:clay', 'group:leaves'},
		{'group:sand',   'group:sand',   'group:leaves'}
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
	output = 'default:silver_sand',
	recipe = {'default:desert_sand'}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:sand',
	recipe = {'default:silver_sand'}
})

-- Change the default TNT recipe to make it more expensive, but not too
-- expensive.
if minetest.get_modpath('tnt') then
	minetest.clear_craft({output = 'tnt:tnt'})
	minetest.register_craft({
		output = 'tnt:tnt',
		recipe = {
			{''          , 'default:flint', ''          },
			{'group:wood', 'tnt:gunpowder', 'group:wood'},
			{''          , 'group:wood'   , ''          }
		}
	})
end

-- Sugar conversions
minetest.register_craft({
	type = 'shapeless',
	output = 'bushes:sugar',
	recipe = {
		'mtfoods:sugar', 'mtfoods:sugar', 'mtfoods:sugar',
		'mtfoods:sugar', 'mtfoods:sugar', 'mtfoods:sugar'
	}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'mtfoods:sugar 6',
	recipe = {'bushes:sugar'}
})

-- Provide reverse recipes for _block items.
local types = {'stone', 'desert_stone', 'sandstone', 'obsidian'}

for _, name in pairs(types) do
	local ing = 'default:'..name..'_block'
	minetest.register_craft({
		output = 'default:'..name..' 9',
		recipe = {
			{ing, ing, ing},
			{ing, ing, ing},
			{ing, ing, ing},
		}
	})
end
