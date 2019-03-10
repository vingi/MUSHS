require "common"
require "wait"
require "tprint"
require "Entity"
require "Role"
require "DBHelper"
require "rooms"
require "lujing"
require "Member"
require "Sect"
require "chat"
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
statusbar = require "StatusBar"  -- hp״̬�����
-- ״̬������
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
hqgzcjl = 0  -- ���߹�����,��gold (0) ������ pot(1), ps(10���������߹����ٸ�gold,ֻ���pot)
cty_cur = 0
nxw_cur = 0
hxd_cur = 0
dhd_cur = 0
kuang_cur = 0
go_on_smy = 0 -- 20161117���ӱ���go_on_smy���ؿ��� ��ֹϵͳ�������Զ�����Ħ��
ebooktimes = 0
lostletter_locate = ""
ll = { }
ll.area = ""
ll.room = ""


-- ain

local cun_hammer = tonumber(GetVariable("autocun_hammer"))
if cun_hammer == 1 then
    itemSave = {
        ["���콳����ƪ"] = true,
        ["����������ƪ"] = true,
        ["Τ��֮��"] = true,
        ["������"] = true,
        ["������"] = true
    }
else
    itemSave = {
        ["���콳����ƪ"] = true,
        ["����������ƪ"] = true,
        ["Τ��֮��"] = true,
        ["������"] = true,
        ["������"] = true
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
    if l_type == "��" then
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
    if skills["parry"] and skills["parry"].lvl < hp.pot_max - 100 and skills["parry"].lvl < 450 then
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
    if score.party == "��ͨ����" then
        score.master = "��ͨ����"
    end
    if hasInit == false then
        IndependentOnload()
    end
end
score_check_xy = function(n, l, w)
    score.xiangyun = Trim(w[1])
    -- ����״̬�����������ܡ�ƽ��˥����
    if scorexy == false then
        scorexy = smyteam * 1
    end
    if score.xiangyun == "˥" or score.xiangyun == "��" then
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
    if w[3] == "��" then
        -- print(condition.poison,condition.busy)
        if w[1] == "ѩɽǿ����Ů" then
            condition.xueshan = l_cnt * 60
        end
        if w[1] == "˫������" then
            condition.ebook = l_cnt * 60
        end
        if w[1] == "����" then
            condition.mingwu = l_cnt * 60
        end
        if w[1] == "��ʵ��Ұ" then
            condition.vpearl = l_cnt
        end
        if w[1] == "����" then
            vippoison = 1
            condition.poison = l_cnt * 60
        end
        if w[1] == "�����ܻ���" then
            vippoison = 1
        end
        if w[1] == "�����ƶ�" then
            vippoison = 1
            condition.poison = l_cnt * 60
        end
        if w[1] == "��צ��������" then
            condition.poison = l_cnt * 60
        end
        if w[1] == "����æ״̬" then
            condition.busy = l_cnt * 60
            MissionPunishment.PunishmentHandle(condition.busy)
        end
        if w[1] == "�����ھֻ��ڵ���ʱ" then
            condition.hubiao = l_cnt * 60
        end
    else
        -- print(condition.poison,condition.busy)
        if w[1] == "ѩɽǿ����Ů" then
            condition.xueshan = l_cnt
        end
        if w[1] == "˫������" then
            condition.ebook = l_cnt
        end
        if w[1] == "����" then
            condition.mingwu = l_cnt
        end
        if w[1] == "��ʵ��Ұ" then
            condition.vpearl = l_cnt
        end
        if w[1] == "����" then
            vippoison = 1
            condition.poison = l_cnt
        end
        if w[1] == "�����ܻ���" then
            vippoison = 1
        end
        if w[1] == "�����ƶ�" then
            vippoison = 1
            condition.poison = l_cnt
        end
        if w[1] == "��צ��������" then
            condition.poison = l_cnt
        end
        if w[1] == "����æ״̬" then
            condition.busy = l_cnt
            MissionPunishment.PunishmentHandle(condition.busy)
        end
        if w[1] == "�����ھֻ��ڵ���ʱ" then
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
    create_trigger_t("hpheqi1", "^�������ȡ�\\s*\\-?\\s*(\\d*)", "", "hp_heqi_check")
    SetTriggerOption("hpheqi1", "group", "hpheqi")
    EnableTriggerGroup("hpheqi", false)
end
function test()
    Note("����Ŀ�ĵأ�")
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
    create_trigger_t("main", "^���齣\\D*��\\D*�Ѿ�����ִ����", "", "login")
    create_trigger_t("main1", "^Are you using BIG5 font\\(y/N\\)? ", "", "login_choose")
    lujing_trigger()
    chat_trigger()
    hp_trigger()
    fight_trigger()
    fight_prepare()
    idle()
    getVariable()
    userGet()
    hpheqi()
    statusbar.Activate()
    -- ���� StatusBar
    gag.Activate()
    -- ���� ��Ϣ����

    Openfpk()
    -- ain

    map.rooms["sld/lgxroom"].ways["#outSld"] = "huanghe/huanghe8"
    exe("down;alias askk ask $*;stand;halt;uweapon;score;cha;hp;jifa all;jiali max;unset no_kill_ap;cond;pfmset")

end

-- ---------------------------------------------------------------
-- �齣��ʼ������
-- ---------------------------------------------------------------
function SJ.Config()
    needdolost = 0


end

-- ---------------------------------------------------------------
-- �����Լ���, ������������������, �粻ͬ���ɼ������еĲ���
-- ---------------------------------------------------------------
function IndependentOnload()
    Sect.Onload()
end

function main()
    SJ.Init()
    if GetRoleConfig("AutoBuy_Xiaobao_Longquan") and not Bag["��Ȫ��"] then
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
    create_trigger_t("login2", "^����������������ʶ������\\(passwd\\)��", "", "login_passwd")
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
    -- ����������Ϣ����
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
    create_trigger_t("dz_count1", "^>*\\s*���Ҳ��ܴ�������Ӱ�������Ϣ��", "", "hp_dz_where")
    create_trigger_t("dz_count2", "^>*\\s*���޷���������������", "", "hp_dz_where")
    create_trigger_t("dz_count3", "^>*\\s*(���ﲻ׼ս����Ҳ��׼������|����ɲ���������������ĵط���)", "", "hp_dz_where")
    create_trigger_t("dz_count4", "^(> )*�������ֽŴ�����������������ȷ������������", "", "hp_dz_liaokao")
    create_trigger_t("dz_count5", "^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)", "", "hp_dz_where")
    create_trigger_t("dz_count6", "^(> )*�����ھ��������޷�������Ϣ��������", "", "loginerror")
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
    if skills["force"] and skills["force"].lvl < 450 and skills["force"].lvl < hp.pot_max - 100 then
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
        Note("��Ѵ���ֵΪ��" .. hp.dazuo)
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
    create_trigger_t('hp1', "^����Ѫ��\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*��������\\s*(\\d*)\\s*\\/\\s*(\\d*)\\((\\d*)\\)$", '', 'hp_jingxue_check')
    create_trigger_t('hp2', "^����Ѫ��\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*��������\\s*(\\d*)\\s*\\/\\s*(\\s*\\d*)\\(\\+\\d*\\)$", '', 'hp_qixue_check')
    create_trigger_t('hp3', "^��ʳ�\\s*(\\d*)\\.\\d*\\%\\s*��Ǳ�ܡ�\\s*(\\d*)\\s*\\/\\s*(\\d*)$", '', 'hp_pot_check')
    create_trigger_t('hp4', "^����ˮ��\\s*(\\d*)\\.\\d*\\%\\s*�����顤\\s*(.*)\\s*\\(", '', 'hp_exp_check')
    create_trigger_t('hp5', "^��(��|��)����\\s*(.*)\\s*���������ޡ�\\s*(\\d*)\\s*\\/", '', 'hp_shen_check')
    create_trigger_t('hp7', "^(��)*\\s*(\\D*)\\s*\\((\\D*)(\\-)*(\\D*)\\)\\s*\\-\\s*\\D*\\s*(\\d*)\\/\\s*(\\d*)$", '', 'check_skills')
    create_trigger_t('hp8', "^>*\\s*��������Ҫ(\\D*)�������������", '', 'hp_dazuo_check')
    create_trigger_t('hp9', "^��(\\D*)����\\s*��\\s*(\\d*) ��\\s*�� ", '', 'checkJobtimes')
    create_trigger_t('hp10', "^��(\\D*)\\(\\D*\\)$", '', 'checkWieldCatch')
    create_trigger_t('hp11', "^(> )*������������(\\D*)����$", '', 'checkJoblast')
    create_triggerex_lvl('hp12', "^(> )*(\\D*)", '', 'resetWait', 200)
    create_trigger_t('hp13', "^(> )*�㻹��Ѳ���أ���ϸ����������ɡ�", '', 'checkQuit')
    create_trigger_t('hp14', "^\\D*��һ�������ˡ�$", '', 'checkRefresh')
    create_trigger_t('hp15', "^(> )*һ�����ֹ�ȥ", '', 'checkMonth')
    create_trigger_t('hp16', "^(> )*�������ʧ���ż�����(\\N*)�Σ��������ʧ���ż�����(\\N*)/(\\N*)�Ρ�", '', 'checkLLlost')
    create_trigger_t('hp17', "^(> )*��(�ʵ���ð���ǣ�ȫ������|����ͷ���ۻ���ֱð�亹)", '', 'checkQuit')
    create_trigger_t('hp18', "^(> )*(����������ѵ��촽�������Ǻܾ�û�к�ˮ��|ͻȻһ�󡰹�������������ԭ������Ķ����ڽ���)", '', 'checkfood')
    create_trigger_t('hp19', "^(> )*(��Ȼһ��̹ǵ��溮Ϯ�������е������ƶ�������|��Ȼһ�ɺ������Ʊ�����ѭ���ֱۣ�Ѹ�����׵��������ţ����еĺ���������)", '', 'checkDebug')
    create_trigger_t('hp20', "^(> )*��(����һ�Ż�Ѫ�ƾ�������ʱ�о���Ѫ������ʧ|����һ����Ϣ�裬��ʱ�������������˲���|����һ�Ŵ�����Ϣ�裬��ʱ�о���������|����һ�Ż�����Ϣ������ʱ�о�����ĵ����ӯ�˲���|����һ�����ɽ�ҩ����ʱ�о����ƺ��˲���|����һ�Ŵ󻹵���ʱ����Ȭ����Ѫ��ӯ)��", '', 'hpeatOver')
    create_trigger_t('hp21', "^(> )*��������� enable ѡ����Ҫ�õ������ڹ���", '', 'jifaOver')
    create_trigger_t('hp22', "^(> )*(\\D*)Ŀǰѧ��(\\D*)�ּ��ܣ�", '', 'show_skills')
    create_trigger_t('hp23', "^(> )*��ı������У�", '', 'show_beinang')
    create_trigger_t('hp24', '^(> )*������һ������\\D*����ߵ���һ(��|��|˫|Ϯ|��|��|��|��)(\\D*)(����|ѥ|����|����|����|����|ͷ��)��', '', 'fqyyArmorGet')
    create_trigger_t('hp25', '^(> )*�����һ(��|��|˫|Ϯ|��|��|��|��)(\\D*)(����|ѥ|����|����|����|����|ͷ��)��', '', 'fqyyArmorCheck')
    create_trigger_t('hp26', '^(> )*(\\D*)�͹��Ѿ��������ӣ���(ô|��)��ס��������أ����˻���ΪС���ź����أ�', '', 'kedian_sleep')
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
    create_trigger_t('score1', "^����    ����(\\D*)\\((\\D*)\\)\\s*����  ������(\\d*)\/(\\d*)��\\s*��  �ԣ���(\\d*)\/(\\d*)��", '', 'score_name_check')
    create_trigger_t('score2', "^��ͷ    �Σ�(\\D*)\\s*����  ������(\\d*)\/(\\d*)��\\s*��  �ǣ���(\\d*)\/(\\d*)��", '', 'score_title_check')
    create_trigger_t('score3', "^����    �䣺(\\D*)��\\D*\\s*��    ����", '', 'score_age_check')
    create_trigger_t('score4', "^��(����æ״̬|ѩɽǿ����Ů|˫������|����|����|�����ƶ�|�����ܻ���|��צ��������|�����ھֻ��ڵ���ʱ|��ʵ��Ұ)\\s*(\\D*)(��|��)\\s*", '', 'score_busy_check')
    create_trigger_t('score5', "^��(��    ��|��    ��|��    ��)��(\\D*)\\s*ʦ\\s*�У���(\\D*)����(\\D*)��", '', 'score_party_check')
    create_trigger_t('score6', "^����    ��(\\D*)��\\s*����(\\D*)\\s* �㣺", '', 'score_gender_check')
    create_trigger_t('score7', "^��(��    ��|��    ��|��    ��)��(\\D*)\\s*ʦ\\s*�У���(��ͨ����)��(\\D*)", '', 'score_party_check')
    create_trigger_t('score9', "^��ע    �᣺(\\D*)\\s*Ǯׯ��(\\D*)", '', 'score_gold_check')
    create_trigger_t('score8', "^��Ŀǰ�Ĵ�������ǣ�(\\D*)���ƽ�", '', 'checkGoldLmt')
    create_trigger_t('score10', '^�����ࣺ(\\D*)\\((\\d*)\\)\\s*������\\+(\\d*)\\s*������(\\d*)\\%\\s*��ɱ��(\\d*)\\%\\s*���ˣ�(\\d*)\\s*��', '', 'score_check_xy')
    create_trigger_t('score11', '^���齣ͨ����(\\N*)\\s*�齣Ԫ����(\\N*)\\s*�����ң�(\\N*)\\s*��', '', 'score_tb_check')
    create_trigger_t('score12', '^����ǰ�ȼ���(\\N*)\\s*������(\\N*)\\s*������᣺(\\N*)\\s*��', '', 'score_lv_check')
    create_trigger_t('score13', "^�������Ѿ�ʹ�þ�Ӣ֮��(\\D*)�Ρ�", '', 'score_ebook_check')
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
    messageShow("���ж���!")
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
    if string.find(l, "����һ�����ɽ�ҩ����ʱ�о����ƺ��˲���") then
        cty_cur = cty_cur - 1
    end
    if string.find(l, "����һ����Ϣ�裬��ʱ�������������˲���") then
        nxw_cur = nxw_cur - 1
    end
    if string.find(l, "����һ�Ŵ�����Ϣ�裬��ʱ�о���������") then
        cbw_cur = cbw_cur - 1
    end
    if string.find(l, "����һ�Ż�����Ϣ������ʱ�о�����ĵ����ӯ�˲���") then
        hqd_cur = hqd_cur - 1
    end
    if string.find(l, "����һ�Ż�Ѫ�ƾ�������ʱ�о���Ѫ������ʧ") then
        DeleteTimer("eatdan")
        hxd_cur = hxd_cur - 1
    end
    if string.find(l, "����һ�Ŵ󻹵���ʱ����Ȭ����Ѫ��ӯ") then
        messageShow("�Դ󻹵��ˣ�")
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
    return go(dhvpearl, "���ݳ�", "����")
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
-- ��ջ��С��busy��������..
-- ---------------------------------------------------------------
function kedian_sleep()
    -- ·���ϲ��ˣ��������п�ջ��
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
    return go(wuxingzhenCheck, "������", "�Է�")
end
function wuxingzhenCheck()
    if locl.id["�·�ɽ"] then
        return wuxingzhenStart()
    else
        local l_cnt = table.getn(getRooms("�Է�", "������"))
        flag.times = flag.times + 1
        if flag.times > l_cnt then
            return wuxingzhenFinish()
        else
            local l_sour = getRooms("�Է�", "������")[flag.times - 1]
            return go(wuxingzhenCheck, "������", "�Է�", l_sour)
        end
    end
end
function wuxingzhenStart()
    exe("yun jing")
    exe("ask wen fangshan about ������")
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
    if not locl.id["�·�ɽ"] or hp.pot < 10 then
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

    if Bag["����"] then
        return tiaoshui()
    end

    if Bag and Bag["����"] and Bag["����"].cnt and Bag["����"].cnt > 500 then
        return check_gold()
    end
    if
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt < count.gold_max and score.gold > count.gold_max) or
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt > count.gold_max * 4)
    then
        return check_gold()
    end

    if score.gold and score.gold > 100 and nxw_cur < 5 and drugPrepare["��Ϣ��"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and cbw_cur < 5 and drugPrepare["������Ϣ��"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and hqd_cur < 5 and drugPrepare["������Ϣ��"] then
        return checkNxw()
    end

    if score.gold and score.gold > 100 and cty_cur < 5 and drugPrepare["���ɽ�ҩ"] then
        return checkHxd()
    end

    --[[if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["а����"] or Bag["а����"].cnt<2) then
       return checkXqw()
   end

   if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["������"] or Bag["������"].cnt<2) then
       return checkZqd()
   end

   if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["а����"] or Bag["а����"].cnt<2) then
       return checkXqw()
   end

   if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["������"] or Bag["������"].cnt<2) then
       return checkZqd()
   end]]
    if not flag.item then
        if score.party and score.party == "������" and not Bag["����"] then
            return check_item()
        end
        if score.party == "������" and not Bag["����"] and not Bag["����"] then
            return check_item()
        end
    end

    if not Bag["����"] and drugPrepare["����"] then
        return checkFire()
    end
    if score.gold and score.gold > 100 and hxd_cur < 3 and drugPrepare["��Ѫ�ƾ���"] then
        return checkLjd()
    end

    if score.tb and score.tb > 100 and dhd_cur < 1 and drugPrepare["�󻹵�"] then
        return checkdhd()
    end

    for p in pairs(weaponPrepare) do
        if weaponStore[p] and not Bag[p] and Bag["�ƽ�"].cnt > 3 then
            return checkWeapon(p)
        end
        if weaponFunc[p] and not Bag[p] then
            return _G[weaponFuncName[p]]()
        end
        if weaponPrepare["����"] and Bag["ö����"].cnt < 100 then
            return checkWeapon("����")
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
    if not Bag["ľ��"] then
        -- ��robot�϶�ľ��Ϊ�������������
        weaponPrepare["ľ��"] = true
        return checkWeapon("ľ��")
    end

    if Bag["Τ��֮��"] then
        return checkHammer()
    end

    for p in pairs(Bag) do
        if Bag[p] and itemSave[p] then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["yu"] and string.find(p, "��") then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["jintie chui"] and string.find(p, "������") then
            return checkYu(p)
        end
        if Bag[p].id and Bag[p].id["shentie chui"] and string.find(p, "������") then
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
    if not job.last or job.last == "songxin" or needdolost == 1 or job.last == "tdh" or job.last == "songmoya" or job.last == "huashan" or job.zuhe["hqgzc"]
    then
        return check_xuexi()
    else
        return check_job()
    end
