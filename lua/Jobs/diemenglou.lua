
-- ----------------------------------------------------------------------------------------------------
-- 默认变量模块
-- ----------------------------------------------------------------------------------------------------

userRank = 0
userLvl = 0
targetRank = 0
targetLvl = 0
dmlCheckCnt = 0
dmlsucceedCnt = 0
dmlPrestige = 0
dmlCompetitionCoin = 0
dmlFightCnt = 0
l_cnt = 0
askCnt = 0
targetName = ''
targetId = ''
target = { }
_target = { }
blackList = { }
pkList = { }
backupList = { }
_t1 = 0
_t2 = 0
pkCnt = 1
pkWaitCnt = 0
	
-- ----------------------------------------------------------------------------------------------------
-- 主触发器模块
-- ----------------------------------------------------------------------------------------------------

function dmlTriggers()
    DeleteTriggerGroup("dmlXueAsk")
    create_trigger_t('dmlXueAsk1', '^(> )*你向薛慕华打听有关『疗伤』的消息。$', '', 'dmlXueAccept')
    create_trigger_t('dmlXueAsk2', '^(> )*这里没有这个人', '', 'chedml_xue_fail')
    for i = 1, 2 do SetTriggerOption("dmlXueAsk" .. i, "group", "dmlXueAsk") end
    EnableTriggerGroup('dmlXueAsk', false)
    DeleteTriggerGroup("dmlXueAccept")
    create_trigger_t('dmlXueAccept1', '^(> )*薛慕华「嘿嘿嘿」奸笑了几声。$', '', 'dmlXueTeach')
    create_trigger_t('dmlXueAccept2', '^(> )*一柱香的工夫过去了，你觉得伤势已经基本痊愈了。', '', 'dmlXueHeal')
    create_trigger_t('dmlXueAccept3', '^(> )*薛神医拿出一根银针轻轻捻入你受伤部位附近的穴道', '', 'dmlXueWait')
    create_trigger_t('dmlXueAccept4', '^(> )*薛慕华似乎不懂你的意思。$', '', 'dmlXueHeal')
    create_trigger_t('dmlXueAccept5', '^(> )*薛慕华「啪」的一声倒在地上，挣扎着抽动了几下就死了。$', '', 'dml_xue_fail')
    for i = 1, 5 do SetTriggerOption("dmlXueAccept" .. i, "group", "dmlXueAccept") end
    EnableTriggerGroup("dmlXueAccept", false)
    DeleteTriggerGroup("dmlXueTeach")
    create_trigger_t('dmlXueTeach1', '^(> )*薛神医的这个技能已经不能再进步了。$', '', 'dmlXueNext')
    SetTriggerOption("dmlXueTeach1", "group", "dmlXueTeach")
    EnableTriggerGroup("dmlXueTeach", false)
    DeleteTriggerGroup("dmlXueBusy")
    create_trigger_t('dmlXueBusy1', '^(> )*您先歇口气再说话吧。$', '', 'dmlXueBusy')
    SetTriggerOption("dmlXueBusy1", "group", "dmlXueBusy")
    EnableTriggerGroup("dmlXueBusy", false)
    DeleteTriggerGroup('dmldazuo')
    create_trigger_t('dmldazuo1', '^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)', '', 'dmlNeiliCheck')
    SetTriggerOption('dmldazuo1', 'group', 'dmldazuo')
    EnableTriggerGroup('dmldazuo', false)
    DeleteTriggerGroup('dmlask')
    create_trigger_t('dmlask1', '^(> )*老仆说道：「你还是明天再来吧。」', '', 'dmlOver')
    create_trigger_t('dmlask2', '^(> )*老仆说道：「你(精血|内力)不足，如何全力一战？」', '', 'dmlHpCheck')
    create_trigger_t('dmlask3', '^(> )*老仆咪咪笑着闪过身子，你觉得神志恍惚……', '', 'dmlAskOk')
    create_trigger_t('dmlask4', '^(> )*如梦如醉之间，发现你已经在一所亭台之中，老仆已不知哪里去了', '', 'dmlAskOk')
    for i = 1, 4 do SetTriggerOption("dmlask" .. i, "group", "dmlask") end
    EnableTriggerGroup('dmlask', false)
    DeleteTriggerGroup('dmltopcheck')
    create_trigger_t('dmltopcheck3', '^>*\\s*\\d*:*\\s*\\S*\\s*(\\d*)\\s*(\\D*)\\((\\D*)\\)\\s*\\D*\\s*(\\d*)\\s*\\S*\\s*\\S*$', '', 'dmlCheckToplistAct')
    create_trigger_t('dmltopcheck4', '^>*\\S*\\s*还剩\\s*\\d*\\s*行\\s*==\\s*\\(ENTER\\s*继续下一页，q\\s*离开，b\\s*前一页\\)\\s*\\d*:*\\s*\\S*\\s*(\\d*)\\s*(\\D*)\\((\\D*)\\)\\s*\\D*\\s*(\\d*)\\s*\\S*\\s*\\S*$', '', 'dmlCheckToplistAct')
    create_trigger_t('dmltopcheck5', '^>*\\d*:*  你今天一共有五次挑战机会，现在还有\\D*次。', '', 'dmlInfo')
    create_trigger_t('dmltopcheck6', '^>*\\S*\\s*还剩\\s*\\d*\\s*行\\s*==\\s*\\(ENTER\\s*继续下一页，q\\s*离开，b\\s*前一页\\)\\d*:*  你今天一共有五次挑战机会，现在还有\\D*次。', '', 'dmlInfo')
    for i = 1, 6 do SetTriggerOption("dmltopcheck" .. i, "group", "dmltopcheck") end
    EnableTriggerGroup('dmltopcheck', false)
    DeleteTriggerGroup('dmlnofight')
    create_trigger_t('dmlnofight1', '^(> )*这里不准战斗，也不准打坐。', '', 'dmlNoFightRoom')
    create_trigger_t('dmlnofight2', '^(> )*您先歇口气再说话吧。', '', 'dmlAskAgain')
    for i = 1, 2 do SetTriggerOption("dmlnofight" .. i, "group", "dmlnofight") end
    DeleteTriggerGroup('dmlfight')
    create_trigger_t('dmlfight1', '^(> )*突然间，一个身影出在漫天蝶影之中。你定睛一看，正是(\\D*) (\\D*)\\((\\D*)\\)。', '', 'dmlFight')
    create_trigger_t('dmlfight2', '^(> )*你挑战\\D*成功，获得(\\D*)点江湖声望和(\\D*)个竞技币。', '', 'dmlSucceed')
    create_trigger_t('dmlfight3', '^(> )*接着一道神光笼罩着你，你的内力有部分恢复！', '', 'dmlCheck1')
    create_trigger_t('dmlfight4', '^(> )*你怀疑自己也许从来就没有到过一个叫做梦蝶楼的地方。', '', 'dmlOut')
    create_trigger_t('dmlfight5', '^(> )*你今天已经挑战过\\D*了。', '', 'dmlCheckNextTarget')
    create_trigger_t('dmlfight6', '^(> )*你不能挑战自己！', '', 'dmlCheckNextTarget')
    create_trigger_t('dmlfight7', '^(> )*没有发现一个id是\\D*的玩家。请注意在线玩家列表！', '', 'dmlTakePlace')
    create_trigger_t('dmlfight8', '^(> )*竞技时间已过，你无法向\\D*发起挑战。', '', 'dmlOver')
    create_trigger_t('dmlfight9', '^(> )*突然一道神光笼罩着你，你的精气神竟然全部恢复了！', '', 'dmlFailed')
    for i = 1, 9 do SetTriggerOption('dmlfight' .. i, 'group', 'dmlfight') end
    EnableTriggerGroup('dmlfight', false)
