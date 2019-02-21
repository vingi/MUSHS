weaponPrepare = { }
weaponUsave = { }
itemWield = { }
weaponStore = {
    ["��"] = "city/yueqidian",
    ["ľ��"] = "xiangyang/mujiangpu",
    ["����"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["�ֵ�"] = "zhiye/bingqipu1",
    ["���Ǵ�"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["���"] = "zhiye/bingqipu1",
    ["�ָ�"] = "zhiye/bingqipu1",
    ["ذ��"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["ʯ��"] = "zhiye/bingqipu1",
    ["����"] = "zhiye/bingqipu1",
    ["÷����"] = "zhiye/bingqipu1",
    ["������"] = "zhiye/bingqipu1"
}

weaponStoreId = {
    ["��"] = "xiao",
    ["ľ��"] = "mu jian",
    ["����"] = "changjian",
    ["����"] = "tie bi",
    ["�ֵ�"] = "blade",
    ["���Ǵ�"] = "liuxing chui",
    ["����"] = "tiegun",
    ["����"] = "gangzhang",
    ["����"] = "changbian",
    ["���"] = "zhubang",
    ["�ָ�"] = "gang fu",
    ["ذ��"] = "bishou",
    ["����"] = "hook",
    ["ʯ��"] = "shizi",
    ["����"] = "dart",
    ["÷����"] = "meihua zhen",
    ["������"] = "shuriken"
}

weaponFunc = {
    ["���ƹŽ�"] = "if score.master and score.master=='������' then return true else return false end"
}
weaponFuncName = {
    ["���ƹŽ�"] = "weaponGetSwj"
}

weaponThrowing = {
    ["÷����"] = true,
    ["������"] = true,
    ["����"] = true,
    ["ͭǮ"] = true,
    ["ʯ��"] = true,
    ["˦��"] = true,
    ["������"] = true,
    ["�ɻ�ʯ"] = true
}

armorKind = {
    ["armor"] = true
}

weaponKind = {
    ["ren"] = "cut",
    ["blade"] = "cut",
    ["sword"] = "cut",
    ["stick"] = true,
    ["club"] = true,
    ["hammer"] = true,
    ["whip"] = true,
    ["axe"] = "cut",
    ["staff"] = true,
    ["brush"] = true,
    ["dagger"] = "cut",
    ["hook"] = "cut",
    ["spear"] = true,
    ["throwing"] = true,
    ["xiao"] = true,
    ["fork"] = true,
    ["dart"] = true
}

unarmedKind = {
    ["cuff"] = true,
    ["strike"] = true,
    ["finger"] = true,
    ["claw"] = true,
    ["hand"] = true,
    ["leg"] = true
}

function weaponSet()
    weaponPrepare = { }
    local t = { }
    for p in pairs(weaponStore) do
        t[p] = p
    end
    for p in pairs(Bag) do
        if Bag[p].kind then
            t[p] = p
        end
    end
    for p, q in pairs(weaponFunc) do
        if loadstring(q)() then
            t[p] = p
        end
    end
    if GetVariable("weaponprepare") then
        tmp.weapon = utils.split(GetVariable("weaponprepare"), "_")
        tmp.pre = { }
        for _, p in pairs(tmp.weapon) do
            tmp.pre[p] = true
        end
    end
    local l_tmp = utils.multilistbox("��׼��Ҫʹ�õ�������(�밴CTRL��ѡ)?", "����ѡ��", t, tmp.pre)
    local l_result = nil
    if type(l_tmp) == "table" then
        for p in pairs(l_tmp) do
            weaponPrepare[p] = true
            if l_result then
                l_result = l_result .. "_" .. p
            else
                l_result = p
            end
        end
    end
    if l_result then
        SetVariable("weaponprepare", l_result)
    else
        DeleteVariable("weaponprepare")
    end

    for p in pairs(t) do
        if not weaponPrepare[p] then
            t[p] = nil
        end
    end

    if countTab(t) > 1 then
        l_result = utils.listbox("������ʹ�õ�������", "��������", t, GetVariable("weaponfirst"))
        if l_result ~= nil then
            SetVariable("weaponfirst", l_result)
            weapon.first = l_result
        else
            weapon.first = nil
            DeleteVariable("weaponfirst")
        end
    end
end
function weaponGetVar()
    weaponPrepare = { }
    if GetVariable("weaponprepare") then
        tmp.weapon = utils.split(GetVariable("weaponprepare"), "_")
        for _, p in pairs(tmp.weapon) do
            weaponPrepare[p] = true
        end
    end
    if GetVariable("weaponfirst") then
        weapon.first = GetVariable("weaponfirst")
    else
        weapon.first = nil
    end
end
weaponInBag = function(p_kind)
    for p in pairs(Bag) do
        if Bag[p].kind and Bag[p].kind == p_kind then
            return true
        end
    end
    return false
end
function weapon_wield()
    --[[       if hp.neili<hp.neili_max*0.5 and cbb_cur>0 then
          exe('eat '.. drug.neili)
	   end                     ]]
    if perform and perform.skill and skillEnable[perform.skill] and weaponKind[skillEnable[perform.skill]] then
        if weapon.first and Bag[weapon.first] then
            exe("wield " .. Bag[weapon.first].fullid)
        end
        -- Ĭ��myweaponΪ��������
		if GetVariable("myweapon") and string.len(GetVariable("myweapon")) > 1 then
			exe("wield " .. GetVariable("myweapon"))
		end
        for p in pairs(Bag) do
            if Bag[p].kind and Bag[p].kind == skillEnable[perform.skill] and perform.skill ~= "yuxiao-jian" then
                if not weapon.first or weapon.first ~= p then
                    exe("wield " .. Bag[p].fullid)
                end
            end
            if Bag[p].kind and Bag[p].kind == "xiao" and perform.skill == "yuxiao-jian" then
                if not weapon.first or weapon.first ~= p then
                    exe("wield " .. Bag[p].fullid)
                end
            end
        end
    end
    checkWield()
end
function weaponWWalk()
    weapon_wield()
    return walk_wait()
end
function weapon_unwield()
    for p in pairs(Bag) do
        if Bag[p].kind and(not itemWield or itemWield[p]) then
            local _, l_cnt = isInBags(Bag[p].fullid)
            for i = 1, l_cnt do
                exe("unwield " .. Bag[p].fullid .. " " .. i)
            end
        end
    end

    -- ain
    -- exe("uweapon shape zhanlu sword")
    -- exe("unwield sword")
    -- exe("unwield changjian")
    -- exe("unwield dagger")
    -- exe("unwield whip")
    -- exe("unwield xiao")
    -- exe("unwield ansha bishou")
    -- exe("unwield shizi")
    -- exe("unwield coin")

    checkWield()
end
function weaponUnWalk()
    weapon_unwield()
    return walk_wait()
end
weaponWieldCut = function()
    if Bag["ľ��"] then
        exe("wield " .. Bag["ľ��"].fullid)
    else
        for p in pairs(Bag) do
            if Bag[p].kind and weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind] == "cut" then
                if not(Bag[p].kind == "xiao" and weaponUsave[p]) then
                    for q in pairs(Bag) do
                        if Bag[q].kind == "xiao" and weaponUsave[q] then
                            exe("unwield " .. Bag[q].fullid)
                        end
                    end
                    exe("wield " .. Bag[p].fullid)
                end
            end
        end
    end
    checkWield()
end
weaponUcheck = function()
    DeleteTriggerGroup("weapon")
    create_trigger_t("weapon1", '^(> )*��� "action" �趨Ϊ "checkUweapon" �ɹ���ɡ�', "", "weaponUdone")
    create_trigger_t(
    "weapon2",
    "^(> )*����һ(��)��\\D*(��ͭ|����|����|��ʯ|����ʯ|����|����|����|��������|���꺮����)�Ƴɣ���\\D*��(\\D*)��$",
    "",
    "weaponUtmp"
    )
    create_trigger_t("weapon3", "^(> )*������(��Ҫ����|�Ѿ�ʹ�ù�һ��ʱ��|���Ͼ�Ҫ��)�ˡ�", "", "weaponUneed")
    create_trigger_t("weapon4", "^(> )*������û��ʲô�𻵡�", "", "weaponUwell")
    SetTriggerOption("weapon1", "group", "weapon")
    SetTriggerOption("weapon2", "group", "weapon")
    SetTriggerOption("weapon3", "group", "weapon")
    SetTriggerOption("weapon4", "group", "weapon")
    weaponUcannt = weaponUcannt or { }
    tmp.uweapon = nil
    for p in pairs(weaponUsave) do
        if Bag[p] and Bag[p].kind and weaponKind[Bag[p].kind] and not weaponUcannt[p] then
            exe("l " .. Bag[p].fullid)
        end
    end
    exe("alias action checkUweapon")
end
weaponUtmp = function(n, l, w)
    if weaponUsave[w[4]] and Bag[w[4]] then
        tmp.uweapon = w[4]
    end
end
weaponUneed = function()
    if tmp.uweapon and weaponUsave[tmp.uweapon] then
        weaponUsave[tmp.uweapon] = "repair"
    end
end
weaponUwell = function()
    if tmp.uweapon and weaponUsave[tmp.uweapon] then
        weaponUsave[tmp.uweapon] = true
    end
end
weaponUdone = function()
    EnableTriggerGroup("weapon", false)
    for p in pairs(weaponUsave) do
        if weaponUsave[p] and type(weaponUsave[p]) == "string" and weaponUsave[p] == "repair" then
            dis_all()
            return weaponRepair(p)
        end
    end
    return check_bei(weaponRepairOver)
end
weaponRepair = function(p_weapon)
    tmp.uweapon = p_weapon
    if not Bag["����"] then
        cntr1 = countR(3)
        return go(weaponRepairQu, "���ݳ�", "�ӻ���")
    end
    return weaponRepairGo()
end
weaponRepairQu = function()
    exe("qu tiechui")
    checkBags()
    return check_bei(weaponRepairQuCheck, 1)
end
weaponRepairQuCheck = function()
    if cntr1() > 0 and not Bag["����"] then
        return weaponRepairQu()
    end
    if Bag["����"] then
        return weaponRepairGo()
    else
        return weaponRepairFind()
    end
end
weaponRepairFind = function()
    DeleteTriggerGroup("weaponFind")
    create_trigger_t("weaponFind1", "^(> )*\\s*�ɿ�ʦ��\\(Caikuang shifu\\)", "", "weaponRepairFollow")
    create_trigger_t("weaponFind2", "^(> )*����û�� caikuang shifu", "", "weaponRepairGoon")
    create_trigger_t("weaponFind3", "^(> )*���������\\D*һ���ж���", "", "weaponRepairBuy")
    create_trigger_t("weaponFind4", "^(> )*���Ѿ��������ˡ�", "", "weaponRepairBuy")
    SetTriggerOption("weaponFind1", "group", "weaponFind")
    SetTriggerOption("weaponFind2", "group", "weaponFind")
    SetTriggerOption("weaponFind3", "group", "weaponFind")
    SetTriggerOption("weaponFind4", "group", "weaponFind")
    EnableTriggerGroup("weaponFind", false)
    cntr1 = countR(20)
    job.name = "������"
    return go(weaponRepairFact, "���ݳ�", "������")
end
weaponRepairFact = function()
    EnableTriggerGroup("weaponFind", true)
    exe("look")
    return find()
end
weaponRepairFollow = function()
    flag.find = 1
    exe("follow caikuang shifu")
end
weaponRepairGoon = function()
    flag.wait = 0
    flag.find = 0
    return walk_wait()
end
weaponRepairBuy = function()
    EnableTriggerGroup("weaponFind", false)
    exe("buy tie chui")
    locate()
    checkBags()
    return checkWait(weaponRepairItem, 0.5)
end
weaponRepairItem = function()
    if cntr1() > 0 and not Bag["����"] then
        return weaponRepairBuy()
    end
    if not Bag["����"] then
        return weaponRepairGoCun()
    end
    return weaponRepairGo()
end
weaponRepairGo = function()
    return go(weaponRepairDo, "���ݳ�", "������")
end
function ungeta()
    local w_cmd = GetVariable("myweapon")
    local u_cmd = GetVariable("muweapon")
    local leweapon = GetVariable("learnweapon")
    if leweapon ~= nil then
        exe("unwield " .. leweapon)
    end
    if w_cmd ~= nil then
        exe("unwield " .. w_cmd)
    end
    if u_cmd ~= nil then
        exe("unwield " .. u_cmd)
    end
end
weaponRepairDo = function()
    DeleteTriggerGroup("repair")
    create_trigger_t("repair1", "^(> )*�㿪ʼ��ϸ��ά��(\\D*)����ʱ���������ô��", "", "")
    create_trigger_t("repair2", "^(> )*����ϸ��ά��(\\D*)��������»ָ�������ԭò��$", "", "weaponRepairGoCun")
    create_trigger_t("repair3", "^(> )*����������������������$", "", "weaponRepairGoCun")
    create_trigger_t("repair4", "^(> )*�����������������˽ⲻ�࣬�޷�����$", "", "weaponRepairCannt")
    create_trigger_t("repair5", "^(> )*�������Ǯ�����ˣ�����Ҫ", "", "weaponRepairGold")
    create_trigger_t("repair6", "^(> )*��ľ���״̬����$", "", "weaponRepairCannt")
    SetTriggerOption("repair1", "group", "repair")
    SetTriggerOption("repair2", "group", "repair")
    SetTriggerOption("repair3", "group", "repair")
    SetTriggerOption("repair4", "group", "repair")
    SetTriggerOption("repair5", "group", "repair")
    SetTriggerOption("repair6", "group", "repair")
    weapon_unwield()
    ungeta()
    exe("wield tie chui")
    exe("repair " .. Bag[tmp.uweapon].fullid)
    create_timer_m("repair", 3, "weaponRepairGoCun")
end
function weaponRepairCannt()
    weaponUcannt = weaponUcannt or { }
    return weaponRepairGoCun()
end
function weaponRepairGold()
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    exe("n;#3w;#3n;w;qu 50 gold;e;#3s;#3e;s")
    return checkWait(weaponRepairDo, 2)
end
weaponRepairOver = function()
    DeleteTriggerGroup("weapon")
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    DeleteTimer("repair")
    DeleteTriggerGroup("repair")
    return armorUcheck()
    -- return check_halt(check_jobx)
end
weaponRepairGoCun = function()
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    cntr2 = countR(3)
    exe("unwield tie chui")
    return go(weaponRepairCun, "���ݳ�", "�ӻ���")
end
weaponRepairCun = function()
    if not Bag["����"] then
        return check_heal()
    end
    if cntr2() > 0 and Bag["����"] then
        weapon_unwield()
        exe("cun tie chui")
        checkBags()
        return check_busy(weaponRepairCun, 1)
    end
    return weaponRepairOver()
end
weaponGetSwj = function()
    return go(swjAsk, "�䵱ɽ", "��ɽСԺ")
end
function swjAsk()
    if locl.room ~= "��ɽСԺ" or not locl.id["������"] then
        return weaponGetSwj()
    end
    exe("ask zhang sanfeng about ��ɽ")
    wait.make(
    function()
        wait.time(3)
        exe("ask zhang sanfeng about �̻�")
        checkBags()
        return check_bei(swjOver)
    end
    )
end
function swjOver()
    return checkPrepare()
end
armorUdone = function()
    for p in pairs(weaponUsave) do
        if weaponUsave[p] and type(weaponUsave[p]) == "string" and weaponUsave[p] == "repair" then
            dis_all()
            return armorRepair(p)
        end
    end
    return check_bei(armorRepairOver)
end
armorUtmp = function(n, l, w)
    if weaponUsave[w[3]] and Bag[w[3]] then
        tmp.uarmor = w[3]
    end
end
armorUwell = function()
    if tmp.uarmor and weaponUsave[tmp.uarmor] then
        weaponUsave[tmp.uarmor] = true
    end
end
armorUcheck = function()
    DeleteTriggerGroup("armor")
    create_trigger_t("armor1", '^(> )*��� "action" �趨Ϊ "checkUarmor" �ɹ���ɡ�', "", "armorUdone")
    create_trigger_t("armor2", "^(> )*������\\D*(�޻�|����|����|����|��˿|ľ�޻�|���˿|����˿|���˿|�����˿)�Ƴɣ���\\D*��(\\D*)��$", "", "armorUtmp")
    create_trigger_t("armor3", "^(> )*������(��Ҫ����|�Ѿ�ʹ�ù�һ��ʱ��|���Ͼ�Ҫ��)�ˡ�", "", "armorUneed")
    create_trigger_t("armor4", "^(> )*������û��ʲô�𻵡�", "", "armorUwell")
    SetTriggerOption("armor1", "group", "armor")
    SetTriggerOption("armor2", "group", "armor")
    SetTriggerOption("armor3", "group", "armor")
    SetTriggerOption("armor4", "group", "armor")
    armorUcannt = armorUcannt or { }
    tmp.uarmor = nil
    for p in pairs(weaponUsave) do
        if Bag[p] and Bag[p].kind and armorKind[Bag[p].kind] and not armorUcannt[p] then
            exe("l " .. Bag[p].fullid)
        end
    end
    exe("alias action checkUarmor")
end
armorUneed = function()
    if tmp.uarmor and weaponUsave[tmp.uarmor] then
        weaponUsave[tmp.uarmor] = "repair"
    end
end
function armorRepairGold()
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    exe("e;#3s;w;qu 50 gold;e;#3n;w")
    return checkWait(armorRepairDo, 2)
end
armorRepairDo = function()
    DeleteTriggerGroup("repair")
    create_trigger_t("repair1", "^(> )*�㿪ʼ��ϸ���޲�(\\D*)����ʱ�ü������زü�������", "", "")
    create_trigger_t("repair2", "^(> )*����ϸ���޲�(\\D*)��������»ָ�������ԭò��$", "", "armorRepairGoCun")
    create_trigger_t("repair3", "^(> )*�������������������޲���$", "", "armorRepairGoCun")
    create_trigger_t("repair4", "^(> )*�������ַ��ߣ����˽ⲻ�࣬�޷��޲���$", "", "armorRepairCannt")
    create_trigger_t("repair5", "^(> )*�������Ǯ�����ˣ�����Ҫ", "", "armorRepairGold")
    create_trigger_t("repair6", "^(> )*�����ھ���״̬���ѣ����ǵȻ����޲��ɡ�$", "", "armorRepairCannt")
    SetTriggerOption("repair1", "group", "repair")
    SetTriggerOption("repair2", "group", "repair")
    SetTriggerOption("repair3", "group", "repair")
    SetTriggerOption("repair4", "group", "repair")
    SetTriggerOption("repair5", "group", "repair")
    SetTriggerOption("repair6", "group", "repair")
    ungeta()
    exe("unwield sanqing sword;unwield xuanyuan axe;unwield xuanyuan axe;unwield fengyun whip;unwield qiankun sword")
    exe("wield jian dao")
    exe("repair " .. Bag[tmp.uarmor].fullid)
    create_timer_m("repair", 3, "armorRepairGoCun")
end
armorRepairQu = function()
    exe("qu jian dao")
    checkBags()
    return check_bei(armorRepairQuCheck, 1)
end
armorRepairQuCheck = function()
    if cntr1() > 0 and not Bag["����"] then
        return armorRepairQu()
    end
    if Bag["����"] then
        return armorRepairGo()
    else
        return armorRepairFind()
    end
end
armorRepairFollow = function()
    flag.find = 1
    exe("follow yangcan popo")
end
armorRepairFind = function()
    DeleteTriggerGroup("armorFind")
    create_trigger_t("armorFind1", "^(> )*\\s*��������\\(Yangcan popo\\)", "", "armorRepairFollow")
    create_trigger_t("armorFind2", "^(> )*����û�� yangcan popo", "", "armorRepairGoon")
    create_trigger_t("armorFind3", "^(> )*���������\\D*һ���ж���", "", "armorRepairBuy")
    create_trigger_t("armorFind4", "^(> )*���Ѿ��������ˡ�", "", "armorRepairBuy")
    SetTriggerOption("armorFind1", "group", "armorFind")
    SetTriggerOption("armorFind2", "group", "armorFind")
    SetTriggerOption("armorFind3", "group", "armorFind")
    SetTriggerOption("armorFind4", "group", "armorFind")
    EnableTriggerGroup("armorFind", false)
    cntr1 = countR(20)
    job.name = "�����"
    return go(armorRepairFact, "changan/northjie2")
end
armorRepairFact = function()
    EnableTriggerGroup("armorFind", true)
    exe("look")
    return find()
end
armorRepairBuy = function()
    EnableTriggerGroup("armorFind", false)
    exe("buy jian dao")
    locate()
    checkBags()
    return checkWait(armorRepairItem, 0.5)
end
armorRepairItem = function()
    if cntr1() > 0 and not Bag["����"] then
        return armorRepairBuy()
    end
    if not Bag["����"] then
        return armorRepairGoCun()
    end
    return armorRepairGo()
end
armorRepairGo = function()
    return go(armorRepairDo, "������", "�÷���")
end
armorRepairGoon = function()
    flag.wait = 0
    flag.find = 0
    return walk_wait()
end
armorRepair = function(p_armor)
    tmp.uarmor = p_armor
    if not Bag["����"] then
        cntr1 = countR(3)
        return go(armorRepairQu, "���ݳ�", "�ӻ���")
    end
    return armorRepairGo()
end
function armorRepairCannt()
    armorUcannt = armorUcannt or { }
    return armorRepairGoCun()
end
armorRepairGoCun = function()
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    cntr2 = countR(3)
    exe("unwield jian dao")
    return go(armorRepairCun, "���ݳ�", "�ӻ���")
end
armorRepairCun = function()
    exe("unwield jian dao")
    if not Bag["����"] then
        return check_heal()
    end
    if cntr2() > 0 and Bag["����"] then
        exe("cun jian dao")
        checkBags()
        return check_busy(armorRepairCun, 1)
    end
    return armorRepairOver()
end
armorRepairOver = function()
    DeleteTriggerGroup("armor")
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    DeleteTimer("repair")
    DeleteTriggerGroup("repair")
    return check_halt(check_jobx)
end
