-- hqgzc
function hqgzcTrigger()
    cooking = { }
    cooking.hebei = { "������", "����", "��ľ��", "��ɽ", "��ɽ", "�ؽ�", "����", "����", "����", "����", "��ԭ", "����", "����", "����" }
    cooking.zhongyuan = {
        "�����",
        "�ɶ�",
        "����",
        "����",
        "����",
        "���ְ�",
        "��ɽ",
        "��ɽ",
        "̩ɽ",
        "����",
        "��ѩɽ",
        "����",
        "����",
        "�置",
        "�䵱",
        "����",
        "������",
        "����",
        "����",
        "�ƺ�����"
    }
    cooking.jiangnan = { "��ɽ", "����", "����", "����", "÷ׯ", "����Ľ��", "������", "��٢��ɽׯ", "����", "����", "����", "ţ�Ҵ�", "����ׯ" }
    cooking.target = { }
    cooking.where = { }
    cooking.menu = { }
    cooking.flag = { }
    cooking.findtimes = { }
    DeleteTriggerGroup("hqgzcAsk")
    create_trigger_t("hqgzcAsk1", "^(> )*������߹������й�", "", "hqgzcAsk")
    create_trigger_t("hqgzcAsk2", "^(> )*����û������ˡ�$", "", "hqgzcNobody")
    SetTriggerOption("hqgzcAsk1", "group", "hqgzcAsk")
    SetTriggerOption("hqgzcAsk2", "group", "hqgzcAsk")
    EnableTriggerGroup("hqgzcAsk", false)
    DeleteTriggerGroup("hqgzcAskFail")
    create_trigger_t("hqgzcAskFail1", "^(> )*���߹�˵��������Ȼ�����ˣ�Ҳ�Ͳ���ǿ���ˡ���", "", "hqgzcBegin")
    SetTriggerOption("hqgzcAskFail1", "group", "hqgzcAskFail")
    EnableTriggerGroup("hqgzcAskFail", false)
    DeleteTriggerGroup("hqgzcAccept")
    create_trigger_t("hqgzcAccept1", "^(> )*���߹�����Ķ�������˵������˵(\\D*)��(\\D*)������(\\D*)�������ȥ�����ɣ�", "", "hqgzcCaiPu")
    create_trigger_t("hqgzcAccept2", "^(> )*���߹�˵��������λ\\D*��Ǳ���Ѿ���ô���ˣ�������ȥ���������ɣ���", "", "hqgzcFail")
    create_trigger_t("hqgzcAccept3", "^(> )*���߹�˵�����������ڲ������㻹����ȥ��Ϣһ��ɡ���", "", "hqgzcNotHungry")
    create_trigger_t("hqgzcAccept4", "^(> )*���߹�˵����������������ʲôԭ�϶�û�У������ٰ��������ɡ���", "", "hqgzcCaiPuDetail2")
    create_trigger_t("hqgzcAccept5", "^(> )*���߹�˵�������������Ѿ���Щԭ�ϣ��ȸ��㣬�������ȥ�Ұɣ���", "", "hqgzcCaiPuDetail2")
    -- create_trigger_t('hqgzcAccept5',"^(> )*���߹�˵�������������Ѿ���Щԭ�ϣ��ȸ��㣬�������ȥ�Ұɣ���",'','hqgzcCaiPuCheck')
    create_trigger_t("hqgzcAccept6", "^(> )*���߹�˵����������æ�ű��������", "", "hqgzcFail")
    create_trigger_t("hqgzcAccept7", "^(> )*���߹�˵������\\D*������û��������������Ϲ����ʲôѽ", "", "hqgzcStart")
    create_trigger_t("hqgzcAccept8", "^(> )*���߹�˵�������ţ��Ҳ��Ǹ��������𣬿�ȥȡԭ�ϰ��������������ˣ���", "", "hqgzcFangqiGo")
    SetTriggerOption("hqgzcAccept1", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept2", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept3", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept4", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept5", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept6", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept7", "group", "hqgzcAccept")
    SetTriggerOption("hqgzcAccept8", "group", "hqgzcAccept")
    EnableTriggerGroup("hqgzcAccept", false)
    DeleteTriggerGroup("hqgzcFinish")
    create_trigger_t("hqgzcFinish1", "^(> )*���߹�ָ������һЩ��ѧ�ϵ��Խ�������(\\D*)Ǳ�ܡ�", "", "hqgzcFinish")
    create_trigger_t("hqgzcFinish2", "^(> )*�㽫ԭ�Ϸ���һ��һ���������һ�������ζ�ġ����˭������÷����", "", "hqgzcFinishT")
    create_trigger_t("hqgzcFinish3", "^(> )*��һʱ���񣬷Ŵ������ϣ��˷����Ƴɡ����˭������÷���Ĵ�û��ᡣ", "", "hqgzcFinish1")
    create_trigger_t("hqgzcFinish4", "^(> )*����ȱ��һЩԭ�ϰ���", "", "hqgzcFangqiGo")
    create_trigger_t("hqgzcFinish5", "^(> )*���߹�Ϊ����Ǯׯ������(\\D*)���ƽ�", "", "hqgzcFinishGold")
    SetTriggerOption("hqgzcFinish1", "group", "hqgzcFinish")
    SetTriggerOption("hqgzcFinish2", "group", "hqgzcFinish")
    SetTriggerOption("hqgzcFinish3", "group", "hqgzcFinish")
    SetTriggerOption("hqgzcFinish4", "group", "hqgzcFinish")
    SetTriggerOption("hqgzcFinish5", "group", "hqgzcFinish")
    EnableTriggerGroup("hqgzcFinish", false)
    DeleteTriggerGroup("hqgzcCaiPuCheck")
    create_trigger_t("hqgzcCaiPuCheck1", "^�㻹������ԭ����δ�ҵ���", "", "hqgzcCaiPuDetail")
    SetTriggerOption("hqgzcCaiPuCheck1", "group", "hqgzcCaiPuCheck")
    EnableTriggerGroup("hqgzcCaiPuCheck", false)
    DeleteTriggerGroup("hqgzcCaiPuDetail")
    create_trigger_t("hqgzcCaiPuDetail1", "^(\\D*)\\s*(\\D*)\\s*(\\D*)$", "", "hqgzcCaiPuDetail1")
    create_trigger_t("hqgzcCaiPuDetail2", "^���Ѿ��ҵ���ԭ���У�\\D*", "", "hqgzcWhereConsider")
    SetTriggerOption("hqgzcCaiPuDetail1", "group", "hqgzcCaiPuDetail")
    SetTriggerOption("hqgzcCaiPuDetail2", "group", "hqgzcCaiPuDetail")
    EnableTriggerGroup("hqgzcCaiPuDetail", false)
