------送信
function songxin_trigger()
    DeleteTriggerGroup("songxin_find")
    DeleteTriggerGroup("songxin_ask")
    create_trigger_t('songxin_ask1', "^>*\\s*你向褚万里打听", '', 'songxin_ask')
    create_trigger_t('songxin_ask2', "^>*\\s*这里没有这个人。$", '', 'songxin_nobody')
    SetTriggerOption("songxin_ask1", "group", "songxin_ask")
    SetTriggerOption("songxin_ask2", "group", "songxin_ask")
    EnableTriggerGroup("songxin_ask", false)
    DeleteTriggerGroup("songxin_accept")
    create_trigger_t('songxin_accept1', "^>*\\s*褚万里\\D*说道：「\\D*，你不是本王府随从，此话从何说起？", '', 'songxin_join')
    create_trigger_t('songxin_accept2', "^>*\\s*褚万里\\D*说道：「(你先去休息一会吧！|现在暂时没有给你的任务，)", '', 'songxin_busy')
    create_trigger_t('songxin_accept3', "^>*\\s*褚万里\\D*说道：「既然\\D*做不了，也就罢了。", '', 'songxin_fangqi_heal')
    create_trigger_t('songxin_accept4', "^>*\\s*褚万里\\D*说道：「你不是已经领了送信的任务吗？还不快去做。", '', 'songxin_fangqi')
    create_trigger_t('songxin_accept5', "^>*\\s*褚万里\\D*说道：「你刚做完大理送信任务，还是去休息一会吧。", '', 'songxin_rest')
    create_trigger_t('songxin_accept6', "^>*\\s*褚万里交给你一封密函。", '', 'songxin_xin')
    SetTriggerOption("songxin_accept1", "group", "songxin_accept")
    SetTriggerOption("songxin_accept2", "group", "songxin_accept")
    SetTriggerOption("songxin_accept3", "group", "songxin_accept")
    SetTriggerOption("songxin_accept4", "group", "songxin_accept")
    SetTriggerOption("songxin_accept5", "group", "songxin_accept")
    SetTriggerOption("songxin_accept6", "group", "songxin_accept")
    EnableTriggerGroup("songxin_accept", false)
    DeleteTriggerGroup("songxin_letter")
    create_trigger_t('songxin_letter1', "^>*\\s*「(\\D*) (\\D*)」 亲启。", '', 'songxin_consider')
    SetTriggerOption("songxin_letter1", "group", "songxin_letter")
    EnableTriggerGroup("songxin_letter", false)
    DeleteTriggerGroup("songxin_killer")
    create_trigger_t('songxin_killer1', "^>*\\s*你隐约感觉到有人围了过来。", '', 'songxin_killer')
    create_trigger_t('songxin_killer2', "^>*\\s*(\\D*)说道：「小子，乖乖把密函交出来吧！！！」", '', 'songxin_killer_1')
    create_trigger_t('songxin_killer3', "^>*\\s*糟糕，又冲上来了个人！", '', 'songxin_killer_2')
    create_trigger_t('songxin_killer4', "^>*\\s*(\\D*)说道：「师兄，点子硬得很，我来帮你！！！」", '', 'songxin_killer_3')
    SetTriggerOption("songxin_killer1", "group", "songxin_killer")
    SetTriggerOption("songxin_killer2", "group", "songxin_killer")
    SetTriggerOption("songxin_killer3", "group", "songxin_killer")
    SetTriggerOption("songxin_killer4", "group", "songxin_killer")
    EnableTriggerGroup("songxin_killer", false)
    DeleteTriggerGroup("songxin2_check")
    create_trigger_t('songxin2_check1', "(> )*\\D*在你的耳边悄声说道：你赶紧把它送到「(\\D*)」的「(\\D*)」手上。", '', 'songxin2_target')
    create_trigger_t('songxin2_check2', "(> )*\\D*在你的耳边悄声说道：可能有个武功和你相比(\\D*)的家伙要来抢你", '', 'songxin2_level')
    SetTriggerOption("songxin2_check1", "group", "songxin2_check")
    SetTriggerOption("songxin2_check2", "group", "songxin2_check")
    EnableTriggerGroup("songxin2_check", false)
    DeleteTriggerGroup("songxin2_killer")
    create_trigger_t('songxin2_killer1', "^>*\\s*你定睛一看，原来是(\\D*)，而且此人\\D*，似乎用的是(\\D*)的(\\D*)！", '', 'songxin2_check')
    create_trigger_t('songxin2_killer2', "^(> )*卧室不能(吐纳|打坐)，会影响别人休息。", '', 'songxin2_refuse')
    create_trigger_t('songxin2_killer3', "^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)", '', 'songxin2_refuse')
    create_trigger_t('songxin2_killer4', "^(> )*这里不准战斗，也不准(吐纳|打坐)。", '', 'songxin2_refuse')
    SetTriggerOption("songxin2_killer1", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer2", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer3", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer4", "group", "songxin2_killer")
    EnableTriggerGroup("songxin2_killer", false)
    create_trigger_t('letteryichang1', "^>*\\s*你紧张起来，不由一摸衣袋，不好！信被偷了!", '', 'sx2over')
    create_trigger_t('letteryichang2', "^>*\\s*你看了看信，决定还是不去了。", '', 'sx2overok')
    SetTriggerOption("letteryichang1", "group", "sx2refuse")
    SetTriggerOption("letteryichang2", "group", "sx2refuse")
    EnableTriggerGroup("sx2refuse", false)
end
function songxin_triggerDel()
    kezhiwugongclose()
    DeleteTriggerGroup("songxin_find_begin")
    DeleteTriggerGroup("songxin_find")
    DeleteTriggerGroup("songxin_ask")
    DeleteTriggerGroup("songxin_accept")
    DeleteTriggerGroup("songxin_letter")
    DeleteTriggerGroup("songxin_killer")
    DeleteTriggerGroup("songxin2_check")
    DeleteTriggerGroup("songxin2_killer")
    DeleteTriggerGroup("songxin_fight")
    DeleteTriggerGroup("sx2refuse")
    DeleteTriggerGroup("sx1lian")
    DeleteTriggerGroup("sx_fight")
    sx1wait = 0
    sx1zhen = 0
    sx1miao = 0
    sx1rou = 0
    sx1xian = 0
    sx1kuai = 0
    sx1man = 0
    sx1gang = 0
    sx1qi = 0
    sx2zhen = 0
    sx2miao = 0
    sx2rou = 0
    sx2xian = 0
    sx2kuai = 0
    sx2man = 0
    sx2gang = 0
    sx2qi = 0
end
job.list["songxin"] = "大理送信"
job.list["songxin2"] = "大理送信2"
function songxin()
    songxin_trigger()
    job.name = 'songxin'
    return check_busy(songxin_start)
end
jobFindAgain = jobFindAgain or { }
jobFindAgain["songxin"] = "songxinFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["songxin"] = "songxinFindFail"
jobFindAgain = jobFindAgain or { }
jobFindAgain["songxin2"] = "songxinFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["songxin2"] = "songxinFindFail"
function songxinFindAgain()
    EnableTriggerGroup("songxin_find", false)
    return go(songxin_find_go, dest.area, dest.room)
end
function songxinFindFail()
    EnableTriggerGroup("songxin_find", false)
    return go(songxin_fangqi, '大理城', '驿站')
end
function songxin_start()
    flag.idle = nil
    if GetRoleConfig("CheckNeili_InAdvance") then 
        return go(sxaskjob, '大理城', '马房') 
    else 
        return go(job_songxin, '大理城', '驿站') 
    end
end
function sxaskjob()
    return zhunbeineili(songxin_begin)
end
function songxin_begin()
    flag.idle = nil
    return go(job_songxin, '大理城', '驿站')
end
function job_songxin()
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("songxin_ask", true)
    -- ain 防止不存钱
    --  if score.goldlmt==nil
    --    score.goldlmt=28000
    --  end
    job.time.b = os.time()
    create_timer_s('songxin_checkask', 1.5, 'job_songxin_checkask')
    exe('ask zhu wanli about job')
end
function job_songxin_checkask()
    exe('ask zhu wanli about job')
end
function songxin_ask()
    DeleteTimer("songxin_checkask")
    EnableTriggerGroup("songxin_ask", false)
    EnableTriggerGroup("songxin_accept", true)
end
function songxin_nobody()
    EnableTriggerGroup("songxin_ask", false)
    songxin_start()
end
function songxin_join()
    EnableTriggerGroup("songxin_accept", false)
    check_halt(songxin_join_go)
end
function songxin_join_go()
    exe('w;s;e;e;n;n;n;e;s;askk fu about join')
    check_halt(songxin_huanggong_ask)
end
function songxin_huanggong_ask()
    exe('n;w;#3s;#4w;#3n;w;askk gao shengtai about 入皇宫')
    check_halt(songxin_start)
end
function songxin_busy()
    EnableTriggerGroup("songxin_accept", false)
    if job.last == "wudang" then
        job.time.b = os.time()
        check_halt(job_songxin)
    else
        check_halt(songxin_busy_dazuo)
    end
end
function songxin_busy_dazuo()
    exe('w;w')
    prepare_lianxi(songxin_start)
end
function songxin_fangqi()
    exe('nick 送信任务放弃')
    dis_all()
    flag.idle = nil
    EnableTriggerGroup("songxin_accept", false)
    job.statistics.Failure = job.statistics.Failure + 1
    job.statistics.Category["送信"].Times = job.statistics.Category["送信"].Times + 1
    job.statistics.Category["送信"].Failure = job.statistics.Category["送信"].Failure + 1
    job.statistics_Update()
    check_bei(songxin_fangqi_ask)
end
function songxin_fangqi_ask()
    EnableTriggerGroup("songxin_ask", true)
    exe('ask zhu wanli about 放弃')
end
function songxin_fangqi_heal()
    songxin_triggerDel()
    return check_halt(check_food)
end
function songxin_rest()
    EnableTriggerGroup("songxin_accept", false)
    if score.party == '华山派' and hp.shen < 0 then
        return clb()
    end
    if job.zuhe["songmoya"] or job.zuhe["tdh"] then
        return huashan()
    end
    job.last = "songxin"
    return check_food()
end
function songxin_xin()
    job.time.b = os.time()
    -- messageShow('送信任务：任务开始。')
    quest.name = "大理送信"
    quest.desc = ""
    quest.note = ""
    quest:update()
    EnableTriggerGroup("songxin_accept", false)
    EnableTriggerGroup("songxin_letter", true)
    job.last = "songxin"
    sxkiller1 = 0
    sxkiller2 = 0
    create_timer_s('songxin_checklookletter', 1.5, 'Execute_lookletter')
    Execute_lookletter()
end
function Execute_lookletter()
    if score.party == '华山派' then
        exe('set po 掌')
    end
    exe('look letter')
end
function songxin_consider(n, l, w)
    DeleteTimer("songxin_checklookletter")
    nobusy = 1
    EnableTriggerGroup("songxin_letter", false)
    EnableTrigger("songxin_killer1", true)
    job.where = tostring(w[1])
    job.target = tostring(w[2])
    if string.find(sxjob.cancel, job.target) then
        messageShow('送信任务：任务目标【' .. job.target .. '】不可送达，任务放弃。', 'blue')
        return check_halt(songxin_fangqi)
    end
    if job.target == "边防官兵" and job.where == "嘉峪关东城门" then
        messageShow('送信任务：任务目标【嘉峪关东城门为富不仁的可恨边防兵】是不会有人给他送信的。', 'blue')
        return check_halt(songxin_fangqi)
    end

    exe('nick 送信一' .. job.where)
    songxin_find()
    --------------------
    -- job.area,job.room = locateroom(job.target)
    -- if not job.area then
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        messageShow('送信任务：任务地点【' .. job.where .. '】不可到达，任务放弃。', 'blue')
        return check_halt(songxin_fangqi)
    end
    -- end
    if Yiliaddr[job.where] and MidNight[locl.time] then
        messageShow('送信任务：任务地点【' .. job.where .. '】时间不对，任务放弃。', 'blue')
        return check_halt(songxin_fangqi)
    end
    if Yiliaddr[job.where] then
        messageShow('送信任务：任务目标【' .. job.target .. '】地伊犁城内，直送。')
        return go(songxin_find_go, job.area, job.room)
    end
    if wait_kill == 'yes' then
        messageShow('送信任务：任务目标【' .. job.target .. '】，开始前往【' .. job.where .. '】。')
        return check_bei(songxin_find_begin)
    end
    if job.area == "武当山" or job.area == "武当派" then
        if job.where == "院门" or job.where == "后山小院" then
            return go(sx1job_wait, job.area, "走廊")
        end
    end
    messageShow('送信任务：任务目标【' .. job.target .. '】，开始前往【' .. job.where .. '】。')
    return go(songxin_find_go, job.area, job.room)
end
function songxin_find()
    DeleteTriggerGroup("songxin_find")
    create_trigger_t('songxin_find1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'songxin_send')
    create_trigger_t('songxin_find2', '^>*\\s*你要送给谁', '', 'songxin_goon')
    create_trigger_t('songxin_find3', '^>*\\s*\\D*道：(这封信不是给我的，|你看清楚，)', '', 'songxin_add')
    create_trigger_t('songxin_find4', '^>*\\s*(这封信不是送给这个人的。|看清楚点，那是活人吗？！)', '', 'songxin_add')
    create_trigger_t('songxin_find5', '^>*\\s*你擦了一把额头的汗，从怀中掏出信交给', '', 'songxin_finish')
    SetTriggerOption("songxin_find1", "group", "songxin_find")
    SetTriggerOption("songxin_find2", "group", "songxin_find")
    SetTriggerOption("songxin_find3", "group", "songxin_find")
    SetTriggerOption("songxin_find4", "group", "songxin_find")
    SetTriggerOption("songxin_find5", "group", "songxin_find")
    EnableTriggerGroup("songxin_find", false)
end
function songxin_find_begin()
    DeleteTriggerGroup("songxin_begin")
    create_trigger_t('songxin_begin1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'sx1job_wait')
    SetTriggerOption("songxin_begin1", "group", "songxin_begin")
    EnableTriggerGroup("songxin_begin", false)
    EnableTrigger("songxin_killer1", true)
    job.flag()
    flag.times = 1
    local tmppfm = GetVariable("pfmsanqing")
    -- 古墓派合气最高大招设置防止遇到kezhiwugong.lua识别不了的npc招式
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm')


    if string.find(sxjob.ide, job.target) then
        messageShow('送信任务：任务目标【' .. job.target .. '】容易死，直送。')
        return go(songxin_find_go, job.area, job.room)
    else
        return go(songxin_find_npc, job.area, job.room)
    end
end
function songxin_find_npc()
    EnableTriggerGroup("songxin_begin", true)
    job.flag()
    exe('look')
    messageShow('送信任务：开始寻找【' .. job.target .. '】的确切位置！')
    return find()
end
function songxin_find_go()
    EnableTriggerGroup("songxin_find", true)
    job.flag()
    exe('look')
    messageShow('送信任务：开始寻找【' .. dest.area .. dest.room .. '】的【' .. job.target .. '】，进行送信！')
    return find()
end
function songxin_send(n, l, w)
    EnableTrigger("songxin_find1", false)
    if flag.wait == 0 then
        flag.wait = 1
        sxjob.cnt = 1
        sxjob.id = string.lower(w[1])
        exe('hp;follow ' .. sxjob.id)
        -- checkBags()
        return checkNext(songxin_send_act)
        -- return check_halt(songxin_send_act)
    end
end
-- function songxin_check()
--     if Bag["信件"] then
--         return check_halt(songxin_send_act)
--     else
--         return check_heal()
--     end
-- end
function songxin_send_act()
    exe('halt;songxin ' .. sxjob.id)
    tmp.cnt = 0
    EnableTrigger("hp12", true)
    create_timer_s('songxin', 1, 'songxin_act_set')
end
function songxin_act_set()
    EnableTrigger("hp12", false)
    if tmp.cnt then
        tmp.cnt = tmp.cnt + 1
    end
    if not tmp.cnt or tmp.cnt > 20 then
        return check_heal()
    end
    exe('halt;songxin ' .. sxjob.id .. ' ' .. sxjob.cnt)
end
function songxin_add()
    sxjob.cnt = sxjob.cnt + 1
    exe('halt;songxin ' .. sxjob.id .. ' ' .. sxjob.cnt)
    tmp.cnt = 0
    EnableTrigger("hp12", true)
    create_timer_s('songxin', 1, 'songxin_act_set')
end
function songxin_goon()
    EnableTrigger("songxin_find1", true)
    flag.wait = 0
    DeleteTimer('songxin')
    return walk_wait()
    -- thread_resume(lookfor)
end
function songxin_finish()
    chats_locate('送信任务：任务目标是【' .. job.where .. '】的【' .. job.target .. '】！', 'red')
    dis_all()
    flag.find = 1
    flag.times = 1
    locate()
    sxjob.sx2 = 0
    exe('follow none')
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT('送信任务：任务完成！用时:【' .. job.time.over .. '】秒')
    if locl.area == '不知道哪里' then
        locl.area = job.area
        Note('无法确定当前地点，设定当前地点为任务地点。')
    end
    EnableTrigger("hpheqi1", true)
    EnableTriggerGroup("sx2refuse", true)
    EnableTriggerGroup("songxin2_check", true)
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["送信"].Times = job.statistics.Category["送信"].Times + 1
    job.statistics.Category["送信"].Success = job.statistics.Category["送信"].Success + 1
    job.statistics_Update()
    return check_halt(songxin2_consider)
end
function songxin_killer()
    fight.time.b = os.time()
    sx1wait = 0
    flag.find = 1
    dis_all()
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("sx1lian")
    EnableTrigger("songxin_killer2", true)
end
function songxin_killer_1(n, l, w)
    EnableTrigger("songxin_killer2", false)
    EnableTrigger("songxin_killer3", true)
    sxjob.killer1 = tostring(w[1])
    sxjob.killer2 = '偷信杀手2'
    sxjob.letter = 0
    sxjob.id1 = 'killer1'
    sxjob.id2 = 'killer2'
    job.killer[sxjob.killer1] = true
    DeleteTriggerGroup("songxin_fight")
    create_trigger_t('songxin_fight1', '^>*\\s*\\D*' .. sxjob.killer1 .. '\\((\\D*)\\)', '', 'songxin_kill_1')
    create_trigger_t('songxin_fight2', '^>*\\s*(\\D*)「啪」的一声倒在地上', '', 'songxin_kill_die')
    create_trigger_t('songxin_fight3', '^>*\\s*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。', '', 'songxin_kill_faint')
    create_trigger_t('songxin_fight4', '^  (\\D*)封信件', '', 'songxin_letter')
    create_trigger_t('songxin_fight5', '^>*\\s*你想攻击谁？', '', 'songxin_kill_over')
    create_trigger_t('songxin_fight6', '^>*\\s*你把 "action" 设定为 "check_letter" 成功完成。', '', 'songxin_kill_check')
    create_trigger_t('songxin_fight7', '^(> )*(\\D*)道：你躲得过初一躲不过十五，我们还会来的！', '', 'songxin_kill_fail')
    SetTriggerOption("songxin_fight1", "group", "songxin_fight")
    SetTriggerOption("songxin_fight2", "group", "songxin_fight")
    SetTriggerOption("songxin_fight3", "group", "songxin_fight")
    SetTriggerOption("songxin_fight4", "group", "songxin_fight")
    SetTriggerOption("songxin_fight5", "group", "songxin_fight")
    SetTriggerOption("songxin_fight6", "group", "songxin_fight")
    SetTriggerOption("songxin_fight7", "group", "songxin_fight")
    exe('look')
    exe('set wimpy 100;yield no')
    kezhiwugong()
    -- messageShow('送信任务：开始解决偷信杀手1：'..sxjob.killer1)
end
function songxin_letter(n, l, w)
    if tostring(w[1]) == '一' or tostring(w[1]) == '二' then
        sxjob.letter = 1
    end
end
function songxin_killer_2()
    EnableTrigger("songxin_killer3", false)
    EnableTrigger("songxin_killer4", true)
end
function songxin_killer_3(n, l, w)
    EnableTrigger("songxin_killer4", false)
    EnableTriggerGroup("songxin_fight", true)
    sxjob.killer2 = tostring(w[1])
    job.killer[sxjob.killer2] = true
    create_trigger_t('songxin_fight8', '^>*\\s*\\D*' .. sxjob.killer2 .. '\\((\\D*)\\)', '', 'songxin_kill_2')
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    exe('look')
    -- messageShow('送信任务：开始解决偷信杀手2：'..sxjob.killer2)
end
function songxin_killer_31()
    EnableTrigger("songxin_killer4", false)
    EnableTriggerGroup("songxin_fight", true)
    create_trigger_t('songxin_fight8', '^>*\\s*\\D*' .. sxjob.killer2 .. '\\((\\D*)\\)', '', 'songxin_kill_2')
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    exe('look')
    -- messageShow('送信任务：开始解决偷信杀手2：'..sxjob.killer2)
end
function songxin_kill_1(n, l, w)
    sxjob.id1 = string.lower(w[1])
    job.killer[sxjob.killer1] = sxjob.id1
    exe('kill ' .. sxjob.id1)
    exe("pfmgang")
    kezhiwugongAddTarget(sxjob.killer1, sxjob.id1)
    -- killPfm(sxjob.id1)
end
function songxin_kill_2(n, l, w)
    sxjob.id2 = string.lower(w[1])
    job.killer[sxjob.killer2] = sxjob.id2
    exe('kill ' .. sxjob.id2)
    kezhiwugongAddTarget(sxjob.killer2, sxjob.id2)
    -- killPfm(sxjob.id2)
end
function songxin_kill_21(n, l, w)
    EnableTrigger("songxin_look1", false)
    DeleteTriggerGroup("songxin_look")
    sxjob.id1 = string.lower(w[1])
    job.killer[sxjob.killer1] = sxjob.id1
    return songxin2_kill()
end
function songxin_kill_faint(n, l, w)
    if w[1] == sxjob.killer1 then
        exe('kill ' .. sxjob.id1)
    end
    if w[1] == sxjob.killer2 then
        exe('kill ' .. sxjob.id2)
    end
end
function songxin_kill_die(n, l, w)
    if w[1] == sxjob.killer1 then
        sxkiller1 = 1
        -- messageShow('送信任务：搞定偷信杀手1：'..sxjob.killer1)
        kezhiwugongRemoveTarget(w[1])
        kezhiwugongkill(2)
        -- return songxinWaitKill2()
        wait.make( function()
            wait.time(2)
            exe('fight ' .. sxjob.id2)
        end )
    end
    if w[1] == sxjob.killer2 then
        sxkiller2 = 1
        -- messageShow('送信任务：搞定偷信杀手2：'..sxjob.killer2)
        kezhiwugongRemoveTarget(w[2])
        kezhiwugongkill(1)
        -- return songxinWaitKill1()
        wait.make( function()
            wait.time(2)
            exe('fight ' .. sxjob.id1)
        end )
    end
end
function songxin_kill_over()
    if sxjob.killer2 == '偷信杀手2' then
        sxkiller2 = 1
    end
    if sxkiller1 == 1 and sxkiller2 == 1 then
        fight.time.e = os.time()
        fight.time.over = fight.time.e - fight.time.b
        messageShowT('送信任务：战斗用时:【' .. fight.time.over .. '】秒。')
        EnableTriggerGroup("songxin_killer", false)
        kezhiwugongclose()
        job.killer = { }
        return check_halt(songxin_kill_get)
    else
        messageShowT('怎么只杀了一只。还有一只呢？')
        EnableTriggerGroup("songxin_killer", true)
        songxin_killer_31()
    end
end
function songxin_kill_get()
    for i = 1, 6 do
        exe('get letter from corpse ' .. i)
    end
    geta()
    exe('i;alias action check_letter')
    weapon_unwield()
end
function geta()
    local w_cmd = GetVariable("myweapon")
    local u_cmd = GetVariable("muweapon")
    if w_cmd ~= nil then
        exe('get ' .. w_cmd)
        exe('get ' .. w_cmd .. ' from corpse')
    end
    if u_cmd ~= nil then
        exe('get ' .. u_cmd)
        exe('get ' .. u_cmd .. ' from corpse')
    end
end
function songxin_kill_check()
    if locl.area == '不知道哪里' then
        locate()
        exe(locl.dir)
        Note('无法确定当前地点，随机移动再定位。')
        wait.make( function()
            wait.time(1)
            songxin_kill_check()
        end )
        return
    end
    EnableTriggerGroup("songxin_fight", false)
    if sxjob.letter == 1 then
        if locl.room == job.room and locl.area == job.area then
            return songxin_find_go()
        else
            return go(songxin_find_go, job.area, job.room)
        end
    else
        messageShow('送信任务：信不见了，去放弃。', 'blue')
        return go(songxin_fangqi, '大理城', '驿站')
    end
end
function songxin2_kill_check()
    if locl.area == '不知道哪里' then
        locate()
        exe(locl.dir)
        Note('无法确定当前地点，随机移动再定位。')
        wait.make( function()
            wait.time(1)
            songxin2_kill_check()
        end )
        return
    end
    if not job.room or not path_cal() then
        messageShow('送信任务：任务地点【' .. job.where .. '】不可到达，任务放弃。', 'blue')
        return go(songxin_fangqi, '大理城', '驿站')
    end
    -- ain add no party no sx2
    if score.party and score.party == '普通百姓' and(dest.area == '燕子坞' or dest.area == '曼佗罗山庄' or dest.area == '姑苏慕容') then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，开始去送信！')
        return songxin2_sendto()
    end
    if score.party and score.party == '姑苏慕容' and(dest.area == '燕子坞' or dest.area == '曼佗罗山庄' or dest.area == '姑苏慕容') then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，开始去送信！')
        return songxin2_sendto()
    end
    if score.party and score.party == '神龙教' and dest.area == '神龙岛' then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，开始去送信！')
        return songxin2_sendto()
    end
    if AddrIgnores[dest.area] then
        messageShow('送信任务2：任务地点【' .. job.where .. '】路太远了，任务拒绝。', 'blue')
        return go(songxin_fangqi, '大理城', '驿站')
    end
    if inwdj == 0 and WdjIgnores[job.where] then
        messageShow('送信任务2：任务地点【' .. job.where .. '】路太远了，任务拒绝。', 'blue')
        return go(songxin_fangqi, '大理城', '驿站')
    end
    return songxin2_sendto()
end
function songxin2_sendto()
    -- if mzAddr[job.where] then
    -- job.area='changan/ljzt'
    -- end
    EnableTriggerGroup("songxin_fight", false)
    if sxjob.letter == 1 then
        if locl.room == job.room and locl.area == job.area then
            print(locl.room, locl.area, job.room, job.area)
            return songxin_find_go()
        else
            return go(songxin_find_go, job.area, job.room)
        end
    else
        messageShow('送信任务：信不见了，去放弃。', 'blue')
        return go(songxin_fangqi, '大理城', '驿站')
    end
end
function songxin_kill_fail(n, l, w)
    if w[2] == sxjob.killer1 or w[2] == sxjob.killer2 then
        EnableTriggerGroup("songxin_fight", false)
        job.killer = { }
        checkBags()
        return check_halt(songxin_kill_letter)
    end
end
function songxin_kill_letter()
    if Bag["信件"] then
        return go(songxin_find_go, job.area, job.room)
    else
        return go(songxin_fangqi, '大理城', '驿站')
    end
end
function songxin2_target(n, l, w)
    sxjob.sx2 = 1
    sxjob.killer1 = '偷信杀手1'
    sxjob.killer2 = '偷信杀手2'
    sxjob.letter = 0
    sxjob.id1 = 'killer1'
    sxjob.id2 = 'killer2'
    job.target = tostring(w[3])
    job.where = tostring(w[2])
    DeleteTrigger("songxin_find1")
    create_trigger_t('songxin_find1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'songxin_send')
    SetTriggerOption("songxin_find1", "group", "songxin_find")
    EnableTriggerGroup("songxin_find", false)
end
function songxin2_level(n, l, w)
    job.level = tostring(w[2])
end
function songxin2_consider()
    EnableTriggerGroup("songxin2_killer", true)
    -- if sxjob.sx2==0 then return Sx2toTdh() end
    -- do return songxin2_refuse() end
    if sxjob.sx2 == 0 then return sx2overok() end
    if not flag.sx2 and sxjob.sx2 == 1 then return songxin2_refuse() end
    if job.zuhe["hubiao"] and(not condition.hubiao or condition.hubiao == 0) then
        return sx2overok()
    end
    print('sx2杀手等级:' .. sx2joblevel)
    if not string.find(sx2joblevel, job.level) and sxjob.sx2 == 1 then
        messageShow('送信任务2：杀手等级【' .. job.level .. '】打不过，任务拒绝。', 'white')
        return songxin2_refuse()
    end
    if Yiliaddr[job.where] and MidNight[locl.time] then
        messageShow('送信任务2：任务地点【' .. job.where .. '】时间不够，任务拒绝。', 'white')
        return songxin2_refuse()
    end

    exe('nick 送信二' .. job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    job.name = 'songxin2'
    if not job.room or not path_cal() then
        messageShow('送信任务：任务地点【' .. job.where .. '】不可到达，任务放弃。', 'blue')
        return songxin2_refuse()
    end
    if inwdj == 0 and WdjIgnores[job.where] then
        messageShow('送信任务2：任务地点【' .. job.where .. '】路太远了，任务拒绝。', 'white')
        return go(songxin_fangqi, '大理城', '驿站')
    end
    -- ain add no party no sx2
    if score.party and score.party == '普通百姓' and(dest.area == '燕子坞' or dest.area == '曼佗罗山庄' or dest.area == '姑苏慕容') then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，原地等待Killer！')
        return songxin2_wait()
    end
    if score.party and score.party == '姑苏慕容' and(dest.area == '燕子坞' or dest.area == '曼佗罗山庄' or dest.area == '姑苏慕容') then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，原地等待Killer！')
        return songxin2_wait()
    end
    if score.party and score.party == '神龙教' and dest.area == '神龙岛' then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，原地等待Killer！')
        return songxin2_wait()
    end
    if AddrIgnores[dest.area] then
        messageShow('送信任务2：任务地点【' .. job.where .. '】路太远了，任务拒绝。', 'white')
        return songxin2_refuse()
    end
    if not job.room or not path_cal() then
        messageShow('送信任务2：任务地点【' .. job.where .. '】没找到路径，任务拒绝。', 'blue')
        return songxin2_refuse()
    end
    if wait_kill == 'yes' then
        messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，原地等待Killer！')
        return songxin2_wait()
    end
    messageShow('送信任务2：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，开始前往！')
    return songxin2_find_begin()
end
function songxin2_find_begin()
    DeleteTriggerGroup("songxin_begin")
    create_trigger_t('songxin_begin1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'songxin2_wait')
    SetTriggerOption("songxin_begin1", "group", "songxin_begin")
    EnableTriggerGroup("songxin_begin", false)
    EnableTrigger("songxin2_killer1", true)
    job.flag()
    flag.times = 1
    local tmppfm = GetVariable("pfmsanqing")
    -- 古墓派合气最高大招设置防止遇到kezhiwugong.lua识别不了的npc招式
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm')

    if string.find(sxjob.ide, job.target) then
        messageShow('送信任务2：任务目标【' .. job.target .. '】容易死，直送。')
        return songxin2_sendto()
    else
        return go(songxin_find_npc, job.area, job.room)
    end
end
function sx2overok()
    nobusy = 0
    condition = { }
    exe('cond')
    songxin_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    return checkWait(sxCondconsider, 1)
end
function sxCondconsider()
    if condition.busy and condition.busy > 60 then
        job.statistics_JobTimePlus()
        return huashan()
    end
    return check_halt(check_food)
end
function Sx2toTdh()
    nobusy = 0
    songxin_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    if needdolost == 1 or job.name == 'songxin2' then
        return sx2overok()
    end
    return check_halt(huashan)
end
function songxin2_refuse()
    EnableTriggerGroup("sx2refuse", true)
    exe('no')
    sxjob.sx2 = 0
end
function sx2over()
    dis_all()
    fight.time.b = os.time()
    EnableTriggerGroup("sx2refuse", false)
    EnableTriggerGroup("songxin2_check", true)
    EnableTriggerGroup("songxin2_killer", true)
    messageShow('靠！送信2的killer提前来把信抢走了！杀了你！')
    print('靠！送信2的killer把提前来信抢走了！杀了你！')
    print('sx2杀手等级:' .. sx2joblevel)
    exe('nick 送信二' .. job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    job.name = 'songxin2'
    messageShow('送信任务：任务目标是【' .. job.where .. '】的【' .. job.target .. '】，杀手等级为【' .. job.level .. '】，原地等待Killer！')
    return songxin2_wait()
end
function songxin2_wait()
    if flag.wait == 0 then
        flag.wait = 1
        EnableTriggerGroup("songxin_begin", false)
        DeleteTriggerGroup("songxin_begin")
    end
    EnableTriggerGroup("sx2refuse", false)
    EnableTriggerGroup("songxin2_check", false)
    EnableTriggerGroup("songxin2_killer", true)
    exe('set wimpy 100;yun qi;yun jing;yun jingli;dazuo ' .. hp.dazuo * 2)
end
function songxin2_check(n, l, w)
    fight.time.b = os.time()
    EnableTriggerGroup("songxin2_killer", false)
    sxjob.killer1 = tostring(w[1])
    sxjob.skills = tostring(w[3])
    job.killer[sxjob.killer1] = true
    if skillIgnores[sxjob.skills] then
        messageShow('送信任务：杀手使用的武功是【' .. w[2] .. '】的【' .. sxjob.skills .. '】不可力敌，任务放弃。', 'blue')
        return songxin2_fangqi()
    else
        messageShow('送信任务：杀手使用的武功是【' .. w[2] .. '】的【' .. sxjob.skills .. '】，开始解决！')
        -- pfmjineng()
        songxin2_look()
    end
end
function songxin2_fangqi()
    EnableTriggerGroup("songxin_fight", false)
    geta()
    dis_all()
    exe('set wimpycmd halt\\' .. locl.dir)
    return go(songxin_fangqi, '大理城', '驿站')
end
faintFunc = faintFunc or { }
faintFunc["songxin"] = "songxin_fangqi_go"
faintFunc["songxin2"] = "songxin_fangqi_go"
function songxin_fangqi_go()
    dis_all()
    return go(songxin_fangqi, '大理城', '驿站')
end
function songxin2_look()
    DeleteTriggerGroup("songxin_look")
    create_trigger_t('songxin_look1', '^>*\\s*\\D*' .. sxjob.killer1 .. '\\((\\D*)\\)', '', 'songxin_kill_21')
    SetTriggerOption("songxin_look1", "group", "songxin_look")
    exe('look')
end
function songxin2_kill()
    DeleteTriggerGroup("songxin_look")
    -- create_trigger_t('songxin_fight1',"^(他|她)装备着：$",'','npcWeapon')
    create_trigger_t('songxin_fight2', '^>*\\s*(\\D*)「啪」的一声倒在地上', '', 'songxin_kill_die')
    create_trigger_t('songxin_fight3', '^>*\\s*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。', '', 'songxin_kill_faint')
    create_trigger_t('songxin_fight4', '^  (\\D*)封信件', '', 'songxin_letter')
    create_trigger_t('songxin_fight5', '^>*\\s*你想攻击谁？', '', 'songxin_kill_over')
    create_trigger_t('songxin_fight6', '^>*\\s*你把 "action" 设定为 "check_letter" 成功完成。', '', 'songxin2_kill_check')
    create_trigger_t('songxin_fight7', '^>*\\s*(\\D*)道：这次算你命大！', '', 'songxin2_fangqi')
    create_trigger_t('songxin_fight8', '^>*\\s*一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……', '', 'songxin2_fangqi')
    create_trigger_t('songxin_fight9', '^>*\\s*啊！总算双目没有被真正刺伤，你又可以看见事物啦！', '', 'songxin_kill_get')
    SetTriggerOption("songxin_fight1", "group", "songxin_fight")
    SetTriggerOption("songxin_fight2", "group", "songxin_fight")
    SetTriggerOption("songxin_fight3", "group", "songxin_fight")
    SetTriggerOption("songxin_fight4", "group", "songxin_fight")
    SetTriggerOption("songxin_fight5", "group", "songxin_fight")
    SetTriggerOption("songxin_fight6", "group", "songxin_fight")
    SetTriggerOption("songxin_fight7", "group", "songxin_fight")
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    SetTriggerOption("songxin_fight9", "group", "songxin_fight")
    -- exe('look '..sxjob.id1)
    exe('kill ' .. sxjob.id1)
    -- killPfm(sxjob.id1)
    local tmppfm = GetVariable("pfmsanqing")
    -- 古墓派合气最高大招设置防止遇到kezhiwugong.lua识别不了的npc招式
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    -- exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm;set wimpy 100;set wimpycmd pfmpower\\pfmpfm\\hp;yield no')
    kezhiwugong()
    kezhiwugongAddTarget(sxjob.killer1, sxjob.id1)
end
 
-- 送信1练功
function sx1job_wait()
    if flag.wait == 0 then
        flag.wait = 1
        EnableTriggerGroup("songxin_begin", false)
        DeleteTriggerGroup("songxin_begin")
    end
    messageShow('找到任务目标【' .. job.target .. '】，开始打坐，等待Killer！')
    DeleteTriggerGroup("sx1lian")
    -- ain dls nv id dazuo
    create_trigger_t('liangong1', "^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)", '', 'sx1dazuo_desc')
    create_trigger_t('liangong2', "^(> )*(你运起玄天无极神功，气聚丹田|你手捏剑诀，将寒冰真气|你盘膝而坐，运起八荒六合唯我独尊功|你运起纯阳神通功，片刻之间|你抉弃杂念盘膝坐定，手捏气诀|你盘膝坐下，默运天魔大法|你凝神静气，盘坐下来|你随意坐下，双手平放在双膝，默念口诀|你手捏绣花针，盘膝坐下，默运葵花神功|你坐下来运气用功，一股内息开始在体内流动|你慢慢盘膝而坐，双手摆于胸前|你五心向天，排除一切杂念，内息顺经脉缓缓流动|你盘膝坐下，双手合十置于头顶，潜运内力|你屏息静气，坐了下来，左手搭在右手之上|你盘膝坐下，垂目合什，默运枯荣禅功|你盘膝坐下，闭目合什，运起乾天一阳神功|你盘膝坐下，暗运内力，试图采取天地之精华|你轻轻的吸一口气，闭上眼睛，运起玉女心经|你盘腿坐下，双目微闭，双手掌心相向成虚握太极|你气运丹田，将体内毒素慢慢逼出，控制着它环绕你缓缓飘动|你盘膝而坐，双手垂于胸前成火焰状，深吸口气|你盘膝而坐，运使九阳，气向下沉|你随意坐下，双手平放在双膝，默念口诀|你随意一站，双手缓缓抬起，深吸一口气|你盘膝而坐，双目紧闭，深深吸一口气引入丹田|你席地而坐，五心向天，脸上红光时隐时现|你暗运临济十二庄，气聚丹田|你收敛心神闭目打坐，手搭气诀，调匀呼吸，感受天地之深邃，自然之精华，渐入无我境界)", '', 'sx1dazuobegin_desc')
    create_trigger_t('liangong3', "^(> )*卧室不能(吐纳|打坐)，会影响别人休息。", '', 'sx1songxin')
    create_trigger_t('liangong4', "^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)", '', 'sx1songxin')
    create_trigger_t('liangong5', "^(> )*这里不准战斗，也不准(吐纳|打坐)。", '', 'sx1songxin')
    create_trigger_t('liangong6', "^(> )*这里可不是让你提高(内力|精力)的地方。", '', 'sx1nodazuo')
    create_trigger_t('liangong7', "^(> )*你吐纳完毕，睁开双眼，站了起来。", '', 'sx1tuna')
    create_trigger_t('liangong8', "^(> )*你的精力修为已经达到了你内功所能控制的极限。", '', 'sx1tunaover')
    SetTriggerOption("liangong1", "group", "sx1lian")
    SetTriggerOption("liangong2", "group", "sx1lian")
    SetTriggerOption("liangong3", "group", "sx1lian")
    SetTriggerOption("liangong4", "group", "sx1lian")
    SetTriggerOption("liangong5", "group", "sx1lian")
    SetTriggerOption("liangong6", "group", "sx1lian")
    SetTriggerOption("liangong7", "group", "sx1lian")
    SetTriggerOption("liangong8", "group", "sx1lian")
    EnableTriggerGroup("sx1lian", true)
    if perform.force and perform.force == "bihai-chaosheng" then
        exe('yun maze')
    end
    prepare_neili_stop()
    return check_busy(sxgodazuo)
end
sxgodazuo = function()
    if hp.exp > 10000000 then exe('unset 积蓄') else exe('set 积蓄') end
    exe('halt;yun jing;yun jingli;yun qi;dazuo ' .. hp.dazuo)
end
sx1tunaover = function()
    EnableTriggerGroup("sx1lian", false)
    exe('halt;yun jing;yun qi')
end
sx1dazuo_desc = function()
    if sx1wait < 20 then
        exe('yun qi;sxlian;dazuo ' .. hp.dazuo)
        return
    else
        print('打坐完成。来吧坏人！')
        exe('yun qi')
        -- exe('yun qi;tuna '..hp.jingxue/2)
    end
end
sx1dazuobegin_desc = function()
    sx1wait = sx1wait + 1
end
sx1songxin = function()
    return songxin_find_go()
end
sx1nodazuo = function()
    exe('yun qi;yun jing;yun jingli;jiali max;halt')
end
sx1tuna = function()
    exe('yun jing;tuna ' .. hp.jingxue / 2)
end