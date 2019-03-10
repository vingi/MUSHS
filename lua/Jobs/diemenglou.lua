-- ----------------------------------------------------------------------------------------------------
-- Ĭ�ϱ���ģ��
-- ----------------------------------------------------------------------------------------------------

userRank = 0
userLvl = 0
targetRank = 0
targetLvl = 0
dmlCheckCnt = 0
dmlsucceedCnt = 0
dmlPrestige = 0
dmlCompetitionCoin = 0
dmlFightCnt = 0
l_cnt = 0
askCnt = 0
targetName = ""
targetId = ""
target = {}
_target = {}
blackList = {}
pkList = {}
backupList = {}
_t1 = 0
_t2 = 0
pkCnt = 1
pkWaitCnt = 0

-- ----------------------------------------------------------------------------------------------------
-- ��������ģ��
-- ----------------------------------------------------------------------------------------------------

function dmlTriggers()
    DeleteTriggerGroup("dmlXueAsk")
    create_trigger_t("dmlXueAsk1", "^(> )*����ѦĽ�������йء����ˡ�����Ϣ��$", "", "dmlXueAccept")
    create_trigger_t("dmlXueAsk2", "^(> )*����û�������", "", "chedml_xue_fail")
    for i = 1, 2 do
        SetTriggerOption("dmlXueAsk" .. i, "group", "dmlXueAsk")
    end
    EnableTriggerGroup("dmlXueAsk", false)
    DeleteTriggerGroup("dmlXueAccept")
    create_trigger_t("dmlXueAccept1", "^(> )*ѦĽ�����ٺٺ١���Ц�˼�����$", "", "dmlXueTeach")
    create_trigger_t("dmlXueAccept2", "^(> )*һ����Ĺ����ȥ�ˣ�����������Ѿ�����Ȭ���ˡ�", "", "dmlXueHeal")
    create_trigger_t("dmlXueAccept3", "^(> )*Ѧ��ҽ�ó�һ�������������������˲�λ������Ѩ��", "", "dmlXueWait")
    create_trigger_t("dmlXueAccept4", "^(> )*ѦĽ���ƺ����������˼��$", "", "dmlXueHeal")
    create_trigger_t("dmlXueAccept5", "^(> )*ѦĽ����ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$", "", "dml_xue_fail")
    for i = 1, 5 do
        SetTriggerOption("dmlXueAccept" .. i, "group", "dmlXueAccept")
    end
    EnableTriggerGroup("dmlXueAccept", false)
    DeleteTriggerGroup("dmlXueTeach")
    create_trigger_t("dmlXueTeach1", "^(> )*Ѧ��ҽ����������Ѿ������ٽ����ˡ�$", "", "dmlXueNext")
    SetTriggerOption("dmlXueTeach1", "group", "dmlXueTeach")
    EnableTriggerGroup("dmlXueTeach", false)
    DeleteTriggerGroup("dmlXueBusy")
    create_trigger_t("dmlXueBusy1", "^(> )*����Ъ������˵���ɡ�$", "", "dmlXueBusy")
    SetTriggerOption("dmlXueBusy1", "group", "dmlXueBusy")
    EnableTriggerGroup("dmlXueBusy", false)
    DeleteTriggerGroup("dmldazuo")
    create_trigger_t(
        "dmldazuo1",
        "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
        "",
        "dmlNeiliCheck"
    )
    SetTriggerOption("dmldazuo1", "group", "dmldazuo")
    EnableTriggerGroup("dmldazuo", false)
    DeleteTriggerGroup("dmlask")
    create_trigger_t("dmlask1", "^(> )*����˵�������㻹�����������ɡ���", "", "dmlOver")
    create_trigger_t("dmlask2", "^(> )*����˵��������(��Ѫ|����)���㣬���ȫ��һս����", "", "dmlHpCheck")
    create_trigger_t("dmlask3", "^(> )*��������Ц���������ӣ��������־��㱡���", "", "dmlAskOk")
    create_trigger_t("dmlask4", "^(> )*��������֮�䣬�������Ѿ���һ��̨֮ͤ�У������Ѳ�֪����ȥ��", "", "dmlAskOk")
    for i = 1, 4 do
        SetTriggerOption("dmlask" .. i, "group", "dmlask")
    end
    EnableTriggerGroup("dmlask", false)
    DeleteTriggerGroup("dmltopcheck")
    create_trigger_t(
        "dmltopcheck3",
        "^>*\\s*\\d*:*\\s*\\S*\\s*(\\d*)\\s*(\\D*)\\((\\D*)\\)\\s*\\D*\\s*(\\d*)\\s*\\S*\\s*\\S*$",
        "",
        "dmlCheckToplistAct"
    )
    create_trigger_t(
        "dmltopcheck4",
        "^>*\\S*\\s*��ʣ\\s*\\d*\\s*��\\s*==\\s*\\(ENTER\\s*������һҳ��q\\s*�뿪��b\\s*ǰһҳ\\)\\s*\\d*:*\\s*\\S*\\s*(\\d*)\\s*(\\D*)\\((\\D*)\\)\\s*\\D*\\s*(\\d*)\\s*\\S*\\s*\\S*$",
        "",
        "dmlCheckToplistAct"
    )
    create_trigger_t("dmltopcheck5", "^>*\\d*:*  �����һ���������ս���ᣬ���ڻ���\\D*�Ρ�", "", "dmlInfo")
    create_trigger_t(
        "dmltopcheck6",
        "^>*\\S*\\s*��ʣ\\s*\\d*\\s*��\\s*==\\s*\\(ENTER\\s*������һҳ��q\\s*�뿪��b\\s*ǰһҳ\\)\\d*:*  �����һ���������ս���ᣬ���ڻ���\\D*�Ρ�",
        "",
        "dmlInfo"
    )
    for i = 1, 6 do
        SetTriggerOption("dmltopcheck" .. i, "group", "dmltopcheck")
    end
    EnableTriggerGroup("dmltopcheck", false)
    DeleteTriggerGroup("dmlnofight")
    create_trigger_t("dmlnofight1", "^(> )*���ﲻ׼ս����Ҳ��׼������", "", "dmlNoFightRoom")
    create_trigger_t("dmlnofight2", "^(> )*����Ъ������˵���ɡ�", "", "dmlAskAgain")
    for i = 1, 2 do
        SetTriggerOption("dmlnofight" .. i, "group", "dmlnofight")
    end
    DeleteTriggerGroup("dmlfight")
    create_trigger_t("dmlfight1", "^(> )*ͻȻ�䣬һ����Ӱ���������Ӱ֮�С��㶨��һ��������(\\D*) (\\D*)\\((\\D*)\\)��", "", "dmlFight")
    create_trigger_t("dmlfight2", "^(> )*����ս\\D*�ɹ������(\\D*)�㽭��������(\\D*)�������ҡ�", "", "dmlSucceed")
    create_trigger_t("dmlfight3", "^(> )*����һ������������㣬��������в��ָֻ���", "", "dmlCheck1")
    create_trigger_t("dmlfight4", "^(> )*�㻳���Լ�Ҳ�������û�е���һ�������ε�¥�ĵط���", "", "dmlOut")
    create_trigger_t("dmlfight5", "^(> )*������Ѿ���ս��\\D*�ˡ�", "", "dmlCheckNextTarget")
    create_trigger_t("dmlfight6", "^(> )*�㲻����ս�Լ���", "", "dmlCheckNextTarget")
    create_trigger_t("dmlfight7", "^(> )*û�з���һ��id��\\D*����ҡ���ע����������б�", "", "dmlTakePlace")
    create_trigger_t("dmlfight8", "^(> )*����ʱ���ѹ������޷���\\D*������ս��", "", "dmlOver")
    create_trigger_t("dmlfight9", "^(> )*ͻȻһ������������㣬��ľ�����Ȼȫ���ָ��ˣ�", "", "dmlFailed")
    create_trigger_t("dmlfight10", "^(> )*����������ʵ������̫�����޷���(\\D*)������ս��", "", "dmlCheckNextTarget")
    for i = 1, 10 do
        SetTriggerOption("dmlfight" .. i, "group", "dmlfight")
    end
    EnableTriggerGroup("dmlfight", false)