end
function hqgzcTriggerDel()
    DeleteTriggerGroup("hqgzcAsk")
    DeleteTriggerGroup("hqgzcAccept")
    DeleteTriggerGroup("hqgzcFinish")
    DeleteTriggerGroup("hqgzcFind")
    DeleteTriggerGroup("hqgzcCaiPuCheck")
    DeleteTriggerGroup("hqgzcCaiPuDetail")
    DeleteTriggerGroup("hqgzcTrade")
end
function hqgzcCheckSilver()
    quest.status = "������ - ����"
    quest.update()
    if Bag["����"].cnt ~= 98 then
        return go(hqgzcCheckSilverQu, "���ݳ�", "�۱�ի")
    end
    return check_bei(hqgzcGo)
end
function hqgzcCheckSilverQu()
    if not locl.id["���ϰ�"] then
        return go(hqgzcCheckSilverQu, "���ݳ�", "�۱�ի")
    else
        local qusilver = 98 - Bag["����"].cnt
        if qusilver < 0 then
            local qusilvertmp = Bag["����"].cnt - 98
            exe("cun " .. qusilvertmp .. " silver")
        elseif qusilver > 0 then
            exe("qu " .. qusilver .. " silver")
        end
        checkBags()
        return check_bei(hqgzcCheckSilver)
    end
