leaves = {
	'default:acacia_leaves',
	'default:aspen_leaves',
	'default:jungleleaves',
	'default:leaves',
}

if moretrees then
	table.insert(leaves, 'moretrees:apple_tree_leaves')
	table.insert(leaves, 'moretrees:beech_leaves')
	table.insert(leaves, 'moretrees:birch_leaves')
	table.insert(leaves, 'moretrees:fir_leaves')
	table.insert(leaves, 'moretrees:fir_leaves_bright')
	table.insert(leaves, 'moretrees:jungletree_leaves_red')
	table.insert(leaves, 'moretrees:jungletree_leaves_yellow')
	table.insert(leaves, 'moretrees:oak_leaves')
	table.insert(leaves, 'moretrees:palm_leaves')
	table.insert(leaves, 'moretrees:rubber_tree_leaves')
	table.insert(leaves, 'moretrees:sequoia_leaves')
	table.insert(leaves, 'moretrees:spruce_leaves')
	table.insert(leaves, 'moretrees:willow_leaves')
end

if minetest.get_modpath('snow') then
	table.insert(leaves, 'snow:leaves')
end

for _,item in ipairs(leaves) do
	local item_def = minetest.registered_items[item]
	local item_groups = item_def.groups
	item_groups['leafdecay_drop'] = 1
	minetest.override_item(item, {
		groups = item_groups
	})
end
