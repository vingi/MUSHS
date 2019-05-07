-- wudang
wudangJob = {
    -- �ӵ�����ʱ�� (�ӵ�����ʱ�����ɱʱ���ʱ���,����Ѱ�����ĵ�ʱ��)
    takeMissionTime = nil,
    -- ��¼��ʼ��ɱʱ��
    killStartTime = nil,
    -- NPC
    Npc = {
        -- Npc�������
        Condition = nil,
        -- Npc ����
        Skill = nil,
        -- ����NPC��PFM CMD
        AntiPfmCmd = nil
    }
    -- Npc�������
    -- NpcCondition = nil,
}

jobFindAgain = jobFindAgain or {}
jobFindAgain["wudang"] = "wudangFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["wudang"] = "wudangFindFail"

function wudangTrigger()
    DeleteTriggerGroup("wudangAsk")
    create_trigger_t("wudangAsk1", "^(> )*������Զ�Ŵ����й�", "", "wudangAsk")
    create_trigger_t("wudangAsk2", "^(> )*����û������ˡ�$", "", "wudangNobody")
    SetTriggerOption("wudangAsk1", "group", "wudangAsk")
    SetTriggerOption("wudangAsk2", "group", "wudangAsk")
    EnableTriggerGroup("wudangAsk", false)
    DeleteTriggerGroup("wudangAccept")
    create_trigger_t(
        "wudangAccept1",
        "^(> )*��Զ������Ķ�������˵������˵(����|����|����|��ԭ|����|����|�ӱ�|����)(�ݿ�|կ��|���|ɽ��|����|����|����)(\\D*)����(\\D*)����",
        "",
        "wudangConsider"
    )
    create_trigger_t("wudangAccept2", "^(> )*��Զ��˵�������Ҳ��Ǹ���������������", "", "wudangFangqi")
    create_trigger_t("wudangAccept3", "^(> )*��Զ������Ķ�������˵��(\\D*)��Ϊ�ó�(\\D*)�Ĺ���", "", "wudangNpc")
    create_trigger_t("wudangAccept4", "^(> )*��Զ��˵����������æ�ű��������", "", "wudangFail")
    create_trigger_t("wudangAccept5", "^(> )*��Զ��˵�������������(�䵱����|�Ͷ�����|��������|������Ħ��)����", "", "wudangFail")
    create_trigger_t("wudangAccept6", "^(> )*��Զ��˵������������ʱû���ʺ���Ĺ���", "", "wudangFail")
    create_trigger_t("wudangAccept7", "^(> )*��Զ��˵��������ʱû��������Ҫ�������һ���������", "", "wudangFail")
    create_trigger_t("wudangAccept8", "^(> )*��Զ��˵������\\D*����̫����ʧ���ˣ���Ȼ��ô���ɲ��ã������°�", "", "wudangFail")
    create_trigger_t("wudangAccept9", "^(> )*��Զ��˵������\\D*������û��������������Ϲ����ʲôѽ", "", "wudangFail")
    create_trigger_t("wudangAccept10", "^(> )*��Զ��˵������\\D*���������ȷʵ�Ƚ�����ɣ��´θ���򵥵ģ������°ɣ�", "", "wudangFail")
    create_trigger_t("wudangAccept11", "^(> )*��Զ������Ķ�������˵���������ɵ�������������������(\\D*)�ĸ��֣���Ϊ�ó�(\\D*)�Ĺ���", "", "wudangNpc")
    create_trigger_t("wudangAccept12", "^(> )*��Զ��˵������" .. score.name .. "������û��������������Ϲ����ʲôѽ����", "", "wudangFail")
    create_trigger_t("wudangAccepta", "^(> )*��Զ������Ķ�������˵�������˵��书(\\D*)��", "", "wudanglevel")
    create_trigger_t("wudangAcceptb", "^(> )*��Զ��\\D*���ȥ��أ�һ��С�İ���", "", "wudangFindGo")
    create_trigger_t("wudangAccept31", "^(> )*��Զ������Ķ�������˵������ͷ����׷�鵽(\\D*)�����䵱������Ϊ�ó�(\\D*)�Ĺ���", "", "wudangNpc")
    SetTriggerOption("wudangAccept31", "group", "wudangAccept")
    SetTriggerOption("wudangAccept1", "group", "wudangAccept")
    SetTriggerOption("wudangAccept2", "group", "wudangAccept")
    SetTriggerOption("wudangAccept3", "group", "wudangAccept")
    SetTriggerOption("wudangAccept4", "group", "wudangAccept")
    SetTriggerOption("wudangAccept5", "group", "wudangAccept")
    SetTriggerOption("wudangAccept6", "group", "wudangAccept")
    SetTriggerOption("wudangAccept7", "group", "wudangAccept")
    SetTriggerOption("wudangAccept8", "group", "wudangAccept")
    SetTriggerOption("wudangAccept9", "group", "wudangAccept")
    SetTriggerOption("wudangAccept10", "group", "wudangAccept")
    SetTriggerOption("wudangAccept11", "group", "wudangAccept")
    SetTriggerOption("wudangAccept12", "group", "wudangAccept")
    SetTriggerOption("wudangAccepta", "group", "wudangAccept")
    SetTriggerOption("wudangAcceptb", "group", "wudangAccept")
    EnableTriggerGroup("wudangAccept", false)
    DeleteTriggerGroup("wudangFight")
    create_trigger_t("wudangFight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "wudangBack")
    create_trigger_t("wudangFight2", "^(> )*(\\D*)��һ�������ã���ת��������Ͳ�����", "", "wudangBack")
    create_trigger_t("wudangFight3", "^(> )*����û��(\\D*)��", "", "wudangLost")
    create_trigger_t("wudangFight4", "^(> )*(\\D*)�����㷢��һ����Ц��˵��", "", "wudangKillAct")
    create_trigger_t("wudangFight5", "^(> )*(\\D*)��һ�������Ӳ������ˣ�ת��������Ͳ�����", "", "wudangBack")
    create_trigger_t("wudangFight6", "^>*\\s*һ��ů�����Ե�������ȫ�����������ָֻ���֪������", "", "wudangFangqiGo")
    create_trigger_t("wudangFight7", "^(��|��)װ���ţ�$", "", "npcWeapon")
    SetTriggerOption("wudangFight1", "group", "wudangFight")
    SetTriggerOption("wudangFight2", "group", "wudangFight")
    SetTriggerOption("wudangFight3", "group", "wudangFight")
    SetTriggerOption("wudangFight4", "group", "wudangFight")
    SetTriggerOption("wudangFight5", "group", "wudangFight")
    SetTriggerOption("wudangFight6", "group", "wudangFight")
    SetTriggerOption("wudangFight7", "group", "wudangFight")
    EnableTriggerGroup("wudangFight", false)
    DeleteTriggerGroup("wudangFinish")
    create_trigger_t("wudangFinish1", "^(> )*��Զ�Ŷ��������������ִ�Ĵָ�������ġ�", "", "wudangFinishT")
    create_trigger_t("wudangFinish2", "^(> )*��Զ�ű������û��˹�ȥ��", "", "wudangFinish")
    create_trigger_t("wudangFinish3", "^(> )*��Զ��˵������" .. score.name .. "����ô���", "", "wudangFinish")
    SetTriggerOption("wudangFinish1", "group", "wudangFinish")
    SetTriggerOption("wudangFinish2", "group", "wudangFinish")
    SetTriggerOption("wudangFinish3", "group", "wudangFinish")
    EnableTriggerGroup("wudangFinish", false)
    DeleteTriggerGroup("wudangdebug")
    create_trigger_t("wudangdebug1", "^(> )*�������һ���������", "", "wudangdebugFind")
    SetTriggerOption("wudangdebug1", "group", "wudangdebug")
    EnableTriggerGroup("wudangdebug", true)
end

function wudangFindAgain()
    if flag.times == 3 and dest.area == "��ɽ��" and dest.room == "������" then
        return go(wudangFindAct, "��ɽ��", "�˵�")
    end
    if flag.times == 3 and dest.area == "������" and dest.room == "ɽ��յ�" then
        return go(wudangFindAct, "��������", "�ٲ�")
    end
    return go(wudangFindAct, dest.area, dest.room)
end
function wudangFindFail()
    EnableTriggerGroup("wudangFight", false)
    -- EnableTriggerGroup("wudangFind",false)
    return go(wudangFangqi, "�䵱ɽ", "�����")
end
faintFunc = faintFunc or {}
faintFunc["wudang"] = "wudangFaint"
function wudangFaint()
    return wudangFindFail()
end
function wudanglevel(n, l, w)
    job.level = w[2]
    -- messageShow('WD job level:��'..job.level..'��')
end
function wudangTriggerDel()
    DeleteTriggerGroup("wudangdebug")
    DeleteTriggerGroup("wudangAsk")
    DeleteTriggerGroup("wudangAccept")
    DeleteTriggerGroup("wudangFight")
    DeleteTriggerGroup("wudangFinish")
    DeleteTriggerGroup("wudangFind")
end
function wudangNobody()
    EnableTriggerGroup("wudangAsk", false)
    wudang()
end
job.list["wudang"] = "�䵱ɱ����"
function wudang()
    if hp.shen < 0 then
        return turnShen("+")
    end
    wudangTrigger()
    job.level = nil
    job.lost = 0
    job.name = "wudang"
    return check_halt(wudangGo)
end
function wudangGo()
    return go(wudangBegin, "�䵱ɽ", "�����")
end
function wudangBegin()
    if GetRoleConfig("CheckNeili_InAdvance") == true then
        return zhunbeineili(wdstart)
    else
        return wdstart()
    end
end
function wdstart()
    return prepare_lianxi(wudangStart)
end
function wudangStart()
    EnableTriggerGroup("wudangAsk", true)
    flag.idle = nil
    ---------------�䵱ask job ������
    NewObserver("wdAskJobOb", "ask song yuanqiao about job")
end
function wudangAsk()
    EnableTriggerGroup("wudangAsk", false)
    EnableTriggerGroup("wudangAccept", true)
    -- �Ƴ� �䵱ask job ������
    RemoveObserver("wdAskJobOb")
end
function wudangBusy()
    EnableTriggerGroup("wudangAccept", false)
    job.last = "wudang"
    return check_bei(wudangBusyDazuo)
end
function wudangBusyDazuo()
    exe("n")
    return prepare_lianxi(wudang)
end
function wudangFail(n, l, w)
    EnableTriggerGroup("wudangAccept", false)
    if job.level == "���뻯��" then
        job.level = "δ֪"
        messageShow("�䵱���񣺵�ǰ�ӵ������뻯�����������ڿ�ʼ������ȼ�Ϊ��" .. job.level .. "����", "red")
        quest.desc = "���뻯��"
        quest.update()
        return check_bei(wudangHuajing_GoAgain)
    end
    wudangTriggerDel()
    job.lost = 0
    -- job.last='wudang'
    -- ���ý�ɱʱ��
    wudangJob.killStartTime = nil
    setLocateRoomID = "wudang/sanqing"
    -- ���������1
    -- job.statistics_JobTimePlus()
    if not string.find(l, "����æ�ű��������") then 
        MissionPunishment.AlreadyGiveUp = true
    end
    if score.party == "��ɽ��" and hp.shen < 0 then
        return clb()
    end
    if job.last == "songxin" then
        return huashan()
    else
        return songxin()
    end
end
function wudangConsider(n, l, w)
    MissionPunishment.AlreadyGiveUp = false
    local x
    nobusy = 1
    job.time.b = os.time()
    job.last = "wudang"
    job.target = Trim(w[4])
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[5])
    -- Note(job.where)
    if string.find(Trim(w[5]), "��֮��") then
        -- wd_distance=tonumber(string.sub(Trim(w[5]),string.find(Trim(w[5]),"��֮��")-2,string.find(Trim(w[5]),"��֮��")-1))
        x = string.find(Trim(w[5]), "��֮��")
        wd_distance = trans(string.sub(Trim(w[5]), x - 2, x - 1))
    else
        wd_distance = 4
    end
    print("��Բ" .. tostring(wd_distance) .. "��֮��")
    if string.find(job.where, "��Χ") then
        local l_cnt = string.find(job.where, "��Χ")
        job.where = string.sub(job.where, 1, l_cnt - 1)
    -- Note(job.where)
    end
    job.room, job.area = getAddr(job.where)
    -- if job.area=="����" and string.find(job.room,"����") then
    -- job.room="��ɼ��"
    -- end
    if job.area == "����" and (job.room == "��ɼ��" or string.find(job.room, "����")) then
        job.room = "���䳡"
    end