end
function dmlPkTriggers()
    DeleteTriggerGroup("dmlPk")
    create_triggerex_lvl("dmlPk1", "^(> )*�����Ҫ��(\\D*)\\((\\D*)\\)�����ಫ��", "", "dmlPkAct", 99)
    create_triggerex_lvl("dmlPk2", "^>*\\s*���ͣ����ͣ�", "", "dmlInPk", 99)
    create_triggerex_lvl("dmlPk3", "^>*����û������ˡ�", "", "dmlPkTargetNotFound", 99)
    create_trigger_t("dmlPk4", "^>*��������ս���������ꡣ$", "", "dmlChanceOut")
    create_triggerex_lvl("dmlPk5", "^>*������\\s*-\\s*", "", "dmlPkFail", 99)
    create_triggerex_lvl("dmlPk6", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "dmlPkSucceed", 99)
    create_triggerex_lvl("dmlPk7", "^(> )*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "dmlPkFaint", 99)
    for i = 1, 7 do
        SetTriggerOption("dmlPk" .. i, "group", "dmlPk")
    end
    DeleteTriggerGroup("dmldazuo")
    create_trigger_t(
        "dmldazuo1",
        "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
        "",
        "dmlPkNeiliCheck"
    )
    SetTriggerOption("dmldazuo1", "group", "dmldazuo")
    create_trigger_t("pkPfm1", '^(> )*��� "pfmpfm" �趨Ϊ "\\D*;perform\\s*(\\D*)\\s*" �ɹ���ɡ�', "", "pkPfmSet")
    SetTriggerOption("pkPfm1", "group", "pkPfm")
end
function dmlTriggersRemove()
    DeleteTriggerGroup("dmlXueAsk")
    DeleteTriggerGroup("dmlXueAccept")
    DeleteTriggerGroup("dmlXueTeach")
    DeleteTriggerGroup("dmlXueBusy")
    DeleteTriggerGroup("dmldazuo")
    DeleteTriggerGroup("dmldazuo2")
    DeleteTriggerGroup("dmlforce")
    DeleteTriggerGroup("dmlask")
    DeleteTriggerGroup("dmlfight")
    DeleteTriggerGroup("dmltopcheck")
    DeleteTriggerGroup("dmlnofight")
end
function dmlPkTriggersRemove()
    pkList = {}
    exe("nick none")
    DeleteTriggerGroup("dmlPk")
end

-- --------------------------------------------------------------------------------------------------
-- ׼��ģ��һ��״̬��ѯ
-- --------------------------------------------------------------------------------------------------

function dml_on()
    dmlFightCnt = 0
    l_cnt = 0
    dmlCheckCnt = 0
    dmlsucceedCnt = 0
    dmlPrestige = 0
    dmlCompetitionCoin = 0
    blackList = {}
    pkList = {}
    target = {}
    _target = {}
    backupList = {}
end
function dmlModeSet()
    local l_result
    l_result =
        utils.inputbox(
        "PK������δ���ţ�\n\nѡ��һ������ˢ��ģʽ              ���������� 1\n\nѡ���������ģʽ                  ���������� 2\n\nģʽ��������Զ���ģʽ            ���������� 3\n\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlMode ���������޸ġ�",
        "ѡ�����¥��սģʽ",
        GetVariable("dmlMode"),
        "����",
        "12"
    )
    SetVariable("dmlMode", l_result)
    return dml_check()
end
function dmlSettings()
    local l_result
    l_result =
        utils.inputbox(
        "��ʼ��սĿ��ĵȼ���������ĵȼ�����__��?\n\n�����·��հ״���д��Ҫ������\n\n����������ȼ���500������Ҫ��ս������550����Ŀ�꣬������д���� 50\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlIncreaseLvl �����޸ġ�",
        "��ʼ��ս��Χ�ȼ�����",
        GetVariable("dmlIncreaseLvl"),
        "����",
        "12"
    )
    SetVariable("dmlIncreaseLvl", l_result)
    l_result =
        utils.inputbox(
        "��ʼ��սĿ��ĵȼ���������ĵȼ���ȥ__��?\n\n�����·��հ״���д��Ҫ������\n\n����������ȼ���500������Ҫ��ս������480����Ŀ�꣬������д���� 20\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlDecreaseLvl �����޸ġ� ",
        "��ʼ��ս��Χ�ȼ�����",
        GetVariable("dmlDecreaseLvl"),
        "����",
        "12"
    )
    SetVariable("dmlDecreaseLvl", l_result)
    l_result =
        utils.inputbox(
        "�����б��ѯ�ȼ��������__��?\n\n�����·��հ״���д��Ҫ������\n\n�����ʼ�ȼ�������550������ѯ�����㹻��Ŀ���������600��������д���� 50\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlNewIncreaseLvl �����޸ġ�",
        "�����б���ս��Χ�ȼ�����",
        GetVariable("dmlNewIncreaseLvl"),
        "����",
        "12"
    )
    SetVariable("dmlNewIncreaseLvl", l_result)
    l_result =
        utils.inputbox(
        "�����б��ѯ�ȼ����޽���__��?\n\n�����·��հ״���д��Ҫ������\n\n�����ʼ�ȼ�������480������ѯ�����㹻��Ŀ���뽵����450��������д���� 30\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlNewDecreaseLvl �����޸ġ�",
        "�����б���ս��Χ�ȼ�����",
        GetVariable("dmlNewDecreaseLvl"),
        "����",
        "12"
    )
    SetVariable("dmlNewDecreaseLvl", l_result)
    l_result =
        utils.inputbox(
        "������ս����������������� ��\n\n������ս����������������� ��\n\n�������������������� both\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlFightOrder �����޸ġ�",
        "��ս����˳��ָ��",
        GetVariable("dmlFightOrder"),
        "����",
        "12"
    )
    SetVariable("dmlFightOrder", l_result)
    l_result =
        utils.inputbox(
        "��Ҫ�ظ���սͬһĿ�������� yes\n\n����Ҫ�ظ���ս������ no\n\nע������Сд��ĸ���롣\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlPerTargetTwice �����޸ġ�",
        "�Ƿ��ͬһĿ������ظ���ս",
        GetVariable("dmlPerTargetTwice"),
        "����",
        "12"
    )
    SetVariable("dmlPerTargetTwice", l_result)
    -- l_result = utils.inputbox ("�Ƿ���Ҫ�ڵ���¥��ս����Զ�PK��ս�ɹ�����ң�\n\n�������� yes����������no\n\nע������Сд��ĸ���롣\n\n���´���Ҫ����������Ϸ���ڰ���Ctrl + Shift + 7��ϼ����ҵ� dmlPkFlag �����޸ġ�\n\n�˹����ݲ����ţ�", "ѡ���Ƿ����Զ�PK", GetVariable("dmlPkFlag"), "����" , "12")
    SetVariable("dmlPkFlag", "notReady")
    return dml_check()
end
function dml_check()
    if not GetVariable("dmlMode") then
        return dmlModeSet()
    else
        if
            tonumber(GetVariable("dmlMode")) == 3 and
                (not GetVariable("dmlIncreaseLvl") or not GetVariable("dmlDecreaseLvl") or
                    not GetVariable("dmlNewIncreaseLvl") or
                    not GetVariable("dmlNewDecreaseLvl") or
                    not GetVariable("dmlFightOrder") or
                    not GetVariable("dmlPerTargetTwice") or
                    not GetVariable("dmlPkFlag"))
         then
            return dmlSettings()
        end
    end
    DeleteTimer("idle")
    dmlTriggers()
    EnableTrigger("dmlfight1", true)
    exe("hp")
    print("����¥ȫ�Զ���սģ��������.........")
    messageShow("����¥ȫ�Զ�ģ�飺���յ���¥��ս��.........", "yellow", "black")
    job.name = "diemenglou"
    quest.name = "����¥"
    quest.status = "״̬�����"
    quest.update()
    -- �����仰������¥������������ˣ���������ϱߵ�message֮�£�
    if hp.food < 70 or hp.water < 70 then
        return go(dmlEat, "�䵱ɽ", "��ͤ")
    else
        return dmlHpCheck()
    end
end
-- ---------------------------------------------------------------
-- ����Ƿ���Խ��е���¥����
-- ---------------------------------------------------------------
function dml_CheckAutoDML()
    local isTrue = false
    if GetRoleConfig("AutoDML") == true and hp.exp > 2000000 then
        if dmlFightCnt < 5 and (not condition.busy or condition.busy == 0) then
            -- �ж� DB��¼, �Լ��Ƿ����¥����ʱ��
            local dbrecordAmout = tonumber(dml_JobTimesToday())
            if dbrecordAmout < 5 and dml_IsOpen() == true then
                if dbrecordAmout > dmlFightCnt then
                    dmlFightCnt = dbrecordAmout
                end
                isTrue = true
            end
        end
    end
    return isTrue
end
-- ---------------------------------------------------------------
-- ����¥�Զ�����,��������, Ĭ������ˢ��ģʽ
-- ---------------------------------------------------------------
function dml_AutoStart()
    SetVariable("dmlMode", 1)
    dml_check()
end

-- ---------------------------------------------------------------
-- ����Ƿ��ڵ���¥�����ڼ�, ����8:05 �� ����9:55, �������,Ԥ��5����gap
-- ---------------------------------------------------------------
function dml_IsOpen()
    local currentTime = common.time()
    if currentTime > common.date() .. " 08:05:00" and currentTime < common.date() .. " 21:55:00" then
        return true
    else
        return false
    end
end
-- ---------------------------------------------------------------
-- ��ȡ�������ĵ���¥����Ĵ���
-- ---------------------------------------------------------------
function dml_JobTimesToday()
    local times = 0
    local todaystr = tostring(common.date()) .. " 06:00:00"
    local tsql =
        "SELECT count(*) FROM [ActivityRecord] where ActivityName = '����¥��ս' and RoleID = '" ..
        score.id .. "' and CreateTime > '" .. todaystr .. "'"
    local db = DBHelper:new()
    times = db:GetRowAmount(tsql)
    return times
end
-- ---------------------------------------------------------------
-- ���һ�ε���¥��ս, ����¼д�����ݿ�
-- ---------------------------------------------------------------
function dml_FinishDBRecord(notes)
    local tsql =
        "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" ..
        score.id .. "', '" .. score.name .. "', '����¥��ս', '" .. notes .. "')"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end

function dmlNoFightRoom()
    return go(dmlNeili, "���ݳ�", "�����°���")
end
function dmlEat()
    if locl.room == "��ͤ" then
        exe("sit chair;knock table;get tao;#3(eat tao);get cha;#3(drink cha);drop cha;drop tao;hp")
        return checkTop(dmlHpCheck)
    else
        return go(dmlEat, "�䵱ɽ", "��ͤ")
    end
end
function dmlHpCheck()
    exe("hp;cond")
    if vippoison == 1 then
        return go(dmlPoison, "���ݳ�", "����")
    else
        return dmlHpCheck2()
    end
end
function dmlPoison()
    if locl.room == "����" then
        exe("duihuan bingchan")
        return check_busy(dmlXidu)
    else
        return go(dmlPoison, "���ݳ�", "����")
    end
end
function dmlXidu()
    exe("xidu")
    return checkTop(dmlHpCheck2)
end
function dmlHpCheck2()
    if hp.jingxue_per < 100 or hp.qixue_per < 100 then
        return go(dmlHeal, "������", "����")
    else
        return dmlNeili()
    end
end
function dmlHeal()
    exe("nick ������������Ѧ��ҽ�۵�")
    tmp.xueSkills = {}
    tmp.xueCount = 1
    for p in pairs(skills) do
        if skills[p].lvl > 100 then
            table.insert(tmp.xueSkills, p)
        end
    end
    EnableTriggerGroup("dmlXueAsk", true)
    EnableTriggerGroup("dmlXueBusy", true)
    exe("ask xue muhua about ����")
end
function dmlXueBusy()
    return check_busy(dmlXueOk, 0.4)
end
function dmlXueOk()
    EnableTriggerGroup("dmlXueAccept", true)
    exe("ask xue muhua about ����")
end
function dmlXueAccept()
    EnableTriggerGroup("dmlXueAsk", false)
    EnableTriggerGroup("dmlXueAccept", true)
end
function dmlXueWait()
    EnableTrigger("dmlXueAccept1", false)
    EnableTrigger("dmlXueAccept3", false)
    EnableTrigger("dmlXueAccept4", false)
end
function dmlXueTeach()
    EnableTrigger("dmlXueAccept1", false)
    EnableTriggerGroup("dmlXueAccept", false)
    EnableTriggerGroup("dmlXueTeach", true)
    if tmpxueskill then
        for i = 1, 10 do
            exe("teach xue " .. tmpxueskill)
        end
    else
        for i = 1, 10 do
            exe("teach xue " .. tmp.xueSkills[tmp.xueCount])
        end
    end
    wait.make(
        function()
            wait.time(0.5)
            return check_busy(dmlXueOk)
        end
    )
end
function dmlXueNext()
    EnableTriggerGroup("dmlXueTeach", false)
    if tmpxueskill then
        tmpxueskill = nil
        tmp.xueCount = 0
    end
    tmp.xueCount = tmp.xueCount + 1
    if tmp.xueCount > table.getn(tmp.xueSkills) then
        return checkTop(dmlNeili)
    else
        return checkWait(dmlXueTeach, 0.2)
    end
end
function dmlXueHeal()
    EnableTriggerGroup("dmlXueAccept", false)
    DeleteTriggerGroup("dmlXueAsk")
    DeleteTriggerGroup("dmlXueAccept")
    DeleteTriggerGroup("dmlXueTeach")
    DeleteTriggerGroup("dmlXueBusy")
    exe("hp")
    return dmlNeili()
end
function dmlNeiliCheck()
    exe("yun qi;hp")
    return checkWait(dmlNeili, 0.2)
end
function dmlNeili()
    if locl.room == "�����°���" then
        exe("yun qi;yun jing;yun jingli")
        if hp.neili < hp.neili_max * 1.5 then
            return dmlDazuo()
        else
            exe("yun qi;nick ����¥��ѯĿ����")
            return checkWait(checkTop(dmlCheckToplist), 5)
        end
    else
        return go(dmlNeili, "���ݳ�", "�����°���")
    end
end
function dmlDazuo()
    EnableTriggerGroup("dmldazuo", true)
    exe("yun qi;dazuo " .. hp.dazuo)
end
function checkTop(func)
    disWait()
    DeleteTriggerGroup("checkTop")
    create_trigger_t("checkTop1", "^(> )*(�������Ѿ����|����׼����һ�ּ�����|�����ٲ���������ȭ�ż��ܵ�����֮һ)", "", "beiOk")
    create_trigger_t("checkTop2", "^(> )*������û�м����κ���Ч���⼼�ܡ�", "", "beiNone")
    SetTriggerOption("checkTop1", "group", "checkTop")
    SetTriggerOption("checkTop2", "group", "checkTop")
    EnableTriggerGroup("checkTop", true)
    EnableTrigger("hp12", true)
    beihook = func
    exe("bei bei bei")
    return beiTimer()
end
function beiTimer()
    return create_timer_s("bei", 0.5, "beiTimerSet")
end
function beiTimerSet()
    exe("bei bei bei")
end
function beiNone()
    for p, q in pairs(skillEnable) do
        if skills[p] and q ~= "force" then
            exe("jifa " .. q .. " " .. p)
            if math.random(1, 3) == 1 then
                break
            end
        end
    end
end
function beiOk()
    EnableTriggerGroup("checkTop", false)
    EnableTrigger("hp12", false)
    EnableTimer("bei", false)
    if beihook == nil then
        beihook = checkTopDone
    end
    return beihook()
end
function checkTopDone()
    ColourNote("fuchsia", "black", "topPk�б��ѯ��ϣ�")
end

-- -------------------------------------------------------------------------------------------------
-- ׼��ģ�������ѯĿ��
-- -------------------------------------------------------------------------------------------------

function sortFunc(a, b)
    if a.lvl ~= b.lvl then
        return a.lvl > b.lvl
    else
        if a.rank ~= b.rank then
            return a.rank < b.rank
        end
    end
end
function dmlCheckToplist()
    DeleteTimer("dmlWait")
    create_timer_s("dmlWait", 10, "dmlWait")
    EnableTriggerGroup("dmltopcheck", true)
    EnableTriggerGroup("dmlask", false)
    dmlCheckCnt = dmlCheckCnt + 1
    if tonumber(GetVariable("dmlMode")) ~= 3 then
        SetVariable("dmlDecreaseLvl", 20)
        SetVariable("dmlIncreaseLvl", 50)
        SetVariable("dmlNewDecreaseLvl", 20)
        SetVariable("dmlNewIncreaseLvl", 50)
        SetVariable("dmlPkFlag", "notReady")
    end
    target = {}
    _target = {}
    backupList = {}
    exe("top pk 999")
    checkTop(checkTop)
end
function dmlCheckToplistAct(n, l, w)
    targetRank = tonumber(w[1])
    targetName = tostring(w[2])
    targetId = string.lower(w[3])
    targetLvl = tonumber(w[4])
    table.insert(_target, {name = targetName, id = targetId, rank = targetRank, lvl = targetLvl})
    if string.find(score.id, targetId) then
        userRank = targetRank
        userLvl = targetLvl
        messageShow("��ҵ�ǰ����¥��������" .. userRank .. "λ|���ȼ���" .. userLvl .. "��", "gold")
    end
end
function dmlInfo()
    local fn = "logs\\diemenglou_lost_" .. score.id .. ".log"
    local f = io.open(fn, "r")
    if f then
        local s = f:read()
        local avoid
        avoid = utils.split(s, "|")
        for n = 1, table.getn(_target) do
            for k, v in pairs(avoid) do
                if _target[n] ~= nil and _target[n].name == avoid[k] then
                    if _target[avoid[k]] == nil then
                        _target[avoid[k]] = 1
                        ColourNote("white", "red", "�ϴ���սĿ�꡾" .. _target[n].name .. "��ʧ�ܡ�" .. _target[avoid[k]] .. "���Σ�")
                    else
                        _target[avoid[k]] = _target[avoid[k]] + 1
                        ColourNote("white", "red", "�ϴ���սĿ�꡾" .. _target[n].name .. "��ʧ�ܡ�" .. _target[avoid[k]] .. "���Σ�")
                    end
                    if _target[avoid[k]] > 1 then
                        ColourNote("white", "red", "�Ƴ�Ŀ�꡾" .. _target[n].name .. "��")
                        messageShow("����¥ȫ�Զ���սģ�飺����Ŀ�꡾" .. _target[n].name .. "����ս�ɹ��ʹ������Զ��رܸ�Ŀ�꣡")
                        table.remove(_target, n)
                    end
                end
            end
        end
        f:close()
    end
    if dmlCheckCnt == 1 then
        _t1 = userLvl - GetVariable("dmlDecreaseLvl")
        _t2 = userLvl + GetVariable("dmlIncreaseLvl")
    else
        _t1 = userLvl - (GetVariable("dmlDecreaseLvl") + GetVariable("dmlNewDecreaseLvl"))
        _t2 = userLvl + (GetVariable("dmlIncreaseLvl") + GetVariable("dmlNewIncreaseLvl"))
    end
    table.sort(_target, sortFunc)
    if tonumber(GetVariable("dmlMode")) == 1 then
        for i = 1, table.getn(_target) do
            if _target[i].lvl > _t1 and _target[i].id ~= score.id then
                DeleteTimer("dmlWait")
                table.insert(
                    target,
                    {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                )
                table.insert(
                    target,
                    {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                )
            end
        end
        ColourNote(
            "doggerblue",
            "black",
            "��սĿ�������ȼ�Ϊ",
            "yellow",
            "black",
            "��" .. _t1 .. "��",
            "doggerblue",
            "black",
            "��֮��"
        )
    elseif tonumber(GetVariable("dmlMode")) == 2 then
        for i = 1, table.getn(_target) do
            if _target[i].lvl > _t1 and _target[i].id ~= score.id then
                DeleteTimer("dmlWait")
                table.insert(
                    target,
                    {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                )
            end
        end
        ColourNote(
            "doggerblue",
            "black",
            "��սĿ�������ȼ�Ϊ",
            "yellow",
            "black",
            "��" .. _t1 .. "��",
            "doggerblue",
            "black",
            "��֮��"
        )
    elseif tonumber(GetVariable("dmlMode")) == 3 then
        if GetVariable("dmlPerTargetTwice") == "no" then
            if GetVariable("dmlFightOrder") == "��" then
                for i = 1, table.getn(_target) do
                    if _target[i].rank < userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer("dmlWait")
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                        if
                            _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                                _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl")
                         then
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                    end
                end
            elseif GetVariable("dmlFightOrder") == "��" then
                for i = 1, table.getn(_target) do
                    if _target[i].rank > userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer("dmlWait")
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                        if
                            _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                                _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl") and
                                _target[i].id ~= score.id
                         then
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                    end
                end
            elseif GetVariable("dmlFightOrder") == "both" then
                for i = 1, table.getn(_target) do
                    if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                        DeleteTimer("dmlWait")
                        table.insert(
                            target,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                    end
                    if
                        _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                            _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl") and
                            _target[i].id ~= score.id
                     then
                        table.insert(
                            backupList,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                    end
                end
            end
        elseif GetVariable("dmlPerTargetTwice") == "yes" then
            if GetVariable("dmlFightOrder") == "��" then
                for i = 1, table.getn(_target) do
                    if _target[i].rank < userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer("dmlWait")
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                        if
                            _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                                _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl") and
                                _target[i].id ~= score.id
                         then
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                    end
                end
            elseif GetVariable("dmlFightOrder") == "��" then
                for i = 1, table.getn(_target) do
                    if _target[i].rank > userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer("dmlWait")
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                            table.insert(
                                target,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                        if
                            _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                                _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl") and
                                _target[i].id ~= score.id
                         then
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                            table.insert(
                                backupList,
                                {
                                    name = _target[i].name,
                                    id = _target[i].id,
                                    rank = _target[i].rank,
                                    lvl = _target[i].lvl
                                }
                            )
                        end
                    end
                end
            elseif GetVariable("dmlFightOrder") == "both" then
                for i = 1, table.getn(_target) do
                    if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                        DeleteTimer("dmlWait")
                        table.insert(
                            target,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                        table.insert(
                            target,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                    end
                    if
                        _target[i].lvl > _t1 - GetVariable("dmlDecreaseLvl") and
                            _target[i].lvl < _t2 + GetVariable("dmlIncreaseLvl") and
                            _target[i].id ~= score.id
                     then
                        table.insert(
                            backupList,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                        table.insert(
                            backupList,
                            {name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl}
                        )
                    end
                end
            end
        end
        ColourNote(
            "doggerblue",
            "black",
            "��սĿ�������ȼ�Ϊ",
            "yellow",
            "black",
            "��" .. _t1 .. "��",
            "doggerblue",
            "black",
            "����",
            "yellow",
            "black",
            "��" .. _t2 .. "��",
            "doggerblue",
            "black",
            "��֮��"
        )
    end
    if table.getn(blackList) > 0 then
        for i = 1, table.getn(target) do
            for p, q in pairs(blackList) do
                if target[i] ~= nil then
                    if string.find(target[i].id, blackList[p]) then
                        table.remove(target, i)
                    end
                end
            end
        end
        for j = 1, table.getn(backupList) do
            for m, n in pairs(blackList) do
                if backupList[j] ~= nil then
                    if string.find(backupList[j].id, blackList[m]) then
                        table.remove(backupList, j)
                    end
                end
            end
        end
    end
    return dmlConsider()
end
function dmlConsider()
    if dmlCheckCnt < 3 then
        if table.getn(target) < 5 then
            if table.getn(backupList) < 5 then
                ColourNote("red", "black", "����սĿ���������㣬��������ٴβ�ѯ��")
                return checkWait(dmlCheckToplist, 5)
            else
                if tonumber(GetVariable("dmlMode")) == 1 or GetVariable("dmlPerTargetTwice") == "yes" then
                    ColourNote("lime", "black", "����ѯ����" .. (table.getn(backupList) / 2) .. "��λ����������Ŀ��")
                    messageShow(
                        "����¥ȫ�Զ�ģ�飺����ѯ����" .. (table.getn(backupList) / 2) .. "��λ����������Ŀ��.........",
                        "lime",
                        "black"
                    )
                    for i = table.getn(backupList), (table.getn(backupList) - 4), -1 do
                        ColourNote(
                            "lime",
                            "black",
                            "��սĿ������",
                            "white",
                            "black",
                            "��" .. backupList[i].name .. "��",
                            "lime",
                            "black",
                            " Ŀ��ID",
                            "white",
                            "black",
                            "��" .. backupList[i].id .. "��",
                            "lime",
                            "black",
                            " Ŀ������",
                            "white",
                            "black",
                            "��" .. backupList[i].rank .. "��",
                            "lime",
                            "black",
                            "λ Ŀ��ȼ�",
                            "white",
                            "black",
                            "��" .. backupList[i].lvl .. "��",
                            "lime",
                            "black",
                            "����"
                        )
                    end
                else
                    ColourNote("lime", "black", "����ѯ����" .. table.getn(backupList) .. "��λ����������Ŀ��")
                    messageShow("����¥ȫ�Զ�ģ�飺����ѯ����" .. table.getn(backupList) .. "��λ����������Ŀ��.........", "lime", "black")
                    for i = table.getn(backupList), (table.getn(backupList) - 4), -1 do
                        ColourNote(
                            "lime",
                            "black",
                            "��սĿ������",
                            "white",
                            "black",
                            "��" .. backupList[i].name .. "��",
                            "lime",
                            "black",
                            " Ŀ��ID",
                            "white",
                            "black",
                            "��" .. backupList[i].id .. "��",
                            "lime",
                            "black",
                            " Ŀ������",
                            "white",
                            "black",
                            "��" .. backupList[i].rank .. "��",
                            "lime",
                            "black",
                            "λ Ŀ��ȼ�",
                            "white",
                            "black",
                            "��" .. backupList[i].lvl .. "��",
                            "lime",
                            "black",
                            "����"
                        )
                    end
                end
                l_cnt = table.getn(backupList)
            end
        else
            if tonumber(GetVariable("dmlMode")) == 1 or GetVariable("dmlPerTargetTwice") == "yes" then
                ColourNote("lime", "black", "����ѯ����" .. (table.getn(target) / 2) .. "��λ����������Ŀ��")
                messageShow("����¥ȫ�Զ�ģ�飺����ѯ����" .. (table.getn(target) / 2) .. "��λ����������Ŀ��.........", "lime", "black")
                for i = table.getn(target), (table.getn(target) - 4), -1 do
                    ColourNote(
                        "lime",
                        "black",
                        "��սĿ������",
                        "white",
                        "black",
                        "��" .. target[i].name .. "��",
                        "lime",
                        "black",
                        " Ŀ��ID",
                        "white",
                        "black",
                        "��" .. target[i].id .. "��",
                        "lime",
                        "black",
                        " Ŀ������",
                        "white",
                        "black",
                        "��" .. target[i].rank .. "��",
                        "lime",
                        "black",
                        "λ Ŀ��ȼ�",
                        "white",
                        "black",
                        "��" .. target[i].lvl .. "��",
                        "lime",
                        "black",
                        "����"
                    )
                end
            else
                ColourNote("lime", "black", "����ѯ����" .. table.getn(target) .. "��λ����������Ŀ��")
                messageShow("����¥ȫ�Զ�ģ�飺����ѯ����" .. table.getn(target) .. "��λ����������Ŀ��.........", "lime", "black")
                for i = table.getn(target), (table.getn(target) - 4), -1 do
                    ColourNote(
                        "lime",
                        "black",
                        "��սĿ������",
                        "white",
                        "black",
                        "��" .. target[i].name .. "��",
                        "lime",
                        "black",
                        " Ŀ��ID",
                        "white",
                        "black",
                        "��" .. target[i].id .. "��",
                        "lime",
                        "black",
                        " Ŀ������",
                        "white",
                        "black",
                        "��" .. target[i].rank .. "��",
                        "lime",
                        "black",
                        "λ Ŀ��ȼ�",
                        "white",
                        "black",
                        "��" .. target[i].lvl .. "��",
                        "lime",
                        "black",
                        "����"
                    )
                end
            end
            l_cnt = table.getn(target)
        end
        return checkTop(dmlAsk)
    else
        messageShow("����¥ȫ�Զ�ģ�飺�ѵ����ѯ���ޣ�û�з���������Ŀ�꣬���ֶ������޸��������¿�ʼ.........", "white", "red")
        return dmlOver()
    end
end
function dmlWait()
    DeleteTimer("dmlWait")
    ColourNote("red", "black", "û�в�ѯ���κ�Ŀ�꣬��������ٴβ�ѯ��")
    checkWait(dmlCheckToplist, 5)
end

-- --------------------------------------------------------------------------------------------------
-- ����¥��ս��ʼ
-- --------------------------------------------------------------------------------------------------

function dmlSucceed(n, l, w)
    local l_prestige = 0
    local l_competitionCoin = 0
    local _cnt = l_cnt + 1
    local notes = ""
    if table.getn(target) >= 5 then
        notes = "��ս��" .. target[_cnt].name .. "�� ��" .. target[_cnt].id .. "���ɹ���"
        table.insert(pkList, {name = target[_cnt].name, id = target[_cnt].id})
    else
        notes = "��ս��" .. backupList[_cnt].name .. "�� ��" .. backupList[_cnt].id .. "���ɹ���"
        table.insert(pkList, {name = backupList[_cnt].name, id = backupList[_cnt].id})
    end
    messageShow(notes, "lime", "black")
    l_prestige = tonumber(trans(w[2]))
    l_competitionCoin = tonumber(trans(w[3]))
    dmlsucceedCnt = dmlsucceedCnt + 1
    dmlPrestige = dmlPrestige + l_prestige
    dmlCompetitionCoin = dmlCompetitionCoin + l_competitionCoin
    -- insert DB
    dml_FinishDBRecord(notes)
end
function dmlFailed()
    CloseLog()
    local _cnt = l_cnt + 1
    local fn = "logs\\diemenglou_lost_" .. score.id .. ".log"
    local f = io.open(fn, "a")
    local s = ""
    local notes = ""
    if table.getn(target) >= 5 then
        s = target[_cnt].name .. "|"
        notes = "��ս��" .. target[_cnt].name .. "�� ��" .. target[_cnt].id .. "��ʧ�ܣ�"
    else
        s = backupList[_cnt].name .. "|"
        notes = "��ս��" .. backupList[_cnt].name .. "�� ��" .. backupList[_cnt].id .. "��ʧ�ܣ�"
    end
    messageShow(notes, "fuchsia", "black")
    f:write(s)
    f:close()
    -- insert DB
    dml_FinishDBRecord(notes)
end
function dmlCheckNextTarget()
    if table.getn(target) >= 5 then
        table.insert(blackList, target[l_cnt].id)
    else
        table.insert(blackList, backupList[l_cnt].id)
    end
    l_cnt = l_cnt - 1
    return dmlAsk()
end
function dmlAskOk()
    EnableTriggerGroup("dmlask", false)
end
function dmlAskAgain()
    return checkTop(dmlAsk)
end
function dmlAsk()
    EnableTriggerGroup("dmltargetcheck", false)
    EnableTrigger("fight2", false)
    EnableTrigger("fight16", false)
    EnableTriggerGroup("dmlask", false)
    exe("ask laopu about �ξ�")
    checkTop(dmlAsk1)
end
function dmlAsk1()
    EnableTriggerGroup("dmlask", true)
    exe("ask laopu about ��¥")
    checkTop(dmlAsk2)
end
function dmlAsk2()
    exe("ask laopu about ��¥")
    checkTop(dmlDream)
end
function dmlDream()
    EnableTriggerGroup("dmlfight", true)
    if dmlFightCnt < 5 then
        if l_cnt > 0 then
            if table.getn(target) >= 5 then
                messageShow(
                    "����¥ȫ�Զ�ģ�飺���ڿ�ʼ��ս��" .. target[l_cnt].name .. "�� ��" .. target[l_cnt].id .. "��.........",
                    "yellow"
                )
                quest.status = "��ս " .. target[l_cnt].id
                quest.update()
                return exe("dream " .. target[l_cnt].id)
            else
                messageShow(
                    "����¥ȫ�Զ�ģ�飺���ڿ�ʼ��ս��" .. backupList[l_cnt].name .. "�� ��" .. backupList[l_cnt].id .. "��.........",
                    "yellow"
                )
                quest.status = "��ս " .. backupList[l_cnt].name
                quest.update()
                return exe("dream " .. backupList[l_cnt].id)
            end
        else
            ColourNote("red", "black", "�б�ʣ��Ŀ�겻�㣬��������ٴβ�ѯ��")
            return checkWait(dmlCheckToplist, 5)
        end
    else
        return dmlOver()
    end
end
function dmlTakePlace()
    return checkWait(dmlTopTake, 5)
end
function dmlTopTake()
    if table.getn(target) >= 5 then
        if target[l_cnt].rank < userRank then
            exe("top take " .. target[l_cnt].rank)
            userRank = target[l_cnt].rank
            print("Ŀ�꡾" .. target[l_cnt].name .. "�����ߣ�ȡ���Է�������" .. target[l_cnt].rank .. "��λ")
            messageShow(
                "����¥ȫ�Զ�ģ�飺��սĿ�꡾" .. target[l_cnt].name .. "�����ߣ�ȡ���Է���������" .. target[l_cnt].rank .. "��λ.........",
                "lime"
            )
            table.insert(blackList, target[l_cnt].id)
        end
    else
        if backupList[l_cnt].rank < userRank then
            exe("top take " .. backupList[l_cnt].rank)
            quest.status = "��ѯ��"
            quest.update()
            userRank = backupList[l_cnt].rank
            print("Ŀ�꡾" .. blackList[l_cnt].name .. "�����ߣ�ȡ���Է�������" .. blackList[l_cnt].rank .. "��λ")
            messageShow(
                "����¥ȫ�Զ�ģ�飺��սĿ�꡾" .. blackList[l_cnt].name .. "�����ߣ�ȡ���Է���������" .. blackList[l_cnt].rank .. "��λ.........",
                "lime"
            )
            table.insert(blackList, backupList[l_cnt].id)
        end
    end
    l_cnt = l_cnt - 1
    if l_cnt > 0 then
        messageShow("����¥ȫ�Զ�ģ�飺��սĿ�꡾" .. target[(l_cnt + 1)].name .. "�����ߣ�������ս��һĿ��.........", "lime")
        return checkTop(dmlAsk)
    else
        ColourNote("red", "black", "��������ٴβ�ѯ��")
        return checkWait(dmlCheckToplist, 5)
    end
end
function dmlFight(n, l, w)
    dmlFightCnt = dmlFightCnt + 1
    local fn = GetInfo(67) .. "logs\\" .. score.id .. "����¥������¼" .. dmlFightCnt .. ".log"
    OpenLog(fn, false)
    ColourNote("Lime", "black", "��ʼд�����¥������¼��" .. fn .. "��д�뷽ʽΪ������д��")
    l_cnt = l_cnt - 1
    job.name = "diemenglou"
    npc_name = ""
    npc_id = ""
    delete_all_timers()
    npc_name = w[3]
    npc_id = string.lower(w[4])
    exe("set wimpycmd pfmpfm\\hp")
    exe("pfmwu")
    exe("set wimpy 100;yield no")
    exe("look " .. npc_id)
    exe("nick ����¥ս����")
    exe("say ��ô����һ�����������ս���ɣ�")
    kezhiwugong()
    kezhiwugongAddTarget(npc_name, npc_id)
end
function dmlCheck1()
    CloseLog()
    exe("hp")
    return checkTop(dmlCheck2)
end
function dmlCheck2()
    if hp.qixue_per < 95 and hp.qixue_per >= 70 and cty_cur > 0 then
        exe("fu chantui yao;hp")
        return checkTop(dmlCheck1)
    elseif (hp.qixue_per < 100 and hp.qixue_per > 95) or cty_cur == 0 then
        exe("yun heal")
        return checkTop(dmlCheck1)
    elseif hp.qixue_per < 70 then
        return exe("wait " .. score.id)
    else
        if l_cnt > 0 then
            return checkTop(dmlAsk)
        else
            ColourNote("red", "black", "��������ٴβ�ѯ��")
            return checkWait(dmlCheckToplist, 5)
        end
    end
end
function dmlOut()
    if dmlFightCnt < 5 then
        if l_cnt > 0 then
            ColourNote("violet", "black", "������¥��ս��")
            return checkTop(dmlAsk)
        else
            ColourNote("red", "black", "��������ٴβ�ѯ��")
            return checkWait(dmlCheckToplist, 5)
        end
    else
        return dmlOver()
    end
end
function dmlOver()
    if dmlFightCnt == 5 then
        local fn = "logs\\diemenglou_mark_" .. score.id .. ".log"
        local f = io.open(fn, "w")
        local s = os.date("%Y%m%d%H")
        if tonumber(os.date("%H")) >= 22 then
            s = os.date("%Y%m%d") .. "09"
        end
        if tonumber(os.date("%H")) < 8 then
            s = tonumber(os.date("%Y%m%d") .. "09") - 100
        end
        f:write(s)
        f:close()
        dmlTriggersRemove()
        EnableTrigger("fight2", true)
        EnableTrigger("fight16", true)
        print("���յ���¥����ս����Ϊ�㣬ģ���˳�")
        messageShow(
            "����¥ȫ�Զ�ģ�飺��ս�ɹ���" ..
                dmlsucceedCnt .. "���Σ���á�" .. dmlPrestige .. "������������" .. dmlCompetitionCoin .. "���㾺����.........",
            "gold"
        )
        messageShow("����¥ȫ�Զ�ģ�飺���յ���¥����ս����Ϊ�㣬ģ���˳�.........", "lime")
        exe("nick none")
        if GetVariable("dmlPkFlag") == "yes" and table.getn(pkList) > 0 then
            exe("unset pk_give_up")
            return dmlPkFunc()
        else
            return checkTop(check_food)
        end
    else
        askCnt = askCnt + 1
        if askCnt > 1 then
            askCnt = 0
            dmlFightCnt = 5
            return dmlOver()
        end
    end
end

-- --------------------------------------------------------------------------------------------------
-- �Զ�PKģ��
-- --------------------------------------------------------------------------------------------------

function dmlPkFunc()
    exe(GetVariable("pfmwu"))
    exe("unset wimpycmd;jiali 0")
    exe("hp")
    pkCnt = 1
    pkWaitCnt = 0
    return (dmlPkStart)
end
function dmlPkStart()
    if locl.room == "������" then
        dmlPkTriggers()
        exe("yun qi;yun jing;yun jingli")
        if hp.neili >= hp.neili_max * 1.5 then
            return dmlPkWait()
        else
            return dmlPkNeili()
        end
    else
        return go(dmlPkStart, "��ɽ", "������")
    end
end
function dmlPkNeiliCheck()
    exe("hp")
    checkWait(dmlPkNeili, 0.2)
end
function dmlPkNeili()
    if hp.neili < hp.neili_max * 1.5 then
        return dmlPkDazuo()
    else
        exe("yun qi;nick ��ɽ�����ö�����")
        return dmlPkWait()
    end
end
function dmlPkWait()
    if pkCnt <= table.getn(pkList) then
        create_timer_s("dmlPkWait", 1, "dmlPkWaitAct")
    else
        messageShow("����¥ȫ�Զ�ģ�飺PKģ�����.........", "yellow", "black")
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function dmlPkTargetNotFound()
    pkWaitCnt = pkWaitCnt + 1
    if pkWaitCnt > 180 then
        pkWaitCnt = 0
        messageShow("����¥ȫ�Զ�ģ�飺����������δ�ȵ���ҡ�" .. pkList[pkCnt].name .. "����������һĿ�ꡣ.........", "yellow")
        pkCnt = pkCnt + 1
    end
end
function dmlPkAct(n, l, w)
    pkWaitCnt = 0
    DeleteTimer("dmlPkWait")
    npc_name = w[2]
    npc_id = string.lower(w[3])
    exe("set wimpycmd pkHeqiCheck\\hp")
    exe("set wimpy 100;yield no")
    kezhiwugong()
    kezhiwugongAddTarget(npc_name, npc_id)
    create_timer_s("dmlPkCheck", 1, "dmlPkCheck")
end
function dmlPkCheck()
    exe("kill " .. npc_id)
end
function dmlPkWaitAct()
    if pkList.id[pkCnt] ~= nil then
        exe("kill " .. pkList[pkCnt].id)
    else
        messageShow("����¥ȫ�Զ�ģ�飺PKģ�����.........", "yellow")
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function pkHeqiCheck()
    DeleteTriggerGroup("hpheqi")
    create_trigger_t("hpheqi1", "^�������ȡ�\\s*\\-?\\s*(\\d*)", "", "hpHeqiCheck")
    SetTriggerOption("hpheqi1", "group", "hpheqi")
end
function hpHeqiCheck(n, l, w)
    local heqi = 0
    heqi = tonumber(w[1])
    if hp.qixue_per < 35 and dhd_cur > 0 then
        exe("fu dahuan dan")
    end
    if hp.qixue_per < 70 and cty_cur > 0 then
        exe("fu chantui yao")
    end
    if (hp.qixue / (hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe("fu chantui yao")
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe("yun qi")
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe("yun jing")
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- ����С��40%������ྴ����裡
        exe("eat " .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- ����С��30%����ྻ��ε���
        exe("eat " .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- ����С��10%�����Ϣ�裡
        exe("eat " .. drug.neili1)
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe("yun jingli")
    end
    if hp.qixue_per < 80 then
        exe("eat " .. drug.heal)
    end
    if perform.force and perform.force == "dulong-dafa" and (not flag.wudi or flag.wudi == 0) then
        exe("yun wudi")
    end
    if perform.force and perform.force == "dulong-dafa" and hp.qixue_per < 70 then
        exe("yun wudi")
    end
    if heqi >= 840 then
        create_alias("l_pkPfm", "l_pkPfm", "alias pfmpfm " .. GetVariable("pfmsanqing"))
        exe("l_pkPfm")
        exe("set wimpycmd pfmpfm\\hp")
    end
end
function pkPfmSet(n, l, w)
    local subPfm = string.lower(w[2])
    create_alias("pkPfm", "pkPfm", "alias pfmpfm perform " .. subPfm .. ";perform " .. subPfm)
    exe("pkPfm")
end
function dmlInPk()
    DeleteTimer("dmlPkCheck")
    pkCnt = pkCnt + 1
end
function dmlChanceOut()
    DeleteTriggerGroup("dmlPk")
    DeleteTimer("dmlPkCheck")
    kezhiwugongclose()
    messageShow("����¥ȫ�Զ�ģ�飺PKģ�����.........", "yellow")
    return check_food()
end
function dmlPkFaint()
    exe("kill " .. npc_id)
    return dmlPkSucceed()
end
function dmlPkSucceed()
    messageShow("����¥ȫ�Զ�ģ�飺PK��ҡ�" .. npc_name .. "���ɹ�.........", "lime")
    if pkCnt - 1 < table.getn(pkList.id) then
        return dmlPkStart()
    else
        messageShow("����¥ȫ�Զ�ģ�飺PKģ�����.........", "yellow")
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function dmlPkFail()
    exe("hp")
    locl.room = "������"
    DeleteTimer("dmlPkWait")
    DeleteTimer("dmlPkCheck")
    messageShow("����¥ȫ�Զ�ģ�飺PK��ҡ�" .. npc_name .. "��ʧ��.........", "red")
    if pkCnt - 1 < table.getn(pkList.id) then
        return dmlPkStart()
    else
        messageShow("����¥ȫ�Զ�ģ�飺PKģ�����.........", "yellow")
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
