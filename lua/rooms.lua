


lookCitys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "���ݳ�",	["changan"] = "������",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ���",	["city"] = "���ݳ�",		["dali"] = "�����",
	["daliwest"] = "�������",["dalisouth"] = "�������",["dalieast"] = "����Ƕ�",
	["wuliang"] = "����ɽ",	["dlhg"] = "����ʹ�",	["wangfu"] = "��������",	["gumu"] = "����ɽ",
	["yuxu"] = "�����",		["death"] = "ʮ�˲����",	["emei"] = "����ɽ",	["yideng"] = "��Դ��",
	["foshan"] = "��ɽ��",	["fuzhou"] = "���ݳ�",	["gb"] = "ؤ��",	["fairyland"] = "����ɽ",		
	["jqg"] = "�����",		["xuantie"] = "��������",	["hengshan"] = "��ɽ",	["hj"] = "�ؽ�",	
	["hmy"] = "��ľ��",		["pingding"] = "ƽ����",	["huanghe"] = "�ƺ�����",	["yyd"] = "����",
	["huashan"] = "��ɽ��",	["hz"] = "���ݳ�",		["jiaxing"] = "���˳�",	["kunlun"] = "������",
	["lanzhou"] = "���ݳ�",	["meizhuang"] = "÷ׯ",	["miaojiang"] = "�置",	["mingjiao"] = "����",
	["hdg"] = "������",		["hhd"] = "����",		["lsd"] = "���ߵ�",		["mr"] = "����Ľ��",
	["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",	["nanyang"] = "������",	["ningbo"] = "������",
	["putian"] = "��������",	["shaolin"] = "������",	["sld"] = "������",		["songshan"] = "��ɽ��",
	["suzhou"] = "���ݳ�",	["taishan"] = "̩ɽ",	["tanggu"] = "������",	["thd"] = "�һ���",
	["niujia"] = "ţ�Ҵ�",	["guiyun"] = "����ׯ",	["tianshan"] = "��ɽ",	["tiezhang"] = "���ư�",
	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",	["wudang"] = "�䵱��",
	["houshan"] = "�䵱��ɽ",	["wuguan"] = "���",		["xiakedao"] = "���͵�",	["xiangyang"] = "������",	
	["lzz"] = "������",		["xingxiu"] = "������",	["yili"] = "�����",		["xueshan"] = "������",
	["caoyuan"] = "���ԭ",	["zhiye"] = "����",		["group"] = "��ԭ",		
	["entry"] = "",
}

citys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "����",	["changan"] = "����",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ�",	["city"] = "����",		["dali"] = "�����",
	["death"] = "ʮ�˲����",	["emei"] = "����ɽ",		["fairyland"] = "�����ɾ�",["foshan"] = "��ɽ", 
	["fuzhou"] = "����",		["gb"] = "ؤ��ֶ�",	    ["gumu"] = "��Ĺ",		["hengshan"] = "��ɽ",
	["hj"] = "�ؽ�",			["hmy"] = "��ľ��",		["huanghe"] = "�ƺ�����",	["huashan"] = "��ɽ",
	["hz"] = "����",			["jiaxing"] = "����",	["kunlun"] = "����ɽ",
	["lanzhou"] = "����",	["miaojiang"] = "�置",	["mingjiao"] = "����",	["murong"] = "Ľ��",
	["mr"] = "s",		["nanyang"] = "����",	["ningbo"] = "����",		["putian"] = "��������",
	["meizhuang"] = "÷ׯ",	["shaolin"] = "��ɽ����",	["sld"] = "������",		["songshan"] = "��ɽ",
	["suzhou"] = "����",		["taishan"] = "̩ɽ",	["tanggu"] = "����",		["thd"] = "�һ���",
	["tiezhang"] = "����ɽ",	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",
	["wudang"] = "�䵱ɽ",	["wuguan"] = "���",		["xiangyang"] = "����",	["xingxiu"] = "���޺�",
	["xueshan"] = "��ѩɽ",	["yangzhou"] = "����",	["guiyun"] = "����ׯ",	["hdg"] = "������",
	["jqg"] = "�����",		["bhd"] = "����",		["lsd"] = "���ߵ�",		["pingding"] = "ƽ����",
	["caoyuan"] = "���ԭ",	["niujia"] = "ţ�Ҵ�",	["wuliang"] = "����ɽ",	["wangfu"] = "��������",
	["yideng"] = "��Դ��",	["yili"] = "����",		["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",
	["shijian"] = "�Խ�ɽׯ",	["zhiye"] = "��ԭ����",	
}
otherCitys = {
	["gumu"] = "��Ĺ��", "�ɶ�����", "����Ǳ�", "˿��֮·", "�ؽ���ԭ",
}

function getFirstWords()
	require("firstwords")
	return FirstWords
end

function getFirstWord(word)
	if not word then
		return ""
	end
	local fws = {}
	for w in string.gmatch(word,"..") do
		table.insert(fws,getFirstWords()[w])
	end
	return table.concat(fws)
end

function countTab(tab)
	local count = 0
	for _ in pairs(tab) do
		count = count + 1
	end
	return count
end

function isCity(p_city)
        local l_result=false
	for k,v in pairs(citys) do
	    if v==p_city then
	       l_result=true
	    end
	end
        for k,v in pairs(lookCitys) do
	    if v==p_city then
	       l_result=true
	    end
	end
	for k,v in pairs(otherCitys) do
	    if v==p_city then
	       l_result=true
	    end
	end
	return l_result
end

function getAddr(addr)
	local name, city = getAddr0(addr, citys)
	if name then
		return name, city
	else
		name, city = getAddr0(addr, lookCitys)
		if name then
			return name, city
		else
			return getAddr0(addr, otherCitys)
		end
	end
end

function getAddr0(addr, citys)
	for k,v in pairs(citys) do
		local _,_,city,name = string.find(addr,"^(" .. v .. ")(.+)$")
		if city and countTab(getRooms(name,city)) > 0 then
			return name, city
		end
	end
	if tmp.goto then
	   for _,v in pairs(map.rooms) do
	      if addr and type(v)=="table" and v.name and addr==v.name then
	         return v.name,getLookCity(v.id)
	      end
	   end
	end
	return false
end

function getLookCity(path)
	if path == "meizhuang/plum_maze" then
		return nil
	end
	local place = getPlace(path)
	for k,v in pairs(place) do
		if (v == "zhiye" or v == "entry") and not tmp.goto then
			return nil
		end
		if v ~= "entry" then
		   city = lookCitys[v]
		end
		if city then
			return city
		end
	end
end

function getPlace(path)
	local place = {}
	local i = 1
	while true do
		local n = string.find(path, "/", i)
		if n then
			table.insert(place,1,string.sub(path, i, n - 1))
			i = n + 1
		else
			break
		end
	end
	return place
end

function getCityRooms(city)
    local rooms = {}
	local isCityFw = city and string.find(city,"^%l+$")
	for id,room in pairs(map.rooms) do
	    local lookCity = isCityFw and getFirstWord(getLookCity(room.id)) or getLookCity(room.id)
		local taskCity = isCityFw and getFirstWord(getCity(room.id)) or getCity(room.id)
		if (city == lookCity) or (city == taskCity) or (room.outdoor and room.outdoor == city) then
		   table.insert(rooms,id)
	    end
	end
	return rooms
end 

function getRooms(name, city, type)
	local type = type or "all"
	local isLookCity = type == "all" or type == "look"
	local isTaskCity = type == "all" or type == "task"
	if string.find(name,"/") then
		return {name}
	end
	local isNameFw = string.find(name,"^%l+$")
	local isCityFw = city and string.find(city,"^%l+$")
	local rooms = {}
	for id,room in pairs(map.rooms) do
		local roomName = isNameFw and getFirstWord(room.name) or room.name
		if roomName == name then
			if not city then
				table.insert(rooms,id)
			else
				local lookCity = isCityFw and getFirstWord(getLookCity(room.id)) or getLookCity(room.id)
				local taskCity = isCityFw and getFirstWord(getCity(room.id)) or getCity(room.id)
				if (isLookCity and city == lookCity) or (isTaskCity and city == taskCity) or (room.outdoor and room.outdoor == city) then
					table.insert(rooms,id)
				end
			end
		end
	end
	--if countTab(rooms) == 0 and score.id=="joshua" then
	--	Note("û�ҵ����䣺name = " .. name .. " , city = " .. tostring(city) .. " , type = " .. type)
	--end
	return rooms
end

function getCity(path)
	local place = getPlace(path)
	for k,v in pairs(place) do
		city = citys[v]
		if city then
			return city
		end
	end
	return ""
end

function getAroundRooms(name, city, length, type)
	local rooms = getRooms(name, city, type)
	local allRooms = {}
	for _, id in pairs(rooms) do
		local aroundRooms = map:getAroundRooms(id, length)
		for _, aroundRoom in pairs(aroundRooms) do
			if not map.rooms[aroundRoom].nofind then
				allRooms[aroundRoom] = true
			end
		end
	end
	return allRooms
end

function getFindPath(from,name,city,length)
        local rooms=getAroundRooms(name, city, length)
	local f_path=""
	local l_dest,l_p 
        local to={}

	for id in pairs(rooms) do
	    table.insert(to,id)
	end

        for i=1,countTab(to) do
	    l_dest,l_p=getNearRoom(from,to)
        
	    local path, length = map:getPath(from, l_dest)
	    if path then
	       from=l_dest
	       f_path=f_path .. path
	    end
	    table.remove(to,l_p)
	end

	f_path=del_string(f_path,"halt;")
	return f_path        
end

function getNearRoom(from,to)
    if type(from)=="table" then
	   from = from[1]
	end
    if countTab(to)==1 then
	   return to[1]
	end

    local parents,distances = map:lookPath(from)
	local length,p
	
	for k,v in pairs(to) do
	    if distances[v] and (length==nil or length>distances[v]) then
	       length=distances[v]
	       p=k
	    end
	end

	return to[p],p

end
-- SjRoom class

SjRoom = {ways = {},lengths = {},nolooks = {}}

function SjRoom:new(room)
	local room = room or {}
	setmetatable(room,self)
	self.__index = self
	return room
end

function SjRoom:length(route)
	local length = self.lengths[route] or 1
	local isStr = length and type(length) == "string" or false
	if isStr then
		return loadstring(length)()
	else
		return length
	end
end

-- SjMap class

SjMap = {count = 0}

function SjMap:new(map)
	local map = map or {rooms={}}
	setmetatable(map,self)
	self.__index = self
	return map
end

function SjMap:addRoom(room)
	self.rooms[room.id]=SjRoom:new(room)
	self.count = self.count + 1
end

function SjMap:room(id)
	return self.rooms[id]
end

function SjMap:getMinRoom(pending)
	local processRoomId
	local minDistance
	for roomId, length in pairs(pending) do
		if minDistance == nil or length < minDistance then
			minDistance = length
			processRoomId = roomId
		end
	end
	if processRoomId then
		pending[processRoomId] = nil
	end
	return processRoomId
end

function SjMap:process(red,distances,pending,parents,from)
	red[from] = true
	local fromRoom = self:room(from)
	for route, to in pairs(fromRoom.ways) do
		local routeLength = fromRoom:length(route)
		if routeLength then
			local length = distances[from] + routeLength
			local distance = distances[to]
			if distance == nil or length < distance then
				distances[to] = length
				if red[to] == nil then
					pending[to] = length
				end
				parents[to] = {parent = from, route = route}
			end
		end
	end
end

function SjMap:init(red,distances,pending,parents,from)
	red[from] = true
	distances[from] = 0
	parents[from] = {parent = from, route = ""}
	self:process(red,distances,pending,parents,from)
end

Cache = {}
local DEFAUTL_CACHE_TIME = 10

function Cache:new(size, time)
	time = time or DEFAUTL_CACHE_TIME
	local cache = {size = size, time = time}
	setmetatable(cache, self)
	self.__index = self
	return cache
end

function Cache:get(key)
	local value
	for k, v in pairs(self) do
		if type(k) == "number" and v.key == key and os.time() - v.time <= self.time then
			--log.debug("Cache ���У�key = " .. v.key)
			value = v.value
			table.remove(self, k)
			table.insert(self, 1, v)
			break
		end
	end
	if not value then
		--log.debug("Cache δ���У�key = " .. key)
	end
	return value
end

function Cache:add(key, value)
	local v = {}
	v.key = key
	v.value = value
	v.time = os.time()
	table.insert(self, 1, v)
	if table.getn(self) > self.size then
		table.remove(self, self.size + 1)
	end
end

local cache = Cache:new(2)

function SjMap:lookPath(from)
	local value = cache:get(from)
	if not value then
		local red = {}
		local pending = {}
		distances = {}
		parents = {}
		self:init(red,distances,pending,parents,from)
		for i = 0, self.count do
			local processRoomId = self:getMinRoom(pending)
			if processRoomId then
				self:process(red,distances,pending,parents,processRoomId)
			else
				break
			end
		end
		-- cache last parents and distances
		parentsCache = {}
		distancesCache = {}
		value = {}
		value.parents = parents
		value.distances = distances
		cache:add(from, value)
	end
	return value.parents, value.distances
end

function SjMap:getAroundRooms(path, length)
	if length == 0 then
		return {path}
	end
	local parents, distances = self:lookPath(path)
	local rooms = {}
	for k, v in pairs(distances) do
		if string.find(path,'mr/') and string.find(k,'mr/') and v <= length then
			table.insert(rooms, k)
		end
		if string.find(path,'yanziwu/') and string.find(k,'yanziwu/') and v <= length then
			table.insert(rooms, k)
		end
		if string.find(path,'mtl/') and string.find(k,'mtl/') and v <= length then
			table.insert(rooms, k)
		end
		if not string.find(path,'mr/') and not string.find(path,'yanziwu/') and not string.find(path,'mtl/') and v <= length then
			table.insert(rooms, k)
		end
	end
	return rooms
end

function SjMap:getPath(from, to, try)
	--TraceOut("SjMap:getPath�� from = " .. from .. " ��to = " .. to)
	local parents,distances = self:lookPath(from)
	local length = distances[to]
	local path = {""}
	local room = to
	repeat
		local parentInfo = parents[room]
		local fromRoom = map.rooms[from]
		local toRoom = map.rooms[to]
		if parentInfo == nil then
			if not try then
				--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���޷����")
			end
			return false
		end
		local parent = parentInfo.parent
		local route = parentInfo.route
		local parentRoom = map.rooms[parent]
		local precmds = parentRoom.precmds
		local precmd = precmds and precmds[route]
		local postcmds = parentRoom.postcmds
		local postcmd = postcmds and postcmds[route]
		local blocks = parentRoom.blocks
		local block = blocks and blocks[route]
		local lengths = parentRoom.lengths
		local len = lengths and lengths[route]
		if postcmd then
			table.insert(path,1,";")
			table.insert(path,1,postcmd)
		end
		table.insert(path,1,";")
		table.insert(path,1,route)
		if precmd then
			table.insert(path,1,";")
			table.insert(path,1,precmd)
		end
		if block then
			for _, b in pairs(block) do
				local sameParty = b.party and b.party == score.party
				local cond = b.cond and b.cond()
				if not sameParty and not cond then
					if hp.exp < b.exp then
						return false
					else
						table.insert(path,1,";")
						table.insert(path,1,"#wipe " .. b.id)
					end
				end
			end
		end
		if len then
		   local isStr = len and type(len) == "string" or false
	           if isStr then
		      if not loadstring(len)() then return false end
	           end
		end
		room = parent
	until room == from
	table.insert(path,1,";")
	table.insert(path,1,"halt")
	local p = table.concat(path)
	--print("length="..length)
	return p, length
end

function SjMap:getPathWd(from, to, try)
	TraceOut("SjMap:getPath�� from = " .. from .. " ��to = " .. to)
	local parents,distances = self:lookPath(from)
	local length = distances[to]
	local path = {""}
	local room = to
	repeat
		local parentInfo = parents[room]
		local fromRoom = map.rooms[from]
		local toRoom = map.rooms[to]
		if parentInfo == nil then
			if not try then
				--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���޷����")
			end
			return false
		end
		local parent = parentInfo.parent
		local route = parentInfo.route
		local parentRoom = map.rooms[parent]
		local precmds = parentRoom.precmds
		local precmd = precmds and precmds[route]
		local postcmds = parentRoom.postcmds
		local postcmd = postcmds and postcmds[route]
		local blocks = parentRoom.blocks
		local block = blocks and blocks[route]
		if postcmd then
			table.insert(path,1,";")
			table.insert(path,1,postcmd)
		end
		table.insert(path,1,";")
		table.insert(path,1,route)
		if precmd then
			table.insert(path,1,";")
			table.insert(path,1,precmd)
		end
		if block then
			for _, b in pairs(block) do
				--local sameParty = b.party and b.party == getParty()
				--local cond = b.cond and b.cond()
				--if not sameParty and not cond then
					--if hp.exp < b.exp then
					if hp.exp + 1000000 < b.exp then
						if not try then
							--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���У�" .. b.id .. "����·��")
						end
						return false
					else
						table.insert(path,1,";")
						table.insert(path,1,"#wipe " .. b.id)
					end
				--end
			end
		end
		room = parent
	until room == from
	table.insert(path,1,";")
	table.insert(path,1,"halt")
	--table.insert(path,1,";")
	--table.insert(path,1,"set brief")
	local p = table.concat(path)
	return p, length
end

-- Init Rooms
map = SjMap:new()

function Room(room)
	local r = SjRoom:new(room)
	local group = string.find(r.id, "group/")
	if group == 1 then
		r.nolook = true
	end
	map:addRoom(r)
end

Room {
	id = "baituo/btshan",
	name = "����ɽ",
	ways = {
		["westup"] = "baituo/shanmen",
		["east"] = "hj/gebin",
	},
}
Room {
	id = "baituo/chucang",
	name = "������",
	ways = {
		["east"] = "baituo/kongdi",
	},
}
Room {
	id = "baituo/fengxi",
	name = "��϶",
	ways = {
		["north"] = "baituo/fengxi1",
		["out"] = "baituo/yuanzi2",
	},
}
Room {
	id = "baituo/fengxi1",
	name = "��϶",
	ways = {
		["south"] = "baituo/fengxi",
		["west"] = "baituo/fengxi2",
		["out"] = "baituo/yuanzi3",
	},
}
Room {
	id = "baituo/fengxi2",
	name = "��϶",
	ways = {
		["east"] = "baituo/fengxi1",
		["out"] = "baituo/yuanzi4",
	},
}
Room {
	id = "baituo/kongdi",
	name = "�յ�",
	ways = {
		["northup"] = "baituo/tangwu",
		["southdown"] = "baituo/shanmen",
		["west"] = "baituo/chucang",
	},
}
Room {
	id = "baituo/midao",
	name = "�ص�",
	ways = {
		["west"] = "baituo/midao1",
	},
}
Room {
	id = "baituo/midao1",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao2",
		["east"] = "baituo/midao",
	},
}
Room {
	id = "baituo/midao2",
	name = "�ص�",
	ways = {
		["eastdown"] = "baituo/midao5",
		["westdown"] = "baituo/midao3",
		["eastup"] = "baituo/midao1",
	},
}
Room {
	id = "baituo/midao3",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao3",
		["eastup"] = "baituo/midao3",
		["south"] = "baituo/midao4",
		["north"] = "baituo/midao4",
	},
}
Room {
	id = "baituo/midao4",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao4",
		["eastup"] = "baituo/midao4",
		["south"] = "baituo/midao3",
		["north"] = "baituo/midao3",
	},
}
Room {
	id = "baituo/midao5",
	name = "�ص�",
	ways = {
		["eastdown"] = "baituo/midao6",
		["westup"] = "baituo/midao2",
	},
}
Room {
	id = "baituo/midao6",
	name = "�ص�",
	ways = {
		["westup"] = "baituo/midao5",
		["south"] = "baituo/midao8",
		["north"] = "baituo/midao8",
		["east"] = "baituo/midao7",
		["west"] = "baituo/midao6",
	},
}
Room {
	id = "baituo/midao7",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midaoout",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao7",
		["west"] = "baituo/midao6",
	},
}
Room {
	id = "baituo/midao8",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midao8",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao6",
		["west"] = "baituo/midao7",
	},
}
Room {
	id = "baituo/midaoout",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midaoout",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao7",
		["west"] = "baituo/midaoout",
	},
}
Room {
	id = "baituo/shanmen",
	name = "����ɽׯɽ��",
	ways = {
		["northup"] = "baituo/kongdi",
		["eastdown"] = "baituo/btshan",
	},
}
Room {
	id = "baituo/shetan",
	name = "��̶",
}
Room {
	id = "baituo/shuifang",
	name = "˯��",
	no_fight = true,
	ways = {
		["west"] = "baituo/tangwu",
	},
}
Room {
	id = "baituo/tangwu",
	name = "����",
	ways = {
		["north"] = "baituo/tuitang",
		["southdown"] = "baituo/kongdi",
		["west"] = "baituo/yaofang",
	},
}
Room {
	id = "baituo/tianjing",
	name = "�쾮",
	ways = {
		["out"] = "baituo/midao4",
	},
}
Room {
	id = "baituo/tuitang",
	name = "����",
	ways = {
		["south"] = "baituo/tangwu",
		["north"] = "baituo/yuanzi",
		["east"] = "baituo/shuifang",
	},
}
Room {
	id = "baituo/yaofang",
	name = "ҩ��",
	ways = {
		["east"] = "baituo/tangwu",
	},
}
Room {
	id = "baituo/yuanzi",
	name = "��԰",
	ways = {
		["south"] = "baituo/tuitang",
	},
}
Room {
	id = "baituo/yuanzi1",
	name = "Ժ��",
	ways = {
		["northwest"] = "baituo/yuanzi2",
		["jumpdown"] = "baituo/shetan",
	},
}
Room {
	id = "baituo/yuanzi2",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi1",
		["northwest"] = "baituo/yuanzi4",
		["northeast"] = "baituo/yuanzi3",
	},
}
Room {
	id = "baituo/yuanzi3",
	name = "Ժ��",
	ways = {
		["southwest"] = "baituo/yuanzi2",
		["northwest"] = "baituo/yuanzi5",
		["west"] = "baituo/yuanzi4",
	},
}
Room {
	id = "baituo/yuanzi4",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi2",
		["east"] = "baituo/yuanzi3",
		["northeast"] = "baituo/yuanzi5",
	},
}
Room {
	id = "baituo/yuanzi5",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi3",
		["southwest"] = "baituo/yuanzi4",
	},
}
Room {
	id = "beijing/jiuguan1",
	name = "С�ƹ�",
}
Room {
	id = "beijing/road1",
	name = "������",
	ways = {
		["south"] = "beijing/jiuguan1",
	},
}
Room {
	id = "cangzhou/bank",
	name = "������",
	ways = {
		["west"] = "cangzhou/beijie1",
	},
	objs = {
          ["������"] = "jiang tiaohou",
           },
}
Room {
	id = "cangzhou/beijie1",
	name = "����",
	ways = {
		["south"] = "cangzhou/beijie2",
		["north"] = "cangzhou/beimen",
		["east"] = "cangzhou/bank",
		["west"] = "cangzhou/mihang",
	},
}
Room {
	id = "cangzhou/beijie2",
	name = "����",
	ways = {
		["south"] = "cangzhou/beijie3",
		["east"] = "cangzhou/gongdi",
		["north"] = "cangzhou/beijie1",
		["west"] = "cangzhou/fuya",
	},
}
Room {
	id = "cangzhou/beijie3",
	name = "����",
	ways = {
		["southeast"] = "cangzhou/dongjie1",
		["southwest"] = "cangzhou/xijie1",
		["south"] = "cangzhou/kezhan",
		["east"] = "cangzhou/feiyuan",
		["north"] = "cangzhou/beijie2",
		["west"] = "cangzhou/mingju",
	},
}
Room {
	id = "cangzhou/beimen",
	name = "����",
	ways = {
		["south"] = "cangzhou/beijie1",
		["north"] = "cangzhou/dyd1",
	},
}
Room {
	id = "cangzhou/dyd1",
	name = "�����",
	ways = {
		["south"] = "cangzhou/beimen",
		["north"] = "cangzhou/dyd2",
	},
}
Room {
	id = "cangzhou/dyd2",
	name = "�����",
	ways = {
		["northwest"] = "cangzhou/dyd3",
		["south"] = "cangzhou/dyd1",
	},
}
Room {
	id = "cangzhou/dyd3",
	name = "�����",
	ways = {
		["southeast"] = "cangzhou/dyd2",
	},
}
Room {
	id = "cangzhou/changku",
	name = "�ֿ�",
	ways = {
		["north"] = "cangzhou/mihang",
	},
}
Room {
	id = "cangzhou/dangpu",
	name = "���ݵ���",
	no_fight = true,
	ways = {
		["north"] = "cangzhou/xijie1",
	},
	objs = {
          ["���ϰ�"] = "huang laoban",
           },
}
Room {
	id = "cangzhou/dongjie1",
	name = "����",
	ways = {
		["southwest"] = "cangzhou/nanjie1",
		["northwest"] = "cangzhou/beijie3",
		["east"] = "cangzhou/dongmen",
	},
}
Room {
	id = "cangzhou/dongmen",
	name = "����",
	ways = {
		["east"] = "cangzhou/eroad1",
		["west"] = "cangzhou/dongjie1",
	},
}
Room {
	id = "cangzhou/eroad1",
	name = "�����",
	ways = {
		["east"] = "cangzhou/eroad2",
		["west"] = "cangzhou/dongmen",
	},
	room_relative="����----�����----����������",
}
Room {
	id = "cangzhou/eroad2",
	name = "�����",
	ways = {
		["northeast"] = "group/entry/czeroad3",
		["west"] = "cangzhou/eroad1",
	},
	room_relative="������J�����----����������",
}
Room {
	id = "cangzhou/eroad4",
	name = "�����",
	ways = {
		["southwest"] = "group/entry/czeroad3",
		["northeast"] = "tanggu/wroad4",
	},
	objs = {
          ["�������"] = "jiangbei dadao",
    },
	room_relative="������J������L����������",
}
Room {
	id = "cangzhou/feiyuan",
	name = "��԰",
	ways = {
		["enter"] = "cangzhou/tingtang",
		["west"] = "cangzhou/beijie3",
	},
	objs = {
          ["������"] = "fang duozhu",
          ["����"] = "jian zhanglao",
           },
}
Room {
	id = "cangzhou/fuya",
	name = "���ݸ���",
	ways = {
		["east"] = "cangzhou/beijie2",
		["west"] = "cangzhou/zhenting",
	},
	blocks = {
		["west"] = {
			{id = "ya yi", exp = 17500},
		},
	},
}
Room {
	id = "cangzhou/gongdi",
	name = "����",
	ways = {
		["west"] = "cangzhou/beijie2",
	},
}
Room {
	id = "cangzhou/huadian",
	name = "����",
	ways = {
		["west"] = "cangzhou/nanjie1",
	},
}
Room {
	id = "cangzhou/kezhan",
	name = "���ջ",
	ways = {
		["south"] = "cangzhou/nanjie1",
		["north"] = "cangzhou/beijie3",
		-- ["up"] = "cangzhou/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	objs = {
          ["������"] = "miao ruolan",
           },
}
Room {
	id = "cangzhou/kezhan2",
	name = "��ջ��¥",
	no_fight = true,
	ways = {
		["enter"] = "cangzhou/sleeproom",
		["down"] = "cangzhou/kezhan",
	},
}
Room {
	id = "cangzhou/mihang",
	name = "����",
	ways = {
		["south"] = "cangzhou/changku",
		["east"] = "cangzhou/beijie1",
	},
	objs = {
          ["������"] = "wang dami",
           },
}
Room {
	id = "cangzhou/mingju",
	name = "���",
	ways = {
		["east"] = "cangzhou/beijie3",
	},
}
Room {
	id = "cangzhou/nanjie1",
	name = "�Ͻ�",
	ways = {
		["south"] = "cangzhou/nanmen",
		["northwest"] = "cangzhou/xijie1",
		["north"] = "cangzhou/kezhan",
		["east"] = "cangzhou/huadian",
		["northeast"] = "cangzhou/dongjie1",
		["west"] = "cangzhou/xiyuanzi",
	},
}
Room {
	id = "cangzhou/nanmen",
	name = "����",
	ways = {
		["south"] = "cangzhou/sroad1",
		["north"] = "cangzhou/nanjie1",
	},
}
Room {
	id = "cangzhou/sancakou",
	name = "����·",
	ways = {
		["southeast"] = "cangzhou/wroad4",
		["west"] = "hmy/pingding/road9",
	},
}
Room {
	id = "cangzhou/sleeproom",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "cangzhou/kezhan2",
	},
}
Room {
	id = "cangzhou/sroad1",
	name = "�ٵ�",
	ways = {
		["south"] = "cangzhou/sroad2",
		["north"] = "cangzhou/nanmen",
	},
	room_relative="���ţ��ٵ����ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad2",
	name = "�ٵ�",
	ways = {
		["southeast"] = "cangzhou/sroad3",
		["north"] = "cangzhou/sroad1",
	},
	room_relative="�ٵ����ٵ��K�ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad3",
	name = "�ٵ�",
	ways = {
		["southeast"] = "cangzhou/sroad4",
		["northwest"] = "cangzhou/sroad2",
	},
	room_relative="�ٵ��I�ٵ��K�ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad4",
	name = "�ٵ�",
	ways = {
		["south"] = "huanghe/road3",
		["northwest"] = "cangzhou/sroad3",
	},
	room_relative="�ٵ��I�ٵ�����ɿڹٵ�",
}
Room {
	id = "cangzhou/tingtang",
	name = "����",
	no_fight = true,
	ways = {
		["out"] = "cangzhou/feiyuan",
	},
}
Room {
	id = "cangzhou/wroad1",
	name = "���",
	ways = {
		["east"] = "cangzhou/ximen",
		["west"] = "group/entry/czwroad2",
	},
}
Room {
	id = "cangzhou/wroad3",
	name = "���",
	ways = {
		["northeast"] = "group/entry/czwroad2",
		["west"] = "cangzhou/wroad4",
	},
}
Room {
	id = "cangzhou/wroad4",
	name = "���",
	ways = {
		["northwest"] = "cangzhou/sancakou",
		["east"] = "cangzhou/wroad3",
	},
}
Room {
	id = "cangzhou/xijie1",
	name = "����",
	ways = {
		["southeast"] = "cangzhou/nanjie1",
		["south"] = "cangzhou/dangpu",
		["north"] = "cangzhou/yizhan",
		["northeast"] = "cangzhou/beijie3",
		["west"] = "cangzhou/ximen",
	},
}
Room {
	id = "cangzhou/ximen",
	name = "����",
	ways = {
		["east"] = "cangzhou/xijie1",
		["west"] = "cangzhou/wroad1",
	},
}
Room {
	id = "cangzhou/xiyuanzi",
	name = "Ϸ԰",
	ways = {
		["east"] = "cangzhou/nanjie1",
	},
}
Room {
	id = "cangzhou/yizhan",
	name = "��վ",
	ways = {
		["south"] = "cangzhou/xijie1",
	},
}
Room {
	id = "cangzhou/zhenting",
	name = "��������",
	ways = {
		["east"] = "cangzhou/fuya",
	},
}
Room {
	id = "changan/baishulin1",
	name = "������",
	ways = {
		["southeast"] = "changan/baishulin1",
		["southwest"] = "changan/baishulin1",
		["north"] = "changan/baishulin1",
		["east"] = "changan/baishulin1",
		["west"] = "changan/baishulin1",
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = "changan/xiaoyanta1",
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/beilin",
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = "changan/yongkeng2",
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = "changan/changjie2",
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = "changan/baishulin2",
	},
	nolooks = {
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = true,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = true,
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = true,
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = true,
	},
	lengths = {
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = 30,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = 30,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = 30,
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = 30,
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = 30,
	},
}
Room {
	id = "changan/baishulin2",
	name = "������",
	ways = {
		["northwest"] = "changan/baishulin2",
		["east"] = "changan/baishulin2",
		["northeast"] = "changan/baishulin2",
		["west"] = "changan/baishulin2",
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = "changan/baishulin1",
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = "changan/shihuangling",
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = "changan/wenquan",
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/jiashan",
	},
	nolooks = {
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = true,
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = true,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = true,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
	},
	lengths = {
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = 30,
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = 30,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = 30,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = 30,
	},
}
Room {
	id = "changan/beilin",
	name = "����",
	ways = {
		["east"] = "changan/baishulin1",
	},
}
Room {
	id = "changan/biaoju",
	name = "�����ھ�",
	ways = {
		["south"] = "changan/biaoju2",
		["north"] = "changan/westjie3",
	},
}
Room {
	id = "changan/biaoju2",
	name = "�ھִ���",
	ways = {
		["north"] = "changan/biaoju",
	},
	objs = {
          ["�ܻ���"] = "zhou huwei",
     },
}
Room {
	id = "changan/bingqipu",
	name = "������",
	ways = {
		["west"] = "changan/southjie2",
	},
}
Room {
	id = "changan/bingying",
	name = "��Ӫ����",
	ways = {
		["south"] = "changan/bingying2",
		["north"] = "changan/eastjie4",
	},
	blocks = {
		["south"] = {
			{id = "guan bing", exp = 10000},
		},
	},
}
Room {
	id = "changan/bingying2",
	name = "��Ӫ",
	ways = {
		["north"] = "changan/bingying",
	},
}
Room {
	id = "changan/chaguan",
	name = "���",
	ways = {
		["south"] = "changan/eastjie2",
	},
}
Room {
	id = "changan/changjie1",
	name = "����",
	ways = {
		["east"] = "changan/changjie1",
		["west"] = "changan/changjie1",
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/jiashan",
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = "changan/dayanta1",
	},
	nolooks = {
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = true,
	},
	lengths = {
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = 12,
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = 24,
	},
}
Room {
	id = "changan/changjie2",
	name = "����",
	ways = {
		["southeast"] = "changan/ciensi",
		["east"] = "changan/baishulin2",
		["northeast"] = "changan/baishulin1",
		["west"] = "changan/changjie1",
	},
}
Room {
	id = "changan/chm",
	name = "������",
	ways = {
		["north"] = "changan/westjie4",
	},
}
Room {
	id = "changan/ciensi",
	name = "�ȶ���",
	ways = {
		["northwest"] = "changan/changjie2",
		["east"] = "changan/dayanta1",
	},
}
Room {
	id = "changan/dadian",
	name = "���",
	ways = {
		["south"] = "changan/qingzhensi",
		["north"] = "changan/houdian",
	},
}
Room {
	id = "changan/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "changan/southjie1",
	},
}
Room {
	id = "changan/dayanta1",
	name = "������",
	ways = {
		["west"] = "changan/ciensi",
		["up"] = "changan/dayanta2",
	},
}
Room {
	id = "changan/dayanta2",
	name = "����������",
	ways = {
		["down"] = "changan/dayanta1",
		["up"] = "changan/dayanta3",
	},
}
Room {
	id = "changan/dayanta3",
	name = "����������",
	ways = {
		["down"] = "changan/dayanta2",
		["up"] = "changan/dayanta4",
	},
}
Room {
	id = "changan/dayanta4",
	name = "�������Ĳ�",
	ways = {
		["down"] = "changan/dayanta3",
		["up"] = "changan/dayanta5",
	},
}
Room {
	id = "changan/dayanta5",
	name = "���������",
	ways = {
		["down"] = "changan/dayanta4",
		["up"] = "changan/dayanta6",
	},
}
Room {
	id = "changan/dayanta6",
	name = "����������",
	ways = {
		["down"] = "changan/dayanta5",
		["up"] = "changan/dayanta7",
	},
}
Room {
	id = "changan/dayanta7",
	name = "�������߲�",
	ways = {
		["down"] = "changan/dayanta6",
	},
}
Room {
	id = "changan/dewentang",
	name = "������",
	ways = {
		["east"] = "changan/southjie2",
	},
	objs = {
          ["���ĵ�"] = "tang wende",
     },
}
Room {
	id = "changan/duchang",
	name = "�ĳ�",
	ways = {
		["north"] = "changan/eastjie1",
	},
}
Room {
	id = "changan/eastchl",
	name = "���ų�¥",
	ways = {
		["south"] = "changan/eastjl2",
		["down"] = "changan/eastmen",
		["north"] = "changan/eastjl1",
	},
	room_relative="��¥�����ų�¥����¥���ų�¥",
}
Room {
	id = "changan/eastchq1",
	name = "����ǽ",
	ways = {
		["south"] = "changan/eastchq2",
		["north"] = "changan/lwtne",
	},
	room_relative="����̨������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/eastchq2",
	name = "����ǽ",
	ways = {
		["south"] = "changan/eastjl1",
		["north"] = "changan/eastchq1",
	},
	room_relative="����ǽ������ǽ����¥����ǽ",
}
Room {
	id = "changan/eastchq3",
	name = "����ǽ",
	ways = {
		["south"] = "changan/eastchq4",
		["north"] = "changan/eastjl2",
	},
	room_relative="��¥������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/eastchq4",
	name = "����ǽ",
	ways = {
		["south"] = "changan/lwtse",
		["north"] = "changan/eastchq3",
	},
	room_relative="����ǽ������ǽ������̨����ǽ",
}
Room {
	id = "changan/eastjie1",
	name = "�����",
	ways = {
		["south"] = "changan/duchang",
		["north"] = "changan/wanhonglou",
		["east"] = "changan/eastjie2",
		["west"] = "changan/zhonglou",
	},
	room_relative="���¥����¥----�����----����֣��ĳ������",
}
Room {
	id = "changan/eastjie2",
	name = "�����",
	ways = {
		["south"] = "changan/qingchi",
		["east"] = "changan/eastjie3",
		["north"] = "changan/chaguan",
		["west"] = "changan/eastjie1",
	},
	room_relative="��ݣ������----�����----����֣���ض����",
}
Room {
	id = "changan/eastjie3",
	name = "�����",
	ways = {
		["south"] = "changan/huadian",
		["north"] = "changan/shuiguodian",
		["east"] = "changan/eastjie4",
		["west"] = "changan/eastjie2",
	},
	room_relative="ˮ����������----�����----����֣����궫���",
}
Room {
	id = "changan/eastjie4",
	name = "�����",
	ways = {
		["south"] = "changan/bingying",
		["north"] = "changan/neijie7",
		["east"] = "changan/eastmen",
		["west"] = "changan/eastjie3",
	},
	room_relative="�ڽ֣������----�����----�����ţ���Ӫ���Ŷ����",
}
Room {
	id = "changan/eastjl1",
	name = "��¥",
	ways = {
		["south"] = "changan/eastchl",
		["north"] = "changan/eastchq2",
	},
	room_relative="����ǽ����¥�����ų�¥��¥",
}
Room {
	id = "changan/eastjl2",
	name = "��¥",
	ways = {
		["south"] = "changan/eastchq3",
		["north"] = "changan/eastchl",
	},
	room_relative="���ų�¥����¥������ǽ��¥",
}
Room {
	id = "changan/eastmen",
	name = "������",
	ways = {
		["east"] = "changan/eastroad1",
		["west"] = "changan/eastjie4",
		["up"] = "changan/eastchl",
	},
	blocks = {
		["up"] = {
			{id = "guan bing", exp = 10000},
			{id = "wu jiang", exp = 75000},
		},
	},
}
Room {
	id = "changan/eastroad1",
	name = "�ٵ�",
	ways = {
		["east"] = "changan/eastroad2",
		["west"] = "changan/eastmen",
	},
	room_relative="������-----�ٵ�-----�ٵ��ٵ�",
}

Room {
	id = "changan/eastroad2",
	name = "�ٵ�",
	ways = {
		["east"] = "group/entry/caeroad3",
		["west"] = "changan/eastroad1",
	},
	room_relative="�ٵ�-----�ٵ�-----��·�ٵ�",
}
Room {
	id = "changan/fengchi",
	name = "���",
	no_fight = true,
	ways = {
		["west"] = "changan/qingchi",
	},
}
Room {
	id = "changan/gulou",
	name = "��¥",
	ways = {
		["southeast"] = "changan/zhonglou",
		["south"] = "changan/westjie1",
	},
}
Room {
	id = "changan/heishi",
	name = "����",
	ways = {
		["east"] = "changan/shiji",
	},
}
Room {
	id = "changan/houdian",
	name = "���",
	ways = {
		["south"] = "changan/dadian",
	},
}
Room {
	id = "changan/huadian",
	name = "����",
	ways = {
		["north"] = "changan/eastjie3",
	},
}
Room {
	id = "changan/jiangjunfu",
	name = "������",
	ways = {
		["south"] = "changan/jjfzht",
		["north"] = "changan/westjie2",
		["west"] = "changan/jjfxf",
	},
}
Room {
	id = "changan/jiashan",
	name = "��ɽ",
	ways = {
		["east"] = "changan/jinghu",
	},
}
Room {
	id = "changan/jinghu",
	name = "����",
	ways = {
		["east"] = "changan/southjie3",
		["west"] = "changan/jiashan",
	},
}
Room {
	id = "changan/jiuguan",
	name = "�ƹ�",
	ways = {
		["north"] = "changan/neijie1",
	},
}
Room {
	id = "changan/jjfhhy",
	name = "��԰",
	ways = {
		["north"] = "changan/jjfhm",
		["west"] = "changan/jjflt",
	},
}
Room {
	id = "changan/jjfhm",
	name = "����",
	ways = {
		["south"] = "changan/jjfhhy",
		["north"] = "changan/jjfzht",
	},
}
Room {
	id = "changan/jjflt",
	name = "��ͤ",
	ways = {
		["east"] = "changan/jjfhhy",
	},
}
Room {
	id = "changan/jjfws",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "changan/jjfzht",
	},
}
Room {
	id = "changan/jjfxf",
	name = "�᷿",
	ways = {
		["east"] = "changan/jiangjunfu",
	},
}
Room {
	id = "changan/jjfyt",
	name = "����",
	ways = {
		["west"] = "changan/jjfzht",
	},
}
Room {
	id = "changan/jjfzht",
	name = "����",
	ways = {
		["south"] = "changan/jjfhm",
		["east"] = "changan/jjfyt",
		["north"] = "changan/jiangjunfu",
		["west"] = "changan/jjfws",
	},
	room_relative="������������-----����-----��������������",
	blocks = {
		["west"] = {
			{id = "guan jia", exp = 10000},
		},
		["south"] = {
			{id = "guan jia", exp = 10000},
		},
		["east"] = {
			{id = "guan jia", exp = 10000},
		},
	},
}
Room {
	id = "changan/juhao",
	name = "�ۺ���¥",
	ways = {
		["west"] = "changan/northjie1",
		["up"] = "changan/juhao2",
	},
}
Room {
	id = "changan/juhao2",
	name = "��¥��¥",
	no_fight = true,
	ways = {
		["down"] = "changan/juhao",
	},
}
Room {
	id = "changan/kezhan",
	name = "�ۺ���ջ",
	no_fight = true,
	ways = {
		["#jhkzout"] = "changan/northjie1",
		["#jhkz"] = "changan/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	lengths ={
	    ["#jhkz"] = 5,
	},
}
Room {
	id = "changan/kezhan2",
	name = "����",
	ways = {
		["north"] = "changan/kezhan3",
		["down"] = "changan/kezhan",
	},
}
Room {
	id = "changan/kezhan3",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "changan/kezhan2",
	},
}
Room {
	id = "changan/lijia",
	name = "��Ҵ�Ժ",
	ways = {
		["east"] = "changan/neijie7",
		["north"] = "changan/ljzhangfang",
		["west"] = "changan/ljzt",
	},
}
Room {
	id = "changan/ljwoshi",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "changan/ljzt",
	},
}
Room {
	id = "changan/ljyanting",
	name = "����",
	ways = {
		["south"] = "changan/ljzt",
	},
}
Room {
	id = "changan/ljzhangfang",
	name = "�ʷ�",
	ways = {
		["south"] = "changan/lijia",
	},
}
Room {
	id = "changan/ljzt",
	name = "����",
	ways = {
		["north"] = "changan/ljyanting",
		["east"] = "changan/lijia",
		["west"] = "changan/ljwoshi",
	},
	room_relative="����������-----����-----��Ҵ�Ժ����",
	objs = {
          ["��Ա��"] = "li yuanwai",
     },
}
Room {
	id = "changan/longchi",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "changan/qingchi",
	},
}
Room {
	id = "changan/lwtne",
	name = "����̨",
	ways = {
		["south"] = "changan/eastchq1",
		["west"] = "changan/northchq6",
	},
	room_relative="����ǽ----����̨������ǽ����̨",
	blocks = {
		["south"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["west"] = {
			{id = "zhiqin bing", exp = 10000},
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtnw",
	name = "����̨",
	ways = {
		["south"] = "changan/westchq1",
		["east"] = "changan/northchq1",
	},
	room_relative="����̨----����ǽ������ǽ����̨",
	blocks = {
		["south"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["east"] = {
			{id = "zhiqin bing", exp = 10000},
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtse",
	name = "����̨",
	ways = {
		["north"] = "changan/eastchq4",
		["west"] = "changan/southchq6",
	},
	room_relative="����ǽ���ϳ�ǽ----����̨����̨",
	blocks = {
		["north"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["west"] = {
			{id = "zhiqin bing", exp = 10000},
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtsw",
	name = "����̨",
	ways = {
		["north"] = "changan/westchq4",
		["east"] = "changan/southchq1",
	},
	room_relative="����ǽ������̨----�ϳ�ǽ����̨",
	blocks = {
		["north"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["east"] = {
			{id = "zhiqin bing", exp = 10000},
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/minju1",
	name = "���",
	ways = {
		["south"] = "changan/shiji",
	},
}
Room {
	id = "changan/minju2",
	name = "���",
	ways = {
		["north"] = "changan/shiji",
	},
	objs = {
          ["������"] = "da laoshu",
     },
}
Room {
	id = "changan/minju3",
	name = "���",
	ways = {
		["south"] = "changan/neijie1",
	},
}
Room {
	id = "changan/minju4",
	name = "���",
	ways = {
		["south"] = "changan/neijie2",
	},
}
Room {
	id = "changan/minju5",
	name = "���",
	ways = {
		["south"] = "changan/neijie3",
	},
}
Room {
	id = "changan/minju6",
	name = "���",
	ways = {
		["south"] = "changan/neijie4",
	},
}
Room {
	id = "changan/minju7",
	name = "���",
	ways = {
		["south"] = "changan/neijie5",
	},
}
Room {
	id = "changan/neijie1",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/jiuguan",
		["east"] = "changan/northjie3",
		["north"] = "changan/minju3",
		["west"] = "changan/shiji",
	},
	room_relative="��ӣ��м�-----�ڽ�-----����֣��ƹ��ڽ�",
}
Room {
	id = "changan/neijie2",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/xiyuan",
		["east"] = "changan/neijie3",
		["north"] = "changan/minju4",
		["west"] = "changan/northjie3",
	},
	room_relative="��ӣ������-----�ڽ�-----�ڽ֣�ϷԺ�ڽ�",
}
Room {
	id = "changan/neijie3",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/tupiaoguan",
		["east"] = "changan/neijie4",
		["north"] = "changan/minju5",
		["west"] = "changan/neijie2",
	},
	room_relative="��ӣ��ڽ�-----�ڽ�-----�ڽ֣����ι��ڽ�",
	objs = {
          ["��С��"] = "he xiaowu",
          ["��С��"] = "lian xiaosan",
          ["��С��"] = "dong xiaoer",
     },
}
Room {
	id = "changan/neijie4",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/zahuopu",
		["east"] = "changan/neijie5",
		["north"] = "changan/minju6",
		["west"] = "changan/neijie3",
	},
	room_relative="��ӣ��ڽ�-----�ڽ�-----�ڽ֣��ӻ����ڽ�",
}
Room {
	id = "changan/neijie5",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/neijie6",
		["north"] = "changan/minju7",
		["west"] = "changan/neijie4",
	},
	room_relative="��ӣ��ڽ�-----�ڽ֣��ڽ��ڽ�",
}
Room {
	id = "changan/neijie6",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/neijie7",
		["north"] = "changan/neijie5",
	},
	room_relative="�ڽ֣��ڽ֣��ڽ��ڽ�",
	objs = {
          ["�蹷"] = "feng gou",
     },
}
Room {
	id = "changan/neijie7",
	name = "�ڽ�",
	ways = {
		["south"] = "changan/eastjie4",
		["north"] = "changan/neijie6",
		["west"] = "changan/lijia",
	},
	room_relative="�ڽ֣���Ҵ�Ժ-----�ڽ֣�������ڽ�",
}
Room {
	id = "changan/northchl",
	name = "���ų�¥",
	ways = {
		["down"] = "changan/northmen",
		["east"] = "changan/northjl2",
		["west"] = "changan/northjl1",
	},
	room_relative="��¥---���ų�¥---��¥����Զ�ű��ų�¥",
}
Room {
	id = "changan/northchq1",
	name = "����ǽ",
	ways = {
		["east"] = "changan/northchq2",
		["west"] = "changan/lwtnw",
	},
	room_relative="����̨----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq2",
	name = "����ǽ",
	ways = {
		["east"] = "changan/northchq3",
		["west"] = "changan/northchq1",
	},
	room_relative="����ǽ----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq3",
	name = "����ǽ",
	ways = {
		["east"] = "changan/northjl1",
		["west"] = "changan/northchq2",
	},
	room_relative="����ǽ----����ǽ----��¥����ǽ",
}
Room {
	id = "changan/northchq4",
	name = "����ǽ",
	ways = {
		["east"] = "changan/northchq5",
		["west"] = "changan/northjl2",
	},
	room_relative="��¥----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq5",
	name = "����ǽ",
	ways = {
		["east"] = "changan/northchq6",
		["west"] = "changan/northchq4",
	},
	room_relative="����ǽ----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq6",
	name = "����ǽ",
	ways = {
		["east"] = "changan/lwtne",
		["west"] = "changan/northchq5",
	},
	room_relative="����ǽ----����ǽ----����̨����ǽ",
}
Room {
	id = "changan/northjie1",
	name = "�����",
	ways = {
		["south"] = "changan/zhonglou",
		["north"] = "changan/northjie2",
		["east"] = "changan/juhao",
		["west"] = "changan/kezhan",
	},
	room_relative="����֣��ۺ���ջ----�����----�ۺ���¥����¥�����",
}
Room {
	id = "changan/northjie2",
	name = "�����",
	ways = {
		["south"] = "changan/northjie1",
		["east"] = "zhiye/zhibufang1",
		["north"] = "changan/northjie3",
		["west"] = "zhiye/caifengpu1",
	},
	room_relative="����֣��÷���----�����----֯����������ֱ����",
}
Room {
	id = "changan/northjie3",
	name = "�����",
	ways = {
		["south"] = "changan/northjie2",
		["north"] = "changan/northmen",
		["east"] = "changan/neijie2",
		["west"] = "changan/neijie1",
	},
	room_relative="��Զ�ţ��ڽ�----�����----�ڽ֣�����ֱ����",
}
Room {
	id = "changan/northjl1",
	name = "��¥",
	ways = {
		["east"] = "changan/northchl",
		["west"] = "changan/northchq3",
	},
	room_relative="����ǽ-----��¥-----���ų�¥��¥",
}
Room {
	id = "changan/northjl2",
	name = "��¥",
	ways = {
		["east"] = "changan/northchq4",
		["west"] = "changan/northchl",
	},
	room_relative="���ų�¥-----��¥-----����ǽ��¥",
}
Room {
	id = "changan/northmen",
	name = "��Զ��",
	ways = {
		["south"] = "changan/northjie3",
		["north"] = "changan/northroad1",
		["up"] = "changan/northchl",
	},
	blocks = {
		["up"] = {
			{id = "guan bing", exp = 10000},
			{id = "wu jiang", exp = 75000},
		},
	},
}
Room {
	id = "changan/northroad1",
	name = "�ٵ�",
	ways = {
		["south"] = "changan/northmen",
		["north"] = "changan/northroad2",
	},
	room_relative="�ٵ����ٵ�����Զ�Źٵ�",
}
Room {
	id = "changan/northroad10",
	name = "���",
	ways = {
		["northup"] = "hengshan/jinlongxia",
		["south"] = "changan/northroad9",
		["east"] = "hmy/pingding/road1",
	},
	room_relative="����Ͽ�����-----��·��������",
}
Room {
	id = "changan/northroad2",
	name = "�ٵ�",
	ways = {
		["south"] = "changan/northroad1",
		["north"] = "changan/northroad3",
	},
	room_relative="������ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/northroad3",
	name = "���",
	ways = {
		["south"] = "changan/northroad2",
		["northeast"] = "changan/northroad4",
	},
	room_relative="��·�J������ٵ����",
}
Room {
	id = "changan/northroad4",
	name = "��·",
	ways = {
		["northup"] = "changan/northroad5",
		["southwest"] = "changan/northroad3",
		["south"] = "zhiye/nongtian0",
		["north"] = "zhiye/sanglin0",
	},
	room_relative="ɣ�������·�L�����ũ�����·",
}
Room {
	id = "changan/northroad5",
	name = "��·",
	ways = {
		["northeast"] = "group/entry/canroad6",
		["southdown"] = "changan/northroad4",
	},
	room_relative="��·�J��·����·��·",
}
Room {
	id = "changan/northroad7",
	name = "��·",
	ways = {
		["southup"] = "group/entry/canroad6",
		["northeast"] = "changan/northroad8",
	},
	room_relative="��·�J��·����·��·",
	objs = {
          ["��������"] = "changan keshang",
     },
}
Room {
	id = "changan/northroad8",
	name = "��·",
	ways = {
		["southwest"] = "changan/northroad7",
		["north"] = "changan/road2",
	},
	room_relative="�½��ɿڣ���·�L��·��·",
}
Room {
	id = "changan/northroad9",
	name = "���",
	ways = {
		["south"] = "changan/road3",
		["north"] = "changan/northroad10",
	},
	room_relative="�����������½��ɿڴ��",
}
Room {
	id = "changan/qianzhuang",
	name = "����Ǯׯ",
	ways = {
		["east"] = "changan/southjie1",
	},
	objs = {
          ["Ǯ�ۿ�"] = "qian yankai",
     },
}
Room {
	id = "changan/qingchi",
	name = "���",
	no_fight = true,
	ways = {
		["north"] = "changan/eastjie2",
		-- ["east"] = "changan/fengchi",
		-- ["west"] = "changan/longchi",
	},
	nolooks = {
		["east"] = true,
		["west"] = true,
	},
}
Room {
	id = "changan/qingzhensi",
	name = "������",
	ways = {
		["south"] = "changan/westjie4",
		["north"] = "changan/dadian",
	},
}
Room {
	id = "changan/road2",
	name = "�½��ɿ�",
	ways = {
		["southeast"] = "huanghe/huangtu",
		["south"] = "changan/northroad8",
		["#duHhe"] = "changan/road3",
	},
	lengths = {
		["#duHhe"] = 10000,
	},
	nolooks = {
		["enter"] = true,
		["#duHhe"] = true,
	},
}
Room {
	id = "changan/road3",
	name = "�½��ɿ�",
	ways = {
		["north"] = "changan/northroad9",
		["#duHhe"] = "changan/road2",
	},
	lengths = {
		["#duHhe"] = 10000,
	},
	nolooks = {
		["enter"] = true,
		["#duHhe"] = true,
	},
}
Room {
	id = "changan/shihuangling",
	name = "ʼ����",
	ways = {
		["southwest"] = "changan/baishulin2",
		["east"] = "changan/yongkeng2",
		["north"] = "changan/yongkeng1",
		["west"] = "changan/baishulin1",
	},
}
Room {
	id = "changan/shiji",
	name = "�м�",
	ways = {
		["south"] = "changan/minju2",
		["east"] = "changan/neijie1",
		["north"] = "changan/minju1",
		["west"] = "changan/heishi",
	},
}
Room {
	id = "changan/shuiguodian",
	name = "ˮ����",
	ways = {
		["south"] = "changan/eastjie3",
	},
}
Room {
	id = "changan/southchl",
	name = "���ų�¥",
	ways = {
		["down"] = "changan/southmen",
		["east"] = "changan/southjl2",
		["west"] = "changan/southjl1",
	},
	room_relative="��¥---���ų�¥---��¥�����������ų�¥",
}
Room {
	id = "changan/southchq1",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/southchq2",
		["west"] = "changan/lwtsw",
	},
	room_relative="����̨----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq2",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/southchq3",
		["west"] = "changan/southchq1",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq3",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/southjl1",
		["west"] = "changan/southchq2",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----��¥�ϳ�ǽ",
}
Room {
	id = "changan/southchq4",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/southchq5",
		["west"] = "changan/southjl2",
	},
	room_relative="��¥----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq5",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/southchq6",
		["west"] = "changan/southchq4",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq6",
	name = "�ϳ�ǽ",
	ways = {
		["east"] = "changan/lwtse",
		["west"] = "changan/southchq5",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----����̨�ϳ�ǽ",
}
Room {
	id = "changan/southjie1",
	name = "�ϴ��",
	ways = {
		["south"] = "changan/southjie2",
		["north"] = "changan/zhonglou",
		["east"] = "changan/dangpu",
		["west"] = "changan/qianzhuang",
	},
	room_relative="��¥������Ǯׯ----�ϴ��----���̣��ϴ���ϴ��",
}
Room {
	id = "changan/southjie2",
	name = "�ϴ��",
	ways = {
		["south"] = "changan/southjie3",
		["north"] = "changan/southjie1",
		["east"] = "changan/bingqipu",
		["west"] = "changan/dewentang",
	},
	room_relative="�ϴ�֣�������----�ϴ��----�����̣��ϴ���ϴ��",
}
Room {
	id = "changan/southjie3",
	name = "�ϴ��",
	ways = {
		["south"] = "changan/southmen",
		["north"] = "changan/southjie2",
		["east"] = "changan/changjie1",
		["west"] = "changan/jinghu",
	},
	room_relative="�ϴ�֣�����----�ϴ��----���֣��������ϴ��",
	lengths ={
	    ["east"] = "if job.name and job.name=='husong' then return 10 else return 1 end",
	},
}
Room {
	id = "changan/southjl1",
	name = "��¥",
	ways = {
		["east"] = "changan/southchl",
		["west"] = "changan/southchq3",
	},
	room_relative="�ϳ�ǽ-----��¥-----���ų�¥��¥",
}
Room {
	id = "changan/southjl2",
	name = "��¥",
	ways = {
		["east"] = "changan/southchq4",
		["west"] = "changan/southchl",
	},
	room_relative="���ų�¥-----��¥-----�ϳ�ǽ��¥",
}
Room {
	id = "changan/southmen",
	name = "������",
	ways = {
		["south"] = "changan/southroad1",
		["north"] = "changan/southjie3",
		["up"] = "changan/southchl",
	},
	blocks = {
		["up"] = {
			{id = "wu jiang", exp = 75000},
			{id = "guan bing", exp = 10000},
		},
	},
}
Room {
	id = "changan/southroad1",
	name = "�ٵ�",
	ways = {
		["south"] = "changan/southroad2",
		["north"] = "changan/southmen",
	},
	room_relative="�����ţ��ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/southroad2",
	name = "�ٵ�",
	ways = {
		["south"] = "changan/southroad3",
		["north"] = "changan/southroad1",
	},
	room_relative="�ٵ����ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/southroad3",
	name = "�ٵ�",
	ways = {
		["south"] = "xiangyang/lantian",
		["north"] = "changan/southroad2",
		["west"] = "xiangyang/caiyongmanor",
	},
	room_relative="�ٵ�������ׯ-----�ٵ�������ٵ�",
}
Room {
	id = "changan/tupiaoguan",
	name = "���ι�",
	ways = {
		["north"] = "changan/neijie3",
	},
}
Room {
	id = "changan/wanhonglou",
	name = "���¥",
	ways = {
		["south"] = "changan/eastjie1",
	},
	objs = {
          ["ѩ�ɶ�"] = "xue xianer",
     },
}
Room {
	id = "changan/wenquan",
	name = "��Ȫ",
	ways = {
		["west"] = "changan/baishulin2",
	},
}
Room {
	id = "changan/westchl",
	name = "���ų�¥",
	ways = {
		["south"] = "changan/westjl2",
		["down"] = "changan/westmen",
		["north"] = "changan/westjl1",
	},
	room_relative="��¥�����ų�¥����¥���ų�¥",
}
Room {
	id = "changan/westchq1",
	name = "����ǽ",
	ways = {
		["south"] = "changan/westchq2",
		["north"] = "changan/lwtnw",
	},
	room_relative="����̨������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/westchq2",
	name = "����ǽ",
	ways = {
		["south"] = "changan/westjl1",
		["north"] = "changan/westchq1",
	},
	room_relative="����ǽ������ǽ����¥����ǽ",
}
Room {
	id = "changan/westchq3",
	name = "����ǽ",
	ways = {
		["south"] = "changan/westchq4",
		["north"] = "changan/westjl2",
	},
	room_relative="��¥������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/westchq4",
	name = "����ǽ",
	ways = {
		["south"] = "changan/lwtsw",
		["north"] = "changan/westchq3",
	},
	room_relative="����ǽ������ǽ������̨����ǽ",
}
Room {
	id = "changan/westjie1",
	name = "�����",
	ways = {
		["south"] = "changan/zhubaohang",
		["east"] = "changan/zhonglou",
		["north"] = "changan/gulou",
		["west"] = "changan/westjie2",
	},
	room_relative="��¥�������----�����----��¥���鱦�������",
}
Room {
	id = "changan/westjie2",
	name = "�����",
	ways = {
		["south"] = "changan/jiangjunfu",
		["north"] = "changan/yamen",
		["east"] = "changan/westjie1",
		["west"] = "changan/westjie3",
	},
	room_relative="���Ŵ��ţ������----�����----����֣������������",
}
Room {
	id = "changan/westjie3",
	name = "�����",
	ways = {
		["south"] = "changan/biaoju",
		["north"] = "changan/yizhan",
		["east"] = "changan/westjie2",
		["west"] = "changan/westjie4",
	},
	room_relative="��վ�������----�����----����֣������ھ������",
}
Room {
	id = "changan/westjie4",
	name = "�����",
	ways = {
		["south"] = "changan/chm",
		["east"] = "changan/westjie3",
		["north"] = "changan/qingzhensi",
		["west"] = "changan/westmen",
	},
	room_relative="�����£�������----�����----����֣������������",
}
Room {
	id = "changan/westjl1",
	name = "��¥",
	ways = {
		["south"] = "changan/westchl",
		["north"] = "changan/westchq2",
	},
	room_relative="����ǽ����¥�����ų�¥��¥",
}
Room {
	id = "changan/westjl2",
	name = "��¥",
	ways = {
		["south"] = "changan/westchq3",
		["north"] = "changan/westchl",
	},
	room_relative="���ų�¥����¥������ǽ��¥",
}
Room {
	id = "changan/westmen",
	name = "������",
	ways = {
		["east"] = "changan/westjie4",
		["west"] = "changan/westroad1",
		["up"] = "changan/westchl",
	},
	blocks = {
		["up"] = {
			{id = "wu jiang", exp = 75000},
			{id = "guan bing", exp = 10000},
		},
	},
}
Room {
	id = "changan/westroad1",
	name = "�ٵ�",
	ways = {
		["east"] = "changan/westmen",
		["west"] = "changan/westroad2",
	},
	room_relative="�ٵ�-----�ٵ�-----�����Źٵ�",
}
Room {
	id = "changan/westroad2",
	name = "�ٵ�",
	ways = {
		["northwest"] = "lanzhou/lpshan",
		["east"] = "changan/westroad1",
	},
	room_relative="����ɽ�I�ٵ�-----�ٵ��ٵ�",
}
Room {
	id = "changan/xiaoyanta1",
	name = "С����",
	ways = {
		["south"] = "changan/baishulin1",
		["up"] = "changan/xiaoyanta2",
	},
}
Room {
	id = "changan/xiaoyanta10",
	name = "С����ʮ��",
	ways = {
		["down"] = "changan/xiaoyanta9",
		["up"] = "changan/xiaoyanta11",
	},
}
Room {
	id = "changan/xiaoyanta11",
	name = "С����ʮһ��",
	ways = {
		["down"] = "changan/xiaoyanta10",
		["up"] = "changan/xiaoyanta12",
	},
}
Room {
	id = "changan/xiaoyanta12",
	name = "С����ʮ����",
	ways = {
		["down"] = "changan/xiaoyanta11",
		["up"] = "changan/xiaoyanta13",
	},
}
Room {
	id = "changan/xiaoyanta13",
	name = "С����ʮ����",
	ways = {
		["down"] = "changan/xiaoyanta12",
		["up"] = "changan/xiaoyanta14",
	},
}
Room {
	id = "changan/xiaoyanta14",
	name = "С����ʮ�Ĳ�",
	ways = {
		["down"] = "changan/xiaoyanta13",
		["up"] = "changan/xiaoyanta15",
	},
}
Room {
	id = "changan/xiaoyanta15",
	name = "С����ʮ���",
	ways = {
		["down"] = "changan/xiaoyanta14",
	},
}
Room {
	id = "changan/xiaoyanta2",
	name = "С��������",
	ways = {
		["down"] = "changan/xiaoyanta1",
		["up"] = "changan/xiaoyanta3",
	},
}
Room {
	id = "changan/xiaoyanta3",
	name = "С��������",
	ways = {
		["down"] = "changan/xiaoyanta2",
		["up"] = "changan/xiaoyanta4",
	},
}
Room {
	id = "changan/xiaoyanta4",
	name = "С�����Ĳ�",
	ways = {
		["down"] = "changan/xiaoyanta3",
		["up"] = "changan/xiaoyanta5",
	},
}
Room {
	id = "changan/xiaoyanta5",
	name = "С�������",
	ways = {
		["down"] = "changan/xiaoyanta4",
		["up"] = "changan/xiaoyanta6",
	},
}
Room {
	id = "changan/xiaoyanta6",
	name = "С��������",
	ways = {
		["down"] = "changan/xiaoyanta5",
		["up"] = "changan/xiaoyanta7",
	},
}
Room {
	id = "changan/xiaoyanta7",
	name = "С�����߲�",
	ways = {
		["down"] = "changan/xiaoyanta6",
		["up"] = "changan/xiaoyanta8",
	},
}
Room {
	id = "changan/xiaoyanta8",
	name = "С�����˲�",
	ways = {
		["down"] = "changan/xiaoyanta7",
		["up"] = "changan/xiaoyanta9",
	},
}
Room {
	id = "changan/xiaoyanta9",
	name = "С�����Ų�",
	ways = {
		["down"] = "changan/xiaoyanta8",
		["up"] = "changan/xiaoyanta10",
	},
}
Room {
	id = "changan/xiyuan",
	name = "ϷԺ",
	ways = {
		["north"] = "changan/neijie2",
	},
}
Room {
	id = "changan/yamen",
	name = "���Ŵ���",
	ways = {
		["south"] = "changan/westjie2",
		["north"] = "changan/yamen2",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 17500},
		},
	},
}
Room {
	id = "changan/yamen2",
	name = "��������",
	ways = {
		["south"] = "changan/yamen",
	},
}
Room {
	id = "changan/yizhan",
	name = "��վ",
	ways = {
		["south"] = "changan/westjie3",
	},
}
Room {
	id = "changan/yongkeng1",
	name = "����ٸ��",
	ways = {
		["south"] = "changan/shihuangling",
	},
}
Room {
	id = "changan/yongkeng2",
	name = "����ٸ��",
	ways = {
		["west"] = "changan/shihuangling",
	},
}
Room {
	id = "changan/zahuopu",
	name = "�ӻ���",
	ways = {
		["north"] = "changan/neijie4",
	},
	objs = {
          ["����ʵ"] = "liu laoshi",
     },
}
Room {
	id = "changan/zhonglou",
	name = "��¥",
	ways = {
		["south"] = "changan/southjie1",
		["northwest"] = "changan/gulou",
		["north"] = "changan/northjie1",
		["east"] = "changan/eastjie1",
		["west"] = "changan/westjie1",
	},
}
Room {
	id = "changan/zhubaohang",
	name = "�鱦��",
	ways = {
		["north"] = "changan/westjie1",
	},
}
Room {
	id = "changle/bajiao",
	name = "�˽�ͤ",
	ways = {
		["west"] = "changle/huayuan",
	},
	objs = {
          ["����"] = "ding dang",
           },
}
Room {
	id = "changle/chaifang",
	name = "��",
	ways = {
		["north"] = "changle/zoulang3",
	},
}
Room {
	id = "changle/chufang",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "changle/zoulang2",
	},
       precmds = {
              ["north"] = "drop cha;drop rice",
       },
	   objs = {
          ["���"] = "xiang cha",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "changle/damen",
	name = "����",
	ways = {
		["south"] = "changle/xiaolu",
		["enter"] = "changle/dating",
	},
}
Room {
	id = "changle/dating",
	name = "����",
	ways = {
		["north"] = "changle/zoulang4",
		["out"] = "changle/damen",
	},
}
Room {
	id = "changle/huayuan",
	name = "��԰",
	ways = {
		["north"] = "changle/yongdao",
		["east"] = "changle/bajiao",
		["west"] = "changle/xiaoting",
	},
}
Room {
	id = "changle/road1",
	name = "�����",
	ways = {
		["southeast"] = "changle/road2",
		["northwest"] = "city/eroad2",
		["northeast"] = "changle/road3",
	},
}
Room {
	id = "changle/road2",
	name = "��ʯ·",
	ways = {
		["northwest"] = "changle/road1",
		["east"] = "changle/xiaolu",
	},

}
Room {
	id = "changle/road3",
	name = "�����",
	ways = {
		["southwest"] = "changle/road1",
	},
}

Room {
	id = "changle/shishi",
	name = "ʯ��",
	ways = {
		["west"] = "changle/yongdao",
	},
}
Room {
	id = "changle/shuifang",
	name = "˯��",
	no_fight = true,
	ways = {
		["south"] = "changle/zoulang3",
	},
}
Room {
	id = "changle/woshi",
	name = "����",
	ways = {
		["south"] = "changle/xiaoting",
	},
}
Room {
	id = "changle/xiaolu",
	name = "��ʯ·",
	ways = {
		["north"] = "changle/damen",
		["west"] = "changle/road2",
	},
}
Room {
	id = "changle/xiaoting",
	name = "С��",
	ways = {
		["south"] = "changle/zoulang4",
		["north"] = "changle/woshi",
		["east"] = "changle/huayuan",
	},
	objs = {
          ["�׺�Ұ"] = "mi hengye",
          ["����ʯ"] = "bei haishi",
           },
}
Room {
	id = "changle/xiaowu",
	name = "С��",
	ways = {
		["north"] = "changle/zoulang1",
	},
}
Room {
	id = "changle/yongdao",
	name = "��",
	ways = {
		["south"] = "changle/huayuan",
		["east"] = "changle/shishi",
	},
}
Room {
	id = "changle/zoulang1",
	name = "������",
	ways = {
		["south"] = "changle/xiaowu",
		["east"] = "changle/zoulang2",
		["west"] = "changle/zoulang4",
	},
}
Room {
	id = "changle/zoulang2",
	name = "������",
	ways = {
		["south"] = "changle/chufang",
		["west"] = "changle/zoulang1",
	},
	objs = {
          ["�³�֮"] = "chen chongzhi",
           },
}
Room {
	id = "changle/zoulang3",
	name = "������",
	ways = {
		["south"] = "changle/chaifang",
		["east"] = "changle/zoulang4",
		["north"] = "changle/shuifang",
	},
}
Room {
	id = "changle/zoulang4",
	name = "����",
	ways = {
		["south"] = "changle/dating",
		["north"] = "changle/xiaoting",
		["east"] = "changle/zoulang1",
		["west"] = "changle/zoulang3",
	},
}
Room {
	id = "chengdu/bank",
	name = "ī��ի",
	ways = {
		["east"] = "chengdu/nandajie2",
	},
	objs = {
          ["���ƹ�"] = "wang zhanggui",
           },
}
Room {
	id = "chengdu/beidajie1",
	name = "�����",
	ways = {
		["south"] = "chengdu/center",
		["north"] = "chengdu/beidajie2",
	},
	room_relative="����֣�����֣������ı����",
}
Room {
	id = "chengdu/beidajie2",
	name = "�����",
	ways = {
		["south"] = "chengdu/beidajie1",
		["east"] = "zhiye/yaochang1",
		["north"] = "chengdu/beidajie3",
		["west"] = "zhiye/yaodian1",
	},
	room_relative="����֣�ҩ��----�����----��ҩ����������ֱ����",
}
Room {
	id = "chengdu/beidajie3",
	name = "�����",
	ways = {
		["south"] = "chengdu/beidajie2",
		["north"] = "chengdu/beidajie4",
	},
	room_relative="����֣�����֣�����ֱ����",
}
Room {
	id = "chengdu/beidajie4",
	name = "�����",
	ways = {
		["south"] = "chengdu/beidajie3",
		["north"] = "chengdu/dabeimen",
		["east"] = "chengdu/cgenlu1",
	},
	room_relative="���ţ������----�Ǹ�·������ֱ����",
}
Room {
	id = "chengdu/center",
	name = "������",
	ways = {
		["south"] = "chengdu/nandajie1",
		["east"] = "chengdu/ddajie1",
		["north"] = "chengdu/beidajie1",
		["west"] = "chengdu/xidajie1",
	},
}
Room {
	id = "chengdu/cgenlu1",
	name = "�Ǹ�·",
	ways = {
		["east"] = "chengdu/cgenlu2",
		["west"] = "chengdu/beidajie4",
	},
	room_relative="�����----�Ǹ�·----�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu2",
	name = "�Ǹ�·",
	ways = {
		["southeast"] = "chengdu/cgenlu3",
		["west"] = "chengdu/cgenlu1",
	},
	room_relative="�Ǹ�·----�Ǹ�·�K�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu3",
	name = "�Ǹ�·",
	ways = {
		["southeast"] = "chengdu/cgenlu4",
		["northwest"] = "chengdu/cgenlu2",
	},
	room_relative="�Ǹ�·�I�Ǹ�·�K�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu4",
	name = "�Ǹ�·",
	ways = {
		["south"] = "chengdu/cgenlu5",
		["northwest"] = "chengdu/cgenlu3",
	},
	room_relative="�Ǹ�·�I�Ǹ�·���Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu5",
	name = "�Ǹ�·",
	ways = {
		["south"] = "chengdu/ddajie4",
		["north"] = "chengdu/cgenlu4",
	},
	room_relative="�Ǹ�·���Ǹ�·������ֳǸ�·",
}
Room {
	id = "chengdu/dabeimen",
	name = "����",
	ways = {
		["south"] = "chengdu/beidajie4",
		["north"] = "chengdu/road4",
	},
}
Room {
	id = "chengdu/dadongmen",
	name = "����",
	ways = {
		["east"] = "chengdu/eroad1",
		["west"] = "chengdu/ddajie4",
	},
}
Room {
	id = "chengdu/dananmen",
	name = "������",
	ways = {
		["south"] = "chengdu/sroad1",
		["north"] = "chengdu/nandajie2",
	},
}
Room {
	id = "chengdu/daximen",
	name = "������",
	ways = {
		["east"] = "chengdu/xidajie2",
		["west"] = "chengdu/wroad1",
	},
}
Room {
	id = "chengdu/ddajie1",
	name = "�����",
	ways = {
		["north"] = "group/cailiao-hang",
		["east"] = "chengdu/ddajie2",
		["west"] = "chengdu/center",
	},
	room_relative="�����У�������----�����----����ֶ����",
}
Room {
	id = "chengdu/ddajie2",
	name = "�����",
	ways = {
		["south"] = "chengdu/zjmen",
		["east"] = "chengdu/ddajie3",
		["west"] = "chengdu/ddajie1",
	},
	room_relative="�����----�����----����֣��Ӿ����Ŷ����",
}
Room {
	id = "chengdu/ddajie3",
	name = "�����",
	ways = {
		["south"] = "chengdu/nancejie1",
		["east"] = "chengdu/ddajie4",
		["west"] = "chengdu/ddajie2",
	},
	room_relative="�����----�����----����֣��ϲ�ֶ����",
}
Room {
	id = "chengdu/ddajie4",
	name = "�����",
	ways = {
		["east"] = "chengdu/dadongmen",
		["north"] = "chengdu/cgenlu5",
		["west"] = "chengdu/ddajie3",
	},
	room_relative="�Ǹ�·�������----�����----���Ŷ����",
}
Room {
	id = "chengdu/eroad1",
	name = "���",
	ways = {
		["northeast"] = "chengdu/eroad2",
		["west"] = "chengdu/dadongmen",
	},
	room_relative="����J����-----������",
	objs = {
          ["����ׯ"] = "liu zhuzhuang",
           },
}
Room {
	id = "chengdu/eroad2",
	name = "���",
	ways = {
		["southwest"] = "chengdu/eroad1",
		["northeast"] = "chengdu/eroad3",
	},
	room_relative="����J����L������",
}
Room {
	id = "chengdu/eroad3",
	name = "���",
	ways = {
		["southwest"] = "chengdu/eroad2",
		["east"] = "group/entry/cderoad4",
	},
	room_relative="���-----����L������",
}
Room {
	id = "chengdu/guandm",
	name = "�ص���",
	ways = {
		["south"] = "chengdu/xidajie2",
		["north"] = "chengdu/houyuan",
	},
	objs = {
          ["ȫ����"] = "quan guanqing",
          ["���"] = "li chunlai",
           },
}
Room {
	id = "chengdu/houyuan",
	name = "��Ժ",
	no_fight = true,
	ways = {
		["south"] = "chengdu/guandm",
	},
	objs = {
          ["��ͷ"] = "man tou",
           },
}
Room {
	id = "chengdu/nancejie1",
	name = "�ϲ��",
	ways = {
		["south"] = "chengdu/nancejie2",
		["north"] = "chengdu/ddajie3",
	},
	room_relative="����֣��ϲ�֣��ϲ���ϲ��",
}
Room {
	id = "chengdu/nancejie2",
	name = "�ϲ��",
	ways = {
		["south"] = "chengdu/nanmen",
		["north"] = "chengdu/nancejie1",
	},
	room_relative="�ϲ�֣��ϲ�֣�С�����ϲ��",
}
Room {
	id = "chengdu/nandajie1",
	name = "�ϴ��",
	ways = {
		["south"] = "chengdu/nandajie2",
		["north"] = "chengdu/center",
	},
	room_relative="�����ģ��ϴ�֣��ϴ���ϴ��",
}
Room {
	id = "chengdu/nandajie2",
	name = "�ϴ��",
	ways = {
		["south"] = "chengdu/dananmen",
		["north"] = "chengdu/nandajie1",
		["west"] = "chengdu/bank",
	},
	room_relative="�ϴ�֣�ī��ի----�ϴ�֣��������ϴ��",
}
Room {
	id = "chengdu/nanmen",
	name = "С����",
	ways = {
		["south"] = "dali/shanlu2",
		["north"] = "chengdu/nancejie2",
	},
}
Room {
	id = "chengdu/road1",
	name = "���",
	ways = {
		["southwest"] = "chengdu/road4",
		["east"] = "zhiye/gaoshan0",
		["north"] = "lanzhou/qingcheng",
	},
	room_relative="��ǣ����-----��ɽ���¨L������",
}
Room {
	id = "chengdu/road4",
	name = "���",
	ways = {
		["south"] = "chengdu/dabeimen",
		["northeast"] = "chengdu/road1",
	},
	room_relative="����J��������Ŵ��",
}
Room {
	id = "chengdu/shufang",
	name = "�鷿",
	ways = {
		["east"] = "chengdu/zjhall",
	},
}
Room {
	id = "chengdu/sroad1",
	name = "������",
	ways = {
		["southwest"] = "chengdu/tulu3",
		["north"] = "chengdu/dananmen",
	},
}
Room {
	id = "chengdu/tulu1",
	name = "����ɽ����",
	ways = {
		["northeast"] = "group/entry/cdtulu2",
		["west"] = "emei/qingshijie",
	},
}
Room {
	id = "chengdu/tulu3",
	name = "��·",
	ways = {
		["southwest"] = "group/entry/cdtulu2",
		["northeast"] = "chengdu/sroad1",
	},
}
Room {
	id = "chengdu/wroad1",
	name = "���",
	ways = {
		["east"] = "chengdu/daximen",
		["west"] = "chengdu/wroad2",
	},
	room_relative="���-----���-----�����Ŵ��",
}
Room {
	id = "chengdu/wroad2",
	name = "���",
	ways = {
		["east"] = "chengdu/wroad1",
		["west"] = "xueshan/tulu1",
	},
	room_relative="������·-----���-----������",
}
Room {
	id = "chengdu/xidajie1",
	name = "�����",
	ways = {
		["east"] = "chengdu/center",
		["west"] = "chengdu/xidajie2",
	},
	room_relative="�����----�����----�����������",
}
Room {
	id = "chengdu/xidajie2",
	name = "�����",
	ways = {
		["east"] = "chengdu/xidajie1",
		["north"] = "chengdu/guandm",
		["west"] = "chengdu/daximen",
	},
	room_relative="�ص����������----�����----����������",
}
Room {
	id = "chengdu/zjhall",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "chengdu/zjmen",
	--	["west"] = "chengdu/shufang",
	},
	--precmds = {
	--	["west"] = "#guessNum",
	--},
	objs = {
          ["������"] = "liu haoyi",
           },
}
Room {
	id = "chengdu/zjmen",
	name = "�Ӿ�����",
	ways = {
		["south"] = "chengdu/zjhall",
		["north"] = "chengdu/ddajie2",
	},
}
Room {
	id = "city/banfang",
	name = "�෿",
	ways = {
		["west"] = "city/menlang",
	},
}
Room {
	id = "city/beidajie1",
	name = "�����",
	ways = {
		["south"] = "city/beidajie2",
		["east"] = "city/xiaochidian",
		["north"] = "city/beimen",
		["west"] = "city/chmiao",
	},
	room_relative="���ţ�������----�����----С�Ե������ֱ����",
}
Room {
	id = "city/beidajie2",
	name = "�����",
	ways = {
		["south"] = "city/beidajie3",
		["east"] = "city/kedian",
		["north"] = "city/beidajie1",
		["west"] = "city/qianzhuang",
	},
	room_relative="����֣����ի----�����----������ջ������ֱ����",
}
Room {
	id = "city/beidajie3",
	name = "�����",
	ways = {
		["south"] = "city/guangchangdong",
		["east"] = "city/yizhan",
		["north"] = "city/beidajie2",
		["west"] = "city/guangchangbei",
	},
	room_relative="����֣��㳡��----�����----��վ���㳡�������",
	objs = {
          ["���ǿ�"] = "jingcheng ke",
           },
}
Room {
	id = "city/beimen",
	name = "����",
	ways = {
		["south"] = "city/beidajie1",
		["north"] = "city/hsroad1",
	},
	lengths = {
	    ["north"] = "if job.name and job.area and (job.area=='�ƺ�����' or job.area=='̩ɽ') and job.name=='hubiao' then return false else return 1 end",
	},
}
Room {
	id = "city/bingqiku",
	name = "������",
	ways = {
		["north"] = "city/bingying",
	},
}
Room {
    id = "city/bingying",
    name = "��Ӫ",
    ways = {
            ["east"] = "city/bingyingmen",
            ["south"] = "city/bingqiku"
    },
    blocks = {
            ["south"] = {
                    {id = "guan bing", exp = 10000},
            },
    },
    objs = {
      ["ʷ��ɽ"] = "shi qingshan",
    },
}
Room {
	id = "city/bingyingmen",
	name = "��Ӫ����",
	ways = {
		["east"] = "city/guangchangxi",
		["west"] = "city/bingying",
	},
}
Room {
	id = "city/chaguan",
	name = "���",
	ways = {
		["east"] = "city/nandajie2",
	},
}
Room {
	id = "city/chemahang",
	name = "������",
	ways = {
		["west"] = "city/guangchangdong",
	},
}
Room {
	id = "city/chmiao",
	name = "������",
	no_fight = true,
	ways = {
		["northwest"] = "wizard/guest_room",
		["east"] = "city/beidajie1",
	},
	objs = {
          ["������"] = "gongde xiang",
          ["����Ա����������񹫸��"] = "board",
           },
}
Room {
	id = "city/damingsi",
	name = "������",
	ways = {
		["north"] = "city/xidajie2",
	},
}
Room {
	id = "city/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "city/guangchangnan",
	},
}
Room {
	id = "city/dating1",
	name = "�ĳ�����",
	no_fight = true,
	ways = {
		["north"] = "city/duchang4",
		["east"] = "city/duchang",
		["down"] = "city/dixiashi",
	},
	precmds = {
		["down"] = "give 1 gold to ping wei",
	},
	lengths ={
		["down"] = 10,
	},
	objs = {
          ["ƽ��"] = "ping wei",
           },
}

Room {
	id = "city/dhq",
	name = "�����",
	ways = {
		["south"] = "city/sxh",
		["east"] = "city/xjs",
		["north"] = "city/hubian1",
	},
}
Room {
	id = "city/diemenglou1",
	name = "����¥һ¥",
	ways = {
		["up"] = "city/diemenglou2",
	},
}

Room {
	id = "city/laofang",
	name = "�η�",
	ways = {
		["give 2 silver to yu zu;wear all"] = "city/dilao",
	},
	nolooks = {
		["give 2 silver to yu zu;wear all"] = true,
	},
}
Room {
	id = "city/dilao",
	name = "����",
	ways = {
		["southup"] = "city/fyhouyuan",
	},
}
Room {
	id = "city/dixiashi",
	name = "���º�ȭ��",
	no_fight = true,
	ways = {
		["up"] = "city/dating1",
	},
}
Room {
	id = "city/dongdajie0",
	name = "�����",
	ways = {
		["south"] = "zhiye/bingqipu1",
		["north"] = "zhiye/datiepu1",
		["east"] = "city/dongmen",
		["west"] = "city/dongdajie1",
	},
	room_relative="�����̣������----�����----���ţ������̶����",
}
Room {
	id = "city/dongdajie1",
	name = "�����",
	ways = {
		["southeast"] = "city/yltw",
		["south"] = "zhiye/jimaidian1",
		["north"] = "city/yaopu",
		["east"] = "city/dongdajie0",
		["west"] = "city/dongdajie2",
	},
	room_relative="ҩ�̣������----�����----����֣��K����������ͤ�ⶫ���",
}
Room {
	id = "city/dongdajie2",
	name = "�����",
	ways = {
		["south"] = "city/zahuopu",
		["north"] = "city/shuyuan",
		["east"] = "city/dongdajie1",
		["west"] = "city/dongdajie3",
	},
	room_relative="��Ժ�������----�����----����֣��ӻ��̶����",
}
Room {
	id = "city/dongdajie3",
	name = "�����",
	ways = {
		["south"] = "city/yueqidian",
		["north"] = "city/guangchangdong",
		["east"] = "city/dongdajie2",
		["west"] = "city/guangchangnan",
	},
	room_relative="�㳡�����㳡��----�����----����֣������궫���",
}
Room {
	id = "city/dongmen",
	name = "����",
	ways = {
		["south"] = "city/yzyunhe",
		["north"] = "zhiye/biaoju1",
		["east"] = "group/entry/yzeroad1",
		["northeast"] = "city/guandimiao",
		["west"] = "city/dongdajie0",
	},
}
Room {
	id = "city/dongting",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "city/ymzhengting",
	},
	objs = {
          ["���ʷ�"] = "zhang zhangfang",
           },
}
Room {
	id = "city/dongting2",
	name = "�ξֶ���",
	no_fight = true,
	ways = {
		["west"] = "city/yanju",
	},
}
Room {
	id = "city/dongxiangfang",
	name = "���᷿",
	ways = {
		["west"] = "city/lichunyuan",
	},
	objs = {
          ["éʮ��"] = "mao shiba",
           },
}
Room {
	id = "city/duchang",
	name = "�ĳ�",
	ways = {
		["south"] = "city/gusaifang",
		["east"] = "city/nandajie3",
		["west"] = "city/dating1",
		["up"] = "city/duchang2",
	},
}
Room {
	id = "city/duchang2",
	name = "�ĳ�",
	no_fight = true,
	ways = {
		["down"] = "city/duchang",
		["east"] = "city/eproom",
		["west"] = "city/wproom",
		["south"] = "city/sproom",
		["north"] = "city/nproom",
	},
	objs = {
          ["������վ"] = "board",
          ["Ǯ�ϱ�"] = "qian laoben",
           },
}
Room {
	id = "city/eproom",
	name = "������",
	no_fight = true,
	ways = {
		["west"] = "city/duchang2",
	},
}
Room {
	id = "city/nproom",
	name = "������",
	no_fight = true,
	ways = {
		["south"] = "city/duchang2",
	},
}
Room {
	id = "city/wproom",
	name = "��������",
	no_fight = true,
	ways = {
		["east"] = "city/duchang2",
	},
}
Room {
	id = "city/sproom",
	name = "�����Ϸ�",
	no_fight = true,
	ways = {
		["north"] = "city/duchang2",
	},
}
Room {
	id = "city/duchang4",
	name = "���귿",
	ways = {
		["south"] = "city/dating1",
	},
	objs = {
          ["ǧ���"] = "sai gui",
          ["���Ϲ�"] = "sai gui",
          ["���ٹ�"] = "sai gui",
          ["���ݹ�ͯ"] = "gui tong",
           },
}
Room {
	id = "city/eroad2",
	name = "�����",
	ways = {
		["southeast"] = "changle/road1",
		["west"] = "group/entry/yzeroad1",
	},
	objs = {
	 ["��������"] = "mn",
          ["������"] = "wang gonggong",
           },
}
Room {
	id = "city/fenduo2",
	name = "Ĺ��",
	ways = {
		["jump well"] = "city/shangang",
		["north"] = "city/mszoulang",
	},
	nolooks = {
		["up"] = true,
		["jump well"] = true,
	},
	objs = {
          ["�ɳ���"] = "xi zhanglao",
          ["�����"] = "ma duozhu",
          ["ؤ��-���ݴ��·ֶ����԰�"] = "board",
           },
}
Room {
	id = "city/fyhouyuan",
	name = "���ú�Ժ",
	ways = {
		["southeast"] = "city/ymzhengting",
		["northdown"] = "city/dilao",
	},
	objs = {
          ["���ǹ�"] = "lang gou",
          ["����"] = "ao weng",
           },
}

Room {
	id = "city/geyuan",
	name = "��԰",
	ways = {
		["east"] = "city/nandajie1",
		["west"] = "city/jiashan",
	},
}
Room {
	id = "city/guandimiao",
	name = "�ص���",
	ways = {
		["southwest"] = "city/dongmen",
	},
}
Room {
	id = "city/guangchang",
	name = "����㳡",
	ways = {
		["south"] = "city/guangchangnan",
		["east"] = "city/guangchangdong",
		["north"] = "city/guangchangbei",
		["west"] = "city/guangchangxi",
	},
}
Room {
	id = "city/guangchangbei",
	name = "�㳡��",
	ways = {
		["south"] = "city/guangchang",
		["north"] = "city/yamen",
		["east"] = "city/beidajie3",
		["northeast"] = "city/kongchang",
		["west"] = "city/xidajie3",
	},
}
Room {
	id = "city/guangchangdong",
	name = "�㳡��",
	ways = {
		["south"] = "city/dongdajie3",
		["east"] = "city/chemahang",
		["north"] = "city/beidajie3",
		["west"] = "city/guangchang",
	},
}
Room {
	id = "city/guangchangnan",
	name = "�㳡��",
	ways = {
		["south"] = "city/dangpu",
		["north"] = "city/guangchang",
		["east"] = "city/dongdajie3",
		["west"] = "city/nandajie3",
	},
}
Room {
	id = "city/guangchangxi",
	name = "�㳡��",
	ways = {
		["south"] = "city/nandajie3",
		["north"] = "city/xidajie3",
		["east"] = "city/guangchang",
		["west"] = "city/bingyingmen",
	},
}
Room {
	id = "city/gusaifang",
	name = "�ĳ�",
	no_fight = true,
	ways = {
		["north"] = "city/duchang",
	},
}

Room {
	id = "city/hsroad1",
	name = "������",
	ways = {
		["south"] = "city/beimen",
		["northwest"] = "city/shangang",
		["north"] = "huanghe/caodi1",
	},
}
Room {
	id = "city/huadian",
	name = "�ʻ���",
	no_fight = true,
	ways = {
		["south"] = "city/yizhan",
	},
	objs = {
          ["����"] = "zi zhu",
           },
}
Room {
	id = "city/hubian",
	name = "����",
	ways = {
		["south"] = "city/xidajie2",
		["north"] = "city/sxh",
	},
}
Room {
	id = "city/hubian1",
	name = "��������",
	ways = {
		["south"] = "city/dhq",
		["west"] = "city/lxs",
	},
}
Room {
	id = "city/jiangbei",
	name = "��������",
	ways = {
		["#duCjiang"] = "city/jiangnan",
		["north"] = "city/nanmen",
		["east"] = "city/jiangbei2",
		["west"] = "city/jiangbei1",
	},
	lengths = {
		["#duCjiang"] = 5000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="���ţ���������---��������---����������������"
}
Room {
	id = "city/jiangbei1",
	name = "��������",
	ways = {
		["east"] = "city/jiangbei",
	},
	nolooks = {
		["enter"] = true,
	},
}
Room {
	id = "city/jiangbei2",
	name = "��������",
	ways = {
		["west"] = "city/jiangbei",
	},
	nolooks = {
		["enter"] = true,
	},
}
Room {
	id = "city/jiangnan",
	name = "�����ϰ�",
	ways = {
		["#duCjiang"] = "city/jiangbei",
		["south"] = "city/sroad1",
		["east"] = "city/jiangnan2",
		["west"] = "city/jiangnan1",
	},
	lengths = {
		["#duCjiang"] = 5000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="�����ϰ�---�����ϰ�---�����ϰ������Ϲٵ������ϰ�"
}
Room {
	id = "city/jiangnan1",
	name = "�����ϰ�",
	ways = {
		["east"] = "city/jiangnan",
	},
	nolooks = {
		["enter"] = true,
	},
}
Room {
	id = "city/jiangnan2",
	name = "�����ϰ�",
	ways = {
		["west"] = "city/jiangnan",
	},
	nolooks = {
		["enter"] = true,
	},
}
Room {
	id = "city/jiashan",
	name = "��ɽ",
	ways = {
		["east"] = "city/geyuan",
	},
}
Room {
	id = "city/jiulou",
	name = "�������ƹ�",
	ways = {
		["stand;up"] = "city/jiulou2",
		["stand;south"] = "city/xidajie1",
	},
	objs = {
          ["���ƹ�"] = "xian zhanggui",
          ["������"] = "jia laolu",
           },
}
Room {
	id = "city/jiulou2",
	name = "��������¥",
	ways = {
		["down"] = "city/jiulou",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "city/kedian",
	name = "������ջ",
	no_fight = true,
	ways = {
		["east"] = "city/kedian/pianting",
		["#bckzout"] = "city/beidajie2",
	    ["#bckz"] = "city/kedian2",
	},
	lengths = {
		["#bckz"] = 5,
	},
	nolooks = {
		["up"] = true,
	},
	objs = {
          ["�͵����԰�"] = "board",
           },
}
Room {
	id = "city/kedian/pianting",
	name = "ƫ��",
	ways = {
		["west"] = "city/kedian",
	},
	objs = {
          ["�ױ���"] = "he biweng",
          ["����"] = "zhao min",
          ["�����о����۰�"] = "board",
          ["¹�ȿ�"] = "lu zhangke",
           },
}
Room {
	id = "city/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "city/kedian3",
		["down"] = "city/kedian",
	},
}
Room {
	id = "city/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "city/kedian2",
	},
}
Room {
	id = "city/kongchang",
	name = "�㳡",
	ways = {
		["southwest"] = "city/guangchangbei",
	},
}
Room {
	id = "city/lichunyuan",
	name = "����Ժ",
	ways = {
		["south"] = "city/mingyufang",
		["east"] = "city/dongxiangfang",
		["west"] = "city/xixiangfang",
	},
	objs = {
          ["Τ����"] = "wei chunfang",
           },
}
Room {
	id = "city/lxs",
	name = "�����°���",
	ways = {
		["east"] = "city/hubian1",
	},
}
Room {
	id = "city/menlang",
	name = "����",
	ways = {
		["south"] = "city/yamen",
		["north"] = "city/ymzhengting",
		["east"] = "city/banfang",
	},
}
Room {
	id = "city/miao",
	name = "Ӣ�ҷ�����",
	no_fight = true,
	ways = {
		["east"] = "city/winmo",
	},
}

Room {
	id = "city/mingyufang",
	name = "����",
	ways = {
		["south"] = "city/xidajie3",
		["north"] = "city/lichunyuan",
	},
}
Room {
	id = "city/ml1",
	name = "������",
	ways = {
		["south"] = "city/dongmen",
		["east"] = "city/ml2",
		["north"] = "city/ml1",
		["west"] = "city/ml1",
	},
}

Room {
	id = "city/mszoulang",
	name = "Ĺ��ͨ��",
	ways = {
		["south"] = "city/fenduo2",
		["west"] = "city/xmushi",
	},
}
Room {
	id = "city/nandajie1",
	name = "�ϴ��",
	ways = {
		["south"] = "city/nanmen",
		["east"] = "city/xiaopangu",
		["north"] = "city/nandajie2",
		["west"] = "city/geyuan",
		--["#yjh"] = "city/nanmen",
	},
	room_relative="�ϴ�֣���԰----�ϴ��----С�̹ţ������ϴ��",
	--nolooks = {
	--	["#yjh"] = true,
	--	["south"] = true,
	--},
}
Room {
	id = "city/nandajie2",
	name = "�ϴ��",
	ways = {
		["south"] = "city/nandajie1",
		["east"] = "city/yanju",
		["north"] = "city/nandajie3",
		["west"] = "city/chaguan",
	},
	room_relative="�ϴ�֣����----�ϴ��----�����ξ֣��ϴ���ϴ��",
}
Room {
	id = "city/nandajie3",
	name = "�ϴ��",
	ways = {
		["south"] = "city/nandajie2",
		["north"] = "city/guangchangxi",
		["east"] = "city/guangchangnan",
		["west"] = "city/duchang",
	},
	room_relative="�㳡�����ĳ�----�ϴ��----�㳡�ϣ��ϴ���ϴ��",
}
Room {
	id = "city/nanmen",
	name = "����",
	ways = {
		["south"] = "city/jiangbei",
		["north"] = "city/nandajie1",
	},
}

Room {
	id = "city/pinqiting",
	name = "Ʒ��ͤ",
	ways = {
		["north"] = "city/yueqidian",
	},
}

Room {
	id = "city/qianzhuang",
	name = "���ի",
	ways = {
		["east"] = "city/beidajie2",
	},
	objs = {
          ["Ǯ��"] = "qian feng",
           },
}
Room {
	id = "city/shangang",
	name = "ɽ��",
	ways = {
		["southeast"] = "city/hsroad1",
		["north"] = "city/tomb",
	},
}
Room {
	id = "city/shuyuan",
	name = "��Ժ",
	ways = {
		["south"] = "city/dongdajie2",
		["up"] = "city/wizroom",
	},
	objs = {
          ["������"] = "gu yanwu",
           },
}
Room {
	id = "city/sroad1",
	name = "���Ϲٵ�",
	ways = {
		["southeast"] = "suzhou/qsgdao6",
		["north"] = "city/jiangnan",
	},
}
Room {
	id = "city/sxh",
	name = "������",
	ways = {
		["south"] = "city/hubian",
		["north"] = "city/dhq",
	},
}
Room {
	id = "city/tomb",
	name = "��Ĺ",
	ways = {
		["south"] = "city/shangang",
		["pull huan;d"] = "city/fenduo2",
	},
	nolooks = {
		["pull huan;d"] = true,
		["down"] = true,
	},
}
Room {
	id = "city/winmo",
	name = "��ʤɽ",
	ways = {
		["southeast"] = "city/wroad1",
		["west"] = "city/miao",
	},
	objs = {
          ["��̶"] = "wang tan",
          ["�����"] = "wu dapeng",
           },
}
Room {
	id = "city/wizroom",
	name = "��ʦ���������",
	ways = {
		["down"] = "city/shuyuan",
	},
	objs = {
          ["ɱ�ֵĵ���"] = "statuary",
          ["����ĵ���"] = "statuary",
           },
}
Room {
	id = "city/wroad1",
	name = "����",
	ways = {
		["northwest"] = "city/winmo",
		["east"] = "city/ximen",
		["west"] = "city/wroad2",
	},
}
Room {
	id = "city/wroad2",
	name = "��ʯ���",
	ways = {
		["east"] = "city/wroad1",
		["west"] = "city/wroad3",
	},
}
Room {
	id = "city/wroad3",
	name = "��·",
	ways = {
		["north"] = "mingjiao/hdg/shanbi",
		["east"] = "city/wroad2",
		["west"] = "xiangyang/outeroad1",
	},
	objs = {
          ["���"] = "jian jie",
           },
}
Room {
	id = "city/xiaochidian",
	name = "С�Ե�",
	ways = {
		["west"] = "city/beidajie1",
	},
}
Room {
	id = "city/xiaopangu",
	name = "С�̹�",
	ways = {
		["west"] = "city/nandajie1",
	},
	objs = {
          ["����"] = "ju you",
           },
}
Room {
	id = "city/xidajie1",
	name = "�����",
	ways = {
		["south"] = "city/zhubaodian",
		["east"] = "city/xidajie2",
		["north"] = "city/jiulou",
		["west"] = "city/ximen",
	},
	nolooks = {
		["north"] = true,
		["south"] = true,
	},
	lengths = {
		["north"] = "if MidDay[locl.time] then return false else return 1 end",
		["south"] = "if MidDay[locl.time] then return false else return 1 end",
	},
}
Room {
	id = "city/xidajie2",
	name = "�����",
	ways = {
		["south"] = "city/damingsi",
		["east"] = "city/xidajie3",
		["north"] = "city/hubian",
		["west"] = "city/xidajie1",
	},
	room_relative="���ϣ������----�����----����֣������������",
}
Room {
	id = "city/xidajie3",
	name = "�����",
	ways = {
		["south"] = "city/guangchangxi",
		["north"] = "city/mingyufang",
		["east"] = "city/guangchangbei",
		["west"] = "city/xidajie2",
	},
	room_relative="���񷻣������----�����----�㳡�����㳡�������",
}
Room {
	id = "city/ximen",
	name = "����",
	ways = {
		["east"] = "city/xidajie1",
		["west"] = "city/wroad1",
	},
	lengths = {
	    ["west"] = "if job.name and job.area and job.area=='������' and job.name=='hubiao' then return false else return 1 end",
	},
}
Room {
	id = "city/xiting",
	name = "����",
	ways = {
		["east"] = "city/ymzhengting",
	},
}

Room {
	id = "city/xixiangfang",
	name = "���᷿",
	ways = {
		["east"] = "city/lichunyuan",
	},
}
Room {
	id = "city/xjs",
	name = "С��ɽ",
	ways = {
		["west"] = "city/dhq",
	},
	objs = {
          ["��ʽ��"] = "li shikai",
           },
}
Room {
	id = "city/xmushi",
	name = "СĹ��",
	no_fight = true,
	ways = {
		["east"] = "city/mszoulang",
	},
	objs = {
          ["��ͷ"] = "man tou",
           },
}
Room {
	id = "city/yamen",
	name = "���Ŵ���",
	ways = {
		["south"] = "city/guangchangbei",
		["north"] = "city/menlang",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 17500},
		},
	},
	objs = {
          ["������ԩ��"] = "board",
           },
}
Room {
	id = "city/yanju",
	name = "�����ξ�",
	ways = {
		["east"] = "city/dongting2",
		["west"] = "city/nandajie2",
	},
}
Room {
	id = "city/yaopu",
	name = "ҩ��",
	ways = {
		["south"] = "city/dongdajie1",
	},
}
Room {
	id = "city/yizhan",
	name = "��վ",
	ways = {
		["north"] = "city/huadian",
		["west"] = "city/beidajie3",
	},
}
Room {
	id = "city/yltw",
	name = "����ͤ��",
	ways = {
		["south"] = "city/yuelaoting",
		["northwest"] = "city/dongdajie1",
	},
}
Room {
	id = "city/ymzhengting",
	name = "��������",
	ways = {
		["south"] = "city/menlang",
		["northwest"] = "city/fyhouyuan",
		["east"] = "city/dongting",
		["west"] = "city/xiting",
	},
	blocks = {
		["northwest"] = {
			{id = "da yayi", exp = 800000},
		},
	},
	objs = {
          ["�Գ�֮"] = "zhao chengzhi",
          ["����ˮ"] = "wang huaishui",
           },
}
Room {
	id = "city/yuelaoting",
	name = "����ͤ",
	no_fight = true,
	ways = {
		["north"] = "city/yltw",
		["west"] = "city/yueqidian",
	},
	objs = {
          ["˫��"] = "shuang er",
          ["��������������"] = "board",
          ["��������"] = "yuexia laoren",
           },
}
Room {
	id = "city/yueqidian",
	name = "������",
	ways = {
		["south"] = "city/pinqiting",
		["north"] = "city/dongdajie3",
		["east"] = "city/yuelaoting",
	},
	objs = {
          ["���ϰ�"] = "xiao laoban",
           },
}
Room {
	id = "city/yzyunhe",
	name = "��ͷ",
	ways = {
		["north"] = "city/dongmen",
	},
}
Room {
	id = "city/zahuopu",
	name = "�ӻ���",
	ways = {
		["north"] = "city/dongdajie2",
	},
}
Room {
	id = "city/zhubaodian",
	name = "�鱦��",
	ways = {
		["north"] = "city/xidajie1",
	},
	objs = {
          ["���ϰ�"] = "zhu laoban",
           },
}
Room {
	id = "dali/beijie1",
	name = "�����",
	ways = {
		["south"] = "dali/xijie1",
		["north"] = "dali/yamen",
		["east"] = "dali/beijie2",
		["west"] = "dali/chaguan",
	},
	room_relative="����ǰ�������----�����----����֣�����ֱ����",
}
Room {
	id = "dali/beijie2",
	name = "�����",
	ways = {
		["south"] = "dali/fengwei",
		["east"] = "dali/beijie3",
		["west"] = "dali/beijie1",
	},
	room_relative="�����----�����----̫�ͱ��֣���ζС�Ե걱���",
}
Room {
	id = "dali/beijie3",
	name = "̫�ͱ���",
	ways = {
		["south"] = "dali/dalics",
		["north"] = "dali/beimen",
		["east"] = "dali/beijie4",
		["west"] = "dali/beijie2",
	},
	room_relative="����Ǯׯ��̫�ͱ���----�����----����֣���ѩ¥�����",
}
Room {
	id = "dali/beijie4",
	name = "�����",
	ways = {
		["south"] = "dali/jiulou",
		["north"] = "dali/qian",
		["east"] = "dali/beijie5",
		["west"] = "dali/beijie3",
	},
	room_relative="�ĳ��������----�����----����������ֱ����",
}
Room {
	id = "dali/beijie5",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie1",
		["east"] = "dali/yanju",
		["north"] = "dali/duchang",
		["west"] = "dali/beijie4",
	},
}
Room {
	id = "dali/beimen",
	name = "����",
	ways = {
		["south"] = "dali/beijie3",
		["north"] = "dali/dadao4",
	},
}
Room {
	id = "dali/bingying",
	name = "��Ӫ",
	ways = {
		["west"] = "dali/dongjie3",
	},
	objs = {
          ["�ƴ���"] = "huang daxiong",
          ["��Ȫ"] = "zhang quan",
          },
}
Room {
	id = "dali/caifeng",
	name = "�÷��",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie1",
	},
	objs = {
          ["�÷���"] = "caifeng zhuo",
          },
}
Room {
	id = "dali/chaguan",
	name = "���",
	ways = {
		["east"] = "dali/beijie1",
	},
	objs = {
          ["����"] = "ying gu",
          },
}
Room {
	id = "dali/chouduan",
	name = "���ׯ",
	ways = {
		["east"] = "dali/xijie3",
	},
	objs = {
          ["Ů����"] = "nv dianzhu",
          },
}
Room {
	id = "dali/chyuan",
	name = "�軨԰",
	ways = {
		["northup"] = "dali/chyuan2",
		["west"] = "dali/dongjie6",
	},
	precmds = {
		["northup"] = "give 5 silver to yizu xiaohuo",
	},
}
Room {
	id = "dali/chyuan2",
	name = "�軨԰",
	ways = {
		["northup"] = "dali/chyuan3",
		["southdown"] = "dali/chyuan",
	},
	objs = {
          ["���ɹ���"] = "baxian guohai",
          },
}
Room {
	id = "dali/chyuan3",
	name = "�軨԰",
	ways = {
		["northwest"] = "dali/chyuan4",
		["northeast"] = "dali/chyuan5",
		["southdown"] = "dali/chyuan2",
	},
	objs = {
          ["������"] = "luodi xiucai",
          },
}
Room {
	id = "dali/chyuan4",
	name = "�軨԰",
	ways = {
		["southeast"] = "dali/chyuan3",
	},
	objs = {
          ["��װ�ع�"] = "hongzhuang suguo",
          },
}
Room {
	id = "dali/chyuan5",
	name = "�軨԰",
	ways = {
		["southwest"] = "dali/chyuan3",
	},
	objs = {
          ["ʮ��ѧʿ"] = "shiba xueshi",
          ["ץ��������"] = "mei renlian",
          },
}
Room {
	id = "dali/dadao1",
	name = "���",
	ways = {
		["southwest"] = "dali/yuxu/xiaodao1",
		["south"] = "group/entry/dlndao2",
		["north"] = "dali/shanlu4",
	},
	room_relative="ɽ·������L��������Ұ������",
}
Room {
	id = "dali/dadao3",
	name = "���",
	ways = {
		["south"] = "dali/dadao4",
		["north"] = "group/entry/dlndao2",
		["northeast"] = "dali/htq",
	},
	room_relative="�������Ȫ���J�����������",
}
Room {
	id = "dali/dadao4",
	name = "���",
	ways = {
		["south"] = "dali/beimen",
		["north"] = "dali/dadao3",
	},
	room_relative="�������������Ŵ��",
}
Room {
	id = "dali/dafujia",
	name = "��֮��",
	ways = {
		["north"] = "dali/nanjie4",
	},
	objs = {
          ["�����"] = "ma wude",
          },
}
Room {
	id = "dali/dalics",
	name = "������",
	ways = {
		["south"] = "dali/qsjie1",
		["east"] = "dali/jiulou",
		["north"] = "dali/beijie3",
		["west"] = "dali/fengwei",
	},
}
Room {
	id = "dali/dalieast/chengj",
	name = "�ν����ɺ�",
	ways = {
		["southup"] = "group/entry/dleyd",
		["east"] = "dali/dalieast/yzh",
		["north"] = "dali/dalieast/lunan",
	},
}
Room {
	id = "dali/dalieast/dadian",
	name = "���",
	ways = {
		["south"] = "dali/dalieast/yuan1",
		["north"] = "dali/dalieast/houyuan1",
	},
}
Room {
	id = "dali/dalieast/houyuan1",
	name = "��Ժ",
	ways = {
		["south"] = "dali/dalieast/dadian",
	},
	objs = {
          ["��ü����"] = "huangmei heshang",
          },
}
Room {
	id = "dali/dalieast/lunan",
	name = "·�ϴ��ˮ",
	ways = {
		["south"] = "dali/dalieast/chengj",
		["north"] = "dali/dalieast/xs1",
		["east"] = "dali/dalieast/sl",
	},
}
Room {
	id = "dali/dalieast/nianhuasi",
	name = "�¼�С·",
	ways = {
		["north"] = "dali/dalieast/yuan1",
		["out"] = "dali/dalieast/simen",
	},
}
Room {
	id = "dali/dalieast/road1",
	name = "ɽ��С·",
	ways = {
		["eastup"] = "dali/dalieast/road2",
		["southwest"] = "dali/dalieast/shanlu7",
	},
	room_relative="ɽ��С·��ɽ��С·�Lɽ·ɽ��С·",
}
Room {
	id = "dali/dalieast/road2",
	name = "ɽ��С·",
	ways = {
		["eastup"] = "dali/dalieast/road3",
		["westdown"] = "dali/dalieast/road1",
	},
	room_relative="ɽ��С·��ɽ��С·��ɽ��С·ɽ��С·",
}
Room {
	id = "dali/dalieast/road3",
	name = "ɽ��С·",
	ways = {
		["westdown"] = "dali/dalieast/road2",
		["southeast"] = "dali/dalieast/road4",
	},
	room_relative="ɽ��С·��ɽ��С·�Kɽ��С·ɽ��С·",
}
Room {
	id = "dali/dalieast/road4",
	name = "ɽ��С·",
	ways = {
		["southeast"] = "dali/dalieast/simen",
		["northwest"] = "dali/dalieast/road3",
	},
	room_relative="ɽ��С·�Iɽ��С·�K�黨��ɽ��С·",
}
Room {
	id = "dali/dalieast/shanlu7",
	name = "ɽ·",
	ways = {
		["southeast"] = "dali/dalieast/xs1",
		["northeast"] = "dali/dalieast/road1",
		["west"] = "dali/dongmen",
	},
}
Room {
	id = "dali/dalieast/simen",
	name = "�黨��",
	ways = {
		["northwest"] = "dali/dalieast/road4",
		["enter"] = "dali/dalieast/nianhuasi",
	},
}
Room {
	id = "dali/dalieast/sl",
	name = "ʯ��",
	ways = {
		["west"] = "dali/dalieast/lunan",
	},
}
Room {
	id = "dali/dalieast/xs1",
	name = "��ɽɭ��",
	ways = {
		["south"] = "dali/dalieast/lunan",
		["northwest"] = "dali/dalieast/shanlu7",
		["north"] = "dali/dalieast/xs2",
	},
	objs = {
          ["����"] = "song shu",
          ["Ұ��"] = "ye tu",
          },
}
Room {
	id = "dali/dalieast/xs2",
	name = "����¥",
	ways = {
		["south"] = "dali/dalieast/xs1",
	},
}
Room {
	id = "dali/dalieast/ydk",
	name = "���Ӷ���",
	ways = {
		["down"] = "dali/dalieast/ydn",
		["out"] = "group/entry/dleyd",
	},
}
Room {
	id = "dali/dalieast/ydn",
	name = "��һ��",
	ways = {
		["down"] = "dali/dalieast/ydx",
		["up"] = "dali/dalieast/ydk",
	},
}
Room {
	id = "dali/dalieast/ydx",
	name = "�ڶ���",
	ways = {
		["down"] = "dali/dalieast/ydxx",
		["up"] = "dali/dalieast/ydn",
	},
}
Room {
	id = "dali/dalieast/ydxx",
	name = "������",
	ways = {
		["east"] = "dali/dalieast/ydxxx",
		["up"] = "dali/dalieast/ydx",
	},
}
Room {
	id = "dali/dalieast/ydxxx",
	name = "�۾�¥",
	ways = {
		["east"] = "dali/dalieast/ydxxxx",
		["west"] = "dali/dalieast/ydxx",
	},
}
Room {
	id = "dali/dalieast/ydxxxx",
	name = "�۾�¥��",
	ways = {
		["west"] = "dali/dalieast/ydxxx",
		["up"] = "dali/dalieast/ydxxxxx",
	},
}
Room {
	id = "dali/dalieast/ydxxxxx",
	name = "����",
	ways = {
		["east"] = "dali/dalieast/ydxxxxxx",
		["down"] = "dali/dalieast/ydxxxx",
	},
}
Room {
	id = "dali/dalieast/ydxxxxxx",
	name = "������",
	ways = {
		["west"] = "dali/dalieast/ydxxxxx",
	},
}
Room {
	id = "dali/dalieast/yuan1",
	name = "�¼�С·",
	ways = {
		["south"] = "dali/dalieast/nianhuasi",
		["north"] = "dali/dalieast/dadian",
	},
}
Room {
	id = "dali/dalieast/yzh",
	name = "���ں�",
	ways = {
		["west"] = "dali/dalieast/chengj",
	},
}
Room {
	id = "dali/dalisouth/anning",
	name = "������Ȫ",
	ways = {
		["west"] = "dali/dalisouth/xgf",
	},
	objs = {
          ["Ұ��"] = "ye tu",
          ["���ϴ���"] = "lingnan daxia",
          ["�˻���"] = "caihua she",
          },
}
Room {
	id = "dali/dalisouth/dg1",
	name = "���¥",
	ways = {
		["southup"] = "dali/dalisouth/hg1",
		["south"] = "group/entry/dlstulin",
		["northwest"] = "dali/dalisouth/xgf",
		["west"] = "dali/dalisouth/dg2",
	},
}
Room {
	id = "dali/dalisouth/dg2",
	name = "�ɻ���",
	ways = {
		["east"] = "dali/dalisouth/dg1",
		["west"] = "dali/dalisouth/dg3",
	},
}
Room {
	id = "dali/dalisouth/dg3",
	name = "��԰��",
	ways = {
		["east"] = "dali/dalisouth/dg2",
	},
}
Room {
	id = "dali/dalisouth/hg1",
	name = "����",
	ways = {
		["south"] = "dali/dalisouth/hg2",
		["north"] = "dali/dalisouth/hg3",
		["northdown"] = "dali/dalisouth/dg1",
	},
}
Room {
	id = "dali/dalisouth/hg2",
	name = "������",
	ways = {
		["north"] = "dali/dalisouth/hg1",
	},
}
Room {
	id = "dali/dalisouth/hg3",
	name = "������",
	ways = {
		["south"] = "dali/dalisouth/hg1",
	},
}
Room {
	id = "dali/dalisouth/jiangbei",
	name = "���׽���",
	ways = {
		["east"] = "foshan/road6",
		["#duCjiang"] = "dali/dalisouth/jiangnan",
	},
	lengths = {
		["#duCjiang"] = 6000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
}
Room {
	id = "dali/dalisouth/jiangnan",
	name = "���׽���",
	ways = {
		["west"] = "dali/dalisouth/xishuang",
		["#duCjiang"] = "dali/dalisouth/jiangbei",
	},
	lengths = {
		["#duCjiang"] = 6000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
}
Room {
	id = "dali/dalisouth/shanlu6",
	name = "ɽ·",
	ways = {
		["southup"] = "dali/dalisouth/xgf",
		["north"] = "dali/nanmen",
	},
}
Room {
	id = "dali/dalisouth/xgf",
	name = "�¹ط�",
	ways = {
		["southeast"] = "dali/dalisouth/dg1",
		["east"] = "dali/dalisouth/anning",
		["northdown"] = "dali/dalisouth/shanlu6",
	},
}
Room {
	id = "dali/dalisouth/xishuang",
	name = "��˫����",
	ways = {
		["east"] = "dali/dalisouth/jiangnan",
		["northeast"] = "dali/dalisouth/xiushan",
	},
}
Room {
	id = "dali/dalisouth/xiushan",
	name = "��ɽ",
	ways = {
		["southwest"] = "dali/dalisouth/xishuang",
		["northdown"] = "group/entry/dlstulin",
	},
}
Room {
	id = "dali/daliwest/futiao",
	name = "����Ͽ",
	ways = {
		["southwest"] = "dali/daliwest/ninglang",
		["northwest"] = "group/entry/dlwqunsh",
		["east"] = "dali/daliwest/nj",
	},
}
Room {
	id = "dali/daliwest/ninglang",
	name = "���������",
	ways = {
		["southup"] = "dali/daliwest/yuelong",
		["northeast"] = "dali/daliwest/futiao",
	},
}
Room {
	id = "dali/daliwest/nj",
	name = "ŭ��",
	ways = {
		["southup"] = "dali/daliwest/xueshan",
		["northeast"] = "tls/diancang",
		["west"] = "dali/daliwest/futiao",
	},
}
Room {
	id = "dali/daliwest/tianchi1",
	name = "���",
	ways = {
		["northeast"] = "group/entry/dlwqunsh",
		["up"] = "dali/daliwest/tianchi2",
	},
}
Room {
	id = "dali/daliwest/tianchi2",
	name = "��ذ�ɽ",
	ways = {
		["down"] = "dali/daliwest/tianchi1",
	},
}
Room {
	id = "dali/daliwest/xueshan",
	name = "����ѩɽ",
	ways = {
		["northdown"] = "dali/daliwest/nj",
	},
}
Room {
	id = "dali/daliwest/yuelong",
	name = "����ѩɽ",
	ways = {
		["northdown"] = "dali/daliwest/ninglang",
	},
}
Room {
	id = "dali/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "dali/dongjie1",
	},
	objs = {
          ["���ϰ�"] = "shen laoban",
          },
}
Room {
	id = "dali/datiepu",
	name = "������",
	no_fight = true,
	ways = {
		["east"] = "dali/nanjie1",
	},
}
Room {
	id = "dali/dinganfu",
	name = "������",
	no_fight = true,
	ways = {
		["north"] = "dali/nanjie2",
	},
}
Room {
	id = "dali/dlhg/chitang",
	name = "����",
	ways = {
		["southeast"] = "dali/dlhg/xiaoqiao",
		["northwest"] = "dali/dlhg/jiashan",
	},
}
Room {
	id = "dali/dlhg/chufang",
	name = "���ŷ�",
	ways = {
		["east"] = "dali/dlhg/huating",
	},
	objs = {
          ["��������"] = "guoqiao mixian",
          },
}
Room {
	id = "dali/dlhg/dadian",
	name = "���",
	ways = {
		["east"] = "dali/dlhg/zoulang2",
	},
}
Room {
	id = "dali/dlhg/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "dali/dlhg/xiaoqiao",
		["north"] = "dali/dlhg/qingong",
	},
}
Room {
	id = "dali/dlhg/huating",
	name = "����",
	ways = {
		["south"] = "dali/dlhg/zoulang1",
		["east"] = "dali/dlhg/shufang",
		["west"] = "dali/dlhg/chufang",
	},
	nolooks = {
		["north"] = true,
	},
	objs = {
          ["������"] = "duan zhengming",
          },
}
Room {
	id = "dali/dlhg/jiashan",
	name = "��ɽʯ",
	ways = {
		["southeast"] = "dali/dlhg/chitang",
	},
}
Room {
	id = "dali/dlhg/qingong",
	name = "�޹�",
	ways = {
		["south"] = "dali/dlhg/houyuan",
	},
}
Room {
	id = "dali/dlhg/shufang",
	name = "�鷿",
	ways = {
		["west"] = "dali/dlhg/huating",
	},
}
Room {
	id = "dali/dlhg/xiangfang",
	name = "�᷿",
	ways = {
		["west"] = "dali/dlhg/zoulang2",
	},
}
Room {
	id = "dali/dlhg/xiaoqiao",
	name = "С��",
	ways = {
		["south"] = "dali/dlhg/zoulang2",
		["northwest"] = "dali/dlhg/chitang",
		["north"] = "dali/dlhg/houyuan",
	},
}
Room {
	id = "dali/dlhg/zhengmen",
	name = "�ʹ�����",
	ways = {
		["south"] = "dali/qsjie2",
		["north"] = "dali/dlhg/zoulang1",
	},
	blocks = {
		["north"] = {
			{id = "huanggong shiwei", exp = 500000, party = "������"},
		},
	},
	objs = {
          ["�ʹ�����"] = "huanggong shiwei",
          },
}
Room {
	id = "dali/dlhg/zoulang1",
	name = "����",
	ways = {
		["south"] = "dali/dlhg/zhengmen",
		["north"] = "dali/dlhg/huating",
	},
}
Room {
	id = "dali/dlhg/zoulang2",
	name = "����",
	ways = {
		["south"] = "dali/dlhg/huating",
		["north"] = "dali/dlhg/xiaoqiao",
		["east"] = "dali/dlhg/xiangfang",
		["west"] = "dali/dlhg/dadian",
	},
}
Room {
	id = "dali/dongjie1",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie2",
		["east"] = "dali/dangpu",
		["north"] = "dali/beijie5",
		["west"] = "dali/jiulou",
	},
	room_relative="����֣���ѩ¥----�����----���̣�����ֶ����",
}
Room {
	id = "dali/dongjie2",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie3",
		["east"] = "dali/yaopu",
		["north"] = "dali/dongjie1",
		["west"] = "dali/doufufang",
	},
	room_relative="����֣�������----�����----ҩ�̣�����ֶ����",
}
Room {
	id = "dali/dongjie3",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie4",
		["north"] = "dali/dongjie2",
		["east"] = "dali/bingying",
	},
	room_relative="����֣������----��Ӫ��̫�Ͷ��ֶ����",
}
Room {
	id = "dali/dongjie4",
	name = "̫�Ͷ���",
	ways = {
		["south"] = "dali/dongjie5",
		["east"] = "dali/dongmen",
		["north"] = "dali/dongjie3",
	},
}
Room {
	id = "dali/dongjie5",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie6",
		["east"] = "dali/wangfu/damen",
		["north"] = "dali/dongjie4",
	},
	room_relative="̫�Ͷ��֣������----�����������ţ�����ֶ����",
}
Room {
	id = "dali/dongjie6",
	name = "�����",
	ways = {
		["south"] = "dali/dongjie7",
		["north"] = "dali/dongjie5",
		["east"] = "dali/chyuan",
	},
	room_relative="����֣������----�軨԰������ֶ����",
}
Room {
	id = "dali/dongjie7",
	name = "�����",
	ways = {
		["south"] = "dali/nanjie5",
		["east"] = "dali/huadian",
		["north"] = "dali/dongjie6",
	},
	room_relative="����֣������----������ϴ�ֶ����",
}
Room {
	id = "dali/dongmen",
	name = "����",
	ways = {
		["east"] = "dali/dalieast/shanlu7",
		["west"] = "dali/dongjie4",
	},
}
Room {
	id = "dali/doufufang",
	name = "������",
	ways = {
		["north"] = "dali/jiulou",
		["east"] = "dali/dongjie2",
		["west"] = "dali/qsjie1",
	},
	objs = {
          ["������ʩ"] = "doufu xishi",
          },
}
Room {
	id = "dali/duchang",
	name = "�ĳ�",
	ways = {
		["south"] = "dali/beijie5",
	},
}
Room {
	id = "dali/erhai",
	name = "����԰",
	ways = {
		["eastup"] = "dali/jzs3",
		["west"] = "dali/hth",
	},
}
Room {
	id = "dali/fengwei",
	name = "��ζС�Ե�",
	ways = {
		["east"] = "dali/dalics",
		["north"] = "dali/beijie2",
		["west"] = "dali/xijie1",
	},
	objs = {
          ["��ǧ"] = "zhang qian",
          },
}
Room {
	id = "dali/hth",
	name = "������",
	ways = {
		["east"] = "dali/erhai",
		["west"] = "dali/htq",
	},
}
Room {
	id = "dali/htq",
	name = "����Ȫ",
	ways = {
		["southwest"] = "dali/dadao3",
		["east"] = "dali/hth",
	},
}
Room {
	id = "dali/huadian",
	name = "����",
	ways = {
		["west"] = "dali/dongjie7",
	},
}
Room {
	id = "dali/jiulou",
	name = "��ѩ¥",
	ways = {
		["south"] = "dali/doufufang",
		["east"] = "dali/dongjie1",
		["north"] = "dali/beijie4",
		["west"] = "dali/dalics",
	},
	objs = {
          ["ŷ���ϰ�"] = "ouyang laoban",
          },
}
Room {
	id = "dali/jzs1",
	name = "����ɽ",
	ways = {
		["westdown"] = "dali/jzs2",
	},
}
Room {
	id = "dali/jzs2",
	name = "����ɽ��",
	ways = {
		["westdown"] = "dali/jzs3",
		["eastup"] = "dali/jzs1",
	},
}
Room {
	id = "dali/jzs3",
	name = "��ɽһ��",
	ways = {
		["eastup"] = "dali/jzs2",
		["westdown"] = "dali/erhai",
	},
}
Room {
	id = "dali/kedian",
	name = "ӭ����",
	ways = {
		-- ["enter"] = "dali/kedian2",
		["north"] = "dali/qsjie1",
	},
	nolooks = {
		["enter"] = true,
	},
}
Room {
	id = "dali/kedian2",
	name = "����",
	ways = {
		["north"] = "dali/kedian3",
		["out"] = "dali/kedian",
	},
}
Room {
	id = "dali/kedian3",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "dali/kedian2",
	},
}
Room {
	id = "dali/mafang",
	name = "��",
	ways = {
		["east"] = "dali/qsjie2",
	},
	objs = {
          ["�����"] = "ma fuzi",
          },
}
Room {
	id = "dali/nanjie1",
	name = "�ϴ��",
	ways = {
		["south"] = "dali/shudian",
		["north"] = "dali/xijie7",
		["east"] = "dali/nanjie2",
		["west"] = "dali/datiepu",
	},
	room_relative='����֣�������----�ϴ��----�ϴ�֣������ϴ��',
}
Room {
	id = "dali/nanjie2",
	name = "�ϴ��",
	ways = {
		["south"] = "dali/dinganfu",
		["east"] = "dali/nanjie3",
		["west"] = "dali/nanjie1",
	},
	room_relative='�ϴ��----�ϴ��----̫���Ͻ֣��������ϴ��',
}
Room {
	id = "dali/nanjie3",
	name = "̫���Ͻ�",
	ways = {
		["south"] = "dali/nanmen",
		["north"] = "dali/qsjie2",
		["east"] = "dali/nanjie4",
		["west"] = "dali/nanjie2",
	},
}
Room {
	id = "dali/nanjie4",
	name = "�ϴ��",
	ways = {
		["south"] = "dali/dafujia",
		["east"] = "dali/nanjie5",
		["west"] = "dali/nanjie3",
	},
	room_relative='̫���Ͻ�----�ϴ��----�ϴ�֣���֮���ϴ��',
}
Room {
	id = "dali/nanjie5",
	name = "�ϴ��",
	ways = {
		["south"] = "dali/zahuopu",
		["east"] = "dali/shuyuan",
		["north"] = "dali/dongjie7",
		["west"] = "dali/nanjie4",
	},
	room_relative='����֣��ϴ��----�ϴ��----��Ժ���ӻ����ϴ��',
}
Room {
	id = "dali/nanmen",
	name = "����",
	ways = {
		["south"] = "dali/dalisouth/shanlu6",
		["north"] = "dali/nanjie3",
	},
}
Room {
	id = "dali/qian",
	name = "����Ǯׯ",
	ways = {
		["south"] = "dali/beijie4",
	},
	objs = {
          ["���ƹ�"] = "yan zhanggui",
          },
}
Room {
	id = "dali/qsjie1",
	name = "��ʯ��",
	ways = {
		["south"] = "dali/kedian",
		["north"] = "dali/dalics",
		["east"] = "dali/doufufang",
	},
}
Room {
	id = "dali/qsjie2",
	name = "��ʯ��",
	ways = {
		["south"] = "dali/nanjie3",
		["east"] = "dali/yizhan",
		["north"] = "dali/dlhg/zhengmen",
		["west"] = "dali/mafang",
	},
}
Room {
	id = "dali/shanhou",
	name = "�Ʋ��",
	ways = {
		["east"] = "dali/xijie5",
	},
	objs = {
          ["����̩"] = "gao shengtai",
          },
}
Room {
	id = "dali/shanlu2",
	name = "ɽ·",
	ways = {
		["south"] = "dali/shanlu3",
		["north"] = "chengdu/nanmen",
	},
	room_relative="С���ţ�ɽ·��ɽ·ɽ·",
}
Room {
	id = "dali/shanlu3",
	name = "ɽ·",
	ways = {
		["south"] = "dali/shanlu4",
		["north"] = "dali/shanlu2",
		["northeast"] = "dali/wuliang/xiaoxi",
	},
	room_relative="ɽ·ɽ��СϪ���Jɽ·��ɽ·ɽ·",
}
Room {
	id = "dali/shanlu4",
	name = "ɽ·",
	ways = {
		["south"] = "dali/dadao1",
		["north"] = "dali/shanlu3",
	},
	room_relative="ɽ·��ɽ·�����ɽ·",
}
Room {
	id = "dali/shudian",
	name = "����",
	ways = {
		["north"] = "dali/nanjie1",
	},
}
Room {
	id = "dali/shuyuan",
	name = "��Ժ",
	ways = {
		["west"] = "dali/nanjie5",
	},
}
Room {
	id = "dali/sikong",
	name = "˾����",
	ways = {
		["south"] = "dali/yamen",
	},
	objs = {
          ["����ʯ"] = "ba tianshi",
          },
}
Room {
	id = "dali/sima",
	name = "˾����",
	ways = {
		["east"] = "dali/yamen",
	},
	objs = {
          ["����"] = "fan ye",
          },
}
Room {
	id = "dali/situ",
	name = "˾ͽ��",
	ways = {
		["west"] = "dali/yamen",
	},
	objs = {
          ["������"] = "hua hegen",
          },
}
Room {
	id = "dali/wangfu/chufang",
	name = "��������",
	ways = {
		["west"] = "dali/wangfu/lang4",
	},
	objs = {
          ["ϸ�ž�ƿ"] = "jiu ping",
          ["ըɽ��"] = "zha shanji",
     },
}
Room {
	id = "dali/wangfu/damen",
	name = "������������",
	ways = {
		["south"] = "dali/wangfu/dating",
		["west"] = "dali/dongjie5",
	},
	objs = {
          ["�������԰�"] = "board",
     },
}
Room {
	id = "dali/wangfu/dating",
	name = "��������",
	ways = {
		["east"] = "dali/wangfu/lang2",
		["north"] = "dali/wangfu/damen",
		["west"] = "dali/wangfu/lang1",
	},
	blocks = {
		["east"] = {
			{id = "dali guanbing", exp = 10000,party = "������"},
		},
		["west"] = {
			{id = "dali guanbing", exp = 10000,party = "������"},
		},
	},
	objs = {
          ["��˼��"] = "fu sigui",
     },
}
Room {
	id = "dali/wangfu/huayuan",
	name = "��԰",
	ways = {
		["east"] = "dali/wangfu/lang8",
		["west"] = "dali/wangfu/lang7",
	},
	objs = {
          ["���Ƴ�"] = "gu ducheng",
     },
}
Room {
	id = "dali/wangfu/lang1",
	name = "����",
	ways = {
		["south"] = "dali/wangfu/lang3",
		["east"] = "dali/wangfu/dating",
	},
	room_relative="����-----�������������ȳ���",
}
Room {
	id = "dali/wangfu/lang2",
	name = "����",
	ways = {
		["south"] = "dali/wangfu/lang4",
		["west"] = "dali/wangfu/dating",
	},
	room_relative="��������-----���ȣ����ȳ���",
}
Room {
	id = "dali/wangfu/lang3",
	name = "����",
	ways = {
		["south"] = "dali/wangfu/lang5",
		["east"] = "dali/wangfu/nuange",
		["north"] = "dali/wangfu/lang1",
		["west"] = "dali/wangfu/yizheng",
	},
	room_relative="���ȣ�������-----����-----ů������ȳ���",
}
Room {
	id = "dali/wangfu/lang4",
	name = "����",
	ways = {
		["south"] = "dali/wangfu/lang6",
		["north"] = "dali/wangfu/lang2",
		["east"] = "dali/wangfu/chufang",
		["west"] = "dali/wangfu/zhangfang",
	},
	room_relative="���ȣ��ʷ�-----����-----�������������ȳ���",
}
Room {
	id = "dali/wangfu/lang5",
	name = "����",
	ways = {
		["southeast"] = "dali/wangfu/lang7",
		["east"] = "dali/wangfu/shufang",
		["north"] = "dali/wangfu/lang3",
		["west"] = "dali/wangfu/woshi1",
	},
	room_relative="���ȣ�����-----����-----�鷿�K���ȳ���",
}
Room {
	id = "dali/wangfu/lang6",
	name = "����",
	ways = {
		["southwest"] = "dali/wangfu/lang8",
		["east"] = "dali/wangfu/wupinfang",
		["north"] = "dali/wangfu/lang4",
		["west"] = "dali/wangfu/woshi2",
	},
	room_relative="���ȣ�����-----����-----�������L���ȳ���",
}
Room {
	id = "dali/wangfu/lang7",
	name = "����",
	ways = {
		["northwest"] = "dali/wangfu/lang5",
		["east"] = "dali/wangfu/huayuan",
	},
	room_relative="���ȨI����-----��԰����",
}
Room {
	id = "dali/wangfu/lang8",
	name = "����",
	ways = {
		["northeast"] = "dali/wangfu/lang6",
		["west"] = "dali/wangfu/huayuan",
	},
	room_relative="���ȨJ��԰-----���ȳ���",
}
Room {
	id = "dali/wangfu/nuange",
	name = "ů��",
	ways = {
		["west"] = "dali/wangfu/lang3",
	},
	objs = {
          ["������"] = "duan zhengchun",
     },
}
Room {
	id = "dali/wangfu/shufang",
	name = "�鷿",
	ways = {
		["west"] = "dali/wangfu/lang5",
	},
	objs = {
          ["��˷�"] = "dacheng fojing",
     },
}
Room {
	id = "dali/wangfu/woshi1",
	name = "����",
	ways = {
		["east"] = "dali/wangfu/lang5",
	},
}
Room {
	id = "dali/wangfu/woshi2",
	name = "����",
	ways = {
		["east"] = "dali/wangfu/lang6",
	},
}
Room {
	id = "dali/wangfu/wupinfang",
	name = "������",
	ways = {
		["west"] = "dali/wangfu/lang6",
	},
}
Room {
	id = "dali/wangfu/yizheng",
	name = "������",
	ways = {
		["east"] = "dali/wangfu/lang3",
	},
}
Room {
	id = "dali/wangfu/zhangfang",
	name = "�ʷ�",
	ways = {
		["east"] = "dali/wangfu/lang4",
	},
}
Room {
	id = "dali/wuliang/anbian",
	name = "���׽���",
	ways = {
		["eastup"] = "dali/wuliang/gaoshan",
	},
}
Room {
	id = "dali/wuliang/anbian1",
	name = "���׽���",
	ways = {
		["east"] = "dali/wuliang/jiangan",
		["west"] = "dali/wuliang/shanlu8",
	},
}
Room {
	id = "dali/wuliang/banshan1",
	name = "��ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan2",
	},
}
Room {
	id = "dali/wuliang/banshan2",
	name = "��ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan3",
	},
}
Room {
	id = "dali/wuliang/banshan3",
	name = "��ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan4",
	},
}
Room {
	id = "dali/wuliang/banshan4",
	name = "��ɽ",
	ways = {
		["down"] = "dali/wuliang/gudi",
	},
}
Room {
	id = "dali/wuliang/beihubian",
	name = "������",
	ways = {
		["southeast"] = "dali/wuliang/nanhubian",
		["north"] = "dali/wuliang/shulin4",
		["northeast"] = "dali/wuliang/donghubian",
	},
}
Room {
	id = "dali/wuliang/caodi",
	name = "��ٹȹȿ�",
	ways = {
		["south"] = "dali/wuliang/xiaojing",
		["out"] = "dali/wuliang/hslin",
	},
}
Room {
	id = "dali/wuliang/dlgong",
	name = "��������",
	ways = {
		["west"] = "dali/wuliang/jhg",
	},
}
Room {
	id = "dali/wuliang/dong1",
	name = "ʯ��",
	ways = {
		["enter"] = "dali/wuliang/dong2",
		["up"] = "dali/wuliang/taijie",
		["out"] = "dali/wuliang/dongkou",
	},
}
Room {
	id = "dali/wuliang/dong2",
	name = "����",
	ways = {
		["out"] = "dali/wuliang/dong1",
	},
}
Room {
	id = "dali/wuliang/donghubian",
	name = "������",
	ways = {
		["southwest"] = "dali/wuliang/beihubian",
		["north"] = "dali/wuliang/shulin1",
		["east"] = "dali/wuliang/gudi",
		["west"] = "dali/wuliang/xihubian",
	},
}
Room {
	id = "dali/wuliang/dongkou",
	name = "����",
	ways = {
		["out"] = "dali/wuliang/shibi",
		["knock huan;tui huan;enter"] = "dali/wuliang/dong1",
	},
}
Room {
	id = "dali/wuliang/dting",
	name = "����",
	ways = {
		["west"] = "dali/wuliang/wlj",
	},
}
Room {
	id = "dali/wuliang/gaoshan",
	name = "����ɽ��",
	ways = {
		["westdown"] = "dali/wuliang/anbian",
		["south"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/gudi",
	name = "ɽ�ȵײ�",
	ways = {
		["west"] = "dali/wuliang/donghubian",
	},
}
Room {
	id = "dali/wuliang/guzhong",
	name = "��ٹ�",
	ways = {
		["south"] = "dali/wuliang/keting",
		["north"] = "dali/wuliang/xiaojing",
		["west"] = "dali/wuliang/xiaoting",
	},
	objs = {
          ["������"] = "laifu er",
          ["��ϲ��"] = "jinxi er",
           },
}
Room {
	id = "dali/wuliang/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "dali/wuliang/jhg",
		["north"] = "dali/wuliang/songlin1",
	},
	nolooks = {
		["north"] = true,
	},
	lengths = {
	    ["north"] = 100 ,
	},
}
Room {
	id = "dali/wuliang/hslin",
	name = "��ɭ��",
	ways = {
		["south"] = "dali/wuliang/tiesuo",
		["enter ������"] = "dali/wuliang/caodi",
	},
	nolooks = {
		["enter ������"] = true,
	},
}
Room {
	id = "dali/wuliang/jhg",
	name = "������",
	ways = {
		["south"] = "dali/wuliang/wlj",
		["north"] = "dali/wuliang/houyuan",
		["east"] = "dali/wuliang/dlgong",
		["west"] = "dali/wuliang/xlgong",
	},
	blocks = {
		["north"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
		["east"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
		["west"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
	},
	objs = {
          ["������"] = "zuo zimu",
          ["�����"] = "gong guangjie",
          ["��˫��"] = "xin shuangqing",
           },
}
Room {
	id = "dali/wuliang/jiangan",
	name = "����",
	ways = {
		["north"] = "dali/wuliang/tiesuo",
		["west"] = "dali/wuliang/anbian1",
	},
}
Room {
	id = "dali/wuliang/jiangpan",
	name = "����",
	ways = {
		["enter"] = "dali/wuliang/taijie",
		["down"] = "dali/wuliang/anbian1",
	},
}
Room {
	id = "dali/wuliang/keting",
	name = "����",
	ways = {
		["north"] = "dali/wuliang/guzhong",
		["east"] = "dali/wuliang/xiangfang",
	},
	blocks = {
		["east"] = {
			{id = "zhong wanchou", exp = 400000},
		},
	},
}
Room {
	id = "dali/wuliang/lsdui",
	name = "��ʯ��",
	ways = {
		["southwest"] = "dali/wuliang/xiaolu2",
	},
	objs = {
          ["˾����"] = "sikong xuan",
           },
}
Room {
	id = "dali/wuliang/midao1",
	name = "�ܵ�",
	ways = {
		["southdown"] = "dali/wuliang/midao2",
	},
}
Room {
	id = "dali/wuliang/midao2",
	name = "�ܵ�",
	ways = {
		["northup"] = "dali/wuliang/midao1",
		["south"] = "dali/wuliang/midao3",
	},
}
Room {
	id = "dali/wuliang/midao3",
	name = "�ܵ�",
	ways = {
		["east"] = "dali/wuliang/midao4",
		["north"] = "dali/wuliang/midao2",
	},
}
Room {
	id = "dali/wuliang/midao4",
	name = "�ܵ�",
	ways = {
		["southdown"] = "dali/wuliang/midao5",
		["west"] = "dali/wuliang/midao3",
	},
}
Room {
	id = "dali/wuliang/midao5",
	name = "�ܵ�",
	ways = {
		["northup"] = "dali/wuliang/midao4",
		["out"] = "dali/shanlu3",
	},
}
Room {
	id = "dali/wuliang/muwu1",
	name = "�յ�",
	ways = {
		["north"] = "dali/wuliang/muwu2",
	},
}
Room {
	id = "dali/wuliang/muwu2",
	name = "ʯ��",
	ways = {
		["south"] = "dali/wuliang/muwu1",
	},
}
Room {
	id = "dali/wuliang/nanhubian",
	name = "�Ϻ���",
	ways = {
		["northwest"] = "dali/wuliang/beihubian",
		["north"] = "dali/wuliang/shulin3",
		["northeast"] = "dali/wuliang/xihubian",
	},
}
Room {
	id = "dali/wuliang/pubu",
	name = "���ٲ�",
	ways = {
		["southeast"] = "dali/wuliang/shanya",
		["west;south"] = "dali/wuliang/houyuan",
	},
	blocks = {
	    ["southeast"] = {
			{id = "ge guangpei", exp = 400000},
			{id = "gan guanghao", exp = 400000},
		},
	},
}
Room {
	id = "dali/wuliang/shanlin-1",
	name = "ʯ��",
	ways = {
		["east"] = "dali/wuliang/shanlin-2",
		["west"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlin-2",
	name = "ɽ��",
	ways = {
		["eastup"] = "dali/wuliang/shanlin-3",
		["west"] = "dali/wuliang/shanlin-1",
	},
}
Room {
	id = "dali/wuliang/shanlin-3",
	name = "ɭ��",
	ways = {
		["westdown"] = "dali/wuliang/shanlin-2",
		["north"] = "dali/wuliang/shanlin-4",
	},
}
Room {
	id = "dali/wuliang/shanlin-4",
	name = "ɭ��",
	ways = {
		["south"] = "dali/wuliang/shanlin-3",
		["west"] = "dali/wuliang/shanlin-5",
	},
}
Room {
	id = "dali/wuliang/shanlin-5",
	name = "ɭ��",
	ways = {
		["north"] = "dali/wuliang/shanlin-6",
		["east"] = "dali/wuliang/shanlin-4",
	},
}
Room {
	id = "dali/wuliang/shanlin-6",
	name = "ɭ��",
	ways = {
		["south"] = "dali/wuliang/shanlin-5",
	},
}
Room {
	id = "dali/wuliang/shanlu8",
	name = "������",
	ways = {
		["west"] = "dali/wuliang/shanlu8",
		["east"] = "dali/wuliang/anbian1",
		["south"] = "dali/wuliang/xiaoxi",
		["north"] = "dali/wuliang/shanlu9",
	},
}
Room {
	id = "dali/wuliang/shanlu9",
	name = "������",
	ways = {
		["west"] = "dali/wuliang/shanlu10",
		["east"] = "dali/wuliang/shanlu10",
		["south"] = "dali/wuliang/shanlu8",
		["north"] = "dali/wuliang/shanlu10",
	},
}
Room {
	id = "dali/wuliang/shanlu10",
	name = "������",
	ways = {
		["west"] = "dali/wuliang/shanlu13",
		["east"] = "dali/wuliang/shanlu14",
		["south"] = "dali/wuliang/shanlu9",
		["north"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlu11",
	name = "ɽ·",
	ways = {
		["#outJjl"] = "dali/wuliang/xiaoxi",
	},
	nolooks = {
		["#outJjl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#outJjl"] = 500,
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shanlu12",
	name = "������",
	ways = {
		["west"] = "dali/wuliang/shanlu14",
		["east"] = "dali/wuliang/shanlu13",
		["south"] = "dali/wuliang/shanlu12",
		["north"] = "dali/wuliang/shanlu11",
	},
}
Room {
	id = "dali/wuliang/shanlu13",
	name = "б��",
	ways = {
		["south"] = "dali/wuliang/shanlu10",
		["north"] = "dali/wuliang/shanlu10",
		["west"] = "dali/wuliang/shanlu9",
		["east"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlu14",
	name = "б��",
	ways = {
		["south"] = "dali/wuliang/shanlu10",
		["north"] = "dali/wuliang/shanlu10",
		["west"] = "dali/wuliang/shanlu12",
		["east"] = "dali/wuliang/shanlu9",
	},
}
Room {
	id = "dali/wuliang/shanlu5",
	name = "����ɽ·",
	ways = {
		["eastup"] = "dali/wuliang/xiaolu1",
		["northdown"] = "dali/wuliang/xiaoxi",
	},
}
Room {
	id = "dali/wuliang/shanya",
	name = "������",
	ways = {
		["northwest"] = "dali/wuliang/pubu",
		["jump down"] = "dali/wuliang/banshan1",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shibi",
	name = "ʯ����",
	ways = {
		["out"] = "dali/wuliang/shuhou",
		["si teng;huang dashi left;huang dashi left;tui dashi right;tui dashi right;enter"] = "dali/wuliang/dongkou",
	},
}
Room {
	id = "dali/wuliang/shuhou",
	name = "���Ժ�",
	ways = {
		["out"] = "dali/wuliang/shulin1",
		["si teng"] = "dali/wuliang/shibi",
	},
}
Room {
	id = "dali/wuliang/shulin1",
	name = "ɽ������",
	ways = {
		["south"] = "dali/wuliang/donghubian",
		["enter"] = "dali/wuliang/shuhou",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin2",
	name = "ɽ������",
	ways = {
		["south"] = "dali/wuliang/xihubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin3",
	name = "ɽ������",
	ways = {
		["south"] = "dali/wuliang/nanhubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin4",
	name = "ɽ������",
	ways = {
		["south"] = "dali/wuliang/beihubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/songlin1",
	name = "������",
	ways = {
		--["south"] = "dali/wuliang/houyuan",
		--["east"] = "dali/wuliang/pubu",
		["#songlinIn"] = "dali/wuliang/pubu",
		["#songlinOut"] = "dali/wuliang/houyuan",
	},
	lengths = {
	    ["#songlinIn"] = 100 ,
		["#songlinOut"] = 10 ,
	},
}
Room {
	id = "dali/wuliang/taijie",
	name = "̨��",
	ways = {
		["down"] = "dali/wuliang/dong1",
		["out"] = "dali/wuliang/jiangpan",
	},
}
Room {
	id = "dali/wuliang/tiesuo",
	name = "������",
	ways = {
		["south"] = "dali/wuliang/jiangan",
		["north"] = "dali/wuliang/hslin",
	},
}
Room {
	id = "dali/wuliang/wlj",
	name = "ʯ��·",
	ways = {
		["north"] = "dali/wuliang/jhg",
		["east"] = "dali/wuliang/dting",
		["west"] = "dali/wuliang/xting",
		["out"] = "dali/wuliang/wljmen",
	},
	blocks = {
		["north"] = {
			{id = "rong ziju", exp = 350000},
		},
		["east"] = {
			{id = "rong ziju", exp = 350000},
		},
		["west"] = {
			{id = "rong ziju", exp = 350000},
		},
	},
	objs = {
          ["���Ӿ�"] = "rong ziju",
           },
}
Room {
	id = "dali/wuliang/wljmen",
	name = "��������",
	ways = {
		["enter"] = "dali/wuliang/wlj",
		["southdown"] = "dali/wuliang/xiaolu5",
	},
	blocks = {
		["enter"] = {
			{id = "yu guangbiao", exp = 200000},
			{id = "wu guangsheng", exp = 200000},
		},
	},
	objs = {
          ["�����"] = "yu guangbiao",
          ["���ʤ"] = "wu guangsheng",
           },
}
Room {
	id = "dali/wuliang/xiangfang",
	name = "�᷿",
	ways = {
		["west"] = "dali/wuliang/keting",
	},
	objs = {
          ["�ʱ���"] = "gan baobao",
           },
}
Room {
	id = "dali/wuliang/xiaojing",
	name = "����С��",
	ways = {
		["south"] = "dali/wuliang/guzhong",
		["north"] = "dali/wuliang/caodi",
	},
}
Room {
	id = "dali/wuliang/xiaolu1",
	name = "��ʯС·",
	ways = {
		["eastup"] = "dali/wuliang/xiaolu2",
		["westdown"] = "dali/wuliang/shanlu5",
	},
}
Room {
	id = "dali/wuliang/xiaolu2",
	name = "��ʯС·",
	ways = {
		["northup"] = "dali/wuliang/xiaolu3",
		["westdown"] = "dali/wuliang/xiaolu1",
		["northeast"] = "dali/wuliang/lsdui",
	},
}
Room {
	id = "dali/wuliang/xiaolu3",
	name = "��ʯС·",
	ways = {
		["northup"] = "dali/wuliang/xiaolu4",
		["southdown"] = "dali/wuliang/xiaolu2",
	},
}
Room {
	id = "dali/wuliang/xiaolu4",
	name = "��ʯ̨��",
	ways = {
		["westup"] = "dali/wuliang/xiaolu5",
		["southdown"] = "dali/wuliang/xiaolu3",
	},
}
Room {
	id = "dali/wuliang/xiaolu5",
	name = "��ʯ̨��",
	ways = {
		["northup"] = "dali/wuliang/wljmen",
		["eastdown"] = "dali/wuliang/xiaolu4",
	},
}
Room {
	id = "dali/wuliang/xiaoting",
	name = "С��",
	ways = {
		["east"] = "dali/wuliang/guzhong",
	},
	objs = {
          ["����"] = "zhong ling",
           },
}
Room {
	id = "dali/wuliang/xiaoxi",
	name = "ɽ��СϪ",
	ways = {
		["southup"] = "dali/wuliang/shanlu5",
		["southwest"] = "dali/shanlu3",
		["north"] = "dali/wuliang/shanlu8",
	},
}
Room {
	id = "dali/wuliang/xihubian",
	name = "������",
	ways = {
		["southwest"] = "dali/wuliang/nanhubian",
		["north"] = "dali/wuliang/shulin2",
		["east"] = "dali/wuliang/donghubian",
	},
}
Room {
	id = "dali/wuliang/xlgong",
	name = "��������",
	ways = {
		["east"] = "dali/wuliang/jhg",
	},
}
Room {
	id = "dali/wuliang/xting",
	name = "����",
	ways = {
		["east"] = "dali/wuliang/wlj",
	},
}
Room {
	id = "dali/xijie1",
	name = "�����",
	ways = {
		["south"] = "dali/xijie2",
		["east"] = "dali/fengwei",
		["north"] = "dali/beijie1",
		["west"] = "dali/caifeng",
	},
	room_relative="����֣��÷��----�����----��ζС�Ե������������",
}
Room {
	id = "dali/xijie2",
	name = "�����",
	ways = {
		["south"] = "dali/xijie3",
		["north"] = "dali/xijie1",
		["west"] = "dali/xiulou",
	},
	room_relative="����֣���¥----����֣�����������",
}
Room {
	id = "dali/xijie3",
	name = "�����",
	ways = {
		["south"] = "dali/xijie4",
		["north"] = "dali/xijie2",
		["west"] = "dali/chouduan",
	},
	room_relative="����֣����ׯ----����֣�̫�����������",
}
Room {
	id = "dali/xijie4",
	name = "̫������",
	ways = {
		["south"] = "dali/xijie5",
		["north"] = "dali/xijie3",
		["west"] = "dali/ximen",
	},
}
Room {
	id = "dali/xijie5",
	name = "�����",
	ways = {
		["south"] = "dali/xijie6",
		["north"] = "dali/xijie4",
		["west"] = "dali/shanhou",
	},
	room_relative="̫�����֣��Ʋ��----����֣�����������",
}
Room {
	id = "dali/xijie6",
	name = "�����",
	ways = {
		["south"] = "dali/xijie7",
		["north"] = "dali/xijie5",
		["west"] = "dali/xiyuan",
	},
	room_relative="����֣�Ϸ԰��----����֣�����������",
}
Room {
	id = "dali/xijie7",
	name = "�����",
	ways = {
		["south"] = "dali/nanjie1",
		["north"] = "dali/xijie6",
		["west"] = "dali/yanzhi",
	},
	room_relative="����֣�������----����֣��ϴ�������",
}
Room {
	id = "dali/ximen",
	name = "����",
	no_fight = true,
	ways = {
		["westup"] = "tls/diancang",
		["east"] = "dali/xijie4",
	},
	objs = {
          ["�쵤��"] = "zhu danchen",
          },
}
Room {
	id = "dali/xiulou",
	name = "��¥",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie2",
	},
}
Room {
	id = "dali/xiyuan",
	name = "Ϸ԰��",
	ways = {
		["east"] = "dali/xijie6",
	},
}
Room {
	id = "dali/yamen",
	name = "����ǰ��",
	ways = {
		["south"] = "dali/beijie1",
		["east"] = "dali/situ",
		["north"] = "dali/sikong",
		["west"] = "dali/sima",
	},
	blocks = {
		["north"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000, party = "������"},
		},
		["east"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000},
		},
		["west"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000, party = "������"},
		},
	},
}
Room {
	id = "dali/yanju",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "dali/beijie5",
	},
}
Room {
	id = "dali/yanzhi",
	name = "������",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie7",
	},
}
Room {
	id = "dali/yaopu",
	name = "ҩ��",
	no_fight = true,
	ways = {
		["west"] = "dali/dongjie2",
	},
}
Room {
	id = "dali/yideng/anbian",
	name = "����",
	ways = {
		["enter"] = "dali/yideng/shandong",
	    ["#jiaoZi"] = "dali/yideng/shanding",
	},
	lengths = {
	    ["#jiaoZi"] = 10,
	},
}
Room {
	id = "dali/yideng/caowu",
	name = "é��",
	ways = {
		["east"] = "dali/yideng/pubu",
		["enter tongdao"] = "dali/yideng/hetang",
	},
	lengths = {
	    ["enter tongdao"] = "if score.master and score.master == 'һ�ƴ�ʦ' then return 10 else return false end",
	},
}
Room {
	id = "dali/yideng/chufang",
	name = "ի��",
	ways = {
		["east"] = "dali/yideng/houyuan",
	},
}
Room {
	id = "dali/yideng/dadian",
	name = "��Ժ���",
	ways = {
		["south"] = "dali/yideng/shiqiao",
		["north"] = "dali/yideng/houyuan",
		["east"] = "dali/yideng/dfang",
	},
}
Room {
	id = "dali/yideng/dfang",
	name = "���᷿",
	ways = {
		["west"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/fanpu",
	name = "С����",

	ways = {
		["southwest"] = "dali/yideng/xiaolu1",
		["east"] = "group/entry/dlstulin",
	},
}
Room {
	id = "dali/yideng/hetang",
	name = "����",
	ways = {
		["south"] = "dali/yideng/liang",
		["north"] = "dali/yideng/shiqiao",
		["enter tongdao"] = "dali/yideng/caowu",
	},
	lengths = {
		["enter tongdao"] = 10,
	},
}
Room {
	id = "dali/yideng/houyuan",
	name = "��Ժ��Ժ",
	ways = {
		["south"] = "dali/yideng/dadian",
		["northwest"] = "dali/yideng/xiaojing1",
		["east"] = "dali/yideng/liangong",
		["west"] = "dali/yideng/chufang",
	},
}
Room {
	id = "dali/yideng/liang",
	name = "ʯ����ͷ",
	ways = {
		["#duZi"] = "dali/yideng/hetang",
	},
	lengths = {
	    ["#duZi"] = 10,
	},
}
Room {
	id = "dali/yideng/liangong",
	name = "������",
	ways = {
		["west"] = "dali/yideng/houyuan",
	},
}
Room {
	id = "dali/yideng/pubu",
	name = "ɽ���ٲ�",
	ways = {
		["north"] = "dali/yideng/xiaolu2",
		["west"] = "dali/yideng/caowu",
		["#yuRen"] = "dali/yideng/shandong",
	},
	lengths = {
	    ["#yuRen"] = "if not skills['dodge'] or skills['dodge'].lvl<200 or job.name=='tdh' then return false else return 10 end",
	},
}
Room {
	id = "dali/yideng/shanding",
	name = "ɽ��",
	ways = {
		["eastup"] = "dali/yideng/shanpo",
	},
}
Room {
	id = "dali/yideng/shandong",
	name = "ɽ��",
	ways = {
		["out"] = "dali/yideng/anbian",
	},
}
Room {
	id = "dali/yideng/shanpo",
	name = "ɽ��",
	nofind = true,
	ways = {
		["westdown"] = "dali/yideng/shanding",
		["#nongFu"] = "dali/yideng/shiliang",
	},
	lengths = {
	    ["#nongFu"] = 10,
	},
	objs = {
	    ["ũ��"] = "nong fu",
	},
}
Room {
	id = "dali/yideng/shiliang",
	name = "ʯ��",
	ways = {
		["west"] = "dali/yideng/shanpo",
		["#liangFront"] = "dali/yideng/liang1",
	},
}
Room {
	id = "dali/yideng/liang1",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/shiliang",
		["#liangFront"] = "dali/yideng/liang2",
	},
}
Room {
	id = "dali/yideng/liang2",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang1",
		["#liangFront"] = "dali/yideng/liang3",
	},
}
Room {
	id = "dali/yideng/liang3",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang2",
		["#liangFront"] = "dali/yideng/liang4",
	},
}
Room {
	id = "dali/yideng/liang4",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang3",
		["#liangFront"] = "dali/yideng/liang5",
	},
}
Room {
	id = "dali/yideng/liang5",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang4",
		["#liangFront"] = "dali/yideng/liang6",
	},
}
Room {

	id = "dali/yideng/liang6",
	name = "ʯ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang5",
		["#liangFront"] = "dali/yideng/liang",
	},
}
Room {
	id = "dali/yideng/shiqiao",
	name = "Сʯ��",
	ways = {
		["south"] = "dali/yideng/hetang",
		["north"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/shiwu",
	name = "ʯ������",
	ways = {
		["south"] = "dali/yideng/zhulin",
		["east"] = "dali/yideng/xiangfang",
	},
	objs = {
	    ["һ�ƴ�ʦ"] = "yideng dashi",
	},
}
Room {
	id = "dali/yideng/xfang",
	name = "���᷿",
	ways = {
		["east"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/xiangfang",
	name = "ʯ���᷿",
	ways = {
		["west"] = "dali/yideng/shiwu",
	},
}
Room {
	id = "dali/yideng/xiaojing1",
	name = "��ʯС��",
	ways = {
		["southeast"] = "dali/yideng/houyuan",
		["northeast"] = "dali/yideng/xiaojing2",
	},
}
Room {
	id = "dali/yideng/xiaojing2",
	name = "��ʯС��",
	ways = {
		["southwest"] = "dali/yideng/xiaojing1",
		["west"] = "dali/yideng/xiaojing3",
	},

}
Room {
	id = "dali/yideng/xiaojing3",
	name = "��ʯС��",
	ways = {
		["east"] = "dali/yideng/xiaojing2",
		["west"] = "dali/yideng/zhulin",
	},
}
Room {
	id = "dali/yideng/xiaolu1",
	name = "ɽ��С·",
	ways = {
		["southwest"] = "dali/yideng/xiaolu2",
		["northeast"] = "dali/yideng/fanpu",
	},
}
Room {
	id = "dali/yideng/xiaolu2",
	name = "��·����",
	ways = {
		["south"] = "dali/yideng/pubu",
		["northeast"] = "dali/yideng/xiaolu1",
	},
}
Room {
	id = "dali/yideng/zhulin",
	name = "����",
	ways = {
		["east"] = "dali/yideng/xiaojing3",
		["north"] = "dali/yideng/shiwu",
	},
}
Room {
	id = "dali/yizhan",
	name = "��վ",
	no_fight = true,
	ways = {
		["west"] = "dali/qsjie2",
	},
	objs = {
          ["������"] = "zhu wanli",
          },
}
Room {
	id = "dali/yuxu/guanmen",
	name = "�������",
	ways = {
		["enter"] = "dali/yuxu/yuxuguan",
		["east"] = "group/entry/dlndao5",
	},
}
Room {
	id = "dali/yuxu/shangang",
	name = "ɽ��",
	ways = {
		["northwest"] = "group/entry/dlndao5",
		["east"] = "dali/yuxu/xiaodao2",
	},
	objs = {
          ["���ϴ��"] = "lingnan dadao",
      },
}
Room {
	id = "dali/yuxu/shufang1",
	name = "�鷿",
	ways = {
		["east"] = "dali/yuxu/yuxuguan",
	},
}
Room {
	id = "dali/yuxu/shuifang",
	name = "˯��",
	ways = {
		["west"] = "dali/yuxu/yuxuguan",
	},
}
Room {
	id = "dali/yuxu/xiaodao1",
	name = "������Ұ",
	ways = {
		["northeast"] = "dali/dadao1",
		["west"] = "dali/yuxu/xiaodao2",
	},
}
Room {
	id = "dali/yuxu/xiaodao2",
	name = "������Ұ",
	ways = {
		["east"] = "dali/yuxu/xiaodao1",
		["west"] = "dali/yuxu/shangang",
	},
}
Room {
	id = "dali/yuxu/yuxuguan",
	name = "�����",
	ways = {
		["east"] = "dali/yuxu/shuifang",
		["west"] = "dali/yuxu/shufang1",
		["out"] = "dali/yuxu/guanmen",
	},
	objs = {
          ["����ɢ��"] = "yuxu sanren",
      },
}
Room {
	id = "dali/zahuopu",
	name = "�ӻ���",
	ways = {
		["north"] = "dali/nanjie5",
	},
	objs = {
          ["���ϰ�"] = "zhao laoban",
          },
}
Room {
	id = "death/gate",
	name = "���Ź�",
	ways = {
		["enter"] = "death/gateway",
	},
}
Room {
	id = "death/gateway",
	name = "���޴��",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "death/mpting",
	name = "����ͤ",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "death/pusadian",
	name = "�ز���������",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "emei/bailongdong",
	name = "������",
	ways = {
		["northup"] = "emei/wannianan",
		["southeast"] = "emei/qingyinge",
		["west"] = "emei/gudelin",
	},
}
Room {
	id = "emei/baoguosi",
	name = "������",
	ways = {
		["southwest"] = "emei/milin",
		["enter"] = "emei/daxiongdian",
		["east"] = "emei/baoguosm",
		["west"] = "emei/baoguosixq",
	},
}
Room {
	id = "emei/baoguosicf",
	name = "����������",
	ways = {
		["east"] = "emei/daxiongdian",
	},
}
Room {
	id = "emei/baoguosixq",
	name = "��������ǽ",
	ways = {
		["east"] = "emei/baoguosi",
	},
}
Room {
	id = "emei/baoguosm",
	name = "������ɽ��",
	ways = {
		["northdown"] = "emei/qingshijie",
		["west"] = "emei/baoguosi",
	},
}
Room {
	id = "emei/basipan1",
	name = "��ʮ����",
	ways = {
		["southwest"] = "emei/basipan2",
		["northwest"] = "emei/lengshanlin",
		["northdown"] = "emei/leidongping",
	},
	room_relative="��ɼ���׶�ƺ�I����ʮ���̨L��ʮ���̰�ʮ����",
}
Room {
	id = "emei/basipan2",
	name = "��ʮ����",
	ways = {
		["southup"] = "emei/basipan3",
		["southeast"] = "emei/lengshanlin1",
		["northeast"] = "emei/basipan1",
	},
	room_relative="��ʮ���̨J��ʮ���̡��K��ʮ������ɼ�ְ�ʮ����",
}
Room {
	id = "emei/basipan3",
	name = "��ʮ����",
	ways = {
		["southeast"] = "emei/jieyindian",
		["northwest"] = "emei/lengshanlin2",
		["northdown"] = "emei/basipan2",
	},
	room_relative="��ɼ�ְ�ʮ���̨I����ʮ���̨K�������ʮ����",
}
Room {
	id = "emei/cangjinglou",
	name = "�ؾ�¥",
	ways = {
		["out"] = "emei/daxiongdian",
	},
}
Room {
	id = "emei/caodi",
	name = "�ݵ�",
	ways = {
		["southwest"] = "emei/xiaojing",
		["east"] = "emei/xiaowu",
		["north"] = "emei/mu",
		["northeast"] = "emei/xiaojing2",
	},
}
Room {
	id = "emei/caopeng",
	name = "����",
	ways = {
		["east"] = "emei/qingshijie",
	},
}
Room {
	id = "emei/chanfang",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "emei/lingwenge",
	},
}
Room {
	id = "emei/chanfang2",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "emei/qianfoandd",
	},
}
Room {
	id = "emei/chanfang3",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "emei/wanniananzd",
	},
	nolooks = {
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
}
Room {
	id = "emei/chunyangdian",
	name = "������",
	ways = {
		["eastdown"] = "emei/guiyunge",
		["westup"] = "emei/shenshuian",
	},
	objs = {
          ["������"] = "ding minjun",
           },
}
Room {
	id = "emei/chuwujian",
	name = "�����",
	ways = {
		["north"] = "emei/huazanganzt",
		["up"] = "emei/huazangancj",
	},
	objs = {
          ["����ʦ̫"] = "jingfeng shitai",
           },
	blocks = {
		["up"] = {
			{id = "jingfeng shitai", exp = 2000000},
		},
	},	
}
Room {
	id = "emei/daxiong",
	name = "�����ִ��۱���",
	ways = {
		["south"] = "emei/houdian",
		["east"] = "emei/huazanganzt",
		["northdown"] = "emei/huazangangc",
		["west"] = "emei/huazangancf",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open door",
	},
}
Room {
	id = "emei/daxiongdian",
	name = "���۵�",
	ways = {
		["enter"] = "emei/cangjinglou",
		["east"] = "emei/xiuxishi2",
		["west"] = "emei/baoguosicf",
		["out"] = "emei/baoguosi",
	},
}
Room {
	id = "emei/dcedian",
	name = "�����",
	ways = {
		["west"] = "emei/huazanganzd",
	},
	objs = {
          ["����Сʦ̫"] = "wen hui",
          ["����ʦ̫"] = "jinghe shitai",
           },
}
Room {
	id = "emei/dcelang",
	name = "������",
	ways = {
		["south"] = "emei/huazanganzt",
		["west"] = "emei/huazangangc",
	},
}
Room {
	id = "emei/dongkou",
	name = "���϶���",
	ways = {
		["enter"] = "emei/jiulaodong1",
		["out"] = "emei/jiulaodong",
	},
}
Room {
	id = "emei/duguangtai",
	name = "�ù�̨",
	ways = {
		["north"] = "emei/huazangan",
		["northdown"] = "emei/woyunan",
		["west"] = "emei/sheshenya",
	},
	objs = {
          ["������"] = "bei jinyi",
           },
}
Room {
	id = "emei/fuhusi",
	name = "������",
	ways = {
		["westup"] = "emei/milin2",
		["east"] = "emei/milin",
	},
}
Room {
	id = "emei/fushouan",
	name = "������",
	ways = {
		["enter"] = "emei/lingwenge",
		["north"] = "emei/shenshuian",
	},
}
Room {
	id = "emei/fushouanxxs",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["southdown"] = "emei/fushouanzt",
	},
}
Room {
	id = "emei/fushouanzt",
	name = "������ի��",
	ways = {
		["east"] = "emei/lingwenge",
	},
	nolooks = {
		["northup"] = true,
	},
}
Room {
	id = "emei/guanyinqiao",
	name = "������",
	ways = {
		["east"] = "emei/jietuopo",
		["west"] = "emei/guanyintang",
	},
}
Room {
	id = "emei/guanyintang",
	name = "������",
	ways = {
		["westup"] = "emei/guiyunge",
		["east"] = "emei/guanyinqiao",
	},
}
Room {
	id = "emei/gudelin",
	name = "�ŵ���",
	ways = {
		["south"] = "emei/gudelin",
		["north"] = "emei/gudelin2",
		["east"] = "emei/gudelin",
		["west"] = "emei/gudelin",
	},
}
Room {
	id = "emei/gudelin2",
	name = "�ŵ���",
	ways = {
		["south"] = "emei/gudelin3",
		["north"] = "emei/gudelin2",
		["east"] = "emei/gudelin2",
		["west"] = "emei/gudelin2",
	},
}
Room {
	id = "emei/gudelin3",
	name = "�ŵ���",
	ways = {
		["south"] = "emei/bailongdong",
		["north"] = "emei/gudelin3",
		["east"] = "emei/gudelin3",
		["west"] = "emei/gudelin3",
		["jump zhuang"] = "emei/muzhuang",
	},
	nolooks = {
		["jump zhuang"] = true,
	},
}
Room {
	id = "emei/guiyunge",
	name = "���Ƹ�",
	ways = {
		["southup"] = "emei/yunvfeng",
		["eastdown"] = "emei/guanyintang",
		["westup"] = "emei/chunyangdian",
	},
}
Room {
	id = "emei/heilongjiangzd",
	name = "������ջ��",
	ways = {
		["south"] = "emei/heilongjiangzd2",
		["northeast"] = "emei/qingyinge",
	},
}
Room {
	id = "emei/heilongjiangzd2",
	name = "������ջ��",
	ways = {
		["south"] = "emei/qianfoan",
		["north"] = "emei/heilongjiangzd",
	},
}
Room {
	id = "emei/houdian",
	name = "���",
	ways = {
		["north"] = "emei/daxiong",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["���ʦ̫"] = "miejue shitai",
           },
}
Room {
	id = "emei/houshan",
	name = "��ɽ",
	ways = {
		["southup"] = "emei/houshanxl2",
		["east"] = "emei/houshansl",
		["northeast"] = "emei/houshanty",
	},
}
Room {
	id = "emei/houshandk",
	name = "����",
	ways = {
		["enter"] = "emei/houshansd",
	},
}
Room {
	id = "emei/houshangm",
	name = "��ľ��",
	ways = {
	    ["#outemgmc"] = "emei/houshangm1",
	    ["eastdown"] = "emei/houshangm",
		["westup"] = "emei/houshangm",
		["southwest"] = "emei/houshangm",
		["northeast"] = "emei/houshangm",
	},
	nolooks = {
		["#outemgmc"] = true,
	},
	room_relative="��ľ�ԨJ��ľ�ԡ���ľ�ԡ���ľ�ԨL��ľ�Թ�ľ��",
}
Room {
	id = "emei/houshangm1",
	name = "��ľ��",
	ways = {
		["westup"] = "emei/houshangm",
        ["yue qiaobi"] = "emei/houshandk",  
	},
	nolooks = {
		["yue qiaobi"] = true,
	},
	room_relative="��ľ�ԡ���ľ�Թ�ľ��",
}
Room {
	id = "emei/houshansd",
	name = "ɽ��",
	ways = {
		["eastdown"] = "emei/qingyinge",
		["out"] = "emei/houshandk",
	},
	objs = {
          ["�º���"] = "guhong zi",

    },
}
Room {
	id = "emei/shuitan",
	name = "ˮ̶",
	ways = {
		["#emeishuitan"] = "emei/qingyinge",
	},
	nolooks = {
		["#emeishuitan"] = true,
	},
}
Room {
	id = "emei/houshansl",
	name = "��ɽ����",
	ways = {
		["northdown"] = "emei/houshanxl3",
		["west"] = "emei/houshan",
	},
}
Room {
	id = "emei/houshanty",
	name = "̿Ҥ",
	ways = {
		["southwest"] = "emei/houshan",
	},
}
Room {
	id = "emei/houshanxl",
	name = "��ɽС·",
	ways = {
		["northeast"] = "emei/houshanxl2",
	},
}
Room {
	id = "emei/houshanxl2",
	name = "��ɽС·",
	ways = {
		["southwest"] = "emei/houshanxl",
		["northdown"] = "emei/houshan",
	},
}
Room {
	id = "emei/houshanxl3",
	name = "��ɽС·",
	ways = {
		["southup"] = "emei/houshansl",
		["northdown"] = "emei/houshanxl4",
        ["#Toghz"] = "emei/houshangm"
	},
	nolooks = {
		["#Toghz"] = true,
	},
	lengths = {
		["#Toghz"] = 30,
	},
}
Room {
	id = "emei/houshanxl4",
	name = "��ɽС·",
	ways = {
		["southup"] = "emei/houshanxl3",
		["move stone;nd"] = "emei/qingyinge",
	},
	--nolooks = {
	--	["#hsToQyg"] = true,
	--	["northdown"] = true,
	--},
	--lengths = {
	--	["#hsToQyg"] = 50,
	--},
}
Room {
	id = "emei/huayanding",
	name = "���϶�",
	ways = {
		["eastup"] = "emei/xianfengsi",
		["westup"] = "emei/lianhuashi",
		["down"] = "emei/shierpan4",
		["north"] = "emei/maji",
	},
}
Room {
	id = "emei/huazangan",
	name = "������",
	ways = {
		["south"] = "emei/duguangtai",
		["enter"] = "emei/huazanganzd",
		["northdown"] = "emei/jinding",
	},
}
Room {
	id = "emei/huazangancf",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "emei/xiuxishi",
		["north"] = "emei/xcelang",
		["east"] = "emei/daxiong",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["south"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	precmds = {
		["south"] = "open door",
	},
}
Room {
	id = "emei/huazangancj",
	name = "�ؾ�¥",
	ways = {
		["down"] = "emei/chuwujian",
	},
	objs = {
          ["������;�"] = "shu",
          ["����ʦ̫"] = "jingdao shitai",
          ["��Ⱦ�"] = "shu",
           },
}
Room {
	id = "emei/huazangangc",
	name = "�����ֹ㳡",
	ways = {
		["southup"] = "emei/daxiong",
		["north"] = "emei/huazanganzd",
		["east"] = "emei/dcelang",
		["west"] = "emei/xcelang",
	},
	objs = {
          ["����ʦ̫"] = "jingxu shitai",
          ["�����Ե���±�"] = "board",
           },
}
Room {
	id = "emei/huazanganzd",
	name = "����������",
	ways = {
		["south"] = "emei/huazangangc",
		["east"] = "emei/dcedian",
		["west"] = "emei/xcedian",
		["out"] = "emei/huazangan",
	},
	objs = {
          ["����ʦ̫"] = "jingxin shitai",
           },
}
Room {
	id = "emei/huazanganzt",
	name = "ի��",
	ways = {
		["south"] = "emei/chuwujian",
		["north"] = "emei/dcelang",
		["west"] = "emei/daxiong",
	},
	objs = {
          ["��������"] = "liuli qiezi",
          ["��������"] = "mala doufu",
          ["��֭��ź"] = "mizhi tianou",
          ["��ˮ��«"] = "qingshui hulu",
           },
}
Room {
	id = "emei/jietuopo",
	name = "������",
	ways = {
		["eastdown"] = "emei/milin2",
		["west"] = "emei/guanyinqiao",
	},
}
Room {
	id = "emei/jieyindian",
	name = "������",
	ways = {
		["westup"] = "emei/wanxingan",
		["northwest"] = "emei/basipan3",
	},
}
Room {
	id = "emei/jinding",
	name = "��",
	ways = {
		["southup"] = "emei/huazangan",
		["southwest"] = "emei/woyunan",
		["northdown"] = "emei/wanxingan",
	},
}
Room {
	id = "emei/jiudaoguai1",
	name = "��ʮ�ŵ���",
	ways = {
		["westup"] = "emei/jiudaoguai2",
		["northeast"] = "emei/qianfoan",
	},
}
Room {
	id = "emei/jiudaoguai2",
	name = "��ʮ�ŵ���",
	ways = {
		["eastdown"] = "emei/jiudaoguai1",
		["southwest"] = "emei/jiudaoguai3",
	},
}
Room {
	id = "emei/jiudaoguai3",
	name = "��ʮ�ŵ���",
	ways = {
		["westup"] = "emei/jiudaoguai4",
		["northeast"] = "emei/jiudaoguai2",
	},
}
Room {
	id = "emei/jiudaoguai4",
	name = "��ʮ�ŵ���",
	ways = {
		["eastdown"] = "emei/jiudaoguai3",
		["southwest"] = "emei/jiulaodong",
	},
}
Room {
	id = "emei/jiulaodong",
	name = "���϶�",
	ways = {
		["northwest"] = "emei/lianhuashi",
		["enter"] = "emei/dongkou",
		["northeast"] = "emei/jiudaoguai4",
		["west"] = "emei/wanfoding",
	},
	room_relative="����ʯ���϶��ھ�ʮ�ŵ��ըI�ĨJ���----���϶����϶�",
}
Room {
	id = "emei/jiulaodong1",
	name = "���϶�",
	ways = {
		["drop fire;drop fire;drop fire;leave;leave;leave;leave"] = "emei/dongkou",
		["use fire;e;n;ne;nw;s;se;sw;w;out"] = "emei/shanpo",
	},
	lengths = {
		["use fire;e;n;ne;nw;s;se;sw;w;out"] = "if Bag['����'] then return 20 else return false end",
	},
	room_relative="���϶����϶�",
}
Room {
	id = "emei/leidongping",
	name = "�׶�ƺ",
	ways = {
		["southup"] = "emei/basipan1",
		["northdown"] = "emei/lingyunti",
	},
}
Room {
	id = "emei/lengshanlin",
	name = "��ɼ��",
	ways = {
		["southeast"] = "emei/basipan1",
		["southwest"] = "emei/lengshanlin",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/lengshanlin1",
	},
	room_relative="��ɼ����ɼ�֨I�J��ɼ�֨L�K��ɼ�ְ�ʮ������ɼ��",
}
Room {
	id = "emei/lengshanlin1",
	name = "��ɼ��",
	ways = {
		["southeast"] = "emei/lengshanlin1",
		["southwest"] = "emei/lengshanlin2",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/zhulin",
	},
	room_relative="��ɼ��С���֨I�J��ɼ�֨L�K��ɼ����ɼ����ɼ��",
}
Room {
	id = "emei/lengshanlin2",
	name = "��ɼ��",
	ways = {
		["southeast"] = "emei/basipan3",
		["southwest"] = "emei/lengshanlin2",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/lengshanlin",
	},
}
Room {
	id = "emei/lianhuashi",
	name = "����ʯ",
	ways = {
		["eastdown"] = "emei/huayanding",
		["southeast"] = "emei/jiulaodong",
		["westup"] = "emei/zuantianpo",
	},
	objs = {
          ["������"] = "zhao lingzhu",
          ["������"] = "su mengqing",
           },
}
Room {
	id = "emei/lingwenge",
	name = "���ĸ�",
	ways = {
		["east"] = "emei/chanfang",
		["west"] = "emei/fushouanzt",
		["out"] = "emei/fushouan",
	},
}
Room {
	id = "emei/lingyunti",
	name = "������",
	ways = {
		["southup"] = "emei/leidongping",
		["northdown;eastdown"] = "emei/zuantianpo2",
	},
}
Room {
	id = "emei/maji",
	name = "���",
	ways = {
		["south"] = "emei/huayanding",
		["move gancao;zuan dong"] = "emei/houshanxl",
	},
	nolooks = {
		["move gancao;zuan dong"] = true,
	},
	lengths = {
		["move gancao;zuan dong"] = 2,
	},
}
Room {
	id = "emei/milin",
	name = "����",
	ways = {
		["northeast"] = "emei/baoguosi",
		["west"] = "emei/fuhusi",
	},
}
Room {
	id = "emei/milin2",
	name = "����",
	ways = {
		["eastdown"] = "emei/fuhusi",
		["westup"] = "emei/jietuopo",
	},
}
Room {
	id = "emei/mu",
	name = "����֮Ĺ",
	ways = {
		["south"] = "emei/caodi",
		["east"] = "emei/xiaojing2",
	},
}
Room {
	id = "emei/mu2",
	name = "Ĺ��",
	ways = {
		["up"] = "emei/mu",
	},
}
Room {
	id = "emei/mupeng",
	name = "ľ��",
	ways = {
		["south"] = "emei/wanfoding",
	},
}
Room {
	id = "emei/muzhuang",
	name = "÷��׮",
	ways = {
		["down"] = "emei/gudelin3",
	},
}
Room {
	id = "emei/podao1",
	name = "�µ�",
	ways = {
		["westup"] = "emei/podao2",
		["east"] = "emei/lianhuashi",
	},
}
Room {
	id = "emei/podao2",
	name = "�µ�",
	ways = {
		["eastdown"] = "emei/podao1",
	},
}
Room {
	id = "emei/qianfoan",
	name = "ǧ����",
	ways = {
		["southwest"] = "emei/jiudaoguai1",
		["enter"] = "emei/qianfoandd",
		["north"] = "emei/heilongjiangzd2",
	},
}
Room {
	id = "emei/qianfoandd",
	name = "ǧ���ִ��",
	ways = {
		["east"] = "emei/chanfang2",
		["out"] = "emei/qianfoan",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
}
Room {
	id = "emei/qingshijie",
	name = "��ʯ��",
	ways = {
		["southup"] = "emei/baoguosm",
		["east"] = "chengdu/tulu1",
		["west"] = "emei/caopeng",
	},
}
Room {
	id = "emei/qingyinge",
	name = "������",
	ways = {
		["southeast"] = "emei/zhongfengsi",
		["southwest"] = "emei/heilongjiangzd",
		["northwest"] = "emei/bailongdong",
	},
	objs = {
          ["����ʦ̫"] = "jingxian shitai",
           },
}
Room {
	id = "emei/shangu",
	name = "ɽ��",
	ways = {
		["east"] = "emei/xiaojing",
	},
}
Room {
	id = "emei/shanpo",
	name = "ɽ��",
	ways = {
		["enter"] = "emei/jiulaodong1",
	},
	objs = {
        ["������"] = "zhou zhiruo",
    },
}
Room {
	id = "emei/shenshuian",
	name = "��ˮ��",
	ways = {
		["eastdown"] = "emei/chunyangdian",
		["westup"] = "emei/zhongfengsi",
		["south"] = "emei/fushouan",
	},
}
Room {
	id = "emei/sheshenya",
	name = "�ù�̨������",
	ways = {
		["east"] = "emei/duguangtai",
	},
}
Room {
	id = "emei/shierpan",
	name = "ʮ����",
	ways = {
		["eastdown"] = "emei/wannianan",
		["southwest"] = "emei/shierpan2",
	},
	room_relative="ʮ���̡������֨Lʮ����ʮ����",
}
Room {
	id = "emei/shierpan2",
	name = "ʮ����",
	ways = {
		["westup"] = "emei/shierpan3",
		["northeast"] = "emei/shierpan",
	},
	room_relative="ʮ���̨Jʮ���̡�ʮ����ʮ����",
}
Room {
	id = "emei/shierpan3",
	name = "ʮ����",
	ways = {
		["eastdown"] = "emei/shierpan2",
		["southwest"] = "emei/shierpan4",
	},
	room_relative="ʮ���̡�ʮ���̨Lʮ����ʮ����",
}
Room {
	id = "emei/shierpan4",
	name = "ʮ����",
	ways = {
		["northeast"] = "emei/shierpan3",
		["up"] = "emei/huayanding",
	},
	room_relative="���϶�ʮ���̡��Jʮ����ʮ����",
}
Room {
	id = "emei/shushang",
	name = "����",
	ways = {
		["down"] = "emei/jiudaoguai3",
	},
	blocks = {
		["down"] = {
			{id = "ju mang", exp = 0},
		},
	},	
}
Room {
	id = "emei/wanfoding",
	name = "���",
	ways = {
		["enter"] = "emei/wanfota",
		["north"] = "emei/mupeng",
		["west"] = "emei/jiulaodong",
	},
	lengths = {
		["enter"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	lengths = {
		["north"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
}
Room {
	id = "emei/wanfota",
	name = "�����",
	ways = {
		["out"] = "emei/wanfoding",
	},
}
Room {
	id = "emei/wannianan",
	name = "������",
	ways = {
		["westup"] = "emei/shierpan",
		["enter"] = "emei/wanniananzd",
		["southdown"] = "emei/bailongdong",
	},
}
Room {
	id = "emei/wanniananzd",
	name = "������ש��",
	ways = {
		["east"] = "emei/chanfang3",
		["out"] = "emei/wannianan",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
}
Room {
	id = "emei/wanxingan",
	name = "������",
	ways = {
		["southup"] = "emei/jinding",
		["eastdown"] = "emei/jieyindian",
	},
	objs = {
          ["����ʦ̫"] = "jingjia shitai",
           },
}
Room {
	id = "emei/woyunan",
	name = "������",
	ways = {
		["southup"] = "emei/duguangtai",
		["northeast"] = "emei/jinding",
	},
	objs = {
          ["����ʦ̫"] = "jingxuan shitai",
           },
}
Room {
	id = "emei/xcedian",
	name = "�����",
	ways = {
		["east"] = "emei/huazanganzd",
	},
	objs = {
          ["����Сʦ̫"] = "wen qing",
          ["����ʦ̫"] = "fengling shitai",
           },
}
Room {
	id = "emei/xcelang",
	name = "������",
	ways = {
		["south"] = "emei/huazangancf",
		["east"] = "emei/huazangangc",
	},
}
Room {
	id = "emei/xianfengsi",
	name = "�ɷ���",
	ways = {
		["westdown"] = "emei/huayanding",
	},
}
Room {
	id = "emei/xiaojing",
	name = "ɽ��С��",
	ways = {
		["northeast"] = "emei/caodi",
		["west"] = "emei/shangu",
	},
}
Room {
	id = "emei/xiaojing2",
	name = "С��",
	ways = {
		["southwest"] = "emei/caodi",
		["northdown"] = "emei/jiudaoguai3",
		["west"] = "emei/mu",
	},
}
Room {
	id = "emei/xiaowu",
	name = "С��",
	ways = {
		["west"] = "emei/caodi",
	},
}
Room {
	id = "emei/xiuxishi",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "emei/huazangancf",
	},
}
Room {
	id = "emei/xiuxishi2",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["west"] = "emei/daxiongdian",
	},
}
Room {
	id = "emei/yunvfeng",
	name = "��Ů��",
	ways = {
		["northdown"] = "emei/guiyunge",
	},
	objs = {
          ["������"] = "fang bilin",
           },
}
Room {
	id = "emei/zhongfengsi",
	name = "�з���",
	ways = {
		["eastdown"] = "emei/shenshuian",
		["northwest"] = "emei/qingyinge",
	},
}
Room {
	id = "emei/zhulin",
	name = "С����",
	ways = {
		["south"] = "emei/zhulin",
		["north"] = "emei/zhulin",
		["east"] = "emei/zhulin",
		["west"] = "emei/zhulin",
	},
}
Room {
	id = "emei/zuantianpo",
	name = "������",
	ways = {
		["eastdown"] = "emei/lianhuashi",
		["westup"] = "emei/zuantianpo2",
	},
	room_relative="�����¡������¡�����ʯ������",
}
Room {
	id = "emei/zuantianpo2",
	name = "������",
	ways = {
		["eastdown"] = "emei/zuantianpo",
		["westup;southup"] = "emei/lingyunti",
	},
	room_relative="ϴ��رߡ������¡�������������",
}
Room {
	id = "fairyland/conglin2",
	name = "ѩɽ����",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "fairyland/xuanya",
		["southdown"] = "group/entry/klclin1",
	},
}
Room {
	id = "fairyland/cuigu",
	name = "���츣��",
	ways = {
		["eastup"] = "fairyland/shanbi",
		["south"] = "fairyland/cuigu3",
		["north"] = "fairyland/shanlu5",
		["west"] = "fairyland/shanlu3",
	},
}
Room {
	id = "fairyland/cuigu1",
	name = "���",
	ways = {
		["south"] = "fairyland/shanlu6",
	},
}
Room {
	id = "fairyland/cuigu3",
	name = "���",
	ways = {
		["north"] = "fairyland/cuigu",
	},
}
Room {
	id = "fairyland/dapingtai",
	name = "��ƽ̨",
	ways = {
		["west"] = "fairyland/dashibi",
	},
}
Room {
	id = "fairyland/dashibi",
	name = "��ʯ��",
	ways = {
		["east"] = "fairyland/dapingtai",
	},
}
Room {
	id = "fairyland/dating",
	name = "����",
	ways = {
		["south"] = "fairyland/hmzhuang",
		["north"] = "fairyland/nuange",
		["east"] = "fairyland/houyuan",
	},
	objs = {
          ["�쳤��"] = "zhu changling",
     },
}
Room {
	id = "fairyland/hmzhuang",
	name = "��÷ɽׯ",
	ways = {
		["westdown"] = "fairyland/shanxi",
		["east"] = "fairyland/shanlu2",
		["north"] = "fairyland/dating",
	},
	objs = {
          ["�Ǹ�"] = "qiao fu",
     },
}
Room {
	id = "fairyland/houyuan",
	name = "��Ժ",
	ways = {
		["north"] = "fairyland/lggong",
		["west"] = "fairyland/dating",
	},
}
Room {
	id = "fairyland/lggong",
	name = "���Ṭ",
	ways = {
		["south"] = "fairyland/houyuan",
	},
	objs = {
          ["ƽ�ܽ���"] = "pingkou jiangjun",
          ["���ｫ��"] = "cheqi jiangjun",
          ["��������"] = "zhengdong jiangjun",
          ["�۳彫��"] = "zhechong jiangjun",
          ["����"] = "gou pu",
          ["�����"] = "zhu jiuzhen",
     },
	blocks={
	    ["south"] = {
			{id = "pingkou jiangjun", exp = 150000},
			{id = "cheqi jiangjun", exp = 150000},
			{id = "zhengdong jiangjun", exp = 150000},
			{id = "zhechong jiangjun", exp = 150000},
		},
	},
}
Room {
	id = "fairyland/nuange",
	name = "ů��",
	ways = {
		["south"] = "fairyland/dating",
	},
}
Room {
	id = "fairyland/pubu",
	name = "�ٲ�",
	ways = {
		["east"] = "fairyland/shanlu4",
		["southdown"] = "fairyland/tanbian",
	},
}
Room {
	id = "fairyland/shanbi",
	name = "ɽ��",
	ways = {
		["eastdown"] = "fairyland/shangou",
		["westdown"] = "fairyland/cuigu",
	},
}
Room {
	id = "fairyland/shangou",
	name = "ɽ��",
	ways = {
		["westup"] = "fairyland/shanbi",
	},
}
Room {
	id = "fairyland/shanlu1",
	name = "ɽ·",
	ways = {
		["east"] = "kunlun/klshanlu",
		["southdown"] = "fairyland/xuedi1",
		["west"] = "fairyland/shanlu2",
	},
}
Room {
	id = "fairyland/shanlu2",
	name = "ɽ·",
	ways = {
		["east"] = "fairyland/shanlu1",
		["west"] = "fairyland/hmzhuang",
	},
}
Room {
	id = "fairyland/shanlu3",
	name = "���",
	ways = {
		["east"] = "fairyland/cuigu",
		["west"] = "fairyland/shanlu4",
	},
}
Room {
	id = "fairyland/shanlu4",
	name = "���",
	ways = {
		["east"] = "fairyland/shanlu3",
		["west"] = "fairyland/pubu",
	},
}
Room {
	id = "fairyland/shanlu5",
	name = "���",
	ways = {
		["south"] = "fairyland/cuigu",
		["north"] = "fairyland/shanlu6",
	},
}
Room {
	id = "fairyland/shanlu6",
	name = "���",
	ways = {
		["south"] = "fairyland/shanlu5",
		["north"] = "fairyland/cuigu1",
	},
}
Room {
	id = "fairyland/shanxi",
	name = "ɽϪ��",
	ways = {
		["eastup"] = "fairyland/hmzhuang",
		["westup"] = "group/entry/klclin1",
	},
	nolooks = {
		["down"] = true,
	},
}
Room {
	id = "fairyland/tanbian",
	name = "���",
	no_fight = true,
	ways = {
		["northup"] = "fairyland/pubu",
	},
}
Room {
	id = "fairyland/xuanya",
	name = "����",
	ways = {
		["eastdown"] = "fairyland/conglin2",
	},
}
Room {
	id = "fairyland/xuedi",
	name = "ѩ��",
	ways = {
		["northeast"] = "fairyland/xuedi1",
	},
}
Room {
	id = "fairyland/xuedi1",
	name = "ѩ��",
	ways = {
		["northup"] = "fairyland/shanlu1",
		["southwest"] = "fairyland/xuedi",
	},
}
Room {
	id = "foshan/alleyway",
	name = "С��",
	ways = {
		["south"] = "foshan/zhongjia",
		["west"] = "foshan/nanjie2",
	},
}
Room {
	id = "foshan/beidimiao",
	name = "������",
	ways = {
		["south"] = "foshan/xijie2",
	},
	objs = {
          ["��һ��"] = "feng yiming",
      },
}
Room {
	id = "foshan/beijie",
	name = "��ɽ����",
	ways = {
		["south"] = "foshan/guangchang",
		["north"] = "foshan/beimen",
	},
}
Room {
	id = "foshan/beimen",
	name = "��ɽ����",
	ways = {
		["south"] = "foshan/beijie",
		["north"] = "foshan/lingnan",
	},
}
Room {
	id = "foshan/caidi",
	name = "�˵�",
	ways = {
		["west"] = "foshan/zhongjia",
	},
}
Room {
	id = "foshan/caomeidi",
	name = "��ݮ��",
	ways = {
		["south"] = "foshan/dukou_tanbao",
		["northeast"] = "foshan/shulin1",
		["west"] = "foshan/shulin2",
	},
}
Room {
	id = "foshan/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "foshan/dongjie3",
	},
	objs = {
          ["�ᳯ��"] = "yu chaofeng",
      },
}
Room {
	id = "foshan/dating",
	name = "�︮����",
	ways = {
		["south"] = "foshan/shufang",
		["west"] = "foshan/dayuan",
	},
	objs = {
          ["����ӯ"] = "gongsun ying",
          ["��ʦү"] = "he shiye",
      },
}
Room {
	id = "foshan/dayuan",
	name = "�︮��Ժ",
	ways = {
		["east"] = "foshan/dating",
		["west"] = "foshan/villa-gate",
	},
}
Room {
	id = "foshan/dongjie",
	name = "��ɽ����",
	ways = {
		["north"] = "foshan/grocer",
		["east"] = "foshan/dongjie2",
		["west"] = "foshan/guangchang",
	},
	room_relative="�ӻ������ɽ�㳡---��ɽ����---��ɽ���ַ�ɽ����",
}
Room {
	id = "foshan/dongjie2",
	name = "��ɽ����",
	ways = {
		["south"] = "foshan/ironsmith",
		["north"] = "foshan/shaobing",
		["east"] = "foshan/dongjie3",
		["west"] = "foshan/dongjie",
	},
	room_relative="�ձ�̯����ɽ����---��ɽ����---��ɽ���֣������̷�ɽ����",
}
Room {
	id = "foshan/dongjie3",
	name = "��ɽ����",
	ways = {
		["south"] = "foshan/dangpu",
		["east"] = "foshan/dongmen",
		["west"] = "foshan/dongjie2",
	},
	room_relative="��ɽ����---��ɽ����---��ɽ���ţ����̷�ɽ����",
}
Room {
	id = "foshan/dongmen",
	name = "��ɽ����",
	ways = {
		["east"] = "foshan/road8",
		["west"] = "foshan/dongjie3",
	},
}
Room {
	id = "foshan/duchang",
	name = "Ӣ�ۻ��",
	ways = {
		["north"] = "foshan/xijie",
	},
	objs = {
          ["������"] = "kuang baoguan",
      },
}
Room {
	id = "foshan/dukou",
	name = "�϶ɿ�",
	no_fight = true,
	ways = {
		["north"] = "foshan/shulin_dzd",
		["east"] = "foshan/haibing",
		["southwest"] = "foshan/dukou_tanbao",
	},
	lengths = {
		["southwest"] = "if false then return 1 else return false end",
	},
}

Room {
	id = "foshan/haibing",
	name = "����",
	ways = {
		["west"] = "foshan/dukou",
	},
}

Room {
	id = "foshan/dukou_tanbao",
	name = "�϶ɿ�",
	no_fight = true,
	ways = {
		["north"] = "foshan/caomeidi",
	},
}
Room {
	id = "foshan/fenchang",
	name = "�س�",
	ways = {
		["southwest"] = "foshan/xiaolu1",
	},
}
Room {
	id = "foshan/grocer",
	name = "�ӻ���",
	ways = {
		["south"] = "foshan/dongjie",
	},
	objs = {
          ["���ϰ�"] = "li",
      },
}
Room {
	id = "foshan/guangchang",
	name = "��ɽ�㳡",
	ways = {
		["south"] = "foshan/herohotel",
		["east"] = "foshan/dongjie",
		["north"] = "foshan/beijie",
		["west"] = "foshan/xijie",
	},
}
Room {
	id = "foshan/hanghai_room",
	name = "���Ϻ�̽������ֻ",
	ways = {
		["out"] = "foshan/dukou_tanbao",
	},
}
Room {
	id = "foshan/herohotel",
	name = "Ӣ��¥",
	ways = {
		["south"] = "foshan/nanjie",
		["north"] = "foshan/guangchang",
		["up"] = "foshan/herohotel2",
	},
	objs = {
          ["���ϰ�"] = "wan laoban",
      },
}
Room {
	id = "foshan/herohotel2",
	name = "Ӣ��¥��¥",
	ways = {
		["down"] = "foshan/herohotel",
	},
}
Room {
	id = "foshan/ironsmith",
	name = "������",
	ways = {
		["north"] = "foshan/dongjie2",
	},
	objs = {
          ["������"] = "shen tiejiang",
      },
}
Room {
	id = "foshan/kedian",
	name = "Ӣ�ۿ�ջ",
	no_fight = true,
	ways = {
		["east"] = "foshan/nanjie",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "foshan/kedian2",
	name = "��ջ��¥",
	ways = {
		["enter"] = "foshan/kedian3",
		["down"] = "foshan/kedian",
	},
}
Room {
	id = "foshan/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "foshan/kedian2",
	},
}
Room {
	id = "foshan/lingnan",
	name = "����",
	ways = {
		["south"] = "foshan/beimen",
		["north"] = "foshan/xiaolu1",
	},
}
Room {
	id = "foshan/milin",
	name = "����",
	ways = {
		["southwest"] = "foshan/xiaolu3",
	},
	blocks={
	    ["southwest"] = {
			{id = "ma zei", exp = 150000},
		},
	},
}
Room {
	id = "foshan/mishi",
	name = "����",
	ways = {
		["up"] = "foshan/shufang",
	},
}
Room {
	id = "foshan/nanjie",
	name = "��ɽ�Ͻ�",
	ways = {
		["south"] = "foshan/nanjie2",
		["east"] = "foshan/villa-gate",
		["north"] = "foshan/herohotel",
		["west"] = "foshan/kedian",
	},
	room_relative="Ӣ��¥��Ӣ�ۿ�ջ---��ɽ�Ͻ�---�︮���ţ���ɽ�Ͻַ�ɽ�Ͻ�",
}
Room {
	id = "foshan/nanjie2",
	name = "��ɽ�Ͻ�",
	ways = {
		["south"] = "foshan/nanmen",
		["north"] = "foshan/nanjie",
		["east"] = "foshan/alleyway",
		["west"] = "foshan/noshery",
	},
	room_relative="��ɽ�Ͻ֣�С�Ե�---��ɽ�Ͻ�---С������ŷ�ɽ�Ͻ�",
}
Room {
	id = "foshan/nanmen",
	name = "����",
	ways = {
		["south"] = "foshan/shulin1",
		["north"] = "foshan/nanjie2",
	},
}
Room {
	id = "foshan/noshery",
	name = "С�Ե�",
	ways = {
		["east"] = "foshan/nanjie2",
	},
	objs = {
          ["���ϰ�"] = "song",
      },
}
Room {
	id = "foshan/road1",
	name = "�ּ��",
	ways = {
		["east"] = "foshan/ximen",
		["west"] = "foshan/road2",
	},
	objs = {
          ["С��֦"] = "shu zhi",
      },
}
Room {
	id = "foshan/road10",
	name = "�ּ��",
	ways = {
		["southeast"] = "foshan/road12",
		["northeast"] = "foshan/road11",
		["west"] = "foshan/road9",
	},
	objs = {
          ["ޥ����"] = "huilan hua",
      },
}
Room {
	id = "foshan/road11",
	name = "�ּ��",
	ways = {
		["southwest"] = "foshan/road10",
		["northeast"] = "group/entry/fsroad13",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
          ["����"] = "tu fei",
      },
}
Room {
	id = "foshan/road12",
	name = "�ּ��",
	ways = {
		["northwest"] = "foshan/road10",
	},
}
Room {
	id = "foshan/road14",
	name = "�ּ��",
	ways = {
		["southwest"] = "group/entry/fsroad13",
		["north"] = "fuzhou/bridge",
	},
	objs = {
          ["ޥ����"] = "huilan hua",
      },
}
Room {
	id = "foshan/road2",
	name = "�ּ��",
	ways = {
		["east"] = "foshan/road1",
		["west"] = "foshan/road3",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
      },
}
Room {
	id = "foshan/road3",
	name = "�ּ��",
	ways = {
		["northwest"] = "foshan/road4",
		["east"] = "foshan/road2",
	},
}
Room {
	id = "foshan/road4",
	name = "�ּ��",
	ways = {
		["southeast"] = "foshan/road3",
		["southwest"] = "group/entry/fsroad5",
	},
}
Room {
	id = "foshan/road6",
	name = "�ּ��",
	ways = {
		["east"] = "group/entry/fsroad5",
		["west"] = "dali/dalisouth/jiangbei",
	},
	objs = {
          ["�۷�"] = "mi feng",
          ["�׺ϻ�"] = "baihe hua",
      },
}
Room {
	id = "foshan/road8",
	name = "�ּ��",
	ways = {
		["east"] = "foshan/road9",
		["west"] = "foshan/dongmen",
	},
	objs = {
          ["�ų���"] = "zhang chaotang",
          ["�ſ�"] = "zhang kang",
      },
}
Room {
	id = "foshan/road9",
	name = "�ּ��",
	ways = {
		["east"] = "foshan/road10",
		["west"] = "foshan/road8",
	},
	objs = {
          ["ɯ须�"] = "shaluo huaflower",
      },
}
Room {
	id = "foshan/shaobing",
	name = "�ձ�̯",
	ways = {
		["south"] = "foshan/dongjie2",
	},
	objs = {
          ["���Ϻ�"] = "wang laohan",
      },
}
Room {
	id = "foshan/shufang",
	name = "�鷿",
	ways = {
		["north"] = "foshan/dating",
	},
}
Room {
	id = "foshan/shulin1",
	name = "����",
	ways = {
		["southeast"] = "foshan/shulin_dzd",
		["southwest"] = "foshan/caomeidi",
		["north"] = "foshan/nanmen",
		["east"] = "foshan/pingyuanxiaolu",
	},
}
Room {
	id = "foshan/shulin2",
	name = "����",
	ways = {
		["east"] = "foshan/caomeidi",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
      },
}
Room {
	id = "foshan/shulin_dzd",
	name = "����",
	ways = {
		["south"] = "foshan/dukou",
		["northwest"] = "foshan/shulin1",
	},
}
Room {
	id = "foshan/villa-gate",
	name = "�︮����",
	ways = {
		["east"] = "foshan/dayuan",
		["west"] = "foshan/nanjie",
	},
}
Room {
	id = "foshan/xiaolu1",
	name = "С·",
	ways = {
		["northup"] = "foshan/xiaolu2",
		["south"] = "foshan/lingnan",
		["northwest"] = "foshan/zumiao",
		["northeast"] = "foshan/fenchang",
	},
	room_relative="��ɽ����С·�س��I���JС·������С·",
}
Room {
	id = "foshan/xiaolu2",
	name = "С·",
	ways = {
		["northup"] = "foshan/xiaolu3",
		["southdown"] = "foshan/xiaolu1",
	},
	room_relative="С·��С·��С·С·",
}
Room {
	id = "foshan/xiaolu3",
	name = "С·",
	ways = {
		["north"] = "fuzhou/wroad10",
		["northeast"] = "foshan/milin",
		["southdown"] = "foshan/xiaolu2",
	},
	room_relative="ɽ·���֣��JС·��С·С·",
}
Room {
	id = "foshan/xijie",
	name = "��ɽ����",
	ways = {
		["south"] = "foshan/duchang",
		["east"] = "foshan/guangchang",
		["west"] = "foshan/xijie2",
	},
	room_relative="��ɽ����---��ɽ����---��ɽ�㳡��Ӣ�ۻ�ݷ�ɽ����",
}
Room {
	id = "foshan/xijie2",
	name = "��ɽ����",
	ways = {
		["east"] = "foshan/xijie",
		["north"] = "foshan/beidimiao",
		["west"] = "foshan/ximen",
	},
	room_relative="�����������---��ɽ����---��ɽ���ַ�ɽ����",
}
Room {
	id = "foshan/ximen",
	name = "����",
	ways = {
		["east"] = "foshan/xijie2",
		["west"] = "foshan/road1",
	},
}
Room {
	id = "foshan/zhongjia",
	name = "�Ӽ�",
	ways = {
		["east"] = "foshan/caidi",
		["north"] = "foshan/alleyway",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	objs = {
          ["�Ӱ���"] = "zhong asi",
          ["����ɩ"] = "zhong sisao",
          ["³Ⱥά"] = "lu qunwei",
          ["��С��"] = "zhong xiaoer",
      },
}
Room {
	id = "foshan/zumiao",
	name = "��ɽ����",
	ways = {
		["southeast"] = "foshan/xiaolu1",
	},
}
--add by xieky@sj 20170809
Room {
	id = "foshan/pingyuanxiaolu",
	name = "ƽԭС·",
	ways = {
		["west"] = "foshan/shulin1",
		["south"] = "foshan/nanhaiyucun",
	},
}
Room {
	id = "foshan/nanhaiyucun",
	name = "�Ϻ����",
	ways = {
		["north"] = "foshan/pingyuanxiaolu",
		["west"] = "foshan/yugang",
		["east"] = "foshan/shaiwangchang",
	},
}
Room {
	id = "foshan/yugang",
	name = "���",
	ways = {
		["east"] = "foshan/nanhaiyucun",
	},
	objs = {
          ["����ʹ��"] = "shi zhe",
           },
}
Room {
	id = "foshan/shaiwangchang",
	name = "���ɹ����",
	ways = {
		["west"] = "foshan/nanhaiyucun",
		["north"] = "foshan/yucunxiaowu",
	},
	objs = {
          ["�к�"] = "boy",
          ["Ů��"] = "girl",
          ["���"] = "yu fu",
           },
}
Room {
	id = "foshan/yucunxiaowu",
	name = "���С��",
	ways = {
		["south"] = "foshan/shaiwangchang",
	},
	objs = {
          ["С��"] = "kid",
    },
}
--add end
Room {
	id = "fuzhou/bank",
	name = "ͨ��ի",
	ways = {
		["west"] = "fuzhou/dongxiang2",
	},
	objs = {
          ["���ϰ�"] = "liu laoban",
           },
}
Room {
	id = "fuzhou/beijie",
	name = "����",
	ways = {
		["south"] = "fuzhou/zhongxin",
		["north"] = "fuzhou/beimen",
	},
}
Room {
	id = "fuzhou/beimen",
	name = "����",
	ways = {
		["south"] = "fuzhou/beijie",
		["north"] = "fuzhou/road5",
	},
}
Room {
	id = "fuzhou/biaoju",
	name = "�����ھ�",
	ways = {
		["south"] = "fuzhou/zhengting",
		["east"] = "fuzhou/zhangfang",
		["north"] = "fuzhou/xijie",
	},
	objs = {
          ["��ƽ֮"] = "lin pingzhi",
          ["����ͷ"] = "zhang biaotou",
          ["����ͷ"] = "xu biaotou",
           },
}
Room {
	id = "fuzhou/bridge",
	name = "���ŵ���",
	ways = {
		["south"] = "foshan/road14",
		["north"] = "fuzhou/nanmen",
	},
	nolooks = {
		["north"] = true,
	},
	lengths = {
		["north"] = "if MidNight[locl.time] or MidHsDay[locl.time] then return false else return 1 end",
	},
}
Room {
	id = "fuzhou/chalou",
	name = "��¥",
	ways = {
		["east"] = "fuzhou/xixiang4",
		["up"] = "fuzhou/chalou2",
	},
}
Room {
	id = "fuzhou/chalou2",
	name = "��¥",
	ways = {
		["down"] = "fuzhou/chalou",
	},
}
Room {
	id = "fuzhou/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "fuzhou/xijie",
	},
	objs = {
          ["���ϰ�"] = "lao ban",
           },
}
Room {
	id = "fuzhou/dongjie",
	name = "����",
	ways = {
		["south"] = "fuzhou/shiqiao",
		["east"] = "fuzhou/haigang",
		["north"] = "fuzhou/dongxiang",
		["west"] = "fuzhou/zhongxin",
	},
}
Room {
	id = "fuzhou/dongxiang",
	name = "����",
	ways = {
		["south"] = "fuzhou/dongjie",
		["east"] = "fuzhou/jiuguan",
		["north"] = "fuzhou/dongxiang2",
	},
}
Room {
	id = "fuzhou/dongxiang2",
	name = "����",
	ways = {
		["south"] = "fuzhou/dongxiang",
		["east"] = "fuzhou/bank",
	},
}
Room {
	id = "fuzhou/feiyuan",
	name = "��԰",
	ways = {
		["west"] = "fuzhou/xyxiang",
	},
}
Room {
	id = "fuzhou/fenduo1",
	name = "����",
	ways = {
		["out"] = "fuzhou/yuchuan5",
	},
	objs = {
          ["������"] = "jiang duozhu",
          ["ؤ����Ӽ��������԰�"] = "board",
          ["�ⳤ��"] = "wu zhanglao",
           },
}
Room {
	id = "fuzhou/haigang",
	name = "����",
	ways = {
		["east"] = "fuzhou/yugang",
		["west"] = "fuzhou/dongjie",
		["swim"] = "fuzhou/island1",
	},
	nolooks = {
		["swim"] = true,
	},
	lengths = {
		["swim"] = 10,
	},
}
Room {
	id = "fuzhou/houyuan",
	name = "��լ��Ժ",
	ways = {
		["down"] = "fuzhou/well",
	},
}
Room {
	id = "fuzhou/huadian",
	name = "����",
	ways = {
		["east"] = "fuzhou/xixiang3",
	},
}
Room {
	id = "fuzhou/island1",
	name = "С��",
	ways = {
		["north"] = "fuzhou/island3",
		["swim"] = "fuzhou/haigang",
	},
	nolooks = {
		["swim"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
	},
	lengths = {
		["swim"] = 10,
	},
}
Room {
	id = "fuzhou/island2",
	name = "ɳ̲",
	ways = {
		["west"] = "fuzhou/island1",
	},
	nolooks = {
		["east"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "fuzhou/island3",
	name = "ɳ̲",
	ways = {
		["north"] = "fuzhou/rock",
		["east"] = "fuzhou/island1",
		["west"] = "fuzhou/island4",
	},
}
Room {
	id = "fuzhou/island4",
	name = "ɳ̲",
	ways = {
		["south"] = "fuzhou/island5",
		["east"] = "fuzhou/island3",
		["west"] = "fuzhou/island1",
	},
}
Room {
	id = "fuzhou/island5",
	name = "ɳ̲",
	ways = {
		["eastup"] = "fuzhou/lagoon",
		["north"] = "fuzhou/island4",
	},
}
Room {
	id = "fuzhou/jiuguan",
	name = "�ƹ�",
	ways = {
		["west"] = "fuzhou/dongxiang",
	},
}
Room {
	id = "fuzhou/kezhan",
	name = "�����ջ",
	no_fight = true,
	ways = {
		["north"] = "fuzhou/xixiang4",
		-- ["up"] = "fuzhou/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "fuzhou/kezhan2",
	name = "��ջ��¥",
	no_fight = true,
	ways = {
		["down"] = "fuzhou/kezhan",
	},
}
Room {
	id = "fuzhou/lagoon",
	name = "��ʯ",
	ways = {
		["westdown"] = "fuzhou/island5",
	},
	objs = {
          ["�ȱ�"] = "bei ke",
           },
}
Room {
	id = "fuzhou/laozhai",
	name = "������լ",
	ways = {
		["west"] = "fuzhou/xyxiang2",
	},
}
Room {
	id = "fuzhou/liang",
	name = "���ҷ���",
	ways = {
		["down"] = "fuzhou/mishi",
	},
}
Room {
	id = "fuzhou/midao",
	name = "�ܵ�",
	ways = {
		["out"] = "fuzhou/well",
	},
}
Room {
	id = "fuzhou/minzhai",
	name = "��լ",
	ways = {
		["east"] = "fuzhou/xixiang",
	},
}
Room {
	id = "fuzhou/mishi",
	name = "����",
	ways = {
		["out"] = "fuzhou/midao",
	},
}
Room {
	id = "fuzhou/mupeng",
	name = "Сľ��",
	ways = {
		["out"] = "fuzhou/rock",
	},
}
Room {
	id = "fuzhou/nanjie",
	name = "�Ͻ�",
	ways = {
		["south"] = "fuzhou/nanmen",
		["north"] = "fuzhou/zhongxin",
	},
}
Room {
	id = "fuzhou/nanmen",
	name = "����",
	ways = {
		["north"] = "fuzhou/nanjie",
		["south"] = "fuzhou/bridge",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["south"] = "if MidNight[locl.time] then return false else return 1 end",
	},
}
Room {
	id = "fuzhou/road1",
	name = "ɽ·",
	ways = {
		["southwest"] = "fuzhou/road2",
		["northeast"] = "ningbo/ttcsi",
	},
	room_relative="��ͯ���¨Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/road2",
	name = "ɽ·",
	ways = {
		--["southeast"] = "putian/road01",
		["southwest"] = "group/entry/fzroad3",
		["northeast"] = "fuzhou/road1",
	},
	room_relative="ɽ·�Jɽ·�L�Kɽ·ɽ·ɽ·",
}
Room {
	id = "fuzhou/road4",
	name = "ɽ·",
	ways = {
		["south"] = "fuzhou/road5",
		["north"] = "group/entry/fzroad3",
	},
	room_relative="ɽ·��ɽ·������ɽ·ɽ·",
}
Room {
	id = "fuzhou/road5",
	name = "����ɽ·",
	ways = {
		["south"] = "fuzhou/beimen",
		["north"] = "fuzhou/road4",
	},
	objs = {
          ["Ұ��"] = "ye tu",
          ["���۽���"] = "baipao jianxia",
           },
}
Room {
	id = "fuzhou/rock",
	name = "����",
	ways = {
		["south"] = "fuzhou/island3",
		["enter"] = "fuzhou/mupeng",
	},
}
Room {
	id = "fuzhou/shanpo",
	name = "ɽ��",
	ways = {
		["south"] = "fuzhou/wroad2",
	},
	objs = {
          ["Ұ��"] = "ye tu",
           },
}
Room {
	id = "fuzhou/shiqiao",
	name = "ʯ��",
	ways = {
		["south"] = "fuzhou/xyxiang",
		["north"] = "fuzhou/dongjie",
	},
}
Room {
	id = "fuzhou/well",
	name = "����",
	ways = {
		["down"] = "fuzhou/well1",
		["up"] = "fuzhou/houyuan",
	},
}
Room {
	id = "fuzhou/well1",
	name = "����",
	ways = {
		["up"] = "fuzhou/well",
	},
}
Room {
	id = "fuzhou/wjiuguan",
	name = "С�ƹ�",
	ways = {
		["east"] = "fuzhou/wroad2",
	},
	objs = {
          ["���ϰ�"] = "sa laoban",
           },
}
Room {
	id = "fuzhou/wroad",
	name = "ɽ·",
	ways = {
		["northwest"] = "fuzhou/wroad2",
		["east"] = "fuzhou/ximen",
	},
	nolooks = {
		["east"] = true,
	},
}
Room {
	id = "fuzhou/wroad10",
	name = "ɽ·",
	ways = {
		["south"] = "foshan/xiaolu3",
		["east"] = "fuzhou/wroad9",
	},
	room_relative="ɽ·-----ɽ·��С·ɽ·",
}
Room {
	id = "fuzhou/wroad2",
	name = "С·",
	ways = {
		["southeast"] = "fuzhou/wroad",
		["southwest"] = "fuzhou/wroad3",
		["north"] = "fuzhou/shanpo",
		["west"] = "fuzhou/wjiuguan",
	},
	room_relative="ɽ�£�С�ƹ�-----С·�L�Kɽ·ɽ·С·",
}
Room {
	id = "fuzhou/wroad3",
	name = "ɽ·",
	ways = {
		["southwest"] = "fuzhou/wroad4",
		["northeast"] = "fuzhou/wroad2",
	},
	room_relative="С·�Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/wroad4",
	name = "ɽ·",
	ways = {
		["northeast"] = "fuzhou/wroad3",
		["west"] = "group/entry/fzwroad5",
		["southwest"] = "putian/road02",
	},
}
Room {
	id = "fuzhou/wroad6",
	name = "ɽ·",
	ways = {
		["southwest"] = "fuzhou/wroad7",
		["northeast"] = "group/entry/fzwroad5",
	},
}
Room {
	id = "fuzhou/wroad7",
	name = "ɽ·",
	ways = {
		["southwest"] = "fuzhou/wroad8",
		["northeast"] = "fuzhou/wroad6",
	},
}
Room {
	id = "fuzhou/wroad8",
	name = "ɽ·",
	ways = {
		["southwest"] = "fuzhou/wroad9",
		["northeast"] = "fuzhou/wroad7",
	},
}
Room {
	id = "fuzhou/wroad9",
	name = "ɽ·",
	ways = {
		["northeast"] = "fuzhou/wroad8",
		["west"] = "fuzhou/wroad10",
	},
}
Room {
	id = "fuzhou/xijie",
	name = "����",
	ways = {
		["south"] = "fuzhou/biaoju",
		["east"] = "fuzhou/zhongxin",
		["north"] = "fuzhou/dangpu",
		["west"] = "fuzhou/xijie2",
	},
	objs = {
          ["֣��ͷ"] = "zheng biaotou",
          ["����"] = "jiang xu",
          ["ʷ��ͷ"] = "shi biaotou",
           },
}
Room {
	id = "fuzhou/xijie2",
	name = "����",
	ways = {
		["south"] = "fuzhou/xixiang3",
		["north"] = "fuzhou/xixiang2",
		["east"] = "fuzhou/xijie",
		["west"] = "fuzhou/ximen",
	},
}
Room {
	id = "fuzhou/ximen",
	name = "����",
	ways = {
		["east"] = "fuzhou/xijie2",
		["west"] = "fuzhou/wroad",
	},
	nolooks = {
		["west"] = true,
	},
}
Room {
	id = "fuzhou/xixiang",
	name = "����",
	ways = {
		["south"] = "fuzhou/xixiang2",
		["east"] = "fuzhou/zahuopu",
		["west"] = "fuzhou/minzhai",
	},
}
Room {
	id = "fuzhou/xixiang2",
	name = "����",
	ways = {
		["south"] = "fuzhou/xijie2",
		["north"] = "fuzhou/xixiang",
		["west"] = "fuzhou/yaopu",
	},
}
Room {
	id = "fuzhou/xixiang3",
	name = "����",
	ways = {
		["south"] = "fuzhou/xixiang4",
		["north"] = "fuzhou/xijie2",
		["west"] = "fuzhou/huadian",
	},
}
Room {
	id = "fuzhou/xixiang4",
	name = "����",
	ways = {
		["south"] = "fuzhou/kezhan",
		["north"] = "fuzhou/xixiang3",
		["west"] = "fuzhou/chalou",
	},
}
Room {
	id = "fuzhou/xyxiang",
	name = "������",
	ways = {
		["south"] = "fuzhou/xyxiang2",
		["north"] = "fuzhou/shiqiao",
		["east"] = "fuzhou/feiyuan",
	},
}
Room {
	id = "fuzhou/xyxiang2",
	name = "������",
	ways = {
		["north"] = "fuzhou/xyxiang",
		["east"] = "fuzhou/laozhai",
	},
}
Room {
	id = "fuzhou/yaopu",
	name = "ҩ��",
	ways = {
		["east"] = "fuzhou/xixiang2",
	},
}
Room {
	id = "fuzhou/yuchuan1",
	name = "�洬",
	ways = {
		["south"] = "fuzhou/yuchuan1",
		["east"] = "fuzhou/yuchuan2",
		["north"] = "fuzhou/yuchuan1",
		["west"] = "fuzhou/yuchuan1",
		["out"] = "fuzhou/yugang",
	},
}
Room {
	id = "fuzhou/yuchuan2",
	name = "�洬",
	ways = {
		["south"] = "fuzhou/yuchuan2",
		["east"] = "fuzhou/yuchuan3",
		["north"] = "fuzhou/yuchuan2",
		["west"] = "fuzhou/yuchuan1",
	},
}
Room {
	id = "fuzhou/yuchuan3",
	name = "�洬",
	ways = {
		["south"] = "fuzhou/yuchuan3",
		["east"] = "fuzhou/yuchuan4",
		["north"] = "fuzhou/yuchuan3",
		["west"] = "fuzhou/yuchuan2",
	},
}
Room {
	id = "fuzhou/yuchuan4",
	name = "�洬",
	ways = {
		["south"] = "fuzhou/yuchuan4",
		["east"] = "fuzhou/yuchuan5",
		["north"] = "fuzhou/yuchuan4",
		["west"] = "fuzhou/yuchuan3",
	},
}
Room {
	id = "fuzhou/yuchuan5",
	name = "�洬",
	ways = {
		["south"] = "fuzhou/yuchuan5",
		["enter"] = "fuzhou/fenduo1",
		["north"] = "fuzhou/yuchuan5",
		["east"] = "fuzhou/yuchuan2",
		["west"] = "fuzhou/yuchuan4",
	},
}
Room {
	id = "fuzhou/yugang",
	name = "�����ͷ",
	ways = {
		["south"] = "fuzhou/yuchuan1",
		["enter"] = "fuzhou/yuchuan1",
		["west"] = "fuzhou/haigang",
	},
}
Room {
	id = "fuzhou/zahuopu",
	name = "�ӻ���",
	ways = {
		["west"] = "fuzhou/xixiang",
	},
	objs = {
          ["�°���"] = "chen apo",
           },
}
Room {
	id = "fuzhou/zhangfang",
	name = "�ھ��ʷ�",
	ways = {
		["west"] = "fuzhou/biaoju",
	},
	objs = {
          ["���ʷ�"] = "zhang fang",
           },
}
Room {
	id = "fuzhou/zhengting",
	name = "�ھ�����",
	no_fight = true,
	ways = {
		["north"] = "fuzhou/biaoju",
	},
	objs = {
          ["������"] = "lin zhennan",
           },
}
Room {
	id = "fuzhou/zhongxin",
	name = "������",
	ways = {
		["south"] = "fuzhou/nanjie",
		["east"] = "fuzhou/dongjie",
		["north"] = "fuzhou/beijie",
		["west"] = "fuzhou/xijie",
	},
}
Room {
	id = "gb/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "gb/pomiao",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open door",
	},
	objs = {
          ["���߹�"] = "hong qigong",
           },
}
Room {
	id = "gb/island1",
	name = "С��",
	ways = {
		["north"] = "gb/island3",
	},
}
Room {
	id = "gb/island2",
	name = "С��",
	ways = {
		["west"] = "gb/island1",
	},
}
Room {
	id = "gb/island3",
	name = "ɳ̲",
	ways = {
		["north"] = "gb/rock",
		["east"] = "gb/island1",
		["west"] = "gb/island4",
	},
}
Room {
	id = "gb/island4",
	name = "ɳ̲",
	ways = {
		["south"] = "gb/island5",
		["east"] = "gb/island3",
		["west"] = "gb/island1",
	},
}
Room {
	id = "gb/island5",
	name = "ɳ̲",
	ways = {
		["eastup"] = "gb/lagoon",
		["north"] = "gb/island4",
	},
}
Room {
	id = "gb/kongdi2",
	name = "�յ�",
	ways = {
		["east"] = "gb/xinglin9",
	},
	objs = {
          ["�³���"] = "chen zhanglao",
           },
}
Room {
	id = "gb/lagoon",
	name = "��ʯ",
	ways = {
		["westdown"] = "gb/island5",
	},
}
Room {
	id = "gb/liangcang1",
	name = "���",
	ways = {
		["northup"] = "gb/xiaodao",
		["south"] = "gb/liangcang2",
	},
}
Room {
	id = "gb/liangcang2",
	name = "�в�",
	ways = {
		["south"] = "gb/liangcang3",
		["east"] = "gb/liangcang4",
		["north"] = "gb/liangcang1",
		["west"] = "gb/liangcang5",
	},
}
Room {
	id = "gb/liangcang3",
	name = "ǰ��",
	ways = {
		["north"] = "gb/liangcang2",
	},
}
Room {
	id = "gb/liangcang4",
	name = "���",
	ways = {
		["west"] = "gb/liangcang2",
	},
}
Room {
	id = "gb/liangcang5",
	name = "�Ҳ�",
	ways = {
		["east"] = "gb/liangcang2",
	},
}
Room {
	id = "gb/mupeng",
	name = "Сľ��",
	ways = {
		["out"] = "gb/rock",
	},
}
Room {
	id = "gb/pomiao",
	name = "������",
	ways = {
		["south"] = "gb/xinglin9",
		["north"] = "gb/houyuan",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["³�н�"] = "lu youjiao",
           },
}
Room {
	id = "gb/rock",
	name = "����",
	ways = {
		["south"] = "gb/island3",
		["enter"] = "gb/mupeng",
	},
}
Room {
	id = "gb/tianjing",
	name = "�ﾶ",
	ways = {
		["east"] = "suzhou/qsgdao6",
		["north"] = "gb/xinglin1",
	},
}
Room {
	id = "gb/xiaodao",
	name = "С·",
	ways = {
		["northup"] = "gb/yading",
		["southdown"] = "gb/liangcang1",
	},
}
Room {
	id = "gb/xinglin1",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
		["east"] = "gb/xinglin2",
	--	["north"] = "gb/xinglin1",
	--	["west"] = "gb/xinglin1",
	},
}
Room {
	id = "gb/xinglin2",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin3",
	--	["east"] = "gb/xinglin2",
	--	["west"] = "gb/xinglin2",
	},
}
Room {
	id = "gb/xinglin3",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
	--	["east"] = "gb/xinglin3",
	--	["north"] = "gb/xinglin3",
		["west"] = "gb/xinglin4",
	},
}
Room {
	id = "gb/xinglin4",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin5",
	--	["east"] = "gb/xinglin4",
	--	["west"] = "gb/xinglin4",
	},
}
Room {
	id = "gb/xinglin5",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
		["east"] = "gb/xinglin6",
	--	["north"] = "gb/xinglin5",
	--	["west"] = "gb/xinglin5",
	},
}
Room {
	id = "gb/xinglin6",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
	--	["north"] = "gb/xinglin6",
	--	["east"] = "gb/xinglin6",
		["west"] = "gb/xinglin7",
	},
}
Room {
	id = "gb/xinglin7",
	name = "������",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin8",
	--	["east"] = "gb/xinglin7",
	--	["west"] = "gb/xinglin7",
	},
}
Room {
	id = "gb/xinglin8",
	name = "������",
	ways = {
		["south"] = "gb/xinglin7",
		["north"] = "gb/xinglin9",
	},
	objs = {
         ["������"] = "bai shijing",
          ["�γ���"] = "song zhanglao",
           },
}
Room {
	id = "gb/xinglin9",
	name = "������",
	ways = {
		["south"] = "gb/xinglin8",
		["north"] = "gb/pomiao",
		["west"] = "gb/kongdi2",
	},
	objs = {
          ["������"] = "liang zhanglao",
           },
}
Room {
	id = "gb/yading",
	name = "�¶�",
	ways = {
		["down"] = "nanyang/duanya",
		["southdown"] = "gb/xiaodao",
	},
}
Room {
	id = "gb/zhongjun1",
	name = "�о�ԯ��",
	ways = {
		["north"] = "gb/zhongjun2",
	},
}
Room {
	id = "gb/zhongjun2",
	name = "�о�",
	ways = {
		["south"] = "gb/zhongjun1",
		["north"] = "gb/zhongjun3",
	},
}
Room {
	id = "gb/zhongjun3",
	name = "�о�",
	ways = {
		["south"] = "gb/zhongjun2",
		["north"] = "gb/zhongjun4",
	},
}
Room {
	id = "gb/zhongjun4",
	name = "�о�",
	ways = {
		["south"] = "gb/zhongjun3",
		["north"] = "gb/zhongjun5",
	},
}
Room {
	id = "gb/zhongjun5",
	name = "�о�����",
	ways = {
		["south"] = "gb/zhongjun4",
	},
}
Room {
	id = "group/cailiao-hang",
	outdoor = "�ɶ���",
	name = "������",
	ways = {
		["south"] = "chengdu/ddajie1",
	},
	objs = {
          ["���ƹ�"] = "wang zhanggui",
           },
}
Room {
	id = "group/entry/caeroad3",
	name = "��·",
	outdoor = "������",
	ways = {
		["southeast"] = "village/shilu5",
		["west"] = "changan/eastroad2",
	},
	room_relative="�ٵ�-----��·�K��ʯ·��·",
}
Room {
	id = "group/entry/canroad6",
	name = "��·",
	outdoor = "������",
	ways = {
		["southwest"] = "changan/northroad5",
		["northdown"] = "changan/northroad7",
	},
	room_relative="��·����·�L��·��·",
}
Room {
	id = "group/entry/cderoad4",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "xiangyang/xiaolu2",
		["west"] = "chengdu/eroad3",
	},
	room_relative="���-----���-----С·���",
}
Room {
	id = "group/entry/cdtulu2",
	name = "��·",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "chengdu/tulu1",
		["northeast"] = "chengdu/tulu3",
	},
}
Room {
	id = "group/entry/czeroad3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "cangzhou/eroad2",
		["northeast"] = "cangzhou/eroad4",
	},
}
Room {
	id = "group/entry/czwroad2",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "cangzhou/wroad3",
		["east"] = "cangzhou/wroad1",
	},
}
Room {
	id = "group/entry/dleyd",
	name = "���Ӷ�",
	outdoor = "����Ƕ�",
	ways = {
		["enter"] = "dali/dalieast/ydk",
		["northdown"] = "dali/dalieast/chengj",
	},
}
Room {
	id = "group/entry/dlndao2",
	name = "���",
	outdoor = "����Ǳ�",
	ways = {
		["south"] = "dali/dadao3",
		["north"] = "dali/dadao1",
	},
	room_relative="����������������",
}
Room {
	id = "group/entry/dlndao5",
	name = "���",
	outdoor = "�����",
	ways = {
		["southeast"] = "dali/yuxu/shangang",
		["west"] = "dali/yuxu/guanmen",
	},
}
Room {
	id = "group/entry/dlstulin",
	name = "����",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/dalisouth/xiushan",
		["north"] = "dali/dalisouth/dg1",
		["west"] = "dali/yideng/fanpu",
	},
}
Room {
	id = "group/entry/dlwqunsh",
	name = "÷��ѩɽ",
	outdoor = "�������",
	ways = {
		["southeast"] = "dali/daliwest/futiao",
		["southwest"] = "dali/daliwest/tianchi1",
	},
}
Room {
	id = "group/entry/fsroad13",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "foshan/road11",
		["northeast"] = "foshan/road14",
	},
}
Room {
	id = "group/entry/fsroad5",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["northeast"] = "foshan/road4",
		["west"] = "foshan/road6",
	},
}
Room {
	id = "group/entry/fzroad3",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/road4",
		["northeast"] = "fuzhou/road2",
	},
	room_relative="ɽ·�Jɽ·��ɽ·ɽ·",
}
Room {
	id = "group/entry/fzwroad5",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad6",
		["east"] = "fuzhou/wroad4",
	},
}
Room {
	id = "group/entry/gmchang",
	name = "���Ϲ㳡",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "gumu/jishi",
		["northwest"] = "gumu/xiaolu2",
	},
}
Room {
	id = "group/entry/hhshulin5",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["southeast"] = "huanghe/shulin4",
		["northeast"] = "huanghe/tiandi2",
		["west"] = "huanghe/shulin6",
	},
}
Room {
	id = "group/entry/hjroad",
	name = "С·",
	outdoor = "�ؽ���ԭ",
	ways = {
		["westup"] = "hj/shanqiu",
		["east"] = "hj/pmchang",
	},
}
Room {
	id = "group/entry/hmyroad2",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["eastup"] = "hmy/pingding/road3",
		["southwest"] = "hmy/pingding/road1",
	},
}
Room {
	id = "group/entry/hmyroad8",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["southeast"] = "hmy/pingding/road9",
		["west"] = "hmy/pingding/road7",
	},
}
Room {
	id = "group/entry/hzqsd7",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/beimen",
		["north"] = "hz/shanlu3",
	},
}
Room {
	id = "group/entry/klclin1",
	name = "ѩɽ����",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "fairyland/conglin2",
		["eastdown"] = "fairyland/shanxi",
	},
}
Room {
	id = "group/entry/lzroad1",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/road5",
		["northeast"] = "lanzhou/jingyuan",
	},
}
Room {
	id = "group/entry/lzshixia",
	name = "ʯϿ��",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/tumenzi",
		["northeast"] = "lanzhou/bingcao",
	},
}
Room {
	id = "group/entry/lzsroad3",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/qingcheng",
		["northwest"] = "lanzhou/sroad2",
	},
}
Room {
	id = "group/entry/mjshamo1",
	name = "��ɳĮ",
	outdoor = "˿��֮·",
	ways = {
		["northeast"] = "xingxiu/silk6",
		["west"] = "mingjiao/shaqiu1",
	},
}
Room {
	id = "group/entry/mjshan2",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["south"] = "miaojiang/shandao2",
		["northeast"] = "xiangyang/hunanroad2",
	},
}
Room {
	id = "group/entry/nbqsddao",
	name = "��ʯ�ٵ�",
	outdoor = "������",
	ways = {
		["southeast"] = "ningbo/shilu",
		["northwest"] = "ningbo/qsddao1",
	},
}
Room {
	id = "group/entry/slxiaoj1",
	name = "ɽ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/xiaojing2",
		["east"] = "shaolin/shijie1",
	},
}
Room {
	id = "group/entry/sztulu2",
	name = "��·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/jiangbian",
		["northeast"] = "suzhou/tulu1",
	},
}
Room {
	id = "group/entry/thdroad1",
	name = "��·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["southeast"] = "thd/niujia/road2",
		["north"] = "thd/niujia/road",
	},
}
Room {
	id = "group/entry/tsyidao3",
	name = "�����",
	outdoor = "̩ɽ",
	ways = {
		["north"] = "taishan/daizong",
		["west"] = "taishan/yidao2",
	},
}
Room {
	id = "group/entry/wdroad7",
	name = "����·",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/wdroad6",
		["west"] = "wudang/wdroad8",
	},
}
Room {
	id = "group/entry/xstulu2",
	name = "�ر���·",
	outdoor = "��ѩɽ",
	ways = {
		["southwest"] = "xueshan/tulu3",
		["northeast"] = "xueshan/tulu1",
	},
}
Room {
	id = "group/entry/xsxiao2",
	name = "����С·",
	outdoor = "��ѩɽ",
	ways = {
		["northwest"] = "xueshan/xiaolu1",
		["east"] = "xueshan/xiaolu3",
	},
}
Room {
	id = "group/entry/yzeroad1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/eroad2",
		["west"] = "city/dongmen",
	},
}
Room {
	id = "gumu/bzy",
	name = "������",
	ways = {
		["southup"] = "gumu/lyy",
		["eastdown"] = "gumu/ryy",
	},
}
Room {
	id = "gumu/dongkou",
	name = "����",
	ways = {
		["out"] = "gumu/shanxia",
	},
}
Room {
	id = "gumu/fang",
	name = "ʯ��",
	ways = {
		["open door;south"] = "gumu/gmcc",
		["open door;east"] = "gumu/yaofang",
		["open door;north"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/fchuan",
	name = "����",
	ways = {
		["east"] = "xiangyang/shanxiroad1",
		["west"] = "gumu/xiaolu1",
	},
}
Room {
	id = "gumu/gmanhe1",
	name = "����",
	ways = {
		["northup"] = "gumu/sshi1",
		["westdown"] = "gumu/gmql1",
	},
}
Room {
	id = "gumu/gmanhe2",
	name = "����",
	ways = {
		["northup"] = "gumu/dongkou",
		["eastdown"] = "gumu/gmql2",
	},
}
Room {
	id = "gumu/gmcc",
	name = "������",
	ways = {
		["open door;north"] = "gumu/fang",
	},
}
Room {
	id = "gumu/gmht",
	name = "����",
	ways = {
		["open door;south"] = "gumu/gmws",
		["open door;north"] = "gumu/gmws1",
		["open door;east"] = "gumu/gmqs",
		["open door;west"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg1",
	name = "ʯ��",
	ways = {
		["open door;enter"] = "gumu/gmlg4",
		["open door;north"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg2",
	name = "������",
	ways = {
		["south"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg4",
	name = "ʯ��",
	ways = {
		["south"] = "gumu/gmlg5",
		["out"] = "gumu/gmlg1",
	},
}
Room {
	id = "gumu/gmlg5",
	name = "ʯ��",
	ways = {
		["north"] = "gumu/gmlg4",
	},
}
Room {
	id = "gumu/gmlw",
	name = "������",
	ways = {
		["open door;south"] = "gumu/gmqt",
	},
}
Room {
	id = "gumu/gmqc",
	name = "�д���",
	no_fight = true,
	ways = {
		["open door;north"] = "gumu/gmqt",
	},
}
Room {
	id = "gumu/gmql1",
	name = "Ǳ��",
	ways = {
		["eastup"] = "gumu/gmanhe1",
		["west"] = "gumu/gmql2",
	},
}
Room {
	id = "gumu/gmql2",
	name = "Ǳ��",
	ways = {
		["westup"] = "gumu/gmanhe2",
		["east"] = "gumu/gmql1",
	},
}
Room {
	id = "gumu/gmqs",
	name = "����",
	ways = {
		["open door;south"] = "gumu/fang",
		["open door;east"] = "gumu/shitou",
		["open door;north"] = "gumu/jianshi",
		["open door;west"] = "gumu/gmht",
	},
}
Room {
	id = "gumu/gmqt",
	name = "ǰ��",
	ways = {
		["open door;south"] = "gumu/gmqc",
		["open door;east"] = "gumu/gmzt",
		["open door;north"] = "gumu/gmlw",
		["open door;out"] = "gumu/rukou",
	},
}
Room {
	id = "gumu/gmws",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "gumu/gmht",
	},
}
Room {
	id = "gumu/gmws1",
        name = "����",
        ways = {
                ["south"] = "gumu/gmht",
                ["tang bed;ban shiban"] = "gumu/ss0",
        },
        nolooks = {
                ["tang bed;ban shiban"] = true,
        },
}
Room {
	id = "gumu/gmzt",
	name = "����",
	ways = {
		["open door;south"] = "gumu/gmlg1",
		["open door;north"] = "gumu/gmlg2",
		["open door;east"] = "gumu/gmht",
		["open door;west"] = "gumu/gmqt",
		["zong bian"] = "gumu/bianhou",
	},
	nolooks = {
        ["zong bian"] = true,
    },
}
Room {
	id = "gumu/bianhou",
	name = "�Һ�",
	ways = {
		["jump down"] = "gumu/gmzt",
	},
	nolooks = {
        ["jump down"] = true,
    },
}
Room {
	id = "gumu/guolin1",
	name = "����",
	ways = {
		["south"] = "gumu/guoyuan",
		["north"] = "gumu/guolin1",
		["east"] = "gumu/guolin1",
		["west"] = "gumu/guolin2",
	},
}
Room {
	id = "gumu/guolin2",
	name = "����",
	ways = {
		["south"] = "gumu/guolin2",
		["east"] = "gumu/guolin3",
		["north"] = "gumu/guolin2",
		["west"] = "gumu/guolin2",
	},
}
Room {
	id = "gumu/guolin3",
	name = "����",
	ways = {
		["south"] = "gumu/guolin4",
		["north"] = "gumu/guolin3",
		["east"] = "gumu/guolin3",
		["west"] = "gumu/guolin3",
	},
}
Room {
	id = "gumu/guolin4",
	name = "����",
	ways = {
		["south"] = "gumu/guolin4",
		["east"] = "gumu/huacong",
		["north"] = "gumu/guolin4",
		["west"] = "gumu/guolin4",
	},
}
Room {
	id = "gumu/guolin5",
	name = "����",
	ways = {
		["east"] = "gumu/guoyuan",
	},
}
Room {
	id = "gumu/guoyuan",
	name = "��԰",
	ways = {
		["eastup"] = "gumu/shanpo",
		["south"] = "gumu/rukou",
		["north"] = "gumu/guolin1",
		["west"] = "gumu/guolin5",
	},
}
Room {
	id = "gumu/huacong",
	name = "�컨��",
	no_fight = true,
	ways = {
		["south"] = "gumu/guolin5",
		["west"] = "gumu/guolin4",
	},
}
Room {
	id = "gumu/jianshi",
	name = "����",
	ways = {
		["south"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/jishi",
	name = "����",
	ways = {
		["northwest"] = "group/entry/gmchang",
	},
}
Room {
	id = "gumu/jlg",
	name = "������",
	ways = {
		["northup"] = "gumu/ztm",
		["southup"] = "gumu/ryy",
	},
	objs = {
          ["����"] = "ma yu",
     },
}
Room {
	id = "gumu/jqg/boat2",
	name = "С��",
	ways = {
		["out"] = "gumu/jqg/xiaoxi",
	},
}
Room {
	id = "gumu/jqg/boat5",
	name = "С��",
	ways = {
		["out"] = "gumu/jqg/xibian",
	},
}
Room {
	id = "gumu/jqg/cave3",
	name = "��",
	ways = {
		["west"] = "gumu/jqg/shiyao",
	},
}
Room {
	id = "gumu/jqg/danfang",
	name = "����",
	ways = {
		["south"] = "gumu/jqg/lang2",
	},
}
Room {
	id = "gumu/jqg/dashi",
	name = "����",
	ways = {
		["west"] = "gumu/jqg/xiaoshi",
	},
	objs = {
          ["С��Ů"] = "xiao longnv",
           },
}
Room {
	id = "gumu/jqg/dating",
	name = "����",
	ways = {
		["out"] = "gumu/jqg/shiwu",
		["#goHt"] = "gumu/jqg/houtang",
	},
	nolooks = {
		["#goHt"] = true,
	},
	lengths = {
		["#goHt"] = "if hp.exp < 200000 then return false else return 1 end",
	},
}
Room {
	id = "gumu/jqg/fyy",
	name = "������",
	ways = {
		["northup"] = "gumu/jqg/shanjing",
		["southdown"] = "gumu/jqg/xqx",
	},
}
Room {
	id = "gumu/jqg/glt",
	name = "����ͤ",
	ways = {
		["east"] = "gumu/jqg/xqx",
		["southdown"] = "gumu/jqg/xiaoxi",
	},
}
Room {
	id = "gumu/jqg/houtang",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/dating",
		["north"] = "gumu/jqg/lang1",
	},
}
Room {
	id = "gumu/jqg/huacong",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "gumu/jqg/xiaolu",
	},
}
Room {
	id = "gumu/jqg/huayuan",
	name = "��԰",
	ways = {
		["south"] = "gumu/jqg/lang1",
	},
}
Room {
	id = "gumu/jqg/jianshi",
	name = "����",
	ways = {
		["south"] = "gumu/jqg/lang5",
	},
}
Room {
	id = "gumu/jqg/lang1",
	name = "����",
	ways = {
		["south"] = "gumu/jqg/houtang",
		["east"] = "gumu/jqg/lang2",
		["north"] = "gumu/jqg/huayuan",
		["west"] = "gumu/jqg/lang4",
	},
}
Room {
	id = "gumu/jqg/lang2",
	name = "���᳤��",
	ways = {
		["south"] = "gumu/jqg/lgf",
		["east"] = "gumu/jqg/lang3",
		["north"] = "gumu/jqg/danfang",
		["west"] = "gumu/jqg/lang1",
	},
}
Room {
	id = "gumu/jqg/lang3",
	name = "���᳤��",
	ways = {
		["east"] = "gumu/jqg/shufang",
		["west"] = "gumu/jqg/lang2",
	},
}
Room {
	id = "gumu/jqg/lang4",
	name = "���᳤��",
	ways = {
		["south"] = "gumu/jqg/sleep2",
		["north"] = "gumu/jqg/sleep1",
		["east"] = "gumu/jqg/lang1",
		["west"] = "gumu/jqg/lang5",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	room_relative="��Ϣ�ң����᳤��---���᳤��---���ȣ���Ϣ�����᳤��",
}
Room {
	id = "gumu/jqg/lang5",
	name = "���᳤��",
	ways = {
		["south"] = "gumu/jqg/zhifang",
		["east"] = "gumu/jqg/lang4",
		["north"] = "gumu/jqg/jianshi",
	},
	lengths = {
		["north"] = "if not skills['dodge'] or skills['dodge'].lvl>130 then return 1 else return false end",
	},
	room_relative="���ң����᳤��---���᳤�ȣ�֥�����᳤��",
}
Room {
	id = "gumu/jqg/lgf",
	name = "������",
	ways = {
		["north"] = "gumu/jqg/lang2",
	},
}
Room {
	id = "gumu/jqg/qsroad",
	name = "��ʯ��·",
	ways = {
		["eastup"] = "gumu/jqg/shuitang",
		["north"] = "gumu/jqg/shiwu",
	},
}
Room {
	id = "gumu/jqg/shanding",
	name = "ɽ��ƽ��",
	ways = {
		["east"] = "gumu/jqg/shanlu4",
		["southdown"] = "gumu/jqg/shanjing1",
		["northdown"] = "gumu/jqg/zhulinn",
		["west"] = "gumu/jqg/xshiwu",
	},
}
Room {
	id = "gumu/jqg/shanjing",
	name = "ɽ��",
	ways = {
		["northup"] = "gumu/jqg/shanjing1",
		["southdown"] = "gumu/jqg/fyy",
	},
}
Room {
	id = "gumu/jqg/shanjing1",
	name = "ɽ��",
	ways = {
		["northup"] = "gumu/jqg/shanding",
		["southdown"] = "gumu/jqg/shanjing",
	},
}
Room {
	id = "gumu/jqg/shanlu1",
	name = "ɽ��С·",
	ways = {
		["southeast"] = "gumu/jqg/shanlu2",
		["north"] = "gumu/jqg/xibian",
	},
}
Room {
	id = "gumu/jqg/shanlu10",
	name = "�ϳ���",
	ways = {
		["westdown"] = "gumu/jqg/shanlu9",
		["l ya;jump qiaobi;xiao"] = "gumu/jqg/tanan",
		["l ya;jump qiaobi"] = "gumu/jqg/qiaobi",
	},
	nolooks = {
		["l ya;jump qiaobi;xiao"] = true,
		["l ya;jump qiaobi"] = true,
	},
	lengths = {
		["l ya;jump qiaobi;xiao"] = "if score.party and score.party=='��Ĺ��' and job.name~='tdh' then return 10 else return false end",
		["l ya;jump qiaobi"] = "if score.party and score.party~='��Ĺ��' and job.name=='tdh' then return false else return 10 end",
	},
}
Room {
	id = "gumu/jqg/qiaobi",
	name = "�ͱ�",
	ways = {
		["#Togudi"] = "gumu/jqg/gudi",
		["jump back"] = "gumu/jqg/shanlu10",
	},
	nolooks = {
		["#Togudi"] = true,
		["jump back"] = true,
	},
	lengths = {
		["#Togudi"] = 100,
		["jump back"] = 100,
	},
}
Room {
	id = "gumu/jqg/yabi",
	name = "�±�",
	ways = {
		["#Goyadi"] = "gumu/jqg/gudi",
		["#Goqiaobi"] = "gumu/jqg/qiaobi",
	},
	nolooks = {
		["#Goyadi"] = true,
		["#Goqiaobi"] = true,
	},
	lengths = {
		["#Goyadi"] = 100,
		["#Goqiaobi"] = 100,
	},
}
Room {
	id = "gumu/jqg/gudishuitan",
	name = "�ȵ�ˮ̶",
	ways = {
		["#Hyadi"] = "gumu/jqg/gudi",
	},
	nolooks = {
		["#Hyadi"] = true,
	},
	lengths = {
		["#Hyadi"] = 100,
	},
}
Room {
	id = "gumu/jqg/shuiditongdao",
	name = "ˮ��ͨ��",
	ways = {
		["#qQydok"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["#qQydok"] = true,
	},
	lengths = {
		["#qQydok"] = 100,
	},
}
Room {
	id = "gumu/jqg/shuitanbiaomian",
	name = "ˮ̶����",
	ways = {
		["pa up"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["pa up"] = true,
	},
	lengths = {
		["pa up"] = 100,
	},
}
Room {
	id = "gumu/jqg/gudi",
	name = "�ȵ�",
	ways = {
		["#Toqiaobi"] = "gumu/jqg/qiaobi",
		["#Totanan"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["#Toqiaobi"] = true,
		["#Totanan"] = true,
	},
	lengths = {
		["#Toqiaobi"] = 100,
		["#Totanan"] = 100,
	},
}
Room {
	id = "gumu/jqg/shanlu2",
	name = "ɽ��С·",
	ways = {
		["southeast"] = "gumu/jqg/shanlu3",
		["northwest"] = "gumu/jqg/shanlu1",
	},
}
Room {
	id = "gumu/jqg/shanlu3",
	name = "ɽ��С·",
	ways = {
		["south"] = "xiangyang/outwroad1",
		["northwest"] = "gumu/jqg/shanlu2",
	},
}
Room {
	id = "gumu/jqg/shanlu4",
	name = "ɽ·",
	ways = {
		["east"] = "gumu/jqg/shanlu5",
		["west"] = "gumu/jqg/shanding",
	},
}
Room {
	id = "gumu/jqg/shanlu5",
	name = "ɽ·",
	ways = {
		["northup"] = "gumu/jqg/shanlu6",
		["eastup"] = "gumu/jqg/shanlu9",
		["west"] = "gumu/jqg/shanlu4",
	},
}
Room {
	id = "gumu/jqg/shanlu6",
	name = "�����",
	ways = {
		["southdown"] = "gumu/jqg/shanlu5",
	},
}
Room {
	id = "gumu/jqg/shanlu9",
	name = "ɽ·",
	ways = {
		["westdown"] = "gumu/jqg/shanlu5",
		["eastup"] = "gumu/jqg/shanlu10",
	},
}
Room {
	id = "gumu/jqg/shiwu",
	name = "��ʯ��",
	ways = {
		["south"] = "gumu/jqg/qsroad",
		["enter"] = "gumu/jqg/dating",
	},
	blocks = {
		["enter"] = {
			{id = "fan yiweng", exp = 400000},
		},
	},
}
Room {
	id = "gumu/jqg/shiyao",
	name = "ʯ��",
	ways = {
		["east"] = "gumu/jqg/cave3",
	},
}
Room {
	id = "gumu/jqg/shufang",
	name = "�鷿",
	ways = {
		["west"] = "gumu/jqg/lang3",
	},
}
Room {
	id = "gumu/jqg/shuitang",
	name = "ˮ��",
	ways = {
		["#jqgzlout"] = "gumu/jqg/shanding",
		["westdown"] = "gumu/jqg/qsroad",
	},
	nolooks = {
		["#jqgzlout"] = true,
		["eastup"] = true,
	},
	lengths = {
		["#jqgzlout"] = 100,
	},
}
Room {
	id = "gumu/jqg/sleep1",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/lang4",
	},
}
Room {
	id = "gumu/jqg/sleep2",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "gumu/jqg/lang4",
	},
}
Room {
	id = "gumu/jqg/tanan",
	name = "ˮ̶����",
	ways = {
		["north"] = "gumu/jqg/xiaolu",
		["xiao;jump back"] = "gumu/jqg/shanlu10",
		["#Hgudi"] = "gumu/jqg/gudi",
	},
	nolooks = {
		["xiao;jump back"] = true,
		["#Hgudi"] = true,
	},
	lengths = {
		["xiao;jump back"] = "if score.party and score.party=='��Ĺ��' then return 10 else return false end",
		["#Hgudi"] = "if score.party and score.party=='��Ĺ��' then return false else return 10 end",
	},
}
Room {
	id = "gumu/jqg/wshi",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/zhongtang",
	},
}
Room {
	id = "gumu/jqg/xiaolu",
	name = "����С·",
	ways = {
		["south"] = "gumu/jqg/tanan",
		["enter"] = "gumu/jqg/zhongtang",
		["east"] = "gumu/jqg/huacong",
	},
}
Room {
	id = "gumu/jqg/xiaoshi",
	name = "С��",
	ways = {
		["east"] = "gumu/jqg/dashi",
		["west"] = "gumu/jqg/zhongtang",
	},
	objs = {
          ["���"] = "yang guo",
           },
}
Room {
	id = "gumu/jqg/xiaoxi",
	name = "������",
	ways = {
		["northup"] = "gumu/jqg/glt",
		["#jqgout"] = "gumu/jqg/xibian",
	},
	nolooks = {
		["#jqgout"] = true,
	},
	lengths = {
		["#jqgout"] = 200,
	},
}
Room {
	id = "gumu/jqg/xibian",
	name = "СϪ��",
	ways = {
		["south"] = "gumu/jqg/shanlu1",
		["#jqgin"] = "gumu/jqg/xiaoxi",
	},
	nolooks = {
		["#jqgin"] = true,
	},
	lengths = {
		["#jqgin"] = 200,
	},
}
Room {
	id = "gumu/jqg/xqx",
	name = "�����",
	ways = {
		["northup"] = "gumu/jqg/fyy",
		["west"] = "gumu/jqg/glt",
	},
}
Room {
	id = "gumu/jqg/xshiwu",
	name = "Сʯ��",
	no_fight = true,
	ways = {
		["east"] = "gumu/jqg/shanding",
	},
}
Room {
	id = "gumu/jqg/zhifang",
	name = "֥��",
	ways = {
		["north"] = "gumu/jqg/lang5",
	},
}
Room {
	id = "gumu/jqg/zhongtang",
	name = "����",
	ways = {
		["east"] = "gumu/jqg/xiaoshi",
		["north"] = "gumu/jqg/wshi",
		["out"] = "gumu/jqg/xiaolu",
	},
}
Room {
	id = "gumu/jqg/zhulinn",
	name = "����",
	ways = {
		["#jqgzlin"] = "gumu/jqg/shuitang",
		["#jqgzlout"] = "gumu/jqg/shanding",
	},
	lengths = {
		["#jqgzlin"] = 50,
		["#jqgzlout"] = 50,
	},
}
Room {
	id = "gumu/lgf",
	name = "������",
	ways = {
		["south"] = "gumu/shitou",
	},
}
Room {
        id = "gumu/lingshi",
        name = "����",
        ways = {
                ["out"] = "gumu/ss5",
                ["get fire;tui guangai;tang guan;use fire;search;search;search;search;search;search;search;search;search;turn ao left;#walkBusy;ti up"] = "gumu/sshi1",
                ["get fire;tui guangai;tang guan"] = "gumu/shiguan",
        },
        nolooks = {
                ["get fire;tui guangai;tang guan;use fire;search;search;search;search;search;search;search;search;search;turn ao left;#walkBusy;ti up"] = true,
                ["get fire;tui guangai;tang guan"] = true,
        },
}
Room {
	id = "gumu/lyy",
	name = "������",
	ways = {
		["east"] = "gumu/shulin1",
		["northdown"] = "gumu/bzy",
	},
}
Room {
	id = "gumu/rukou",
	name = "��Ĺ",
	ways = {
		["south"] = "gumu/xuanya",
		["enter"] = "gumu/gmqt",
		["north"] = "gumu/guoyuan",
	},
}
Room {
	id = "gumu/ryy",
	name = "������",
	ways = {
		["westup"] = "gumu/bzy",
		["northdown"] = "gumu/jlg",
	},
}
Room {
	id = "gumu/shanlu1",
	name = "ɽ´",
	ways = {
		["southup"] = "gumu/shanlu2",
		["northdown"] = "gumu/xiaolu3",
	},
}
Room {
	id = "gumu/shanlu2",
	name = "�ڶ�",
	ways = {
		["southup"] = "gumu/shanlu3",
		["northdown"] = "gumu/shanlu1",
	},
}
Room {
	id = "gumu/shanlu3",
	name = "ɽ·",
	ways = {
		["eastup"] = "gumu/ztm",
		["northdown"] = "gumu/shanlu2",
	},
}
Room {
	id = "gumu/shanpo",
	name = "ɽ��",
	ways = {
		["westdown"] = "gumu/guoyuan",
		["northeast"] = "gumu/shanpo1",
	},
}
Room {
	id = "gumu/shanpo1",
	name = "ɽ��",
	ways = {
		["southwest"] = "gumu/shanpo",
	},
}
Room {
	id = "gumu/shanxia",
	name = "����ɽ��",
	ways = {
		["northwest"] = "gumu/xiaolu3",
		["enter"] = "gumu/dongkou",
	},
}

Room {
        id = "gumu/shengou",
        name = "�",
        ways = {
                ["west"] = "gumu/shulin2",
                ["tiao gou"] = "gumu/rukou",
        },
        nolooks = {
                ["tiao gou"] = true,
        },
        lengths = {
                ["tiao gou"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
        },
        objs = {
          ["������"] = "sun popo",
     },
}

Room {
	id = "gumu/shiguan",
	name = "ʯ����",
	no_fight = true,
	ways = {
		["out"] = "gumu/lingshi",
	},
}
Room {
	id = "gumu/shitou",
	name = "ʯ��",
	ways = {
		["south"] = "gumu/yaofang",
		["north"] = "gumu/lgf",
		["west"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/shulin",
	name = "����",
	ways = {
		["out"] = "gumu/shulin2",
	},
}
Room {
	id = "gumu/shulin1",
	name = "����",
	ways = {
		["east"] = "gumu/sln",
		["west"] = "gumu/lyy",
	},
}
Room {
	id = "gumu/shulin2",
	name = "��ľ��",
	ways = {
		["east"] = "gumu/shengou",
		["west"] = "gumu/sln",
	},
}
--[[
Room {
	id = "gumu/sln",
	name = "����",
	ways = {
		["south"] = "gumu/sln",
		["north"] = "gumu/sln",
		["east"] = "gumu/sln",
		["west"] = "gumu/sln",
		["e;e;e;e;e;e;e;e;e;e;e;e;w"] = "gumu/shulin2",
		["w;w;w;w;w;w;w;w;w;w;w;w;e"] = "gumu/shulin1",
	},
	objs = {
          ["���"] = "yu feng",
     },
}
--]]
Room {
	id = "gumu/sln",
	name = "����",
	ways = {
		["south"] = "gumu/sl3",
	},
}
Room {
	id = "gumu/sl3",
	name = "����",
	ways = {
		["north"] = "gumu/sl2",
	},
}
Room {
	id = "gumu/sl2",
	name = "����",
	ways = {
		["south"] = "gumu/sl4",
	},
	objs = {
          ["���"] = "yu feng",
     },
}
Room {
	id = "gumu/sl4",
	name = "����",
	ways = {	
		["e;e;e;e;e;e;e;e;e;e;e;e;w"] = "gumu/shulin2",
		["w;w;w;w;w;w;w;w;w;w;w;w;e"] = "gumu/shulin1",
	},
}
Room {
        id = "gumu/ss0",
        name = "ʯ��",
        ways = {
                ["out"] = "gumu/ss4",
        },
}
Room {
        id = "gumu/ss1",
        name = "ʯ��",
        ways = {
                ["out"] = "gumu/ss1",
        },
}
Room {
        id = "gumu/ss4",
        name = "ʯ��",
        ways = {
                ["w;w;w;w;w;s;s;s;s;s;s;n;n;n;n;n;e;e;e;e;e;#walkBusy;enter"] = "gumu/lingshi",
                ["w;w;w;w;w;s;s;s;s;s;s;n;n;n;n;n;e;e;e;e;e"] = "gumu/ss5",
        },
		room_relative='ʯ�ң�ʯ��-----ʯ��-----ʯ�ң�ʯ��ʯ��'
}
Room {
	id = "gumu/ss5",
	name = "ʯ��",
	ways = {
		["enter"] = "gumu/lingshi",
		["west"] = "gumu/ss4",
	},
}
Room {
        id = "gumu/sshi1",
        name = "ʯ��",
        ways = {
                ["up"] = "gumu/shiguan",
                ["l map;#walkBusy;walk down"] = "gumu/gmanhe1",
        },
}
Room {
	id = "gumu/xiaolu1",
	name = "���С·",
	ways = {
		["south"] = "gumu/xiaolu2",
		["east"] = "gumu/fchuan",
	},
}
Room {
	id = "gumu/xiaolu2",
	name = "����С��",
	ways = {
		["southeast"] = "group/entry/gmchang",
		["south"] = "gumu/xiaolu3",
		["north"] = "gumu/xiaolu1",
	},
}
Room {
	id = "gumu/xiaolu3",
	name = "���С��",
	ways = {
		["southup"] = "gumu/shanlu1",
		["southeast"] = "gumu/shanxia",
		["north"] = "gumu/xiaolu2",
	},
}
Room {
	id = "gumu/xuantie/dongkou",
	name = "����",
	ways = {
		["southeast"] = "gumu/xuantie/xiaolu3",
		["enter"] = "gumu/xuantie/shandong",
	},
	blocks = {
		["enter"] = {
			{id = "shen diao", exp = 100000},
		},
	},
	objs = {
          ["���"] = "shen diao",
     },
}
Room {
	id = "gumu/xuantie/pubu",
	name = "�ٲ�",
	ways = {
		["west"] = "gumu/xuantie/xiaolu3",
	},
}
Room {
	id = "gumu/xuantie/qiaobi",
	name = "�ͱ�",
	ways = {
		["southdown"] = "gumu/xuantie/shanlu8",
		["l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;mo qingtai;cuan up"] = "gumu/xuantie/pingtai",
	},
	nolooks = {
		["l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;mo qingtai;cuan up"] = true,
	},
}
Room {
	id = "gumu/xuantie/pingtai",
	name = "ƽ̨",
	ways = {
		["enter"] = "gumu/xuantie/jianzhong",
		["tiao down"] = "gumu/xuantie/qiaobi",
	},
	nolooks = {
		["tiao down"] = true,
		["enter"] = true,
	},
	precmds = {
		["enter"] = "move stone",
	},
}
Room {
	id = "gumu/xuantie/jianzhong",
	name = "��ڣ",
	ways = {
		["out"] = "gumu/xuantie/pingtai",
	},
	nolooks = {
		["out"] = true,
	},
	precmds = {
		["out"] = "tui shi",
	},
}
Room {
	id = "gumu/xuantie/shandong",
	name = "��ɽ��",
	ways = {
		["out"] = "gumu/xuantie/dongkou",
	},
}
Room {
	id = "gumu/xuantie/shanlu7",
	name = "���",
	ways = {
		["south"] = "gumu/xuantie/shandong",
		["northwest"] = "gumu/xuantie/shanlu8",
	},
}
Room {
	id = "gumu/xuantie/shanlu8",
	name = "���",
	ways = {
		["northup"] = "gumu/xuantie/qiaobi",
		["southeast"] = "gumu/xuantie/shanlu7",
	},
}
Room {
	id = "gumu/xuantie/shushang",
	name = "����",
	ways = {
		["down"] = "gumu/xuantie/shanlu7",
	},
}
Room {
	id = "gumu/xuantie/xiaolu1",
	name = "ɽ·",
	ways = {
		["northup"] = "gumu/xuantie/xiaolu2",
		["south"] = "gumu/xuantie/xiaolu4",
		["s"] = "gumu/xuantie/linhain",
	},
	nolooks = {
		["south"] = true,
		["s"] = true,
	},
	lengths = {
		["south"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
		["s"] = "if score.party and score.party=='��Ĺ��' then return false else return 30 end",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/xiaolu2",
	name = "ɽ·",
	ways = {
		["northup"] = "gumu/xuantie/xiaolu3",
		["southdown"] = "gumu/xuantie/xiaolu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/xiaolu3",
	name = "ɽ·",
	ways = {
		["northwest"] = "gumu/xuantie/dongkou",
		["east"] = "gumu/xuantie/pubu",
		["southdown"] = "gumu/xuantie/xiaolu2",
	},
	room_relative="���ڨIɽ·-----�ٲ���ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/linhain",
	name = "����",
	ways = {
		["#goXtj"] = "gumu/xuantie/xiaolu1",
		["#outXtj"] = "gumu/xuantie/xiaolu4",
	},
	nolooks = {
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "gumu/xuantie/xiaolu4",
	name = "ɽ·",
	ways = {
		["southeast"] = "xiangyang/conglin4",
		["north"]     = "gumu/xuantie/xiaolu1",
		["n"]     = "gumu/xuantie/linhain",
		},
        nolooks = {
                ["north"] = true,
                ["n"] = true,
        },
        lengths = {
                ["north"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
		        ["n"] = "if score.party and score.party=='��Ĺ��' then return false else return 30 end",
		},
		room_relative='ɽ·��ɽ·�Kɽ��յ�ɽ·',
}
Room {
	id = "gumu/xuanya",
	name = "����",
	ways = {
		["north"] = "gumu/rukou",
	},
}
Room {
	id = "gumu/yaofang",
	name = "ҩ��",
	ways = {
		["north"] = "gumu/shitou",
		["west"] = "gumu/fang",
	},
}
Room {
	id = "gumu/ztm",
	name = "������",
	ways = {
		["westdown"] = "gumu/shanlu3",
		["southdown"] = "gumu/jlg",
	},
}
Room {
	id = "hengshan/baiyunan",
	name = "������",
	ways = {
		["south"] = "hengshan/square",
	},
	objs = {
          ["����ʦ̫"] = "dingxian shitai",
          ["֣��"] = "zheng e",
          ["�ؾ�"] = "qin juan",
           },
}
Room {
	id = "hengshan/beiyuedian",
	name = "������",
	ways = {
		["northup"] = "hengshan/shandao1",
		["eastup"] = "hengshan/yuyang",
		["westup"] = "hengshan/huixiantai",
		["southdown"] = "hengshan/beiyuemiao",
	},
}
Room {
	id = "hengshan/beiyuemiao",
	name = "������",
	ways = {
		["northup"] = "hengshan/beiyuedian",
		["east"] = "hengshan/kutianjing",
		["southdown"] = "hengshan/guolaoling",
		["west"] = "hengshan/jijiaoshi",
	},
	objs = {
          ["�Ǻ�"] = "yi he",
          ["����"] = "yi lin",
           },
}
Room {
	id = "hengshan/cuiping1",
	name = "����ɽ��",
	ways = {
		["westup"] = "hengshan/cuiping2",
		["down"] = "hengshan/cuipinggu2",
	},
}
Room {
	id = "hengshan/cuiping2",
	name = "����ɽ��",
	ways = {
		["eastdown"] = "hengshan/cuiping1",
		["eastup"] = "hengshan/xuankong1",
	},
}
Room {
	id = "hengshan/cuipinggu1",
	name = "������",
	ways = {
		["southeast"] = "hengshan/cuipinggu2",
		["northeast"] = "hengshan/jinlongxia",
	},
	objs = {
          ["����"] = "yi wen",
           },
}
Room {
	id = "hengshan/cuipinggu2",
	name = "������",
	ways = {
		["northwest"] = "hengshan/cuipinggu1",
		["up"] = "hengshan/cuiping1",
	},
}
Room {
	id = "hengshan/daziling",
	name = "������",
	ways = {
		["northeast"] = "hengshan/hufengkou",
		["west"] = "hengshan/yunge",
	},
}
Room {
	id = "hengshan/guolaoling",
	name = "������",
	ways = {
		["northup"] = "hengshan/beiyuemiao",
		["westdown"] = "hengshan/tongyuangu",
		["southwest"] = "hengshan/hufengkou",
	},
}
Room {
	id = "hengshan/hufengkou",
	name = "�����",
	ways = {
		["southwest"] = "hengshan/daziling",
		["northeast"] = "hengshan/guolaoling",
		["west"] = "hengshan/xgsong",
	},
}
Room {
	id = "hengshan/huixiantai",
	name = "����̨",
	ways = {
		["eastdown"] = "hengshan/beiyuedian",
	},
}
Room {
	id = "hengshan/jijiaoshi",
	name = "����ʯ",
	ways = {
		["east"] = "hengshan/beiyuemiao",
	},
}
Room {
	id = "hengshan/jinlongxia",
	name = "����Ͽ",
	ways = {
		["southwest"] = "hengshan/cuipinggu1",
		["southdown"] = "changan/northroad10",
		["west"] = "hengshan/mtroad1",
	},
	objs = {
          ["����ʦ̫"] = "dingjing shitai",
           },
}
Room {
	id = "hengshan/kutianjing",
	name = "����",
	ways = {
		["west"] = "hengshan/beiyuemiao",
	},
}
Room {
	id = "hengshan/shandao1",
	name = "���Է�ɽ��",
	ways = {
		["northup"] = "hengshan/shandao2",
		["southdown"] = "hengshan/beiyuedian",
	},
}
Room {
	id = "hengshan/shandao2",
	name = "���Է�ɽ��",
	ways = {
		["eastup"] = "hengshan/square",
		["southdown"] = "hengshan/shandao1",
	},
}
Room {
	id = "hengshan/sjdian",
	name = "���̵�",
	ways = {
		["down"] = "hengshan/xuankong1",
	},
}
Room {
	id = "hengshan/square",
	name = "���Է�㳡",
	ways = {
		["westdown"] = "hengshan/shandao2",
		["north"] = "hengshan/baiyunan",
	},
	objs = {
          ["����ʦ̫"] = "dingyi shitai",
          ["����"] = "yi qing",
           },
}
Room {
	id = "hengshan/tongyuangu",
	name = "ͨԪ��",
	ways = {
		["eastup"] = "hengshan/guolaoling",
	},
}
Room {
	id = "hengshan/xgsong",
	name = "������",
	ways = {
		["east"] = "hengshan/hufengkou",
	},
}
Room {
	id = "hengshan/xuankong1",
	name = "�����±�¥",
	ways = {
		["westdown"] = "hengshan/cuiping2",
		["south"] = "hengshan/zhanqiao",
		["up"] = "hengshan/sjdian",
	},
}
Room {
	id = "hengshan/xuankong2",
	name = "��������¥",
	ways = {
		["southup"] = "hengshan/zhandao",
		["north"] = "hengshan/zhanqiao",
	},
}
Room {
	id = "hengshan/yunge",
	name = "�Ƹ����",
	ways = {
		["east"] = "hengshan/daziling",
		["northdown"] = "hengshan/zhandao",
	},
	objs = {
          ["����"] = "yi zhi",
           },
}
Room {
	id = "hengshan/yuyang",
	name = "��������",
	ways = {
		["westdown"] = "hengshan/beiyuedian",
	},
}
Room {
	id = "hengshan/zhandao",
	name = "��ʽջ��",
	ways = {
		["southup"] = "hengshan/yunge",
		["northdown"] = "hengshan/xuankong2",
	},
}
Room {
	id = "hengshan/zhanqiao",
	name = "����ջ��",
	ways = {
		["south"] = "hengshan/xuankong2",
		["north"] = "hengshan/xuankong1",
	},
}
--add by xieky@sj 20170809
Room {
	id = "hengshan/mtroad",
	name = "ɽ·",
	ways = {
		["south"] = "hengshan/mtyadi",
		["east"] = "hengshan/mtroad1",
	},
	objs = {
          ["����"] = "ding dang",
           },
}
Room {
	id = "hengshan/mtyadi",
	name = "�µ�",
	ways = {
		["north"] = "hengshan/mtroad",
--		["climb lian"] = "???",
	},
}
Room {
	id = "hengshan/mtroad1",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad2",
		["north"] = "hengshan/mtroad1",
		["west"] = "hengshan/mtroad",
		["east"] = "hengshan/jinlongxia",
	},
}
Room {
	id = "hengshan/mtroad2",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad2",
		["north"] = "hengshan/mtroad3",
		["east"] = "hengshan/mtroad1",
		["west"] = "hengshan/mtroad2",
	},
	objs = {
        ["����"] = "Li si",
        ["����"] = "Zhang san",
    },
}
Room {
	id = "hengshan/mtroad3",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad3",
		["east"] = "hengshan/mtroad2",
		["west"] = "hengshan/mtroad3",
	},
	objs = {
        ["�Է�"] = "Qiao fu",
    },
}
Room {
	id = "hengshan/mtroad4",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad6",
		["east"] = "hengshan/mtroad3",
		["west"] = "hengshan/mtroad5",
	},
}
Room {
	id = "hengshan/mtroad5",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad5",
		["north"] = "hengshan/mtroad5",
		["east"] = "hengshan/mtroad4",
		["west"] = "hengshan/mtroad5",
	},
}
Room {
	id = "hengshan/mtroad6",
	name = "����",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad4",
		["east"] = "hengshan/mtroad4",
		["west"] = "hengshan/mtroad4",
	},
	objs = {
        ["ʷ����"] = "shi popo",
    },
}
--add end
Room {
	id = "hj/caochang",
	name = "�ݳ�",
	ways = {
		["westdown"] = "hj/shuijing",
		["east"] = "hj/caoyuan1",
		["northdown"] = "hj/pmchang",
	},
}
Room {
	id = "hj/caoyuan",
	name = "��ԭ��Ե",
	ways = {
		["westup"] = "hj/caoyuan2",
		["southwest"] = "hj/caoyuan1",
		["south"] = "hj/caoyuan",
		["east"] = "xingxiu/shamo",
		["north"] = "hj/caoyuan",
		["s;s;s;s"] = "hj/caoyuan8",
		["n;n;n;n"] = "hj/hswz",
	},
	nolooks = {
		["s;s;s;s"] = true,
		["n;n;n;n"] = true,
	},
	lengths = {
		["s;s;s;s"] = 4,
		["n;n;n;n"] = 4,
	},
	objs = {
          ["������"] = "xiaoxiang zi",
           },
}
Room {
	id = "hj/caoyuan1",
	name = "���ԭ",
	ways = {
		["south"] = "hj/majiu",
		["north"] = "hj/caoyuan2",
		["northeast"] = "hj/caoyuan",
		["west"] = "hj/caochang",
	},
	room_relative = "��ԭ��ԭ��Ե���J�ݳ�----���ԭ��������ԭ",
	nolooks = {
		["down"] = true,
	},
	objs = {
          ["����"] = "mian yang",
           },
}
Room {
	id = "hj/caoyuan10",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan",
		["north"] = "hj/caoyuan9",
		["east"] = "hj/caoyuan8",
		["west"] = "hj/caoyuan7",
	},
	room_relative="���ԭ�����ԭ----���ԭ----���ԭ����ԭ��Ե���ԭ",
}
Room {
	id = "hj/caoyuan2",
	name = "��ԭ",
	ways = {
		["northup"] = "hj/road1",
		["eastdown"] = "hj/caoyuan",
		["south"] = "hj/caoyuan1",
		["northwest"] = "hj/shop",
		["north"] = "xueshan/caoyuan/caohai1",
		["west"] = "hj/pmchang",
	},
	room_relative="������С��ݺ��I������-----��ԭ����ԭ��Ե�����ԭ��ԭ",
}
Room {
	id = "hj/caoyuan4",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan5",
		["north"] = "hj/caoyuan5",
		["east"] = "hj/caoyuan5",
		["west"] = "hj/caoyuan5",
	},
	room_relative="���ԭ�����ԭ----���ԭ----���ԭ�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan5",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan4",
		["north"] = "hj/caoyuan4",
		["east"] = "hj/caoyuan4",
		["west"] = "hj/road1",
	},
	room_relative="���ԭ��С·----���ԭ----���ԭ�����ԭ���ԭ",
	objs = {
          ["����"] = "mian yang",
          ["������"] = "tianlin niao",
           },
}
Room {
	id = "hj/caoyuan6",
	name = "���ԭ",
	ways = {
		["southwest"] = "hj/road2",
		["south"] = "hj/caoyuan",
		["northwest"] = "hj/room-ji",
		["east"] = "hj/caoyuan",
	},
	room_relative="����I���ԭ----��ԭ��Ե�L��С·��ԭ��Ե���ԭ",
}
Room {
	id = "hj/caoyuan7",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan8",
		["north"] = "hj/room-su",
		["east"] = "hj/caoyuan",
		["west"] = "hj/caoyuan9",
	},
	room_relative ="��³�˵ļң����ԭ----���ԭ----��ԭ��Ե�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan8",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan9",
		["north"] = "hj/room-che",
		["east"] = "hj/caoyuan",
		["west"] = "hj/caoyuan7",
	},
	room_relative ="������ļң����ԭ----���ԭ----��ԭ��Ե�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan9",
	name = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan",
		["east"] = "hj/caoyuan8",
		["north"] = "hj/caoyuan",
		["west"] = "hj/caoyuan7",
	},
	room_relative ="��ԭ��Ե�����ԭ----���ԭ----���ԭ����ԭ��Ե���ԭ",
	objs = {
          ["����"] = "mian yang",
           },
}
Room {
	id = "hj/gebin",
	name = "����",
	ways = {
		["#outGb"] = "hj/room-ji",
	},
	nolooks = {
		["#outGb"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
}
Room {
	id = "hj/hsk",
	name = "����������",
	ways = {
		["southwest"] = "hj/room-che",
		["east"] = "hj/caoyuan",
		["west"] = "hj/majiu",
	},
	objs = {
          ["������"] = "tianlin niao",
          ["����"] = "ru lao",
          ["�����˸�Ů"] = "hasake",
           },
}
Room {
	id = "hj/hswz",
	name = "��ʯΧ��",
	ways = {
		["southeast"] = "xingxiu/shamo13",
		["southwest"] = "hj/caoyuan10",
		["south"] = "xingxiu/shamo13",
		["north"] = "hj/gebin",
	},
	lengths={
	    ["north"] = 10 ,
	},
}
Room {
	id = "hj/luzhou",
	name = "�ؽ�����",
	ways = {
		["southeast"] = "hj/gebin",
		["southwest"] = "hj/gebin",
		["northwest"] = "hj/gebin",
		["northeast"] = "hj/gebin",
	},
}
Room {
	id = "hj/majiu",
	name = "����",
	ways = {
		["east"] = "hj/hsk",
		["north"] = "hj/caoyuan1",
		["west"] = "hj/caoyuan7",
	},
}
Room {
	id = "hj/mg-door",
	name = "�߲��Թ�",
	ways = {
		["eastdown"] = "hj/shulin1",
	},
}
Room {
	id = "hj/mg-indoor",
	name = "�߲��Թ�",
	ways = {
		["east"] = "hj/mg3",
		["west"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg-room1",
	name = "�Թ�����",
	ways = {
		["south"] = "hj/tianjin",
		["northwest"] = "hj/mg-room3",
		["north"] = "hj/mg-room2",
		["northeast"] = "hj/mg-room4",
	},
}
Room {
	id = "hj/mg-room2",
	name = "�Թ�����",
	ways = {
		["south"] = "hj/mg-room1",
	},
}
Room {
	id = "hj/mg-room3",
	name = "�Թ�����",
	ways = {
		["southeast"] = "hj/mg-room1",
		["northeast"] = "hj/mg-room5",
	},
}
Room {
	id = "hj/mg-room4",
	name = "�Թ�����",
	ways = {
		["southwest"] = "hj/mg-room1",
		["northwest"] = "hj/mg-room5",
	},
}
Room {
	id = "hj/mg-room5",
	name = "�Թ�����",
	ways = {
		["southeast"] = "hj/mg-room4",
		["southwest"] = "hj/mg-room3",
	},
}
Room {
	id = "hj/mg1",
	name = "�߲��Թ�",
	ways = {
		["north"] = "hj/mg2",
	},
}
Room {
	id = "hj/mg2",
	name = "�߲��Թ�",
	ways = {
		["south"] = "hj/mg1",
		["north"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg3",
	name = "�߲��Թ�",
	ways = {
		["south"] = "hj/mg4",
		["east"] = "hj/mg4",
		["north"] = "hj/mg4",
		["west"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg4",
	name = "�߲��Թ�",
	ways = {
		["south"] = "hj/mg3",
		["north"] = "hj/mg3",
		["east"] = "hj/mg3",
		["west"] = "hj/mg3",
	},
}
Room {
	id = "hj/pmchang",
	name = "����",
	ways = {
		["southup"] = "hj/caochang",
		["southwest"] = "hj/shuijing",
		["north"] = "hj/shop",
		["east"] = "hj/caoyuan2",
		["west"] = "group/entry/hjroad",
	},
	objs = {
          ["�´ﺣ"] = "chen dahai",
          ["����"] = "mian yang",
           },
}
Room {
	id = "hj/road1",
	name = "С·",
	ways = {
		["east"] = "hj/caoyuan4",
		["northeast"] = "hj/road2",
		["southdown"] = "hj/caoyuan2",
		["west"] = "hj/shop",
	},
	room_relative="С·�J������С��-----С·-----���ԭ����ԭС·",
}
Room {
	id = "hj/road2",
	name = "С·",
	ways = {
		["southwest"] = "hj/road1",
		["north"] = "hj/room-ji",
		["northeast"] = "hj/caoyuan6",
	},
	room_relative="������ԭ���JС·�LС·С·",
}
Room {
	id = "hj/room-che",
	name = "������ļ�",
	ways = {
		["south"] = "hj/caoyuan8",
		["east"] = "hj/caoyuan8",
		["northeast"] = "hj/hsk",
		["west"] = "hj/caoyuan8",
	},
}
Room {
	id = "hj/room-ji",
	name = "����",
	ways = {
		["southeast"] = "hj/caoyuan6",
		["south"] = "hj/road2",
		["enter"] = "hj/room-ji1",
		--["northwest"] = "hj/gebin",
	},
}
Room {
	id = "hj/room-ji1",
	name = "С��",
	ways = {
		["out"] = "hj/room-ji",
	},
	objs = {
          ["������"] = "ji laoren",
          ["������"] = "li wenxiu",
           },
}
Room {
	id = "hj/room-su",
	name = "��³�˵ļ�",
	ways = {
		["south"] = "hj/caoyuan7",
		["east"] = "hj/caoyuan7",
		["northeast"] = "hj/shuijing",
		["west"] = "hj/caoyuan7",
	},
	objs = {
          ["��³��"] = "su luke",
           },
}
Room {
	id = "hj/senlin",
	name = "��Ҷ��",
	ways = {
		["southeast"] = "hj/shanqiu",
		["northwest"] = "xingxiu/tianshan",
		["northeast"] = "xingxiu/shanjiao",
	},
}

--[[
Room {
	id = "hj/senlinn",
	name = "��Ҷ��",
	ways = {
		["#outZyl"] = "hj/senlin",
	},
	nolooks = {
		["#outZyl"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	lengths = {
		["#outZyl"] = 80,
	},
}
--]]
Room {
	id = "hj/senlinn",
	name = "��Ҷ��",
	ways = {
		["east"] = "hj/senlin2",
	},
}
Room {
	id = "hj/senlin2",
	name = "��Ҷ��",
	ways = {
		["south"] = "hj/senlin3",
	},
}
Room {
	id = "hj/senlin3",
	name = "��Ҷ��",
	ways = {
		["west"] = "hj/senlin4",
	},
}
Room {
	id = "hj/senlin4",
	name = "��Ҷ��",
	ways = {
		["north"] = "hj/senlin5",
	},
}
Room {
	id = "hj/senlin5",
	name = "��Ҷ��",
	ways = {
		["east"] = "hj/senlin6",
	},
}
Room {
	id = "hj/senlin6",
	name = "��Ҷ��",
	ways = {
		["south"] = "hj/senlin7",
	},
}
Room {
	id = "hj/senlin7",
	name = "��Ҷ��",
	ways = {
		["west"] = "hj/senlin8",
	},
}
Room {
	id = "hj/senlin8",
	name = "��Ҷ��",
	ways = {
		["north"] = "hj/senlin9",
	},
}

Room {
	id = "hj/senlin9",
	name = "��Ҷ��",
	ways = {
		["north"] = "hj/senlin10",
	},
}
Room {
	id = "hj/senlin10",
	name = "��Ҷ��",
	ways = {
		["east"] = "hj/senlin11",
	},
}
Room {
	id = "hj/senlin11",
	name = "��Ҷ��",
	ways = {
		["#outZyl"] = "hj/senlin",
	},
	nolooks = {
		["#outZyl"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	lengths = {
		["#outZyl"] = 80,
	},
}
Room {
	id = "hj/shanqiu",
	name = "Сɽ��",
	ways = {
		["eastdown"] = "group/entry/hjroad",
		["westdown"] = "hj/senlinn",
		["south"] = "hj/caoyuan9",
	},
	objs = {
          ["����"] = "su pu",
           },
}
Room {
	id = "hj/shop",
	name = "������С��",
	ways = {
		["southeast"] = "hj/caoyuan2",
		["south"] = "hj/pmchang",
		["northwest"] = "hj/sroom",
		["east"] = "hj/road1",
	},
}
Room {
	id = "hj/shuijing",
	name = "������",
	ways = {
		["eastup"] = "hj/caochang",
		["southwest"] = "hj/room-su",
		["northeast"] = "hj/pmchang",
	},
}
Room {
	id = "hj/shulin",
	name = "ɽ��",
	ways = {
		["south"] = "hj/gebin",
		["northwest"] = "hj/shulin1",
		["east"] = "hj/gebin",
		["north"] = "hj/gebin",
	},
}
Room {
	id = "hj/shulin1",
	name = "ɽ��",
	ways = {
		["southeast"] = "hj/shulin",
		["westup"] = "hj/mg-door",
	},
}
Room {
	id = "hj/sroom",
	name = "����������",
	no_fight = true,
	ways = {
		["southeast"] = "hj/shop",
	},
}
Room {
	id = "hj/tianjin",
	name = "�쾮",
	ways = {
		["north"] = "hj/mg-room1",
	},
}
Room {
	id = "hmy/andao1",
	name = "����",
	ways = {
		["north"] = "hmy/andao2",
		["west"] = "hmy/houdian",
	},
}
Room {
	id = "hmy/andao2",
	name = "����",
	ways = {
		["south"] = "hmy/andao1",
		["east"] = "hmy/andao3",
	},
}
Room {
	id = "hmy/andao3",
	name = "����",
	ways = {
		["north"] = "hmy/andao4",
		["west"] = "hmy/andao2",
	},
}
Room {
	id = "hmy/andao4",
	name = "����",
	ways = {
		["south"] = "hmy/andao3",
		["west"] = "hmy/andao5",
	},
}
Room {
	id = "hmy/andao5",
	name = "����",
	ways = {
		["east"] = "hmy/andao4",
		["northeast"] = "hmy/andao6",
	},
}
Room {
	id = "hmy/andao6",
	name = "����",
	ways = {
		["southwest"] = "hmy/andao5",
		["northwest"] = "hmy/andao7",
	},
}
Room {
	id = "hmy/andao7",
	name = "����",
	ways = {
		["southeast"] = "hmy/andao6",
		["north"] = "hmy/andao8",
	},
}
Room {
	id = "hmy/andao8",
	name = "����",
	ways = {
		["southeast"] = "hmy/andao7",
		["enter"] = "hmy/jail_gate",
	},
}
Room {
	id = "hmy/baichi",
	name = "�����",
	ways = {
		["eastup"] = "hmy/suo",
		["westup"] = "hmy/shijie",
		["south"] = "hmy/meimao",
		["eastdown"] = "hmy/shandao2",
	},
}
Room {
	id = "hmy/baihutang",
	name = "�׻���",
	ways = {
		["south"] = "hmy/changlang",
		["east"] = "hmy/zhuquetang",
	},
	objs = {
          ["ɣ����"] = "sang sanniang",
           },
}
Room {
	id = "hmy/baizhang",
	name = "����Ȫ",
	ways = {
		["eastup"] = "hmy/yupingpu",
		["south"] = "hmy/qiangu",
	},
}
Room {
	id = "hmy/cddian",
	name = "�ɵµ�",
	ways = {
		["south"] = "hmy/dadian",
		["north"] = "hmy/changlang2",
		["west"] = "hmy/zhuquetang",
	},
}
Room {
	id = "hmy/changlang",
	name = "����",
	ways = {
		["south"] = "hmy/fleitang",
		["east"] = "hmy/dadian",
		["north"] = "hmy/baihutang",
		["west"] = "hmy/qiandian",
	},
	objs = {
          ["������"] = "chou songnian",
           },
}
Room {
	id = "hmy/changlang2",
	name = "����",
	ways = {
		["south"] = "hmy/cddian",
		["east"] = "hmy/qqiudian",
		["west"] = "hmy/qlongtang",
	},
}
Room {
	id = "hmy/changlang3",
	name = "����",
	ways = {
		["south"] = "hmy/shufang",
		["north"] = "hmy/lgfang",
		["east"] = "hmy/changlang4",
		["west"] = "hmy/qqiudian",
	},
}
Room {
	id = "hmy/changlang4",
	name = "����",
	ways = {
		["south"] = "hmy/changlang6",
		["north"] = "hmy/xiuxishi",
		["east"] = "hmy/shifang",
		["west"] = "hmy/changlang3",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	}
}
Room {
	id = "hmy/changlang5",
	name = "����",
	ways = {
		["south"] = "hmy/houhuayen",
		["east"] = "hmy/houdian",
		["north"] = "hmy/dadian",
		["west"] = "hmy/fleitang",
	},
}
Room {
	id = "hmy/changlang6",
	name = "����",
	ways = {
		["south"] = "hmy/houdian",
		["east"] = "hmy/yiting",
		["north"] = "hmy/changlang4",
		["west"] = "hmy/dadian",
	},
}
Room {
	id = "hmy/changtan",
	name = "��̲",
	ways = {
		["east"] = "hmy/shandao",
		["dutan"] = "hmy/xxtan",
	},
}
Room {
	id = "hmy/chengdedian",
	name = "�ɵµ�",
	ways = {
		["south"] = "hmy/dadian",
		["north"] = "hmy/changlang2",
		["west"] = "hmy/zhuquetang",
	},
}
Room {
	id = "hmy/dadian",
	name = "���",
	ways = {
		["south"] = "hmy/changlang5",
		["east"] = "hmy/changlang6",
		["north"] = "hmy/cddian",
		["west"] = "hmy/changlang",
	},
}
Room {
	id = "hmy/dedao",
	name = "�ص�",
	ways = {
		["down"] = "hmy/xhuayuan",
		["up"] = "hmy/shiwu",
	},
}
Room {
	id = "hmy/fengleitang",
	name = "������",
	ways = {
		["east"] = "hmy/changlang5",
		["north"] = "hmy/changlang",
	},
}
Room {
	id = "hmy/fleitang",
	name = "������",
	ways = {
		["east"] = "hmy/changlang5",
		["north"] = "hmy/changlang",
	},
}
Room {
	id = "hmy/guanpu",
	name = "����ͤ",
	ways = {
		["northup"] = "hmy/moyun",
		["south"] = "hmy/yupingpu",
	},
}
Room {
	id = "hmy/houdian",
	name = "���",
	ways = {
		["north"] = "hmy/changlang6",
		["west"] = "hmy/changlang5",
	},
	objs = {
          ["�ܹ�ͩ"] = "zhou gutong",
          ["���Ӣ"] = "wu baiying",
           },
}
Room {
	id = "hmy/houhuayen",
	name = "��԰",
	ways = {
		["north"] = "hmy/changlang5",
		["west"] = "hmy/shiwu",
	},
}
Room {
	id = "hmy/jail_gate",
	name = "��������",
	ways = {
		["out"] = "hmy/andao8",
	},
}
Room {
	id = "hmy/lgfang",
	name = "������",
	ways = {
		["south"] = "hmy/changlang3",
	},
}
Room {
	id = "hmy/liangting",
	name = "��ͤ",
	ways = {
		["west"] = "hmy/shidao2",
	},
	objs = {
          ["������"] = "xiang wentian",
           },
}
Room {
	id = "hmy/lianhua",
	name = "��Ѫ��",
	ways = {
		["eastdown"] = "hmy/xianren",
		["east"] = "hmy/wulao",
		["west"] = "hmy/yupingpu",
	},
	objs = {
          ["Ұ��"] = "ye lang",
          ["�۷�"] = "mi feng",
           },
}
Room {
	id = "hmy/meimao",
	name = "üë��",
	ways = {
		["north"] = "hmy/baichi",
		["southdown"] = "hmy/taohua",
	},
	objs = {
          ["С��"] = "xiao hou",
           },
}
Room {
	id = "hmy/midao6",
	name = "�ص�",
	ways = {
		["north"] = "hmy/suo",
		["west"] = "hmy/suo",
	},
}
Room {
	id = "hmy/moyun",
	name = "������",
	ways = {
		["southdown"] = "hmy/guanpu",
	},
}
Room {
	id = "hmy/pailou",
	name = "��¥",
	ways = {
		["east"] = "hmy/xiangfang",
		["north"] = "hmy/shibanlu",
		["west"] = "hmy/yading",
	},
}
Room {
	id = "hmy/pingding/cj1",
	name = "����",
	ways = {
		["east"] = "hmy/pingding/cj2",
		["west"] = "hmy/pingding/gate1",
	},
	room_relative="����-----����-----���ֳ���",
}
Room {
	id = "hmy/pingding/cj2",
	name = "����",
	ways = {
		["northeast"] = "hmy/pingding/cj3",
		["west"] = "hmy/pingding/cj1",
		["south"] = "hmy/pingding/xchidian",
	},
	room_relative="���֨J����-----���֣�С�Ե곤��",
}
Room {
	id = "hmy/pingding/cj3",
	name = "����",
	ways = {
		["east"] = "hmy/pingding/cj5",
		["southeast"] = "hmy/pingding/kedian",
		["southwest"] = "hmy/pingding/cj2",
		["north"] = "hmy/pingding/cj4",
		["west"] = "hmy/pingding/yaopu",
	},
	room_relative="���֣�ҩ��-----����-----���֨L�K����ƽ���͵곤��",
}
Room {
	id = "hmy/pingding/cj4",
	name = "����",
	ways = {
		["south"] = "hmy/pingding/cj3",
		["north"] = "hmy/pingding/gate2",
	},
	room_relative="���ţ����֣����ֳ���",
}
Room {
	id = "hmy/pingding/cj5",
	name = "����",
	ways = {
		["east"] = "hmy/pingding/dongmen",
		["west"] = "hmy/pingding/cj3",
	},
	room_relative="����-----����-----���ų���",
}
Room {
	id = "hmy/pingding/dongmen",
	name = "����",
	ways = {
		["east"] = "hmy/pingding/road6",
		["west"] = "hmy/pingding/cj5",
	},
}
Room {
	id = "hmy/pingding/gate1",
	name = "����",
	ways = {
		["east"] = "hmy/pingding/cj1",
		["west"] = "hmy/pingding/road3",
	},
}
Room {
	id = "hmy/pingding/gate2",
	name = "����",
	ways = {
		["south"] = "hmy/pingding/cj4",
		["north"] = "hmy/pingding/road4",
	},
}
Room {
	id = "hmy/pingding/kedian",
	name = "ƽ���͵�",
	no_fight = true,
	ways = {
		["northwest"] = "hmy/pingding/cj3",
		["north"] = "hmy/pingding/kefang",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "hmy/pingding/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "hmy/pingding/kedian3",
		["down"] = "hmy/pingding/kedian",
	},
}
Room {
	id = "hmy/pingding/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "hmy/pingding/kedian2",
	},
}
Room {
	id = "hmy/pingding/kefang",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "hmy/pingding/kedian",
	},
}
Room {
	id = "hmy/pingding/road1",
	name = "��·",
	ways = {
		["northeast"] = "group/entry/hmyroad2",
		["west"] = "changan/northroad10",
	},
	room_relative="��·�J���-----��·��·",
}
Room {
	id = "hmy/pingding/road3",
	name = "��·",
	ways = {
		["westdown"] = "group/entry/hmyroad2",
		["east"] = "hmy/pingding/gate1",
	},
	room_relative="��·����·-----������·",
}
Room {
	id = "hmy/pingding/road4",
	name = "��·",
	ways = {
		["south"] = "hmy/pingding/gate2",
		["northwest"] = "hmy/pingding/road5",
	},
	room_relative="��·�I��·��������·",
}
Room {
	id = "hmy/pingding/road5",
	name = "��·",
	ways = {
		["northwest"] = "hmy/shidao",
		["southeast"] = "hmy/pingding/road4",
	},
	room_relative="ʯ���I��·�K��·��·",
}
Room {
	id = "hmy/pingding/road6",
	name = "��·",
	ways = {
		["eastup"] = "hmy/pingding/road7",
		["west"] = "hmy/pingding/dongmen",
	},
	room_relative="����-----��·����·��·",
}
Room {
	id = "hmy/pingding/road7",
	name = "��·",
	ways = {
		["westdown"] = "hmy/pingding/road6",
		["east"] = "group/entry/hmyroad8",
	},
	room_relative="��·����·-----��·��·",
}
Room {
	id = "hmy/pingding/road9",
	name = "��·",
	ways = {
		["northwest"] = "group/entry/hmyroad8",
		["east"] = "cangzhou/sancakou",
	},
	room_relative="��·�I��·-----����·��·",
}
Room {
	id = "hmy/pingding/xchidian",
	name = "С�Ե�",
	ways = {
		["north"] = "hmy/pingding/cj2",
	},
}
Room {
	id = "hmy/pingding/yaopu",
	name = "ҩ��",
	ways = {
		["east"] = "hmy/pingding/cj3",
	},
}
Room {
	id = "hmy/qiandian",
	name = "ǰ��",
	ways = {
		["east"] = "hmy/changlang",
		["west"] = "hmy/shibanlu",
	},
	blocks = {
		["east"] = {
			{id = "shi zhe", exp = 1500000},
		}
	},
}
Room {
	id = "hmy/qiangu",
	name = "ǧ��ʯ",
	ways = {
		["north"] = "hmy/baizhang",
	},
	objs = {
          ["Ұ��"] = "ye lang",
           },
}
Room {
	id = "hmy/qlongtang",
	name = "������",
	ways = {
		["east"] = "hmy/changlang2",
	},
	objs = {
          ["�Ϲ���"] = "shangguan yun",
           },
}
Room {
	id = "hmy/qqiudian",
	name = "ǧ���",
	ways = {
		["east"] = "hmy/changlang3",
		["west"] = "hmy/changlang2",
	},
	objs = {
          ["����"] = "qu yang",
           },
}
Room {
	id = "hmy/rusheng",
	name = "��ʤͤ",
	ways = {
		["north"] = "hmy/wulao",
	},
	objs = {
          ["С��"] = "xiao hou",
           },
}
Room {
	id = "hmy/ryping",
	name = "����ƺ",
	ways = {
		["eastdown"] = "hmy/shimen",
		["#hmyUp"] = "hmy/yading",
	},
	lengths = {
		["#hmyUp"] = "if not skills['dodge'] or skills['dodge'].lvl<200 or hp.neili_max<4000 then return false else return 10 end",
	},
}
Room {
	id = "hmy/shandao",
	name = "ɽ��",
	ways = {
		["westup"] = "hmy/shandao2",
		["west"] = "hmy/changtan",
	},
}
Room {
	id = "hmy/shandao2",
	name = "ɽ��",
	ways = {
		["eastdown"] = "hmy/shandao",
		["westup"] = "hmy/baichi",
	},
}
Room {
	id = "hmy/shibanlu",
	name = "ʯ��·",
	ways = {
		["south"] = "hmy/pailou",
		["east"] = "hmy/qiandian",
	},
	lengths = {
		["east"] = "if hp.exp > 1500000 then return 1 else return false end",
	},
}
Room {
	id = "hmy/shidao",
	name = "ʯ��",
	ways = {
		["southeast"] = "hmy/pingding/road5",
		["north"] = "hmy/shidao2",
	},
}
Room {
	id = "hmy/shidao2",
	name = "ʯ��",
	ways = {
		["westdown"] = "hmy/xxtan",
		["south"] = "hmy/shidao",
		["east"] = "hmy/liangting",
	},
	objs = {
          ["����"] = "wang cheng",
           },
}
Room {
	id = "hmy/shifang",
	name = "��ʳ��",
	no_fight = true,
	ways = {
		["west"] = "hmy/changlang4",
	},
	objs = {
          ["��÷��"] = "suanmei tang",
          ["����"] = "zong zi",
          ["��ʦ"] = "chu zi",
           },
}
Room {
	id = "hmy/shijie",
	name = "ʯ��",
	ways = {
		["eastdown"] = "hmy/baichi",
		["westup"] = "hmy/shijie2",
	},
}
Room {
	id = "hmy/shijie2",
	name = "ʯ��",
	ways = {
		["eastdown"] = "hmy/shijie",
		["westup"] = "hmy/shimen",
	},
}
Room {
	id = "hmy/shimen",
	name = "ʯ��",
	ways = {
		["eastdown"] = "hmy/shijie2",
		["#toRyp"] = "hmy/ryping",
	},
	nolooks = {
		["#toRyp"] = true,
		["westup"] = true,
	},
	lengths = {
		["#toRyp"] = 50,
	},
	objs = {
          ["�ֲ�"] = "jia bu",
           },
}
Room {
	id = "hmy/shiwu",
	name = "Сʯ��",
	ways = {
		["east"] = "hmy/houhuayen",
	},
}
Room {
	id = "hmy/shufang",
	name = "�鷿",
	ways = {
		["north"] = "hmy/changlang3",
	},
}
Room {
	id = "hmy/suo",
	name = "����",
	ways = {
		["westdown"] = "hmy/baichi",
	},
}
Room {
	id = "hmy/taohua",
	name = "�һ���",
	ways = {
		["northup"] = "hmy/meimao",
		["westup"] = "hmy/zisi",
		["west"] = "hmy/ziyun",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "hmy/wulao",
	name = "���Ϸ�",
	ways = {
		["south"] = "hmy/rusheng",
		["east"] = "hmy/ziyun",
		["north"] = "hmy/yiping",
		["west"] = "hmy/lianhua",
	},
	objs = {
          ["Ұ��"] = "ye lang",
          ["С��"] = "xiao hou",
           },
}
Room {
	id = "hmy/xhuayuan",
	name = "С��԰",
	ways = {
		["west"] = "hmy/xiaoshe",
		["up"] = "hmy/dedao",
	},
}
Room {
	id = "hmy/xian",
	name = "���˶�",
	ways = {
		["westdown"] = "hmy/xianren",
	},
}
Room {
	id = "hmy/xiangfang",
	name = "�᷿",
	no_fight = true,
	ways = {
		["west"] = "hmy/pailou",
	},
}
Room {
	id = "hmy/xianren",
	name = "����ָ·",
	ways = {
		["eastup"] = "hmy/xian",
		["westup"] = "hmy/lianhua",
	},
	objs = {
          ["����"] = "hu die",
           },
}
Room {
	id = "hmy/xiaoshe",
	name = "С��",
	ways = {
		["east"] = "hmy/xhuayuan",
	},
}
Room {
	id = "hmy/xiuxishi",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "hmy/changlang4",
	},
}
Room {
	id = "hmy/xxtan",
	name = "����̲",
	ways = {
		["eastup"] = "hmy/shidao2",
		["dutan"] = "hmy/changtan"
	},
}
Room {
	id = "hmy/yading",
	name = "�¶�",
	ways = {
		["east"] = "hmy/pailou",
		["#hmyDown"] = "hmy/ryping",
	},
	lengths = {
		["#hmyDown"] = "if hp.neili_max>4000 then return 10 else return false end",
	},
	objs = {
          ["����ʹ��"] = "shi zhe",
           },
}
Room {
	id = "hmy/yiping",
	name = "һƷ��",
	ways = {
		["south"] = "hmy/wulao",
	},
}
Room {
	id = "hmy/yiting",
	name = "������",
	ways = {
		["west"] = "hmy/changlang6",
	},
}
Room {
	id = "hmy/yupingpu",
	name = "������",
	ways = {
		["westdown"] = "hmy/baizhang",
		["east"] = "hmy/lianhua",
		["north"] = "hmy/guanpu",
	},
}
Room {
	id = "hmy/zhuquetang",
	name = "��ȸ��",
	ways = {
		["east"] = "hmy/cddian",
		["west"] = "hmy/baihutang",
	},
	objs = {
          ["�����"] = "bao dachu",
           },
}
Room {
	id = "hmy/zisi",
	name = "��ʯ��",
	ways = {
		["eastdown"] = "hmy/taohua",
	},
	objs = {
          ["�۷�"] = "mi feng",
           },
}
Room {
	id = "hmy/ziyun",
	name = "������",
	ways = {
		["east"] = "hmy/taohua",
		["west"] = "hmy/wulao",
	},
}
Room {
	id = "huanghe/bingcao",
	name = "������",
	ways = {
		["southwest"] = "huanghe/shixiazi",
		["northeast"] = "huanghe/yinpanshui",
	},
}
Room {
	id = "huanghe/caodi1",
	name = "�ݵ�",
	ways = {
		["south"] = "city/hsroad1",
		["west"] = "huanghe/caodi2",
	},
}
Room {
	id = "huanghe/caodi2",
	name = "�ݵ�",
	ways = {
		["east"] = "huanghe/caodi1",
		["west"] = "huanghe/shulin1",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
           },
}
Room {
	id = "huanghe/cschang",
	name = "��ʯ��",
	no_fight = true,
	ways = {
		["northup"] = "huanghe/hhgate",
	},
	objs = {
          ["���"] = "li gonggong",
           },
}
Room {
	id = "huanghe/daba",
	name = "�ƺӴ��",
	no_fight = true,
	ways = {
		["southdown"] = "huanghe/huanghe7",
	},
}
Room {
	id = "huanghe/dacaigou",
	name = "���",
	ways = {
		["southwest"] = "huanghe/gulang",
		["north"] = "huanghe/wuqiao",
	},
}
Room {
	id = "huanghe/fendi",
	name = "Ĺ��",
	no_fight = true,
	ways = {
		["south"] = "huanghe/shulin6",
	},
	objs = {
          ["���"] = "hu fei",
           },
}
Room {
	id = "huanghe/gchang",
	name = "�㳡",
	ways = {
		["east"] = "huanghe/hhgate",
		["west"] = "huanghe/xyting",
	},
	objs = {
          ["Ǯ�ཡ"] = "qian qingjian",
          ["������"] = "wu qinglie",
           },
}
Room {
	id = "huanghe/guchangcheng",
	name = "�ų���",
	ways = {
		["southeast"] = "huanghe/shimen",
		["southwest"] = "huanghe/yinpanshui",
	},
}
Room {
	id = "huanghe/gulang",
	name = "����",
	ways = {
		["east"] = "huanghe/yaocaidian",
		["northeast"] = "huanghe/dacaigou",
		["west"] = "huanghe/xiaojiaqiao",
	},
}
Room {
	id = "huanghe/hetao",
	name = "����",
	ways = {
		["south"] = "huanghe/weifen",
		["northwest"] = "huanghe/huanghe_1",
	},
}
Room {
	id = "huanghe/hhgate",
	name = "�ƺӰ�կ��",
	ways = {
		["east"] = "huanghe/huanghe1",
		["southdown"] = "huanghe/cschang",
		["west"] = "huanghe/gchang",
	},
	objs = {
          ["�����"] = "shen qinggang",
          ["������"] = "ma qingxiong",
           },
}
Room {
	id = "huanghe/hongshanxia",
	name = "��ɽϿ",
	ways = {
		["south"] = "huanghe/jingyuan",
		["north"] = "huanghe/shimen",
	},
}
Room {
	id = "huanghe/huanghe1",
	name = "�ƺӰ���",
	ways = {
		["south"] = "huanghe/tiandi4",
		["north"] = "huanghe/weifen",
		["east"] = "huanghe/huanghe2",
		["west"] = "huanghe/hhgate",
	},
	objs = {
          ["��ͨ��"] = "hou tonghai",
           },
}
Room {
	id = "huanghe/huanghe2",
	name = "�ƺӰ���",
	ways = {
		["east"] = "huanghe/huanghe3",
		["west"] = "huanghe/huanghe1",
	},
}
Room {
	id = "huanghe/huanghe3",
	name = "�ƺӰ���",
	ways = {
		["east"] = "huanghe/huanghe4",
		["west"] = "huanghe/huanghe2",
	},
}
Room {
	id = "huanghe/huanghe4",
	name = "�ƺӰ���",
	ways = {
		["northeast"] = "huanghe/huanghe5",
		["west"] = "huanghe/huanghe3",
	},
}
Room {
	id = "huanghe/huanghe5",
	name = "�ƺӰ���",
	ways = {
		["southwest"] = "huanghe/huanghe4",
		["east"] = "taishan/daizong",
		["northeast"] = "huanghe/huanghe6",
	},
}
Room {
	id = "huanghe/huanghe6",
	name = "�ƺӰ���",
	ways = {
		["southwest"] = "huanghe/huanghe5",
		["northeast"] = "huanghe/huanghe7",
	},
	objs = {
          ["������"] = "lin yulong",
          ["�η���"] = "ren feiyan",
           },
}
Room {
	id = "huanghe/huanghe7",
	name = "�ƺӰ���",
	ways = {
		["northup"] = "huanghe/daba",
		["southwest"] = "huanghe/huanghe6",
		["northwest"] = "huanghe/yyd/damen",
		["northeast"] = "huanghe/huanghe8",
	},
}
Room {
	id = "huanghe/huanghe8",
	name = "�ƺ��뺣��",
	ways = {
		["southwest"] = "huanghe/huanghe7",
		["north"] = "huanghe/road2",
	},
}
Room {
	id = "huanghe/huanghe_1",
	name = "�ƺ�",
	ways = {
		["southeast"] = "huanghe/hetao",
		["northwest"] = "huanghe/huangtu",
	},
}
Room {
	id = "huanghe/huanghe_2",
	name = "�ƺ�",
	ways = {
		["northeast"] = "huanghe/huangtu",
		["west"] = "huanghe/huanghe_3",
	},
}
Room {
	id = "huanghe/huanghe_3",
	name = "�ƺ�",
	ways = {
		["east"] = "huanghe/huanghe_2",
	},
}
Room {
	id = "huanghe/huangtu",
	name = "������ԭ",
	ways = {
		["southeast"] = "huanghe/huanghe_1",
		["northwest"] = "changan/road2",
	},
}
Room {
	id = "huanghe/jingyuan",
	name = "��Զ",
	ways = {
		["south"] = "huanghe/shamo",
		["north"] = "huanghe/hongshanxia",
	},
}
Room {
	id = "huanghe/kedian",
	name = "�͵�",
	no_fight = true,
	ways = {
		["up"] = "huanghe/kedian2",
	},
}
Room {
	id = "huanghe/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "huanghe/kedian3",
		["down"] = "huanghe/kedian",
	},
}
Room {
	id = "huanghe/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "huanghe/kedian2",
	},
}
Room {
	id = "huanghe/road2",
	name = "��ɿ�",
	ways = {
		["south"] = "huanghe/huanghe8",
		["#duHhe"] = "huanghe/road3",
		["#ptoSld"] = "sld/dukou",
	},
	nolooks = {
		["enter"] = true,
		["#duHhe"] = true,
		["#ptoSld"] = true,
	},
	lengths = {
		["#duHhe"] = 10000,
		["#ptoSld"] = "if score.party and score.party=='������' then return 10 else return false end",
     },
}
Room {
	id = "huanghe/road3",
	name = "��ɿ�",
	ways = {
		["north"] = "cangzhou/sroad4",
		["#duHhe"] = "huanghe/road2",
	},
	lengths = {
		["#duHhe"] = 10000,
	},
	nolooks = {
		["enter"] = true,
		["#duHhe"] = true,
	},
}
Room {
	id = "huanghe/shamo",
	name = "ɳĮ",
	ways = {
		["south"] = "huanghe/shamo1",
		["east"] = "huanghe/shamo",
		["north"] = "huanghe/shamo",
		["west"] = "huanghe/shamo",
	},
}
Room {
	id = "lanzhou/shamo1",
	name = "ɳĮ",
	ways = {
		["south"] = "lanzhou/shamo",
		["enter"] = "lanzhou/shidong",
		["east"] = "lanzhou/shamo",
		["north"] = "lanzhou/shamo",
		["west"] = "lanzhou/shamo",
	},
}

Room {
	id = "huanghe/shidong",
	name = "ʯ��",
	ways = {
		["out"] = "huanghe/shamo1",
	},
}
Room {
	id = "huanghe/shimen",
	name = "ʯ��",
	ways = {
		["south"] = "huanghe/hongshanxia",
		["northwest"] = "huanghe/yinpanshui",
		["north"] = "huanghe/wufosi",
	},
}
Room {
	id = "huanghe/shixiazi",
	name = "ʯϿ��",
	ways = {
		["southwest"] = "huanghe/tumenzi",
		["northeast"] = "huanghe/bingcao",
	},
}
Room {
	id = "huanghe/shulin1",
	name = "����",
	ways = {
		["north"] = "huanghe/shulin3",
		["east"] = "huanghe/caodi2",
		["west"] = "huanghe/shulin2",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
           },
}
Room {
	id = "huanghe/shulin2",
	name = "����",
	ways = {
		["southwest"] = "zhiye/caikuang-chang0",
		["north"] = "huanghe/shulin4",
		["east"] = "huanghe/shulin1",
	},
	objs = {
          ["����"] = "hui lang",
           },
}
Room {
	id = "huanghe/shulin3",
	name = "����",
	ways = {
		["south"] = "huanghe/shulin1",
		["north"] = "huanghe/tiandi1",
		["west"] = "huanghe/shulin4",
	},
}
Room {
	id = "huanghe/shulin4",
	name = "����",
	ways = {
		["south"] = "huanghe/shulin2",
		["northwest"] = "group/entry/hhshulin5",
		["east"] = "huanghe/shulin3",
	},
	objs = {
          ["����"] = "hu li",
           },
}
Room {
	id = "huanghe/shulin6",
	name = "����",
	ways = {
		--["north"] = "huanghe/fendi",
		["east"] = "group/entry/hhshulin5",
	},
}
Room {
	id = "huanghe/tiandi1",
	name = "���",
	ways = {
		["south"] = "huanghe/shulin3",
		["east"] = "huanghe/tiandi3",
		["west"] = "huanghe/tiandi2",
	},
}
Room {
	id = "huanghe/tiandi2",
	name = "���",
	ways = {
		["southwest"] = "group/entry/hhshulin5",
		["east"] = "huanghe/tiandi1",
	},
	objs = {
          ["���ţ"] = "da huangniu",
           },
}
Room {
	id = "huanghe/tiandi3",
	name = "���",
	ways = {
		["northeast"] = "huanghe/tiandi4",
		["west"] = "huanghe/tiandi1",
	},
}
Room {
	id = "huanghe/tiandi4",
	name = "���",
	ways = {
		["southwest"] = "huanghe/tiandi3",
		["east"] = "taishan/hsroad2",
		["north"] = "huanghe/huanghe1",
	},
	objs = {
          ["Ұ��"] = "ye gou",
           },
}
Room {
	id = "huanghe/tumenzi",
	name = "������",
	ways = {
		["south"] = "huanghe/wuwei",
		["northwest"] = "hengshan/jinlongxia",
		["east"] = "hmy/pingding/road1",
		["northeast"] = "huanghe/shixiazi",
	},
}
Room {
	id = "huanghe/weifen",
	name = "μ������",
	ways = {
		["southwest"] = "nanyang/yidao4",
		["south"] = "huanghe/huanghe1",
		["north"] = "huanghe/hetao",
	},
}
Room {
	id = "huanghe/wufosi",
	name = "�����",
	ways = {
		["south"] = "huanghe/shimen",
	},
}
Room {
	id = "huanghe/wuqiao",
	name = "������",
	ways = {
		["south"] = "huanghe/dacaigou",
		["northwest"] = "huanghe/wuwei",
	},
}
Room {
	id = "huanghe/wuwei",
	name = "����",
	ways = {
		["southeast"] = "huanghe/wuqiao",
		["north"] = "huanghe/tumenzi",
	},
}
Room {
	id = "huanghe/xiaojiaqiao",
	name = "������",
	ways = {
		["east"] = "huanghe/gulang",
	},
}
Room {
	id = "huanghe/xyting",
	name = "������",
	ways = {
		["east"] = "huanghe/gchang",
	},
	objs = {
          ["������"] = "peng lianhu",
          ["������"] = "liang ziweng",
          ["ɳͨ��"] = "sha tongtian",
           },
}
Room {
	id = "huanghe/yaocaidian",
	name = "Ƥ��ҩ�ĵ�",
	ways = {
		["west"] = "huanghe/gulang",
	},
}
Room {
	id = "huanghe/yinpanshui",
	name = "Ӫ��ˮ",
	ways = {
		["southwest"] = "huanghe/bingcao",
		["northeast"] = "huanghe/guchangcheng",
	},
}
Room {
	id = "huanghe/yyd/chufang",
	name = "����",
	ways = {
		["east"] = "huanghe/yyd/dating",
	},
}
Room {
	id = "huanghe/yyd/damen",
	name = "��������",
	no_fight = true,
	ways = {
		["southeast"] = "huanghe/huanghe7",
		["#inxiaofu"] = "huanghe/yyd/dating",
	},
	nolooks = {
		["#inxiaofu"] = true,
	},
	objs = {
          ["����"] = "zhang ma",
    },
}
Room {
	id = "huanghe/yyd/dating",
	name = "��������",
	ways = {
		["south"] = "huanghe/yyd/damen",
		["north"] = "huanghe/yyd/houyuan",
		["west"] = "huanghe/yyd/chufang",
		["east"] = "huanghe/yyd/shufang",
	},
}
Room {
	id = "huanghe/yyd/houshan",
	name = "��ɽ",
	ways = {
		["south"] = "huanghe/yyd/houyuan",
	},
}
Room {
	id = "huanghe/yyd/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "huanghe/yyd/dating",
	},
}
Room {
	id = "huanghe/yyd/shufang",
	name = "�鷿",
	ways = {
		["west"] = "huanghe/yyd/dating",
	},
}
Room {
	id = "huashan/baichi",
	name = "�ٳ�Ͽ",
	ways = {
		["eastup"] = "huashan/laojun",
		["northdown"] = "huashan/qianchi",
	},
}
Room {
	id = "huashan/canglong",
	name = "������",
	ways = {
		["westup"] = "huashan/sheshen",
		["northdown"] = "huashan/husun",
		["southdown"] = "huashan/zhenyue",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "huashan/cave",
	name = "�ܶ�",
	ways = {
		["right"] = "huashan/rukou",
	},
}
Room {
	id = "huashan/celang1",
	name = "����",
	ways = {
		["east"] = "huashan/qianting",
		["west"] = "huashan/lianwu1",
	},
	room_relative="���䳡-----����-----ǰ������",
}
Room {
	id = "huashan/celang2",
	name = "����",
	ways = {
		["east"] = "huashan/lianwu2",
		["west"] = "huashan/qianting",
	},
	room_relative="ǰ��-----����-----���䳡����",
}
Room {
	id = "huashan/celang3",
	name = "����",
	ways = {
		["south"] = "huashan/xiuxi1",
		["east"] = "huashan/houtang",
		["west"] = "huashan/fanting",
	},
	room_relative="����-----����-----���ã�Ů��Ϣ�Ҳ���",
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "huashan/celang4",
	name = "����",
	ways = {
		["south"] = "huashan/xiuxi2",
		["east"] = "huashan/shuyuan",
		["west"] = "huashan/houtang",
	},
	room_relative="����-----����-----��Ժ������Ϣ�Ҳ���",
	lengths = {
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "huashan/chaoyang",
	name = "������",
	ways = {
		["westdown"] = "huashan/zhenyue",
	},
}
Room {
	id = "huashan/fanting",
	name = "����",
	ways = {
		["north"] = "huashan/yaofang",
		["east"] = "huashan/celang3",
	},
	objs = {
          ["��ˮ��«"] = "qingshui hulu",
           },
}
Room {
	id = "huashan/hole",
	name = "˼���¶���",
	ways = {
		["out"] = "huashan/siguoya",
	},
}
Room {
	id = "huashan/hole2",
	name = "ʯ��",
	ways = {
		["out"] = "huashan/song",
	},
}
Room {
	id = "huashan/houshan",
	name = "��ɽ",
	ways = {
		["northdown"] = "huashan/midong",
	},
}
Room {
	id = "huashan/houtang",
	name = "����",
	ways = {
		["south"] = "huashan/qinshi",
		["north"] = "huashan/zhengqi",
		["east"] = "huashan/celang4",
		["west"] = "huashan/celang3",
	},
	objs = {
          ["½����"] = "lu dayou",
           },
}
Room {
	id = "huashan/husun",
	name = "�����",
	ways = {
		["southup"] = "huashan/canglong",
		["northdown"] = "huashan/laojun",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "huashan/jiabi",
	name = "��ɽ��",
	ways = {
		["west"] = "huashan/shiwu1",
		["out"] = "huashan/siguoya",
	},
}
Room {
	id = "huashan/jinshe/biding",
	name = "�ڶ�",
	ways = {
		["down"] = "huashan/husun",
	},
}
Room {
	id = "huashan/jitan",
	name = "��̳",
	ways = {
		["out"] = "huashan/yunuci",
	},
	objs = {
          ["����ɺ"] = "yue lingshan",
           },
}
Room {
	id = "huashan/kongdi",
	name = "�յ�",
	ways = {
		["north"] = "huashan/shulin1",
		["southdown"] = "huashan/v-road-1",
	},
}
Room {
	id = "huashan/laojun",
	name = "�Ͼ���",
	ways = {
		["southup"] = "huashan/husun",
		["westdown"] = "huashan/baichi",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "huashan/lianwu1",
	name = "���䳡",
	ways = {
		["south"] = "huashan/yaofang",
		["east"] = "huashan/celang1",
	},
	room_relative="���䳡----���ȣ�ҩ�����䳡",
	objs = {
          ["�͵�ŵ"] = "lao denuo",
           },
}
Room {
	id = "huashan/lianwu2",
	name = "���䳡",
	ways = {
		["south"] = "huashan/wuqiku",
		["west"] = "huashan/celang2",
	},
	room_relative="����----���䳡���������䳡",
	objs = {
          ["ʩ����"] = "shi daizi",
           },
}
Room {
	id = "huashan/maowu",
	name = "é��",
	ways = {
		["southeast"] = "huashan/v-road-1",
	},
}
Room {
	id = "huashan/midao",
	name = "�ܵ�",
	ways = {
		["south"] = "huashan/midong",
		["left"] = "huashan/rukou",
	},
}
Room {
	id = "huashan/midong",
	name = "�ض�",
	ways = {
		["southeast"] = "huashan/midong",
		["southwest"] = "huashan/midong",
		["south"] = "huashan/midong",
		["northwest"] = "huashan/midong",
		["north"] = "huashan/midong",
		["east"] = "huashan/midong",
		["northeast"] = "huashan/midong",
		["west"] = "huashan/midong",
	},
}
Room {
	id = "huashan/path1",
	name = "ɽ����",
	ways = {
		["southeast"] = "huashan/shaluo",
		["south"] = "huashan/shulin",
		["north"] = "huashan/yuquan",
		["west"] = "village/eexit",
	},
}
Room {
	id = "huashan/pubu",
	name = "�ٲ�",
	ways = {
		["east"] = "huashan/yunu",
		["tiao tan;#walkBusy"] = "huashan/shuitan",
	},
	nolooks = {
		["tiao tan;#walkBusy"] = true,
	},
	lengths = {
		["tiao tan;#walkBusy"] = 20,
	},
	objs = {
          ["����"] = "qing wa",
           },
}
Room {
	id = "huashan/shuitan",
	name = "�ٲ���",
	ways = {
		["qian up"] = "huashan/pubu",
	},
	nolooks = {
		["qian up"] = true,
	},
	objs = {
          ["����"] = "e yu",
           },
}
Room {
	id = "huashan/qianchi",
	name = "ǧ�ߴ�",
	ways = {
		["southup"] = "huashan/baichi",
		["westdown"] = "huashan/qingke",
	},
}
Room {
	id = "huashan/qianting",
	name = "ǰ��",
	ways = {
		["south"] = "huashan/zhengqi",
		["east"] = "huashan/celang2",
		["northdown"] = "huashan/taijie",
		["west"] = "huashan/celang1",
	},
	objs = {
          ["��ɽ������"] = "board",
           },
}
Room {
	id = "huashan/qingke",
	name = "���ƺ",
	ways = {
		["eastup"] = "huashan/qianchi",
		["northdown"] = "huashan/shaluo",
	},
}
Room {
	id = "huashan/qinshi",
	name = "����",
	ways = {
		["north"] = "huashan/houtang",
	},
	objs = {
          ["����"] = "sheng zi",
           },
}
Room {
	id = "huashan/rukou",
	name = "ɽ��",
}
Room {
	id = "huashan/shaluo",
	name = "ɯ��ƺ",
	ways = {
		["southup"] = "huashan/qingke",
		["northwest"] = "huashan/path1",
		["northeast"] = "huashan/shanhong",
	},
}
Room {
	id = "huashan/shanhong",
	name = "ɽ���ٲ�",
	ways = {
		["southwest"] = "huashan/shaluo",
	},
}
Room {
	id = "huashan/shanlu1",
	name = "ɽ·",
	ways = {
		["southeast"] = "huashan/shanlu2",
		["north"] = "huashan/yunu",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "huashan/shanlu2",
	name = "ɽ·",
	ways = {
		["southup"] = "huashan/taijie",
		["southwest"] = "huashan/xiaoxi",
		["northwest"] = "huashan/shanlu1",
	},
	objs = {
          ["����"] = "hou zi",
           },
}
Room {
	id = "huashan/sheshen",
	name = "������",
	ways = {
		["eastdown"] = "huashan/canglong",
	},
}
Room {
	id = "huashan/shiwu",
	name = "ʯ��",
	ways = {
		["west"] = "huashan/shulin4",
	},
	objs = {
          ["������"] = "mu renqing",
           },
}
Room {
	id = "huashan/shiwu1",
	name = "ʯ��",
	ways = {
		["east"] = "huashan/jiabi",
	},
}
Room {
	id = "huashan/shulin",
	name = "����",
	ways = {
		["north"] = "huashan/shulinn",
		["east"] = "huashan/shulin1",
		["west"] = "huashan/shulinn",
	},
}
Room {
	id = "huashan/shulin1",
	name = "������",
	ways = {
		["south"] = "huashan/kongdi",
		["north"] = "huashan/shulinn",
		["east"] = "huashan/shulin1",
		["west"] = "huashan/shulin1",
	},
}
--[[Room {
	id = "huashan/shulinn",
	name = "������",
	ways = {
		["#hsssl"] = "huashan/shiwu",
	},
	nolooks = {
		["#hsssl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#hsssl"] = 50,
	},
	find = {
		path = {"n;w"}, count = 20,
	},
}]]
Room {
	id = "huashan/shulinn",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn1",
	},
}
Room {
	id = "huashan/shulinn1",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn2",
	},
}
Room {
	id = "huashan/shulinn2",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn3",
	},
}
Room {
	id = "huashan/shulinn3",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn4",
	},
}
Room {
	id = "huashan/shulinn4",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn5",
	},
}
Room {
	id = "huashan/shulinn5",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn6",
	},
}
Room {
	id = "huashan/shulinn6",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn7",
	},
}
Room {
	id = "huashan/shulinn7",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn8",
	},
}
Room {
	id = "huashan/shulinn8",
	name = "������",
	ways = {
		["west"] = "huashan/shulinn9",
	},
}
Room {
	id = "huashan/shulinn9",
	name = "������",
	ways = {
		["west"] = "huashan/shulinnn",
	},
}
Room {
	id = "huashan/shulinnn",
	name = "������",
	ways = {
		["#hsssl"] = "huashan/shiwu",
	},
	nolooks = {
		["#hsssl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#hsssl"] = 50,
	},
	find = {
		path = {"n;w"}, count = 20,
	},
}
Room {
	id = "huashan/shulin4",
	name = "������",
	ways = {
		["south"] = "huashan/path1",
		["east"] = "huashan/shiwu",
		["north"] = "huashan/kongdi",
		["west"] = "huashan/shulin4",
	},
}
Room {
	id = "huashan/shuyuan",
	name = "��Ժ",
	ways = {
		["north"] = "huashan/wuqiku",
		["west"] = "huashan/celang4",
	},
	objs = {
          ["������Ҫ"] = "shu",
           },
}
Room {
        id = "huashan/siguoya",
        name = "˼����",
        ways = {
                ["eastdown"] = "huashan/xiaolu2",
                ["enter"] = "huashan/hole",
                ["#Fqy"] = "huashan/fengqingyang",
        },
        nolooks = {
                ["#Fqy"] = true,
                ["enter"] = true,
        },
        objs = {
          ["�����"] = "linghu chong",
           },
        lengths = {
                ["#Fqy"] = "if MidHsDay[locl.time] and score.master=='������' then return 1 else return false end",
        },
}
Room {
	id = "huashan/fengqingyang",
	name = "��ɽ��",
	ways = {
		["out"] = "huashan/siguoya",
	},
	objs = {
          ["������"] = "feng qingyang",
           },
}
Room {
	id = "huashan/taijie",
	name = "̨��",
	ways = {
		["southup"] = "huashan/qianting",
		["northdown"] = "huashan/shanlu2",
	},
	objs = {
          ["����"] = "liang fa",
           },
	lengths = {
		["southup"] = "if score.party=='��ɽ��' and hp.shen<0 then return false else return 10 end",
	},
}
Room {
	id = "huashan/shentan",
	name = "ɽ��",
	ways = {
		["northeast"] = "huashan/v-road-1",
	},
	room_relative="ɽ���Jɽ��ɽ��",
}
Room {
	id = "huashan/v-road-1",
	name = "ɽ��",
	ways = {
		["southeast"] = "huashan/v-road-5",
		["southwest"] = "huashan/shentan",
		["northeast"] = "huashan/v-road-2",
		["bo guanmu"] = "huashan/maowu",
	},
	nolooks = {
		["bo guanmu"] = true,
	},
	room_relative="ɽ���Jɽ���L�Kɽ��ɽ��ɽ��",
}
Room {
	id = "huashan/v-road-2",
	name = "ɽ��",
	ways = {
		["eastup"] = "huashan/v-road-3",
		["southwest"] = "huashan/v-road-1",
	},
	room_relative="ɽ����ɽ���Lɽ��ɽ��",
}
Room {
	id = "huashan/v-road-3",
	name = "ɽ��",
	ways = {
		["westdown"] = "huashan/v-road-2",
		["southeast"] = "huashan/shulinn",
	},
	room_relative="ɽ����ɽ���K������ɽ��",
}
Room {
	id = "huashan/v-road-5",
	name = "ɽ��",
	ways = {
		["northwest"] = "huashan/v-road-1",
		["bang shengzi;pa up"] = "huashan/song",
	},
	nolooks = {
		["bang shengzi;pa up"] = true,
	},
	lengths = {
		["bang shengzi;pa up"] = "if Bag['����'] then return 6 else return false end",
	},
	room_relative="ɽ���Iɽ��ɽ��",
}
Room {
	id = "huashan/song",
	name = "������",
	ways = {
		["enter"] = "huashan/hole2",
		["down"] = "huashan/v-road-5",
	},
}
Room {
	id = "huashan/wuqiku",
	name = "����",
	ways = {
		["south"] = "huashan/shuyuan",
		["north"] = "huashan/lianwu2",
	},
}
Room {
	id = "huashan/xiaolu1",
	name = "Сɽ·",
	ways = {
		["southeast"] = "huashan/yunu",
		["northwest"] = "huashan/xiaolu2",
	},
	room_relative="Сɽ·�IСɽ·�K��Ů��Сɽ·",
}
Room {
	id = "huashan/xiaolu2",
	name = "Сɽ·",
	ways = {
		["southeast"] = "huashan/xiaolu1",
		["westup"] = "huashan/siguoya",
	},
	room_relative="˼���¡�Сɽ·�KСɽ·Сɽ·",
}
Room {
	id = "huashan/xiaoxi",
	name = "СϪ",
	ways = {
		["northeast"] = "huashan/shanlu2",
	},
}
Room {
	id = "huashan/xiuxi1",
	name = "Ů��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "huashan/celang3",
	},
}
Room {
	id = "huashan/xiuxi2",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "huashan/celang4",
	},
}
Room {
	id = "huashan/yaofang",
	name = "ҩ��",
	ways = {
		["south"] = "huashan/fanting",
		["north"] = "huashan/lianwu1",
	},
}
Room {
	id = "huashan/yunu",
	name = "��Ů��",
	ways = {
		["south"] = "huashan/shanlu1",
		["northwest"] = "huashan/xiaolu1",
		["east"] = "huashan/yunuci",
		["northdown"] = "huashan/zhenyue",
		["west"] = "huashan/pubu",
	},
}
Room {
	id = "huashan/yunuci",
	name = "��Ů��",
	ways = {
		["enter"] = "huashan/jitan",
		["west"] = "huashan/yunu",
	},
}
Room {
	id = "huashan/yuquan",
	name = "��ȪԺ",
	ways = {
		["south"] = "huashan/path1",
	},
	objs = {
          ["������"] = "li tiezui",
           },
}
Room {
	id = "huashan/zhengqi",
	name = "������",
	ways = {
		["south"] = "huashan/houtang",
		["north"] = "huashan/qianting",
	},
	objs = {
          ["����Ⱥ"] = "yue buqun",
          ["������"] = "ning zhongze",
           },
}
Room {
	id = "huashan/zhenyue",
	name = "������",
	ways = {
		["northup"] = "huashan/canglong",
		["southup"] = "huashan/yunu",
		["eastup"] = "huashan/chaoyang",
	},
}
Room {
	id = "hz/baidi",
	name = "�׵�",
	ways = {
		["southeast"] = "hz/yuemiao",
		["southwest"] = "hz/gushan",
		["northwest"] = "hz/duanqiao",
		["north"] = "hz/qsddao1",
		["northeast"] = "hz/hubian",
		["west"] = "hz/pinghu",
	},
}
Room {
	id = "hz/baoshuta",
	name = "������",
	ways = {
		["northdown"] = "hz/shanlu",
		["southdown"] = "hz/qsddao1",
	},
}
Room {
	id = "hz/beimen",
	name = "����",
	ways = {
		["south"] = "hz/qsddao6",
		["north"] = "group/entry/hzqsd7",
	},
}
Room {
	id = "hz/changlang1",
	name = "����",
	ways = {
		["south"] = "hz/changlang1",
		["north"] = "hz/changlang2",
		["east"] = "hz/changlang1",
		["west"] = "hz/changlang1",
	},
}
Room {
	id = "hz/changlang2",
	name = "����",
	ways = {
		["south"] = "hz/changlang3",
		["north"] = "hz/changlang2",
		["east"] = "hz/changlang2",
		["west"] = "hz/changlang2",
	},
}
Room {
	id = "hz/changlang3",
	name = "����",
	ways = {
		["south"] = "hz/changlang3",
		["east"] = "hz/changlang4",
		["north"] = "hz/changlang3",
		["west"] = "hz/changlang3",
	},
}
Room {
	id = "hz/changlang4",
	name = "����",
	ways = {
		["south"] = "hz/changlang4",
		["north"] = "hz/changlang4",
		["east"] = "hz/changlang4",
		["west"] = "hz/huanglong",
	},
}
Room {
	id = "hz/cuihezhai",
	name = "���ի",
	no_fight = true,
	ways = {
		["west"] = "hz/qsddao4",
	},
	objs = {
          ["������"] = "zhang suanpan",
           },
}
Room {
	id = "hz/duanqiao",
	name = "���Ų�ѩ",
	ways = {
		["southeast"] = "hz/baidi",
	},
}
Room {
	id = "hz/dxbdian",
	name = "���۱���",
	ways = {
		["south"] = "hz/tianwang",
	},
}
Room {
	id = "hz/fangheting",
	name = "�ź�ͤ",
	ways = {
		["south"] = "hz/gushan",
	},
}
Room {
	id = "hz/feilaifeng",
	name = "������",
	ways = {
		["southeast"] = "hz/yxsdong",
		["west"] = "hz/qsddao3",
	},
	objs = {
          ["������"] = "gui xinshu",
          ["�����"] = "gui erniang",
           },
}
Room {
	id = "hz/gushan",
	name = "��ɽ",
	ways = {
		["south"] = "hz/wenlange",
		["east"] = "meizhuang/hubian",
		["north"] = "hz/fangheting",
		["northeast"] = "hz/baidi",
		["west"] = "hz/xilengqiao",
	},
}
Room {
	id = "hz/hggyu",
	name = "���۹���",
	ways = {
		["southeast"] = "hz/hubian1",
		["south"] = "hz/hubian2",
		["north"] = "hz/sudi",
		["east"] = "hz/hongyuchi",
		["west"] = "hz/mudanyuan",
	},
}
Room {
	id = "hz/hongyuchi",
	name = "�����",
	ways = {
		["west"] = "hz/hggyu",
	},
}
Room {
	id = "hz/huanglong",
	name = "������",
	ways = {
		["southeast"] = "hz/shuichi",
		["southdown"] = "hz/shanlu",
	},
}
Room {
	id = "hz/hubian",
	name = "������",
	ways = {
		["southwest"] = "hz/baidi",
		["south"] = "hz/llwying",
	},
	room_relative="�����ߨL���׵�������ݺ������",
}
Room {
	id = "hz/hubian1",
	name = "������",
	ways = {
		["southeast"] = "hz/jingcisi",
		["northwest"] = "hz/hggyu",
		["north"] = "hz/llwying",
		["west"] = "hz/hubian2",
	},
	room_relative="���۹���������ݺ�I��������----�����ߨK������������",
}
Room {
	id = "hz/hubian2",
	name = "������",
	ways = {
		["south"] = "hz/hupao",
		["east"] = "hz/hubian1",
		["north"] = "hz/hggyu",
	},
	room_relative="���۹����������----�����ߣ�����������",
}
Room {
	id = "hz/hubian3",
	name = "������",
	ways = {
		["northwest"] = "hz/baidi",
		["east"] = "hz/yuemiao",
	},
	room_relative="�׵̨I������----������������",
	objs = {
          ["ŷ����"] = "ouyang ke",
          ["������Ů"] = "shao nv",
           },
}
Room {
	id = "hz/hupao",
	name = "����",
	ways = {
		["northwest"] = "hz/longjing",
		["north"] = "hz/hubian2",
		["northeast"] = "hz/yuhuang",
	},
}
Room {
	id = "hz/huxinting",
	name = "����ͤ",
	ways = {
		["east"] = "hz/santan",
		["west"] = "hz/ruangong",
	},
}
Room {
	id = "hz/jingcisi",
	name = "������",
	ways = {
		["southeast"] = "hz/yuhuang",
		["northwest"] = "hz/hubian1",
	},
}
Room {
	id = "hz/jingzhong",
	name = "���Ұ�",
	ways = {
		["south"] = "hz/mu",
		["west"] = "hz/yuanmen",
	},
}
Room {
	id = "hz/jinhuazhai",
	name = "��ի",
	ways = {
		["east"] = "hz/qsddao4",
	},
	objs = {
          ["������"] = "cui suanpan",
           },
}
Room {
	id = "hz/jiulou",
	name = "����¥",
	ways = {
		["east"] = "hz/qsddao6",
	},
}
Room {
	id = "hz/juquqiao",
	name = "������",
	ways = {
		["south"] = "hz/santan",
		["north"] = "hz/xiaoying",
	},
}
Room {
	id = "hz/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "hz/kedian3",
		["down"] = "hz/tianxiang",
	},
}
Room {
	id = "hz/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "hz/kedian2",
	},
}
Room {
	id = "hz/kuahong",
	name = "�����",
	ways = {
		["northwest"] = "hz/quyuan",
		["north"] = "hz/yingboqiao",
		["west"] = "hz/sudi",
	},
}
Room {
	id = "hz/leifengta",
	name = "�׷���",
	ways = {
		["westdown"] = "hz/shanlu",
	},
}
Room {
	id = "hz/lingyinsi",
	name = "������",
	ways = {
		["east"] = "hz/qsddao3",
		["west"] = "hz/tianwang",
	},
}
Room {
	id = "hz/liulin",
	name = "����",
	ways = {
		["south"] = "hz/liulin",
		["north"] = "hz/liulin1",
		["east"] = "hz/liulin",
		["west"] = "hz/liulin",
	},
}
Room {
	id = "hz/liulin1",
	name = "����",
	ways = {
		["south"] = "hz/liulin1",
		["north"] = "hz/liulin2",
		["east"] = "hz/liulin1",
		["west"] = "hz/liulin1",
	},
}
Room {
	id = "hz/liulin2",
	name = "����",
	ways = {
		["south"] = "hz/liulin2",
		["north"] = "hz/shanlu1",
		["east"] = "hz/liulin2",
	},
}
Room {
	id = "hz/llwying",
	name = "������ݺ",
	ways = {
		["south"] = "hz/hubian1",
		["north"] = "hz/hubian",
	},
}
Room {
	id = "hz/longjing",
	name = "����",
	ways = {
		["southeast"] = "hz/hupao",
		["northwest"] = "hz/yxsdong2",
	},
}
Room {
	id = "hz/majiu",
	name = "���",
	ways = {
		["west"] = "hz/tianxiang",
	},
}
Room {
	id = "hz/maoshe",
	name = "û����",
	ways = {
		["out"] = "hz/shanquan",
	},
}
Room {
	id = "hz/mu",
	name = "����Ĺ",
	ways = {
		["north"] = "hz/jingzhong",
	},
}
Room {
	id = "hz/mudanyuan",
	name = "ĵ��԰",
	ways = {
		["east"] = "hz/hggyu",
	},
}
Room {
	id = "hz/pinghu",
	name = "ƽ������",
	ways = {
		["east"] = "hz/baidi",
	},
}
Room {
	id = "hz/qsddao1",
	name = "��ʯ���",
	ways = {
		["northup"] = "hz/baoshuta",
		["south"] = "hz/baidi",
	},
	room_relative="����������ʯ������׵���ʯ���",
}
Room {
	id = "hz/qsddao2",
	name = "��ʯ���",
	ways = {
		["southeast"] = "hz/qsddao3",
		["south"] = "hz/sudi",
		["northwest"] = "hz/yuemiao",
		["west"] = "hz/yuquan",
	},
	room_relative="������I��Ȫ---��ʯ������K�յ���ʯ�����ʯ���",
}
Room {
	id = "hz/qsddao3",
	name = "��ʯ���",
	ways = {
		["southeast"] = "thd/niujia/road",
		["northwest"] = "hz/qsddao2",
		["east"] = "hz/feilaifeng",
		["west"] = "hz/lingyinsi",
	},
	room_relative="��ʯ����I������---��ʯ���---������K��·��ʯ���",
}
Room {
	id = "hz/qsddao4",
	name = "��ʯ���",
	ways = {
		["south"] = "hz/tianxiang",
		["north"] = "hz/qsddao5",
		["east"] = "hz/cuihezhai",
		["west"] = "hz/jinhuazhai",
	},
	room_relative="��ʯ�������ի---��ʯ���---���ի�������ջ��ʯ���",
}
Room {
	id = "hz/qsddao5",
	name = "��ʯ���",
	ways = {
		["south"] = "hz/qsddao4",
		["east"] = "hz/yaopu",
		["north"] = "hz/qsddao6",
		["west"] = "hz/zahuopu",
	},
	room_relative="��ʯ������ӻ���---��ʯ���---���괺����ʯ�����ʯ���",
}
Room {
	id = "hz/qsddao6",
	name = "��ʯ���",
	ways = {
		["south"] = "hz/qsddao5",
		["east"] = "hz/shuyuan",
		["north"] = "hz/beimen",
		["west"] = "hz/jiulou",
	},
	room_relative="���ţ�����¥---��ʯ���---��Ժ����ʯ�����ʯ���",
}
Room {
	id = "hz/quanwu",
	name = "Ȫ��",
	ways = {
		["south"] = "hz/yuquan",
	},
}
Room {
	id = "hz/quyuan",
	name = "��԰���",
	ways = {
		["southeast"] = "hz/kuahong",
		["east"] = "hz/yingxunge",
	},
}
Room {
	id = "hz/ruangong",
	name = "���",
	ways = {
		["east"] = "hz/huxinting",
	},
}
Room {
	id = "hz/santan",
	name = "��̶ӳ��",
	ways = {
		["north"] = "hz/juquqiao",
		["west"] = "hz/huxinting",
	},
}
Room {
	id = "hz/shanlu",
	name = "ɽ·",
	ways = {
		["northup"] = "hz/huanglong",
		["southup"] = "hz/baoshuta",
		["eastup"] = "hz/leifengta",
	},
	room_relative="��������ɽ·���׷�����������ɽ·",
}
Room {
	id = "hz/shanlu1",
	name = "ɽ·",
	ways = {
		["south"] = "hz/shanlu3",
		["east"] = "hz/liulin",
		["northeast"] = "suzhou/qsgdao2",
		["west"] = "hz/liulin",
	},
	room_relative="��ʯ�ٵ��J����-----ɽ·-----���֣�ɽ·ɽ·",
}
Room {
	id = "hz/shanlu2",
	name = "ɽ·",
	ways = {
		["eastdown"] = "ningbo/qsddao1",
		["northdown"] = "hz/zilaidong",
	},
	room_relative="��������ɽ·����ʯ�ٵ�ɽ·",
}
Room {
	id = "hz/shanlu3",
	name = "ɽ·",
	ways = {
		["south"] = "group/entry/hzqsd7",
		["north"] = "hz/shanlu1",
		["east"] = "hz/liulin",
		["west"] = "hz/liulin",
	},
	room_relative="ɽ·������-----ɽ·-----���֣���ʯ���ɽ·",
}
Room {
	id = "hz/shanquan",
	name = "ɽȪ",
	ways = {
		["south"] = "hz/shanlu1",
		["enter"] = "hz/maoshe",
		["east"] = "hz/shanquan",
	},
}
Room {
	id = "hz/shuichi",
	name = "ˮ��",
	ways = {
		["northwest"] = "hz/huanglong",
		["west"] = "hz/xiaozhu",
	},
}
Room {
	id = "hz/shuyuan",
	name = "��Ժ",
	ways = {
		["west"] = "hz/qsddao6",
	},
}
Room {
	id = "hz/sudi",
	name = "�յ�",
	ways = {
		["south"] = "hz/hggyu",
		["north"] = "hz/qsddao2",
		["east"] = "hz/kuahong",
		["west"] = "hz/yingboqiao",
	},
}
Room {
	id = "hz/tianwang",
	name = "������",
	ways = {
		["east"] = "hz/lingyinsi",
		["north"] = "hz/dxbdian",
	},
}
Room {
	id = "hz/tianxiang",
	name = "�����ջ",
	no_fight = true,
	ways = {
		["north"] = "hz/qsddao4",
		["east"] = "hz/majiu",
		["west"] = "hz/yuemiao",
		-- ["up"] = "hz/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "hz/wenlange",
	name = "������",
	ways = {
		["north"] = "hz/gushan",
	},
}
Room {
	id = "hz/xiaoying",
	name = "СӮ��",
	ways = {
		["south"] = "hz/juquqiao",
	},
}
Room {
	id = "hz/xiaozhu",
	name = "С��",
	ways = {
		["southwest"] = "hz/changlang1",
		["east"] = "hz/shuichi",
	},
}
Room {
	id = "hz/xilengqiao",
	name = "������",
	ways = {
		["east"] = "hz/gushan",
	},
}
Room {
	id = "hz/yaopu",
	name = "���괺",
	ways = {
		["west"] = "hz/qsddao5",
	},
}
Room {
	id = "hz/yingboqiao",
	name = "ӳ����",
	ways = {
		["south"] = "hz/kuahong",
		["east"] = "hz/sudi",
	},
}
Room {
	id = "hz/yingxunge",
	name = "ӭѬ��",
	ways = {
		["west"] = "hz/quyuan",
	},
}
Room {
	id = "hz/yuanmen",
	name = "԰��",
	ways = {
		["east"] = "hz/jingzhong",
		["out"] = "hz/yuemiao",
	},
}
Room {
	id = "hz/yuemiao",
	name = "������",
	no_fight = true,
	ways = {
		["southeast"] = "hz/qsddao2",
		["enter"] = "hz/yuanmen",
		["northwest"] = "hz/baidi",
		["east"] = "hz/tianxiang",
		["west"] = "hz/hubian3",
	},
}
Room {
	id = "hz/yuhuang",
	name = "���ɽ",
	ways = {
		["southwest"] = "hz/hupao",
		["south"] = "hz/zilaidong",
		["northwest"] = "hz/jingcisi",
	},
}
Room {
	id = "hz/yuquan",
	name = "��Ȫ",
	ways = {
		["north"] = "hz/quanwu",
		["east"] = "hz/qsddao2",
	},
}
Room {
	id = "hz/yxsdong",
	name = "ʯ�ݶ�",
	ways = {
		["southeast"] = "hz/yxsdong1",
		["northwest"] = "hz/feilaifeng",
	},
}
Room {
	id = "hz/yxsdong1",
	name = "ˮ�ֶ�",
	ways = {
		["northwest"] = "hz/yxsdong",
		["west"] = "hz/yxsdong2",
	},
}
Room {
	id = "hz/yxsdong2",
	name = "��ϼ��",
	ways = {
		["southeast"] = "hz/longjing",
		["east"] = "hz/yxsdong1",
	},
}
Room {
	id = "hz/zahuopu",
	name = "�ӻ���",
	ways = {
		["east"] = "hz/qsddao5",
	},
	objs = {
          ["���ϰ�"] = "li laoban",
           },
}
Room {
	id = "hz/zilaidong",
	name = "������",
	ways = {
		["southup"] = "hz/shanlu2",
		["north"] = "hz/yuhuang",
	},
}

Room {
	id = "jiaxing/road2",
	name = "��ʯ�ٵ�",
	ways = {
		["southeast"] = "jiaxing/road1",
		["northwest"] = "suzhou/qsgdao2",
	},
}
Room {
	id = "jiaxing/road1",
	name = "��ʯ�ٵ�",
	ways = {
		["southeast"] = "jiaxing/beimen",
		["northwest"] = "jiaxing/road2",
	},
	room_relative="��ʯ�ٵ��I��ʯ�ٵ��K������ʯ�ٵ�",
}
Room {
	id = "jiaxing/beimen",
	name = "����",
	ways = {
		["south"] = "jiaxing/jiaxing",
		["northwest"] = "jiaxing/road1",
	},
}
Room {
	id = "jiaxing/beijie",
	name = "����",
	ways = {
		["north"] = "jiaxing/beimen",
		["south"] = "jiaxing/jiaxing",
	},
}
Room {
	id = "jiaxing/jiaxing",
	name = "�м�",
	ways = {
		["south"] = "jiaxing/jxnanmen",
		["east"] = "jiaxing/dbianmen",
		["north"] = "jiaxing/beimen",
	},
}
Room {
	id = "jiaxing/dongjie",
	name = "����",
	ways = {
		["west"] = "jiaxing/jiaxing",
		["east"] = "jiaxing/dbianmen",
	},
}
Room {
	id = "jiaxing/dbianmen",
	name = "������",
	ways = {
		["south"] = "jiaxing/tieqiang",
		["east"] = "jiaxing/nanhu",
		["west"] = "jiaxing/jiaxing",
	},
}
Room {
	id = "jiaxing/nanhu",
	name = "�Ϻ�",
	ways = {
		["southeast"] = "jiaxing/nanhu1",
		["east"] = "jiaxing/hubian",
		["west"] = "jiaxing/dbianmen",
	},
}
Room {
	id = "jiaxing/nanhu1",
	name = "�Ϻ�",
	ways = {
		["south"] = "jiaxing/jxyanyu",
		["northwest"] = "jiaxing/nanhu",
	},
}
Room {
	id = "jiaxing/yanyu",
	name = "����¥",
	ways = {
		["down"] = "jiaxing/jxyanyu",
	},
}
Room {
	id = "jiaxing/jxyanyu",
	name = "����¥",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/nanhu1",
	},
	objs = {
          ["�"] = "yang kang",
           },
}
Room {
	id = "jiaxing/hubian",
	name = "����",
	ways = {
		["west"] = "jiaxing/nanhu",
	},
}
Room {
	id = "jiaxing/zahuopu",
	name = "�ӻ���",
	ways = {
		["south"] = "jiaxing/dbianmen",
	},
}
Room {
	id = "jiaxing/xijie1",
	name = "����",
	ways = {
		["east"] = "jiaxing/jiaxing",
		["west"] = "jiaxing/xijie2",
	},
}
Room {
	id = "jiaxing/xijie2",
	name = "����",
	ways = {
		["east"] = "jiaxing/xijie1",
		["west"] = "jiaxing/ximen",
		["south"] = "jiaxing/xiaoxiang1",
		["north"] = "jiaxing/kedian",
	},
}
Room {
	id = "jiaxing/kedian",
	name = "�м��ջ",
	ways = {
		["south"] = "jiaxing/xijie2",
		-- ["up"] = "jiaxing/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "jiaxing/kedian2",
	name = "�͵��¥",
	ways = {
		["down"] = "jiaxing/kedian",
		["enter"] = "jiaxing/kefang",
	},
}
Room {
	id = "jiaxing/kefang",
	name = "�ͷ�",
	ways = {
		["out"] = "jiaxing/xijie2",
	},
}
Room {
	id = "jiaxing/ximen",
	name = "����",
	ways = {
		["east"] = "jiaxing/xijie2",
	},
}
Room {
	id = "jiaxing/xiaoxiang1",
	name = "С��",
	ways = {
		["north"] = "jiaxing/xijie2",
		["east"] = "jiaxing/xiaoxiang2",
		["south"] = "jiaxing/jiuyuan",
	},
}
Room {
	id = "jiaxing/xiaoxiang2",
	name = "С��",
	ways = {
		["west"] = "jiaxing/xiaoxiang1",
		["east"] = "jiaxing/nanjie",
	},
}
Room {
	id = "jiaxing/jiuyuan",
	name = "��԰",
	ways = {
		["north"] = "jiaxing/xiaoxiang1",
	},
}
Room {
	id = "jiaxing/nanjie",
	name = "�Ͻ�",
	ways = {
		["west"] = "jiaxing/xiaoxiang2",
		["north"] = "jiaxing/jiaxing",
		["south"] = "jiaxing/jxnanmen",
	},
}
Room {
	id = "jiaxing/jxnanmen",
	name = "����",
	ways = {
		["south"] = "jiaxing/xiaojing2",
		["north"] = "jiaxing/jiaxing",
		["east"] = "jiaxing/tieqiang",
	},
}

Room {
	id = "jiaxing/tieqiang",
	name = "��ǹ��",
	ways = {
		["west"] = "jiaxing/jxnanmen",
		["north"] = "jiaxing/dbianmen",
	},
	objs = {
          ["��Ī��"] = "li mochou",
          ["��ѻ"] = "wu ya",
           },
}
Room {
	id = "jiaxing/xiaojing2",
	name = "���С��",
	ways = {
		["north"] = "jiaxing/jxnanmen",
		["east"] = "jiaxing/river",
		["southeast"] = "jiaxing/shulin1",
	},
}
Room {
	id = "jiaxing/river",
	name = "�Ӱ�",
	ways = {
		["west"] = "jiaxing/xiaojing2",
	},
}
Room {
	id = "jiaxing/shulin1",
	name = "����",
	ways = {
		["south"] = "jiaxing/luzhuang",
		["northwest"] = "jiaxing/xiaojing2",
		["east"] = "jiaxing/lumu",
	},
}
Room {
	id = "jiaxing/lumu",
	name = "��Ĺ",
	ways = {
		["west"] = "jiaxing/shulin1",
	},
	objs = {
          ["����ͨ"] = "wu santong",
           },
}
Room {
	id = "jiaxing/luzhuang",
	name = "½��ׯ",
	ways = {
		["north"] = "jiaxing/shulin1",
		["west"] = "jiaxing/tianjing",
	},
}
Room {
	id = "jiaxing/tianjing",
	name = "�쾮",
	ways = {
		["east"] = "jiaxing/luzhuang",
		["west"] = "jiaxing/dating",
	},
	objs = {
          ["����"] = "pu ren",
           },
}
Room {
	id = "jiaxing/dating",
	name = "����",
	ways = {
		["south"] = "jiaxing/houyuan",
		["east"] = "jiaxing/tianjing",
	},
	objs = {
          ["½����"] = "lu liding",
           },
}
Room {
	id = "jiaxing/houyuan",
	name = "��Ժ",
	ways = {
		["north"] = "jiaxing/dating",
	},
}

Room {
	id = "kunlun/bainiushan",
	name = "��ţɽ",
	ways = {
		["southwest"] = "kunlun/fufengshan",
	},
}
Room {
	id = "kunlun/bayankala",
	name = "���տ���ɽ",
	ways = {
		["northdown"] = "kunlun/shanlu2",
		["west"] = "kunlun/kekexili",
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
     },
}
Room {
	id = "kunlun/chufang",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "kunlun/shilu2",
	},
}
Room {
	id = "kunlun/conglinggu",
	name = "�����",
	ways = {
		["out"] = "kunlun/shanlinn5",
	},
	objs = {
          ["�����"] = "dongchong cao",
          ["����"] = "huang qi",
     },
}
Room {
	id = "kunlun/elang01",
	name = "������",
	ways = {
		["east"] = "kunlun/keting1",
		["west"] = "kunlun/qianting",
	},
}
Room {
	id = "kunlun/fufengshan",
	name = "����ɽ",
	ways = {
		["enter"] = "kunlun/houyuan",
		["northeast"] = "kunlun/bainiushan",
		["climb"] = "kunlun/sanshengao",
	},
	precmds = {
		["enter"] = "open door",
	},
}
Room {
	id = "kunlun/gate",
	name = "��Ժ��",
	ways = {
		["east"] = "kunlun/shilu2",
		["west"] = "kunlun/lang",
	},
	lengths = {
		["east"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
}
Room {
	id = "kunlun/guangchang",
	name = "�㳡",
	ways = {
		["south"] = "kunlun/pingfeng",
		["north"] = "kunlun/shanlu04",
		["east"] = "kunlun/guangchange",
		["west"] = "kunlun/guangchangw",
	},
	objs = {
          ["�����"] = "gao zecheng",
     },
}
Room {
	id = "kunlun/guangchange",
	name = "�㳡��",
	ways = {
		["northwest"] = "kunlun/shanlu04",
		["west"] = "kunlun/guangchang",
	},
	objs = {
          ["������"] = "yuling zi",
     },
}
Room {
	id = "kunlun/guangchangw",
	name = "�㳡��",
	ways = {
		["east"] = "kunlun/guangchang",
		["northeast"] = "kunlun/shanlu04",
	},
}
Room {
	id = "kunlun/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "kunlun/shanlinn3",
		["out"] = "kunlun/fufengshan",
	},
	nolooks = {
		["out"] = true,
	},
	precmds = {
		["out"] = "open door",
	},
}
Room {
	id = "kunlun/huayuan1",
	name = "��԰",
	ways = {
		["south"] = "kunlun/lang1",
		["north"] = "kunlun/shilu1",
		["east"] = "kunlun/lang",
		["west"] = "kunlun/shiqiao",
	},
}
Room {
	id = "kunlun/jingshenfeng",
	name = "�����",
	ways = {
		["south"] = "kunlun/sanshengao",
	},
	objs = {
          ["�����"] = "he zudao",
     },
}
Room {
	id = "kunlun/jingxiushi",
	name = "������",
	ways = {
		["south"] = "kunlun/shiqiao",
		["east"] = "kunlun/shilu1",
	},
}
Room {
	id = "kunlun/jiuqulang1",
	name = "������",
	ways = {
		["southwest"] = "kunlun/tieqinju",
		["east"] = "kunlun/shiqiao",
	},
}
Room {
	id = "kunlun/jiuqulang2",
	name = "������",
	ways = {
		["southwest"] = "kunlun/shanlinn",
		["northeast"] = "kunlun/sanshengtang",
	},
}
Room {
	id = "kunlun/kekexili",
	name = "�ɿ�����ɽ",
	ways = {
		["northwest"] = "kunlun/shankou",
		["east"] = "kunlun/bayankala",
	},
}
Room {
	id = "kunlun/keting1",
	name = "����",
	ways = {
		["west"] = "kunlun/elang01",
	},
}
Room {
	id = "kunlun/keting2",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "kunlun/wlang01",
	},
}
Room {
	id = "kunlun/klshanlu",
	name = "����ɽ´",
	ways = {
		["northup"] = "kunlun/shanmen",
		["east"] = "kunlun/shankou",
		["west"] = "fairyland/shanlu1",
	},
}
Room {
	id = "kunlun/kuhanlou1",
	name = "�ຮ¥һ��",
	ways = {
		["out"] = "kunlun/shanlinn",
		["up"] = "kunlun/kuhanlou2",
	},
}
Room {
	id = "kunlun/kuhanlou2",
	name = "�ຮ¥����",
	ways = {
		["down"] = "kunlun/kuhanlou1",
		["up"] = "kunlun/kuhanlou3",
	},
}
Room {
	id = "kunlun/kuhanlou3",
	name = "�ຮ¥����",
	ways = {
		["down"] = "kunlun/kuhanlou2",
	},
}
Room {
	id = "kunlun/lang",
	name = "����",
	ways = {
		["south"] = "kunlun/lang2",
		["north"] = "kunlun/shufang",
		["east"] = "kunlun/gate",
		["west"] = "kunlun/huayuan1",
	},
}
Room {
	id = "kunlun/lang1",
	name = "����",
	ways = {
		["south"] = "kunlun/sanshengtang",
		["east"] = "kunlun/lang2",
		["north"] = "kunlun/huayuan1",
	},
}
Room {
	id = "kunlun/lang2",
	name = "����",
	ways = {
		["east"] = "kunlun/liangong",
		["north"] = "kunlun/lang",
		["west"] = "kunlun/lang1",
	},
}
Room {
	id = "kunlun/liangong",
	name = "������",
	ways = {
		["west"] = "kunlun/lang2",
	},
}
Room {
	id = "kunlun/pingfeng",
	name = "ʯ����",
	ways = {
		["south"] = "kunlun/qianting",
		["north"] = "kunlun/guangchang",
	},
}
Room {
	id = "kunlun/qianting",
	name = "ǰ��",
	ways = {
		["south"] = "kunlun/shilu1",
		["north"] = "kunlun/pingfeng",
		["east"] = "kunlun/elang01",
		["west"] = "kunlun/wlang01",
	},
	objs = {
          ["������"] = "xi huazi",
     },
}
Room {
	id = "kunlun/sanshengao",
	name = "��ʥ��",
	ways = {
		["north"] = "kunlun/jingshenfeng",
		["down"] = "kunlun/fufengshan",
	},
}
Room {
	id = "kunlun/sanshengtang",
	name = "��ʥ��",
	ways = {
		["southwest"] = "kunlun/jiuqulang2",
		["north"] = "kunlun/lang1",
	},
	objs = {
          ["�����"] = "ban shuxian",
          ["�ӷ�"] = "xing fang",
     },
}
Room {
	id = "kunlun/shankou",
	name = "����ɽ���",
	ways = {
		["southeast"] = "kunlun/kekexili",
		["west"] = "kunlun/klshanlu",
	},
}
--[[Room {
	id = "kunlun/shanlinn",
	name = "��ɼ��",
	ways = {
		["se;e;s;w;e;out;se;e;s;w;e"] = "kunlun/kuhanlou1",
		["se;e;s;w;e;out;se;e;s;s"] = "kunlun/conglinggu",
		["se;e;s;w;e;out;ne"] = "kunlun/jiuqulang2",
		["se;e;s;w;e;out;w;n"] = "kunlun/houyuan",
	},
	nolooks = {
		["se;e;s;w;e;out;se;e;s;w;e"] = true,
		["se;e;s;w;e;out;se;e;s;s"] = true,
		["se;e;s;w;e;out;ne"] = true,
		["se;e;s;w;e;out;w;n"] = true,
		["southeast"] = true,
		["northeast"] = true,
		["west"] = true,
		["east"] = true,
		["north"] = true,
		["south"] = true,
	},
	lengths = {
		["se;e;s;w;e;out;se;e;s;w;e"] = 11,
		["se;e;s;w;e;out;se;e;s;s"] = 10,
		["se;e;s;w;e;out;ne"] = 7,
		["se;e;s;w;e;out;w;n"] = 8,
	},
	find = {
		path = {"w", "e", "se", "e", "s", "w", "e", "out"},
	},
}]]
Room {
  id = "kunlun/shanlinn",
  name = "��ɼ��",
  ways = {
    ["northeast"] = "kunlun/jiuqulang2",
    ["southeast"] = "kunlun/shanlinn2",
    ["west"] = "kunlun/shanlinn3",
  },
room_relative="�����ȨJ��ɼ��----��ɼ�֨K��ɼ����ɼ��",
}
Room {
  id = "kunlun/shanlinn3",
  name = "��ɼ��",
  ways = {
    ["east"] = "kunlun/shanlinn",
    ["north"] = "kunlun/houyuan",
  },
room_relative="��Ժ����ɼ��----��ɼ��----��ɼ�֣���ɼ����ɼ��",
}
Room {
  id = "kunlun/shanlinn2",
  name = "��ɼ��",
  ways = {
    ["east"] = "kunlun/shanlinn4",
  },
}
Room {
  id = "kunlun/shanlinn4",
  name = "��ɼ��",
  ways = {
    ["south"] = "kunlun/shanlinn5",
  },
}
Room {
  id = "kunlun/shanlinn5",
  name = "��ɼ��",
  ways = {
    ["west"] = "kunlun/shanlinn6",
    ["south"] = "kunlun/conglinggu",
  },
room_relative="��ɼ�֣���ɼ��----��ɼ��----��ɼ�֣��������ɼ��",
}
Room {
  id = "kunlun/shanlinn6",
  name = "��ɼ��",
  ways = {
    ["east"] = "kunlun/kuhanlou1",
  },
room_relative="��ɼ�֣���ɼ��----��ɼ��----�ຮ¥һ�����ɼ����ɼ��",
}
Room {
	id = "kunlun/shanlu",
	name = "����ɽ·",
	ways = {
		["east"] = "kunlun/zhenyuanqiao",
		["west"] = "kunlun/shanlu1",
	},
}
Room {
	id = "kunlun/shanlu01",
	name = "ɽ·",
	ways = {
		["southup"] = "kunlun/shanlu02",
		["westdown"] = "kunlun/shanmen",
	},
}
Room {
	id = "kunlun/shanlu02",
	name = "ɽ·",
	ways = {
		["southup"] = "kunlun/shanlu03",
		["northdown"] = "kunlun/shanlu01",
	},
}
Room {
	id = "kunlun/shanlu03",
	name = "ɽ·",
	ways = {
		["southup"] = "kunlun/shanlu04",
		["northdown"] = "kunlun/shanlu02",
	},
}
Room {
	id = "kunlun/shanlu04",
	name = "ɽ·",
	ways = {
		["southeast"] = "kunlun/guangchange",
		["southwest"] = "kunlun/guangchangw",
		["south"] = "kunlun/guangchang",
		["northdown"] = "kunlun/shanlu03",
	},
}
Room {
	id = "kunlun/shanlu1",
	name = "����ɽ·",
	ways = {
		["westup"] = "kunlun/shanlu2",
		["east"] = "kunlun/shanlu",
	},
}
Room {
	id = "kunlun/shanlu2",
	name = "����ɽ·",
	ways = {
		["southup"] = "kunlun/bayankala",
		["eastdown"] = "kunlun/shanlu1",
	},
}
Room {
	id = "kunlun/shanmen",
	name = "������ɽ��",
	ways = {
		["eastup"] = "kunlun/shanlu01",
		["southdown"] = "kunlun/klshanlu",
	},
	objs = {
          ["����"] = "jiang tao",
     },
}
Room {
	id = "kunlun/shilu1",
	name = "ʯ·",
	ways = {
		["south"] = "kunlun/huayuan1",
		["east"] = "kunlun/shufang",
		["north"] = "kunlun/qianting",
		["west"] = "kunlun/jingxiushi",
	},
}
Room {
	id = "kunlun/shilu2",
	name = "ʯ·",
	ways = {
		["north"] = "kunlun/xiuxishi",
		["east"] = "kunlun/chufang",
		["west"] = "kunlun/gate",
	},
}
Room {
	id = "kunlun/shiqiao",
	name = "Сʯ��",
	ways = {
		["north"] = "kunlun/jingxiushi",
		["east"] = "kunlun/huayuan1",
		["west"] = "kunlun/jiuqulang1",
	},
	objs = {
          ["��ϰ֮"] = "su xizhi",
     },
}
Room {
	id = "kunlun/shufang",
	name = "�鷿",
	ways = {
		["south"] = "kunlun/lang",
		["west"] = "kunlun/shilu1",
	},
	objs = {
          ["���ټ����š�"] = "art's book",
     },
}
Room {
	id = "kunlun/sleeproom",
	name = "����",
	ways = {
		["east"] = "kunlun/tieqinju",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	objs = {
          ["ղ��"] = "zhan chun",
     },
}
Room {
	id = "kunlun/tieqinju",
	name = "���پ�",
	ways = {
		["west"] = "kunlun/sleeproom",
		["northeast"] = "kunlun/jiuqulang1",
		["up"] = "kunlun/tieqinju2",
	},
	precmds = {
		["west"] = "open door",
	},
	objs = {
          ["��̫��"] = "he taichong",
     },
}
Room {
	id = "kunlun/tieqinju2",
	name = "���پӶ�¥",
	ways = {
		["down"] = "kunlun/tieqinju",
	},
}
Room {
	id = "kunlun/wlang01",
	name = "������",
	ways = {
		["east"] = "kunlun/qianting",
		["west"] = "kunlun/keting2",
	},
}
Room {
	id = "kunlun/xiuxishi",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "kunlun/shilu2",
	},
}
Room {
	id = "kunlun/zhenyuanqiao",
	name = "��Զ��",
	ways = {
		["eastdown"] = "mingjiao/shanjiao",
		["west"] = "kunlun/shanlu",
	},
}
Room {
	id = "lanzhou/bingcao",
	name = "������",
	ways = {
		["southwest"] = "group/entry/lzshixia",
		["northeast"] = "lanzhou/yinpanshui",
	},
	objs = {
          ["���"] = "wu gong",
           },
}
Room {
	id = "lanzhou/dacaigou",
	name = "���",
	ways = {
		["southeast"] = "lanzhou/gulang",
		["north"] = "lanzhou/wuqiao",
	},
	objs = {
          ["�Է�"] = "qiao fu",
           },
}
Room {
	id = "lanzhou/dukou2",
	name = "���Ķɿ�",
	ways = {
		["southeast"] = "lanzhou/shanlu1",
		["#duHhe"] = "lanzhou/dukou3",
	},
	nolooks = {
		["#duHhe"] = true,
		["enter"] = true,
	},
	lengths = {
		["#duHhe"] = 10000,
	},
}
Room {
	id = "lanzhou/dukou3",
	name = "���Ķɿ�",
	ways = {
		["northwest"] = "lanzhou/huanghe_3",
		["#duHhe"] = "lanzhou/dukou2",
	},
	nolooks = {
		["#duHhe"] = true,
		["enter"] = true,
	},
	lengths = {
		["#duHhe"] = 10000,
	},
}
Room {
	id = "lanzhou/gccheng",
	name = "�ų���",
	ways = {
		["east"] = "lanzhou/shimen",
		["west"] = "lanzhou/yinpanshui",
	},
	nolooks = {
		["down"] = true,
	},
}
Room {
	id = "lanzhou/gulang",
	name = "����",
	ways = {
		["southeast"] = "lanzhou/xjqiao",
		["northwest"] = "lanzhou/dacaigou",
		["east"] = "lanzhou/yaocaidian",
	},
}
Room {
	id = "lanzhou/hongsx",
	name = "��ɽϿ",
	ways = {
		["southeast"] = "lanzhou/jintai",
		["north"] = "lanzhou/shimen",
	},
}
Room {
	id = "lanzhou/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "lanzhou/zhenting",
	},
	postcmds = {
		["south"] = "#walkBusy",
	},
}
Room {
	id = "lanzhou/huanghe_2",
	name = "�ƺ�",
	ways = {
		["northwest"] = "lanzhou/jintai",
		["east"] = "lanzhou/huanghe_3",
	},
}
Room {
	id = "lanzhou/huanghe_3",
	name = "�ƺ�",
	ways = {
		["southeast"] = "lanzhou/dukou3",
		["west"] = "lanzhou/huanghe_2",
	},
}
Room {
	id = "lanzhou/jingyuan",
	name = "��Զ",
	ways = {
		["eastup"] = "lanzhou/lpshan",
		["southwest"] = "group/entry/lzroad1",
		["northeast"] = "lanzhou/kongdong",
	},
}
Room {
	id = "lanzhou/jintai",
	name = "��̩",
	ways = {
		["southeast"] = "lanzhou/huanghe_2",
		["northwest"] = "lanzhou/hongsx",
	},
}
Room {
	id = "lanzhou/kedian",
	name = "�͵�",
	ways = {
		["#lzkedianoutgosleep"] = "lanzhou/yongdeng",
		["#lanzhoukedian"] = "lanzhou/kedian2",
	},
	lengths = {
		["#lanzhoukedian"] = 5,	
	},
}
Room {
	id = "lanzhou/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "lanzhou/kedian3",
		["down"] = "lanzhou/kedian",
	},
}
Room {
	id = "lanzhou/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "lanzhou/kedian2",
	},
}
Room {
	id = "lanzhou/kongdong",
	name = "���ɽ",
	ways = {
		["southwest"] = "lanzhou/jingyuan",
		["northdown"] = "lanzhou/shanlu1",
	},
}
Room {
	id = "lanzhou/lanzhou",
	name = "������",
	ways = {
		["south"] = "lanzhou/lanzhous",
		["east"] = "lanzhou/lanzhoue",
		["west"] = "lanzhou/lanzhouw",
	},
}
Room {
	id = "lanzhou/lanzhoue",
	name = "������",
	ways = {
		["east"] = "lanzhou/road5",
		["west"] = "lanzhou/lanzhou",
	},
}
Room {
	id = "lanzhou/lanzhous",
	name = "�ϳ���",
	ways = {
		["south"] = "lanzhou/sroad1",
		["north"] = "lanzhou/lanzhou",
	},
}
Room {
	id = "lanzhou/lanzhouw",
	name = "������",
	ways = {
		["northwest"] = "lanzhou/road6",
		["east"] = "lanzhou/lanzhou",
	},
}
Room {
	id = "lanzhou/lpshan",
	name = "����ɽ",
	ways = {
		["westdown"] = "lanzhou/jingyuan",
		["southeast"] = "changan/westroad2",
	},
}
Room {
	id = "lanzhou/qianting",
	name = "ǰ��",
	ways = {
		["north"] = "lanzhou/zhenting",
		["east"] = "lanzhou/zhengmen",
	},
	postcmds = {
		["north"] = "#walkBusy",
	},
}
Room {
	id = "lanzhou/qingcheng",
	name = "���",
	ways = {
		["south"] = "chengdu/road1",
		["northwest"] = "group/entry/lzsroad3",
	},
}
Room {
	id = "lanzhou/road2",
	name = "��ɿ�",
	ways = {
		["#duHhe"] = "lanzhou/road3",
		["east"] = "lanzhou/road6",
	},
	lengths = {
		["#duHhe"] = 10000,
	},
	nolooks = {
		["enter"] = true,
		["#duHhe"] = true,
	},
}
Room {
	id = "lanzhou/road3",
	name = "��ɿ�",
	ways = {
		["#duHhe"] = "lanzhou/road2",
		["northwest"] = "lanzhou/road4",
	},
	lengths = {
		["#duHhe"] = 10000,
	},
	nolooks = {
		["#duHhe"] = true,
		["enter"] = true,
	},
}
Room {
	id = "lanzhou/road4",
	name = "���",
	ways = {
		["southeast"] = "lanzhou/road3",
		["west"] = "lanzhou/yongdeng",
	},
	room_relative="����-----����K��ɿڴ��",
}
Room {
	id = "lanzhou/road5",
	name = "���",
	ways = {
		["northeast"] = "group/entry/lzroad1",
		["west"] = "lanzhou/lanzhoue",
	},
	room_relative="����J������-----������",
}
Room {
	id = "lanzhou/road6",
	name = "���",
	ways = {
		["southeast"] = "lanzhou/lanzhouw",
		["west"] = "lanzhou/road2",
	},
	room_relative="��ɿ�-----����K�����Ŵ��",
}
Room {
	id = "lanzhou/shamo",
	name = "ɳĮ",
	ways = {
		["south"] = "lanzhou/shamo1",
		["east"] = "lanzhou/shamo",
		["north"] = "lanzhou/shamo",
		["west"] = "lanzhou/shamo",
		["#toQc"] = "lanzhou/qingcheng",
	},
	nolooks = {
		["#toQc"] = true,
	},
	lengths = {
		["#toQc"] = 50,
	},
}
--Room {
--	id = "lanzhou/shamo1",
--	name = "ɳĮ",
--	ways = {
--		["south"] = "lanzhou/shamo",
--		["enter"] = "lanzhou/shidong",
--		["east"] = "lanzhou/shamo",
--		["north"] = "lanzhou/shamo",
--		["west"] = "lanzhou/shamo",
--	},
--}
Room {
	id = "lanzhou/shanlu1",
	name = "ɽ����",
	ways = {
		["southup"] = "lanzhou/kongdong",
		["northwest"] = "lanzhou/dukou2",
	},
}
Room {
	id = "lanzhou/shidong",
	name = "ʯ��",
	ways = {
		["out"] = "lanzhou/shamo1",
	},
	objs = {
          ["÷����"] = "mei chaofeng",
		  ["������"] = "chen xuanfeng",
           },
}
Room {
	id = "lanzhou/shimen",
	name = "ʯ��",
	ways = {
		["south"] = "lanzhou/hongsx",
		["north"] = "lanzhou/wufosi",
		["west"] = "lanzhou/gccheng",
	},
	objs = {
          ["��ʯ��"] = "caishi ren",
           },
}
Room {
	id = "lanzhou/sroad1",
	name = "���",
	ways = {
		["south"] = "lanzhou/sroad2",
		["north"] = "lanzhou/lanzhous",
		["west"] = "lanzhou/zhengmen",
	},
	room_relative="�ϳ��ţ����ׯ�ſ�-----�����������",
}
Room {
	id = "lanzhou/sroad2",
	name = "���",
	ways = {
		["southeast"] = "group/entry/lzsroad3",
		["north"] = "lanzhou/sroad1",
	},
	room_relative="���������K������",
}
Room {
	id = "lanzhou/tumenzi",
	name = "������",
	ways = {
		["northeast"] = "group/entry/lzshixia",
		["west"] = "lanzhou/wuwei",
	},
	nolooks = {
		["down"] = true,
	},
}
Room {
	id = "lanzhou/wufosi",
	name = "�����",
	ways = {
		["south"] = "lanzhou/shimen",
	},
	nolooks = {
		["down"] = true,
	},
}
Room {
	id = "lanzhou/wuqiao",
	name = "������",
	ways = {
		["south"] = "lanzhou/dacaigou",
		["northwest"] = "lanzhou/wuwei",
	},
}
Room {
	id = "lanzhou/wuwei",
	name = "����",
	ways = {
		["southeast"] = "lanzhou/wuqiao",
		["northwest"] = "xingxiu/road4",
		["east"] = "lanzhou/tumenzi",
	},
}
Room {
	id = "lanzhou/xjqiao",
	name = "������",
	ways = {
		["southeast"] = "lanzhou/yongdeng",
		["northwest"] = "lanzhou/gulang",
	},
}
Room {
	id = "lanzhou/yaocaidian",
	name = "Ƥ��ҩ�ĵ�",
	ways = {
		["west"] = "lanzhou/gulang",
	},
}
Room {
	id = "lanzhou/yinpanshui",
	name = "Ӫ��ˮ",
	ways = {
		["southwest"] = "lanzhou/bingcao",
		["east"] = "lanzhou/gccheng",
	},
}
Room {
	id = "lanzhou/yongdeng",
	name = "����",
	ways = {
		["northwest"] = "lanzhou/xjqiao",
		["east"] = "lanzhou/road4",
		["west"] = "lanzhou/kedian",
	},
}
Room {
	id = "lanzhou/zhengmen",
	name = "���ׯ�ſ�",
	no_fight = true,
	ways = {
		["east"] = "lanzhou/sroad1",
		["west"] = "lanzhou/qianting",
	},
	precmds = {
		["east"] = "#walkBusy",
		["west"] = "#walkBusy",
	},
}
Room {
	id = "lanzhou/zhenting",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "lanzhou/qianting",
		["north"] = "lanzhou/houyuan",
	},
	objs = {
          ["���˷�"] = "miao renfeng",
           },
}
Room {
	id = "meizhuang/ceting2",
	name = "����",
	ways = {
		["west"] = "meizhuang/huilang20",
	},
}
Room {
	id = "meizhuang/ceting3",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang21",
	},
}
Room {
	id = "meizhuang/door",
	name = "ׯԺ����",
	ways = {
		["north"] = "meizhuang/road3",
		["mzDoor"] = "meizhuang/tianjing",
	},
	lengths = {
	    ["mzDoor"] = "if Bag['��������'] then return 1 else return false end",
	},
}
Room {
	id = "meizhuang/gushan",
	name = "��ɽ",
	ways = {
		["east"] = "meizhuang/hubian",
	},
}
Room {
	id = "meizhuang/hall",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang",
		["north"] = "meizhuang/tianjing",
	},
}
Room {
	id = "meizhuang/houtang2",
	name = "����",
	ways = {
		["north"] = "meizhuang/huilang12",
	},
}
Room {
	id = "meizhuang/houtang3",
	name = "����",
	ways = {
		["north"] = "meizhuang/huilang13",
	},
}
Room {
	id = "meizhuang/huashi",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang6",
	},
}
Room {
	id = "meizhuang/hubian",
	name = "������",
	ways = {
		["east"] = "meizhuang/shiji",
		["west"] = "hz/gushan",
	},
	room_relative="��ɽ----������----ʯ��������",
}
Room {
	id = "meizhuang/huilang",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang3",
		["north"] = "meizhuang/hall",
		["west"] = "meizhuang/huilang2",
	},
}
Room {
	id = "meizhuang/huilang10",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang12",
		["east"] = "meizhuang/huilang8",
	},
}
Room {
	id = "meizhuang/huilang11",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang13",
		["west"] = "meizhuang/huilang9",
	},
}
Room {
	id = "meizhuang/huilang12",
	name = "����",
	ways = {
		["south"] = "meizhuang/houtang2",
		["east"] = "meizhuang/huilang14",
		["north"] = "meizhuang/huilang10",
	},
}
Room {
	id = "meizhuang/huilang13",
	name = "����",
	ways = {
		["south"] = "meizhuang/houtang3",
		["north"] = "meizhuang/huilang11",
		["west"] = "meizhuang/huilang15",
	},
}
Room {
	id = "meizhuang/huilang14",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang16",
		["west"] = "meizhuang/huilang12",
	},
}
Room {
	id = "meizhuang/huilang15",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang13",
		["west"] = "meizhuang/huilang17",
	},
}
Room {
	id = "meizhuang/huilang16",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang19",
		["west"] = "meizhuang/huilang14",
	},
}
Room {
	id = "meizhuang/huilang17",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang15",
		["west"] = "meizhuang/huilang19",
	},
}
Room {
	id = "meizhuang/huilang19",
	name = "����",
	ways = {
		["north"] = "meizhuang/qinshi",
		["east"] = "meizhuang/huilang17",
		["west"] = "meizhuang/huilang16",
	},
}
Room {
	id = "meizhuang/huilang2",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang",
		["west"] = "meizhuang/huilang4",
	},
}
Room {
	id = "meizhuang/huilang20",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang4",
		["north"] = "meizhuang/huilang22",
		["east"] = "meizhuang/ceting2",
	},
}
Room {
	id = "meizhuang/huilang21",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang5",
		["north"] = "meizhuang/huilang23",
		["west"] = "meizhuang/ceting3",
	},
}
Room {
	id = "meizhuang/huilang22",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang20",
		["east"] = "meizhuang/huilang24",
		["west"] = "meizhuang/xiangfang2",
	},
}
Room {
	id = "meizhuang/huilang23",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang21",
		["east"] = "meizhuang/xiangfang3",
		["west"] = "meizhuang/huilang25",
	},
}
Room {
	id = "meizhuang/huilang24",
	name = "����",
	ways = {
		["east"] = "meizhuang/tianjing",
		["west"] = "meizhuang/huilang22",
	},
}
Room {
	id = "meizhuang/huilang25",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang23",
		["west"] = "meizhuang/tianjing",
	},
}
Room {
	id = "meizhuang/huilang3",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang5",
		["west"] = "meizhuang/huilang",
	},
}
Room {
	id = "meizhuang/huilang4",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang6",
		["north"] = "meizhuang/huilang20",
		["east"] = "meizhuang/huilang2",
		["west"] = "meizhuang/jiushi",
	},
}
Room {
	id = "meizhuang/huilang5",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang7",
		["east"] = "meizhuang/qishi",
		["north"] = "meizhuang/huilang21",
		["west"] = "meizhuang/huilang3",
	},
}
Room {
	id = "meizhuang/huilang6",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang8",
		["north"] = "meizhuang/huilang4",
		["west"] = "meizhuang/huashi",
	},
}
Room {
	id = "meizhuang/huilang7",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang9",
		["east"] = "meizhuang/shufang",
		["north"] = "meizhuang/huilang5",
	},
}
Room {
	id = "meizhuang/huilang8",
	name = "����",
	ways = {
		["north"] = "meizhuang/huilang6",
		["west"] = "meizhuang/huilang10",
	},
}
Room {
	id = "meizhuang/huilang9",
	name = "����",
	ways = {
		["north"] = "meizhuang/huilang7",
		["east"] = "meizhuang/huilang11",
	},
}
Room {
	id = "meizhuang/jiushi",
	name = "����",
	ways = {
		["east"] = "meizhuang/huilang4",
	},
}
Room {
	id = "meizhuang/neishi",
	name = "����",
	ways = {
		["south"] = "meizhuang/qinshi",
	},
}
Room {
	id = "meizhuang/plum_maze",
	name = "÷��",
	ways = {
		["#mlOutt"] = "meizhuang/road2",
	},
}
Room {
	id = "meizhuang/qinshi",
	name = "����",
	ways = {
		["south"] = "meizhuang/huilang19",
		["north"] = "meizhuang/neishi",
	},
}
Room {
	id = "meizhuang/qishi",
	name = "����",
	ways = {
		["west"] = "meizhuang/huilang5",
	},
}
Room {
	id = "meizhuang/road1",
	name = "С·",
	ways = {
		["south"] = "meizhuang/road2",
		["west"] = "meizhuang/shiji",
	},
}
Room {
	id = "meizhuang/road2",
	name = "С·",
	ways = {
		["#inmz"] = "meizhuang/plum_maze",
		["north"] = "meizhuang/road1",
	},
	room_relative="С·��С·��÷��С·",
	lengths = {
		["south"] = 3,
	},
}
Room {
	id = "meizhuang/road3",
	name = "��ʯ���·",
	ways = {
		["south"] = "meizhuang/door",
		["north"] = "meizhuang/plum_maze",
	},
}
Room {
	id = "meizhuang/shiji",
	name = "ʯ��",
	ways = {
		["east"] = "meizhuang/road1",
		["west"] = "meizhuang/hubian",
	},
}
Room {
	id = "meizhuang/shufang",
	name = "�鷿",
	ways = {
		["west"] = "meizhuang/huilang7",
	},
}
Room {
	id = "meizhuang/tianjing",
	name = "�쾮",
	ways = {
		["south"] = "meizhuang/hall",
		["east"] = "meizhuang/huilang25",
		["north"] = "meizhuang/door",
		["west"] = "meizhuang/huilang24",
	},
}
Room {
	id = "meizhuang/xiangfang2",
	name = "�᷿",
	ways = {
		["east"] = "meizhuang/huilang22",
	},
}
Room {
	id = "meizhuang/xiangfang3",
	name = "�᷿",
	ways = {
		["west"] = "meizhuang/huilang23",
	},
}
Room {
	id = "miaojiang/bingqif",
	name = "������",
	ways = {
		["west"] = "miaojiang/qiant",
	},
}
Room {
	id = "miaojiang/chufang",
	name = "����",
	ways = {
		["east"] = "miaojiang/qiant",
	},
}
Room {
	id = "miaojiang/guoyuan",
	name = "��԰",
	ways = {
		["west"] = "miaojiang/jiedao5",
	},
}
Room {
	id = "miaojiang/haozhai",
	name = "���",
	ways = {
		["north"] = "miaojiang/jiedao3",
	},
	objs = {
          ["����"] = "chen qing",
           },
}
Room {
	id = "miaojiang/houshan",
	name = "��ɽ",
	ways = {
		["southeast"] = "miaojiang/shanlu",
	},
	objs = {
          ["�ֻ�"] = "yan ji",
           },
}
Room {
	id = "miaojiang/jiedao1",
	name = "С��",
	ways = {
		["south"] = "miaojiang/jiedao2",
		["east"] = "miaojiang/zhd",
		["north"] = "miaojiang/xiaolu2",
	},
	room_relative="С·��С��-----�ӻ����С��С��",
	objs = {
          ["���"] = "miao bing",
           },
}
Room {
	id = "miaojiang/jiedao2",
	name = "С��",
	ways = {
		["southeast"] = "miaojiang/ywj",
		["south"] = "miaojiang/jiedao3",
		["east"] = "miaojiang/xiaotan",
		["north"] = "miaojiang/jiedao1",
	},
	room_relative="С���С��-----С̯���KС��ҩ����С��",
}
Room {
	id = "miaojiang/jiedao3",
	name = "С��",
	ways = {
		["south"] = "miaojiang/haozhai",
		["east"] = "miaojiang/jiedao5",
		["north"] = "miaojiang/jiedao2",
		["west"] = "miaojiang/jiedao4",
	},
	room_relative="С���С��-----С��-----С������С��",
}
Room {
	id = "miaojiang/jiedao4",
	name = "С��",
	ways = {
		["north"] = "miaojiang/mzhai",
		["east"] = "miaojiang/jiedao3",
		["west"] = "miaojiang/slu1",
	},
	room_relative="���ݣ�ɽ��-----С��-----С��С��",
}
Room {
	id = "miaojiang/jiedao5",
	name = "С��",
	ways = {
		["southeast"] = "miaojiang/lianwuc",
		["east"] = "miaojiang/guoyuan",
		["west"] = "miaojiang/jiedao3",
	},
	room_relative="С��-----С��-----��԰�K���䳡С��",
}
Room {
	id = "miaojiang/lianwuc",
	name = "���䳡",
	ways = {
		["northwest"] = "miaojiang/jiedao5",
	},
	objs = {
          ["��������"] = "miaozu qingnian",
           },
}
Room {
	id = "miaojiang/myp",
	name = "������",
	ways = {
		["south"] = "miaojiang/xiaolu1",
		["northeast"] = "miaojiang/shandao1",
	},
}
Room {
	id = "miaojiang/myt",
	name = "������",
	ways = {
		["south"] = "miaojiang/qiant",
		["northwest"] = "miaojiang/shef",
	},
	objs = {
          ["�κ�ҩ"] = "he hongyao",
           },
}
Room {
	id = "miaojiang/mzhai",
	name = "����",
	ways = {
		["south"] = "miaojiang/jiedao4",
	},
	objs = {
          ["�����Ϻ�"] = "miaozu laohan",
           },
}
Room {
	id = "miaojiang/qiant",
	name = "ǰ��",
	ways = {
		["south"] = "miaojiang/wddamen",
		["north"] = "miaojiang/myt",
		["east"] = "miaojiang/bingqif",
		["west"] = "miaojiang/chufang",
	},
}
Room {
	id = "miaojiang/shandao1",
	name = "ɽ��",
	ways = {
		["southwest"] = "miaojiang/myp",
		["west"] = "miaojiang/shandao2",
	},
	room_relative="ɽ��-----ɽ���L������ɽ��",
}
Room {
	id = "miaojiang/shandao2",
	name = "ɽ��",
	ways = {
		["east"] = "miaojiang/shandao1",
		["north"] = "group/entry/mjshan2",
	},
	room_relative="ɽ·��ɽ��-----ɽ��ɽ��",
}
Room {
	id = "miaojiang/shandong",
	name = "ɽ��",
	ways = {
		["out"] = "miaojiang/slu9",
	},
}
Room {
	id = "miaojiang/shanlu",
	name = "ɽ·",
	ways = {
		["southeast"] = "miaojiang/slu1",
		["northwest"] = "miaojiang/houshan",
	},
	room_relative="ɽ·�Kɽ��ɽ·",
	nolooks = {
		["northwest"] = true,
	},
	precmds = {
		["northwest"] = "push grass",
	},
}
Room {
	id = "miaojiang/shanlu1",
	name = "С·",
	ways = {
		["southeast"] = "miaojiang/xiaolu1",
	},
	room_relative="ɽ·ɽ·�I��ɽ��-----С��ɽ��",
}
Room {
	id = "miaojiang/shanya2",
	name = "ɽ��",
	ways = {
		["west"] = "miaojiang/wddamen",
	},
}
Room {
	id = "miaojiang/shef",
	name = "�߷�",
	ways = {
		["southeast"] = "miaojiang/myt",
		["south"] = "miaojiang/woshi",
	},
	objs = {
          ["��ɫ����"] = "heise dushe",
           },
}
Room {
	id = "miaojiang/slu1",
	name = "ɽ��",
	ways = {
		["northwest"] = "miaojiang/shanlu",
		["east"] = "miaojiang/jiedao4",
		["#Inwdj"] = "miaojiang/slu2",
	},
	blocks={
	    ["#Inwdj"] = {
			{id = "wudujiao dizi", exp = 150000},
			},
	},
	lengths = {
		["#Inwdj"] = "if inwdj==0 then return false else return 1 end",
	},
}
Room {
	id = "miaojiang/slu2",
	name = "ɽ·",
	ways = {
		["northup"] = "miaojiang/slu4",
		["eastup"] = "miaojiang/slu3",
		["southdown"] = "miaojiang/slu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·��ɽ��ɽ·",
	objs = {
          ["����"] = "du she",
           },
}
Room {
	id = "miaojiang/slu3",
	name = "ɽ·",
	ways = {
		["northup"] = "miaojiang/slu6",
		["eastdown"] = "miaojiang/slu5",
		["westdown"] = "miaojiang/slu2",
	},
	room_relative="ɽ·��ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu4",
	name = "ɽ·",
	ways = {
		["northup"] = "miaojiang/wddamen",
		["southdown"] = "miaojiang/slu2",
	},
	room_relative="���š�ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu5",
	name = "ɽ·",
	ways = {
		["northup"] = "miaojiang/slu7",
		["westup"] = "miaojiang/slu3",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
	objs = {
          ["����"] = "du she",
           },
}
Room {
	id = "miaojiang/slu6",
	name = "ɽ·",
	ways = {
		["southdown"] = "miaojiang/slu3",
	},
	room_relative="ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu7",
	name = "ɽ·",
	ways = {
		["northwest"] = "miaojiang/slu8",
		["southdown"] = "miaojiang/slu5",
	},
	room_relative="ɽ·�Iɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu8",
	name = "ɽ·",
	ways = {
		["southeast"] = "miaojiang/slu7",
		["east"] = "miaojiang/slu9",
	},
	room_relative="ɽ·-----ɽ·�Kɽ·ɽ·",
}
Room {
	id = "miaojiang/slu9",
	name = "ɽ·",
	ways = {
		["enter"] = "miaojiang/shandong",
		["west"] = "miaojiang/slu8",
	},
	room_relative="ɽ����ɽ·-----ɽ·ɽ·",
}
Room {
	id = "miaojiang/wddamen",
	name = "����",
	ways = {
		["east"] = "miaojiang/shanya2",
		["north"] = "miaojiang/qiant",
		["southdown"] = "miaojiang/slu4",
	},
	objs = {
          ["�嶾�̵���"] = "wudujiao dizi",
           },
}
Room {
	id = "miaojiang/woshi",
	name = "����",
	ways = {
		["north"] = "miaojiang/shef",
	},
	objs = {
          ["������"] = "he tieshou",
           },
}
Room {
	id = "miaojiang/xiaolu1",
	name = "С·",
	ways = {
		["northwest"] = "miaojiang/shanlu1",
		["east"] = "miaojiang/xiaolu2",
		["north"] = "miaojiang/myp",
	},
	room_relative="С·�������I��С·-----С·С·",
}
Room {
	id = "miaojiang/xiaolu2",
	name = "С·",
	ways = {
		["south"] = "miaojiang/jiedao1",
		["west"] = "miaojiang/xiaolu1",
	},
	room_relative="С·-----С·��С��С·",
}
Room {
	id = "miaojiang/xiaotan",
	name = "С̯",
	ways = {
		["west"] = "miaojiang/jiedao2",
	},
	objs = {
          ["���Ů��"] = "miaojia nuzi",
           },
}
Room {
	id = "miaojiang/yaofang1",
	name = "ҩ����",
	no_fight = true,
	ways = {
		["south"] = "miaojiang/ywj",
	},
	objs = {
          ["��¯"] = "dan lu",
           },
}
Room {
	id = "miaojiang/ywj",
	name = "ҩ����",
	no_fight = true,
	ways = {
		["northwest"] = "miaojiang/jiedao2",
		["north"] = "miaojiang/yaofang1",
	},
	objs = {
          ["������"] = "cheng lingsu",
           },
}
Room {
	id = "miaojiang/zhd",
	name = "�ӻ���",
	ways = {
		["west"] = "miaojiang/jiedao1",
	},
}
Room {
	id = "mingjiao/bank",
	name = "����ի",
	ways = {
		["east"] = "mingjiao/shejing",
	},
	objs = {
          ["�����"] = "long juanfeng",
           },
}
Room {
	id = "mingjiao/baota",
	name = "��������",
	ways = {
		["enter"] = "mingjiao/baota0",
		["southdown"] = "mingjiao/sht",
	},
}
Room {
	id = "mingjiao/baota0",
	name = "����һ¥",
	ways = {
		["out"] = "mingjiao/baota",
	},
}
Room {
	id = "mingjiao/bhd/cling",
	name = "����",
	ways = {
		["south"] = "mingjiao/bhd/shishan",
		["north"] = "mingjiao/bhd/cling1",
	},
}
Room {
	id = "mingjiao/bhd/cling1",
	name = "����",
	ways = {
		["south"] = "mingjiao/bhd/cling",
	},
}
Room {
	id = "mingjiao/bhd/dbshan",
	name = "��ɽ",
	ways = {
		["east"] = "mingjiao/bhd/dbshan1",
	},
}
Room {
	id = "mingjiao/bhd/dbshan1",
	name = "��ɽ",
	ways = {
		["west"] = "mingjiao/bhd/dbshan",
	},
}
Room {
	id = "mingjiao/bhd/hsjiao",
	name = "��ɽ����",
	ways = {
		["westup"] = "mingjiao/bhd/huoshan1",
		["east"] = "mingjiao/bhd/ysroad2",
	},
}
Room {
	id = "mingjiao/bhd/huoshan1",
	name = "��ɽ",
	ways = {
		["northup"] = "mingjiao/bhd/huoshan2",
		["eastdown"] = "mingjiao/bhd/hsjiao",
	},
}
Room {
	id = "mingjiao/bhd/huoshan2",
	name = "��ɽ��",
	ways = {
		["southdown"] = "mingjiao/bhd/huoshan1",
	},
}
Room {
	id = "mingjiao/bhd/pingyan1",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/yanshi",
		["north"] = "mingjiao/bhd/pingyan2",
	},
}
Room {
	id = "mingjiao/bhd/pingyan2",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/yanshi",
		["north"] = "mingjiao/bhd/shishan",
		["east"] = "mingjiao/bhd/pingyan4",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/pingyan3",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/pingyan4",
		["north"] = "mingjiao/bhd/pingyan1",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/pingyan4",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/pingyan4",
		["north"] = "mingjiao/bhd/pingyan1",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/shishan",
	name = "ʯɽ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/shishan1",
		["north"] = "mingjiao/bhd/cling",
		["west"] = "mingjiao/bhd/ysroad1",
	},
}
Room {
	id = "mingjiao/bhd/shishan1",
	name = "Сʯɽ",
	ways = {
		["west"] = "mingjiao/bhd/shishan",
	},
}
Room {
	id = "mingjiao/bhd/xdong",
	name = "ʯ��",
	ways = {
		["out"] = "mingjiao/bhd/shishan1",
	},
}
Room {
	id = "mingjiao/bhd/xiongdong",
	name = "�ܶ�",
	ways = {
		["out"] = "mingjiao/bhd/shishan",
	},
}
Room {
	id = "mingjiao/bhd/yanshi",
	name = "��ʯ",
	ways = {
		["north"] = "mingjiao/bhd/pingyan1",
	},
}
Room {
	id = "mingjiao/bhd/ysroad1",
	name = "��ʯ·",
	ways = {
		["east"] = "mingjiao/bhd/shishan",
		["west"] = "mingjiao/bhd/ysroad2",
	},
}
Room {
	id = "mingjiao/bhd/ysroad2",
	name = "��ʯ·",
	ways = {
		["east"] = "mingjiao/bhd/ysroad1",
		["west"] = "mingjiao/bhd/hsjiao",
	},
}
Room {
	id = "mingjiao/bingqi",
	name = "������",
	ways = {
		["north"] = "mingjiao/huoqi",
	},
	postcmds = {
		["north"] = "#walkBusy",
	},
	objs = {
          ["�⾢��"] = "wu jincao",
           },
}
Room {
	id = "mingjiao/bishui",
	name = "��ˮ��̶",
	ways = {
		["west"] = "mingjiao/shanlu2",
		["jump down"] = "mingjiao/tandi",
	},
	nolooks = {
		["jump down"] = true,
	},
	precmds = {
		["west"] = "#walkBusy",
		["jump down"] = "#walkBusy",
	},
}
Room {
	id = "mingjiao/cl1",
	name = "����",
	ways = {
		["east"] = "mingjiao/wu3",
		["west"] = "mingjiao/huoqi",
	},
}
Room {
	id = "mingjiao/cl2",
	name = "����",
	ways = {
		["east"] = "mingjiao/shuiqi",
		["west"] = "mingjiao/wu3",
	},
}
Room {
	id = "mingjiao/dashaqiu",
	name = "��ɳ��",
	ways = {
		["east"] = "mingjiao/htping",
		["west"] = "mingjiao/shejing",
	},
}
Room {
	id = "mingjiao/didao/bidao1",
	name = "�ص����",
	ways = {
		["north"] = "mingjiao/didao/bidao2",
		["out"] = "mingjiao/wxiang",
	},
}
Room {
	id = "mingjiao/didao/bidao10",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao11",
		["westup"] = "mingjiao/didao/bidao9",
	},
}
Room {
	id = "mingjiao/didao/bidao11",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao12",
		["westup"] = "mingjiao/didao/bidao10",
	},
}
Room {
	id = "mingjiao/didao/bidao12",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao11",
		["south"] = "mingjiao/didao/bidao13",
	},
}
Room {
	id = "mingjiao/didao/bidao13",
	name = "�ؽ���",
	ways = {
		["north"] = "mingjiao/didao/bidao12",
	},
}
Room {
	id = "mingjiao/didao/bidao15",
	name = "�ص�",
	ways = {
		["northup"] = "mingjiao/didao/bidao20",
		["eastup"] = "mingjiao/didao/bidao16",
		["north"] = "mingjiao/didao/bidao22",
	},
}
Room {
	id = "mingjiao/didao/bidao16",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao17",
		["westdown"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao17",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao18",
		["eastdown"] = "mingjiao/didao/bidao4",
		["northdown"] = "mingjiao/didao/bidao16",
	},
}
Room {
	id = "mingjiao/didao/bidao18",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao19",
		["northdown"] = "mingjiao/didao/bidao17",
	},
}
Room {
	id = "mingjiao/didao/bidao19",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao18",
		["out"] = "mingjiao/shanyao",
	},
}
Room {
	id = "mingjiao/didao/bidao2",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/bidao1",
		["east"] = "mingjiao/didao/bidao3",
	},
}
Room {
	id = "mingjiao/didao/bidao20",
	name = "�ص�",
	ways = {
		["east"] = "mingjiao/didao/bidao21",
		["southdown"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao21",
	name = "�ص�",
	ways = {
		["west"] = "mingjiao/didao/bidao20",
		["out"] = "mingjiao/tuqi",
	},
}
Room {
	id = "mingjiao/didao/bidao22",
	name = "����",
	ways = {
		["south"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao3",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/bidao4",
		["west"] = "mingjiao/didao/bidao2",
	},
}
Room {
	id = "mingjiao/didao/bidao4",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao17",
		["south"] = "mingjiao/didao/bidao3",
	},
}
Room {
	id = "mingjiao/didao/bidao5",
	name = "�ص�",
	ways = {
		["northdown"] = "mingjiao/didao/bidao6",
	},
}
Room {
	id = "mingjiao/didao/bidao6",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao5",
		["eastdown"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/bidao7",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao6",
	},
}
Room {
	id = "mingjiao/didao/bidao8",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao9",
		["out"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/bidao9",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao10",
		["westup"] = "mingjiao/didao/bidao8",
	},
}
Room {
	id = "mingjiao/didao/mbidao1",
	name = "�ص�",
	ways = {
		["west"] = "mingjiao/didao/mbidao2",
	},
}
Room {
	id = "mingjiao/didao/mbidao2",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/mbidao3",
		["east"] = "mingjiao/didao/mbidao1",
	},
}
Room {
	id = "mingjiao/didao/mbidao3",
	name = "�ص�",
	ways = {
		["east"] = "mingjiao/didao/mbidao4",
		["north"] = "mingjiao/didao/mbidao2",
	},
}
Room {
	id = "mingjiao/didao/mbidao4",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/mbidao5",
		["west"] = "mingjiao/didao/mbidao3",
	},
}
Room {
	id = "mingjiao/didao/mbidao5",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/mbidao4",
		["west"] = "mingjiao/didao/mbidao6",
	},
}
Room {
	id = "mingjiao/didao/mbidao6",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/mchukou",
		["east"] = "mingjiao/didao/mbidao5",
	},
}
Room {
	id = "mingjiao/didao/mchukou",
	name = "�ص�����",
	ways = {
		["up"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/men-di",
	name = "������",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-feng",
	name = "������",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-lei",
	name = "������",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-tian",
	name = "������",
	ways = {
		["southwest"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/senlin",
	name = "��ɼ��",
	ways = {
		["#outzsl"] = "mingjiao/shuiqi",
		["#tianMen"] = "mingjiao/didao/men-tian",
		["#diMen"] = "mingjiao/didao/men-di",
		["#fengMen"] = "mingjiao/didao/men-feng",
		["#leiMen"] = "mingjiao/didao/men-lei",
	},
	lengths = {
		["#outzsl"] = 50,
		["#tianMen"] = 1,
		["#diMen"] = 1,
		["#fengMen"] = 1,
		["#leiMen"] = 1,
	},
}
Room {
	id = "mingjiao/didao/shenchu1",
	name = "�����",
	ways = {
		["northwest"] = "mingjiao/didao/shenchu2",
		["north"] = "mingjiao/didao/shuling2",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
    },
	room_relative="��������֨I������������",
}
Room {
	id = "mingjiao/didao/shenchu2",
	name = "�����",
	ways = {
		["southeast"] = "mingjiao/didao/shenchu4",
		["north"] = "mingjiao/didao/shenchu5",
		["northeast"] = "mingjiao/didao/shenchu3",
		["west"] = "mingjiao/didao/shenchu1",
	},
	objs = {
          ["ҩ��"] = "yao cao",
          ["������"] = "da shugan",
    },
	room_relative="�������������J�����---������K����������",
}
Room {
	id = "mingjiao/didao/shenchu3",
	name = "�����",
	ways = {
		["southwest"] = "mingjiao/didao/shenchu2",
		["south"] = "mingjiao/didao/shenchu5",
		["northwest"] = "mingjiao/didao/shenchu1",
		["east"] = "mingjiao/didao/shenchu4",
	},
	objs = {
          ["����"] = "du she",
           },
	room_relative="������I�����---������L�����������������",
}
Room {
	id = "mingjiao/didao/shenchu4",
	name = "�����",
	ways = {
		["northwest"] = "mingjiao/didao/shuling6",
		["west"] = "mingjiao/didao/shenchu3",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
          ["Ұ��"] = "ye tu",
    },
	room_relative="���֨I�����---����������",
}
Room {
	id = "mingjiao/didao/shenchu5",
	name = "�����",
	ways = {
		["south"] = "mingjiao/didao/shenchu2",
		["north"] = "mingjiao/didao/shenchu3",
	},
	room_relative="������������������������",
}
Room {
	id = "mingjiao/didao/shuling1",
	name = "����",
	ways = {
		["south"] = "mingjiao/didao/shuling3",
		["east"] = "mingjiao/muqi",
		["west"] = "mingjiao/didao/shuling4",
	},
	nolooks = {
		["north"] = true,
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
          ["Сʯͷ"] = "xiao shitou",
    },
	room_relative="���֣�����-----����-----��ľ�����������",
}
Room {
	id = "mingjiao/didao/shuling2",
	name = "����",
	ways = {
		["south"] = "mingjiao/didao/shenchu5",
		["north"] = "mingjiao/didao/shuling6",
		["west"] = "mingjiao/muqi",
	},
	objs = {
          ["������"] = "da shugan",
    },
	room_relative="���֣���ľ��-----����-----���֣����������",
}

Room {
	id = "mingjiao/didao/shuling3",
	name = "����",
	ways = {
		["#mjSlout1"] = "mingjiao/didao/shenchu1",
	},
}
Room {
	id = "mingjiao/didao/shuling4",
	name = "����",
	ways = {
		["#mjSlout1"] = "mingjiao/didao/shenchu1",
	},
	objs = {
          ["���"] = "xu da",
    },
}
Room {
	id = "mingjiao/didao/shuling5",
	name = "����",
	ways = {
		["#mjSlout4"] = "mingjiao/didao/shenchu4",
	},
	objs = {
          ["��Ԫ�"] = "zhu yuanzhang",
    },
}
Room {
	id = "mingjiao/didao/shuling6",
	name = "����",
	ways = {
		["#mjSlout4"] = "mingjiao/didao/shenchu4",
		["east"] = "mingjiao/didao/shuling5",
	
	},
	objs = {
          ["������"] = "chang yuchun",
    },
}
Room {
	id = "mingjiao/eatroom",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/xting",
	},
	objs = {
          ["����"] = "zong zi",
          ["��÷��"] = "suanmei tang",
           },
}
Room {
	id = "mingjiao/gmd",
	name = "������",
	ways = {
		["northup"] = "mingjiao/wu3",
		["southdown"] = "mingjiao/muqi",
	},
	objs = {
          ["����ʥ��"] = "board",
          ["����»"] = "yin wulu",
           },
}
Room {
	id = "mingjiao/guangc",
	name = "�㳡",
	ways = {
		["south"] = "mingjiao/wu3",
		["east"] = "mingjiao/zl2",
		["north"] = "mingjiao/wu1",
		["west"] = "mingjiao/zl1",
	},
	objs = {
          ["ΤһЦ"] = "wei yixiao",
           },
}
Room {
	id = "mingjiao/hdg/caojing",
	name = "�ݾ�",
	ways = {
		["south"] = "mingjiao/hdg/niupeng",
		["east"] = "mingjiao/hdg/xfang1",
		["north"] = "mingjiao/hdg/maowu",
		["west"] = "mingjiao/hdg/maopeng",
	},
}
Room {
	id = "mingjiao/hdg/caotang",
	name = "����",
	ways = {
		["south"] = "mingjiao/hdg/maowu",
		["enter"] = "mingjiao/hdg/xfang4",
		["east"] = "mingjiao/hdg/xfang3",
		["west"] = "mingjiao/hdg/chufang",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
}
Room {
	id = "mingjiao/hdg/chufang",
	name = "����",
	ways = {
		["south"] = "mingjiao/hdg/xfang2",
		["north"] = "mingjiao/hdg/huapu4",
		["east"] = "mingjiao/hdg/caotang",
	},
	precmds = {
		["south"] = "drop rice;drop miantang;drop qingcai",
		["north"] = "drop rice;drop miantang;drop qingcai",
		["east"] = "drop rice;drop miantang;drop qingcai",
	},
}
Room {
	id = "mingjiao/hdg/houshan",
	name = "��ɽ",
	ways = {
		["south"] = "mingjiao/hdg/huapu4",
	},
}
Room {
	id = "mingjiao/hdg/huacong1",
	name = "������",
	ways = {
		["north"] = "mingjiao/hdg/xiaojing",
		["out"] = "mingjiao/hdg/shanbi",
	},
}
Room {
	id = "mingjiao/hdg/huapu1",
	name = "����",
	ways = {
		["south"] = "mingjiao/hdg/huapu1",
		["north"] = "mingjiao/hdg/huapu1",
		["east"] = "mingjiao/hdg/huapu1",
		["west"] = "mingjiao/hdg/huapu1",
	},
}
Room {
	id = "mingjiao/hdg/huapu2",
	name = "����",
	ways = {
		["west"] = "mingjiao/hdg/xfang1",
	},
}
Room {
	id = "mingjiao/hdg/huapu3",
	name = "����",
	ways = {
		["east"] = "mingjiao/hdg/maopeng",
	},
}
Room {
	id = "mingjiao/hdg/huapu4",
	name = "����",
	ways = {
		["south"] = "mingjiao/hdg/chufang",
		["north"] = "mingjiao/hdg/houshan",
	},
}
Room {
	id = "mingjiao/hdg/kongdi",
	name = "�յ�",
	ways = {
		["southwest"] = "mingjiao/hdg/xiaojing2",
		["northwest"] = "mingjiao/hdg/shanlu2",
		["north"] = "mingjiao/hdg/niupeng",
		["northeast"] = "mingjiao/hdg/shanlu1",
	},
}
Room {
	id = "mingjiao/hdg/maopeng",
	name = "é��",
	ways = {
		["north"] = "mingjiao/hdg/xfang2",
		["east"] = "mingjiao/hdg/caojing",
		["west"] = "mingjiao/hdg/huapu3",
	},
}
Room {
	id = "mingjiao/hdg/maowu",
	name = "é��",
	ways = {
		["south"] = "mingjiao/hdg/caojing",
		["east"] = "mingjiao/hdg/yaofang",
		["north"] = "mingjiao/hdg/caotang",
		["west"] = "mingjiao/hdg/xfang2",
	},
}
Room {
	id = "mingjiao/hdg/niupeng",
	name = "ţ��",
	ways = {
		["south"] = "mingjiao/hdg/kongdi",
		["northdown"] = "mingjiao/hdg/caojing",
	},
}
Room {
	id = "mingjiao/hdg/shanbi",
	name = "ɽ��",
	ways = {
		["south"] = "city/wroad3",
		["right"] = "mingjiao/hdg/huacong1",
	},
	nolooks = {
		["right"] = true,
	},
	lengths = {
		["right"] = "if score.party and score.party=='����' then return 10 else return false end",
	},
	precmds = {
		["right"] = "bo huacong",
	},
}
Room {
	id = "mingjiao/hdg/shanlu1",
	name = "ɽ·",
	ways = {
		["northup"] = "mingjiao/hdg/shanlu3",
		["southwest"] = "mingjiao/hdg/kongdi",
	},
}
Room {
	id = "mingjiao/hdg/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "mingjiao/hdg/shanlu4",
		["southeast"] = "mingjiao/hdg/kongdi",
	},
}
Room {
	id = "mingjiao/hdg/shanlu3",
	name = "ɽ·",
	ways = {
		["eastdown"] = "mingjiao/hdg/huapu1",
		["southdown"] = "mingjiao/hdg/shanlu1",
	},
}
Room {
	id = "mingjiao/hdg/shanlu4",
	name = "ɽ·",
	ways = {
		["westdown"] = "mingjiao/hdg/huapu1",
		["southdown"] = "mingjiao/hdg/shanlu2",
	},
}
Room {
	id = "mingjiao/hdg/shufang",
	name = "�鷿",
	ways = {
		["west"] = "mingjiao/hdg/xfang3",
	},
}
Room {
	id = "mingjiao/hdg/xfang1",
	name = "�᷿",
	ways = {
		["north"] = "mingjiao/hdg/yaofang",
		["east"] = "mingjiao/hdg/huapu2",
		["west"] = "mingjiao/hdg/caojing",
	},
}
Room {
	id = "mingjiao/hdg/xfang2",
	name = "�᷿",
	ways = {
		["south"] = "mingjiao/hdg/maopeng",
		["east"] = "mingjiao/hdg/maowu",
		["north"] = "mingjiao/hdg/chufang",
	},
}
Room {
	id = "mingjiao/hdg/xfang3",
	name = "�᷿",
	ways = {
		["south"] = "mingjiao/hdg/yaofang",
		["east"] = "mingjiao/hdg/shufang",
		["west"] = "mingjiao/hdg/caotang",
	},
}
Room {
	id = "mingjiao/hdg/xfang4",
	name = "�᷿",
	ways = {
		["out"] = "mingjiao/hdg/caotang",
	},
	nolooks = {
		["out"] = true,
	},
	precmds = {
		["out"] = "open door",
	},
}
Room {
	id = "mingjiao/hdg/xiaojing",
	name = "С��",
	ways = {
		["south"] = "mingjiao/hdg/huacong1",
		["north"] = "mingjiao/hdg/xiaojing1",
	},
}
Room {
	id = "mingjiao/hdg/xiaojing1",
	name = "С��",
	ways = {
		["south"] = "mingjiao/hdg/xiaojing",
		["north"] = "mingjiao/hdg/xiaojing2",
	},
}
Room {
	id = "mingjiao/hdg/xiaojing2",
	name = "С��",
	ways = {
		["south"] = "mingjiao/hdg/xiaojing1",
		["northeast"] = "mingjiao/hdg/kongdi",
	},
}
Room {
	id = "mingjiao/hdg/yaofang",
	name = "ҩ��",
	ways = {
		["south"] = "mingjiao/hdg/xfang1",
		["north"] = "mingjiao/hdg/xfang3",
		["west"] = "mingjiao/hdg/maowu",
	},
}
Room {
	id = "mingjiao/htping",
	name = "����ƺ",
	ways = {
		["southeast"] = "mingjiao/shaqiu4",
		["west"] = "mingjiao/dashaqiu",
	},
	nolooks = {
		["south"] = true,
		["east"] = true,
	},
	objs = {
          ["���޸�"] = "yin wufu",
           },
	
}
Room {
	id = "mingjiao/huoqi",
	name = "�һ���",
	ways = {
		["south"] = "mingjiao/bingqi",
		["north"] = "mingjiao/wu2",
		["east"] = "mingjiao/cl1",
		["west"] = "mingjiao/didao/senlin",
	},
	postcmds = {
		["south"] = "#walkBusy",
	},
	lengths={
	     ["west"] = 3,
	},
	objs = {
          ["��Ȼ"] = "xin ran",
           },
}
Room {
	id = "mingjiao/jinqi",
	name = "�����",
	ways = {
		["southeast"] = "mingjiao/rukou",
		["south"] = "mingjiao/zl7",
		["west"] = "mingjiao/shiwang",
		["east"] = "mingjiao/didao/senlin",
	},
	lengths={
	     ["east"] = 3,
	},
	objs = {
          ["ׯ�"] = "zhuang zheng",
           },
}
Room {
	id = "mingjiao/jyt",
	name = "������",
	ways = {
		["northup"] = "mingjiao/sht",
		["south"] = "mingjiao/xting",
		["east"] = "mingjiao/shiwang",
		["west"] = "mingjiao/longwang",
	},
	objs = {
          ["��ң"] = "fan yao",
           },
}
Room {
	id = "mingjiao/ljroad1",
	name = "�ּ�С·",
	ways = {
		["westdown"] = "mingjiao/shanyao",
		["northwest"] = "mingjiao/ljroad2",
		["northeast"] = "mingjiao/ljroad2a",
	},
	room_relative="�ּ�С·�ּ�С·�I�J��ɽ�����ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad2",
	name = "�ּ�С·",
	ways = {
		["southeast"] = "mingjiao/ljroad1",
		["northwest"] = "mingjiao/ljroad3",
	},
	room_relative="�ּ�С·�I�ּ�С·�K�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad2a",
	name = "�ּ�С·",
	ways = {
		["southwest"] = "mingjiao/ljroad1",
		["northeast"] = "mingjiao/ljroad3",
	},
	room_relative="�ּ�С·�J�ּ�С·�L�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad3",
	name = "�ּ�С·",
	ways = {
		["northup"] = "mingjiao/qianting",
		["southeast"] = "mingjiao/ljroad2",
		["southwest"] = "mingjiao/ljroad2a",
	},
	room_relative="��̳ǰ�����ּ�С·�L�K�ּ�С·�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/longwang",
	name = "������",
	ways = {
		["east"] = "mingjiao/jyt",
		["west"] = "mingjiao/tuqi",
		--["northwest"] = "mingjiao/yuanzi",
	},
	objs = {
          ["����"] = "yang xiao",
           },
}
Room {
	id = "mingjiao/lsd/anbian",
	name = "����",
	ways = {
		["eastup"] = "mingjiao/lsd/shanguang",
	},
}
Room {
	id = "mingjiao/lsd/lsgu",
	name = "���߹�",
	ways = {
		["southup"] = "mingjiao/lsd/shanguang",
		["north"] = "mingjiao/lsd/sfjiao",
	},
}
Room {
	id = "mingjiao/lsd/sfjiao",
	name = "ɽ�����",
	ways = {
		["northup"] = "mingjiao/lsd/shanfeng",
		["south"] = "mingjiao/lsd/lsgu",
	},
}
Room {
	id = "mingjiao/lsd/shanfeng",
	name = "ɽ��",
	ways = {
		["southdown"] = "mingjiao/lsd/sfjiao",
	},
}
Room {
	id = "mingjiao/lsd/shanguang",
	name = "ɽ��",
	ways = {
		["westdown"] = "mingjiao/lsd/anbian",
		["northdown"] = "mingjiao/lsd/lsgu",
	},
}
Room {
	id = "mingjiao/muqi",
	name = "��ľ��",
	ways = {
		["northup"] = "mingjiao/gmd",
		["south"] = "mingjiao/tingtang",
		["east"] = "mingjiao/didao/shuling2",
		["west"] = "mingjiao/didao/shuling1",
	},
	objs = {
          ["�Ų���"] = "wen cangsong",
           },
	blocks = {
		["northup"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["south"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["east"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["west"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
	},
}
Room {
	id = "mingjiao/qianting",
	name = "��̳ǰ��",
	ways = {
		["north"] = "mingjiao/tingtang",
		["southdown"] = "mingjiao/ljroad3",
	},
	objs = {
          ["��Ұ��"] = "yin yewang",
           },
}
Room {
	id = "mingjiao/rukou",
	name = "�������",
	ways = {
		["southwest"] = "mingjiao/zl7",
		["northwest"] = "mingjiao/jinqi",
	},
	objs = {
          ["��ǫ"] = "leng qian",
           },
}
Room {
	id = "mingjiao/shanjiao",
	name = "ɽ����",
	ways = {
		["eastup"] = "mingjiao/sshanlu1",
		["westup"] = "kunlun/zhenyuanqiao",
		["south"] = "mingjiao/shejing",
	},
}
Room {
	id = "mingjiao/shanlu1",
	name = "ɽ��С·",
	ways = {
		["eastdown"] = "mingjiao/shanlu2",
		["westup"] = "mingjiao/shuiqi",
	},
}
Room {
	id = "mingjiao/shanlu2",
	name = "ɽ��С·",
	ways = {
		["westup"] = "mingjiao/shanlu1",
		["east"] = "mingjiao/bishui",
	},
	blocks = {
		["east"] = {
			{id = "jiao zhong", exp = 1000000},
		},

	},
}
Room {
	id = "mingjiao/shanting",
	name = "ɽͤ",
	ways = {
		["westup"] = "mingjiao/sshanlu6",
		["northdown"] = "mingjiao/sshanlu5",
	},
}
Room {
	id = "mingjiao/shanyao",
	name = "��ɽ��",
	ways = {
		["eastup"] = "mingjiao/ljroad1",
		["northdown"] = "mingjiao/sshanlu6",
	},
}
Room {
	id = "mingjiao/shaqiu1",
	name = "Сɳ��",
	ways = {
		["east"] = "group/entry/mjshamo1",
		["west"] = "mingjiao/shaqiu2",
	},
	room_relative="Сɳ���Сɳ��----Сɳ��----��ɳĮ��Сɳ��Сɳ��",
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shaqiu2",
	name = "Сɳ��",
	ways = {
		["east"] = "mingjiao/shaqiu1",
		["west"] = "mingjiao/shaqiu3",
	},
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shaqiu3",
	name = "Сɳ��",
	ways = {
		["east"] = "mingjiao/shaqiu2",
		["west"] = "mingjiao/shaqiu4",
	},
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shaqiu4",
	name = "Сɳ��",
	ways = {
		["northwest"] = "mingjiao/htping",
		["east"] = "mingjiao/shaqiu3",
	},
	room_relative="����ƺСɳ��I��Сɳ��----Сɳ���Сɳ��Сɳ��",
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shejing",
	name = "ɳĮ����",
	ways = {
		["north"] = "mingjiao/shanjiao",
		["east"] = "mingjiao/dashaqiu",
		["west"] = "mingjiao/bank",
	},
}
Room {
	id = "mingjiao/shiwang",
	name = "ʨ����",
	ways = {
		["east"] = "mingjiao/jinqi",
		["west"] = "mingjiao/jyt",
	},
}
Room {
	id = "mingjiao/sht",
	name = "ʥ����",
	ways = {
		["northup"] = "mingjiao/baota",
		["southdown"] = "mingjiao/jyt",
	},
	objs = {
          ["���޼�"] = "zhang wuji",
           },
}
Room {
	id = "mingjiao/shuiqi",
	name = "��ˮ��",
	ways = {
		["eastdown"] = "mingjiao/shanlu1",
		["north"] = "mingjiao/wu4",
		["west"] = "mingjiao/cl2",
		["east"] = "mingjiao/didao/senlin",
	},
	lengths={
	     ["east"] = 3,
	},
	objs = {
          ["����"] = "tang yang",
           },
}
Room {
	id = "mingjiao/shuyuan",
	name = "��Ժ",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/wu1",
	},
	objs = {
          ["���¾����Ͼ�"] = "jing",
          ["������"] = "shu",
          ["������;�"] = "shu",
          ["���ݸ�Ŀ"] = "bencao gangmu",
          ["ҩ��"] = "yaoli jing",
           },
}
Room {
	id = "mingjiao/sleeproom",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["west"] = "mingjiao/xting",
	},
}
Room {
	id = "mingjiao/sshanlu1",
	name = "ɽ·",
	ways = {
		["southup"] = "mingjiao/sshanlu2",
		["westdown"] = "mingjiao/shanjiao",
	},
}
Room {
	id = "mingjiao/sshanlu2",
	name = "ɽ·",
	ways = {
		["westup"] = "mingjiao/sshanlu3",
		["northdown"] = "mingjiao/sshanlu1",
	},
}
Room {
	id = "mingjiao/sshanlu3",
	name = "ɽ·",
	ways = {
		["northup"] = "mingjiao/sshanlu4",
		["eastdown"] = "mingjiao/sshanlu2",
	},
}
Room {
	id = "mingjiao/sshanlu4",
	name = "ɽ·",
	ways = {
		["north"] = "mingjiao/xuanya1",
		["southdown"] = "mingjiao/sshanlu3",
	},
}
Room {
	id = "mingjiao/sshanlu5",
	name = "ɽ·",
	ways = {
		["southup"] = "mingjiao/shanting",
		["westdown"] = "mingjiao/xuanya3",
	},
}
Room {
	id = "mingjiao/sshanlu6",
	name = "ɽ·",
	ways = {
		["southup"] = "mingjiao/shanyao",
		["eastdown"] = "mingjiao/shanting",
	},
}
Room {
	id = "mingjiao/tandi",
	name = "̶��",
	ways = {
		["up"] = "mingjiao/bishui",
	},
}
Room {
	id = "mingjiao/tearoom",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/tingtang",
	},
	objs = {
          ["��÷��"] = "suanmei tang",
          ["�̲�С��"] = "xiao tong",
           },
}
Room {
	id = "mingjiao/tingtang",
	name = "����",
	ways = {
		["south"] = "mingjiao/qianting",
		["east"] = "mingjiao/xiangfang",
		["north"] = "mingjiao/muqi",
		["west"] = "mingjiao/tearoom",
	},
}
Room {
	id = "mingjiao/tuqi",
	name = "������",
	ways = {
		["south"] = "mingjiao/zl6",
		["east"] = "mingjiao/longwang",
		["west"] = "mingjiao/didao/senlin",
	},
	lengths = {
		["east"] = "if hp.exp < 1600000 then return false else return 1 end",
		["west"] = 3;
	},
	objs = {
          ["��ԫ"] = "yan tan",
           },
}
Room {
	id = "mingjiao/wu1",
	name = "���䳡",
	ways = {
		["south"] = "mingjiao/guangc",
		["east"] = "mingjiao/yaofang",
		["north"] = "mingjiao/xting",
		["west"] = "mingjiao/shuyuan",
	},
	objs = {
          ["����"] = "zhang zhong",
           },
}
Room {
	id = "mingjiao/wu2",
	name = "���䳡",
	ways = {
		["south"] = "mingjiao/huoqi",
		["east"] = "mingjiao/zl1",
		["north"] = "mingjiao/zl6",
	},
}
Room {
	id = "mingjiao/wu3",
	name = "���䳡",
	ways = {
		["north"] = "mingjiao/guangc",
		["east"] = "mingjiao/cl2",
		["southdown"] = "mingjiao/gmd",
		["west"] = "mingjiao/cl1",
	},
}
Room {
	id = "mingjiao/wu4",
	name = "���䳡",
	ways = {
		["south"] = "mingjiao/shuiqi",
		["north"] = "mingjiao/zl7",
		["west"] = "mingjiao/zl2",
	},
}
Room {
	id = "mingjiao/wxiang",
	name = "���᷿",
	ways = {
		["east"] = "mingjiao/yuanzi",
	},
}
Room {
	id = "mingjiao/xiangfang",
	name = "�᷿",
	no_fight = true,
	ways = {
		["#walkBusy;west"] = "mingjiao/tingtang",
	},
}
Room {
	id = "mingjiao/xting",
	name = "С��",
	ways = {
		["south"] = "mingjiao/wu1",
		["east"] = "mingjiao/sleeproom",
		["north"] = "mingjiao/jyt",
		["west"] = "mingjiao/eatroom",
	},
	objs = {
          ["�ܵ�"] = "zhou dian",
           },
}
Room {
	id = "mingjiao/xuanya1",
	name = "ջ��",
	ways = {
		["south"] = "mingjiao/sshanlu4",
		["northwest"] = "mingjiao/xuanya2a",
		["northeast"] = "mingjiao/xuanya2",
	},
	room_relative="ջ��ջ���I�Jջ����ɽ·ջ��",
}
Room {
	id = "mingjiao/xuanya2",
	name = "ջ��",
	ways = {
		["southwest"] = "mingjiao/xuanya1",
		["northeast"] = "mingjiao/xuanya3",
	},
	room_relative="ջ���Jջ���Lջ��ջ��",
}
Room {
	id = "mingjiao/xuanya2a",
	name = "ջ��",
	ways = {
		["southeast"] = "mingjiao/xuanya1",
		["northwest"] = "mingjiao/xuanya3",
	},
	room_relative="ջ���Iջ���Kջ��ջ��",
}
Room {
	id = "mingjiao/xuanya3",
	name = "ջ��",
	ways = {
		["eastup"] = "mingjiao/sshanlu5",
		["southeast"] = "mingjiao/xuanya2a",
		["southwest"] = "mingjiao/xuanya2",
	},
	room_relative="ջ����ɽ·�L�Kջ��ջ��ջ��",
}
Room {
	id = "mingjiao/yaofang",
	name = "ҩ��",
	ways = {
		["west"] = "mingjiao/wu1",
	},
	objs = {
          ["ҩʦ"] = "yao shi",
           },
}
Room {
	id = "mingjiao/yuanzi",
	name = "СԺ��",
	ways = {
		["southeast"] = "mingjiao/longwang",
		["west"] = "mingjiao/wxiang",
	},
}
Room {
	id = "mingjiao/zl1",
	name = "����",
	ways = {
		["east"] = "mingjiao/guangc",
		["west"] = "mingjiao/wu2",
	},
}
Room {
	id = "mingjiao/zl2",
	name = "����",
	ways = {
		["east"] = "mingjiao/wu4",
		["west"] = "mingjiao/guangc",
	},
}
Room {
	id = "mingjiao/zl6",
	name = "����",
	ways = {
		["south"] = "mingjiao/wu2",
		["north"] = "mingjiao/tuqi",
	},
	objs = {
          ["˵����"] = "shuo bude",
           },
}
Room {
	id = "mingjiao/zl7",
	name = "����",
	ways = {
		["south"] = "mingjiao/wu4",
		["north"] = "mingjiao/jinqi",
		["northeast"] = "mingjiao/rukou",
	},
	objs = {
          ["��Ө��"] = "peng yingyu",
           },
}
Room {
	id = "mr/cangshuge",
	name = "�����",
	no_fight = true,
	ways = {
		["down"] = "mr/yunjinlou",
	},
}
Room {
	id = "mr/chufang",
	name = "����",
	ways = {
		["south"] = "mr/xiaoting",
	},
	objs = {
          ["��Ҷ������"] = "dongsun-tang",
          ["���Ϻ��"] = "lingbai xiaren",
          ["ӣ�һ���"] = "yingtao huotui",
           },
}
--Room {
--	id = "mr/cl",
--	name = "����",
--	ways = {
--		["north"] = "mr/qianyuan",
--		["east"] = "mr/cl1",
--	},
--}
Room {
	id = "mr/cufang",
	name = "����",
	ways = {
		["east"] = "mr/didao1",
	},
}
Room {
	id = "mr/didao",
	name = "�ص�",
	ways = {
		["xiaodao"] = "mr/houtang",
		["north"] = "mr/didao1",
		["yanziwu"] = "yanziwu/shuixie",
		["shanzhuang"] = "mtl/shiqiao1",
		["out"] = "mr/shiqiao",
	},
}
Room {
	id = "mr/didao1",
	name = "�ص�",
	ways = {
		["south"] = "mr/didao",
		["east"] = "mr/sleeproom",
		["west"] = "mr/cufang",
	},
}
Room {
	id = "mr/didao2",
	name = "�ص�",
	ways = {
		["north"] = "mr/migong1",
	},
}
Room {
	id = "mr/duchuan3",
	name = "�ɴ�",
	ways = {
		["out"] = "mr/xiaodao",
	},
}
Room {
	id = "mr/houtang",
	name = "����",
	ways = {
		["north"] = "mr/xiaoting",
		["zuan didao"] = "mr/didao",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
}
Room {
	id = "mr/hubian",
	name = "����",
	ways = {
		["east"] = "mr/hubian1",
		["west"] = "suzhou/qingshidadao",
	},
}
Room {
	id = "mr/hubian1",
	name = "����",
	ways = {
		["east"] = "mr/hubian2",
		["west"] = "mr/hubian",
	},
}
Room {
	id = "mr/hubian2",
	name = "����",
	ways = {
		["southeast"] = "mr/shiqiao",
		["west"] = "mr/hubian1",
	},
}
Room {
	id = "mr/kongfang",
	name = "�շ���",
	ways = {
		["west"] = "mr/migong2",
	},
}
Room {
	id = "mr/migong1",
	name = "�Թ�",
	ways = {
		["south"] = "mr/migong1",
		["north"] = "mr/migong4",
		["east"] = "mr/migong2",
		["west"] = "mr/migong3",
	},
}
Room {
	id = "mr/migong2",
	name = "�Թ�",
	ways = {
		["south"] = "mr/migong3",
		["east"] = "mr/migong4",
		["north"] = "mr/migong2",
		["west"] = "mr/migong3",
	},
}
Room {
	id = "mr/migong3",
	name = "�Թ�",
	ways = {
		["south"] = "mr/migong1",
		["north"] = "mr/migong3",
		["east"] = "mr/migong2",
		["west"] = "mr/migong4",
	},
}
Room {
	id = "mr/migong4",
	name = "�Թ�",
	ways = {
		["south"] = "mr/migong3",
		["east"] = "mr/migong4",
		["north"] = "mr/migong4",
		["west"] = "mr/migong1",
	},
}
Room {
	id = "mr/mishi",
	name = "����",
	ways = {
		["south"] = "mr/fenmu",
	},
}
Room {
	id = "mr/mishi1",
	name = "����",
	ways = {
		["up"] = "mr/mishi",
	},
}
Room {
	id = "mtl/anbian",
	name = "����",
	ways = {
		["south"] = "mtl/hc",
		["east"] = "mtl/hc1",
		["west"] = "mtl/hc2",
	},
}
Room {
	id = "mtl/anbian1",
	name = "����",
	ways = {
		["north"] = "mtl/xiaojing11",
		["qu xiaozhu;#CboatWait"] = "mr/xiaodao",
		["qu yanziwu;#CboatWait"] = "yanziwu/anbian2",
	},
	nolooks = {
		["qu xiaozhu;#CboatWait"] = true,
		["qu yanziwu;#CboatWait"] = true,
	},
	lengths = {
		["qu xiaozhu;#CboatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		["qu yanziwu;#CboatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		},
}
Room {
	id = "mtl/cangshuge",
	name = "�����",
	ways = {
		["down"] = "mtl/yunjinlou",
	},
}
Room {
	id = "mtl/cl",
	name = "����",
	ways = {
		["north"] = "mtl/qianyuan",
		["east"] = "mtl/cl1",
	},
	room_relative="ǰԺ������-----���ȳ���",
}
Room {
	id = "mtl/cl1",
	name = "����",
	ways = {
		["east"] = "mtl/cl2",
		["west"] = "mtl/cl",
	},
	room_relative="����-----����-----���ȳ���",
}
Room {
	id = "mtl/cl2",
	name = "����",
	ways = {
		["south"] = "mtl/cl3",
		["north"] = "mtl/xiaojing5",
		["west"] = "mtl/cl1",
	},
	room_relative="С��������-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl3",
	name = "����",
	ways = {
		["south"] = "mtl/xiangfang1",
		["east"] = "mtl/houyuan",
		["north"] = "mtl/cl2",
		["west"] = "mtl/cl3-1",
	},
	room_relative="���ȣ�����-----����-----��Ժ���᷿����",
}
Room {
	id = "mtl/cl3-1",
	name = "����",
	ways = {
		["south"] = "mtl/cl3-2",
		["east"] = "mtl/cl3",
	},
	room_relative="����-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl3-2",
	name = "����",
	ways = {
		["south"] = "mtl/cl3-3",
		["east"] = "mtl/xiangfang1",
		["north"] = "mtl/cl3-1",
	},
	room_relative="���ȣ�����-----�᷿�����ȳ���",
}
Room {
	id = "mtl/cl3-3",
	name = "����",
	ways = {
		["east"] = "mtl/hffang",
		["north"] = "mtl/cl3-2",
	},
	room_relative="���ȣ�����-----���ʷ�����",
}
Room {
	id = "mtl/cl4",
	name = "����",
	ways = {
		["south"] = "mtl/cl4-2",
		["north"] = "mtl/xiaojing7",
		["east"] = "mtl/cl4-1",
	},
	room_relative="С��������-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl4-1",
	name = "����",
	ways = {
		["eastup"] = "mtl/tingzi",
		["west"] = "mtl/cl4",
	},
	room_relative="����-----���ȡ�ͤ�ӳ���",
}
Room {
	id = "mtl/cl4-2",
	name = "����",
	ways = {
		["south"] = "mtl/keting",
		["north"] = "mtl/cl4",
		["east"] = "mtl/cl4-3",
		["west"] = "mtl/houyuan",
	},
	room_relative="���ȣ���Ժ-----����-----���ȣ���������",
}
Room {
	id = "mtl/cl4-3",
	name = "����",
	ways = {
		["south"] = "mtl/cl4-4",
		["east"] = "mtl/fanting",
		["west"] = "mtl/cl4-2",
	},
	room_relative="����-----����-----���������ȳ���",
	blocks = {
		["east"] = {
			{id = "jia ding", exp = 30000, party = "����Ľ��"}
		},
	},
}
Room {
	id = "mtl/cl4-4",
	name = "����",
	ways = {
		["south"] = "mtl/cl4-5",
		["east"] = "mtl/guifang",
		["north"] = "mtl/cl4-3",
		["west"] = "mtl/keting",
	},
	room_relative="���ȣ�����-----����-----�뷿�����ȳ���",
	blocks = {
		["east"] = {
			{id = "ya huan", exp = 5000},
		},
	},
}
Room {
	id = "mtl/cl4-5",
	name = "����",
	ways = {
		["north"] = "mtl/cl4-4",
		["west"] = "mtl/zahuoshi",
	},
	room_relative="���ȣ��ӻ���-----���ȳ���",
}
Room {
	id = "mtl/fanting",
	name = "����",
	ways = {
		["west"] = "mtl/cl4-3",
	},
	objs = {
          ["������Ҷ��"] = "longjing caiyeji",
          ["�����Բ"] = "feicui yuyuan",
          ["÷����Ѽ"] = "meihua zaoya",
           },
}
Room {
	id = "mtl/guifang",
	name = "�뷿",
	ways = {
		["west"] = "mtl/cl4-4",
		["jump window"] = "mtl/ytyuan1"
	},
	nolooks = {
		["jump window"] = true,
	},
}
Room {
	id = "mtl/hc",
	name = "������",
	ways = {
		["east"] = "mtl/zhuangmen",
		["north"] = "mtl/anbian",
		["west"] = "mtl/hc3",
	},
}
Room {
	id = "mtl/hc1",
	name = "������",
	ways = {
		["south"] = "mtl/zhuangmen",
		["east"] = "mtl/hc4",
		["west"] = "mtl/anbian",
	},
}
Room {
	id = "mtl/hc2",
	name = "������",
	ways = {
		["south"] = "mtl/hc3",
		["east"] = "mtl/anbian",
	},
}
Room {
	id = "mtl/hc3",
	name = "������",
	ways = {
		["north"] = "mtl/hc2",
		["east"] = "mtl/hc",
	},
}
Room {
	id = "mtl/hc4",
	name = "������",
	ways = {
		["south"] = "mtl/qianyuan",
		["west"] = "mtl/hc1",
	},
}
Room {
	id = "mtl/hffang",
	name = "���ʷ�",
	ways = {
		["east"] = "mtl/hhyuan",
		["west"] = "mtl/cl3-3",
	},
	objs = {
          ["�ƹ���"] = "tang guangxiong",
          ["������"] = "yan mama",
           },
}
Room {
	id = "mtl/hhyuan",
	name = "��԰",
	ways = {
		["east"] = "mtl/zahuoshi",
		["north"] = "mtl/yunjinlou",
		["west"] = "mtl/hffang",
	},
}
Room {
	id = "mtl/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "mtl/yunjinlou",
		["north"] = "mtl/xiaojing8",
		["east"] = "mtl/cl4-2",
		["west"] = "mtl/cl3",
	},
}
Room {
	id = "mtl/huandong",
	name = "������",
	ways = {
		["north"] = "mtl/ytyuan",
		["combat"] = "mtl/ytyuansz",
		["gift"] = "mtl/ytyuantf",
		["misc"] = "mtl/ytyuanzx",
		["weapon"] = "mtl/ytyuansb",
	},
	objs = {
          ["������"] = "wang yuyan",
           },
}
Room {
	id = "mtl/ytyuansz",
	name = "������-ʵս��",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuantf",
	name = "������-�츳��",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuanzx",
	name = "������-���",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuansb",
	name = "������-�����",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/keting",
	name = "����",
	ways = {
		["east"] = "mtl/cl4-4",
		["north"] = "mtl/cl4-2",
		["west"] = "mtl/yunjinlou",
	},
	objs = {
          ["���"] = "xiang cha",
          ["��Բ"] = "gui yuan",
          ["����"] = "pu tao",
           },
}
Room {
	id = "mtl/liulin",
	name = "������",
	ways = {
		["south"] = "mtl/xiaojing5",
		["east"] = "mtl/liulin1",
	},
	objs = {
          ["����"] = "liu tiao",
           },
}
Room {
	id = "mtl/liulin1",
	name = "������",
	ways = {
		["south"] = "mtl/xiaojing6",
		["north"] = "mtl/liulin3",
		["east"] = "mtl/liulin2",
		["west"] = "mtl/liulin",
	},
}
Room {
	id = "mtl/liulin2",
	name = "������",
	ways = {
		["south"] = "mtl/xiaojing7",
		["west"] = "mtl/liulin1",
	},
}
Room {
	id = "mtl/liulin3",
	name = "������",
	ways = {
		["south"] = "mtl/liulin1",
		["yue tree"] = "mtl/shushang",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
           },
}
Room {
	id = "mtl/shushang",
	name = "����",
	ways = {
		["jump down"] = "mtl/liulin3",
	},
}
Room {
	id = "mtl/midao",
	name = "�ص�",
	ways = {
		["south"] = "mtl/ytyuan",
		["north"] = "mtl/hhyuan",
	},
}
Room {
	id = "mtl/qianyuan",
	name = "ǰԺ",
	ways = {
		["south"] = "mtl/cl",
		["east"] = "mtl/shiqiao1",
		["north"] = "mtl/hc4",
		["west"] = "mtl/zhuangmen",
	},
}
Room {
	id = "mtl/shiqiao1",
	name = "Сʯ��",
	ways = {
		["east"] = "mtl/xiaojing5",
		["west"] = "mtl/qianyuan",
		["zuan didao"] = "mr/didao",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
}
Room {
	id = "mtl/shuichi",
	name = "ˮ��",
	ways = {
		["west"] = "mtl/xiaojing7",
	},
}
Room {
	id = "mtl/tingzi",
	name = "ͤ��",
	ways = {
		["westdown"] = "mtl/cl4-1",
	},
}
Room {
	id = "mtl/xiangfang1",
	name = "�᷿",
	ways = {
		["east"] = "mtl/yunjinlou",
		["north"] = "mtl/cl3",
		["west"] = "mtl/cl3-2",
	},
}
Room {
	id = "mtl/xiaojing10",
	name = "С��",
	ways = {
		["south"] = "mtl/xiaojing11",
		["north"] = "mtl/zhuangmen",
	},
}
Room {
	id = "mtl/xiaojing11",
	name = "С��",
	ways = {
		["south"] = "mtl/anbian1",
		["north"] = "mtl/xiaojing10",
	},
}
Room {
	id = "mtl/xiaojing5",
	name = "С��",
	ways = {
		["south"] = "mtl/cl2",
		["east"] = "mtl/xiaojing6",
		["north"] = "mtl/liulin",
		["west"] = "mtl/shiqiao1",
	},
}
Room {
	id = "mtl/xiaojing6",
	name = "С��",
	ways = {
		["south"] = "mtl/xiaojing8",
		["east"] = "mtl/xiaojing7",
		["north"] = "mtl/liulin1",
		["west"] = "mtl/xiaojing5",
	},
}
Room {
	id = "mtl/xiaojing7",
	name = "С��",
	ways = {
		["south"] = "mtl/cl4",
		["east"] = "mtl/shuichi",
		["north"] = "mtl/liulin2",
		["west"] = "mtl/xiaojing6",
	},
}
Room {
	id = "mtl/xiaojing8",
	name = "С��",
	ways = {
		["south"] = "mtl/houyuan",
		["north"] = "mtl/xiaojing6",
	},
}
Room {
	id = "mtl/ytyuan",
	name = "ӣ��԰",
	no_fight = true,
	ways = {
		["south"] = "mtl/huandong",
		["north"] = "mtl/midao",
		["west"] = "mtl/ytyuan2",
	},
}
Room {
	id = "mtl/ytyuan1",
	name = "ӣ��԰",
	ways = {
		["south"] = "mtl/huandong",
		["east"] = "mtl/ytyuan2",
		["north"] = "mtl/ytyuan1",
		["west"] = "mtl/ytyuan1",
	},
}
Room {
	id = "mtl/ytyuan2",
	name = "ӣ��԰",
	ways = {
		["south"] = "mtl/huandong",
		["north"] = "mtl/ytyuan2",
		["east"] = "mtl/ytyuan",
		["west"] = "mtl/ytyuan2",
	},
}
Room {
	id = "mtl/yunjinlou",
	name = "�ƽ�¥",
	ways = {
		["south"] = "mtl/hhyuan",
		["east"] = "mtl/keting",
		["north"] = "mtl/houyuan",
		["west"] = "mtl/xiangfang1",
	},
	objs = {
          ["������"] = "Wang furen",
           },
}
Room {
	id = "mtl/zahuoshi",
	name = "�ӻ���",
	ways = {
		["east"] = "mtl/cl4-5",
		["west"] = "mtl/hhyuan",
	},
	objs = {
          ["������"] = "bingqi jia",
           },
}
Room {
	id = "mtl/zhuangmen",
	name = "ׯ��",
	ways = {
		["south"] = "mtl/xiaojing10",
		["east"] = "mtl/qianyuan",
		["north"] = "mtl/hc1",
		["west"] = "mtl/hc",
	},
}
Room {
	id = "mr/shiqiao",
	name = "Сʯ��",
	ways = {
		["push ����;d"] = "mr/didao",
		["south"] = "mr/testmatou1",
		["northwest"] = "mr/hubian2",
	},
	nolooks = {
		["push ����;d"] = true,
	},
	lengths = {
		["push ����;d"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
}
Room {
	id = "mr/sleeproom",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["west"] = "mr/didao1",
	},
}
Room {
	id = "mr/testmatou1",
	name = "��ͷ",
	ways = {
		["north"] = "mr/shiqiao",
		["qu mr;#boatWait"] = "mr/xiaodao",
		["qu yanziwu;#boatWait"] = "yanziwu/anbian2",
	},
	nolooks = {
		["qu mr;#boatWait"] = true,
		["qu yanziwu;#boatWait"] = true,
	},
	lengths = {
		["qu mr;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		["qu yanziwu;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
}
Room {
	id = "mr/tingyuju",
	name = "�����",
	ways = {
		["southeast"] = "mr/xiaojing2",
		["tan qin;#boatWait"] = "mtl/anbian",
	},
	nolooks = {
		["tan qin;#boatWait"] = true,
	},
	lengths = {
		["tan qin;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
}
Room {
	id = "mr/tingzi",
	name = "ͤ��",
	ways = {
		["westdown"] = "mr/cl4-1",
	},
}
Room {
	id = "mr/xiangfang",
	name = "�᷿",
	no_fight = true,
	ways = {
		["west"] = "mr/xiaoting",
	},
}
Room {
	id = "mr/xiaodao",
	name = "С����",
	ways = {
		["south"] = "mr/xiaoshe",
		["#boatYell"] = "mr/testmatou1",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
}
Room {
	id = "mr/xiaojing1",
	name = "С��",
	ways = {
		["east"] = "mr/xiaoshe",
		["west"] = "mr/xiaojing2",
	},
}
Room {
	id = "mr/xiaojing2",
	name = "С��",
	ways = {
		["northwest"] = "mr/tingyuju",
		["east"] = "mr/xiaojing1",
	},
}
Room {
	id = "mr/xiaojing3",
	name = "С��",
	ways = {
		["northeast"] = "mr/xiaojing4",
		["west"] = "mr/xiaoshe",
	},
}
Room {
	id = "mr/xiaojing4",
	name = "С��",
	ways = {
		["southwest"] = "mr/xiaojing3",
		["east"] = "mr/xiaoting",
	},
}
Room {
	id = "mr/xiaoshe",
	name = "С��",
	ways = {
		["east"] = "mr/xiaojing3",
		["north"] = "mr/xiaodao",
		["#weaponUnWalk;west;#weaponWWalk"] = "mr/xiaojing1",
	},
	objs = {
          ["����ͬ"] = "bao butong",
           },
}
Room {
	id = "mr/xiaoting",
	name = "С��",
	ways = {
		["south"] = "mr/houtang",
		["east"] = "mr/xiangfang",
		["north"] = "mr/chufang",
		["west"] = "mr/xiaojing4",
	},
	blocks = {
		["north"] = {
			{id = "a bi", exp = 50000, party = "����Ľ��"},
		},
	},
	objs = {
          ["���"] = "xiang cha",
          ["����"] = "a bi",
           },
}
Room {
	id = "mr/xiaozhou3",
	name = "�ɴ�",
	ways = {
		["out"] = "mtl/anbian",
	},
}
Room {
	id = "yanziwu/anbian2",
	name = "����",
	ways = {
		["south"] = "yanziwu/shuixie",
	},
}
Room {
	id = "yanziwu/anbian3",
	name = "����",
	ways = {
		["north"] = "yanziwu/houyuan1",
		["#boatYell"] = "mr/hubian2",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
 		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
}
Room {
	id = "yanziwu/anbian4",
	name = "����",
	ways = {
		["east"] = "yanziwu/shuixie",
		["#boatYell"] = "mtl/anbian1",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
}
Room {
        id = "yanziwu/bishuiting",
        name = "��ˮͤ",
        ways = {
                ["east"] = "yanziwu/muqiao",
                ["jump liang"] = "yanziwu/lianshang",
        },
}
Room {
        id = "yanziwu/lianshang",
        name = "����",
        ways = {
                ["jump down"] = "yanziwu/bishuiting",
        },
}
Room {
	id = "yanziwu/cl5-0",
	name = "����",
	ways = {
		["south"] = "yanziwu/cl5-1",
		["east"] = "yanziwu/fanting1",
		["west"] = "yanziwu/shufang",
	},
	room_relative="�鷿-----����-----���������ȳ���",
	blocks = {
		["east"] = {
			{id = "guan jia", exp = 50000},
		},
	},
}
Room {
	id = "yanziwu/cl5-1",
	name = "����",
	ways = {
		["south"] = "yanziwu/cl5-2",
		["east"] = "yanziwu/cl5-3",
		["north"] = "yanziwu/cl5-0",
		["west"] = "yanziwu/xiangfang2",
	},
	room_relative="���ȣ��᷿-----����-----���ȣ����ȳ���",
}
Room {
	id = "yanziwu/cl5-2",
	name = "����",
	ways = {
		["north"] = "yanziwu/cl5-1",
		["west"] = "yanziwu/shangyue",
	},
	room_relative="���ȣ�����ի-----���ȳ���",
}
Room {
	id = "yanziwu/cl5-3",
	name = "����",
	ways = {
		["south"] = "yanziwu/xiaomen",
		["west"] = "yanziwu/cl5-1",
	},
	room_relative="����-----���ȣ�С�ų���",
}
Room {
	id = "yanziwu/cl5-4",
	name = "����",
	ways = {
		["north"] = "yanziwu/xiaomen",
		["east"] = "yanziwu/xiaojing3",
		["west"] = "yanziwu/cl5-5",
	},
	room_relative="С�ţ�����-----����-----С������",
}
Room {
	id = "yanziwu/cl5-5",
	name = "����",
	ways = {
		["north"] = "yanziwu/shangyue",
		["east"] = "yanziwu/cl5-4",
		["west"] = "yanziwu/cl5-6",
	},
	room_relative="����ի������-----����-----���ȳ���",
}
Room {
	id = "yanziwu/cl5-6",
	name = "����",
	ways = {
		["east"] = "yanziwu/cl5-5",
		["west"] = "yanziwu/cl6-5",
	},
	room_relative="����-----����-----���ȳ���",
}
Room {
	id = "yanziwu/cl6-0",
	name = "����",
	ways = {
		["south"] = "yanziwu/cl6-1",
		["east"] = "yanziwu/jushi",
	},
	room_relative="����-----���ң����ȳ���",
}
Room {
	id = "yanziwu/cl6-1",
	name = "����",
	ways = {
		["south"] = "yanziwu/cl6-2",
		["east"] = "yanziwu/xiangfang3",
		["north"] = "yanziwu/cl6-0",
		["west"] = "yanziwu/cl6-3",
	},
	room_relative="���ȣ�����-----����-----�᷿�����ȳ���",
}
Room {
	id = "yanziwu/cl6-2",
	name = "����",
	ways = {
		["east"] = "yanziwu/jingyinge",
		["north"] = "yanziwu/cl6-1",
	},
	room_relative="���ȣ�����-----��������",
}
Room {
	id = "yanziwu/cl6-3",
	name = "����",
	ways = {
		["south"] = "yanziwu/xiaomen1",
		["east"] = "yanziwu/cl6-1",
	},
	room_relative="����-----���ȣ�С�ų���",
}
Room {
	id = "yanziwu/cl6-4",
	name = "����",
	ways = {
		["north"] = "yanziwu/xiaomen1",
		["east"] = "yanziwu/cl6-5",
	},
	room_relative="С�ţ�����-----���ȳ���",
}
Room {
	id = "yanziwu/cl6-5",
	name = "����",
	ways = {
		["north"] = "yanziwu/jingyinge",
		["east"] = "yanziwu/cl5-6",
		["west"] = "yanziwu/cl6-4",
	},
	room_relative="�����������-----����-----���ȳ���",
}
Room {
	id = "yanziwu/dating",
	name = "����",
	ways = {
		["south"] = "yanziwu/houting",
		["north"] = "yanziwu/xiaojing2",
		["east"] = "yanziwu/shufang",
		["west"] = "yanziwu/jushi",
	},
	objs = {
          ["���"] = "xiang cha",
          ["��ұǬ"] = "gongye gan",
           },
}
Room {
	id = "yanziwu/fanting1",
	name = "����",
	ways = {
		["west"] = "yanziwu/cl5-0",
	},
}
Room {
	id = "yanziwu/fenmu",
	name = "Ĺ��",
	ways = {
		["west"] = "yanziwu/xiaojing4",
	},
}
Room {
	id = "yanziwu/guanxing",
	name = "����̨",
	ways = {
		["south"] = "yanziwu/xiaojing4",
	},
}
Room {
	id = "yanziwu/houting",
	name = "����",
	ways = {
		["south"] = "yanziwu/neitang",
		["east"] = "yanziwu/xiangfang2",
		["north"] = "yanziwu/dating",
		["west"] = "yanziwu/xiangfang3",
	},
}
Room {
	id = "yanziwu/houyuan1",
	name = "��Ժ",
	ways = {
		["south"] = "yanziwu/anbian3",
		["east"] = "yanziwu/yanziwu",
		["north"] = "yanziwu/shuixie",
		["west"] = "yanziwu/muqiao",
	},
}
--[[Room {
	--id = "yanziwu/hssg",
	--name = "��ʩˮ��",
	--ways = {
	--	["south"] = "yanziwu/jiabi",
	--},
--}
Room {
	id = "yanziwu/jiabi",
	name = "�б�",
	ways = {
		["north"] = "yanziwu/hssg",
		["push shujia"] = "yanziwu/shufang",
	},
	nolooks = {
		["push shujia"] = true,
	},
	lengths = {
		["north"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
}]]
Room {
	id = "yanziwu/jingyinge",
	name = "������",
	ways = {
		["south"] = "yanziwu/cl6-5",
		["east"] = "yanziwu/neitang",
		["west"] = "yanziwu/cl6-2",
	},
}
Room {
	id = "yanziwu/jushi",
	name = "����",
	ways = {
		["south"] = "yanziwu/xiangfang3",
		["east"] = "yanziwu/dating",
		["west"] = "yanziwu/cl6-0",
	},
}
Room {
	id = "yanziwu/mishi",
	name = "����",
	ways = {
		["south"] = "yanziwu/fenmu",
	},
}
Room {
	id = "yanziwu/mishi1",
	name = "����",
	ways = {
		["up"] = "yanziwu/mishi",
	},
}
Room {
	id = "yanziwu/muqiao",
	name = "ľ��",
	ways = {
		["east"] = "yanziwu/houyuan1",
		["west"] = "yanziwu/bishuiting",
	},
}
Room {
	id = "yanziwu/neitang",
	name = "����",
	ways = {
		["east"] = "yanziwu/shangyue",
		["north"] = "yanziwu/houting",
		["west"] = "yanziwu/jingyinge",
	},
}
Room {
	id = "yanziwu/shangyue",
	name = "����ի",
	ways = {
		["south"] = "yanziwu/cl5-5",
		["east"] = "yanziwu/cl5-2",
		["west"] = "yanziwu/neitang",
	},
}
Room {
        id = "yanziwu/shufang",
        name = "�鷿",
        ways = {
                ["south"] = "yanziwu/xiangfang2",
                ["north"] = "yanziwu/zishu",
                ["east"] = "yanziwu/cl5-0",
                ["west"] = "yanziwu/dating",
                ["sit chair;zhuan"] = "yanziwu/jiabi",
        },
        objs = {
          ["�粨��"] = "feng boe",
           },
}
Room {
        id = "yanziwu/hssg",
        name = "��ʩˮ��",
        ways = {
                ["south"] = "yanziwu/jiabi",
        },
}
Room {
        id = "yanziwu/jiabi",
        name = "�б�",
        ways = {
                ["north"] = "yanziwu/hssg",
                ["push shujia"] = "yanziwu/shufang",
        },
}
Room {
	id = "yanziwu/shuixie",
	name = "����ˮ�",
	ways = {
		["south"] = "yanziwu/houyuan1",
		["north"] = "yanziwu/anbian2",
		["zuan didao"] = "mr/didao",
		["west"] = "yanziwu/anbian4",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
	objs = {
          ["����"] = "a zhu",
           },
}
Room {
	id = "yanziwu/wuchang",
	name = "���䳡",
	ways = {
		["west"] = "yanziwu/yanziwu",
	},
	objs = {
          ["������"] = "bingqi jia",
           },
}
Room {
	id = "yanziwu/xiangfang2",
	name = "�᷿",
	no_fight = true,
	ways = {
		["north"] = "yanziwu/shufang",
		["east"] = "yanziwu/cl5-1",
		["west"] = "yanziwu/houting",
	},
}
Room {
	id = "yanziwu/xiangfang3",
	name = "�᷿",
	no_fight = true,
	ways = {
		["north"] = "yanziwu/jushi",
		["east"] = "yanziwu/houting",
		["west"] = "yanziwu/cl6-1",
	},
}
Room {
	id = "yanziwu/xiaojing2",
	name = "С��",
	ways = {
		["south"] = "yanziwu/dating",
		["north"] = "yanziwu/yanziwu",
	},
}
Room {
	id = "yanziwu/xiaojing3",
	name = "С��",
	ways = {
		["east"] = "yanziwu/xiaojing4",
		["west"] = "yanziwu/cl5-4",
	},
}
Room {
	id = "yanziwu/xiaojing4",
	name = "С��",
	ways = {
		["north"] = "yanziwu/guanxing",
		["east"] = "yanziwu/fenmu",
		["west"] = "yanziwu/xiaojing3",
	},
	objs = {
          ["�˰ٴ�"] = "deng baichuan",
           },
}
Room {
	id = "yanziwu/xiaomen",
	name = "С��",
	ways = {
		["south"] = "yanziwu/cl5-4",
		["north"] = "yanziwu/cl5-3",
	},
}
Room {
	id = "yanziwu/xiaomen1",
	name = "С��",
	ways = {
		["south"] = "yanziwu/cl6-4",
		["north"] = "yanziwu/cl6-3",
	},
}
Room {
	id = "yanziwu/yanziwu",
	name = "Ժ��",
	ways = {
		["south"] = "yanziwu/xiaojing2",
		["east"] = "yanziwu/wuchang",
		["west"] = "yanziwu/houyuan1",
	},
	objs = {
          ["Ľ�ݸ�"] = "murong fu",
          ["Ľ����Ϯͼ��"] = "board",
           },
}
Room {
	id = "yanziwu/zishu",
	name = "˽��",
	ways = {
		["south"] = "yanziwu/shufang",
	},
}
Room {
	id = "mr/zhou3",
	name = "С��",
	ways = {
		["out"] = "yanziwu/anbian2",
	},
}
Room {
	id = "mr/zhou9",
	name = "С��",
	ways = {
		["out"] = "mr/xiaodao",
	},
}
Room {
	id = "nanyang/dating",
	name = "����ׯ����",
	no_fight = true,
	ways = {
		["south"] = "nanyang/jxzhuang",
		["east"] = "nanyang/houyuan",
	},
	objs = {
          ["�ξ�"] = "you ju",
          ["����"] = "you ji",
           },
}
Room {
	id = "nanyang/duanya",
	name = "����",
	ways = {
		["north"] = "nanyang/yidao4",
	},
}
Room {
	id = "nanyang/houyuan",
	name = "����ׯ��Ժ",
	ways = {
		["west"] = "nanyang/dating",
	},
}
Room {
	id = "nanyang/jiulou1",
	name = "ӭ��¥",
	ways = {
		["east"] = "nanyang/nanyang",
		["up"] = "nanyang/jiulou2",
	},
}
Room {
	id = "nanyang/jiulou2",
	name = "ӭ��¥��¥",
	ways = {
		["down"] = "nanyang/jiulou1",
	},
}
Room {
	id = "nanyang/jxzhuang",
	name = "����ׯ����",
	ways = {
		["southwest"] = "nanyang/xiaolu3",
		["north"] = "nanyang/dating",
	},
}
Room {
	id = "nanyang/kedian1",
	name = "��ջ",
	ways = {
		["west"] = "nanyang/xujiaji",
		-- ["up"] = "nanyang/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "nanyang/kedian2",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["down"] = "nanyang/kedian1",
	},
}
Room {
	id = "nanyang/nanyang",
	name = "������",
	no_fight = true,
	ways = {
		["south"] = "nanyang/yidao2",
		["north"] = "nanyang/yidao3",
		["west"] = "nanyang/jiulou1",
	},
}
Room {
	id = "nanyang/qslu",
	name = "��ʯ·",
	ways = {
		["south"] = "nanyang/xujiaji",
		["east"] = "nanyang/xiaolu3",
		["west"] = "nanyang/xiaolu",
	},
}
Room {
	id = "nanyang/qslu2",
	name = "��ʯ·",
	ways = {
		["north"] = "nanyang/xujiaji",
	},
}
Room {
	id = "nanyang/xiaolu",
	name = "С·",
	ways = {
		["east"] = "nanyang/qslu",
		["west"] = "nanyang/yidao2",
	},
}
Room {
	id = "nanyang/xiaolu2",
	name = "��·",
	ways = {
		["northeast"] = "nanyang/xujiaji",
		["west"] = "nanyang/yidao",
	},
}
Room {
	id = "nanyang/xiaolu3",
	name = "С·",
	ways = {
		["northeast"] = "nanyang/jxzhuang",
		["west"] = "nanyang/qslu",
	},
	objs = {
          ["����"] = "xiao feng",
           },
}
Room {
	id = "nanyang/xujiaji",
	name = "��Ҽ�",
	ways = {
		["southwest"] = "nanyang/xiaolu2",
		["south"] = "nanyang/qslu2",
		["north"] = "nanyang/qslu",
		["east"] = "nanyang/kedian1",
	},
}
Room {
	id = "nanyang/yidao",
	name = "���",
	ways = {
		["south"] = "xiangyang/henanroad2",
		["north"] = "nanyang/yidao1",
		["east"] = "nanyang/xiaolu2",
	},
}
Room {
	id = "nanyang/yidao1",
	name = "����",
	ways = {
		["south"] = "nanyang/yidao",
		["north"] = "nanyang/yidao2",
	},
}
Room {
	id = "nanyang/yidao2",
	name = "ʯ��·",
	ways = {
		["south"] = "nanyang/yidao1",
		["east"] = "nanyang/xiaolu",
		["north"] = "nanyang/nanyang",
	},
}
Room {
	id = "nanyang/yidao3",
	name = "�����",
	ways = {
		["south"] = "nanyang/nanyang",
		["north"] = "shaolin/ruzhou",
		["east"] = "nanyang/yidao4",
	},
	lengths = {
	    ["east"] = "if job.name and job.name=='husong' then return false else return 1 end",
	},
}
Room {
	id = "nanyang/yidao4",
	name = "����",
	ways = {
		["south"] = "nanyang/duanya",
		["northeast"] = "huanghe/weifen",
		["west"] = "nanyang/yidao3",
	},
}
Room {
	id = "ningbo/aywsi",
	name = "��������",
	ways = {
		["southeast"] = "ningbo/ningbo",
		["northwest"] = "ningbo/tianyige",
		["east"] = "ningbo/xikou",
		["west"] = "ningbo/tianfengta",
	},
}
Room {
	id = "ningbo/baoguosi",
	name = "������",
	ways = {
		["northdown"] = "ningbo/shilu",
	},
}
Room {
	id = "ningbo/dongqianhu",
	name = "��Ǯ��",
	ways = {
		["southwest"] = "ningbo/kedian",
		["south"] = "ningbo/xuedoushan",
		["north"] = "ningbo/xikou",
		["west"] = "ningbo/ningbo",
	},
}
Room {
	id = "ningbo/kedian",
	name = "�͵�",
	ways = {
		["north"] = "ningbo/ningbo",
		["northeast"] = "ningbo/dongqianhu",
		["west"] = "ningbo/majiu",
		-- ["up"] = "ningbo/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "ningbo/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "ningbo/kedian3",
		["down"] = "ningbo/kedian",
	},
}
Room {
	id = "ningbo/kedian3",
	name = "�͵��¥",
	ways = {
		["out"] = "ningbo/kedian2",
	},
}
Room {
	id = "ningbo/majiu",
	name = "���",
	ways = {
		["east"] = "ningbo/kedian",
		["northeast"] = "ningbo/ningbo",
	},
}
Room {
	id = "ningbo/ningbo",
	name = "������",
	ways = {
		["south"] = "ningbo/kedian",
		["northwest"] = "ningbo/aywsi",
		["east"] = "ningbo/dongqianhu",
		["west"] = "ningbo/ttcsi",
	},
}
Room {
	id = "ningbo/qsddao1",
	name = "��ʯ�ٵ�",
	ways = {
		["southeast"] = "group/entry/nbqsddao",
		["westup"] = "hz/shanlu2",
	},
}
Room {
	id = "ningbo/shilu",
	name = "ʯ·",
	ways = {
		["southup"] = "ningbo/baoguosi",
		["south"] = "ningbo/tianfengta",
		["northwest"] = "group/entry/nbqsddao",
		["east"] = "ningbo/tianyige",
	},
}
Room {
	id = "ningbo/tianfengta",
	name = "�����",
	ways = {
		["south"] = "ningbo/ttcsi",
		["north"] = "ningbo/shilu",
		["east"] = "ningbo/aywsi",
	},
}
Room {
	id = "ningbo/tianyige",
	name = "��һ��",
	ways = {
		["southeast"] = "ningbo/aywsi",
		["west"] = "ningbo/shilu",
	},
}
Room {
	id = "ningbo/ttcsi",
	name = "��ͯ����",
	ways = {
		["southwest"] = "fuzhou/road1",
		["north"] = "ningbo/tianfengta",
		["east"] = "ningbo/ningbo",
	},
}
Room {
	id = "ningbo/xikou",
	name = "Ϫ��",
	ways = {
		["south"] = "ningbo/dongqianhu",
		["west"] = "ningbo/aywsi",
	},
	objs = {
          ["����"] = "shao gong",
           },
}
Room {
	id = "ningbo/xuedoushan",
	name = "ѩ�ɽ",
	ways = {
		["north"] = "ningbo/dongqianhu",
	},
}
Room {
	id = "putian/cb-dian",
	name = "�ȱ���",
	ways = {
		["south"] = "putian/guangchang",
		["north"] = "putian/qianyuan",
	},
	objs = {
          ["Ԫ������"] = "yuanjue zunzhe",
      },
}
Room {
	id = "putian/celang2",
	name = "����",
	ways = {
		["south"] = "putian/xiaoyuan4",
		["north"] = "putian/xiaoyuan2",
	},
}
Room {
	id = "putian/celang3",
	name = "����",
	ways = {
		["south"] = "putian/xiaoyuan5",
		["north"] = "putian/xiaoyuan3",
	},
}
Room {
	id = "putian/celang4",
	name = "����",
	ways = {
		["south"] = "putian/xj4",
		["north"] = "putian/sengshe",
		["west"] = "putian/xiaoyuan4",
	},
}
Room {
	id = "putian/celang5",
	name = "����",
	ways = {
		["south"] = "putian/xj3",
		["east"] = "putian/xiaoyuan5",
		["north"] = "putian/chufang",
	},
}
Room {
	id = "putian/changlang2",
	name = "����",
	ways = {
		["east"] = "putian/jcyuan",
		["west"] = "putian/fzshi",
	},
}
Room {
	id = "putian/changlang3",
	name = "����",
	ways = {
		["east"] = "putian/nuange",
		["west"] = "putian/jcyuan",
	},
}
Room {
	id = "putian/chufang",
	name = "����",
	ways = {
		["south"] = "putian/celang5",
	},
}
Room {
	id = "putian/cjg",
	name = "�ؾ���",
	ways = {
		["northdown"] = "putian/mf-dian",
	},
	objs = {
          ["��������"] = "shaolin wuji",
          ["�޺�ȭ��"] = "shaolin wuji",
          ["��մ�ʦ"] = "dachi dashi",
      },
}
Room {
	id = "putian/dc-dian",
	name = "��˵�",
	ways = {
		["southup"] = "putian/wgg",
		["north"] = "putian/xj4",
		["west"] = "putian/lhtang",
	},
}
Room {
	id = "putian/dmyuan",
	name = "��ĦԺ",
	ways = {
		["west"] = "putian/mf-dian",
	},
	objs = {
          ["�쾵��ʦ"] = "tianjing chanshi",
      },
}
Room {
	id = "putian/dxb-dian",
	name = "���۱���",
	ways = {
		["northdown"] = "putian/guangchang",
		["southdown"] = "putian/qiandian",
	},
	objs = {
          ["����ʦ"] = "daku dashi",
      },
}
Room {
	id = "putian/fatang2",
	name = "����",
	ways = {
		["east"] = "putian/houdian",
	},
}
Room {
	id = "putian/fatang3",
	name = "����",
	ways = {
		["west"] = "putian/houdian",
	},
}
Room {
	id = "putian/fzshi",
	name = "������",
	ways = {
		["east"] = "putian/changlang2",
	},
}
Room {
	id = "putian/guangchang",
	name = "�㳡",
	ways = {
		["southup"] = "putian/dxb-dian",
		["east"] = "putian/xiaoyuan4",
		["north"] = "putian/cb-dian",
		["west"] = "putian/xiaoyuan5",
	},
}
Room {
	id = "putian/houdian",
	name = "���",
	ways = {
		["south"] = "putian/xm-dian",
		["north"] = "putian/zhongdian",
		["east"] = "putian/fatang3",
		["west"] = "putian/fatang2",
	},
	objs = {
          ["Ԫ������"] = "yuanshang zunzhe",
      },
}
Room {
	id = "putian/jcyuan",
	name = "���Ժ",
	ways = {
		["south"] = "putian/jingshi",
		["north"] = "putian/xm-dian",
		["east"] = "putian/changlang3",
		["west"] = "putian/changlang2",
	},
	blocks = {
		["south"] = {
			{id = "dadian dashi", exp = 2200000},
		}
	},
	objs = {
          ["��ߴ�ʦ"] = "dadian dashi",
      },
}
Room {
	id = "putian/jingshi",
	name = "����",
	ways = {
		["north"] = "putian/jcyuan",
	},
	objs = {
          ["�����ʦ"] = "tianhong chanshi",
      },
}
Room {
	id = "putian/jnlw-dian",
	name = "����������",
	ways = {
		["north"] = "putian/xiaoyuan5",
	},
	objs = {
          ["Ԫŭ����"] = "yuannu zunzhe",
      },
}
Room {
	id = "putian/lhtang",
	name = "�޺���",
	ways = {
		["east"] = "putian/dc-dian",
	},
	objs = {
          ["Ԫʹ����"] = "yuantong zunzhe",
      },
}
Room {
	id = "putian/liangt",
	name = "��ͤ",
	no_fight = true,
	ways = {
		["stand;out"] = "putian/road07",
	},
}
Room {
	id = "putian/lz-dian",
	name = "�����",
	ways = {
		["north"] = "putian/xiaoyuan4",
	},
	objs = {
          ["Ԫ������"] = "yuanai zunzhe",
      },
}
Room {
	id = "putian/mf-dian",
	name = "���",
	ways = {
		["southup"] = "putian/cjg",
		["north"] = "putian/xj3",
		["east"] = "putian/dmyuan",
	},
	blocks = {
		["southup"] = {
			{id = "wu seng", exp = 200000},
		},
	},
}
Room {
	id = "putian/mtd1",
	name = "�����",
	ways = {
		["northup"] = "putian/mtd2",
	},
	objs = {
          ["Ԫ������"] = "yuanhui zunzhe",
      },
	room_relative="����ء�����������",
}
Room {
	id = "putian/mtd2",
	name = "�����",
	ways = {
		["north"] = "putian/xl8",
		["southdown"] = "putian/mtd1",
	},
}
Room {
	id = "putian/nuange",
	name = "ů��",
	ways = {
		["west"] = "putian/changlang3",
	},
}
Room {
	id = "putian/qiandian",
	name = "ǰ��",
	ways = {
		["northup"] = "putian/dxb-dian",
		["south"] = "putian/zhongdian",
	},
}
Room {
	id = "putian/qianyuan",
	name = "ǰԺ",
	ways = {
		["south"] = "putian/cb-dian",
		["east"] = "putian/xiaoyuan2",
		["west"] = "putian/xiaoyuan3",
		["north"] = "putian/shanmen",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open gate",
	},
}
Room {
	id = "putian/road01",
	name = "ɽ·",
	ways = {
		["south"] = "putian/road02",
		--["northwest"] = "fuzhou/road2",
	},
}
Room {
	id = "putian/road02",
	name = "ɽ·",
	ways = {
		["southeast"] = "putian/road03",
		["northeast"] = "fuzhou/wroad4",
		["north"] = "putian/road01",
	},
}
Room {
	id = "putian/road03",
	name = "ɽ·",
	ways = {
		["northwest"] = "putian/road02",
		["east"] = "putian/road04",
	},
}
Room {
	id = "putian/road04",
	name = "ɽ·",
	ways = {
		["northeast"] = "putian/road05",
		["west"] = "putian/road03",
	},
}
Room {
	id = "putian/road05",
	name = "ɽ·",
	ways = {
		["eastup"] = "putian/road06",
		["southwest"] = "putian/road04",
	},
}
Room {
	id = "putian/road06",
	name = "ʯ��",
	ways = {
		["southup"] = "putian/road07",
		["westdown"] = "putian/road05",
	},
}
Room {
	id = "putian/road07",
	name = "ɽ·",
	ways = {
		["southup"] = "putian/road08",
		["enter"] = "putian/liangt",
		["northdown"] = "putian/road06",
	},
}
Room {
	id = "putian/road08",
	name = "ʯ��",
	ways = {
		["southup"] = "putian/shanmen",
		["northdown"] = "putian/road07",
	},
}
Room {
	id = "putian/sengshe",
	name = "ɮ��",
	no_fight = true,
	ways = {
		["south"] = "putian/celang4",
	},
}
Room {
	id = "putian/shanmen",
	name = "ɽ��",
	ways = {
		["east"] = "putian/xl3",
		["northdown"] = "putian/road08",
		["west"] = "putian/xl2",
		["south"] = "putian/qianyuan",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "knock gate",
	},
}
Room {
	id = "putian/wgg",
	name = "�书��",
	ways = {
		["northdown"] = "putian/dc-dian",
	},
	objs = {
          ["Ԫ������"] = "yuanbei zunzhe",
      },
}
Room {
	id = "putian/xiaoyuan2",
	name = "СԺ",
	ways = {
		["south"] = "putian/celang2",
		["west"] = "putian/qianyuan",
	},
}
Room {
	id = "putian/xiaoyuan3",
	name = "СԺ",
	ways = {
		["south"] = "putian/celang3",
		["east"] = "putian/qianyuan",
	},
}
Room {
	id = "putian/xiaoyuan4",
	name = "СԺ",
	ways = {
		["south"] = "putian/lz-dian",
		["east"] = "putian/celang4",
		["north"] = "putian/celang2",
		["west"] = "putian/guangchang",
	},
}
Room {
	id = "putian/xiaoyuan5",
	name = "СԺ",
	ways = {
		["south"] = "putian/jnlw-dian",
		["east"] = "putian/guangchang",
		["north"] = "putian/celang3",
		["west"] = "putian/celang5",
	},
}
Room {
	id = "putian/xj3",
	name = "С��",
	ways = {
		["south"] = "putian/mf-dian",
		["north"] = "putian/celang5",
	},
}
Room {
	id = "putian/xj4",
	name = "С��",
	ways = {
		["south"] = "putian/dc-dian",
		["north"] = "putian/celang4",
	},
}
Room {
	id = "putian/xl2",
	name = "С·",
	ways = {
		["east"] = "putian/shanmen",
		["west"] = "putian/xl4",
	},
}
Room {
	id = "putian/xl3",
	name = "С·",
	ways = {
		["east"] = "putian/xl5",
		["west"] = "putian/shanmen",
	},
}
Room {
	id = "putian/xl4",
	name = "С·",
	ways = {
		["east"] = "putian/xl2",
		["west"] = "putian/xl6",
	},
}
Room {
	id = "putian/xl5",
	name = "С·",
	ways = {
		["eastdown"] = "putian/xl7",
		["west"] = "putian/xl3",
	},
}
Room {
	id = "putian/xl6",
	name = "С·",
	ways = {
		["southwest"] = "putian/xl8",
		["east"] = "putian/xl4",
	},
}
Room {
	id = "putian/xl7",
	name = "С·",
	ways = {
		["westup"] = "putian/xl5",
		["north"] = "putian/youcaidi",
	},
	objs = {
          ["��˿ȸ"] = "jinsi que",
      },
}
Room {
	id = "putian/xl8",
	name = "С·",
	ways = {
		["south"] = "putian/mtd2",
		["northeast"] = "putian/xl6",
	},
}
Room {
	id = "putian/xm-dian",
	name = "���ֵ�",
	ways = {
		["south"] = "putian/jcyuan",
		["north"] = "putian/houdian",
	},
}
Room {
	id = "putian/youcaidi",
	name = "�Ͳ˵�",
	ways = {
		["south"] = "putian/xl7",
	},
}
Room {
	id = "putian/zhongdian",
	name = "�е�",
	ways = {
		["south"] = "putian/houdian",
		["north"] = "putian/qiandian",
	},
}
Room {
	id = "shaolin/andao1",
	name = "����",
	ways = {
		["south"] = "shaolin/rukou",
		["north"] = "shaolin/jianyu1",
	},
}
Room {
	id = "shaolin/andao2",
	name = "����",
	ways = {
		["up"] = "shaolin/gulou1",
	},
}
--Room {
--	id = "shaolin/bamboon",
--	name = "����",
--	ways = {
--		["sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = "shaolin/damodong",
--	},
--	lengths = {
--		["sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = 3,
--	},
--}
Room {
	id = "shaolin/bamboo1",
	name = "����",
	ways = {
		["southwest"] = "shaolin/bamboo2",
		["south"] = "shaolin/shanlu6",
		["southeast"] = "shaolin/bamboo1",
		["northwest"] = "shaolin/bamboo1",
	},
	--lengths = {
	--    ["southeast"] = "if 1=1 then return false else return false end",
	--	["northwest"] = "if 1=1 then return false else return false end",
	--},
}
Room {
	id = "shaolin/bamboo2",
	name = "����",
	ways = {
		["southeast"] = "shaolin/bamboo3",
		["southwest"] = "shaolin/bamboo2",
	},
	--lengths = {
	--	["southwest"] = "if 1=1 then return false else return false end",
	--},
}
Room {
	id = "shaolin/bamboo3",
	name = "����",
	ways = {
		["north"] = "shaolin/bamboo4",
	},
}
Room {
	id = "shaolin/bamboo4",
	name = "����",
	ways = {
		["south"] = "shaolin/bamboo5",
	},
}
Room {
	id = "shaolin/bamboo5",
	name = "����",
	ways = {
		["west"] = "shaolin/bamboo6",
	},
}
Room {
	id = "shaolin/bamboo6",
	name = "����",
	ways = {
		["east"] = "shaolin/bamboo7",
	},
}
Room {
	id = "shaolin/bamboo7",
	name = "����",
	ways = {
		["west"] = "shaolin/bamboo8",
	},
}
Room {
	id = "shaolin/bamboo8",
	name = "����",
	ways = {
		["east"] = "shaolin/bamboo9",
	},
}
Room {
	id = "shaolin/bamboo9",
	name = "����",
	ways = {
		["east"] = "shaolin/bamboo10",
	},
}
Room {
	id = "shaolin/bamboo10",
	name = "����",
	ways = {
		["south"] = "shaolin/bamboo11",
	},
}
Room {
	id = "shaolin/bamboo11",
	name = "����",
	ways = {
		["west"] = "shaolin/bamboo12",
	},
}
Room {
	id = "shaolin/bamboo12",
	name = "����",
	ways = {
		["north"] = "shaolin/bamboo13",
	},
}
Room {
	id = "shaolin/bamboo13",
	name = "����",
	ways = {
		["northwest"] = "shaolin/bamboo14",
	},
}
Room {
	id = "shaolin/bamboo14",
	name = "����",
	ways = {
		["north"] = "shaolin/damodong",
	},
}
Room {
	id = "shaolin/banruo1",
	name = "������һ��",
	ways = {
		["north"] = "shaolin/banruo2",
	},
	objs = {
          ["����"] = "chengxin luohan",
           },
}
Room {
	id = "shaolin/banruo2",
	name = "�����ö���",
	ways = {
		["south"] = "shaolin/banruo1",
		["north"] = "shaolin/banruo3",
	},
	objs = {
          ["����"] = "chengyi luohan",
           },
}
Room {
	id = "shaolin/banruo3",
	name = "����������",
	ways = {
		["south"] = "shaolin/banruo2",
		["north"] = "shaolin/banruo4",
	},
	objs = {
          ["��˼"] = "chengsi luohan",
           },
}
Room {
	id = "shaolin/banruo4",
	name = "�������Ĳ�",
	ways = {
		["south"] = "shaolin/banruo3",
		["north"] = "shaolin/banruo5",
	},
	objs = {
          ["��ʶ"] = "chengshi luohan",
           },
}
Room {
	id = "shaolin/banruo5",
	name = "�������岿",
	ways = {
		["south"] = "shaolin/banruo4",
		["north"] = "shaolin/banruo6",
		["west"] = "shaolin/lwc11",
	},
	objs = {
          ["��־"] = "chengzhi luohan",
           },
}
Room {
	id = "shaolin/banruo6",
	name = "����������",
	ways = {
		["south"] = "shaolin/banruo5",
		["north"] = "shaolin/banruo7",
	},
	objs = {
          ["����"] = "chengxin luohan",
           },
}
Room {
	id = "shaolin/banruo7",
	name = "�������߲�",
	ways = {
		["south"] = "shaolin/banruo6",
		["north"] = "shaolin/banruo8",
	},
	objs = {
          ["����"] = "chengling luohan",
           },
}
Room {
	id = "shaolin/banruo8",
	name = "�����ð˲�",
	ways = {
		["south"] = "shaolin/banruo7",
		["north"] = "shaolin/banruo9",
	},
	objs = {
          ["����"] = "chengyu luohan",
           },
}
Room {
	id = "shaolin/banruo9",
	name = "�����þŲ�",
	ways = {
		["south"] = "shaolin/banruo8",
	},
	objs = {
          ["����"] = "chengshang luohan",
           },
}
Room {
	id = "shaolin/brtang",
	name = "������",
	ways = {
		["east"] = "shaolin/lwc16",
		["west"] = "shaolin/stoneroad3",
	},
	objs = {
          ["���Ѵ�ʦ"] = "xuannan dashi",
           },
}
Room {
	id = "shaolin/bydian",
	name = "���µ�",
	ways = {
		["west"] = "shaolin/kchang",
	},
}
Room {
	id = "shaolin/cdian-1",
	name = "�����",
	ways = {
		["west"] = "shaolin/gchang-3",
	},
}
Room {
	id = "shaolin/cdian-2",
	name = "�����",
	ways = {
		["east"] = "shaolin/gchang-2",
	},
}
Room {
	id = "shaolin/celang-1",
	name = "������",
	ways = {
		["south"] = "shaolin/gchang-2",
		["north"] = "shaolin/celang-2",
		["west"] = "shaolin/gulou",
	},
	room_relative="�����ȣ���¥СԺ----�����ȣ��㳡����������",
}
Room {
	id = "shaolin/celang-2",
	name = "������",
	ways = {
		["south"] = "shaolin/celang-1",
		["northeast"] = "shaolin/sblu-1",
		["west"] = "shaolin/zdyuan",
	},
	room_relative="ʯ��·�J֤��Ժ----�����ȣ�������������",
}
Room {
	id = "shaolin/celang-3",
	name = "������",
	ways = {
		["south"] = "shaolin/gchang-3",
		["east"] = "shaolin/zhonglou",
		["north"] = "shaolin/celang-4",
	},
	room_relative="�����ȣ�������----��¥СԺ���㳡���ණ����",
}
Room {
	id = "shaolin/celang-4",
	name = "������",
	ways = {
		["south"] = "shaolin/celang-3",
		["northwest"] = "shaolin/sblu-1",
		["east"] = "shaolin/zhaitang",
	},
	room_relative="ʯ��·�I������----ի�ã������ȶ�����",
}
Room {
	id = "shaolin/celang1",
	name = "����",
	ways = {
		["south"] = "shaolin/stoneroad4",
		["northwest"] = "shaolin/huaishu2",
		["west"] = "shaolin/sengshe4",
	},
	room_relative="�����֨Iɮ��-----���ȣ�ʯ��·����",
}
Room {
	id = "shaolin/celang2",
	name = "����",
	ways = {
		["south"] = "shaolin/stoneroad3",
		["east"] = "shaolin/sengshe1",
		["northeast"] = "shaolin/songshu3",
	},
	room_relative="�����֨J����-----ɮ���ʯ��·����,"
}
Room {
	id = "shaolin/chanfang-1",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/chanfang-3",
		["east"] = "shaolin/zdyuan",
		["north"] = "shaolin/chanfang-2",
	},
	objs = {
          ["���δ�ʦ"] = "xuancheng dashi",
           },
}
Room {
	id = "shaolin/chanfang-2",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/chanfang-1",
	},
}
Room {
	id = "shaolin/chanfang-3",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "shaolin/chanfang-1",
	},
	objs = {
          ["������"] = "shu",
           },
}
Room {
	id = "shaolin/chufang1",
	name = "�����",
	ways = {
		["south"] = "shaolin/chufang2",
		["west"] = "shaolin/fanting1",
	},
	room_relative="����----�����������������",
}
Room {
	id = "shaolin/chufang2",
	name = "�����",
	ways = {
		["south"] = "shaolin/xiaolu-1",
		["north"] = "shaolin/chufang1",
		["west"] = "shaolin/fanting3",
	},
	room_relative="�����������----�������С·�����",
}
Room {
	id = "shaolin/cjlou",
	name = "�ؾ���һ¥",
	ways = {
		["out"] = "shaolin/xiaoxi1",
		["up"] = "shaolin/cjlou1",
	},
	blocks = {
		["up"] = {
			{id = "daoyi chanshi", exp = 2000000, cond = function()
				if score.master and (score.master=="������ɮ" or score.master=="Ľ�ݲ�") then
					return true
				else
					return false
				end
			end,
			},
		},
	},
}
Room {
	id = "shaolin/cjlou1",
	name = "�ؾ����¥",
	ways = {
		["down"] = "shaolin/cjlou",
		["push chuang;jump chuang"] = "shaolin/xiaojin1",
	},
	nolooks = {
		["push chuang;jump chuang"] = true,
	},
	objs = {
          ["��������"] = "huizhen zunzhe",
           },
}
Room {
	id = "shaolin/cyzi-1",
	name = "��԰��",
	ways = {
		["south"] = "shaolin/cyzi-2",
		["north"] = "shaolin/xiaolu-3",
		["east"] = "shaolin/cyzi-4",
	},
	room_relative="С·����԰��----��԰�ӣ���԰�Ӳ�԰��",
	objs = {
          ["Ե��"] = "yuan gen",
           },
}
Room {
	id = "shaolin/cyzi-2",
	name = "��԰��",
	ways = {
		["east"] = "shaolin/cyzi-3",
		["north"] = "shaolin/cyzi-1",
	},
	room_relative="��԰�ӣ���԰��----��԰�Ӳ�԰��",
}
Room {
	id = "shaolin/cyzi-3",
	name = "��԰��",
	ways = {
		["north"] = "shaolin/cyzi-4",
		["west"] = "shaolin/cyzi-2",
	},
	room_relative="��԰�ӣ���԰��----��԰�Ӳ�԰��",
}
Room {
	id = "shaolin/cyzi-4",
	name = "��԰��",
	ways = {
		["south"] = "shaolin/cyzi-3",
		["west"] = "shaolin/cyzi-1",
	},
	room_relative="��԰��----��԰�ӣ���԰�Ӳ�԰��"
}
Room {
	id = "shaolin/czan",
	name = "������",
	ways = {
		["south"] = "shaolin/shanlu4",
		["north"] = "shaolin/shanlu5",
	},
}
Room {
	id = "shaolin/dabeidia",
	name = "�󱯵�",
	ways = {
		["south"] = "shaolin/stoneroad1",
		["north"] = "shaolin/hguangz2",
		["west"] = "shaolin/xumidian",
	},
	objs = {
          ["������ʦ"] = "daozheng chanshi",
          ["ľ���"] = "muyu chui",
           },
}
Room {
	id = "shaolin/damodong",
	name = "��Ħ��",
	ways = {
		["out"] = "shaolin/bamboo1",
	},
}
Room {
	id = "shaolin/daxiong",
	name = "���۱���",
	no_fight = true,
	ways = {
		["south"] = "shaolin/pingtai",
		["north"] = "shaolin/stoneroad1",
	},
}
Room {
	id = "shaolin/dmyuan",
	name = "��ĦԺ",
	no_fight = true,
	ways = {
		["south"] = "shaolin/huilang4",
		["north"] = "shaolin/dmyuan2",
	},
	objs = {
          ["������ʦ"] = "xuanbei dashi",
           },
}
Room {
	id = "shaolin/dmyuan2",
	name = "��ĦԺ���",
	no_fight = true,
	ways = {
		["south"] = "shaolin/dmyuan",
	},
}
Room {
	id = "shaolin/duanya",
	name = "����ƺ",
	ways = {
		["south"] = "shaolin/xctang",
	--	["#goYd"] = "shaolin/yading",
	},
	--nolooks = {
	--	["#goYd"] = true,
	--},
	--lengths = {
	--	["#goYd"] = "if getCha()['wuxiang-zhi'].level > 0 and getWeight() < 20 then return 10 else return false end",
	--},
}
Room {
	id = "shaolin/dxshijie",
	name = "̨��",
	ways = {
		["northup"] = "shaolin/pingtai",
		["south"] = "shaolin/stoneroad2",
	},
}
Room {
	id = "shaolin/dzdian",
	name = "�زص�",
	ways = {
		["east"] = "shaolin/kchang",
	},
}
Room {
	id = "shaolin/entrance",
	name = "ľ�������",
	ways = {
		["north"] = "shaolin/murenxiang",
	},
}
Room {
	id = "shaolin/fangjuku",
	name = "���߿�",
	ways = {
		["north"] = "shaolin/lshuyuan",
	},
	objs = {
          ["������ʦ"] = "daoxiang chanshi",
           },
}
Room {
	id = "shaolin/fanting1",
	name = "����",
	ways = {
		["south"] = "shaolin/fanting3",
		["north"] = "shaolin/fanting2",
		["east"] = "shaolin/chufang1",
		["west"] = "shaolin/zhaitang",
	},
	room_relative="������ի��-----����-----���������������",
}
Room {
	id = "shaolin/fanting2",
	name = "����",
	ways = {
		["south"] = "shaolin/fanting1",
	},
	room_relative="��������������",
}
Room {
	id = "shaolin/fanting3",
	name = "����",
	ways = {
		["north"] = "shaolin/fanting1",
		["east"] = "shaolin/chufang2",
	},
	room_relative="����������-----���������",
}
Room {
	id = "shaolin/fatang",
	name = "����",
	ways = {
		["southeast"] = "shaolin/jietan4",
		["southwest"] = "shaolin/jietan3",
		["east"] = "shaolin/xcping",
		["north"] = "shaolin/kchang",
		["west"] = "shaolin/huilang1",
	},
}
Room {
	id = "shaolin/fota1",
	name = "����һ��",
	ways = {
		["out"] = "shaolin/fotaout",
		["up"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/fota2",
	name = "ʥɮ��",
	ways = {
		["down"] = "shaolin/fota1",
		["up"] = "shaolin/fota3",
	},
}
Room {
	id = "shaolin/fota3",
	name = "��������",
	ways = {
		["down"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/fotaout",
	name = "�ŷ�������",
	ways = {
		["enter"] = "shaolin/fota1",
		["s;ne;se;n;e;sw;e;ne;se;s;se;open door;e"] = "shaolin/slyuan",
	},
}
Room {
	id = "shaolin/fumoquan",
	name = "��շ�ħȦ",
	ways = {
		["out"] = "shaolin/qyping",
	},
	objs = {
          ["����"] = "du nan",
          ["�ɽ�"] = "du jie",
          ["�ɶ�"] = "du e",
           },
}
Room {
	id = "shaolin/fxjing",
	name = "���ľ�",
	ways = {
		["westdown"] = "shaolin/shijie9",
	},
}
Room {
	id = "shaolin/fzjs",
	name = "���ɾ���",
	ways = {
		["east"] = "shaolin/xiaolu7",
		["up"] = "shaolin/fzjs1",
	},
}
Room {
	id = "shaolin/fzjs1",
	name = "����",
	ways = {
		["north"] = "shaolin/fzjs2",
		["down"] = "shaolin/fzjs",
	},
	objs = {
          ["���ֱ���"] = "qingle biqiu",
           },
}
Room {
	id = "shaolin/fzjs2",
	name = "������",
	ways = {
		["south"] = "shaolin/fzjs1",
	},
	objs = {
          ["���ȴ�ʦ"] = "xuanci dashi",
           },
}
Room {
	id = "shaolin/gchang-1",
	name = "�㳡",
	ways = {
		["south"] = "shaolin/smdian",
		["north"] = "shaolin/qdian",
		["east"] = "shaolin/gchang-3",
		["west"] = "shaolin/gchang-2",
	},
}
Room {
	id = "shaolin/gchang-2",
	name = "�㳡����",
	ways = {
		["east"] = "shaolin/gchang-1",
		["north"] = "shaolin/celang-1",
		["west"] = "shaolin/cdian-2",
	},
}
Room {
	id = "shaolin/gchang-3",
	name = "�㳡����",
	ways = {
		["north"] = "shaolin/celang-3",
		["east"] = "shaolin/cdian-1",
		["west"] = "shaolin/gchang-1",
	},
}
Room {
	id = "shaolin/gchange",
	name = "��ǰ�㳡",
	ways = {
		["west"] = "shaolin/guangchang",
	},
	objs = {
          ["���ޱ���"] = "qingwu biqiu",
           },
}
Room {
	id = "shaolin/gchangw",
	name = "��ǰ�㳡",
	ways = {
		["east"] = "shaolin/guangchang",
	},
	objs = {
          ["��Ϊ����"] = "qingwei biqiu",
           },
}
Room {
	id = "shaolin/guangchang",
	name = "�㳡",
	ways = {
		["south"] = "shaolin/shifang",
		["east"] = "shaolin/gchange",
		["north"] = "shaolin/smdian",
		["west"] = "shaolin/gchangw",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "knock gate",
	},
	objs = {
          ["�巨����"] = "qingfa biqiu",
          ["��������������"] = "board",
           },
}
Room {
	id = "shaolin/gulou",
	name = "��¥СԺ",
	ways = {
		["enter"] = "shaolin/gulou1",
		["east"] = "shaolin/celang-1",
	},
}
Room {
	id = "shaolin/gulou1",
	name = "��¥һ��",
	ways = {
		["up"] = "shaolin/gulou2",
		["out"] = "shaolin/gulou",
	},
}
Room {
	id = "shaolin/gulou2",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/gulou1",
		["up"] = "shaolin/gulou3",
	},
}
Room {
	id = "shaolin/gulou3",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/gulou2",
		["up"] = "shaolin/gulou4",
	},
}
Room {
	id = "shaolin/gulou4",
	name = "��¥�Ĳ�",
	ways = {
		["down"] = "shaolin/gulou3",
		["up"] = "shaolin/gulou5",
	},
}
Room {
	id = "shaolin/gulou5",
	name = "��¥���",
	ways = {
		["down"] = "shaolin/gulou4",
		["up"] = "shaolin/gulou6",
	},
}
Room {
	id = "shaolin/gulou6",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/gulou5",
		["up"] = "shaolin/gulou7",
	},
}
Room {
	id = "shaolin/gulou7",
	name = "��¥�߲�",
	ways = {
		["down"] = "shaolin/gulou6",
	},
	objs = {
          ["���ű���"] = "qingwen biqiu",
           },
}
Room {
	id = "shaolin/gygu",
	name = "��Ԫ��",
	ways = {
		["southeast"] = "shaolin/xclang",
		["northwest"] = "shaolin/gygu",
	},
}
Room {
	id = "shaolin/hguangz1",
	name = "���㳡",
	ways = {
		["southwest"] = "shaolin/huaishu5",
		["north"] = "shaolin/hguangz4",
		["east"] = "shaolin/hguangz2",
	},
	room_relative="���㳡�����㳡---���㳡�L�����ֺ��㳡",
}
Room {
	id = "shaolin/hguangz2",
	name = "���㳡",
	no_fight = true,
	ways = {
		["south"] = "shaolin/dabeidia",
		["east"] = "shaolin/hguangz3",
		["west"] = "shaolin/hguangz1",
	},
	room_relative="���㳡---���㳡---���㳡���󱯵���㳡",
	objs = {
          ["������ʦ"] = "daojue chanshi",
           },
}
Room {
	id = "shaolin/hguangz3",
	name = "���㳡",
	ways = {
		["southeast"] = "shaolin/songshu1",
		["north"] = "shaolin/hguangz5",
		["west"] = "shaolin/hguangz2",
	},
	room_relative="���㳡�����㳡---���㳡�K�����ֺ��㳡",
}
Room {
	id = "shaolin/hguangz4",
	name = "���㳡",
	ways = {
		["south"] = "shaolin/hguangz1",
		["east"] = "shaolin/houdian",
	},
	room_relative="���㳡---�������㳡���㳡",
}
Room {
	id = "shaolin/hguangz5",
	name = "���㳡",
	ways = {
		["south"] = "shaolin/hguangz3",
		["west"] = "shaolin/houdian",
	},
	room_relative="���---���㳡�����㳡���㳡",
}
Room {
	id = "shaolin/houdian",
	name = "���",
	ways = {
		["north"] = "shaolin/taijie",
		["east"] = "shaolin/hguangz5",
		["west"] = "shaolin/hguangz4",
	},
	objs = {
          ["�ۿ�����"] = "huikong zunzhe",
           },
}
Room {
	id = "shaolin/houshan",
	name = "СԺ",
	ways = {
		["northwest"] = "shaolin/zhushe",
		["north"] = "shaolin/xiaowu",
		["east"] = "shaolin/xiaojing2",
	},
}
Room {
	id = "shaolin/houshand",
	name = "ɽ��",
	ways = {
		["out"] = "shaolin/yading",
	},
}
Room {
	id = "shaolin/houyuan",
	name = "С��",
	ways = {
		["enter"] = "shaolin/liwu",
		["north"] = "shaolin/xiaojin1",
	},
	objs = {
          ["Ľ�ݲ�"] = "murong bo",
           },
}
Room {
	id = "shaolin/huaishu1",
	name = "������",
	ways = {
		["east"] = "shaolin/huaishu2",
		["west"] = "shaolin/putiyuan",
	},
	room_relative="����Ժ----������----�����ֻ�����",
}
Room {
	id = "shaolin/huaishu2",
	name = "������",
	ways = {
		["southeast"] = "shaolin/celang1",
		["north"] = "shaolin/huaishu4",
		["west"] = "shaolin/huaishu1",
	},
	room_relative="�����֣�������----�����֨K���Ȼ�����",
}
Room {
	id = "shaolin/huaishu4",
	name = "������",
	ways = {
		["south"] = "shaolin/huaishu2",
		["east"] = "shaolin/stoneroad1",
		["north"] = "shaolin/huaishu5",
		["west"] = "shaolin/slyuan",
	},
	room_relative="�����֣�����Ժ----������----ʯ��·�������ֻ�����",
}
Room {
	id = "shaolin/huaishu5",
	name = "������",
	ways = {
		["south"] = "shaolin/huaishu4",
		["northeast"] = "shaolin/hguangz1",
		["west"] = "shaolin/lshuyuan",
	},
	room_relative="���㳡�J����Ժ----�����֣������ֻ�����",
}
Room {
	id = "shaolin/huilang1",
	name = "����",
	ways = {
		["south"] = "shaolin/huilang1",
		["north"] = "shaolin/huilang2",
		["east"] = "shaolin/fatang",
		["west"] = "shaolin/huilang1",
	},
}
Room {
	id = "shaolin/huilang2",
	name = "����",
	ways = {
		["south"] = "shaolin/huilang1",
		["east"] = "shaolin/huilang2",
		["north"] = "shaolin/huilang2",
		["west"] = "shaolin/huilang3",
	},
}
Room {
	id = "shaolin/huilang3",
	name = "����",
	ways = {
		["south"] = "shaolin/huilang3",
		["north"] = "shaolin/huilang3",
		["east"] = "shaolin/huilang2",
		["west"] = "shaolin/huilang4",
	},
}
Room {
	id = "shaolin/huilang4",
	name = "����",
	ways = {
		["south"] = "shaolin/huilang4",
		["east"] = "shaolin/huilang3",
		["north"] = "shaolin/dmyuan",
		["west"] = "shaolin/huilang4",
	},
}
Room {
	id = "shaolin/huizhizuo",
	name = "����ʥ��",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/jianyu",
	name = "����",
}
Room {
	id = "shaolin/jianyu1",
	name = "����",
	ways = {
		["north"] = "shaolin/jianyu",
	},
}
Room {
	id = "shaolin/jieluyua",
	name = "����Ժ",
	no_fight = true,
	ways = {
		["west"] = "shaolin/songshu4",
	},
}
Room {
	id = "shaolin/jietan1",
	name = "��̳",
	ways = {
		["southeast"] = "shaolin/sblu-3",
		["north"] = "shaolin/jietan3",
		["east"] = "shaolin/jietan2",
	},
	room_relative="��̳����̳-----��̳�Kʯ��·��̳",
}
Room {
	id = "shaolin/jietan2",
	name = "��̳",
	ways = {
		["southwest"] = "shaolin/sblu-3",
		["north"] = "shaolin/jietan4",
		["west"] = "shaolin/jietan1",
	},
	room_relative="��̳����̳-----��̳�Lʯ��·��̳",
}
Room {
	id = "shaolin/jietan3",
	name = "��̳",
	ways = {
		["south"] = "shaolin/jietan1",
		["east"] = "shaolin/jietan4",
		["northeast"] = "shaolin/fatang",
	},
	room_relative="���èJ��̳-----��̳����̳��̳",
}
Room {
	id = "shaolin/jietan4",
	name = "��̳",
	ways = {
		["south"] = "shaolin/jietan2",
		["northwest"] = "shaolin/fatang",
		["west"] = "shaolin/jietan3",
	},
	room_relative="���èI��̳-----��̳����̳��̳",
}
Room {
	id = "shaolin/jiulou1",
	name = "ӭ��¥",
	ways = {
		["east"] = "shaolin/nanyang",
		["up"] = "shaolin/jiulou2",
	},
}
Room {
	id = "shaolin/jiulou2",
	name = "ӭ��¥��¥",
	ways = {
		["down"] = "shaolin/jiulou1",
	},
}
Room {
	id = "shaolin/jnlwang",
	name = "����������",
	ways = {
		["west"] = "shaolin/pingtai",
	},
	objs = {
          ["ľ���"] = "muyu chui",
          ["��Ʒ��ʦ"] = "daopin chanshi",
           },
}
Room {
	id = "shaolin/jxzhuang",
	name = "����ׯ",
	ways = {
		["west"] = "shaolin/yidao2",
	},
}
Room {
	id = "shaolin/kchang",
	name = "�ճ�",
	ways = {
		["south"] = "shaolin/fatang",
		["north"] = "shaolin/qfdian",
		["east"] = "shaolin/bydian",
		["west"] = "shaolin/dzdian",
	},
}
Room {
	id = "shaolin/kedian1",
	name = "������ջ",
	ways = {
		["west"] = "shaolin/nanyang",
		["up"] = "shaolin/kedian2",
	},
}
Room {
	id = "shaolin/kedian2",
	name = "�͵��¥",
	ways = {
		["down"] = "shaolin/kedian1",
	},
}
Room {
	id = "shaolin/kuhuiping",
	name = "���ƺ",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/lhtang",
	name = "�޺���",
	ways = {
		["east"] = "shaolin/stoneroad4",
		["west"] = "shaolin/lwc",
	},
	objs = {
          ["�����ʦ"] = "xuanku dashi",
           },
}
Room {
	id = "shaolin/liuzu",
	name = "�����",
	ways = {
		["east"] = "shaolin/pingtai",
	},
	objs = {
          ["ľ���"] = "muyu chui",
          ["������ʦ"] = "daocheng chanshi",
           },
}
Room {
	id = "shaolin/liwu",
	name = "����",
	ways = {
		["out"] = "shaolin/houyuan",
	},
	objs = {
          ["������ɮ"] = "wuming laoseng",
           },
}
Room {
	id = "shaolin/lshuyuan",
	name = "����Ժ",
	ways = {
		["south"] = "shaolin/fangjuku",
		["north"] = "shaolin/wuqiku",
		["east"] = "shaolin/huaishu5",
	},
}
Room {
	id = "shaolin/luohan1",
	name = "�޺���һ��",
	ways = {
		["north"] = "shaolin/luohan2",
	},
	objs = {
          ["�ι�"] = "chengguan luohan",
           },
}
Room {
	id = "shaolin/luohan2",
	name = "�޺��ö���",
	ways = {
		["south"] = "shaolin/luohan1",
		["north"] = "shaolin/luohan3",
	},
	objs = {
          ["��֪"] = "chengzhi luohan",
           },
}
Room {
	id = "shaolin/luohan3",
	name = "�޺�������",
	ways = {
		["south"] = "shaolin/luohan2",
		["north"] = "shaolin/luohan4",
	},
	objs = {
          ["����"] = "chengming luohan",
           },
}
Room {
	id = "shaolin/luohan4",
	name = "�޺����Ĳ�",
	ways = {
		["south"] = "shaolin/luohan3",
		["north"] = "shaolin/luohan5",
	},
	objs = {
          ["�ξ�"] = "chengjing luohan",
           },
}
Room {
	id = "shaolin/luohan5",
	name = "�޺����岿",
	ways = {
		["south"] = "shaolin/luohan4",
		["east"] = "shaolin/lwc6",
		["north"] = "shaolin/luohan6",
		["west"] = "shaolin/yanwutang",
	},
	objs = {
          ["�μ�"] = "chengjian luohan",
           },
}
Room {
	id = "shaolin/luohan6",
	name = "�޺�������",
	ways = {
		["south"] = "shaolin/luohan5",
		["north"] = "shaolin/luohan7",
	},
	objs = {
          ["����"] = "chengxing luohan",
           },
}
Room {
	id = "shaolin/luohan7",
	name = "�޺����߲�",
	ways = {
		["south"] = "shaolin/luohan6",
		["north"] = "shaolin/luohan8",
	},
	objs = {
          ["�μ�"] = "chengji luohan",
           },
}
Room {
	id = "shaolin/luohan8",
	name = "�޺��ð˲�",
	ways = {
		["south"] = "shaolin/luohan7",
		["north"] = "shaolin/luohan9",
	},
	objs = {
          ["����"] = "chengmie luohan",
           },
}
Room {
	id = "shaolin/luohan9",
	name = "�޺��þŲ�",
	ways = {
		["south"] = "shaolin/luohan8",
	},
	objs = {
          ["�κ�"] = "chenghe luohan",
           },
}
Room {
	id = "shaolin/lwc",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc9",
		["north"] = "shaolin/lwc2",
		["east"] = "shaolin/lhtang",
		["west"] = "shaolin/lwc5",
	},
}
Room {
	id = "shaolin/lwc11",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc19",
		["north"] = "shaolin/lwc12",
		["east"] = "shaolin/banruo5",
		["west"] = "shaolin/lwc15",
	},
}
Room {
	id = "shaolin/lwc12",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc13",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
}
Room {
	id = "shaolin/lwc13",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc15",
		["east"] = "shaolin/lwc12",
		["west"] = "shaolin/lwc14",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
}
Room {
	id = "shaolin/lwc14",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc16",
		["east"] = "shaolin/lwc13",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
}
Room {
	id = "shaolin/lwc15",
	name = "�����䳡",
	ways = {
		["south"] = "shaolin/lwc18",
		["north"] = "shaolin/lwc13",
		["east"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc16",
	},
	objs = {
          ["����"] = "jin ren",
           },
}
Room {
	id = "shaolin/lwc16",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc17",
		["east"] = "shaolin/lwc15",
		["north"] = "shaolin/lwc14",
		["west"] = "shaolin/brtang",
	},
}
Room {
	id = "shaolin/lwc17",
	name = "���䳡",
	ways = {
		["east"] = "shaolin/lwc18",
		["north"] = "shaolin/lwc16",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
}
Room {
	id = "shaolin/lwc18",
	name = "���䳡",
	ways = {
		["east"] = "shaolin/lwc19",
		["north"] = "shaolin/lwc15",
		["west"] = "shaolin/lwc17",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
}
Room {
	id = "shaolin/lwc19",
	name = "���䳡",
	ways = {
		["north"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc18",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
}
Room {
	id = "shaolin/lwc2",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc",
		["west"] = "shaolin/lwc3",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
}
Room {
	id = "shaolin/lwc3",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc5",
		["east"] = "shaolin/lwc2",
		["west"] = "shaolin/lwc4",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
}
Room {
	id = "shaolin/lwc4",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc6",
		["east"] = "shaolin/lwc3",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
}
Room {
	id = "shaolin/lwc5",
	name = "�����䳡",
	ways = {
		["south"] = "shaolin/lwc8",
		["north"] = "shaolin/lwc3",
		["east"] = "shaolin/lwc",
		["west"] = "shaolin/lwc6",
	},
	objs = {
          ["����"] = "jin ren",
           },
}
Room {
	id = "shaolin/lwc6",
	name = "���䳡",
	ways = {
		["south"] = "shaolin/lwc7",
		["east"] = "shaolin/lwc5",
		["north"] = "shaolin/lwc4",
		["west"] = "shaolin/luohan5",
	},
}
Room {
	id = "shaolin/lwc7",
	name = "���䳡",
	ways = {
		["east"] = "shaolin/lwc8",
		["north"] = "shaolin/lwc6",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
}
Room {
	id = "shaolin/lwc8",
	name = "���䳡",
	ways = {
		["east"] = "shaolin/lwc9",
		["north"] = "shaolin/lwc5",
		["west"] = "shaolin/lwc7",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
}
Room {
	id = "shaolin/lwc9",
	name = "���䳡",
	ways = {
		["north"] = "shaolin/lwc",
		["west"] = "shaolin/lwc8",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
}
Room {
	id = "shaolin/lxting",
	name = "��ѩͤ",
	ways = {
		["north"] = "shaolin/sblu-2",
		["southdown"] = "shaolin/taijie",
	},
	objs = {
          ["�۹�����"] = "huiguang zunzhe",
           },
}
Room {
	id = "shaolin/murenxiang",
	name = "ľ����",
	ways = {
		["north"] = "shaolin/murenxiang",
	},
}
Room {
	id = "shaolin/nanyang",
	name = "������",
	ways = {
		["south"] = "shaolin/yidao2",
		["north"] = "shaolin/yidao3",
		["east"] = "shaolin/kedian1",
		["west"] = "shaolin/jiulou1",
	},
}
Room {
	id = "shaolin/pingtai",
	name = "ƽ̨",
	ways = {
		["east"] = "shaolin/jnlwang",
		["north"] = "shaolin/daxiong",
		["southdown"] = "shaolin/dxshijie",
		["west"] = "shaolin/liuzu",
	},
	objs = {
          ["���ֵ������԰�"] = "board",
          ["��������"] = "huixiu zunzhe",
           },
}
Room {
	id = "shaolin/putiyuan",
	name = "����Ժ",
	ways = {
		["east"] = "shaolin/huaishu1",
	},
	objs = {
          ["���ɴ�ʦ"] = "xuandu dashi",
           },
}
Room {
	id = "shaolin/qdian",
	name = "ǰ��",
	ways = {
		["south"] = "shaolin/gchang-1",
		["north"] = "shaolin/twdian",
	},
	objs = {
          ["���Ʊ���"] = "qingshan biqiu",
           },
}
Room {
	id = "shaolin/qfdian",
	name = "ǧ���",
	ways = {
		["south"] = "shaolin/kchang",
		["north"] = "shaolin/shanlu1",
	},
	objs = {
          ["��۱���"] = "qingguan biqiu",
           },
}
Room {
	id = "shaolin/qyping",
	name = "����ƺ",
	ways = {
		["enter"] = "shaolin/fumoquan",
		["sd;w;e;n;e;s;n;e;w;s"] = "shaolin/shanlu8",
	},
	nolooks = {
		["southdown"] = true,
		["sd;w;e;n;e;s;n;e;w;s"] = true,
	},
}
Room {
	id = "shaolin/rukou",
	name = "���ж����",
	ways = {
		["north"] = "shaolin/andao1",
	},
}
Room {
	id = "shaolin/ruzhou",
	name = "���ݳ�",
	ways = {
		["south"] = "nanyang/yidao3",
		["west"] = "shaolin/shijie1",
	},
}
Room {
	id = "shaolin/sblu-1",
	name = "ʯ��·",
	ways = {
		["southeast"] = "shaolin/celang-4",
		["southwest"] = "shaolin/celang-2",
		["south"] = "shaolin/twdian",
		["north"] = "shaolin/xianglu",
	},
	room_relative="��¯��ʯ��·�L���K���������������ʯ��·",
	objs = {
          ["��������"] = "huiming zunzhe",
           },
}
Room {
	id = "shaolin/sblu-2",
	name = "ʯ��·",
	ways = {
		["south"] = "shaolin/lxting",
		["east"] = "shaolin/xiaolu1",
		["north"] = "shaolin/sblu-3",
		["west"] = "shaolin/xiaolu5",
	},
	room_relative="ʯ��·������С·----ʯ��·----����С·����ѩͤʯ��·",
}
Room {
	id = "shaolin/sblu-3",
	name = "ʯ��·",
	ways = {
		["south"] = "shaolin/sblu-2",
		["northwest"] = "shaolin/jietan1",
		["northeast"] = "shaolin/jietan2",
	},
	room_relative="��̳��̳�I�Jʯ��·��ʯ��·ʯ��·",
}
Room {
	id = "shaolin/sengshe1",
	name = "ɮ��",
	ways = {
		["south"] = "shaolin/sengshe3",
		["north"] = "shaolin/sengshe2",
		["west"] = "shaolin/celang2",
	},
	objs = {
          ["�ۺ�����"] = "huihe zunzhe",
           },
}
Room {
	id = "shaolin/sengshe2",
	name = "ɮ��",
	no_fight = true,
	ways = {
		["south"] = "shaolin/sengshe1",
	},
}
Room {
	id = "shaolin/sengshe3",
	name = "ɮ��",
	no_fight = true,
	ways = {
		["north"] = "shaolin/sengshe1",
	},
}
Room {
	id = "shaolin/sengshe4",
	name = "ɮ��",
	ways = {
		["south"] = "shaolin/sengshe6",
		["north"] = "shaolin/sengshe5",
		["east"] = "shaolin/celang1",
	},
	objs = {
          ["��������"] = "huixu zunzhe",
           },
}
Room {
	id = "shaolin/sengshe5",
	name = "ɮ��",
	no_fight = true,
	ways = {
		["south"] = "shaolin/sengshe4",
	},
}
Room {
	id = "shaolin/sengshe6",
	name = "ɮ��",
	no_fight = true,
	ways = {
		["north"] = "shaolin/sengshe4",
	},
}
Room {
	id = "shaolin/shanlu1",
	name = "ɽ·",
	ways = {
		["south"] = "shaolin/qfdian",
		["north"] = "shaolin/shanlu2",
	},
}
Room {
	id = "shaolin/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "shaolin/shanlu3",
		["south"] = "shaolin/shanlu1",
	},
}
Room {
	id = "shaolin/shanlu3",
	name = "ɽ·",
	ways = {
		["north"] = "shaolin/shanlu4",
		["southdown"] = "shaolin/shanlu2",
	},
}
Room {
	id = "shaolin/shanlu4",
	name = "ɽ·",
	ways = {
		["south"] = "shaolin/shanlu3",
		["north"] = "shaolin/czan",
	},
}
Room {
	id = "shaolin/shanlu5",
	name = "ɽ·",
	ways = {
		["northup"] = "shaolin/shanlu6",
		["south"] = "shaolin/czan",
	},
}
Room {
	id = "shaolin/shanlu6",
	name = "ɽ·",
	ways = {
		["northup"] = "shaolin/shanlu7",
		["northwest"] = "shaolin/bamboo1",
		["southdown"] = "shaolin/shanlu5",
	--	["nw;sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = "shaolin/damodong",
	},
}
Room {
	id = "shaolin/shanlu7",
	name = "ɽ·",
	ways = {
		["northeast"] = "shaolin/shanlu8",
		["southdown"] = "shaolin/shanlu6",
	},
}
Room {
	id = "shaolin/shanlu8",
	name = "ɽ·",
	ways = {
		["southwest"] = "shaolin/shanlu7",
		["e;w;e;s;e;n;n;e;w;s"] = "shaolin/qyping",
	},
	nolooks = {
		["east"] = true,
		["e;w;e;s;e;n;n;e;w;s"] = true,
	},
}
Room {
	id = "shaolin/shifang",
	name = "ʯ��",
	ways = {
		["south"] = "shaolin/shijie11",
		["north"] = "shaolin/guangchang",
	},
}
Room {
	id = "shaolin/shijie1",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/shijie2",
		["east"] = "shaolin/ruzhou",
		["west"] = "group/entry/slxiaoj1",
	},
	room_relative="ʯ�ס�ɽ��-----ʯ��-----���ݳ�ʯ��",
}
Room {
	id = "shaolin/shijie10",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/shijie11",
		["eastdown"] = "shaolin/shijie9",
	},
}
Room {
	id = "shaolin/shijie11",
	name = "ʯ��",
	ways = {
		["north"] = "shaolin/shifang",
		["southdown"] = "shaolin/shijie10",
	},
	room_relative="ʯ����ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie2",
	name = "ʯ��",
	ways = {
		["westup"] = "shaolin/shijie3",
		["southdown"] = "shaolin/shijie1",
	},
}
Room {
	id = "shaolin/shijie3",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/shijie4",
		["eastdown"] = "shaolin/shijie2",
	},
}
Room {
	id = "shaolin/shijie4",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/shijie5",
		["southdown"] = "shaolin/shijie3",
	},
	objs = {
          ["������"] = "fang tianlao",
           },
}
Room {
	id = "shaolin/shijie5",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/shijie6",
		["southdown"] = "shaolin/shijie4",
	},
}
Room {
	id = "shaolin/shijie6",
	name = "ʯ��",
	ways = {
		["westup"] = "shaolin/shijie7",
		["southdown"] = "shaolin/shijie5",
		["up"] = "songshan/shanlu1",
	},
	objs = {
          ["�����"] = "pan tiangeng",
           },
	room_relative="ɽ·��ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie7",
	name = "ʯ��",
	ways = {
		["eastdown"] = "shaolin/shijie6",
		["westup"] = "shaolin/shijie8",
	},
}
Room {
	id = "shaolin/shijie8",
	name = "ʯ��",
	ways = {
		["northup"] = "shaolin/ting",
		["eastdown"] = "shaolin/shijie7",
	},
	room_relative="ӭ��ͤ��ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie9",
	name = "ʯ��",
	ways = {
		["eastup"] = "shaolin/fxjing",
		["westup"] = "shaolin/shijie10",
		["southdown"] = "shaolin/ting",
	},
	room_relative="ʯ�ס�ʯ�ס����ľ���ӭ��ͤʯ��",
}
Room {
	id = "shaolin/shiting1",
	name = "ʯͤ",
	ways = {
		["north"] = "shaolin/shiting2",
	},
}
Room {
	id = "shaolin/shiting2",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting1",
		["north"] = "shaolin/shiting3",
	},
}
Room {
	id = "shaolin/shiting3",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting2",
		["north"] = "shaolin/shiting4",
	},
}
Room {
	id = "shaolin/shiting4",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting3",
		["north"] = "shaolin/shiting5",
	},
}
Room {
	id = "shaolin/shiting5",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting4",
		["north"] = "shaolin/shiting6",
	},
}
Room {
	id = "shaolin/shiting6",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting5",
		["north"] = "shaolin/shiting7",
	},
}
Room {
	id = "shaolin/shiting7",
	name = "ʯͤ",
	ways = {
		["south"] = "shaolin/shiting6",
	},
}
Room {
	id = "shaolin/slyuan",
	name = "����Ժ",
	no_fight = true,
	ways = {
		["east"] = "shaolin/huaishu4",
		["open door;w;ne;n;nw;sw;w;ne;w;s;nw;sw;n"] = "shaolin/fotaout",
		["west"] = "shaolin/talin1",
	},   
	precmds = {
		["west"] = "open door",
	},
        lengths = {
		["open door;w;ne;n;nw;sw;w;ne;w;s;nw;sw;n"] = 13,
	},
}
Room {
	id = "shaolin/talin1",
	name = "����",
	ways = {
	    ["east"] = "shaolin/slyuan",
		["northeast"] = "shaolin/talin2",
	},
	precmds = {
	    ["east"] = "open door",
	},
}
Room {
	id = "shaolin/talin2",
	name = "����",
	ways = {
	    ["north"] = "shaolin/talin3",
		["southeast"] = "shaolin/talin1",
	},
}
Room {
	id = "shaolin/talin3",
	name = "����",
	ways = {
	    ["south"] = "shaolin/talin2",
		["northwest"] = "shaolin/talin4",
	},
}
Room {
	id = "shaolin/talin4",
	name = "����",
	ways = {
	    ["southeast"] = "shaolin/talin3",
		["southwest"] = "shaolin/talin5",
	},
}
Room {
	id = "shaolin/talin5",
	name = "����",
	ways = {
	    ["northeast"] = "shaolin/talin4",
		["west"] = "shaolin/talin6",
	},
}
Room {
	id = "shaolin/talin6",
	name = "����",
	ways = {
	    ["northeast"] = "shaolin/talin7",
		["east"] = "shaolin/talin5",
	},
}
Room {
	id = "shaolin/talin7",
	name = "����",
	ways = {
	    ["west"] = "shaolin/talin8",
		["southwest"] = "shaolin/talin6",
	},
}
Room {
	id = "shaolin/talin8",
	name = "����",
	ways = {
	    ["south"] = "shaolin/talin9",
		["east"] = "shaolin/talin7",
	},
}
Room {
	id = "shaolin/talin9",
	name = "����",
	ways = {
	    ["northwest"] = "shaolin/talin10",
		["north"] = "shaolin/talin8",
	},
}
Room {
	id = "shaolin/talin10",
	name = "����",
	ways = {
	    ["southeast"] = "shaolin/talin9",
		["southwest"] = "shaolin/talin11",
	},
}
Room {
	id = "shaolin/talin11",
	name = "����",
	ways = {
	    ["northeast"] = "shaolin/talin10",
		["north"] = "shaolin/fotaout",
	},
}
Room {
	id = "shaolin/smdian",
	name = "ɽ�ŵ�",
	ways = {
		["south"] = "shaolin/guangchang",
		["north"] = "shaolin/gchang-1",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open gate",
	},
}
Room {
	id = "shaolin/songshu1",
	name = "������",
	ways = {
		["south"] = "shaolin/songshu2",
		["northwest"] = "shaolin/hguangz3",
		["east"] = "shaolin/yaowang",
	},
}
Room {
	id = "shaolin/songshu2",
	name = "������",
	ways = {
		["south"] = "shaolin/songshu3",
		["north"] = "shaolin/songshu1",
		["west"] = "shaolin/stoneroad1",
	},
}
Room {
	id = "shaolin/songshu3",
	name = "������",
	ways = {
		["southwest"] = "shaolin/celang2",
		["east"] = "shaolin/songshu4",
		["north"] = "shaolin/songshu2",
	},
}
Room {
	id = "shaolin/songshu4",
	name = "������",
	ways = {
		["east"] = "shaolin/jieluyua",
		["west"] = "shaolin/songshu3",
	},
	lengths = {
		["east"] = "if score.party and score.party=='������' and hp.shen>0 and skills['force'] and skills['force'].lvl<220 then return 1 else return false end",
	},
}
Room {
	id = "shaolin/stoneroad1",
	name = "ʯ��·",
	ways = {
		["south"] = "shaolin/daxiong",
		["east"] = "shaolin/songshu2",
		["north"] = "shaolin/dabeidia",
		["west"] = "shaolin/huaishu4",
	},
	room_relative="�󱯵��������----ʯ��·----�����֣����۱���ʯ��·",
	objs = {
          ["��������"] = "huiru zunzhe",
           },
}
Room {
	id = "shaolin/stoneroad2",
	name = "ʯ��·",
	ways = {
		["south"] = "shaolin/xianglu",
		["east"] = "shaolin/stoneroad3",
		["north"] = "shaolin/dxshijie",
		["west"] = "shaolin/stoneroad4",
	},
	room_relative="̨�ף�ʯ��·----ʯ��·----ʯ��·����¯ʯ��·",
	objs = {
          ["��ɫ����"] = "huise zunzhe",
           },
}
Room {
	id = "shaolin/stoneroad3",
	name = "ʯ��·",
	ways = {
		["north"] = "shaolin/celang2",
		["east"] = "shaolin/brtang",
		["west"] = "shaolin/stoneroad2",
	},
	room_relative="���ȣ�ʯ��·----ʯ��·----������ʯ��·",
}
Room {
	id = "shaolin/stoneroad4",
	name = "ʯ��·",
	ways = {
		["east"] = "shaolin/stoneroad2",
		["north"] = "shaolin/celang1",
		["west"] = "shaolin/lhtang",
	},
	room_relative="���ȣ��޺���----ʯ��·----ʯ��·ʯ��·",
}
Room {
	id = "shaolin/taijie",
	name = "̨��",
	ways = {
		["northup"] = "shaolin/lxting",
		["south"] = "shaolin/houdian",
	},
}

Room {
	id = "shaolin/tianming",
	name = "������̨",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/ting",
	name = "ӭ��ͤ",
	ways = {
		["#weaponUnWalk;northup;#weaponWWalk"] = "shaolin/shijie9",
		["northup"] = "shaolin/shijie9",
		["southdown"] = "shaolin/shijie8",
	},
	lengths = {
	    ["#weaponUnWalk;northup;#weaponWWalk"] = "if score.party~='������' then return 1 else return false end",
		["northup"] = "if score.party=='������' then return 1 else return false end",
	},
	objs = {
          ["����"] = "xu ming",
          ["������"] = "wei tianwang",
          ["��ͨ"] = "xu tong",
           },
}
Room {
	id = "shaolin/twdian",
	name = "������",
	ways = {
		["south"] = "shaolin/qdian",
		["north"] = "shaolin/sblu-1",
	},
	objs = {
          ["������ʦ"] = "daoguo chanshi",
           },
}
Room {
	id = "shaolin/woshi",
	name = "����",
	ways = {
		["south"] = "shaolin/xiaowu",
	},
}
Room {
	id = "shaolin/wstang1",
	name = "��ɮ��",
	ways = {
		["south"] = "shaolin/wstang2",
		["east"] = "shaolin/yanwutang",
	},
	objs = {
          ["Բ������"] = "yuanyin heshang",
           },
}
Room {
	id = "shaolin/wstang2",
	name = "��ɮ��",
	ways = {
		["south"] = "shaolin/wstang3",
		["north"] = "shaolin/wstang1",
	},
	objs = {
          ["Բ�ĺ���"] = "yuanxin heshang",
           },
}
Room {
	id = "shaolin/wstang3",
	name = "��ɮ��",
	ways = {
		["south"] = "shaolin/wstang4",
		["north"] = "shaolin/wstang2",
	},
	objs = {
          ["Բҵ����"] = "yuanye heshang",
           },
}
Room {
	id = "shaolin/wstang4",
	name = "��ɮ��",
	ways = {
		["south"] = "shaolin/wstang5",
		["north"] = "shaolin/wstang3",
	},
	objs = {
          ["Բ������"] = "yuanjue heshang",
           },
}
Room {
	id = "shaolin/wstang5",
	name = "��ɮ��",
	ways = {
		["south"] = "shaolin/wstang6",
		["north"] = "shaolin/wstang4",
	},
	objs = {
          ["Բ�ۺ���"] = "yuanhui heshang",
           },
}
Room {
	id = "shaolin/wstang6",
	name = "��ɮ��",
	ways = {
		["north"] = "shaolin/wstang5",
	},
	objs = {
          ["Բ�����"] = "yuanmie heshang",
           },
}
Room {
	id = "shaolin/wuqiku",
	name = "������",
	ways = {
		["south"] = "shaolin/lshuyuan",
	},
	objs = {
          ["������ʦ"] = "daochen chanshi",
           },
}
Room {
	id = "shaolin/wusetai",
	name = "��ɫ̨",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/wuxiangpai",
	name = "������",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/wuxing0",
	name = "���ж�",
	ways = {
		["south"] = "shaolin/wuxing3",
		["east"] = "shaolin/wuxing4",
		["north"] = "shaolin/wuxing2",
		["west"] = "shaolin/wuxing1",
	},
}
Room {
	id = "shaolin/wuxing1",
	name = "���ж�",
	ways = {
		["south"] = "shaolin/wuxing3",
		["north"] = "shaolin/wuxing2",
		["east"] = "shaolin/wuxing0",
		["west"] = "shaolin/wuxing4",
	},
}
Room {
	id = "shaolin/wuxing2",
	name = "���ж�",
	ways = {
		["south"] = "shaolin/wuxing4",
		["north"] = "shaolin/wuxing3",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/wuxing3",
	name = "���ж�",
	ways = {
		["south"] = "shaolin/wuxing2",
		["north"] = "shaolin/wuxing4",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/wuxing4",
	name = "���ж�",
	ways = {
		["south"] = "shaolin/wuxing3",
		["north"] = "shaolin/wuxing2",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/xclang",
	name = "ʯ��",
	ways = {
		["northwest"] = "shaolin/gygu",
		["east"] = "shaolin/xctang",
	},
}
Room {
	id = "shaolin/xcping",
	name = "����ƺ",
	ways = {
		["north"] = "shaolin/xctang",
		["west"] = "shaolin/fatang",
	},
	lengths = {
		["north"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	objs = {
          ["��������"] = "huiyun zunzhe",
           },
}
Room {
	id = "shaolin/xctang",
	name = "������",
	ways = {
		["south"] = "shaolin/xcping",
		["north"] = "shaolin/duanya",
		["west"] = "shaolin/xclang",
	},
	objs = {
          ["������ʦ"] = "fangsheng dashi",
           },
}
Room {
	id = "shaolin/xianglu",
	name = "��¯",
	ways = {
		["south"] = "shaolin/sblu-1",
		["north"] = "shaolin/stoneroad2",
	},
}
Room {
	id = "shaolin/xiaojin1",
	name = "С��",
	ways = {
		["south"] = "shaolin/houyuan",
		["jump out"] = "shaolin/cjlou1",
	},
	nolooks = {
		["jump out"] = true,
	},
}
Room {
	id = "shaolin/xiaojing2",
	name = "�﹡��",
	ways = {
		["southdown"] = "group/entry/slxiaoj1",
		["west"] = "shaolin/houshan",
	},
}
Room {
	id = "shaolin/xiaolu-1",
	name = "С·",
	ways = {
		["southeast"] = "shaolin/xiaolu-2",
		["north"] = "shaolin/chufang2",
	},
	room_relative="�������С·�KС·С·",
}
Room {
	id = "shaolin/xiaolu-2",
	name = "С·",
	ways = {
		["south"] = "shaolin/xiaolu-3",
		["northwest"] = "shaolin/xiaolu-1",
	},
	room_relative="С·�IС·��С·С·",
}
Room {
	id = "shaolin/xiaolu-3",
	name = "С·",
	ways = {
		["south"] = "shaolin/cyzi-1",
		["north"] = "shaolin/xiaolu-2",
	},
	room_relative="С·��С·����԰��С·",
}
Room {
	id = "shaolin/xiaolu1",
	name = "����С·",
	ways = {
		["east"] = "shaolin/xiaolu2",
		["west"] = "shaolin/sblu-2",
	},
	room_relative="ʯ��·---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu2",
	name = "����С·",
	ways = {
		["northeast"] = "shaolin/xiaolu3",
		["west"] = "shaolin/xiaolu1",
	},
	room_relative="����С·�J����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu3",
	name = "����С·",
	ways = {
		["southeast"] = "shaolin/xiaolu4",
		["southwest"] = "shaolin/xiaolu2",
	},
	room_relative="����С·�L�K����С·����С·����С·",
}
Room {
	id = "shaolin/xiaolu4",
	name = "����С·",
	ways = {
		["northwest"] = "shaolin/xiaolu3",
		["east"] = "shaolin/xiaoxi",
	},
	room_relative="����С·�I����С·---СϪ����С·",
}
Room {
	id = "shaolin/xiaolu5",
	name = "����С·",
	ways = {
		["east"] = "shaolin/sblu-2",
		["west"] = "shaolin/xiaolu6",
	},
	room_relative="����С·---����С·---ʯ��·����С·",
}
Room {
	id = "shaolin/xiaolu6",
	name = "����С·",
	ways = {
		["east"] = "shaolin/xiaolu5",
		["west"] = "shaolin/xiaolu7",
	},
	room_relative="����С·---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu7",
	name = "����С·",
	ways = {
		["east"] = "shaolin/xiaolu6",
		["west"] = "shaolin/fzjs",
	},
	room_relative="���ɾ���---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaowu",
	name = "С����",
	ways = {
		["south"] = "shaolin/houshan",
		["north"] = "shaolin/woshi",
	},
}
Room {
	id = "shaolin/xiaoxi",
	name = "СϪ",
	ways = {
		["west"] = "shaolin/xiaolu4",
		["jump river"] = "shaolin/xiaoxi1",
	},
	nolooks = {
		["jump river"] = true,
	},
}
Room {
	id = "shaolin/xiaoxi1",
	name = "Ϫ�Կյ�",
	ways = {
		["enter"] = "shaolin/cjlou",
		["jump river"] = "shaolin/xiaoxi",
	},
	nolooks = {
		["jump river"] = true,
	},
}
Room {
	id = "shaolin/xjchu",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/zhaitang",
	},
}
Room {
	id = "shaolin/xumidian",
	name = "���ֵ�",
	ways = {
		["east"] = "shaolin/dabeidia",
	},
	objs = {
          ["ľ���"] = "muyu chui",
           },
}
Room {
	id = "shaolin/yading",
	name = "�¶�",
	ways = {
		["enter"] = "shaolin/houshand",
		["down"] = "shaolin/duanya",
	},
}
Room {
	id = "shaolin/yanwutang",
	name = "������",
	ways = {
		["east"] = "shaolin/luohan5",
		["west"] = "shaolin/wstang1",
	},
	lengths = {
		["west"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
}
Room {
	id = "shaolin/yaowang",
	name = "ҩ��Ժ",
	ways = {
		["west"] = "shaolin/songshu1",
	},
	objs = {
          ["������ʦ"] = "daoxiang chanshi",
           },
}
Room {
	id = "shaolin/zdyuan",
	name = "֤��Ժ",
	ways = {
		["east"] = "shaolin/celang-2",
		["west"] = "shaolin/chanfang-1",
	},
	objs = {
          ["�Ż�����"] = "jiuhuan xizhang",
		  ["������ʦ"] = "xuansheng dashi",
           },
}
Room {
	id = "shaolin/zhaitang",
	name = "ի��",
	ways = {
		["north"] = "shaolin/xjchu",
		["east"] = "shaolin/fanting1",
		["west"] = "shaolin/celang-4",
	},
	objs = {
          ["�۽�����"] = "huijie zunzhe",
           },
}
Room {
	id = "shaolin/zhlou1",
	name = "��¥һ��",
	ways = {
		["out"] = "shaolin/zhonglou",
		["up"] = "shaolin/zhlou2",
	},
}
Room {
	id = "shaolin/zhlou2",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/zhlou1",
		["up"] = "shaolin/zhlou3",
	},
}
Room {
	id = "shaolin/zhlou3",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/zhlou2",
		["up"] = "shaolin/zhlou4",
	},
}
Room {
	id = "shaolin/zhlou4",
	name = "��¥�Ĳ�",
	ways = {
		["down"] = "shaolin/zhlou3",
		["up"] = "shaolin/zhlou5",
	},
}
Room {
	id = "shaolin/zhlou5",
	name = "��¥���",
	ways = {
		["down"] = "shaolin/zhlou4",
		["up"] = "shaolin/zhlou6",
	},
}
Room {
	id = "shaolin/zhlou6",
	name = "��¥����",
	ways = {
		["down"] = "shaolin/zhlou5",
		["up"] = "shaolin/zhlou7",
	},
}
Room {
	id = "shaolin/zhlou7",
	name = "��¥�߲�",
	ways = {
		["down"] = "shaolin/zhlou6",
	},
	objs = {
          ["��������"] = "qingxiao biqiu",
           },
}
Room {
	id = "shaolin/zhonglou",
	name = "��¥СԺ",
	ways = {
		["enter"] = "shaolin/zhlou1",
		["west"] = "shaolin/celang-3",
	},
}
Room {
	id = "shaolin/zhushe",
	name = "����",
	ways = {
		["southeast"] = "shaolin/houshan",
	},
}
Room {
	id = "sld/blm",
	name = "������������",
	ways = {
		["east"] = "sld/blmws",
		["west"] = "sld/blmlgf",
		["out"] = "sld/sanpo6",
	},
	objs = {
          ["��־��"] = "zhong zhiling",
          ["�����ŵ���"] = "white dizi",
           },
}
Room {
	id = "sld/blmlgf",
	name = "������",
	ways = {
		["east"] = "sld/blm",
	},
}
Room {
	id = "sld/blmws",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "sld/blm",
	},
}
Room {
	id = "sld/cf",
	name = "����",
	ways = {
		["west"] = "sld/th",
	},
}
Room {
	id = "sld/clm",
	name = "������������",
	ways = {
		["east"] = "sld/clmws",
		["west"] = "sld/clmlgf",
		["out"] = "sld/sanpo3",
	},
	objs = {
          ["�޸�����"] = "wugen daoren",
          ["�����ŵ���"] = "red dizi",
           },
}
Room {
	id = "sld/clmlgf",
	name = "������",
	ways = {
		["east"] = "sld/clm",
	},
}
Room {
	id = "sld/clmws",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "sld/clm",
	},
}
Room {
	id = "sld/dt",
	name = "����",
	ways = {
		["south"] = "sld/slj",
		["north"] = "sld/th",
	},
	objs = {
          ["��ͷ��"] = "shou toutuo",
          ["�鰲ͨ"] = "hong antong",
          ["��̳����"] = "shenlong dizi",
          ["��ͷ��"] = "pang toutuo",
          ["����"] = "su quan",
           },
}
Room {
	id = "sld/dukou",
	name = "�ɿ�",
	ways = {
		["northwest"] = "sld/sandw",
		["north"] = "sld/trees1",
		["northeast"] = "sld/sande",
	},
	objs = {
          ["����"] = "chuan fu",
           },
}
Room {
	id = "sld/haitan",
	name = "��̲",
	ways = {
		["southwest"] = "sld/xiaolu",
		["#toSld"] = "sld/dukou",
	},
	nolooks = {
		["#toSld"] = true,
	},
	lengths = {
		["#toSld"] = 100,
	},
}
Room {
	id = "sld/hlm",
	name = "������������",
	ways = {
		["east"] = "sld/hlmws",
		["west"] = "sld/hlmlgf",
		["out"] = "sld/sanpo2",
	},
	objs = {
          ["�ŵ���"] = "zhang danyue",
          ["�����ŵ���"] = "black dizi",
           },
}
Room {
	id = "sld/hlmlgf",
	name = "������",
	ways = {
		["east"] = "sld/hlm",
	},
}
Room {
	id = "sld/hlmws",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "sld/hlm",
	},
}
Room {
	id = "sld/ht",
	name = "����",
	ways = {
		["south"] = "sld/th",
	},
}
Room {
	id = "sld/hulm",
	name = "������������",
	ways = {
		["east"] = "sld/hulmws",
		["west"] = "sld/hulmlgf",
		["out"] = "sld/sanpo4",
	},
	objs = {
          ["���"] = "yin jin",
          ["�����ŵ���"] = "yellow dizi",
           },
}
Room {
	id = "sld/hulmlgf",
	name = "������",
	ways = {
		["east"] = "sld/hulm",
	},
}
Room {
	id = "sld/hulmws",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "sld/hulm",
	},
}
Room {
	id = "sld/jitan",
	name = "��̳",
	ways = {
		["out"] = "sld/pt",
	},
}
Room {
	id = "sld/kongdi",
	name = "�ּ�յ�",
	ways = {
		["northup"] = "sld/sanroad1",
		["south"] = "sld/trees2",
		["enter"] = "sld/lgxroom",
		["north"] = "sld/treen2",
	},
	objs = {
          ["�����̵������԰�"] = "board",
           },
}
Room {
	id = "sld/lgf",
	name = "������",
	ways = {
		["south"] = "sld/road2",
	},
	objs = {
          ["˫��"] = "shuang gou",
           },
}
Room {
	id = "sld/lgxroom",
	name = "½������",
	ways = {
		["east"] = "sld/lgxys",
		["north"] = "sld/lgxws",
		["out"] = "sld/kongdi",
		["#outSld"] = "huanghe/huanghe8",
	},
	objs = {
          ["½����"] = "lu gaoxuan",
           },
	lengths = {
		["#outSld"] = "if locl.area and locl.area=='������' and locl.room~='��̲' and locl.room~='�ۿ�' and locl.room~='С·' then return 10000 else return false end",
	},
}
Room {
	id = "sld/lgxws",
	name = "����",
	ways = {
		["south"] = "sld/lgxroom",
	},
}
Room {
	id = "sld/lgxys",
	name = "ҩ��",
	ways = {
		["west"] = "sld/lgxroom",
	},
	objs = {
          ["ҩ��"] = "yaogui",
           },
}
Room {
	id = "sld/pt",
	name = "ƽ̨",
	ways = {
		["enter"] = "sld/jitan",
		["east"] = "sld/zl2",
	},
}
Room {
	id = "sld/qlm",
	name = "������������",
	ways = {
		["east"] = "sld/qlmws",
		["west"] = "sld/qlmlgf",
		["out"] = "sld/sanpo5",
	},
	objs = {
          ["��ѩͤ"] = "xu xueting",
          ["�����ŵ���"] = "green dizi",
    },
}
Room {
	id = "sld/qlmlgf",
	name = "������",
	ways = {
		["east"] = "sld/qlm",
	},
}
Room {
	id = "sld/qlmws",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "sld/qlm",
	},
}
Room {
	id = "sld/road1",
	name = "����",
	ways = {
		["south"] = "sld/ws",
		["east"] = "sld/slj",
		["west"] = "sld/road2",
	},
}
Room {
	id = "sld/road2",
	name = "����",
	ways = {
		["east"] = "sld/road1",
		["north"] = "sld/lgf",
		["west"] = "sld/tz",
	},
}
Room {
	id = "sld/sande",
	name = "ɳ̲",
	ways = {
		["southwest"] = "sld/dukou",
		["northwest"] = "sld/sandn",
		["west"] = "sld/treee1",
	},
}
Room {
	id = "sld/sandn",
	name = "ɳ̲",
	ways = {
		["southeast"] = "sld/sande",
		["southwest"] = "sld/sandw",
		["south"] = "sld/treen1",
	},
}
Room {
	id = "sld/sandw",
	name = "ɳ̲",
	ways = {
		["southeast"] = "sld/dukou",
		["east"] = "sld/treew1",
		["northeast"] = "sld/sandn",
	},
}
Room {
	id = "sld/sanpo1",
	name = "ɽ��",
	ways = {
		["eastup"] = "sld/sanroad5",
		["north"] = "sld/sanroad6",
		["down"] = "sld/sanroad2",
	},
}
Room {
	id = "sld/sanpo2",
	name = "ɽ��",
	ways = {
		["westdown"] = "sld/sanroad4",
		["enter"] = "sld/hlm",
	},
	room_relative="��������������ɽ·��ɽ��ɽ��",
}
Room {
	id = "sld/sanpo3",
	name = "ɽ��",
	ways = {
		["southup"] = "sld/sanroad7",
		["enter"] = "sld/clm",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo4",
	name = "ɽ��",
	ways = {
		["enter"] = "sld/hulm",
		["southdown"] = "sld/sanroad9",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo5",
	name = "ɽ��",
	ways = {
		["southup"] = "sld/sanroad8",
		["enter"] = "sld/qlm",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo6",
	name = "ɽ��",
	ways = {
		["westdown"] = "sld/sanroad8",
		["enter"] = "sld/blm",
		["north"] = "sld/sanroada",
	},
	--room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanroad1",
	name = "ɽ·",
	ways = {
		["southdown"] = "sld/kongdi",
		["up"] = "sld/sanroad2",
	},
}
Room {
	id = "sld/sanroad2",
	name = "ɽ·",
	ways = {
		["northup"] = "sld/sanroad3",
		["down"] = "sld/sanroad1",
		["up"] = "sld/sanpo1",
	},
}
Room {
	id = "sld/sanroad3",
	name = "ɽ·",
	ways = {
		["eastup"] = "sld/sanroad4",
		["southdown"] = "sld/sanroad2",
	},
}
Room {
	id = "sld/sanroad4",
	name = "ɽ·",
	ways = {
		["westdown"] = "sld/sanroad3",
		["eastup"] = "sld/sanpo2",
	},
}
Room {
	id = "sld/sanroad5",
	name = "ɽ·",
	ways = {
		["northup"] = "sld/sanroad9",
		["eastup"] = "sld/sanroad8",
		["westdown"] = "sld/sanpo1",
	},
}
Room {
	id = "sld/sanroad6",
	name = "ɽ·",
	ways = {
		["south"] = "sld/sanpo1",
		["northdown"] = "sld/sanroad7",
	},
}
Room {
	id = "sld/sanroad7",
	name = "ɽ·",
	ways = {
		["southup"] = "sld/sanroad6",
		["northdown"] = "sld/sanpo3",
	},
}
Room {
	id = "sld/sanroad8",
	name = "ɽ·",
	ways = {
		["westdown"] = "sld/sanroad5",
		["eastup"] = "sld/sanpo6",
		["northdown"] = "sld/sanpo5",
	},
}
Room {
	id = "sld/sanroad9",
	name = "ɽ·",
	ways = {
		["northup"] = "sld/sanpo4",
		["eastup"] = "sld/sanpo7",
		["southdown"] = "sld/sanroad5",
	},
}
Room {
	id = "sld/sanroada",
	name = "ɽ·",
	ways = {
		["south"] = "sld/sanpo6",
		["up"] = "sld/sanroadb",
	},
}
Room {
	id = "sld/sanroadb",
	name = "ɽ·",
	ways = {
		["down"] = "sld/sanroada",
		["up"] = "sld/sfd",
	},
}
Room {
	id = "sld/sfd",
	name = "ɽ�嶥",
	ways = {
		["enter"] = "sld/slj",
		["down"] = "sld/sanroadb",
	},
}
Room {
	id = "sld/sanpo7",
	name = "ɽ��",
	ways = {
		["westdown"] = "sld/sanroad9",
		["#Insldsk"] = "sld/sheku",
	},
	nolooks = {
		["#Insldsk"] = true,
	},
	lengths = {
		["#Insldsk"] = "if hp.exp>2000000 and inwdj==1 or skills['poison'] and skills['poison'].lvl>100 then return 20 else return false end",
	},
}
Room {
	id = "sld/sheku",
	name = "�߿�",
	ways = {
		["#Outsldsk"] = "sld/treen1",
	},
	nolooks = {
		["#Outsldsk"] = true,
	},
	objs = {
          ["�������"] = "shen long",
          ["����"] = "du she",
    },
}
Room {
	id = "sld/slj",
	name = "����",
	ways = {
		["north"] = "sld/dt",
		["west"] = "sld/road1",
		["out"] = "sld/sfd",
	},
}
Room {
	id = "sld/th",
	name = "����",
	ways = {
		["south"] = "sld/dt",
		["north"] = "sld/ht",
		["east"] = "sld/cf",
	},
}
Room {
	id = "sld/treee1",
	name = "����",
	ways = {
		["southwest"] = "sld/trees2",
		["northwest"] = "sld/treen2",
		["east"] = "sld/sande",
	},
}
Room {
	id = "sld/treen1",
	name = "����",
	ways = {
		["southeast"] = "sld/treee1",
		["southwest"] = "sld/treew1",
		["south"] = "sld/treen2",
		["north"] = "sld/sandn",
	},
}
Room {
	id = "sld/treen2",
	name = "����",
	ways = {
		["southeast"] = "sld/treee1",
		["southwest"] = "sld/treew1",
		["south"] = "sld/kongdi",
		["north"] = "sld/treen1",
	},
}
Room {
	id = "sld/trees1",
	name = "����",
	ways = {
		["south"] = "sld/dukou",
		["northwest"] = "sld/treew1",
		["north"] = "sld/trees2",
		["northeast"] = "sld/treee1",
	},
}
Room {
	id = "sld/trees2",
	name = "����",
	ways = {
		["south"] = "sld/trees1",
		["northwest"] = "sld/treew1",
		["north"] = "sld/kongdi",
		["northeast"] = "sld/treee1",
	},
}
Room {
	id = "sld/treew1",
	name = "����",
	ways = {
		["southeast"] = "sld/trees2",
		["northeast"] = "sld/treen2",
		["west"] = "sld/sandw",
	},
}
Room {
	id = "sld/tz",
	name = "����",
	ways = {
		["east"] = "sld/road2",
		["out"] = "sld/zl1",
	},
}
Room {
	id = "sld/ws",
	name = "����",
	no_fight = true,
	ways = {
		["north"] = "sld/road1",
	},
}
Room {
	id = "sld/xiaolu",
	name = "С·",
	ways = {
		["southwest"] = "tanggu/gangkou",
		["northeast"] = "sld/haitan",
	},
}
Room {
	id = "sld/yaopu1",
	name = "ҩ��",
	ways = {
		["south"] = "sld/zl1",
		["north"] = "sld/yaopu2",
		["west"] = "sld/yaopu6",
	},
}
Room {
	id = "sld/yaopu2",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu1",
		["north"] = "sld/yaopu3",
		["west"] = "sld/yaopu5",
	},
}
Room {
	id = "sld/yaopu3",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu2",
		["west"] = "sld/yaopu4",
	},
}
Room {
	id = "sld/yaopu4",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu5",
		["east"] = "sld/yaopu3",
		["west"] = "sld/yaopu9",
	},
}
Room {
	id = "sld/yaopu5",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu6",
		["north"] = "sld/yaopu4",
		["east"] = "sld/yaopu2",
		["west"] = "sld/yaopu8",
	},
}
Room {
	id = "sld/yaopu6",
	name = "ҩ��",
	ways = {
		["north"] = "sld/yaopu5",
		["east"] = "sld/yaopu1",
		["west"] = "sld/yaopu7",
	},
}
Room {
	id = "sld/yaopu7",
	name = "ҩ��",
	ways = {
		["north"] = "sld/yaopu8",
		["east"] = "sld/yaopu6",
	},
}
Room {
	id = "sld/yaopu8",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu7",
		["north"] = "sld/yaopu9",
		["east"] = "sld/yaopu5",
	},
}
Room {
	id = "sld/yaopu9",
	name = "ҩ��",
	ways = {
		["south"] = "sld/yaopu8",
		["east"] = "sld/yaopu4",
	},
}
Room {
	id = "sld/zl1",
	name = "����",
	ways = {
		["enter"] = "sld/tz",
		["west"] = "sld/zl2",
	},
}
Room {
	id = "sld/zl2",
	name = "����",
	ways = {
		["east"] = "sld/zl1",
		["west"] = "sld/pt",
	},
}
Room {
	id = "songshan/cangshu-ge",
	name = "�����",
	ways = {
		["south"] = "songshan/yushu-lou",
	},
}
Room {
	id = "songshan/chanyuan",
	name = "������Ժ",
	ways = {
		["south"] = "songshan/damen",
		["north"] = "songshan/shidao1",
	},
	objs = {
          ["����"] = "ding mian",
     },
}
Room {
	id = "songshan/ctmen",
	name = "������",
	ways = {
		["southeast"] = "songshan/shanlu4",
		["northeast"] = "songshan/shanlu5",
	},
	objs = {
          ["½��"] = "lu bo",
    },
}
Room {
	id = "songshan/damen",
	name = "����������",
	no_fight = true,
	ways = {
		["south"] = "songshan/kuangdi",
		["north"] = "songshan/chanyuan",
	},
	objs = {
          ["ʷ�Ǵ�"] = "shi dengda",
          ["������"] = "han xiongwang",
     },
}
Room {
	id = "songshan/dtlxia",
	name = "������Ͽ",
	ways = {
		["northup"] = "songshan/xtlxia",
		["southdown"] = "songshan/qgping",
	},
	objs = {
          ["�ֺ�"] = "le hou",
     },
}
Room {
	id = "songshan/fengchantai",
	name = "����̨",
	ways = {
		["southdown"] = "songshan/peitian-fang",
		["guan ri"] = "songshan/guanrifeng",
	},
	nolooks = {
		["guan ri"] = true,
	},
	lengths = {
		["guan ri"] = "if score.party and score.party=='��ɽ��' then return 1 else return false end",
	},
	objs = {
          ["����"] = "lv cai",
          ["����"] = "you shou",
          ["����"] = "shen luo",
          ["������"] = "zuo lengchan",
     },
}
Room {
	id = "songshan/gsfxia",
	name = "��ʤ����",
	ways = {
		["southeast"] = "songshan/shanlu2",
		["westup"] = "songshan/guanshengfeng",
	},
	objs = {
          ["�°�"] = "chen an",
     },
}
Room {
	id = "songshan/guanrifeng",
	name = "���շ�",
	ways = {
		["west"] = "songshan/fengchantai",
	},
}
Room {
	id = "songshan/guanshengfeng",
	name = "��ʤ��",
	ways = {
		["eastdown"] = "songshan/gsfxia",
		["northdown"] = "songshan/shanlu3",
	},
}
Room {
	id = "songshan/jiange",
	name = "��ԯ����",
	ways = {
		["north"] = "songshan/yushu-lou",
	},
	objs = {
          ["��˳��"] = "qin shunchang",
     },
}
Room {
	id = "songshan/junji-dian",
	name = "������",
	ways = {
		["northup"] = "songshan/shidao3",
		["south"] = "songshan/junji-fang",
		["east"] = "songshan/suishilu3",
		["west"] = "songshan/suishilu4",
	},
	objs = {
          ["����"] = "zhong zhen",
          ["����"] = "jiang xiang",
          ["������"] = "liu huahui",
     },
}
Room {
	id = "songshan/junji-fang",
	name = "��߾�����",
	ways = {
		["north"] = "songshan/junji-dian",
		["southdown"] = "songshan/shidao2",
	},
}
Room {
	id = "songshan/kuangdi",
	name = "����",
	ways = {
		["south"] = "songshan/taishi-que",
		["north"] = "songshan/damen",
	},
}
Room {
	id = "songshan/nan-room",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "songshan/qindian",
	},
}
Room {
	id = "songshan/nv-room",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "songshan/qindian",
	},
}
Room {
	id = "songshan/peitian-fang",
	name = "��������",
	ways = {
		["northup"] = "songshan/fengchantai",
		["southdown"] = "songshan/shidao3",
	},
}
Room {
	id = "songshan/qgfeng",
	name = "��ڷ�",
	ways = {
		["northup"] = "songshan/qgping",
		["southdown"] = "songshan/shanlu3",
	},
	objs = {
          ["����"] = "di xiu",
     },
}
Room {
	id = "songshan/qgping",
	name = "���ƺ",
	ways = {
		["northup"] = "songshan/dtlxia",
		["southdown"] = "songshan/qgfeng",
	},
}
Room {
	id = "songshan/qindian",
	name = "�޵�",
	ways = {
		["south"] = "songshan/nan-room",
		["east"] = "songshan/zmwshi",
		["north"] = "songshan/nv-room",
		["west"] = "songshan/suishilu3",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	objs = {
          ["�߿���"] = "gao kexin",
     },
}
Room {
	id = "songshan/shanfang",
	name = "�ŷ�",
	no_fight = true,
	ways = {
		["west"] = "songshan/suishilu1",
	},
	objs = {
          ["����"] = "chu zi",
     },
}
Room {
	id = "songshan/shanlu1",
	name = "ɽ·",
	ways = {
		["down"] = "shaolin/shijie6",
		["west"] = "songshan/shanlu2",
	},
}
Room {
	id = "songshan/shanlu2",
	name = "ɽ·",
	ways = {
		["northwest"] = "songshan/gsfxia",
		["east"] = "songshan/shanlu1",
	},
}
Room {
	id = "songshan/shanlu3",
	name = "ɽ·",
	ways = {
		["northup"] = "songshan/qgfeng",
		["southup"] = "songshan/guanshengfeng",
	},
}
Room {
	id = "songshan/shanlu4",
	name = "ɽ·",
	ways = {
		["southeast"] = "songshan/xtlxia",
		["northwest"] = "songshan/ctmen",
	},
	objs = {
          ["���"] = "yu jin",
          ["����"] = "wang xiang",
     },
}
Room {
	id = "songshan/shanlu5",
	name = "ɽ·",
	ways = {
		["northup"] = "songshan/taishi-que",
		["southwest"] = "songshan/ctmen",
	},
}
Room {
	id = "songshan/shidao1",
	name = "ʯ��",
	ways = {
		["south"] = "songshan/chanyuan",
		["north"] = "songshan/yaocan-ting",
	},
}
Room {
	id = "songshan/shidao2",
	name = "ʯ��",
	ways = {
		["northup"] = "songshan/junji-fang",
		["south"] = "songshan/tianzhong-ge",
	},
}
Room {
	id = "songshan/shidao3",
	name = "ʯ��",
	ways = {
		["northup"] = "songshan/peitian-fang",
		["southdown"] = "songshan/junji-dian",
	},
}
Room {
	id = "songshan/shufang",
	name = "�����鷿",
	ways = {
		["east"] = "songshan/yushu-lou",
	},
}
Room {
	id = "songshan/suishilu1",
	name = "��ʯ·",
	ways = {
		["east"] = "songshan/shanfang",
		["west"] = "songshan/tianzhong-ge",
	},
}
Room {
	id = "songshan/suishilu2",
	name = "��ʯ·",
	ways = {
		["east"] = "songshan/tianzhong-ge",
		["west"] = "songshan/yaofang",
	},
}
Room {
	id = "songshan/suishilu3",
	name = "��ʯ·",
	ways = {
		["east"] = "songshan/qindian",
		["west"] = "songshan/junji-dian",
	},
}
Room {
	id = "songshan/suishilu4",
	name = "��ʯ·",
	ways = {
		["east"] = "songshan/junji-dian",
		["west"] = "songshan/yushu-lou",
	},
}
Room {
	id = "songshan/taishi-que",
	name = "̫����",
	ways = {
		["north"] = "songshan/kuangdi",
		["southdown"] = "songshan/shanlu5",
	},
	objs = {
          ["���ƽ"] = "wan daping",
     },
}
Room {
	id = "songshan/tianzhong-ge",
	name = "���и�",
	ways = {
		["south"] = "songshan/yaocan-ting",
		["east"] = "songshan/suishilu1",
		["north"] = "songshan/shidao2",
		["west"] = "songshan/suishilu2",
	},
	objs = {
          ["��Ӣ��"] = "tang yinge",
     },
}
Room {
	id = "songshan/xtlxia",
	name = "С����Ͽ",
	ways = {
		["northwest"] = "songshan/shanlu4",
		["southdown"] = "songshan/dtlxia",
	},
}
Room {
	id = "songshan/yaocan-ting",
	name = "ң��ͤ",
	ways = {
		["south"] = "songshan/shidao1",
		["north"] = "songshan/tianzhong-ge",
	},
	objs = {
          ["����"] = "bu chen",
     },
}
Room {
	id = "songshan/yaofang",
	name = "ҩ��",
	no_fight = true,
	ways = {
		["east"] = "songshan/suishilu2",
	},
	objs = {
          ["ҩʦ"] = "yao shi",
     },
}
Room {
	id = "songshan/yushu-lou",
	name = "����¥",
	ways = {
		["south"] = "songshan/jiange",
		["north"] = "songshan/cangshu-ge",
		["east"] = "songshan/suishilu4",
		["west"] = "songshan/shufang",
	},
	objs = {
          ["�˰˹�"] = "deng bagong",
     },
}
Room {
	id = "songshan/zmwshi",
	name = "��������",
	ways = {
		["west"] = "songshan/qindian",
	},
}
Room {
	id = "suzhou/bailianchi",
	name = "������",
	ways = {
		["south"] = "suzhou/erxianting",
	},
}
Room {
	id = "suzhou/baiyunquan",
	name = "����Ȫ",
	ways = {
		["westdown"] = "suzhou/tianpingshan",
	},
}
Room {
	id = "suzhou/baodaiqiao",
	name = "������",
	ways = {
		["south"] = "suzhou/nandajie1",
		["northwest"] = "suzhou/xidajie1",
		["north"] = "suzhou/canglangting",
		["northeast"] = "suzhou/dongdajie3",
	},
}
Room {
	id = "suzhou/baoheji",
	name = "���ͼ�",
	no_fight = true,
	ways = {
		["north"] = "suzhou/dongdajie3",
	},
	objs = {
          ["���ϼ�"] = "wang heji",
           },
}
Room {
	id = "suzhou/beidajie1",
	name = "�����",
	ways = {
		["southwest"] = "suzhou/xiyuanzi",
		["south"] = "suzhou/canglangting",
		["east"] = "suzhou/kedian",
		["north"] = "suzhou/beidajie2",
		["west"] = "suzhou/majiu",
	},
}
Room {
	id = "suzhou/beidajie2",
	name = "�����",
	ways = {
		["south"] = "suzhou/beidajie1",
		["north"] = "suzhou/northgate",
		["east"] = "suzhou/chunzailou",
		["west"] = "suzhou/zijinan",
	},
}
Room {
	id = "suzhou/bingyin",
	name = "��Ӫ",
	ways = {
		["north"] = "suzhou/bingyindamen",
	},
}
Room {
	id = "suzhou/bingyindamen",
	name = "��Ӫ����",
	ways = {
		["south"] = "suzhou/bingyin",
		["north"] = "suzhou/xidajie1",
	},
	blocks = {
		["south"] = {
			{id = "guan bing", exp = 10000},
		},
	},
}
Room {
	id = "suzhou/bingying",
	name = "���ű�Ӫ",
	ways = {
		["east"] = "suzhou/northgate",
		["west"] = "suzhou/jail",
	},
	blocks = {
		["west"] = {
			{id = "zhao liangdong", exp = 450000},
		},
	},
}
Room {
	id = "suzhou/bishuiting",
	name = "��ˮͤ",
	ways = {
		["south"] = "suzhou/huzhongdao",
	},
}
Room {
	id = "suzhou/caixiangjing",
	name = "���㾶",
	ways = {
		["northwest"] = "suzhou/shuiwa",
		["northeast"] = "suzhou/shuiwa1",
	},
}
Room {
	id = "suzhou/caizhu",
	name = "���ָ���",
	ways = {
		["south"] = "suzhou/wjszhuang",
		["north"] = "suzhou/dayuan1",
	},
	objs = {
          ["��Ȯ"] = "e quan",
           },
}
Room {
	id = "suzhou/cangjingge",
	name = "�ؾ���",
	ways = {
		["south"] = "suzhou/dxbdian",
	},
}
Room {
	id = "suzhou/canglangting",
	name = "����ͤ",
	ways = {
		["southeast"] = "suzhou/dongdajie3",
		["southwest"] = "suzhou/xidajie1",
		["south"] = "suzhou/baodaiqiao",
		["north"] = "suzhou/beidajie1",
	},
}
Room {
	id = "suzhou/caoebei",
	name = "�ܶ�",
	ways = {
		["east"] = "suzhou/nongshe",
		["north"] = "suzhou/jiangbian",
	},
}
Room {
	id = "suzhou/chaguan",
	name = "���",
	ways = {
		["southwest"] = "suzhou/nandajie1",
	},
}
Room {
	id = "suzhou/chitang",
	name = "����",
	ways = {
		["northeast"] = "suzhou/gumujiaohe",
	},
}
Room {
	id = "suzhou/chunzailou",
	name = "����¥",
	ways = {
		["west"] = "suzhou/beidajie2",
	},
}
Room {
	id = "suzhou/datiepu",
	name = "������",
	ways = {
		["north"] = "suzhou/dongdajie2",
	},
}
Room {
	id = "suzhou/dayuan1",
	name = "���ָ�Ժ",
	ways = {
		["south"] = "suzhou/caizhu",
		["north"] = "suzhou/houyuan",
	},
}
Room {
	id = "suzhou/dongdajie2",
	name = "�����",
	ways = {
		["south"] = "suzhou/datiepu",
		["northwest"] = "suzhou/hutong2",
		["north"] = "suzhou/lichuntang",
		["east"] = "suzhou/eastgate",
		["west"] = "suzhou/dongdajie3",
	},
}
Room {
	id = "suzhou/dongdajie3",
	name = "�����",
	ways = {
		["southwest"] = "suzhou/baodaiqiao",
		["south"] = "suzhou/baoheji",
		["northwest"] = "suzhou/canglangting",
		["north"] = "suzhou/hutong",
		["east"] = "suzhou/dongdajie2",
	},
}
Room {
	id = "suzhou/dongting",
	name = "���Ŷ���",
	ways = {
		["west"] = "suzhou/ymzhengting",
	},
}
Room {
	id = "suzhou/dongxiang",
	name = "�뷿",
	ways = {
		["south"] = "suzhou/houyuan",
		["west"] = "suzhou/huayuan",
	},
	precmds = {
		["west"] = "ask ling shuanghua about ����;#walkBusy",
	},
}
Room {
	id = "suzhou/dxbdian",
	name = "���۱���",
	ways = {
		["north"] = "suzhou/cangjingge",
		["out"] = "suzhou/lingyansi",
	},
}
Room {
	id = "suzhou/eastgate",
	name = "����",
	ways = {
		["west"] = "suzhou/dongdajie2",
	},
}
Room {
	id = "suzhou/erxianting",
	name = "����ͤ",
	ways = {
		["north"] = "suzhou/bailianchi",
		["west"] = "suzhou/qianrenshi",
	},
}
Room {
	id = "suzhou/fengqiao",
	name = "����",
	ways = {
		["south"] = "suzhou/hanshidian",
		["north"] = "suzhou/tielingguan",
	},
}
Room {
	id = "suzhou/gumujiaohe",
	name = "��ľ��ڭ",
	ways = {
		["southwest"] = "suzhou/chitang",
		["east"] = "suzhou/hehuating",
	},
}
Room {
	id = "suzhou/hanhanquan",
	name = "����Ȫ",
	ways = {
		["eastdown"] = "suzhou/wjszhuang",
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
           },
}
Room {
	id = "suzhou/hanshansi",
	name = "��ɽ����",
	ways = {
		["southeast"] = "suzhou/qsgdao5",
		["enter"] = "suzhou/zhengdian",
	},
}
Room {
	id = "suzhou/hanshidian",
	name = "��ʰ��",
	ways = {
		["west"] = "suzhou/zhengdian",
		["out"] = "suzhou/fengqiao",
	},
}
Room {
	id = "suzhou/hehuating",
	name = "�ɻ���",
	ways = {
		["east"] = "suzhou/liuyuan",
		["west"] = "suzhou/gumujiaohe",
	},
}
Room {
	id = "suzhou/houtang",
	name = "����",
	ways = {
		["out"] = "suzhou/shuchang",
	},
}
Room {
	id = "suzhou/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "suzhou/dayuan1",
		-- ["north"] = "suzhou/dongxiang",
	},
	objs = {
          ["����˼"] = "ling tuisi",
           },
}
Room {
	id = "suzhou/huayuan",
	name = "��԰",
	ways = {
		["east"] = "suzhou/dongxiang",
	},
}
Room {
	id = "suzhou/hubiandadao",
	name = "���ߴ��",
	ways = {
		["north"] = "suzhou/qingshidadao2",
		["west"] = "thd/guiyun/road1",
	},
}
Room {
	id = "suzhou/huqiushan",
	name = "����ɽ",
	ways = {
		["south"] = "suzhou/toushanmen",
		["northeast"] = "suzhou/qsgdao6",
	},
	objs = {
	      ["С��֦"] = "xiao shuzhi",
          ["������"] = "da shugan",
           },
}
Room {
	id = "suzhou/hutong",
	name = "��ͬ",
	ways = {
		["south"] = "suzhou/dongdajie3",
		["northeast"] = "suzhou/hutong1",
	},
}
Room {
	id = "suzhou/hutong1",
	name = "��ͬ",
	ways = {
		["southwest"] = "suzhou/hutong",
		["east"] = "suzhou/hutong2",
	},
}
Room {
	id = "suzhou/hutong2",
	name = "��ͬ",
	ways = {
		["southeast"] = "suzhou/dongdajie2",
		["west"] = "suzhou/hutong1",
	},
}
Room {
	id = "suzhou/huzhongdao",
	name = "���е�",
	ways = {
		["north"] = "suzhou/bishuiting",
	},
}
Room {
	id = "suzhou/jail",
	name = "����",
	ways = {
		["east"] = "suzhou/bingying",
	},
	objs = {
          ["����"] = "ding dian",
           },
}
Room {
	id = "suzhou/jiangbian",
	name = "����",
	ways = {
		["south"] = "suzhou/caoebei",
		["northeast"] = "group/entry/sztulu2",
	},
}
Room {
	id = "suzhou/jubaozhai",
	name = "�۱�ի",
	ways = {
		["east"] = "suzhou/nandajie1",
	},
	objs = {
          ["���ϰ�"] = "sun laoban",
           },
}
Room {
	id = "suzhou/kedian",
	name = "�͵�",
	ways = {
		["#szkdout"] = "suzhou/beidajie1",
		["#szkedian"] = "suzhou/kedian2",
	},
	nolooks = {
		["#szkedian"] = true,
	},
	lengths = {
		["#szkedian"] = 3,
	},
}
Room {
	id = "suzhou/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "suzhou/kedian3",
		["down"] = "suzhou/kedian",
	},
}
Room {
	id = "suzhou/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "suzhou/kedian2",
	},
}
Room {
	id = "suzhou/lichuntang",
	name = "������",
	ways = {
		["south"] = "suzhou/dongdajie2",
	},
}
Room {
	id = "suzhou/lingyanshan",
	name = "����ɽ",
	ways = {
		["eastup"] = "suzhou/yingxiaoting",
		["south"] = "suzhou/qingshidadao",
		["northwest"] = "suzhou/tianpingshan",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
          ["��ʯͷ"] = "da shitou",
           },
}
Room {
	id = "suzhou/lingyansi",
	name = "������",
	ways = {
		["enter"] = "suzhou/dxbdian",
		["east"] = "suzhou/lingyanta",
		["northdown"] = "suzhou/shiyuan",
		["west"] = "suzhou/zhonglou",
	},
}
Room {
	id = "suzhou/lingyanta",
	name = "������",
	ways = {
		["west"] = "suzhou/lingyansi",
	},
}
Room {
	id = "suzhou/liuyuan",
	name = "��԰",
	ways = {
		["east"] = "suzhou/nandajie2",
		["west"] = "suzhou/hehuating",
	},
}
Room {
	id = "suzhou/lixuetang",
	name = "��ѩ��",
	ways = {
		["north"] = "suzhou/wenmeige",
	},
}
Room {
	id = "suzhou/majiu",
	name = "���",
	ways = {
		["south"] = "suzhou/xiyuanzi",
		["east"] = "suzhou/beidajie1",
	},
}
Room {
	id = "suzhou/mubei",
	name = "��Ĺ",
	ways = {
		["northeast"] = "suzhou/shiyuan",
	},
}
Room {
	id = "suzhou/muniangmu",
	name = "����Ĺ",
	ways = {
		["southwest"] = "suzhou/shijianshi",
		["north"] = "suzhou/sunwuting",
	},
}
Room {
	id = "suzhou/nandajie1",
	name = "�ϴ��",
	ways = {
		["southwest"] = "suzhou/shuyuan",
		["south"] = "suzhou/nandajie2",
		["east"] = "suzhou/shizilin",
		["north"] = "suzhou/baodaiqiao",
		["northeast"] = "suzhou/chaguan",
		["west"] = "suzhou/jubaozhai",
	},
}
Room {
	id = "suzhou/nandajie2",
	name = "�ϴ��",
	ways = {
		["south"] = "suzhou/southgate",
		["east"] = "suzhou/tingyuxuan",
		["north"] = "suzhou/nandajie1",
		["west"] = "suzhou/liuyuan",
	},
}
Room {
	id = "suzhou/neizhai",
	name = "������լ",
	ways = {
		["south"] = "suzhou/ymzhengting",
	},
}
Room {
	id = "suzhou/nongshe",
	name = "ũ��",
	ways = {
		["west"] = "suzhou/caoebei",
	},
	objs = {
          ["����"] = "a xiang",
           },
}
Room {
	id = "suzhou/northgate",
	name = "����",
	ways = {
		["south"] = "suzhou/beidajie2",
		["north"] = "suzhou/qsgdao6",
		["west"] = "suzhou/bingying",
	},
}
Room {
	id = "suzhou/qianrenshi",
	name = "ǧ��ʯ",
	ways = {
		["northwest"] = "suzhou/zhishuangge",
		["north"] = "suzhou/shijianshi",
		["east"] = "suzhou/erxianting",
	},
}
Room {
	id = "suzhou/qingshidadao",
	name = "��ʯ���",
	ways = {
		["south"] = "suzhou/qingshidadao1",
		["north"] = "suzhou/lingyanshan",
		["east"] = "mr/hubian",
	},
	room_relative="����ɽ����ʯ���---���ߣ���ʯ�����ʯ���",
}
Room {
	id = "suzhou/qingshidadao1",
	name = "��ʯ���",
	ways = {
		["south"] = "suzhou/qingshidadao2",
		["north"] = "suzhou/qingshidadao",
	},
	room_relative="��ʯ�������ʯ�������ʯ�����ʯ���",
}
Room {
	id = "suzhou/qingshidadao2",
	name = "��ʯ���",
	ways = {
		["south"] = "suzhou/hubiandadao",
		["north"] = "suzhou/qingshidadao1",
	},
	room_relative="��ʯ�������ʯ��������ߴ����ʯ���",
}
Room {
	id = "suzhou/qsgdao",
	name = "��ʯ�ٵ�",
	ways = {
		["southwest"] = "suzhou/tianpingshan",
		["north"] = "suzhou/qsgdao1",
	},
	room_relative="��ʯ�ٵ�����ʯ�ٵ��L��ƽɽ��ʯ�ٵ�",
}
Room {
	id = "suzhou/qsgdao1",
	name = "��ʯ�ٵ�",
	ways = {
		["southwest"] = "suzhou/qsgdao2",
		["south"] = "suzhou/qsgdao",
	},
	room_relative="��ʯ�ٵ��L����ʯ�ٵ���ʯ�ٵ���ʯ�ٵ�",
}
Room {
	id = "suzhou/qsgdao2",
	name = "��ʯ�ٵ�",
	ways = {
		["southeast"] = "jiaxing/road2",
		["southwest"] = "hz/shanlu1",
		["north"] = "suzhou/southgate",
		["northeast"] = "suzhou/qsgdao1",
	},
	room_relative="������ʯ�ٵ����J��ʯ�ٵ��L�Kɽ·��ʯ�ٵ���ʯ�ٵ�",
	objs = {
          ["Ұ��"] = "ye tu",
           },
}
Room {
	id = "suzhou/qsgdao3",
	name = "���Źٵ�",
	ways = {
		["east"] = "suzhou/qsgdao4",
		["west"] = "suzhou/qsgdao5",
	},
}
Room {
	id = "suzhou/qsgdao4",
	name = "������ٵ�",
	ways = {
		["east"] = "suzhou/westgate",
		["west"] = "suzhou/qsgdao3",
	},
}
Room {
	id = "suzhou/qsgdao5",
	name = "������",
	ways = {
		["south"] = "suzhou/tulu1",
		["northwest"] = "suzhou/hanshansi",
		["east"] = "suzhou/qsgdao3",
	},
}
Room {
	id = "suzhou/qsgdao6",
	name = "���ݱ���",
	ways = {
		["southwest"] = "suzhou/huqiushan",
		["south"] = "suzhou/northgate",
		["northwest"] = "city/sroad1",
		["west"] = "gb/tianjing",
	},
}
Room {
	id = "suzhou/shihu",
	name = "ʯ��",
	ways = {
		["south"] = "suzhou/tianpingshan",
		["west"] = "suzhou/xingchunqiao",
	},
}
Room {
	id = "suzhou/shijianshi",
	name = "�Խ�ʯ",
	ways = {
		["westdown"] = "suzhou/wjszhuang",
		["south"] = "suzhou/qianrenshi",
		["north"] = "suzhou/zhenshi",
		["northeast"] = "suzhou/muniangmu",
	},
}
Room {
	id = "suzhou/shiyuan",
	name = "ʯ��",
	ways = {
		["southup"] = "suzhou/lingyansi",
		["eastdown"] = "suzhou/shuiwa",
		["westdown"] = "suzhou/shuiwa1",
		["southwest"] = "suzhou/mubei",
		["northdown"] = "suzhou/yingxiaoting",
	},
}
Room {
	id = "suzhou/shizilin",
	name = "ʨ����",
	ways = {
		["east"] = "suzhou/yanyutang",
		["northeast"] = "suzhou/zhibaixuan",
		["west"] = "suzhou/nandajie1",
	},
}
Room {
	id = "suzhou/shuchang",
	name = "�鳡",
	ways = {
		["south"] = "suzhou/xidajie2",
		["enter"] = "suzhou/houtang",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
}
Room {
	id = "suzhou/shuiwa",
	name = "������",
	ways = {
		["southeast"] = "suzhou/caixiangjing",
		["westup"] = "suzhou/shiyuan",
	},
}
Room {
	id = "suzhou/shuiwa1",
	name = "������",
	ways = {
		["eastup"] = "suzhou/shiyuan",
		["southwest"] = "suzhou/caixiangjing",
	},
}
Room {
	id = "suzhou/shuyuan",
	name = "��Ժ",
	ways = {
		["northeast"] = "suzhou/nandajie1",
	},
}
Room {
	id = "suzhou/southgate",
	name = "����",
	ways = {
		["south"] = "suzhou/qsgdao2",
		["north"] = "suzhou/nandajie2",
	},
}
Room {
	id = "suzhou/sunwuting",
	name = "����ͤ",
	ways = {
		["south"] = "suzhou/muniangmu",
	},
}
Room {
	id = "suzhou/tianpingshan",
	name = "��ƽɽ",
	ways = {
		["eastup"] = "suzhou/baiyunquan",
		["southeast"] = "suzhou/lingyanshan",
		["north"] = "suzhou/shihu",
		["northeast"] = "suzhou/qsgdao",
	},
}
Room {
	id = "suzhou/tielingguan",
	name = "�����",
	ways = {
		["south"] = "suzhou/fengqiao",
		["north"] = "suzhou/nanlin",
	},
}
Room {
	id = "suzhou/nanlin",
	name = "����",
	ways = {
		["south"] = "suzhou/tielingguan",
	},
}

Room {
	id = "suzhou/tingyuxuan",
	name = "������",
	ways = {
		["west"] = "suzhou/nandajie2",
	},
}
Room {
	id = "suzhou/toushanmen",
	name = "ͷ��ɽ",
	ways = {
		["north"] = "suzhou/huqiushan",
		["west"] = "suzhou/wjszhuang",
	},
}
Room {
	id = "suzhou/tulu1",
	name = "��·",
	ways = {
		["southwest"] = "group/entry/sztulu2",
		["north"] = "suzhou/qsgdao5",
	},
}
Room {
	id = "suzhou/wenmeige",
	name = "��÷��",
	ways = {
		["south"] = "suzhou/lixuetang",
		["west"] = "suzhou/zhenquting",
	},
}
Room {
	id = "suzhou/westgate",
	name = "����",
	ways = {
		["east"] = "suzhou/xidajie2",
		["west"] = "suzhou/qsgdao4",
	},
}
Room {
	id = "suzhou/wjszhuang",
	name = "��ɽׯ",
	ways = {
		["eastup"] = "suzhou/shijianshi",
		["westup"] = "suzhou/hanhanquan",
		["east"] = "suzhou/toushanmen",
		["north"] = "suzhou/caizhu",
	},
}
Room {
	id = "suzhou/xidajie1",
	name = "�����",
	ways = {
		["southeast"] = "suzhou/baodaiqiao",
		["south"] = "suzhou/bingyindamen",
		["north"] = "suzhou/yamen",
		["northeast"] = "suzhou/canglangting",
		["west"] = "suzhou/xidajie2",
	},
}
Room {
	id = "suzhou/xidajie2",
	name = "�����",
	ways = {
		["south"] = "suzhou/xuanmiaoguan",
		["east"] = "suzhou/xidajie1",
		["north"] = "suzhou/shuchang",
		["west"] = "suzhou/westgate",
	},
}
Room {
	id = "suzhou/xingchunqiao",
	name = "�д���",
	ways = {
		["east"] = "suzhou/shihu",
	},
}
Room {
	id = "suzhou/xiting",
	name = "��������",
	ways = {
		["east"] = "suzhou/ymzhengting",
	},
}
Room {
	id = "suzhou/xiyuanzi",
	name = "Ϸ԰��",
	ways = {
		["north"] = "suzhou/majiu",
		["northeast"] = "suzhou/beidajie1",
	},
}
Room {
	id = "suzhou/xuanmiaoguan",
	name = "�����",
	ways = {
		["north"] = "suzhou/xidajie2",
	},
}
Room {
	id = "suzhou/yamen",
	name = "���Ŵ���",
	ways = {
		["south"] = "suzhou/xidajie1",
		["north"] = "suzhou/ymzhengting",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 7500},
		},
	},
}
Room {
	id = "suzhou/yanyutang",
	name = "������",
	ways = {
		["southeast"] = "suzhou/zhenquting",
		["west"] = "suzhou/shizilin",
	},
}
Room {
	id = "suzhou/yingxiaoting",
	name = "ӭЦͤ",
	ways = {
		["southup"] = "suzhou/shiyuan",
		["westdown"] = "suzhou/lingyanshan",
	},
}
Room {
	id = "suzhou/ymzhengting",
	name = "��������",
	ways = {
		["south"] = "suzhou/yamen",
		["north"] = "suzhou/neizhai",
		["east"] = "suzhou/dongting",
		["west"] = "suzhou/xiting",
	},
	objs = {
          ["��֪��"] = "zhao zhiren",
          ["ʦү"] = "shi ye",
           },
}
Room {
	id = "suzhou/zhengdian",
	name = "��ɽ������",
	ways = {
		["east"] = "suzhou/hanshidian",
		["out"] = "suzhou/hanshansi",
	},
}
Room {
	id = "suzhou/zhenquting",
	name = "��Ȥͤ",
	ways = {
		["northwest"] = "suzhou/yanyutang",
		["east"] = "suzhou/wenmeige",
	},
}
Room {
	id = "suzhou/zhenshi",
	name = "��ʯ",
	ways = {
		["south"] = "suzhou/shijianshi",
	},
}
Room {
	id = "suzhou/zhibaixuan",
	name = "Ҿ��ָ����",
	ways = {
		["southwest"] = "suzhou/shizilin",
	},
}
Room {
	id = "suzhou/zhishuangge",
	name = "��ˬ��",
	ways = {
		["southeast"] = "suzhou/qianrenshi",
	},
}
Room {
	id = "suzhou/zhonglou",
	name = "��¥СԺ",
	ways = {
		["east"] = "suzhou/lingyansi",
	},
}
Room {
	id = "suzhou/zijinan",
	name = "�Ͻ���",
	ways = {
		["east"] = "suzhou/beidajie2",
	},
	objs = {
          ["������"] = "cishan xiang",
           },
}
Room {
	id = "taishan/baihe",
	name = "�׺�Ȫ",
	ways = {
		["northup"] = "taishan/yitian",
		["southdown"] = "taishan/daizong",
	},
}
Room {
	id = "taishan/baozang",
	name = "������",
	ways = {
		["westup"] = "taishan/weipin",
	},
}
Room {
	id = "taishan/beitian",
	name = "������",
	ways = {
		["southdown"] = "taishan/zhangren",
		["up"] = "taishan/jiyizhijian",
	},
}
Room {
	id = "taishan/jiyizhijian",
	name = "����֮��",
	ways = {
		["down"] = "taishan/beitian",
	},
}
Room {
	id = "taishan/bixia",
	name = "��ϼ��",
	ways = {
		["eastdown"] = "taishan/baozang",
		["west"] = "taishan/weipin",
	},
}
Room {
	id = "taishan/daizong",
	name = "��ڷ�",
	ways = {
		["northup"] = "taishan/baihe",
		["south"] = "group/entry/tsyidao3",
		["east"] = "taishan/haitan",
		["west"] = "huanghe/huanghe5",
	},
}
Room {
	id = "taishan/dongtian",
	name = "������",
	ways = {
		["west"] = "taishan/tanhai",
	},
}
Room {
	id = "taishan/doumo",
	name = "��ĸ��",
	ways = {
		["eastup"] = "taishan/shijin",
		["southdown"] = "taishan/yitian",
	},
}
Room {
	id = "taishan/ertian",
	name = "������",
	ways = {
		["northup"] = "taishan/wudafu",
		["southdown"] = "taishan/huima",
	},
	objs = {
          ["��ص���"] = "tianbai daoren",
          ["���ɵ���"] = "tiansong daoren",
     },
}
Room {
	id = "taishan/fengchan",
	name = "����̨",
	ways = {
		["down"] = "taishan/yuhuang",
	},
}
Room {
	id = "taishan/haitan",
	name = "��̲",
	ways = {
		["west"] = "taishan/daizong",
	},
}
Room {
	id = "taishan/hsroad2",
	name = "��ʯ���",
	ways = {
		["east"] = "taishan/yidao2",
		["west"] = "huanghe/tiandi4",
	},
	room_relative="���---��ʯ���---�������ʯ���",
}
Room {
	id = "taishan/huima",
	name = "������",
	ways = {
		["northup"] = "taishan/ertian",
		["southdown"] = "taishan/shijin",
	},
}
Room {
	id = "taishan/lianhua",
	name = "������",
	ways = {
		["northup"] = "taishan/shixin",
		["westup"] = "taishan/tianjie",
	},
}
Room {
	id = "taishan/longmen",
	name = "����",
	ways = {
		["northup"] = "taishan/shengxian",
		["southdown"] = "taishan/wudafu",
	},
	objs = {
          ["�ٰٳ�"] = "chi baicheng",
     },
}
Room {
	id = "taishan/nantian",
	name = "������",
	ways = {
		["northup"] = "taishan/yuhuang",
		["southdown"] = "taishan/shengxian",
	},
	objs = {
          ["�ױ��ӳ�"] = "qinbing duizhang",
     },
}
Room {
	id = "taishan/riguan",
	name = "�չ۷�",
	ways = {
		["eastup"] = "taishan/tanhai",
		["westup"] = "taishan/yuhuang",
	},
}
Room {
	id = "taishan/shengxian",
	name = "���ɷ�",
	ways = {
		["northup"] = "taishan/nantian",
		["southdown"] = "taishan/longmen",
	},
	objs = {
          ["������"] = "yuji zi",
          ["��������"] = "jianchu daoren",
     },
}
Room {
	id = "taishan/shijin",
	name = "ʯ����",
	ways = {
		["northup"] = "taishan/huima",
		["westdown"] = "taishan/doumo",
	},
}
Room {
	id = "taishan/shixin",
	name = "����ʯ",
	ways = {
		["southdown"] = "taishan/lianhua",
	},
}
Room {
	id = "taishan/shulin1",
	name = "������",
	ways = {
		["southeast"] = "taishan/yidao2",
		["north"] = "taishan/sjzhuang",
	},
	objs = {
          ["��Сɽ"] = "shan xiaoshan",
          ["����ɽ"] = "shan shushan",
          ["����ɽ"] = "shan boshan",
          ["����ɽ"] = "shan zhongshan",
          ["����ɽ"] = "shan jishan",
     },
}
Room {
	id = "taishan/sjzhuang",
	name = "����ׯ",
	ways = {
		["south"] = "taishan/shulin1",
	},
	objs = {
          ["����"] = "shan zheng",
     },
}
Room {
	id = "taishan/tanhai",
	name = "̽��ʯ",
	ways = {
		["westdown"] = "taishan/riguan",
		["east"] = "taishan/dongtian",
	},
	objs = {
          ["������"] = "yuyin zi",
     },
}
Room {
	id = "taishan/tianjie",
	name = "���",
	ways = {
		["eastdown"] = "taishan/lianhua",
		["eastup"] = "taishan/weipin",
		["westdown"] = "taishan/nantian",
	},
}
Room {
	id = "taishan/weipin",
	name = "Χ��ɽ",
	ways = {
		["westdown"] = "taishan/tianjie",
		["east"] = "taishan/bixia",
	},
}
Room {
	id = "taishan/wudafu",
	name = "������",
	ways = {
		["northup"] = "taishan/longmen",
		["southdown"] = "taishan/ertian",
	},
}
Room {
	id = "taishan/xitian",
	name = "������",
	ways = {
		["southdown"] = "taishan/yueguan",
	},
}
Room {
	id = "taishan/yidao2",
	name = "�����",
	ways = {
		["northwest"] = "taishan/shulin1",
		["east"] = "group/entry/tsyidao3",
		["west"] = "taishan/hsroad2",
	},
}
Room {
	id = "taishan/yitian",
	name = "һ����",
	ways = {
		["northup"] = "taishan/doumo",
		["southdown"] = "taishan/baihe",
	},
}
Room {
	id = "taishan/yueguan",
	name = "�¹۷�",
	ways = {
		["northup"] = "taishan/xitian",
		["east"] = "taishan/nantian",
	},
}
Room {
	id = "taishan/yuhuang",
	name = "��ʶ�",
	ways = {
		["eastdown"] = "taishan/riguan",
		["southdown"] = "taishan/nantian",
		["west"] = "taishan/zhangren",
		["up"] = "taishan/fengchan",
	},
	objs = {
          ["���ŵ���"] = "tianmen daoren",
      },
}
Room {
	id = "taishan/zhangren",
	name = "���˷�",
	ways = {
		["northup"] = "taishan/beitian",
		["east"] = "taishan/yuhuang",
	},
	objs = {
          ["������"] = "yuqing zi",
     },
}
Room {
	id = "tanggu/beimen",
	name = "������",
	ways = {
		["south"] = "tanggu/stbeijie2",
	},
}
Room {
	id = "tanggu/center",
	name = "���Ĺ㳡",
	ways = {
		["southeast"] = "tanggu/kongchangdi",
		["south"] = "tanggu/stnanjie2",
		["east"] = "tanggu/stdongjie1",
		["north"] = "tanggu/stbeijie1",
		["west"] = "tanggu/stxijie1",
	},
}
Room {
	id = "tanggu/dangpu",
	name = "�򸣵䵱",
	no_fight = true,
	ways = {
		["west"] = "tanggu/stbeijie1",
	},
	objs = {
          ["���ϰ�"] = "yin laoban",
           },
}
Room {
	id = "tanggu/dizangmiao",
	name = "�ز���",
	ways = {
		["west"] = "tanggu/stbeijie2",
	},
}
Room {
	id = "tanggu/gangkou",
	name = "�ۿ�",
	ways = {
		["northeast"] = "sld/xiaolu",
		["west"] = "tanggu/stdongjie1",
	},
	objs = {
          ["ʩ��"] = "shi lang",
           },
}
Room {
	id = "tanggu/jiuguan",
	name = "С�ƹ�",
	ways = {
		["south"] = "tanggu/stxijie2",
	},
}
Room {
	id = "tanggu/kedian",
	name = "ϲ����ջ",
	no_fight = true,
	ways = {
		["#xfkzoutgosleep"] = "tanggu/stxijie1",
		["#xfkz"] = "tanggu/kedian2",
	},
	lengths = {
		["#xfkz"] = 5,
	},
}
Room {
	id = "tanggu/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "tanggu/sleeproom",
		["down"] = "tanggu/kedian",
	},
}
Room {
	id = "tanggu/kongchangdi",
	name = "�㳡�յ�",
	no_fight = true,
	ways = {
		["northwest"] = "tanggu/center",
	},
	objs = {
          ["�����"] = "mu nianci",
           },
}
Room {
	id = "tanggu/mingju",
	name = "��ͨ�˼�",
	ways = {
		["east"] = "tanggu/stnanjie1",
	},
}
Room {
	id = "tanggu/mingju1",
	name = "��ͨ�˼�",
	ways = {
		["west"] = "tanggu/stnanjie1",
	},
}
Room {
	id = "tanggu/muqidian",
	name = "ľ����",
	ways = {
		["north"] = "tanggu/stxijie2",
	},
}
Room {
	id = "tanggu/nanmen",
	name = "�ϳ���",
	ways = {
		["north"] = "tanggu/stnanjie1",
	},
}
Room {
	id = "tanggu/qianyunge",
	name = "���Ƹ�",
	ways = {
		["north"] = "tanggu/stdongjie1",
	},
}
Room {
	id = "tanggu/qianzhuang",
	name = "Ǯׯ",
	ways = {
		["east"] = "tanggu/stnanjie2",
	},
	objs = {
          ["�츻"] = "zhu fu",
           },
}
Room {
	id = "tanggu/sleeproom",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "tanggu/kedian2",
	},
}
Room {
	id = "tanggu/stbeijie1",
	name = "����",
	ways = {
		["south"] = "tanggu/center",
		["north"] = "tanggu/stbeijie2",
		["east"] = "tanggu/dangpu",
		["west"] = "tanggu/wuqipu",
	},
}
Room {
	id = "tanggu/stbeijie2",
	name = "����",
	ways = {
		["south"] = "tanggu/stbeijie1",
		["east"] = "tanggu/dizangmiao",
		["north"] = "tanggu/beimen",
		["west"] = "tanggu/xianjialou",
	},
}
Room {
	id = "tanggu/stdongjie1",
	name = "����",
	ways = {
		["south"] = "tanggu/qianyunge",
		["north"] = "tanggu/zhahuopu",
		["east"] = "tanggu/gangkou",
		["west"] = "tanggu/center",
	},
}
Room {
	id = "tanggu/stnanjie1",
	name = "ʯͷ�Ͻ�",
	ways = {
		["south"] = "tanggu/nanmen",
		["north"] = "tanggu/stnanjie2",
		["east"] = "tanggu/mingju1",
		["west"] = "tanggu/mingju",
	},
}
Room {
	id = "tanggu/stnanjie2",
	name = "ʯͷ�Ͻ�",
	ways = {
		["south"] = "tanggu/stnanjie1",
		["east"] = "tanggu/zhubaohang",
		["north"] = "tanggu/center",
		["west"] = "tanggu/qianzhuang",
	},
}
Room {
	id = "tanggu/stxijie1",
	name = "����",
	ways = {
		["south"] = "tanggu/kedian",
		["north"] = "tanggu/yaofang",
		["east"] = "tanggu/center",
		["west"] = "tanggu/stxijie2",
	},
}
Room {
	id = "tanggu/stxijie2",
	name = "����",
	ways = {
		["south"] = "tanggu/muqidian",
		["east"] = "tanggu/stxijie1",
		["north"] = "tanggu/jiuguan",
		["west"] = "tanggu/ximen",
	},
}
Room {
	id = "tanggu/wroad1",
	name = "�����",
	ways = {
		["southwest"] = "tanggu/wroad2",
		["east"] = "tanggu/ximen",
	},
	room_relative="�����----�����ŨL����������",
}
Room {
	id = "tanggu/wroad2",
	name = "�����",
	ways = {
		["northeast"] = "tanggu/wroad1",
		["west"] = "tanggu/wroad3",
	},
	room_relative="������J�����----����������",
}
Room {
	id = "tanggu/wroad3",
	name = "�����",
	ways = {
		["east"] = "tanggu/wroad2",
		["west"] = "tanggu/wroad4",
	},
	room_relative="�����----�����----����������",
}
Room {
	id = "tanggu/wroad4",
	name = "�����",
	ways = {
		["southwest"] = "cangzhou/eroad4",
		["east"] = "tanggu/wroad3",
	},
	room_relative="�����----������L����������",
}
Room {
	id = "tanggu/wuqipu",
	name = "������",
	ways = {
		["east"] = "tanggu/stbeijie1",
	},
}
Room {
	id = "tanggu/xianjialou",
	name = "�ɼ�¥",
	ways = {
		["east"] = "tanggu/stbeijie2",
	},
}
Room {
	id = "tanggu/ximen",
	name = "������",
	ways = {
		["east"] = "tanggu/stxijie2",
		["west"] = "tanggu/wroad1",
	},
}
Room {
	id = "tanggu/yaofang",
	name = "��ҩ��",
	ways = {
		["south"] = "tanggu/stxijie1",
	},
}
Room {
	id = "tanggu/zhahuopu",
	name = "�ӻ���",
	ways = {
		["south"] = "tanggu/stdongjie1",
	},
}
Room {
	id = "tanggu/zhubaohang",
	name = "�����鱦��",
	ways = {
		["west"] = "tanggu/stnanjie2",
	},
	objs = {
          ["����ү"] = "long sanye",
           },
}

Room {
	id = "thd/bookroom",
	name = "�鷿",
	ways = {
		["west"] = "thd/shilu",
	},
}
Room {
	id = "thd/caodi",
	name = "�ݵ�",
	ways = {
		["eastup"] = "thd/shanjiao",
		["west"] = "thd/shijian-ting",
		["n"] = "thd/jicui",
		["s"] = "thd/shangang",
	},
	lengths = {
		["n"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/cave",
	name = "�Ҷ�",
	ways = {
		["out"] = "thd/dongkou",
	},
	objs = {
          ["�ܲ�ͨ"] = "zhou botong",
           },
}
Room {
	id = "thd/chafang1",
	name = "�跿",
	no_fight = true,
	ways = {
		["east"] = "thd/fanting1",
	},
}
Room {
	id = "thd/chufang",
	name = "����",
	ways = {
		["south"] = "thd/fanting",
		["east"] = "thd/neishi2",
	},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/chufang1",
	name = "����",
	ways = {
		["south"] = "thd/fanting1",
	},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/dongkou",
	name = "����",
	ways = {
		["enter"] = "thd/cave",
		["west"] = "thd/shangang",
	},
	lengths = {
		["west"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>150 then return 10 else return false end",
	},
}
Room {
	id = "thd/entrance",
	name = "���",
	ways = {
	--	["down"] = "thd/taiji",
		["west"] = "thd/hill2",
	},
}
Room {
	id = "thd/fanting",
	name = "����",
	ways = {
		["east"] = "thd/neishi1",
		["north"] = "thd/chufang",
	},
}
Room {
	id = "thd/fanting1",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "thd/lianwuchang",
		["north"] = "thd/chufang1",
		["west"] = "thd/chafang1",
	},
}
Room {
	id = "thd/guiyun/caodi1",
	name = "�ݵ�",
	ways = {
		["south"] = "thd/guiyun/road4",
		["north"] = "thd/guiyun/shulin1",
		["east"] = "thd/guiyun/caodi3",
		["west"] = "thd/guiyun/caodi2",
	},
}
Room {
	id = "thd/guiyun/caodi2",
	name = "�ݵ�",
	ways = {
		["north"] = "thd/guiyun/shulin2",
		["east"] = "thd/guiyun/caodi1",
	},
}
Room {
	id = "thd/guiyun/caodi3",
	name = "�ݵ�",
	ways = {
		["north"] = "thd/guiyun/shulin3",
		["west"] = "thd/guiyun/caodi1",
	},
}
Room {
	id = "thd/guiyun/chafang",
	name = "�跿",
	no_fight = true,
	ways = {
		["stand;east"] = "thd/guiyun/fanting",
	},
}
Room {
	id = "thd/guiyun/chufang",
	name = "����",
	ways = {
		["west"] = "thd/guiyun/fanting",
	},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/guiyun/fanting",
	name = "����",
	no_fight = true,
	ways = {
		["stand;north"] = "thd/guiyun/lianwuchang",
		["stand;east"] = "thd/guiyun/chufang",
		["stand;west"] = "thd/guiyun/chafang",
	},
}
Room {
	id = "thd/guiyun/houting",
	name = "����",
	ways = {
		["north"] = "thd/guiyun/zoulang3",
		["east"] = "thd/guiyun/shufang",
		["west"] = "thd/guiyun/wofang",
	},
}
--[[
Room {
	id = "thd/guiyun/jiugongn",
	name = "�Ź��һ���",
	ways = {
		["#outJgSq"] = "thd/guiyun/shiqiao",
		["#outJgZq"] = "thd/guiyun/road4",
	},
	nolooks = {
		["#outJgSq"] = true,
		["#outJgZq"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#outJgSq"] = 100,
		["#outJgZq"] = 100,
	},
	find = {
		path = {"w;w;n;n","e","e","s","w","w","s","e","e"},
	},
}
--]]
Room {
	id = "thd/guiyun/jiuguan",
	name = "С�ƹ�",
	ways = {
		["north"] = "thd/guiyun/road2",
	},
	precmds = {
		["north"] = "stand",
	},
	nolooks = {
		["north"] = true,
	},
}
Room {
	id = "thd/guiyun/kefang",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "thd/guiyun/zoulang2",
	},
}
Room {
	id = "thd/guiyun/lianwuchang",
	name = "���䳡",
	ways = {
		["south"] = "thd/guiyun/fanting",
		["north"] = "thd/guiyun/zoulang6",
		["east"] = "thd/guiyun/xiuxishi-f",
		["west"] = "thd/guiyun/xiuxishi-m",
	},
	lengths = {
		["east"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["west"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "thd/guiyun/qianting",
	name = "ǰ��",
	ways = {
		["east"] = "thd/guiyun/shiqiao",
		["west"] = "thd/guiyun/zhongting",
	},
	objs = {
          ["����ׯ�ÿ����԰�"] = "board",
          ["½��Ӣ"] = "lu guanying",
           },
}
Room {
	id = "thd/guiyun/rivere",
	name = "С�Ӷ���",
	ways = {
		["east"] = "thd/guiyun/road1",
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = "thd/guiyun/riverw",
	},
	nolooks = {
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = true,
	},
	lengths = {
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = 10,
	},
}
Room {
	id = "thd/guiyun/riverw",
	name = "С������",
	ways = {
		["west"] = "thd/guiyun/road2",
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = "thd/guiyun/rivere",
	},
	nolooks = {
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = true,
	},
	lengths = {
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = 10,
	},
}
Room {
	id = "thd/guiyun/road1",
	name = "����С·",
	ways = {
		["east"] = "suzhou/hubiandadao",
		["west"] = "thd/guiyun/rivere",
	},
}
Room {
	id = "thd/guiyun/road2",
	name = "����С·",
	ways = {
		["south"] = "thd/guiyun/jiuguan",
		["north"] = "thd/guiyun/road3",
		["east"] = "thd/guiyun/riverw",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["south"] = "if MidNight[locl.time] then return 1 else return false end",
	},
}
Room {
	id = "thd/guiyun/road3",
	name = "����С·",
	ways = {
		["s;s;s;s;s;e;n;e"] = "thd/guiyun/riverw",
		["n;n;n;n;n;n;n"] = "thd/guiyun/shulin1",
	},
	nolooks = {
		["s;s;s;s;s;e;n;e"] = true,
		["n;n;n;n;n;n;n"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "thd/guiyun/road4",
	name = "����ׯǰ",
	ways = {
		["south"] = "thd/guiyun/road3",
		["north"] = "thd/guiyun/caodi1",
		["west"] = "thd/guiyun/shiqiao",
	},
	lengths = {
		["west"] = "if job.name=='tdh' then return false else return 1 end",
	},
}
Room {
	id = "thd/guiyun/shiqiao",
	name = "��ʯ��",
	ways = {
		["east"] = "thd/guiyun/road4",
		["west"] = "thd/guiyun/qianting",
	},
}
Room {
	id = "thd/guiyun/shufang",
	name = "�鷿",
	ways = {
		["west"] = "thd/guiyun/houting",
	},
	objs = {
          ["½�˷�"] = "lu chengfeng",
          ["���＼���š�"] = "flute's book",
           },
}
Room {
	id = "thd/guiyun/shulin1",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/caodi1",
		["east"] = "thd/guiyun/shulin3",
		["west"] = "thd/guiyun/shulin2",
	},
}
Room {
	id = "thd/guiyun/shulin2",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/caodi2",
		["east"] = "thd/guiyun/shulin1",
	},
	objs = {
          ["�۷�"] = "bee",
           },
}
Room {
	id = "thd/guiyun/shulin3",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/caodi3",
		["north"] = "thd/guiyun/shulin4",
		["west"] = "thd/guiyun/shulin1",
	},
	objs = {
          ["��֦"] = "shuzhi",
           },
}
Room {
	id = "thd/guiyun/shulin4",
	name = "�����",
	ways = {
		["south"] = "thd/guiyun/shulin3",
		["northwest"] = "thd/guiyun/shulin5",
		["east"] = "thd/guiyun/shulin6",
	},
}
Room {
	id = "thd/guiyun/shulin5",
	name = "�����",
	ways = {
		["southeast"] = "thd/guiyun/shulin4",
		["north"] = "thd/guiyun/shulin7",
	},
}
Room {
	id = "thd/guiyun/shulin6",
	name = "�����",
	ways = {
		["west"] = "thd/guiyun/shulin4",
	},
}
Room {
	id = "thd/guiyun/shulin7",
	name = "�����",
	ways = {
		["south"] = "thd/guiyun/shulin5",
	},
	objs = {
          ["����"] = "snake",
           },
}
Room {
	id = "thd/guiyun/shushang",
	name = "����",
	ways = {
		["down"] = "thd/guiyun/shulin5",
	},
}
Room {
	id = "thd/guiyun/wofang",
	name = "�Է�",
	ways = {
		["east"] = "thd/guiyun/houting",
	},
}
Room {
	id = "thd/guiyun/wofang1",
	name = "�Է�",
	ways = {
		["south"] = "thd/guiyun/zoulang3",
	},
	objs = {
          ["������"] = "cheng yaojia",
           },
}
Room {
	id = "thd/guiyun/xiuxishi-f",
	name = "Ů��Ϣ��",
	no_fight = true,
	ways = {
		["west"] = "thd/guiyun/lianwuchang",
	},
}
Room {
	id = "thd/guiyun/xiuxishi-m",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["east"] = "thd/guiyun/lianwuchang",
	},
}
Room {
	id = "thd/guiyun/zhongting",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/zoulang4",
		["north"] = "thd/guiyun/zoulang1",
		["east"] = "thd/guiyun/qianting",
	},
}
Room {
	id = "thd/guiyun/zoulang1",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/zhongting",
		["west"] = "thd/guiyun/zoulang2",
	},
	room_relative="����-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang2",
	name = "����",
	ways = {
		["east"] = "thd/guiyun/zoulang1",
		["north"] = "thd/guiyun/kefang",
		["west"] = "thd/guiyun/zoulang3",
	},
	room_relative="�ͷ�������-----����-----��������",
}
Room {
	id = "thd/guiyun/zoulang3",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/houting",
		["east"] = "thd/guiyun/zoulang2",
		["north"] = "thd/guiyun/wofang1",
	},
	room_relative="�Է�������-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang4",
	name = "����",
	ways = {
		["north"] = "thd/guiyun/zhongting",
		["west"] = "thd/guiyun/zoulang5",
	},
	room_relative="����������-----��������",
}
Room {
	id = "thd/guiyun/zoulang5",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/zoulang6",
		["east"] = "thd/guiyun/zoulang4",
	},
	room_relative="����-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang6",
	name = "����",
	ways = {
		["south"] = "thd/guiyun/lianwuchang",
		["north"] = "thd/guiyun/zoulang5",
	},
	room_relative="���ȣ����ȣ����䳡����",
	blocks = {
		["south"] = {
			{id = "zhuang ding", exp = 5000, party = "�һ���"},
		},
	},
}
Room {
	id = "thd/haibin",
	name = "����",
	ways = {
		["west"] = "thd/niujia/jiangpan3",
		["#toThd"] = "thd/shore",
	},
	lengths = {
		["#toThd"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hall",
	name = "����",
	ways = {
		["east"] = "thd/shilu",
		["west"] = "thd/zoulang1",
	},
}
Room {
	id = "thd/hetang",
	name = "����",
	ways = {
		["north"] = "thd/shidi",
		["s"] = "thd/jicui",
	},
	lengths = {
		["s"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hill",
	name = "Сɽ",
	ways = {
		["eastup"] = "thd/hill1",
		["nd"] = "thd/shangang",
	},
	nolooks = {
		["nd"] = true,
	},
	lengths = {
		["nd"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hill1",
	name = "ɽ��",
	ways = {
		["northup"] = "thd/hill2",
		["westdown"] = "thd/hill",
	},
}
Room {
	id = "thd/hill2",
	name = "ɽ��",
	ways = {
		["east"] = "thd/entrance",
		["southdown"] = "thd/hill1",
	},
}
Room {
	id = "thd/huo",
	name = "��",
	ways = {
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/jicui",
	name = "����ͤ",
	ways = {
		["enter"] = "thd/room",
		["east"] = "thd/kefang",
		["ask huang yaoshi about �뵺;#walkBusy"] = "thd/haibin",
		["n"] = "thd/hetang",
		["s"] = "thd/caodi",
	},
	lengths = {
		["ask huang yaoshi about �뵺;#walBusy"] = 10,
		["n"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
		["s"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
	objs = {
          ["��ҩʦ"] = "huang yaoshi",
           },
}
Room {
	id = "thd/jin",
	name = "��",
	ways = {
		["huo"] = "thd/huo",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/jingshe",
	name = "����",
	ways = {
		["south"] = "thd/shilu",
	},
	objs = {
          ["������"] = "array box",
           },
}
Room {
	id = "thd/kefang",
	name = "�ͷ�",
	ways = {
		["west"] = "thd/jicui",
	},
}
Room {
	id = "thd/kefang1",
	name = "�ͷ�",
	ways = {
		["south"] = "thd/shijian-ting",
	},
}
Room {
	id = "thd/liandanfang",
	name = "������",
	ways = {
		["out"] = "thd/jingshe",
	},
}
Room {
	id = "thd/liangyi",
	name = "����",
	ways = {
		["southwest"] = "thd/yang",
		["down"] = "thd/sixiang",
		["northeast"] = "thd/yin",
	},
}
Room {
	id = "thd/lianwuchang",
	name = "���䳡",
	ways = {
		["south"] = "thd/xiuxishi-f",
		["east"] = "thd/zoulang3",
		["north"] = "thd/xiuxishi-m",
		["west"] = "thd/fanting1",
	},
	lengths={
	    ["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	objs = {
          ["������"] = "ziyu xiao",
           },
}
Room {
	id = "thd/mu",
	name = "ľ",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
	},
}
Room {
	id = "thd/mudao1",
	name = "Ĺ��",
	ways = {
		["down"] = "thd/mudao2",
		["out"] = "thd/tomb",
	},
}
Room {
	id = "thd/mudao2",
	name = "Ĺ��",
	ways = {
		["northup"] = "thd/mudao2",
		["southup"] = "thd/mudao2",
		["northwest"] = "thd/mudao2",
		["north"] = "thd/mudao2",
		["northeast"] = "thd/mudao2",
		["up"] = "thd/mudao1",
		["southeast"] = "thd/mudao2",
		["southwest"] = "thd/mudao2",
		["south"] = "thd/mudao2",
		["east"] = "thd/mudao2",
		["northdown"] = "thd/mudao2",
		["southdown"] = "thd/mudao2",
		["west"] = "thd/mudao2",
	},
}
Room {
	id = "thd/mudao3",
	name = "Ĺ��",
	ways = {
		["northup"] = "thd/mudao3",
		["southup"] = "thd/mudao3",
		["northwest"] = "thd/mudao3",
		["north"] = "thd/mudao3",
		["northeast"] = "thd/mudao3",
		["up"] = "thd/mudao1",
		["southeast"] = "thd/mudao3",
		["southwest"] = "thd/mudao3",
		["south"] = "thd/mudao3",
		["east"] = "thd/mudao3",
		["northdown"] = "thd/mudao3",
		["southdown"] = "thd/mudao3",
		["west"] = "thd/mudao3",
	},
}
Room {
	id = "thd/mudao4",
	name = "Ĺ��",
	ways = {
		["down"] = "thd/mushi",
	},
}
Room {
	id = "thd/mushi",
	name = "Ĺ������",
	ways = {
		["up"] = "thd/mudao4",
	},
}
Room {
	id = "thd/neishi1",
	name = "����",
	ways = {
		["south"] = "thd/zoulang2",
		["east"] = "thd/woshi1",
		["north"] = "thd/neishi2",
		["west"] = "thd/fanting",
	},
	objs = {
          ["����"] = "huang rong",
           },
}
Room {
	id = "thd/neishi2",
	name = "����",
	ways = {
		["south"] = "thd/neishi1",
		["east"] = "thd/woshi2",
		["west"] = "thd/chufang",
	},
}
Room {
	id = "thd/niujia/bay",
	name = "С���",
	ways = {
		["west"] = "thd/niujia/hbroad",
	},
	objs = {
          ["���ϴ�"] = "lao da",
           },
}
Room {
	id = "thd/niujia/guojia",
	name = "��",
	ways = {
		["south"] = "thd/niujia/njroad2",
	},
}
Room {
	id = "thd/niujia/hbroad",
	name = "��·",
	ways = {
		["southwest"] = "thd/niujia/njeast",
		["north"] = "thd/niujia/kezhan",
		["east"] = "thd/niujia/bay",
	},
}
Room {
	id = "thd/niujia/jiangpan1",
	name = "����",
	ways = {
		["southeast"] = "thd/niujia/jiangpan2",
		["north"] = "thd/niujia/njroad5",
	},
	room_relative="����С·�����ϨK���Ͻ���",
}
Room {
	id = "thd/niujia/jiangpan2",
	name = "����",
	ways = {
		["northwest"] = "thd/niujia/jiangpan1",
		["east"] = "thd/niujia/jiangpan3",
	},
	room_relative="���ϨI����-----���Ͻ���",
}
Room {
	id = "thd/niujia/jiangpan3",
	name = "����",
	ways = {
		["west"] = "thd/niujia/jiangpan2",
		["east"] = "thd/haibin",
	},
	room_relative="����-----����-----��������",
}
Room {
	id = "thd/niujia/kezhan",
	name = "������ջ",
	ways = {
		["south"] = "thd/niujia/hbroad",
	},
}
Room {
	id = "thd/niujia/mishi",
	name = "����",
	ways = {
		["out"] = "thd/niujia/xiaodian",
	},
}
Room {
	id = "thd/niujia/njeast",
	name = "���",
	ways = {
		["northeast"] = "thd/niujia/hbroad",
		["west"] = "thd/niujia/njroad3",
	},
}
Room {
	id = "thd/niujia/njroad1",
	name = "����С·",
	ways = {
		["south"] = "thd/niujia/xiaodian",
		["east"] = "thd/niujia/njroad2",
		["west"] = "thd/niujia/njwest",
	},
	room_relative="���---����С·---����С·��С�Ƶ����С·",
}
Room {
	id = "thd/niujia/njroad2",
	name = "����С·",
	ways = {
		["east"] = "thd/niujia/njroad3",
		["north"] = "thd/niujia/guojia",
		["west"] = "thd/niujia/njroad1",
	},
	room_relative="�񷿣�����С·---����С·---����С·����С·",
	objs = {
          ["�𴦻�"] = "qiu chuji",
           },
}
Room {
	id = "thd/niujia/njroad3",
	name = "����С·",
	ways = {
		["south"] = "thd/niujia/njroad4",
		["north"] = "thd/niujia/qianyuan",
		["east"] = "thd/niujia/njeast",
		["west"] = "thd/niujia/njroad2",
	},
	room_relative="�񷿣�����С·---����С·---��ڣ�����С·����С·",
}
Room {
	id = "thd/niujia/qianyuan",
	name = "��",
	ways = {
		["south"] = "thd/niujia/njroad3",
	},
}

Room {
	id = "thd/niujia/njroad4",
	name = "����С·",
	ways = {
		["south"] = "thd/niujia/njroad5",
		["north"] = "thd/niujia/njroad3",
	},
	room_relative="����С·������С·������С·����С·",
}
Room {
	id = "thd/niujia/njroad5",
	name = "����С·",
	ways = {
		["south"] = "thd/niujia/jiangpan1",
		["north"] = "thd/niujia/njroad4",
	},
	room_relative="����С·������С·�����ϴ���С·",
}
Room {
	id = "thd/niujia/njwest",
	name = "���",
	ways = {
		["northwest"] = "thd/niujia/road2",
		["east"] = "thd/niujia/njroad1",
	},
}
Room {
	id = "thd/niujia/road",
	name = "��·",
	ways = {
		["south"] = "group/entry/thdroad1",
		["northwest"] = "hz/qsddao3",
	},
}
Room {
	id = "thd/niujia/road2",
	name = "��·",
	ways = {
		["southeast"] = "thd/niujia/njwest",
		["northwest"] = "group/entry/thdroad1",
	},
}
Room {
	id = "thd/niujia/xiaodian",
	name = "С�Ƶ�",
	ways = {
		["north"] = "thd/niujia/njroad1",
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right"] = "thd/niujia/mishi",
	},
	lengths = {
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right)"] = 11,
	},
	nolooks = {
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right"] = true,
	},
	objs = {
          ["ɵ��"] = "sha gu",
           },
}

Room {
	id = "thd/room",
	name = "�﷿",
	ways = {
		["out"] = "thd/jicui",
	},
}
Room {
	id = "thd/shangang",
	name = "ɽ��",
	ways = {
		["north"] = "thd/caodi",
		["east"] = "thd/dongkou",
		["west;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south"] = "thd/dongkou",
	},
	lengths = {
		["east"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>199 then return 10 else return false end",
		["west;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>150 then return 30 else return false end",
	},
}
Room {
	id = "thd/shanjiao",
	name = "�Խ���ɽ��",
	AAways = {
		["westdown"] = "thd/caodi",
		["up"] = "thd/shanlu1",
	},
}
Room {
	id = "thd/shanlu1",
	name = "ɽ·",
	ways = {
		["northup"] = "thd/shanlu2",
		["down"] = "thd/shanjiao",
	},
}
Room {
	id = "thd/shanlu2",
	name = "ɽ·",
	ways = {
		["eastup"] = "thd/shanyao",
		["southdown"] = "thd/shanlu1",
	},
}
Room {
	id = "thd/shanya",
	name = "����",
	ways = {
		["westdown"] = "thd/shanyao",
	},
}
Room {
	id = "thd/shanyao",
	name = "��ɽ��",
	ways = {
		["eastup"] = "thd/shanya",
		["westdown"] = "thd/shanlu2",
	},
}
Room {
	id = "thd/shaoyang",
	name = "����",
	ways = {
		["east"] = "thd/sixiang",
		["down"] = "thd/jin",
	},
}
Room {
	id = "thd/shaoyin",
	name = "����",
	ways = {
		["down"] = "thd/mu",
		["west"] = "thd/sixiang",
	},
}
Room {
	id = "thd/shidi",
	name = "Сʯ��",
	ways = {
		["south"] = "thd/hetang",
		["north"] = "thd/shilu",
	},
}
Room {
	id = "thd/shijian-ting",
	name = "�Խ�ͤ",
	ways = {
		["north"] = "thd/kefang1",
		["east"] = "thd/caodi",
	},
}
Room {
	id = "thd/shilu",
	name = "ʯ·",
	ways = {
		["south"] = "thd/shidi",
		["north"] = "thd/jingshe",
		["east"] = "thd/bookroom",
		["west"] = "thd/hall",
	},
}
Room {
	id = "thd/shore",
	name = "����",
	ways = {
		["northup"] = "thd/hill",
	},
}
Room {
	id = "thd/shui",
	name = "ˮ",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/sixiang",
	name = "����",
	ways = {
		["south"] = "thd/taiyang",
		["down"] = "thd/tu",
		["north"] = "thd/taiyin",
		["east"] = "thd/shaoyin",
		["west"] = "thd/shaoyang",
	},
}
Room {
	id = "thd/taiji",
	name = "̫��",
	ways = {
		["down"] = "thd/liangyi",
	},
}
Room {
	id = "thd/taiyang",
	name = "̫��",
	ways = {
		["north"] = "thd/sixiang",
		["down"] = "thd/huo",
	},
}
Room {
	id = "thd/taiyin",
	name = "̫��",
	ways = {
		["south"] = "thd/sixiang",
		["down"] = "thd/shui",
	},
}
Room {
	id = "thd/taohua1",
	name = "�һ���",
}

Room {
	id = "thd/tomb",
	name = "ʯ��",
	ways = {
		["south"] = "thd/taohua1",
		["east"] = "thd/taohua1",
		["north"] = "thd/taohua1",
		["west"] = "thd/taohua1",
	},
}
Room {
	id = "thd/tu",
	name = "��",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/woshi1",
	name = "����",
	ways = {
		["west"] = "thd/neishi1",
	},
}
Room {
	id = "thd/woshi2",
	name = "����",
	ways = {
		["west"] = "thd/neishi2",
	},
}
Room {
	id = "thd/xiaoyuan",
	name = "СԺ",
	ways = {
		["south"] = "thd/taohua1",
		["north"] = "thd/jicui",
	},
}
Room {
	id = "thd/xiuxishi-f",
	name = "Ů��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "thd/lianwuchang",
	},
}
Room {
	id = "thd/xiuxishi-m",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "thd/lianwuchang",
	},
}
Room {
	id = "thd/yang",
	name = "��",
	ways = {
		["northeast"] = "thd/liangyi",
	},
}
Room {
	id = "thd/yin",
	name = "��",
	ways = {
		["southwest"] = "thd/liangyi",
	},
}
Room {
	id = "thd/zoulang1",
	name = "����",
	ways = {
		["north"] = "thd/zoulang2",
		["east"] = "thd/hall",
		["west"] = "thd/zoulang3",
	},
}
Room {
	id = "thd/zoulang2",
	name = "����",
	ways = {
		["south"] = "thd/zoulang1",
		["north"] = "thd/neishi1",
	},
}
Room {
	id = "thd/zoulang3",
	name = "����",
	ways = {
		["east"] = "thd/zoulang1",
		["west"] = "thd/lianwuchang",
	},
}
Room {
	id = "tianshan/banshan",
	name = "��ɽ",
	ways = {
		["southdown"] = "tianshan/shanlu4",
		["west"] = "tianshan/duanhunya",
	},
	objs = {
          ["������"] = "chen zhengde",
          ["����÷"] = "guan mingmei",
     },
}
Room {
	id = "tianshan/bctang",
	name = "�ٲ���",
	ways = {
		["south"] = "tianshan/zoulang3",
	},
}
Room {
	id = "tianshan/bqshi",
	name = "������",
	ways = {
		["north"] = "tianshan/zoulang2",
	},
}
Room {
	id = "tianshan/bzhanjian",
	name = "���ɽ�",
	ways = {
		["drop tielian;south"] = "tianshan/shizhuyan",
		["#toXcm"] = "tianshan/xcmen",
	},
	nolooks = {
		["#toXcm"] = true,
	},
	lengths = {
		["#toXcm"] = 10,
	},
}
Room {
	id = "tianshan/chtbu",
	name = "���첿",
	ways = {
		["eastdown"] = "tianshan/dadao9",
	},
}
Room {
	id = "tianshan/chufang",
	name = "����",
	ways = {
		["east"] = "tianshan/qiandian",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["�׷�"] = "mi fan",
     },
}
Room {
	id = "tianshan/ctbu",
	name = "���첿",
	ways = {
		["northdown"] = "tianshan/dadao3",
		["southdown"] = "tianshan/dadao2",
	},
}
Room {
	id = "tianshan/dadao1",
	name = "��ʯ���",
	ways = {
		["southup"] = "tianshan/pmfeng",
		["north"] = "tianshan/dadao2",
	},
	room_relative="��ʯ�������ʯ�������翷���ʯ���",
}
Room {
	id = "tianshan/dadao10",
	name = "��ʯ���",
	ways = {
		["southwest"] = "tianshan/zhtbu",
		["north"] = "tianshan/dadao9",
		["east"] = "tianshan/dadao3",
	},
	room_relative="��ʯ�������ʯ���---��ʯ����L���첿��ʯ���",
}
Room {
	id = "tianshan/dadao2",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/ctbu",
		["south"] = "tianshan/dadao1",
	},
	room_relative="���첿����ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao3",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/jtbu",
		["southup"] = "tianshan/ctbu",
		["east"] = "tianshan/dadao4",
		["west"] = "tianshan/dadao10",
	},
	room_relative="���첿����ʯ���---��ʯ���---��ʯ��������첿��ʯ���",
}
Room {
	id = "tianshan/dadao4",
	name = "��ʯ���",
	ways = {
		["southeast"] = "tianshan/ytbu",
		["north"] = "tianshan/dadao5",
		["west"] = "tianshan/dadao3",
	},
	room_relative="��ʯ�������ʯ���---��ʯ����K���첿��ʯ���",
}
Room {
	id = "tianshan/dadao5",
	name = "��ʯ���",
	ways = {
		["eastup"] = "tianshan/htbu",
		["westup"] = "tianshan/jtbu",
		["south"] = "tianshan/dadao4",
		["north"] = "tianshan/dadao6",
	},
	room_relative="��ʯ��������첿����ʯ�������첿����ʯ�����ʯ���",
	objs = {
          ["�¹�"] = "chen gu",
     },
}
Room {
	id = "tianshan/dadao6",
	name = "��ʯ���",
	ways = {
		["south"] = "tianshan/dadao5",
		["northeast"] = "tianshan/rtbu",
		["west"] = "tianshan/dadao7",
	},
	room_relative="��첿�J��ʯ���---��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao7",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/xtbu",
		["southup"] = "tianshan/jtbu",
		["east"] = "tianshan/dadao6",
		["west"] = "tianshan/dadao8",
	},
	room_relative="���첿����ʯ���---��ʯ���---��ʯ��������첿��ʯ���",
}
Room {
	id = "tianshan/dadao8",
	name = "��ʯ���",
	ways = {
		["south"] = "tianshan/dadao9",
		["northwest"] = "tianshan/youtbu",
		["east"] = "tianshan/dadao7",
	},
	room_relative="���첿�I��ʯ���---��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao9",
	name = "��ʯ���",
	ways = {
		["eastup"] = "tianshan/jtbu",
		["westup"] = "tianshan/chtbu",
		["south"] = "tianshan/dadao10",
		["north"] = "tianshan/dadao8",
	},
	room_relative="��ʯ��������첿����ʯ��������첿����ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadian",
	name = "���",
	ways = {
		["south"] = "tianshan/zoulang1",
		["north"] = "tianshan/zoulang6",
		["east"] = "tianshan/zoulang2",
		["west"] = "tianshan/zoulang4",
	},
	objs = {
          ["����"] = "xu zhu",
     },
}
Room {
	id = "tianshan/dsqiao",
	name = "��ˮ��",
	ways = {
		["south"] = "tianshan/gyting",
		["east"] = "tianshan/jiashan",
		["west"] = "tianshan/huayuan",
	},
}
Room {
	id = "tianshan/duanhunya",
	name = "�ϻ���",
	ways = {
		["northup"] = "tianshan/shizhuyan",
		["westdown"] = "tianshan/shanjian",
		["east"] = "tianshan/banshan",
	},
	objs = {
          ["÷��¹"] = "meihua lu",
     },
}
Room {
	id = "tianshan/fjshi",
	name = "������",
	ways = {
		["south"] = "tianshan/zoulang2",
	},
}
Room {
	id = "tianshan/fqzong",
	name = "����ڣ",
	ways = {
		["south"] = "tianshan/zoulang5",
	},
}
Room {
	id = "tianshan/gyting",
	name = "����ͤ",
	ways = {
		["south"] = "tianshan/houyuan",
		["north"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/houyuan",
	name = "��԰",
	ways = {
		["south"] = "tianshan/zoulang6",
		["north"] = "tianshan/gyting",
	},
}
Room {
	id = "tianshan/htbu",
	name = "��첿",
	ways = {
		["westdown"] = "tianshan/dadao5",
	},
	objs = {
          ["������"] = "yu popo",
     },
}
Room {
	id = "tianshan/huayuan",
	name = "��԰",
	ways = {
		["east"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/jiashan",
	name = "��ɽ",
	ways = {
		["west"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/jtbu",
	name = "���첿",
	ways = {
		["eastdown"] = "tianshan/dadao5",
		["westdown"] = "tianshan/dadao9",
		["enter"] = "tianshan/ljgong",
		["northdown"] = "tianshan/dadao7",
		["southdown"] = "tianshan/dadao3",
	},
	objs = {
          ["����˪"] = "cheng qingshuang",
     },
}
Room {
	id = "tianshan/kefang",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "tianshan/zoulang4",
	},
}
Room {
	id = "tianshan/kongchang",
	name = "�ճ�",
	ways = {
		["east"] = "xingxiu/tianshan",
		["west"] = "tianshan/shanlu1",
	},
}
Room {
	id = "tianshan/lgfang",
	name = "������",
	ways = {
		["north"] = "tianshan/zoulang3",
	},
}
Room {
	id = "tianshan/ljgong",
	name = "���չ�",
	ways = {
		["north"] = "tianshan/qiandian",
		["out"] = "tianshan/jtbu",
	},
}
Room {
	id = "tianshan/longtan",
	name = "��̶",
	no_fight = true,
	ways = {
		["up"] = "tianshan/duanhunya",
	},
}
Room {
	id = "tianshan/lxzai",
	name = "����ի",
	ways = {
		["north"] = "tianshan/zoulang4",
	},
}
Room {
	id = "tianshan/pmfeng",
	name = "��翷�",
	ways = {
		["northdown"] = "tianshan/dadao1",
		["southdown"] = "tianshan/shanjin6",
	},
}
Room {
	id = "tianshan/qiandian",
	name = "ǰ��",
	ways = {
		["south"] = "tianshan/ljgong",
		["north"] = "tianshan/zoulang1",
		["west"] = "tianshan/chufang",
	},
}
Room {
	id = "tianshan/qinshi",
	name = "����",
	ways = {
		["north"] = "tianshan/zoulang5",
	},
}
Room {
	id = "tianshan/rtbu",
	name = "��첿",
	ways = {
		["southwest"] = "tianshan/dadao6",
	},
}
Room {
	id = "tianshan/shandao1",
	name = "ɽ��",
	ways = {
		["south"] = "tianshan/shandao1",
		["east"] = "tianshan/shandao1",
		["north"] = "tianshan/shandao1",
		["west"] = "tianshan/shandao1",
		--["#outTssd"] = "tianshan/shanjin2"
	},
	--nolooks = {
	--	["#outTssd"] = true,
	--},
	--lengths = {
	--	["#outTssd"] = 10,
	--},
}
Room {
	id = "tianshan/shanjian",
	name = "ɽ��",
	ways = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = "tianshan/longtan",
	},
	nolooks = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = true,
		["east"] = true,
		["eastdown"] = true,
		["eastup"] = true,
		["north"] = true,
		["northdown"] = true,
		["northeast"] = true,
		["northup"] = true,
		["northwest"] = true,
		["south"] = true,
		["southdown"] = true,
		["southeast"] = true,
		["southup"] = true,
		["southwest"] = true,
		["west"] = true,
		["westdown"] = true,
		["westup"] = true,
	},
	lengths = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = 16,
	},
}
Room {
	id = "tianshan/shanjin1",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/shanjin2",
		["southdown"] = "tianshan/xcmen",
	},
	room_relative="ɽ����ɽ�����ɳ���ɽ��",
}
Room {
	id = "tianshan/shanjin2",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin3",
		["southdown"] = "tianshan/shanjin1",
	},
}
Room {
	id = "tianshan/shanjin3",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin4",
		["west"] = "tianshan/shanjin2",
	},
}
Room {
	id = "tianshan/shanjin4",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin5",
		["west"] = "tianshan/shanjin3",
	},
}
Room {
	id = "tianshan/shanjin5",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/shanjin6",
		["west"] = "tianshan/shanjin4",
	},
}
Room {
	id = "tianshan/shanjin6",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/pmfeng",
		["southdown"] = "tianshan/shanjin5",
	},
	objs = {
          ["����"] = "ling yang",
     },
}
Room {
	id = "tianshan/shanlu1",
	name = "��ɽɽ·",
	ways = {
		["northup"] = "tianshan/shanlu2",
		["east"] = "tianshan/kongchang",
	},
}
Room {
	id = "tianshan/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/shanlu3",
		["southdown"] = "tianshan/shanlu1",
	},
}
Room {
	id = "tianshan/shanlu3",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/shanlu4",
		["southdown"] = "tianshan/shanlu2",
	},
	objs = {
          ["��"] = "zhu ji",
     },
}
Room {
	id = "tianshan/shanlu4",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/banshan",
		["southdown"] = "tianshan/shanlu3",
	},
}
Room {
	id = "tianshan/shanyao",
	name = "ɽ��",
	ways = {
		["south"] = "tianshan/shanyao",
		["east"] = "tianshan/shanyao",
		["north"] = "tianshan/shanyao",
		["west"] = "tianshan/shanyao",
	},
}
Room {
	id = "tianshan/shiku",
	name = "ʯ��",
	ways = {
		["south"] = "tianshan/shiku",
		["east"] = "tianshan/shiku",
		["north"] = "tianshan/shiku",
		["west"] = "tianshan/shiku",
	},
}
Room {
	id = "tianshan/shizhuyan",
	name = "ʧ����",
	ways = {
		["north"] = "tianshan/bzhanjian",
		["southdown"] = "tianshan/duanhunya",
	},
}
Room {
	id = "tianshan/xcmen",
	name = "�ɳ���",
	ways = {
		["northup"] = "tianshan/shanjin1",
		["jump duimian;#walkBusy"] = "tianshan/bzhanjian",
	},
	nolooks = {
		["jump duimian;#walkBusy"] = true,
	},
	lengths = {
		["jump duimian;#walkBusy"] = 10,
	},
}
Room {
	id = "tianshan/xtbu",
	name = "���첿",
	ways = {
		["southdown"] = "tianshan/dadao7",
	},
}
Room {
	id = "tianshan/youtbu",
	name = "���첿",
	ways = {
		["southeast"] = "tianshan/dadao8",
	},
}
Room {
	id = "tianshan/ytbu",
	name = "���첿",
	ways = {
		["northwest"] = "tianshan/dadao4",
	},
}
Room {
	id = "tianshan/zhtbu",
	name = "���첿",
	ways = {
		["northeast"] = "tianshan/dadao10",
	},
	objs = {
          ["ʯɩ"] = "shi sao",
     },
}
Room {
	id = "tianshan/zoulang1",
	name = "����",
	ways = {
		["south"] = "tianshan/qiandian",
		["north"] = "tianshan/dadian",
	},
}
Room {
	id = "tianshan/zoulang2",
	name = "����",
	ways = {
		["south"] = "tianshan/bqshi",
		["east"] = "tianshan/zoulang3",
		["north"] = "tianshan/fjshi",
		["west"] = "tianshan/dadian",
	},
	objs = {
          ["��"] = "zhu jian",
     },
}
Room {
	id = "tianshan/zoulang3",
	name = "����",
	ways = {
		["south"] = "tianshan/lgfang",
		["north"] = "tianshan/bctang",
		["west"] = "tianshan/zoulang2",
	},
	objs = {
          ["�ս�"] = "ju jian",
     },
}
Room {
	id = "tianshan/zoulang4",
	name = "����",
	ways = {
		["south"] = "tianshan/lxzai",
		["north"] = "tianshan/kefang",
		["east"] = "tianshan/dadian",
		["west"] = "tianshan/zoulang5",
	},
	objs = {
          ["����"] = "lan jian",
     },
}
Room {
	id = "tianshan/zoulang5",
	name = "����",
	ways = {
		["south"] = "tianshan/qinshi",
		["east"] = "tianshan/zoulang4",
		["north"] = "tianshan/fqzong",
	},
	objs = {
          ["÷��"] = "mei jian",
     },
}
Room {
	id = "tianshan/zoulang6",
	name = "����",
	ways = {
		["south"] = "tianshan/dadian",
		["north"] = "tianshan/houyuan",
	},
}
Room {
	id = "tiezhang/bqshi",
	name = "������",
	ways = {
		["south"] = "tiezhang/zoulang-1",
	},
	objs = {
          ["������"] = "bingqi jia",
     },
}
Room {
	id = "tiezhang/chufang",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "tiezhang/zoulang-3",
	},
}
Room {
	id = "tiezhang/dashishi",
	name = "��ʯ��",
	ways = {
		["out"] = "tiezhang/taijie-2",
	},
}
Room {
	id = "tiezhang/dezj",
	name = "�ڶ�ָ��",
	ways = {
		["northup"] = "tiezhang/shanlu-8",
		["south"] = "tiezhang/sslin-5",
		["enter"] = "tiezhang/dong-1",
	},
	objs = {
          ["������"] = "ling zhentian",
          ["������"] = "huang lingtian",
     },
}
Room {
	id = "tiezhang/dong-1",
	name = "ɽ��",
	ways = {
		["enter"] = "tiezhang/dong-2",
		["out"] = "tiezhang/dezj",
	},
}
Room {
	id = "tiezhang/dong-2",
	name = "ɽ��",
	ways = {
		["enter"] = "tiezhang/dong-3",
		["out"] = "tiezhang/dong-1",
	},
}
Room {
	id = "tiezhang/dong-3",
	name = "ɽ��",
	ways = {
		["enter"] = "tiezhang/trdx",
		["out"] = "tiezhang/dong-2",
	},
}
Room {
	id = "tiezhang/gjfang",
	name = "���߷�",
	no_fight = true,
	ways = {
		["west"] = "tiezhang/zoulang-4",
	},
}
Room {
	id = "tiezhang/guajia",
	name = "�ϼ�",
	ways = {
		["southeast"] = "tiezhang/shuijing",
		["west"] = "tiezhang/guangchang",
	},
	objs = {
          ["��ǧ��"] = "qiu qianzhang",
     },
}
Room {
	id = "tiezhang/guangchang",
	name = "�㳡",
	ways = {
		["northup"] = "tiezhang/wztang",
		["south"] = "tiezhang/shanlu-2",
		["east"] = "tiezhang/guajia",
		["west"] = "tiezhang/lgfang",
	},
	precmds = {
		["northup"] = "halt",
		["south"] = "halt",
		["east"] = "halt",
		["west"] = "halt",
	},
	postcmds = {
		["northup"] = "halt",
	},
	objs = {
          ["���ư�������԰�"] = "board",
          ["�ź���"] = "zhang haotian",
     },
}
Room {
	id = "tiezhang/hclu",
	name = "�Ĳ�·",
	ways = {
		["northup"] = "tiezhang/hclu-2",
		["southeast"] = "tiezhang/pingtai",
	},
	room_relative="�Ĳ�·���Ĳ�·�Kɽ��ƽ̨�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-2",
	name = "�Ĳ�·",
	ways = {
		["northwest"] = "tiezhang/hclu-3",
		["southdown"] = "tiezhang/hclu",
	},
	room_relative="�Ĳ�·�I�Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-3",
	name = "�Ĳ�·",
	ways = {
		["northup"] = "tiezhang/hclu-4",
		["southeast"] = "tiezhang/hclu-2",
	},
	room_relative="�Ĳ�·���Ĳ�·�K�Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-4",
	name = "�Ĳ�·",
	ways = {
		["northup"] = "tiezhang/hclu-5",
		["southdown"] = "tiezhang/hclu-3",
	},
	room_relative="�Ĳ�·���Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-5",
	name = "�Ĳ�·",
	ways = {
		["northwest"] = "tiezhang/hclu-6",
		["southdown"] = "tiezhang/hclu-4",
	},
	room_relative="�Ĳ�·�I�Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-6",
	name = "�Ĳ�·",
	ways = {
		["northup"] = "tiezhang/wmfeng",
		["southeast"] = "tiezhang/hclu-5",
	},
	room_relative="��������Ĳ�·�K�Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hhyang-2",
	name = "����",
	ways = {
		["west"] = "tiezhang/hhyuan-1",
	},
}
Room {
	id = "tiezhang/hhyuan-1",
	name = "��԰",
	ways = {
		["south"] = "tiezhang/hxfang",
		["north"] = "tiezhang/shanlu-3",
		["east"] = "tiezhang/hhyang-2",
		["west"] = "tiezhang/hhyuan-3",
	},
}
Room {
	id = "tiezhang/hhyuan-3",
	name = "��ɽ",
	ways = {
		["east"] = "tiezhang/hhyuan-1",
	},
}
Room {
	id = "tiezhang/hxfang",
	name = "���᷿",
	ways = {
		["south"] = "tiezhang/wztang",
		["north"] = "tiezhang/hhyuan-1",
	},
	objs = {
          ["��ǧ��"] = "qiu qianren",
     },
}
Room {
	id = "tiezhang/juebi-1",
	name = "����",
	ways = {
		["southwest"] = "tiezhang/shangu-2",
	},
}
Room {
	id = "tiezhang/kedian",
	name = "�͵�",
	ways = {
		["east"] = "tiezhang/lx",
		["give xiao 5 silver;up"] = "tiezhang/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "tiezhang/kedian2",
	name = "�͵��¥",
	ways = {
		["enter"] = "tiezhang/kedian3",
		["down"] = "tiezhang/kedian",
	},
}
Room {
	id = "tiezhang/kedian3",
	name = "�͵��¥",
	no_fight = true,
	ways = {
		["out"] = "tiezhang/kedian2",
	},
}
Room {
	id = "tiezhang/lgfang",
	name = "������",
	ways = {
		["east"] = "tiezhang/guangchang",
	},
}
Room {
	id = "tiezhang/lx",
	name = "��Ϫ",
	ways = {
		["southwest"] = "tiezhang/road-1",
		["north"] = "xiangyang/hunanroad2",
		["west"] = "tiezhang/kedian",
	},
}
Room {
	id = "tiezhang/mishi",
	name = "����",
	ways = {
		["out"] = "tiezhang/hhyuan-3",
	},
}
Room {
	id = "tiezhang/mzfeng",
	name = "Ĵָ��",
	ways = {
		["southdown"] = "tiezhang/sslu-3",
	},
}
Room {
	id = "tiezhang/pingtai",
	name = "ɽ��ƽ̨",
	ways = {
		["northup"] = "tiezhang/shanlu-6",
		["eastup"] = "tiezhang/sslu-1",
		["westup"] = "tiezhang/shanlu-5",
		["northwest"] = "tiezhang/hclu",
		["northeast"] = "tiezhang/shangu-1",
		["southdown"] = "tiezhang/shanlu-4",
	},
}
Room {
	id = "tiezhang/pubu",
	name = "�ٲ�",
	ways = {
		["northup"] = "tiezhang/xzfeng",
		["eastdown"] = "tiezhang/sblu-1",
	},
}
Room {
	id = "tiezhang/road-1",
	name = "����·",
	ways = {
		["southwest"] = "tiezhang/road-2",
		["northeast"] = "tiezhang/lx",
	},
	room_relative="��Ϫ�J����·�L����·����·",
}
Room {
	id = "tiezhang/road-2",
	name = "����·",
	ways = {
		["northeast"] = "tiezhang/road-1",
		["west"] = "tiezhang/road-3",
	},
	room_relative="����·�J����·----����·����·",
}
Room {
	id = "tiezhang/road-3",
	name = "����·",
	ways = {
		["northwest"] = "tiezhang/shanjiao",
		["east"] = "tiezhang/road-2",
	},
	room_relative="ɽ���¨I����·----����·����·",
}
Room {
	id = "tiezhang/sblu-1",
	name = "ʯ��·",
	ways = {
		["eastdown"] = "tiezhang/shanlu-5",
		["westup"] = "tiezhang/pubu",
	},
	room_relative="�ٲ���ʯ��·��ʯ��·ʯ��·",
}
Room {
	id = "tiezhang/shangu-1",
	name = "ɽ��",
	ways = {
		["southwest"] = "tiezhang/pingtai",
		["northeast"] = "tiezhang/shangu-2",
	},
	room_relative="ɽ�ȨJɽ�ȨLɽ��ƽ̨ɽ��",
}
Room {
	id = "tiezhang/shangu-2",
	name = "ɽ��",
	ways = {
		["southwest"] = "tiezhang/shangu-1",
		["northeast"] = "tiezhang/juebi-1",
	},
	room_relative="���ڨJɽ�ȨLɽ��ɽ��",
}
Room {
	id = "tiezhang/shanjiao",
	name = "ɽ����",
	ways = {
		["northup"] = "tiezhang/shanmen",
		["southeast"] = "tiezhang/road-3",
	},
}
Room {
	id = "tiezhang/shanlu-1",
	name = "ɽ·",
	ways = {
		["north"] = "tiezhang/shanlu-2",
		["southdown"] = "tiezhang/shanmen",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "tiezhang/shanlu-2",
	name = "ɽ·",
	ways = {
		["south"] = "tiezhang/shanlu-1",
		["north"] = "tiezhang/guangchang",
	},
	room_relative="�㳡��ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-3",
	name = "ɽ·",
	ways = {
		["northup"] = "tiezhang/shanlu-4",
		["south"] = "tiezhang/hhyuan-1",
	},
	room_relative="ɽ·��ɽ·����԰ɽ·",
}
Room {
	id = "tiezhang/shanlu-4",
	name = "ɽ·",
	ways = {
		["northup"] = "tiezhang/pingtai",
		["southdown"] = "tiezhang/shanlu-3",
	},
	room_relative="ɽ��ƽ̨��ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-5",
	name = "ʯ��·",
	ways = {
		["eastdown"] = "tiezhang/pingtai",
		["westup"] = "tiezhang/sblu-1",
	},
	room_relative="ʯ��·��ʯ��·��ɽ��ƽ̨ʯ��·",
}
Room {
	id = "tiezhang/shanlu-6",
	name = "ɽ·",
	ways = {
		["northup"] = "tiezhang/shanlu-7",
		["southdown"] = "tiezhang/pingtai",
	},
	room_relative="ɽ·��ɽ·��ɽ��ƽ̨ɽ·",
}
Room {
	id = "tiezhang/shanlu-7",
	name = "ɽ·",
	ways = {
		["north"] = "tiezhang/sslin-1",
		["southdown"] = "tiezhang/shanlu-6",
	},
	room_relative="�����֣�ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-8",
	name = "ɽ·",
	ways = {
		["northup"] = "tiezhang/shanlu-9",
		["southdown"] = "tiezhang/dezj",
	},
	room_relative="ɽ·��ɽ·���ڶ�ָ��ɽ·",
}
Room {
	id = "tiezhang/shanlu-9",
	name = "ɽ·",
	ways = {
		["northup"] = "tiezhang/zzfeng",
		["southdown"] = "tiezhang/shanlu-8",
	},
	room_relative="��ָ���ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanmen",
	name = "ɽ��",
	ways = {
		["northup"] = "tiezhang/shanlu-1",
		["east"] = "tiezhang/zhaigou3",
		["southdown"] = "tiezhang/shanjiao",
		["west"] = "tiezhang/zhaigou1",
	},
	blocks = {
		["northup"] = {
			{id = "heiyi bangzhong", exp = 60000, party = "���ư�"},
		},
	},
}
Room {
	id = "tiezhang/shijie-1",
	name = "ʯ��",
	ways = {
		["eastdown"] = "tiezhang/shijie-2",
		["out"] = "tiezhang/wmfeng",
	},
	room_relative="ʯ�ס�ʯ�ס�������ʯ��",
}
Room {
	id = "tiezhang/shijie-2",
	name = "ʯ��",
	ways = {
		["westup"] = "tiezhang/shijie-1",
		["northdown"] = "tiezhang/shijie-3",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "tiezhang/shijie-3",
	name = "ʯ��",
	ways = {
		["southup"] = "tiezhang/shijie-2",
		["westdown"] = "tiezhang/shishi",
	},
	room_relative="ʯ�ҡ�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "tiezhang/shishi",
	name = "ʯ��",
	ways = {
		["eastup"] = "tiezhang/shijie-3",
	},
	objs = {
	    ["�Ϲٽ���"] = "shangguan jiannan",
	},
}
Room {
	id = "tiezhang/shufang",
	name = "�鷿",
	ways = {
		["south"] = "tiezhang/zoulang-2",
	},
}
Room {
	id = "tiezhang/shuijing",
	name = "����Ȫ",
	ways = {
		["northwest"] = "tiezhang/guajia",
	},
}
Room {
	id = "tiezhang/sslin-1",
	name = "������",
	ways = {
		["south"] = "tiezhang/shanlu-7",
		["east"] = "tiezhang/sslin-2",
	},
	room_relative="�����֣�������----������----�����֣�ɽ·������",
}
Room {
	id = "tiezhang/sslin-2",
	name = "������",
	ways = {
		["north"] = "tiezhang/sslin-3",
		["west"] = "tiezhang/sslin-1",
	},
}
Room {
	id = "tiezhang/sslin-3",
	name = "������",
	ways = {
		["south"] = "tiezhang/sslin-2",
		["west"] = "tiezhang/sslin-4",
	},
	objs = {
          ["��Ƥ"] = "hu pi",
		  ["�ϻ�"] = "lao hu",
     },
}
Room {
	id = "tiezhang/sslin-4",
	name = "������",
	ways = {
		["north"] = "tiezhang/sslin-5",
		["east"] = "tiezhang/sslin-3",
	},
}
Room {
	id = "tiezhang/sslin-5",
	name = "������",
	ways = {
		["south"] = "tiezhang/sslin-4",
		["north"] = "tiezhang/dezj",
	},
}
Room {
	id = "tiezhang/sslu-1",
	name = "��ʯ·",
	ways = {
		["eastup"] = "tiezhang/sslu-2",
		["westdown"] = "tiezhang/pingtai",
	},
	room_relative="ɽ��ƽ̨����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/sslu-2",
	name = "��ʯ·",
	ways = {
		["eastup"] = "tiezhang/sslu-3",
		["westdown"] = "tiezhang/sslu-1",
	},
	room_relative="��ʯ·����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/sslu-3",
	name = "��ʯ·",
	ways = {
		["northup"] = "tiezhang/mzfeng",
		["westdown"] = "tiezhang/sslu-2",
	},
	room_relative="Ĵָ�����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/taijie-1",
	name = "ʯ��",
	ways = {
		["westdown"] = "tiezhang/taijie-2",
		["out"] = "tiezhang/trdx",
	},
}
Room {
	id = "tiezhang/taijie-2",
	name = "ʯ��",
	ways = {
		["eastup"] = "tiezhang/taijie-1",
	},
}
Room {
	id = "tiezhang/trdx",
	name = "��Ȼ��Ѩ",
	ways = {
		["out"] = "tiezhang/dong-3",
	},
}
Room {
	id = "tiezhang/wmfeng",
	name = "������",
	ways = {
		["southdown"] = "tiezhang/hclu-6",
		["#PoutShangguan"] = "tiezhang/shijie-1",
	},
	nolooks = {
		["#PoutShangguan"] = true,
	},
	lengths = {
		["#PoutShangguan"] = 10,
	},
}
Room {
	id = "tiezhang/wztang",
	name = "��ָ��",
	ways = {
		["east"] = "tiezhang/zoulang-1",
		["north"] = "tiezhang/hxfang",
		["southdown"] = "tiezhang/guangchang",
		["west"] = "tiezhang/zoulang-2",
	},
	precmds = {
		["east"] = "halt",
		["north"] = "halt",
		["southdown"] = "halt",
		["west"] = "halt",
	},
	postcmds = {
		["southdown"] = "halt",
	},
	objs = {
          ["��Х��"] = "hong xiaotian",
     },
}
Room {
	id = "tiezhang/xxsnan",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "tiezhang/zoulang-4",
	},
}
Room {
	id = "tiezhang/xxsnv",
	name = "Ů��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "tiezhang/zoulang-4",
	},
}
Room {
	id = "tiezhang/xzfeng",
	name = "Сָ��",
	ways = {
		["southdown"] = "tiezhang/pubu",
	},
}
Room {
	id = "tiezhang/zhaigou1",
	name = "կ��",
	ways = {
		["east"] = "tiezhang/shanmen",
		["west"] = "tiezhang/zhaigou2",
	},
	room_relative="կ��-----կ��-----ɽ��կ��",
}
Room {
	id = "tiezhang/zhaigou2",
	name = "կ��",
	ways = {
		["east"] = "tiezhang/zhaigou1",
	},
}
Room {
	id = "tiezhang/zhaigou3",
	name = "կ��",
	ways = {
		["east"] = "tiezhang/zhaigou4",
		["west"] = "tiezhang/shanmen",
	},
	room_relative="ɽ��-----կ��-----կ��կ��",
}
Room {
	id = "tiezhang/zhaigou4",
	name = "կ��",
	ways = {
		["west"] = "tiezhang/zhaigou3",
	},
}
Room {
	id = "tiezhang/zoulang-1",
	name = "����",
	ways = {
		["east"] = "tiezhang/zoulang-4",
		["north"] = "tiezhang/bqshi",
		["west"] = "tiezhang/wztang",
	},
	room_relative="�����ң���ָ��-----����-----��������",
}
Room {
	id = "tiezhang/zoulang-2",
	name = "����",
	ways = {
		["east"] = "tiezhang/wztang",
		["north"] = "tiezhang/shufang",
		["west"] = "tiezhang/zoulang-3",
	},
	room_relative="�鷿������-----����-----��ָ������",
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "tiezhang/zoulang-3",
	name = "����",
	ways = {
		["east"] = "tiezhang/zoulang-2",
		["north"] = "tiezhang/chufang",
	},
	room_relative="����������-----��������",
}
Room {
	id = "tiezhang/zoulang-4",
	name = "����",
	ways = {
		["south"] = "tiezhang/xxsnv",
		["north"] = "tiezhang/xxsnan",
		["east"] = "tiezhang/gjfang",
		["west"] = "tiezhang/zoulang-1",
	},
	room_relative="����Ϣ�ң�����-----����-----���߷���Ů��Ϣ������",
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "tiezhang/zzfeng",
	name = "��ָ��",
	ways = {
		["southdown"] = "tiezhang/shanlu-9",
	},
}
Room {
	id = "tls/3wg",
	name = "���޹�",
	ways = {
		["northup"] = "tls/shiyuan",
		["westup"] = "tls/longxiang1",
		["east"] = "tls/men4",
	},
}
Room {
	id = "tls/banruo",
	name = "����̨",
	ways = {
		["westdown"] = "tls/yaotai",
		["northwest"] = "tls/road2",
		["east"] = "tls/banruo1",
	},
	objs = {
          ["������ʦ"] = "liaoxiu chanshi",
     },
}
Room {
	id = "tls/banruo1",
	name = "����̨",
	ways = {
		["west"] = "tls/banruo",
	},
}
Room {
	id = "tls/baodian",
	name = "���۱���",
	ways = {
		["east"] = "tls/yaoshidian",
		["north"] = "tls/gfd",
		["southdown"] = "tls/road1",
		["west"] = "tls/dizangdian",
	},
	objs = {
          ["�����ʦ"] = "benyin dashi",
    },
	
}
Room {
	id = "tls/bingqi",
	name = "������",
	ways = {
		["west"] = "tls/cby",
	},
}
Room {
	id = "tls/bzq",
	name = "������",
	ways = {
		["south"] = "tls/bzqs",
		["north"] = "tls/bzqn",
	},
}
Room {
	id = "tls/bzqn",
	name = "������",
	ways = {
		["south"] = "tls/bzq",
		["east"] = "tls/wxj",
		["north"] = "tls/fqg",
	},
}
Room {
	id = "tls/bzqs",
	name = "�����ű�",
	ways = {
		["south"] = "tls/road5",
		["north"] = "tls/bzq",
	},
	objs = {
          ["�˿���ʦ"] = "liaokuan chanshi",
     },
}
Room {
	id = "tls/cby",
	name = "�ȱ�Ժ",
	ways = {
		["north"] = "tls/wuping",
		["east"] = "tls/bingqi",
		["west"] = "tls/road4",
	},
}
Room {
	id = "tls/chufang",
	name = "������ի��",
	no_fight = true,
	ways = {
		["east"] = "tls/zt1",
	},
	objs = {
          ["�׷�"] = "rice",
          ["����"] = "da wan",
     },
}
Room {
	id = "tls/dc1",
	name = "���ʮ�ŷ�",
	ways = {
		["north"] = "tls/ylf1",
		["southdown"] = "tls/dc2",
	},
}
Room {
	id = "tls/dc2",
	name = "���ʮ�ŷ�",
	ways = {
		["northup"] = "tls/dc1",
		["eastdown"] = "tls/dc3",
	},
}
Room {
	id = "tls/dc3",
	name = "���ʮ�ŷ�",
	ways = {
		["westup"] = "tls/dc2",
		["southdown"] = "tls/diancang",
	},
}
Room {
	id = "tls/diancang",
	name = "���ɽ",
	ways = {
		["northup"] = "tls/dc3",
		["eastdown"] = "dali/ximen",
		["eastup"] = "tls/dc3",
		["westup"] = "tls/dc3",
		["southwest"] = "dali/daliwest/nj",
	},
}
Room {
	id = "tls/dizangdian",
	name = "�زص�",
	ways = {
		["south"] = "tls/zhonglou",
		["northwest"] = "tls/yz5",
		["east"] = "tls/baodian",
	},
}
Room {
	id = "tls/dmg",
	name = "��ĸ��",
	ways = {
		["north"] = "tls/road6",
		["east"] = "tls/road4",
	},
}
Room {
	id = "tls/fqg",
	name = "��Ȫ��",
	ways = {
		["northup"] = "tls/wxt",
		["south"] = "tls/bzqn",
	},
}
Room {
	id = "tls/gate",
	name = "��ʥ��",
	ways = {
		["south"] = "tls/shanlu",
		["enter"] = "tls/road",
	},
}
Room {
	id = "tls/gfd",
	name = "��𱦵�",
	ways = {
		["south"] = "tls/baodian",
		["east"] = "tls/men1",
		["northdown"] = "tls/yz6",
		["west"] = "tls/men2",
	},
	--blocks = {
	--	["northdown"] = {
	--		{id = "benyin dashi", exp = 1350000},
	--	},
	--},
	
}
Room {
	id = "tls/gmd",
	name = "�������",
	ways = {
		["south"] = "tls/sjt",
		["east"] = "tls/yz3",
	},
}
Room {
	id = "tls/goudi",
	name = "�����ŵ�",
	ways = {
		["eastup"] = "tls/road5",
	},
}
Room {
	id = "tls/guanchong",
	name = "�س�",
}
Room {
	id = "tls/gulou",
	name = "��¥",
	ways = {
		["south"] = "tls/zt",
		["north"] = "tls/yaoshidian",
		["west"] = "tls/road1",
	},
}
Room {
	id = "tls/lang",
	name = "����",
	ways = {
		["east"] = "tls/songlin",
		["west"] = "tls/road3",
	},
}
Room {
	id = "tls/lang2",
	name = "����",
	ways = {
		["south"] = "tls/songlin2",
		["enter"] = "tls/monitang",
		["north"] = "tls/songlin1",
		["west"] = "tls/songlin",
	},
	lengths = {
	    ["south"] = 10,
		["north"] = 10,
	},
}
Room {
	id = "tls/longxiang1",
	name = "����̨",
	ways = {
		["northup"] = "tls/longxiang2",
		["eastdown"] = "tls/3wg",
		["southdown"] = "tls/longxiang3",
		["west"] = "tls/longxiang4",
	},
}
Room {
	id = "tls/longxiang2",
	name = "�����䳡-����̨",
	ways = {
		["southdown"] = "tls/longxiang1",
	},
}
Room {
	id = "tls/longxiang3",
	name = "�����䳡-����̨",
	ways = {
		["northup"] = "tls/longxiang1",
	},
}
Room {
	id = "tls/longxiang4",
	name = "�����䳡-����̨",
	ways = {
		["east"] = "tls/longxiang1",
		["west"] = "tls/shanlu-1",
	},
	objs = {
          ["������ʦ"] = "liaoxing chanshi",
     },
}
Room {
	id = "tls/lsy",
	name = "����Ժ",
	ways = {
		["out"] = "tls/songlin-1",
	},
	objs = {
          ["���ٳ���"] = "kurong zhanglao",
     },
}
Room {
	id = "tls/men1",
	name = "�����",
	ways = {
		["east"] = "tls/yz4",
		["north"] = "tls/wujingge",
		["west"] = "tls/gfd",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "tls/men2",
	name = "�����",
	ways = {
		["north"] = "tls/wuwoge",
		["east"] = "tls/gfd",
		["west"] = "tls/yz5",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "tls/men3",
	name = "������",
	ways = {
		["east"] = "tls/yaotai",
		["west"] = "tls/yz4",
	},
	nolooks = {
		["south"] = true,
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
}
Room {
	id = "tls/men4",
	name = "������",
	ways = {
		-- ["south"] = "tls/xiuxishi2",
		["east"] = "tls/yz5",
		["west"] = "tls/3wg",
	},
	nolooks = {
		["south"] = true,
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
}
Room {
	id = "tls/monitang",
	name = "Ĳ����",
	ways = {
		["out"] = "tls/lang2",
	},
	objs = {
          ["���δ�ʦ"] = "bencan dashi",
          ["�����ʦ"] = "benxiang dashi",
          ["���۴�ʦ"] = "benguan dashi",
     },
}
Room {
	id = "tls/pyd",
	name = "���ƶ�",
	no_fight = true,
	ways = {
		["northup"] = "tls/shaoshang",
		["southeast"] = "tls/shaochong",
		["southwest"] = "tls/shaoze",
		["northwest"] = "tls/guanchong",
		["north"] = "tls/shangyang",
		["northeast"] = "tls/zhongchong",
		["out"] = "tls/lsy",
	},
}
Room {
	id = "tls/pyd/guanchong",
	name = "�س�",
	ways = {
		["southeast"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/pyd",
	name = "���ƶ�",
	ways = {
		["northup"] = "tls/pyd/shaoshang",
		["southeast"] = "tls/pyd/shaochong",
		["southwest"] = "tls/pyd/shaoze",
		["northwest"] = "tls/pyd/guanchong",
		["north"] = "tls/pyd/shangyang",
		["northeast"] = "tls/pyd/zhongchong",
	},
}
Room {
	id = "tls/pyd/shangyang",
	name = "����",
	ways = {
		["south"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/shaochong",
	name = "�ٳ�",
	ways = {
		["northwest"] = "tls/pyd/shaochong",
	},
}
Room {
	id = "tls/pyd/shaoshang",
	name = "����",
	ways = {
		["southdown"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/shaoze",
	name = "����",
	ways = {
		["northeast"] = "tls/pyd/shaoze",
	},
}
Room {
	id = "tls/pyd/zhongchong",
	name = "�г�",
	ways = {
		["southwest"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/qxg",
	name = "���ĸ�",
	no_fight = true,
	ways = {
		["east"] = "tls/shiyuan",
	},
}
Room {
	id = "tls/road",
	name = "��ʯ·",
	ways = {
		["northup"] = "tls/twd",
		["east"] = "tls/yz2",
		["west"] = "tls/yz1",
		["out"] = "tls/gate",
	},
	objs = {
          ["�������±�"] = "board",
		  ["�˻���ʦ"] = "liaohuo chanshi",
     },
}
Room {
	id = "tls/road1",
	name = "��ʯ·",
	ways = {
		["northup"] = "tls/baodian",
		["southup"] = "tls/twd",
		["east"] = "tls/gulou",
		["west"] = "tls/zhonglou",
	},
	objs = {
          ["�������"] = "xinqing biqiu",
     },
}
Room {
	id = "tls/road2",
	name = "��ʯ·",
	ways = {
		["southeast"] = "tls/banruo",
		["north"] = "tls/wwj",
		["southdown"] = "tls/yaotai",
	},
}
Room {
	id = "tls/road3",
	name = "��ʯ·",
	ways = {
		["east"] = "tls/lang",
		["west"] = "tls/wwj",
	},
}
Room {
	id = "tls/road4",
	name = "��ʯ·",
	ways = {
		["north"] = "tls/sroom",
		["east"] = "tls/cby",
		["southdown"] = "tls/yz3",
		["west"] = "tls/dmg",
	},
}
Room {
	id = "tls/road5",
	name = "ʯ��·",
	ways = {
		["south"] = "tls/shiyuan",
		["north"] = "tls/bzqs",
	},
}
Room {
	id = "tls/road6",
	name = "��ʯ��",
	ways = {
		["southdown"] = "tls/dmg",
	},
}
Room {
	id = "tls/road7",
	name = "ʯ��·",
	ways = {
		["south"] = "tls/yuhua1",
		["north"] = "tls/songlin-1",
	},
}
Room {
	id = "tls/shangyang",
	name = "����",
}
Room {
	id = "tls/shanlu",
	name = "ɽ·",
	ways = {
		["south"] = "tls/ylf2",
		["north"] = "tls/gate",
	},
	objs = {
          ["����"] = "nan dizi",
          ["�θ�"] = "nan dizi",
     },
}
Room {
	id = "tls/shanlu-1",
	name = "ʯ��·",
	ways = {
		["east"] = "tls/longxiang4",
		["west"] = "tls/shanlu-2",
	},
}
Room {
	id = "tls/shanlu-2",
	name = "ʯ��·",
	ways = {
		["east"] = "tls/shanlu-1",
		["west"] = "tls/shanlu-3",
	},
}
Room {
	id = "tls/shanlu-3",
	name = "ʯ��·",
	ways = {
		["east"] = "tls/shanlu-2",
		["west"] = "tls/shanlu-4",
	},
}
Room {
	id = "tls/shanlu-4",
	name = "ʯ��·",
	ways = {
		["east"] = "tls/shanlu-3",
		["west"] = "tls/talin",
	},
}
Room {
	id = "tls/shaochong",
	name = "�ٳ�",
}
Room {
	id = "tls/shaoshang",
	name = "����",
}
Room {
	id = "tls/shaoze",
	name = "����",
}
Room {
	id = "tls/shiyuan",
	name = "���ʴ�ʿԺ",
	ways = {
		["north"] = "tls/road5",
		["southdown"] = "tls/3wg",
		["west"] = "tls/qxg",
	},
}
Room {
	id = "tls/sjt",
	name = "�о���",
	no_fight = true,
	ways = {
		["east"] = "tls/yz6",
		["north"] = "tls/gmd",
	},
}
Room {
	id = "tls/songlin",
	name = "������",
	ways = {
		["north"] = "tls/songlin2",
		["south"] = "tls/songlin1",
		["west"] = "tls/lang",
		["east"] = "tls/lang2",
	},
	lengths = {
		["north"] = 10,
	},
}
Room {
	id = "tls/songlin1",
	name = "������",
	ways = {
		["north"] = "tls/songlin2",
	},
}
Room {
	id = "tls/songlin2",
	name = "������",
	ways = {
		["north"] = "tls/songlin1",
		["west"] = "tls/songlin-3",
	},
}
Room {
	id = "tls/songlin-1",
	name = "������",
	ways = {
	    ["east"]  =  "tls/songlin-2",
		["north"] =  "tls/songlin-4",
		["west"]  =  "tls/songlin-3",
	},
	lengths = {
	    ["north"] = 3,
	},
}
Room {
	id = "tls/songlin-2",
	name = "������",
	ways = {
	    ["east"]  =  "tls/songlin-4",
		["west"]  =  "tls/songlin-3",
	},
}
Room {
	id = "tls/songlin-3",
	name = "������",
	ways = {
	    ["south"] = "tls/songlin-1",
	    ["east"] =  "tls/songlin-2",
		["west"] =  "tls/songlin-4",
	},
	lengths = {
	    ["east"] = 3,
		["west"] = 3,
	},
}
Room {
	id = "tls/songlin-4",
	name = "������",
	ways = {
	    ["south"] = "tls/songlin-3",
		["west"] =  "tls/songlin-1",
		["#outTlsSsl"] = "tls/yuhua1",
	},
	lengths = {
		["#outTlsSsl"] = 20,
	},
}
--Room {
--	id = "tls/songlin-n",
--	name = "������",
--	ways = {
--		["e;e;w;w;s;s;n;n;e;e;w;w;s;s;n;n;#outTlsSsl"] = "tls/yuhua1",
--	},
--	lengths = {
--		["e;e;w;w;s;s;n;n;e;e;w;w;s;s;n;n;#outTlsSsl"] = 2,
--	},
--}
Room {
	id = "tls/sroom",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["east"] = "tls/sroom2",
		["west"] = "tls/sroom1",
	},
}
Room {
	id = "tls/sroom1",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["east"] = "tls/sroom",
	},
}
Room {
	id = "tls/sroom2",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["west"] = "tls/sroom",
	},
}
Room {
	id = "tls/ta1",
	name = "ǧѰ����",
	ways = {
		["south"] = "tls/yz6",
		["north"] = "tls/yz3",
	},
}
Room {
	id = "tls/ta2",
	name = "���౦��",
	ways = {
		["south"] = "tls/yz4",
	},
}
Room {
	id = "tls/ta3",
	name = "��ס����",
	ways = {
		["south"] = "tls/yz5",
	},
}
Room {
	id = "tls/talin",
	name = "������",
	ways = {
		["east"] = "tls/shanlu-4",
	},
}
Room {
	id = "tls/twd",
	name = "������",
	ways = {
		["northdown"] = "tls/road1",
		["southdown"] = "tls/road",
	},
}
Room {
	id = "tls/wfd",
	name = "���",
	ways = {
		["enter"] = "tls/wfd2",
		["up"] = "tls/wxt",
	},
}
Room {
	id = "tls/wfd2",
	name = "���",
	ways = {
		["north"] = "tls/wfd3",
		["out"] = "tls/wfd",
	},
}
Room {
	id = "tls/wfd3",
	name = "����ڶ�",
	ways = {
		["south"] = "tls/wfd2",
	},
}
Room {
	id = "tls/wujingge",
	name = "�޾���",
	no_fight = true,
	ways = {
		["south"] = "tls/men1",
	},
}
Room {
	id = "tls/wuping",
	name = "��Ʒ��",
	ways = {
		["south"] = "tls/cby",
	},
}
Room {
	id = "tls/wuwoge",
	name = "���Ҹ�",
	no_fight = true,
	ways = {
		["south"] = "tls/men2",
	},
}
Room {
	id = "tls/wwj",
	name = "���޾�",
	ways = {
		["south"] = "tls/road2",
		["north"] = "tls/yuhua",
		["east"] = "tls/road3",
	},
}
Room {
	id = "tls/wxj",
	name = "���ľ�",
	ways = {
		["west"] = "tls/bzqn",
	},
}
Room {
	id = "tls/wxt",
	name = "��ѩͤ",
	ways = {
		["down"] = "tls/wfd",
		["southdown"] = "tls/fqg",
	},
}
Room {
	id = "tls/xdt",
	name = "С����",
	ways = {
		["west"] = "tls/songlin-2",
	},
}
Room {
	id = "tls/xiuxishi1",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "tls/men3",
	},
}
Room {
	id = "tls/xiuxishi2",
	name = "��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "tls/men4",
	},
}
Room {
	id = "tls/xmd",
	name = "���ֵ�",
	ways = {
		["south"] = "tls/ytd",
		["west"] = "tls/yz3",
	},
}
Room {
	id = "tls/yaofang",
	name = "ҩ��",
	ways = {
		["north"] = "tls/yaotai",
	},
	objs = {
          ["������ʦ"] = "liaoming chanshi",
     },
}
Room {
	id = "tls/yaoshidian",
	name = "ҩʦ��",
	ways = {
		["south"] = "tls/gulou",
		["northeast"] = "tls/yz4",
		["west"] = "tls/baodian",
	},
}
Room {
	id = "tls/yaotai",
	name = "�嶼��̨",
	ways = {
		["northup"] = "tls/road2",
		["eastup"] = "tls/banruo",
		["south"] = "tls/yaofang",
		["west"] = "tls/men3",
	},
	nolooks = {
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
	objs = {
          ["������ʦ"] = "liaoqing chanshi",
     },
}
Room {
	id = "tls/ylf",
	name = "Ӧ�ַ�",
	ways = {
		["northdown"] = "tls/ylf2",
		["southdown"] = "tls/ylf1",
	},
}
Room {
	id = "tls/ylf1",
	name = "Ӧ�ַ���",
	ways = {
		["northup"] = "tls/ylf",
		["south"] = "tls/dc1",
	},
}
Room {
	id = "tls/ylf2",
	name = "Ӧ�ַ山",
	ways = {
		["southup"] = "tls/ylf",
		["north"] = "tls/shanlu",
	},
	objs = {
          ["��¹"] = "huang lu",
          ["Ұ��"] = "ye zhu",
     },
}
Room {
	id = "tls/ytd",
	name = "Բͨ��",
	ways = {
		["north"] = "tls/xmd",
		["west"] = "tls/yz6",
	},
}
Room {
	id = "tls/yuhua",
	name = "�껨Ժ",
	ways = {
		["south"] = "tls/wwj",
		["enter"] = "tls/yuhua1",
		["east"] = "tls/songlin2",
	},
	lengths = {
	    ["east"] = 15,
	},
}
Room {
	id = "tls/yuhua1",
	name = "�껨��",
	ways = {
		["north"] = "tls/road7",
		["out"] = "tls/yuhua",
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = "tls/lsy",
	--	["#toXdt"] = "tls/xdt",
	},
	nolooks = {
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = true,
	--	["#toXdt"] = true,
	},
	lengths = {
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = 13,
	--	["#toXdt"] = "if 1<0 then return false else return 50 end",
	},
	objs = {
          ["��˼��ʦ"] = "liaosi chanshi",
     },
}
Room {
	id = "tls/yz1",
	name = "����Ժ",
	ways = {
		["north"] = "tls/zt1",
		["east"] = "tls/road",
	},
}
Room {
	id = "tls/yz2",
	name = "����Ժ",
	ways = {
		["north"] = "tls/zt",
		["west"] = "tls/road",
	},
}
Room {
	id = "tls/yz3",
	name = "����Ժ",
	ways = {
		["northup"] = "tls/road4",
		["south"] = "tls/ta1",
		["east"] = "tls/xmd",
		["west"] = "tls/gmd",
	},
}
Room {
	id = "tls/yz4",
	name = "����Ժ",
	ways = {
		["southwest"] = "tls/yaoshidian",
		["north"] = "tls/ta2",
		["east"] = "tls/men3",
		["west"] = "tls/men1",
	},
}
Room {
	id = "tls/yz5",
	name = "����Ժ",
	ways = {
		["southeast"] = "tls/dizangdian",
		["north"] = "tls/ta3",
		["east"] = "tls/men2",
		["west"] = "tls/men4",
	},
}
Room {
	id = "tls/yz6",
	name = "����Ժ",
	ways = {
		["southup"] = "tls/gfd",
		["east"] = "tls/ytd",
		["north"] = "tls/ta1",
		["west"] = "tls/sjt",
	},
}
Room {
	id = "tls/zhongchong",
	name = "�г�",
}
Room {
	id = "tls/zhonglou",
	name = "��¥",
	ways = {
		["south"] = "tls/zt1",
		["east"] = "tls/road1",
		["north"] = "tls/dizangdian",
	},
}
Room {
	id = "tls/zt",
	name = "������ի��",
	no_fight = true,
	ways = {
		["south"] = "tls/yz2",
		["north"] = "tls/gulou",
	},
	objs = {
          ["����"] = "da wan",
     },
}
Room {
	id = "tls/zt1",
	name = "������ի��",
	no_fight = true,
	ways = {
		["south"] = "tls/yz1",
		["north"] = "tls/zhonglou",
		["west"] = "tls/chufang",
	},
	objs = {
          ["���"] = "qing cai",
          ["����"] = "da wan",
          ["�׷�"] = "rice",
     },
}
Room {
	id = "village/caidi",
	name = "�˵�",
	ways = {
		["#hscaidi"] = "village/zhongxin",
	},
	nolooks = {
		["#hscaidi"] = true,
		["south"] = true,
		["north"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["#hscaidi"] = 500,
	},
}
Room {
	id = "village/eexit",
	name = "�����",
	ways = {
		["east"] = "huashan/path1",
		["west"] = "village/shilu6",
	},
}
Room {
	id = "village/hsroad3",
	name = "����·",
	ways = {
		["south"] = "xiangyang/shanxiroad2",
		["north"] = "village/sexit",
	},
}
Room {
	id = "village/jiusi",
	name = "����",
	ways = {
		["south"] = "village/shilu3",
	},
}
Room {
	id = "village/miaoyu",
	name = "��̳��",
	ways = {
		["north"] = "village/shilu5",
	},
}
Room {
	id = "village/minfang1",
	name = "��",
	ways = {
		["east"] = "village/shilu1",
	},
	room_relative="��-----��ʯ·��",
}
Room {
	id = "village/minfang2",
	name = "��",
	ways = {
		["north"] = "village/shilu6",
	},
	room_relative="��ʯ·������",
}
Room {
	id = "village/sexit",
	name = "�ϴ��",
	ways = {
		["south"] = "village/hsroad3",
		["north"] = "village/shilu1",
	},
}
Room {
	id = "village/shilu1",
	name = "��ʯ·",
	ways = {
		["south"] = "village/sexit",
		["north"] = "village/shilu2",
		["west"] = "village/minfang1",
	},
	room_relative="��ʯ·����----��ʯ·���ϴ����ʯ·",
}
Room {
	id = "village/shilu2",
	name = "��ʯ·",
	ways = {
		["south"] = "village/shilu1",
		["north"] = "village/zhongxin",
		["east"] = "village/tiejiangpu",
	},
	room_relative="�����ģ���ʯ·----�����̣���ʯ·��ʯ·",
}
Room {
	id = "village/shilu3",
	name = "��ʯ·",
	ways = {
		["east"] = "village/zhongxin",
		["north"] = "village/jiusi",
		["west"] = "village/shilu5",
	},
	room_relative="��������ʯ·----��ʯ·----��������ʯ·",
}
Room {
	id = "village/shilu4",
	name = "��ʯ·",
	ways = {
		["north"] = "village/zahuopu",
		["east"] = "village/shilu6",
		["west"] = "village/zhongxin",
	},
	room_relative="�ӻ��̣�������----��ʯ·----��ʯ·��ʯ·",
}
Room {
	id = "village/shilu5",
	name = "��ʯ·",
	ways = {
		["south"] = "village/miaoyu",
		["northwest"] = "group/entry/caeroad3",
		["east"] = "village/shilu3",
	},
	room_relative="��·�I��ʯ·----��ʯ·����̳����ʯ·",
}
Room {
	id = "village/shilu6",
	name = "��ʯ·",
	ways = {
		["south"] = "village/minfang2",
		["east"] = "village/eexit",
		["west"] = "village/shilu4",
	},
	room_relative="��ʯ·----��ʯ·----����ڣ�����ʯ·",
}
Room {
	id = "village/tiejiangpu",
	name = "������",
	ways = {
		["west"] = "village/shilu2",
	},
}
Room {
	id = "village/zahuopu",
	name = "�ӻ���",
	ways = {
		["south"] = "village/shilu4",
	},
}
Room {
	id = "village/zhongxin",
	name = "������",
	ways = {
		["south"] = "village/shilu2",
		["east"] = "village/shilu4",
		["west"] = "village/shilu3",
		["northwest"] = "village/caidi",
		["northeast"] = "village/caidi",
	},
	postcmds = {
		["northwest"] = "#walkBusy",
		["northeast"] = "#walkBusy",
	},
	lengths = {
		["northwest"] = 3,
		["northeast"] = 3,
	},
}

Room {
	id = "wizard/guest_room",
	name = "�����",
	ways = {
		["southeast"] = "city/chmiao",
		-- ["up"] = "wizard/wizard_room",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "wizard/lt",
	name = "�����",
	ways = {
		["south"] = "wizard/ltc",
		["north"] = "wizard/ltd",
		["east"] = "wizard/lta",
		["west"] = "wizard/ltb",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt1",
	name = "������",
	ways = {
		["south"] = "wizard/lt1c",
		["north"] = "wizard/lt1d",
		["east"] = "wizard/lt1a",
		["west"] = "wizard/lt1b",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt1a",
	name = "�����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1b",
	name = "�����Ŷ���̨",
	ways = {
		["east"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1c",
	name = "�����Ŷ���̨",
	ways = {
		["north"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1d",
	name = "�����Ŷ���̨",
	ways = {
		["south"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt2",
	name = "������",
	ways = {
		["south"] = "wizard/lt2c",
		["north"] = "wizard/lt2d",
		["east"] = "wizard/lt2a",
		["west"] = "wizard/lt2b",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt2a",
	name = "�����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2b",
	name = "�����Ŷ���̨",
	ways = {
		["east"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2c",
	name = "�����Ŷ���̨",
	ways = {
		["north"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2d",
	name = "�����Ŷ���̨",
	ways = {
		["south"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lta",
	name = "����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltb",
	name = "���������̨",
	ways = {
		["east"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltc",
	name = "������Ͽ�̨",
	ways = {
		["north"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltd",
	name = "����ű���̨",
	ways = {
		["south"] = "wizard/lt",
	},
}
Room {
	id = "wizard/wizard_meet",
	name = "��ʦ������",
	ways = {
		["down"] = "wizard/guest_room",
		["west"] = "wizard/wizard_room",
	},
}
Room {
	id = "wizard/wizard_room",
	name = "��ʦ��Ϣ��",
	ways = {
		["down"] = "wizard/guest_room",
		["up"] = "wizard/zoulang",
	},
}
Room {
	id = "wizard/zoulang",
	name = "����",
}
Room {
	id = "wudang/caihong",
	name = "���ʺ�",
	ways = {
		["northup"] = "wudang/wangbei",
		["southup"] = "wudang/shibapan",
	},
}
Room {
	id = "wudang/chating",
	name = "��ͤ",
	ways = {
		["northwest"] = "wudang/wdroad8",
	},
	objs = {
          ["�һ�����"] = "tao hua",
           },
}
Room {
	id = "wudang/chufang",
	name = "����",
	no_fight = true,
	ways = {
		["west"] = "wudang/donglang2",
	},
	objs = {
          ["�����"] = "dawan cha",
          ["���"] = "xiang cha",
           },
}
Room {
	id = "wudang/donglang1",
	name = "��������",
	ways = {
		["south"] = "wudang/xiuxishi2",
		["east"] = "wudang/xiaolu1",
		["west"] = "wudang/jingge",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "wudang/donglang2",
	name = "��������",
	ways = {
		["south"] = "wudang/xiuxishi1",
		["east"] = "wudang/chufang",
		["west"] = "wudang/xiaolu1",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "wudang/feisheng",
	name = "������",
	ways = {
		["northeast"] = "wudang/zhenqing",
	},
}
Room {
	id = "wudang/fuzhen",
	name = "�����",
	ways = {
		["westup"] = "wudang/shijie2",
		["northdown"] = "wudang/shibapan",
		["west"] = "wudang/laojun",
	},
	objs = {
          ["�������"] = "guxu daozhang",
           },
}
Room {
	id = "wudang/gchang",
	name = "�䵱�㳡",
	ways = {
		["south"] = "wudang/zhenqing",
		["north"] = "wudang/nanyan",
	},
}
Room {
	id = "wudang/gsdao1",
	name = "�����",
	ways = {
		["southup"] = "wudang/yuanhe",
		["northdown"] = "wudang/shijie1",
	},
}
Room {
	id = "wudang/gsdao2",
	name = "�����",
	ways = {
		["southup"] = "wudang/yuzhen",
		["northdown"] = "wudang/yuanhe",
	},
}
Room {
	id = "wudang/gsdao3",
	name = "�����",
	ways = {
		["southwest"] = "wudang/leishen",
		["east"] = "wudang/zhanqi",
	},
}
Room {
	id = "wudang/gsdao4",
	name = "�����",
	ways = {
		["southup"] = "wudang/shijie4",
		["northdown"] = "wudang/zhenqing",
	},
}
Room {
	id = "wudang/gsdao5",
	name = "�����",
	ways = {
		["southup"] = "wudang/langmei",
		["northdown"] = "wudang/shijie4",
	},
}
Room {
	id = "wudang/gsdao6",
	name = "�����",
	ways = {
		["westdown"] = "wudang/qtguan",
		["eastup"] = "wudang/hldong",
	},
}
Room {
	id = "wudang/hldong",
	name = "������",
	ways = {
		["southup"] = "wudang/taihe",
		["westdown"] = "wudang/gsdao6",
	},
}
Room {
	id = "wudang/houshan/hsxl1",
	name = "С·",
	ways = {
		["northdown"] = "wudang/houshan/hsxl2",
		["pa up"] = "wudang/houshan/taoyuan1",
	},
	nolooks = {
		["pa up"] = true,
	},
}
Room {
	id = "wudang/houshan/hsxl2",
	name = "ɽ·",
	ways = {
		["southup"] = "wudang/houshan/hsxl1",
		["northdown"] = "wudang/houshan/hsxl3",
	},
}
Room {
	id = "wudang/houshan/hsxl3",
	name = "ɽ·",
	ways = {
		["southup"] = "wudang/houshan/hsxl2",
		["northdown"] = "wudang/houshan/hsxl4",
	},
}
Room {
	id = "wudang/houshan/hsxl4",
	name = "ɽ·",
	ways = {
		["southup"] = "wudang/houshan/hsxl3",
		["northdown"] = "wudang/houshan/hsxl5",
	},
}
Room {
	id = "wudang/houshan/hsxl5",
	name = "С·",
	ways = {
		["southup"] = "wudang/houshan/hsxl4",
		["northwest"] = "wudang/shanlu2",
	},
}
Room {
	id = "wudang/houshan/maowu",
	name = "é��",
	ways = {
		["north"] = "wudang/houshan/taoyuan3",
	},
}
Room {
	id = "wudang/houshan/taoyuan1",
	name = "�嶥",
	ways = {
		["east"] = "wudang/houshan/taoyuan3",
		["down"] = "wudang/houshan/hsxl1",
		["west"] = "wudang/houshan/taoyuan2",
	},
}
Room {
	id = "wudang/houshan/taoyuan3",
	name = "ɽ��",
	ways = {
		["west"] = "wudang/houshan/taoyuan1",
		["#Wdmw"] = "wudang/houshan/maowu",
	},
	nolooks = {
		["#Wdmw"] = true,
	},
	lengths = {
		["#Wdmw"] = 100,
	},
}
-----------------by fqyy 20170508 �䵱��ɽ���ִ���--------------
Room {
	id = "wudang/houshan/taoyuan2",
	name = "ɽ��",
	ways = {
		["east"] = "wudang/houshan/taoyuan1",
		["#inWdcl"] = "wudang/houshan/gudi",
	},
	nolooks = {
		["#inWdcl"] = true,
	},
	lengths = {
		["#inWdcl"] = "if skills['hand'] and skills['hand'].lvl>80 and skills['dodge'] and skills['dodge'].lvl>100 and skills['force'] and skills['force'].lvl>100 then return 100 else return false end",
	},
}
Room {
	id = "wudang/houshan/gudi",
	name = "�ȵ�",
	ways = {
		["southeast"] = "wudang/houshan/clbinyuan1",
	},
}
Room {
	id = "wudang/houshan/clbinyuan1",
	name = "���ֱ�Ե",
	ways = {
		["northwest"] = "wudang/houshan/gudi",
		["zuan conglin"] = "wudang/houshan/conglinlh",
	},
	nolooks = {
		["zuan conglin"] = true,
	},
	room_relative="�ȵרI���ֱ�Ե���ֱ�Ե",
}
Room {
	id = "wudang/houshan/conglinlh",
	name = "�һ����",
	ways = {
		["#outWdcllh"] = "wudang/houshan/conglinly",
	},
	nolooks = {
		["#outWdcllh"] = true,
	},
}
Room {
	id = "wudang/houshan/conglinly",
	name = "��Ҷ����",
	ways = {
		["#outWdclly"] = "wudang/houshan/conglinjx",
	},
	nolooks = {
		["#outWdclly"] = true,
	},
	--blocks = {
	--	["#outWdclly"] = {
	--		{id = "du she", exp = 10000},
	--		{id = "ju mang", exp = 10000},
	--		{id = "Ye zhu", exp = 10000},			
	--	},
	--},
}
Room {
	id = "wudang/houshan/conglinjx",
	name = "��ѩ����",
	ways = {
		["#outWdcljx"] = "wudang/houshan/conglinky",
	},
	nolooks = {
		["#outWdcljx"] = true,
	},
	--blocks = {
	--	["#outWdcljx"] = {
	--		{id = "bai xiong", exp = 10000},
	--		{id = "bao zi", exp = 10000},
	--		{id = "lao hu", exp = 10000},
	--	},
	--},
}
Room {
	id = "wudang/houshan/conglinky",
	name = "��Ҷ����",
	ways = {
		["#outWdclky"] = "wudang/houshan/clbianyuan2",
	},
	nolooks = {
		["#outWdclky"] = true,
	},
}
Room {
	id = "wudang/houshan/clbianyuan2",
	name = "���ֱ�Ե",
	ways = {
		["#wdclToHsda"] = "xiangyang/hanshui2",
	},
	nolooks = {
		["#wdclToHsda"] = true,
	},
	room_relative="��Ҷ������Ҷ������Ҷ���֨I���J���ֱ�Ե����Ҷ���ִ��ֱ�Ե",
}
-----------------------------------------------------------------
Room {
	id = "wudang/houyuan",
	name = "��ɽСԺ",
	ways = {
		["north"] = "wudang/yuanmen",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["������"] = "zhang sanfeng",
           },
}
Room {
	id = "wudang/jindian",
	name = "���",
	ways = {
		["east"] = "wudang/taihe",
	},
}
Room {
	id = "wudang/jingge",
	name = "�ؾ���",
	ways = {
		["east"] = "wudang/donglang1",
	},
	objs = {
          ["���¾�����һ�¡�"] = "jing",
           },
}
Room {
	id = "wudang/langmei",
	name = "��÷��",
	ways = {
		["westup"] = "wudang/qtguan",
		["northwest"] = "wudang/yxyan",
		["east"] = "wudang/shanlu2",
		["northdown"] = "wudang/gsdao5",
	},
}
Room {
	id = "wudang/laojun",
	name = "�Ͼ���",
	ways = {
		["east"] = "wudang/fuzhen",
	},
}
Room {
	id = "wudang/ldfang",
	name = "������",
	ways = {
		["west"] = "wudang/zoulang2",
	},
	objs = {
          ["�����"] = "yu daiyan",
           },
}
Room {
	id = "wudang/leishen",
	name = "����",
	ways = {
		["northeast"] = "wudang/gsdao3",
	},
}
Room {
	id = "wudang/lgfang",
	name = "������",
	ways = {
		["south"] = "wudang/zoulang1",
	},
	objs = {
          ["ܽ�ؽ���"] = "furong jinzhen",
           },
}
Room {
	id = "wudang/lwhole",
	name = "ʯ���Ҷ�",
	no_fight = true,
	ways = {
		["out"] = "wudang/wanniansong",
	},
}
Room {
	id = "wudang/mozhen",
	name = "ĥ�뾮",
	ways = {
		["southup"] = "wudang/wangbei",
		["eastup"] = "wudang/yuxuyan",
		["northdown"] = "wudang/yuxu",
	},
}
Room {
	id = "wudang/nanyan",
	name = "��ʥ���ҹ�",
	ways = {
		["south"] = "wudang/gchang",
		["northdown"] = "wudang/zixia",
	},
	objs = {
          ["������"] = "chen yunqing",
           },
}
Room {
	id = "wudang/qtguan",
	name = "��̨��",
	ways = {
		["eastdown"] = "wudang/langmei",
		["eastup"] = "wudang/gsdao6",
	},
}
Room {
	id = "wudang/sanqing",
	name = "�����",
	no_fight = true,
	ways = {
		["south"] = "wudang/xiaolu1",
		["north"] = "wudang/zoulang1",
		["out"] = "wudang/zhenqing",
	},
	objs = {
          ["��Զ��"] = "song yuanqiao",
          ["̫������ͼ"] = "board",
           },
}
Room {
	id = "wudang/shanlu1",
	name = "ɽ·",
	ways = {
		["westup"] = "wudang/yuxu",
		["northdown"] = "wudang/wdbolin",
	},
}
Room {
	id = "wudang/shanlu2",
	name = "ɽ·",
	ways = {
		["southeast"] = "wudang/houshan/hsxl5",
		["west"] = "wudang/langmei",
		["give caiyao yao chu"] = "wudang/houshan/gudao1",
	},
	objs = {
          ["��ҩ����"] = "caiyao daozhang",
    },
	room_relative="��÷��-----ɽ·�KС·ɽ·",
	nolooks = {
		["give caiyao yao chu"] = true,
	},
	lengths = {
		["give caiyao yao chu"] = "if Bag['ҩ��'] then return 15 else return false end",
	},
}
----------fqyy ����--------------
Room {
	id = "wudang/houshan/gudao1",
	name = "�ŵ�",
	ways = {
		["eastup"] = "wudang/houshan/gudao2",
		["#OutWdhs"] = "wudang/shanlu2",
	},
	objs = {
          ["����"] = "du she",
    },
	room_relative="ɽ·���ŵ����ŵ��ŵ�",
	lengths = {
		["#OutWdhs"] = 15,
	},
	
}
Room {
	id = "wudang/houshan/gudao2",
	name = "�ŵ�",
	ways = {
		["southup"] = "wudang/houshan/husunchou",
		["northdown"] = "wudang/houshan/gudao3",
		["westdown"] = "wudang/houshan/gudao1",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
    },
	room_relative="�ŵ����ŵ����ŵ��������ŵ�",
}
Room {
	id = "wudang/houshan/gudao3",
	name = "�ŵ�",
	ways = {
		["southup"] = "wudang/houshan/gudao2",
	},
	objs = {
          ["Ұ��"] = "ye tu",
    },
	room_relative="�ŵ����ŵ��ŵ�",
}
Room {
	id = "wudang/houshan/husunchou",
	name = "�����",
	ways = {
		["northdown"] = "wudang/houshan/gudao2",
	},
	objs = {
          ["����"] = "hou zi",
    },
}
----------------------------------
Room {
	id = "wudang/shanlu3",
	name = "��ľ��",
	ways = {
		["west"] = "wudang/shanlu2",
	},
}
Room {
	id = "wudang/shibapan",
	name = "ʮ����",
	ways = {
		["southup"] = "wudang/fuzhen",
		["northdown"] = "wudang/caihong",
	},
}
Room {
	id = "wudang/shijie1",
	name = "ʯ��",
	ways = {
		["southup"] = "wudang/gsdao1",
		["northdown"] = "wudang/xuanyue",
	},
}
Room {
	id = "wudang/shijie2",
	name = "ʯ��",
	ways = {
		["southup"] = "wudang/zhanqi",
		["eastdown"] = "wudang/fuzhen",
	},
}
Room {
	id = "wudang/shijie3",
	name = "ʯ��",
	ways = {
		["southup"] = "wudang/zxgdamen",
		["northdown"] = "wudang/zhanqi",
	},
}
Room {
	id = "wudang/shijie4",
	name = "ʯ��",
	ways = {
		["southup"] = "wudang/gsdao5",
		["northdown"] = "wudang/gsdao4",
	},
}
Room {
	id = "wudang/taihe",
	name = "����̫�͹�",
	ways = {
		["northdown"] = "wudang/hldong",
		["west"] = "wudang/jindian",
	},
}
Room {
	id = "wudang/wangbei",
	name = "������",
	ways = {
		["northdown"] = "wudang/mozhen",
		["southdown"] = "wudang/caihong",
	},
}
Room {
	id = "wudang/wanniansong",
	name = "������",
	ways = {
		["enter"] = "wudang/lwhole",
	},
}
Room {
	id = "wudang/wdbolin",
	name = "�䵱����",
	ways = {
		["southup"] = "wudang/shanlu1",
		["eastdown"] = "wudang/yuzhen",
	},
}

Room {
	id = "wudang/wdroad6",
	name = "����·",
	ways = {
		["east"] = "xiangyang/hanshui2",
		["west"] = "group/entry/wdroad7",
	},
	objs = {
		["Ȫ����"] = "quan jiannan",
		["���������"] = "qinglong dizi",
		 },
}
Room {
	id = "wudang/wdroad8",
	name = "ɽ����",
	ways = {
		["southeast"] = "wudang/chating",
		["east"] = "group/entry/wdroad7",
		["west"] = "wudang/xuanyue",
	}, 
}
Room {
	id = "wudang/wulong",
	name = "������",
	ways = {
		["eastdown"] = "wudang/yxyan",
	},
}
Room {
	id = "wudang/xiaolu1",
	name = "С��",
	ways = {
		["south"] = "wudang/xiaolu2",
		["north"] = "wudang/sanqing",
		["east"] = "wudang/donglang2",
		["west"] = "wudang/donglang1",
	},
	objs = {
	    ["������"] = "yu lianzhou",
	},
}
Room {
	id = "wudang/xiaolu2",
	name = "С��",
	ways = {
		["south"] = "wudang/yuanmen",
		["north"] = "wudang/xiaolu1",
		--["#wdYm"] = "wudang/yuanmen",
		["s"] = "wudang/xiaolu3",
	},
	lengths = {
		["south"] = "if score.master and hp.shen>=0 and score.master=='������' then return 3 else return false end",
		--["#wdYm"] = "if score.master and score.master=='������' then return false else return 5 end",
		["s"] = "if score.master and score.master=='������' then return false else return 1 end",
	},
}
Room {
	id = "wudang/xiaolu3",
	name = "С��",
	ways = {
		["east"] = "wudang/xiaolu4",
		["west"] = "wudang/xiaolu5",
		["north"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu4",
	name = "С��",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu5",
		["south"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu5",
	name = "С��",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu4",
		["south"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu6",
	name = "С��",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu4",
		["south"] = "wudang/xiaolu5",
		["north;north;north;north;north;north;north;north;north;north"] = "wudang/lgfang",
		["#wdYm"] = "wudang/yuanmen",
	},
	lengths = {
	    ["north;north;north;north;north;north;north;north;north;north"] = 10,
		["#wdYm"] = 5,
	},
}

Room {
	id = "wudang/xiuxishi1",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "wudang/donglang2",
	},
}
Room {
	id = "wudang/xiuxishi2",
	name = "Ů��Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "wudang/donglang1",
	},
}
Room {
	id = "wudang/xuanyue",
	name = "������",
	ways = {
		["southup"] = "wudang/shijie1",
		["east"] = "wudang/wdroad8",
	},
}
Room {
	id = "wudang/yaofang",
	name = "ҩ��",
	no_fight = true,
	ways = {
		["east"] = "wudang/zoulang3",
	},
	objs = {
          ["��¯"] = "dan lu",
           },
}
Room {
	id = "wudang/yuanhe",
	name = "Ԫ�͹�",
	ways = {
		["southup"] = "wudang/gsdao2",
		["east"] = "wudang/yuanhe1",
		["northdown"] = "wudang/gsdao1",
	},
}
Room {
	id = "wudang/yuanhe1",
	name = "Ԫ�͹۴��",
	ways = {
		["west"] = "wudang/yuanhe",
	},
}
Room {
	id = "wudang/yuanmen",
	name = "Ժ��",
	ways = {
		["ask yin liting about ����ܽ;open door;south"] = "wudang/houyuan",
		["north;north;north;north;north;north;north;north;north;north"] = "wudang/lgfang",
		["north"] = "wudang/xiaolu2",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["ask yin liting about ����ܽ;open door;south"] = 3 ,
		["north;north;north;north;north;north;north;north;north;north"] = "if score.master and score.master=='������' then return false else return 10 end",
		["north"] = "if score.master and score.master=='������' then return 3 else return false end",
	},
	objs = {
          ["����ͤ"] = "yin liting",
           },
}
Room {
	id = "wudang/yuxu",
	name = "���鹬",
	ways = {
		["southup"] = "wudang/mozhen",
		["eastdown"] = "wudang/shanlu1",
	},
}
Room {
	id = "wudang/yuxuyan",
	name = "������",
	ways = {
		["westdown"] = "wudang/mozhen",
	},
}
Room {
	id = "wudang/yuzhen",
	name = "���湬",
	ways = {
		["westup"] = "wudang/wdbolin",
		["northdown"] = "wudang/gsdao2",
	},
	objs = {
          ["֪�͵���"] = "zhike daozhang",
          ["������"] = "gongde xiang",
           },
}
Room {
	id = "wudang/yxyan",
	name = "������",
	ways = {
		["southeast"] = "wudang/langmei",
		["westup"] = "wudang/wulong",
	},
}
Room {
	id = "wudang/zhanqi",
	name = "չ���",
	ways = {
		["southup"] = "wudang/shijie3",
		["northdown"] = "wudang/shijie2",
		["west"] = "wudang/gsdao3",
	},
}
Room {
	id = "wudang/zhenqing",
	name = "�������칬",
	ways = {
		["southup"] = "wudang/gsdao4",
		["southwest"] = "wudang/feisheng",
		["enter"] = "wudang/sanqing",
		["north"] = "wudang/gchang",
	},
	objs = {
          ["Ī����"] = "mo shenggu",
           },
}
Room {
	id = "wudang/zixia",
	name = "������",
	ways = {
		["southup"] = "wudang/nanyan",
		["out"] = "wudang/zxgdamen",
	},
	objs = {
          ["������"] = "wan qingli",
           },
}
Room {
	id = "wudang/zoulang1",
	name = "����",
	ways = {
		["south"] = "wudang/sanqing",
		["east"] = "wudang/zoulang2",
		["north"] = "wudang/lgfang",
		["west"] = "wudang/zoulang3",
	},
}
Room {
	id = "wudang/zoulang2",
	name = "��������",
	ways = {
		["east"] = "wudang/ldfang",
		["west"] = "wudang/zoulang1",
	},
}
Room {
	id = "wudang/zoulang3",
	name = "��������",
	ways = {
		["east"] = "wudang/zoulang1",
		["west"] = "wudang/yaofang",
	},
}
Room {
	id = "wudang/zxgdamen",
	name = "����������",
	ways = {
		["enter"] = "wudang/zixia",
		["northdown"] = "wudang/shijie3",
	},
	objs = {
          ["���ɵ���"] = "fengsong daozhang",
           },
}
Room {
	id = "wuguan/bingqiku",
	name = "������",
	ways = {
		["north"] = "wuguan/wuchang3",
	},
}
Room {
	id = "wuguan/caidi",
	name = "�˵�",
	ways = {
		["south"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/caiyuan",
	name = "��԰",
	ways = {
		["west"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/chaifang",
	name = "��",
	ways = {
		["east"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/chufang",
	name = "����",
	ways = {
		["east"] = "wuguan/zoulang1",
	},
}
Room {
	id = "wuguan/citang",
	name = "������",
	ways = {
		["southwest"] = "wuguan/houhuayuan",
	},
}
Room {
	id = "wuguan/dating",
	name = "��ݴ���",
	ways = {
		["eastdown"] = "wuguan/zoulang5",
		["westdown"] = "wuguan/zoulang2",
		["southeast"] = "wuguan/wupinfang",
		["enter"] = "wuguan/zoulang4",
		["southdown"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/dayuan",
	name = "���ǰԺ",
	ways = {
		["northup"] = "wuguan/dating",
		["south"] = "wuguan/qianting",
		["east"] = "wuguan/shilu4",
		["west"] = "wuguan/shilu3",
	},
}
Room {
	id = "wuguan/houhuayuan",
	name = "��԰",
	ways = {
		["south"] = "wuguan/xiaojing1",
		["northeast"] = "wuguan/citang",
	},
}
Room {
	id = "wuguan/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "wuguan/shilu1",
		["east"] = "wuguan/caiyuan",
		["north"] = "wuguan/caidi",
		["west"] = "wuguan/chaifang",
	},
}
Room {
	id = "wuguan/huilang",
	name = "����",
	ways = {
		["east"] = "wuguan/xiaojing2",
		["west"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/jiashan",
	name = "��ɽ",
	ways = {
		["south"] = "wuguan/zhulin1",
		["north"] = "wuguan/wxting",
	},
}
Room {
	id = "wuguan/jiashan1",
	name = "��ɽ",
}
Room {
	id = "wuguan/liangong",
	name = "������",
	ways = {
		["north"] = "wuguan/shilu4",
	},
}
Room {
	id = "wuguan/mafang",
	name = "���",
	ways = {
		["north"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/menlang",
	name = "����",
	ways = {
		["north"] = "wuguan/qianting",
		["west"] = "wuguan/yiguan",
		["out"] = "xiangyang/damen",
	},
	--precmds = {
	--	["out"] = "ask sun jun about ���;#walkBusy";
	--},
}
Room {
	id = "wuguan/mishi",
	name = "����",
	ways = {
		["out"] = "wuguan/jiashan1",
	},
}
Room {
	id = "wuguan/mufang",
	name = "ľ��",
	ways = {
		["east"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/pianting1",
	name = "ƫ��",
	ways = {
		["south"] = "wuguan/zoulang5",
	},
}
Room {
	id = "wuguan/qianting",
	name = "���ǰ��",
	ways = {
		["south"] = "wuguan/menlang",
		["north"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/shilu1",
	name = "��ʯ·",
	ways = {
		["south"] = "wuguan/zoulang1",
		["north"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/shilu2",
	name = "С·",
	ways = {
		["south"] = "wuguan/mafang",
		["north"] = "wuguan/wuchang2",
		["east"] = "wuguan/shuifang",
		["west"] = "wuguan/mufang",
	},
}
Room {
	id = "wuguan/shilu3",
	name = "Сʯ·",
	ways = {
		["east"] = "wuguan/dayuan",
		["west"] = "wuguan/wuchang2",
	},
}
Room {
	id = "wuguan/shilu4",
	name = "��ʯ·",
	ways = {
		["south"] = "wuguan/liangong",
		["east"] = "wuguan/wuchang3",
		["west"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/shufang",
	name = "�鷿",
	ways = {
		["south"] = "wuguan/zoulang6",
	},
}
Room {
	id = "wuguan/shuifang",
	name = "ˮ��",
	ways = {
		["west"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/woshi",
	name = "��ů��",
	ways = {
		["south"] = "wuguan/zoulang3",
	},
}
Room {
	id = "wuguan/wuchang1",
	name = "���䳡",
	ways = {
		["east"] = "wuguan/wuchang2",
	},
}
Room {
	id = "wuguan/wuchang2",
	name = "�����䳡",
	ways = {
		["south"] = "wuguan/shilu2",
		["north"] = "wuguan/zoulang1",
		["east"] = "wuguan/shilu3",
		["west"] = "wuguan/wuchang1",
	},
}
Room {
	id = "wuguan/wuchang3",
	name = "�����䳡",
	ways = {
		["south"] = "wuguan/bingqiku",
		["east"] = "wuguan/wuchang4",
		["west"] = "wuguan/shilu4",
	},
}
Room {
	id = "wuguan/wuchang4",
	name = "���䳡",
	ways = {
		["west"] = "wuguan/wuchang3",
	},
}
Room {
	id = "wuguan/wupinfang",
	name = "��Ʒ��",
	ways = {
		["northwest"] = "wuguan/dating",
	},
}
Room {
	id = "wuguan/wxting",
	name = "��ϼͤ",
	ways = {
		["south"] = "wuguan/jiashan",
		["west"] = "wuguan/xiaojing2",
	},
}
Room {
	id = "wuguan/xiangfang1",
	name = "���᷿",
	ways = {
		["east"] = "wuguan/xiangfang2",
		["west"] = "wuguan/zoulang3",
	},
}
Room {
	id = "wuguan/xiangfang2",
	name = "˯��",
	ways = {
		["west"] = "wuguan/xiangfang1",
	},
}
Room {
	id = "wuguan/xiaojing1",
	name = "С��",
	ways = {
		["south"] = "wuguan/xiaojing2",
		["north"] = "wuguan/houhuayuan",
	},
}
Room {
	id = "wuguan/xiaojing2",
	name = "ʯ��",
	ways = {
		["north"] = "wuguan/xiaojing1",
		["east"] = "wuguan/wxting",
		["west"] = "wuguan/huilang",
	},
}
Room {
	id = "wuguan/xxshi1",
	name = "����Ϣ��",
	ways = {
		["south"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/xxshi2",
	name = "Ů��Ϣ��",
	ways = {
		["north"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/yiguan",
	name = "���",
	ways = {
		["east"] = "wuguan/menlang",
	},
}
Room {
	id = "wuguan/zhangfang",
	name = "�ʷ�",
	ways = {
		["north"] = "wuguan/zoulang6",
	},
}
Room {
	id = "wuguan/zhulin1",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin1",
		["east"] = "wuguan/zhulin2",
		["north"] = "wuguan/zhulin1",
		["west"] = "wuguan/zhulin1",
	},
}
Room {
	id = "wuguan/zhulin2",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin2",
		["north"] = "wuguan/zhulin3",
		["east"] = "wuguan/zhulin2",
		["west"] = "wuguan/zhulin2",
	},
}
Room {
	id = "wuguan/zhulin3",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin3",
		["north"] = "wuguan/zhulin4",
		["east"] = "wuguan/zhulin3",
		["west"] = "wuguan/zhulin3",
	},
}
Room {
	id = "wuguan/zhulin4",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin4",
		["east"] = "wuguan/zhulin4",
		["north"] = "wuguan/zhulin4",
		["west"] = "wuguan/jiashan",
	},
}
Room {
	id = "wuguan/zoulang1",
	name = "����",
	ways = {
		["south"] = "wuguan/wuchang2",
		["east"] = "wuguan/zoulang2",
		["north"] = "wuguan/shilu1",
		["west"] = "wuguan/chufang",
	},
}
Room {
	id = "wuguan/zoulang2",
	name = "����",
	ways = {
		["eastup"] = "wuguan/dating",
		["west"] = "wuguan/zoulang1",
	},
}
Room {
	id = "wuguan/zoulang3",
	name = "����",
	ways = {
		["south"] = "wuguan/zoulang4",
		["east"] = "wuguan/xiangfang1",
		["north"] = "wuguan/woshi",
	},
}
Room {
	id = "wuguan/zoulang4",
	name = "����",
	ways = {
		["north"] = "wuguan/zoulang3",
		["out"] = "wuguan/dating",
	},
}
Room {
	id = "wuguan/zoulang5",
	name = "����",
	ways = {
		["westup"] = "wuguan/dating",
		["east"] = "wuguan/zoulang6",
		["north"] = "wuguan/pianting1",
	},
}
Room {
	id = "wuguan/zoulang6",
	name = "����",
	ways = {
		["south"] = "wuguan/zhangfang",
		["east"] = "wuguan/zoulang7",
		["north"] = "wuguan/shufang",
		["west"] = "wuguan/zoulang5",
	},
}
Room {
	id = "wuguan/zoulang7",
	name = "����",
	ways = {
		["south"] = "wuguan/xxshi2",
		["north"] = "wuguan/xxshi1",
		["east"] = "wuguan/huilang",
		["west"] = "wuguan/zoulang6",
	},
}

Room {
	id = "xiakedao/chashi",
	name = "����",
	ways = {
		["east"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/dating",
	name = "����",
	ways = {
		["east"] = "xiakedao/shufang",
		["north"] = "xiakedao/shidong5",
		["west"] = "xiakedao/wuqiku",
	},
}
Room {
	id = "xiakedao/dongmen",
	name = "����",
	ways = {
		["enter"] = "xiakedao/yingbin",
		["west"] = "xiakedao/shidong1",
	},
}
Room {
	id = "xiakedao/haigang",
	name = "���",
	ways = {
		["east"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/haitan",
	name = "��̲",
	ways = {
		["south"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin1",
	name = "����",
	ways = {
		["south"] = "xiakedao/lin2",
		["east"] = "xiakedao/lin1",
		["north"] = "xiakedao/haitan",
		["west"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin2",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin2",
		["south"] = "xiakedao/lin2",
		["east"] = "xiakedao/lin3",
		["north"] = "xiakedao/lin2",
		["northeast"] = "xiakedao/lin2",
		["west"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin3",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin4",
		["south"] = "xiakedao/lin3",
		["east"] = "xiakedao/lin3",
		["north"] = "xiakedao/lin3",
		["northeast"] = "xiakedao/lin3",
		["west"] = "xiakedao/lin2",
	},
}
Room {
	id = "xiakedao/lin4",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin4",
		["south"] = "xiakedao/lin4",
		["northwest"] = "xiakedao/lin3",
		["east"] = "xiakedao/lin4",
		["north"] = "xiakedao/lin4",
		["west"] = "xiakedao/lin5",
	},
}
Room {
	id = "xiakedao/lin5",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin5",
		["south"] = "xiakedao/lin5",
		["northwest"] = "xiakedao/lin6",
		["north"] = "xiakedao/lin5",
		["east"] = "xiakedao/lin4",
		["west"] = "xiakedao/lin5",
	},
}
Room {
	id = "xiakedao/lin6",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin5",
		["south"] = "xiakedao/lin6",
		["northwest"] = "xiakedao/lin6",
		["east"] = "xiakedao/lin7",
		["north"] = "xiakedao/lin6",
		["west"] = "xiakedao/lin6",
	},
}
Room {
	id = "xiakedao/lin7",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin7",
		["south"] = "xiakedao/lin8",
		["northwest"] = "xiakedao/lin7",
		["north"] = "xiakedao/lin7",
		["east"] = "xiakedao/lin7",
		["west"] = "xiakedao/lin6",
	},
}
Room {
	id = "xiakedao/lin8",
	name = "����",
	ways = {
		["south"] = "xiakedao/shanmen",
		["north"] = "xiakedao/lin7",
	},
}
Room {
	id = "xiakedao/midao1",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao1",
		["east"] = "xiakedao/midao2",
		["north"] = "xiakedao/midao1",
		["west"] = "xiakedao/midao1",
	},
}
Room {
	id = "xiakedao/midao2",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao3",
		["north"] = "xiakedao/midao2",
		["east"] = "xiakedao/midao2",
		["west"] = "xiakedao/midao1",
	},
}
Room {
	id = "xiakedao/midao3",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao3",
		["east"] = "xiakedao/midao3",
		["north"] = "xiakedao/midao2",
		["west"] = "xiakedao/midao4",
	},
}
Room {
	id = "xiakedao/midao4",
	name = "�ܵ�",
	ways = {
		["east"] = "xiakedao/midao3",
	},
}
Room {
	id = "xiakedao/midao5",
	name = "����ͨ��",
	ways = {
		["east"] = "xiakedao/midao4",
		["out"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/midao6",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/midao7",
	},
}
Room {
	id = "xiakedao/midao7",
	name = "����ͨ��",
	ways = {
		["northup"] = "xiakedao/midao8",
		["east"] = "xiakedao/midao6",
		["out"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/midao8",
	name = "�ܵ�",
}
Room {
	id = "xiakedao/mtdating",
	name = "����",
	ways = {
		["down"] = "xiakedao/mtyadi",
		["east"] = "xiakedao/mtxiaowu",
	},
}
Room {
	id = "xiakedao/mtroad",
	name = "ɽ·",
	ways = {
		["south"] = "xiakedao/mtyadi",
		["east"] = "xiakedao/mtroad1",
	},
}
Room {
	id = "xiakedao/mtroad1",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad2",
		["north"] = "xiakedao/mtroad1",
		["west"] = "xiakedao/mtroad",
	},
}
Room {
	id = "xiakedao/mtroad2",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad2",
		["north"] = "xiakedao/mtroad3",
		["east"] = "xiakedao/mtroad1",
		["west"] = "xiakedao/mtroad2",
	},
}
Room {
	id = "xiakedao/mtroad3",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad3",
		["east"] = "xiakedao/mtroad2",
		["west"] = "xiakedao/mtroad3",
	},
}
Room {
	id = "xiakedao/mtroad4",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad6",
		["east"] = "xiakedao/mtroad3",
		["west"] = "xiakedao/mtroad5",
	},
}
Room {
	id = "xiakedao/mtroad5",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad5",
		["north"] = "xiakedao/mtroad5",
		["east"] = "xiakedao/mtroad4",
		["west"] = "xiakedao/mtroad5",
	},
}
Room {
	id = "xiakedao/mtroad6",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad4",
		["east"] = "xiakedao/mtroad4",
		["west"] = "xiakedao/mtroad4",
	},
}
Room {
	id = "xiakedao/mtxiaowu",
	name = "ľ��",
	ways = {
		["west"] = "xiakedao/mtdating",
	},
}
Room {
	id = "xiakedao/mtyadi",
	name = "�µ�",
	ways = {
		["north"] = "xiakedao/mtroad",
	},
}
Room {
	id = "xiakedao/neiting",
	name = "����",
	ways = {
		["enter"] = "xiakedao/shihole1",
		["north"] = "xiakedao/xiuxis2",
		["east"] = "xiakedao/shibi",
		["west"] = "xiakedao/chashi",
	},
}
Room {
	id = "xiakedao/pubu",
	name = "�ٲ�",
	ways = {
		["northdown"] = "xiakedao/road4",
	},
}
Room {
	id = "xiakedao/road1",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road2",
		["northdown"] = "xiakedao/shanmen",
	},
}
Room {
	id = "xiakedao/road2",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road3",
		["northdown"] = "xiakedao/road1",
	},
}
Room {
	id = "xiakedao/road3",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road4",
		["northdown"] = "xiakedao/road2",
	},
}
Room {
	id = "xiakedao/road4",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/pubu",
		["northdown"] = "xiakedao/road3",
	},
}
Room {
	id = "xiakedao/road5",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road6",
		["north"] = "xiakedao/shidong8",
	},
}
Room {
	id = "xiakedao/road6",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road7",
		["northdown"] = "xiakedao/road5",
	},
}
Room {
	id = "xiakedao/road7",
	name = "�б�ʯ",
	ways = {
		["southup"] = "xiakedao/road8",
		["northdown"] = "xiakedao/road6",
	},
}
Room {
	id = "xiakedao/road8",
	name = "һ����",
	ways = {
		["southup"] = "xiakedao/wangyun",
		["northdown"] = "xiakedao/road7",
	},
}
Room {
	id = "xiakedao/shanmen",
	name = "ɽ��",
	ways = {
		["southup"] = "xiakedao/road1",
		["north"] = "xiakedao/lin8",
	},
}
Room {
	id = "xiakedao/shibi",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/xiaowu",
		["east"] = "xiakedao/wuchang",
		["west"] = "xiakedao/neiting",
		["out"] = "xiakedao/shimen",
	},
}
Room {
	id = "xiakedao/shidong1",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong6",
		["north"] = "xiakedao/yongdao2",
		["east"] = "xiakedao/dongmen",
	},
}
Room {
	id = "xiakedao/shidong10",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shidong9",
		["out"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/shidong2",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong2",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong3",
		["west"] = "xiakedao/shidong2",
	},
}
Room {
	id = "xiakedao/shidong3",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong4",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong3",
		["west"] = "xiakedao/shidong3",
	},
}
Room {
	id = "xiakedao/shidong4",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong4",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong4",
		["west"] = "xiakedao/shidong5",
	},
}
Room {
	id = "xiakedao/shidong5",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/dating",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong5",
		["west"] = "xiakedao/shidong5",
	},
}
Room {
	id = "xiakedao/shidong6",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong7",
		["north"] = "xiakedao/shidong1",
	},
}
Room {
	id = "xiakedao/shidong7",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shidong6",
		["west"] = "xiakedao/shidong8",
	},
}
Room {
	id = "xiakedao/shidong8",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shidong7",
	},
}
Room {
	id = "xiakedao/shidong9",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/yadi",
		["west"] = "xiakedao/shidong10",
	},
}
Room {
	id = "xiakedao/shihole1",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom02",
		["enter"] = "xiakedao/shihole2",
		["east"] = "xiakedao/shiroom03",
		["north"] = "xiakedao/shiroom01",
		["west"] = "xiakedao/shiroom04",
		["out"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/shihole2",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom06",
		["enter"] = "xiakedao/shihole3",
		["east"] = "xiakedao/shiroom07",
		["north"] = "xiakedao/shiroom05",
		["west"] = "xiakedao/shiroom08",
		["out"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shihole3",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom10",
		["enter"] = "xiakedao/shihole4",
		["east"] = "xiakedao/shiroom11",
		["north"] = "xiakedao/shiroom09",
		["west"] = "xiakedao/shiroom12",
		["out"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shihole4",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom14",
		["enter"] = "xiakedao/shihole5",
		["east"] = "xiakedao/shiroom15",
		["north"] = "xiakedao/shiroom13",
		["west"] = "xiakedao/shiroom16",
		["out"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shihole5",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom18",
		["enter"] = "xiakedao/shihole6",
		["east"] = "xiakedao/shiroom19",
		["north"] = "xiakedao/shiroom17",
		["west"] = "xiakedao/shiroom20",
		["out"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shihole6",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom22",
		["east"] = "xiakedao/shiroom23",
		["north"] = "xiakedao/shiroom21",
		["west"] = "xiakedao/shiroom24",
		["out"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shimen",
	name = "ʯ��",
	ways = {
		["enter"] = "xiakedao/shibi",
		["north"] = "xiakedao/yongdao3",
	},
}
Room {
	id = "xiakedao/shiroom01",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom02",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom03",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom04",
	name = "ʯ��",
}
Room {
	id = "xiakedao/shiroom05",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom06",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom07",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom08",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom09",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom10",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom11",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom12",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom13",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom14",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom15",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom16",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom17",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom18",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom19",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom20",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom21",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom22",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom23",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom24",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shufang",
	name = "�鷿",
}
Room {
	id = "xiakedao/wangyun",
	name = "����̨",
	ways = {
		["northdown"] = "xiakedao/road8",
	},
}
Room {
	id = "xiakedao/wuchang",
	name = "�䳡",
	ways = {
		["west"] = "xiakedao/shibi",
	},
}
Room {
	id = "xiakedao/wuqiku",
	name = "������",
	ways = {
		["east"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/xiaodian",
	name = "С�Ե�",
	ways = {
		["west"] = "xiakedao/yingbin",
	},
}
Room {
	id = "xiakedao/xiaowu",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shibi",
	},
}
Room {
	id = "xiakedao/xiuxis",
	name = "��Ϣ��",
	ways = {
		["east"] = "xiakedao/yingbin",
	},
}
Room {
	id = "xiakedao/xiuxis2",
	name = "��Ϣ��",
	ways = {
		["south"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/xkroad1",
	name = "����ɽ��",
	ways = {
		["south"] = "xiakedao/xkroad2",
	},
}
Room {
	id = "xiakedao/xkroad2",
	name = "��ɽ",
	ways = {
		["south"] = "xiakedao/xkroad3",
		["north"] = "xiakedao/xkroad1",
	},
}
Room {
	id = "xiakedao/xkroad3",
	name = "ƽԭС·",
	ways = {
		["south"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/xkroad4",
	name = "�Ϻ����",
	ways = {
		["east"] = "xiakedao/xkroad5",
		["north"] = "xiakedao/xkroad3",
		["west"] = "xiakedao/haigang",
	},
}
Room {
	id = "xiakedao/xkroad5",
	name = "���ɹ����",
	ways = {
		["north"] = "xiakedao/xkroad6",
		["west"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/xkroad6",
	name = "���С��",
	ways = {
		["south"] = "xiakedao/xkroad5",
	},
}
Room {
	id = "xiakedao/yadi",
	name = "�µ�",
}
Room {
	id = "xiakedao/yingbin",
	name = "ӭ����",
	ways = {
		["south"] = "xiakedao/shidong2",
		["east"] = "xiakedao/xiaodian",
		["west"] = "xiakedao/xiuxis",
		["out"] = "xiakedao/dongmen",
	},
}
Room {
	id = "xiakedao/yongdao1",
	name = "��",
	ways = {
		["south"] = "xiakedao/yongdao2",
		["out"] = "xiakedao/pubu",
	},
}
Room {
	id = "xiakedao/yongdao2",
	name = "��",
	ways = {
		["south"] = "xiakedao/shidong1",
		["north"] = "xiakedao/yongdao1",
	},
}
Room {
	id = "xiakedao/yongdao3",
	name = "��",
	ways = {
		["south"] = "xiakedao/shimen",
		["north"] = "xiakedao/dating",
	},
}
Room {
	id = "xiangyang/baihumen",
	name = "�׻���",
	ways = {
		["east"] = "xiangyang/bhmnj",
		["west"] = "xiangyang/outwroad1",
	},
}
Room {
	id = "xiangyang/bank",
	name = "����ի",
	ways = {
		["east"] = "xiangyang/njie3",
	},
	objs = {
          ["Ǯ����"] = "qian shanren",
           },
}
Room {
	id = "xiangyang/baozipu",
	name = "������",
	ways = {
		["east"] = "xiangyang/xcx4",
	},
	objs = {
		["������"] = "baozi wang",
	},
}
Room {
	id = "xiangyang/bcx1",
	name = "������",
	ways = {
		["east"] = "xiangyang/bjie1",
		["west"] = "xiangyang/bcx2",
	},
}
Room {
	id = "xiangyang/bcx2",
	name = "������",
	ways = {
		["south"] = "xiangyang/guangc",
		["north"] = "xiangyang/zrdian",
		["east"] = "xiangyang/bcx1",
		["west"] = "xiangyang/bcx3",
	},
	objs = {
		["�����"] = "wu dunru",
	},
}
Room {
	id = "xiangyang/bcx3",
	name = "������",
	ways = {
		["south"] = "xiangyang/bcx4",
		["north"] = "xiangyang/jianghukz",
		["east"] = "xiangyang/bcx2",
		["west"] = "xiangyang/xyudian",
	},
}
Room {
	id = "xiangyang/bcx4",
	name = "������",
	ways = {
		["south"] = "xiangyang/bhmnj",
		["north"] = "xiangyang/bcx3",
		["west"] = "xiangyang/xiaocd",
	},
}
Room {
	id = "xiangyang/bhmnj",
	name = "�׻����ڽ�",
	ways = {
		["south"] = "xiangyang/xcx1",
		["east"] = "xiangyang/xjie",
		["north"] = "xiangyang/bcx4",
		["west"] = "xiangyang/baihumen",
	},
}
Room {
	id = "xiangyang/bingying",
	name = "��Ӫ",
	ways = {
		["south"] = "xiangyang/ncx3",
	},
}
Room {
	id = "xiangyang/bjie1",
	name = "����",
	ways = {
		["south"] = "xiangyang/bjie2",
		["north"] = "xiangyang/nroad1",
		["east"] = "xiangyang/duchang",
		["west"] = "xiangyang/bcx1",
	},
	room_relative="�������ڽ֣�������-----����-----���ķ������ֱ���",
}
Room {
	id = "xiangyang/bjie2",
	name = "����",
	ways = {
		["south"] = "xiangyang/bjie3",
		["east"] = "xiangyang/chalou",
		["north"] = "xiangyang/bjie1",
	},
	room_relative="���֣�����-----����¥�����ֱ���",
	objs = {
        ["Ү����"] = "yelv qi",
    },
}
Room {
	id = "xiangyang/bjie3",
	name = "����",
	ways = {
		["south"] = "xiangyang/dpailou",
		["north"] = "xiangyang/bjie2",
		["west"] = "xiangyang/cross1",
	},
	room_relative="���֣������ֽ�-----���֣�����¥����",
}
Room {
	id = "xiangyang/caiyongmanor",
	name = "����ׯ",
	ways = {
		["north"] = "xiangyang/caiyongtomb",
		["east"] = "changan/southroad3",
	},
}
Room {
	id = "xiangyang/caiyongtomb",
	name = "����Ĺ",
	ways = {
		["south"] = "xiangyang/caiyongmanor",
	},
}
Room {
	id = "xiangyang/chalou",
	name = "����¥",
	ways = {
		["west"] = "xiangyang/bjie2",
		["up"] = "xiangyang/chalou2",
	},
}
Room {
	id = "xiangyang/chalou2",
	name = "��¥��¥",
	ways = {
		["down"] = "xiangyang/chalou",
	},
}
Room {
	id = "xiangyang/chayedian",
	name = "��Ҷ��",
	ways = {
		["east"] = "xiangyang/xcx1",
	},
}
Room {
	id = "xiangyang/chemahang",
	name = "������",
	ways = {
		["south"] = "xiangyang/ncx2",
	},
}
Room {
	id = "xiangyang/chengyipu",
	name = "������",
	ways = {
		["west"] = "xiangyang/dcx3",
	},
	objs = {
        ["������"] = "yu sanniang",
    },
}
Room {
	id = "xiangyang/chucshi",
	name = "������",
	ways = {
		["north"] = "xiangyang/yamen",
	},
}
Room {
	id = "xiangyang/conglin1",
	name = "ɽ·",
	ways = {
		["eastdown"] = "xiangyang/outsroad3",
		["westup"] = "xiangyang/conglin2",
	},
}
Room {
	id = "xiangyang/conglin2",
	name = "ɽ·",
	ways = {
		["eastdown"] = "xiangyang/conglin1",
		["westup"] = "xiangyang/conglin3",
	},
	precmds = {
	    ["eastdown"] = "halt",
		["westup"] = "halt",
	},
	lengths = {
	    ["westup"] = "if hp.exp>500000 then return 1 else return false end",
	},
}
Room {
	id = "xiangyang/conglin3",
	name = "ɽ·",
	ways = {
		["eastdown"] = "xiangyang/conglin2",
		["westup"] = "xiangyang/conglin4",
	},
	objs = {
        ["����"] = "guai mang",
    },
}
Room {
	id = "xiangyang/conglin4",
	name = "ɽ��յ�",
	ways = {
		["eastdown"] = "xiangyang/conglin3",
		["northwest"] = "gumu/xuantie/xiaolu4",
	},
	objs = {
        ["ʷ���"] = "shi shugang",
        ["ʷ��ǿ"] = "shi jiqiang",
        ["ʷ����"] = "shi bowei",
        ["ʷ����"] = "shi zhongmeng",
        ["ʷ�Ͻ�"] = "shi mengjie",
    },
}
Room {
	id = "xiangyang/cross1",
	name = "�����ֽ�",
	ways = {
		["south"] = "xiangyang/xpailou",
		["east"] = "xiangyang/bjie3",
		["west"] = "xiangyang/xjie",
	},
}
Room {
	id = "xiangyang/cross2",
	name = "�϶��ֽ�",
	ways = {
		["north"] = "xiangyang/dpailou",
		["east"] = "xiangyang/djie1",
		["west"] = "xiangyang/njie1",
	},
}
Room {
	id = "xiangyang/damen",
	name = "��ݴ���",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/eroad1",
		["enter"] = "wuguan/menlang",
	},
	lengths = {
		["enter"] = "if hp.exp < 3000 then return 1 else return false end",
	},
	objs = {
        ["�������"] = "men wei",
    },
}
Room {
	id = "xiangyang/dangpu",
	name = "����",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/djie1",
	},
	objs = {
        ["���ϰ�"] = "cui laoban",
    },
}
Room {
	id = "xiangyang/datiepu",
	name = "������",
	ways = {
		["west"] = "xiangyang/ncx5",
	},
}
Room {
	id = "xiangyang/dcx1",
	name = "������",
	ways = {
		["south"] = "xiangyang/dcx2",
		["east"] = "xiangyang/feizhai",
		["west"] = "xiangyang/nroad1",
	},
	room_relative="�������ڽ�----������----��լ�������ﶫ����",
}
Room {
	id = "xiangyang/dcx2",
	name = "������",
	ways = {
		["south"] = "xiangyang/dcx3",
		["east"] = "xiangyang/zahuopu",
		["north"] = "xiangyang/dcx1",
	},
	room_relative="�������������----�ӻ��̣������ﶫ����",
	objs = {
        ["��Ĭ��"] = "feng mofeng",
    },
}
Room {
	id = "xiangyang/dcx3",
	name = "������",
	ways = {
		["south"] = "xiangyang/dcx4",
		["north"] = "xiangyang/dcx2",
		["east"] = "xiangyang/chengyipu",
	},
	room_relative="�������������----�����̣������ﶫ����",
	objs = {
        ["��ܽ"] = "guo fu",
    },
}
Room {
	id = "xiangyang/dcx4",
	name = "������",
	ways = {
		["south"] = "xiangyang/dcx5",
		["east"] = "xiangyang/xiyuan",
		["north"] = "xiangyang/dcx3",
	},
	room_relative="�������������----ϷԺ�������ﶫ����",
}
Room {
	id = "xiangyang/dcx5",
	name = "������",
	ways = {
		["south"] = "xiangyang/djie2",
		["north"] = "xiangyang/dcx4",
	},
	room_relative="�����������������ֶ�����",
}
Room {
	id = "xiangyang/djie1",
	name = "����",
	ways = {
		["east"] = "xiangyang/djie2",
		["north"] = "xiangyang/dangpu",
		["west"] = "xiangyang/cross2",
	},
	room_relative="���̣��϶��ֽ�-----����-----���ֶ���",
}
Room {
	id = "xiangyang/djie2",
	name = "����",
	ways = {
		["east"] = "xiangyang/eroad1",
		["north"] = "xiangyang/dcx5",
		["west"] = "xiangyang/djie1",
	},
	room_relative="�����������-----����-----�������ڽֶ���",
}
Room {
	id = "xiangyang/doufufang",
	name = "������",
	ways = {
		["east"] = "xiangyang/xcx2",
	},
}
Room {
	id = "xiangyang/dpailou",
	name = "����¥",
	ways = {
		["south"] = "xiangyang/cross2",
		["north"] = "xiangyang/bjie3",
	},
}
Room {
	id = "xiangyang/duchang",
	name = "���ķ�",
	no_fight = true,
	ways = {
		["west"] = "xiangyang/bjie1",
	},
}
Room {
	id = "xiangyang/eroad1",
	name = "�������ڽ�",
	ways = {
		["south"] = "xiangyang/ncx5",
		["east"] = "xiangyang/qinglongmen",
		["north"] = "xiangyang/damen",
		["west"] = "xiangyang/djie2",
	},
}
Room {
	id = "xiangyang/feizhai",
	name = "��լ",
	ways = {
		["west"] = "xiangyang/dcx1",
	},
	objs = {
        ["��С��"] = "xu xiaowu",
        ["���"] = "xiang zhanglao",
    },
}
Room {
	id = "xiangyang/guangc",
	name = "��̨ǰ�㳡",
	ways = {
		["north"] = "xiangyang/bcx2",
		-- ["longhu"] = "wizard/lt2",
		-- ["fengyun"] = "wizard/lt1",
		-- ["tiandi"] = "wizard/lt",
	},
	nolooks = {
		["longhu"] = true,
		["fengyun"] = true,
		["tiandi"] = true,
	},
}
Room {
	id = "xiangyang/hanshui1",
	name = "��ˮ����",
	ways = {
		["east"] = "xiangyang/outnroad3",
		["dujiang"] = "xiangyang/hanshui2",
	},
	nolooks = {
		["dujiang"] = true,
	},
}
Room {
	id = "xiangyang/hanshui2",
	name = "��ˮ����",
	ways = {
		["west"] = "wudang/wdroad6",
		["dujiang"] = "xiangyang/hanshui1",
	},
	nolooks = {
		["dujiang"] = true,
	},
}
Room {
	id = "xiangyang/henanroad1",
	name = "��·",
	ways = {
		["southwest"] = "xiangyang/outnroad3",
		["northeast"] = "xiangyang/henanroad2",
	},
	room_relative="��·�J��·�L��·��·",
}
Room {
	id = "xiangyang/henanroad2",
	name = "��·",
	ways = {
		["southwest"] = "xiangyang/henanroad1",
		["north"] = "nanyang/yidao",
	},
	room_relative="�������·�L��·��·",
}
Room {
	id = "xiangyang/hunanroad1",
	name = "�������",
	ways = {
		["southwest"] = "xiangyang/hunanroad2",
		["north"] = "xiangyang/outsroad3",
	},
}
Room {
	id = "xiangyang/hunanroad2",
	name = "��Ϫ��",
	ways = {
		["southwest"] = "group/entry/mjshan2",
		["south"] = "tiezhang/lx",
		["northeast"] = "xiangyang/hunanroad1",
	},
	objs = {
        ["���Ŵ��"] = "dujiao dadao",
    },
}
Room {
	id = "xiangyang/jianghukz",
	name = "������ջ",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/bcx3",
		-- ["up"] = "xiangyang/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "xiangyang/junying",
	name = "�ɹž�Ӫ",
	ways = {
		["southwest"] = "xiangyang/outnroad2",
		["enter"] = "xiangyang/yingzhang",
	},
}
Room {
	id = "xiangyang/kezhan2",
	name = "��ջ��¥",
	no_fight = true,
	ways = {
		["down"] = "xiangyang/jianghukz",
	},
}
Room {
	id = "xiangyang/lantian",
	name = "����",
	ways = {
		["southeast"] = "xiangyang/shanxiroad2",
		["north"] = "changan/southroad3",
	},
}
Room {
	id = "xiangyang/lipindian",
	name = "��Ʒ��",
	ways = {
		["out"] = "xiangyang/cross2",
	},
}
Room {
	id = "xiangyang/lzz/chelang1",
	name = "����",
	ways = {
		["south"] = "xiangyang/lzz/yaofang",
		["east"] = "xiangyang/lzz/tjing",
		["west"] = "xiangyang/lzz/chelang2",
	},
}
Room {
	id = "xiangyang/lzz/chelang2",
	name = "����",
	ways = {
		["north"] = "xiangyang/lzz/houyuan",
		["east"] = "xiangyang/lzz/chelang1",
	},
}
Room {
	id = "xiangyang/lzz/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "xiangyang/lzz/chelang2",
		["north"] = "xiangyang/lzz/huayuan",
	},
}
Room {
	id = "xiangyang/lzz/huayuan",
	name = "��԰",
	ways = {
		["south"] = "xiangyang/lzz/houyuan",
	},
}
Room {
	id = "xiangyang/lzz/jiuguan",
	name = "�ļ�С�Ե�",
	ways = {
		["east"] = "xiangyang/lzz/liuzz",
	},
}
Room {
	id = "xiangyang/lzz/liuzz",
	name = "������",
	ways = {
		["south"] = "xiangyang/lzz/xiaolu",
		["north"] = "xiangyang/lzz/xiaohe",
		["west"] = "xiangyang/lzz/jiuguan",
	},
}
Room {
	id = "xiangyang/lzz/qiant",
	name = "ǰ��",
	ways = {
		["south"] = "xiangyang/lzz/xue_men",
		["north"] = "xiangyang/lzz/tjing",
	},
}
Room {
	id = "xiangyang/lzz/tjing",
	name = "�쾮",
	ways = {
		["south"] = "xiangyang/lzz/qiant",
		["north"] = "xiangyang/lzz/zhengt",
		["west"] = "xiangyang/lzz/chelang1",
	},
}
Room {
	id = "xiangyang/lzz/xiaohe",
	name = "С��",
	ways = {
		["south"] = "xiangyang/lzz/liuzz",
		["north"] = "xiangyang/lzz/xue_men",
	},
}
Room {
	id = "xiangyang/lzz/xiaolu",
	name = "С·",
	ways = {
		["south"] = "xiangyang/xiaolu1",
		["north"] = "xiangyang/lzz/liuzz",
	},
}
Room {
	id = "xiangyang/lzz/xue_men",
	name = "Ѧ������",
	ways = {
		["south"] = "xiangyang/lzz/xiaohe",
		["north"] = "xiangyang/lzz/qiant",
	},
}
Room {
	id = "xiangyang/lzz/yaofang",
	name = "ҩ��",
	ways = {
		["north"] = "xiangyang/lzz/chelang1",
	},
}
Room {
	id = "xiangyang/lzz/zhengt",
	name = "����",
	ways = {
		["south"] = "xiangyang/lzz/tjing",
	},
}
Room {
	id = "xiangyang/mujiangpu",
	name = "ľ����",
	ways = {
		["west"] = "xiangyang/ncx4",
	},
	objs = {
		["ľ��"] = "mu jiang",
	},
}
Room {
	id = "xiangyang/ncx1",
	name = "�ϳ���",
	ways = {
		["north"] = "xiangyang/shuoshug",
		["east"] = "xiangyang/ncx2",
		["west"] = "xiangyang/njie3",
	},
	room_relative="˵��ݣ��Ͻ�----�ϳ���----�ϳ����ϳ���",
}
Room {
	id = "xiangyang/ncx2",
	name = "�ϳ���",
	ways = {
		["east"] = "xiangyang/ncx3",
		["north"] = "xiangyang/chemahang",
		["west"] = "xiangyang/ncx1",
	},
	room_relative="�����У��ϳ���----�ϳ���----�ϳ����ϳ���",
    objs =  {
		["����"] = "guo jing",
    },
}
Room {
	id = "xiangyang/ncx3",
	name = "�ϳ���",
	ways = {
		["south"] = "xiangyang/wen/damen",
		["east"] = "xiangyang/ncx4",
		["north"] = "xiangyang/bingying",
		["west"] = "xiangyang/ncx2",
	},
	room_relative="��Ӫ���ϳ���----�ϳ���----�ϳ�����¸������ϳ���",
}
Room {
	id = "xiangyang/ncx4",
	name = "�ϳ���",
	ways = {
		["north"] = "xiangyang/ncx5",
		["east"] = "xiangyang/mujiangpu",
		["west"] = "xiangyang/ncx3",
	},
	room_relative="�ϳ�����ϳ���----�ϳ���----ľ�����ϳ���",
}
Room {
	id = "xiangyang/ncx5",
	name = "�ϳ���",
	ways = {
		["south"] = "xiangyang/ncx4",
		["north"] = "xiangyang/eroad1",
		["east"] = "xiangyang/datiepu",
	},
	room_relative="�������ڽ֣��ϳ���----�����̣��ϳ����ϳ���",
}
Room {
	id = "xiangyang/njie1",
	name = "�Ͻ�",
	ways = {
		["south"] = "xiangyang/njie2",
		["north"] = "xiangyang/xpailou",
		["east"] = "xiangyang/cross2",
		["west"] = "xiangyang/yamen",
	},
	room_relative="����¥������-----�Ͻ�-----�϶��ֽ֣��Ͻ��Ͻ�",
}
Room {
	id = "xiangyang/njie2",
	name = "�Ͻ�",
	ways = {
		["south"] = "xiangyang/njie3",
		["north"] = "xiangyang/njie1",
	},
	room_relative="�Ͻ֣��Ͻ֣��Ͻ��Ͻ�",
	objs = {
        ["����Ƽ"] = "wanyan ping",
    },
}
Room {
	id = "xiangyang/njie3",
	name = "�Ͻ�",
	ways = {
		["south"] = "xiangyang/zqmnj",
		["north"] = "xiangyang/njie2",
		["east"] = "xiangyang/ncx1",
		["west"] = "xiangyang/bank",
	},
	room_relative="�Ͻ֣�����ի-----�Ͻ�-----�ϳ������ȸ���ڽ��Ͻ�",
}
Room {
	id = "xiangyang/nroad1",
	name = "�������ڽ�",
	ways = {
		["south"] = "xiangyang/bjie1",
		["north"] = "xiangyang/xuanwumen",
		["east"] = "xiangyang/dcx1",
	},
}
Room {
	id = "xiangyang/outeroad1",
	name = "������",
	ways = {
		["east"] = "city/wroad3",
		["west"] = "xiangyang/qinglongmen",
	},
}
Room {
	id = "xiangyang/outnroad1",
	name = "��ʯ���",
	ways = {
		["south"] = "xiangyang/xuanwumen",
		["north"] = "xiangyang/outnroad2",
	},
	room_relative="��ʯ�������ʯ�������������ʯ���",
}
Room {
	id = "xiangyang/outnroad2",
	name = "��ʯ���",
	ways = {
		["south"] = "xiangyang/outnroad1",
		["north"] = "xiangyang/outnroad3",
		["northeast"] = "xiangyang/junying",
	},
	room_relative="��·�ɹž�Ӫ���J��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "xiangyang/outnroad3",
	name = "��·",
	ways = {
		["south"] = "xiangyang/outnroad2",
		["northwest"] = "xiangyang/shanxiroad1",
		["northeast"] = "xiangyang/henanroad1",
		["west"] = "xiangyang/hanshui1",
	},
	room_relative="��·��·�I�J��ˮ����-----��·����ʯ�����·",
}
Room {
	id = "xiangyang/outsroad1",
	name = "������",
	ways = {
		["south"] = "xiangyang/outsroad2",
		["north"] = "xiangyang/zhuquemen",
	},
}
Room {
	id = "xiangyang/outsroad2",
	name = "��ʯ���",
	ways = {
		["south"] = "xiangyang/outsroad3",
		["north"] = "xiangyang/outsroad1",
	},
	room_relative="���������ʯ����������·��ʯ���",
}
Room {
	id = "xiangyang/outsroad3",
	name = "�����·",
	ways = {
		["westup"] = "xiangyang/conglin1",
		["south"] = "xiangyang/hunanroad1",
		["north"] = "xiangyang/outsroad2",
	},
}
Room {
	id = "xiangyang/outwroad1",
	name = "������",
	ways = {
		["south"] = "xiangyang/shanlu1",
		["east"] = "xiangyang/baihumen",
		["north"] = "gumu/jqg/shanlu3",
		["west"] = "xiangyang/tanxi",
	},
}
Room {
	id = "xiangyang/qinglongmen",
	name = "������",
	ways = {
		["east"] = "xiangyang/outeroad1",
		["west"] = "xiangyang/eroad1",
	},
}
Room {
	id = "xiangyang/shanlu1",
	name = "ɽ��С·",
	ways = {
		["southup"] = "xiangyang/shanlu2",
		["north"] = "xiangyang/outwroad1",
	},
	room_relative="�������ɽ��С·��ɽ��С·ɽ��С·",
}
Room {
	id = "xiangyang/shanlu2",
	name = "ɽ��С·",
	ways = {
		["southwest"] = "xiangyang/shanlu3",
		["northdown"] = "xiangyang/shanlu1",
	},
	room_relative="ɽ��С·��ɽ��С·�Lɽ��С·ɽ��С·",
}
Room {
	id = "xiangyang/shanlu3",
	name = "ɽ��С·",
	ways = {
		["northeast"] = "xiangyang/shanlu2",
	},
	room_relative="ɽ��С·�Jɽ��С·ɽ��С·",
	objs = {
        ["ƽ����"] = "ping popo",
        ["������"] = "rui popo",
        ["������"] = "ding popo",
    },
}
Room {
	id = "xiangyang/shanxiroad1",
	name = "��·",
	ways = {
		["southeast"] = "xiangyang/outnroad3",
		["northwest"] = "xiangyang/shanxiroad2",
		["west"] = "gumu/fchuan",
	},
	room_relative="��·�I����-----��·�K��·��·",
}
Room {
	id = "xiangyang/shanxiroad2",
	name = "��·",
	ways = {
		["southeast"] = "xiangyang/shanxiroad1",
		["northwest"] = "xiangyang/lantian",
		["north"] = "village/hsroad3",
	},
	room_relative="�������·�I����·�K��·��·",
	objs = {
		["���д���"] = "duxing daxia",
	},
}
Room {
	id = "xiangyang/shaobingpu",
	name = "�ձ���",
	ways = {
		["east"] = "xiangyang/xcx3",
	},
	objs = {
		["�ձ���"] = "shaobing liu",
	},
}
Room {
	id = "xiangyang/shuoshug",
	name = "˵���",
	ways = {
		["south"] = "xiangyang/ncx1",
	},
}
Room {
	id = "xiangyang/sishu",
	name = "˽��",
	ways = {
		["north"] = "xiangyang/xcx5",
	},
}
Room {
	id = "xiangyang/tanxi",
	name = "̴Ϫ",
	ways = {
		["southwest"] = "xiangyang/xiaolu1",
		["east"] = "xiangyang/outwroad1",
	},
}
Room {
	id = "xiangyang/wen/damen",
	name = "�¸�����",
	ways = {
		["south"] = "xiangyang/wen/shidetang",
		["north"] = "xiangyang/ncx3",
	},
}
Room {
	id = "xiangyang/wen/guifang",
	name = "����",
	ways = {
		["west"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["����"] = "wen yi",
	},
}
Room {
	id = "xiangyang/wen/houhuayuan",
	name = "��԰",
	ways = {
		["north"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["�·���"] = "wen fangyi",
	},
}
Room {
	id = "xiangyang/wen/lianwu",
	name = "���䳡",
	ways = {
		["east"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["�·���"] = "wen fangda",
	},
}
Room {
	id = "xiangyang/wen/shidetang",
	name = "������",
	ways = {
		["south"] = "xiangyang/wen/tianjing",
		["east"] = "xiangyang/wen/wofang2",
		["north"] = "xiangyang/wen/damen",
		["west"] = "xiangyang/wen/wofang1",
	},
	objs = {
		["������"] = "wen nanyang",
	},
}
Room {
	id = "xiangyang/wen/tianjing",
	name = "�쾮",
	ways = {
		["south"] = "xiangyang/wen/houhuayuan",
		["north"] = "xiangyang/wen/shidetang",
		["east"] = "xiangyang/wen/guifang",
		["west"] = "xiangyang/wen/lianwu",
	},
	objs = {
		["�·�ʩ"] = "wen fangshi",
	},
}
Room {
	id = "xiangyang/wen/wofang1",
	name = "�Է�",
	ways = {
		["east"] = "xiangyang/wen/shidetang",
	},
	objs = {
		["�·�ɽ"] = "wen fangshan",
	},
}
Room {
	id = "xiangyang/wen/wofang2",
	name = "�Է�",
	ways = {
		["west"] = "xiangyang/wen/shidetang",
	},
	objs = {
		["�·���"] = "wen fangwu",
	},
}
Room {
	id = "xiangyang/xcx1",
	name = "������",
	ways = {
		["south"] = "xiangyang/xcx2",
		["north"] = "xiangyang/bhmnj",
		["west"] = "xiangyang/chayedian",
	},
	room_relative="�׻����ڽ֣���Ҷ��----�������������������",
}
Room {
	id = "xiangyang/xcx2",
	name = "������",
	ways = {
		["south"] = "xiangyang/xcx3",
		["north"] = "xiangyang/xcx1",
		["west"] = "xiangyang/doufufang",
	},
	room_relative="�������������----�������������������",
}
Room {
	id = "xiangyang/xcx3",
	name = "������",
	ways = {
		["south"] = "xiangyang/xcx4",
		["north"] = "xiangyang/xcx2",
		["west"] = "xiangyang/shaobingpu",
	},
	room_relative="��������ձ���----�������������������",
}
Room {
	id = "xiangyang/xcx4",
	name = "������",
	ways = {
		["south"] = "xiangyang/xcx5",
		["north"] = "xiangyang/xcx3",
		["west"] = "xiangyang/baozipu",
	},
	room_relative="�������������----�������������������",
}
Room {
	id = "xiangyang/xcx5",
	name = "������",
	ways = {
		["south"] = "xiangyang/sishu",
		["east"] = "xiangyang/zqmnj",
		["north"] = "xiangyang/xcx4",
		["west"] = "xiangyang/yaopu",
	},
	room_relative="�������ҩ����----������----��ȸ���ڽ֣�˽��������",
}
Room {
	id = "xiangyang/xiaocd",
	name = "С�Ե�",
	ways = {
		["east"] = "xiangyang/bcx4",
	},
}
Room {
	id = "xiangyang/xiaolu1",
	name = "С·",
	ways = {
		["southwest"] = "xiangyang/xiaolu2",
		["north"] = "xiangyang/lzz/xiaolu",
		["northeast"] = "xiangyang/tanxi",
	},
}
Room {
	id = "xiangyang/xiaolu2",
	name = "С·",
	ways = {
		["northeast"] = "xiangyang/xiaolu1",
		["west"] = "group/entry/cderoad4",
	},
}
Room {
	id = "xiangyang/xiyuan",
	name = "ϷԺ",
	ways = {
		["west"] = "xiangyang/dcx4",
	},
}
Room {
	id = "xiangyang/xjie",
	name = "����",
	ways = {
		["east"] = "xiangyang/cross1",
		["west"] = "xiangyang/bhmnj",
	},
}
Room {
	id = "xiangyang/xpailou",
	name = "����¥",
	ways = {
		["south"] = "xiangyang/njie1",
		["north"] = "xiangyang/cross1",
	},
}
Room {
	id = "xiangyang/xuanwumen",
	name = "������",
	ways = {
		["south"] = "xiangyang/nroad1",
		["north"] = "xiangyang/outnroad1",
	},
}
Room {
	id = "xiangyang/xyudian",
	name = "�����",
	ways = {
		["east"] = "xiangyang/bcx3",
	},
	objs = {
		["���ɩ"] = "li ersao",
	},
}
Room {
	id = "xiangyang/yamen",
	name = "����",
	ways = {
		["south"] = "xiangyang/chucshi",
		["north"] = "xiangyang/ymzhengting",
		["east"] = "xiangyang/njie1",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 7500},
		},
		["south"] = {
			{id = "ya yi", exp = 7500},
		},
	},
}
Room {
	id = "xiangyang/yaopu",
	name = "ҩ����",
	no_fight = true,
	ways = {
		["east"] = "xiangyang/xcx5",
	},
	objs = {
		["ƽһָ"] = "ping yizhi",
	},
}
Room {
	id = "xiangyang/yingzhang",
	name = "Ӫ����",
	no_fight = true,
	ways = {
		["out"] = "xiangyang/junying",
	},
	objs = {
		["�ɸ�"] = "meng ge",
	},
}
Room {
	id = "xiangyang/ymzhengting",
	name = "����",
	ways = {
		["south"] = "xiangyang/yamen",
	},
}
Room {
	id = "xiangyang/zahuopu",
	name = "�ӻ���",
	ways = {
		["west"] = "xiangyang/dcx2",
		["up"] = "xiangyang/qnbank",
	},
	objs = {
		["ţ�ϰ�"] = "niu laoban",
	},
}
Room {
	id = "xiangyang/qnbank",
	name = "Ǳ������",
	ways = {
		["down"] = "xiangyang/zahuopu",
	},
}

Room {
	id = "xiangyang/zhuquemen",
	name = "��ȸ��",
	ways = {
		["south"] = "xiangyang/outsroad1",
		["north"] = "xiangyang/zqmnj",
	},
}
Room {
	id = "xiangyang/zqmnj",
	name = "��ȸ���ڽ�",
	ways = {
		["south"] = "xiangyang/zhuquemen",
		["north"] = "xiangyang/njie3",
		["west"] = "xiangyang/xcx5",
	},
}
Room {
	id = "xiangyang/zrdian",
	name = "�����",
	ways = {
		["south"] = "xiangyang/bcx2",
	},
	objs = {
        ["������"] = "zhurou rong",
    },
}
Room {
	id = "xingxiu/bank",
	name = "��ի",
	ways = {
		["east"] = "xingxiu/silk8",
	},
	objs = {
          ["���ƹ�"] = "ma zhanggui",
           },
}
Room {
	id = "xingxiu/baozang/bingqiku",
	name = "������",
	ways = {
		["south"] = "xingxiu/baozang/midong3",
		["east"] = "xingxiu/baozang/tiantan",
		["north"] = "xingxiu/baozang/midong3",
		["west"] = "xingxiu/baozang/midong3",
	},
}
Room {
	id = "xingxiu/baozang/jinku",
	name = "���",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/tiantan",
		["east"] = "xingxiu/baozang/midong2",
		["west"] = "xingxiu/baozang/midong2",
	},
}
Room {
	id = "xingxiu/baozang/midong1",
	name = "�ܶ�",
	ways = {
		["south"] = "xingxiu/baozang/midong1",
		["north"] = "xingxiu/baozang/midong1",
		["east"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/midong1",
	},
}
Room {
	id = "xingxiu/baozang/midong2",
	name = "�ܶ�",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["east"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/midong2",
		["west"] = "xingxiu/baozang/midong2",
	},
}
Room {
	id = "xingxiu/baozang/midong3",
	name = "�ܶ�",
	ways = {
		["south"] = "xingxiu/baozang/midong3",
		["north"] = "xingxiu/baozang/midong3",
		["east"] = "xingxiu/baozang/midong3",
		["west"] = "xingxiu/baozang/midong3",
	},
}
Room {
	id = "xingxiu/baozang/midong4",
	name = "�ܶ�",
	ways = {
		["south"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong4",
		["north"] = "xingxiu/baozang/midong4",
		["west"] = "xingxiu/baozang/midong4",
	},
}
Room {
	id = "xingxiu/baozang/mishi",
	name = "����",
	ways = {
		["out"] = "xingxiu/baozang/shuku",
	},
}
Room {
	id = "xingxiu/baozang/shuku",
	name = "�鷿",
	ways = {
		["south"] = "xingxiu/baozang/midong1",
		["east"] = "xingxiu/baozang/midong1",
		["north"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/tiantan",
	},
}
Room {
	id = "xingxiu/baozang/tiantan",
	name = "����",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/midong3",
	},
}
Room {
	id = "xingxiu/baozang/yaoku",
	name = "ҩ��",
	ways = {
		["south"] = "xingxiu/baozang/tiantan",
		["north"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong4",
		["west"] = "xingxiu/baozang/midong4",
	},
}
Room {
	id = "xingxiu/cangku",
	name = "��Ȼʯ��",
	ways = {
		["out"] = "xingxiu/xx2",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["�����޶������ϲ᡽��"] = "du jing",
          ["�ɺ�ҩ"] = "menghan yao",
           },
}
Room {
	id = "xingxiu/cave",
	name = "ɽ��",
	ways = {
		["out"] = "xingxiu/shanshi",
		["zuan"] = "xingxiu/cave2",
	},
	objs = {
          ["����"] = "ju mang",
          ["����"] = "du she",
           },
	precmds = {
		["zuan"] = "use fire;#walkBusy",
	},
	lengths = {
		["zuan"] = "if Bag['����'] then return 10 else return false end",
	},
	room_relative="ɽ����ɽʯɽ��",
}
Room {
	id = "xingxiu/cave2",
	name = "ɽ��",
	ways = {
		["zuan out"] = "xingxiu/cave",
	},
	objs = {
          ["ƮȻ��"] = "piaoran zi",
	},
	precmds = {
		["zuan out"] = "use fire;#walkBusy",
	},
	lengths = {
		["zuan out"] = "if Bag['����'] then return 10 else return false end",
	},
	room_relative="ɽ��ɽ��",
}
Room {
	id = "xingxiu/chufang",
	name = "����",
	no_fight = true,
	ways = {
		["east"] = "xingxiu/xx3",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["С����"] = "xiao chuzi",
           },
}
Room {
	id = "xingxiu/daliao/liangcang",
	name = "���",
	ways = {
		["south"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/daliao/shanlu1",
	name = "ɽ·",
	ways = {
		["south"] = "xingxiu/daliao/shulin",
		["northwest"] = "xingxiu/daliao/shanlu2",
	},
}
Room {
	id = "xingxiu/daliao/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "xingxiu/daliao/shanlu3",
		["southeast"] = "xingxiu/daliao/shanlu1",
	},
}
Room {
	id = "xingxiu/daliao/shanlu3",
	name = "ɽ·",
	ways = {
		["north"] = "xingxiu/daliao/yingmen",
		["southdown"] = "xingxiu/daliao/shanlu2",
	},
}
Room {
	id = "xingxiu/daliao/shulin",
	name = "����",
	ways = {
		["south"] = "xingxiu/daliao/shulin",
		["east"] = "xingxiu/daliao/shulin",
		["north"] = "xingxiu/daliao/shulin",
		["west"] = "xingxiu/daliao/shulin",
	},
}
Room {
	id = "xingxiu/daliao/yingmen",
	name = "Ӫ��",
	ways = {
		["south"] = "xingxiu/daliao/shanlu3",
		["north"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/daliao/youtang",
	name = "��Ӫ",
	ways = {
		["west"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/daliao/zhongying",
	name = "��Ժ��Ӫ",
	ways = {
		["south"] = "xingxiu/daliao/yingmen",
		["east"] = "xingxiu/daliao/youtang",
		["north"] = "xingxiu/daliao/liangcang",
		["west"] = "xingxiu/daliao/zuotang",
	},
}
Room {
	id = "xingxiu/daliao/zuotang",
	name = "��Ӫ",
	ways = {
		["east"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/fangpan",
	name = "���̳�",
	ways = {
		["east"] = "xingxiu/road4",
		["west"] = "xingxiu/road5",
	},
}
Room {
	id = "xingxiu/jushi",
	name = "��ʯ",
	ways = {
		["down"] = "xingxiu/xx4",
	},
}
Room {
	id = "xingxiu/jyg",
	name = "���Ź�",
	ways = {
		["south"] = "xingxiu/jyg_1",
		["north"] = "xingxiu/xiaowu",
		["east"] = "xingxiu/jyge",
		["west"] = "xingxiu/jygw",
	},
	objs = {
          ["�����"] = "hou junji",
           },
}
Room {
	id = "xingxiu/jyg_1",
	name = "���ի�ֵ�",
	no_fight = true,
	ways = {
		["north"] = "xingxiu/jyg",
	},
	objs = {
          ["����"] = "huang zhen",
           },
}
Room {
	id = "xingxiu/jyge",
	name = "�����ض�����",
	ways = {
		["eastup"] = "xingxiu/road5",
		["west"] = "xingxiu/jyg",
	},
	precmds = {
		["eastup"] = "#wipe guan bing",
		["west"] = "#wipe guan bing",
	},
}
Room {
	id = "xingxiu/jygw",
	name = "������������",
	ways = {
		["east"] = "xingxiu/jyg",
		["west"] = "xingxiu/silk",
	},
	precmds = {
		["east"] = "#wipe guan bing",
		["west"] = "#wipe guan bing",
	},
}
Room {
	id = "xingxiu/mogaoku",
	name = "Ī�߿�",
	ways = {
		["out"] = "xingxiu/silk3c",
	},
	objs = {
          ["�����۶��ľ�"] = "shu",
          ["������"] = "shu",
          ["������"] = "shu",
           },
}
Room {
	id = "xingxiu/nanjiang",
name = "�Ͻ�ɳĮ",
	ways = {
		["nw;sw;se;ne"] = "xingxiu/wenquan",
	},
	nolooks = {
		["nw;sw;se;ne"] = true,
	},
}
Room {
	id = "xingxiu/road4",
	name = "���ﳤ��",
	ways = {
		["southeast"] = "lanzhou/wuwei",
		["west"] = "xingxiu/fangpan",
	},
}
Room {
	id = "xingxiu/road5",
	name = "���ﳤ��",
	ways = {
		["westdown"] = "xingxiu/jyge",
		["east"] = "xingxiu/fangpan",
	},
}
Room {
	id = "xingxiu/rukou",
	name = "������",
	ways = {
		["southwest"] = "xingxiu/xx1",
	},
	objs = {
          ["����"] = "kan shou",
           },
}
Room {
	id = "xingxiu/ryd",
	name = "���¶�",
	ways = {
		["south"] = "xingxiu/ryd1",
		["north"] = "xingxiu/yaolu",
	},
	lengths = {
		["north"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	objs = {
          ["������"] = "ding chunqiu",
          ["ժ����"] = "zhaixing zi",
           },
}
Room {
	id = "xingxiu/ryd1",
	name = "���¶���",
	ways = {
		["east"] = "xingxiu/xxh3",
		["north"] = "xingxiu/ryd",
		["southdown"] = "xingxiu/xx1",
		["west"] = "xingxiu/xxh4",
	},
	--lengths = {
	--	["north"] = "if 1<0 then return false else return 1 end",
	--},
	objs = {
          ["�����̵���"] = "board",
          ["��Ȼ��"] = "anran zi",
           },
}
Room {
	id = "xingxiu/shamo",
	name = "��ɳĮ",
	ways = {
		["w;w;w;w;w;w;w;w;w;w"] = "hj/caoyuan",
		["e;e;e;e;e;e;e;e;e;e"] = "xingxiu/silk9",
		["north"] = "xingxiu/shamo1",
	},
	nolooks = {
		["w;w;w;w;w;w;w;w;w;w"] = true,
		["e;e;e;e;e;e;e;e;e;e"] = true,
		["north"] = true,
		["south"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["w;w;w;w;w;w;w;w;w;w"] = 10,
		["e;e;e;e;e;e;e;e;e;e"] = 10,
	},
}
Room {
	id = "xingxiu/shamo1",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo2",
	},
}
Room {
	id = "xingxiu/shamo2",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo3",
	},
}
Room {
	id = "xingxiu/shamo3",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo4",
	},
}
Room {
	id = "xingxiu/shamo4",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo5",
	},
}
Room {
	id = "xingxiu/shamo5",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo6",
	},
}
Room {
	id = "xingxiu/shamo6",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo7",
	},
}
Room {
	id = "xingxiu/shamo7",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo8",
	},
}
Room {
	id = "xingxiu/shamo8",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo9",
	},
}
Room {
	id = "xingxiu/shamo9",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo10",
	},
}
Room {
	id = "xingxiu/shamo10",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo11",
	},
}
Room {
	id = "xingxiu/shamo11",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo12",
	},
}
Room {
	id = "xingxiu/shamo12",
	name = "��ɳĮ",
	ways = {
		["north"] = "xingxiu/shamo13",
	},
}
Room {
	id = "xingxiu/shamo13",
	name = "��ɳĮ",
	ways = {
		["w;w;w;w;w;w;w;w;w;w;w"] = "hj/caoyuan",
		["e;e;e;e;e;e;e;e;e;e;e"] = "xingxiu/silk9",
	},
}
--]]
Room {
	id = "xingxiu/shanjiao",
	name = "��ɽ����",
	ways = {
		["southeast"] = "xingxiu/silk9",
		["southwest"] = "hj/senlinn",
		["east"] = "yili/yilih",
		["north"] = "xingxiu/xxh",
	},
	blocks = {
		["southeast"] = {
			{id = "xingxiu dizi", exp = 2000, party = "������"},
		},
		["southwest"] = {
			{id = "xingxiu dizi", exp = 2000, party = "������"},
		},
		["east"] = {
			{id = "xingxiu dizi", exp = 2000, party = "������"},
		},
		["north"] = {
			{id = "xingxiu dizi", exp = 2000, party = "������"},
		},
	},
}
Room {
	id = "xingxiu/shanshi",
	name = "ɽʯ",
	ways = {
		["eastdown"] = "xingxiu/xx6",
		["#xingxiushandong"] = "xingxiu/cave",
	},
	nolooks = {
		["#xingxiushandong"] = true,
	},
	objs = {
          ["ʨ����"] = "shihou zi",
    },
}
Room {
	id = "xingxiu/silk",
	name = "˿��֮·",
	ways = {
		["southwest"] = "xingxiu/silk1b",
		["northwest"] = "xingxiu/silk1",
		["east"] = "xingxiu/jygw",
	},
	room_relative="���ɽ�I˿��֮·---�����������ŨL������˿��֮·",
}
Room {
	id = "xingxiu/silk1",
	name = "���ɽ",
	ways = {
		["southeast"] = "xingxiu/silk",
		["southwest"] = "xingxiu/silk1a",
		["north"] = "xingxiu/silk2",
	},
}
Room {
	id = "xingxiu/silk10",
	name = "˿��֮·",
	ways = {
		["south"] = "xingxiu/silk8",
		["north"] = "yili/yilih",
	},
	room_relative="��Զ��˿��֮·���¹Ȼ��ٹ��˿��֮·",
}
Room {
	id = "xingxiu/silk1a",
	name = "ˮ����",
	ways = {
		["southeast"] = "xingxiu/silk1b",
		["northeast"] = "xingxiu/silk1",
	},
}
Room {
	id = "xingxiu/silk1b",
	name = "������",
	ways = {
		["northwest"] = "xingxiu/silk1a",
		["northeast"] = "xingxiu/silk",
	},
}
Room {
	id = "xingxiu/silk2",
	name = "˿��֮·",
	ways = {
		["westup"] = "xingxiu/silk3",
		["south"] = "xingxiu/silk1",
	},
	room_relative="��Ħ�¡�˿��֮·�����ɽ˿��֮·",
}
Room {
	id = "xingxiu/silk3",
	name = "��Ħ��",
	ways = {
		["eastdown"] = "xingxiu/silk2",
		["westdown"] = "xingxiu/silk4",
		["north"] = "xingxiu/silk3a",
	},
}
Room {
	id = "xingxiu/silk3a",
	name = "��ɳɽ",
	ways = {
		["south"] = "xingxiu/silk3",
		["west"] = "xingxiu/silk3b",
	},
}
Room {
	id = "xingxiu/silk3b",
	name = "����",
	ways = {
		["northwest"] = "xingxiu/silk3c",
		["east"] = "xingxiu/silk3a",
	},
}
Room {
	id = "xingxiu/silk3c",
	name = "����Ȫ",
	ways = {
		["southeast"] = "xingxiu/silk3b",
		["west"] = "xingxiu/silk7a",
		["enter hole"] = "xingxiu/mogaoku",
	},
	nolooks = {
		["enter hole"] = true,
	},
}
Room {
	id = "xingxiu/silk4",
	name = "˿��֮·",
	ways = {
		["eastup"] = "xingxiu/silk3",
		["northwest"] = "xingxiu/silk5a",
		["west"] = "xingxiu/silk5",
	},
	room_relative="��֬ɽ�Iʯ��---˿��֮·����Ħ��˿��֮·",
}
Room {
	id = "xingxiu/silk5",
	name = "ʯ��",
	ways = {
		["northup"] = "xingxiu/silk5a",
		["south"] = "xingxiu/silk5b",
		["northwest"] = "xingxiu/silk6",
		["east"] = "xingxiu/silk4",
	},
}
Room {
	id = "xingxiu/silk5a",
	name = "��֬ɽ",
	ways = {
		["southeast"] = "xingxiu/silk4",
		["northwest"] = "xingxiu/silk7a",
		["southdown"] = "xingxiu/silk5",
	},
}
Room {
	id = "xingxiu/silk5b",
	name = "��¡ɽ",
	ways = {
		["north"] = "xingxiu/silk5",
	},
}
Room {
	id = "xingxiu/silk6",
	name = "˿��֮·",
	ways = {
		["southeast"] = "xingxiu/silk5",
		["southwest"] = "group/entry/mjshamo1",
		["northwest"] = "xingxiu/silk7",
	},
	room_relative="ɳ�ިI˿��֮·�L�K��ɳĮʯ��˿��֮·",
}
Room {
	id = "xingxiu/silk7",
	name = "ɳ��",
	ways = {
		["northup"] = "xingxiu/silk7a",
		["southeast"] = "xingxiu/silk6",
		["west"] = "xingxiu/silk8",
	},
}
Room {
	id = "xingxiu/silk7a",
	name = "��ͷ���",
	ways = {
		["southeast"] = "xingxiu/silk5a",
		["east"] = "xingxiu/silk3c",
		["southdown"] = "xingxiu/silk7",
	},
}
Room {
	id = "xingxiu/silk8",
	name = "�¹Ȼ��ٹ��",
	ways = {
		["northwest"] = "xingxiu/silk9",
		["north"] = "xingxiu/silk10",
		["west"] = "xingxiu/bank",
		["#eaea"] = "xingxiu/silk7",
	},
	lengths = {
		["#eaea"] = 10,
	},
	nolooks = {
		["#eaea"] = true,
	},
}
Room {
	id = "xingxiu/silk9",
	name = "˿��֮·",
	ways = {
		["southeast"] = "xingxiu/silk8",
		["northwest"] = "xingxiu/shanjiao",
		["west"] = "xingxiu/shamo",
	},
	room_relative="��ɽ���¨I��ɳĮ---˿��֮·�K�¹Ȼ��ٹ��˿��֮·",
}
Room {
	id = "xingxiu/tianshan",
	name = "��ɽɽ·",
	ways = {
		["southeast"] = "hj/senlinn",
		["west"] = "tianshan/kongchang",
	},
}
Room {
	id = "xingxiu/wenquan",
	name = "��ˮ��Ȫ",
	ways = {
		["northeast"] = "xingxiu/silk8",
	},
}
Room {
	id = "xingxiu/xiaowu",
	name = "����С��",
	ways = {
		["south"] = "xingxiu/jyg",
	},
	objs = {
          ["�����"] = "ma guangzuo",
           },
}
Room {
	id = "xingxiu/xiaoyao",
	name = "��ң��",
	no_fight = true,
	ways = {
		["out"] = "xingxiu/xx3",
	},
}
Room {
	id = "xingxiu/xx1",
	name = "ɽǰ�ĵ�",
	ways = {
		["northup"] = "xingxiu/ryd1",
		["south"] = "xingxiu/xxh2",
		["northwest"] = "xingxiu/xx2",
		["northeast"] = "xingxiu/rukou",
	},
	objs = {
          ["������"] = "feitian zi",
           },
}
Room {
	id = "xingxiu/xx2",
	name = "���޺�",
	ways = {
		["southeast"] = "xingxiu/xx1",
		["enter"] = "xingxiu/cangku",
		["west"] = "xingxiu/xx3",
	},
	blocks = {
		["enter"] = {
			{id = "chuchen zi", exp = 200000},
		},
	},
	objs = {
          ["������"] = "chuchen zi",
           },
}
Room {
	id = "xingxiu/xx3",
	name = "ʯ��",
	ways = {
		["enter"] = "xingxiu/xiaoyao",
		["east"] = "xingxiu/xx2",
		["west"] = "xingxiu/chufang",
	},
	blocks = {
		["enter"] = {
			{id = "caihua zi", exp = 25000, party = "������"},
		},
	},
}
Room {
	id = "xingxiu/xx4",
	name = "С·",
	ways = {
		["northup"] = "xingxiu/xx5",
		["south"] = "xingxiu/xxh2",
		["west"] = "xingxiu/xxh1",
	},
	objs = {
          ["������"] = "tianlang zi",
           },
}
Room {
	id = "xingxiu/xx5",
	name = "ɽ��",
	ways = {
		["southdown"] = "xingxiu/xx4",
	},
}
Room {
	id = "xingxiu/xx6",
	name = "���߻�·",
	ways = {
		["westup"] = "xingxiu/shanshi",
		["south"] = "xingxiu/xxh4",
		["north"] = "xingxiu/xxh3",
		["east"] = "xingxiu/xxh2",
	},
}
Room {
	id = "xingxiu/xxh",
	name = "���޺�",
	ways = {
		--["southeast"] = "yili/yilih",
		["south"] = "xingxiu/shanjiao",
		["north"] = "xingxiu/xxh1",
	},
	objs = {
          ["����"] = "azi",
           },
}
--[[
Room {
	id = "xingxiu/xxhn",
	name = "���޺�",
	ways = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = "xingxiu/shanjiao",
		["n;n;n;n;n;n;n;n;n;n;n"] = "xingxiu/xx1",
		["e;e;e;e;e;e"] = "xingxiu/xx4",
		["w;w;w;w;w"] = "xingxiu/xx6",
	},
	nolooks = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = true,
		["n;n;n;n;n;n;n;n;n;n;n"] = true,
		["e;e;e;e;e;e"] = true,
		["w;w;w;w;w"] = true,
		["north"] = true,
		["south"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = 12,
		["n;n;n;n;n;n;n;n;n;n;n"] = 11,
		["e;e;e;e;e;e"] = 6,
		["w;w;w;w;w"] = 5,
	},
	find = {
		path = {"e","n","w"},
	},
}
--]]
Room {
  id = "xingxiu/xxh1",
  name = "���޺�",
  ways = {
    ["east"]  = "xingxiu/xxh2",
  },
}
Room {
  id = "xingxiu/xxh2",
  name = "���޺�",
  ways = {
    ["north"] = "xingxiu/xxh3",
  }, 
}
Room {
  id = "xingxiu/xxh3",
  name = "���޺�",
  ways = {
    ["west"]  = "xingxiu/xxh4",
  },
}
Room {
  id = "xingxiu/xxh4",
  name = "���޺�",
  ways = {
    ["s;s;s;s;s;s;s"] = "xingxiu/xxh",
    ["n;n;n;n;n;n"] = "xingxiu/xx1",
    ["e;e;e"] = "xingxiu/xx4",
    ["w;w;w"] = "xingxiu/xx6",
  },
  nolooks = {
    ["s;s;s;s;s;s;s"] = true,
    ["n;n;n;n;n;n"] = true,
    ["e;e;e"] = true,
    ["w;w;w"] = true,
  },
}
Room {
	id = "xingxiu/yaolu",
	name = "ҩ®",
	ways = {
		["south"] = "xingxiu/ryd",
	},
}
Room {
	id = "yili/house",
	name = "������Ժ",
	ways = {
		["west"] = "yili/yili2",
	},
}
Room {
	id = "yili/kezhan",
	name = "��ջ",
	ways = {
		["southeast"] = "yili/yili2",
		["up"] = "yili/kezhan2",
	},
	objs = {
          ["����ľ��"] = "alamuhan",
           },
}
Room {
	id = "yili/kezhan2",
	name = "��ջ��¥",
	ways = {
		["down"] = "yili/kezhan",
	},
}
Room {
	id = "yili/store",
	name = "����",
	ways = {
		["east"] = "yili/yili2",
	},
	objs = {
          ["������"] = "maimaiti",
           },
}
Room {
	id = "yili/store1",
	name = "����",
	ways = {
		["south"] = "yili/yili2",
	},
	objs = {
          ["Ѧ��"] = "xue zhu",
           },
}
Room {
	id = "yili/yilih",
	name = "��Զ",
	ways = {
		["south"] = "xingxiu/silk10",
		["northwest"] = "xingxiu/xxh",
		["north"] = "yili/yilihe",
		["west"] = "xingxiu/shanjiao",
	},
}
Room {
	id = "yili/yili1",
	name = "�ϳ���",
	ways = {
		["south"] = "yili/yilihe",
		["north"] = "yili/yili2",
	},
	nolooks = {
		["north"] = true,
	},
	lengths = {
		["north"] = "if MidNight[locl.time] then return false else return 1 end",
	},
}
Room {
	id = "yili/yili2",
	name = "������",
	ways = {
		["south"] = "yili/yili1",
		["northwest"] = "yili/kezhan",
		["north"] = "yili/store1",
		["east"] = "yili/house",
		["west"] = "yili/store",
	},
	--nolooks = {
		--["south"] = true,
	--},
	--lengths = {
		--["south"] = "if MidNight[locl.time] then return false else return 1 end",
	--},
}
Room {
	id = "yili/yilihe",
	name = "�����",
	ways = {
		["south"] = "yili/yilih",
		["north"] = "yili/yili1",
	},
}
Room {
	id = "xueshan/anshi",
	name = "����",
	ways = {
		["south"] = "xueshan/fatang2",
	},
}
Room {
	id = "xueshan/binglinfeng",
	name = "���ַ�",
	ways = {
		["east"] = "xueshan/shanpo",
	},
}
Room {
	id = "xueshan/boluomiyuan",
	name = "������Ժ",
	ways = {
		["west"] = "xueshan/huilang8",
	},
}
Room {
	id = "xueshan/caishichang",
	name = "��ʯ��",
	ways = {
		["eastdown"] = "xueshan/cunluo1",
		["west"] = "xueshan/tianyunmc",
	},
	objs = {
          ["ɫ��"] = "se leng",
           },
}
Room {
	id = "xueshan/caoyuan/caohai1",
	name = "�ݺ�",
	ways = {
		["south"] = "hj/caoyuan2",
		["west"] = "xueshan/caoyuan/caohain",
	},
	nolooks = {
		["north"] = true,
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohain",
	name = "�ݺ�",
	ways = {
		["east"] = "xueshan/caoyuan/caohain",
		["west"] = "xueshan/caoyuan/zhaozen",
		["e;n"] = "xueshan/caoyuan/caohai4",
	},
	nolooks = {
		["e;n"] = true,
		["north"] = true,
		["south"] = true,
	},
	find = {
		path = {"e", "n;n;w;e;s;w"},
	},
}
Room {
	id = "xueshan/caoyuan/caohai4",
	name = "�ݺ�",
	ways = {
		["north"] = "xueshan/caoyuan/caohai5",
		["south"] = "xueshan/caoyuan/zhaozen",
		["west"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohai5",
	name = "�ݺ�",
	ways = {
		["west"] = "xueshan/caoyuan/caohai6",
		["south"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["north"] = true,
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohai6",
	name = "�ݺ�",
	ways = {
		["east"] = "xueshan/caoyuan/yingmen",
		["west"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["north"] = true,
		["south"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/dazhang",
	name = "ţƤ����",
	ways = {
		["south"] = "xueshan/caoyuan/shenfeng",
	},
	objs = {
          ["������"] = "hu bilie",
          ["�����"] = "daer ba",
          ["���ַ���"] = "jinlun fawang",
          ["��Ħ��"] = "nimo xing",
           },
}
Room {
	id = "xueshan/caoyuan/jifeng",
	name = "����Ӫ",
	ways = {
		["south"] = "xueshan/caoyuan/yingmen",
		["north"] = "xueshan/caoyuan/shenfeng",
	},
	objs = {
          ["�ܱ�"] = "zhe bie",
           },
}
Room {
	id = "xueshan/caoyuan/shenfeng",
	name = "���Ӫ",
	ways = {
		["south"] = "xueshan/caoyuan/jifeng",
		["north"] = "xueshan/caoyuan/dazhang",
	},
	objs = {
          ["������"] = "zhe lemi",
           },
}
Room {
	id = "xueshan/caoyuan/yingmen",
	name = "Ӫ��",
	ways = {
		["south"] = "xueshan/caoyuan/caohai1",
		["north"] = "xueshan/caoyuan/jifeng",
	},
}
Room {
	id = "xueshan/caoyuan/zhaozen",
	name = "����",
	ways = {
		["w;n"] = "xueshan/caoyuan/caohai5",
	},
	nolooks = {
		["w;n"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	find = {
		path = {"w", "s"}, count = 10,
	},
}
Room {
	id = "xueshan/chiyangmen",
	name = "������",
	ways = {
		["enter"] = "xueshan/qingxinshe",
		["west"] = "xueshan/rimulundian",
	},
}
Room {
	id = "xueshan/chufang",
	name = "����",
	ways = {
		["south"] = "xueshan/zhaitang",
	},
}
Room {
	id = "xueshan/cunluo1",
	name = "������",
	ways = {
		["westup"] = "xueshan/caishichang",
		["north"] = "xueshan/cunluo2",
		["west"] = "xueshan/muchang3",
		["east"] = "xueshan/muchang7",
	},
}
Room {
	id = "xueshan/cunluo2",
	name = "�������",
	ways = {
		["south"] = "xueshan/cunluo1",
		["north"] = "xueshan/muchang4",
		["west"] = "xueshan/muchang2",
		["east"] = "xueshan/muchang6",
	},
}
Room {
	id = "xueshan/dachedian",
	name = "�вƴ󳵵�",
	ways = {
		["enter"] = "xueshan/zhengfang",
		["#xsdachedian"] = "xueshan/jiedao1",
	},
	nolooks = {
		["enter"] = true,
	},
	objs = {
          ["���в�"] = "li zhaocai",
           },
	precmds = {
		["enter"] = "give li 5 silver",
	},
	--Bag[l_name].cnt
	lengths = {
		["enter"] = "if Bag['����'] and Bag['����'].cnt>5 then return 10 else return false end ",
	},
}
Room {
	id = "xueshan/dadian",
	name = "�����",
	ways = {
		["eastdown"] = "xueshan/huilang4",
		["westdown"] = "xueshan/huilang3",
		["north"] = "xueshan/queridian",
		["southdown"] = "xueshan/guangchang",
	},
	objs = {
          ["��������"] = "lingzhi shangren",
           },
}
Room {
	id = "xueshan/daritang",
	name = "���շ���",
	ways = {
		["west"] = "xueshan/luoweitang",
	},
	objs = {
          ["�ܲ���͵�"] = "huo fo",
           },
}
Room {
	id = "xueshan/fanyinge",
	name = "������",
	ways = {
		["northwest"] = "xueshan/fotang",
		["east"] = "xueshan/jingtang",
		["north"] = "xueshan/fatang",
		["southdown"] = "xueshan/hufazhacang",
		["west"] = "xueshan/jingangyuan",
	},
	nolooks = {
		["northwest"] = true,
	},
	precmds = {
		["northwest"] = "open door",
	},
	blocks = {
		["northwest"] = {
			{id = "hufa lama", exp = 600000, party = "������"},
		},
	},
}
Room {
	id = "xueshan/fatang",
	name = "���ȷ���",
	ways = {
		["south"] = "xueshan/fanyinge",
		["up"] = "xueshan/fatang2",
	},
	blocks = {
		["up"] = {
			{id = "zayi lama", exp = 30000, party = "������"},
		},
	},
}
Room {
	id = "xueshan/fatang2",
	name = "���ö�¥",
	ways = {
		["down"] = "xueshan/fatang",
	},
	objs = {
          ["�Ħ��"] = "jiumo zhi",
           },
}
Room {
	id = "xueshan/fengjiantai",
	name = "���̨",
	ways = {
		["northup"] = "xueshan/xuelingquan",
		["eastdown"] = "xueshan/shanlu4",
		["west"] = "xueshan/luofenggang",
	},
}
Room {
	id = "xueshan/fotang",
	name = "��®����",
	ways = {
		["southeast"] = "xueshan/fanyinge",
		["west"] = "xueshan/lingtalin",
	},
}
Room {
	id = "xueshan/fozhaomen",
	name = "������",
	ways = {
		["east"] = "xueshan/zanpugc",
		["west"] = "xueshan/xiaolu3",
	},
}
Room {
	id = "xueshan/guangchang",
	name = "��ǰ�㳡",
	ways = {
		["northup"] = "xueshan/dadian",
		["west"] = "xueshan/huilang1",
		["east"] = "xueshan/huilang2",
		["southdown"] = "xueshan/shanmen",
	},
	nolooks = {
		["southdown"] = true,
	},
	precmds = {
		["southdown"] = "pull gate",
	},
	objs = {
          ["���ֲ���"] = "heilin bofu",
          ["�����±羭��"] = "board",
           },
}
Room {
	id = "xueshan/gulou",
	name = "��¥",
	ways = {
		["west"] = "xueshan/huilang2",
	},
}
Room {
	id = "xueshan/houzidong",
	name = "���Ӷ�",
	ways = {
		["southeast"] = "xueshan/jiaopan",
		["westup"] = "xueshan/shanlu7",
	},
}
Room {
	id = "xueshan/huanggong",
	name = "�ʹ�",
	ways = {
		["west"] = "xueshan/zanpugc",
	},
}
Room {
	id = "xueshan/hubian",
	name = "����",
	ways = {
		["south"] = "xueshan/xiaolu3",
	},
}
Room {
	id = "xueshan/hufazhacang",
	name = "��������",
	ways = {
		["northup"] = "xueshan/fanyinge",
		["south"] = "xueshan/rimulundian",
		["east"] = "xueshan/jingjinzhacang",
		["west"] = "xueshan/kuxiuzhacang",
	},
}
Room {
	id = "xueshan/huilang1",
	name = "������",
	ways = {
		["north"] = "xueshan/huilang3",
		["east"] = "xueshan/guangchang",
		["west"] = "xueshan/zhonglou",
	},
}
Room {
	id = "xueshan/huilang2",
	name = "������",
	ways = {
		["north"] = "xueshan/huilang4",
		["east"] = "xueshan/gulou",
		["west"] = "xueshan/guangchang",
	},
}
Room {
	id = "xueshan/huilang3",
	name = "������",
	ways = {
		["eastup"] = "xueshan/dadian",
		["south"] = "xueshan/huilang1",
		["north"] = "xueshan/huilang5",
		["west"] = "xueshan/jieyuantang",
	},
}
Room {
	id = "xueshan/huilang4",
	name = "������",
	ways = {
		["westup"] = "xueshan/dadian",
		["south"] = "xueshan/huilang2",
		["east"] = "xueshan/luoweitang",
		["north"] = "xueshan/huilang6",
	},
}
Room {
	id = "xueshan/huilang5",
	name = "������",
	ways = {
		["eastup"] = "xueshan/queridian",
		["south"] = "xueshan/huilang3",
		["north"] = "xueshan/huilang7",
		["west"] = "xueshan/jishantang",
	},
}
Room {
	id = "xueshan/huilang6",
	name = "������",
	ways = {
		["westup"] = "xueshan/queridian",
		["south"] = "xueshan/huilang4",
		["east"] = "xueshan/yimogong",
		["north"] = "xueshan/huilang8",
	},
}
Room {
	id = "xueshan/huilang7",
	name = "������",
	ways = {
		["eastup"] = "xueshan/zhudubadian",
		["south"] = "xueshan/huilang5",
		["west"] = "xueshan/yushengdian",
	},
	objs = {
          ["������"] = "hu bayin",
           },
}
Room {
	id = "xueshan/huilang8",
	name = "������",
	ways = {
		["westup"] = "xueshan/zhudubadian",
		["south"] = "xueshan/huilang6",
		["east"] = "xueshan/boluomiyuan",
	},
}
Room {
	id = "xueshan/jiaopan",
	name = "����",
	ways = {
		["northwest"] = "xueshan/houzidong",
	},
}
Room {
	id = "xueshan/jiedao1",
	name = "�ֵ�",
	ways = {
		["south"] = "xueshan/mingxiamen",
		["north"] = "xueshan/jiedao2",
		["east"] = "xueshan/dachedian",
		["west"] = "xueshan/menghuying",
	},
}
Room {
	id = "xueshan/jiedao2",
	name = "�ֵ�",
	ways = {
		["south"] = "xueshan/jiedao1",
		["north"] = "xueshan/zanpugc",
		["east"] = "xueshan/yixianglou",
		["west"] = "xueshan/zuofang",
	},
}
Room {
	id = "xueshan/jiedao3",
	name = "�ֵ�",
	ways = {
		["south"] = "xueshan/zanpugc",
		["east"] = "xueshan/wangdali",
		["north"] = "xueshan/jushuimen",
		["west"] = "xueshan/laifu",
	},
}
Room {
	id = "xueshan/jieyuantang",
	name = "��Ե��",
	ways = {
		["east"] = "xueshan/huilang3",
	},
}
Room {
	id = "xueshan/jifengying",
	name = "����Ӫ",
	ways = {
		["south"] = "xueshan/yingmen",
		["north"] = "xueshan/shenfengying",
	},
}
Room {
	id = "xueshan/jingangyuan",
	name = "���Ժ",
	ways = {
		["south"] = "xueshan/kuxiuzhacang",
		["east"] = "xueshan/fanyinge",
	},
}
Room {
	id = "xueshan/jingjinzhacang",
	name = "��������",
	ways = {
		["north"] = "xueshan/jingtang",
		["west"] = "xueshan/hufazhacang",
	},
	objs = {
          ["����"] = "shan yong",
           },
}
Room {
	id = "xueshan/jingtang",
	name = "����",
	ways = {
		["south"] = "xueshan/jingjinzhacang",
		["west"] = "xueshan/fanyinge",
	},
}
Room {
	id = "xueshan/jishantang",
	name = "������",
	ways = {
		["east"] = "xueshan/huilang5",
	},
}
Room {
	id = "xueshan/jlshan",
	name = "����ɽ",
	ways = {
		["southdown"] = "xueshan/tianxi",
	},
}
Room {
	id = "xueshan/juechenyuan",
	name = "����Ժ",
	no_fight = true,
	ways = {
		["out"] = "xueshan/yueliangmen",
	},
}
Room {
	id = "xueshan/jueding",
	name = "����",
	ways = {
		["down"] = "xueshan/shanpo",
	},
}
Room {
	id = "xueshan/jushuimen",
	name = "��ˮ��",
	ways = {
		["south"] = "xueshan/jiedao3",
		["north"] = "xueshan/tianyunmc",
	},
}
Room {
	id = "xueshan/kuxiuzhacang",
	name = "��������",
	ways = {
		["north"] = "xueshan/jingangyuan",
		["east"] = "xueshan/hufazhacang",
	},
	objs = {
          ["ʤ��"] = "sheng di",
           },
}
Room {
	id = "xueshan/laifu",
	name = "�����ӻ�",
	no_fight = true,
	ways = {
		["east"] = "xueshan/jiedao3",
	},
	objs = {
          ["������"] = "jiang laifu",
           },
}
Room {
	id = "xueshan/lingtalin",
	name = "������",
	ways = {
		["east"] = "xueshan/fotang",
		["enter"] = "xueshan/baota1",
		-- ["westup"] = "xueshan/xuelu1",
	},
	nolooks = {
		["westup"] = true,
	},
}
Room {
	id = "xueshan/baota1",
	name = "����������",
	ways = {
		["out"] = "xueshan/lingtalin",
	},
}
Room {
	id = "xueshan/luofenggang",
	name = "����",
	ways = {
		["east"] = "xueshan/fengjiantai",
		["tiao down"] = "xueshan/xuegu",
	},
	nolooks = {
		["tiao down"] = true,
	},
}
Room {
	id = "xueshan/luoweitang",
	name = "��΢��",
	ways = {
		["east"] = "xueshan/daritang",
		["west"] = "xueshan/huilang4",
	},
	objs = {
          ["������"] = "zheluo xing",
           },
}
Room {
	id = "xueshan/menghuying",
	name = "�ͻ�Ӫ",
	ways = {
		["east"] = "xueshan/jiedao1",
	},
}
Room {
	id = "xueshan/mingxiamen",
	name = "��ϼ��",
	ways = {
		["east"] = "xueshan/tulu3",
		["north"] = "xueshan/jiedao1",
	},
}
Room {
	id = "xueshan/muchang1",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang2",
		["east"] = "xueshan/muchang4",
		["north"] = "xueshan/muchang1",
		["west"] = "xueshan/muchang1",
	},
	objs = {
          ["����"] = "zang ao",
           },
}
Room {
	id = "xueshan/muchang2",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang3",
		["north"] = "xueshan/muchang1",
		["west"] = "xueshan/muchang2",
		["east"] = "xueshan/cunluo2",
	},
}
Room {
	id = "xueshan/muchang3",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang3",
		["north"] = "xueshan/muchang2",
		["west"] = "xueshan/muchang3",
		["east"] = "xueshan/cunluo1",
	},
}
Room {
	id = "xueshan/muchang4",
	name = "����",
	ways = {
		["south"] = "xueshan/cunluo2",
		["north"] = "xueshan/muchang4",
		["west"] = "xueshan/muchang1",
		["east"] = "xueshan/muchang5",
	},
	objs = {
          ["��ţ"] = "mao niu",
           },
}
Room {
	id = "xueshan/muchang5",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang6",
		["north"] = "xueshan/muchang5",
		["west"] = "xueshan/muchang1",
		["east"] = "xueshan/muchang5",
	},
}
Room {
	id = "xueshan/muchang6",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang7",
		["north"] = "xueshan/muchang5",
		["west"] = "xueshan/cunluo2",
		["east"] = "xueshan/muchang6",
	},
}
Room {
	id = "xueshan/muchang7",
	name = "����",
	ways = {
		["south"] = "xueshan/muchang7",
		["east"] = "xueshan/muchang7",
		["north"] = "xueshan/muchang6",
		["west"] = "xueshan/cunluo1",
	},
}
Room {
	id = "xueshan/niupidazhang",
	name = "ţƤ����",
	ways = {
		["south"] = "xueshan/shenfengying",
	},
}
Room {
	id = "xueshan/qingxinshe",
	name = "������",
	no_fight = true,
	ways = {
		["out"] = "xueshan/chiyangmen",
	},
}
Room {
	id = "xueshan/queridian",
	name = "ȴ�յ�",
	ways = {
		["eastdown"] = "xueshan/huilang6",
		["westdown"] = "xueshan/huilang5",
		["south"] = "xueshan/dadian",
		["north"] = "xueshan/zhudubadian",
	},
	objs = {
          ["Ħڭ��˼"] = "mohe basi",
           },
}
Room {
    id = "xueshan/rimulundian",
    name = "��ľ�׵�",
    ways = {
            ["southeast"] = "xueshan/zhaitang",
            ["north"] = "xueshan/hufazhacang",
            ["east"] = "xueshan/chiyangmen",
            ["west"] = "xueshan/yueliangmen",
            ["out"] = "xueshan/xiekemen",
    },
    blocks = {
            ["southeast"] = {
                    {id = "hufa lama", exp = 100000, party = "������"},
            },        
            ["east"] = {
                    {id = "hufa lama", exp = 100000, party = "������"},
            },
            ["west"] = {
                    {id = "hufa lama", exp = 100000, party = "������"},
            },
    },
}
Room {
	id = "xueshan/shanlu1",
	name = "������",
	ways = {
		["northwest"] = "xueshan/shanlu2",
		["east"] = "xueshan/tianhu",
	},
}
Room {
	id = "xueshan/shanlu2",
	name = "ǧ����",
	ways = {
		["southeast"] = "xueshan/shanlu1",
		["westup"] = "xueshan/shanlu3",
	},
	room_relative="ǧ�����ǧ����K������ǧ����",
}
Room {
	id = "xueshan/shanlu3",
	name = "ǧ����",
	ways = {
		["eastdown"] = "xueshan/shanlu2",
		["westdown"] = "xueshan/shanlu4",
	},
	room_relative="���Ŀڡ�ǧ�����ǧ����ǧ����",
}
Room {
	id = "xueshan/shanlu4",
	name = "���Ŀ�",
	ways = {
		["eastup"] = "xueshan/shanlu3",
		["westup"] = "xueshan/fengjiantai",
	},
	precmds = {
		["eastup"] = "#walkBusy",
		["westup"] = "#walkBusy",
	},
	objs = {
          ["����"] = "bao xiang",
           },
}
Room {
	id = "xueshan/shanlu5",
	name = "ѩ���ŵ�",
	ways = {
		["southeast"] = "xueshan/shanlu6",
		["southwest"] = "xueshan/xuelingquan",
	},
	objs = {
          ["ѩ��Ƥ"] = "bao pi",
		  ["ѩ��"] = "xue bao",
           },
}
Room {
	id = "xueshan/shanlu6",
	name = "ѩ���ŵ�",
	ways = {
		["eastup"] = "xueshan/shanlu7",
		["northwest"] = "xueshan/shanlu5",
	},
}
Room {
	id = "xueshan/shanlu7",
	name = "ѩ���ŵ�",
	ways = {
		["eastdown"] = "xueshan/houzidong",
		["westdown"] = "xueshan/shanlu6",
		["northwest"] = "xueshan/shanmen",
	},
}
Room {
	id = "xueshan/shanmen",
	name = "������ɽ��",
	ways = {
		["southeast"] = "xueshan/shanlu7",
		["northup"] = "xueshan/guangchang",
	},
	nolooks = {
		["northup"] = true,
	},
	precmds = {
		["northup"] = "knock gate;#walkBusy",
	},
}
Room {
	id = "xueshan/shanpo",
	name = "����̨",
	ways = {
		["southdown"] = "xueshan/xuelu3",
		["east"] = "xueshan/binglinfeng",
	},
}
Room {
	id = "xueshan/shenfengying",
	name = "���Ӫ",
	ways = {
		["south"] = "xueshan/jifengying",
		["north"] = "xueshan/niupidazhang",
	},
}
Room {
	id = "xueshan/tianhu",
	name = "���",
	ways = {
		["southwest"] = "xueshan/xiaolu1",
		["south"] = "xueshan/xiaodian",
		["north"] = "xueshan/tianxi",
		["west"] = "xueshan/shanlu1",
	},
	objs = {
          ["֧��Ѽ"] = "zhima ya",
          ["��ͷ��"] = "bantou yan",
           },
}
Room {
	id = "xueshan/tianxi",
	name = "��Ϫ",
	ways = {
		["south"] = "xueshan/tianhu",
	},
}
Room {
	id = "xueshan/tianyunmc",
	name = "������",
	ways = {
		["south"] = "xueshan/jushuimen",
		["east"] = "xueshan/caishichang",
	},
}
Room {
	id = "xueshan/tulu1",
	name = "������·",
	ways = {
		["southwest"] = "group/entry/xstulu2",
		["east"] = "chengdu/wroad2",
	},
}
Room {
	id = "xueshan/tulu3",
	name = "�ر���·",
	ways = {
		["northeast"] = "group/entry/xstulu2",
		["west"] = "xueshan/mingxiamen",
	},
}
Room {
	id = "xueshan/wangdali",
	name = "��������",
	ways = {
		["west"] = "xueshan/jiedao3",
	},
	objs = {
          ["������"] = "wang sanli",
           },
}
Room {
	id = "xueshan/xiaodian",
	name = "����С��",
	ways = {
		["north"] = "xueshan/tianhu",
	},
	objs = {
          ["���"] = "da chou",
          ["����"] = "san chou",
          ["����"] = "er chou",
          ["�ĳ�"] = "si chou",
          ["���"] = "wu chou",
           },
}
Room {
	id = "xueshan/xiaolu1",
	name = "����С·",
	ways = {
		["southeast"] = "group/entry/xsxiao2",
		["northeast"] = "xueshan/tianhu",
	},
}
Room {
	id = "xueshan/xiaolu3",
	name = "����С·",
	ways = {
		["north"] = "xueshan/hubian",
		["east"] = "xueshan/fozhaomen",
		["west"] = "group/entry/xsxiao2",
	},
}
Room {
	id = "xueshan/xiekemen",
	name = "л��ͤ",
	ways = {
		["southup"] = "xueshan/zhudubadian",
		["enter"] = "xueshan/rimulundian",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
	blocks = {
		["enter"] = {
			{id = "hufa lama", exp = 100000, party = "������"},
		},
	},
	objs = {
          ["ɣ��"] = "sang jie",
           },
}
Room {
	id = "xueshan/xuegu",
	name = "ѩ��",
	ways = {
		["eastdown"] = "xueshan/shanlu2",
		["tiao down;#walkBusy"] = "xueshan/xuegu2",
	},
	lengths = {
		--["tiao down;#walkBusy"] = "if hp.shen>0 then return 10 else return false end",
		["tiao down;#walkBusy"] = 10 ,
	},
	objs = {
          ["Ѫ������"] = "xuedao laozu",
           },
}
Room {
	id = "xueshan/xuegu2",
	name = "��ʯ",
	ways = {
		["ask di yun about �뿪;jump up;#walkBusy"] = "xueshan/xuegu",
		--["#xsMianbi;askk di yun about �뿪;jump up;#walkBusy"] = "xueshan/xuegu",
	},
	--lengths = {
	--	["askk di yun about �뿪;jump up;#walkBusy"] = "if hp.shen>0 then return 1 else return false end",
	--	["#xsMianbi;askk di yun about �뿪;jump up;#walkBusy"] = "if hp.shen<0 then return 1 else return false end",
	--},
	objs = {
          ["����"] = "di yun",
           },
}
Room {
	id = "xueshan/xuelingquan",
	name = "ѩ��Ȫ",
	ways = {
		["northeast"] = "xueshan/shanlu5",
		["southdown"] = "xueshan/fengjiantai",
		["tiao quanshui"] = "xueshan/quanshui",
	},
}
Room {
	id = "xueshan/quanshui",
	name = "Ȫˮ��",
	ways = {
		["tiao out"] = "xueshan/xuelingquan",
	},
}
Room {
	id = "xueshan/xuelu1",
	name = "��ѩС·",
	ways = {
		["northup"] = "xueshan/xuelu2",
		["eastdown"] = "xueshan/lingtalin",
	},
}
Room {
	id = "xueshan/xuelu2",
	name = "��ѩС·",
	ways = {
		["southdown"] = "xueshan/xuelu1",
		["westup"] = "xueshan/xuelu3",
	},
}
Room {
	id = "xueshan/xuelu3",
	name = "��ѩС·",
	ways = {
		["eastdown"] = "xueshan/xuelu2",
		["northup"] = "xueshan/shanpo",
	},
}
Room {
	id = "xueshan/yimogong",
	name = "��Ħ��",
	ways = {
		["west"] = "xueshan/huilang6",
	},
	objs = {
          ["������"] = "boluo xing",
           },
}
Room {
	id = "xueshan/yingmen",
	name = "Ӫ��",
	ways = {
		["south"] = "xueshan/caohai1",
		["north"] = "xueshan/jifengying",
	},
}
Room {
	id = "xueshan/yixianglou",
	name = "����¥",
	ways = {
		["west"] = "xueshan/jiedao2",
	},
	objs = {
          ["����"] = "hu gui",
           },
}
Room {
	id = "xueshan/yueliangmen",
	name = "������",
	ways = {
		["enter"] = "xueshan/juechenyuan",
		["east"] = "xueshan/rimulundian",
	},
}
Room {
	id = "xueshan/yushengdian",
	name = "��ʥ��",
	ways = {
		["east"] = "xueshan/huilang7",
	},
}
Room {
	id = "xueshan/zanpugc",
	name = "���չ㳡",
	ways = {
		["south"] = "xueshan/jiedao2",
		["north"] = "xueshan/jiedao3",
		["east"] = "xueshan/huanggong",
		["west"] = "xueshan/fozhaomen",
	},
}
Room {
	id = "xueshan/zhaitang",
	name = "ի��",
	ways = {
		["northwest"] = "xueshan/rimulundian",
		["north"] = "xueshan/chufang",
	},
}
Room {
	id = "xueshan/zhengfang",
	name = "����",
	no_fight = true,
	ways = {
		["out"] = "xueshan/dachedian",
	},
}
Room {
	id = "xueshan/zhonglou",
	name = "��¥",
	ways = {
		["east"] = "xueshan/huilang1",
	},
}
Room {
	id = "xueshan/zhudubadian",
	name = "�鶼�͵�",
	ways = {
		["eastdown"] = "xueshan/huilang8",
		["westdown"] = "xueshan/huilang7",
		["south"] = "xueshan/queridian",
		["northdown"] = "xueshan/xiekemen",
	},
	objs = {
          ["���Զ�"] = "wenwo er",
           },
}
Room {
	id = "xueshan/zuofang",
	name = "��ެ֯������",
	ways = {
		["east"] = "xueshan/jiedao2",
	},
}
Room {
	id = "zhiye/biaoju1",
	name = "�����ھ�",
	outdoor = "����",
	ways = {
		["south"] = "city/dongmen",
	},
}
Room {
	id = "zhiye/bingqipu1",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/dongdajie0",
	},
	objs = {
          ["��¯"] = "huo lu",
          ["������"] = "han tiejiang",
           },
}
Room {
	id = "zhiye/caifengpu1",
	name = "�÷���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "changan/northjie2",
	},
	objs = {
          ["�÷���"] = "caifeng zhuo",
     },
}
Room {
	id = "zhiye/caikuang-chang0",
	name = "�ɿ����",
	ways = {
		-- ["westup"] = "zhiye/caikuang-chang10",
		["northeast"] = "huanghe/shulin2",
	},
	nolooks = {
		["westup"] = true,
	},
}
Room {
	id = "zhiye/caikuang-chang1",
	name = "ɽ·",
	ways = {
		["south"] = "zhiye/caikuang-chang11",
		["north"] = "zhiye/caikuang-chang11",
		["east"] = "zhiye/caikuang-chang11",
		["southdown"] = "zhiye/caikuang-chang10",
		["west"] = "zhiye/caikuang-chang11",
	},
}
Room {
	id = "zhiye/caikuang-chang10",
	name = "�ɿ�",
	ways = {
		["northup"] = "zhiye/caikuang-chang1",
		["southup"] = "zhiye/caikuang-chang2",
		["eastdown"] = "zhiye/caikuang-chang0",
		["westup"] = "zhiye/caikuang-chang3",
	},
}
Room {
	id = "zhiye/caikuang-chang11",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang1",
	},
}
Room {
	id = "zhiye/caikuang-chang12",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang2",
	},
}
Room {
	id = "zhiye/caikuang-chang13",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang3",
	},
}
Room {
	id = "zhiye/caikuang-chang2",
	name = "ɽ·",
	ways = {
		["south"] = "zhiye/caikuang-chang12",
		["north"] = "zhiye/caikuang-chang12",
		["east"] = "zhiye/caikuang-chang12",
		["northdown"] = "zhiye/caikuang-chang10",
		["west"] = "zhiye/caikuang-chang12",
	},
}
Room {
	id = "zhiye/caikuang-chang3",
	name = "ɽ·",
	ways = {
		["eastdown"] = "zhiye/caikuang-chang10",
		["south"] = "zhiye/caikuang-chang13",
		["east"] = "zhiye/caikuang-chang13",
		["north"] = "zhiye/caikuang-chang13",
		["west"] = "zhiye/caikuang-chang13",
	},
}
Room {
	id = "zhiye/datiepu1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongdajie0",
	},
}
Room {
	id = "zhiye/gaoshan0",
	name = "��ɽ����",
	outdoor = "�ɶ�����",
	ways = {
		["west"] = "chengdu/road1",
	},
	nolooks = {
		["northup"] = true,
		["southup"] = true,
		["eastup"] = true,
	},
}
Room {
	id = "zhiye/gaoshan1",
	name = "ɽ��",
	ways = {
		["southdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/gaoshan2",
	name = "ɽ��",
	ways = {
		["northdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/gaoshan3",
	name = "ɽ��",
	ways = {
		["westdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/jiaoliushi1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "zhiye/jimaidian1",
	},
	objs = {
          ["���齻����"] = "board",
           },
}
Room {
	id = "zhiye/jimaidian1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/dongdajie1",
		["west"] = "zhiye/jiaoliushi1",
	},
}
Room {
	id = "zhiye/nongtian0",
	name = "ũ���",
	ways = {
		["southeast"] = "zhiye/nongtian2",
		["southwest"] = "zhiye/nongtian1",
		["north"] = "changan/northroad4",
		["northeast"] = "zhiye/nongtian3",
	},
}
Room {
	id = "zhiye/nongtian1",
	name = "�﹡",
	ways = {
		["south"] = "zhiye/nongtian11",
		["north"] = "zhiye/nongtian11",
		["east"] = "zhiye/nongtian11",
		["northeast"] = "zhiye/nongtian0",
		["west"] = "zhiye/nongtian11",
	},
}
Room {
	id = "zhiye/nongtian11",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian1",
	},
}
Room {
	id = "zhiye/nongtian12",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian2",
	},
}
Room {
	id = "zhiye/nongtian13",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian3",
	},
}
Room {
	id = "zhiye/nongtian2",
	name = "�﹡",
	ways = {
		["south"] = "zhiye/nongtian12",
		["northwest"] = "zhiye/nongtian0",
		["north"] = "zhiye/nongtian12",
		["east"] = "zhiye/nongtian12",
		["west"] = "zhiye/nongtian12",
	},
}
Room {
	id = "zhiye/nongtian3",
	name = "�﹡",
	ways = {
		["southwest"] = "zhiye/nongtian0",
		["south"] = "zhiye/nongtian13",
		["north"] = "zhiye/nongtian13",
		["east"] = "zhiye/nongtian13",
		["west"] = "zhiye/nongtian13",
	},
}
Room {
	id = "zhiye/sanglin0",
	name = "ɣ����",
	ways = {
		["southeast"] = "zhiye/sanglin2",
		["southwest"] = "zhiye/sanglin3",
		["south"] = "changan/northroad4",
		["northwest"] = "zhiye/sanglin1",
	},
}
Room {
	id = "zhiye/sanglin1",
	name = "ɣ��С·",
	ways = {
		["southeast"] = "zhiye/sanglin0",
		["south"] = "zhiye/sanglin11",
		["north"] = "zhiye/sanglin11",
		["east"] = "zhiye/sanglin11",
		["west"] = "zhiye/sanglin11",
	},
}
Room {
	id = "zhiye/sanglin11",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin1",
	},
}
Room {
	id = "zhiye/sanglin12",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin2",
	},
}
Room {
	id = "zhiye/sanglin13",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin3",
	},
}
Room {
	id = "zhiye/sanglin2",
	name = "ɣ��С·",
	ways = {
		["south"] = "zhiye/sanglin12",
		["northwest"] = "zhiye/sanglin0",
		["east"] = "zhiye/sanglin12",
		["north"] = "zhiye/sanglin12",
		["west"] = "zhiye/sanglin12",
	},
}
Room {
	id = "zhiye/sanglin3",
	name = "ɣ��С·",
	ways = {
		["south"] = "zhiye/sanglin13",
		["north"] = "zhiye/sanglin13",
		["east"] = "zhiye/sanglin13",
		["northeast"] = "zhiye/sanglin0",
		["west"] = "zhiye/sanglin13",
	},
}
Room {
	id = "zhiye/yaochang1",
	name = "��ҩ����",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["west"] = "chengdu/beidajie2",
	},
}
Room {
	id = "zhiye/yaodian1",
	name = "ҩ��",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["east"] = "chengdu/beidajie2",
	},
}
Room {
	id = "zhiye/zhibufang1",
	name = "֯����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "changan/northjie2",
	},
}	