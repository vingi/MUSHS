-----
-- huashan.lua
--
-- ----------------------------------------------------------
-- ��ɽ�Ͷ���������
-- ----------------------------------------------------------
--
--[[

eg.


--]]
huashanJob = {
    jobStep = 0,
    Progress = 0,
    killStartTime = "",
    KezhiObserver = "",
    -- �����ٴ�ʬ���ϻ�ȡһ������(��¼)
    GetLingPaiAgain = 0

    -- Progress = 1  ��ɽ1 ��NPC
    -- Progress = 2  ��ɽ2 ��NPC
    -- Progress = 5  ��ɽ������ɺ������
    -- Progress = 6  ��ɽ��������ɺ��, ������Ⱥ�ظ�
}

huashanJob.jobStep = 0

local huashanArea1 = {
    ["�˵�"] = "��ɽ��",
    ["�ӻ���"] = "��ɽ��",
    ["��"] = "��ɽ��",
    ["����"] = "��ɽ��",
    ["������"] = "��ɽ��",
    ["�����"] = "��ɽ��",
    ["��ʯ·"] = "��ɽ��",
    ["��̳��"] = "��ɽ��",
    ["������"] = "��ɽ",
    ["����"] = "��ɽ",
    ["�ٲ�"] = "��ɽ",
    ["������"] = "��ɽ",
    ["������"] = "��ɽ",
    ["�����"] = "��ɽ",
    ["ɯ��ƺ"] = "��ɽ",
    ["ǧ�ߴ�"] = "��ɽ",
    ["�ٳ�Ͽ"] = "��ɽ",
    ["���ƺ"] = "��ɽ",
    ["������"] = "��ɽ",
    ["������"] = "��ɽ",
    ["��Ů��"] = "��ɽ",
    ["��ȪԺ"] = "��ɽ",
    ["˼����"] = "��ɽ",
    ["ҩ��"] = "��ɽ",
    ["����"] = "��ɽ",
    ["ɽ��"] = "��ɽ",
    ["СϪ"] = "��ɽ",
    ["��̳"] = "��ɽ",
    ["˼���¶���"] = "��ɽ",
    ["ɽ·"] = "��ɽ",
    ["ʯ��"] = "��ɽ",
    ["����"] = "��ɽ",
    ["��ɽ����"] = "��ɽ",
    ["ɽ���ٲ�"] = "��ɽ",
    ["���䳡"] = "��ɽ",
    ["����"] = "��ɽ",
    ["�鷿"] = "��ɽ",
    ["����"] = "��ɽ",
    ["����"] = "��ɽ",
    ["ǰ��"] = "��ɽ",
    ["̨��"] = "��ɽ",
    ["������"] = "��ɽ",
    ["����"] = "��ɽ",
    ["��Ϣ��"] = "��ɽ",
    ["�Ͼ���"] = "��ɽ",
    ["Сɽ·"] = "��ɽ"
}

job.list["huashan"] = "��ɽ�Ͷ�����"

function huashan()
    huashanJob.jobStep = 0
    huashanJob.Progress = 0
    huashanJob.GetLingPaiAgain = 0
    dis_all()
    huashan_trigger()
    delete_all_timers()
    idle()
    job.name = "huashan"
    job.target = "����Ŀ��"
    huashanJob.KezhiObserver = ""
    return huashan_start()
end

jobFindAgain = jobFindAgain or {}
jobFindAgain["huashan"] = "huashanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["huashan"] = "huashanFindFail"

-- ----------------------------------------------------------
-- ��ȡ��ɽ����׶ε�������/����
-- ----------------------------------------------------------
function Get_huashanjob_step()
    local word_huashanjob_step = "��"
    if huashanJob.jobStep == 1 then
        word_huashanjob_step = "��"
    end
    return word_huashanjob_step
end

function huashanFindAgain()
    return go(find, dest.area, dest.room)
end

function huashanFindFail()
    -- �Ƴ�ս��������
    RemoveObserver("huashanJobKillOb")
    return go(huashan_shibai, "��ɽ", "������")
end

function huashan_start()
    DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashan_find")
    flag.idle = nil
    return go(hsaskjob, "��ɽ", "������")
end

