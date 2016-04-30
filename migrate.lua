--[[
Fozland block migrations

	Update moreblocks bakedclay and bamboo
	Ex:
		moreblocks:slab_yellow_1         -> bakedclay:slab_yellow_1
		moreblocks:stair_block_dry_alt_1 -> bamboo:stair_block_dry_alt_1

--]]

local blocks = {
	bakedclay = {
		"white",  "grey",  "black", "red",       "yellow",
		"green",  "cyan",  "blue",  "magenta",   "orange",
		"violet", "brown", "pink",  "dark_grey", "dark_green"
	},
	bamboo = {"block", "block_dry"}
}

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

local from_nodes = {} -- array of nodes to change
local to_nodes = {}		-- table of nodes name keyed to the from node value

for mod,varieties in pairs(blocks) do
  for _,variety in ipairs(varieties) do

		for prefix, alternates in pairs(types) do
			for _,alt in ipairs(alternates) do

				local node_string = prefix..variety..alt

				local from_node = "moreblocks:"..node_string
				local to_node   =  mod..":"..node_string

				minetest.register_alias(from_node, to_node)

				table.insert(from_nodes, from_node)
				to_nodes[from_node] = to_node

			end
		end

	end
end

minetest.register_lbm({
	name = "fozland:replace_moreblocks_bakedclay_and_bamboo",
	nodenames = from_nodes,
	action = function(pos, node)
		local node_name = node.name -- remember the old node's name for the log
		local new_node = node
		new_node.name = to_nodes[node.name]
		minetest.log('action',"lbm changing "..node_name.." to "..new_node.name..
			" at "..minetest.pos_to_string(pos))

		minetest.set_node(pos, new_node)
	end,
})