end
function dmlPkTriggers()
    DeleteTriggerGroup('dmlPk')
    create_triggerex_lvl('dmlPk1', '^(> )*如果你要和(\\D*)\\((\\D*)\\)性命相搏，', '', 'dmlPkAct', 99)
    create_triggerex_lvl('dmlPk2', '^>*\\s*加油！加油！', '', 'dmlInPk', 99)
    create_triggerex_lvl('dmlPk3', '^>*这里没有这个人。', '', 'dmlPkTargetNotFound', 99)
    create_trigger_t('dmlPk4', '^>*你今天的挑战次数已用完。$', '', 'dmlChanceOut')
    create_triggerex_lvl('dmlPk5', '^>*城隍庙\\s*-\\s*', '', 'dmlPkFail', 99)
    create_triggerex_lvl('dmlPk6', '^(> )*(\\D*)「啪」的一声倒在地上', '', 'dmlPkSucceed', 99)
    create_triggerex_lvl('dmlPk7', '^(> )*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。', '', 'dmlPkFaint', 99)
    for i = 1, 7 do SetTriggerOption('dmlPk' .. i, 'group', 'dmlPk') end
    DeleteTriggerGroup('dmldazuo')
    create_trigger_t('dmldazuo1', '^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)', '', 'dmlPkNeiliCheck')
    SetTriggerOption('dmldazuo1', 'group', 'dmldazuo')
    create_trigger_t('pkPfm1', '^(> )*你把 "pfmpfm" 设定为 "\\D*;perform\\s*(\\D*)\\s*" 成功完成。', '', 'pkPfmSet')
    SetTriggerOption('pkPfm1', 'group', 'pkPfm')
end
function dmlTriggersRemove()
    DeleteTriggerGroup("dmlXueAsk")
    DeleteTriggerGroup("dmlXueAccept")
    DeleteTriggerGroup("dmlXueTeach")
    DeleteTriggerGroup("dmlXueBusy")
    DeleteTriggerGroup('dmldazuo')
    DeleteTriggerGroup('dmldazuo2')
    DeleteTriggerGroup('dmlforce')
    DeleteTriggerGroup('dmlask')
    DeleteTriggerGroup('dmlfight')
    DeleteTriggerGroup('dmltopcheck')
    DeleteTriggerGroup('dmlnofight')
end
function dmlPkTriggersRemove()
    pkList = { }
    exe('nick none')
    DeleteTriggerGroup('dmlPk')
end

-- --------------------------------------------------------------------------------------------------
-- 准备模块一：状态查询
-- --------------------------------------------------------------------------------------------------


function dml_on()
    dmlFightCnt = 0
    l_cnt = 0
    dmlCheckCnt = 0
    dmlsucceedCnt = 0
    dmlPrestige = 0
    dmlCompetitionCoin = 0
    blackList = { }
    pkList = { }
    target = { }
    _target = { }
    backupList = { }
end
function dmlModeSet()
    local l_result
    l_result = utils.inputbox("PK功能暂未开放！\n\n选项一：无脑刷分模式              请输入数字 1\n\n选项二：晋级模式                  请输入数字 2\n\n模式三：玩家自定义模式            请输入数字 3\n\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlMode 变量进行修改。", "选择蝶梦楼挑战模式", GetVariable("dmlMode"), "宋体", "12")
    SetVariable('dmlMode', l_result)
    return dml_check()
