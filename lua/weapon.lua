Weapon = {}
weaponPrepare = {}
weaponUsave = {}
itemWield = {}
weaponStore = {
    ["箫"] = "city/yueqidian",
    ["木剑"] = "xiangyang/mujiangpu",
    ["长剑"] = "zhiye/bingqipu1",
    ["铁笔"] = "zhiye/bingqipu1",
    ["钢刀"] = "zhiye/bingqipu1",
    ["流星锤"] = "zhiye/bingqipu1",
    ["铁棍"] = "zhiye/bingqipu1",
    ["钢杖"] = "zhiye/bingqipu1",
    ["长鞭"] = "zhiye/bingqipu1",
    ["竹棒"] = "zhiye/bingqipu1",
    ["钢斧"] = "zhiye/bingqipu1",
    ["匕首"] = "zhiye/bingqipu1",
    ["单钩"] = "zhiye/bingqipu1",
    ["石子"] = "zhiye/bingqipu1",
    ["飞镖"] = "zhiye/bingqipu1",
    ["梅花针"] = "zhiye/bingqipu1",
    ["手裏剑"] = "zhiye/bingqipu1"
}

weaponStoreId = {
    ["箫"] = "xiao",
    ["木剑"] = "mu jian",
    ["长剑"] = "changjian",
    ["铁笔"] = "tie bi",
    ["钢刀"] = "blade",
    ["流星锤"] = "liuxing chui",
    ["铁棍"] = "tiegun",
    ["钢杖"] = "gangzhang",
    ["长鞭"] = "changbian",
    ["竹棒"] = "zhubang",
    ["钢斧"] = "gang fu",
    ["匕首"] = "bishou",
    ["单钩"] = "hook",
    ["石子"] = "shizi",
    ["飞镖"] = "dart",
    ["梅花针"] = "meihua zhen",
    ["手裏剑"] = "shuriken"
}

weaponFunc = {
    ["松纹古剑"] = "if score.master and score.master=='张三丰' then return true else return false end"
}
weaponFuncName = {
    ["松纹古剑"] = "weaponGetSwj"
}

weaponThrowing = {
    ["梅花针"] = true,
    ["手裏剑"] = true,
    ["飞镖"] = true,
    ["铜钱"] = true,
    ["石子"] = true,
    ["甩箭"] = true,
    ["神龙镖"] = true,
    ["飞蝗石"] = true
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

-- ---------------------------------------------------------------
-- 装备回内力武器, 前提是在之前的命令已经执行过 i 命令, 获得身上最新的装备着的武器信息
-- ---------------------------------------------------------------
function Weapon.RecoverNeili(force)
    if force and FindRoleFunction("Wield_RecoverWeapon") then
        GetRoleFunction("Wield_RecoverWeapon")
    else
        -- 是否已经装备回内武器
        local recoverwield = GetRoleConfig("RecoverWeapon")
        if recoverwield ~= nil and string.len(recoverwield) > 0 then
            if itemWield[GetItemChineseInBagByFullID(recoverwield)] ~= true then
                weapon_unwield()
                exe("wield " .. recoverwield)
            end
        end
    end
end

function weaponSet()
    weaponPrepare = {}
    local t = {}
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
        tmp.pre = {}
        for _, p in pairs(tmp.weapon) do
            tmp.pre[p] = true
        end
    end
    local l_tmp = utils.multilistbox("你准备要使用的武器有(请按CTRL多选)?", "武器选择", t, tmp.pre)
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
        l_result = utils.listbox("你优先使用的武器：", "优先武器", t, GetVariable("weaponfirst"))
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
    weaponPrepare = {}
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
function weaponInBag(p_kind)
    for p in pairs(Bag) do
        if Bag[p].kind and Bag[p].kind == p_kind then
            return true
        end
    end
    return false
end
-- ---------------------------------------------------------------
-- 重置,并重新检查包含里所有装备中的装备
-- ---------------------------------------------------------------
function checkWield()
    itemWield = {}
    exe("i")
end
function checkWieldCatch(n, l, w)
    itemWield = itemWield or {}
    local l_item = w[1]
    for p in pairs(weaponThrowing) do
        if string.find(l_item, p) then
            l_item = p
        end
    end
    itemWield[l_item] = true
end
-- ---------------------------------------------------------------
-- 装备所有武器
-- ---------------------------------------------------------------
function weapon_wield()
    -- 优先装备回内武器
    local recoverwield = GetRoleConfig("RecoverWeapon")
    if recoverwield ~= nil and string.len(recoverwield) > 0 then
        exe("wield " .. recoverwield)
    end
    if perform and perform.skill and skillEnable[perform.skill] and weaponKind[skillEnable[perform.skill]] then
        if weapon.first and Bag[weapon.first] then
            exe("wield " .. Bag[weapon.first].fullid)
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
-- ---------------------------------------------------------------
-- 卸下所有武器
-- ---------------------------------------------------------------
function weapon_unwield()
    for p in pairs(Bag) do
        if Bag[p].kind and (not itemWield or itemWield[p]) then
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
function weaponWWalk()
    weapon_wield()
    return walk_wait()
end

function weaponUnWalk()
    weapon_unwield()
    return walk_wait()
end

weaponWieldCut = function()
    if Bag["木剑"] then
        exe("wield " .. Bag["木剑"].fullid)
    else
        for p in pairs(Bag) do
            if Bag[p].kind and weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind] == "cut" then
                if not (Bag[p].kind == "xiao" and weaponUsave[p]) then
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
    create_trigger_t("weapon1", '^(> )*你把 "action" 设定为 "checkUweapon" 成功完成。', "", "weaponUdone")
    create_trigger_t(
        "weapon2",
        "^(> )*这是一(柄)由\\D*(青铜|生铁|软铁|绿石|流花石|软银|金铁|玄铁|万年神铁|万年寒冰铁)制成，重\\D*的(\\D*)。$",
        "",
        "weaponUtmp"
    )
    create_trigger_t("weapon3", "^(> )*看起来(需要修理|已经使用过一段时间|马上就要坏)了。", "", "weaponUneed")
    create_trigger_t("weapon4", "^(> )*看起来没有什么损坏。", "", "weaponUwell")
    SetTriggerOption("weapon1", "group", "weapon")
    SetTriggerOption("weapon2", "group", "weapon")
    SetTriggerOption("weapon3", "group", "weapon")
    SetTriggerOption("weapon4", "group", "weapon")
    weaponUcannt = weaponUcannt or {}
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
    if not Bag["铁锤"] then
        cntr1 = countR(3)
        return go(weaponRepairQu, "扬州城", "杂货铺")
    end
    return weaponRepairGo()
