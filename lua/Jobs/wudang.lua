-- wudang
wudangJob = {
    -- 接到任务时间 (接到任务时间与叫杀时间的时间差,就是寻人所耗的时间)
    takeMissionTime = nil,
    -- 记录开始叫杀时间
    killStartTime = nil,
    -- Npc情况描述
    NpcCondition = nil
}

jobFindAgain = jobFindAgain or {}
jobFindAgain["wudang"] = "wudangFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["wudang"] = "wudangFindFail"

function wudangTrigger()
    DeleteTriggerGroup("wudangAsk")
    create_trigger_t("wudangAsk1", "^(> )*你向宋远桥打听有关", "", "wudangAsk")
    create_trigger_t("wudangAsk2", "^(> )*这里没有这个人。$", "", "wudangNobody")
    SetTriggerOption("wudangAsk1", "group", "wudangAsk")
    SetTriggerOption("wudangAsk2", "group", "wudangAsk")
    EnableTriggerGroup("wudangAsk", false)
    DeleteTriggerGroup("wudangAccept")
    create_trigger_t(
        "wudangAccept1",
        "^(> )*宋远桥在你的耳边悄声说道：据说(江南|江北|西南|中原|西北|河南|河北|东北)(草寇|寨主|恶霸|山贼|土匪|飞贼|盗贼)(\\D*)正在(\\D*)捣乱",
        "",
        "wudangConsider"
    )
    create_trigger_t("wudangAccept2", "^(> )*宋远桥说道：「我不是告诉你了吗，有人在", "", "wudangFangqi")
    create_trigger_t("wudangAccept3", "^(> )*宋远桥在你的耳边悄声说道(\\D*)尤为擅长(\\D*)的功夫。", "", "wudangNpc")
    create_trigger_t("wudangAccept4", "^(> )*宋远桥说道：「你正忙着别的事情呢", "", "wudangFail")
    create_trigger_t("wudangAccept5", "^(> )*宋远桥说道：「你刚做完(武当锄奸|惩恶扬善|大理送信|抗敌颂摩崖)任务", "", "wudangFail")
    create_trigger_t("wudangAccept6", "^(> )*宋远桥说道：「现在暂时没有适合你的工作", "", "wudangFail")
    create_trigger_t("wudangAccept7", "^(> )*宋远桥说道：「暂时没有任务需要做，你过一会儿再来吧", "", "wudangFail")
    create_trigger_t("wudangAccept8", "^(> )*宋远桥说道：「\\D*，你太让我失望了，居然这么点活都干不好，先退下吧", "", "wudangFail")
    create_trigger_t("wudangAccept9", "^(> )*宋远桥说道：「\\D*，你又没在我这里领任务，瞎放弃什么呀", "", "wudangFail")
    create_trigger_t("wudangAccept10", "^(> )*宋远桥说道：「\\D*，这个任务确实比较难完成，下次给你简单的，先退下吧！", "", "wudangFail")
    create_trigger_t("wudangAccepta", "^(> )*宋远桥在你的耳边悄声说道：此人的武功(\\D*)，", "", "wudanglevel")
    create_trigger_t("wudangAcceptb", "^(> )*宋远桥\\D*你快去快回，一切小心啊。", "", "wudangFindGo")
    create_trigger_t("wudangAccept31", "^(> )*宋远桥在你的耳边悄声说道：老头子已追查到(\\D*)是我武当出身，尤为擅长(\\D*)的功夫。", "", "wudangNpc")
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
    SetTriggerOption("wudangAccepta", "group", "wudangAccept")
    SetTriggerOption("wudangAcceptb", "group", "wudangAccept")
    EnableTriggerGroup("wudangAccept", false)
    DeleteTriggerGroup("wudangFight")
    create_trigger_t("wudangFight1", "^(> )*(\\D*)「啪」的一声倒在地上", "", "wudangBack")
    create_trigger_t("wudangFight2", "^(> )*(\\D*)大喊一声：不好！！转身几个起落就不见了", "", "wudangBack")
    create_trigger_t("wudangFight3", "^(> )*这里没有(\\D*)。", "", "wudangLost")
    create_trigger_t("wudangFight4", "^(> )*(\\D*)对着你发出一阵阴笑，说道", "", "wudangKillAct")
    create_trigger_t("wudangFight5", "^(> )*(\\D*)大喊一声：老子不奉陪了！转身几个起落就不见了", "", "wudangBack")
    create_trigger_t("wudangFight6", "^>*\\s*一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……", "", "wudangFangqiGo")
    create_trigger_t("wudangFight7", "^(他|她)装备着：$", "", "npcWeapon")
    SetTriggerOption("wudangFight1", "group", "wudangFight")
    SetTriggerOption("wudangFight2", "group", "wudangFight")
    SetTriggerOption("wudangFight3", "group", "wudangFight")
    SetTriggerOption("wudangFight4", "group", "wudangFight")
    SetTriggerOption("wudangFight5", "group", "wudangFight")
    SetTriggerOption("wudangFight6", "group", "wudangFight")
    SetTriggerOption("wudangFight7", "group", "wudangFight")
    EnableTriggerGroup("wudangFight", false)
    DeleteTriggerGroup("wudangFinish")
    create_trigger_t("wudangFinish1", "^(> )*宋远桥对着你竖起了右手大拇指，好样的。", "", "wudangFinishT")
    create_trigger_t("wudangFinish2", "^(> )*宋远桥被你气得昏了过去。", "", "wudangFinish")
    create_trigger_t("wudangFinish3", "^(> )*宋远桥说道：「" .. score.name .. "你怎么搞的", "", "wudangFinish")
    SetTriggerOption("wudangFinish1", "group", "wudangFinish")
    SetTriggerOption("wudangFinish2", "group", "wudangFinish")
    SetTriggerOption("wudangFinish3", "group", "wudangFinish")
    EnableTriggerGroup("wudangFinish", false)
    DeleteTriggerGroup("wudangdebug")
    create_trigger_t("wudangdebug1", "^(> )*看来该找机会逃跑了", "", "wudangdebugFind")
    SetTriggerOption("wudangdebug1", "group", "wudangdebug")
    EnableTriggerGroup("wudangdebug", true)
