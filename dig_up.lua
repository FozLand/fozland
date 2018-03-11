dig_ups = {
	'default:acacia_tree',
	'default:aspen_tree',
	'default:cactus',
	'default:jungletree',
	'default:papyrus',
	'default:pine_tree',
	'default:tree',
}

if moretrees then
	table.insert(dig_ups, 'moretrees:apple_tree_trunk')
	table.insert(dig_ups, 'moretrees:beech_trunk')
	table.insert(dig_ups, 'moretrees:birch_trunk')
	table.insert(dig_ups, 'moretrees:cedar_trunk')
	table.insert(dig_ups, 'moretrees:date_palm_trunk')
	table.insert(dig_ups, 'moretrees:fir_trunk')
	table.insert(dig_ups, 'moretrees:jungletree_trunk')
	table.insert(dig_ups, 'moretrees:oak_trunk')
	table.insert(dig_ups, 'moretrees:palm_trunk')
	table.insert(dig_ups, 'moretrees:poplar_trunk')
	table.insert(dig_ups, 'moretrees:rubber_tree_trunk')
	table.insert(dig_ups, 'moretrees:rubber_tree_trunk_empty')
	table.insert(dig_ups, 'moretrees:sequoia_trunk')
	table.insert(dig_ups, 'moretrees:spruce_trunk')
	table.insert(dig_ups, 'moretrees:willow_trunk')
end

if fishing then
	table.insert(dig_ups, 'fishing:seaweed')
end

for _,item in ipairs(dig_ups) do
	minetest.override_item(item, {
		after_dig_node = function(pos, node, meta, digger)
			default.dig_up(pos, node, digger)
		end
	})
end
