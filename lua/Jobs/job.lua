job = {}
job.statistics = {
    IdleTime = 0,
    PreviousExp = 0,
    StartTime = os.time()
}
fight = {}
gdcname = "不知道"
guard_id = 0
job.time = {}
job.time.b = os.time()
job.time.e = os.time()
job.time.over = os.time()
job.time["refresh"] = 94
fight.time = {}
fight.time.b = os.time()
fight.time.e = os.time()
fight.time.over = os.time()
fight.time["refresh"] = 94
job.name = nil
job.prepare = test
job.target = "任务目标"
job.exp = 0
job.pot = 0
sx1wait = 0
job.guard = {}
job.party = "未检测"
job.zuhe = {}
job.killer = {}
job.list = {}
job.group = {}
job.group.times = nil
sxjob = {}
sxjob.ide =
    "令狐冲|黄令天|凌震天|中年乞丐|青年乞丐|灰衣帮众|五毒教弟子|慧真尊者|知客道长|巨木旗教众|锐金旗教众|洪水旗教众|厚土旗教众|烈火旗教众|出尘子|李捕头|值勤兵|樊一翁|张巡捕|护法使者|夏雪宜|蒙面人|黑衣帮众|土匪|马贼|大衙役"
sxjob.cancel = ""
sxjob.skillslist = ""
sxjob.killer1 = "杀手一"
sxjob.killer1 = "杀手二"
sxjob.skills = "XXXXX"
sxjob.sx2 = 0
gaibangCancel =
    "黄蓉|杨逍|钟万仇|任盈盈|薛慕华|凌震天|黄天令|张浩天|洪啸天|丁勉|静风师太|陆大有|高升泰|西华子|张浩天|洪啸天|看守|尼摩星|看窑弟子|赵敏|出尘子|吕文德|侯君集|忽必烈|摘星子|飘然子|黯然子|狮吼子|阿紫|马掌柜|飞天子"
sldsmCancel =
    "黄蓉|杨逍|钟万仇|任盈盈|薛慕华|凌震天|黄天令|张浩天|洪啸天|丁勉|静风师太|陆大有|高升泰|马光佐|张浩天|洪啸天|西华子|执勤兵|玉玑子|玉磬子|玉音子|梁子翁|吕文德|达尔巴|看守|尼摩星|看窑弟子|赵敏|出尘子|侯君集|忽必烈|摘星子|飘然子|黯然子|狮吼子|阿紫|马掌柜|飞天子"
wudangcancel = ""
sx2joblevel = "微不足道|马马虎虎|小有所成|融会贯通|颇为了得|极其厉害"
jiangnan_area = "佛山镇|福州城|杭州城|嘉兴城|梅庄|姑苏慕容|燕子坞|曼佗罗山庄|宁波城|莆田少林|苏州城|牛家村|归云庄"
zhongyuan_area =
    "苗疆|长乐帮|成都城|扬州城|大理城|无量山|大理皇宫|大理王府|终南山|玉虚观|峨嵋山|襄阳郊外|黄河流域|萧府|华山|南阳城|嵩山|嵩山少林|大理城西|大理城南|大理城东|泰山|铁掌山|天龙寺|华山村|武当山|襄阳城|柳宗镇|大雪山|中原|成都郊外|大理城北|长安城"
cjn_area = "长江南岸|江南官道"
job.level = "XXXXX"
wudangjobok = 0
mytime = 0
allzhen = 0
allmiao = 0
allrou = 0
allxian = 0
allkuai = 0
allman = 0
allgang = 0
allqi = 0
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
sxkiller1 = 0
sxkiller2 = 0
wudangCk = 0
backtdh = 0
tdhround = 1
roundtdh = 1
yptteam = 0
smydie = 0
nobusy = 0
hqpd = 0
damage = 0
loseTj = {}
loseTj.succ = 0
loseTj.fail = 0
wait_times = 1
tdh_npc1_to_npc2_all_path = ""
tdh_npc1_room_id = ""
wait_kill = "no"
setpo = "set po 气"
yptjob = {}
yptjob.fengzhao = false
yptjob.name1 = ""
yptjob.name2 = ""
if DGJJ_setpo ~= nill then
    yptsetpo = DGJJ_setpo
end

WdjIgnores = {
    ["苗疆蛇房"] = true,
    ["苗疆卧室"] = true,
    ["苗疆厨房"] = true,
    ["苗疆前厅"] = true,
    ["苗疆明月厅"] = true,
    ["苗疆兵器房"] = true,
    ["苗疆大门"] = true,
    ["苗疆山坡"] = true,
    ["苗疆山洞"] = true
}
AddrIgnores = {
    ["燕子坞"] = true,
    ["姑苏慕容"] = true,
    ["桃花岛"] = true,
    ["神龙岛"] = true,
    ["曼佗罗山庄"] = true,
    ["黑木崖"] = true
}
Yiliaddr = {
    ["伊犁城客栈"] = true,
    ["伊犁城客栈二楼"] = true,
    ["伊犁城铁铺"] = true,
    ["伊犁城商铺"] = true,
    ["伊犁城城中心"] = true,
    ["伊犁城巴依家院"] = true
}

tongji = {}

skillIgnores = {}

skillsjineng1 = {
    ["金翅天王爪"] = true,
    ["截手九式"] = true,
    ["银索金铃"] = true,
    ["龙爪功"] = true,
    ["腾龙匕法"] = true,
    ["弹指神通"] = true,
    ["裂天斧"] = true,
    ["虎爪绝户手"] = true,
    ["抽髓掌"] = true,
    ["九阴白骨爪"] = true
}

skillsjineng2 = {
    ["血刀经"] = true,
    ["参合指"] = true,
    ["美女拳法"] = true,
    ["独孤九剑"] = true,
    ["韦陀杵"] = true,
    ["拈花指"] = true,
    ["灵蛇鞭法"] = true,
    ["玉箫剑法"] = true,
    ["五罗轻烟掌"] = true,
    ["铁掌掌法"] = true,
    ["玄虚刀法"] = true,
    ["天山杖法"] = true,
    ["苗家剑法"] = true,
    ["四象六合刀"] = true
}

skillsjineng3 = {
    ["黯然销魂掌"] = true,
    ["混元掌"] = true,
    ["昆仑叠掌"] = true,
    ["寒冰绵掌"] = true,
    ["少林醉棍"] = true,
    ["般若掌"] = true,
    ["银钩笔法"] = true,
    ["太极剑法"] = true,
    ["三阴蜈蚣爪"] = true,
    ["莲花掌"] = true,
    ["嵩阳鞭"] = true,
    ["九阴银龙鞭"] = true,
    ["昆仑掌法"] = true
}

skillsjineng4 = {
    ["四象掌"] = true,
    ["迅雷十六剑"] = true,
    ["烈焰刀"] = true,
    ["如影随形腿"] = true,
    ["旋风扫叶腿"] = true,
    ["段家剑法"] = true,
    ["柳叶刀法"] = true,
    ["天山追魂钩"] = true,
    ["嵩山剑法"] = true
}

skillsjineng5 = {
    -- ["玄铁剑法"] = true,
    ["劈石破玉拳"] = true,
    ["大金刚拳"] = true,
    ["燃木刀法"] = true,
    ["盘根错结斧"] = true,
    ["降龙十八掌"] = true
}

skillsjineng6 = {
    ["回风拂柳剑"] = true,
    ["玉女素心剑"] = true,
    ["散花掌"] = true,
    ["化骨绵掌"] = true,
    ["兰花拂穴手"] = true,
    ["慈航鞭"] = true,
    ["太极拳"] = true
}

skillsjineng7 = {
    ["金刚降伏轮"] = true,
    ["雁行刀法"] = true,
    ["慕容刀法"] = true,
    ["全真剑法"] = true,
    ["华山剑法"] = true,
    ["穿云腿法"] = true,
    ["穿云腿"] = true,
    ["七伤拳"] = true,
    ["一指禅"] = true,
    ["一阳指"] = true,
    ["震山绵掌"] = true,
    ["寒冰神掌"] = true,
    ["五虎断门刀"] = true
}

skillsjineng8 = {
    ["密宗大手印"] = true,
    ["星移掌"] = true,
    ["反两仪刀"] = true,
    ["漫天花雨"] = true,
    ["日月鞭法"] = true,
    ["如来千叶手"] = true,
    ["落英神剑掌"] = true,
    ["大嵩阳手"] = true,
    ["千蛛万毒手"] = true,
    ["打狗棒法"] = true
}

skillsjineng9 = {
    ["慕容剑法"] = true
}

skillsjineng10 = {
    ["圣火令法"] = true
}

skillsjineng11 = {
    ["辟邪剑法"] = true,
    ["空明拳"] = true,
    ["玄铁剑法"] = true
}

dangerousNpc = {
    ["獒犬"] = true,
    ["藏獒"] = true,
    ["疯狗"] = true,
    ["头狼"] = true,
    ["野狼"] = true,
    ["毒蛇"] = true,
    ["马贼"] = true,
    ["老虎"] = true,
    ["玉峰"] = true,
    ["菜花蛇"] = true,
    ["竹叶青"] = true,
    ["梅超风"] = true,
    ["雪豹"] = true,
    ["野猪"] = true,
    ["怪蟒"] = true,
    ["巨蟒"] = true,
    ["毒蟒"] = true,
    ["恶犬"] = true,
    ["蜈蚣"] = true,
    ["折冲将军"] = true,
    ["平寇将军"] = true,
    ["征东将军"] = true,
    ["车骑将军"] = true,
    ["慧真尊者"] = true,
    ["出尘子"] = true,
    ["黑色毒蛇"] = true,
    ["厚土旗教众"] = true,
    ["巨木旗教众"] = true,
    ["锐金旗教众"] = true,
    ["烈火旗教众"] = true,
    ["洪水旗教众"] = true,
    ["黑衣帮众"] = true,
    ["灰衣帮众"] = true
}

prepare_trigger = function()
    DeleteTriggerGroup("prepare_neili")
    -- ain dls nv id dazuo
    create_trigger_t(
        "prepare_neili1",
        "^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",
        "",
        "prepare_neili_b"
    )
    create_trigger_t(
        "prepare_neili2",
        "^(> )*(你运起玄天无极神功，气聚丹田|你手捏剑诀，将寒冰真气|你盘膝而坐，运起八荒六合唯我独尊功|你运起纯阳神通功，片刻之间|你抉弃杂念盘膝坐定，手捏气诀|你盘膝坐下，默运天魔大法|你凝神静气，盘坐下来|你随意坐下，双手平放在双膝，默念口诀|你手捏绣花针，盘膝坐下，默运葵花神功|你坐下来运气用功，一股内息开始在体内流动|你慢慢盘膝而坐，双手摆于胸前|你五心向天，排除一切杂念，内息顺经脉缓缓流动|你盘膝坐下，双手合十置于头顶，潜运内力|你屏息静气，坐了下来，左手搭在右手之上|你盘膝坐下，垂目合什，默运枯荣禅功|你盘膝坐下，闭目合什，运起乾天一阳神功|你盘膝坐下，暗运内力，试图采取天地之精华|你轻轻的吸一口气，闭上眼睛，运起玉女心经|你盘腿坐下，双目微闭，双手掌心相向成虚握太极|你气运丹田，将体内毒素慢慢逼出，控制着它环绕你缓缓飘动|你盘膝而坐，双手垂于胸前成火焰状，深吸口气|你盘膝而坐，运使九阳，气向下沉|你随意坐下，双手平放在双膝，默念口诀|你随意一站，双手缓缓抬起，深吸一口气|你盘膝而坐，双目紧闭，深深吸一口气引入丹田|你席地而坐，五心向天，脸上红光时隐时现|你暗运临济十二庄，气聚丹田|你收敛心神闭目打坐，手搭气诀，调匀呼吸，感受天地之深邃，自然之精华，渐入无我境界)",
        "",
        "prepare_neili_t"
    )
    create_trigger_t("prepare_neili3", "^(> )*卧室不能(吐纳|打坐)，会影响别人休息。", "", "prepare_neili_w")
    create_trigger_t("prepare_neili4", "^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)", "", "prepare_neili_w")
    create_trigger_t("prepare_neili5", "^(> )*这里不准战斗，也不准(吐纳|打坐)。", "", "prepare_neili_w")
    create_trigger_t("prepare_neili6", "^(> )*这里可不是让你提高(内力|精力)的地方。", "", "prepare_neili_w")
    create_trigger_t("prepare_neili7", "^(> )*你吐纳完毕，睁开双眼，站了起来。", "", "prepare_neili_b")
    create_trigger_t("prepare_neili8", "^(> )*你闭上眼睛开始吐纳。", "", "prepare_neili_t")
    create_trigger_t("prepare_neili9", "^(> )*你现在手脚戴着镣铐，不能做出正确的姿势来打坐", "", "prepare_neili_liaokao")
    create_trigger_t("prepare_neili10", "^(> )*你身上没有包括任何特殊状态。", "", "prepare_neili_over")
    SetTriggerOption("prepare_neili1", "group", "prepare_neili")
    SetTriggerOption("prepare_neili2", "group", "prepare_neili")
    SetTriggerOption("prepare_neili3", "group", "prepare_neili")
    SetTriggerOption("prepare_neili4", "group", "prepare_neili")
    SetTriggerOption("prepare_neili5", "group", "prepare_neili")
    SetTriggerOption("prepare_neili6", "group", "prepare_neili")
    SetTriggerOption("prepare_neili7", "group", "prepare_neili")
    SetTriggerOption("prepare_neili8", "group", "prepare_neili")
    SetTriggerOption("prepare_neili9", "group", "prepare_neili")
    SetTriggerOption("prepare_neili0", "group", "prepare_neili")
    EnableTriggerGroup("prepare_neili", false)