end
function hqgzcNobody()
    EnableTriggerGroup("hqgzcAsk", false)
    hqgzc()
end
job.list["hqgzc"] = "���߹�����"
function hqgzc()
    dis_all()
    hqgzcTrigger()
    job.name = "hqgzc"
    quest.name = "���߹�����"
    quest.update()
    checkBags()
    return check_halt(hqgzcCheckSilver)
end
jobFindAgain = jobFindAgain or { }
jobFindAgain["hqgzc"] = "hqgzcFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["hqgzc"] = "hqgzcFindFail"
function hqgzcFindAgain()
    Note("��������Ѱ�Ҵ���" .. flag.times)
    if flag.times > 2 then
        messageShow("������������" .. flag.times .. "Ŀ�꡾" .. job.target .. "���ص㡾" .. job.where .. "��δ�ҵ������������", "deeppink")
        return check_halt(hqgzcFindFail)
    end
    EnableTriggerGroup("hqgzcFind", true)
    return go(hqgzcFindAct, dest.area, dest.room)
end
faintFunc = faintFunc or { }
faintFunc["hqgzc"] = "hqgzcFindFail"
function hqgzcFindFail()
    EnableTriggerGroup("hqgzcFind", false)
    return go(hqgzcFangqi, "ؤ��", "��Ժ")
end
function hqgzcGo()
    quest.status = "ȥؤ�������"
    quest.update()
    return go(hqgzcBegin, "ؤ��", "��Ժ")
end
function hqgzcBegin()
    dis_all()
    return prepare_lianxi(hqgzcStart)
end
function hqgzcStart()
    EnableTriggerGroup("hqgzcAsk", true)
    flag.idle = 0
    exe("time")
    return exe("ask hong qigong about job")
end
function hqgzcAsk()
    EnableTriggerGroup("hqgzcAsk", false)
    EnableTriggerGroup("hqgzcAccept", true)
end
function hqgzcNotHungry()
    dis_all()
    for p in pairs(job.zuhe) do
        if job.last == "clb" then
            return check_bei(_G[p])
        else
            -- ���߹���������busyʱ,ֻ�������ְ�����, �������񲻿���, ����д�����ְ�����
            return clb()
        end
    end
end
function hqgzcBusy()
    EnableTriggerGroup("hqgzcAccept", false)
    -- job.last='hqgzc'
    return check_bei(hqgzcDazuo)
end
function hqgzcDazuo()
    exe("s")
    return prepare_lianxi(hqgzc)
end
function hqgzcFail()
    EnableTriggerGroup("hqgzcAccept", false)
    hqgzcTriggerDel()
    -- job.last='hqgzc'
    return check_food()
end
function hqgzcCaiPu(n, l, w)
    quest.status = "ȥ�Ҳ���"
    quest.target = Trim(w[3])
    quest.location = Trim(w[2])
    quest.desc = "���� - " .. Trim(w[4])
    quest.update()
    table.insert(cooking.target, Trim(w[3]))
    table.insert(cooking.where, Trim(w[2]))
    table.insert(cooking.menu, Trim(w[4]))
end
function hqgzcCaiPuCheck()
    EnableTriggerGroup("hqgzcCaiPuCheck", true)
    return exe("l cai pu")
end
function hqgzcCaiPuDetail()
    EnableTriggerGroup("hqgzcCaiPuCheck", false)
    EnableTriggerGroup("hqgzcCaiPuDetail", true)
end
function hqgzcCaiPuDetail1(n, l, w)
    local l_target = Trim(w[1])
    local l_where = Trim(w[2])
    local l_menu = Trim(w[3])
    for key, value in pairs(cooking.target) do
        if value == l_target then
            cooking.flag[key] = 1
            Note(
            cooking.flag[key] .. " " .. cooking.target[key] .. " " .. cooking.where[key] .. " " .. cooking.menu[key]
            )
        end
    end
