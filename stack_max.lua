big_stacks = {
	'default:cobble',
	'default:dirt',
	'default:paper',
	'default:acacia_leaves',
	'default:aspen_leaves',
	'default:jungleleaves',
	'default:leaves',
}

if minetest.get_modpath('farming_plus') then
	table.insert(big_stacks, 'farming:weed')
end

if moretrees then
	table.insert(big_stacks, 'moretrees:apple_tree_leaves')
	table.insert(big_stacks, 'moretrees:beech_leaves')
	table.insert(big_stacks, 'moretrees:birch_leaves')
	table.insert(big_stacks, 'moretrees:fir_leaves')
	table.insert(big_stacks, 'moretrees:fir_leaves_bright')
	table.insert(big_stacks, 'moretrees:jungletree_leaves_red')
	table.insert(big_stacks, 'moretrees:jungletree_leaves_yellow')
	table.insert(big_stacks, 'moretrees:oak_leaves')
	table.insert(big_stacks, 'moretrees:palm_leaves')
	table.insert(big_stacks, 'moretrees:rubber_tree_leaves')
	table.insert(big_stacks, 'moretrees:sequoia_leaves')
	table.insert(big_stacks, 'moretrees:spruce_leaves')
	table.insert(big_stacks, 'moretrees:willow_leaves')
end

if minetest.get_modpath('snow') then
	table.insert(big_stacks, 'snow:leaves')
end

for _,item in ipairs(big_stacks) do
	minetest.override_item(item, {
		stack_max = 495,
	})
end
