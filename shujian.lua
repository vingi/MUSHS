require "common"
require "wait"
require "tprint"
require "Entity"
require "Role"
require "DBHelper"
require "rooms"
require "lujing"
require "duhe"
require "Member"
require "Sect"
require "chat"
require "Bag"
require "Study"
require "Jobs"
-- require "emoted"smyteam
require "skill"
require "weapon"
-- require "hubiao"
require "show_switch"
require "gag"
require "dummy"
require "kezhiwugong"
require "armor"
require "xiaobao"
statusbar = require "StatusBar"  -- hp状态栏插件
-- 状态栏启用
statusbar.Init()

SJ = { }


skills = { }
-- if hp.exp>800000 then
skillsLingwu = {
    "force",
    "finger",
    "parry",
    "dodge",
    "strike",
    "blade",
    "cuff",
    "claw",
    "hand",
    "leg",
    "whip",
    "club",
    "sword",
    "stick",
    "hammer",
    "dagger",
    "brush",
    "throwing",
    "spear",
    "staff",
    "axe"
}
-- else
-- skillsLingwu={'finger','parry','dodge','strike','blade','cuff','claw','hand','leg','whip','club','sword','stick','hammer','dagger','brush','throwing','spear','staff','axe'}
-- end

master = { }
perform = { }
lost_name = 0
needdolost = 0
flagFull = { }
tmp = { }
condition = { }
weapon = { }


bags = { }
Bag = { }
team = { }
xcexp = 1
lingwudie = 0
needxuexi = 1
xxpot = 0
xuefull = 0
lookxin = 0
leweapon = "none"
jherror = 0
inwdj = 0
dugujian = 0
l_pot = 0
haltbusy = 0
smyteam = 16
tdhdz = 1
smyall = 2
lostno = 10
vippoison = 0
ptbxvip = 1
kdummy = 0
mydummy = false
double_kill = nil
ypt_lianskills = 0
scorexy = false
LLlost = 0
needvpearl = 0
doubleexp = 0
dzxy_level = 0
need_dzxy = "yes"

cty_cur = 0
nxw_cur = 0
hxd_cur = 0
dhd_cur = 0
kuang_cur = 0
go_on_smy = 0 -- 20161117增加变量go_on_smy开关控制 防止系统重启后自动打开颂摩崖
ebooktimes = 0
lostletter_locate = ""
ll = { }
ll.area = ""
ll.room = ""


-- ain

local cun_hammer = tonumber(GetVariable("autocun_hammer"))
if cun_hammer == 1 then
    itemSave = {
        ["倚天匠技残篇"] = true,
        ["屠龙匠技残篇"] = true,
        ["韦兰之锤"] = true,
        ["金铁锤"] = true,
        ["神铁锤"] = true
    }
else
    itemSave = {
        ["倚天匠技残篇"] = true,
        ["屠龙匠技残篇"] = true,
        ["韦兰之锤"] = true,
        ["金铁锤"] = true,
        ["神铁锤"] = true
    }
end

i = 1

function check_skills(n, l, w)
    local l_skills = " "
    if w[3] then
        l_skills = l_skills .. w[3]
    end
    if w[4] then
        l_skills = l_skills .. w[4]
    end
    if w[5] then
        l_skills = l_skills .. w[5]
    end
    l_skills = Trim(l_skills)
    skills[l_skills] = skills[l_skills] or { }
    skills[l_skills].lvl = tonumber(w[6])
    skills[l_skills].pot = tonumber(w[7])
    skills[l_skills].name = Trim(w[2])
    if skills[l_skills].lvl >= 450 then
        skills[l_skills].mstlvl = 450
    end
    if l_skill == "force" and skills[l_skills].mstlvl < 450 and skills[l_skills].mstlvl == hp.pot_max - 101 then
        skills[l_skills].mstlvl = nil
    end
end

hp_jingxue_check = function(n, l, w)
    hp.jingxue = tonumber(w[1])
    hp.jingxue_max = tonumber(w[2])
    hp.jingxue_per = tonumber(w[3])
    hp.jingli = tonumber(w[4])
    hp.jingli_max = tonumber(w[5])
    hp.jingli_lim = tonumber(w[6])
    hp:update()
end
hp_qixue_check = function(n, l, w)
    hp.qixue = tonumber(w[1])
    hp.qixue_max = tonumber(w[2])
    hp.qixue_per = tonumber(w[3])
    hp.neili = tonumber(w[4])
    hp.neili_max = tonumber(w[5])
    hp:update()
end
hp_shen_check = function(n, l, w)
    local l_type = tostring(w[1])
    hp.shen = tonumber(del_string(tostring(w[2]), ","))
    hp.neili_lim = tonumber(w[3])
    if l_type == "戾" then
        hp.shen = hp.shen * -1
    end
    hp:update()
end
hp_pot_check = function(n, l, w)
    hp.food = tonumber(w[1])
    hp.pot = tonumber(w[2])
    hp.pot_max = tonumber(w[3])

    for p in pairs(skillEnable) do
        -- ain 200level->160
        q = skillEnable[p]
        if skills[p] and skills[q] then
            skills[p].full = 0

            if q == "force" and(hp.pot < 50 or skills[p].lvl < 150) then
                skills[p].full = 1
            end
            -- if (skills[p].lvl==skills[q].lvl and skills[p].pot==(skills[p].lvl+1)*(skills[p].lvl+1)) or skills[p].lvl>skills[q].lvl then
            if skills[p].lvl >= skills[q].lvl then
                skills[p].full = 1
            end
            if skills[p].fullever then
                skills[p].full = 1
            end
            if skills[p].lvl >= hp.pot_max - 100 then
                skills[p].full = 1
            end
            if p == "wuxiang-zhi" then
                if not skills[p].olvl then
                    skills[p].olvl = skills[p].lvl
                end
                if skills[p].lvl > skills[p].olvl then
                    flag.wxjz = 0
                    skills[p].olvl = skills[p].lvl
                end
            end
            if p == "wuxiang-zhi" and(skills[p].lvl < 200 or flag.wxjz == 0) then
                skills[p].full = 1
            end
        end
    end
    if perform.force then
        if not skills[perform.force] then
            perform.force = nil
        end
    end
    if not perform.force then
        tmp.lvl = 0
        for p in pairs(skills) do
            q = skillEnable[p]
            if q == "force" then
                if skills[p].lvl > tmp.lvl then
                    tmp.lvl = skills[p].lvl
                    perform.force = p
                end
            end
        end
    end
    if skills["parry"] and skills["parry"].lvl <= hp.pot_max - 100 and skills["parry"].lvl < 450 then
        flag.xuexi = 1
    end
    hp:update()
end
hp_exp_check = function(n, l, w)
    hp.water = tonumber(w[1])
    hp.exp = tonumber(del_string(tostring(w[2]), ","))
    hp:update()
end

hp_dazuo_check = function(n, l, w)
    hp.dazuo = trans(w[1])
    exe("dazuo " .. hp.dazuo)
end
score_tb_check = function(n, l, w)
    score.tb = tonumber(w[1])
    score.yb = tonumber(w[2])
    score.jjb = tonumber(w[3])
end
score_lv_check = function(n, l, w)
    score.level = tonumber(w[1])
    score.dead = tonumber(w[2])
    score.buildweapon = tonumber(w[3])
end
score_ebook_check = function(n, l, w)
    ebooktimes = trans(w[1])
end
score_name_check = function(n, l, w)
    score.name = tostring(w[1])
    score.id = string.lower(tostring(w[2]))
    score.dex_t = tonumber(w[3])
    score.dex = tonumber(w[4])
    score.int_t = tonumber(w[5])
    score.int = tonumber(w[6])
end
score_title_check = function(n, l, w)
    score.title = Trim(tostring(w[1]))
    score.str_t = tonumber(w[2])
    score.str = tonumber(w[3])
    score.con_t = tonumber(w[4])
    score.con = tonumber(w[5])
end
score_age_check = function(n, l, w)
    score.age = trans(w[1])
end
score_gold_check = function(n, l, w)
    score.vip = w[1]
    score.gold = trans(w[2])
    if score.gold == nil then
        score.gold = 0
    end
end
score_party_check = function(n, l, w)
    local hasInit = true
    if score == nil or score.party == nil then
        hasInit = false
    end
    score.party = w[3]
    score.master = w[4]
    if score.party == "普通百姓" then
        score.master = "普通百姓"
    end
    if hasInit == false then
        IndependentOnload()
    end
end
score_check_xy = function(n, l, w)
    score.xiangyun = Trim(w[1])
    -- 六个状态，生、旺、败、平、衰、死
    if scorexy == false then
        scorexy = smyteam * 1
    end
    if score.xiangyun == "衰" or score.xiangyun == "死" then
        -- if job.zuhe["songmoya"] then job.zuhe["songmoya"]=nil end
        if smyteam >= scorexy then
            smyteam = scorexy - 1
        end
    else
        -- if go_on_smy~=0 and job.zuhe["songmoya"]==nil then job.zuhe["songmoya"]=true end
        if smyteam < scorexy then
            smyteam = scorexy * 1
        end
    end
end
score_busy_check = function(n, l, w)
    local l_char = del_string(w[2], " ")
    l_char = del_string(l_char, "??")
    local l_cnt = trans(l_char)
    if w[3] == "分" then
        -- print(condition.poison,condition.busy)
        if w[1] == "雪山强抢美女" then
            condition.xueshan = l_cnt * 60
        end
        if w[1] == "双倍经验" then
            condition.ebook = l_cnt * 60
        end
        if w[1] == "明悟" then
            condition.mingwu = l_cnt * 60
        end
        if w[1] == "真实视野" then
            condition.vpearl = l_cnt
        end
        if w[1] == "寒毒" then
            vippoison = 1
            condition.poison = l_cnt * 60
        end
        if w[1] == "蔓陀萝花毒" then
            vippoison = 1
        end
        if w[1] == "星宿掌毒" then
            vippoison = 1
            condition.poison = l_cnt * 60
        end
        if w[1] == "虎爪绝户手伤" then
            condition.poison = l_cnt * 60
        end
        if w[1] == "任务繁忙状态" then
            condition.busy = l_cnt * 60
            MissionPunishment.PunishmentHandle(condition.busy)
        end
        if w[1] == "福州镖局护镖倒计时" then
            condition.hubiao = l_cnt * 60
        end
    else
        -- print(condition.poison,condition.busy)
        if w[1] == "雪山强抢美女" then
            condition.xueshan = l_cnt
        end
        if w[1] == "双倍经验" then
            condition.ebook = l_cnt
        end
        if w[1] == "明悟" then
            condition.mingwu = l_cnt
        end
        if w[1] == "真实视野" then
            condition.vpearl = l_cnt
        end
        if w[1] == "寒毒" then
            vippoison = 1
            condition.poison = l_cnt
        end
        if w[1] == "蔓陀萝花毒" then
            vippoison = 1
        end
        if w[1] == "星宿掌毒" then
            vippoison = 1
            condition.poison = l_cnt
        end
        if w[1] == "虎爪绝户手伤" then
            condition.poison = l_cnt
        end
        if w[1] == "任务繁忙状态" then
            condition.busy = l_cnt
            MissionPunishment.PunishmentHandle(condition.busy)
        end
        if w[1] == "福州镖局护镖倒计时" then
            condition.hubiao = l_cnt
        end
    end
end
score_gender_check = function(n, l, w)
    if string.len(w[1]) == 2 then
        score.gender = w[1]
    end
    if string.len(w[2]) == 8 then
        score.level = w[2]
    end
end
hpheqi = function()
    DeleteTriggerGroup("hpheqi")
    create_trigger_t("hpheqi1", "^·合气度·\\s*(\\d*)", "", "hp_heqi_check")
    SetTriggerOption("hpheqi1", "group", "hpheqi")
    EnableTriggerGroup("hpheqi", false)
end
function test()
    Note("到达目的地！")
    -- return fight_prepare()
end
function test_text()
    Note("TEXT")
end
beihook = test
halthook = test