end
function letterLost()
    sLetterlost()
    go(letterLostBegin, "������", "����")
end
function letterLostBegin()
    if needvpearl == 1 and(condition.vpearl == 0 or not condition.vpearl) then
        return Govpearl()
    end
    if lostletter == 1 then
        exe("chakan letter")
        exe("look letter")
    end
end
function sLetterlost()
    DeleteTriggerGroup("lostletter")
    create_trigger_t("lostletter1", "^(> )*�����ҳ(\\N*)�鿴�����ˡ�$", "", "goMark")
    create_trigger_t("lostletter2", "^(> )*����˲�ע�⣬͵͵��ʧ����ż��ӽ���·�ߵĲݴԡ�$", "", "sendOk")
    create_trigger_t("lostletter3", "^(> )*�ŷ��ϵ��ּ�ģ�����壬��֪�������䵽�˴���$", "", "sendOk")
    create_trigger_t("lostletter4", "^(> )*�㽫ʧ����ż㽻��", "", "sendOk")
    create_trigger_t("lostletter5", "^(> )*����������д�������˵����֡�$", "", "lookXin")
    create_trigger_t("lostletter6", "^(> )*���ٿ����һ�㡣$", "", "letterLostBegin")
    create_trigger_t("lostletter7", "^(> )*�ŷ���д�ţ�(\\D*)\\((\\D*)\\)", "", "lostName")
    -- create_trigger_t('lostletter8',"^[> ]*��������������(\\D*)һ�����֡�$",'','get_lost_locate')
    SetTriggerOption("lostletter1", "group", "lostletter")
    SetTriggerOption("lostletter2", "group", "lostletter")
    SetTriggerOption("lostletter3", "group", "lostletter")
    SetTriggerOption("lostletter4", "group", "lostletter")
    SetTriggerOption("lostletter5", "group", "lostletter")
    SetTriggerOption("lostletter6", "group", "lostletter")
    SetTriggerOption("lostletter7", "group", "lostletter")
    -- SetTriggerOption("lostletter8","group","lostletter")
    llgo()
    EnableTriggerGroup("lostletter", true)
end
function goMark(n, l, w)
    print("��ʼ��дʧ���ż�����ID")
    local m_cmd = w[2]
    OpenBrowser(m_cmd)
    return Markletter()
end
function Markletter()
    l_result = utils.inputbox("�����ż�����ID������������discard��", "lostname", GetVariable("lostname"), "����", "12")
    if not isNil(l_result) then
        SetVariable("lostname", l_result)
    end
    return MarkName()
end
function MarkName()
    local lost_cmd = GetVariable("lostname")
    if lost_cmd == "discard" then
        return exe("discard letter")
    else
        return exe("mark " .. lost_cmd)
    end
end
function lookXin()
    lookxin = 1
    exe("look letter")
end
function lostName(n, l, w)
    lost_name = string.lower(w[3])
    return create_timer_s("sendTo", 0.5, "sendTo")
end
function sendXin()
    sLetterlost()
    return create_timer_s("sendTo", 0.5, "sendTo")
end
function sendTo()
    exe("follow " .. lost_name)
    exe("sendto " .. lost_name)
end
function sendOk()
    lookxin = 0
    lostletter = 0
    m_cmd = nil
    lostletter_locate = ""
    mousedown_lostletter()
    -- ����ˢ�µص�
    condition.vpearl = 0
    DeleteTimer("sendTo")
    DeleteTriggerGroup("lostletter")
    exe("follow none;cond;jobtimes")
    sendOk_fix()
    return check_food()
end
function check_xuexi()
    if MidHsDay[locl.time] and score.master == "������" then
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
        ["�䵱����"] = "wudang",
        ["��������"] = "songxin",
        ["ǿ����Ů"] = "xueshan",
        ["�Ͷ�����"] = "huashan",
        ["���ְ�"] = "clb",
        ["��ػ�"] = "tdh",
        ["��ɽ����"] = "songshan",
        ["ؤ������"] = "gaibang",
        ["��Ħ�¿�������"] = "songmoya"
    }

    if joblast[w[2]] then
        job.last = joblast[w[2]]
    end