end
fight_trigger = function()
    DeleteTriggerGroup("fight")
    create_trigger_t(
        "fight1",
        "^>*\\s*\\( (\\D*)(已经伤痕累累，正在勉力支撑着不倒下去|受了相当重的伤，只怕会有生命危险|已经一副头重脚轻的模样，正在勉力支撑着不倒下去|气息粗重，动作开始散乱，看来所受的伤着实不轻|已经一副头重脚轻的模样，正在勉力支撑着不倒下去|似乎十分疲惫，看来需要好好休息了|看起来已经力不从心了|气喘嘘嘘，看起来状况并不太好|动作似乎开始有点不太灵光，但是仍然有条不紊|看起来可能受了点轻伤|看起来可能有些累了|受了几处伤，不过似乎并不碍事|受伤不轻，看起来状况并不太好|似乎受了点轻伤，不过光从外表看不大出来|似乎有些疲惫，但是仍然十分有活力|已经陷入半昏迷状态，随时都可能摔倒晕去|受伤过重，已经奄奄一息，命在旦夕了|受伤过重，已经有如风中残烛，随时都可能断气)。 \\)",
        "",
        "fight_check"
    )
    create_trigger_t("fight16", "^一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……", "", "faint_check")
    --    create_triggerex_t101('fight17',"^(.*)你",'','fight_zhaoshi_check')
    create_trigger_t("fight18", "^(> )*你(必须使用剑|拿着武器怎么能|必须空手|手里没有|手里无|手上无|手中无剑|所使用的外功中没有这种功能)", "", "weapon_unwield")
    create_trigger_t("fight17", "^(> )*使用「冲拳」时必须空手！", "", "weapon_unwield")
    create_trigger_t("fight2", "^(> )*你「啪」的一声倒在地上，挣扎着抽动了几下就死了。$", "", "fightDie")
    create_trigger_t(
        "fight3",
        "^(> )*(\\D*)(只觉全身一麻|突然一颤，脸上瞬间冒出许多冷汗|目前正自顾不暇|左蹿右跳，始终逃不出棒影|长长地舒了一口气。|深深吸了几口气，脸色看起来好多了|的身子突然晃了两晃，牙关格格地响了起来)",
        "",
        "fightXiqi"
    )
    --    create_trigger_t('fight4',"^(> )*看起来(\\D*)想杀死你！$",'','fightConsider')
    create_trigger_t("fight5", "^(你)(的体力快消耗完了|现在太累了|现在真气太弱)", "", "fight_hp")
    create_trigger_t(
        "fight6",
        "^(> )*你(必须拿着|使用的兵刃不对|使用的兵刃不正确|使用的武器不对|所使用的外功中没有这种功能|不够狠毒|掏了掏背囊，发现里面的暗器已经不够)",
        "",
        "noweaponpfm"
    )
    create_trigger_t("fight7", "^(\\D*)眼花缭乱，被攻了个措手不及！", "", "performMie")
    create_trigger_t(
        "fight8",
        "^(> )*太极者，无极而生；动之则分，静之则合！你立如秤准，活如车轮，运起\\D*带动\\D*的(\\D*)一送，让他马步不稳，全力都打向空处",
        "",
        "fightLiuhe"
    )
    create_trigger_t("fight9", "^(> )*你(缓缓收回内力，眼中的红光|现在无法收功|好象虚脱了一样，突然垮了下来|心神一松，再也支持不)", "", "yunWudiDone")
    create_trigger_t("fight10", "^(> )*你(大声叫道：“洪教主神通广大，我教战无不胜|发疯般的叫道：“洪教主神通护佑)", "", "yunWudi")
    create_trigger_t("fight11", "^(> )*结果(\\D*)(气血一滞，已被定在当堂|顿时手忙脚乱，施展出浑身解数|顿时面色苍白，感觉浑身内息)", "", "fightXiqi")
    create_trigger_t(
        "fight12",
        "^(> )*你(的内力太少|现在内力太弱|现在真气|现在内力不|的内力不|内力现在不够|目前内力太少|的真气不足，无法|的真气不足以|发现自己现在真气太弱|真气太弱|的真气不够！)",
        "",
        "fightDrug"
    )
    SetTriggerOption("fight1", "group", "fight")
    SetTriggerOption("fight2", "group", "fight")
    SetTriggerOption("fight3", "group", "fight")
    SetTriggerOption("fight4", "group", "fight")
    SetTriggerOption("fight5", "group", "fight")
    SetTriggerOption("fight6", "group", "fight")
    SetTriggerOption("fight7", "group", "fight")
    SetTriggerOption("fight8", "group", "fight")
    SetTriggerOption("fight9", "group", "fight")
    SetTriggerOption("fight10", "group", "fight")
    SetTriggerOption("fight11", "group", "fight")
    SetTriggerOption("fight12", "group", "fight")
    SetTriggerOption("fight16", "group", "fight")
    SetTriggerOption("fight17", "group", "fight")
    SetTriggerOption("fight18", "group", "fight")
    --    EnableTrigger("fight4",false)
    job_exp_trigger()