function SJ.Init()
    SJ.Config()
    setAlias()
    delete_all_triggers()
    delete_all_timers()
    DeleteTemporaryTriggers()
    create_trigger_t("main", "^「书剑\\D*」\\D*已经连续执行了", "", "login")
    create_trigger_t("main1", "^Are you using BIG5 font\\(y/N\\)? ", "", "login_choose")
    lujing_trigger()
    duheduhe_trigger()  ------加载渡河函数
    chat_trigger()
    hp_trigger()
    fight_trigger()
    fight_prepare()
    idle()
    getVariable()
    userGet()
    hpheqi()
    -- 任务统计
    job.statistics_Init()
    -- 激活 StatusBar
    statusbar.Activate()
    -- 激活 消息过滤
    gag.Activate()

    -- ain
    Openfpk()

    map.rooms["sld/lgxroom"].ways["#outSld"] = "huanghe/huanghe8"
    exe("down;alias askk ask $*;stand;halt;uweapon;score;cha;hp;jifa all;jiali max;unset no_kill_ap;cond;pfmset")

end

-- ---------------------------------------------------------------
-- 书剑初始化设置
-- ---------------------------------------------------------------
function SJ.Config()
    needdolost = 0
end

-- ---------------------------------------------------------------
-- 特异性加载, 即根据条件独立加载, 如不同门派加载特有的部分
-- ---------------------------------------------------------------
function IndependentOnload()
    Sect.Onload()
end

function main()
    SJ.Init()
    if GetRoleConfig("AutoBuy_Xiaobao_Longquan") and not Bag["龙泉剑"] then
        xiaobao.buy()
    else
        if not perform.skill or not perform.pre or not job.zuhe or countTab(job.zuhe) < 2 then
            return shujian_set()
        else
            return check_bei(hp_dazuo_count)
        end
    end
end

function login_choose()
    Send("n")
end

function login()
    dis_all()
    DeleteTriggerGroup("login")
    create_trigger_t("login2", "^请您输入这个人物的识别密码\\(passwd\\)：", "", "login_passwd")
    SetTriggerOption("login2", "group", "login")
    local l_id = GetVariable("id")
    local l_passwd = GetVariable("passwd")
    Note(l_id, l_passwd)
    if l_id ~= nil and l_passwd ~= nil then
        Send(l_id)
        Send(l_passwd)
        Send("y")
    else
        return shujian_set()
    end
end
function login_passwd()
    EnableTriggerGroup("login", false)
    wait.make(
    function()
        wait.time(2)
        main()
    end
    )
end
function disAll()
    local tl = GetTriggerList()
    if tl then
        for k, v in ipairs(tl) do
            EnableTrigger(v, false)
        end
    end
    delete_all_timers()
    if lookxin == 1 then
        sendXin()
    end
    EnableTrigger("main", true)
    EnableTrigger("main1", true)
    EnableTriggerGroup("hp", true)
    EnableTriggerGroup("score", true)
    EnableTriggerGroup("duheduhe", true)
    -- ain
    EnableTrigger("pk1", true)
    EnableTrigger("pk2", true)
    EnableTriggerGroup("buyao", true)
end
function dis_all()
    local tl = GetTriggerList()
    if tl then
        for k, v in ipairs(tl) do
            EnableTrigger(v, false)
        end
    end
    delete_all_timers()
    -- 开启垃圾信息过滤
    gag.Activate()
    EnableTrigger("main", true)
    EnableTrigger("main1", true)
    -- EnableTrigger('idle',true)
    EnableTriggerGroup("chat", true)
    EnableTriggerGroup("hp", true)
    EnableTriggerGroup("score", true)
    EnableTriggerGroup("count", true)
    EnableTriggerGroup("fight", true)
    EnableTriggerGroup("job_exp", true)
    EnableTriggerGroup("duheduhe", true)
    EnableTrigger("hp12", false)
    if lookxin == 1 then
        sendXin()
    end
    -- ain
    EnableTrigger("pk1", true)
    EnableTrigger("pk2", true)
    EnableTriggerGroup("buyao", true)
    beihook = test
    busyhook = test
    waithook = test
    flag.find = 1
    -- thread_resume(lookfor)
    idle()
end
function delete_all_triggers()
    local tl = GetTriggerList()
    if tl then
        for k, v in ipairs(tl) do
            DeleteTrigger(v)
        end
    end
end
function delete_all_timers()
    local tl = GetTimerList()
    if tl then
        for k, v in ipairs(tl) do
            DeleteTimer(v)
        end
    end
end
hp_dazuo_count = function()
    DeleteTriggerGroup("dz_count")
    create_trigger_t("dz_count1", "^>*\\s*卧室不能打坐，会影响别人休息。", "", "hp_dz_where")
    create_trigger_t("dz_count2", "^>*\\s*你无法静下心来修炼。", "", "hp_dz_where")
    create_trigger_t("dz_count3", "^>*\\s*(这里不准战斗，也不准打坐。|这里可不是让你提高内力的地方。)", "", "hp_dz_where")
    create_trigger_t("dz_count4", "^(> )*你现在手脚戴着镣铐，不能做出正确的姿势来打坐", "", "hp_dz_liaokao")
    create_trigger_t("dz_count5", "^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)", "", "hp_dz_where")
    create_trigger_t("dz_count6", "^(> )*你现在精不够，无法控制内息的流动！", "", "loginerror")
    SetTriggerOption("dz_count1", "group", "dz_count")
    SetTriggerOption("dz_count2", "group", "dz_count")
    SetTriggerOption("dz_count3", "group", "dz_count")
    SetTriggerOption("dz_count4", "group", "dz_count")
    SetTriggerOption("dz_count5", "group", "dz_count")
    SetTriggerOption("dz_count6", "group", "dz_count")
    if perform.force and skills[perform.force] then
        exe("jifa force " .. perform.force)
    else
        for p in pairs(skills) do
            if skillEnable[p] == "force" then
                exe("jifa force " .. p)
                exe("cha")
            end
        end
    end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 then
        exe("yun yinyang")
    end
    if skills["force"] and skills["force"].lvl < 450 and skills["force"].lvl <= hp.pot_max - 100 then
        flag.xuexi = 1
    end
    exe("yun qi;hp")
    hp.dazuo = 10
    return check_bei(hp_dazuo_act)
end
loginerror = function()
    DeleteTriggerGroup("dz_count")
    DeleteTimer("dazuo_count")
    return checkWait(check_heal, 0.5)
end
hp_dazuo_act = function()
    tmp.qixue = hp.qixue
    exe("yun jing;dazuo " .. hp.qixue)
    tmp.i = 0
    return create_timer_s("dazuo_count", 1.5, "hp_dazuo_timer")
end
hp_dazuo_timer = function()
    tmp.i = tmp.i + 1
    if tmp.i > 30 then
        return main()
    end
    exe("hp;yun jing;yun qi;dazuo " .. hp.qixue)
    return checkWait(hp_dz_count, 0.5)
end
hp_dz_count = function()
    EnableTriggerGroup("dz_count", false)

    local l_times = 1
    if hp.qixue < tmp.qixue then
        if hp.qixue_max > 1000 then
            l_times = math.modf(math.modf(hp.qixue_max / 5) /(tmp.qixue - hp.qixue)) + 1
        end
        hp.dazuo = l_times *(tmp.qixue - hp.qixue) + 150
        if hp.dazuo < 10 then
            hp.dazuo = 10
        end
        -- if hp.dazuo>10 and hp.dazuo <100 then
        --   l_times=math.modf(100/hp.dazuo)+1
        --   hp.dazuo=l_times*hp.dazuo
        -- end
        Note("最佳打坐值为：" .. hp.dazuo)
        DeleteTriggerGroup("dz_count")
        DeleteTimer("dazuo_count")
        exe("halt")
        if kdummy == 1 and hp.exp > 2000000 then
            opendummy()
        end
        return check_bei(vcheck)
    end
end
function vcheck()
    return Gstart()
end
function Gstart()
    return check_bei(check_food)
end
hp_dz_where = function()
    EnableTriggerGroup("dz_count", false)
    DeleteTimer("dazuo_count")
    locate()
    check_bei(hp_dz_go)
end
hp_dz_go = function()
    EnableTriggerGroup("dz_count", true)
    exe(locl.dir)
    hp_dazuo_act()
end
function hp_dz_liaokao()
    dis_all()
    return tiaoshui()
end