end
function dmlSettings()
    local l_result
    l_result = utils.inputbox("初始挑战目标的等级上限是你的等级加上__级?\n\n请在下方空白处填写需要的数字\n\n例如你自身等级是500级，想要挑战不高于550级的目标，则请填写数字 50\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlIncreaseLvl 进行修改。", "初始挑战范围等级上限", GetVariable("dmlIncreaseLvl"), "宋体", "12")
    SetVariable('dmlIncreaseLvl', l_result)
    l_result = utils.inputbox("初始挑战目标的等级下限是你的等级减去__级?\n\n请在下方空白处填写需要的数字\n\n例如你自身等级是500级，想要挑战不低于480级的目标，则请填写数字 20\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlDecreaseLvl 进行修改。 ", "初始挑战范围等级下限", GetVariable("dmlDecreaseLvl"), "宋体", "12")
    SetVariable('dmlDecreaseLvl', l_result)
    l_result = utils.inputbox("备用列表查询等级上限提高__级?\n\n请在下方空白处填写需要的数字\n\n例如初始等级上限是550级，查询不到足够的目标想提高至600级，则填写数字 50\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlNewIncreaseLvl 进行修改。", "备用列表挑战范围等级上限", GetVariable("dmlNewIncreaseLvl"), "宋体", "12")
    SetVariable('dmlNewIncreaseLvl', l_result)
    l_result = utils.inputbox("备用列表查询等级下限降低__级?\n\n请在下方空白处填写需要的数字\n\n例如初始等级下限是480级，查询不到足够的目标想降低至450级，则填写数字 30\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlNewDecreaseLvl 进行修改。", "备用列表挑战范围等级下限", GetVariable("dmlNewDecreaseLvl"), "宋体", "12")
    SetVariable('dmlNewDecreaseLvl', l_result)
    l_result = utils.inputbox("优先挑战高于玩家排名请输入 上\n\n优先挑战低于玩家排名请输入 下\n\n不区分排名上下请输入 both\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlFightOrder 进行修改。", "挑战排名顺序指定", GetVariable("dmlFightOrder"), "宋体", "12")
    SetVariable('dmlFightOrder', l_result)
    l_result = utils.inputbox("需要重复挑战同一目标请输入 yes\n\n不需要重复挑战请输入 no\n\n注意请以小写字母输入。\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlPerTargetTwice 进行修改。", "是否对同一目标进行重复挑战", GetVariable("dmlPerTargetTwice"), "宋体", "12")
    SetVariable('dmlPerTargetTwice', l_result)
    -- l_result = utils.inputbox ("是否需要在蝶梦楼挑战完后自动PK挑战成功的玩家？\n\n是请输入 yes，否请输入no\n\n注意请以小写字母输入。\n\n如下次需要调整请在游戏窗口按下Ctrl + Shift + 7组合键，找到 dmlPkFlag 进行修改。\n\n此功能暂不开放！", "选择是否开启自动PK", GetVariable("dmlPkFlag"), "宋体" , "12")
    SetVariable('dmlPkFlag', 'notReady')
    return dml_check()
end
function dml_check()
    if not GetVariable('dmlMode') then
        return dmlModeSet()
    else
        if tonumber(GetVariable('dmlMode')) == 3 and(not GetVariable('dmlIncreaseLvl') or not GetVariable('dmlDecreaseLvl') or not GetVariable('dmlNewIncreaseLvl') or not GetVariable('dmlNewDecreaseLvl') or not GetVariable('dmlFightOrder') or not GetVariable('dmlPerTargetTwice') or not GetVariable('dmlPkFlag')) then
            return dmlSettings()
        end
    end
    DeleteTimer('idle')
    dmlTriggers()
    EnableTrigger('dmlfight1', true)
    exe('hp')
    print('蝶梦楼全自动挑战模块已启动.........')
    messageShow('蝶梦楼全自动模块：本日蝶梦楼备战中.........', 'yellow', 'black')
    job.name = 'diemenglou'
    quest.name = '蝶梦楼'
    quest.status = '状态检查中'
    quest.update()
    -- 添加这句话，蝶梦楼任务就算启动了！必须放在上边的message之下！
    if hp.food < 70 or hp.water < 70 then
        return go(dmlEat, '武当山', '茶亭')
    else
        return dmlHpCheck()
    end
end
function dml_AutoStart()
    SetVariable('dmlMode', 1)
    dml_check()
end

-- ---------------------------------------------------------------
-- 检查是否在蝶梦楼开启期间, 早上8:05 至 晚上9:55, 保险起见,预留5分钟gap
-- ---------------------------------------------------------------
function dml_IsOpen()
    local currentTime = common.time()
    if currentTime > common.date() .. ' 08:05:00' and currentTime < common.date() .. ' 21:55:00' then
        return true
    else
        return false
    end
end
-- ---------------------------------------------------------------
-- 获取今天作的蝶梦楼任务的次数
-- ---------------------------------------------------------------
function dml_JobTimesToday()
    local times = 0
    local todaystr = tostring(common.date()) .. " 06:00:00"
    local tsql = "SELECT count(*) FROM [ActivityRecord] where ActivityName = '蝶梦楼挑战' and CreateTime > '" .. todaystr .. "'"
    local db = DBHelper:new()
    times = db:GetRowAmount(tsql)
    return times
end
-- ---------------------------------------------------------------
-- 完成一次蝶梦楼挑战, 将记录写入数据库
-- ---------------------------------------------------------------
function dml_FinishDBRecord(notes)
    local tsql = "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" .. GetVariable("id") .. "', '" .. score.name .. "', '蝶梦楼挑战', '" .. notes .. "')"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end

function dmlNoFightRoom()
    return go(dmlNeili, '扬州城', '莲性寺白塔')
end
function dmlEat()
    if locl.room == '茶亭' then
        exe('sit chair;knock table;get tao;#3(eat tao);get cha;#3(drink cha);drop cha;drop tao;hp')
        return checkTop(dmlHpCheck)
    else
        return go(dmlEat, '武当山', '茶亭')
    end
end
function dmlHpCheck()
    exe('hp;cond')
    if vippoison == 1 then
        return go(dmlPoison, '扬州城', '当铺')
    else
        return dmlHpCheck2()
    end
end
function dmlPoison()
    if locl.room == '当铺' then
        exe('duihuan bingchan')
        return check_busy(dmlXidu)
    else
        return go(dmlPoison, '扬州城', '当铺')
    end
end
function dmlXidu()
    exe('xidu')
    return checkTop(dmlHpCheck2)
end
function dmlHpCheck2()
    if hp.jingxue_per < 100 or hp.qixue_per < 100 then
        return go(dmlHeal, '柳宗镇', '正厅')
    else
        return dmlNeili()
    end
end
function dmlHeal()
    exe('nick 柳宗镇正厅与薛神医论道')
    tmp.xueSkills = { }
    tmp.xueCount = 1
    for p in pairs(skills) do
        if skills[p].lvl > 100 then
            table.insert(tmp.xueSkills, p)
        end
    end
    EnableTriggerGroup('dmlXueAsk', true)
    EnableTriggerGroup("dmlXueBusy", true)
    exe('ask xue muhua about 疗伤')
end
function dmlXueBusy()
    return check_busy(dmlXueOk, 0.4)
end
function dmlXueOk()
    EnableTriggerGroup("dmlXueAccept", true)
    exe('ask xue muhua about 疗伤')
