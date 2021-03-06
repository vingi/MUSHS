--
-- roleBase.lua
--
-- ----------------------------------------------------------
-- return-code checker for MUSHclient functions that return error codes
-- ----------------------------------------------------------
--
--[[

Call for those MUSHclient functions that return a result code (like eOK).
Not all functions return such a code.

eg.

--]]
----------------------------------------------------------------
-- 根据 角色的配置文件 返回设置的值, 参数为值的名称
-- 如: 想要返回角色 vingi 的配置文件里的 autokill 的值
-- eg. GetRoleConfig("autokill")
----------------------------------------------------------------
function GetRoleConfig(arg)
	local rolename = GetVariable("id")
	if rolename ~= nil and string.len(rolename) > 0 then
		rolename = "Role." .. rolename
		local role = require(rolename)
		if role.settings[arg] ~= nil then
			return role.settings[arg]
		else
			return ""
		end
	end
end

----------------------------------------------------------------
local function findfunction(x)
	assert(type(x) == "string")
	local f = _G
	for v in x:gmatch("[^%.]+") do
		if type(f) ~= "table" then
			return nil, "looking for '" .. v .. "' expected table, not " .. type(f)
		end
		f = f[v]
	end
	if type(f) == "function" then
		return f
	else
		return nil, "expected function, not " .. type(f)
	end
end
-- ---------------------------------------------------------------
-- 是否存在某个函数
-- ---------------------------------------------------------------
function FindRoleFunction(func)
	local IsExist = true
	local rolename = GetVariable("id")
	if rolename ~= nil and string.len(rolename) > 0 then
		local rolepath = "role." .. rolename
		local role = require(rolepath)
		local tempfunctionname = rolename .. "." .. func
		-- print(tempfunctionname)
		if findfunction(tempfunctionname) == nil then
			IsExist = false
		end
	end
	return IsExist
end
----------------------------------------------------------------
-- 根据 角色的配置文件 返回该角色的特定方法, 参数为该方法的名称
-- 如: 想要执行角色 vingi 的配置文件里autokill的function
-- eg. GetRoleFunction("autokill") 无参数方法
-- eg. GetRoleFunction("autokill","参数值") 有参数方法
----------------------------------------------------------------
function GetRoleFunction(arg, func_arg)
	local rolename = GetVariable("id")
	if rolename ~= nil and string.len(rolename) > 0 then
		local rolepath = "role." .. rolename
		local role = require(rolepath)
		local tempfunctionname = rolename .. "." .. arg
		--        print(tempfunctionname)
		if func_arg ~= nil then
			assert(findfunction(tempfunctionname))(func_arg)
		else
			assert(findfunction(tempfunctionname))()
		end
	end
end
