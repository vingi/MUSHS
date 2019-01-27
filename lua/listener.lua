package.path = GetInfo(57) .. "lua/?.lua"

require("util")
require("event")

function reset()
	Listener.reset()
end

function addSetListener(var,group)
	addListener([[^设定环境变量：(]] .. var .. [[) = "YES"$]],"s:return wildcards[1]",group,trigger_flag.OmitFromOutput)
end

function addListener(event,callback,group,flag)
	local event = type(event) == "string" and Event.new(event,group,flag) or event
	callback = Callback.new(callback)
	Listener.add(event,callback)
end

function listener(event, callback, flag, seconds, timeout)
	addListener(event, callback, nil, flag)
	return listen(seconds, timeout)
end

function listen(seconds, timeout, ...)
	local id = Listener.addTimeout(seconds)
	local result = {coroutine.yield()}
	Listener.removeTimeout(id)
	if result[1] == "timeout" then
		beforeTimeout(id, seconds, timeout, ...)
		Listener.removeAllListenerAndThread()
		if timeout then
			return timeout(...)
		else
			return defaultTimeoutFunc(id, ...)
		end
	end
	return unpack(result)
end