end
function dmlXueAccept()
    EnableTriggerGroup("dmlXueAsk", false)
    EnableTriggerGroup("dmlXueAccept", true)
end
function dmlXueWait()
    EnableTrigger("dmlXueAccept1", false)
    EnableTrigger("dmlXueAccept3", false)
    EnableTrigger("dmlXueAccept4", false)
end
function dmlXueTeach()
    EnableTrigger("dmlXueAccept1", false)
    EnableTriggerGroup("dmlXueAccept", false)
    EnableTriggerGroup("dmlXueTeach", true)
    if tmpxueskill then
        for i = 1, 10 do
            exe('teach xue ' .. tmpxueskill)
        end
    else
        for i = 1, 10 do
            exe('teach xue ' .. tmp.xueSkills[tmp.xueCount])
        end
    end
    wait.make( function()
        wait.time(0.5)
        return check_busy(dmlXueOk)
    end )
end
function dmlXueNext()
    EnableTriggerGroup("dmlXueTeach", false)
    if tmpxueskill then
        tmpxueskill = nil
        tmp.xueCount = 0
    end
    tmp.xueCount = tmp.xueCount + 1
    if tmp.xueCount > table.getn(tmp.xueSkills) then
        return checkTop(dmlNeili)
    else
        return checkWait(dmlXueTeach, 0.2)
    end
end
function dmlXueHeal()
    EnableTriggerGroup("dmlXueAccept", false)
    DeleteTriggerGroup("dmlXueAsk")
    DeleteTriggerGroup("dmlXueAccept")
    DeleteTriggerGroup("dmlXueTeach")
    DeleteTriggerGroup("dmlXueBusy")
    exe('hp')
    return dmlNeili()
end
function dmlNeiliCheck()
    exe('yun qi;hp')
    return checkWait(dmlNeili, 0.2)
end
function dmlNeili()
    if locl.room == '莲性寺白塔' then
        exe('yun qi;yun jing;yun jingli')
        if hp.neili < hp.neili_max * 1.5 then
            return dmlDazuo()
        else
            exe('yun qi;nick 蝶梦楼查询目标中')
            return checkWait(checkTop(dmlCheckToplist), 5)
        end
    else
        return go(dmlNeili, '扬州城', '莲性寺白塔')
    end
end
function dmlDazuo()
    EnableTriggerGroup('dmldazuo', true)
    exe('yun qi;dazuo ' .. hp.dazuo)
end
function checkTop(func)
    disWait()
    DeleteTriggerGroup("checkTop")
    create_trigger_t('checkTop1', "^(> )*(你现在已经组合|你已准备有一种技能了|你至少不会这两种拳脚技能的其中之一)", '', 'beiOk')
    create_trigger_t('checkTop2', "^(> )*你现在没有激发任何有效特殊技能。", '', 'beiNone')
    SetTriggerOption("checkTop1", "group", "checkTop")
    SetTriggerOption("checkTop2", "group", "checkTop")
    EnableTriggerGroup("checkTop", true)
    EnableTrigger("hp12", true)
    beihook = func
    exe('bei bei bei')
    return beiTimer()
end
function beiTimer()
    return create_timer_s('bei', 0.5, 'beiTimerSet')
end
function beiTimerSet()
    exe('bei bei bei')
end
function beiNone()
    for p, q in pairs(skillEnable) do
        if skills[p] and q ~= "force" then
            exe('jifa ' .. q .. ' ' .. p)
            if math.random(1, 3) == 1 then
                break
            end
        end
    end
end 
function beiOk()
    EnableTriggerGroup("checkTop", false)
    EnableTrigger("hp12", false)
    EnableTimer('bei', false)
    if beihook == nil then
        beihook = checkTopDone
    end
    return beihook()
end
function checkTopDone()
    ColourNote('fuchsia', 'black', 'topPk列表查询完毕！')
end

-- -------------------------------------------------------------------------------------------------
-- 准备模块二：查询目标
-- -------------------------------------------------------------------------------------------------


function sortFunc(a, b)
    if a.lvl ~= b.lvl then
        return a.lvl > b.lvl
    else
        if a.rank ~= b.rank then
            return a.rank < b.rank
        end
    end
end
function dmlCheckToplist()
    DeleteTimer('dmlWait')
    create_timer_s('dmlWait', 10, 'dmlWait')
    EnableTriggerGroup('dmltopcheck', true)
    EnableTriggerGroup('dmlask', false)
    dmlCheckCnt = dmlCheckCnt + 1
    if tonumber(GetVariable('dmlMode')) ~= 3 then
        SetVariable('dmlDecreaseLvl', 20)
        SetVariable('dmlIncreaseLvl', 50)
        SetVariable('dmlNewDecreaseLvl', 20)
        SetVariable('dmlNewIncreaseLvl', 50)
        SetVariable('dmlPkFlag', 'notReady')
    end
    target = { }
    _target = { }
    backupList = { }
    exe('top pk 999')
    checkTop(checkTop)
end
function dmlCheckToplistAct(n, l, w)
    targetRank = tonumber(w[1])
    targetName = tostring(w[2])
    targetId = string.lower(w[3])
    targetLvl = tonumber(w[4])
    table.insert(_target, { name = targetName, id = targetId, rank = targetRank, lvl = targetLvl, })
    if string.find(score.id, targetId) then
        userRank = targetRank
        userLvl = targetLvl
        messageShow('玩家当前蝶梦楼【排名】' .. userRank .. '位|【等级】' .. userLvl .. '级', 'gold')
    end