end
-- ---------------------------------------------------------------
-- ѡ����һ������ǰ��һϵ�м�鼰׼��
-- ---------------------------------------------------------------
function check_job()
    if xcexp == 0 and hp.exp < 1000000 then
        print("Ѳ�ǵ�1M")
        kdummy = 0
        return xunCheng()
    end
    if xcexp == 1 and hp.exp < 2000000 then
        print("Ѳ�ǵ�2M")
        kdummy = 0
        return xunCheng()
    end
    if score.party == "�һ���" and(hp.shen > 150000 or hp.shen < -150000) then
        return thdJiaohui()
    end

    -- if score.gold and score.gold>150 and weaponUsave and countTab(weaponUsave)>0 and math.random(1,5)==1 then
    -- return weaponUcheck()
    -- end

    -- ÿ10��������һ������װ��
    if job.group.times ~= nil and job.group.times < 10 then
        return check_halt(check_jobx)
    else
        job.group.times = 0
        return check_halt(weaponUcheck)
    end
end
-- ---------------------------------------------------------------
-- job�л�
-- ---------------------------------------------------------------
function check_jobx()
    job.Switch()
end

function checkJob()
    -- if hp.exp>2000000 then job.zuhe["zhuoshe"]=nil end
    -- if hp.shen>0 or hp.exp>6000000 then job.zuhe["songshan"]=nil end
    if job.zuhe["songxin2"] then
        job.zuhe["songxin2"] = nil
        job.zuhe["songxin"] = true
        flag.sx2 = true
    end
    if job.last and job.zuhe[job.last] then
        if type(job.zuhe[job.last]) == "number" then
            job.zuhe[job.last] = job.zuhe[job.last] + 1
        else
            job.zuhe[job.last] = 1
        end
    end
    if countTab(job.zuhe) > 2 and not skills["xixing-dafa"] and job.zuhe["huashan"] and job.zuhe["wudang"] and jobtimes["��ɽ����Ⱥ�Ͷ�����"] and jobtimes["�䵱��Զ��ɱ����"]
    then
        local t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
        local t_wd = jobtimes["�䵱��Զ��ɱ����"]
        local t_times = math.fmod((t_hs + t_wd), 50)
        if t_times > 48 then
            exe("pray pearl")
            if job.last ~= "huashan" then
                return huashan()
            else
                for p in pairs(job.zuhe) do
                    if p ~= "huashan" and p ~= "wudang" and p ~= "hubiao" and p ~= "husong" and p ~= "songmoya" then
                        return _G[p]()
                    end
                end
            end
        end
    end
    if score.party and score.party == "��ɽ��" and countTab(job.zuhe) > 2 and not skills["dugu-jiujian"] and job.zuhe["huashan"] and job.zuhe["songxin"]
    then
        local t_hs, t_sx, t_gb

        if jobtimes["��ɽ����Ⱥ�Ͷ�����"] then
            t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
        else
            t_hs = 0
        end
        if jobtimes["����������������"] then
            t_sx = jobtimes["����������������"]
        else
            t_sx = 0
        end
        if jobtimes["ؤ���ⳤ��ɱ������"] then
            t_gb = jobtimes["ؤ���ⳤ��ɱ������"]
        else
            t_gb = 0
        end
        local t_times = math.fmod((t_hs + t_sx + t_gb), 50)
        if t_times > 47 then
            exe("pray pearl")
            if job.last ~= "huashan" then
                return huashan()
            else
                for p in pairs(job.zuhe) do
                    if p ~= "huashan" and p ~= "songxin" and p ~= "hubiao" and p ~= "husong" and p ~= "songmoya" then
                        return _G[p]()
                    end
                end
            end
        end
    end

    if job.third and job.zuhe[job.third] and job.last ~= job.third then
        if job.second and job.last == job.second then
            if job.third == "wudang" and(not job.wdtime or job.wdtime <= os.time()) then
                return _G[job.third]()
            end
            if job.third ~= "wudang" and job.third ~= "songmoya" then
                return _G[job.third]()
            end
        end
    end
    if job.first and job.zuhe[job.first] and job.last ~= job.first then
        if job.first ~= "xueshan" and job.first ~= "wudang" and job.first ~= "songmoya" then
            return _G[job.first]()
        end
        if job.first == "xueshan" and((not condition.xueshan) or(condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.first]()
        end
        if job.first == "wudang" and(not job.wdtime or job.wdtime <= os.time()) then
            return _G[job.first]()
        end
        if job.first == "xueshan" and condition.xueshan and condition.busy and condition.busy >= condition.xueshan then
            return _G[job.first]()
        end
    end
    if job.second and job.zuhe[job.second] and job.last ~= job.second then
        if job.second ~= "xueshan" and job.second ~= "wudang" and job.second ~= "songmoya" then
            return _G[job.second]()
        end
        if job.second == "xueshan" and((not condition.xueshan) or(condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.second]()
        end
        if job.second == "wudang" and(not job.wdtime or job.wdtime <= os.time()) then
            return _G[job.second]()
        end
        if job.second == "xueshan" and condition.xueshan and condition.busy and condition.busy >= condition.xueshan then
            return _G[job.second]()
        end
    end

    for p in pairs(job.zuhe) do
        if job.last ~= p and job.first ~= p and job.second ~= p and p ~= "songmoya" then
            return _G[p]()
        end
    end

    for p in pairs(job.zuhe) do
        if job.last ~= p and p ~= "songmoya" then
            return _G[p]()
        end
    end
    if job.zuhe["xueshan"] and job.last ~= "xueshan" then
        return xueshan()
    end
    if job.zuhe["huashan"] and job.last ~= "huashan" then
        return huashan()
    end
    if job.zuhe["tmonk"] and job.last ~= "tmonk" then
        return tmonk()
    end
    if job.zuhe["songxin"] and job.last ~= "songxin" then
        return songxin()
    end
    if job.zuhe["wudang"] and job.last ~= "wudang" then
        return wudang()
    end
    if job.zuhe["gaibang"] and job.last ~= "gaibang" then
        return gaibang()
    end
    if job.zuhe["zhuoshe"] and job.last ~= "zhuoshe" then
        return zhuoshe()
    end
    if job.zuhe["sldsm"] and job.last ~= "sldsm" then
        return sldsm()
    end
    if job.zuhe["songshan"] and job.last ~= "songshan" then
        return songshan()
    end
    if job.last ~= "songxin" then
        return songxin()
    end
    if job.last ~= "xueshan" and hp.shen < 0 then
        return xueshan()
    end
    if job.last ~= "wudang" and hp.shen > 100000 then
        return wudang()
    end
    if job.last ~= "gaibang" and hp.exp < 2000000 and hp.shen > 0 then
        return gaibang()
    end
    if job.last ~= "songshan" and hp.shen < 0 and hp.exp < 2000000 then
        return songshan()
    end
end

function lianxi(times, xskill)
    local weapontype
    flag.lianxi = 1
    local lianxi_times = 5
    if times ~= nil then
        lianxi_times = times
    end
    tmp.xskill = xskill
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
    if flag.lianxi == 1 then
        for p in pairs(skills) do
            q = skillEnable[p]
            if
                (not tmp.xskill or tmp.xskill == p) and q == "force" and skills[p].full == 0 and perform.force and
                perform.force == p
            then
                lianxi_times = lianxi_times * 0.5
                exe("lian " .. q .. " " .. lianxi_times)
                flag.lianxi = 0
                tmp.pskill = p
                exe("hp")
                break
            end
        end
    end
    if flag.lianxi == 1 then
        for p in pairs(skills) do
            q = skillEnable[p]
            if (not tmp.xskill or tmp.xskill == p) and q == "dodge" and skills[p].full == 0 then
                exe("bei none;jifa " .. q .. " " .. p)
                exe("lian " .. q .. " " .. lianxi_times)
                flag.lianxi = 0
                tmp.pskill = p
                break
            end
        end
    end
    if flag.lianxi == 1 then
        for p in pairs(skills) do
            q = skillEnable[p]
            if p == "yuxiao-jian" then
                weapontype = "xiao"
            else
                weapontype = q
            end
            if
                (not tmp.xskill or tmp.xskill == p) and q and p == perform.skill and skills[p].full == 0 and
                ((weaponKind[weapontype] and weaponInBag(weapontype)) or unarmedKind[q])
            then
                exe("bei none;jifa " .. q .. " " .. p)
                weapon_unwield()
                if weaponKind[q] then
                    exe("wield " .. q)
                    for k, v in pairs(Bag) do
                        if Bag[k].kind == weapontype then
                            exe("wield " .. Bag[k].fullid)
                        end
                    end
                end
                exe("i;lian " .. q .. " " .. lianxi_times)
                flag.lianxi = 0
                tmp.pskill = p
                break
            end
        end
    end
    if flag.lianxi == 1 then
        for p in pairs(skills) do
            q = skillEnable[p]
            if p == "yuxiao-jian" then
                weapontype = "xiao"
            else
                weapontype = q
            end
            if
                (not tmp.xskill or tmp.xskill == p) and q and q ~= "force" and skills[p].full == 0 and
                ((weaponKind[weapontype] and weaponInBag(weapontype)) or unarmedKind[q])
            then
                exe("bei none;jifa " .. q .. " " .. p)
                weapon_unwield()
                if weaponKind[q] then
                    exe("wield " .. q)
                    for k, v in pairs(Bag) do
                        if Bag[k].kind == weapontype then
                            exe("wield " .. Bag[k].fullid)
                        end
                    end
                end
                exe("i;lian " .. q .. " " .. lianxi_times)
                flag.lianxi = 0
                tmp.pskill = p
                break
            end
        end
    end
    beiUnarmed()
end
function beiUnarmed()
    local l_skill = beiUnarmedSkill()
    if l_skill and type(l_skill) == "string" and skillEnable[l_skill] then
        exe("bei none")
        exe("jifa " .. skillEnable[l_skill] .. " " .. l_skill)
        exe("bei " .. skillEnable[l_skill])
    end
    if skillHubei[l_skill] and skills[skillHubei[l_skill]] then
        l_skill = skillHubei[l_skill]
        exe("jifa " .. skillEnable[l_skill] .. " " .. l_skill)
        exe("bei " .. skillEnable[l_skill])
    end
end
function beiUnarmedSkill()
    local l_lvl = 0
    local l_skill
    if perform and perform.skill and skillEnable[perform.skill] and unarmedKind[skillEnable[perform.skill]] then
        -- exe('bei '.. skillEnable[perform.skill])
        return perform.skill
    end
    for p in pairs(flagFull) do
        if skills[p] and skillEnable[p] and unarmedKind[skillEnable[p]] then
            q = skillEnable[p]
            -- exe('bei none;jifa '..q..' '..p..';bei '..q)
            return p
        end
    end
    if score.party then
        if score.party == "������" and skills["hand"] and skills["jieshou-jiushi"] then
            -- exe('bei none;jifa hand jieshou-jiushi;bei hand')
            return "jieshou-jiushi"
        end
        if score.party == "ؤ��" and skills["strike"] and skills["xianglong-zhang"] then
            -- exe('bei none;jifa strike xianglong-zhang;bei strike')
            return "xianglong-zhang"
        end
    end
    for p in pairs(skills) do
        if skillEnable[p] then
            q = skillEnable[p]
            if unarmedKind[q] then
                if skills[p].lvl > l_lvl then
                    l_lvl = skills[p].lvl
                    l_skill = p
                    -- exe('bei none;jifa '..q..' '..p..';bei '..q)
                end
            end
        end
    end
    return l_skill
end

function check_busy(func, p_cmd)
    disWait()
    DeleteTriggerGroup("check_bei")
    create_trigger_t("check_bei1", "^(> )*(�������Ѿ����|����׼����һ�ּ�����|�����ٲ���������ȭ�ż��ܵ�����֮һ)", "", "beiok")
    create_trigger_t("check_bei2", "^(> )*������û�м����κ���Ч���⼼�ܡ�", "", "beinone")
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
    disWait()
    DeleteTriggerGroup("check_halt")
    create_trigger_t("check_halt1", "^>*\\s*(�����ڲ�æ��|���������һԾ������սȦ�����ˡ�)", "", "haltok")
    create_trigger_t("check_halt2", "^>*\\s*�����ں�æ��ͣ��������", "", "halterror")
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
    if locl.room == "ϴ��ر�" then
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
    create_trigger_t("check_busy1", "^>*\\s*û������������࣬��", "", "busyok")
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
    create_trigger_t("checkwait1", '^(> )*��� "action" �趨Ϊ "�ȴ�һ��" �ɹ���ɡ�$', "", "checkWaitOk")
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
    exe("alias action �ȴ�һ��")
end
function checkWaitOk()
    EnableTriggerGroup("checkwait", false)
    EnableTrigger("hp12", false)
    -- DeleteTimer('waitimer
    EnableTimer("waitimer", false)
    if waithook == nil then
        waithook = test
    end
    return waithook()
end

nexthook = test
function checkNext(func)
    disWait()
    DeleteTriggerGroup("checknext")
    create_trigger_t("checknext1", '^(> )*��� "action" �趨Ϊ "����ǰ��" �ɹ���ɡ�$', "", "checkNextOk")
    SetTriggerOption("checknext1", "group", "checknext")
    EnableTriggerGroup("checknext", true)
    EnableTrigger("hp12", true)
    nexthook = func
    next_timer_set()
    return create_timer_s("nextimer", 0.5, "next_timer_set")
end
function next_timer_set()
    exe("alias action ����ǰ��")
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
                messageShow(v .. " " .. "�趨ʱ��:" .. GetTimerInfo(v, 3) .. "�룬��һ��ʱ��:" .. GetTimerInfo(v, 13) .. "�롣")
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
    local _, _, wan, other = string.find(num, "^(.-)��(.*)$")
    local result = 0
    if wan then
        result = result + trans0(wan) * 10000
        num = other
    end
    result = result + trans0(num)
    return result
end

function trans0(num)
    num = string.gsub(num, "^ʮ(.*)$", "һʮ%1")
    num = string.gsub(num, "��ʮ", "һʮ")
    num = string.gsub(num, "��", "")
    local result = 0
    local numbers = { "һ", "��", "��", "��", "��", "��", "��", "��", "��" }
    for k, v in pairs(numbers) do
        num = string.gsub(num, v, k)
    end
    local units = { ["0|"] = "ʮ", ["00|"] = "��", ["000|"] = "ǧ" }
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
        print("������Ħ�������У���ǰ����������" .. smydie .. "���Σ��趨ɱ����ʿ��������Ϊ��" .. smyteam .. "���顣��������Ϊ�ڡ�" .. yptteam .. "���顣")
        exe("flatter")
        return
    end
    if job.name == "husong" then
        exe("aq")
        print("���ڻ���������")
        return
    end
    if job.name == "refine" then
        exe("admire2")
        print("����������ʯ��")
        return
    end
    if job.name == "wudang" and wudangJob.killStartTime ~= nil then
        -- ˵���ѽ����ɱ�׶�, �����䵱�����busyʱ�䳬��, ���Խ������ս��ʱ���ӳ���12����, ����̫����ս��ʱ�����idle���ж�
        if flag.idle < 24 then
            return
        end
    end
    print(flag.idle)
    exe("poem")
    if not flag.idle or type(flag.idle) ~= "number" then
        flag.idle = 0
    end
    flag.idle = flag.idle + 1
    if flag.idle < 8 then
        return
    end
    if flag.idle < 10 then
        chats_log("ROBOT �����ѷ���" .. flag.idle / 2 .. "����!", "deepskyblue")
        return
    end
    scrLog()
    dis_all()
    chats_locate("��λϵͳ������5���Ӻ��ڡ�" .. locl.area .. locl.room .. "����������ϵͳ��", "red")
    Disconnect()
    Connect()
end

function checkWield()
    itemWield = { }
    exe("i")
end
function checkWieldCatch(n, l, w)
    itemWield = itemWield or { }
    local l_item = w[1]
    for p in pairs(weaponThrowing) do
        if string.find(l_item, p) then
            l_item = p
        end
    end
    itemWield[l_item] = true
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
function checkYaoBags(func)
    DeleteTriggerGroup("Yaobags")
    create_trigger_t("Yaobags1", "^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(", "", "checkBagsMoney")
    create_trigger_t("Yaobags2", '^(> )*��� "action" �趨Ϊ "���ҩƷ" �ɹ���ɡ�$', "", "checkYaoBagsOver")
    create_trigger_t("Yaobags3", "^(> )*(\\D*)��ʧ����ż�", "", "checkBagsletter")
    SetTriggerOption("Yaobags1", "group", "Yaobags")
    SetTriggerOption("Yaobags2", "group", "Yaobags")
    SetTriggerOption("Yaobags3", "group", "Yaobags")
    EnableTriggerGroup("Yaobags", true)
    cty_cur = 0
    nxw_cur = 0
    cbw_cur = 0
    hqd_cur = 0
    hxd_cur = 0
    dhd_cur = 0
    -- print(cty_cur,nxw_cur,hxd_cur)
    Bag["�ƽ�"].cnt = 0
    Bag["����"].cnt = 0
    tmp.yaobags = func
    exe("i;look bei nang")
    exe("alias action ���ҩƷ")
end
function checkYaoBagsOver()
    checkBY()
    draw_beinangwindow()
    EnableTriggerGroup("Yaobags", false)
    DeleteTriggerGroup("Yaobags")
    EnableTriggerGroup("beinang", false)
    DeleteTriggerGroup("beinang")
    -- print(cty_cur,nxw_cur,hxd_cur)
    if tmp.yaobags ~= nil then
        return tmp.yaobags()
    end
end

function checkBY()
    if not Beinang then
        Beinang = { "��" }
    end
    for i = 1, #Beinang do
        if Beinang[i] == "" or Beinang[i] == nil then
            Beinang[i] = "���ݶ�ʧ"
        end
        local l_name = Beinang[i]
        if string.find(l_name, "���ɽ�ҩ") then
            cty_cur = trans(Beinang[i])
        end
        if string.find(l_name, "����Ϣ��") then
            nxw_cur = trans(Beinang[i])
        end
        if string.find(l_name, "������Ϣ��") then
            cbw_cur = trans(Beinang[i])
        end
        if string.find(l_name, "������Ϣ��") then
            hqd_cur = trans(Beinang[i])
        end
        if string.find(l_name, "��Ѫ�ƾ���") then
            hxd_cur = trans(Beinang[i])
        end
        if string.find(l_name, "�󻹵�") then
            dhd_cur = trans(Beinang[i])
        end
        if string.find(l_name, "����ʯ") then
            kuang_cur = trans(Beinang[i])
        end
        -- print(cty_cur,nxw_cur,hxd_cur,dhd_cur)
    end
end

-- ----------------------------------------------------------
-- ������ƷӢ����(fullid),��ȡ��Ʒ������, ��������Bag�����Ʒ
-- ----------------------------------------------------------
function GetItemChineseInBagByFullID(tFullID)
    local CN_name = ""
    for p in pairs(Bag) do
        if Bag[p].fullid == tFullID then
            CN_name = tostring(p)
        end
    end
    return CN_name
end

function checkBags(func)
    DeleteTriggerGroup("bags")
    create_trigger_t("bags1", "^(> )*������Я����Ʒ�ı������", "", "checkBagsStart")
    create_trigger_t("bags2", "^\\d*:(\\D*) = (\\D*)$", "", "checkBagsId")
    create_trigger_t("bags3", "^(> )*��Ŀǰ�Ѿ�ӵ����(\\D*)��˽��װ����(\\D*)��$", "", "checkBagsU")
    create_trigger_t("bags4", "^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(", "", "checkBagsMoney")
    create_trigger_t("bags5", '^(> )*��� "action" �趨Ϊ "������" �ɹ���ɡ�$', "", "checkBagsOver")
    create_trigger_t("bags6", "^(> )*(\\D*)��ʧ����ż�", "", "checkBagsletter")
    create_trigger_t("bags7", "^(> )*(\\D*)ö����\\(", "", "checkBagsDart")
    create_trigger_t("bags8", "^(> )*�����ϴ���(\\D*)������\\(����\\s*(\\d*)\\.\\d*\\%\\)��", "", "checkBagsW")
    SetTriggerOption("bags1", "group", "bags")
    SetTriggerOption("bags2", "group", "bags")
    SetTriggerOption("bags3", "group", "bags")
    SetTriggerOption("bags4", "group", "bags")
    SetTriggerOption("bags5", "group", "bags")
    SetTriggerOption("bags6", "group", "bags")
    SetTriggerOption("bags7", "group", "bags")
    SetTriggerOption("bags8", "group", "bags")
    EnableTriggerGroup("bags", false)
    EnableTrigger("bags1", true)
    cty_cur = 0
    nxw_cur = 0
    cbw_cur = 0
    hqd_cur = 0
    hxd_cur = 0
    dhd_cur = 0
    -- print(cty_cur,nxw_cur,hxd_cur)
    bags = { }
    Bag = { }
    Bag["�ƽ�"] = { }
    Bag["�ƽ�"].id = { }
    Bag["�ƽ�"].cnt = 0
    Bag["����"] = { }
    Bag["����"].id = { }
    Bag["����"].cnt = 0
    tmp.bags = func
    weaponUsave = { }
    exe("id")
    checkWield()
    exe("look bei nang")
    exe("uweapon;alias action ������")
end
function checkBagsletter()
    lostletter = 1
end
function checkBagsStart()
    EnableTriggerGroup("bags", true)
end
function checkBagsId(n, l, w)
    local l_name = Trim(w[1])
    local l_id = w[2]
    local l_set = { }
    local l_cnt = 0
    if not Bag[l_name] then
        Bag[l_name] = { }
    end
    Bag[l_name].id = { }
    if string.find(l_id, ",") then
        l_set = utils.split(l_id, ",")
        l_id = l_set[1]
        for k, v in ipairs(l_set) do
            -- table.insert(Bag[l_name].id,1,Trim(v))
            Bag[l_name].id[Trim(v)] = true
            if string.len(Trim(v)) > l_cnt then
                Bag[l_name].fullid = Trim(v)
                l_cnt = string.len(Trim(v))
            end
        end
    else
        Bag[l_name].id[Trim(l_id)] = true
        -- table.insert(Bag[l_name].id,1,Trim(l_id))
        Bag[l_name].fullid = Trim(l_id)
    end
    if Bag[l_name].id["armor"] then
        Bag[l_name].kind = "armor"
    end
    if Bag[l_name].id["dao"] or Bag[l_name].id["blade"] then
        Bag[l_name].kind = "blade"
    end
    if Bag[l_name].id["jian"] or Bag[l_name].id["sword"] then
        Bag[l_name].kind = "sword"
    end
    if Bag[l_name].id["xiao"] then
        Bag[l_name].kind = "xiao"
    end
    if Bag[l_name].id["gun"] or Bag[l_name].id["club"] then
        Bag[l_name].kind = "club"
    end
    if Bag[l_name].id["stick"] or Bag[l_name].id["zhubang"] or Bag[l_name].id["bang"] then
        Bag[l_name].kind = "stick"
    end
    if Bag[l_name].id["bi"] or Bag[l_name].id["brush"] then
        Bag[l_name].kind = "brush"
    end
    if Bag[l_name].id["qiang"] or Bag[l_name].id["spear"] then
        Bag[l_name].kind = "spear"
    end
    if Bag[l_name].id["chui"] or Bag[l_name].id["hammer"] then
        Bag[l_name].kind = "hammer"
    end
    if Bag[l_name].id["gangzhang"] or Bag[l_name].id["staff"] or Bag[l_name].id["zhang"] or Bag[l_name].id["jiang"] then
        Bag[l_name].kind = "staff"
    end
    if Bag[l_name].id["bian"] or Bag[l_name].id["whip"] then
        Bag[l_name].kind = "whip"
    end
    if Bag[l_name].id["hook"] then
        Bag[l_name].kind = "hook"
    end
    if Bag[l_name].id["fu"] or Bag[l_name].id["axe"] then
        Bag[l_name].kind = "axe"
    end
    if Bag[l_name].id["bishou"] or Bag[l_name].id["dagger"] then
        Bag[l_name].kind = "dagger"
    end
    if weaponThrowing[l_name] then
        Bag[l_name].kind = "throwing"
    end
    if (string.find(l_name, "��ƪ") or string.find(l_name, "��Ҫ")) and not itemSave[l_name] then
        exe("read book")
        exe("drop " .. Bag[l_name].fullid)
    end
    if
        string.len(l_name) == 6 and
        (string.sub(l_name, 5, 6) == "ҩ" or string.sub(l_name, 5, 6) == "��" or string.sub(l_name, 5, 6) == "��") and
        (not drugPoison[l_name] and not drugBuy[l_name])
    then
        exe("eat " .. Bag[l_name].fullid)
    end
    bags[l_name] = Trim(l_id)
    if Bag[l_name].cnt then
        Bag[l_name].cnt = Bag[l_name].cnt + 1
    else
        Bag[l_name].cnt = 1
    end
end
function checkBagsU(n, l, w)
    local t = Trim(w[3])
    local s = utils.split(t, ',')
    for p, q in pairs(s) do
        if string.find(q, '��') then
            q = string.sub(q, 3, -1)
        end
        -- ���뾫Ѫ�ж�,����ѪС��2000, �ܿ����޲�������,���һֱ��������������ѭ��
        if hp.jingxue > 2000 then
            weaponUsave[q] = true
        end
    end
end
function checkBagsMoney(n, l, w)
    local l_cnt = trans(Trim(w[2]))
    local l_name = Trim(w[4])
    if Bag[l_name] then
        Bag[l_name].cnt = l_cnt
    end
end
function checkBagsW(n, l, w)
    local t = tonumber(w[3])
    Bag = Bag or { }
    Bag["ENCB"] = { }
    Bag["ENCB"].value = t
end
function checkBagsDart(n, l, w)
    local l_name = 'ö����'
    Bag[l_name] = { }
    Bag[l_name].id = { }
    Bag[l_name].cnt = 0
    local l_cnt = trans(Trim(w[2]))
    Bag[l_name].cnt = l_cnt
end
--[[function checkBagsYao(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[3])
  if string.find(l_name,"���ɽ�ҩ") then
      cty_cur = l_cnt
   end
   if string.find(l_name,"������Ϣ��") then
      nxw_cur = l_cnt
   end
   if string.find(l_name,"��Ѫ�ƾ���") then
      hxd_cur = l_cnt
   end
   if string.find(l_name,"�󻹵�") then
      dhd_cur = l_cnt
   end
end]]
function checkBagsOver()
    draw_bagwindow()
    checkBY()
    draw_beinangwindow()
    EnableTriggerGroup("bags", false)
    DeleteTriggerGroup("bags")
    EnableTriggerGroup("beinang", false)
    DeleteTriggerGroup("beinang")
    if Bag["�����"] then
        exe("drop cha")
    end
    if Bag["�޻�����"] then
        exe("drop " .. Bag["�޻�����"].fullid)
    end
    if Bag["�޻�"] then
        exe("drop " .. Bag["�޻�"].fullid)
    end
    if Bag["��ͭ"] then
        exe("drop " .. Bag["��ͭ"].fullid)
    end
    if Bag["����"] then
        exe("drop " .. Bag["����"].fullid)
    end
    if Bag["������"] and Bag["������"].cnt > 2 then
        exe("drop cu shengzi 2")
    end
    if Bag["ľ��"] and Bag["ľ��"].cnt > 1 then
        exe("drop mu jian 2")
    end
    -- print(cty_cur,nxw_cur,hxd_cur)
    if tmp.bags ~= nil then
        return tmp.bags()
    end
end

function isInBags(p_item)
    if p_item == nil then
        return false
    end
    local l_cnt = 0
    local l_item
    if Bag[p_item] then
        l_item = p_item
        l_cnt = l_cnt + Bag[p_item].cnt
        -- return p_item,Bag[p_item].cnt
    end
    for k, v in pairs(Bag) do
        if type(v.id) == "table" then
            if v.id[p_item] then
                l_item = k
                l_cnt = l_cnt + Bag[k].cnt
            end
        end
    end
    if l_cnt > 0 then
        return l_item, l_cnt
    end
    return false
end

function check_item()
    if score.party and score.party == "������" and not Bag["����"] then
        return check_item_go()
    elseif score.party == "������" and not Bag["����"] and not Bag["����"] then
        return go(checkSengxie, "��ɽ����", "���߿�")
    else
        return check_item_over()
    end
end
function checkSengxie()
    exe("ask chanshi about ɮЬ")
    return check_bei(checkHuyao)
end
function checkHuyao()
    exe("ask chanshi about ����")
    return check_bei(checkHuwan)
end
function checkHuwan()
    exe("ask chanshi about ����")
    return check_bei(check_item_over)
end
function check_item_go()
    go(check_item_belt, "����ɽ", "�����")
end
function check_item_belt()
    exe("ask shitai about Ƥ����")
    check_bei(check_item_over)
end
function check_item_over()
    exe("drop shoes 2")
    exe("remove all")
    exe("wear all")

    flag.item = true

    return checkPrepare()
end

function Ebookcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Ebookcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipEbookck")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ�þ�Ӣ֮�顣", "", "Yjwcheck")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return exe("duihuan ebook")
    else
        return Gstart()
    end
end
function vipEbookck()
    check_halt(vipEbook)
end
function vipEbook()
    exe("duihuan ebook")
end
function Yjwcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipYjwck")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ�����衣", "", "Ygcheck")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return check_halt(vipYjw)
    else
        return Gstart()
    end
end
function vipYjwck()
    check_halt(vipYjw)
end
function vipYjw()
    exe("duihuan yuji wan")
end
function Ygcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipYggo")
    create_trigger_t("vipchk2", "^(> )*���������޷�ʹ��ԧ�������", "", "Gstart")
    create_trigger_t("vipchk3", "^(> )*�������һ��ԧ�����", "", "vipYgok")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    SetTriggerOption("vipchk3", "group", "vipchk")
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        return check_halt(vipYg)
    else
        return Gstart()
    end
end
function vipYggo()
    return go(vipGhyg, "�����", "���")
end
function vipGhyg()
    exe("guihuan ying gu")
end
function vipYgok()
    return go(vipYg, "���ݳ�", "����")
end
function vipYg()
    exe("duihuan jinpa")
end
function Vipcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id vipcheck
    create_trigger_t("vipchk1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipxidu")
    create_trigger_t("vipchk2", "^(> )*����쾦����Ѿ������ˡ�", "", "vipxidu_over")
    create_trigger_t("vipchk3", "^(> )*���������޷�ʹ��", "", "vipover")
    create_trigger_t("vipchk4", "^(> )*����Ҫ�������е���Ʒ�����ٴζһ���", "", "vipxidu")
    SetTriggerOption("vipchk1", "group", "vipchk")
    SetTriggerOption("vipchk2", "group", "vipchk")
    SetTriggerOption("vipchk3", "group", "vipchk")
    SetTriggerOption("vipchk4", "group", "vipchk")
    if vippoison == 1 and ptbxvip == 1 then
        return exe("duihuan bingchan")
    else
        return check_xue()
    end
end
function vipxidu()
    return check_busy(xidu)
end
function xidu()
    exe("xidu")
end
function vipxidu_over()
    EnableTriggerGroup("vipchk", false)
    DeleteTriggerGroup("vipchk")
    vippoison = 0
    return check_halt(vipdhd)
end
function vipdhd()
    DeleteTriggerGroup("vipdhd")
    -- ain dls nv id vipcheck
    create_trigger_t("vipdhd1", "^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�", "", "vipeatdhd")
    create_trigger_t("vipdhd2", "^(> )*��Ĵ󻹵��Ѿ������ˡ�", "", "vipdhd_over")
    create_trigger_t("vipdhd3", "^(> )*���������޷�ʹ��", "", "vipover")
    create_trigger_t("vipdhd4", "^(> )*����Ҫ�������е���Ʒ�����ٴζһ���", "", "vipeatdhd")
    create_trigger_t("vipdhd5", "^(> )*������㣬�ⶫ���ܳ���", "", "vipdhd_over")
    SetTriggerOption("vipdhd1", "group", "vipdhd")
    SetTriggerOption("vipdhd2", "group", "vipdhd")
    SetTriggerOption("vipdhd3", "group", "vipdhd")
    SetTriggerOption("vipdhd4", "group", "vipdhd")
    SetTriggerOption("vipdhd5", "group", "vipdhd")
    exe("duihuan dahuan dan")
end
function vipeatdhd()
    return check_busy(eatdhd)
end
function eatdhd()
    exe("eat dan")
end
function vipdhd_over()
    EnableTriggerGroup("vipdhd", false)
    DeleteTriggerGroup("vipdhd")
    return check_halt(checkPrepare)
end
function vipover()
    EnableTriggerGroup("vipchk", false)
    DeleteTriggerGroup("vipchk")
    EnableTriggerGroup("vipdhd", false)
    DeleteTriggerGroup("vipdhd")
    ptbxvip = 0
    inwdj = 0
    return check_xue()
end
function checkvip()
    if score.id and score.id == "ptbx" and ptbxvip == 1 then
        exe("cond")
        return go(Vipcheck, "���ݳ�", "����")
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
    exe("nick ��·��")
    if score.party and score.party == "������" then
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
        return go(check_heal_newbie, "���ݳ�", "ҩ��")
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
        if score.party == "������" and hp.neili > 2000 then
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
        return go(check_xue_ask, "������", "����")
    else
        return check_xue_fail()
    end
end
function check_xue_ask()
    DeleteTriggerGroup("ck_xue_ask")
    create_trigger_t("ck_xue_ask1", "^(> )*����ѦĽ�������йء����ˡ�����Ϣ��$", "", "check_xue_accept")
    create_trigger_t("ck_xue_ask2", "^(> )*����û�������", "", "check_xue_fail")
    SetTriggerOption("ck_xue_ask1", "group", "ck_xue_ask")
    SetTriggerOption("ck_xue_ask2", "group", "ck_xue_ask")
    DeleteTriggerGroup("ck_xue_accept")
    create_trigger_t("ck_xue_accept1", "^(> )*ѦĽ�����ٺٺ١���Ц�˼�����$", "", "check_xue_teach")
    create_trigger_t("ck_xue_accept2", "^(> )*һ����Ĺ����ȥ�ˣ�����������Ѿ�����Ȭ���ˡ�", "", "check_xue_heal")
    create_trigger_t("ck_xue_accept3", "^(> )*Ѧ��ҽ�ó�һ�������������������˲�λ������Ѩ��", "", "check_xue_wait")
    create_trigger_t("ck_xue_accept4", "^(> )*ѦĽ���ƺ����������˼��$", "", "check_xue_heal")
    create_trigger_t("ck_xue_accept5", "^(> )*ѦĽ����ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����", "", "check_xue_fail")
    SetTriggerOption("ck_xue_accept1", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept2", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept3", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept4", "group", "ck_xue_accept")
    SetTriggerOption("ck_xue_accept5", "group", "ck_xue_accept")
    EnableTriggerGroup("ck_xue_accept", false)
    DeleteTriggerGroup("ck_xue_teach")
    create_trigger_t("ck_xue_teach1", "^(> )*Ѧ��ҽ����������Ѿ������ٽ����ˡ�$", "", "check_xue_next")
    SetTriggerOption("ck_xue_teach1", "group", "ck_xue_teach")
    EnableTriggerGroup("ck_xue_teach", false)
    DeleteTriggerGroup("ck_xue_busy")
    create_trigger_t("ck_xue_busy1", "^(> )*����Ъ������˵���ɡ�$", "", "check_xue_busy")
    SetTriggerOption("ck_xue_busy1", "group", "ck_xue_busy")
    EnableTriggerGroup("ck_xue_busy", true)
    exe("ask xue muhua about ����")
end
function check_xue_busy()
    return check_busy(check_xue_ok, 2)
end
function check_xue_ok()
    EnableTriggerGroup("ck_xue_accept", true)
    exe("ask xue muhua about ����")
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
    exe("set ����;hp;yun qi;yun jing;yun jingli;cond")
    exe("dazuo " .. hp.dazuo)
end
function poison_dazuo()
    DeleteTriggerGroup("poison")
    create_trigger_t(
    "poison1",
    "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
    "",
    "poisondazuo_desc"
    )
    create_trigger_t("poison2", "^(> )*�����ھ��������޷�������Ϣ��������", "", "checkDebug")
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
    return go(Brefine, "���ݳ�", "������")
end
function Brefine()
    kuangshi = "tiekuang shi"
    DeleteTriggerGroup("refine")
    create_trigger_t("refine1", "^(> )*��û���㹻������ʯ��", "", "refineGold")
    create_trigger_t("refine2", "^(> )*��û���㹻�Ľ��ʯ��", "", "refineOK")
    SetTriggerOption("refine1", "group", "refine")
    SetTriggerOption("refine2", "group", "refine")
    EnableTriggerGroup("refine", true)
    create_timer_s("refine", 2, "refine")
end
function refine()
    exe("refine " .. kuangshi)
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
    -- �Ƿ��Ѿ�װ����������
    Weapon.RecoverNeili()

    Force2Full = Force2Full or false
    if score.gender == "��1" then
        -- ����ר�ã���շ���
        map.rooms["city/mingyufang"].ways["north"] = nil
        map.rooms["changan/eastjie1"].ways["north"] = nil
    end
    map.rooms["sld/lgxroom"].ways["#outSld"] = "huanghe/huanghe8"
    if score.party == "��ɽ��" and hp.shen < 0 then
        map.rooms["huashan/houtang"].ways["north"] = nil
        map.rooms["huashan/qianting"].ways["south"] = nil
    end
    if score.party == "����Ľ��" then
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
    exe("nick ȥ�䵱�Ժ�;remove all;wear all")
    quest.name = "ȫ����״̬"
    quest.status = ""
    quest.target = ""
    quest.location = ""
    quest.note = ""
    quest:update()
    exe("hp;unset no_kill_ap;yield no")
    if (hp.food < 60 or hp.water < 60) and hp.exp < 500000 then
        return go(dali_eat, "�����", "���")
    elseif hp.food < 60 or hp.water < 60 or Force2Full then
        return go(wudang_eat, "�䵱ɽ", "��ͤ")
    else
        check_bei(check_food_over)
    end
end
function wudang_eat()
    if locl.room == "��ͤ" then
        flag.food = 0
        DeleteTimer("food")
        exe("sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao")
        check_bei(check_food_over)
    else
        return go(wudang_eat, "�䵱ɽ", "��ͤ")
    end
end
function check_food_over()
    if kuang_cur and kuang_cur > 2000 then
        return Ronglian()
    end
    return check_heal()
end

function dali_eat()
    if locl.room == "���" then
        flag.food = 0
        DeleteTimer("food")
        exe("#5(drink);e;e;s;buy baozi;#2(eat baozi)")
        check_bei(check_food_over)
    else
        return go(dali_eat, "�����", "���")
    end
end

function check_pot(p_cmd)
    if hp.exp < 5000000 then
        l_pot = hp.pot_max - 100
    else
        l_pot = hp.pot_max - 200
    end
    flag.lingwu = 0
    local l_skill
    if perform.skill then
        l_skill = skillEnable[perform.skill]
    end

    job_exp_tongji()

    for p in pairs(skillEnable) do
        if skills[p] then
            q = skillEnable[p]
            -- ain ��ǰ����
            if
                q and skills[q] and q ~= "force" and
                (skills[q].lvl > 219 or(score.party == "��ͨ����" and skills[q].lvl > 100)) and
                skills[q].lvl < hp.pot_max - 100 and
                skills[q].lvl <= skills[p].lvl and
                hp.pot >= l_pot
            then
                flag.lingwu = 1
            end
        end
    end
    if
        GetVariable("lingwuskill") or
        (tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]])
    then
        flag.lingwu = 0

        if tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]] then
            local p = tmp.xskill
            local q = skillEnable[p]
            if skills[q].lvl < hp.pot_max - 100 and skills[q].lvl <= skills[p].lvl and skills[q].lvl < hp.pot_max - 100 then
                flag.lingwu = 1
            end
        end
        if GetVariable("lingwuskill") then
            local q = GetVariable("lingwuskill")
            for p in pairs(skills) do
                if
                    skillEnable[p] == q and skills[q].lvl < hp.pot_max - 100 and skills[q].lvl <= skills[p].lvl and
                    skills[q].lvl < hp.pot_max - 100
                then
                    flag.lingwu = 1
                end
            end
        end
    end
    if score.party == "��ͨ����" and hp.pot >= l_pot and score.gold and skills["literate"] and score.gold > 3000 and
        skills["literate"].lvl < hp.pot_max - 100 then
        return literate()
    end
    if
        score.party == "��ͨ����" and hp.pot >= l_pot and skills["parry"].lvl < hp.pot_max - 100 and
        skills["parry"].lvl >= 101
    then
        flag.lingwu = 1
    end
    if score.party == "��ͨ����" and flag.lingwu == 1 then
        return checklingwu()
    end

    if score.party == "��ͨ����" and skills["force"].lvl > 50 then
        if skills["force"].lvl < 101 then
            return huxi()
        end
        if score.party == "��ͨ����" and skills["force"].lvl == 101 then
            exe("fangqi force 1;y;y;y")
            return huxi()
        end
        if score.party == "��ͨ����" and skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl < 200 then
            return learnSzj()
        end
    end

    if score.party ~= "��ͨ����" and hp.pot >= l_pot and flag.autoxuexi and flag.autoxuexi == 1 then
        if score.gold and skills["literate"] and score.gold > 3000 and skills["literate"].lvl < hp.pot_max - 100 then
            return literate()
        end

        if score.party ~= "��ͨ����" then
            for p in pairs(skills) do
                local q = qrySkillEnable(p)
                if q and q["force"] and perform.force and p == perform.force and skills[p].lvl < 100 and hp.pot >= l_pot then
                    if skills[p].mstlvl and skills[p].mstlvl <= skills[p].lvl then
                    else
                        return checkxue()
                    end
                end
            end

            for p in pairs(skills) do
                if
                    flagFull[p] and not skillEnable[p] and skills[p].lvl < 450 and skills[p].lvl <= skills["dodge"].lvl and
                    hp.pot >= l_pot
                then
                    if not skills[p].mstlvl or skills[p].mstlvl > skills[p].lvl then
                        return checkxue()
                    end
                end
            end

            if
                score.party ~= "��ͨ����" and perform.skill and skills[perform.skill] and skills[perform.skill].lvl < 450 and
                hp.pot >= l_pot
            then
                return checkxue()
            end

            if flag.type and flag.type ~= "lingwu" and flag.xuexi == 1 and hp.pot >= l_pot then
                return checkxue()
            end
        end
        if hp.pot >= l_pot and skills["parry"] and skills["parry"].lvl < hp.pot_max - 100 and skills["parry"].lvl >= 450 then
            flag.lingwu = 1
        end
        if flag.lingwu == 1 then
            return checklingwu()
        end

        if flag.xuexi == 1 and score.party ~= "��ͨ����" then
            return checkxue()
        end

        if hp.pot >= l_pot then
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
    return check_job()