end
function wudangNpc(n, l, w)
    EnableTriggerGroup("wudangAccept", false)
    EnableTrigger("wudangAccepta", true)
    EnableTrigger("wudangAcceptb", true)
    sxjob.skills = tostring(w[3])
    -- ������������/ƥ��
    if sxjob.skills == "������" then
        sxjob.skills = "�����ȷ�"
    end
    if sxjob.skills == "�����Ʒ�" then
        sxjob.skills = "���ص���"
    end
    if sxjob.skills == "������" then
        sxjob.skills = "һ��ָ"
    end
    wudangJob.Npc.Skill = sxjob.skills
    local NPCSkillAttr = kezhiwugongAttribue(wudangJob.Npc.Skill)
    if NPCSkillAttr ~= nil then
        print("�䵱����NPC�书����Ԥ����: " .. wudangJob.Npc.Skill .. " " .. NPCSkillAttr)
        local pfmcmd = kezhiwugongGetPerform(NPCSkillAttr)
        wudangJob.Npc.AntiPfmCmd = pfmcmd
    else
        messageShow("�䵱����NPC�书����Ԥ����: " .. wudangJob.Npc.Skill .. " ���������쳣, �Ҳ�����Ӧ����!")
    end
end
function wudangFindGo()
    EnableTriggerGroup("wudangAccept", false)
    dest.room = job.room
    dest.area = job.area
    job.wdtime = os.time() + 8 * 60
    exe("nick �䵱����" .. job.where)
    exe("set no_kill_ap")
    quest.name = "�䵱ɱ����"
    quest.location = job.where
    quest.target = job.target
    quest.desc = ""
    quest.note = ""
    quest.update()
    -- pfmjineng()
    setLocateRoomID = "wudang/sanqing"
    if not job.room or not path_cal() then
        messageShow("�䵱��������ص㡾" .. job.where .. "�����ɵ�����������")
        return check_bei(wudangFangqi)
    end
    if skillIgnores[sxjob.skills] then
        messageShow("�䵱����" .. job.target .. "ʹ�õ��书�ǡ�" .. sxjob.skills .. "���������У����������")
        return check_bei(wudangFangqi)
    end
    if job.level == "���뻯��" then
        return check_bei(wudangHuajing_Fangqi)
    end
    -- messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����')
    messageShow("�䵱�������ڿ�ʼǰ����" .. job.where .. "����")
    return check_bei(wudangFind)