end
weaponRepairQu = function()
    exe("qu tiechui;i")
    checkBags()
    return check_bei(weaponRepairQuCheck, 1)
end
weaponRepairQuCheck = function()
    if cntr1() > 0 and not Bag["铁锤"] then
        return weaponRepairQu()
    end
    if Bag["铁锤"] then
        return weaponRepairGo()
    else
        return weaponRepairFind()
    end
end
-- ---------------------------------------------------------------
-- 从采矿师傅 那里找铁锤
-- ---------------------------------------------------------------
function Weapon.GetTiechui()
    weaponRepairFind()
end
weaponRepairFind = function()
    DeleteTriggerGroup("weaponFind")
    create_trigger_t("weaponFind1", "^(> )*\\s*采矿师傅\\(Caikuang shifu\\)", "", "weaponRepairFollow")
    create_trigger_t("weaponFind2", "^(> )*这里没有 caikuang shifu", "", "weaponRepairGoon")
    create_trigger_t("weaponFind3", "^(> )*你决定跟随\\D*一起行动。", "", "weaponRepairBuy")
    create_trigger_t("weaponFind4", "^(> )*你已经这样做了。", "", "weaponRepairBuy")
    SetTriggerOption("weaponFind1", "group", "weaponFind")
    SetTriggerOption("weaponFind2", "group", "weaponFind")
    SetTriggerOption("weaponFind3", "group", "weaponFind")
    SetTriggerOption("weaponFind4", "group", "weaponFind")
    EnableTriggerGroup("weaponFind", false)
    cntr1 = countR(20)
    job.name = "买铁锤"
    return go(weaponRepairFact, "扬州城", "打铁铺")
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
    if cntr1() > 0 and not Bag["铁锤"] then
        return weaponRepairBuy()
    end
    if not Bag["铁锤"] then
        return weaponRepairGoCun()
    end
    return weaponRepairGo()
end
weaponRepairGo = function()
    return go(weaponRepairDo, "扬州城", "兵器铺")
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
    create_trigger_t("repair1", "^(> )*你开始仔细的维修(\\D*)，不时用铁锤敲敲打打", "", "")
    create_trigger_t("repair2", "^(> )*你仔细的维修(\\D*)，总算大致恢复了它的原貌。$", "", "weaponRepairGoCun")
    create_trigger_t("repair3", "^(> )*这件兵器完好无损，无需修理。$", "", "weaponRepairGoCun")
    create_trigger_t("repair4", "^(> )*对于这种武器，您了解不多，无法修理！$", "", "weaponRepairCannt")
    create_trigger_t("repair5", "^(> )*你带的零钱不够了！你需要", "", "weaponRepairGold")
    create_trigger_t("repair6", "^(> )*你的精神状态不佳$", "", "weaponRepairCannt")
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
    weaponUcannt = weaponUcannt or {}
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
    return go(weaponRepairCun, "扬州城", "杂货铺")