end
function hqgzcCaiPuDetail2()
    for key, value in pairs(cooking.target) do
        cooking.flag[key] = 4
        cooking.findtimes[key] = 0
        for key1, value in pairs(cooking.jiangnan) do
            if string.find(cooking.where[key], value) then
                cooking.flag[key] = 1
            end
        end
        for key2, value in pairs(cooking.zhongyuan) do
            if string.find(cooking.where[key], value) then
                cooking.flag[key] = 2
            end
        end
        for key3, value in pairs(cooking.hebei) do
            if string.find(cooking.where[key], value) then
                cooking.flag[key] = 3
            end
        end
        Note(cooking.flag[key] .. " " .. cooking.target[key] .. " " .. cooking.where[key] .. " " .. cooking.menu[key])
    end
    return check_bei(hqgzcWhereConsider)
end
function hqgzcWhereConsider()
    for key, value in pairs(cooking.where) do
        if cooking.flag[key] >= 1 then
            job.where = value
            job.room, job.area = getAddr(value)
            dest.room = job.room
            dest.area = job.area
            local IsAvaliable = true
            if not job.room or not path_cal() then
                IsAvaliable = false
            end
            if job.where == "����������" then
                IsAvaliable = false
            end
            if not IsAvaliable then
                messageShow("������������ص㡾" .. job.where .. "�����ɵ�����������", "deeppink")
                return check_bei(hqgzcFangqi)
            end
        end
    end
    EnableTriggerGroup("hqgzcAccept", false)
    job.time.b = os.time()
    -- job.last='hqgzc'
    return check_bei(hqgzcFind)
