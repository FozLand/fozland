dig_ups = {
	'default:tree',
	'default:jungletree',
	'default:pine_tree',
	'default:acacia_tree',
	'default:aspen_tree',
	'default:cactus',
	'default:papyrus'
}

if moretrees then
	if moretrees.enable_apple_tree then
		table.insert(dig_ups, 'moretrees:apple_tree_trunk')
	end
	if moretrees.enable_beech then
		table.insert(dig_ups, 'moretrees:beech_trunk')
	end
	if moretrees.enable_birch then
		table.insert(dig_ups, 'moretrees:birch_trunk')
	end
	if moretrees.enable_fir then
		table.insert(dig_ups, 'moretrees:fir_trunk')
	end
	if moretrees.enable_jungle_tree then
		table.insert(dig_ups, 'moretrees:jungletree_trunk')
	end
	if moretrees.enable_oak then
		table.insert(dig_ups, 'moretrees:oak_trunk')
	end
	if moretrees.enable_palm then
		table.insert(dig_ups, 'moretrees:palm_trunk')
	end
	if moretrees.enable_rubber_tree then
		table.insert(dig_ups, 'moretrees:rubber_tree_trunk')
		table.insert(dig_ups, 'moretrees:rubber_tree_trunk_empty')
	end
	if moretrees.enable_sequoia then
		table.insert(dig_ups, 'moretrees:sequoia_trunk')
	end
	if moretrees.enable_spruce then
		table.insert(dig_ups, 'moretrees:spruce_trunk')
	end
	if moretrees.enable_willow then
		table.insert(dig_ups, 'moretrees:willow_trunk')
	end
end

for _,item in ipairs(dig_ups) do
	minetest.override_item(item, {
		after_dig_node = function(pos, node, meta, digger)
			default.dig_up(pos, node, digger)
		end
	})
end
