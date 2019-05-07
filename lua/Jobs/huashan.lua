-----
-- huashan.lua
--
-- ----------------------------------------------------------
-- 华山惩恶扬善任务
-- ----------------------------------------------------------
--
--[[

eg.


--]]
huashanJob = {
    jobStep = 0,
    Progress = 0
    -- Progress = 1  华山1 找NPC
    -- Progress = 2  华山2 找NPC
    -- Progress = 5  华山找岳灵珊交任务
    -- Progress = 6  华山交给岳灵珊后, 找岳不群回复
}

huashanJob.jobStep = 0

local huashanArea1 = {
    ["菜地"] = "华山村",
    ["杂货铺"] = "华山村",
    ["民房"] = "华山村",
    ["酒肆"] = "华山村",
    ["铁匠铺"] = "华山村",
    ["东村口"] = "华山村",
    ["碎石路"] = "华山村",
    ["玄坛庙"] = "华山村",
    ["苍龙岭"] = "华山",
    ["侧廊"] = "华山",
    ["瀑布"] = "华山",
    ["朝阳峰"] = "华山",
    ["镇岳宫"] = "华山",
    ["猢狲愁"] = "华山",
    ["莎萝坪"] = "华山",
    ["千尺幢"] = "华山",
    ["百尺峡"] = "华山",
    ["青柯坪"] = "华山",
    ["舍身崖"] = "华山",
    ["松树林"] = "华山",
    ["玉女峰"] = "华山",
    ["玉泉院"] = "华山",
    ["思过崖"] = "华山",
    ["药房"] = "华山",
    ["后堂"] = "华山",
    ["山涧"] = "华山",
    ["小溪"] = "华山",
    ["祭坛"] = "华山",
    ["思过崖洞口"] = "华山",
    ["山路"] = "华山",
    ["石屋"] = "华山",
    ["树林"] = "华山",
    ["华山脚下"] = "华山",
    ["山洪瀑布"] = "华山",
    ["练武场"] = "华山",
    ["饭厅"] = "华山",
    ["书房"] = "华山",
    ["饭厅"] = "华山",
    ["剑房"] = "华山",
    ["前厅"] = "华山",
    ["台阶"] = "华山",
    ["正气堂"] = "华山",
    ["寝室"] = "华山",
    ["休息室"] = "华山",
    ["老君沟"] = "华山",
    ["小山路"] = "华山"
}

job.list["huashan"] = "华山惩恶扬善"

function huashan()
    huashanJob.jobStep = 0
    huashanJob.Progress = 0
    dis_all()
    huashan_trigger()
    delete_all_timers()
    idle()
    job.name = "huashan"
    job.target = "任务目标"
    return huashan_start()
end

jobFindAgain = jobFindAgain or {}
jobFindAgain["huashan"] = "huashanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["huashan"] = "huashanFindFail"

-- ----------------------------------------------------------
-- 获取华山任务阶段的中文名/符号
-- ----------------------------------------------------------
function Get_huashanjob_step()
    local word_huashanjob_step = "①"
    if huashanJob.jobStep == 1 then
        word_huashanjob_step = "②"
    end
    return word_huashanjob_step
end

function huashanFindAgain()
    return go(find, dest.area, dest.room)
end

function huashanFindFail()
    return go(huashan_shibai, "华山", "正气堂")
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
    return go(hsaskjob, "华山", "正气堂")
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
    -- 增加要任务发呆计时器
    NewObserver("huashanAskJobOb", "ask yue buqun about job")
end