function hsaskjob()
    if GetRoleConfig("CheckNeili_InAdvance") == true then
        return zhunbeineili(job_huashan)
    else
        return job_huashan()
    end
end

function job_huashan()
    EnableTriggerGroup("huashan_ask", true)
    -- ����Ҫ���񷢴���ʱ��
    NewObserver("huashanAskJobOb", "ask yue buqun about job")
end

function huashan_trigger()
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    create_trigger_t("huashan_ask1", "^(> )*��������Ⱥ�����йء�job������Ϣ��$", "", "huashan_ask")
    create_trigger_t("huashan_ask2", "^(> )*����û������ˡ�$", "", "huashan_nobody")
    SetTriggerOption("huashan_ask1", "group", "huashan_ask")
    SetTriggerOption("huashan_ask2", "group", "huashan_ask")
    EnableTriggerGroup("huashan_ask", false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t("huashan_accept1", "^(> )*����Ⱥ˵�������㲻�ܹ�˵ѽ������������ɼ����ҿ�����", "", "huashan_shibai")
    create_trigger_t("huashan_accept2", "^(> )*����Ⱥ˵��������������æ�������������أ�", "", "huashan_busy")
    create_trigger_t("huashan_accept3", "^(> )*����Ⱥ˵����������û����˵�ж���Ϊ������", "", "huashan_fangqi")
    create_trigger_t("huashan_accept4", "^(> )*����Ⱥ������һ�����ơ�$", "", "huashan_npc")
    create_trigger_t("huashan_accept5", "^(> )*����Ⱥ����˵�����㻹����ȥ˼�������˼��ȥ�ɡ�", "", "huashanjjQuest")
    create_trigger_t("huashan_accept6", "^(> )*����Ⱥ˵����������û����˵�ж���Ϊ�����գ����Լ�ȥ��ϰ�书ȥ�ɣ���", "", "huashan_fangqi")
    SetTriggerOption("huashan_accept1", "group", "huashan_accept")
    SetTriggerOption("huashan_accept2", "group", "huashan_accept")
    SetTriggerOption("huashan_accept3", "group", "huashan_accept")
    SetTriggerOption("huashan_accept4", "group", "huashan_accept")
    SetTriggerOption("huashan_accept5", "group", "huashan_accept")
    SetTriggerOption("huashan_accept6", "group", "huashan_accept")
    EnableTriggerGroup("huashan_accept", false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t("huashan_npc1", "^(> )*(�䲻��|ͻȻ|�͵�|��Ȼ|�䲻��)������\\D*������ƣ���(\\D*)(��|����)\\D*��ȥ��$", "", "huashan_where")
    create_trigger_t(
        "huashan_npc2",
        "^(> )*��һ��ץ����������ͼ�������ƣ��������������ݵö��˹�ȥ����˳�ֳ��������˵����֣�����ԭ�����������𽭺���(\\D*)��",
        "",
        "huashan_find"
    )
    create_trigger_t("huashan_npc3", '^(> )*��� "hsjob" �趨Ϊ "�й���" �ɹ���ɡ�', "", "huashan_npc_goon")
    SetTriggerOption("huashan_npc1", "group", "huashan_npc")
    SetTriggerOption("huashan_npc2", "group", "huashan_npc")
    SetTriggerOption("huashan_npc3", "group", "huashan_npc")
    EnableTriggerGroup("huashan_npc", false)
    DeleteTriggerGroup("huashanQuest")
    create_trigger_t("huashanQuest1", "^(> )*����Ⱥ˵������" .. score.name .. "��ɱ�˲��ٶ��ˣ�δ��ɱ�����ز�����˼���������ڰ�", "", "huashanDgjj")
    SetTriggerOption("huashanQuest1", "group", "huashanQuest")
    EnableTriggerGroup("huashanQuest", false)
end

function huashan_triggerDel()
    DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    DeleteTriggerGroup("huashan_accept")
    DeleteTriggerGroup("huashan_npc")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashanQuest")
end

function huashan_ask()
    EnableTriggerGroup("huashan_ask", false)
    EnableTriggerGroup("huashan_accept", true)
    -- �ر�Ҫ�����ʱ��
    RemoveObserver("huashanAskJobOb")
end

function huashan_nobody()
    EnableTriggerGroup("huashan_ask", false)
    return huashan_start()
end

function huashan_shibai()
    -- �Ƴ�ս��������
    RemoveObserver("huashanJobKillOb")
    EnableTriggerGroup("huashan_accept", false)
    kezhiwugongclose()
    return check_busy(huashan_shibai_b)
end

function huashan_shibai_b()
    flag.idle = nil
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    huashan_triggerDel()
    Execute("drop corpse;ask yue buqun about ʧ��")
    if job.where ~= nil and string.find(job.where, "���͵�") then
        mjlujingLog("���͵�")
    end
    messageShow("��ɽ��������ʧ�ܡ�", "deepskyblue")
    MissionPunishment.AlreadyGiveUp = true
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Failure = job.statistics.Failure + 1
    job.statistics.Category["��ɽ"].Times = job.statistics.Category["��ɽ"].Times + 1
    job.statistics.Category["��ɽ"].Failure = job.statistics.Category["��ɽ"].Failure + 1
    job.statistics_Update()
    return check_halt(check_food)
end

function huashan_fangqi()
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    huashan_triggerDel()
    job.last = "huashan"
    huashanJob.jobStep = 0
    return check_halt(check_food)
end

function huashan_busy()
    EnableTriggerGroup("huashan_accept", false)
    return check_bei(huashan_busy_dazuo)
end

function huashan_busy_dazuo()
    exe("#3s")
    return prepare_lianxi(check_heal)
end

function huashan_npc()
    exe("nick ��ɽ������")
    MissionPunishment.AlreadyGiveUp = false
    EnableTriggerGroup("huashan_accept", false)
    job.last = "huashan"
    if huashanJob.jobStep < 1 then
        job.time.b = os.time()
        huashanJob.Progress = 1
        messageShow("��ɽ����٣���ʼ����")
        quest.name = "��ɽ�����"
        quest.desc = ""
        quest.note = ""
        quest.update()
        return check_bei(huashan_npc_go)
    else
        huashanJob.Progress = 2
        messageShow("��ɽ����ڣ���ʼ����")
        quest.name = "��ɽ�����"
        quest.desc = ""
        quest.note = ""
        quest.update()
        return check_bei(huashan_npc_go2)
    end
end

function huashan_npc_go()
    go_direct(huashan_npc_get, "��ɽ", "������", "��ɽ", "ɽ����", "huashan/zhengqi")
end

function huashan_npc_go2()
    go_direct(huashan_npc_get, "��ɽ", "��̳", "��ɽ", "ɽ����", "huashan/jitan")
end

function huashan_npc_get()
    EnableTriggerGroup("huashan_npc", true)
    -- exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    exe("s")
    return huashan_npc_goon()
end

function huashan_npc_goon()
    RemoveObserver("huashanhangout")
    quest.status = "�й���"
    quest.update()
    exe("n;e;e;")
    -- locate()
    fastLocate()
    return check_busy(huashan_ssl, 1)
end

function huashan_ssl()
    if locl.room == "ʯ��" or locl.room == "��ȪԺ" then
        return huashan_npc_ssl()
    else
        return huashan_npc_goon()
    end
end
-- ---------------------------------------------------------------
-- δ����������������, ��ʼ�й�
-- ---------------------------------------------------------------
function huashan_npc_ssl()
    NewObserverByFunc("huashanhangout", "huashan_hangout", 5)
end

function huashan_hangout()
    exe("w;s;s;alias hsjob �й���")
end

function huashan_where(n, l, w)
    job.where = tostring(w[3])
    quest.location = job.where
    quest.update()
    -- print("1"..job.where)
    if
        string.find(job.where, "��������") or string.find(job.where, "�����鷿") or string.find(job.where, "��������") or
            string.find(job.where, "������Ժ")
     then
        job.where = "������������"
    end
end

function huashan_find(n, l, w)
    local flag_huashan = 0
    dis_all()
    job.target = tostring(w[2])
    job.killer = {}
    job.killer[job.target] = true
    locl.area = "��ɽ"
    locl.room = "����"
    quest.target = job.target
    quest.update()
    DeleteTriggerGroup("huashan_find")
    create_trigger_t("huashan_find1", "^( )*" .. job.target .. "\\((\\D*)\\)", "", "huashan_fight")
    -----------��ʱ��ɱ��
    create_trigger_t("huashan_find2", "^(> )*������(\\D*)��ɱ���㣡", "", "huashan_debug_fight")
    create_trigger_t("huashan_find3", "^(> )*�ɻ�����������㿴����֪����Щʲô���⡣", "", "huashan_dadao")
    SetTriggerOption("huashan_find1", "group", "huashan_find")
    SetTriggerOption("huashan_find2", "group", "huashan_find")
    SetTriggerOption("huashan_find3", "group", "huashan_find")
    if string.find(job.where, "ϴ���") or string.find(job.where, "���º�ȭ��") then
        messageShow("��ɽ����ڣ�����ص㡾" .. job.where .. "�����ɵ�����������")
        return check_halt(huashanFindFail)
    end
    -- print("2"..job.where)
    if huashanArea1[job.where] then
        job.room = job.where
        job.area = huashanArea1[job.where]
    else
        job.room, job.area = getAddr(job.where)
    end
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        messageShow("��ɽ��������ص㡾" .. job.where .. "�����ɵ�����������", "Plum")
        return check_halt(huashanFindFail)
    end
    print(dest.room, dest.area, job.room, job.area)
    messageShow("��ɽ����" .. Get_huashanjob_step() .. "��׷ɱ���ܵ���" .. job.where .. "���ġ�" .. job.target .. "����")
    -- �Ż���ɽ����·��(���ڵ�ǰ���������Թ�)
    -- �����Ŀ�������ֿ��� 1. Ŀ���ڵ�ǰ�Թ���  2. Ŀ���ڵ�ǰ�Թ�֮��
    if dest.room == "����" or dest.room == "������" or dest.room == "�յ�" then
        return go(huashanFindAct, job.area, job.room, "huashan/shulin")
    else
        -- ��Ϊ��������
        go_direct_pre("��ɽ", "����", "huashan/shulin")
        go_setting(huashanFindAct, job.area, job.room, "huashan/shulin")
        -- ��rooms.lua�й���"��ɽ-����/������" ���쳣, ������·���еĵ�һ��(����#10 west), ֱ�Ӵ�������(west ��'����'����'������'),Ȼ�������call #hsssl
        return path_consider(1)
    end
end

function huashan_debug_fight()
    -- dis_all()
    EnableTrigger("huashan_find1", true)
    exe("look")
end

function huashanFindAct()
    EnableTriggerGroup("huashan_find", true)
    job.flag()
    exe("look")
    find()
end

function huashanFindKill()
    dis_all()
    EnableTrigger("huashan_find1", true)
    exe("look")
end

function huashan_dadao()
    dis_all()
    exe("yes")
    return go(huashanFindAct, dest.area, dest.room)
end

function huashan_fight_ti()
    ----------���ӻ�ɽkill ��ʱ��
    NewObserverByFunc("huashankillOb", "huashan_faint")
end

function huashan_fight(n, l, w)
    EnableTrigger("huashan_find2", false)
    job.id = string.lower(w[2])
    exe("unset no_kill_ap;unset double_attack")
    exe("follow " .. job.id)
    job.killer[job.target] = job.id

    -- kezhiwugong(job.target,job.id,'pfmpfm')
    dis_all()
    kezhiwugong()
    kezhiwugongAddTarget(job.target, job.id)
    fight.time.b = os.time()
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("huashan_fight")
    create_trigger_t("huashan_fight1", "^(> )*" .. job.target .. "��ž����һ�����ڵ���", "", "huashan_getget")
    create_trigger_t("huashan_fight2", "^(> )*" .. job.target .. "��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "huashan_faint")
    create_trigger_t("huashan_fight3", "^(> )*" .. job.target .. "�Ҵ��뿪��", "", "huashanFindFail")
    create_trigger_t("huashan_fight4", "^(> )*����û�� " .. job.id .. "��", "", "huashanFindAct")
    create_trigger_t("huashan_fight5", "^(> )*������ǰ�����������", "", "huashan_faint1")
    create_trigger_t("huashan_fight6", "^(> )*�ⲻ�����������Ƶ��ˡ�", "", "huashanFindFail")
    SetTriggerOption("huashan_fight1", "group", "huashan_fight")
    SetTriggerOption("huashan_fight2", "group", "huashan_fight")
    SetTriggerOption("huashan_fight3", "group", "huashan_fight")
    SetTriggerOption("huashan_fight4", "group", "huashan_fight")
    SetTriggerOption("huashan_fight5", "group", "huashan_fight")
    SetTriggerOption("huashan_fight6", "group", "huashan_fight")

    -- if huashanJob.killStartTime == nil then
    -- ��ʼ����ɱʱ��
    huashanJob.killStartTime = common.time()
    -- ��Ӽ�ʱ��
    NewObserverByFunc("huashanJobKillOb", "huashanKillObserver")
    -- end
    exe("unset wimpy;kill " .. job.id)
    -- exe("set wimpycmd pfmpfm\\hp")
    -- exe("pfmwu")
    -- exe("set wimpy 100")
    huashanlocate()
end

-- ---------------------------------------------------------------
-- ��ɽ���������, ����ɱ��ʱ�����ʱ, ��ӡĿ���书����
-- ---------------------------------------------------------------
function huashanKillObserver()
    local timegap = common.timediff(common.string2time(common.time()), common.string2time(huashanJob.killStartTime))
    if
        (timegap.min > 0 or timegap.sec > 30) and huashanJob.killStartTime ~= nil and
            huashanJob.KezhiObserver ~= quest.note
     then
        messageShowT(quest.name .. "ս��ʱ�䳬��30�룺" .. quest.note)
        RemoveObserver("huashanJobKillOb")
        huashanJob.KezhiObserver = quest.note
    end
end

function huashan_faint()
    -- �Ƴ�ս��������
    RemoveObserver("huashanJobKillOb")
    -- ���¼�鵱ǰװ��, Ϊװ������������׼��
    checkWield()
    exe("unset wimpy;kill " .. job.id)
end
function huashan_faint1()
    exe("worship zhao")
    wait.make(
        function()
            wait.time(1)
            exe("unset wimpy;kill " .. job.id)
        end
    )
end
function huashanlocate()
    -- lfull=0
    -- wait.make(function()
    --     wait.time(0.5)
    -- 	EnableTimer('walkWait10',false)
    -- 	exe('unwield shentong;unset no_kill_ap')
    --     locatefight()
    --     quick_locate=1
    -- end)
end
function huashan_getget()
    -- �Ƴ�ս��������
    RemoveObserver("huashanJobKillOb")
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    DeleteTriggerGroup("huashan_getnpc")
    hsgettime = 0
    create_trigger_t("huashan_getnpc1", "^(> )*�㽫(\\D*)��ʬ������������ڱ��ϡ�", "", "huashan_get_con")
    create_trigger_t("huashan_getnpc2", "^(> )*���컯�յ������ٰ�", "", "huashan_getagain")
    SetTriggerOption("huashan_getnpc1", "group", "huashan_getnpc")
    SetTriggerOption("huashan_getnpc2", "group", "huashan_getnpc")
    kezhiwugongclose()
    if locl.area == "�����" then
        return check_bei(huashan_cut)
    else
        -- ���¼�鵱ǰװ��, Ϊװ������������׼��
        checkWield()
        exe("get corpse")
        --fightoverweapon()
        for i = 1, 3 do
            exe("get ling pai from corpse " .. i)
        end
    end
end

function huashan_get_con(n, l, w)
    DeleteTimer("perform")
    DeleteTriggerGroup("all_fight")
    EnableTriggerGroup("huashan_getnpc", false)
    fight.time.e = os.time()
    fight.time.over = fight.time.e - fight.time.b
    messageShowT("��ɽ����" .. Get_huashanjob_step() .. "��ս����ʱ:��" .. fight.time.over .. "����,�㶨�����ˣ���" .. job.target .. "����")
    if job.target == tostring(w[2]) then
        EnableTriggerGroup("huashan_npc", false)
        EnableTriggerGroup("huashan_cut", false)
        hscheckhead = 0
        return check_bei(huashan_backgogo)
    else
        hscheckhead = 1
        return check_bei(huashan_cut)
    end
end
function huashan_backgogo()
    --checkBags()
    huashanJob.Progress = 5
    return go(huashan_yls, "��ɽ", "��̳")
end
huashan_get_con1 = function()
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    exe("halt;get corpse")
    return huashan_cut()
end
function huashan_getagain()
    EnableTriggerGroup("huashan_getnpc", false)
    if hsgettime < 4 then
        hsgettime = hsgettime + 1
        wait.make(
            function()
                wait.time(0.5)
                EnableTriggerGroup("huashan_getnpc", true)
                return hs_getagain()
            end
        )
    else
        return check_bei(huashan_cut)
    end
end
function hs_getagain()
    exe("get corpse")
end

function huashan_cut()
    hscheckhead = 1
    ------------�رջ�ɽkill ��ʱ��
    RemoveObserver("huashankillOb")
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    EnableTriggerGroup("huashan_getnpc", false)
    DeleteTriggerGroup("huashan_cut")
    create_trigger_t("huashan_cut1", "^(> )*ֻ�����ǡ���һ�����㽫(\\D*)���׼�ն���������������С�", "", "huashan_cut_con")
    --create_trigger_t("huashan_cut3", "^(> )*�㽫(\\D*)��ʬ������������ڱ��ϡ�", "", "huashan_cut_con")    create_trigger_t("huashan_cut2", "^(> )*(���б���ɱ���˸��ﰡ|��������������޷�����|����ü����������߲���������ʬ���ͷ��)", "", "huashan_cut_weapon")
    create_trigger_t("huashan_cut2", "^(> )*(���б���ɱ���˸��ﰡ|��������������޷�����|����ü����������߲���������ʬ���ͷ��)", "", "huashan_cut_weapon")
    SetTriggerOption("huashan_cut1", "group", "huashan_cut")
    --SetTriggerOption("huashan_cut3", "group", "huashan_cut")    SetTriggerOption("huashan_cut1", "group", "huashan_cut")
    SetTriggerOption("huashan_cut2", "group", "huashan_cut")
    -- ��ս����ʹ�ÿ����书,ͨ����װ����ͬ������,���weapon_unwield()�Ĳ�׼ȷ, ���ڴ˴����¶�ȡ���µ���Ʒ�б���Ϣ
    checkWield()
    -- ��մ����road.id(��ʱ����)
    -- ���������� opposite path
    road.id = nil
    job.killer = {}
    fight.time.e = os.time()
    fight.time.over = fight.time.e - fight.time.b
    messageShowT("��ɽ����" .. Get_huashanjob_step() .. "��ս����ʱ:��" .. fight.time.over .. "����,�㶨�����ˣ���" .. job.target .. "����")
    return check_halt(huashan_cut_act)
end
huashan_cut_dodo = function()
    --fightoverweapon()
    exe("drop corpse")
    for i = 1, 3 do
        exe("get ling pai from corpse " .. i)
        exe("qie corpse " .. i)
    end
end

function huashan_cut_act()
    DeleteTimer("perform")
    weapon_unwield()
    weaponWieldCut()
    wipe_kill = 0
    for i = 1, 5 do
        exe("halt;get ling pai from corpse " .. i)
        exe("qie corpse " .. i)
    end
end

function huashan_cut_weapon()
    return check_halt(huashan_cut_act, 1)
end
-- ---------------------------------------------------------------
-- ��ͷ�¼�ִ�д���
-- ---------------------------------------------------------------
function huashan_cut_con(n, l, w)
    huashanJob.Progress = 5
    EnableTriggerGroup("huashan_cut", false) --�ر�cut�崥��
    EnableTimer("hscut1", false)
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    exe("pfmset")
    flag.find = 1
    if job.target ~= tostring(w[2]) then
        exe("drop head")
        return check_halt(huashan_cut_act)
    else
        EnableTriggerGroup("huashan_cut", false)
        return check_halt(huashan_cut_after)
    end
end
-- ---------------------------------------------------------------
-- ��ͷ��ִ���¼�
-- ---------------------------------------------------------------
function huashan_cut_after()
    EnableTriggerGroup("huashan_cut", false)
    return go(huashan_yls, "��ɽ", "��̳")
end
huashan_yls_ok1 = function()
    exe("give corpse to yue lingshan;hp")
end
huashan_yls_ok2 = function()
    exe("give head to yue lingshan;hp")
end
huashan_yls_ok_c = function()
    NewObserverByFunc("huashanGiveCorpseOb", "huashan_yls_ok1")
end
huashan_yls_ok_h = function()
    NewObserverByFunc("huashanGiveHeadOb", "huashan_yls_ok2")
    --���ӽ��׼���ʱ��
end
-- ---------------------------------------------------------------
-- ȥ����ɺ��������
-- ---------------------------------------------------------------
function huashan_yls()
    DeleteTriggerGroup("huashan_yls")
    --create_trigger_t('huashan_yls1','^(> )*(����û������ˡ�|������û������������|���˺�������ɱ�İɣ�|���������|�㻹û��ȥ�Ҷ�������ô������̳�ˣ�)','','huashan_yls_fail')
    create_trigger_t("huashan_yls1", "^(> )*(���˺�������ɱ�İɣ�|������û������������|���������|�㻹û��ȥ�Ҷ�������ô������̳�ˣ�)", "", "huashan_yls_fail")
    create_trigger_t("huashan_yls2", "^(> )*����ɺ�����������д����һ�� (һ|��) �֡�", "", "huashan_yls_ask")
    create_trigger_t("huashan_yls3", "^(> )*���������������ưɣ�", "", "huashan_yls_wronglingpai")
    SetTriggerOption("huashan_yls1", "group", "huashan_yls")
    SetTriggerOption("huashan_yls2", "group", "huashan_yls")
    SetTriggerOption("huashan_yls3", "group", "huashan_yls")
    if hscheckhead == 0 then
        --exe('give corpse to yue lingshan')
        -- ���ӽ�ʬ���ʱ��
        return huashan_yls_ok_c()
    else
        --exe('give head to yue lingshan')
        return huashan_yls_ok_h()
    end
end
-- ---------------------------------------------------------------
-- �����Ƹ�����ɺʧ�ܺ�Ĵ���
-- ---------------------------------------------------------------
function huashan_yls_fail(n, l, w)
    -- �����ɹ���ɾ�����׼���ʱ��
    RemoveObserver("huashanGiveHeadOb")
    RemoveObserver("huashanGiveCorpseOb")
    EnableTriggerGroup("huashan_yls", false)
    messageShow("��ɽ��������ɺ��ʬ��ʧ��, ԭ��: " .. tostring(l), "deepskyblue")
    if string.find(l, "���������") and Bag["һ��" .. job.target .. "��ʬ��"] ~= nil and huashanJob.GetLingPaiAgain == 0 then
        huashanJob.GetLingPaiAgain = 1
        wait.make(
            function()
                wait.time(1.5)
                for i = 1, 3 do
                    exe("get ling pai from corpse " .. i)
                end
                return go(huashan_yls, "��ɽ", "��̳")
            end
        )
    end
    if locl.room ~= "��̳" or (string.find(l, "����û�������") and huashanJob.Progress == 5) then
        wait.make(
            function()
                wait.time(5)
                exe("out")
                return go(huashan_yls, "��ɽ", "��̳")
            end
        )
    else
        return go_direct(huashan_shibai_b, "��ɽ", "��̳", "��ɽ", "������", "huashan/jitan")
    end
end
-- ---------------------------------------------------------------
-- �������ƴ���, �ȶ�������, �ٷ���ִ��һ�ν����Ƹ�����ɺ
-- ������� "�������������ư�"
-- ---------------------------------------------------------------
function huashan_yls_wronglingpai()
    -- �����ɹ���ɾ�����׼���ʱ��
    RemoveObserver("huashanGiveHeadOb")
    RemoveObserver("huashanGiveCorpseOb")
    DeleteTriggerGroup("huashan_yls")
    exe("drop ling pai")
    return check_halt(huashan_yls)
end

function huashan_heal()
    exe("set no_kill_ap")
    return check_bei(huashan_neili)
end
-- ---------------------------------------------------------------
-- ��ɽ������NPCǰ��׼��, �����������
-- ---------------------------------------------------------------
function huashan_neili()
    huashanJob.jobStep = 1
    if GetRoleConfig("CheckNeili_InAdvance") == false then
        return huashan_npc()
    else
        return zhunbeineili(huashan_npc)
    end
end
-- ---------------------------------------------------------------
-- ����ɺ��ִ����������, ����ɽ1����,������ɽ2,ֱ�ӽ�����
-- ---------------------------------------------------------------
function huashan_yls_lbcx()
    EnableTriggerGroup("huashan_yls_ask", true)
    -- weapon_unwield()
    return exe("drop head;drop corpse;askk yue lingshan about ��������")
end

function huashan_yls_ask(n, l, w)
    huashanJob.Progress = 6
    -- �����ɹ���ɾ�����׼���ʱ��
    RemoveObserver("huashanGiveHeadOb")
    RemoveObserver("huashanGiveCorpseOb")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    create_trigger_t("huashan_yls_ask1", "^(> )*��������ɺ�����йء��������ġ�����Ϣ��", "", "huashan_yls_back")
    SetTriggerOption("huashan_yls_ask1", "group", "huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask", false)
    if w[2] == "��" then
        return huashan_yls_back()
    end
    if w[2] == "һ" and (GetRoleConfig("HuashanJob_Step2") ~= true or (lostletter == 1 and needdolost == 1)) then
        return check_bei(huashan_yls_lbcx)
    else
        return check_bei(huashan_heal)
    end
end

function huashan_yls_back()
    DeleteTriggerGroup("huashan_yls_ask")
    EnableTriggerGroup("huashanQuest", true)
    DeleteTriggerGroup("huashan_over")
    return check_busy(huashan_ysl_after)
end
-- ------------------------------------
-- �� ����ɺ ������ ����Ⱥ path
-- ------------------------------------
function huashan_ysl_after()
    DeleteTriggerGroup("huashan_over")
    create_trigger_t("huashan_over1", "^(> )*�������Ⱥһ�����ơ�", "", "huashan_finish")
    create_trigger_t("huashan_over2", "^(> )*����û������ˡ�", "", "huashan_ysl_after_safety")
    SetTriggerOption("huashan_over1", "group", "huashan_over")
    SetTriggerOption("huashan_over2", "group", "huashan_over")
    local backto_ybq = "out;w;s;se;su;su;s;give ling pai to yue buqun"
    exe(backto_ybq)
    NewObserverByFunc("huashanFinishOb", "huashan_ysl_after_safety", 5)
end
function huashan_ysl_after_safety()
    RemoveObserver("huashanFinishOb")
    DeleteTriggerGroup("huashan_over")
    create_trigger_t("huashan_over1", "^(> )*�������Ⱥһ�����ơ�", "", "huashan_finish")
    create_trigger_t("huashan_over2", "^(> )*����û������ˡ�", "", "huashan_ysl_after_safety")
    SetTriggerOption("huashan_over1", "group", "huashan_over")
    SetTriggerOption("huashan_over2", "group", "huashan_over")
    go(
        function()
            exe("give ling pai to yue buqun")
        end,
        "��ɽ",
        "������"
    )
end
-- ------------------------------------
-- ��ɽ�������
-- ------------------------------------
function huashan_finish()
    -- weapon_unwield()
    RemoveObserver("huashanFinishOb")
    EnableTriggerGroup("huashanQuest", true)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("��ɽ�������������ʱ:��" .. job.time.over .. "���롣")
    map.rooms["village/zhongxin"].ways["northwest"] = "village/caidi"
    map.rooms["village/zhongxin"].ways["northeast"] = "village/caidi"
    EnableTriggerGroup("huashan_over", false)
    EnableTriggerGroup("huashanQuest", true)
    flag.times = 1
    huashanJob.jobStep = 0
    huashanJob.Progress = 0
    exe("drop ling pai;drop head;drop corpse")
    -- jobExpTongji()
    huashan_triggerDel()
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["��ɽ"].Times = job.statistics.Category["��ɽ"].Times + 1
    job.statistics.Category["��ɽ"].Success = job.statistics.Category["��ɽ"].Success + 1
    job.statistics_Update()
    -- setLocateRoomID = "huashan/zhengqi"
    return check_halt(check_food)
end

function huashanDgjj()
    if score.party and score.party == "��ɽ��" then
        messageShow("��ɽ���񣺳��������ʾ�ˣ�")
    end
    return huashan_finish()
end

function huashanjjQuest()
    EnableTriggerGroup("huashan_accept", false)
    if score.party and score.party == "��ɽ��" then
        messageShow("��ɽ������ʾҪ�����˼����ֹͣ����ɽ����")
        job.zuhe["huashan"] = nil
        return check_heal()
    else
        return huashan_finish()
    end
end
