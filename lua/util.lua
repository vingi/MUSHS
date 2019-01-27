
lookCitys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "���ݳ�",	["changan"] = "������",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ���",	["city"] = "���ݳ�",		["dali"] = "�����",
	["daliwest"] = "�������",["dalisouth"] = "�������",["dalieast"] = "����Ƕ�",
	["wuliang"] = "����ɽ",	["dlhg"] = "����ʹ�",	["wangfu"] = "��������",	["yideng"] = "��Դ��",
	["yuxu"] = "�����",		["death"] = "ʮ�˲����",	["emei"] = "����ɽ",		["fairyland"] = "����ɽ",["menggu"] = "�ɹ�",["xiaoyao"] = "��ң",
	["foshan"] = "��ɽ��",	["fuzhou"] = "���ݳ�",	["gb"] = "ؤ��",			["quanzhen"] = "ȫ��",["gumu"] = "����ɽ",
	["jqg"] = "�����",		["xuantie"] = "��������",	["hengshan"] = "��ɽ",	["hj"] = "�ؽ�",	
	["hmy"] = "��ľ��",		["pingding"] = "ƽ����",	["huanghe"] = "�ƺ�����",	["yyd"] = "����",
	["huashan"] = "��ɽ",	["hz"] = "���ݳ�",		["jiaxing"] = "���˳�",	["kunlun"] = "����ɽ",
	["lanzhou"] = "���ݳ�",	["meizhuang"] = "÷ׯ",	["miaojiang"] = "�置",	["mingjiao"] = "����",
	["hdg"] = "������",		["hhd"] = "����",		["lsd"] = "���ߵ�",		["mr"] = "����Ľ��",
	["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",	["nanyang"] = "������",	["ningbo"] = "������",
	["putian"] = "��������",	["shaolin"] = "��ɽ����",	["sld"] = "������",		["songshan"] = "��ɽ",
	["suzhou"] = "���ݳ�",	["taishan"] = "̩ɽ",	["tanggu"] = "������",	["thd"] = "�һ���",
	["niujia"] = "ţ�Ҵ�",	["guiyun"] = "����ׯ",	["tianshan"] = "��ɽ",	["tiezhang"] = "����ɽ",
	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",	["wudang"] = "�䵱ɽ",
	["houshan"] = "�䵱��ɽ",	["wuguan"] = "���",		["xiakedao"] = "���͵�",	["xiangyang"] = "������",	
	["lzz"] = "������",		["xingxiu"] = "���޺�",	["yili"] = "�����",		["xueshan"] = "��ѩɽ",
	["caoyuan"] = "���ԭ",	["zhiye"] = "����",		["group"] = "��ԭ",		["entry"] = "",
}

citys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "����",	["changan"] = "����",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ�",	["city"] = "����",		["dali"] = "�����",
	["death"] = "ʮ�˲����",	["emei"] = "����ɽ",		["fairyland"] = "�����ɾ�",["foshan"] = "��ɽ",
	["fuzhou"] = "����",		["gb"] = "ؤ��ֶ�",		["gumu"] = "��Ĺ",		["hengshan"] = "��ɽ",
	["hj"] = "�ؽ�",			["hmy"] = "��ľ��",		["huanghe"] = "�ƺ�����",	["huashan"] = "��ɽ",
	["huijiang"] = "�ؽ�",	["hz"] = "����",			["jiaxing"] = "����",	["kunlun"] = "����ɽ",
	["lanzhou"] = "����",	["miaojiang"] = "�置",	["mingjiao"] = "����",	["murong"] = "Ľ��",
	["mr"] = "����Ľ��",		["nanyang"] = "����",	["ningbo"] = "����",		["putian"] = "��������",
	["meizhuang"] = "÷ׯ",	["shaolin"] = "������",	["sld"] = "������",		["songshan"] = "��ɽ",
	["suzhou"] = "����",		["taishan"] = "̩ɽ",	["tanggu"] = "����",		["thd"] = "�һ���",
	["tiezhang"] = "����ɽ",	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",
	["wudang"] = "�䵱ɽ",	["wuguan"] = "���",		["xiangyang"] = "����",	["xingxiu"] = "���޺�",
	["xueshan"] = "��ѩɽ",	["yangzhou"] = "����",	["guiyun"] = "����ׯ",	["hdg"] = "������",
	["jqg"] = "�����",		["bhd"] = "����",		["lsd"] = "���ߵ�",		["pingding"] = "ƽ����",
	["caoyuan"] = "���ԭ",	["niujia"] = "ţ�Ҵ�",	["wuliang"] = "����ɽ",	["wangfu"] = "��������",
	["yideng"] = "��Դ��",	["yili"] = "����",		["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",
	["bwdh"] = "�Խ�ɽׯ",	["zhiye"] = "��ԭ����",
}
otherCitys = {
	"�ɶ�����", "����Ǳ�", "˿��֮·", "�ؽ���ԭ",
}

DefaultTable = {}

function DefaultTable.new(value, tab)
	local mt = {__index = function() return value end}
	local t = tab or {}
	setmetatable(t, mt)
	return t
