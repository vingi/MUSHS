--
-- redmoon.lua
--
-- ----------------------------------------------------------
-- return-code checker for MUSHclient functions that return error codes
-- ----------------------------------------------------------
--
--[[

Call for those MUSHclient functions that return a result code (like eOK).
Not all functions return such a code.

eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]


module("bluemoon", package.seeall)

settings = {
    -- �Ƿ��Զ���ΤС������Ȫ�� (���趨Ϊtrue, ������start�����ȥ����Ȫ��,�ù��̿��ܻ�ܾ�,�п��ܼ���Сʱ������, �򵽺�ŻῪʼ����job)
    AutoBuy_Xiaobao_Longquan = false,

    -- �Ƿ�ÿ���Զ����߹�����10��
    Auto_hqgzc_10times = true,

    -- �Ƿ� ������֮ǰ ��double����
    CheckNeili_InAdvance = true,

    -- �����������ʱ(��ҩ��CD״̬),ִ�еļ��ڶ���(����ɲ���), һЩ�����лָ��������ڹ�, �绪ɽ��yun zixia
    Recover_neili = "",

    -- �Ƿ�����ɽ2����
    HuashanJob_Step2 = false,

    -- �Ƿ��Զ�����¥ˢ��
    AutoDML = true,

    -- �Ƿ��Զ���̳�տ�ʯ
    -- ˵��, �Զ��տ�ʯ�ᷢ������ʺ�������WEBAPI�Ե�����ȡ��ʯ, ������ò���ȫ��, �벻Ҫʹ��
    AutoMine = true,
}


function tt()
    print("call redmoon method success")
end

function tta(arg)
    print("call arg success : " .. arg)
end


return bluemoon