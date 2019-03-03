-- 天地会
local TdhIgnores = {
    ["归云庄九宫桃花阵"] = true,
    ["桃花岛绿竹林"] = true,
}
function tdh_trigger()
    DeleteTriggerGroup("tdh_find")
    DeleteTriggerGroup("tdh_ask")
    create_trigger_t('tdh_ask1', "^(> )*你向李式开打听有关", '', 'tdh_ask')
    create_trigger_t('tdh_ask2', "^(> )*这里没有这个人。$", '', 'tdh_nobody')
    SetTriggerOption("tdh_ask1", "group", "tdh_ask")
    SetTriggerOption("tdh_ask2", "group", "tdh_ask")
    EnableTriggerGroup("tdh_ask", false)
    DeleteTriggerGroup("tdh_accept")
    create_trigger_t('tdh_accept1', "^(> )*李式开在你的耳边悄声说道：速去", '', 'tdh_fangqi')
    create_trigger_t('tdh_accept2', "^(> )*李式开说道：「既然你做不了，也就算了。」", '', 'tdh')
    create_trigger_t('tdh_accept3', "^(> )*李式开说道：「你又没领过任务，放弃什么啊？」", '', 'tdh_lianxi')
    create_trigger_t('tdh_accept4', "^(> )*李式开说道：「暂时没有事情需要做，以后再说吧。」", '', 'tdh_lianxi')
    create_trigger_t('tdh_accept5', "^(> )*李式开在你的耳边悄声说道：他的名字叫(\\D*)，你路上小心。", '', 'tdh_consider')
    create_trigger_t('tdh_accept6', "^(> )*李式开在你的耳边悄声说道：你马上去(\\D*)联络一个会里的兄弟。", '', 'tdh_where')
    create_trigger_t('tdh_accept7', "^(> )*李式开说道：「你刚完成任务，还是去休息会吧。」", '', 'tdh_busy')
    create_trigger_t('tdh_accept8', "^(> )*李式开说道：「你又没领过任务，放弃什么啊？」", '', 'tdh_finish')
    create_trigger_t('tdh_accept9', "^(> )*李式开白了你一眼，说：你无聊不无聊啊？", '', 'tdh_join')
    create_trigger_t('tdh_accept10', "^(> )*李式开说道：「你还在做任务呢！」", '', 'songxin')
    create_trigger_t('tdh_accept11', "^(> )*但是很显然的，李式开现在的状况没有办法给你任何答覆。", '', 'tdh_nobody')
    create_trigger_t('tdh_accept12', "^(> )*李式开说道：「你已经与(\\D*)联系上了，还是快点去和(\\D*)会合吧！」", '', 'tdhFangqi')
    create_trigger_t('tdh_accept13', "^(> )*李式开说道：「听说陈总舵主有事找你，你还是先去找总舵主询问吧。」", '', 'tdhBug')
    SetTriggerOption("tdh_accept13", "group", "tdh_accept")
    SetTriggerOption("tdh_accept12", "group", "tdh_accept")
    SetTriggerOption("tdh_accept11", "group", "tdh_accept")
    SetTriggerOption("tdh_accept1", "group", "tdh_accept")
    SetTriggerOption("tdh_accept2", "group", "tdh_accept")
    SetTriggerOption("tdh_accept3", "group", "tdh_accept")
    SetTriggerOption("tdh_accept4", "group", "tdh_accept")
    SetTriggerOption("tdh_accept5", "group", "tdh_accept")
    SetTriggerOption("tdh_accept6", "group", "tdh_accept")
    SetTriggerOption("tdh_accept7", "group", "tdh_accept")
    SetTriggerOption("tdh_accept8", "group", "tdh_accept")
    SetTriggerOption("tdh_accept9", "group", "tdh_accept")
    SetTriggerOption("tdh_accept10", "group", "tdh_accept")
    EnableTriggerGroup("tdh_accept", false)
end
function tdhFangqi()
    if not locl.id[job.target2] then
        dis_all()
        return check_bei(songxin)
    end
    return tdhBack()
