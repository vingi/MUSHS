module("Event",package.seeall)

__index = _M

function new(match,group,flag)
	local defaultFlag = trigger_flag.Enabled
			-- + trigger_flag.KeepEvaluating
			+ trigger_flag.RegularExpression
			+ trigger_flag.Replace
			+ trigger_flag.LowercaseWildcard
			+ trigger_flag.Temporary
			+ trigger_flag.OneShot
	local event = {}
	setmetatable(event,_M)
	event.line = getLine(match)
	event.match = match
	event.flag = flag and defaultFlag + flag or defaultFlag
	event.group = group
	return event
end

function getLine(match)
	local i = 1
	for _,_ in string.gmatch(match,[[\n]]) do
		i = i + 1
	end
	return i
end

module("Callback",package.seeall)

__index = _M

function new(script,cmd)
	local callback = {}
	setmetatable(callback,_M)
	callback.script = script or ""
	callback.cmd = cmd or ""
	return callback
end

function getCallback(hexscript)
	local callback = {}
	setmetatable(callback,_M)
	callback.script = utils.fromhex(hexscript)
	return callback
end

function getHexscript(self)
	return utils.tohex(self.script)
end

function invoke(self,name,line,wildcards, styles)
	if self.script == "" then
		return nil
	end
	local _,_,script = string.find(self.script,"^s:(.+)$")
	if script then
		local _name = _G.name
		local _line = _G.line
		local _wildcards = _G.wildcards
		_G.name = name
		_G.line = line
		_G.wildcards = wildcards
		local result = {run(loadstring(script))}
		_G.name = _name
		_G.line = _line
		_G.wildcards = _wildcards
		return unpack(result)
	end
	local _,_,cmd = string.find(self.script,"^c:(.+)$")
	if cmd then
		e(cmd)
		return
	end
	local callback = _G[self.script]
	assert(callback, "触发回调函数为空 script = " .. tostring(script))
	return run(callback,name,line,wildcards, styles)
end

module("Listener",package.seeall)

local threads = {}
local listeners = {}
local defaultTimeout = 180

function reset()
	threads = {}
	listeners = {}
	DeleteTemporaryAliases() 
	DeleteTemporaryTimers() 
	DeleteTemporaryTriggers()
end

function add(event,callback)
	local id = getThreadId()
	local group = id .. (event.group or GetUniqueNumber())
	local name = genName(id,group,callback:getHexscript())
	regListenerAndThread(id,group)
	local match = event.match
	local flag = event.flag
	local cmd = callback.cmd
	TraceOut("Listener.add : id = " .. id .. ", group = " .. group .. ", name = " .. name
					.. ", match = " .. match .. ", flag = " .. flag .. ", cmd = " .. cmd)
	local result = AddTriggerEx(name,match,cmd,flag, -- Flags
		-1, -- Colour no change
		0, -- Wildcard copy to clipbrd
		"", -- SoundFileName
		"Listener.OnEvent", -- ScriptName
		cmd == "" and 0 or 10, -- Send To
		100) -- Sequence
	if result ~= 0 then
		log.error("trigger error : errorCode = " .. tostring(result))
	end
	SetTriggerOption(name,"group",group)
	if event.line > 1 then
		SetTriggerOption (name, "multi_line", 1)
		SetTriggerOption (name, "lines_to_match", event.line)
	end
end

function regListenerAndThread(id,group)
	getCurrentListeners(id)[group] = true
	threads[group] = assert(coroutine.running(), "Must be in coroutine")
end

function resume(id,group,...)
	local thread = threads[group]
	threads[group] = nil
	TraceOut("resume group = " .. group .. " , thread = " .. tostring(thread))
	TraceOut("resume result = " .. tostring(coroutine.resume(thread,...)))
end

function OnEvent(name,line,wildcards, styles)
	TraceOut("OnEvent : name = " .. name)
	local id, group, scripthex = unpack(utils.split(name,"_"))
	removeListener(id,group)
	local callback = Callback.getCallback(scripthex)
	local result = {callback:invoke(name,line,wildcards, styles)}
	resume(id,group,unpack(result))
end

function OnTimeout(name,line,wildcards)
	local threadId = utils.split(name,"_")[1]
	local thread = threads[threadId]
	TraceOut("OnTimeout : name = " .. name .. " , threadId = " .. threadId .. " , thread = " .. tostring(thread))
	coroutine.resume(thread,"timeout")
end

function genName(id,group,script)
	return id .. "_" .. group .. "_" .. script .. "_" .. GetUniqueNumber()
end

function getThreadId()
	local thread = assert(coroutine.running(), "Must be in coroutine")
	local _, _ , threadId = string.find(tostring(thread),"^thread: (%x+)$")
	return "thread" .. threadId
end

function addTimeout(seconds)
	local thread = assert(coroutine.running(), "Must be in coroutine")
	local threadId = getThreadId()
	threads[threadId] = thread
	local id = threadId .. "_" .. GetUniqueNumber()
	seconds = seconds or defaultTimeout
	local hours, minutes, seconds = convert_seconds (seconds)
	AddTimer (id, hours, minutes, seconds, "",
		timer_flag.Enabled + timer_flag.OneShot + 
		timer_flag.Temporary + timer_flag.Replace, 
		"Listener.OnTimeout")
	return id
end

function removeTimeout(id)
	local threadId = utils.split(id,"_")[1]
	threads[threadId] = nil
	DeleteTimer(id)
end

function removeAllListenerAndThread()
	local id = getThreadId()
	for group in pairs(getCurrentListeners(id)) do
		removeListener(id,group)
		threads[group] = nil
	end
end

function removeListener(id,group)
	DeleteTriggerGroup(group)
	getCurrentListeners(id)[group] = nil
	if table.getn(getCurrentListeners(id)) == 0 then
		listeners[id] = nil
	end
end

function getCurrentListeners(id)
	listeners[id] = listeners[id] or {}
	return listeners[id]
end