function hp_trigger()
    DeleteTriggerGroup("hp")
    create_trigger_t('hp1', "^·精血·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*·精力·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\((\\d*)\\)$", '', 'hp_jingxue_check')
    create_trigger_t('hp2', "^·气血·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*·内力·\\s*(\\d*)\\s*\\/\\s*(\\s*\\d*)\\(\\+\\d*\\)$", '', 'hp_qixue_check')
    create_trigger_t('hp3', "^·食物·\\s*(\\d*)\\.\\d*\\%\\s*·潜能·\\s*(\\d*)\\s*\\/\\s*(\\d*)$", '', 'hp_pot_check')
    create_trigger_t('hp4', "^·饮水·\\s*(\\d*)\\.\\d*\\%\\s*·经验·\\s*(.*)\\s*\\(", '', 'hp_exp_check')
    create_trigger_t('hp5', "^·(戾|正)气·\\s*(.*)\\s*·内力上限·\\s*(\\d*)\\s*\\/", '', 'hp_shen_check')
    create_trigger_t('hp7', "^(□)*\\s*(\\D*)\\s*\\((\\D*)(\\-)*(\\D*)\\)\\s*\\-\\s*\\D*\\s*(\\d*)\\/\\s*(\\d*)$", '', 'check_skills')
    create_trigger_t('hp8', "^>*\\s*你至少需要(\\D*)点的气来打坐！", '', 'hp_dazuo_check')
    create_trigger_t('hp9', "^│(\\D*)任务\\s*│\\s*(\\d*) 次\\s*│ ", '', 'checkJobtimes')
    create_trigger_t('hp10', "^□(\\D*)\\(\\D*\\)$", '', 'checkWieldCatch')
    create_trigger_t('hp11', "^(> )*你最近刚完成了(\\D*)任务。$", '', 'checkJoblast')
    create_triggerex_lvl('hp12', "^(> )*(\\D*)", '', 'resetWait', 200)
    create_trigger_t('hp13', "^(> )*你还在巡城呢，仔细完成你的任务吧。", '', 'checkQuit')
    create_trigger_t('hp14', "^\\D*被一阵风卷走了。$", '', 'checkRefresh')
    create_trigger_t('hp15', "^(> )*一个月又过去", '', 'checkMonth')
    create_trigger_t('hp16', "^(> )*昨天完成失落信笺任务(\\N*)次，今天完成失落信笺任务(\\N*)/(\\N*)次。", '', 'checkLLlost')
    create_trigger_t('hp17', "^(> )*你(渴得眼冒金星，全身无力|饿得头昏眼花，直冒冷汗)", '', 'checkQuit')
    create_trigger_t('hp18', "^(> )*(你舔了舔干裂的嘴唇，看来是很久没有喝水了|突然一阵“咕咕”声传来，原来是你的肚子在叫了)", '', 'checkfood')
    create_trigger_t('hp19', "^(> )*(忽然一阵刺骨的奇寒袭来，你中的星宿掌毒发作了|忽然一股寒气犹似冰箭，循着手臂，迅速无伦的射入胸膛，你中的寒毒发作了)", '', 'checkDebug')
    create_trigger_t('hp20', "^(> )*你(服下一颗活血疗精丹，顿时感觉精血不再流失|服下一颗内息丸，顿时觉得内力充沛了不少|服下一颗川贝内息丸，顿时感觉内力充沛|服下一颗黄芪内息丹，顿时感觉空虚的丹田充盈了不少|敷上一副蝉蜕金疮药，顿时感觉伤势好了不少|吃下一颗大还丹顿时伤势痊愈气血充盈)。", '', 'hpeatOver')
    create_trigger_t('hp21', "^(> )*你必须先用 enable 选择你要用的特殊内功。", '', 'jifaOver')
    create_trigger_t('hp22', "^(> )*(\\D*)目前学过(\\D*)种技能：", '', 'show_skills')
    create_trigger_t('hp23', "^(> )*你的背囊里有：", '', 'show_beinang')
    create_trigger_t('hp24', '^(> )*你眼中一亮看到\\D*的身边掉落一(件|副|双|袭|顶|个|条|对)(\\D*)(手套|靴|甲胄|腰带|披风|彩衣|头盔)。', '', 'fqyyArmorGet')
    create_trigger_t('hp25', '^(> )*你捡起一(件|副|双|袭|顶|个|条|对)(\\D*)(手套|靴|甲胄|腰带|披风|彩衣|头盔)。', '', 'fqyyArmorCheck')
    create_trigger_t('hp26', '^(> )*(\\D*)客官已经付了银子，怎(么|麽)不住店就走了呢(\\D*)$', '', 'kedian_sleep')
    SetTriggerOption("hp1", "group", "hp")
    SetTriggerOption("hp2", "group", "hp")
    SetTriggerOption("hp3", "group", "hp")
    SetTriggerOption("hp4", "group", "hp")
    SetTriggerOption("hp5", "group", "hp")
    SetTriggerOption("hp7", "group", "hp")
    SetTriggerOption("hp8", "group", "hp")
    SetTriggerOption("hp9", "group", "hp")
    SetTriggerOption("hp10", "group", "hp")
    SetTriggerOption("hp11", "group", "hp")
    SetTriggerOption("hp12", "group", "hp")
    SetTriggerOption("hp13", "group", "hp")
    SetTriggerOption("hp14", "group", "hp")
    SetTriggerOption("hp15", "group", "hp")
    SetTriggerOption("hp16", "group", "hp")
    SetTriggerOption("hp17", "group", "hp")
    SetTriggerOption("hp18", "group", "hp")
    SetTriggerOption("hp19", "group", "hp")
    SetTriggerOption("hp20", "group", "hp")
    SetTriggerOption("hp21", "group", "hp")
    SetTriggerOption("hp22", "group", "hp")
    SetTriggerOption("hp23", "group", "hp")
    SetTriggerOption("hp24", "group", "hp")
    SetTriggerOption("hp25", "group", "hp")
    SetTriggerOption("hp26", "group", "hp")
    DeleteTriggerGroup("score")
    create_trigger_t('score1', "^┃姓    名：(\\D*)\\((\\D*)\\)\\s*┃身  法：「(\\d*)\/(\\d*)」\\s*悟  性：「(\\d*)\/(\\d*)」", '', 'score_name_check')
    create_trigger_t('score2', "^┃头    衔：(\\D*)\\s*┃膂  力：「(\\d*)\/(\\d*)」\\s*根  骨：「(\\d*)\/(\\d*)」", '', 'score_title_check')
    create_trigger_t('score3', "^┃年    龄：(\\D*)岁\\D*\\s*生    辰：", '', 'score_age_check')
    create_trigger_t('score4', "^│(任务繁忙状态|雪山强抢美女|双倍经验|明悟|寒毒|星宿掌毒|蔓陀萝花毒|虎爪绝户手伤|福州镖局护镖倒计时|真实视野)\\s*(\\D*)(分|秒)\\s*", '', 'score_busy_check')
    create_trigger_t('score5', "^┃(婚    姻|娇    妻|夫    君)：(\\D*)\\s*师\\s*承：【(\\D*)】【(\\D*)】", '', 'score_party_check')
    create_trigger_t('score6', "^┃性    别：(\\D*)性\\s*攻：(\\D*)\\s* 躲：", '', 'score_gender_check')
    create_trigger_t('score7', "^┃(婚    姻|娇    妻|夫    君)：(\\D*)\\s*师\\s*承：【(普通百姓)】(\\D*)", '', 'score_party_check')
    create_trigger_t('score9', "^┃注    册：(\\D*)\\s*钱庄存款：(\\D*)", '', 'score_gold_check')
    create_trigger_t('score8', "^您目前的存款上限是：(\\D*)锭黄金", '', 'checkGoldLmt')
    create_trigger_t('score10','^┃致命抗性：\\d*\\s*理相：(\\D*)\\((\\d*)\\)\\s*┃','','score_check_xy')
    create_trigger_t('score11', '^┃书剑通宝：(\\N*)\\s*书剑元宝：(\\N*)\\s*竞技币：(\\N*)\\s*┃', '', 'score_tb_check')
    create_trigger_t('score12', '^┃当前等级：(\\N*)\\s*死亡：(\\N*)\\s*打造机会：(\\N*)\\s*┃', '', 'score_lv_check')
    create_trigger_t('score13', "^本周您已经使用精英之书(\\D*)次。", '', 'score_ebook_check')
    SetTriggerOption("score1", "group", "score")
    SetTriggerOption("score2", "group", "score")
    SetTriggerOption("score3", "group", "score")
    SetTriggerOption("score4", "group", "score")
    SetTriggerOption("score5", "group", "score")
    SetTriggerOption("score6", "group", "score")
    SetTriggerOption("score7", "group", "score")
    SetTriggerOption("score8", "group", "score")
    SetTriggerOption("score9", "group", "score")
    SetTriggerOption("score10", "group", "score")
    SetTriggerOption("score11", "group", "score")
    SetTriggerOption("score12", "group", "score")
    SetTriggerOption("score13", "group", "score")
end

function jifaOver()
    exe("jifa all")
end

function checkDebug()
    messageShow("您中毒了!")
    vippoison = 1
    exe("look bei nang;hp")
    if job.name == "songmoya" then
        exe("set wimpycmd halt\\down\\hp")
        job.name = "poison"
        return check_halt(fangqiypt)
    end
    if hxd_cur > 0 then
        create_timer_s("eatdan", 3, "hpEat")
    else
        dis_all()
        return check_halt(check_xue)
    end
end

function hpEat()
    exe("eat huoxue dan")
end
function hpeatOver(n, l, w)
    local l = w[2]
    if string.find(l, "敷上一副蝉蜕金疮药，顿时感觉伤势好了不少") then
        cty_cur = cty_cur - 1
    end
    if string.find(l, "服下一颗内息丸，顿时觉得内力充沛了不少") then
        nxw_cur = nxw_cur - 1
    end
    if string.find(l, "服下一颗川贝内息丸，顿时感觉内力充沛") then
        cbw_cur = cbw_cur - 1
    end
    if string.find(l, "服下一颗黄芪内息丹，顿时感觉空虚的丹田充盈了不少") then
        hqd_cur = hqd_cur - 1
    end
    if string.find(l, "服下一颗活血疗精丹，顿时感觉精血不再流失") then
        DeleteTimer("eatdan")
        hxd_cur = hxd_cur - 1
    end
    if string.find(l, "吃下一颗大还丹顿时伤势痊愈气血充盈") then
        messageShow("吃大还丹了！")
        dhd_cur = dhd_cur - 1
    end
end
function checkQuit()
    dis_all()
    check_halt(BQuit)
end
function BQuit()
    exe("quit")
end
function checkfood()
    if job.name == "songmoya" then
        return
    else
        dis_all()
        return check_halt(check_food)
    end
end
function checkLLlost(n, l, w)
    LLlost = tonumber(w[4])
    if (condition.vpearl == 0 or not condition.vpearl) and needdolost == 1 and needvpearl == 1 then
        return Govpearl()
    end
    if LLlost * 1 >= lostno * 1 and needdolost == 1 then
        return dolostAg()
    end
end

function Govpearl()
    return go(dhvpearl, "扬州城", "当铺")
end
function dhvpearl()
    exe("duihuan vpearl;cond")
    if lostletter == 1 and needdolost == 1 then
        return letterLost()
    end
    if LLlost * 1 >= lostno * 1 and needdolost == 1 then
        return dolostAg()
    end
    return check_halt(check_food)
end
function dhlost()
    exe("duihuan pcert")
    return check_halt(check_food)
end
function checkMonth()
    flag.month = 1
end
function checkTongbao(n, l, w)
    score.tongbao = tonumber(w[1])
end
function checkGoldLmt(n, l, w)
    score.goldlmt = trans(w[1])
end

function jifaAll()
    for p in pairs(skills) do
        local sk = qrySkillEnable(p)
        if sk and sk["force"] and perform.force and perform.force == p then
            exe("jifa force " .. p)
        end
        if sk and not sk["force"] then
            for q in pairs(sk) do
                if skills[q] and skills[p].lvl >= skills[q].lvl then
                    exe("jifa " .. q .. " " .. p)
                end
            end
        end
    end
end
function jifaDodge()
    for p in pairs(skills) do
        q = skillEnable[p]
        if q == "dodge" and skills[q] and skills[p].lvl >= skills[q].lvl then
            exe("jifa " .. q .. " " .. p)
            break
        end
    end
end

function xxSleepcheck()
    exe("give caihua 1 coin")
    wait.make(
    function()
        wait.time(1)
        exe("enter;sleep")
        xuexiSleepOver()
    end
    )
end

-- ---------------------------------------------------------------
-- 客栈被小二busy触发处理..
-- ---------------------------------------------------------------
function kedian_sleep()
    -- 路径合并了！适用所有客栈！
    exe('up;n;enter;sleep')
    checkWait(locate, 3)
    walk_wait()
end

function yunAddInt()
    if perform.force and perform.force == "linji-zhuang" then
        exe("yun zhixin")
    end
    if perform.force and perform.force == "bihai-chaosheng" then
        exe("yun qimen")
    end
    if perform.force and perform.force == "yunu-xinjing" then
        exe("yun xinjing")
    end
end

function wuxingzhen()
    DeleteTemporaryTriggers()
    flag.times = 1
    return go(wuxingzhenCheck, "襄阳城", "卧房")
end
function wuxingzhenCheck()
    if locl.id["温方山"] then
        return wuxingzhenStart()
    else
        local l_cnt = table.getn(getRooms("卧房", "襄阳城"))
        flag.times = flag.times + 1
        if flag.times > l_cnt then
            return wuxingzhenFinish()
        else
            local l_sour = getRooms("卧房", "襄阳城")[flag.times - 1]
            return go(wuxingzhenCheck, "襄阳城", "卧房", l_sour)
        end
    end
end
function wuxingzhenStart()
    exe("yun jing")
    exe("ask wen fangshan about 五行阵")
    if math.random(1, 5) == 1 then
        exe("cha;hp")
        locate()
    end
    return check_bei(wuxingzhenCon, 1)
end
function wuxingzhenCon()
    if skills["wuxing-zhen"] and skills["wuxing-zhen"].lvl > 159 then
        return wuxingzhenFinish()
    end
    if not locl.id["温方山"] or hp.pot < 10 then
        return wuxingzhenFinish()
    end
    return checkWait(wuxingzhenStart, 0.5)
end
function wuxingzhenFinish()
    return check_heal()
end

function checkPrepare()
    EnableTriggerGroup("poison", false)
    DeleteTriggerGroup("poison")
    drugPrepare = drugPrepare or { }

    if hp.exp < 150000 then
        return checkPrepareOver()
    end

    if Bag["镣铐"] then
        return tiaoshui()
    end

    if Bag and Bag["白银"] and Bag["白银"].cnt and Bag["白银"].cnt > 500 then
        return check_gold()
    end
    if
        (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt < count.gold_max and score.gold > count.gold_max) or
        (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt > count.gold_max * 4)
    then
        return check_gold()
    end

    if score.gold and score.gold > 100 and nxw_cur < 5 and drugPrepare["内息丸"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and cbw_cur < 5 and drugPrepare["川贝内息丸"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and hqd_cur < 5 and drugPrepare["黄芪内息丹"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and cty_cur < 5 and drugPrepare["蝉蜕金疮药"] then
        return checkHxd()
    end

    --[[if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["邪气丸"] or Bag["邪气丸"].cnt<2) then
       return checkXqw()
   end

   if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["正气丹"] or Bag["正气丹"].cnt<2) then
       return checkZqd()
   end

   if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["邪气丸"] or Bag["邪气丸"].cnt<2) then
       return checkXqw()
   end

   if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["正气丹"] or Bag["正气丹"].cnt<2) then
       return checkZqd()
   end]]
    if not flag.item then
        if score.party and score.party == "峨嵋派" and not Bag["腰带"] then
            return check_item()
        end
        if score.party == "少林派" and not Bag["护腰"] and not Bag["护腕"] then
            return check_item()
        end
    end

    if not Bag["火折"] and drugPrepare["火折"] then
        return checkFire()
    end
    if score.gold and score.gold > 100 and hxd_cur < 3 and drugPrepare["活血疗精丹"] then
        return checkLjd()
    end

    if score.tb and score.tb > 100 and dhd_cur < 1 and drugPrepare["大还丹"] then
        return checkdhd()
    end

    for p in pairs(weaponPrepare) do
        if weaponStore[p] and not Bag[p] and Bag["黄金"].cnt > 3 then
            return checkWeapon(p)
        end
        if weaponFunc[p] and not Bag[p] then
            return _G[weaponFuncName[p]]()
        end
        if weaponPrepare["飞镖"] and Bag["枚飞镖"].cnt < 100 then
            return checkWeapon("飞镖")
        end
    end
    local l_cut = false
    local bagItemCount = 0
    local itemNameList = ''
    for k, v in pairs(Bag) do
        bagItemCount = bagItemCount + 1
        -- itemNameList=itemNameList ..'|' .. k
    end
    -- Note('---------checkCutWeapon start  BagItemCount=' .. bagItemCount ..'---------')
    if (bagItemCount > 0) then
        -- ColourNote('blue','white',itemNameList)
        for p in pairs(Bag) do
            if weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind] == "cut" then
                l_cut = true
                break
            end
        end
    else
        l_cut = true
    end
    if not Bag["木剑"] then
        -- 让robot认定木剑为常备武器的语句
        weaponPrepare["木剑"] = true
        return checkWeapon("木剑")
    end

    if Bag["韦兰之锤"] then
        return checkHammer()
    end

    for p in pairs(Bag) do
        if Bag[p] and itemSave[p] then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["yu"] and string.find(p, "玉") then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["jintie chui"] and string.find(p, "金铁锤") then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["shentie chui"] and string.find(p, "神铁锤") then
            return checkYu(p)
        end
    end
    exe("wear all")
    return checkPrepareOver()
