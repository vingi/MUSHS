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
-- ���� ��ɫ�������ļ� �������õ�ֵ, ����Ϊֵ������
-- ��: ��Ҫ���ؽ�ɫ vingi �������ļ���� autokill ��ֵ
-- eg. GetRoleConfig("autokill")
----------------------------------------------------------------
function GetRoleConfig(arg)
    local rolename = GetVariable("id")
    if rolename ~= nil and string.len(rolename) > 0 then
        rolename = "role."..rolename
        local role = require(rolename)
        return role.settings[arg]
    end
end

----------------------------------------------------------------
local function findfunction(x)
  assert(type(x) == "string")
  local f=_G
  for v in x:gmatch("[^%.]+") do
    if type(f) ~= "table" then
       return nil, "looking for '"..v.."' expected table, not "..type(f)
    end
    f=f[v]
  end
  if type(f) == "function" then
    return f
  else
    return nil, "expected function, not "..type(f)
  end
end
----------------------------------------------------------------
-- ���� ��ɫ�������ļ� ���ظý�ɫ���ض�����, ����Ϊ�÷���������
-- ��: ��Ҫ���ؽ�ɫ vingi �������ļ���� autokill ��ֵ
-- eg. GetRoleConfig("autokill") �޲�������
-- eg. GetRoleConfig("autokill","����ֵ") �в�������
----------------------------------------------------------------
function GetRoleFunction(arg,func_arg)
    local rolename = GetVariable("id")
    if rolename ~= nil and string.len(rolename) > 0 then
        local rolepath = "role."..rolename
        local role = require(rolepath)
        local tempfunctionname = rolename.."."..arg
--        print(tempfunctionname)
        if func_arg ~= nil then
            assert(findfunction(tempfunctionname))(func_arg)
        else
            assert(findfunction(tempfunctionname))()
        end
    end
end