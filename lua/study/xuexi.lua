--
-- study.lua
--
-- ----------------------------------------------------------
-- �� ѧϰ ����function ���� (����literate)
-- ----------------------------------------------------------
--
--[[

eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
-- ���ѧϰ����
local learntime_max = 50
-- ��Сѧϰ����
local learnTime_min = 10

function xuexiTrigger()
    DeleteTriggerGroup("xuexi")
    if score.master then
        create_trigger_t("xuexi1", "^(> )*��(\\D*)" .. score.master .. "(\\D*)ָ��", "", "xuexiAction")
        SetTriggerOption("xuexi1", "group", "xuexi")
    end
    create_trigger_t("xuexi2", "^(> )*��������æ���ء�", "", "xuexiAction")
    create_trigger_t("xuexi3", "^(> )*�����̫���ˣ����ʲôҲû��ѧ����", "", "xuexiSleep")
    create_trigger_t(
    "xuexi4",
    "^(> )*(������|�㲻����ѧϰ��ϲ����|����ѧ|�㲻����ѧϰ|��Ļ��������δ��|�㲻�������|���̫��ȭ���̫ǳ|������Ѩ���˻Ƶ����Ҵ���ѧ|������Ѩ���˶�������ʦ������ѧ|������ԣ��޷�|���\\D*(����|����|��)����|��ɽ������ô�ݵ�|��һ������ү��|���Ѿ��޷����|��Ļ�������̫��|���а��̫��|�����һ���|��ת����ֻ��ͨ�����������|ѧ��ֻ��ѧ��������|����������ʿ|ֻ�д����֮��|�㲻������������|�㲻����ѧϰ����ѧ|����ѧֻ�ܿ��ж�|��Ķ���д��|��������ֻ��ͨ����ϰҽѧ|��Ļ��������δ��|���ŷ�ɮ������|�������ֻ��ͨ������ѧϰ��ʵս|��������Ѿ��޷�ͨ��ѧϰ|���������±����ұ���ѧ��|�����ȥѧ��ѧϰ����д��|Ҳ����ȱ��ʵս����|���(��˷�|�����ķ�)��Ϊ����|�������ĳ̶��Ѿ�������ʦ��)",
    "",
    "xuexiNext"
    )
    create_trigger_t("xuexi5", "^(> )*��û����ô��Ǳ����ѧϰ", "", "xuexiFinish")
    create_trigger_t("xuexi6", "^(> )*��Ҫ��˭��̣�", "", "xuexiFinish")
    create_trigger_t("xuexi7", "^(> )*��ġ�(\\D*)�������ˣ�", "", "xuexiLvlUp")
    create_trigger_t("xuexi8", "^(> )*����ö�̫��ȭ���������", "", "xueAskzhang")
    create_trigger_t("xuexi9", "^(> )*Ǭ����Ų��ֻ��ͨ����ϰ��Ǭ����Ų���ķ��������������", "", "taoJiaozhang")
    create_trigger_t(
    "xuexi10",
    "^(> )*(�������б���|�����ֲ�����|���ַ�����ϰ|���������|����ʱ�޷���|��ʹ�õ���������|��\\D*����|ѧ\\D*����|\\D*���ﲻ����������)",
    "",
    "xueWeapon"
    )

    SetTriggerOption("xuexi2", "group", "xuexi")
    SetTriggerOption("xuexi3", "group", "xuexi")
    SetTriggerOption("xuexi4", "group", "xuexi")
    SetTriggerOption("xuexi5", "group", "xuexi")
    SetTriggerOption("xuexi6", "group", "xuexi")
    SetTriggerOption("xuexi7", "group", "xuexi")
    SetTriggerOption("xuexi8", "group", "xuexi")
    SetTriggerOption("xuexi9", "group", "xuexi")
    SetTriggerOption("xuexi10", "group", "xuexi")
    EnableTriggerGroup("xuexi", false)
end

function checkxue()
    if xuefull == 0 then
        return xuexi()
    end
    if xxpot < hp.pot_max then
        return xuexi()
    end
    return check_job()
end

function xuexi()
    exe("nick ������ѧϰ;i;")
    quest.name = "������ѧϰ"
    quest.status = ""
    quest.target = ""
    quest.location = "������"
    quest.desc = ""
    quest.note = ""
    quest.update()
    messageShow("������ѧϰ")
    master = { }
    if hp.exp < 150000 then
        master.times = 10
    else
        -- ain usepot
        master.times = math.modf(hp.jingxue / 60)
        master.times = common.GetValueByRange(master.times, learnTime_min, learntime_max)
    end
    master.skills = { }
    master.skills = utils.split(GetVariable("xuexiskill"), "|")
    flag.times = 1
    return check_halt(xuexiParty)
end

function xuexiParty()
    xuexiTrigger()
    if score.master then
        master.area = locateroom(score.master)
        if master.area then
            return go(xuexiCheck, master.area, master.room)
        else
            ColourNote("white", "blue", "δ�ҵ�ʦ��סַ������ϵPTBX���£�")
            return xuexiFinish()
        end
    else
        return xuexiFinish()
    end
end

function xuexiCheck()
    checkWield()
    if locl.id[score.master] then
        if score.party and score.party == "������" and score.master == "������ɮ" and skills["buddhism"] and
            skills["buddhism"].lvl == 200
        then
            exe("ask wuming about ��")
        end
        return check_bei(xuexiStart)
    else
        ColourNote("white", "blue", "ʦ�����ڼң�������ֵ�ַ�д�����ϵPTBX���£�")
        return xuexiFinish()
    end
end

function xuexiStart()
    EnableTriggerGroup("xuexi", true)
    tmp.xuexi = 1

    if master.id and locl.item and locl.item[score.master] and not locl.item[score.master][master.id] then
        master.id = nil
    end
    if not master.id and locl.item and locl.item[score.master] then
        master.id = locl.item[score.master]
        for p in pairs(locl.item[score.master]) do
            if not string.find(p, " ") then
                master.id = p
            end
        end
    end
    exe("bai " .. master.id)

    weapon_unwield()

    if l_skill and weaponKind[l_skill] then
        if master.skills[tmp.xuexi] == "yuxiao-jian" then
            l_skill = "xiao"
        end
        for p in pairs(Bag) do
            if Bag[p].kind and Bag[p].kind == l_skill then
                exe("wield " .. Bag[p].fullid)
            end
        end
    end
    yunAddInt()
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)
    return xuexiContinue()
end

function xuexiAction()
    EnableTriggerGroup("xuexi", false)
    if hp.exp > 2000000 and hp.neili < 300 then
        prepare_neili(xuexiContinue)
    else
        check_bei(xuexiContinue)
    end
end

function xuexiContinue()
    flag.idle = nil
    xuefull = 0
    if hp.neili < 1000 and hqd_cur > 0 then
        exe('eat huangqi dan')
    end
    if hp.neili < 600 and nxw_cur > 0 then
        exe("eat chuanbei wan")
    end
    EnableTriggerGroup("xuexi", true)
    wait.make(
    function()
        wait.time(0.4)
        exe("yun jing;xue " .. master.id .. " " .. master.skills[tmp.xuexi] .. " " .. master.times)
    end
    )
    print("ѧϰ����:" .. master.times)
    exe("hp")
end

function taoJiaozhang()
    EnableTriggerGroup("xuexi", false)
    print("��С��Ǭ����Ų��")
    wait.make(
    function()
        wait.time(1)
        exe("#5 taojiao qiankundanuoyi;yun jing")
    end
    )
    check_busy(xuexiContinue)
end

function xueAskzhang()
    EnableTriggerGroup("xuexi", false)
    print("������̫��ȭ��")
    wait.make(
    function()
        wait.time(1)
        exe("ask zhang about ̫��ȭ��")
    end
    )
    check_busy(xuexiContinue)
end

function xueWeapon()
    EnableTriggerGroup("xuexi", false)
    tmp.skill = master.skills[tmp.xuexi]
    if skills[tmp.skill] then
        if skills[tmp.skill].lvl >= 450 then
            skills[tmp.skill].mstlvl = 450
        else
            skills[tmp.skill].mstlvl = skills[tmp.skill].lvl
        end
    end
    local l_skill = skillEnable[master.skills[tmp.xuexi]]
    weapon_unwield()
    if l_skill and weaponKind[l_skill] then
        for p in pairs(Bag) do
            if Bag[p].kind and Bag[p].kind == l_skill then
                exe("wield " .. Bag[p].fullid)
            end
        end
        checkWield()
    end
    return check_bei(xuexiContinue)
end

function xuexiNext()
    EnableTriggerGroup("xuexi", false)
    tmp.skill = master.skills[tmp.xuexi]
    if skills[tmp.skill] then
        if skills[tmp.skill].lvl >= 450 then
            skills[tmp.skill].mstlvl = 450
        else
            skills[tmp.skill].mstlvl = skills[tmp.skill].lvl
        end
    end
    tmp.xuexi = tmp.xuexi + 1
    if tmp.xuexi > table.getn(master.skills) then
        xxpot = hp.pot_max
        xuefull = 1
        return xuexiFinish()
    end
    local l_skill = skillEnable[master.skills[tmp.xuexi]]
    weapon_unwield()
    if l_skill and weaponKind[l_skill] then
        if master.skills[tmp.xuexi] == "yuxiao-jian" then
            l_skill = "xiao"
        end
        for p in pairs(Bag) do
            if Bag[p].kind and Bag[p].kind == l_skill then
                exe("wield " .. Bag[p].fullid)
            end
        end
        checkWield()
    end
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)
    return check_bei(xuexiContinue)