end
function checkPrepareOver()
    if lostletter == 1 and needdolost == 1 then
        return letterLost()
    end
    if not job.last or job.last == "songxin" or needdolost == 1 or job.last == "tdh" or job.last == "songmoya" or job.last == "huashan" or job.zuhe["hqgzc"] or job.last == "hqgzc" 
    then
        return check_xuexi()
    else
        return check_job()
    end
end

function check_xuexi()
    if MidHsDay[locl.time] and score.master == "风清扬" and (skills["dugu-jiujian"] == nil or skills["dugu-jiujian"].lvl < 460) then
        return check_job()
    end
    if needxuexi == 0 then
        return check_job()
    end
    if needxuexi == 1 then
        return check_pot()
    end
end

jobtimes = { }
function checkJobtimes(n, l, w)
    jobtimes[w[1]] = tonumber(w[2])
end

function checkJoblast(n, l, w)
    local joblast = {
        ["武当锄奸"] = "wudang",
        ["大理送信"] = "songxin",
        ["强抢美女"] = "xueshan",
        ["惩恶扬善"] = "huashan",
        ["长乐帮"] = "clb",
        ["天地会"] = "tdh",
        ["嵩山并派"] = "songshan",
        ["丐帮任务"] = "gaibang",
        ["颂摩崖抗敌任务"] = "songmoya"
    }

    if joblast[w[2]] then
        job.last = joblast[w[2]]
    end
end
-- ---------------------------------------------------------------
-- 选择下一个任务前的一系列检查及准备
-- ---------------------------------------------------------------
function check_job()
    -- if score.gold and score.gold>150 and weaponUsave and countTab(weaponUsave)>0 and math.random(1,5)==1 then
    -- return weaponUcheck()
    -- end

    -- 每10次任务检查一次武器装备
    if job.group.times ~= nil and job.group.times < 10 then
        return check_halt(check_jobx)
    else
        job.group.times = 0
        return check_halt(weaponUcheck)
    end
end
-- ---------------------------------------------------------------
-- job切换
-- ---------------------------------------------------------------
function check_jobx()
    if hp.neili_max > 15000 and (hp.neili > (hp.neili_max * 0.8)) then
        lianxi()
    end
    if hp.pot > (hp.pot_max - 100) then
        check_pot()
    else
        job.Switch()
    end
end

function check_busy(func, p_cmd)
    disWait()
    DeleteTriggerGroup("check_bei")
    create_trigger_t("check_bei1", "^(> )*(你现在已经组合|你已准备有一种技能了|你至少不会这两种拳脚技能的其中之一)", "", "beiok")
    create_trigger_t("check_bei2", "^(> )*你现在没有激发任何有效特殊技能。", "", "beinone")
    SetTriggerOption("check_bei1", "group", "check_bei")
    SetTriggerOption("check_bei2", "group", "check_bei")
    EnableTriggerGroup("check_bei", true)
    EnableTrigger("hp12", true)
    beihook = func
    if not p_cmd then
        exe("bei bei bei")
    end
    return bei_timer()
end
function bei_timer()
    return create_timer_s("bei", 0.2, "bei_timer_set")
end
function bei_timer_set()
    -- EnableTriggerGroup("check_bei",true)
    exe("bei bei bei")
end
function beinone()
    for p, q in pairs(skillEnable) do
        if skills[p] and q ~= "force" then
            exe("jifa " .. q .. " " .. p)
            if math.random(1, 3) == 1 then
                break
            end
        end
    end
end
function beiok()
    EnableTriggerGroup("check_bei", false)
    EnableTrigger("hp12", false)
    -- DeleteTimer('bei')
    -- DeleteTriggerGroup("check_bei")
    EnableTimer("bei", false)
    if beihook == nil then
        beihook = test
    end
    return beihook()
end
function check_halt(func)
    -- if func ~= nil then
    --     print("check_halt: "..tostring(func))
    -- end
    disWait()
    DeleteTriggerGroup("check_halt")
    create_trigger_t("check_halt1", "^>*\\s*(你现在不忙。|你身形向后一跃，跳出战圈不打了。)", "", "haltok")
    create_trigger_t("check_halt2", "^>*\\s*你现在很忙，停不下来。", "", "halterror")
    SetTriggerOption("check_halt1", "group", "check_halt")
    SetTriggerOption("check_halt2", "group", "check_halt")
    EnableTriggerGroup("check_halt", true)
    EnableTrigger("hp12", true)
    halthook = func
    exe("halt")
    return halt_timer()
end
function halterror()
    haltbusy = haltbusy + 1
    if haltbusy > 30 then
        haltbusy = 0
        locate()
    end
    if locl.room == "洗象池边" then
        EnableTimer("halt", false)
        wait.make(
        function()
            wait.time(5)
            haltok()
        end
        )
    end
end
function halt_timer()
    return create_timer_s("halt", 0.4, "halt_timer_set")
end
function halt_timer_set()
    -- EnableTriggerGroup("check_halt",true)
    exe("halt")
end

function haltok()
    haltbusy = 0
    EnableTriggerGroup("check_halt", false)
    EnableTrigger("hp12", false)
    -- DeleteTimer('halt')
    EnableTimer("halt", false)
    DeleteTimer('halt')
    -- DeleteTriggerGroup("check_halt")
    if halthook == nil then
        halthook = test
    end
    if type(halthook) == "table" then
        if type(halthook.func) == "function" then
            if halthook.arg4 ~= nil then
                return halthook.func(halthook.arg1, halthook.arg2, halthook.arg3, halthook.arg4)
            elseif halthook.arg3 ~= nil then
                return halthook.func(halthook.arg1, halthook.arg2, halthook.arg3)
            elseif halthook.arg2 ~= nil then
                return halthook.func(halthook.arg1, halthook.arg2)
            else
                return halthook.func(halthook.arg1)
            end
        end
    else
        return halthook()
    end
end
busyhook = test
function check_bei(func, p_cmd)
    disWait()
    DeleteTriggerGroup("check_busy")
    create_trigger_t("check_busy1", "^>*\\s*没有这个技能种类，用", "", "busyok")
    SetTriggerOption("check_busy1", "group", "check_busy")
    EnableTriggerGroup("check_busy", true)
    EnableTrigger("hp12", true)
    busyhook = func
    if not p_cmd then
        exe("jifa jifa jifa")
    end
    jifa_timer()
end
function jifa_timer()
    return create_timer_s("jifa", 0.4, "jifa_timer_set")
end
function jifa_timer_set()
    -- EnableTriggerGroup("check_busy",true)
    exe("jifa jifa jifa")
end
function busyok()
    EnableTriggerGroup("check_busy", false)
    EnableTrigger("hp12", false)
    -- DeleteTimer('jifa')
    EnableTimer("jifa", false)
    if busyhook == nil then
        busyhook = test
    end
    return busyhook()
end

waithook = test
function checkWait(func, sec)
    disWait()
    DeleteTriggerGroup("checkwait")
    create_trigger_t("checkwait1", '^(> )*你把 "action" 设定为 "等待一下" 成功完成。$', "", "checkWaitOk")
    SetTriggerOption("checkwait1", "group", "checkwait")
    EnableTriggerGroup("checkwait", true)
    EnableTrigger("hp12", true)
    waithook = func
    if sec == nil then
        sec = 5
    end
    return create_timer_s("waitimer", sec, "wait_timer_set")
end
function wait_timer_set()
    -- EnableTriggerGroup("checkwait",true)
    exe("alias action 等待一下")