end
function tdhBug()
    dis_all()
    tdh_triggerDel()
    job.target = '陈近南'
    job.where = '福州城废园'
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    create_trigger_t('tdh_find1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'tdh_bug_ask')
    return go(tdh_bug_find, job.area, job.room)
end
function tdh_bug_find()
    job.flag()
    exe('look')
    return find()
end
function tdh_bug_ask(n, l, w)
    dis_all()
    job.id = string.lower(w[1])
    exe('follow ' .. job.id)
    locate()
    return check_bei(tdhaover, 1)
end
function tdhaover()
    if not locl.id[job.target] then
        print("NPC离开了")
        return tdh_find()
    end
    exe('askk ' .. job.id .. ' about 凝血神爪')
    job.target = nil
    job.where = nil
    return check_halt(check_food)
end
function tdh_join()
    EnableTrigger("tdh_accept13", false)
    return check_busy(joinAsk1)
end
function joinAsk1()
    exe('ask li about 万云龙')
    return check_busy(joinAsk2)
end
function joinAsk2()
    exe('ask li about 天地会')
    return check_busy(joinAsk3)
end
function joinAsk3()
    exe('ask li about 反清复明')
    return check_busy(tdh)
end
function tdh_triggerDel()
    DeleteTriggerGroup("tdh_find")
    DeleteTriggerGroup("tdh_ask")
    DeleteTriggerGroup("tdh_cask")
    DeleteTriggerGroup("tdh_accept")
    DeleteTriggerGroup("tdh_fight")
    DeleteTriggerGroup("tdh_finish")
    DeleteTriggerGroup("tdhId")
    DeleteTriggerGroup("tdh_last_fight")
    DeleteTriggerGroup("tdh_last_Id")
    DeleteTriggerGroup("tdh_wait_npc2")
    DeleteTriggerGroup("tdh_goback_find_npc2")
end
job.list["tdh"] = "天地会"
function tdh()
    dis_all()
    tdh_trigger()
    job.flag()
    job.target3 = '任务目标'
    exe('pfmset;set wimpycmd pfmpfm\\hp')
    return go(tdh_start, '扬州城', '小金山')
end
function tdh_neili()
    if hp.neili < hp.neili_max * 1.2 then
        return prepare_neili(tdh_start)
    else
        return tdh_start()
    end
end    
jobFindAgain = jobFindAgain or { }
jobFindAgain["tdh"] = "tdhFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["tdh"] = "tdhFindFail"
function tdhFindAgain()
    EnableTriggerGroup("tdh_find", false)
    if tmp.tdh then
        if tmp.tdh == 1 then
            EnableTrigger("tdh_find1", true)
            EnableTrigger("tdh_find5", true)
        end
        if tmp.tdh == 2 then
            EnableTrigger("tdh_find2", true)
            EnableTrigger("tdh_find4", true)
        end
        if tmp.tdh == 3 then
            EnableTrigger("tdh_find3", true)
        end
    end
    return go(tdh_find_act, dest.area, dest.room)
end
function tdhFindFail()
    messageShow('天地会任务：没找到人，回去放弃。')
    EnableTriggerGroup("tdh_find", false)
    return check_bei(tdh_fangqi_go)
end
function tdh_start()
    if job.last == 'wudang' then
        flag.idle = nil
        return prepare_lianxi(job_tdh)
    else
        return check_halt(job_tdh)
    end
end
function job_tdh()
    job.name = 'tdh'
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("tdh_ask", true)
    exe('ask li shikai about job')
    flag.idle = nil
    backtdh = 0
end
function tdh_ask()
    EnableTriggerGroup("tdh_ask", false)
    EnableTriggerGroup("tdh_accept", true)
end
function tdh_nobody()
    EnableTrigger("tdh_accept13", false)
    EnableTriggerGroup("tdh_ask", false)
    tdh_triggerDel()
    if score.party == '华山派' and hp.shen < 0 then
        return clb()
    end
    return huashan()
end
function tdh_busy()
    tdh_triggerDel()
    job.last = "tdh"
    return check_heal()
end
function tdh_lianxi()
    EnableTriggerGroup("tdh_accept", false)
    return prepare_lianxi(tdh)
end
function tdh_fangqi_go()
    return go(tdh_fangqi, '扬州城', '小金山')
end
function tdh_fangqi()
    EnableTrigger("tdh_accept13", false)
    nobusy = 0
    EnableTriggerGroup("tdh_accept", false)
    return check_bei(tdh_fangqi_ask)
end
function tdh_fangqi_ask()
    EnableTriggerGroup("tdh_ask", true)
    exe('ask li shikai about 放弃')
end
function tdh_where(n, l, w)
    EnableTrigger("tdh_accept13", false)
    job.where3 = Trim(w[2])
end
function tdh_consider(n, l, w)
    nobusy = 1
    EnableTrigger("tdh_accept13", false)
    job.time.b = os.time()
    messageShow('天地会任务：任务开始。')
    exe('pfmset')
    EnableTriggerGroup("tdh_accept", false)
    job.target3 = Trim(w[2])
    job.target2 = "未定"
    if job.where3 ~= nil then
        if getAddr(job.where3) ~= false then
            job.room, job.area = getAddr(job.where3)
        else
            messageShow('天地会任务：任务地点【' .. job.where3 .. '】不可到达，任务放弃。')
            return check_bei(tdh_fangqi_go)
        end
    else
        messageShow('天地会任务：任务地点出错，【' .. job.where3 .. '】不存在，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    -- job.room,job.area=getAddr(job.where3)
    dest.room = job.room
    dest.area = job.area
    job.last = "tdh"
    tmp.tdh = 1
    flag.idle = nil
    if TdhIgnores[job.where3] or not job.room or not path_cal() then
        messageShow('天地会任务：任务地点【' .. job.where3 .. '】不可到达，任务放弃。')
        return check_bei(tdh_fangqi)
    end
    messageShow('天地会任务：开始前往【' .. job.where3 .. '】，寻找叫【' .. job.target3 .. '】的革命同志！')
    exe('nick 天地会在' .. job.where3)
    exe('set po 掌')
    return check_bei(tdh_find)
end
function tdh_find()
    DeleteTriggerGroup("tdh_find")
    create_trigger_t('tdh_find1', '^>*\\s*\\D*' .. job.target3 .. '\\((\\D*)\\)', '', 'tdh_comrade')
    create_trigger_t('tdh_find2', '^>*\\s*\\D*' .. job.target2 .. '\\((\\D*)\\)', '', 'tdhProtect')
    create_trigger_t('tdh_find3', '^>*\\s*\\D*' .. job.target3 .. '\\((\\D*)\\)', '', 'tdhStop')
    create_trigger_t('tdh_find4', "^(> )*你老远看见一人，样子恍惚和'..job.target3..'说的那人很像。$", '', 'tdh_findok')
    create_trigger_t('tdh_find5', '^>*\\s*' .. job.target3 .. '懒懒地伸了伸腰。', '', 'tdh_debug_find')
    SetTriggerOption("tdh_find1", "group", "tdh_find")
    SetTriggerOption("tdh_find2", "group", "tdh_find")
    SetTriggerOption("tdh_find3", "group", "tdh_find")
    SetTriggerOption("tdh_find4", "group", "tdh_find")
    SetTriggerOption("tdh_find5", "group", "tdh_find")
    EnableTriggerGroup("tdh_find", false)
    flag.times = 1
    return check_bei(tdh_find_go)
end
function tdh_debug_find()
    EnableTrigger("tdh_find1", true)
    EnableTrigger("tdh_find5", true)
    exe('look')
end
function tdh_findok()
    EnableTrigger("tdh_find4", false)
    EnableTrigger("tdh_find2", true)
    exe('look')
end
function tdh_find_go()
    -- EnableTriggerGroup("tdh_find",true)
    if tmp.tdh then
        if tmp.tdh == 1 then
            EnableTrigger("tdh_find1", true)
            EnableTrigger("tdh_find5", true)
        end
        if tmp.tdh == 2 then
            EnableTrigger("tdh_find2", true)
            EnableTrigger("tdh_find4", true)
        end
        if tmp.tdh == 3 then
            EnableTrigger("tdh_find3", true)
            if tdh_npc1_room_id ~= nil and tdh_npc1_room_id ~= '' then
                if map.rooms[tdh_npc1_room_id].no_fight ~= nil then
                    target_room_is_no_fight = map.rooms[tdh_npc1_room_id].no_fight
                    -- 目标房间属于非战斗房间，最后一波npc可能刷不出来导致发呆！
                end
                -- messageShow('天地会任务：直接返回刚才记录的【'..tdh_npc1_room_id ..'】房间寻找革命同志！')
                return go(tdh_find_act, tdh_npc1_room_id, '')
                -- 直接返回刚才记录的tdh_npc1房间号！
            end
        end
    end
    return go(tdh_find_act, job.area, job.room)
end
function tdh_find_act()
    job.flag()
    exe('look')
    messageShow('天地会任务：开始寻找【' .. dest.area .. dest.room .. '】的革命同志！')
    return find()
end
function tdh_comrade(n, l, w)
    dis_all()
    EnableTrigger("tdh_find4", true)
    job.id = string.lower(w[1])
    exe('follow ' .. job.id)
    locate()
    if road.id ~= nil then
        tdh_npc1_room_id = road.id
    end
    return check_bei(tdhaask, 1)
end
function tdhaask()
    if not locl.id[job.target3] then
        print("NPC离开了")
        return tdh_find()
    end
    exe('askk ' .. job.id .. ' about 反清复明')
    return tdh_comrade_ask()
end

-- ain
-- > 你向郭济打听有关『切口』的消息。
-- 郭济说道：「切口？哈哈，有点意思，你先说说(qiekou)。」
function tdh_comrade_ask()
    DeleteTriggerGroup("tdh_cask")
    create_trigger_t('tdh_cask1', '^( )*' .. job.target3 .. '说道：「在(\\D*)有一位叫做(\\D*)的兄弟，他想加入我们天地会。」', '', 'tdhConsider')
    create_trigger_t('tdh_cask2', '^( )*' .. job.target3 .. '白了你一眼，说：你无聊不无聊啊？', '', 'tdh_qiekou')
    create_trigger_t('tdh_cask3', '^( )*' .. job.target3 .. '说道：「切口？哈哈，有点意思，你先说说', '', 'tdh_qiekou')
    create_trigger_t('tdh_cask4', '^(> )*您先歇口气再说话吧。', '', 'tdh_askbusy')
    SetTriggerOption("tdh_cask1", "group", "tdh_cask")
    SetTriggerOption("tdh_cask2", "group", "tdh_cask")
    SetTriggerOption("tdh_cask3", "group", "tdh_cask")
    SetTriggerOption("tdh_cask4", "group", "tdh_cask")
    return tdh_askbusy()
end
function tdh_askbusy()
    wait.make( function()
        wait.time(1)
        exe('ask ' .. job.id .. ' about 切口')
    end )
end
function tdh_qiekou()
    print("进入tdh_qiekou")
    -- return exe('qiekou')
    locate()
    return check_halt(tdh_qiekou2)
end
function tdh_qiekou2()
    EnableTrigger("tdh_cask4", false)
    print("回答切口")
    return exe('qiekou')
end
function tdhConsider(n, l, w)
    exe('follow none')
    EnableTriggerGroup("tdh_cask", false)
    job.where2 = Trim(w[2])
    job.target2 = Trim(w[3])
    if TdhIgnores[job.where2] then
        messageShow('天地会任务：任务地点【' .. job.where2 .. '】不可到达，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    return tdhcklol()
end
function tdhcklol()
    if locl.area == '不知道哪里' then
        -- locate()
        exe(locl.dir)
        Note('无法确定当前地点，随机移动再定位。')
        wait.make( function()
            wait.time(1)
            locate()
        end )
        return checkWait(tdhcklol, 1)
    else
        return check_bei(tdhConOk)
    end
end
function tdhConOk()
    if job.where2 ~= nil then
        if getAddr(job.where2) ~= false then
            job.room, job.area = getAddr(job.where2)
        else
            messageShow('天地会任务：任务地点【' .. job.where2 .. '】不可到达，任务放弃。')
            return check_bei(tdh_fangqi_go)
        end
    else
        messageShow('天地会任务：任务地点出错，【' .. job.where2 .. '】不存在，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    -- job.room,job.area=getAddr(job.where2)
    dest.room = job.room
    dest.area = job.area
    tmp.tdh = 2
    tdhround = 1
    roundtdh = 1
    if not path_cal() then
        tdh_npc1_to_npc2_all_path = false
    else
        tdh_npc1_to_npc2_all_path = path_cal()
    end
    if not job.room or not path_cal() then
        messageShow('天地会任务：任务地点【' .. job.where2 .. '】不可到达，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    exe('nick 天地会在' .. job.where2)
    exe('set env_msg')
    messageShow('天地会任务：开始前往【' .. job.where2 .. '】，寻找叫【' .. job.target2 .. '】的革命同志！！')
    return check_bei(tdh_find)
end
function tdhProtect(n, l, w)
    -- EnableTriggerGroup("tdh_find",false)
    dis_all()
    flag.find = 1
    flag.wait = 1
    job.id2 = string.lower(w[1])
    exe('ask ' .. job.id2 .. ' about 天地会')
    locate()
    if perform.force and perform.force == "dulong-dafa" then
        exe('yun wudi')
    end
    return check_bei(tdhProtectAsk, 1)
end
function tdhProtectAsk()
    if not locl.id[job.target2] then
        return check_bei(tdh_find)
    end
    DeleteTriggerGroup("tdh_fight")
    create_trigger_t('tdh_fight1', '^(> )*(\\D*)(转眼间走的无影无踪。|「啪」的一声倒在地上，挣扎着抽动了几下就死了。)', '', 'tdhDie')
    create_trigger_t('tdh_fight2', '^(> )*(\\D*)怒道：“官府缉拿钦犯，闲杂人等闪开！”说罢便与' .. job.target2 .. '战在了一起。', '', 'tdhProtectId')
    create_trigger_t('tdh_fight3', '^(> )*(\\D*)叫道：“缉拿钦犯，闲杂人等闪开！”说罢便与你战在了一起。', '', 'tdhProtectId')
    create_trigger_t('tdh_fight4', '^(> )*这里不准战斗。', '', 'tdhMoveOn')
    SetTriggerOption("tdh_fight1", "group", "tdh_fight")
    SetTriggerOption("tdh_fight2", "group", "tdh_fight")
    SetTriggerOption("tdh_fight3", "group", "tdh_fight")
    SetTriggerOption("tdh_fight4", "group", "tdh_fight")
    exe('ask ' .. job.id2 .. ' about 反清复明')
end
function tdhMoveOn()
    tdhround = 1
    roundtdh = 1
    locate()
    exe(locl.dir)
    Note('当前地点无法工作，随机移动再工作。')
    wait.make( function()
        wait.time(1)
        tdhMove()
    end )
    return
end
function tdhProtectId(n, l, w)
    dis_all()
    EnableTriggerGroup("tdh_fight", true)
    EnableTrigger("hpheqi1", true)
    tmp.kill = tmp.kill or 0
    tmp.kill = tmp.kill + 1
    job.killer[w[2]] = true
    DeleteTriggerGroup("tdhId")
    create_trigger_t('tdhId1', '^( )*(\\D*)' .. w[2] .. '\\((\\D*)\\)', '', 'tdhId')
    SetTriggerOption("tdhId1", "group", "tdhId")
    exe('look')
    exe('set wimpy 100')
end
function tdhId(n, l, w)
    EnableTriggerGroup("tdhId", false)
    for p in pairs(job.killer) do
        job.killer[p] = string.lower(w[3])
    end
    DeleteTriggerGroup("tdhSet")
    create_trigger_t('tdhSet1', "^(他|她)装备着：$", '', 'npcWeapon')
    SetTriggerOption("tdhSet1", "group", "tdhSet")
    exe('look ' .. string.lower(w[3]))
    exe('kill ' .. string.lower(w[3]))
    kezhiwugong()
    kezhiwugongAddTarget(job.target, string.lower(w[3]))
end
function tdhDie(n, l, w)
    EnableTriggerGroup("tdhSet", false)
    wait_cd = os.time()
    if job.killer[w[2]] then
        job.killer[w[2]] = nil
        locate()
        exe('hp;set po 掌')
        return checkNext(waithq)
    end
end
function waithq()
    if tdhdz * 1 == 1 and tmp.kill <= 6 then
        wait.make( function()
            wait.time(1)
            exe('unset 积蓄;yun jing;yun qi;yun jingli;sxlian;dazuo ' .. hp.dazuo)
            return check_busy(tdhPrepareneili)
        end )
    else
        wait.make( function()
            wait.time(1)
            exe('unset 积蓄;yun jing;yun qi;yun jingli;sxlian')
            return check_busy(tdhPrepareneili)
        end )
    end
end
function tdhPrepareneili()
    nobusy = 1
    if hp.neili < hp.neili_max * 1.2 then
        exe('eat ' .. drug.neili2)
    end
    return prepare_neili(tdhPrepare)
end
function tdhPrepare()
    if dest.area == '燕子坞' or dest.area == '曼佗罗山庄' or dest.area == '姑苏慕容' then
        if tmp.kill and tmp.kill > 6 then
            return tdhBack()
        elseif roundtdh > 2 then
            messageShow('天地会任务2：由于任务地点在【' .. job.where2 .. '】，跳转地点【' .. roundtdh .. '】次完毕，开始返回！')
            return tdhBack()
        elseif tdhround > 12 then
            tdhround = 1
            messageShow('天地会任务2：由于任务地点在【' .. job.where2 .. '】，跳转地点第【' .. roundtdh .. '】次！')
            roundtdh = roundtdh + 1
            return go(road.act)
        else
            return check_busy(tdhMove)
        end
    end
    if skills["dugu-jiujian"] then
        if tmp.kill and tmp.kill > 5 then
            return tdhBack()
        elseif tdhround > 12 then
            return tdhBack()
        else
            return check_busy(tdhMove)
        end
    end
    if type(tdh_npc1_to_npc2_all_path) == 'string' then
        if string.find(tdh_npc1_to_npc2_all_path, 'jqgin') or string.find(tdh_npc1_to_npc2_all_path, 'jqgout') or string.find(tdh_npc1_to_npc2_all_path, 'yuRen') or string.find(tdh_npc1_to_npc2_all_path, 'Sld') or string.find(tdh_npc1_to_npc2_all_path, 'qu') then
            if tmp.kill and tmp.kill > 6 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        elseif string.find(tdh_npc1_to_npc2_all_path, 'duCjiang') or string.find(tdh_npc1_to_npc2_all_path, 'duHhe') then
            if tmp.kill and tmp.kill > 3 then
                return tdhBack()
            elseif tdhround > 6 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        else
            if tmp.kill and tmp.kill > 1 then
                return tdhBack()
            elseif tdhround > 3 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        end
    end
end
function tdhMove()
    tdhround = tdhround + 1
    -- print(tdhround)
    local l_rooms = getRooms(locl.room, locl.area)
    if tmp.troom and type(tmp.troom) == "table" then
        for k, v in pairs(tmp.troom) do
            for _, x in pairs(l_rooms) do
                if k == x then
                    for y, z in pairs(tmp.troom) do
                        if y ~= k then
                            -- messageShow(k..' '..v..' '..z..' '..y)
                            local l_cmd = v .. ';' .. z
                            -- messageShow(l_cmd)
                            -- exe('#5('.. l_cmd ..')')
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            tmp.tcnt = 1
                            return checkWait(tdhWait, 1)
                        end
                    end
                end
            end
        end
    end

    tmp.troom = nil

    if table.getn(l_rooms) == 1 then
        local l_room = l_rooms[1]
        if not map.rooms[l_room].no_fight then
            for p in pairs(map.rooms[l_room].ways) do
                if dirReverse[p] then
                    local q = dirReverse[p]
                    local r_room = map.rooms[l_room].ways[p]
                    local l_lengths = map.rooms[l_room].lengths
                    local r_lengths = map.rooms[r_room].lengths
                    local l_blocks = map.rooms[l_room].blocks
                    if (l_blocks ~= nil and l_blocks[p] ~= nil) then
                        -- messageShow('天地会任务：【'..locl.area..locl.room..'】房间的【'..p..'】方向有挡路npc！','darkorange')
                        break
                    end
                    if map.rooms[r_room].no_fight then
                        break
                    end
                    if (not l_lengths or not l_lengths[p]) and(not r_lengths or not r_lengths[q]) then
                        if l_room == map.rooms[r_room].ways[q] then
                            tmp.troom = { }
                            tmp.troom[l_room] = p
                            tmp.troom[r_room] = q
                            -- messageShow(l_room..' '..p..' '..q..' '..r_room)
                            local l_cmd = p .. ';' .. q
                            -- messageShow(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            tmp.tcnt = 1
                            return checkWait(tdhWait, 1.5)
                        end
                    end
                end
            end
        end
    end
    exe(locl.dir)
    locate()
    exe('hp')
    return checkNext(tdhPrepare)
end
function tdhWait()
    tmp.tcnt = tmp.tcnt or 1
    tmp.tcnt = tmp.tcnt + 1
    if tmp.tcnt > 6 then
        return tdhBack()
    elseif tdhround > 12 then
        return tdhBack()
    end
    locate()
    exe('hp')
    return checkNext(tdhMove)
end
function tdhBack()
    EnableTrigger("tdh_accept13", false)
    EnableTriggerGroup("tdhId", false)
    DeleteTriggerGroup("tdh_fight")
    create_trigger_t('tdh_fight1', '^(> )*(\\D*)(转眼间走的无影无踪。|「啪」的一声倒在地上，挣扎着抽动了几下就死了。)', '', 'tdhDie')
    create_trigger_t('tdh_fight2', '^(> )*(\\D*)怒道：“官府缉拿钦犯，闲杂人等闪开！”说罢便与' .. job.target2 .. '战在了一起。', '', 'tdhProtectId')
    create_trigger_t('tdh_fight3', '^(> )*(\\D*)叫道：“缉拿钦犯，闲杂人等闪开！”说罢便与你战在了一起。', '', 'tdhProtectId')
    create_trigger_t('tdh_fight4', '^(> )*这里不准战斗。', '', 'tdhMoveOn')
    SetTriggerOption("tdh_fight1", "group", "tdh_fight")
    SetTriggerOption("tdh_fight2", "group", "tdh_fight")
    SetTriggerOption("tdh_fight3", "group", "tdh_fight")
    SetTriggerOption("tdh_fight4", "group", "tdh_fight")
    job.room, job.area = getAddr(job.where3)
    dest.room = job.room
    dest.area = job.area
    if Yiliaddr[job.where3] and MidNight[locl.time] then
        if tmp.kill and tmp.kill > 6 then
            DeleteTimer("tdh_wait")
            dis_all()
            messageShow('天地会任务：任务地点【' .. job.where3 .. '】时间不对，切换任务！')
            return check_bei(songxin)
        elseif tdhround > 16 then
            DeleteTimer("tdh_wait")
            dis_all()
            messageShow('天地会任务：任务地点【' .. job.where3 .. '】时间不对，切换任务！')
            return check_bei(songxin)
        else
            return check_busy(tdhMove)
        end
    end
    tmp.tdh = 3
    roundtdh = 1
    local l_rooms = getRooms(locl.room, locl.area)
    if tmp.troom and type(tmp.troom) == "table" then
        for k, v in pairs(tmp.troom) do
            for _, x in pairs(l_rooms) do
                if k == x then
                    road.id = k
                end
            end
        end
    end

    tmp.troom = nil

    return check_bei(tdh_find)
end
function tdhStop()
    dis_all()
    EnableTriggerGroup("tdh_finish", true)
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("tdh_wait_npc2")
    create_trigger_t('tdh_wait_npc2_1', '^(> )*(\\D*)' .. job.target3 .. '声嘶力竭地叫道，“大伙并肩子上啊！”。', '', 'tdh_arrive_many')
    create_trigger_t('tdh_wait_npc2_2', '^(> )*(\\D*)怒道：“官府缉拿钦犯，闲杂人等闪开！”说罢便与' .. job.target2 .. '战在了一起。', '', 'tdh_last_Protect')
    create_trigger_t('tdh_wait_npc2_3', '^(> )*(\\D*)叫道：“缉拿钦犯，闲杂人等闪开！”说罢便与你战在了一起。', '', 'tdh_last_Protect')
    create_trigger_t('tdh_wait_npc2_4', '^(> )*(\\D*)(转眼间走的无影无踪。|「啪」的一声倒在地上，挣扎着抽动了几下就死了。)', '', 'tdhDie')
    SetTriggerOption("tdh_wait_npc2_1", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_2", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_3", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_4", "group", "tdh_wait_npc2")
    EnableTriggerGroup("tdh_wait_npc2", true)
    flag.find = 1
    flag.wait = 1
    locate()
    return checkWait(tdhStopCheck, 3)
end
function tdh_arrive_many()
    messageShow("天地会任务：一下子来了好多个御前侍卫！")
    if wait_times >= 1 then
        wait_times = wait_times - 1
    end
    DeleteTriggerGroup("tdh_last_fight")
    create_trigger_t('tdh_last_fight1', '^(> )*(\\D*)叫道：“缉拿钦犯，闲杂人等闪开！”说罢便与' .. score.name .. '等战在了一起。', '', 'tdh_last_Protect')
    SetTriggerOption("tdh_last_fight1", "group", "tdh_last_fight")
    EnableTriggerGroup("tdh_last_fight", true)
end
function tdh_last_Protect(n, l, w)
    EnableTriggerGroup("tdh_last_fight", false)
    DeleteTriggerGroup("tdh_last_fight")
    DeleteTriggerGroup("tdh_last_Id")
    create_trigger_t('tdh_last_Id1', '^( )*(\\D*)' .. w[2] .. '\\((\\D*)\\)', '', 'tdh_last_Id')
    SetTriggerOption("tdh_last_Id1", "group", "tdh_last_Id")
    exe('look')
    exe('set wimpy 100')
end
function tdh_last_Id(n, l, w)
    EnableTriggerGroup("tdh_last_Id", false)
    exe('kill ' .. string.lower(w[3]))
end
tdh_wait_npc2_begin = function()
    messageShow('天地会任务：等待30秒' .. wait_times .. '次！', 'red')
    DeleteTimer("tdh_wait")
    locate()
    return tdhStopCheck()
end
function tdhStopCheck()
    create_timer_s('tdh_wait', 30, 'tdh_wait_npc2_begin')
    if wait_times == nil then
        wait_times = 1
    else
        wait_times = wait_times + 1
    end
    if not locl.id[job.target3] then
        return check_bei(tdh_find)
    end
    if wait_times > 6 and not locl.id[job.target2] then
        messageShow("天地会任务：判断【" .. job.target2 .. "】没跟上！已经等待了6次，该回去【" .. job.target2 .. "】寻找了！", 'red')
        wait_times = 0
        DeleteTimer("tdh_wait")
        DeleteTriggerGroup("tdh_goback_find_npc2")
        create_trigger_t('tdh_goback_find_npc2_1', '^(> )*' .. job.target2 .. '(从\\D*走了过来。|紧跟着你快步走了过来。)', '', 'tdhBack')
        SetTriggerOption("tdh_goback_find_npc2_1", "group", "tdh_goback_find_npc2")
        EnableTriggerGroup("tdh_goback_find_npc2", true)
        return check_bei(tdhseback)
    end
end
function tdhseback()
    backtdh = backtdh + 1
    if backtdh > 2 then
        messageShow('天地会任务：回去寻找任务NPC【' .. job.target2 .. '】超过2次，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    job.room, job.area = getAddr(job.where2)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() or backtdh > 2 then
        messageShow('天地会任务：任务地点【' .. job.where2 .. '】不可到达，任务放弃。')
        return check_bei(tdh_fangqi_go)
    end
    exe('nick 天地会在' .. job.where2)
    exe('set env_msg')
    messageShow('天地会任务：革命同志掉队了！重新前往【' .. job.where2 .. '】，寻找革命同志！')
    return check_bei(tdh_find)
end
function tdh_finish()
    EnableTrigger("tdh_accept13", false)
    nobusy = 0
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT('天地会任务：任务完成，用时:【' .. job.time.over .. '】秒。')
    flag.find = 0
    backtdh = 0
    tdhround = 1
    wait_times = 1
    exe('unset env_msg')
    tdh_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    if score.party == "姑苏慕容" and need_dzxy == "yes" and string.find(jiangnan_area, locl.area) and hp.pot > 20 and hp.food > 50 and hp.water > 50 then
        messageShow("任务监控：天地会任务完成，当前区域【" .. locl.area .. "】，顺路检查是否去慕容领悟斗转星移！")
        return check_halt(checkdzxy)
    end
    if job.time.over <= 100 then
        return check_halt(songxin)
    else
        return check_halt(check_food)
    end
end