--
-- Vip.lua
--
-- ----------------------------------------------------------
-- Vip��ز���
-- ----------------------------------------------------------
--
--[[

eg.


--]]
Vip = {
    LastAsk = nil
}
-- ---------------------------------------------------------------
-- ���Ա�������败���� trigger
-- ---------------------------------------------------------------
function Vip.Trigger()
    DeleteTriggerGroup("vipbenefit")
    create_trigger_t("vipbenefit1", "^(> )*�����ϰ岻�ͷ��ĵ�����һ�ۣ�˵����û������æ����", "", "Vip.vipbenefit_DoItAgain")
    create_trigger_t("vipbenefit2", "^(> )*�����ϰ�˵�����Ǳ�վ(.*)��Ա,��������ʦ����Ϊ��׼����", "", "Vip.Benefit_DBRecord")
    create_trigger_t("vipbenefit3", "^(> )*�����ϰ�˵�������������Ѿ���������ˣ������������ɡ���", "", "Vip.Benefit_DBRecord")
    SetTriggerOption("vipbenefit1", "group", "vipbenefit")
    SetTriggerOption("vipbenefit2", "group", "vipbenefit")
    SetTriggerOption("vipbenefit3", "group", "vipbenefit")
end
-- ---------------------------------------------------------------
-- ��ȡ��Ա��Ա
-- ---------------------------------------------------------------
function Vip.ask()
    Vip.LastAsk = "ask laoban about ��Ա����"
    exe(Vip.LastAsk)
    check_bei(Vip.ask2)
end
-- ---------------------------------------------------------------
-- ��ȡ��Ա����
-- ---------------------------------------------------------------
function Vip.ask2()
    Vip.LastAsk = "ask laoban about ��Ա����"
    exe(Vip.LastAsk)
    if GetRoleConfig("AutoEbook") then
        check_bei(Ebookcheck)
    else
        DeleteTriggerGroup("vipbenefit")
        Gstart()
    end
end
-- ---------------------------------------------------------------
-- �����ϰ�busyʱ, �ٴ�Ask
-- ---------------------------------------------------------------
function Vip.vipbenefit_DoItAgain()
    if Vip.LastAsk ~= nil then
        wait.make(
            function()
                wait.time(0.5)
                return exe(Vip.LastAsk)
            end
        )
    end
end
-- ---------------------------------------------------------------
-- ���һ�λ�Ա������ȡ, ����¼д�����ݿ�
-- ---------------------------------------------------------------
function Vip.Benefit_DBRecord()
    local tsql =
        "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" ..
        score.id .. "', '" .. score.name .. "', '��Ա������ȡ', '')"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end
-- ---------------------------------------------------------------
-- ��ȡ������ȡ��¼
-- ---------------------------------------------------------------
function Vip.GetDBRecord()
    local reboottime = tostring(common.GetLastRebootTime())
    local tsql =
        "SELECT count(*) FROM [ActivityRecord] where ActivityName = '��Ա������ȡ' and RoleID = '" ..
        score.id .. "' and CreateTime > '" .. reboottime .. "'"
    local db = DBHelper:new()
    return db:GetRowAmount(tsql)
end
-- ---------------------------------------------------------------
-- ִ����ȡ��Ա�����ͻ�Ա����Ķ���
-- ---------------------------------------------------------------
function Vip.GetBenefit()
    -- �������Ա��������
    Vip.Trigger()
    go(Vip.ask, "���ݳ�", "����")
end
-- ---------------------------------------------------------------
-- ����Ƿ��Ѿ���ȡ��Ա�����ͻ�Ա����
-- ---------------------------------------------------------------
function Vip.CheckGetBenefit()
    local isTrue = false
    if GetRoleConfig("AutoVipBenefit") and string.trim(score.vip) ~= "��ͨ��Ա" then
        local times = Vip.GetDBRecord()
        if tonumber(times) == 0 then
            -- ������ȡ����
            isTrue = true
        end
    end
    return isTrue
end
-- ---------------------------------------------------------------
-- �һ� Ebook
-- ---------------------------------------------------------------
function Ebookcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Ebookcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipEbookck")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ�þ�Ӣ֮�顣", "", "Yjwcheck")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return exe("duihuan ebook")
    else
        return Gstart()
    end