end

function closeAll()
	local worldList = GetWorldList()
	for _, id in pairs(worldList) do
		local world = GetWorld(id)
		if id ~= "init" and not world:IsConnected() then
			world:Activate()
			world:DoCommand("Close")
		end
	end
end

function getWorld(world)
	if world then
		local minIndex = 100
		local w
		for _, worldId in pairs(GetWorldList()) do
			local index = string.find(worldId, world)
			if index and index < minIndex then
				minIndex = index
				w = GetWorld(worldId)
			end
		end
		return w
	else
		return GetWorldById(GetWorldID())
	end
end

function ac(world)
	local w = getWorld(world)
	w:Activate()
	return w
end

function reload(world)
	local w = ac(world)
	w:DoCommand("ReloadScriptFile")
end

function reloadAll()
	local worldList = GetWorldList()
	for _, id in pairs(worldList) do
		local world = GetWorld(id)
		if id ~= "init" then
			world:Activate()
			world:DoCommand("ReloadScriptFile")
		end
	end
end

function count(tab)
	local count = 0
	for _ in pairs(tab) do
		count = count + 1
	end
	return count
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

function getLookCity(path)
	if path == "meizhuang/plum_maze" then
		return nil
	end
	local place = getPlace(path)
	for k,v in pairs(place) do
		if v == "zhiye" or v == "entry" then
			return nil
		end
		city = lookCitys[v]
		if city then
			return city
		end
	end
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
		if city and count(getRooms(name,city)) > 0 then
			return name, city
		end
	end
	return false
end

local wait_threads = {}

function wait(seconds)
	seconds = seconds / 1000
	local id = "wait_timer_" .. GetUniqueNumber ()
	TraceOut("add wait timer " .. id)
	wait_threads [id] = assert (coroutine.running (), "Must be in coroutine")
	local hours, minutes, seconds = convert_seconds (seconds)
	AddTimer (id, hours, minutes, seconds, "",
		timer_flag.Enabled + timer_flag.OneShot +
		timer_flag.Temporary + timer_flag.Replace, 
		"timer_resume")
	return coroutine.yield ()
end

function wa(seconds)
	wait(seconds)
end

function timer_resume (name)
	local thread = wait_threads [name]
	if thread then
		wait_threads [name] = nil
		assert (coroutine.resume (thread))
	end
end

function trans(num)
	if not num then
		return 0
	end
	local _, _, wan, other = string.find(num, "^(.-)��(.*)$")
	local result = 0
	if wan then
		result = result + trans0(wan) * 10000
		num = other
	end
	result = result + trans0(num)
	return result
end

function trans0(num)
	num = string.gsub(num,"^ʮ(.*)$","һʮ%1")
	num = string.gsub(num,"��ʮ","һʮ")
	num = string.gsub(num,"��","")
	local result = 0
	local numbers = {"һ","��","��","��","��","��","��","��","��"}
	for k,v in pairs(numbers) do
		num = string.gsub(num,v,k)
	end
	local units = {["0|"] = "ʮ", ["00|"] = "��", ["000|"] = "ǧ"}
	for k,v in pairs(units) do
		num = string.gsub(num,v,k)
	end
	for v in string.gmatch(num,"(%d+)") do
		result = result + v
	end
	return result
end

function load(table)
	local vars = loadstring("return " .. table)()
	for k,v in pairs(vars) do
		if v then
			_G[k] = v
		else
			_G[k] = nil
		end
	end
end

local function basicSerialize (o)
	if type(o) == "number" or type(o) == "boolean" then
		return tostring(o)
	else
		return string.format("%q", o)
	end
end

local function save_item (value, out)
	if type (value) == "number" or type (value) == "string" or type (value) == "boolean" then
		table.insert (out, basicSerialize(value))
	elseif type (value) == "table" then
		table.insert (out, "{")
		for k, v in pairs (value) do
			if not string.find (k, '^[_%a][_%a%d]*$') then
				table.insert (out, "[" .. basicSerialize (k) .. "] = ")
			else
				table.insert (out, k .. " = ")
			end
			save_item (v, out)
			table.insert (out, ",")
		end
		table.insert (out, "}")
	end
end

function save (v)
	local out = {}
	save_item (v, out)
	return table.concat (out)
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
			log.debug("Cache ���У�key = " .. v.key)
			value = v.value
			table.remove(self, k)
			table.insert(self, 1, v)
			break
		end
	end
	if not value then
		log.debug("Cache δ���У�key = " .. key)
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

function convert_seconds (seconds)
	local hours = math.floor (seconds / 3600)
	seconds = seconds - (hours * 3600)
	local minutes = math.floor (seconds / 60)
	seconds = seconds - (minutes * 60)
	return hours, minutes, seconds
end

function run(func,...)
	if coroutine.running () then
		return func(...)
	else
		return coroutine.wrap(func)(...)
	end
end

function e(cmd)
	run(exec,cmd)
end