end
function wudangHuajing_Fangqi()
    EnableTriggerGroup("wudangAccept", false)
    messageShow("�䵱���񣺼�װ�������뻯��!", "greenyellow")
    return check_bei(wudangFangqiAsk)
end
function wudangHuajing_GoAgain()
    job.wdtime = os.time() + 5 * 60
    -- messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����','greenyellow')
    messageShow("�䵱�������ڿ�ʼǰ����" .. job.where .. "����", "greenyellow")
    return check_bei(wudangFind)
end
function wudangFangqiGo()
    DeleteTimer("wudang")
    messageShow("���䵱����NPC�����ˣ����������")
    exe("i")
    geta()
    go(wudangFangqi, "�䵱ɽ", "�����")
end
function wudangFangqi()
    exe("nick �䵱�������")
    exe("unset no_kill_ap")
    dis_all()
    kezhiwugongclose()
    flag.idle = nil
    job.level = nil
    job.lost = 0
    nobusy = 0
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Failure = job.statistics.Failure + 1
    job.statistics.Category["�䵱"].Times = job.statistics.Category["�䵱"].Times + 1
    job.statistics.Category["�䵱"].Failure = job.statistics.Category["�䵱"].Failure + 1
    job.statistics_Update()
    EnableTriggerGroup("wudangAccept", false)
    check_bei(wudangFangqiAsk)