end
function dmlInfo()
    local fn = 'logs\\diemenglou_lost_' .. score.id .. '.log'
    local f = io.open(fn, "r")
    if f then
        local s = f:read()
        local avoid
        avoid = utils.split(s, '|')
        for n = 1, table.getn(_target) do
            for k, v in pairs(avoid) do
                if _target[n] ~= nil and _target[n].name == avoid[k] then
                    if _target[avoid[k]] == nil then
                        _target[avoid[k]] = 1
                        ColourNote('white', 'red', '上次挑战目标【' .. _target[n].name .. '】失败【' .. _target[avoid[k]] .. '】次！')
                    else
                        _target[avoid[k]] = _target[avoid[k]] + 1
                        ColourNote('white', 'red', '上次挑战目标【' .. _target[n].name .. '】失败【' .. _target[avoid[k]] .. '】次！')
                    end
                    if _target[avoid[k]] > 1 then
                        ColourNote('white', 'red', '移除目标【' .. _target[n].name .. '】')
                        messageShow('蝶梦楼全自动挑战模块：因与目标【' .. _target[n].name .. '】对战成功率过低现自动回避该目标！')
                        table.remove(_target, n)
                    end
                end
            end
        end
        f:close()
    end
    if dmlCheckCnt == 1 then
        _t1 = userLvl - GetVariable('dmlDecreaseLvl')
        _t2 = userLvl + GetVariable('dmlIncreaseLvl')
    else
        _t1 = userLvl -(GetVariable('dmlDecreaseLvl') + GetVariable('dmlNewDecreaseLvl'))
        _t2 = userLvl +(GetVariable('dmlIncreaseLvl') + GetVariable('dmlNewIncreaseLvl'))
    end
    table.sort(_target, sortFunc)
    if tonumber(GetVariable('dmlMode')) == 1 then
        for i = 1, table.getn(_target) do
            if _target[i].lvl > _t1 and _target[i].id ~= score.id then
                DeleteTimer('dmlWait')
                table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
            end
        end
        ColourNote('doggerblue', 'black', '挑战目标排名等级为', 'yellow', 'black', '【' .. _t1 .. '】', 'doggerblue', 'black', '级之上')
    elseif tonumber(GetVariable('dmlMode')) == 2 then
        for i = 1, table.getn(_target) do
            if _target[i].lvl > _t1 and _target[i].id ~= score.id then
                DeleteTimer('dmlWait')
                table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
            end
        end
        ColourNote('doggerblue', 'black', '挑战目标排名等级为', 'yellow', 'black', '【' .. _t1 .. '】', 'doggerblue', 'black', '级之上')
    elseif tonumber(GetVariable('dmlMode')) == 3 then
        if GetVariable('dmlPerTargetTwice') == 'no' then
            if GetVariable('dmlFightOrder') == '上' then
                for i = 1, table.getn(_target) do
                    if _target[i].rank < userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer('dmlWait')
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                        if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') then
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                    end
                end
            elseif GetVariable('dmlFightOrder') == '下' then
                for i = 1, table.getn(_target) do
                    if _target[i].rank > userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer('dmlWait')
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                        if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') and _target[i].id ~= score.id then
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                    end
                end
            elseif GetVariable('dmlFightOrder') == 'both' then
                for i = 1, table.getn(_target) do
                    if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                        DeleteTimer('dmlWait')
                        table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                    end
                    if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') and _target[i].id ~= score.id then
                        table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                    end
                end
            end
        elseif GetVariable('dmlPerTargetTwice') == 'yes' then
            if GetVariable('dmlFightOrder') == '上' then
                for i = 1, table.getn(_target) do
                    if _target[i].rank < userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer('dmlWait')
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                        if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') and _target[i].id ~= score.id then
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                    end
                end
            elseif GetVariable('dmlFightOrder') == '下' then
                for i = 1, table.getn(_target) do
                    if _target[i].rank > userRank then
                        if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                            DeleteTimer('dmlWait')
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                            table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                        if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') and _target[i].id ~= score.id then
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                            table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        end
                    end
                end
            elseif GetVariable('dmlFightOrder') == 'both' then
                for i = 1, table.getn(_target) do
                    if _target[i].lvl > _t1 and _target[i].lvl < _t2 and _target[i].id ~= score.id then
                        DeleteTimer('dmlWait')
                        table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        table.insert(target, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                    end
                    if _target[i].lvl > _t1 - GetVariable('dmlDecreaseLvl') and _target[i].lvl < _t2 + GetVariable('dmlIncreaseLvl') and _target[i].id ~= score.id then
                        table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                        table.insert(backupList, { name = _target[i].name, id = _target[i].id, rank = _target[i].rank, lvl = _target[i].lvl, })
                    end
                end
            end
        end
        ColourNote('doggerblue', 'black', '挑战目标排名等级为', 'yellow', 'black', '【' .. _t1 .. '】', 'doggerblue', 'black', '级到', 'yellow', 'black', '【' .. _t2 .. '】', 'doggerblue', 'black', '级之间')
    end
    if table.getn(blackList) > 0 then
        for i = 1, table.getn(target) do
            for p, q in pairs(blackList) do
                if target[i] ~= nil then
                    if string.find(target[i].id, blackList[p]) then
                        table.remove(target, i)
                    end
                end
            end
        end
        for j = 1, table.getn(backupList) do
            for m, n in pairs(blackList) do
                if backupList[j] ~= nil then
                    if string.find(backupList[j].id, blackList[m]) then
                        table.remove(backupList, j)
                    end
                end
            end
        end
    end
    return dmlConsider()
end
function dmlConsider()
    if dmlCheckCnt < 3 then
        if table.getn(target) < 5 then
            if table.getn(backupList) < 5 then
                ColourNote('red', 'black', '可挑战目标数量不足，变更条件再次查询！')
                return checkWait(dmlCheckToplist, 5)
            else
                if tonumber(GetVariable('dmlMode')) == 1 or GetVariable('dmlPerTargetTwice') == 'yes' then
                    ColourNote('lime', 'black', '共查询到【' ..(table.getn(backupList) / 2) .. '】位符合条件的目标')
                    messageShow('蝶梦楼全自动模块：共查询到【' ..(table.getn(backupList) / 2) .. '】位符合条件的目标.........', 'lime', 'black')
                    for i = table.getn(backupList),(table.getn(backupList) -4), -1 do
                        ColourNote('lime', 'black', '挑战目标名称', 'white', 'black', '【' .. backupList[i].name .. '】', 'lime', 'black', ' 目标ID', 'white', 'black', '【' .. backupList[i].id .. '】', 'lime', 'black', ' 目标排名', 'white', 'black', '【' .. backupList[i].rank .. '】', 'lime', 'black', '位 目标等级', 'white', 'black', '【' .. backupList[i].lvl .. '】', 'lime', 'black', '级。')
                    end
                else
                    ColourNote('lime', 'black', '共查询到【' .. table.getn(backupList) .. '】位符合条件的目标')
                    messageShow('蝶梦楼全自动模块：共查询到【' .. table.getn(backupList) .. '】位符合条件的目标.........', 'lime', 'black')
                    for i = table.getn(backupList),(table.getn(backupList) -4), -1 do
                        ColourNote('lime', 'black', '挑战目标名称', 'white', 'black', '【' .. backupList[i].name .. '】', 'lime', 'black', ' 目标ID', 'white', 'black', '【' .. backupList[i].id .. '】', 'lime', 'black', ' 目标排名', 'white', 'black', '【' .. backupList[i].rank .. '】', 'lime', 'black', '位 目标等级', 'white', 'black', '【' .. backupList[i].lvl .. '】', 'lime', 'black', '级。')
                    end
                end
                l_cnt = table.getn(backupList)
            end
        else
            if tonumber(GetVariable('dmlMode')) == 1 or GetVariable('dmlPerTargetTwice') == 'yes' then
                ColourNote('lime', 'black', '共查询到【' ..(table.getn(target) / 2) .. '】位符合条件的目标')
                messageShow('蝶梦楼全自动模块：共查询到【' ..(table.getn(target) / 2) .. '】位符合条件的目标.........', 'lime', 'black')
                for i = table.getn(target),(table.getn(target) -4), -1 do
                    ColourNote('lime', 'black', '挑战目标名称', 'white', 'black', '【' .. target[i].name .. '】', 'lime', 'black', ' 目标ID', 'white', 'black', '【' .. target[i].id .. '】', 'lime', 'black', ' 目标排名', 'white', 'black', '【' .. target[i].rank .. '】', 'lime', 'black', '位 目标等级', 'white', 'black', '【' .. target[i].lvl .. '】', 'lime', 'black', '级。')
                end
            else
                ColourNote('lime', 'black', '共查询到【' .. table.getn(target) .. '】位符合条件的目标')
                messageShow('蝶梦楼全自动模块：共查询到【' .. table.getn(target) .. '】位符合条件的目标.........', 'lime', 'black')
                for i = table.getn(target),(table.getn(target) -4), -1 do
                    ColourNote('lime', 'black', '挑战目标名称', 'white', 'black', '【' .. target[i].name .. '】', 'lime', 'black', ' 目标ID', 'white', 'black', '【' .. target[i].id .. '】', 'lime', 'black', ' 目标排名', 'white', 'black', '【' .. target[i].rank .. '】', 'lime', 'black', '位 目标等级', 'white', 'black', '【' .. target[i].lvl .. '】', 'lime', 'black', '级。')
                end
            end
            l_cnt = table.getn(target)
        end
        return checkTop(dmlAsk)
    else
        messageShow('蝶梦楼全自动模块：已到达查询上限，没有符合条件的目标，请手动检查或修改条件重新开始.........', 'white', 'red')
        return dmlOver()
    end
end
function dmlWait()
    DeleteTimer('dmlWait')
    ColourNote('red', 'black', '没有查询到任何目标，变更条件再次查询！')
    checkWait(dmlCheckToplist, 5)
end

-- --------------------------------------------------------------------------------------------------
-- 蝶梦楼挑战开始
-- --------------------------------------------------------------------------------------------------

function dmlSucceed(n, l, w)
    local l_prestige = 0
    local l_competitionCoin = 0
    local _cnt = l_cnt + 1
    local notes = ""
    if table.getn(target) >= 5 then
        notes = '挑战【' .. target[_cnt].name .. '】 【' .. target[_cnt].id .. '】成功！'
        table.insert(pkList, { name = target[_cnt].name, id = target[_cnt].id, })
    else
        notes = '挑战【' .. backupList[_cnt].name .. '】 【' .. backupList[_cnt].id .. '】成功！'
        table.insert(pkList, { name = backupList[_cnt].name, id = backupList[_cnt].id, })
    end
    messageShow(notes, 'lime', 'black')
    l_prestige = tonumber(trans(w[2]))
    l_competitionCoin = tonumber(trans(w[3]))
    dmlsucceedCnt = dmlsucceedCnt + 1
    dmlPrestige = dmlPrestige + l_prestige
    dmlCompetitionCoin = dmlCompetitionCoin + l_competitionCoin
    -- insert DB
    dml_FinishDBRecord(notes)
end
function dmlFailed()
    CloseLog()
    local _cnt = l_cnt + 1
    local fn = 'logs\\diemenglou_lost_' .. score.id .. '.log'
    local f = io.open(fn, "a")
    local s = ''
    local notes = ""
    if table.getn(target) >= 5 then
        s = target[_cnt].name .. '|'
        notes = '挑战【' .. target[_cnt].name .. '】 【' .. target[_cnt].id .. '】失败！'
    else
        s = backupList[_cnt].name .. '|'
        notes = '挑战【' .. backupList[_cnt].name .. '】 【' .. backupList[_cnt].id .. '】失败！'
    end
    messageShow(notes, 'fuchsia', 'black')
    f:write(s)
    f:close()
    -- insert DB
    dml_FinishDBRecord(notes)
end
function dmlCheckNextTarget()
    if table.getn(target) >= 5 then
        table.insert(blackList, target[l_cnt].id)
    else
        table.insert(blackList, backupList[l_cnt].id)
    end
    l_cnt = l_cnt - 1
    return dmlAsk()
end
function dmlAskOk()
    EnableTriggerGroup('dmlask', false)
end
function dmlAskAgain()
    return checkTop(dmlAsk)
end
function dmlAsk()
    EnableTriggerGroup('dmltargetcheck', false)
    EnableTrigger('fight2', false)
    EnableTrigger('fight16', false)
    EnableTriggerGroup('dmlask', false)
    exe('ask laopu about 梦境')
    checkTop(dmlAsk1)
end
function dmlAsk1()
    EnableTriggerGroup('dmlask', true)
    exe('ask laopu about 上楼')
    checkTop(dmlAsk2)
end
function dmlAsk2()
    exe('ask laopu about 上楼')
    checkTop(dmlDream)
end
function dmlDream()
    EnableTriggerGroup('dmlfight', true)
    if dmlFightCnt < 5 then
        if l_cnt > 0 then
            if table.getn(target) >= 5 then
                messageShow('蝶梦楼全自动模块：现在开始挑战【' .. target[l_cnt].name .. '】 【' .. target[l_cnt].id .. '】.........', 'yellow')
                quest.status = '挑战 ' .. target[l_cnt].id
                quest.update()
                return exe('dream ' .. target[l_cnt].id)
            else
                messageShow('蝶梦楼全自动模块：现在开始挑战【' .. backupList[l_cnt].name .. '】 【' .. backupList[l_cnt].id .. '】.........', 'yellow')
                quest.status = '挑战 ' .. backupList[l_cnt].name
                quest.update()
                return exe('dream ' .. backupList[l_cnt].id)
            end
        else
            ColourNote('red', 'black', '列表剩余目标不足，变更条件再次查询！')
            return checkWait(dmlCheckToplist, 5)
        end
    else
        return dmlOver()
    end
end
function dmlTakePlace()
    return checkWait(dmlTopTake, 5)
end
function dmlTopTake()
    if table.getn(target) >= 5 then
        if target[l_cnt].rank < userRank then
            exe('top take ' .. target[l_cnt].rank)
            userRank = target[l_cnt].rank
            print('目标【' .. target[l_cnt].name .. '】离线，取代对方排名【' .. target[l_cnt].rank .. '】位')
            messageShow('蝶梦楼全自动模块：挑战目标【' .. target[l_cnt].name .. '】离线，取代对方排名至【' .. target[l_cnt].rank .. '】位.........', 'lime')
            table.insert(blackList, target[l_cnt].id)
        end
    else
        if backupList[l_cnt].rank < userRank then
            exe('top take ' .. backupList[l_cnt].rank)
            quest.status = '查询榜单'
            quest.update()
            userRank = backupList[l_cnt].rank
            print('目标【' .. blackList[l_cnt].name .. '】离线，取代对方排名【' .. blackList[l_cnt].rank .. '】位')
            messageShow('蝶梦楼全自动模块：挑战目标【' .. blackList[l_cnt].name .. '】离线，取代对方排名至【' .. blackList[l_cnt].rank .. '】位.........', 'lime')
            table.insert(blackList, backupList[l_cnt].id)
        end
    end
    l_cnt = l_cnt - 1
    if l_cnt > 0 then
        messageShow('蝶梦楼全自动模块：挑战目标【' .. target[(l_cnt + 1)].name .. '】离线，继续挑战下一目标.........', 'lime')
        return checkTop(dmlAsk)
    else
        ColourNote('red', 'black', '变更条件再次查询！')
        return checkWait(dmlCheckToplist, 5)
    end
end
function dmlFight(n, l, w)
    dmlFightCnt = dmlFightCnt + 1
    local fn = GetInfo(67) .. "logs\\" .. score.id .. '蝶梦楼竞技记录' .. dmlFightCnt .. ".log"
    OpenLog(fn, false)
    ColourNote('Lime', 'black', '开始写入蝶梦楼竞技记录到' .. fn .. '，写入方式为擦除重写！')
    l_cnt = l_cnt - 1
    job.name = 'diemenglou'
    npc_name = ''
    npc_id = ''
    delete_all_timers()
    npc_name = w[3]
    npc_id = string.lower(w[4])
    exe('set wimpycmd pfmpfm\\hp')
    exe('pfmwu')
    exe('set wimpy 100;yield no')
    exe('look ' .. npc_id)
    exe('nick 蝶梦楼战斗中')
    exe('say 那么，来一场酣畅淋漓的战斗吧！')
    kezhiwugong()
    kezhiwugongAddTarget(npc_name, npc_id)
end
function dmlCheck1()
    CloseLog()
    exe('hp')
    return checkTop(dmlCheck2)
end
function dmlCheck2()
    if hp.qixue_per < 95 and hp.qixue_per >= 70 and cty_cur > 0 then
        exe('fu chantui yao;hp')
        return checkTop(dmlCheck1)
    elseif (hp.qixue_per < 100 and hp.qixue_per > 95) or cty_cur == 0 then
        exe('yun heal')
        return checkTop(dmlCheck1)
    elseif hp.qixue_per < 70 then
        return exe('wait ' .. score.id)
    else
        if l_cnt > 0 then
            return checkTop(dmlAsk)
        else
            ColourNote('red', 'black', '变更条件再次查询！')
            return checkWait(dmlCheckToplist, 5)
        end
    end
end
function dmlOut()
    if GetRoleConfig("Auto_DML_DuringMissionPunishment") == true then
        -- 单次 蝶梦楼 结束,跳出.
        dmlTriggersRemove()
        EnableTrigger('fight2', true)
        EnableTrigger('fight16', true)
        return checkTop(check_food)
    end
    if dmlFightCnt < 5 then
        if l_cnt > 0 then
            ColourNote('violet', 'black', '继续上楼挑战。')
            return checkTop(dmlAsk)
        else
            ColourNote('red', 'black', '变更条件再次查询！')
            return checkWait(dmlCheckToplist, 5)
        end
    else
        return dmlOver()
    end
end
function dmlOver()
    if dmlFightCnt == 5 then
        local fn = 'logs\\diemenglou_mark_' .. score.id .. '.log'
        local f = io.open(fn, "w")
        local s = os.date("%Y%m%d%H")
        if tonumber(os.date('%H')) >= 22 then
            s = os.date("%Y%m%d") .. '09'
        end
        if tonumber(os.date('%H')) < 8 then
            s = tonumber(os.date("%Y%m%d") .. '09') -100
        end
        f:write(s)
        f:close()
        dmlTriggersRemove()
        EnableTrigger('fight2', true)
        EnableTrigger('fight16', true)
        print('本日蝶梦楼可挑战次数为零，模块退出')
        messageShow('蝶梦楼全自动模块：挑战成功【' .. dmlsucceedCnt .. '】次，获得【' .. dmlPrestige .. '】点声望，【' .. dmlCompetitionCoin .. '】点竞技币.........', 'gold')
        messageShow('蝶梦楼全自动模块：本日蝶梦楼可挑战次数为零，模块退出.........', 'lime')
        exe('nick none')
        if GetVariable("dmlPkFlag") == 'yes' and table.getn(pkList) > 0 then
            exe('unset pk_give_up')
            return dmlPkFunc()
        else
            return checkTop(check_food)
        end
    else
        askCnt = askCnt + 1
        if askCnt > 1 then
            askCnt = 0
            dmlFightCnt = 5
            return dmlOver()
        end
    end
end


-- --------------------------------------------------------------------------------------------------
-- 自动PK模块
-- --------------------------------------------------------------------------------------------------


function dmlPkFunc()
    exe(GetVariable('pfmwu'))
    exe('unset wimpycmd;jiali 0')
    exe('hp')
    pkCnt = 1
    pkWaitCnt = 0
    return(dmlPkStart)
end
function dmlPkStart()
    if locl.room == '正气堂' then
        dmlPkTriggers()
        exe('yun qi;yun jing;yun jingli')
        if hp.neili >= hp.neili_max * 1.5 then
            return dmlPkWait()
        else
            return dmlPkNeili()
        end
    else
        return go(dmlPkStart, '华山', '正气堂')
    end
end
function dmlPkNeiliCheck()
    exe('hp')
    checkWait(dmlPkNeili, 0.2)
end
function dmlPkNeili()
    if hp.neili < hp.neili_max * 1.5 then
        return dmlPkDazuo()
    else
        exe('yun qi;nick 华山正气堂堵人中')
        return dmlPkWait()
    end
end
function dmlPkWait()
    if pkCnt <= table.getn(pkList) then
        create_timer_s('dmlPkWait', 1, 'dmlPkWaitAct')
    else
        messageShow('蝶梦楼全自动模块：PK模块结束.........', 'yellow', 'black')
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function dmlPkTargetNotFound()
    pkWaitCnt = pkWaitCnt + 1
    if pkWaitCnt > 180 then
        pkWaitCnt = 0
        messageShow('蝶梦楼全自动模块：超过三分钟未等到玩家【' .. pkList[pkCnt].name .. '】，更换下一目标。.........', 'yellow')
        pkCnt = pkCnt + 1
    end
end
function dmlPkAct(n, l, w)
    pkWaitCnt = 0
    DeleteTimer('dmlPkWait')
    npc_name = w[2]
    npc_id = string.lower(w[3])
    exe('set wimpycmd pkHeqiCheck\\hp')
    exe('set wimpy 100;yield no')
    kezhiwugong()
    kezhiwugongAddTarget(npc_name, npc_id)
    create_timer_s('dmlPkCheck', 1, 'dmlPkCheck')
end
function dmlPkCheck()
    exe('kill ' .. npc_id)
end
function dmlPkWaitAct()
    if pkList.id[pkCnt] ~= nil then
        exe('kill ' .. pkList[pkCnt].id)
    else
        messageShow('蝶梦楼全自动模块：PK模块结束.........', 'yellow')
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function pkHeqiCheck()
    DeleteTriggerGroup("hpheqi")
    create_trigger_t('hpheqi1', "^·合气度·\\s*\\-?\\s*(\\d*)", '', 'hpHeqiCheck')
    SetTriggerOption("hpheqi1", "group", "hpheqi")
end
function hpHeqiCheck(n, l, w)
    local heqi = 0
    heqi = tonumber(w[1])
    if hp.qixue_per < 35 and dhd_cur > 0 then
        exe('fu dahuan dan')
    end
    if hp.qixue_per < 70 and cty_cur > 0 then
        exe('fu chantui yao')
    end
    if (hp.qixue /(hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe('fu chantui yao')
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe('yun qi')
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe('yun jing')
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- 内力小于40%，优先嗑川贝丸！
        exe('eat ' .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- 内力小于30%，再嗑黄芪丹！
        exe('eat ' .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- 内力小于10%，嗑内息丸！
        exe('eat ' .. drug.neili1)
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe('yun jingli')
    end
    if hp.qixue_per < 80 then
        exe('eat ' .. drug.heal)
    end
    if perform.force and perform.force == "dulong-dafa" and(not flag.wudi or flag.wudi == 0) then
        exe('yun wudi')
    end
    if perform.force and perform.force == "dulong-dafa" and hp.qixue_per < 70 then
        exe('yun wudi')
    end
    if heqi >= 840 then
        create_alias('l_pkPfm', 'l_pkPfm', 'alias pfmpfm ' .. GetVariable('pfmsanqing'))
        exe('l_pkPfm')
        exe('set wimpycmd pfmpfm\\hp')
    end
end
function pkPfmSet(n, l, w)
    local subPfm = string.lower(w[2])
    create_alias('pkPfm', 'pkPfm', 'alias pfmpfm perform ' .. subPfm .. ';perform ' .. subPfm)
    exe('pkPfm')
end
function dmlInPk()
    DeleteTimer('dmlPkCheck')
    pkCnt = pkCnt + 1
end
function dmlChanceOut()
    DeleteTriggerGroup("dmlPk")
    DeleteTimer('dmlPkCheck')
    kezhiwugongclose()
    messageShow('蝶梦楼全自动模块：PK模块结束.........', 'yellow')
    return check_food()
end
function dmlPkFaint()
    exe('kill ' .. npc_id)
    return dmlPkSucceed()
end
function dmlPkSucceed()
    messageShow('蝶梦楼全自动模块：PK玩家【' .. npc_name .. '】成功.........', 'lime')
    if pkCnt - 1 < table.getn(pkList.id) then
        return dmlPkStart()
    else
        messageShow('蝶梦楼全自动模块：PK模块结束.........', 'yellow')
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
function dmlPkFail()
    exe('hp')
    locl.room = '城隍庙'
    DeleteTimer('dmlPkWait')
    DeleteTimer('dmlPkCheck')
    messageShow('蝶梦楼全自动模块：PK玩家【' .. npc_name .. '】失败.........', 'red')
    if pkCnt - 1 < table.getn(pkList.id) then
        return dmlPkStart()
    else
        messageShow('蝶梦楼全自动模块：PK模块结束.........', 'yellow')
        DeleteTriggerGroup("dmlPk")
        kezhiwugongclose()
        return check_food()
    end
end