function huashan_trigger()
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    create_trigger_t("huashan_ask1", "^(> )*你向岳不群打听有关『job』的消息。$", "", "huashan_ask")
    create_trigger_t("huashan_ask2", "^(> )*这里没有这个人。$", "", "huashan_nobody")
    SetTriggerOption("huashan_ask1", "group", "huashan_ask")
    SetTriggerOption("huashan_ask2", "group", "huashan_ask")
    EnableTriggerGroup("huashan_ask", false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t("huashan_accept1", "^(> )*岳不群说道：「你不能光说呀，倒是做出点成绩给我看看！", "", "huashan_shibai")
    create_trigger_t("huashan_accept2", "^(> )*岳不群说道：「你现在正忙着做其他任务呢！", "", "huashan_busy")
    create_trigger_t("huashan_accept3", "^(> )*岳不群说道：「现在没有听说有恶人为害百姓", "", "huashan_fangqi")
    create_trigger_t("huashan_accept4", "^(> )*岳不群给了你一块令牌。$", "", "huashan_npc")
    create_trigger_t("huashan_accept5", "^(> )*岳不群对你说道：你还是先去思过崖面壁思过去吧。", "", "huashanjjQuest")
    create_trigger_t("huashan_accept6", "^(> )*岳不群说道：「现在没有听说有恶人为害百姓，你自己去修习武功去吧！」", "", "huashan_fangqi")
    SetTriggerOption("huashan_accept1", "group", "huashan_accept")
    SetTriggerOption("huashan_accept2", "group", "huashan_accept")
    SetTriggerOption("huashan_accept3", "group", "huashan_accept")
    SetTriggerOption("huashan_accept4", "group", "huashan_accept")
    SetTriggerOption("huashan_accept5", "group", "huashan_accept")
    SetTriggerOption("huashan_accept6", "group", "huashan_accept")
    EnableTriggerGroup("huashan_accept", false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t("huashan_npc1", "^(> )*(冷不防|突然|猛地|忽然|冷不丁)从树林\\D*你的令牌，向(\\D*)(处|方向)\\D*逃去。$", "", "huashan_where")
    create_trigger_t(
        "huashan_npc2",
        "^(> )*你一把抓向蒙面人试图抢回令牌，但被蒙面人敏捷得躲了过去，你顺手扯下蒙面人的面罩，发现原来是曾经名震江湖的(\\D*)。",
        "",
        "huashan_find"
    )
    create_trigger_t("huashan_npc3", '^(> )*你把 "hsjob" 设定为 "闲逛中" 成功完成。', "", "huashan_npc_goon")
    SetTriggerOption("huashan_npc1", "group", "huashan_npc")
    SetTriggerOption("huashan_npc2", "group", "huashan_npc")
    SetTriggerOption("huashan_npc3", "group", "huashan_npc")
    EnableTriggerGroup("huashan_npc", false)
    DeleteTriggerGroup("huashanQuest")
    create_trigger_t("huashanQuest1", "^(> )*岳不群说道：「" .. score.name .. "你杀了不少恶人，未免杀气过重不如上思过崖面壁忏悔吧", "", "huashanDgjj")
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
    -- 关闭要任务计时器
    RemoveObserver("huashanAskJobOb")
end

function huashan_nobody()
    EnableTriggerGroup("huashan_ask", false)
    return huashan_start()
end

function huashan_shibai()
    EnableTriggerGroup("huashan_accept", false)
    kezhiwugongclose()
    return check_busy(huashan_shibai_b)
end

function huashan_shibai_b()
    flag.idle = nil
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    huashan_triggerDel()
    Execute("drop corpse;ask yue buqun about 失败")
    if job.where ~= nil and string.find(job.where, "侠客岛") then
        mjlujingLog("侠客岛")
    end
    messageShow("华山任务：任务失败。", "deepskyblue")
    MissionPunishment.AlreadyGiveUp = true
    -- 执行任务数自增1
    job.statistics_JobTimePlus()
    job.statistics.Failure = job.statistics.Failure + 1
    job.statistics.Category["华山"].Times = job.statistics.Category["华山"].Times + 1
    job.statistics.Category["华山"].Failure = job.statistics.Category["华山"].Failure + 1
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
    exe("nick 华山任务中")
    MissionPunishment.AlreadyGiveUp = false
    EnableTriggerGroup("huashan_accept", false)
    job.last = "huashan"
    if huashanJob.jobStep < 1 then
        job.time.b = os.time()
        huashanJob.Progress = 1
        messageShow("华山任务①：开始任务。")
        quest.name = "华山任务㈠"
        quest.desc = ""
        quest.note = ""
        quest.update()
        return check_bei(huashan_npc_go)
    else
        huashanJob.Progress = 2
        messageShow("华山任务②：开始任务。")
        quest.name = "华山任务㈡"
        quest.desc = ""
        quest.note = ""
        quest.update()
        return check_bei(huashan_npc_go2)
    end
end

function huashan_npc_go()
    go_direct(huashan_npc_get, "华山", "正气堂", "华山", "山脚下", "huashan/zhengqi")
end

function huashan_npc_go2()
    go_direct(huashan_npc_get, "华山", "祭坛", "华山", "山脚下", "huashan/jitan")
end

function huashan_npc_get()
    EnableTriggerGroup("huashan_npc", true)
    -- exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    exe("s")
    return huashan_npc_goon()
end

function huashan_npc_goon()
    RemoveObserver("huashanhangout")
    quest.status = "闲逛中"
    quest.update()
    exe("n;e;e;")
    -- locate()
    fastLocate()
    return check_busy(huashan_ssl, 1)
end

function huashan_ssl()
    if locl.room == "石屋" or locl.room == "玉泉院" then
        return huashan_npc_ssl()
    else
        return huashan_npc_goon()
    end
end
-- ---------------------------------------------------------------
-- 未发现蒙面人抢令牌, 开始闲逛
-- ---------------------------------------------------------------
function huashan_npc_ssl()
    NewObserver("huashanhangout", "w;s;s;alias hsjob 闲逛中", 5)
end

function huashan_where(n, l, w)
    job.where = tostring(w[3])
    quest.location = job.where
    quest.update()
    -- print("1"..job.where)
    if
        string.find(job.where, "萧府大厅") or string.find(job.where, "萧府书房") or string.find(job.where, "萧府厨房") or
            string.find(job.where, "萧府后院")
     then
        job.where = "萧府萧府大门"
    end
end

function huashan_find(n, l, w)
    local flag_huashan = 0
    dis_all()
    job.target = tostring(w[2])
    job.killer = {}
    job.killer[job.target] = true
    locl.area = "华山"
    locl.room = "树林"
    quest.target = job.target
    quest.update()
    DeleteTriggerGroup("huashan_find")
    create_trigger_t("huashan_find1", "^( )*" .. job.target .. "\\((\\D*)\\)", "", "huashan_fight")
    -----------计时器杀人
    create_trigger_t("huashan_find2", "^(> )*看起来(\\D*)想杀死你！", "", "huashan_debug_fight")
    create_trigger_t("huashan_find3", "^(> )*采花大盗正盯着你看，不知道打些什么主意。", "", "huashan_dadao")
    SetTriggerOption("huashan_find1", "group", "huashan_find")
    SetTriggerOption("huashan_find2", "group", "huashan_find")
    SetTriggerOption("huashan_find3", "group", "huashan_find")
    if string.find(job.where, "洗象池") or string.find(job.where, "地下黑拳市") then
        messageShow("华山任务②：任务地点【" .. job.where .. "】不可到达，任务放弃。")
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
        messageShow("华山任务：任务地点【" .. job.where .. "】不可到达，任务放弃。", "Plum")
        return check_halt(huashanFindFail)
    end
    print(dest.room, dest.area, job.room, job.area)
    messageShow("华山任务" .. Get_huashanjob_step() .. "：追杀逃跑到【" .. job.where .. "】的【" .. job.target .. "】。")
    -- 优化华山任务路径(由于当前处于树林迷宫)
    -- 这里的目标有两种可能 1. 目标在当前迷宫里  2. 目标在当前迷宫之外
    if dest.room == "树林" or dest.room == "松树林" or dest.room == "空地" then
        return go(huashanFindAct, job.area, job.room, "huashan/shulin")
    else
        -- 分为两步行走
        go_direct_pre("华山", "树林", "huashan/shulin")
        go_setting(huashanFindAct, job.area, job.room, "huashan/shulin")
        -- 因rooms.lua中关于"华山-树林/松树林" 有异常, 故跳过路径中的第一步(包含#10 west), 直接从跳二步(west 从'树林'进入'松树林'),然后第三跳call #hsssl
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
    ----------增加华山kill 计时器
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
    create_trigger_t("huashan_fight1", "^(> )*" .. job.target .. "「啪」的一声倒在地上", "", "huashan_getget")
    create_trigger_t("huashan_fight2", "^(> )*" .. job.target .. "神志迷糊，脚下一个不稳，倒在地上昏了过去。", "", "huashan_faint")
    create_trigger_t("huashan_fight3", "^(> )*" .. job.target .. "匆匆离开。", "", "huashanFindFail")
    create_trigger_t("huashan_fight4", "^(> )*这里没有 " .. job.id .. "。", "", "huashanFindAct")
    create_trigger_t("huashan_fight5", "^(> )*神明在前，岂可妄动。", "", "huashan_faint1")
    create_trigger_t("huashan_fight6", "^(> )*这不是抢走你令牌的人。", "", "huashanFindFail")
    SetTriggerOption("huashan_fight1", "group", "huashan_fight")
    SetTriggerOption("huashan_fight2", "group", "huashan_fight")
    SetTriggerOption("huashan_fight3", "group", "huashan_fight")
    SetTriggerOption("huashan_fight4", "group", "huashan_fight")
    SetTriggerOption("huashan_fight5", "group", "huashan_fight")
    SetTriggerOption("huashan_fight6", "group", "huashan_fight")

    exe("unset wimpy;kill " .. job.id)
    -- exe("set wimpycmd pfmpfm\\hp")
    -- exe("pfmwu")
    -- exe("set wimpy 100")
    huashanlocate()
end

function huashan_faint()
    -- 重新检查当前装备, 为装备回内武器作准备
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
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    DeleteTriggerGroup("huashan_getnpc")
    hsgettime = 0
    create_trigger_t("huashan_getnpc1", "^(> )*你将(\\D*)的尸体扶了起来背在背上。", "", "huashan_get_con")
    create_trigger_t("huashan_getnpc2", "^(> )*光天化日的想抢劫啊", "", "huashan_getagain")
    SetTriggerOption("huashan_getnpc1", "group", "huashan_getnpc")
    SetTriggerOption("huashan_getnpc2", "group", "huashan_getnpc")
    kezhiwugongclose()
    if locl.area == "绝情谷" then
        return check_bei(huashan_cut)
    else
        -- 重新检查当前装备, 为装备回内武器作准备
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
    messageShowT("华山任务" .. Get_huashanjob_step() .. "：战斗用时:【" .. fight.time.over .. "】秒,搞定蒙面人：【" .. job.target .. "】。")
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
    return go(huashan_yls, "华山", "祭坛")
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
    ------------关闭华山kill 计时器
    RemoveObserver("huashankillOb")
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    EnableTriggerGroup("huashan_getnpc", false)
    DeleteTriggerGroup("huashan_cut")
    create_trigger_t("huashan_cut1", "^(> )*只听“咔”的一声，你将(\\D*)的首级斩了下来，提在手中。", "", "huashan_cut_con")
    --create_trigger_t("huashan_cut3", "^(> )*你将(\\D*)的尸体扶了起来背在背上。", "", "huashan_cut_con")    create_trigger_t("huashan_cut2", "^(> )*(乱切别人杀的人干嘛啊|你手上这件兵器无锋无刃|你得用件锋利的器具才能切下这尸体的头来)", "", "huashan_cut_weapon")
    create_trigger_t("huashan_cut2", "^(> )*(乱切别人杀的人干嘛啊|你手上这件兵器无锋无刃|你得用件锋利的器具才能切下这尸体的头来)", "", "huashan_cut_weapon")
    SetTriggerOption("huashan_cut1", "group", "huashan_cut")
    --SetTriggerOption("huashan_cut3", "group", "huashan_cut")    SetTriggerOption("huashan_cut1", "group", "huashan_cut")
    SetTriggerOption("huashan_cut2", "group", "huashan_cut")
    -- 因战斗中使用克制武功,通常会装备不同的武器,造成weapon_unwield()的不准确, 故在此处重新读取最新的物品列表信息
    checkWield()
    -- 清空错误的road.id(临时方法)
    -- 后续考虑用 opposite path
    road.id = nil
    job.killer = {}
    fight.time.e = os.time()
    fight.time.over = fight.time.e - fight.time.b
    messageShowT("华山任务" .. Get_huashanjob_step() .. "：战斗用时:【" .. fight.time.over .. "】秒,搞定蒙面人：【" .. job.target .. "】。")
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
-- 砍头事件执行触发
-- ---------------------------------------------------------------
function huashan_cut_con(n, l, w)
    huashanJob.Progress = 5
    EnableTriggerGroup("huashan_cut", false) --关闭cut体触发
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
-- 砍头后执行事件
-- ---------------------------------------------------------------
function huashan_cut_after()
    EnableTriggerGroup("huashan_cut", false)
    return go(huashan_yls, "华山", "祭坛")
end
huashan_yls_ok1 = function()
    exe("give yue corpse;hp")
    --exe('give head to yue lingshan;hp')        --设置交首级计时器内容
end
huashan_yls_ok_c = function()
    NewObserver("huashanGiveCorpseOb", "give corpse to yue lingshan;hp")
end
huashan_yls_ok_h = function()
    NewObserver("huashanGiveHeadOb", "give head to yue lingshan;hp")
    --增加交首级计时器
end
-- ---------------------------------------------------------------
-- 去岳灵珊处交令牌
-- ---------------------------------------------------------------
function huashan_yls()
    DeleteTriggerGroup("huashan_yls")
    --create_trigger_t('huashan_yls1','^(> )*(这里没有这个人。|你身上没有这样东西。|这人好象不是你杀的吧？|你的令牌呢|你还没有去找恶贼，怎么就来祭坛了？)','','huashan_yls_fail')
	create_trigger_t('huashan_yls1','^(> )*(这人好象不是你杀的吧？|你身上没有这样东西。|你的令牌呢|你还没有去找恶贼，怎么就来祭坛了？)','','huashan_yls_fail')
    create_trigger_t("huashan_yls2", "^(> )*岳灵珊在你的令牌上写下了一个 (一|二) 字。", "", "huashan_yls_ask")
    create_trigger_t("huashan_yls3", "^(> )*这好象不是你领的令牌吧？", "", "huashan_yls_wronglingpai")
    SetTriggerOption("huashan_yls1", "group", "huashan_yls")
    SetTriggerOption("huashan_yls2", "group", "huashan_yls")
    SetTriggerOption("huashan_yls3", "group", "huashan_yls")
    if hscheckhead == 0 then
        --exe('give corpse to yue lingshan')
        -- 增加交首级计时器
        --NewObserver("huashanGiveHeadOb", 'give corpse to yue lingshan;hp')
        return huashan_yls_ok_c()
    else
        --exe('give head to yue lingshan')
        return huashan_yls_ok_h()
    end
end
-- ---------------------------------------------------------------
-- 交令牌给岳灵珊失败后的处理
-- ---------------------------------------------------------------
function huashan_yls_fail(n, l, w)
    -- 触发成功后删除交首级计时器
    RemoveObserver("huashanGiveHeadOb")
    RemoveObserver("huashanGiveCorpseOb")
    EnableTriggerGroup("huashan_yls", false)
    messageShow("华山任务：岳灵珊交尸体失败, 原因: "..tostring(l), "deepskyblue")
    if locl.room ~= "祭坛" or (string.find(l, "这里没有这个人") and huashanJob.Progress == 5) then
        wait.make(
            function()
                wait.time(5)
                return go(huashan_yls, "华山", "祭坛")
            end
        )
    else
        return go_direct(huashan_shibai_b, "华山", "祭坛", "华山", "正气堂", "huashan/jitan")
    end
end
-- ---------------------------------------------------------------
-- 交错令牌处理, 先丢掉令牌, 再返回执行一次交令牌给岳灵珊
-- 触发语句 "这好像不是你的令牌吧"
-- ---------------------------------------------------------------
function huashan_yls_wronglingpai()
    -- 触发成功后删除交首级计时器
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
-- 华山任务找NPC前的准备, 如积蓄内力等
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
-- 岳灵珊处执行力不从心, 即华山1结束,不作华山2,直接交任务
-- ---------------------------------------------------------------
function huashan_yls_lbcx()
    EnableTriggerGroup("huashan_yls_ask", true)
    -- weapon_unwield()
    return exe("drop head;drop corpse;askk yue lingshan about 力不从心")
end

function huashan_yls_ask(n, l, w)
    huashanJob.Progress = 6
    -- 触发成功后删除交首级计时器
    RemoveObserver("huashanGiveHeadOb")
    RemoveObserver("huashanGiveCorpseOb")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    create_trigger_t("huashan_yls_ask1", "^(> )*你向岳灵珊打听有关『力不从心』的消息。", "", "huashan_yls_back")
    SetTriggerOption("huashan_yls_ask1", "group", "huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask", false)
    if w[2] == "二" then
        return huashan_yls_back()
    end
    if w[2] == "一" and (GetRoleConfig("HuashanJob_Step2") ~= true or (lostletter == 1 and needdolost == 1)) then
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
-- 从 岳灵珊 处返回 岳不群 path
-- ------------------------------------
function huashan_ysl_after()
    DeleteTriggerGroup("huashan_over")
    create_trigger_t("huashan_over1", "^(> )*你给岳不群一块令牌。", "", "huashan_finish")
    create_trigger_t("huashan_over2", "^(> )*这里没有这个人。", "", "huashan_ysl_after_safety")
    SetTriggerOption("huashan_over1", "group", "huashan_over")
    SetTriggerOption("huashan_over2", "group", "huashan_over")
    local backto_ybq = "out;w;s;se;su;su;s;give ling pai to yue buqun"
    exe(backto_ybq)
    NewObserverByFunc("huashanFinishOb", "huashan_ysl_after_safety", 5)
end
function huashan_ysl_after_safety()
    RemoveObserver("huashanFinishOb")
    DeleteTriggerGroup("huashan_over")
    create_trigger_t("huashan_over1", "^(> )*你给岳不群一块令牌。", "", "huashan_finish")
    create_trigger_t("huashan_over2", "^(> )*这里没有这个人。", "", "huashan_ysl_after_safety")
    SetTriggerOption("huashan_over1", "group", "huashan_over")
    SetTriggerOption("huashan_over2", "group", "huashan_over")
    go(
        function()
            exe("give ling pai to yue buqun")
        end,
        "华山",
        "正气堂"
    )
end
-- ------------------------------------
-- 华山任务结束
-- ------------------------------------
function huashan_finish()
    -- weapon_unwield()
    RemoveObserver("huashanFinishOb")
    EnableTriggerGroup("huashanQuest", true)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("华山任务：完成任务，用时:【" .. job.time.over .. "】秒。")
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
    -- 执行任务数自增1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["华山"].Times = job.statistics.Category["华山"].Times + 1
    job.statistics.Category["华山"].Success = job.statistics.Category["华山"].Success + 1
    job.statistics_Update()
    -- setLocateRoomID = "huashan/zhengqi"
    return check_halt(check_food)
end

function huashanDgjj()
    if score.party and score.party == "华山派" then
        messageShow("华山任务：出现面壁提示了！")
    end
    return huashan_finish()
end

function huashanjjQuest()
    EnableTriggerGroup("huashan_accept", false)
    if score.party and score.party == "华山派" then
        messageShow("华山任务：提示要求面壁思过，停止做华山任务")
        job.zuhe["huashan"] = nil
        return check_heal()
    else
        return huashan_finish()
    end
end