end
function checkWaitOk()
    EnableTriggerGroup("checkwait", false)
    EnableTrigger("hp12", false)
    -- DeleteTimer('waitimer
    EnableTimer("waitimer", false)
    if waithook == nil then
        waithook = test
    end
    if type(waithook) == "string" or type(waithook) == "number" then
        print("waithook 赋值异常: 当前类型为 - " .. type(waithook) .. ", 当前值为 - " .. waithook)
        return test()
    end
    if type(waithook) == "function" then
        return waithook()
    end
end

nexthook = test
function checkNext(func)
    disWait()
    DeleteTriggerGroup("checknext")
    create_trigger_t("checknext1", '^(> )*你把 "action" 设定为 "继续前进" 成功完成。$', "", "checkNextOk")
    SetTriggerOption("checknext1", "group", "checknext")
    EnableTriggerGroup("checknext", true)
    EnableTrigger("hp12", true)
    nexthook = func
    next_timer_set()
    return create_timer_s("nextimer", 0.5, "next_timer_set")
end
function next_timer_set()
    exe("alias action 继续前进")
end
function checkNextOk()
    EnableTriggerGroup("checknext", false)
    EnableTrigger("hp12", false)
    EnableTimer("nextimer", false)
    if nexthook == nil then
        nexthook = test
    end
    return nexthook()
end

function disWait()
    DeleteTriggerGroup("checkwait")
    DeleteTriggerGroup("check_bei")
    DeleteTriggerGroup("check_busy")
    DeleteTriggerGroup("check_halt")
    EnableTimer("waitimer", false)
    EnableTimer("jifa", false)
    EnableTimer("halt", false)
    EnableTimer("bei", false)
end

function resetWait()
    local t = GetTimerList()
    if t and type(t) == "table" then
        for k, v in pairs(GetTimerList()) do
            -- messageShow(v)
            if IsTimer(v) == 0 and GetTimerInfo(v, 6) and tonumber(GetTimerInfo(v, 3)) < tonumber(GetTimerInfo(v, 13)) then
                messageShow(v .. " " .. "设定时间:" .. GetTimerInfo(v, 3) .. "秒，下一次时间:" .. GetTimerInfo(v, 13) .. "秒。")
                ResetTimers()
                break
            end
        end
    end
end

function trans(num)
    if not num then
        return 0
    end
    local _, _, wan, other = string.find(num, "^(.-)万(.*)$")
    local result = 0
    if wan then
        result = result + trans0(wan) * 10000
        num = other
    end
    result = result + trans0(num)
    return result
end

function trans0(num)
    num = string.gsub(num, "^十(.*)$", "一十%1")
    num = string.gsub(num, "零十", "一十")
    num = string.gsub(num, "零", "")
    local result = 0
    local numbers = { "一", "二", "三", "四", "五", "六", "七", "八", "九" }
    for k, v in pairs(numbers) do
        num = string.gsub(num, v, k)
    end
    local units = { ["0|"] = "十", ["00|"] = "百", ["000|"] = "千" }
    for k, v in pairs(units) do
        num = string.gsub(num, v, k)
    end
    for v in string.gmatch(num, "(%d+)") do
        result = result + v
    end
    return result
end

function idle()
    hp.expBak = hp.expBak or -1
    if hp.exp and hp.exp ~= hp.expBak then
        hp.expBak = hp.exp
        cntrI = countR(20)
        -- else
        -- if cntrI()<1 then
        -- cntrI = countR(20)
        -- flag.idle = 100
        -- return idle_set()
        -- end
    end
    flag.idle = 0
    return create_timer_s("idle", 30, "idle_set")
end
function idle_set()
    if job.name == "ptbx" then
        return exe("praise ptbx")
    end
    if job.name == "songmoya" then
        print("正在颂摩崖任务中，当前死亡次数【" .. smydie .. "】次！设定杀死武士组数上限为【" .. smyteam .. "】组。进行组数为第【" .. yptteam .. "】组。")
        exe("flatter")
        return
    end
    if job.name == "husong" then
        exe("aq")
        print("正在护送任务中")
        return
    end
    if job.name == "refine" then
        exe("admire2")
        print("正在提练矿石中")
        return
    end
    if flag.idle then
        print(flag.idle)
        -- 更新idle时间至状态栏
        quest.update()
    end
    exe("poem")
    if not flag.idle or type(flag.idle) ~= "number" then
        flag.idle = 0
    end
    flag.idle = tonumber(flag.idle) + 1
    if flag.idle < 8 then
        return
    end
    if flag.idle < 24 and job.name == "wudang" and wudangJob.killStartTime ~= nil then
        -- 说明已进入叫杀阶段, 鉴于武当任务的busy时间超长, 所以将允许的战斗时间延长至12分钟, 避免太长的战斗时间进入idle的判断
        return
    end
    if tonumber(flag.idle) < 10 then
        DeleteTimer("walkWait10")
        DeleteTimer("walkWait9")
        if dest.area == nil then return end
        if dest.area == '铁掌山' then
            locate()
            if locl.room ~= job.room then
                return walk_wait()
            else
                if job.name == 'wudang' then return wudangFindAct() end
                if job.name == 'huashan' then return huashanFindAct() end
                if job.name == 'xueshan' then return xueshan_find_act() end
                if job.name == 'songxin' or job.name == 'songxin2' then return songxin_find_go() end
            end
        end
        chats_log("ROBOT 可能已发呆" .. tonumber(flag.idle) / 2 .. "分钟!", "deepskyblue")
        return
    end

    scrLog()
    dis_all()
    job.statistics.IdleTime = job.statistics.IdleTime + 1
    chats_locate("定位系统：发呆" ..(tonumber(flag.idle) / 2) .. "分钟后，于【" .. locl.area .. locl.room .. "】重新启动系统！", "red")
    Disconnect()
    Connect()
end

function show_beinang()
    DeleteTriggerGroup("beinang")
    create_trigger_t("beinang1", "^(> )*(\\D*)\\(", "", "checkbeinang")
    SetTriggerOption("beinang1", "group", "beinang")
    EnableTriggerGroup("beinang", true)
    Beinang = { }
end
function checkbeinang(n, l, w)
    table.insert(Beinang, Trim(w[2]))
end

function check_item()
    if score.party and score.party == "峨嵋派" and not Bag["腰带"] then
        return check_item_go()
    elseif score.party == "少林派" and not Bag["护腰"] and not Bag["护腕"] then
        return go(checkSengxie, "嵩山少林", "防具库")
    else
        return check_item_over()
    end
end
function checkSengxie()
    exe("ask chanshi about 僧鞋")
    return check_bei(checkHuyao)
end
function checkHuyao()
    exe("ask chanshi about 护腰")
    return check_bei(checkHuwan)
end
function checkHuwan()
    exe("ask chanshi about 护腕")
    return check_bei(check_item_over)
end
function check_item_go()
    go(check_item_belt, "峨嵋山", "储物间")
end
function check_item_belt()
    exe("ask shitai about 皮腰带")
    check_bei(check_item_over)
end
function check_item_over()
    exe("drop shoes 2")
    exe("remove all")
    exe("wear all")

    flag.item = true

    return checkPrepare()
end


function checkvip()
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        exe("cond")
        return go(Vipcheck, "扬州城", "当铺")
    else
        return check_xue()
    end
end
function check_heal()
    collectgarbage("collect")
    dis_all()
    tmp = { }
    jobTriggerDel()
    job.name = "heal"
    exe("nick 赶路中")
    if score.party and score.party == "神龙教" then
        exe("yun shougong " .. score.id)
    end
    if perform.force and skills[perform.force] then
        exe("jifa force " .. perform.force)
    end
    button_smyteam()
    button_lostletter()
    check_halt(check_jingxue_count)
end
function check_jingxue_count()
    checkBags()
    if hp.exp < 150000 then
        return checkWait(check_heal_over, 1)
    elseif (hp.exp > 150000 and hp.exp < 800000) then
        -- return checkWait(check_heal_newbie,1)
        return go(check_heal_newbie, "扬州城", "药铺")
    elseif hp.jingxue_per < 96 or hp.qixue_per < 88 then
        return checkWait(checkvip, 0.1)
    else
        return checkWait(check_jingxue, 0.1)
    end
end
function check_jingxue()
    if (hp.qixue_per < 98 and hp.qixue_per > 88) and cty_cur > 0 then
        exe("eat chantui yao;hp")
        return check_busy(check_jingxue, 0.1)
    else
        if cty_cur == 0 then
            return checkHxd()
        end
        -- ain
        if score.party == "大轮寺" and hp.neili > 2000 then
            exe("yun juxue")
        end
        return check_halt(check_heal_over, 0.2)
    end
end
function check_heal_newbie()
    if hp.qixue_per < 100 then
        exe("buy jinchuang yao;eat jinchuang yao;hp")
        return check_busy(check_heal_newbie, 3)
    else
        if hp.jingxue_per < 100 then
            exe("buy yangjing dan;eat yangjing dan")
        end
        return check_halt(check_heal_over, 1)
    end
end
function check_heal_over()
    DeleteTriggerGroup("ck_xue_ask")
    DeleteTriggerGroup("ck_xue_accept")
    DeleteTriggerGroup("ck_xue_teach")
    return check_halt(checkPrepare)
end
function check_xue()
    EnableTrigger("hp19", false)
    tmp.xueSkills = { }
    tmp.xueCount = 1
    tmp.xueTimes = 0
    for p in pairs(skills) do
        if skills[p].lvl > 100 then
            table.insert(tmp.xueSkills, p)
        end
    end
    if hp.exp > 500000 then
        return go(check_xue_ask, "柳宗镇", "正厅")
    else
        return check_xue_fail()
    end
end
function check_xue_ask()
    DeleteTriggerGroup("ck_xue_ask")
    create_trigger_t("ck_xue_ask1", "^(> )*你向薛慕华打听有关『疗伤』的消息。$", "", "check_xue_accept")
    create_trigger_t("ck_xue_ask2", "^(> )*这里没有这个人", "", "check_xue_fail")
    SetTriggerOption("ck_xue_ask1", "group", "ck_xue_ask")
    SetTriggerOption("ck_xue_ask2", "group", "ck_xue_ask")
    DeleteTriggerGroup("ck_xue_accept")
    create_trigger_t("ck_xue_accept1", "^(> )*薛慕华「嘿嘿嘿」奸笑了几声。$", "", "check_xue_teach")
    create_trigger_t("ck_xue_accept2", "^(> )*一柱香的工夫过去了，你觉得伤势已经基本痊愈了。", "", "check_xue_heal")
    create_trigger_t("ck_xue_accept3", "^(> )*薛神医拿出一根银针轻轻捻入你受伤部位附近的穴道", "", "check_xue_wait")
    create_trigger_t("ck_xue_accept4", "^(> )*薛慕华似乎不懂你的意思。$", "", "check_xue_heal")
    create_trigger_t("ck_xue_accept5", "^(> )*薛慕华「啪」的一声倒在地上，挣扎着抽动了几下就死了", "", "check_xue_fail")
    SetTriggerOption("ck_xue_accept1", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept2", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept3", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept4", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept5", "group", "ck_xue_accept")
    EnableTriggerGroup("ck_xue_accept", false)
    DeleteTriggerGroup("ck_xue_teach")
    create_trigger_t("ck_xue_teach1", "^(> )*薛神医的这个技能已经不能再进步了。$", "", "check_xue_next")
    SetTriggerOption("ck_xue_teach1", "group", "ck_xue_teach")
    EnableTriggerGroup("ck_xue_teach", false)
    DeleteTriggerGroup("ck_xue_busy")
    create_trigger_t("ck_xue_busy1", "^(> )*您先歇口气再说话吧。$", "", "check_xue_busy")
    SetTriggerOption("ck_xue_busy1", "group", "ck_xue_busy")
    EnableTriggerGroup("ck_xue_busy", true)
    exe("ask xue muhua about 疗伤")
end
function check_xue_busy()
    return check_busy(check_xue_ok, 2)
end
function check_xue_ok()
    EnableTriggerGroup("ck_xue_accept", true)
    exe("ask xue muhua about 疗伤")
end
function check_xue_fail()
    EnableTriggerGroup("ck_xue_ask", false)
    EnableTriggerGroup("ck_xue_accept", false)
    EnableTriggerGroup("ck_xue_teach", false)
    return check_jingxue()
end
function check_xue_accept()
    EnableTriggerGroup("ck_xue_ask", false)
    EnableTriggerGroup("ck_xue_accept", true)
end
function check_xue_wait()
    EnableTrigger("ck_xue_accept1", false)
    EnableTrigger("ck_xue_accept3", false)
    EnableTrigger("ck_xue_accept4", false)
end
function check_xue_teach()
    EnableTrigger("ck_xue_accept1", false)
    EnableTriggerGroup("ck_xue_accept", false)
    EnableTriggerGroup("ck_xue_teach", true)
    if tmpxueskill then
        for i = 1, 10 do
            exe("teach xue " .. tmpxueskill)
        end
    else
        for i = 1, 10 do
            exe("teach xue " .. tmp.xueSkills[tmp.xueCount])
        end
    end
    wait.make(
    function()
        wait.time(0.5)
        return check_busy(check_xue_ok)
    end
    )
end
function check_xue_next()
    EnableTriggerGroup("ck_xue_teach", false)
    if tmpxueskill then
        tmpxueskill = nil
        tmp.xueCount = 0
    end
    tmp.xueCount = tmp.xueCount + 1
    if tmp.xueCount > table.getn(tmp.xueSkills) then
        return check_jingxue()
    else
        return checkWait(check_xue_teach, 0.2)
    end
end
function check_xue_heal()
    EnableTriggerGroup("ck_xue_accept", false)
    DeleteTriggerGroup("ck_xue_ask")
    DeleteTriggerGroup("ck_xue_accept")
    DeleteTriggerGroup("ck_xue_teach")
    DeleteTriggerGroup("ck_xue_busy")
    return check_bei(check_poison)
end
function check_poison()
    prepare_neili_stop()
    poison_dazuo()
    condition = { }
    exe("cond")
    return check_busy(preparePoison)
end
function preparePoison()
    EnableTrigger("hp19", true)
    if (not condition.poison or condition.poison == 0) then
        return check_halt(check_heal_over)
    end
    return dazuoPoison()
end
function dazuoPoison()
    condition.poison = 0
    exe("set 积蓄;hp;yun qi;yun jing;yun jingli;cond")
    exe("dazuo " .. hp.dazuo)
end
function poison_dazuo()
    DeleteTriggerGroup("poison")
    create_trigger_t(
    "poison1",
    "^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",
    "",
    "poisondazuo_desc"
    )
    create_trigger_t("poison2", "^(> )*你现在精不够，无法控制内息的流动！", "", "checkDebug")
    SetTriggerOption("poison1", "group", "poison")
    SetTriggerOption("poison2", "group", "poison")
    EnableTriggerGroup("poison", true)
end
function poisondazuo_desc()
    if condition.poison and condition.poison == 0 then
        EnableTriggerGroup("poison", false)
        DeleteTriggerGroup("poison")
        exe("yun jing;yun qi;yun jingli")
        return check_bei(check_food)
    end
    return poisonLianxi()
end
function poisonLianxi()
    exe("sxlian")
    wait.make(
    function()
        wait.time(2)
        return check_busy(preparePoison)
    end
    )
end

function Ronglian()
    dis_all()
    job.name = "refine"
    return go(Brefine, "扬州城", "兵器铺")
end
function Brefine()
    kuangshi = "tiekuang shi"
    DeleteTriggerGroup("refine")
    create_trigger_t("refine1", "^(> )*你没有足够的铁矿石。", "", "refineGold")
    create_trigger_t("refine2", "^(> )*你没有足够的金矿石。", "", "refineOK")
    SetTriggerOption("refine1", "group", "refine")
    SetTriggerOption("refine2", "group", "refine")
    EnableTriggerGroup("refine", true)
    create_timer_s("refine", 2, "refine")
end
function refine()
    exe("refine 1000 " .. kuangshi)
    exe("l bei nang")
end
function refineGold()
    kuangshi = "jinkuang shi"
end
function refineOK()
    DeleteTriggerGroup("refine")
    dis_all()
    return check_heal()
end

function check_food(Force2Full)
    -- 是否已经装备回内武器
    Weapon.RecoverNeili()

    Force2Full = Force2Full or false
    if score.gender == "无1" then
        -- 厂公专用，封闭房间
        map.rooms["city/mingyufang"].ways["north"] = nil
        map.rooms["changan/eastjie1"].ways["north"] = nil
    end
    map.rooms["sld/lgxroom"].ways["#outSld"] = "huanghe/huanghe8"
    if score.party == "华山派" and hp.shen < 0 then
        map.rooms["huashan/houtang"].ways["north"] = nil
        map.rooms["huashan/qianting"].ways["south"] = nil
    end
    if score.party == "姑苏慕容" then
        map.rooms["mtl/anbian1"].ways["qu xiaozhu;#CboatWait"] = nil
        map.rooms["mtl/anbian1"].ways["qu yanziwu;#CboatWait"] = nil
        map.rooms["mr/testmatou1"].ways["qu yanziwu;#boatWait"] = nil
        map.rooms["mr/testmatou1"].ways["qu mr;#boatWait"] = nil
        map.rooms["mr/tingyuju"].ways["tan qin;#boatWait"] = nil
        map.rooms["mr/xiaodao"].ways["#boatYell"] = nil
        map.rooms["yanziwu/anbian3"].ways["#boatYell"] = nil
        map.rooms["yanziwu/anbian4"].ways["#boatYell"] = nil
        if skills["douzhuan-xingyi"] ~= nil then
            if
                not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl > 130 and
                skills["douzhuan-xingyi"].lvl < 170
            then
                dzxy_level = 1
            end
            if
                not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl > 170 and
                skills["douzhuan-xingyi"].lvl < 200
            then
                dzxy_level = 2
            end
            if
                not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl > 200 and
                skills["douzhuan-xingyi"].lvl < hp.pot_max - 100
            then
                dzxy_level = 3
            end
        end
    end
    beiUnarmed()
    dis_all()
    hpheqi()
    if mydummy == true then
        return dummyfind()
    end
    -- if job.zuhe["wudang"] then wait_kill='yes' end
    exe("nick 去武当吃喝;remove all;wear all;score;")
    quest.name = "全面检查状态"
    quest.status = ""
    quest.target = ""
    quest.location = ""
    quest.note = ""
    quest:update()
    exe("hp;unset no_kill_ap;yield no")
    if (hp.food < 60 or hp.water < 60) and hp.exp < 500000 then
        return go(dali_eat, "大理城", "茶馆")
    elseif hp.food < 60 or hp.water < 60 or Force2Full then
        return go(wudang_eat, "武当山", "茶亭")
    else
        check_bei(check_food_over)
    end
end
function wudang_eat()
    if locl.room == "茶亭" then
        flag.food = 0
        DeleteTimer("food")
        exe("sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao")
        check_bei(check_food_over)
    else
        return go(wudang_eat, "武当山", "茶亭")
    end
end
function check_food_over()
    if kuang_cur and kuang_cur > 2000 then
        return Ronglian()
    end
    return check_heal()
end

function dali_eat()
    if locl.room == "茶馆" then
        flag.food = 0
        DeleteTimer("food")
        exe("#5(drink);e;e;s;buy baozi;#2(eat baozi)")
        check_bei(check_food_over)
    else
        return go(dali_eat, "大理城", "茶馆")
    end
end

function check_pot(p_cmd)
    if hp.pot_max ~= nil then
        if hp.exp < 5000000 then
            l_pot = hp.pot_max - 100
        else
            l_pot = hp.pot_max - 200
        end
    else
        l_pot = 180
    end
    flag.lingwu = 0
    local l_skill
    if perform.skill then
        l_skill = skillEnable[perform.skill]
    end

    job_exp_tongji()

    --    for p in pairs(skillEnable) do
    --        if skills[p] then
    --            q = skillEnable[p]
    --            -- ain 提前领悟
    --            if
    --                q and skills[q] and q ~= "force" and
    --                (skills[q].lvl > 219 or(score.party == "普通百姓" and skills[q].lvl > 100)) and
    --                skills[q].lvl < hp.pot_max - 100 and
    --                skills[q].lvl <= skills[p].lvl and
    --                hp.pot >= l_pot
    --            then
    --                flag.lingwu = 1
    --            end
    --        end
    --    end

    if (GetVariable("lingwuskills") or (tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]])) and hp.pot >= l_pot then
        flag.lingwu = 0
        if tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]] then
            local p = tmp.xskill
            local q = skillEnable[p]
            if skills[q].lvl < hp.pot_max - 100 and skills[q].lvl <= skills[p].lvl and skills[q].lvl < hp.pot_max - 100 then
                flag.lingwu = 1
            end
        end
        if GetVariable("lingwuskills") then
            local l_skillsLingwu = {}
	        l_skillsLingwu = utils.split(GetVariable("lingwuskills"), "|")
            for p in pairs(skills) do
                for k,q in ipairs(l_skillsLingwu) do
                    if skillEnable[p] == q and skills[q].lvl < hp.pot_max - 10 and skills[q].lvl <= skills[p].lvl and skills[q].lvl > 440 then
                        flag.lingwu = 1
                    end
                end

            end
        end

        if flag.lingwu == 1 then
            return checklingwu()
        end
    end


    -- 普通百姓
    if score.party == "普通百姓" then
        if hp.pot >= l_pot and score.gold and skills["literate"] and score.gold > 3000 and skills["literate"].lvl < hp.pot_max - 100 then
            return literate()
        end
        if hp.pot >= l_pot and skills["parry"].lvl < hp.pot_max - 100 and skills["parry"].lvl >= 101 then
            flag.lingwu = 1
        end
        if flag.lingwu == 1 then
            return checklingwu()
        end
        if skills["force"].lvl > 50 then
            if skills["force"].lvl < 101 then
                return huxi()
            end
            if skills["force"].lvl == 101 then
                exe("fangqi force 1;y;y;y")
                return huxi()
            end
            if skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl < 200 then
                return learnSzj()
            end
        end
    end

    -- 门派弟子
    if score.party ~= "普通百姓" then
        -- 判断是否达到学习要求
        if hp.pot >= l_pot and flag.autoxuexi and flag.autoxuexi == 1 then
            if score.gold and skills["literate"] and score.gold > 3000 and skills["literate"].lvl < hp.pot_max - 100 then
                return literate()
            end

            -- 学习 判断
            for p in pairs(skills) do
                local q = qrySkillEnable(p)
                if q and q["force"] and perform.force and p == perform.force and skills[p].lvl < 100 and hp.pot >= l_pot then
                    if skills[p].mstlvl and skills[p].mstlvl <= skills[p].lvl then
                    else
                        return checkxue()
                    end
                end
            end

            -- for p in pairs(skills) do
            --     if skillEnable[p] and skills[p].lvl < 450 and skills[p].lvl <= skills["dodge"].lvl and hp.pot >= l_pot
            --     then
            --         if not skills[p].mstlvl or skills[p].mstlvl > skills[p].lvl then
            --             return checkxue()
            --         end
            --     end
            -- end

            if perform.skill and skills[perform.skill] and skills[perform.skill].lvl < 450 then
                return checkxue()
            end

            if flag.type and flag.type ~= "lingwu" and flag.xuexi == 1 then
                return checkxue()
            end

            if flag.xuexi == 1 then
                return checkxue()
            end

            if skills["parry"] and skills["parry"].lvl < hp.pot_max - 100 and skills["parry"].lvl >= 450 then
                flag.lingwu = 1
            end

            if flag.lingwu == 1 then
                return checklingwu()
            end

            -- 无相截指 partial
            if skills["wuxiang-zhi"] then
                if not flag.wxjz then
                    flag.wxjz = 0
                end
                if
                    flag.wxjz == 0 and skills["finger"].lvl > skills["wuxiang-zhi"].lvl and
                    skills["wuxiang-zhi"].lvl < hp.pot_max - 100
                then
                    return wxjzFofa()
                end
            end
        end
    end
    
    return job.Switch()