end

function checkHammer()
    return go(checkHmGive, "���ݳ�", "������")
end
function checkHmGive()
    if Bag["Τ��֮��"] then
        exe("give " .. Bag["Τ��֮��"].fullid .. " to zhujian shi")
    end
    Bag["Τ��֮��"] = nil
    return checkPrepare()
end

function check_gold()
    tmp.cnt = 0
    return go(check_gold_dali, "�����", "����Ǯׯ")
end
function check_gold_dali()
    if not locl.id["���ƹ�"] then
        return go(check_gold_xy, "������", "����ի")
    else
        return check_gold_count()
    end
end
function check_gold_xy()
    if not locl.id["Ǯ����"] then
        return go(check_gold_cd, "�ɶ���", "ī��ի")
    else
        return check_gold_count()
    end
end
-- function check_gold_cd()
--    if not locl.id["���ƹ�"] then
--      return go(check_gold_yz,"���ݳ�","���ի")
--   else
--      return check_gold_count()
--   end
-- end
-- ain
function check_gold_cd()
    if not locl.id["Ǯ��"] then
        return go(check_gold_dali, "�����", "����Ǯׯ")
    else
        return check_gold_count()
    end
end
function check_gold_count()
    if Bag["ҼǪ����Ʊ"] and Bag["ҼǪ����Ʊ"].cnt > 10 then
        exe("score;chazhang")
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) > 50 then
            return check_cash_cun()
        end
    end
    if Bag and Bag["����"] and Bag["����"].cnt and Bag["����"].cnt > 500 then
        return check_silver_qu()
    end
    if
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt < count.gold_max and score.gold > count.gold_max) or
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt > count.gold_max * 4)
    then
        return check_gold_qu()
    end

    return check_gold_over()