function exec(cmd)
	if string.find(cmd,";") then
		for _,c in pairs(utils.split(cmd,";")) do
			e(c)
		end
		return
	end
	local _,_,func,params = string.find(cmd,"^#(%a%w*)%s*(.-)$")
	if func then
		params = utils.split(params," ")
		if table.getn(params) == 1 and params[1] == "" then
			params = {}
		end
		_G[func](unpack(params))
		return
	end
	local _,_,time,c = string.find(cmd,"^#(%d+)%s+(.+)$")
	if time then
		for i = 1, time do
			e(c)
		end
	else
		Execute(cmd)
	end
end

function hide(cmd)
	SendNoEcho(cmd)
end

local threads = {}

defaultTimeout = 180

function beforeTimeout(id, seconds, timeout, ...)
	local threadId = string.lower(utils.split(id,"_")[1])
	if not timeout then
		log.warn(id .. " : timeout")
		for _, triggerId in pairs(GetTriggerList()) do
			if string.find(triggerId, threadId) then
				log.warn(triggerId, GetTriggerInfo(triggerId, 1))
			end
		end
	end
end

function defaultTimeoutFunc(id)
	init()
end

local LEVEL_DEBUG = 1
local LEVEL_INFO = 2
local LEVEL_WARN = 3
local LEVEL_ERROR = 4
local DEFAULT_LOG_LEVEL = 4

function getInit()
	local init = GetWorld("init")
	return init or {
		GetVariable = function() return nil	end,
	}
end

log = {}
function getLogLevel()
	local _level = log_level or GetVariable("log_level") or tonumber(getInit():GetVariable("log_level")) or DEFAULT_LOG_LEVEL
	return tonumber(_level)
end

function log.write(file, level, color, ...)
	local msg = ""
	for _, v in pairs({...}) do
		msg = msg .. tostring(v) .. " "
	end
	msg = level .. " : " .. msg
	local date = os.date("%y/%m/%d %X")
	local logMsg = date .. " : " .. GetInfo(2) .. " �� " .. msg .. "\n"
	print(date .. " : " .. msg)
	cap(date .. " : " .. msg, nil, color)
	writeFile(GetInfo(57) .. "logs/" .. file, logMsg, true)
end

function log.debug(...)
	if getLogLevel() <= LEVEL_DEBUG then
		log.write("debug.log", "debug", "silver", ...)
	end
end

function log.info(...)
	if getLogLevel() <= LEVEL_INFO then
		log.write("info.log", "info", nil, ...)
	end
end

function log.warn(...)
	if getLogLevel() <= LEVEL_WARN then
		log.write("warn.log", "warn", "lime", ...)
	end
end

function log.error(...)
	if getLogLevel() <= LEVEL_ERROR then
		log.write("error.log", "error", "red", ...)
	end
end

function cap(msg, styles, color, backcolor)
	local w = GetWorld ("init")
	if w then
		if styles then
			w:Tell(GetInfo(2) .. " �� ")
			for _, v in ipairs (styles) do
				w:ColourTell (RGBColourToName (v.textcolour), RGBColourToName (v.backcolour), v.text)  
			end
			w:Note ("")
		elseif color then
			w:Tell(GetInfo(2) .. " �� ")
			w:ColourTell(color, backcolour or "BLACK", msg)
			w:Note("")
		else
			w:Note(GetInfo(2) .. " �� " .. msg)
		end
	end
end

function set(var)
	var = var or tostring(GetUniqueNumber())
	hide("set " .. var)
	hide("unset " .. var)
	return var
end

local store = false
function setVariable(name, value)
	if store then
		if not value then
			delVariable(name)
		else
			SetVariable(name, save(value))
		end
	else
		_G[getVarName(name)] = value
	end
end

function delVariable(name)
	DeleteVariable(name)
end

function getVariable(name)
	if store then
		return loadstring("return " .. tostring(GetVariable(name)))()
	else
		return _G[getVarName(name)]
	end
end

function getVarName(name)
	return "VAR_" .. name
end

function readFile(path)
	local f = io.open(path, "r")
	if not f then
		return false
	else
		local content = f:read("*all")
		f:close()
		return content
	end
end

function writeFile(path, msg, append)
	local type = append and "a" or "w"
	local f = io.open(path, type)
	f:write(msg)
	f:close()
end

function randomGet(tab)
	local count = 0
	for _ in pairs(tab) do
		count = count + 1
	end
	local n = math.random(count)
	count = 0
	for k, v in pairs(tab) do
		count = count + 1
		if count == n then
			return k, v
		end
	end
end

function process(worldId, id, func, ...)
	local param = loadstring("return " .. table.concat({...}, " "))()
	local w = GetWorldById(worldId)
	local result = _G[func](param)
	w:Execute("#remoteReturn " .. id .. " " .. save(result))
end

function remoteInvoke(func, param)
	local id = "result_" .. GetUniqueNumber ()
	local worldId = GetWorldID()
	local init = GetWorld("init")
	init:Execute("#process " .. worldId .. " " .. id .. " " .. func .. " " .. save(param))
	local result = _G[id]
	_G[id] = nil
	return result
end

function remoteReturn(id, ...)
	local result = table.concat({...}, " ")
	_G[id] = loadstring("return " .. tostring(result))()
end
