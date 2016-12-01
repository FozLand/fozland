minetest.register_privilege('physics', {
	description = 'Can set any players physics values.',
})

----------------------------------
-- General physics manipulators --
----------------------------------
minetest.register_chatcommand('speed', {
	params = '<number> [player]',
	description = 'Sets player\'s speed multiplier.',
	privs = {physics = true},
	func = function(name, params)
		local value, p_name = params:match('^(%S+)%s+(.+)')
		if not p_name then
			value = params:match('^(%S+)')
			p_name = name
		end
		value = tonumber(value)
		if not value then
			return false, 'Invalid parameters (see /help speed).'
		elseif value < 0 then
			return false, 'Cannot set speed below zero. Just turn around.'
		elseif value > 4 then
			return false, 'Cannot set speed greater than 4.'
		end
		local player = minetest.env:get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({speed = value})
		if name ~= p_name then
			minetest.chat_send_player(p_name,
				'Your speed multiplier has been set to '..tostring(value)..'.')
		end
		return true, p_name..'\'s speed multiplier set to '..tostring(value)
	end,
})

minetest.register_chatcommand('gravity', {
	params = '<number> [player]',
	description = 'Sets player\'s gravity multiplier.',
	privs = {physics = true},
	func = function(name, params)
		local value, p_name = params:match('^(%S+)%s+(.+)')
		if not p_name then
			value = params:match('^(%S+)')
			p_name = name
		end
		value = tonumber(value)
		if not value then
			return false, 'Invalid parameters (see /help gravity).'
		elseif value < 0 then
			return false, 'Anti-gravity does not exist.'
		elseif value < 0.01 then
			return false, 'micro-gravity is dangerous. You might jump off the planet.'
		elseif value > 10 then
			return false, 'Setting gravity greater than 10 will crush you.'
		end
		local player = minetest.env:get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({gravity = value})
		if name ~= p_name then
			minetest.chat_send_player(p_name,
				'Your gravity multiplier has been set to '..tostring(value)..'.')
		end
		return true, p_name..'\'s gravity multiplier set to '..tostring(value)
	end,
})

minetest.register_chatcommand('jump', {
	params = '<number> [player]',
	description = 'Sets player\'s jump height multiplier.',
	privs = {physics = true},
	func = function(name, params)
		local value, p_name = params:match('^(%S+)%s+(.+)')
		if not p_name then
			value = params:match('^(%S+)')
			p_name = name
		end
		value = tonumber(value)
		if not value then
			return false, 'Invalid parameters (see /help jump).'
		elseif value < 0 then
			return false, 'That is not called jumping.'
		elseif value > 10 then
			return false, 'Cannot set jump greater than 10.'
		end
		local player = minetest.env:get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({jump = value})
		if name ~= p_name then
			minetest.chat_send_player(p_name,
				'Your jump multiplier has been set to '..tostring(value)..'.')
		end
		return true, p_name..'\'s jump multiplier set to '..tostring(value)
	end,
})

minetest.register_chatcommand('normal', {
	params = '[player]',
	description = 'Sets a players physics overrides to normal values.',
	privs = {physics = true},
	func = function(name, p_name)
		if p_name == '' or p_name == nil then
			p_name = name
		end
		local player = minetest.get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({speed = 1, gravity = 1, jump = 1})
		if name ~= p_name then
			minetest.chat_send_player(p_name, 'Your physics are back to normal.')
		end
		return true, p_name..'\'s physics set to normal.'
	end,
})

---------------------------------------
-- Special Case Physics Manipulators --
---------------------------------------
--[[ Temporarily disabled
-- Freeze
local freeze = {
	hp_max = 1,
	groups = {immortal = 1},
	physical = true,
	collide_with_objects = true,
	weight = 5,
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5},
	visual = 'mesh',
	mesh = 'boats_boat.obj',
	textures = {'default_diamond_block.png'},
	is_visible = true,
	automatic_rotate = false,
	automatic_face_movement_dir = false
}

minetest.register_entity('fozland:freeze', freeze)

minetest.register_chatcommand('freeze', {
	params = '[player]',
	description = 'Freezes player in place.',
	privs = {physics = true},
	func = function(name, p_name)
		if p_name == '' or p_name == nil then
			p_name = name
		end
		local player = minetest.get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({speed = 0})
		local pos = player:getpos()
		local freeze = minetest.add_entity(pos, 'fozland:freeze')
		player:set_attach(freeze, '',
			{x = 0, y = 11, z = -3}, {x = 0, y = 0, z = 0})
		minetest.after(2, function()
			player:set_detach()
		end)
		if name ~= p_name then
			minetest.chat_send_player(p_name, 'You have been frozen.')
		end
		return true, p_name..' has been frozen.'
	end,
})
--]]

-- Moonboots
minetest.register_chatcommand('mb', {
	params = '[player]',
	description = 'Set a players gravity to a moon like value.',
	privs = {physics = true},
	func = function(name, p_name)
		if p_name == '' or p_name == nil then
			p_name = name
		end
		local player = minetest.get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({gravity = 0.165})
		if name ~= p_name then
			minetest.chat_send_player(p_name,
				'You have been given Moon Boots. Use them Wisely')
		end
		return true, p_name..' now has Moon Boots.'
	end,
})

-- Mario
minetest.register_chatcommand('mario', {
	params = '[player]',
	description = 'Increase a players jump ability.',
	privs = {physics = true},
	func = function(name, p_name)
		if p_name == '' or p_name == nil then
			p_name = name
		end
		local player = minetest.get_player_by_name(p_name)
		if not player then
			return false, 'Player '..p_name..' is not online!'
		end
		player:set_physics_override({jump = 1.7})
		if name ~= p_name then
			minetest.chat_send_player(p_name,	'You can now jump like Mario.')
		end
		return true, p_name..' has been marioed.'
	end,
})
