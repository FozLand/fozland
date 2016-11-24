-- Bookmarks Mod
-- 


local function round(number)
	-- Round numbers to the nearest integer. Numbers exactly between
	-- two integers (ending in .5) are rounded away from zero.
	if number >= 0.5 then
		return math.floor(number + 0.5)
	else
		return math.ceil(number - 0.5)
	end
end

local write_gofile = function() 
	local output = ''  --	WRITE CHANGES TO FILE
	for name, coords in pairs(GONETWORK) do 	output = output..name..':'..round(coords.x)..','..round(coords.y)..','..round(coords.z)..';'	end
	local f = io.open(minetest.get_worldpath()..'/bookmarks.txt', 'w')
    f:write(output)
    io.close(f)
end

GONETWORK = {}
local gonfile = io.open(minetest.get_worldpath()..'/bookmarks.txt', 'r')  
if gonfile then
	local contents = gonfile:read()
	io.close(gonfile)
	if contents ~= nil then 
		local entries = contents:split(';') 
		for i,entry in pairs(entries) do
			local goname, coords = unpack(entry:split(':'))
			local p = {}
			p.x, p.y, p.z = string.match(coords, '^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$')
			if p.x and p.y and p.z then
				GONETWORK[goname] = {x = round(tonumber(p.x)),y= round(tonumber(p.y)),z = round(tonumber(p.z))}
			end
		end
	end
end
minetest.register_chatcommand('setgo', {
	params = '<name>',
	description = 'set /go destination',
	privs = {teleport = true},
	func = function(name, param)
		local target = minetest.env:get_player_by_name(name)
		if target then
			GONETWORK[param] = target:getpos()
			write_gofile()
			minetest.chat_send_player(name, '/go '..param..' set')
			return
		end
	end,
})
minetest.register_chatcommand('go', {
	params = '<goname>',
	privs = {teleport = true},
	description = 'go to destination',
	func = function(name, param)
		if GONETWORK[param] == nil then
			 minetest.chat_send_player(name, 'No such destination, If you would like to create it type: /setgo '..param)
			 return
		end
		teleportee = minetest.env:get_player_by_name(name)
		teleportee:setpos(GONETWORK[param])
		minetest.chat_send_player(name, 'Teleported to: '..param)
	end,
})
minetest.register_chatcommand('delgo', {
	params = '<name>',
	description = 'delete /go destination',
	privs = {teleport = true},
	func = function(name, param)
		if GONETWORK[param] then 
			GONETWORK[param] = nil
			write_gofile()
			minetest.chat_send_player(name, param..' deleted from list.')
		end
	end,
})
minetest.register_chatcommand('listgo', {
	params = '<goname>',
	privs = {teleport = true},
	description = 'list all go destinations',
	func = function(name, param)
		for go, coords in pairs(GONETWORK) do minetest.chat_send_player(name, '/go '..go.. ' at '..round(coords.x)..','..round(coords.y)..','..round(coords.z)) end		
	end,
})