end
function wudangFangqiAsk()
    EnableTriggerGroup("wudangAsk", true)
    exe("ask song yuanqiao about ����")
    setLocateRoomID = "wudang/sanqing"
end
function wudangFind()
    DeleteTriggerGroup("wudangFind")
    create_trigger_t("wudangFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "wudangTarget")
    create_trigger_t(
        "wudangFind2",
        "^(> )*" ..
            job.target ..
                "(�����㷢��һ����Ц��˵������Ȼ�������\\D*ײ���ˣ���Ҳ��ֻ�����������ˣ�|����˵����\\D*����׷���ᣬ��Ȼ�Ӳ�����\\D*�Ҹ���ƴ�ˣ�|������˵�����ٺ٣��е��Ҹ�������\\D*�������ˣ�|�������߹�������ɫ��Щ�쳣����æ������ͷ��)",
        "",
        "wudangFindKill"
    )
    create_trigger_t(
        "wudangFind3",
        "^(> )*" .. job.target .. "�����㷢��һ����Ц��˵����\\D*������ط�̫С�����ָ�\\D*������Ȼ��Ȼ���",
        "",
        "wudangLost"
    )
    SetTriggerOption("wudangFind1", "group", "wudangFind")
    SetTriggerOption("wudangFind2", "group", "wudangFind")
    SetTriggerOption("wudangFind3", "group", "wudangFind")
    flag.times = 1
    flag.robber = false
    create_alias("kezhiwugongpfm", "kezhiwugongpfm", "alias pfmpfm " .. wudangJob.Npc.AntiPfmCmd)
    exe("kezhiwugongpfm")
    exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    print("��ǰλ��: " .. locl.area .. locl.room)
    if locl.area == "�䵱ɽ" and locl.room == "�����" then
        print("�����ⶨλֱ��")
        go_direct_pure(wudangFindAct, "�䵱ɽ", "�����", job.area, job.room, "wudang/sanqing")
    else
        go(wudangFindAct, job.area, job.room)
    end
end
function wudangdebugFind()
    DeleteTriggerGroup("wudangFind")
    create_trigger_t("wudangFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "wudangTarget")
    SetTriggerOption("wudangFind1", "group", "wudangFind")
    flag.times = 1
    flag.robber = false
    exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    go(wudangFinddebug, job.area, job.room)
end
function wudangFinddebug()
    EnableTriggerGroup("wudangFind", true)
    DeleteTimer("wudang")
    job.flag()
    exe("look")
    find()
    messageShow("�䵱���񣺿�ʼ����Ѱ�ҡ�" .. dest.area .. dest.room .. "����" .. "��" .. job.target .. "����")
end
-- ---------------------------------------------------------------
-- �䵱���񵽴�����ص�, ��ʼ����Ŀ��
-- ---------------------------------------------------------------
function wudangFindAct()
    locl.area = job.area
    locl.room = job.room
    EnableTriggerGroup("wudangFind", true)
    DeleteTimer("wudang")
    job.flag()
    exe("look")
    find()
    messageShow(
        "�䵱�����ѵ�������ص㡾" .. job.where .. "������ʼѰ�ҡ�" .. dest.area .. dest.room .. "����" .. "��" .. job.target .. "����"
    )
end
function wudangFindKill()
    dis_all()
    flag.robber = true
    EnableTriggerGroup("wudangdebug", true)
    EnableTrigger("wudangFind1", true)
    exe("look")
end
function wudangTarget(n, l, w)
    EnableTriggerGroup("wudangFind", false)
    dis_all()
    EnableTriggerGroup("wudangdebug", true)
    EnableTriggerGroup("wudangFight", true)
    EnableTrigger("hpheqi1", true)
    job.id = string.lower(w[2])
    job.killer[job.target] = job.id
    exe("follow " .. job.id)
    -- exe('look '..job.id)
    exe("unset no_kill_ap")
    wudangKillAct()
    create_timer_s("wudang", 5, "wudangMove")
end
function wudangMove()
    if job.id then
        exe("kick " .. job.id)
        exe("kill " .. job.id)
    end
end
function wudangLost(n, l, w)
    job.lost = job.lost + 1
    if job.lost > 3 then
        job.lost = 0
        messageShow("�䵱����������ʧ��" .. job.target .. "��" .. tostring(job.lost) .. "�Σ���ȥ������")
        return check_halt(wudangFindFail)
    end
    if job.id == Trim(w[2]) then
        dis_all()
        EnableTriggerGroup("wudangdebug", true)
        locl.area = job.area
        locl.room = job.room
        return wudangFind()
    end
end
function wudangKill()
    wait.make(
        function()
            wait.time(0.2)
            wudangKillAct()
        end
    )
end
function wudangKillAct()
    fight.time.b = os.time()
    flag.robber = true
    exe("set wimpy 100;set wimpycmd pfmpfm\\hp;yield no")
    exe("kick " .. job.id)
    exe("kill " .. job.id)
    kezhiwugong()
    kezhiwugongAddTarget(job.target, job.id)
    if wudangJob.killStartTime == nil then
        -- ��ʼ����ɱʱ��
        wudangJob.killStartTime = common.time()
        -- ��Ӽ�ʱ��
        NewObserverByFunc("wudangJobKillOb", "wudangKillObserver")
    end
end
-- ---------------------------------------------------------------
-- �䵱���������, ����ɱ��ʱ�����ʱ, ��ӡĿ���书����
-- ---------------------------------------------------------------
function wudangKillObserver()
    local timegap = common.timediff(common.string2time(common.time()), common.string2time(wudangJob.killStartTime))
    if
        (timegap.min > 0 or timegap.sec > 30) and wudangJob.killStartTime ~= nil and
            wudangJob.Npc.Condition ~= quest.note
     then
        wudangJob.Npc.Condition = quest.note
        messageShowT("�䵱����ս��ʱ�䳬��30�룺" .. quest.note)
        RemoveObserver("wudangJobKillOb")
    end
end
function wudangBack(n, l, w)
    DeleteTimer("wudang")
    RemoveObserver("wudangJobKillOb")
    if w[2] == job.target then
        EnableTriggerGroup("wudangFight", false)
        EnableTriggerGroup("wudangFinish", true)
        tmp.number = 0
        DeleteTimer("perform")
        DeleteTimer("wudang")
        kezhiwugongclose()
        check_halt(wudangBackGet)
        fight.time.e = os.time()
        fight.time.over = fight.time.e - fight.time.b
        messageShowT("�䵱���񣺸㶨" .. "��" .. job.target .. "����ս����ʱ:��" .. fight.time.over .. "���롣")
    end
end
function wudangBackGet()
    geta()
    -- ǿ��װ����������
    Weapon.RecoverNeili(true)
    wudangCk = 0
    EnableTriggerGroup("wudangFinish", true)
    -- return go(wudangFinishWait,'�䵱ɽ','�����')
    return wudangGoBack()
end
-- ---------------------------------------------------------------
-- ����Զ�Ŵ�����.
-- ---------------------------------------------------------------
function wudangGoBack()
    go(wudangFinishC, "�䵱ɽ", "�����")
end
function wudangFinishWait()
    if locl.id["��Զ��"] then
        return wudangFinishC()
    else
        return go(wudangFinishWait, "�䵱ɽ", "�����")
    end
end
function wudangFinishT()
    print("���ο��Ҹɵúá�")
    -- ���ý�ɱʱ��
    wudangJob.killStartTime = nil
    -- setLocateRoomID='wudang/sanqing'
     -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["�䵱"].Times = job.statistics.Category["�䵱"].Times + 1
    job.statistics.Category["�䵱"].Success = job.statistics.Category["�䵱"].Success + 1
    job.statistics_Update()
end
function wudangFinishC()
    print("�ȴ����η�������")
    if wudangjobok == 0 and wudangCk < 5 then
        wait.make(
            function()
                wait.time(1)
                wudangCk = wudangCk + 1
                exe("out;enter")
                return wudangFinishC()
            end
        )
    else
        return wudangFangqi()
    end
end
function wudangFinish()
    EnableTriggerGroup("wudangFinish", false)
    wudangTriggerDel()
    wudangjobok = 0
    job.wdtime = 0
    wudangCk = 0
    nobusy = 0
    job.lost = 0
    job.last = "wudang"
    kezhiwugongclose()
    -- ���ý�ɱʱ��
    wudangJob.killStartTime = nil
    return check_food()
end
