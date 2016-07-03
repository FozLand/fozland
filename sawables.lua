

if core.get_modpath( 'moreblocks' ) then

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
		local def = minetest.registered_nodes[nodename]
		def.groups.bakedclay = nil
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Bamboo
	mod = 'bamboo'
	types = {'block', 'block_dry'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = minetest.registered_nodes[nodename]
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Coloured Stonebricks
	mod = 'colouredstonebricks'
	types = {'black', 'cyan', 'brown', 'dark_blue', 'dark_green', 'dark_grey',
           'dark_pink', 'green', 'grey', 'orange', 'pink', 'purple', 'red',
           'white', 'yellow'}

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = minetest.registered_nodes[nodename]
		stairsplus:register_all(mod, name, nodename, def)
	end

	-- Wool
	local mod = 'wool'
	local types = dyes

	for _, name in pairs(types) do
		local nodename = mod..':'..name
		local def = minetest.registered_nodes[nodename]
		def.groups.wool = nil
		stairsplus:register_all(mod, name, nodename, def)
	end
end
