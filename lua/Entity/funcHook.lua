--
-- funcHook.lua
--
-- ----------------------------------------------------------
-- ʵ���༯��
-- for checkhalt, checkbusy,checkbei�Ⱥ������ε�����������ʱ,���÷����Ĳ���ʹ��
-- ���� funchHook.func Ϊ��������, funcHook.arg1 ~ funcHook.arg4 Ϊ�����÷�������Ĳ���, ���ɴ��ĸ�����
-- ----------------------------------------------------------
--
--[[


eg.

require "Entity"

function tes(arg1, arg2)
    print("arg1:" .. arg1)
--    print("arg2:" .. arg2)
end

function testhaltok()
    local funcE = funcHook:new()
    funcE.func = tes
    funcE.arg1 = "����1����"
    funcE.arg2 = nil
    check_halt(funcE)
end

--]]


local funcHook = {
    func = test,
    arg1 = nil,
    arg2 = nil,
    arg3 = nil,
    arg4 = nil
}

function funcHook:new()
    --  �����µı���Ϊʵ���Ķ���
    local self = { }
    -- ����classΪ����Ԫ���__index
    setmetatable(self, { __index = funcHook })
    -- ���ظ��±�
    return self
end

-- function funcHook:func()
-- end

return funcHook