end

function wudangFindAgain()
    if flag.times == 3 and dest.area == "华山村" and dest.room == "铁匠铺" then
        return go(wudangFindAct, "华山村", "菜地")
    end
    if flag.times == 3 and dest.area == "襄阳城" and dest.room == "山间空地" then
        return go(wudangFindAct, "襄阳郊外", "瀑布")
    end
    return go(wudangFindAct, dest.area, dest.room)
end
function wudangFindFail()
    EnableTriggerGroup("wudangFight", false)
    -- EnableTriggerGroup("wudangFind",false)
    return go(wudangFangqi, "武当山", "三清殿")
end
faintFunc = faintFunc or {}
faintFunc["wudang"] = "wudangFaint"
function wudangFaint()
    return wudangFindFail()
end
function wudanglevel(n, l, w)
    job.level = w[2]
    -- messageShow('WD job level:【'..job.level..'】')
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
job.list["wudang"] = "武当杀恶贼"
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
    return go(wudangBegin, "武当山", "三清殿")
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
    ---------------武当ask job 监视器
    NewObserver("wdAskJobOb", "ask song yuanqiao about job")
end
function wudangAsk()
    EnableTriggerGroup("wudangAsk", false)
    EnableTriggerGroup("wudangAccept", true)
    -- 移除 武当ask job 监视器
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
function wudangFail()
    EnableTriggerGroup("wudangAccept", false)
    if job.level == "已入化境" then
        job.level = "未知"
        messageShow("武当任务：当前接到【已入化境】任务，现在开始化任务等级为【" .. job.level .. "】！", "red")
        quest.desc = "已入化境"
        quest.update()
        return check_bei(wudangHuajing_GoAgain)
    end
    wudangTriggerDel()
    job.lost = 0
    -- job.last='wudang'
    -- 重置叫杀时间
    wudangJob.killStartTime = nil
    setLocateRoomID = "wudang/sanqing"
    if score.party == "华山派" and hp.shen < 0 then
        return clb()
    end
    if job.last == "songxin" then
        return huashan()
    else
        return songxin()
    end