end
function check_cash_cun()
    if Bag["ҼǪ����Ʊ"] then
        local l_cnt
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) < Bag["ҼǪ����Ʊ"].cnt * 10 then
            l_cnt = math.modf((score.goldlmt - score.gold) / 10) -1
        else
            l_cnt = Bag["ҼǪ����Ʊ"].cnt
        end
        if l_cnt > 0 then
            exe("cun " .. l_cnt .. " cash")
        end
    end
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_silver_qu()
    local l_cnt = Bag["����"].cnt - 100
    exe("cun " .. l_cnt .. " silver")
    exe("qu 50 silver")
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_gold_qu()
    local l_cnt = Bag["�ƽ�"].cnt - count.gold_max * 2
    exe("cun " .. l_cnt .. " gold")
    if Bag["�ƽ�"].cnt < count.gold_max then
        exe("qu " .. count.gold_max .. " gold")
    end
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_gold_check()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return check_heal()
    end
    return check_gold_count()
end
function check_gold_over()
    return checkPrepare()
end

function checkZqd()
    tmp.cnt = 0
    return go(checkZqdBuy, randomElement(drugBuy["������"]))
end
function checkZqdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkZqdOver()
    else
        exe("buy zhengqi dan")
        checkBags()
        return check_bei(checkZqdi)
    end
