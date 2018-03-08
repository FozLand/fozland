if core.global_exists('stairsplus') then

	local dyes = {'white', 'grey', 'black', 'red', 'yellow', 'green', 'cyan',
	              'blue', 'magenta', 'orange', 'violet', 'brown', 'pink',
	              'dark_grey', 'dark_green'}

	-- Bakedclay
	local mod = 'bakedclay'
	local types = dyes

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		def.groups.bakedclay = nil
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Bamboo
	mod = 'bamboo'
	types = {'block', 'block_dry'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Coloured Stonebricks
	mod = 'colouredstonebricks'
	types = {'black', 'cyan', 'brown', 'dark_blue', 'dark_green', 'dark_grey',
	         'dark_pink', 'green', 'grey', 'orange', 'pink', 'purple', 'red',
	         'white', 'yellow'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Moreores
	mod = 'moreores'
	types = {'silver_block', 'tin_block', 'mithril_block'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Stonework
	mod = 'fozland'
	types = {'setts', 'gneiss'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		stairsplus:register_all(mod, name, nodename, def)
	end

end
