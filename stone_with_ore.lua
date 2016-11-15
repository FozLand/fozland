-- Craftable stone_with_ores
-- compatible with moreores mod

-- Coal
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_coal',
	recipe = {'default:cobble', 'default:coal_lump'}
})

-- Iron
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_iron',
	recipe = {'default:cobble', 'default:iron_lump'}
})

-- Copper
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_copper',
	recipe = {'default:cobble', 'default:copper_lump'}
})

--Gold
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_gold',
	recipe = {'default:cobble', 'default:gold_lump'}
})

-- Mese
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_mese',
	recipe = {'default:cobble', 'default:mese_crystal'}
})

-- Diamond
minetest.register_craft({
	type = 'shapeless',
	output = 'default:stone_with_diamond',
	recipe = {'default:cobble', 'default:diamond'}
})

if minetest.get_modpath('moreores') then
	-- Tin
	minetest.register_craft({
		type = 'shapeless',
		output = 'moreores:mineral_tin',
		recipe = {'default:cobble', 'moreores:tin_lump'}
	})

	--Silver
	minetest.register_craft({
		type = 'shapeless',
		output = 'moreores:mineral_silver',
		recipe = {'default:cobble', 'moreores:silver_lump'}
	})

	--Mithril
	minetest.register_craft({
		type = 'shapeless',
		output = 'moreores:mineral_mithril',
		recipe = {'default:cobble', 'moreores:mithril_lump'}
	})
end