end
function checkZqdi()
    if Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 and(not Bag["������"] or Bag["������"].cnt < 4) then
        return checkWait(checkZqdBuy, 1)
    else
        return checkZqdOver()
    end
end
function checkZqdOver()
    checkBags()
    return check_bei(checkPrepare, 1)
end

function checkXqw()
    tmp.cnt = 0
    return go(checkXqwBuy, randomElement(drugBuy["а����"]))
end
function checkXqwBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkXqwOver()
    else
        exe("buy xieqi wan")
        checkBags()
        return check_bei(checkXqwi)
    end
end
function checkXqwi()
    if Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 and(not Bag["а����"] or Bag["а����"].cnt < 4) then
        return checkWait(checkXqwBuy, 1)
    else
        return checkXqwOver()
    end
end
function checkXqwOver()
    checkBags()
    return check_bei(checkPrepare, 1)
end

function checkNxw()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and(nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) then
        return go(checkNxwBuy, randomElement(drugBuy["��Ϣ��"]))
    else
        return checkNxwOver()
    end
end
function checkNxwBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        if hqd_cur < count.hqd_max then
            -- ��������3������ҩ�ˣ�����Ĵ���ֱ��ǻ��ε������������Ϣ�裬ע�⣺���ε�+70%��������+50%����Ϣ���ǹ̶�+3000������
            exe('buy ' .. drug.neili3)
        end
        if cbw_cur < count.cbw_max then
            exe('buy ' .. drug.neili2)
        end
        if nxw_cur < count.nxw_max then
            exe('buy ' .. drug.neili1)
        end
        checkYaoBags()
        return check_bei(checkNxwi)
    end