end

function xuexiLvlUp(n, l, w)
    for p in pairs(skills) do
        if skills[p].name == w[2] then
            skills[p].mstlvl = nil
            break
        end
    end
end

function xuexiSleep()
    EnableTriggerGroup("xuexi", false)
    if score.party and score.party == "������" then
        return go(xuexiSleepOver, "������", "����")
    end
    if score.party and score.party == "������" then
        return go(xuexiSleepOver, "shaolin/sengshe3", "")
    end
    if score.party and score.party == "�һ���" then
        if score.master and score.master == "��ҩʦ" then
            return go(xuexiSleepOver, "�һ���", "�ͷ�")
        else
            return go(xuexiSleepOver, "����ׯ", "�ͷ�")
        end
    end
    if score.master and score.master == "���" then
        return go(xuexiSleepOver, "gumu/jqg/wshi", "")
    end
    if score.master and score.master == "С��Ů" then
        return go(xuexiSleepOver, "gumu/jqg/wshi", "")
    end
    if score.party and score.party == "�䵱��" and score.gender == "Ů" then
        return go(xuexiSleepOver, "�䵱ɽ", "Ů��Ϣ��")
    end
    if score.party and score.party == "�䵱��" and score.gender == "��" then
        return go(xuexiSleepOver, "�䵱ɽ", "����Ϣ��")
    end
    if score.party and score.party == "������" then
        return go(xuexiSleepOver, "dali/wangfu/woshi2", "")
    end
    if score.party and score.party == "����Ľ��" then
        return go(xuexiSleepOver, "����Ľ��", "�᷿")
    end
    if score.party and score.party == "������" then
        return go(xxSleepcheck, "���޺�", "��ң��")
    end
    if score.party and score.party == "������" then
        return go(xuexiSleepOver, "����ɽ", "��Ϣ��")
    end
    if score.party and score.party == "��ɽ��" and score.gender == "��" then
        return go(xuexiSleepOver, "��ɽ", "����Ϣ��")
    end
    if score.party and score.party == "��ɽ��" and score.gender == "Ů" then
        return go(xuexiSleepOver, "��ɽ", "Ů��Ϣ��")
    end
    if score.party and score.party == "���ư�" and score.gender == "��" then
        return go(xuexiSleepOver, "����ɽ", "����Ϣ��")
    end
    if score.party and score.party == "���ư�" and score.gender == "Ů" then
        return go(xuexiSleepOver, "����ɽ", "Ů��Ϣ��")
    end
    if score.party and score.party == "��ɽ��" and score.gender == "��" then
        return go(xuexiSleepOver, "songshan/nan-room", "")
    end
    if score.party and score.party == "��ɽ��" and score.gender == "Ů" then
        return go(xuexiSleepOver, "songshan/nv-room", "")
    end
    return xuexiFinish()
end

function xuexiSleepOver()
    exe("sleep")
    checkWait(xuexiParty, 3)
end

function xuexiFinish()
    messageShow("ѧϰ��ϣ�")
    flag.xuexi = 0
    EnableTriggerGroup("xuexi", false)
    DeleteTriggerGroup("xuexi")
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("cha;unwield " .. leweapon)
    dis_all()
    return check_busy(check_food)
end