end
weaponRepairCun = function()
    if not Bag["铁锤"] then
        return check_heal()
    end
    if cntr2() > 0 and Bag["铁锤"] then
        weapon_unwield()
        exe("cun tie chui")
        checkBags()
        return check_busy(weaponRepairCun, 1)
    end
    return weaponRepairOver()
end
weaponGetSwj = function()
    return go(swjAsk, "武当山", "后山小院")
end
function swjAsk()
    if locl.room ~= "后山小院" or not locl.id["张三丰"] then
        return weaponGetSwj()
    end
    exe("ask zhang sanfeng about 下山")
    wait.make(
        function()
            wait.time(3)
            exe("ask zhang sanfeng about 教诲")
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
    create_trigger_t("armor1", '^(> )*你把 "action" 设定为 "checkUarmor" 成功完成。', "", "armorUdone")
    create_trigger_t("armor2", "^(> )*这是由\\D*(棉花|亚麻|大麻|苎麻|蚕丝|木棉花|玉蚕丝|冰蚕丝|天蚕丝|龙茧蚕丝)制成，重\\D*的(\\D*)。$", "", "armorUtmp")
    create_trigger_t("armor3", "^(> )*看起来(需要修理|已经使用过一段时间|马上就要坏)了。", "", "armorUneed")
    create_trigger_t("armor4", "^(> )*看起来没有什么损坏。", "", "armorUwell")
    SetTriggerOption("armor1", "group", "armor")
    SetTriggerOption("armor2", "group", "armor")
    SetTriggerOption("armor3", "group", "armor")
    SetTriggerOption("armor4", "group", "armor")
    armorUcannt = armorUcannt or {}
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
    create_trigger_t("repair1", "^(> )*你开始仔细的修补(\\D*)，不时用剪刀来回裁剪缝纫着", "", "")
    create_trigger_t("repair2", "^(> )*你仔细的修补(\\D*)，总算大致恢复了它的原貌。$", "", "armorRepairGoCun")
    create_trigger_t("repair3", "^(> )*这件防具完好无损，无需修补。$", "", "armorRepairGoCun")
    create_trigger_t("repair4", "^(> )*对于这种防具，您了解不多，无法修补！$", "", "armorRepairCannt")
    create_trigger_t("repair5", "^(> )*你带的零钱不够了！你需要", "", "armorRepairGold")
    create_trigger_t("repair6", "^(> )*你现在精神状态不佳，还是等会再修补吧。$", "", "armorRepairCannt")
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
    if cntr1() > 0 and not Bag["剪刀"] then
        return armorRepairQu()
    end
    if Bag["剪刀"] then
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
    create_trigger_t("armorFind1", "^(> )*\\s*养蚕婆婆\\(Yangcan popo\\)", "", "armorRepairFollow")
    create_trigger_t("armorFind2", "^(> )*这里没有 yangcan popo", "", "armorRepairGoon")
    create_trigger_t("armorFind3", "^(> )*你决定跟随\\D*一起行动。", "", "armorRepairBuy")
    create_trigger_t("armorFind4", "^(> )*你已经这样做了。", "", "armorRepairBuy")
    SetTriggerOption("armorFind1", "group", "armorFind")
    SetTriggerOption("armorFind2", "group", "armorFind")
    SetTriggerOption("armorFind3", "group", "armorFind")
    SetTriggerOption("armorFind4", "group", "armorFind")
    EnableTriggerGroup("armorFind", false)
    cntr1 = countR(20)
    job.name = "买剪刀"
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
    if cntr1() > 0 and not Bag["剪刀"] then
        return armorRepairBuy()
    end
    if not Bag["剪刀"] then
        return armorRepairGoCun()
    end
    return armorRepairGo()
end
armorRepairGo = function()
    return go(armorRepairDo, "长安城", "裁缝铺")
end
armorRepairGoon = function()
    flag.wait = 0
    flag.find = 0
    return walk_wait()
end
armorRepair = function(p_armor)
    tmp.uarmor = p_armor
    if not Bag["剪刀"] then
        cntr1 = countR(3)
        return go(armorRepairQu, "扬州城", "杂货铺")
    end
    return armorRepairGo()
end
function armorRepairCannt()
    armorUcannt = armorUcannt or {}
    return armorRepairGoCun()
end
armorRepairGoCun = function()
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    cntr2 = countR(3)
    exe("unwield jian dao")
    return go(armorRepairCun, "扬州城", "杂货铺")
end
armorRepairCun = function()
    exe("unwield jian dao")
    if not Bag["剪刀"] then
        return check_heal()
    end
    if cntr2() > 0 and Bag["剪刀"] then
        exe("cun jian dao")
        checkBags()
        return check_busy(armorRepairCun, 1)
    end
    return armorRepairOver()
end
function armorRepairOver()
    DeleteTriggerGroup("armor")
    EnableTriggerGroup("repair", false)
    EnableTimer("repair", false)
    DeleteTimer("repair")
    DeleteTriggerGroup("repair")
    return check_halt(check_jobx)
end