end
function vipEbookck()
    check_halt(vipEbook)
end
function vipEbook()
    exe("duihuan ebook")
end
-- ---------------------------------------------------------------
-- �һ� ����
-- ---------------------------------------------------------------
function Yjwcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipYjwck")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ�����衣", "", "Ygcheck")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return check_halt(vipYjw)
    else
        return Gstart()
    end
end
function vipYjwck()
    check_halt(vipYjw)
end
function vipYjw()
    exe("duihuan yuji wan")
end
-- ---------------------------------------------------------------
-- �һ� ����, �Լ�������
-- ---------------------------------------------------------------
function Ygcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipYggo")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ��ԧ�������", "", "Gstart")
    create_trigger_t("vipchk3", "^(> )*�������һ��ԧ�����", "", "vipYgok")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    SetTriggerOption("vipchk3", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return check_halt(vipYg)
    else
        return Gstart()
    end
end
function vipYggo()
    return go(vipGhyg, "�����", "���")
end
function vipGhyg()
    exe("guihuan ying gu")
end
function vipYgok()
    return go(vipYg, "���ݳ�", "����")
end
function vipYg()
    exe("duihuan jinpa")
end
-- ---------------------------------------------------------------
-- �һ� �쾦���
-- ---------------------------------------------------------------
function Vipcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id vipcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipxidu")
    create_trigger_t("vipchk2", "^(> )*����쾦����Ѿ������ˡ�", "", "vipxidu_over")
    create_trigger_t("vipchk3", "^(> )*���������޷�ʹ��", "", "vipover")
    create_trigger_t("vipchk4", "^(> )*����Ҫ�������е���Ʒ�����ٴζһ���", "", "vipxidu")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    SetTriggerOption("vipchk3", "group", "vipchk")
    SetTriggerOption("vipchk4", "group", "vipchk")
    if vippoison == 1 and ptbxvip == 1 then
        return exe("duihuan bingchan")
    else
        return check_xue()
    end
end
function vipxidu()
    return check_busy(xidu)
end
function xidu()
    exe("xidu")
end
function vipxidu_over()
    EnableTriggerGroup("vipchk", false)
    DeleteTriggerGroup("vipchk")
    vippoison = 0
    return check_halt(vipdhd)
end
-- ---------------------------------------------------------------
-- �һ� �󻹵�
-- ---------------------------------------------------------------
function vipdhd()
    DeleteTriggerGroup("vipdhd")
    -- ain dls nv id vipcheck
    create_trigger_t("vipdhd1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipeatdhd")
    create_trigger_t("vipdhd2", "^(> )*��Ĵ󻹵��Ѿ������ˡ�", "", "vipdhd_over")
    create_trigger_t("vipdhd3", "^(> )*���������޷�ʹ��", "", "vipover")
    create_trigger_t("vipdhd4", "^(> )*����Ҫ�������е���Ʒ�����ٴζһ���", "", "vipeatdhd")
    create_trigger_t("vipdhd5", "^(> )*������㣬�ⶫ���ܳ���", "", "vipdhd_over")
    SetTriggerOption("vipdhd1", "group", "vipdhd")
    SetTriggerOption("vipdhd2", "group", "vipdhd")
    SetTriggerOption("vipdhd3", "group", "vipdhd")
    SetTriggerOption("vipdhd4", "group", "vipdhd")
    SetTriggerOption("vipdhd5", "group", "vipdhd")
    exe("duihuan dahuan dan")
end
function vipeatdhd()
    return check_busy(eatdhd)
end
function eatdhd()
    exe("eat dan")
end
function vipdhd_over()
    EnableTriggerGroup("vipdhd", false)
    DeleteTriggerGroup("vipdhd")
    return check_halt(checkPrepare)
end
function vipover()
    EnableTriggerGroup("vipchk", false)
    DeleteTriggerGroup("vipchk")
    EnableTriggerGroup("vipdhd", false)
    DeleteTriggerGroup("vipdhd")
    ptbxvip = 0
    inwdj = 0
    return check_xue()
end