end
function checkNxwi()
    if (nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkNxwBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkNxwOver()
    return check_bei(checkPrepare, 1)
end

function checkHxd()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and cty_cur < count.cty_max then
        return go(checkHxdBuy, randomElement(drugBuy["���ɽ�ҩ"]))
    else
        return checkNxwOver()
    end
end
function checkHxdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        exe("buy " .. drug.heal)
        checkYaoBags()
        return check_bei(checkHxdBag)
    end
end
function checkHxdBag()
    if cty_cur < count.cty_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkHxdBuy, 1)
    else
        return checkNxwOver()
    end
end

function checkLjd()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and hxd_cur < count.hxd_max then
        return go(checkLjdBuy, randomElement(drugBuy["��Ѫ�ƾ���"]))
    else
        return checkNxwOver()
    end
end
function checkLjdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        exe("buy " .. drug.jingxue)
        checkYaoBags()
        return check_bei(checkLjdBag)
    end
end
function checkLjdBag()
    if hxd_cur < count.hxd_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkLjdBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkdhd()
    tmp.cnt = 0
    if score.tb and score.tb > 100 and dhd_cur < count.dhd_max then
        return go(checkdhdBuy, randomElement(drugBuy["�󻹵�"]))
    else
        return checkNxwOver()
    end
end
function checkdhdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        exe("duihuan dahuan dan;score")
        checkYaoBags()
        return check_halt(checkdhdBag)
    end
