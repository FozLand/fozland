if minetest.get_modpath('mesecons_doors') then
	local override = {
		mesecons = {effector = {
			action_on = function(pos, node)
				local door = doors.get(pos)
				if door then
					door:open()
				end
			end,
			action_off = function(pos, node)
				local door = doors.get(pos)
				if door then
					door:close()
				end
			end,
			rules = mesecon.rules.pplate
		}}
	}

	local types = {}
	if minetest.get_modpath('bamboo') then
		table.insert(types, 'bamboo:door')
	end
	if minetest.get_modpath('castle') then
		table.insert(types, 'castle:oak_door')
		table.insert(types, 'castle:jail_door')
	end
	if minetest.get_modpath('landrush') then
		table.insert(types, 'landrush:shared_door')
	end

	for _, name in pairs(types) do
		minetest.override_item(name..'_a', override)
		minetest.override_item(name..'_b', override)
	end
end