end
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
function hqgzcFind()
    for j = 1, 4 do
        for i = 1, table_maxn(cooking.target) do
            if cooking.flag[i] == j then
                job.room, job.area = getAddr(cooking.where[i])
                -- if type(job.room)=="string" and string.find(job.room,"����") then
                -- job.room="��ɼ��"
                -- end
                job.target = cooking.target[i]
                job.where = cooking.where[i]
                job.menu = cooking.menu[i]
                dest.room = job.room
                dest.area = job.area
                DeleteTriggerGroup("hqgzcFind")
                create_trigger_t("hqgzcFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "hqgzcTarget")
                SetTriggerOption("hqgzcFind1", "group", "hqgzcFind")
                EnableTriggerGroup("hqgzcFind", false)
                DeleteTriggerGroup("hqgzcTrade")
                create_trigger_t("hqgzcTrade1", "^(> )*\\D*" .. job.target .. "˵������\\D*��(\\D*)�����Ӱɡ���", "", "hqgzcPay")
                create_trigger_t("hqgzcTrade2", "^(> )*\\D*" .. job.target .. "˵�������ţ���Ҫ�Ļ�������ȥ�ɡ���", "", "hqgzcTradeOK")
                create_trigger_t("hqgzcTrade5", "^(> )*\\D*" .. job.target .. "˵�������ţ���Ҫ����ȥ�ɡ���", "", "hqgzcTradeOK")
                create_trigger_t(
                "hqgzcTrade3",
                "^(> )*\\D*" .. job.target .. "˵����������ʲô����һ�ڼۣ��Ҷ�˵�ˣ���Ҫ�����ˡ���",
                "",
                "hqgzcNoPay"
                )
                create_trigger_t(
                "hqgzcTrade4",
                "^(> )*\\D*" .. job.target .. "�������ĵġ��š���һ�����ƺ�����û������˵ʲô��",
                "",
                "hqgzcAskMenu"
                )
                create_trigger_t("hqgzcTrade6", "^(> )*����û������ˡ�", "", "hqgzcLost")
                SetTriggerOption("hqgzcTrade1", "group", "hqgzcTrade")
                SetTriggerOption("hqgzcTrade2", "group", "hqgzcTrade")
                SetTriggerOption("hqgzcTrade3", "group", "hqgzcTrade")
                SetTriggerOption("hqgzcTrade4", "group", "hqgzcTrade")
                SetTriggerOption("hqgzcTrade6", "group", "hqgzcTrade")
                SetTriggerOption("hqgzcTrade5", "group", "hqgzcTrade")
                EnableTriggerGroup("hqgzcTrade", false)
                cooking.findtimes[i] = cooking.findtimes[i] + 1
                flag.times = cooking.findtimes[i]
                exe("unset wimpy;jifa all;set wimpycmd pfmpfm\\hp")
                job.zctime = os.time() + 8 * 60
                exe("nick ������" .. job.where)
                quest.status = "ȥ����"
                quest.location = job.where
                quest.target = "���߹�"
                quest.desc = "���˸����߹���"
                quest.update()
                exe("set no_kill_ap")
                pfmjineng()
                return go(hqgzcFindAct, job.area, job.room)
            end
        end
    end
    exe("nick �����ں��߹�")
    return check_bei(hqgzcBack)
end
function hqgzcFindAct()
    Note("��������Ѱ�Ҵ���" .. flag.times)
    if flag.times > 2 then
        messageShow("������������" .. flag.times .. "Ŀ�꡾" .. job.target .. "���ص㡾" .. job.where .. "��δ�ҵ������������", "deeppink")
        return check_halt(hqgzcFindFail)
    end
    EnableTriggerGroup("hqgzcFind", true)
    job.flag()
    exe("look")
    find()
    messageShow(
    "���������ѵ�������ص㡾" .. job.where .. "������ʼѰ�ҡ�" .. dest.area .. dest.room .. "����" .. "��" .. job.target .. "����"
    )
end
function hqgzcTarget(n, l, w)
    EnableTriggerGroup("hqgzcFind", false)
    dis_all()
    EnableTriggerGroup("hqgzcTrade", true)
    job.id = string.lower(w[2])
    exe("follow " .. job.id)
    return exe("ask " .. job.id .. " about " .. job.menu)
end
function hqgzcPay(n, l, w)
    cooking.money = trans(w[2])
    return check_bei(hqgzcPay1)
end
function hqgzcPay1()
    exe("give " .. cooking.money .. " silver to " .. job.id)
end
function hqgzcNoPay()
    return check_bei(hqgzcPay1)
end
function hqgzcAskMenu()
    return check_bei(hqgzcAskMenu1)
end
function hqgzcAskMenu1()
    exe("ask " .. job.id .. " about " .. job.menu)
end
function hqgzcTradeOK()
    EnableTriggerGroup("hqgzcTrade", false)
    exe("follow none")
    -- flag.idle = 0
    for key, value in pairs(cooking.target) do
        if job.target == value then
            cooking.flag[key] = nil
        end
    end
    return check_bei(hqgzcFind)
end
function hqgzcLost()
    EnableTriggerGroup("hqgzcTrade", false)
    exe("follow none")
    -- dis_all()
    return check_bei(hqgzcFind)
end
function hqgzcFangqiGo()
    go(hqgzcFangqi, "ؤ��", "��Ժ")
end
function hqgzcFangqi()
    exe("nick �����������")
    exe("unset no_kill_ap")
    dis_all()
    hqgzcTrigger()
    flag.idle = 0
    EnableTriggerGroup("hqgzcAccept", false)
    check_bei(hqgzcFangqiAsk)
end
function hqgzcFangqiAsk()
    EnableTriggerGroup("hqgzcAskFail", true)
    exe("ask hong qigong about ����")
end
function hqgzcBack()
    EnableTriggerGroup("hqgzcFind", false)
    check_halt(hqgzcBackGet)
end
function hqgzcBackGet()
    -- EnableTriggerGroup("hqgzcFinish",true)
    return go(hqgzcFinishWait, "ؤ��", "��Ժ")
end
function hqgzcFinishWait()
    if locl.id["���߹�"] then
        return hqgzcFinishC()
    else
        return go(hqgzcFinishWait, "ؤ��", "��Ժ")
    end
end
function hqgzcFinishC()
    EnableTriggerGroup("hqgzcFinish", true)
    check_bei(exe("zuo cai"))
end
function hqgzcFinishT()
    EnableTriggerGroup("hqgzcFinish", true)
    if hqgzcjl and hqgzcjl * 1 == 0 then
        create_trigger_t(
        "hqgzcFinish_exception_case1",
        "^(> )*���߹�˵�����������һ�����ָ�����书�ɡ���",
        "",
        "hqgzcFinish_AskGoldUnavaliableHandle"
        )
        SetTriggerOption("hqgzcFinish_exception_case1", "group", "hqgzcFinish_Exception")
        create_trigger_t("hqgzcFinish_exception_case2", "^(> )*����Ъ������˵���ɡ�", "", "hqgzcFinish_AskGold_ExceptionHandle")
        SetTriggerOption("hqgzcFinish_exception_case2", "group", "hqgzcFinish_Exception")
        EnableTriggerGroup("hqgzcFinish_Exception", true)
        check_bei(exe("ask hong qigong about �ƽ���"))
    else
        check_bei(exe("ask hong qigong about finish"))
    end
end
-- ���߹�����, Ҫ��ƽ���ʧ��,ֻ�ϸ�pot
function hqgzcFinish_AskGoldUnavaliableHandle()
    hqgzcFinish_Over10TimesHandle()
    hqgzcFinish_AskGold_ExceptionHandle()
end
-- ���߹����ϸ�gold, ˵�������Ѿ�������10����, д���¼
function hqgzcFinish_Over10TimesHandle()
    print("���պ��߹����񳬹�ʮ��,д���¼")
    local fn = "logs\\hqgzc_mark_" .. score.id .. ".log"
    local f = io.open(fn, "w")
    local s = os.date("%Y%m%d%H")
    f:write(s)
    f:close()
    hqgzcCnt = 0
end
-- ���߹�����, Ҫ�����ƽ������쳣�������
function hqgzcFinish_AskGold_ExceptionHandle()
    wait.make(
    function()
        wait.time(0.1)
        return exe("ask hong qigong about finish")
    end
    )
end
function hqgzcFinish(n, l, w)
    DeleteTriggerGroup("hqgzcFinish_Exception")
    EnableTriggerGroup("hqgzcFinish", false)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShow("����������ɣ���á�" .. w[2] .. "����Ǳ�ܣ�")
    messageShowT("��������������ɣ���ʱ:��" .. job.time.over .. "���롣")
    quest.desc = ""
    quest.update()
    job.zctime = 0
    flag.idle = 0
    dis_all()
    return check_halt(check_food)
end
function hqgzcFinishGold(n, l, w)
    DeleteTriggerGroup("hqgzcFinish_Exception")
    if GetRoleConfig("Auto_hqgzc_10times") then
        if not hqgzcCnt then
            hqgzcCnt = 0
        end
        job.last = "hqgzc"
        hqgzcCnt = hqgzcCnt + 1
        EnableTriggerGroup("hqgzcFinish", false)
        job.time.e = os.time()
        job.time.over = job.time.e - job.time.b
        messageShow("����������ɣ���á�" .. w[2] .. "�����ƽ�")
        messageShowT("��������������ɣ���ʱ:��" .. job.time.over .. "���롣")
        quest.desc = ""
        quest.update()
        if hqgzcCnt >= 10 then
            hqgzcFinish_Over10TimesHandle()
        end
        job.zctime = 0
        flag.idle = 0
        dis_all()
        return check_halt(check_food)
    else
        EnableTriggerGroup("hqgzcFinish", false)
        job.time.e = os.time()
        job.time.over = job.time.e - job.time.b
        messageShow("����������ɣ���á�" .. w[2] .. "�����ƽ�")
        messageShowT("��������������ɣ���ʱ:��" .. job.time.over .. "���롣")
        quest.desc = ""
        quest.update()
        job.zctime = 0
        flag.idle = 0
        dis_all()
    end
end
function hqgzcFinish1(n, l, w)
    DeleteTriggerGroup("hqgzcFinish_Exception")
    EnableTriggerGroup("hqgzcFinish", false)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShow("��������ʧ�ܣ�")
    messageShowT("������������ʧ�ܣ���ʱ:��" .. job.time.over .. "���롣")
    quest.desc = ""
    quest.update()
    job.zctime = 0
    flag.idle = 0
    dis_all()
    return check_halt(hqgzc)
end
