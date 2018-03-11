--[[
Fozland block migrations

	Update moreblocks bakedclay and bamboo
	Ex:
		moreblocks:slab_yellow_1         -> bakedclay:slab_yellow_1
		moreblocks:stair_block_dry_alt_1 -> bamboo:stair_block_dry_alt_1

--]]

local types	= {
	micro_ = {"","_1","_2","_4","_12","_14","_15"},
	panel_ = {"","_1","_2","_4","_12","_14","_15"},
	slab_ = {"","_1","_2","_quarter","_three_quarter","_14","_15"},
	slope_ = {
		"",          "_half",          "_half_raised",
		"_inner",    "_inner_half",    "_inner_half_raised",
		"_inner_cut","_inner_cut_half","_inner_cut_half_raised",
		"_outer",    "_outer_half",    "_outer_half_raised",
		"_outer_cut","_outer_cut_half","_outer_cut_half_raised",
		"_cut"},
	stair_ = {"","_half","_inner","_outer","_alt","_alt_1","_alt_2","_alt_4"},
}

-- handle mod contained renames
local mod_blocks = {
	castle = {
		pavement = "pavement_brick",
		pavement_bricks = "pavement_brick",
	},
}

for mod,varieties in pairs(mod_blocks) do
  for from_name,to_name in pairs(varieties) do

		for prefix, alternates in pairs(types) do
			for _,alt in ipairs(alternates) do

				local from_node_string = prefix..from_name..alt
				local to_node_string   = prefix..to_name..alt

				local from_node =	mod..":"..from_node_string
				local to_node   = mod..":"..to_node_string

				minetest.register_alias(from_node, to_node)

			end
		end

	end
end

-- handle blocks moved to default
local default_blocks = {
	moreblocks = {
		pinetree = "pine_tree",
		pinewood = "pine_wood",
	},
	moretrees = {
		acacia_planks = "acacia_wood",
		acacia_trunk = "acacia_tree",
		pine_planks = "pine_wood",
		pine_trunk = "pine_tree",
		jungletree_planks = "junglewood",
	}
}

for mod,varieties in pairs(default_blocks) do
  for from_name,to_name in pairs(varieties) do

		for prefix, alternates in pairs(types) do
			for _,alt in ipairs(alternates) do

				local from_node_string = prefix..from_name..alt
				local to_node_string   = prefix..to_name..alt

				local from_node = mod..":"..from_node_string
				local to_node   = "default:"..to_node_string

				minetest.register_alias(from_node, to_node)

			end
		end

	end
end

-- handle blocks moved out of moreblocks
local blocks = {
	bakedclay = {
		"white",  "grey",  "black", "red",       "yellow",
		"green",  "cyan",  "blue",  "magenta",   "orange",
		"violet", "brown", "pink",  "dark_grey", "dark_green"
	},
	bamboo = {"block", "block_dry"},
	castle = {"pavement"},
}

for mod,varieties in pairs(blocks) do
  for _,variety in ipairs(varieties) do

		for prefix, alternates in pairs(types) do
			for _,alt in ipairs(alternates) do

				local node_string = prefix..variety..alt

				local from_node = "moreblocks:"..node_string
				local to_node   =  mod..":"..node_string

				minetest.register_alias(from_node, to_node)

			end
		end

	end
end