end
function wudangConsider(n, l, w)
    local x
    nobusy = 1
    job.time.b = os.time()
    job.last = "wudang"
    job.target = Trim(w[4])
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[5])
    -- Note(job.where)
    if string.find(Trim(w[5]), "里之内") then
        -- wd_distance=tonumber(string.sub(Trim(w[5]),string.find(Trim(w[5]),"里之内")-2,string.find(Trim(w[5]),"里之内")-1))
        x = string.find(Trim(w[5]), "里之内")
        wd_distance = trans(string.sub(Trim(w[5]), x - 2, x - 1))
    else
        wd_distance = 4
    end
    print("方圆" .. tostring(wd_distance) .. "里之内")
    if string.find(job.where, "周围") then
        local l_cnt = string.find(job.where, "周围")
        job.where = string.sub(job.where, 1, l_cnt - 1)
    -- Note(job.where)
    end
    job.room, job.area = getAddr(job.where)
    -- if job.area=="明教" and string.find(job.room,"字门") then
    -- job.room="紫杉林"
    -- end
    if job.area == "明教" and (job.room == "紫杉林" or string.find(job.room, "字门")) then
        job.room = "练武场"
    end
end
function wudangNpc(n, l, w)
    EnableTriggerGroup("wudangAccept", false)
    EnableTrigger("wudangAccepta", true)
    EnableTrigger("wudangAcceptb", true)
    sxjob.skills = tostring(w[3])
end
function wudangFindGo()
    EnableTriggerGroup("wudangAccept", false)
    dest.room = job.room
    dest.area = job.area
    job.wdtime = os.time() + 8 * 60
    exe("nick 武当任务" .. job.where)
    exe("set no_kill_ap")
    quest.name = "武当杀恶贼"
    quest.location = job.where
    quest.target = job.target
    quest.desc = ""
    quest.note = ""
    quest.update()
    -- pfmjineng()
    setLocateRoomID = "wudang/sanqing"
    if not job.room or not path_cal() then
        messageShow("武当任务：任务地点【" .. job.where .. "】不可到达，任务放弃。")
        return check_bei(wudangFangqi)
    end
    if skillIgnores[sxjob.skills] then
        messageShow("武当任务：" .. job.target .. "使用的武功是【" .. sxjob.skills .. "】不可力敌，任务放弃。")
        return check_bei(wudangFangqi)
    end
    if job.level == "已入化境" then
        return check_bei(wudangHuajing_Fangqi)
    end
    -- messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！')
    messageShow("武当任务：现在开始前往【" .. job.where .. "】！")
    return check_bei(wudangFind)
end
function wudangHuajing_Fangqi()
    EnableTriggerGroup("wudangAccept", false)
    messageShow("武当任务：假装放弃已入化境!", "greenyellow")
    return check_bei(wudangFangqiAsk)
end
function wudangHuajing_GoAgain()
    job.wdtime = os.time() + 5 * 60
    -- messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！','greenyellow')
    messageShow("武当任务：现在开始前往【" .. job.where .. "】！", "greenyellow")
    return check_bei(wudangFind)
end
function wudangFangqiGo()
    DeleteTimer("wudang")
    messageShow("被武当任务NPC打晕了，任务放弃！")
    geta()
    go(wudangFangqi, "武当山", "三清殿")
end
function wudangFangqi()
    exe("nick 武当任务放弃")
    exe("unset no_kill_ap")
    dis_all()
    kezhiwugongclose()
    flag.idle = nil
    job.level = nil
    job.lost = 0
    nobusy = 0
    EnableTriggerGroup("wudangAccept", false)
    check_bei(wudangFangqiAsk)
end
function wudangFangqiAsk()
    EnableTriggerGroup("wudangAsk", true)
    exe("ask song yuanqiao about 放弃")
    setLocateRoomID = "wudang/sanqing"