end
function hp_heqi_check(n, l, w)
    heqi = tonumber(w[1])
    hp.heqi = heqi
    if hp.qixue_per < 35 and dhd_cur > 0 then
        exe("fu dahuan dan")
    end
    if hp.qixue_per < 70 and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if (hp.qixue / (hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe("yun qi")
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe("yun jing")
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- 内力小于40%，优先嗑川贝丸！
        exe("eat " .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- 内力小于30%，再嗑黄芪丹！
        exe("eat " .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- 内力小于10%，嗑内息丸！
        exe("eat " .. drug.neili1)
    end
    if hp.neili < 2000 and hp.neili_max > 3000 and GetRoleConfig("Recover_neili") ~= "" then
        exe(GetRoleConfig("Recover_neili"))
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe("yun jingli")
    end
    if job.name == "songmoya" then
        if hp.qixue_per < 80 then
            exe("eat " .. drug.heal)
        end
        if perform.force and perform.force == "dulong-dafa" and (not flag.wudi or flag.wudi == 0) then
            exe("yun wudi")
        end
        if perform.force and perform.force == "dulong-dafa" and hp.qixue_per < 70 then
            exe("yun wudi")
        end
        if os.time() > fight.time.b + 120 then
            exe("set wimpycmd halt\\down")
            return
        end
        if heqi == 1000 and hp.qixue_per < 55 then
            chats_log("报效国家任务：合气到达1000满值，放弃任务！", "cyan")
            exe("set wimpycmd halt\\down")
            return
        end
        if yptjob.fengzhao == false then
            if yptjob.name2 == "无威胁" then
                if heqi > 320 then
                    exe("ppp1;pp1;set wimpycmd pfmbuff\\ppp1\\pp1\\hp")
                    hqpd = 0
                    return
                elseif hqpd == 0 then
                    exe("set wimpycmd hp")
                    hqpd = 1
                    print("积攒合气！")
                    return
                end
            end

            if yptjob.name1 == "无威胁" then
                if heqi > 320 then
                    exe("ppp2;pp2;set wimpycmd pfmbuff\\ppp2\\pp2\\hp")
                    hqpd = 0
                    return
                elseif hqpd == 0 then
                    exe("set wimpycmd hp")
                    hqpd = 1
                    print("积攒合气！")
                    return
                end
            end
        end
        if yptjob.name1 ~= "无威胁" and yptjob.name2 ~= "无威胁" then
            if heqi > 400 then
                if GetVariable("double_kill") ~= nil and GetVariable("double_kill") == "yes" then
                    if sxkiller1 >= sxkiller2 then
                        exe("set wimpycmd pfmbuff\\ppp1\\ppp2\\hp")
                        hqpd = 0
                    else
                        exe("set wimpycmd pfmbuff\\ppp2\\ppp1\\hp")
                        hqpd = 0
                    end
                else
                    if sxkiller1 >= sxkiller2 then
                        exe("ppp1;pp1;set wimpycmd pfmbuff\\ppp1\\pp1\\hp")
                        hqpd = 0
                    else
                        exe("ppp2;pp2;set wimpycmd pfmbuff\\ppp2\\pp2\\hp")
                        hqpd = 0
                    end
                end
            elseif hqpd == 0 then
                exe("set wimpycmd hp")
                hqpd = 1
                print("开始积攒合气！")
            end
        end
    end

    if heqi == 1000 and hp.neili < hp.neili_max * 0.2 then
        dis_all()
        locate()
        exe("yield yes;set wimpycmd halt\\hp\\" .. locl.dir)
        geta()
        EnableTrigger("hpheqi1", true)
        if job.name == "songxin" then
            chats_log("送信任务：合气到达1000满值，放弃任务！", "cyan")
            EnableTrigger("songxin_fight7", true)
            return check_halt(songxinKillFail, 1)
        end
        if job.name == "wudang" then
            chats_log("武当任务：合气到达1000满值，放弃任务！", "cyan")
            return check_halt(wudangKillFail, 1)
        end
        if job.name == "xueshan" then
            chats_log("雪山任务：合气到达1000满值，放弃任务！", "cyan")
            return check_halt(xueshanKillFail, 1)
        end
    end
end
function songxinKillFail()
    exe("yield no")
    return go(songxin_fangqi, "大理城", "驿站")
end
function wudangKillFail()
    exe("yield no")
    return go(wudangFangqi, "武当山", "三清殿")
end
function xueshanKillFail()
    exe("yield no")
    return go(xueshan_fangqi, "大雪山", "入幽口")
end
function noweaponpfm()
    exe("pfmks")
end

function yunWudiDone()
    flag.wudi = 0
end
function yunWudi()
    flag.wudi = 1
end
function fightDrug()
    if isInBags(drug.neili1) then
        exe("eat " .. drug.neili1)
    end
    if isInBags(drug.neili2) then
        exe("eat " .. drug.neili2)
    end
    if isInBags(drug.neili3) then
        exe("eat " .. drug.neili3)
    end
end
function npcWeapon()
    DeleteTriggerGroup("npcWeapon")
    create_trigger_t("npcWeapon1", "^  □(\\D*)\\(", "", "npcWP")
    SetTriggerOption("npcWeapon1", "group", "npcWeapon")
    EnableTriggerGroup("npcWeapon", true)
end
function npcWP(n, l, w)
    local n_words = tostring(w[1])
    -- print(n_words)
    if string.find(n_words, "铁棍") then
        exe("set po 枪")
    elseif string.find(n_words, "钢杖") then
        exe("set po 枪")
    elseif string.find(n_words, "竹棒") then
        job.weapon = "stick"
        exe("set po 枪")
    elseif string.find(n_words, "长剑") then
        job.weapon = "sword"
        exe("set po 剑")
    elseif string.find(n_words, "箫") then
        job.weapon = "xiao"
        exe("set po 剑")
    elseif string.find(n_words, "针") then
        exe("set po 剑")
    elseif string.find(n_words, "钢刀") then
        job.weapon = "blade"
        exe("set po 刀")
    elseif string.find(n_words, "鞭") then
        job.weapon = "whip"
        exe("set po 索")
    elseif string.find(n_words, "石") then
        exe("set po 箭")
    elseif string.find(n_words, "匕首") then
        exe("set po 鞭")
    elseif string.find(n_words, "钢斧") then
        exe("set po 鞭")
    elseif string.find(n_words, "流星锤") then
        exe("set po 鞭")
    elseif string.find(n_words, "铁令") then
        job.weapon = "dagger"
        exe("set po 鞭")
    elseif string.find(n_words, "单钩") then
        exe("set po 鞭")
    elseif string.find(n_words, "法轮") then
        exe("set po 鞭")
    elseif string.find(n_words, "铁笔") then
        exe("set po 鞭")
    else
        job.weapon = "unarmed"
        exe("set po 掌")
    end
    EnableTrigger("npcWeapon1", false)
    DeleteTriggerGroup("npcWeapon")
end
function fightLiuhe(n, l, w)
    local l_force = w[2]
    if string.len(l_force) < 6 then
        return
    end
    if string.find("化功大法|归元吐纳法|毒龙大法", w[2]) then
        exe("set 六合劲 螺旋")
    end
    if string.find("混天气功|龙象般若功|蛤蟆功", w[2]) then
        exe("set 六合劲 钻翻")
    end
    if string.find("乾天一阳功|易筋经|枯荣禅功", w[2]) then
        exe("set 六合劲 软手")
    end
    if string.find("神元功|紫霞功|圣火神功", w[2]) then
        exe("set 六合劲 开合")
    end
    if string.find("玉女心经|神照经", w[2]) then
        exe("set 六合劲 静恒")
    end
    if string.find("临济十二庄|寒冰真气|玄天无极功|先天功|碧海潮生功", w[2]) then
        exe("set 六合劲 虚灵")
    end
end

function fightConsider(n, l, w)
    -- if not (job.killer and job.killer[w[2]]) and not (road.wipe_who and road.wipe_who==w[2]) then
    --  exe(perform.huaxue)
    -- end
end
function fightXiqi(n, l, w)
    do
        return
    end
    if not perform.xiqi then
        return
    end

    local l_jiali = max
    if job.killer and job.killer[w[2]] then
        for p in pairs(skillEnable) do
            if skills[p] and skillEnable[p] == "force" and skills["force"] then
                l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
                l_jiali = math.modf(l_jiali)
                break
            end
        end
        if l_jiali > 200 then
            l_jiali = max
        end
        if skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
        else
            exe("jiali max")
        end

        fightHpCheck()

        if type(job.killer[w[2]]) == "string" then
            exe(perform.xiqi .. " " .. job.killer[w[2]])
        else
            exe(perform.xiqi)
        end
        if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 then
        elseif skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
        elseif perform.skill and perform.skill == "huagu-mianzhang" then
            exe("jiali max")
        else
            exe("jiali max")
        end
    end
end

function performMie(n, l, w)
    do
        return
    end
    if not perform.xiqi then
        return
    end
    if job.killer and job.killer[w[1]] then
        return performBusy(w[1], 2)
    end
end
function performBusy(p_id, p_sec)
    if not p_id or type(p_id) ~= "string" then
        return
    end
    tmp.pfmid = p_id
    if p_sec and type(p_sec) == "number" then
        create_timer_s("performbusy", p_sec, "performAction")
    else
        return performAction()
    end
end
function performAction()
    local l_jiali
    if tmp.pfmid == nil then
        return
    end
    if not job.killer[tmp.pfmid] then
        tmp.pfmid = nil
        return
    end
    for p in pairs(skills) do
        if skillEnable[p] and skillEnable[p] == "force" and skills["force"] then
            l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
            l_jiali = math.modf(l_jiali)
            break
        end
    end
    if l_jiali > 200 then
        l_jiali = max
    end
    if skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
    else
        exe("jiali max")
    end

    fightHpCheck()

    exe(perform.xiqi .. " " .. job.killer[tmp.pfmid])
    tmp.pfmid = nil
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 then
    elseif skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
    elseif perform.skill and perform.skill == "huagu-mianzhang" then
        exe("jiali max")
    else
        exe("jiali max")
    end
end

function fightDie()
    dieLog()
    dis_all()
    nobusy = 0
    messageShow("挂了！")
    if job.name == "songmoya" then
        smydie = smydie + 1
    end
    job.name = nil
    if hp.exp < 2000000 then
        create_triggerex("die", "^(> )*城隍庙", "", "xcquit")
    else
        create_triggerex("die", "^(> )*城隍庙", "", "main")
    end
end
function xcquit()
    exe("quit")
    wait.make(
        function()
            wait.time(3)
            Disconnect()
            Connect()
        end
    )
end
function fight_hurt()
    local per = 100 - damage
    if per > 20 or (hp.qixue_per <= 70 and per > 10) then
        world.Send("yun qi")
    end
end
function fight_hp()
    exe("hp")
    checkWait(fightHpCheck, 0.2)
end
function fight_check(n, l, w, styles)
    --[[print(w[2])
    if w[1]=='你' then
       exe('hp')
       checkWait(fightHpCheck,0.2)
    elseif job.name=="sldsm" and job.type and job.type=="zh" and w[1]==job.target then
       return sldsmZh(n,l,w,styles)
    end]]
    if w[1] == "你" then
        local l = w[2]
        -- print(l)
        if string.find(l, "看起来气血充盈，并没有受伤") then
            damage = 100
            return fight_hurt()
        end
        if string.find(l, "似乎受了点轻伤，不过光从外表看不大出来") then
            damage = 90
            return fight_hurt()
        end
        if string.find(l, "看起来可能受了点轻伤") then
            damage = 80
            return fight_hurt()
        end

        if string.find(l, "受了几处伤，不过似乎并不碍事") then
            damage = 70
            return fight_hurt()
        end
        if string.find(l, "受伤不轻，看起来状况并不太好") then
            damage = 60
        end
        if string.find(l, "气息粗重，动作开始散乱，看来所受的伤着实不轻") then
            damage = 50
            return fight_hurt()
        end

        if string.find(l, "已经伤痕累累，正在勉力支撑着不倒下去") then
            damage = 40
            return fight_hurt()
        end

        if string.find(l, "受了相当重的伤，只怕会有生命危险") then
            damage = 30
            return fight_hurt()
        end
        if string.find(l, "伤重之下已经难以支撑，眼看就要倒在地上") then
            damage = 20
            return fight_hurt()
        end
        if string.find(l, "受伤过重，已经奄奄一息，命在旦夕了") then
            damage = 10
            return fight_hurt()
        end
        if string.find(l, "受伤过重，已经有如风中残烛，随时都可能断气") then
            damage = 0
            return fight_hurt()
        end
        if string.find(l, "看起来充满活力，一点也不累") then
            damage = 99
            return fight_hurt()
        end
        if string.find(l, "似乎有些疲惫，但是仍然十分有活力") then
            damage = 88
            return fight_hurt()
        end
        if string.find(l, "看起来可能有些累了") then
            damage = 77
            return fight_hurt()
        end

        if string.find(l, "动作似乎开始有点不太灵光，但是仍然有条不紊") then
            damage = 66
            return fight_hurt()
        end
        if string.find(l, "气喘嘘嘘，看起来状况并不太好") then
            damage = 55
            return fight_hurt()
        end
        if string.find(l, "似乎十分疲惫，看来需要好好休息了") then
            damage = 44
            return fight_hurt()
        end
        if string.find(l, "已经一副头重脚轻的模样，正在勉力支撑着不倒下去") then
            damage = 33
            return fight_hurt()
        end
        if string.find(l, "看起来已经力不从心了") then
            damage = 22
            return fight_hurt()
        end
        if string.find(l, "摇头晃脑、歪歪斜斜地站都站不稳，眼看就要倒在地上") then
            damage = 11
            return fight_hurt()
        end
        if string.find(l, "已经陷入半昏迷状态，随时都可能摔倒晕去") then
            damage = 1
            return fight_hurt()
        end
    end
end
function fightHpCheck()
    -- if score.party and score.party=="峨嵋派" and hp.qixue_per<75 then
    --   exe('yun yinyang')
    -- end
    -- if score.party and score.party=="峨嵋派" and hp.qixue_per<40 then
    --   exe('yield yes;fu '..drug.heal..';yield no')
    -- end
    -- if score.party and score.party=="神龙教" and hp.qixue_per<50 then
    --   exe('yun wudi '.. score.id)
    -- end
    if hp.qixue_per < 50 and cty_cu > 0 then
        exe("eat chantui yao")
    end
    if (hp.qixue / (hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe("yun qi")
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe("yun jing")
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- 内力小于40%，优先嗑川贝丸！
        exe("eat " .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- 内力小于30%，再嗑黄芪丹！
        exe("eat " .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- 内力小于10%，嗑内息丸！
        exe("eat " .. drug.neili1)
    end
    if hp.neili < 1000 and hp.neili_max > 3000 and hp.heqi > 480 and GetRoleConfig("Auto_hqgzc_10times") ~= "" then
        exe(GetRoleConfig("Recover_neili"))
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe("yun jingli")
    end
end

faintFunc = faintFunc or {}
function faint_check()
    fightHpCheck()
    job.killer = {}
    tmp = {}
    faintFunc = faintFunc or {}
    for k, v in pairs(faintFunc) do
        if job.name == k then
            return _G[v]()
        end
    end
    return check_heal()
end
--[[
function fight_zhaoshi_check(n,l,w)
    local l_npc

    if job.name ~= 'huashan' and job.name ~= 'xueshan' then
       EnableTrigger("fight17",false)
       return false
    end
    if job.target=='任务目标' then
       EnableTrigger("fight17",false)
       return false
    end

    if string.len(w[1]) > 8 then
       l_npc = w[1]
    else
       return false
    end

    if string.find(l_npc,job.target) then
       l_npc=del_string(l_npc,job.target)
       skills_zhaoshi(l_npc)
    end
end
--]]
function ppp()
    local l_cmd = GetVariable("pzhen")
    print(l_cmd)
    local l_cmd = GetVariable("pqi")
    print(l_cmd)
    local l_cmd = GetVariable("pxian")
    print(l_cmd)
    local l_cmd = GetVariable("pgang")
    print(l_cmd)
    local l_cmd = GetVariable("prou")
    print(l_cmd)
    local l_cmd = GetVariable("pkuai")
    print(l_cmd)
    local l_cmd = GetVariable("pman")
    print(l_cmd)
    local l_cmd = GetVariable("pmiao")
    print(l_cmd)
    local l_cmd = GetVariable("pkpfm")
    print(l_cmd)
end

function killPfm(id, p_cmd)
    local l_cmd = "kill"
    if p_cmd and type(p_cmd) == "string" then
        l_cmd = p_cmd
    end
    if id then
        exe(l_cmd .. " " .. id)
    -- exe('pfmpfm')
    end
    tmp.pfm = 100
    tmp.busytest = 0
    exe("set wimpycmd pfmpfm\\hp;set wimpy 100")
end
function performPre()
    if GetVariable("performpre") then
        perform.pre = GetVariable("performpre")
    end

    local l_pfm = perform.pre
    local l_jiali
    if job.name == "gaibang" and perform.skill and perform.skill == "taiji-quan" then
        l_pfm = perform.xiqi
    end

    for p in pairs(skillEnable) do
        if skills[p] and skillEnable[p] == "force" and skills["force"] then
            l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
            l_jiali = math.modf(l_jiali)
            break
        end
    end
    if l_jiali > 200 then
        l_jiali = max
    end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 and string.find(perform.huaxue, "yun riyue") then
        exe("jiali max")
    else
        if skills["yinyun-ziqi"] then
            exe("jiali max")
        else
            exe("jiali max")
        end
    end
    if job.name == "gblu" and road.wipe_id == "shiwei" and score.party == "丐帮" then
        l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.chuo shiwei")
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" and score.party == "丐帮" then
        l_pfm = string.gsub(l_pfm, "perform stick.chuo", "perform stick.chuo wu shi")
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" and score.party == "峨嵋派" then
        l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi")
    end
    if job.name == "zhuoshe" and score.party == "丐帮" then
        l_pfm = string.gsub(l_pfm, "perform stick.chuo", "perform stick.zhuan")
    end
    if score.party == "神龙教" and flag.wudi and flag.wudi == 0 then
        l_pfm = "yun wudi " .. score.id .. ";" .. l_pfm
    end
    exe(l_pfm)
end
function pfmhuaxue()
    if not tmp.pfmid then
        DeleteTimer("performbusy")
    end
    if tmp.busytest then
        tmp.busytest = tmp.busytest + 1
    else
        tmp.busytest = 1
    end
    if tmp.busytest < 3 then
        exe("alias action pfmhuaxue")
    end
end
function performhuaxue()
    tmp.pfm = tmp.pfm - 1
    if tmp.pfm < 1 then
        DeleteTimer("perform")
        return
    end
    tmp.busytest = 0
    local l_pfm = perform.huaxue
    if not perform.huaxue then
        return
    end
    fightHpCheck()
    if job.name == "gblu" and road.wipe_id == "shiwei" and score.party == "丐帮" then
        if tmp.faint and tmp.faint > 0 then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan shiwei " .. tmp.faint + 1)
        else
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan shiwei")
        end
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" then
        if tmp.faint and tmp.faint > 0 then
            l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.chan wu shi " .. tmp.faint + 1)
            l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi " .. tmp.faint + 1)
        else
            l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.chan wu shi")
            l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi")
        end
    end
    if job.name == "zhuoshe" and score.party == "丐帮" then
        l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.zhuan")
    end
    if job.name == "songxin" then
        if job.killer[sxjob.killer1] == "faint" and type(job.killer[sxjob.killer2]) == "string" then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan " .. job.killer[sxjob.killer2])
        elseif job.killer[sxjob.killer2] == "faint" and type(job.killer[sxjob.killer1]) == "string" then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan " .. job.killer[sxjob.killer1])
        end
    end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 150 and hp.qixue_per < 70 then
        l_pfm = "yun yinyang;" .. l_pfm
    end
    if score.party == "神龙教" and (hp.qixue_per < 40 or (flag.wudi and flag.wudi == 0)) then
        l_pfm = "yun wudi " .. score.id .. ";" .. l_pfm
    end
    exe(l_pfm)
    if score.party == "神龙教" and job.type and job.type == "zh" and job.name == "sldsm" and job.id then
        exe("zh " .. job.id .. ";no")
    end
end

fight_prepare = function()
    if Bag[weapon.first] and weaponKind[skillEnable[perform.skill]] then
        exe("wield " .. Bag[weapon.first].fullid)
    elseif Bag[weapon.second] and weaponKind[skillEnable[perform.skill]] then
        exe("wield " .. Bag[weapon.second].fullid)
    else
        weapon_wield()
    end

    local l_pfm
    exe("i;remove biao;jiali max;yield no")
    weapon_unwield()
    weapon_wield()
    --[[
   if perform and perform.skill and skillEnable[perform.skill] and string.find('strike|hand|cuff|finger|leg|claw',skillEnable[perform.skill]) then
      exe('bei none')
   end
   if perform and perform.skill and skillEnable[perform.skill] then
      exe('jifa '.. skillEnable[perform.skill] ..' '.. perform.skill)
	  if score.party=="少林派" and skills["banruo-zhang"] and skills["banruo-zhang"].lvl>350 then
	     exe('jifa parry banruo-zhang')
	  else
         exe('jifa parry '.. perform.skill)
	  end
   end
   --]]
    beiUnarmed()
    exe("set wimpycmd pfmpfm\\hp")
    exe("set wimpy 100;yield no")
    if score.party == "桃花岛" then
        l_pfm = "perform dodge.wuzhuan " .. score.id
        exe(l_pfm)
    end
    -- if skills["yunu-xinjing"] and perform.force and perform.force=="yunu-xinjing" then
    --   exe('yun xinjing')
    -- end
    -- if skills["bihai-chaosheng"] and perform.force and perform.force=="bihai-chaosheng" then
    -- exe('yun qimen')
    -- end
    if skills["yijin-jing"] and perform.force and perform.force == "yijin-jing" then
        exe("yun powerup")
    end
    if skills["lingbo-weibu"] then
        exe("enable dodge lingbo-weibu;perform dodge.luoshen " .. score.id)
    end
    -- ai
    -----------------------------------   -- ain
    --  if skills["longxiang-boruo"] and perform.force and perform.force=="longxiang-boruo" then
    --     exe('yun shield')
    --  end

    if skills["xiantian-gong"] and perform.force and perform.force == "xiantian-gong" then
        exe("yun wuqi")
    end

    if skills["huagong-dafa"] and perform.force and perform.force == "huagong-dafa" then
        exe("yun huadu")
    end

    if skills["bahuang-gong"] and perform.force and perform.force == "bahuang-gong" then
        exe("yun duzun")
        exe("yun bahuang")
    end
    -- if skills["shenzhao-jing"] and perform.force and perform.force=="shenzhao-jing" then
    --    exe('yun shenzhao')
    -- 因为立即散功 取消了
    -- end
    if skills["yunu-xinjing"] and perform.force and perform.force == "yunu-xinjing" then
        exe("yun xinjing")
    end
    if skills["hanbing-zhenqi"] and perform.force and perform.force == "hanbing-zhenqi" then
        exe("yun huti")
    end
end

prepare_lianxi = function(func)
    prepare_trigger()
    EnableTriggerGroup("prepare_neili", true)
    flag.prepare = 1
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end
    condition = {}
    exe("cond")
    return check_busy(prepareLianxi)
end
function prepareLianxi()
    if mydummy == true then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        return dummyfind()
    end
    if (not condition.busy or condition.busy == 0) and job.prepare ~= duHhe_start and job.prepare ~= duCjiang_start then
        if GetRoleConfig("CheckNeili_InAdvance") == true then 
            return prepare_neili(job.prepare)
        else
            return check_bei(job.prepare)
        end
    end
    if condition.busy > 60 then
        if
            score.party == "姑苏慕容" and need_dzxy == "yes" and dzxy_level == 3 and hp.food > 50 and hp.water > 50 and
                (locl.time == "戊" or locl.time == "亥" or locl.time == "子" or locl.time == "丑")
         then
            messageShow("任务监控：是三段斗转星移，而且是晚上，可以去看星星领悟斗转星移了！", "white")
            return check_halt(checkdzxy)
        end
    end
    flag.jixu = 1
    if hp.neili_max > hp.neili_lim - 10 then
        exe("unset 积蓄")
    elseif job.prepare and (job.prepare == test or job.prepare == duHhe_start or job.prepare == duCjiang_start) then
        exe("unset 积蓄")
    else
        flag.jixu = 0
        exe("unset 积蓄")
    end

    if job.zuhe["gblu"] and not locl.id["铜钱"] and hp.exp < 2000000 then
        exe("drop 1 coin")
    end

    prepare_neili_a()
end
prepare_neili = function(func, p_cmd)
    local l_db
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end

    tmp.db = p_cmd
    l_db = 1 / 2
    if tmp.db and type(tmp.db) == "number" and tmp.db < 2 then
        l_db = tmp.db
    end

    if hp.neili > hp.neili_max * l_db and job.prepare ~= test and job.prepare ~= fight_prepare then
        return check_bei(job.prepare)
    end

    prepare_trigger()
    EnableTriggerGroup("prepare_neili", true)
    flag.jixu = 1
    exe("unset 积蓄")
    flag.prepare = 0
    exe("yun jing;yun jingli;hp")
    if job.zuhe["gblu"] and not locl.id["铜钱"] then
        exe("drop 1 coin")
    end
    prepare_neili_a()
end
prepare_neili_at = function()
    if tmp.prepare then
        job.prepare = tmp.prepare
    end
    prepare_trigger()

    if job.zuhe["gblu"] and not locl.id["铜钱"] then
        exe("drop 1 coin")
    end

    EnableTriggerGroup("prepare_neili", true)
    create_timer_s("neili", 3, "prepare_neili_idle")
end
prepare_neili_a = function()
    condition.busy = 0
    prepare_neili_idle()
    if hp.qixue_per < 50 and isInBags(drug.heal) then
        exe("eat chantui yao")
    end
    create_timer_s("neili", 3, "prepare_neili_idle")
end
prepare_neili_b = function()
    if mydummy == true then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        return dummyfind()
    end
    if score.party == "普通百姓" and nobusy == 0 and condition.busy ~= nil and condition.busy >= 100 and hp.pot >= 60 then
        if skills["literate"] and score.gold > 1000 and skills["literate"].lvl < hp.pot_max - 100 then
            return check_halt(literate)
        elseif
            (skills["force"].lvl > 200 and skills["force"].lvl < hp.pot_max - 100) or
                (skills["dodge"].lvl > 101 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl > 101 and skills["parry"].lvl < hp.pot_max - 100)
         then
            return check_halt(lingwu)
        end
    end
    if score.party ~= "普通百姓" and nobusy == 0 and condition.busy ~= nil and condition.busy >= 100 and hp.pot >= 60 then
        if skills["literate"] and score.gold > 1000 and skills["literate"].lvl < hp.pot_max - 100 then
            return check_halt(literate)
        elseif
            (skills["dodge"].lvl < 450 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl < 450 and skills["parry"].lvl < hp.pot_max - 100) or
                (skills["force"].lvl < 450 and skills["force"].lvl < hp.pot_max - 100)
         then
            return check_halt(xuexi)
        elseif
            (skills["force"].lvl >= 450 and skills["force"].lvl < hp.pot_max - 100) or
                (skills["dodge"].lvl >= 450 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl >= 450 and skills["parry"].lvl < hp.pot_max - 100)
         then
            return check_halt(lingwu)
        end
    end
    exe("yun qi;hp")
    check_bei(prepare_neili_c)
end
prepare_neili_c = function()
    local l_db = 1 / 2
    -- if score.party and score.party=='峨嵋派' then
    --   l_db=5/4
    -- end
    -- if perform.skill and perform.skill=="jieshou-jiushi" then
    --   l_db=7/4
    -- end
    if tmp.db and type(tmp.db) == "number" and tmp.db < 2 then
        l_db = tmp.db
    end

    -- if job.zuhe["wudang"] then l_db = 1 end

    if not flag.prepare or type(flag.prepare) ~= "number" then
        flag.prepare = 0
    end
    if condition.busy and condition.busy > 20 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = 4
    end
    if condition.busy and condition.busy == 0 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = flag.prepare + 5
    end
    if job.prepare == duHhe_start or job.prepare == duCjiang_start then
        flag.prepare = 0
    end
    if flag.prepare > 4 then
        flag.prepare = 0
    end
    if (hp.neili > hp.neili_max * l_db or hp.jingli > hp.jingli_max) and flag.prepare == 0 then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        DeleteTimer("neili")
        exe("yun jing;yun qi;yun jingli")
        check_bei(job.prepare)
    else
        prepare_neili_a()
    end
end
prepare_neili_w = function()
    locate()
    check_bei(prepare_neili_g)
end
prepare_neili_g = function()
    exe(locl.dir)
end
prepare_neili_t = function()
    DeleteTimer("neili")
    tmp.i = 1
end
prepare_neili_idle = function()
    local l_cnt = 0
    local l_db = 3 / 2

    for p in pairs(skills) do
        if skillEnable[p] and skillEnable[p] == "force" then
            tmp.fskill = p
            break
        end
    end
    if perform.force then
        tmp.fskill = perform.force
    end

    if
        ((hp.neili_max > hp.neili_lim - 20 and score.party and score.party == "峨嵋派") or hp.neili_max >= hp.neili_lim - 5 or
            flag.jixu == 1 or
            skills[tmp.fskill].full == 0) and
            hp.neili > hp.neili_max * l_db
     then
        if hp.neili > hp.neili_max * 7 / 4 then
            l_cnt = l_cnt + math.modf((hp.neili - hp.neili_max * 7 / 4) / 10)
        end
        l_cnt = l_cnt + math.modf(hp.neili_max / 300)
        if l_cnt < 1 then
            l_cnt = 1
        end
        lianxi(l_cnt)
    end
    if score.gold and score.gold > 1000 and hp.neili < hp.neili_max * 0.5 then
        exe("eat " .. drug.neili3)
    end
    exe("yun jingli;yun jing;yun qi")
    if
        hp.jingli_max < hp.jingli_lim - 500 and flag.lianxi == 1 and hp.neili > hp.neili_max * l_db and
            ((hp.neili_max > hp.neili_lim - 20 and score.party and score.party == "峨嵋派") or
                hp.neili_max >= hp.neili_lim - 5 or
                flag.jixu == 1)
     then
        exe("unset 积蓄")
        exe("tuna " .. hp.jingxue / 2)
    else
        -- if score.party and score.party=="峨嵋派" and locl.room=="牛心石" then
        --   exe('lianneili '..hp.dazuo)
        -- end
        exe("unset 积蓄")
        exe("dazuo " .. hp.dazuo)
    end
    exe("cond")
end
prepare_neili_stop = function()
    DeleteTimer("neili")
    DeleteTimer("bei")
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    beihook = test
    busyhook = test
    EnableTriggerGroup("check_bei", false)
    EnableTriggerGroup("check_busy", false)
    exe("halt")
end
prepare_neili_liaokao = function()
    dis_all()
    return tiaoshui()
end
prepare_neili_over = function()
    condition.busy = 0
    check_halt(prepare_neili_guanbi)
end
prepare_neili_guanbi = function()
    if not flag.prepare or type(flag.prepare) ~= "number" then
        flag.prepare = 0
    end
    if condition.busy and condition.busy > 20 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = 4
    end
    if condition.busy and condition.busy == 0 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = flag.prepare + 5
    end
    if job.prepare == duHhe_start or job.prepare == duCjiang_start then
        flag.prepare = 0
    end
    if flag.prepare > 4 then
        flag.prepare = 0
    end
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTimer("neili")
    exe("yun jing;yun qi;yun jingli")
    check_bei(job.prepare)
end
function job.find()
    if job.name == nil then
        return 0
    end
end
function job.flag()
    flag.find = 0
    flag.wait = 0
end

function job_exp_trigger()
    DeleteTriggerGroup("job_exp")
    create_trigger_t("job_exp1", "^(> )*(\\D*)点潜能!$", "", "jobExppot")
    create_trigger_t("job_exp2", "^(> )*(\\D*)点经验!$", "", "jobExpexp")
    create_trigger_t("job_exp3", "^(> )*你静下心来，反复回想刚才的任务过程，不禁豁然开朗。。你额外地得到了(\\D*)点经验！", "", "jobExpExtra")
    create_trigger_t("job_exp4", "^>*\\s*你觉得脑中豁然开朗，增加了(\\D*)点潜能和(\\D*)点经验！", "", "job_exp_gb")
    create_trigger_t("job_exp5", "^(> )*恭喜你！你成功的完成了(\\D*)任务！你被奖励了", "", "jobExp")
    create_trigger_t("job_exp6", "^>*\\s*好，任务完成了，你得到了(\\D*)点实战经验，(\\D*)点潜能", "", "job_exp_gblu")
    create_trigger_t("job_exp7", "^>*\\s*你被奖励了(\\D*)点经验，(\\D*)点潜能，(\\D*)点负神！$", "", "job_exp_shenlong")
    create_trigger_t("job_exp8", "^(> )*您被奖励了(\\D*)点经验，(\\D*)点潜能，您已经为长乐帮出力(\\D*)次。", "", "job_exp_clb")
    -- 您被奖励了一点经验，五十六点潜能，您已经为长乐帮出力一百二十四次。
    -- create_trigger_t('job_exp8','^(> )*你被奖励了(\\D*)点经验，(\\D*)点潜能，(\\D*)两黄金','','hubiaoFinish')
    -- create_triggerex_lvl('job_exp9',"^(> )*【队伍】(\\D*)\\((\\D*)\\)：gblu start",'','gbluTeamStart',95)
    create_trigger_t("job_exp10", "^(> )*好！任务完成，你被奖励了：(\\D*)点实战经验，(\\D*)点潜能。(\\D*)神。$", "", "job_exp_songxin")
    create_trigger_t("job_exp11", "^(> )*你获得了(\\D*)点经验，(\\D*)点潜能！你的侠义正气增加了！$", "", "job_exp_wudang")
    create_trigger_t("job_exp12", "^(> )*你获得了(\\D*)点经验，(\\D*)点潜能，(\\D*)点\\D*神。$", "", "job_exp_huashan")
    create_trigger_t("job_exp13", "^(> )*你被奖励了(\\D*)点经验，(\\D*)点潜能！你感觉邪恶之气更胜从前！$", "", "job_exp_xueshan")
    create_trigger_t("job_exp14", "^(> )*你被奖励了：(\\D*)点实战经验，(\\D*)点潜能，(\\D*)白银，(\\D*)神。$", "", "job_exp_xuncheng")
    -- 你获得了五百三十九点经验，一百五十六点潜能，你共为神龙教铲除了四个恶贼。
    create_trigger_t("job_exp15", "^(> )*你获得了(\\D*)点经验，(\\D*)点潜能，你共为(\\D*)铲除了(\\D*)个恶贼。$", "", "job_exp_dummy")
    create_trigger_t("job_exp16", "^(> )*恭喜你任务顺利完成，你获得了(\\D*)经验，(\\D*)点潜能的奖励。$", "", "job_exp_tdh")
    create_trigger_t("job_exp17", "^(> )*(你擅离职守，任务失败。|你速度太慢，西夏武士已过颂摩崖，任务失败。)", "", "job_gblu_fail")
    create_trigger_t("job_exp18", "^(> )*糟了！(\\D*)死亡，任务失败！", "", "jobtdhfail")
    SetTriggerOption("job_exp1", "group", "job_exp")
    SetTriggerOption("job_exp2", "group", "job_exp")
    SetTriggerOption("job_exp3", "group", "job_exp")
    SetTriggerOption("job_exp4", "group", "job_exp")
    SetTriggerOption("job_exp5", "group", "job_exp")
    SetTriggerOption("job_exp6", "group", "job_exp")
    SetTriggerOption("job_exp7", "group", "job_exp")
    SetTriggerOption("job_exp8", "group", "job_exp")
    -- SetTriggerOption("job_exp9","group","job_exp")
    SetTriggerOption("job_exp10", "group", "job_exp")
    SetTriggerOption("job_exp11", "group", "job_exp")
    SetTriggerOption("job_exp12", "group", "job_exp")
    SetTriggerOption("job_exp13", "group", "job_exp")
    SetTriggerOption("job_exp14", "group", "job_exp")
    SetTriggerOption("job_exp15", "group", "job_exp")
    SetTriggerOption("job_exp16", "group", "job_exp")
    SetTriggerOption("job_exp17", "group", "job_exp")
    SetTriggerOption("job_exp18", "group", "job_exp")
    EnableTrigger("job_exp1", false)
    EnableTrigger("job_exp2", false)
end
function jobtdhfail()
    messageShow("天地会任务：接头人死亡，任务失败！")
    tdh_triggerDel()
    return check_food()
end
function jobExp(n, l, w)
    EnableTrigger("job_exp1", true)
    EnableTrigger("job_exp2", true)
    hp.exp_name = tostring(w[2])
end
function jobExpexp(n, l, w)
    hp.exp_exp = tostring(w[2])
end
function job_exp_clb(n, l, w)
    messageShow("长乐帮任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
end
function jobExppot(n, l, w)
    EnableTrigger("job_exp1", false)
    EnableTrigger("job_exp2", false)
    hp.exp_pot = tostring(w[2])
    if not isNil(hp.exp_name) and not isNil(hp.exp_exp) and not isNil(hp.exp_pot) then
        return messageShow(hp.exp_name .. "任务奖励：经验:【" .. hp.exp_exp .. "】点，，潜能:【" .. hp.exp_pot .. "】点！", "darkorange")
    end
    hp.exp_name = nil
    hp.exp_exp = nil
    hp.exp_pot = nil
end

function job_exp_tdh(n, l, w)
    messageShow("天地会任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
    dis_all()
    return tdh_finish()
end
function jobExpExtra(n, l, w)
    messageShow("额外任务奖励：经验:【" .. w[2] .. "】点！", "darkorange")
end
function job_exp_dummy(n, l, w)
    messageShow("大米任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点,共完成" .. w[4] .. "【" .. w[5] .. "】次铲除恶贼！")
end
function job_exp_xueshan(n, l, w)
    messageShow("雪山任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
end
function job_exp_wudang(n, l, w)
    messageShow("武当任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
    wudangjobok = 1
    job.wdtime = os.time() + 40
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("武当任务：任务完成，用时:【" .. job.time.over .. "】秒。")
    dis_all()
    return checkWait(wudangFinish, 1)
end
function job_exp_huashan(n, l, w)
    messageShow("华山任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
end
function job_exp_shenlong(n, l, w)
    messageShow("神龙任务奖励：经验:【" .. w[1] .. "】点，潜能:【" .. w[2] .. "】点！")
end
function job_exp_songxin(n, l, w)
    messageShow("送信任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
end
function job_exp_xuncheng(n, l, w)
    messageShow("巡城任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[3] .. "】点！")
end

function job_exp_gb(n, l, w)
    if job.name == "gaibang" then
        messageShow("丐帮任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[1] .. "】点！")
    end
    if job.name == "songshan" then
        messageShow("嵩山任务奖励：经验:【" .. w[2] .. "】点，潜能:【" .. w[1] .. "】点！")
    end
end
function job_exp_zs(n, l, w)
    messageShow("捉蛇任务奖励：经验:【" .. w[1] .. "】点，潜能:【" .. w[2] .. "】点！")
end
function job_exp_gblu(n, l, w)
    messageShow("报效国家奖励：经验:【" .. w[1] .. "】点，潜能:【" .. w[2] .. "】点！")
    if hp.exp > 2000000 then
        exe("yield no")
        return gbluFinish()
    end
end
-- ---------------------------------------------------------------
-- 任务统计初始化
-- ---------------------------------------------------------------
function job.statistics_Init()
    if job.statistics.PreviousExp == 0 then
        job.statistics = {
            IdleTime = 0,
            PreviousExp = hp.exp,
            StartTime = os.time(),
            -- 持续时间
            Duration = "",
            Times = 0,
            Success = 0,
            Failure = 0,
            Efficiency = 0,
            Category = Category or {}
        }
        job.statistics.Category["华山"] = {}
        job.statistics.Category["华山"].Times = 0
        job.statistics.Category["华山"].Success = 0
        job.statistics.Category["华山"].Failure = 0
        job.statistics.Category["武当"] = {}
        job.statistics.Category["武当"].Times = 0
        job.statistics.Category["武当"].Success = 0
        job.statistics.Category["武当"].Failure = 0
        job.statistics.Category["雪山"] = {}
        job.statistics.Category["雪山"].Times = 0
        job.statistics.Category["雪山"].Success = 0
        job.statistics.Category["雪山"].Failure = 0
        job.statistics.Category["送信"] = {}
        job.statistics.Category["送信"].Times = 0
        job.statistics.Category["送信"].Success = 0
        job.statistics.Category["送信"].Failure = 0
        job.statistics.Category["颂摩崖"] = {}
        job.statistics.Category["颂摩崖"].Times = 0
        job.statistics.Category["颂摩崖"].Success = 0
        job.statistics.Category["颂摩崖"].Failure = 0
        job.statistics.Category["失落的信笺"] = {}
        job.statistics.Category["失落的信笺"].Times = 0
    end
end
-- ---------------------------------------------------------------
-- 任务统计至dashboard上
-- ---------------------------------------------------------------
function job.statistics_Update()
    job.statistics = job.statistics or {}
    if job.statistics.PreviousExp == nil or job.statistics.PreviousExp == 0 then
        job.statistics.PreviousExp = hp.exp
    end
    local l_exp = hp.exp
    local l_time = os.time() - job.statistics.StartTime
    local l_hour = math.modf(l_time / 3600)
    local l_min = math.modf((l_time - l_hour * 3600) / 60)
    local l_sec = l_time - l_hour * 3600 - l_min * 60
    local l_exp = hp.exp - job.statistics.PreviousExp
    local l_avg = math.modf(l_exp * 3600 / l_time)

    job.statistics.Duration = l_hour .. "小时" .. l_min .. "分" .. l_sec .. "秒"
    job.statistics.Efficiency = l_avg
end
-- ---------------------------------------------------------------
-- 任务统计至messageShow窗口
-- ---------------------------------------------------------------
function job_exp_tongji(p_cmd)
    tongji = tongji or {}
    if tongji.exp == nil then
        tongji.exp = hp.exp
        tongji.time = os.time()
        tongji.hour = math.modf(os.time() / 900)
        messageShowT("任务奖励统计：统计开始", "orange")
        return
    end

    if not tongji.time or not tongji.hour then
        tongji.exp = nil
        return
    end
    if math.modf(os.time() / 900) <= tongji.hour and not p_cmd then
        return
    end

    tongji.hour = math.modf(os.time() / 900)

    local l_exp = hp.exp
    local l_time = os.time() - tongji.time
    local l_hour = math.modf(l_time / 3600)
    local l_min = math.modf((l_time - l_hour * 3600) / 60)
    local l_sec = l_time - l_hour * 3600 - l_min * 60
    local l_exp = hp.exp - tongji.exp
    local l_avg = math.modf(l_exp * 3600 / l_time)

    job.expAvg = l_avg

    if flag.log and flag.log == "yes" then
        messageShowT(
            "任务奖励统计：共运行【" ..
                l_hour .. "小时" .. l_min .. "分" .. l_sec .. "秒" .. "】，获得经验【" .. l_exp .. "】点，平均每小时【" .. l_avg .. "】点！",
            "orange"
        )
    else
        ColourNote(
            "white",
            "black",
            "任务奖励统计：共运行【" ..
                l_hour .. "小时" .. l_min .. "分" .. l_sec .. "秒" .. "】，获得经验【" .. l_exp .. "】点，平均每小时【" .. l_avg .. "】点！"
        )
    end
end
function jobExpTongji()
    return job_exp_tongji(1)
end

JobTriggerDel = JobTriggerDel or {}

function jobTriggerDel()
    huashan_triggerDel()
    songxin_triggerDel()
    gaibangTriggerDel()
    zhuosheTriggerDel()
    clbTriggerDel()
    SmyTriggerDel()
    sldsmTriggerDel()
    -- hubiaoTriggerDel()
    tmonkTriggerDel()
    clbTriggerDel()
    husongTriggerDel()
    wudangTriggerDel()
    xueshan_triggerDel()
    tdh_triggerDel()
    JobTriggerDel = JobTriggerDel or {}
    for p, q in pairs(JobTriggerDel) do
        _G[q]()
    end
end

-- gaibang
function gaibangTrigger()
    DeleteTriggerGroup("gaibangAsk")
    create_trigger_t("gaibangAsk1", "^(> )*你向吴长老打听有关", "", "gaibangAsk")
    create_trigger_t("gaibangAsk2", "^(> )*这里没有这个人。$", "", "gaibangNobody")
    SetTriggerOption("gaibangAsk1", "group", "gaibangAsk")
    SetTriggerOption("gaibangAsk2", "group", "gaibangAsk")
    EnableTriggerGroup("gaibangAsk", false)
    DeleteTriggerGroup("gaibangAccept")
    create_trigger_t("gaibangAccept1", "^(> )*吴长老说道：「好吧，最近「(\\D*)」一直和我丐帮作对", "", "gaibangTarget")
    create_trigger_t("gaibangAccept2", "^(> )*吴长老说道：「此人现在在(\\D*)一带", "", "gaibangConsider")
    create_trigger_t("gaibangAccept3", "^(> )*吴长老说道：「既然你干不了也没关系", "", "gaibangFail")
    create_trigger_t("gaibangAccept4", "^(> )*吴长老说道：「你连上个任务去都不想去", "", "gaibangFail")
    create_trigger_t("gaibangAccept5", "^(> )*吴长老说道：「现在我可没有给你的任务，等会再来吧！", "", "gaibangBusy")
    create_trigger_t("gaibangAccept6", "^(> )*吴长老说道：「你没有领任务", "", "gaibang")
    create_trigger_t("gaibangAccept7", "^(> )*吴长老说道：「没看见我正忙着吗", "", "gaibangWait")
    create_trigger_t("gaibangAccept8", "^(> )*吴长老说道：「不是让你去杀", "", "gaibangFangqiGo")
    create_trigger_t("gaibangAccept9", "^(> )*吴长老说道：「现在我这里没有给你的任务，你去其他地方看看吧？」", "", "gaibangFail")
    -- ain
    -- create_trigger_t('gaibangAccept9',"^(> )*吴长老说道：「现在我可没有给你的任务，等会怎么样？",'','gaibangFail')
    SetTriggerOption("gaibangAccept1", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept2", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept3", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept4", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept5", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept6", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept7", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept8", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept9", "group", "gaibangAccept")
    EnableTriggerGroup("gaibangAccept", false)
    DeleteTriggerGroup("gaibangFight")
    create_trigger_t("gaibangFight1", "^(> )*(\\D*)「啪」的一声倒在地上", "", "gaibangDie")
    create_trigger_t("gaibangFight2", "^(> )*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。", "", "gaibangFaint")
    create_trigger_t("gaibangFight3", "^(> )*(\\D*)急急忙忙地离开了。", "", "gaibangRun")
    create_trigger_t("gaibangFight4", "^(> )*这里没有可使用的对象。", "", "gaibangNoTarget")
    SetTriggerOption("gaibangFight1", "group", "gaibangFight")
    SetTriggerOption("gaibangFight2", "group", "gaibangFight")
    SetTriggerOption("gaibangFight3", "group", "gaibangFight")
    SetTriggerOption("gaibangFight4", "group", "gaibangFight")
    EnableTriggerGroup("gaibangFight", false)
    DeleteTriggerGroup("gaibangCut")
    create_trigger_t("gaibangCut1", "^>*\\s*只听“咔”的一声，你将(\\D*)的首级斩了下来，提在手中。", "", "gaibangCutCon")
    create_trigger_t("gaibangCut2", "^>*\\s*你得用件锋利的器具才能切下这尸体的头来。", "", "gaibangCutWeapon")
    create_trigger_t("gaibangCut3", '(> )*你把 "action" 设定为 "Cut" 成功完成。', "", "gaibangCutFail")
    SetTriggerOption("gaibangCut1", "group", "gaibangCut")
    SetTriggerOption("gaibangCut2", "group", "gaibangCut")
    SetTriggerOption("gaibangCut3", "group", "gaibangCut")
    EnableTriggerGroup("gaibangCut", false)
    DeleteTriggerGroup("gaibangGive")
    create_trigger_t("gaibangGive1", "^(> )*你给吴长老一颗(\\D*)的首级。", "", "gaibangFinish")
    create_trigger_t("gaibangGive2", "^(> )*吴长老说道：「嘿嘿。。。，你杀错人了。」", "", "gaibangFinish")
    create_trigger_t("gaibangGive3", "^(> )*吴长老说道：「我现在正忙着呢，你稍等一下吧。」", "", "gaibangGiveBusy")
    SetTriggerOption("gaibangGive1", "group", "gaibangGive")
    SetTriggerOption("gaibangGive2", "group", "gaibangGive")
    SetTriggerOption("gaibangGive3", "group", "gaibangGive")
    EnableTriggerGroup("gaibangGive", false)
    DeleteTriggerGroup("gaibangHead")
    create_trigger_t("gaibangHead1", "^(> )*这是一颗(\\D*)的(首级|人头)", "", "gaibangHeadCheck")
    create_trigger_t("gaibangHead2", '^(> )*你把 "action" 设定为 "check_head" 成功完成。', "", "gaibangHeadCon")
    SetTriggerOption("gaibangHead1", "group", "gaibangHead")
    SetTriggerOption("gaibangHead2", "group", "gaibangHead")
    EnableTriggerGroup("gaibangHead", false)
end
function gaibangTriggerDel()
    DeleteTriggerGroup("gaibangAsk")
    DeleteTriggerGroup("gaibangAccept")
    DeleteTriggerGroup("gaibangFight")
    DeleteTriggerGroup("gaibangCut")
    DeleteTriggerGroup("gaibangGive")
    DeleteTriggerGroup("gaibangHead")
    DeleteTriggerGroup("gaibangFind")
end
function gaibangNobody()
    EnableTriggerGroup("gaibangAsk", false)
    gaibang()
end
-- ain
----job.list[gbwu"] = "丐帮吴长老"
job.list["gaibang"] = "丐帮吴长老"
function gaibang()
    gaibangTrigger()
    job.name = "gaibang"
    print("gaibang start...")
    prepare_neili(gaibangGo)
end
function gaibangGo()
    -- ain
    -- go(gaibangStart,"丐帮","大信分舵")
    go(gaibangStart, "福州城", "船舱")
end
function gaibangStart()
    EnableTriggerGroup("gaibangAsk", true)
    exe("ask wu zhanglao about job")
end
function gaibangAsk()
    EnableTriggerGroup("gaibangAsk", false)
    EnableTriggerGroup("gaibangAccept", true)
end
function gaibangBusy()
    EnableTriggerGroup("gaibangAccept", false)
    if condition.busy and condition.busy == 0 then
        job.last = "gaibang"
        return check_heal()
    else
        check_bei(gaibangBusyDazuo)
    end
end
function gaibangBusyDazuo()
    exe("out")
    prepare_lianxi(gaibangBusyStart)
end
function gaibangBusyStart()
    exe("enter")
    gaibangStart()
end
function gaibangWait()
    EnableTriggerGroup("gaibangAccept", false)
    if job.name == "fangqi" then
        check_bei(gaibangFangqi)
    else
        check_bei(gaibangStart)
    end
end
function gaibangTarget(n, l, w)
    job.target = Trim(w[2])
    job.killer = {}
    job.killer[job.target] = true
end
function gaibangConsider(n, l, w)
    nobusy = 1
    job.time.b = os.time()
    print("丐帮job 抓地址")
    EnableTriggerGroup("gaibangAccept", false)
    job.last = "gaibang"
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area

    if string.find(gaibangCancel, job.target) then
        check_bei(gaibangFangqi)
        messageShow("丐帮任务：任务目标【" .. job.target .. "】在Cannel列表里，任务放弃。")
        return 0
    end
    if not job.room or not path_cal() then
        check_bei(gaibangFangqi)
        messageShow("丐帮任务：任务地点【" .. job.where .. "】不可到达，任务放弃。")
        return
    end
    check_bei(gaibangFind)
    exe("丐帮任务在" .. job.where)
    messageShow("丐帮任务：开始前往【" .. job.where .. "】，寻找任务NPC：【" .. job.target .. "】。！")
end
function gaibangFangqi()
    flag.idle = nil
    nobusy = 0
    EnableTriggerGroup("gaibangAsk", true)
    job.name = "fangqi"
    exe("ask wu zhanglao about 放弃")
end
function gaibangFangqiGo()
    EnableTriggerGroup("gaibangAccept", false)
    -- ain
    go(gaibangFangqi, "福州城", "船舱")
end
function gaibangFind()
    DeleteTriggerGroup("gaibangFind")
    create_trigger_t("gaibangFind1", "^>*\\s*\\D*" .. job.target .. "\\((\\D*)\\)", "", "gaibangFight")
    SetTriggerOption("gaibangFind1", "group", "gaibangFind")
    EnableTriggerGroup("gaibangFind", false)
    flag.times = 1
    fight_prepare()
    go(gaibangFindAct, job.area, job.room)
end
function gaibangFindAct()
    EnableTriggerGroup("gaibangFind", true)
    job.flag()
    exe("look")
    find()
    exe("丐帮任务在" .. job.where)
    messageShow("丐帮任务：开始寻找【" .. dest.area .. dest.room .. "】的任务NPC：【" .. job.target .. "】。！")
end
function gaibangFight(n, l, w)
    EnableTriggerGroup("gaibangFind", false)
    EnableTriggerGroup("gaibangFight", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = string.lower(w[1])
    job.killer[job.target] = job.id
    exe("halt;follow " .. job.id)
    -- exe('kill '..job.id)
    killPfm(job.id)
end
function gaibangFaint(n, l, w)
    if job.target == w[2] then
        exe("kill " .. job.id)
    end
end
function gaibangDie(n, l, w)
    if job.target == w[2] then
        DeleteTimer("perform")
        gaibangCut()
    end
end
function gaibangRun(n, l, w)
    EnableTriggerGroup("gaibangFight", false)
    if job.target == w[2] then
        check_bei(gaibangFind)
    end
end
function gaibangNoTarget()
    EnableTriggerGroup("gaibangFight", false)
    check_bei(gaibangFind)
end
function gaibangCut()
    EnableTriggerGroup("gaibangFight", false)
    messageShow("丐帮任务：搞定任务NPC：【" .. job.target .. "】。")
    check_halt(gaibangCutAct)
end
gaibangCutAct = function()
    EnableTriggerGroup("gaibangCut", true)
    exe("halt;i")
    weapon_unwield()
    weaponWieldCut()
    for i = 1, 3 do
        exe("qie corpse " .. i)
    end
    exe("alias action Cut")
end
gaibangCutFail = function()
    EnableTriggerGroup("gaibangCut", false)
    gaibangFind()
end
gaibangCutWeapon = function()
    weapon_unwield()
    gaibangCutAct()
end
gaibangCutCon = function(n, l, w)
    if job.target ~= tostring(w[1]) then
        exe("drop head")
        check_bei(gaibangCutAct)
    else
        EnableTriggerGroup("gaibangCut", false)
        return check_bei(gaibangBack)
    end
end
function gaibangBack()
    weapon_unwield()
    for i = 1, 2 do
    end
    -- ain
    go(gaibangHead, "福州城", "船舱")
end
function gaibangHead()
    EnableTriggerGroup("gaibangHead", true)
    tmp.flag = 0
    exe("look head")
    exe("alias action check_head")
end
function gaibangHeadCheck(n, l, w)
    if w[2] == job.target then
        tmp.flag = 1
    end
end
function gaibangHeadCon()
    EnableTriggerGroup("gaibangHead", false)
    if tmp.flag == 1 then
        gaibangGive()
    else
        gaibangFinish()
    end
end
function gaibangGive()
    EnableTriggerGroup("gaibangGive", true)
    exe("give wu head")
end
function gaibangGiveBusy()
    EnableTriggerGroup("gaibangGive", false)
    checkWait(gaibangGive)
end
function gaibangFail()
    -- ain
    if job.last == "gaibang" then
        --     gaibangBusy()
        EnableTriggerGroup("gaibangAccept", false)
        job.name = "fangqi"
        job.last = "gaibang"
        gaibangFinish()
    else
        gaibangBusy()
    end
end
function gaibangFinish()
    nobusy = 0
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("丐帮吴长老任务：任务完成，用时:【" .. job.time.over .. "】秒。")
    EnableTriggerGroup("gaibangAccept", false)
    EnableTriggerGroup("gaibangGive", false)
    checkWait(check_food)
end

-- zhuoshe
function zhuosheTrigger()
    DeleteTriggerGroup("zhuosheAsk")
    create_trigger_t("zhuosheAsk1", "^(> )*你向陈长老打听有关", "", "zhuosheAsk")
    create_trigger_t("zhuosheAsk2", "^(> )*这里没有这个人。$", "", "zhuosheNobody")
    SetTriggerOption("zhuosheAsk1", "group", "zhuosheAsk")
    SetTriggerOption("zhuosheAsk2", "group", "zhuosheAsk")
    EnableTriggerGroup("zhuosheAsk", false)
    DeleteTriggerGroup("zhuosheAccept")
    create_trigger_t("zhuosheAccept1", "^(> )*陈长老说道：你去(\\D*)附近帮我捉条蛇回来吧！", "", "zhuosheConsider")
    create_trigger_t("zhuosheAccept2", "^(> )*陈长老说道：「你帮不了我，那你就去练功吧。以后我再找你。」", "", "zhuosheFail")
    create_trigger_t("zhuosheAccept3", "^(> )*陈长老暂时不想抓蛇，你过一会儿再来吧。", "", "zhuosheBusy")
    create_trigger_t("zhuosheAccept4", "^(> )*陈长老说道：「刚才不是让你帮我抓蛇去了吗，你怎么还不去", "", "zhuosheFangqiGo")
    create_trigger_t("zhuosheAccept5", "^(> )*陈长老说道：「什么放弃？放什么弃？", "", "check_heal")
    create_trigger_t("zhuosheAccept6", "^(> )*陈长老说道：「你手头还有其他的事吧？过一会再来吧！", "", "zhuosheBusy")
    create_trigger_t("zhuosheAccept7", "^(> )*陈长老说道：「你刚抓完蛇，还是先去休息一会吧。", "", "zhuosheFail")
    SetTriggerOption("zhuosheAccept1", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept2", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept3", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept4", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept5", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept6", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept7", "group", "zhuosheAccept")
    EnableTriggerGroup("zhuosheAccept", false)
    DeleteTriggerGroup("zhuosheFind")
    create_trigger_t("zhuosheFind1", "^(> )*突然你发现草丛中有一条蛇。", "", "zhuosheTarget")
    SetTriggerOption("zhuosheFind1", "group", "zhuosheFind")
    EnableTriggerGroup("zhuosheFind", false)
    DeleteTriggerGroup("zhuosheFight")
    create_trigger_t("zhuosheFight1", "^(> )*(\\D*)「啪」的一声倒在地上", "", "zhuosheBack")
    create_trigger_t("zhuosheFight2", "^(> )*(\\D*)缩成一团，不动了。你伸手抓了起来。", "", "zhuosheBack")
    create_trigger_t("zhuosheFight3", "^(> )*你决定跟随(\\D*)一起行动。", "", "zhuosheName")
    SetTriggerOption("zhuosheFight1", "group", "zhuosheFight")
    SetTriggerOption("zhuosheFight2", "group", "zhuosheFight")
    SetTriggerOption("zhuosheFight3", "group", "zhuosheFight")
    EnableTriggerGroup("zhuosheFight", false)
    DeleteTriggerGroup("zhuosheFinish")
    create_trigger_t("zhuosheFinish1", "^(> )*陈长老从你手里接过蛇，转身装进一个口袋里。", "", "zhuosheFinish")
    create_trigger_t("zhuosheFinish2", "^(> )*陈长老说道：「这么简单的事都办不好，你下去吧", "", "zhuosheFinish")
    SetTriggerOption("zhuosheFinish1", "group", "zhuosheFinish")
    SetTriggerOption("zhuosheFinish2", "group", "zhuosheFinish")
    EnableTriggerGroup("zhuosheFinish", false)
end
function zhuosheTriggerDel()
    DeleteTriggerGroup("zhuosheAsk")
    DeleteTriggerGroup("zhuosheAccept")
    DeleteTriggerGroup("zhuosheFind")
    DeleteTriggerGroup("zhuosheFight")
    DeleteTriggerGroup("zhuosheFinish")
end
function zhuosheNobody()
    EnableTriggerGroup("zhuosheAsk", false)
    zhuoshe()
end
function zhuoshe()
    zhuosheTrigger()
    job.name = "zhuoshe"
    prepare_neili(zhuosheGo)
end
function zhuosheGo()
    go(zhuosheStart, "丐帮", "空地")
end
function zhuosheStart()
    EnableTriggerGroup("zhuosheAsk", true)
    exe("ask chen zhanglao about job")
end
function zhuosheAsk()
    EnableTriggerGroup("zhuosheAsk", false)
    EnableTriggerGroup("zhuosheAccept", true)
end
function zhuosheBusy()
    EnableTriggerGroup("zhuosheAccept", false)
    check_bei(zhuosheBusyDazuo)
end
function zhuosheBusyDazuo()
    prepare_lianxi(zhuosheStart)
end
function zhuosheFail()
    EnableTriggerGroup("zhuosheAccept", false)
    job.last = "zhuoshe"
    check_bei(zhuosheDan)
end
function zhuosheWait()
    EnableTriggerGroup("zhuosheAccept", false)
    if job.name == "fangqi" then
        check_bei(zhuosheFangqi)
    else
        check_bei(zhuosheStart)
    end
end
function zhuosheConsider(n, l, w)
    job.time.b = os.time()
    EnableTriggerGroup("zhuosheAccept", false)
    job.last = "zhuoshe"
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        check_bei(zhuosheFangqi)
        messageShow("捉蛇任务：任务地点【" .. job.where .. "】不可到达，任务放弃。")
        return
    end
    check_bei(zhuosheFind)
    exe("丐帮捉蛇在" .. job.where)
    messageShow("捉蛇任务：开始前往【" .. job.where .. "】！")
end
function zhuosheFangqiGo()
    go(zhuosheFangqi, "丐帮", "空地")
end
function zhuosheFangqi()
    flag.idle = nil
    EnableTriggerGroup("zhuosheAsk", true)
    job.name = "fangqi"
    exe("ask chen zhanglao about 放弃")
end
function zhuosheFind()
    EnableTriggerGroup("zhuosheFind", true)
    flag.times = 1
    fight_prepare()
    go(zhuosheFindAct, job.area, job.room)
end
function zhuosheFindAct()
    EnableTriggerGroup("zhuosheFind", true)
    job.flag()
    exe("look")
    find()
    messageShow("捉蛇任务：开始寻找【" .. dest.area .. dest.room .. "】的毒蛇！")
end
function zhuosheName(n, l, w)
    job.target = Trim(w[2])
    job.killer = {}
    job.killer[job.target] = "du she"
end
function zhuosheTarget()
    dis_all()
    zhuosheFight()
end
function zhuosheFight()
    EnableTriggerGroup("zhuosheFind", false)
    EnableTriggerGroup("zhuosheFight", true)
    EnableTrigger("hpheqi1", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = "du she"
    exe("follow " .. job.id)
    killPfm(job.id)
end
function zhuosheFaint(n, l, w)
    if job.target == w[2] then
        exe("kill " .. job.id)
    end
end
function zhuosheBack(n, l, w)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    if job.target == w[2] then
        EnableTriggerGroup("zhuosheFight", false)
        EnableTriggerGroup("zhuosheFinish", true)
        DeleteTimer("perform")
        exe("halt;fu bai caodan")
        messageShowT("捉蛇任务：搞定毒蛇！任务用时:【" .. job.time.over .. "】秒。")
        return go(zhuosheReady, "丐帮", "空地")
    end
end
function zhuosheReady()
    exe("e;w")
    checkWait(zhuosheReadyWait, 2)
end
function zhuosheReadyWait()
    exe("e;w")
    checkWait(zhuosheReadyFail, 2)
end
function zhuosheReadyFail()
    exe("e;w")
    checkWait(zhuosheFangqi, 2)
end
function zhuosheFinish()
    EnableTriggerGroup("zhuosheFinish", false)
    dis_all()
    check_bei(zhuosheDan)
end
function zhuosheDan()
    exe("ask chen zhanglao about 百草丹")
    check_bei(zhuosheFudan)
end
function zhuosheFudan()
    exe("fu bai caodan")
    check_bei(zhuosheDan2)
end
function zhuosheDan2()
    exe("ask chen zhanglao about 百草丹")
    check_bei(check_heal)
end

-- thd
function thdTrigger()
    DeleteTriggerGroup("thdAsk")
    create_trigger_t("thdAsk1", "^(> )*你向黄蓉打听有关", "", "thdAsk")
    create_trigger_t("thdAsk2", "^(> )*这里没有这个人。$", "", "thdNobody")
    SetTriggerOption("thdAsk1", "group", "thdAsk")
    SetTriggerOption("thdAsk2", "group", "thdAsk")
    EnableTriggerGroup("thdAsk", false)
    DeleteTriggerGroup("thdAccept")
    create_trigger_t(
        "thdAccept1",
        "^(> )*黄蓉在你的耳边悄声说道：据说(江南|江北|西南|中原|西北|河南|河北|东北)(草寇|寨主|恶霸|山贼|土匪|飞贼|盗贼)(\\D*)正在(\\D*)捣乱",
        "",
        "thdConsider"
    )
    create_trigger_t("thdAccept2", "^(> )*黄蓉说道：「我不是告诉你了吗，有人在", "", "thdFangqi")
    create_trigger_t("thdAccept3", "^(> )*黄蓉在你的耳边悄声说道(\\D*)尤为擅长(\\D*)的功夫。", "", "thdNpc")
    create_trigger_t("thdAccept4", "^(> )*黄蓉说道：「你正忙着别的事情呢", "", "thdBusy")
    create_trigger_t("thdAccept5", "^(> )*黄蓉说道：「你刚做完(武当锄奸|惩恶扬善|大理送信)任务", "", "thdFail")
    create_trigger_t("thdAccept6", "^(> )*黄蓉说道：「现在暂时没有适合你的工作", "", "thdBusy")
    create_trigger_t("thdAccept7", "^(> )*黄蓉说道：「暂时没有任务需要做，你过一会儿再来吧", "", "thdBusy")
    create_trigger_t("thdAccept8", "^(> )*黄蓉说道：「\\D*，你太让我失望了，居然这么点活都干不好，先退下吧", "", "thdFail")
    create_trigger_t("thdAccept9", "^(> )*黄蓉说道：「\\D*，你又没在我这里领任务，瞎放弃什么呀", "", "thdFail")
    SetTriggerOption("thdAccept1", "group", "thdAccept")
    SetTriggerOption("thdAccept2", "group", "thdAccept")
    SetTriggerOption("thdAccept3", "group", "thdAccept")
    SetTriggerOption("thdAccept4", "group", "thdAccept")
    SetTriggerOption("thdAccept5", "group", "thdAccept")
    SetTriggerOption("thdAccept6", "group", "thdAccept")
    SetTriggerOption("thdAccept7", "group", "thdAccept")
    SetTriggerOption("thdAccept8", "group", "thdAccept")
    SetTriggerOption("thdAccept9", "group", "thdAccept")
    EnableTriggerGroup("thdAccept", false)
    DeleteTriggerGroup("thdFight")
    create_trigger_t("thdFight1", "^(> )*(\\D*)「啪」的一声倒在地上", "", "thdBack")
    create_trigger_t("thdFight2", "^(> )*(\\D*)大喊一声：不好！！转身几个起落就不见了", "", "thdBack")
    create_trigger_t("thdFight3", "^(> )*这里没有(\\D*)。", "", "thdLost")
    create_trigger_t("thdFight4", "^(> )*(\\D*)对着你发出一阵阴笑，说道", "", "thdKillAct")
    create_trigger_t("thdFight5", "^(> )*(\\D*)大喊一声：老子不奉陪了！转身几个起落就不见了", "", "thdBack")
    SetTriggerOption("thdFight1", "group", "thdFight")
    SetTriggerOption("thdFight2", "group", "thdFight")
    SetTriggerOption("thdFight3", "group", "thdFight")
    SetTriggerOption("thdFight4", "group", "thdFight")
    SetTriggerOption("thdFight5", "group", "thdFight")
    EnableTriggerGroup("thdFight", false)
    DeleteTriggerGroup("thdFinish")
    create_trigger_t("thdFinish1", "^(> )*黄蓉对着你竖起了右手大拇指，好样的。", "", "thdFinish")
    create_trigger_t("thdFinish2", "^(> )*黄蓉被你气得昏了过去。", "", "thdFinish")
    create_trigger_t("thdFinish3", "^(> )*黄蓉说道：「" .. score.name .. "你怎么搞的，居然让那恶贼给跑了", "", "thdFinish")
    SetTriggerOption("thdFinish1", "group", "thdFinish")
    SetTriggerOption("thdFinish2", "group", "thdFinish")
    SetTriggerOption("thdFinish3", "group", "thdFinish")
    EnableTriggerGroup("thdFinish", false)
end
function thdTriggerDel()
    DeleteTriggerGroup("thdAsk")
    DeleteTriggerGroup("thdAccept")
    DeleteTriggerGroup("thdFight")
    DeleteTriggerGroup("thdFinish")
    DeleteTriggerGroup("thdFind")
end
function thdNobody()
    EnableTriggerGroup("thdAsk", false)
    thd()
end
function thd()
    thdTrigger()
    job.name = "thd"
    job.time.b = os.time()
    prepare_lianxi(thdGo)
end
function thdGo()
    go(thdStart, "桃花岛", "内室")
end
function thdStart()
    EnableTriggerGroup("thdAsk", true)
    exe("ask song yuanqiao about job")
end
function thdAsk()
    EnableTriggerGroup("thdAsk", false)
    EnableTriggerGroup("thdAccept", true)
end

-- sldsm
function sldsmTrigger()
    DeleteTriggerGroup("sldsmAsk")
    create_trigger_t("sldsmAsk1", "^(> )*你向洪安通打听有关", "", "sldsmAsk")
    create_trigger_t("sldsmAsk2", "^(> )*这里没有这个人。$", "", "sldsmNobody")
    SetTriggerOption("sldsmAsk1", "group", "sldsmAsk")
    SetTriggerOption("sldsmAsk2", "group", "sldsmAsk")
    EnableTriggerGroup("sldsmAsk", false)
    DeleteTriggerGroup("sldsmAccept")
    create_trigger_t("sldsmAccept1", "^(> )*洪安通说道：「(\\D*)常与本教做对，你速去(\\D*)把他杀了！", "", "sldsmConsiderK")
    create_trigger_t("sldsmAccept2", "^(> )*洪安通说道：「现在令你速去(\\D*)设法让(\\D*)归顺本教！」", "", "sldsmConsiderZ")
    create_trigger_t("sldsmAccept3", "^(> )*洪安通说道：「你先把前一个任务完成再说。」", "", "sldsmFangqi")
    create_trigger_t("sldsmAccept4", "^(> )*洪安通说道：「你小子竟敢偷偷做其他门派的任务，还想在神龙教里呆下去么", "", "sldsmBusy")
    create_trigger_t("sldsmAccept5", "^(> )*洪安通说道：「你刚做完任务，先休息一下吧。」", "", "sldsmFail")
    create_trigger_t("sldsmAccept6", "^(> )*洪安通说道：「你先休息一下吧。", "", "sldsmBusy")
    create_trigger_t("sldsmAccept7", "^(> )*洪安通说道：「怎么？！你想抗命不成？！", "", "sldsmBusy")
    create_trigger_t("sldsmAccept8", "^(> )*洪安通说道：「这么点事情都办不了，要你这种无用之人何用！」", "", "sldsmBusy")
    create_trigger_t("sldsmAccept9", "^(> )*洪安通说道：「你三番五次抗命不遵，是不是不想活", "", "sldsmHeiw")
    create_trigger_t("sldsmAccept10", "^(> )*洪安通说道：「现在没有任务，你等下再来吧。」", "", "sldsmBusy")
    SetTriggerOption("sldsmAccept1", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept2", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept3", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept4", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept5", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept6", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept7", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept8", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept9", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept10", "group", "sldsmAccept")
    EnableTriggerGroup("sldsmAccept", false)
    DeleteTriggerGroup("sldsmFight")
    create_trigger_t("sldsmFight1", "^(> )*(\\D*)「啪」的一声倒在地上", "", "sldsmDie")
    create_trigger_t("sldsmFight2", "^(> )*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。", "", "sldsmFaint")
    create_trigger_t("sldsmFight3", "^(> )*这里没有(\\D*)。", "", "sldsmLost")
    create_trigger_t("sldsmFight4", "^(> )*(\\D*)跪倒在地，高呼道：洪教主神通广大，战无不胜！", "", "sldsmFlop")
    create_trigger_t("sldsmFight5", "^(> )*没有让你诱迫这个人归顺呀!", "", "sldsmZhNext")
    SetTriggerOption("sldsmFight1", "group", "sldsmFight")
    SetTriggerOption("sldsmFight2", "group", "sldsmFight")
    SetTriggerOption("sldsmFight3", "group", "sldsmFight")
    SetTriggerOption("sldsmFight4", "group", "sldsmFight")
    SetTriggerOption("sldsmFight5", "group", "sldsmFight")
    EnableTriggerGroup("sldsmFight", false)
end
function sldsmTriggerDel()
    DeleteTriggerGroup("sldsmAsk")
    DeleteTriggerGroup("sldsmAccept")
    DeleteTriggerGroup("sldsmFight")
    DeleteTriggerGroup("sldsmFind")
end
function sldsmNobody()
    EnableTriggerGroup("sldsmAsk", false)
    sldsm()
end
function sldsm()
    sldsmTrigger()
    job.name = "sldsm"
    prepare_neili(sldsmGo)
end
function sldsmGo()
    go(sldsmStart, "神龙岛", "大厅")
end
function sldsmStart()
    EnableTriggerGroup("sldsmAsk", true)
    exe("ask hong antong about job")
end
function sldsmAsk()
    EnableTriggerGroup("sldsmAsk", false)
    EnableTriggerGroup("sldsmAccept", true)
end
function sldsmBusy()
    EnableTriggerGroup("sldsmAccept", false)
    check_bei(sldsmBusyDazuo)
end
function sldsmBusyDazuo()
    if not Bag["护膝"] then
        exe("ask shou toutuo about 护膝")
    end
    prepare_lianxi(sldsmStart)
end
function sldsmFail()
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    check_heal()
end
function sldsmHeiw()
    EnableTriggerGroup("sldsmAccept", false)
end
function sldsmConsiderK(n, l, w)
    job.time.b = os.time()
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    job.target = Trim(w[2])
    job.id = nil
    job.sldtime = os.time()
    job.type = "sm"
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[3])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if string.find(sldsmCancel, job.target) then
        messageShow("神龙任务：任务目标【" .. job.target .. "】不可到达，任务放弃。")
        return check_pot(1)
    end
    if not job.room or not path_cal() then
        messageShow("神龙任务：任务地点【" .. job.where .. "】不可到达，任务放弃。")
        return check_pot(1)
    end
    check_bei(sldsmFind)
    exe("nick 神龙任务" .. job.where)
    messageShow("神龙任务：开始前往【" .. job.where .. "】索命【" .. job.target .. "】！")
end
function sldsmConsiderZ(n, l, w)
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    job.target = Trim(w[3])
    job.id = nil
    job.sldtime = os.time()
    job.type = "zh"
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if string.find(sldsmCancel, job.target) then
        messageShow("神龙任务：任务目标【" .. job.target .. "】不可到达，任务放弃。")
        return check_pot(1)
    end
    if not job.room or not path_cal() then
        messageShow("神龙任务：任务地点【" .. job.where .. "】不可到达，任务放弃。")
        return check_pot(1)
    end
    check_bei(sldsmFind)
    exe("nick 神龙任务" .. job.where)
    messageShow("神龙任务：开始前往【" .. job.where .. "】招魂【" .. job.target .. "】！")
end
function sldsmFangqiGo()
    go(sldsmFangqi, "神龙岛", "大厅")
end
function sldsmFangqi()
    EnableTriggerGroup("sldsmAccept", false)
    if job.sldtime and os.time() - job.sldtime < 600 then
        return prepare_lianxi(sldsmFangqi)
    end
    check_bei(sldsmFangqiAsk)
end
function sldsmFangqiAsk()
    EnableTriggerGroup("sldsmAsk", true)
    exe("ask hong antong about cancel")
end
function sldsmFind()
    DeleteTriggerGroup("sldsmFind")
    create_trigger_t("sldsmFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "sldsmTarget")
    SetTriggerOption("sldsmFind1", "group", "sldsmFind")
    EnableTrigger("sldsmFind1", false)
    flag.times = 1
    fight_prepare()
    go(sldsmFindAct, job.area, job.room)
end
function sldsmFindAct()
    EnableTriggerGroup("sldsmFind", true)
    job.flag()
    exe("look")
    find()
    messageShow("神龙任务：开始寻找【" .. dest.area .. dest.room .. "】的" .. "【" .. job.target .. "】！")
end
function sldsmTarget(n, l, w)
    EnableTriggerGroup("sldsmFind", false)
    EnableTriggerGroup("sldsmFight", true)
    EnableTrigger("hpheqi1", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = string.lower(w[2])
    job.killer[job.target] = job.id
    exe("halt;follow " .. job.id)
    if job.type and job.type == "zh" then
        killPfm(job.id, "zh")
    else
        killPfm(job.id)
    end
end
function sldsmZh(n, l, w, styles)
    local l_flag = false
    for _, v in ipairs(styles) do
        -- Note(v.text,RGBColourToName (v.textcolour))
        if RGBColourToName(v.textcolour) == "maroon" then
            l_flag = true
        end
    end
    if flag and job.id then
        exe("zh " .. job.id)
    end
end
function sldsmZhNext()
    job.id = job.id .. " 2"
    exe("follow " .. job.id)
end
function sldsmFaint(n, l, w)
    if job.target == w[2] then
        if job.type and job.type == "zh" then
            exe("halt")
        else
            exe("kill " .. job.id)
        end
    end
end
function sldsmDie(n, l, w)
    if job.target == w[2] then
        if job.type and job.type == "zh" then
            exe("follow " .. job.id)
        else
            check_bei(sldsmSm)
        end
    else
        if job.type and job.type == "sm" then
            exe("kill " .. job.id)
        end
    end
end
function sldsmFlop(n, l, w)
    if job.target == w[2] then
        return sldsmFinish()
    end
end
function sldsmSm()
    exe("halt")
    for i = 1, 3 do
        exe("sm corpse " .. i)
    end
    return sldsmFinish()
end
function sldsmLost(n, l, w)
    if job.id == Trim(w[2]) then
        dis_all()
        return sldsmFind()
    end
end
function sldsmFinish()
    EnableTriggerGroup("sldsmFight", false)
    DeleteTimer("perform")
    messageShow("神龙任务：任务完成！")
    return go(check_heal, "襄阳城", "药房")
end

-- tmonk
function tmonkTrigger()
    DeleteTriggerGroup("tmonkFollow")
    create_trigger_t("tmonkFollow1", "^(> )*你决定跟随玄惭大师一起行动。", "", "tmonkFollow")
    create_trigger_t("tmonkFollow2", "^(> )*这里没有 xuancan dashi。$", "", "tmonkNobody")
    SetTriggerOption("tmonkFollow1", "group", "tmonkFollow")
    SetTriggerOption("tmonkFollow2", "group", "tmonkFollow")
    EnableTriggerGroup("tmonkFollow", false)
    DeleteTriggerGroup("tmonkAsk")
    create_trigger_t("tmonkAsk1", "^(> )*你向玄惭大师打听有关", "", "tmonkAsk")
    create_trigger_t("tmonkAsk2", "^(> )*这里没有这个人。$", "", "tmonkNobody")
    SetTriggerOption("tmonkAsk1", "group", "tmonkAsk")
    SetTriggerOption("tmonkAsk2", "group", "tmonkAsk")
    EnableTriggerGroup("tmonkAsk", false)
    DeleteTriggerGroup("tmonkAccept")
    create_trigger_t("tmonkAccept1", "^(> )*玄惭大师说道：「你刚才不是已经问过了吗？", "", "tmonkStart")
    create_trigger_t("tmonkAccept2", "^(> )*玄惭大师说道：「你正在忙着做其它任务呢。", "", "tmonkBusy")
    create_trigger_t("tmonkAccept3", "^(> )*玄惭大师说道：「你刚训练武僧结束，还是先休息一会吧。", "", "tmonkFangqi")
    create_trigger_t("tmonkAccept4", "^(> )*玄惭大师说道：「你现在正忙着做其他任务呢", "", "tmonkBusy")
    create_trigger_t("tmonkAccept5", "^(> )*玄惭大师说道：「\\D*你累犯数戒，身带重罪", "", "tmonkGuilty")
    create_trigger_t("tmonkAccept6", "^(> )*玄惭说道：好吧，你就在罗汉堂里训练武僧", "", "tmonkStart")
    SetTriggerOption("tmonkAccept1", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept2", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept3", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept4", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept5", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept6", "group", "tmonkAccept")
    EnableTriggerGroup("tmonkAccept", false)
    DeleteTriggerGroup("tmonkFind")
    create_trigger_t("tmonkFind1", "^^(> )*\\D*玄惭大师\\((\\D*)\\)", "", "tmonkDashi")
    SetTriggerOption("tmonkFind1", "group", "tmonkFind")
    EnableTriggerGroup("tmonkFind", false)
    DeleteTriggerGroup("tmonkWujiAsk")
    create_trigger_t("tmonkWujiAsk1", "^(> )*你向圆(心|业|觉|慧|灭|音)和尚打听有关", "", "tmonkWujiAsk")
    create_trigger_t("tmonkWujiAsk2", "^(> )*这里没有这个人。$", "", "tmonkWujiNobody")
    SetTriggerOption("tmonkWujiAsk1", "group", "tmonkWujiAsk")
    SetTriggerOption("tmonkWujiAsk2", "group", "tmonkWujiAsk")
    EnableTriggerGroup("tmonkWujiAsk", false)
    DeleteTriggerGroup("tmonkWujiReply")
    create_trigger_t("tmonkWujiReply1", "^(> )*圆(心|业|觉|慧|灭|音)和尚说道：「这个可不能乱说。", "", "tmonkFinish")
    create_trigger_t("tmonkWujiReply2", "^(> )*圆(心|业|觉|慧|灭|音)和尚一脸神秘地", "", "tmonkWujiNobody")
    create_trigger_t("tmonkWujiReply3", "^(> )*圆(心|业|觉|慧|灭|音)和尚生气地看着你", "", "tmonkWujiNobody")
    create_trigger_t("tmonkWujiReply4", "^(> )*圆(心|业|觉|慧|灭|音)和尚说道：「小僧在学", "", "tmonkTeachStart")
    SetTriggerOption("tmonkWujiReply1", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply2", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply3", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply4", "group", "tmonkWujiReply")
    EnableTriggerGroup("tmonkWujiReply", false)
    DeleteTriggerGroup("tmonkTeach")
    create_trigger_t("tmonkTeach1", "^(> )*你还是先去跟玄惭大师打声招呼吧。", "", "tmonkFinish")
    create_trigger_t("tmonkTeach2", "^(> )*圆(心|业|觉|慧|灭|音)和尚说道：「我正由", "", "tmonkWujiNobody")
    create_trigger_t("tmonkTeach3", "^(> )*你的修为还不如我呢，还想教我？", "", "tmonkWujiKill")
    create_trigger_t("tmonkTeach4", "^(> )*圆(心|业|觉|慧|灭|音)和尚太累了，现在没有办法学。", "", "tmonkChange")
    create_trigger_t("tmonkTeach5", "^(> )*圆(心|业|觉|慧|灭|音)和尚正忙着呢。", "", "tmonkChange")
    create_trigger_t("tmonkTeach6", "^(> )*你(正忙着呢。|尽心竭力，对)", "", "tmonkContinue")
    create_trigger_t("tmonkTeach7", '^(> )*你把 "action" 设定为 "teach" 成功完成。$', "", "tmonkTeachCon")
    create_trigger_t("tmonkTeach8", "^(> )*(\\D*)在你旁边，你无法专心指点。", "", "tmonkChange")
    create_trigger_t("tmonkTeach9", "^(> )*圆(心|业|觉|慧|灭|音)和尚神情振奋，一声大叫向(\\D*)奔去", "", "tmonkMotou")
    SetTriggerOption("tmonkTeach1", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach2", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach3", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach4", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach5", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach6", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach7", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach8", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach9", "group", "tmonkTeach")
    EnableTriggerGroup("tmonkTeach", false)
    DeleteTriggerGroup("tmonkMotouFind")
    create_trigger_t("tmonkMotouFind1", "^^(> )*邪道魔头高举右拳，对着你", "", "tmonkMotouKill")
    SetTriggerOption("tmonkMotouFind1", "group", "tmonkMotouFind")
    EnableTriggerGroup("tmonkMotouFind", false)
    DeleteTriggerGroup("tmonkFight")
    create_trigger_t("tmonkFight1", "^(> )*邪道魔头「啪」的一声倒在地上", "", "tmonkDie")
    create_trigger_t("tmonkFight2", "^(> )*邪道魔头神志迷糊，脚下一个不稳，倒在地上昏了过去。", "", "tmonkFaint")
    SetTriggerOption("tmonkFight1", "group", "tmonkFight")
    SetTriggerOption("tmonkFight2", "group", "tmonkFight")
    EnableTriggerGroup("tmonkFight", false)
end
function tmonkTriggerDel()
    DeleteTriggerGroup("tmonkFollow")
    DeleteTriggerGroup("tmonkAsk")
    DeleteTriggerGroup("tmonkAccept")
    DeleteTriggerGroup("tmonkFight")
    DeleteTriggerGroup("tmonkFind")
    DeleteTriggerGroup("tmonkWujiAsk")
    DeleteTriggerGroup("tmonkWujiReply")
    DeleteTriggerGroup("tmonkTeach")
    DeleteTriggerGroup("tmonkMotouFind")
end
job.list["tmonk"] = "少林教和尚"
function tmonk()
    job.name = "tmonk"
    tm = tm or {}
    tmroom = {}
    tmroom["shaolin/wstang1"] = true
    tmroom["shaolin/wstang2"] = true
    tmroom["shaolin/wstang3"] = true
    tmroom["shaolin/wstang4"] = true
    tmroom["shaolin/wstang5"] = true
    tmroom["shaolin/wstang6"] = true
    for p in pairs(tm) do
        tmroom[p] = nil
    end
    tmonkTrigger()
    messageShow("Tmonk任务：任务开始。", "green")
    job.findAgain = tmonkFindAgain
    return prepare_neili(tmonkGuilty)
end
function tmonkFindAgain()
    EnableTriggerGroup("tmonkFind", false)
    EnableTriggerGroup("tmonkMotouFind", false)
    return go(find, dest.area, dest.room)
end
function tmonkGo()
    return go(tmonkXuancan, "嵩山少林", "演武堂")
end
function tmonkXuancan()
    EnableTriggerGroup("tmonkFind", true)
    job.flag()
    return find()
end
function tmonkDashi()
    flag.find = 1
    dis_all()
    EnableTriggerGroup("tmonkFind", false)
    EnableTriggerGroup("tmonkFollow", true)
    exe("follow xuancan dashi")
end
function tmonkNobody()
    EnableTriggerGroup("tmonkFollow", false)
    EnableTriggerGroup("tmonkAsk", false)
    return go(tmonkXuancan, "嵩山少林", "演武堂")
end
function tmonkFollow()
    EnableTriggerGroup("tmonkFollow", false)
    EnableTriggerGroup("tmonkAsk", true)
    exe("ask xuancan dashi about 罗汉堂值勤")
end
function tmonkAsk()
    EnableTriggerGroup("tmonkAsk", false)
    EnableTriggerGroup("tmonkAccept", true)
    exe("follow none")
end
function tmonkGuilty()
    EnableTriggerGroup("tmonkAccept", false)
    if
        score.party and score.party == "少林派" and score.master == "无名老僧" and skills["buddhism"] and
            skills["buddhism"].lvl == 200
     then
        return go(tmonkFofa, "嵩山少林", "里屋")
    end
    return go(tmonkCh, "嵩山少林", "戒律院")
end
function tmonkFofa()
    exe("ask wuming about 佛法")
    return tmonkGo()
end
function tmonkCh()
    checkWait(tmonkGo, 2)
end
function tmonkFangqi()
    EnableTriggerGroup("tmonkAccept", false)
    job.last = "tmonk"
    return check_heal()
end
function tmonkBusy()
    EnableTriggerGroup("tmonkAccept", false)
    return prepare_lianxi(tmonk)
end
function tmonkStart()
    EnableTriggerGroup("tmonkAccept", false)
    job.last = "tmonk"
    if countTab(tm) > 0 then
        local l_id
        for p in pairs(tm) do
            l_id = p
        end
        return go(tmonkWuji, l_id)
    else
        return go(tmonkWuji, "shaolin/wstang1")
    end
end
function tmonkWuji()
    EnableTriggerGroup("tmonkWujiAsk", true)
    exe("ask monk about 武技")
end
function tmonkWujiAsk()
    EnableTriggerGroup("tmonkWujiAsk", false)
    EnableTriggerGroup("tmonkWujiReply", true)
end
function tmonkWujiNobody()
    EnableTriggerGroup("tmonkWujiReply", false)
    EnableTriggerGroup("tmonkWujiAsk", false)
    EnableTriggerGroup("tmonkTeach", false)
    tm[road.id] = nil
    tmroom[road.id] = nil
    return check_bei(tmonkWujiFind)
end
function tmonkWujiFind()
    if countTab(tmroom) == 0 then
        if countTab(tm) == 0 then
            return tmonkFinish()
        else
            return tmonkStart()
        end
    else
        local l_id
        for p in pairs(tmroom) do
            l_id = p
        end
        return go(tmonkWuji, l_id)
    end
end
function tmonkChange()
    tmchg = true
end
function tmonkChgMonk()
    EnableTriggerGroup("tmonkTeach", false)
    if countTab(tm) > 1 then
        local l_id
        for p in pairs(tm) do
            if p ~= road.id then
                l_id = p
            end
        end
        if l_id then
            return go(tmonkTeach, l_id)
        else
            return tmonkWujiFind()
        end
    else
        if countTab(tmroom) == 0 then
            return check_bei(tmonkTeach)
        else
            return tmonkWujiFind()
        end
    end
end
function tmonkTeachStart()
    EnableTriggerGroup("tmonkWujiReply", false)
    tm[road.id] = true
    tmroom[road.id] = nil
    return check_bei(tmonkTeach)
end
function tmonkTeach()
    EnableTriggerGroup("tmonkTeach", true)
    tmcon = nil
    tmchg = nil
    exe("yun jing;#2(teach monk)")
    exe("alias action teach")
end
function tmonkTeachCon()
    EnableTriggerGroup("tmonkTeach", false)
    if tmchg then
        return tmonkChgMonk()
    end
    if tmcon then
        return check_bei(tmonkTeach)
    else
        return tmonkWujiNobody()
    end
end
function tmonkContinue()
    tmcon = true
end
function tmonkWujiKill()
    EnableTriggerGroup("tmonkTeach", false)
    return wipe("monk", tmonkWujiNobody)
end
function tmonkMotou(n, l, w)
    EnableTriggerGroup("tmonkTeach", false)
    dest.room = Trim(w[3])
    dest.area = "嵩山少林"
    road.idold = road.id
    if not dest.room or not path_cal() then
        messageShow("Teach任务：魔头出现地点【" .. dest.area .. dest.room .. "】不可到达，放弃MONK!")
        road.id = road.idold
        return tmonkWujiNobody()
    else
        messageShow("Tmonk任务：邪道魔头出现在" .. dest.room .. "。", "green")
        return tmonkMotouFind()
    end
end
function tmonkMotouFind()
    EnableTriggerGroup("tmonkMotouFind", true)
    return go(find, dest.area, dest.room)
end
function tmonkMotouKill()
    flag.find = 1
    dis_all()
    EnableTrigger("hpheqi1", true)
    EnableTriggerGroup("tmonkFight", true)
    exe("set wimpy 100")
    exe("kill mo tou")
    job.killer["邪道魔头"] = "mo tou"
end
function tmonkFaint()
    exe("unset wimpy")
    exe("kill mo tou")
end
function tmonkDie()
    EnableTriggerGroup("tmonkFight", false)
    messageShow("Tmonk任务：搞定邪道魔头。", "green")
    return check_bei(tmonkGet)
end
function tmonkGet()
    for i = 1, 3 do
    end
    checkBags()
    return check_busy(tmonkMuou)
end
function tmonkMuou()
    if Bag["十八木偶"] then
        messageShow("Tmonk任务：运气很好，搞到十八木偶。", "green")
        return go(tmonkMuouGive, "嵩山少林", "方丈室")
    else
        return tmonkStart()
    end
end
function tmonkMuouGive()
    exe("give muou to xuanci dashi")
    return tmonkStart()
end
function tmonkFinish()
    messageShow("Tmonk任务：任务完成。", "green")
    return check_heal()
end

function zhunbeineili(func, p_cmd)
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end
    if hp.neili >= hp.neili_max * 1.5 then
        return check_bei(job.prepare)
    end

    DeleteTriggerGroup("zbneili")
    create_trigger_t(
        "zbneili1",
        "^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",
        "",
        "zhunbeineili_b"
    )
    create_trigger_t("zbneili3", "^(> )*卧室不能(吐纳|打坐)，会影响别人休息。", "", "zbneili_w")
    create_trigger_t("zbneili4", "^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)", "", "zbneili_w")
    create_trigger_t("zbneili5", "^(> )*这里不准战斗，也不准(吐纳|打坐)。", "", "zbneili_w")
    create_trigger_t("zbneili2", "^(> )*这里可不是让你提高(内力|精力)的地方。", "", "zbneili_w")
    SetTriggerOption("zbneili1", "group", "zbneili")
    SetTriggerOption("zbneili2", "group", "zbneili")
    SetTriggerOption("zbneili3", "group", "zbneili")
    SetTriggerOption("zbneili4", "group", "zbneili")
    SetTriggerOption("zbneili5", "group", "zbneili")
    exe("yun jing;yun jingli;yun qi;hp")
    zhunbeineili_a()
end
zbneili_w = function()
    locate()
    check_bei(zbneili_g)
end
zbneili_g = function()
    exe(locl.dir)
    checkWait(zhunbeineili_a, 1)
end
zhunbeineili_a = function()
    if hp.qixue_per < 50 and isInBags(drug.heal) then
        exe("eat chantui yao")
    end
    exe("set 积蓄")
    exe("dazuo " .. hp.dazuo)
end
zhunbeineili_b = function()
    if mydummy == true then
        EnableTriggerGroup("zbneili", false)
        DeleteTriggerGroup("zbneili")
        return dummyfind()
    end
    exe("yun qi;hp")
    check_bei(zhunbeineili_c)
end
zhunbeineili_c = function()
    if hp.neili >= hp.neili_max * 1.5 then
        EnableTriggerGroup("zbneili", false)
        DeleteTriggerGroup("zbneili")
        exe("yun jing;yun qi;yun jingli")
        check_bei(job.prepare)
    else
        zhunbeineili_a()
    end
end

function pfmjineng()
    -- print(sxjob.skills)
    if skillsjineng1[sxjob.skills] then
        exe("pfmzhen")
    end
    if skillsjineng2[sxjob.skills] then
        exe("pfmqi")
    end
    if skillsjineng3[sxjob.skills] then
        exe("pfmgang")
    end
    if skillsjineng4[sxjob.skills] then
        exe("pfmrou")
    end
    if skillsjineng5[sxjob.skills] then
        exe("pfmkuai")
    end
    if skillsjineng6[sxjob.skills] then
        exe("pfmman")
    end
    if skillsjineng7[sxjob.skills] then
        exe("pfmmiao")
    end
    if skillsjineng8[sxjob.skills] then
        exe("pfmxian")
    end
    if skillsjineng9[sxjob.skills] then
        exe("pfmmrjf")
    end
    if skillsjineng10[sxjob.skills] then
        exe("pfmshlf")
    end
    if skillsjineng11[sxjob.skills] then
        exe("pfmwu")
    end
end

function messageShow(p_msg, ccolor, bcolor)
    local c_color = ccolor or "white"
    local b_color = bcolor or "green"

    if isNil(p_msg) then
        return
    end

    if GetVariable("flagnote") then
        flag.note = tonumber(GetVariable("flagnote"))
    end
    if flag.note and flag.note == 1 then
        if flag.log and flag.log == "yes" then
            chats_log(p_msg, c_color, b_color)
        else
            ColourNote("white", "black", p_msg)
        end
    else
        chats_log(p_msg, c_color, b_color)
    end
end
function messageShowT(p_msg, ccolor, bcolor)
    local c_color = ccolor or "yellow"
    local b_color = bcolor or "green"

    if isNil(p_msg) then
        return
    end

    chats_log(p_msg, c_color, b_color)
end

function setJobwhere(p)
    job.where = p
end

function scrLog()
    local filename = GetInfo(67) .. "logs\\" .. score.id .. "发呆" .. os.date("%Y%m%d_%H时%M分%S秒") .. ".log"

    local file = io.open(filename, "w")

    local t = {}

    for i = 1, GetLinesInBufferCount() do
        table.insert(t, GetLineInfo(i, 1))
    end

    local s = table.concat(t, "\n") .. "\n"

    file:write(s)

    file:close()
end
function dieLog()
    local filename = GetInfo(67) .. "logs\\" .. score.id .. "死亡" .. os.date("%Y%m%d_%H时%M分%S秒") .. ".log"

    local file = io.open(filename, "w")

    local t = {}

    for i = 1, GetLinesInBufferCount() do
        table.insert(t, GetLineInfo(i, 1))
    end

    local s = table.concat(t, "\n") .. "\n"

    file:write(s)

    file:close()
end

-- ---------------------------------------------------------------
-- job切换具体实现方法 -- 基础实现
-- ---------------------------------------------------------------
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
    if
        countTab(job.zuhe) > 2 and not skills["xixing-dafa"] and job.zuhe["huashan"] and job.zuhe["wudang"] and
            jobtimes["华山岳不群惩恶扬善"] and
            jobtimes["武当宋远桥杀恶贼"]
     then
        local t_hs = jobtimes["华山岳不群惩恶扬善"]
        local t_wd = jobtimes["武当宋远桥杀恶贼"]
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
    if
        score.party and score.party == "华山派" and countTab(job.zuhe) > 2 and not skills["dugu-jiujian"] and
            job.zuhe["huashan"] and
            job.zuhe["songxin"]
     then
        local t_hs, t_sx, t_gb

        if jobtimes["华山岳不群惩恶扬善"] then
            t_hs = jobtimes["华山岳不群惩恶扬善"]
        else
            t_hs = 0
        end
        if jobtimes["大理王府送信任务"] then
            t_sx = jobtimes["大理王府送信任务"]
        else
            t_sx = 0
        end
        if jobtimes["丐帮吴长老杀人任务"] then
            t_gb = jobtimes["丐帮吴长老杀人任务"]
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
            if job.third == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
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
        if job.first == "xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.first]()
        end
        if job.first == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
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
        if job.second == "xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.second]()
        end
        if job.second == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
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
    if job.zuhe["wudang"] and job.last ~= "wudang" then
        return wudang()
    end
    if job.zuhe["songxin"] and job.last ~= "songxin" then
        return songxin()
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
-- ---------------------------------------------------------------
-- 任务统计 任务数自增1
-- ---------------------------------------------------------------
function job.statistics_JobTimePlus()
    job.statistics.Times = job.statistics.Times + 1
    job.statistics_Update()
end
-- ---------------------------------------------------------------
-- job切换具体实现方法
-- ---------------------------------------------------------------
function job.Switch()

    -- ---------------------------------------------------------------
    -- 强制练习模式
    -- ---------------------------------------------------------------
    if GetRoleConfig("PracticeForce") == true then
        exe("yun jing;yun qi;yun jingli;")
        return check_food(true)
    end


    -- ---------------------------------------------------------------
    -- 公共任务, 限次数
    -- ---------------------------------------------------------------

    -- 自动领取会员福利
    if Vip.CheckGetBenefit() then
        return Vip.GetBenefit()
    end

    -- 自动 蝶梦楼
    if dml_CheckAutoDML() then
        return dml_AutoStart()
    end

    -- 自动 论坛收矿
    Miner.AutoMine()

    -- 自动 10次洪七公作菜
    if CheckAutohqgzc() then
        return hqgzc()
    end

    -- ---------------------------------------------------------------
    -- 新手任务部分先判断
    -- ---------------------------------------------------------------
    if xcexp == 0 and hp.exp < 1000000 then
        print("巡城到1M")
        kdummy = 0
        return xunCheng()
    end
    if xcexp == 1 and hp.exp < 2000000 then
        print("巡城到2M")
        kdummy = 0
        return xunCheng()
    end
    if score.party == "桃花岛" and (hp.shen > 150000 or hp.shen < -150000) then
        return thdJiaohui()
    end
    -- ---------------------------------------------------------------
    -- 成长阶段任务
    -- ---------------------------------------------------------------
    -- 任务组计数, 用于节省每次任务结束的判断, 一些判断改为每个任务组(10次)进行一次检查
    job.group.times = job.group.times + 1

    for p in pairs(weaponUsave) do
        if Bag and not Bag[p] then
            job.zuhe["songmoya"] = nil
        end
    end
    if fqyytmp.goArmorD == 1 then
        return fqyyArmorGoCheck()
    end
    if job.zuhe == nil then
        job.zuhe = {}
    end
    if job.zuhe["zhuoshe"] and score.party ~= "丐帮" then
        job.zuhe["zhuoshe"] = nil
    end
    if job.zuhe["sldsm"] and score.party ~= "神龙教" then
        job.zuhe["sldsm"] = nil
    end
    if job.zuhe["songmoya"] and hp.exp < 5000000 then
        job.zuhe["songmoya"] = nil
    end
    if smydie * 1 >= smyall * 1 then
        job.zuhe["songmoya"] = nil
    end
    if job.zuhe["husong"] and (score.party ~= "少林派" or hp.exp < 2000000) then
        job.zuhe["husong"] = nil
    end
    if job.zuhe["songmoya"] and job.last ~= "songmoya" and mytime <= os.time() then
        return songmoya()
    end
    if job.zuhe["hubiao"] and job.last ~= "hubiao" and job.teamname and
            ((not condition.hubiao) or (condition.hubiao and condition.hubiao <= 0))
     then
        return hubiao()
    elseif job.zuhe["husong"] then
        return husong()
    else
        return checkJob()
    end
end