end

function checkHammer()
    return go(checkHmGive, "扬州城", "兵器铺")
end

function checkWeapon(p_weapon)
    tmp.cnt = 0
    tmp.weapon = p_weapon
    return go(checkWeaponBuy, weaponStore[p_weapon], "")
end
function checkWeaponBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 10 then
        checkBags()
        return check_heal()
    else
        if tmp.weapon and weaponStoreId[tmp.weapon] then
            exe("list;buy " .. weaponStoreId[tmp.weapon])
            checkBags()
            return checkWait(checkWeaponI, 3)
        else
            return check_heal()
        end
    end
end
function checkWeaponI()
    if not Bag[tmp.weapon] then
        return checkWeaponBuy()
    else
        return checkWeaponOver()
    end
end
function checkWeaponOver()
    return checkPrepare()
end

function checkCodeError()
    return dis_all()
end

function checkRefresh()
    job.time["refresh"] = os.time() % 900
end

function shujian_set()
    checkBags()
    exe("score;cha;hp")
    local l_result
    local l_tmp
    local t
    l_result =
    utils.inputbox(
    "你要学习的SKILLS(格式：force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)是?",
    "xuexiskill",
    GetVariable("xuexiskill"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("xuexiskill", l_result)
        Note("学习设定完成")
        print(GetVariable("xuexiskill"))
    end
    l_result =
    utils.inputbox(
    "你要领悟的SKILLS(格式：force|dodge|sword|blade|parry)是?",
    "lingwuskills",
    GetVariable("lingwuskills"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("lingwuskills", l_result)
        Note("领悟设定完成")
        print(GetVariable("lingwuskills"))
    end
    l_result = utils.inputbox("你学习领悟时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
    end
    l_result = utils.inputbox("你的英文ID是?", "ID", GetVariable("id"), "宋体", "12")
    if l_result ~= nil then
        SetVariable("id", l_result)
    else
        DeleteVariable("id")
    end
    l_result = utils.inputbox("你的密码是?", "Passwd", GetVariable("passwd"), "宋体", "12")
    if l_result ~= nil then
        SetVariable("passwd", l_result)
    else
        DeleteVariable("passwd")
    end

    l_result = utils.msgbox("是否打开记录窗口?", "FlagLog", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        flag.log = "yes"
    else
        flag.log = "no"
    end
    SetVariable("flaglog", flag.log)

    l_result = utils.msgbox("是否自动学习及领悟", "XuexiLingwu", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        flag.autoxuexi = 1
    else
        flag.autoxuexi = 0
    end
    SetVariable("flagautoxuexi", flag.autoxuexi)

    -- masterSet()

    pfmSet()

    weaponSet()

    myUweapon()

    jobSet()

    drugSet()

    Save()

    ColourNote("red", "blue", "请使用start命令启动机器人，stop命令停止机器人，iset设置机器人！")
end

function masterSet()
    local l_result, l_tmp, t
    if score.party ~= "普通百姓" then
        l_result = utils.inputbox("你的师傅的简短ID是?", "MasterId", GetVariable("masterid"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("masterid", l_result)
            master.id = l_result
        end
        if not score.master or not masterRoom[score.master] then
            l_result = utils.inputbox("你的师傅的居住地是?", "MasterRoom", GetVariable("masterroom"), "宋体", "12")
            if l_result ~= nil then
                SetVariable("masterroom", l_result)
                master.room, master.area = getAddr(l_result)
            end
        end
    end
end

function pfmSet()
    local l_result, l_tmp, t

    t = { }
    for p in pairs(skills) do
        if skillEnable[p] == "force" then
            t[p] = skills[p].name
        end
    end
    if countTab(t) == 1 then
        for p in pairs(t) do
            perform.force = p
        end
    elseif countTab(t) > 1 then
        l_result = utils.listbox("你使用的特殊内功是", "特殊内功", t, GetVariable("performforce"))
        if isNil(l_result) then
            perform.force = nil
            DeleteVariable("performforce")
        else
            perform.force = l_result
            SetVariable("performforce", l_result)
        end
    else
        perform.force = nil
    end

    t = { }
    for p in pairs(skills) do
        if skillEnable[p] and skillEnable[p] ~= "force" then
            t[p] = skills[p].name
        end
    end
    if countTab(t) > 0 then
        l_result = utils.listbox("你准备战斗使用的功夫是?", "performSkill", t, GetVariable("performskill"))
        if not isNil(l_result) then
            SetVariable("performskill", l_result)
            perform.skill = l_result
        else
            perform.skill = nil
            SetVariable("performskill", l_result)
        end
    end
    l_result =
    utils.inputbox(
    "战斗默认准备PFM(格式：bei none;bei claw;jifa parry jiuyin-baiguzhua;perform sanjue)是?",
    "PerformPre",
    GetVariable("performpre"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("performpre", l_result)
        perform.pre = l_result
        l_pfm = perform.pre
        create_alias("pfmset", "pfmset", "alias pfmpfm " .. l_pfm)
        Note("默认PFM")
        exe("pfmset")
    end
    l_result = utils.inputbox("你的空手PFM(不使用武器的PFM)是?", "pfmks", GetVariable("pfmks"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("pfmks", l_result)
        l_pfm = l_result
        create_alias("pfmks", "pfmks", "alias pfmpfm " .. l_pfm)
        Note("空手PFM")
        exe("pfmks")
    end
    l_result =
    utils.inputbox("遇到慕容剑法用的PFM(使用不拿剑可以克制慕容的skills,慕容剑法的属性为：险)是?", "pfmmrjf", GetVariable("pfmmrjf"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("pfmmrjf", l_result)
        l_pfm = l_result
        create_alias("pfmmrjf", "pfmmrjf", "alias pfmpfm " .. l_pfm)
        Note("不用剑的PFM")
        exe("pfmmrjf")
    end
    l_result =
    utils.inputbox("遇到明教圣火令法PFM(使用拿武器克制明教的skills，圣火令法的属性为：奇)是?", "pfmshlf", GetVariable("pfmshlf"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("pfmshlf", l_result)
        l_pfm = l_result
        create_alias("pfmshlf", "pfmshlf", "alias pfmpfm " .. l_pfm)
        Note("带兵器PFM")
        exe("pfmshlf")
    end
    l_result = utils.inputbox("填写你的无属性PFM(使用无属性的skills，玄铁剑法改归属为空)是?", "pfmwu", GetVariable("pfmwu"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("pfmwu", l_result)
        l_pfm = l_result
        create_alias("pfmwu", "pfmwu", "alias pfmpfm " .. l_pfm)
        Note("无属性PFM")
        exe("pfmwu")
    end
    l_result = utils.inputbox("填写你的空属性PFM(对付空属性的pfm，建议用无属性武功，或者自己的最常用武功)是?", "pkong", GetVariable("pkong"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("pkong", l_result)
        l_pfm = l_result
        create_alias("pkong", "pkong", "alias pfmpfm " .. l_pfm)
        Note("空属性PFM")
        exe("pkong")
    end
    l_result =
    utils.inputbox(
    "填写你的最大合气大招PFM(对付克制武功极偶尔无法识别的武功，使用耗合气最大的pfm)是?",
    "pfmsanqing",
    GetVariable("pfmsanqing"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pfmsanqing", l_result)
        l_pfm = l_result
        create_alias("pfmsanqing", "pfmsanqing", "alias pfmpfm " .. l_pfm)
        Note("终极大招")
        exe("pfmsanqing")
    end
    l_result =
    utils.inputbox(
    "填写你的正属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：险。属性克制数值为：正130 刚空120 快110 妙险无100】无正属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pzhen",
    GetVariable("pzhen"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pzhen", l_result)
        perform.zhen = l_result
        l_pfm = perform.zhen
        create_alias("pfmzhen", "pfmzhen", "alias pfmpfm " .. l_pfm)
        Note("正属性PFM")
        exe("pfmzhen")
    end
    l_result =
    utils.inputbox(
    "填写你的奇属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：妙。属性克制数值为：奇130 柔空120 慢110 无妙险100】无奇属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pqi",
    GetVariable("pqi"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pqi", l_result)
        perform.qi = l_result
        l_pfm = perform.qi
        create_alias("pfmqi", "pfmqi", "alias pfmpfm " .. l_pfm)
        Note("奇属性PFM")
        exe("pfmqi")
    end
    l_result =
    utils.inputbox(
    "填写你的刚属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：慢。属性克制数值为：刚130 正空120 险110 慢快无100】无刚属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pgang",
    GetVariable("pgang"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pgang", l_result)
        perform.gang = l_result
        l_pfm = perform.gang
        create_alias("pfmgang", "pfmgang", "alias pfmpfm " .. l_pfm)
        Note("刚属性PFM")
        exe("pfmgang")
    end
    l_result =
    utils.inputbox(
    "填写你的柔属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：快。属性克制数值为：柔130 奇空120 妙110 快慢无100】无柔属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "prou",
    GetVariable("prou"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("prou", l_result)
        perform.rou = l_result
        l_pfm = perform.rou
        create_alias("pfmrou", "pfmrou", "alias pfmpfm " .. l_pfm)
        Note("柔属性PFM")
        exe("pfmrou")
    end
    l_result =
    utils.inputbox(
    "填写你的快属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：刚。属性克制数值为：快130 妙空120 奇110 无刚柔100】无快属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pkuai",
    GetVariable("pkuai"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pkuai", l_result)
        perform.kuai = l_result
        l_pfm = perform.kuai
        create_alias("pfmkuai", "pfmkuai", "alias pfmpfm " .. l_pfm)
        Note("快属性PFM")
        exe("pfmkuai")
    end
    l_result =
    utils.inputbox(
    "填写你的慢属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：柔。属性克制数值为：慢130 险空120 正110 无刚柔100】无慢属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pman",
    GetVariable("pman"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pman", l_result)
        perform.man = l_result
        l_pfm = perform.man
        create_alias("pfmman", "pfmman", "alias pfmpfm " .. l_pfm)
        Note("慢属性PFM")
        exe("pfmman")
    end
    l_result =
    utils.inputbox(
    "填写你的秒属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：正。属性克制数值为：妙130 快空120 刚110 无正奇100】无妙属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pmiao",
    GetVariable("pmiao"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pmiao", l_result)
        perform.miao = l_result
        l_pfm = perform.miao
        create_alias("pfmmiao", "pfmmiao", "alias pfmpfm " .. l_pfm)
        Note("妙属性PFM")
        exe("pfmmiao")
    end
    l_result =
    utils.inputbox(
    "填写你的险属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：奇。属性克制数值为：险130 慢空120 柔110 无正奇100】无险属性可按后面的数值高低来填入对你有对应属性的FPM！",
    "pxian",
    GetVariable("pxian"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pxian", l_result)
        perform.xian = l_result
        l_pfm = perform.xian
        create_alias("pfmxian", "pfmxian", "alias pfmpfm " .. l_pfm)
        Note("险属性PFM")
        exe("pfmxian")
    end
    l_result =
    utils.inputbox(
    "你FPK的PFM(用verify 来查看你的pfm的属性再填写格式：verify yunu-jianfa)是?",
    "pkpfm",
    GetVariable("pkpfm"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pkpfm", l_result)
    end
    l_result = utils.inputbox("你练功的alias是? 不想练可填none", "sx1lian", GetVariable("sx1lian"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("sx1lian", l_result)
        l_pfm = l_result
        create_alias("sx1lian", "sx1lian", "alias sxlian " .. l_pfm)
        Note("练功的alias")
        exe("sx1lian")
    end
    Note("使用默认PFM")
    exe("pfmset")
end

function myUweapon()
    l_result = utils.inputbox("你需要GET的第一把武器ID是?", "myweapon", GetVariable("myweapon"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("myweapon", l_result)
    end
    l_result = utils.inputbox("你需要GET的第二把武器ID是?", "muweapon", GetVariable("muweapon"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("muweapon", l_result)
    end
end

function jobSet()
    local l_result, l_tmp, t

    t = {
        ["wudang"] = "武当宋远桥",
        ["huashan"] = "华山岳不群",
        ["gaibang"] = "丐帮吴长老",
        ["songmoya"] = "颂摩崖抗敌任务",
        ["zhuoshe"] = "丐帮捉蛇",
        ["songxin"] = "大理送信",
        ["songxin2"] = "大理送信2",
        ["xueshan"] = "雪山抢美女",
        ["sldsm"] = "神龙岛师门",
        ["songshan"] = "嵩山左冷禅",
        --   ["hubiao"]  ="福州护镖",
        ["tmonk"] = "少林教和尚",
        ["clb"] = "长乐帮任务1",
        ["husong"] = "少林护送",
        ["hqgzc"] = "洪七公做菜"
    }

    t = { }

    for p, q in pairs(job.list) do
        t[p] = q
    end

    if score.party ~= "丐帮" then
        t["zhuoshe"] = nil
    end
    if score.party ~= "神龙教" then
        t["sldsm"] = nil
    end
    if score.party ~= "少林派" or hp.exp > 2000000 or hp.exp < 300000 then
        t["tmonk"] = nil
    end
    if score.party ~= "少林派" or hp.exp < 2000000 then
        t["husong"] = nil
    end
    if hp.exp < 5000000 then
        t["songmoya"] = nil
    end
    if hp.shen < 0 then
        t["gaibang"] = nil
    end
    if hp.shen < 0 and score.party == "华山派" then
        t["huashan"] = nil
    end
    if hp.shen < 0 then
        t["wudang"] = nil
    end
    if hp.shen > 0 then
        t["songshan"] = nil
    end

    job.zuhe = { }
    if GetVariable("jobzuhe") then
        tmp.job = utils.split(GetVariable("jobzuhe"), "_")
        tmp.zuhe = { }
        for _, p in pairs(tmp.job) do
            tmp.zuhe[p] = true
        end
    end
    l_tmp = utils.multilistbox("你的任务组合(请按CTRL多选)是?", "任务组合", t, tmp.zuhe)
    l_result = nil
    for p in pairs(l_tmp) do
        job.zuhe[p] = true
        if l_result then
            l_result = l_result .. "_" .. p
        else
            l_result = p
        end
    end
    if l_result ~= nil then
        SetVariable("jobzuhe", l_result)
    end
    for p in pairs(t) do
        if not job.zuhe[p] then
            t[p] = nil
        end
    end
    job.first = nil
    job.second = nil
    t["husong"] = nil
    t["hubiao"] = nil
    if countTab(t) > 2 then
        l_result = utils.listbox("你第一优先去的任务：", "优先任务", t, GetVariable("jobfirst"))
        if l_result ~= nil then
            SetVariable("jobfirst", l_result)
            job.first = l_result
            t[job.first] = nil
        else
            job.first = nil
            DeleteVariable("jobfirst")
        end
    end
    if countTab(t) > 1 and job.first then
        l_result = utils.listbox("你第二优先去的任务：", "优先任务", t, GetVariable("jobsecond"))
        if l_result ~= nil then
            SetVariable("jobsecond", l_result)
            job.second = l_result
            t[job.second] = nil
        else
            job.second = nil
            DeleteVariable("jobsecond")
        end
    else
        job.second = nil
        DeleteVariable("jobsecond")
    end
    if countTab(t) == 1 and job.second then
        l_result = utils.listbox("你第三个去的任务：", "优先任务", t, GetVariable("jobthird"))
        if l_result ~= nil then
            SetVariable("jobthird", l_result)
            job.third = l_result
        else
            job.third = nil
            DeleteVariable("jobthird")
        end
    else
        job.third = nil
        DeleteVariable("jobthird")
    end
    if not job.first then
        DeleteVariable("jobfirst")
    end
    if not job.second then
        DeleteVariable("jobsecond")
    end
    if not job.third then
        DeleteVariable("jobthird")
    end

    if job.zuhe["songmoya"] then
        l_result = utils.inputbox("设置一品堂任务杀到第几组?(默认为7组)使用默认组数请空白不要填写。", "ypttab", GetVariable("ypttab"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("ypttab", l_result)
            smyteam = tonumber(l_result)
        else
            smyteam = 16
        end
        l_result = utils.inputbox("设置一品堂任务死亡几次不再上SMY!(默认为2次)使用默认组数请空白不要填写。", "yptdie", GetVariable("yptdie"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("yptdie", l_result)
            smyall = tonumber(l_result)
        else
            smyall = 2
        end
        l_result = utils.msgbox("设置一品堂任务是否开启双杀!(默认为no不开启)。", "双杀", "yesno", "?", 1)
        if l_result and l_result == "yes" then
            double_kill = yes
        else
            double_kill = no
        end
        l_result =
        utils.inputbox("设置一品堂任务前置BUFF!(Perform and Yun、没有请填写none)。", "pfbuff", GetVariable("pfbuff"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("pfbuff", l_result)
            perform.buff = l_result
            l_pfm = perform.buff
            create_alias("pbuff", "pbuff", "alias pfmbuff " .. l_pfm)
            exe("pbuff")
        end
    end

    if job.zuhe["tdh"] then
        l_result = utils.inputbox("天地会任务中间是否打座？(1为打座 0为不打座)", "tdhdazuo", GetVariable("tdhdazuo"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("tdhdazuo", l_result)
            tdhdz = l_result
        else
            tdhdz = 1
        end
    end

    if job.zuhe["hqgzc"] then
        l_result = utils.inputbox("拿Pot还是Gold？(1为Pot 0为Gold)", "hqgzcjiangli", GetVariable("hqgzcjiangli"), "宋体", "12")
        if not isNil(l_result) then
            SetVariable("hqgzcjiangli", l_result)
            hqgzcjl = l_result
        else
            hqgzcjl = 1
        end
    end

    if job.zuhe["hubiao"] or job.zuhe["haizhan"] then
        if GetVariable("teamname") then
            l_result = utils.inputbox("你组队护镖的队友(中文名称)是?", "TeamName", GetVariable("teamname"), "宋体", "12")
        else
            l_result = utils.inputbox("你组队护镖的队友(中文名称)是?", "TeamName", job.teamname, "宋体", "12")
        end
        if not isNil(l_result) then
            SetVariable("teamname", l_result)
            job.teamname = l_result
        else
            DeleteVariable("teamname")
            job.teamname = nil
        end
        if GetVariable("teamlead") then
            l_result = utils.inputbox("你组队护镖的队长(中文名称)是?", "TeamLead", GetVariable("teamlead"), "宋体", "12")
        else
            l_result = utils.inputbox("你组队护镖的队长(中文名称)是?", "TeamLead", job.teamlead, "宋体", "12")
        end
        if not isNil(l_result) then
            SetVariable("teamlead", l_result)
            job.teamlead = l_result
        else
            DeleteVariable("teamlead")
            job.teamlead = nil
        end
    end
end

function drugSet()
    drugPrepare = { }
    local t = {
        ["内息丸"] = "内息丸",
        ["川贝内息丸"] = "川贝内息丸",
        ["黄芪内息丹"] = "黄芪内息丹",
        ["蝉蜕金疮药"] = "蝉蜕金疮药",
        ["活血疗精丹"] = "活血疗精丹",
        ["大还丹"] = "大还丹",
        ["火折"] = "火折",
        ["牛皮酒袋"] = "牛皮酒袋",
    }
    if GetVariable("drugprepare") then
        tmp.drug = utils.split(GetVariable("drugprepare"), "|")
        tmp.pre = { }
        for _, p in pairs(tmp.drug) do
            tmp.pre[p] = true
        end
    end
    local l_tmp = utils.multilistbox("你任务前准备的物品(请按CTRL多选)是?", "物品组合", t, tmp.pre)
    local l_result = nil
    for p in pairs(l_tmp) do
        drugPrepare[p] = true
        if l_result then
            l_result = l_result .. "|" .. p
        else
            l_result = p
        end
    end
    if isNil(l_result) then
        DeleteVariable("drugprepare")
    else
        SetVariable("drugprepare", l_result)
    end
end

function getVariable()
    if GetVariable("flagautoxuexi") then
        flag.autoxuexi = GetVariable("flagautoxuexi")
        if flag.autoxuexi == "1" or flag.autoxuexi == "0" then
            flag.autoxuexi = tonumber(flag.autoxuexi)
        end
    end
    if GetVariable("flaglog") then
        flag.log = GetVariable("flaglog")
    end

    if GetVariable("masterid") then
        master.id = GetVariable("masterid")
    end
    if GetVariable("masterroom") then
        master.room, master.area = getAddr(GetVariable("masterroom"))
    end
    if GetVariable("mastertimes") then
        master.times = GetVariable("mastertimes")
    end

    if GetVariable("performforce") then
        perform.force = GetVariable("performforce")
    end
    if GetVariable("performskill") then
        perform.skill = GetVariable("performskill")
    end
    if GetVariable("performpre") then
        perform.pre = GetVariable("performpre")
    end
    if GetVariable("performhuaxue") then
        perform.huaxue = GetVariable("performhuaxue")
    end
    if GetVariable("performxiqi") then
        perform.xiqi = GetVariable("performxiqi")
    end

    if GetVariable("jobzuhe") then
        tmp.job = utils.split(GetVariable("jobzuhe"), "_")
        for _, p in pairs(tmp.job) do
            job.zuhe[p] = true
        end
    end
    if GetVariable("jobfirst") then
        job.first = GetVariable("jobfirst")
        if job.first == "songxin2" then
            job.first = "songxin"
        end
    else
        job.first = nil
    end
    if GetVariable("jobsecond") then
        job.second = GetVariable("jobsecond")
        if job.second == "songxin2" then
            job.second = "songxin"
        end
    else
        job.second = nil
    end
    if GetVariable("jobthird") then
        job.third = GetVariable("jobthird")
        if job.third == "songxin2" then
            job.third = "songxin"
        end
    else
        job.third = nil
    end
    if GetVariable("flagtype") then
        flag.type = GetVariable("flagtype")
    end
    if GetVariable("gaibangcancel") then
        gaibangCancel = GetVariable("gaibangcancel")
    end
    if GetVariable("sldsmcancel") then
        sldsmCancel = GetVariable("sldsmcancel")
    end
    if GetVariable("teamname") then
        job.teamname = GetVariable("teamname")
    end
    if GetVariable("teamlead") then
        job.teamlead = GetVariable("teamlead")
    end

    drugGetVar()

    weaponGetVar()
end

function drugGetVar()
    drugPrepare = { }
    if GetVariable("drugprepare") then
        tmp.drug = utils.split(GetVariable("drugprepare"), "|")
        for _, p in pairs(tmp.drug) do
            drugPrepare[p] = true
        end
    end
end

function setAlias()
    create_alias_s("stop", "stop", "disAll")
    create_alias_s("iset", "iset", "shujian_set")
    create_alias_s("start", "start", "main")
    create_alias_s("qu_wd", "qu_wd", "goto_set.wd")
    create_alias_s("qu_sl", "qu_sl", "goto_set.sl")
    create_alias_s("qu_xy", "qu_xy", "goto_set.xy")
    create_alias_s("qu_xs", "qu_xs", "goto_set.xs")
    create_alias_s("qu_hs", "qu_hs", "goto_set.hs")
    create_alias_s("qu_yz", "qu_yz", "goto_set.yz")
    create_alias_s("qu_lzdk", "qu_lzdk", "goto_set.lzdk")
    create_alias_s("qu_thd", "qu_thd", "goto_set.thd")
    create_alias_s("qu_dl", "qu_dl", "goto_set.dl")
    create_alias_s("tj", "tj", "jobExpTongji")
    create_alias_s("setlian", "setlian", "setLian")
    create_alias_s("setlearn", "setlearn", "setLearn")
    create_alias_s("setlingwu", "setlingwu", "setLingwu")
    create_alias_s("setdzxy", "setdzxy", "setdzxy")
    create_alias_s("duanzao", "duanzao", "duanzao")
    create_alias_s("zhizao", "zhizao", "zhizao")
    create_alias_s("xuexi", "xuexi", "xuepot")
    create_alias_s("xc", "xc", "setxcexp")
    create_alias_s("wdj", "wdj", "inWdj")
    create_alias_s("dolost", "dolost", "dolostletter")
    create_alias_s("setjob", "setjob", "jobSet")
    create_alias("sz", "^sz(.*)$", 'goto("%1")')
    SetAliasOption("sz", "send_to", "12")
    create_alias("dushu", "^dushu(.*)$", 'dushu("%1")')
    SetAliasOption("dushu", "send_to", "12")
    create_alias("full", "^full(.*)$", 'fullSkill("%1")')
    SetAliasOption("full", "send_to", "12")
end

function setdzxy()
    l_result = utils.msgbox("慕容斗转星移学习设置(默认为：Yes)？", "dzxy", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("我要学习斗转星移")
        need_dzxy = "yes"
    else
        need_dzxy = "no"
        print("我不要学习斗转星移")
    end
end
function inWdj()
    l_result = utils.msgbox("是要进苗疆五毒教吗？", "inwdj", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("我要进苗疆五毒教")
        inwdj = 1
    else
        inwdj = 0
        print("我不进苗疆五毒教")
    end
end
function setLearn()
    l_result =
    utils.inputbox(
    "你要学习的SKILLS(格式：force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)是?",
    "xuexiskill",
    GetVariable("xuexiskill"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("xuexiskill", l_result)
        Note("学习设定完成")
        print(GetVariable("xuexiskill"))
    end
    l_result = utils.inputbox("你学习时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
        print(GetVariable("learnweapon"))
    end
end
function setLingwu()
    l_result =
    utils.inputbox(
    "你要领悟的SKILLS(格式：force|dodge|sword|blade|parry)是?",
    "lingwuskills",
    GetVariable("lingwuskills"),
    "宋体",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("lingwuskills", l_result)
        Note("领悟设定完成")
        print(GetVariable("lingwuskills"))
    end
    l_result = utils.inputbox("你领悟时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
        print(GetVariable("learnweapon"))
    end
end
function setLian()
    l_result = utils.inputbox("你练功的alias是? 不想练可填none", "sx1lian", GetVariable("sx1lian"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("sx1lian", l_result)
        l_pfm = l_result
        create_alias("sx1lian", "sx1lian", "alias sxlian " .. l_pfm)
        Note("练功的alias")
        exe("sx1lian")
    end
end
function setxcexp()
    l_result = utils.msgbox("巡城到2M", "xcexp", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("巡城到2M")
        xcexp = 1
    else
        print("巡城到1M")
        xcexp = 0
    end
end
function xuepot()
    l_result = utils.msgbox("是否学习", "xuexi", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("学习开启")
        needxuexi = 1
    else
        needxuexi = 0
        print("学习关闭")
    end
end
function dolostletter()
    l_result = utils.inputbox("请输入当前失落的信可接上限数量? 默认为10封！", "mylostletter", GetVariable("mylostletter"), "宋体", "12")
    if not isNil(l_result) then
        SetVariable("mylostletter", l_result)
        lostno = l_result
    end
    l_result = utils.msgbox("是否做LL", "失落的信", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("开启做LL")
        needdolost = 1
        switch_name4 = "失落的信笺--开"
    else
        needdolost = 0
        switch_name4 = "失落的信笺--关"
        print("关闭做LL")
    end
    l_result = utils.msgbox("做LL是否自动买Vpearl", "自动买Vpearl", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("开启自动兑换Vpearl")
        needvpearl = 1
    else
        print("关闭自动兑换Vpearl")
        needvpearl = 0
    end
end
function dolostAg()
    l_result = utils.msgbox("还要再做失落的信吗？YES再做10封，NO算了不做了", "次数", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("再做失落的信10次！")
        lostno = lostno + 10
        dis_all()
        return go(dhlost, "扬州城", "当铺")
    else
        needdolost = 0
        print("关闭做LL")
    end
end
function isNil(p_str)
    if p_str == nil then
        return true
    end
    if type(p_str) ~= "string" then
        return false
    else
        p_str = Trim(p_str)
        if p_str == "" then
            return true
        else
            return false
        end
    end
end
function countR(p_number)
    local i = p_number or 10
    return function()
        i = i - 1
        return i
    end
end

function randomElement(p_set)
    local l_element

    if p_set and type(p_set) == "table" then
        local l_cnt = math.random(1, countTab(p_set))
        local l_i = 0
        for p, q in pairs(p_set) do
            l_element = q
            l_i = l_i + 1
            if l_i == l_cnt then
                return l_element
            end
        end
    else
        l_element = p_set
    end

    return l_element
end

road.huanghe1 = true
road.huanghe2 = true
function duhe_change()
    road.huanghe1 = not road.huanghe1
    road.huanghe2 = not road.huanghe2
    EnableTriggerGroup("duhe", false)
    ----------2018-08-30更新
end

function recordtime()
    messageShowT("船到岸: " .. os.date("%Y-%m-%d %H:%M:%S", os.time()))
end

function recordtime_leave()
    messageShowT("开船离岸: " .. os.date("%Y-%m-%d %H:%M:%S", os.time()))
end
