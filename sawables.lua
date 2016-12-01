if core.global_exists('stairsplus') then

	local dyes = {'white', 'grey', 'black', 'red', 'yellow', 'green', 'cyan',
								'blue', 'magenta', 'orange', 'violet', 'brown', 'pink',
								'dark_grey', 'dark_green'}

	local mod = ''
	local types = {}

	-- Bakedclay
	mod = 'bakedclay'
	types = dyes

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

	-- Wool
	local mod = 'wool'
	local types = dyes

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		def.groups.wool = nil
		stairsplus:register_all(mod, name, nodename, def)
	end
	
	-- Moreores
	local mod = 'moreores'
	local types = {'silver_block', 'tin_block', 'mithril_block'}
	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = table.copy(minetest.registered_nodes[nodename])
		stairsplus:register_all(mod, name, nodename, def)
	end
	
	--Drop stone slabs
	
	local mod = 'default'
	local types = {'stone', 'desert_stone'}
	for _, name in pairs(types) do
		local nodename = mod..':'..name
		minetest.registered_nodes[nodename].drop = nil
	end
		


end
