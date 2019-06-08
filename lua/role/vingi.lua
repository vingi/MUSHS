--
-- vingi.lua
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
module("vingi", package.seeall)

settings = {
	-- �Ƿ��Զ���ΤС������Ȫ�� (���趨Ϊtrue, ������start�����ȥ����Ȫ��,�ù��̿��ܻ�ܾ�,�п��ܼ���Сʱ������, �򵽺�ŻῪʼ����job)
	AutoBuy_Xiaobao_Longquan = false,
	-- �Ƿ�ÿ���Զ����߹�����10��
	Auto_hqgzc_10times = false,
	-- �Ƿ� ������֮ǰ ��double����
	CheckNeili_InAdvance = false,
	-- ��������, û�п��ÿ�
	RecoverWeapon = "taiji sword",
	-- �����������ʱ(��ҩ��CD״̬),ִ�еļ��ڶ���(����ɲ���), һЩ�����лָ��������ڹ�, �绪ɽ��yun zixia
	Recover_neili = "yun zixia",
	-- ��ϰ��ָ�� (���鵥����ϰ��Ҫ����10��ָ��, ��������flood,�Ӷ�idle, ������ϰ�ܶ�, ��ѡ��ʹ��table�����ķ�ʽ, �ֶ�ν���)
	-- PracticeCMD = "wield taiji;jifa sword huashan-jianfa;lian sword 20;jifa sword jinshe-jianfa;lian sword 20;jifa sword huashan-jianfa;lian dodge 20;unwield taiji;bei none;jifa strike jinshe-zhangfa;lian strike 20;lian strike 20;lian cuff 20;wield taiji;lian force 20;unwield taiji;wield taibai;lian blade 20;unwield taibai;wield taiji;yun jingli;",
	PracticeCMD = {
		"unwield taiji;wield taibai blade;lian blade 20;lian blade 20;lian blade 20;lian blade 20;unwield taibai blade;wield taiji;yun jingli;",

		-- "wield taiji;jifa sword huashan-jianfa;lian sword 20;lian dodge 20;unwield taiji;bei none;jifa strike hunyuan-zhang;lian strike 20;jifa cuff poyu-quan;lian cuff 20;lian force 20;wield taiji;yun jingli;",

		-- "wield taiji;jifa sword dugu-jiujian;lian sword 20;lian dodge 20;unwield taiji;bei none;jifa cuff taizu-quan;lian cuff 20;jifa strike hunyuan-zhang;lian strike 20;lian force 20;wield taiji;yun jingli;"

		-- "drop mi tao;unwield taiji;jifa cuff taizu-quan;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;yun jingli;wield taiji;"
	},
	-- ǿ����ϰģʽ, �������κ�����, ǿ����ϰĳЩ����, ���ڲ�����ʱʹ��, ��������л�������
	PracticeForce = false,
	-- ǿ�Ʋ�����ģʽ, ��һֱ�����߹���������pot, ��pot��ȥѧϰ/����
	GetPotForce = false,
	-- �Ƿ�����ɽ2����
	HuashanJob_Step2 = false,
	-- �Ƿ��Զ�����¥ˢ��
	AutoDML = true,
	-- �Ƿ��Զ���̳�տ�ʯ
	-- ˵��, �Զ��տ�ʯ�ᷢ������ʺ�������WEBAPI�Ե�����ȡ��ʯ, ������ò���ȫ��, �벻Ҫʹ��
	AutoMine = true,
	-- �Ƿ�ÿ�����Զ���ȡ��Ա����
	AutoVipBenefit = true,
	-- �Ƿ��Զ�����Ebook˫��������
	AutoEbook = false
}

-- ---------------------------------------------------------------
-- ǿ���Ƴ�����װ��, װ���ϻ������� -- �Զ���ģʽ by particular role
-- ---------------------------------------------------------------
function Wield_RecoverWeapon()
	local cmd = "unwield kunlun sword;unwield mu jian;unwield taibai blade;wield taiji sword;"
	exe(cmd)
end

return vingi
