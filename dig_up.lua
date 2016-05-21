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
	table.insert(dig_ups, 'moretrees:apple_tree_trunk')
	table.insert(dig_ups, 'moretrees:beech_trunk')
	table.insert(dig_ups, 'moretrees:birch_trunk')
	table.insert(dig_ups, 'moretrees:fir_trunk')
	table.insert(dig_ups, 'moretrees:jungletree_trunk')
	table.insert(dig_ups, 'moretrees:oak_trunk')
	table.insert(dig_ups, 'moretrees:palm_trunk')
	table.insert(dig_ups, 'moretrees:rubber_tree_trunk')
	table.insert(dig_ups, 'moretrees:rubber_tree_trunk_empty')
	table.insert(dig_ups, 'moretrees:sequoia_trunk')
	table.insert(dig_ups, 'moretrees:spruce_trunk')
	table.insert(dig_ups, 'moretrees:willow_trunk')
end

for _,item in ipairs(dig_ups) do
	minetest.override_item(item, {
		after_dig_node = function(pos, node, meta, digger)
			default.dig_up(pos, node, digger)
		end
	})
end