end
function checkdhdBag()
    if dhd_cur < count.dhd_max and score.tb and score.tb > 100 then
        return checkWait(checkdhdBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkFire()
    if not Bag["����"] then
        return go(checkFireBuy, randomElement(drugBuy["����"]))
    else
        return checkFireOver()
    end
end
function checkFireBuy()
    exe("buy fire")
    checkBags()
    return checkFireOver()
end
function checkFireOver()
    exe("drop fire 2")
    return check_busy(checkPrepare, 1)
end

function checkYu(p_yu)
    tmp.yu = p_yu
    return go(checkYuCun, "���ݳ�", "�ӻ���")
end
function checkYuCun()
    exe("cun " .. Bag[tmp.yu].fullid)
    return check_bei(checkYuOver)
end
function checkYuOver()
    exe("cun yu;drop yu")
    checkBags()
    return check_busy(checkPrepare, 1)
end

function checkSell(p_sell)
    tmp.sell = p_sell
    return go(checkSellDo, "���ݳ�", "����")
end
function checkSellDo()
    if Bag[tmp.sell] then
        exe("sell " .. Bag[tmp.sell].fullid)
    end
    return check_bei(checkSellOver)
end
function checkSellOver()
    if Bag[tmp.sell] then
        exe("sell " .. Bag[tmp.sell].fullid)
        exe("drop " .. Bag[tmp.sell].fullid)
    end
    checkBags()
    return check_busy(checkPrepare, 1)
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
    "��Ҫѧϰ��SKILLS(��ʽ��force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)��?",
    "xuexiskill",
    GetVariable("xuexiskill"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("xuexiskill", l_result)
        Note("ѧϰ�趨���")
        print(GetVariable("xuexiskill"))
    end
    l_result =
    utils.inputbox(
    "��Ҫ�����SKILLS(��ʽ��force|dodge|sword|blade|parry)��?",
    "lingwuskills",
    GetVariable("lingwuskills"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("lingwuskills", l_result)
        Note("�����趨���")
        print(GetVariable("lingwuskills"))
    end
    l_result = utils.inputbox("��ѧϰ����ʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
    end
    l_result = utils.inputbox("���Ӣ��ID��?", "ID", GetVariable("id"), "����", "12")
    if l_result ~= nil then
        SetVariable("id", l_result)
    else
        DeleteVariable("id")
    end
    l_result = utils.inputbox("���������?", "Passwd", GetVariable("passwd"), "����", "12")
    if l_result ~= nil then
        SetVariable("passwd", l_result)
    else
        DeleteVariable("passwd")
    end

    l_result = utils.msgbox("�Ƿ�򿪼�¼����?", "FlagLog", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        flag.log = "yes"
    else
        flag.log = "no"
    end
    SetVariable("flaglog", flag.log)

    l_result = utils.msgbox("�Ƿ��Զ�ѧϰ������", "XuexiLingwu", "yesno", "?", 1)
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

    ColourNote("red", "blue", "��ʹ��start�������������ˣ�stop����ֹͣ�����ˣ�iset���û����ˣ�")
end

function masterSet()
    local l_result, l_tmp, t
    if score.party ~= "��ͨ����" then
        l_result = utils.inputbox("���ʦ���ļ��ID��?", "MasterId", GetVariable("masterid"), "����", "12")
        if not isNil(l_result) then
            SetVariable("masterid", l_result)
            master.id = l_result
        end
        if not score.master or not masterRoom[score.master] then
            l_result = utils.inputbox("���ʦ���ľ�ס����?", "MasterRoom", GetVariable("masterroom"), "����", "12")
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
        l_result = utils.listbox("��ʹ�õ������ڹ���", "�����ڹ�", t, GetVariable("performforce"))
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
        l_result = utils.listbox("��׼��ս��ʹ�õĹ�����?", "performSkill", t, GetVariable("performskill"))
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
    "ս��Ĭ��׼��PFM(��ʽ��bei none;bei claw;jifa parry jiuyin-baiguzhua;perform sanjue)��?",
    "PerformPre",
    GetVariable("performpre"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("performpre", l_result)
        perform.pre = l_result
        l_pfm = perform.pre
        create_alias("pfmset", "pfmset", "alias pfmpfm " .. l_pfm)
        Note("Ĭ��PFM")
        exe("pfmset")
    end
    l_result = utils.inputbox("��Ŀ���PFM(��ʹ��������PFM)��?", "pfmks", GetVariable("pfmks"), "����", "12")
    if not isNil(l_result) then
        SetVariable("pfmks", l_result)
        l_pfm = l_result
        create_alias("pfmks", "pfmks", "alias pfmpfm " .. l_pfm)
        Note("����PFM")
        exe("pfmks")
    end
    l_result =
    utils.inputbox("����Ľ�ݽ����õ�PFM(ʹ�ò��ý����Կ���Ľ�ݵ�skills,Ľ�ݽ���������Ϊ����)��?", "pfmmrjf", GetVariable("pfmmrjf"), "����", "12")
    if not isNil(l_result) then
        SetVariable("pfmmrjf", l_result)
        l_pfm = l_result
        create_alias("pfmmrjf", "pfmmrjf", "alias pfmpfm " .. l_pfm)
        Note("���ý���PFM")
        exe("pfmmrjf")
    end
    l_result =
    utils.inputbox("��������ʥ���PFM(ʹ���������������̵�skills��ʥ���������Ϊ����)��?", "pfmshlf", GetVariable("pfmshlf"), "����", "12")
    if not isNil(l_result) then
        SetVariable("pfmshlf", l_result)
        l_pfm = l_result
        create_alias("pfmshlf", "pfmshlf", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmshlf")
    end
    l_result = utils.inputbox("��д���������PFM(ʹ�������Ե�skills�����������Ĺ���Ϊ��)��?", "pfmwu", GetVariable("pfmwu"), "����", "12")
    if not isNil(l_result) then
        SetVariable("pfmwu", l_result)
        l_pfm = l_result
        create_alias("pfmwu", "pfmwu", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmwu")
    end
    l_result = utils.inputbox("��д��Ŀ�����PFM(�Ը������Ե�pfm���������������书�������Լ�������书)��?", "pkong", GetVariable("pkong"), "����", "12")
    if not isNil(l_result) then
        SetVariable("pkong", l_result)
        l_pfm = l_result
        create_alias("pkong", "pkong", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pkong")
    end
    l_result =
    utils.inputbox(
    "��д�������������PFM(�Ը������书��ż���޷�ʶ����书��ʹ�úĺ�������pfm)��?",
    "pfmsanqing",
    GetVariable("pfmsanqing"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pfmsanqing", l_result)
        l_pfm = l_result
        create_alias("pfmsanqing", "pfmsanqing", "alias pfmpfm " .. l_pfm)
        Note("�ռ�����")
        exe("pfmsanqing")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ա����Կ�����ֵΪ����130 �տ�120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pzhen",
    GetVariable("pzhen"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pzhen", l_result)
        perform.zhen = l_result
        l_pfm = perform.zhen
        create_alias("pfmzhen", "pfmzhen", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmzhen")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ������Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pqi",
    GetVariable("pqi"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pqi", l_result)
        perform.qi = l_result
        l_pfm = perform.qi
        create_alias("pfmqi", "pfmqi", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmqi")
    end
    l_result =
    utils.inputbox(
    "��д��ĸ�����PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���������Կ�����ֵΪ����130 ����120 ��110 ������100���޸����Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pgang",
    GetVariable("pgang"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pgang", l_result)
        perform.gang = l_result
        l_pfm = perform.gang
        create_alias("pfmgang", "pfmgang", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmgang")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���졣���Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "prou",
    GetVariable("prou"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("prou", l_result)
        perform.rou = l_result
        l_pfm = perform.rou
        create_alias("pfmrou", "pfmrou", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmrou")
    end
    l_result =
    utils.inputbox(
    "��д��Ŀ�����PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ա����Կ�����ֵΪ����130 ���120 ��110 �޸���100���޿����Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pkuai",
    GetVariable("pkuai"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pkuai", l_result)
        perform.kuai = l_result
        l_pfm = perform.kuai
        create_alias("pfmkuai", "pfmkuai", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmkuai")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ᡣ���Կ�����ֵΪ����130 �տ�120 ��110 �޸���100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pman",
    GetVariable("pman"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pman", l_result)
        perform.man = l_result
        l_pfm = perform.man
        create_alias("pfmman", "pfmman", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmman")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���������Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pmiao",
    GetVariable("pmiao"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pmiao", l_result)
        perform.miao = l_result
        l_pfm = perform.miao
        create_alias("pfmmiao", "pfmmiao", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmmiao")
    end
    l_result =
    utils.inputbox(
    "��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���档���Կ�����ֵΪ����130 ����120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��",
    "pxian",
    GetVariable("pxian"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pxian", l_result)
        perform.xian = l_result
        l_pfm = perform.xian
        create_alias("pfmxian", "pfmxian", "alias pfmpfm " .. l_pfm)
        Note("������PFM")
        exe("pfmxian")
    end
    l_result =
    utils.inputbox(
    "��FPK��PFM(��verify ���鿴���pfm����������д��ʽ��verify yunu-jianfa)��?",
    "pkpfm",
    GetVariable("pkpfm"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("pkpfm", l_result)
    end
    l_result = utils.inputbox("��������alias��? ����������none", "sx1lian", GetVariable("sx1lian"), "����", "12")
    if not isNil(l_result) then
        SetVariable("sx1lian", l_result)
        l_pfm = l_result
        create_alias("sx1lian", "sx1lian", "alias sxlian " .. l_pfm)
        Note("������alias")
        exe("sx1lian")
    end
    Note("ʹ��Ĭ��PFM")
    exe("pfmset")
end

function myUweapon()
    l_result = utils.inputbox("����ҪGET�ĵ�һ������ID��?", "myweapon", GetVariable("myweapon"), "����", "12")
    if not isNil(l_result) then
        SetVariable("myweapon", l_result)
    end
    l_result = utils.inputbox("����ҪGET�ĵڶ�������ID��?", "muweapon", GetVariable("muweapon"), "����", "12")
    if not isNil(l_result) then
        SetVariable("muweapon", l_result)
    end
end

function jobSet()
    local l_result, l_tmp, t

    t = {
        ["wudang"] = "�䵱��Զ��",
        ["huashan"] = "��ɽ����Ⱥ",
        ["gaibang"] = "ؤ���ⳤ��",
        ["songmoya"] = "��Ħ�¿�������",
        ["zhuoshe"] = "ؤ��׽��",
        ["songxin"] = "��������",
        ["songxin2"] = "��������2",
        ["xueshan"] = "ѩɽ����Ů",
        ["sldsm"] = "������ʦ��",
        ["songshan"] = "��ɽ������",
        --   ["hubiao"]  ="���ݻ���",
        ["tmonk"] = "���ֽ̺���",
        ["clb"] = "���ְ�����1",
        ["husong"] = "���ֻ���",
        ["hqgzc"] = "���߹�����"
    }

    t = { }

    for p, q in pairs(job.list) do
        t[p] = q
    end

    if score.party ~= "ؤ��" then
        t["zhuoshe"] = nil
    end
    if score.party ~= "������" then
        t["sldsm"] = nil
    end
    if score.party ~= "������" or hp.exp > 2000000 or hp.exp < 300000 then
        t["tmonk"] = nil
    end
    if score.party ~= "������" or hp.exp < 2000000 then
        t["husong"] = nil
    end
    if hp.exp < 5000000 then
        t["songmoya"] = nil
    end
    if hp.shen < 0 then
        t["gaibang"] = nil
    end
    if hp.shen < 0 and score.party == "��ɽ��" then
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
    l_tmp = utils.multilistbox("����������(�밴CTRL��ѡ)��?", "�������", t, tmp.zuhe)
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
        l_result = utils.listbox("���һ����ȥ������", "��������", t, GetVariable("jobfirst"))
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
        l_result = utils.listbox("��ڶ�����ȥ������", "��������", t, GetVariable("jobsecond"))
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
        l_result = utils.listbox("�������ȥ������", "��������", t, GetVariable("jobthird"))
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
        l_result = utils.inputbox("����һƷ������ɱ���ڼ���?(Ĭ��Ϊ7��)ʹ��Ĭ��������հײ�Ҫ��д��", "ypttab", GetVariable("ypttab"), "����", "12")
        if not isNil(l_result) then
            SetVariable("ypttab", l_result)
            smyteam = tonumber(l_result)
        else
            smyteam = 16
        end
        l_result = utils.inputbox("����һƷ�������������β�����SMY!(Ĭ��Ϊ2��)ʹ��Ĭ��������հײ�Ҫ��д��", "yptdie", GetVariable("yptdie"), "����", "12")
        if not isNil(l_result) then
            SetVariable("yptdie", l_result)
            smyall = tonumber(l_result)
        else
            smyall = 2
        end
        l_result = utils.msgbox("����һƷ�������Ƿ���˫ɱ!(Ĭ��Ϊno������)��", "˫ɱ", "yesno", "?", 1)
        if l_result and l_result == "yes" then
            double_kill = yes
        else
            double_kill = no
        end
        l_result =
        utils.inputbox("����һƷ������ǰ��BUFF!(Perform and Yun��û������дnone)��", "pfbuff", GetVariable("pfbuff"), "����", "12")
        if not isNil(l_result) then
            SetVariable("pfbuff", l_result)
            perform.buff = l_result
            l_pfm = perform.buff
            create_alias("pbuff", "pbuff", "alias pfmbuff " .. l_pfm)
            exe("pbuff")
        end
    end

    if job.zuhe["tdh"] then
        l_result = utils.inputbox("��ػ������м��Ƿ������(1Ϊ���� 0Ϊ������)", "tdhdazuo", GetVariable("tdhdazuo"), "����", "12")
        if not isNil(l_result) then
            SetVariable("tdhdazuo", l_result)
            tdhdz = l_result
        else
            tdhdz = 1
        end
    end

    if job.zuhe["hqgzc"] then
        l_result = utils.inputbox("��Pot����Gold��(1ΪPot 0ΪGold)", "hqgzcjiangli", GetVariable("hqgzcjiangli"), "����", "12")
        if not isNil(l_result) then
            SetVariable("hqgzcjiangli", l_result)
            hqgzcjl = l_result
        else
            hqgzcjl = 1
        end
    end

    if job.zuhe["hubiao"] or job.zuhe["haizhan"] then
        if GetVariable("teamname") then
            l_result = utils.inputbox("����ӻ��ڵĶ���(��������)��?", "TeamName", GetVariable("teamname"), "����", "12")
        else
            l_result = utils.inputbox("����ӻ��ڵĶ���(��������)��?", "TeamName", job.teamname, "����", "12")
        end
        if not isNil(l_result) then
            SetVariable("teamname", l_result)
            job.teamname = l_result
        else
            DeleteVariable("teamname")
            job.teamname = nil
        end
        if GetVariable("teamlead") then
            l_result = utils.inputbox("����ӻ��ڵĶӳ�(��������)��?", "TeamLead", GetVariable("teamlead"), "����", "12")
        else
            l_result = utils.inputbox("����ӻ��ڵĶӳ�(��������)��?", "TeamLead", job.teamlead, "����", "12")
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
        ["��Ϣ��"] = "��Ϣ��",
        ["������Ϣ��"] = "������Ϣ��",
        ["������Ϣ��"] = "������Ϣ��",
        ["���ɽ�ҩ"] = "���ɽ�ҩ",
        ["��Ѫ�ƾ���"] = "��Ѫ�ƾ���",
        ["�󻹵�"] = "�󻹵�",
        ["����"] = "����",
        ["ţƤ�ƴ�"] = "ţƤ�ƴ�",
    }
    if GetVariable("drugprepare") then
        tmp.drug = utils.split(GetVariable("drugprepare"), "|")
        tmp.pre = { }
        for _, p in pairs(tmp.drug) do
            tmp.pre[p] = true
        end
    end
    local l_tmp = utils.multilistbox("������ǰ׼������Ʒ(�밴CTRL��ѡ)��?", "��Ʒ���", t, tmp.pre)
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
    l_result = utils.msgbox("Ľ�ݶ�ת����ѧϰ����(Ĭ��Ϊ��Yes)��", "dzxy", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("��Ҫѧϰ��ת����")
        need_dzxy = "yes"
    else
        need_dzxy = "no"
        print("�Ҳ�Ҫѧϰ��ת����")
    end
end
function inWdj()
    l_result = utils.msgbox("��Ҫ���置�嶾����", "inwdj", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("��Ҫ���置�嶾��")
        inwdj = 1
    else
        inwdj = 0
        print("�Ҳ����置�嶾��")
    end
end
function setLearn()
    l_result =
    utils.inputbox(
    "��Ҫѧϰ��SKILLS(��ʽ��force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)��?",
    "xuexiskill",
    GetVariable("xuexiskill"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("xuexiskill", l_result)
        Note("ѧϰ�趨���")
        print(GetVariable("xuexiskill"))
    end
    l_result = utils.inputbox("��ѧϰʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
        print(GetVariable("learnweapon"))
    end
end
function setLingwu()
    l_result =
    utils.inputbox(
    "��Ҫ�����SKILLS(��ʽ��force|dodge|sword|blade|parry)��?",
    "lingwuskills",
    GetVariable("lingwuskills"),
    "����",
    "12"
    )
    if not isNil(l_result) then
        SetVariable("lingwuskills", l_result)
        Note("�����趨���")
        print(GetVariable("lingwuskills"))
    end
    l_result = utils.inputbox("������ʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����", "12")
    if not isNil(l_result) then
        SetVariable("learnweapon", l_result)
        print(GetVariable("learnweapon"))
    end
end
function setLian()
    l_result = utils.inputbox("��������alias��? ����������none", "sx1lian", GetVariable("sx1lian"), "����", "12")
    if not isNil(l_result) then
        SetVariable("sx1lian", l_result)
        l_pfm = l_result
        create_alias("sx1lian", "sx1lian", "alias sxlian " .. l_pfm)
        Note("������alias")
        exe("sx1lian")
    end
end
function setxcexp()
    l_result = utils.msgbox("Ѳ�ǵ�2M", "xcexp", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("Ѳ�ǵ�2M")
        xcexp = 1
    else
        print("Ѳ�ǵ�1M")
        xcexp = 0
    end
end
function xuepot()
    l_result = utils.msgbox("�Ƿ�ѧϰ", "xuexi", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("ѧϰ����")
        needxuexi = 1
    else
        needxuexi = 0
        print("ѧϰ�ر�")
    end
end
function dolostletter()
    l_result = utils.inputbox("�����뵱ǰʧ����ſɽ���������? Ĭ��Ϊ10�⣡", "mylostletter", GetVariable("mylostletter"), "����", "12")
    if not isNil(l_result) then
        SetVariable("mylostletter", l_result)
        lostno = l_result
    end
    l_result = utils.msgbox("�Ƿ���LL", "ʧ�����", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("������LL")
        needdolost = 1
        switch_name4 = "ʧ����ż�--��"
    else
        needdolost = 0
        switch_name4 = "ʧ����ż�--��"
        print("�ر���LL")
    end
    l_result = utils.msgbox("��LL�Ƿ��Զ���Vpearl", "�Զ���Vpearl", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("�����Զ��һ�Vpearl")
        needvpearl = 1
    else
        print("�ر��Զ��һ�Vpearl")
        needvpearl = 0
    end
end
function dolostAg()
    l_result = utils.msgbox("��Ҫ����ʧ�������YES����10�⣬NO���˲�����", "����", "yesno", "?", 1)
    if l_result and l_result == "yes" then
        print("����ʧ�����10�Σ�")
        lostno = lostno + 10
        dis_all()
        return go(dhlost, "���ݳ�", "����")
    else
        needdolost = 0
        print("�ر���LL")
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
    ----------2018-08-30����
end

function recordtime()
    messageShowT("������: " .. os.date("%Y-%m-%d %H:%M:%S", os.time()))
end

function recordtime_leave()
    messageShowT("�����밶: " .. os.date("%Y-%m-%d %H:%M:%S", os.time()))
end