end
function wudangFind()
    DeleteTriggerGroup("wudangFind")
    create_trigger_t("wudangFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "wudangTarget")
    create_trigger_t(
        "wudangFind2",
        "^(> )*" ..
            job.target ..
                "(对着你发出一阵阴笑，说道：既然被你这个\\D*撞见了，那也就只能算你命短了！|对你说道：\\D*！穷追不舍，既然逃不掉，\\D*我跟你拼了！|对着你说道：嘿嘿！有胆敢跟过来，\\D*不客气了！|看见你走过来，神色有些异常，赶忙低下了头。)",
        "",
        "wudangFindKill"
    )
    create_trigger_t(
        "wudangFind3",
        "^(> )*" .. job.target .. "对着你发出一阵阴笑，说道：\\D*，这里地方太小，有种跟\\D*到外面比划比划！",
        "",
        "wudangLost"
    )
    SetTriggerOption("wudangFind1", "group", "wudangFind")
    SetTriggerOption("wudangFind2", "group", "wudangFind")
    SetTriggerOption("wudangFind3", "group", "wudangFind")
    flag.times = 1
    flag.robber = false
    local tmppfm = GetVariable("pfmsanqing")
    -- 古墓派合气最高大招设置防止遇到kezhiwugong.lua识别不了的npc招式
    create_alias("kezhiwugongpfm", "kezhiwugongpfm", "alias pfmpfm " .. tmppfm)
    exe("kezhiwugongpfm")
    exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    print("当前位置: "..locl.area..locl.room)
    if locl.area == "武当山" and locl.room == "三清殿" then
        print("开启免定位直行")
        go_direct_pure(wudangFindAct, "武当山", "三清殿", job.area, job.room, "wudang/sanqing")
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
    messageShow("武当任务：开始重新寻找【" .. dest.area .. dest.room .. "】的" .. "【" .. job.target .. "】！")
end
-- ---------------------------------------------------------------
-- 武当任务到达任务地点, 开始搜索目标
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
        "武当任务：已到达任务地点【" .. job.where .. "】，开始寻找【" .. dest.area .. dest.room .. "】的" .. "【" .. job.target .. "】！"
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
        messageShow("武当任务：搜索丢失【" .. job.target .. "】两次！回去放弃！")
        return check_halt(wudangFindFail)
    end
    if job.id == Trim(w[2]) then
        dis_all()
        EnableTriggerGroup("wudangdebug", true)
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
    exe("set wimpy 100;yield no")
    exe("kick " .. job.id)
    exe("kill " .. job.id)
    kezhiwugong()
    kezhiwugongAddTarget(job.target, job.id)
    if wudangJob.killStartTime == nil then
        -- 初始化叫杀时间
        wudangJob.killStartTime = common.time()
        -- 添加计时器
        NewObserverByFunc("wudangJobKillOb", "wudangKillObserver")
    end
end
-- ---------------------------------------------------------------
-- 武当任务监视器, 用于杀人时间过长时, 打印目标武功技能
-- ---------------------------------------------------------------
function wudangKillObserver()
    local timegap = common.timediff(common.string2time(common.time()), common.string2time(wudangJob.killStartTime))
    if (timegap.min > 0 or timegap.sec > 30) and wudangJob.killStartTime ~= nil and wudangJob.NpcCondition ~= quest.note then
        wudangJob.NpcCondition = quest.note
        messageShowT("武当任务战斗时间超过30秒：" .. quest.note)
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
        messageShowT("武当任务：搞定" .. "【" .. job.target .. "】！战斗用时:【" .. fight.time.over .. "】秒。")
    end
end
function wudangBackGet()
    -- 重置身上装备状态, 以备装备恢复内力武器
    exe("i")
    geta()
    wudangCk = 0
    EnableTriggerGroup("wudangFinish", true)
    -- return go(wudangFinishWait,'武当山','三清殿')
    return go(wudangFinishC, "武当山", "三清殿")
end
function wudangFinishWait()
    if locl.id["宋远桥"] then
        return wudangFinishC()
    else
        return go(wudangFinishWait, "武当山", "三清殿")
    end
end
function wudangFinishT()
    print("老宋夸我干得好。")
    -- 重置叫杀时间
    wudangJob.killStartTime = nil
    -- setLocateRoomID='wudang/sanqing'
end
function wudangFinishC()
    print("等待老宋发奖励。")
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
    -- 重置叫杀时间
    wudangJob.killStartTime = nil
    return check_food()
end
