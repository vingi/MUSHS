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
    Vip.LastAsk = "ask laoban about ��Ա����";
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
        "SELECT count(*) FROM [ActivityRecord] where ActivityName = '��Ա������ȡ' and RoleID = '" .. score.id .. "' and CreateTime > '" .. reboottime .. "'"
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
    if GetRoleConfig("AutoVipBenefit") and score.vip ~= "��ͨ��Ա" then
        local times = Vip.GetDBRecord()
        if tonumber(times) == 0 then
            -- ������ȡ����
            isTrue = true
        end
    end
    return isTrue
end
