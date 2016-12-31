-- Normalize right click behavior.
for name, def in pairs(minetest.registered_items) do
	if def.on_place then
		local original_on_place = def.on_place
		def.on_place = function(itemstack, placer, pointed_thing)
			if placer:get_player_control()['sneak'] then
				return original_on_place(itemstack, placer, pointed_thing)
			end

			local node = minetest.get_node(pointed_thing.under)
			local udef = minetest.registered_nodes[node.name]
			if udef and udef.on_rightclick then
				return udef.on_rightclick(pointed_thing.under, node, placer, itemstack)
			else
				return original_on_place(itemstack, placer, pointed_thing)
			end
		end
	end
end
