--
-- gag.lua
--
-- ----------------------------------------------------------
-- 用于处理 一些垃圾信息, 避免垃圾信息刷屏,而找不到关键信息
-- 临时隐藏无效的垃圾的文字信息的触发器

-- ----------------------------------------------------------
--
--[[

eg.

require "gag"


--]]

gag = { }

function gag.Activate()
    DeleteTriggerGroup("Ignore_commonInfo")
    commonInfo_Ignore()

    DeleteTriggerGroup("Ignore_foodInfo")
    foodInfo_Ignore()

    DeleteTriggerGroup("Ignore_fightInfo")
    fightInfo_Ignore()

    DeleteTriggerGroup("Ignore_huashan")
    huashan_Ignore()

    DeleteTriggerGroup("Ignore_wudang")
    wudang_Ignore()

	DeleteTriggerGroup("Ignore_songxin")
	songxin_Ignore()
end

-- 常用信息过滤
function commonInfo_Ignore()
    local TempTimeHideTriggerList =
    {
        "^书剑已经执行了.*",
        "^(> )*\\s*悉尼时间是 星期.*",
        "^(> )*\\s*奥克兰、惠灵顿时间是 星期.*",
        "^(> )*\\s*温哥华、洛杉矶时间是 星期.*",
        "^(> )*\\s*多伦多、纽约时间是 星期(.*)",
        "^(> )*\\s*柏林、罗马、巴黎时间是 星期(.*)",
        "^(> )*\\s*江面上远远传来一声：“等等啊，这就来了～～～”",
        "^(> )*\\s*岸边一只渡船上的老艄公说道：正等着你呢，上来吧。",
        "((?!你).+)吸了口气，一声“船家”，声音中正平和地远远传了出去。",
        "((?!你).+)紧了紧随身物品，紧跟着长袖飘飘，飞身跃渡(.+)！",
        "^(> )*\\s*只见(.+)长袖飘飘从对岸跃来，姿态潇洒地落在岸边。",
        "((?!你).+)面露娇羞之色，悄悄的低下头去。",
        "^$",
        "^(> )*\\s*$",
    }
    for i = 1, #TempTimeHideTriggerList do
        Fun_AddTriggerHide("trigger_common_temp_hd_" .. i, TempTimeHideTriggerList[i], "Ignore_commonInfo", "")
    end
    EnableGroup("Ignore_commonInfo", true)
end

-- 饮食相关信息过滤
function foodInfo_Ignore()
    local TempTimeHideTriggerList =
    {
        "((?!你).+)拿起大碗茶咕噜噜地喝了几口茶水。",
        "((?!你).+)盯着地上的(.*)，咽了一口唾沫。",
        "((?!你).+)将剩下的(.*)吃得干干净净。",
        "((?!你).+)拿起(.*)咬了几口。",
        "((?!你).+)渴得眼冒金星，全身无力。",
    }
    for i = 1, #TempTimeHideTriggerList do
        Fun_AddTriggerHide("trigger_food_temp_hd_" .. i, TempTimeHideTriggerList[i], "Ignore_foodInfo", "")
    end
    EnableGroup("Ignore_foodInfo", true)
end

-- 战斗信息过滤
function fightInfo_Ignore()
    local TempTimeHideTriggerList =
    {
        "((?!你).+)往(.+)面的(.+)离开。",
        "^(> )*\\s*(.*)的尸体开始腐烂了，发出一股难闻的恶臭。",
        "((?!你).+)「唰」的一声抽出一(.*)握在手中。",
        "((?!你).+)将手中的(.*)插回(.*)。",
        "((?!你).+)将(.+)脱了下来。",
        "((?!你).+)把(.+)从身上脱了下来。",
        "((?!你).+)卸除(.+)的装备。",
        "((?!你).+)(穿|戴|装备)上一(件|双|副|个).+",
        "^(> )*\\s*‘哗’的一声，眼前金光一闪，((?!你).*)披上一件(.*)",
        "((?!你).+)拔剑长吟道：“十年磨一剑，霜寒未曾试。今日把问君，谁有不平事？”",
        "((?!你).+)手中剑势一收，衣袖飞舞婷婷而立。",
        "((?!你).+)长长地舒了一口气。",
        "((?!你).+)深深吸了几口气，脸色看起来好多了。",
        "((?!你).+)正在专心练习(.*)。",
        "((?!你).+)将手中的(.*)一弹，电光闪耀中，已不见了(.*)的踪迹。",
        "((?!你).+)将手一挥，(.*)从身后飞出，电光一闪，已经握在了(.*)手中。",
        "((?!你).+)将(.*)随手一扔，只见(.*)突然变得火红，化做无数的火星四散飘走了！",
        "((?!你).+)将手在风中一挥，无数的火星从四方飞来，渐渐聚在一起～～～一(.*)已经出现在(.+)手中！",
    }
    for i = 1, #TempTimeHideTriggerList do
        Fun_AddTriggerHide("trigger_fight_temp_hd_" .. i, TempTimeHideTriggerList[i], "Ignore_fightInfo", "")
    end
    EnableGroup("Ignore_fightInfo", true)
end

-- 华山任务信息过滤
function huashan_Ignore()
    local TempMsgHideTriggerList =
    {
        "^(> )*岳不群说道：「还望.*多加努力，日后必有重谢。」",
        "^(> )*岳不群对着.*点了点头。",
        "^(> )*岳不群给了((?!你).*)一块令牌。",
        "((?!你).+)向岳不群打听有关『job』的消息。",
        "((?!你).+)向岳不群打听有关『惩恶扬善』的消息。",
        "((?!你).+)向岳不群打听有关『失败』的消息。",
        "((?!你).+)给岳不群一块令牌。",
        "((?!你).+)向岳灵珊打听有关『力不从心』的消息。",
        "((?!你).+)给岳灵珊一具(.+)的尸体。",
        "^(> )*岳不群说道：「听说现在华山附近经常出现一些恶贼，骚扰百姓，你去巡视一下，遇到恶人不可手软。」",
        "^(> )*岳不群对着.*竖起了右手大拇指，好样的。",
        "^(> )*岳灵珊说道：「我华山派不喜滥杀，(.*)下次不可如此好勇斗狠了。」",
        "^(> )*岳灵珊说道：「等一会仪式结束，你就可以去师傅那里复命了。」",
        "^(> )*(.*)往外面的玉女祠离开。",
        "^(> )*(.*)给岳灵珊一颗.*的首级。",
    }
    for i = 1, #TempMsgHideTriggerList do
        Fun_AddTriggerHide("trigger_huashanJob_temp_hd_" .. i, TempMsgHideTriggerList[i], "Ignore_huashan", "")
    end
    EnableGroup("Ignore_huashan", true)
end

-- 武当任务信息过滤
function wudang_Ignore()
    local TempMsgHideTriggerList =
    {
        "^(> )*宋远桥说道：「很好，祝贺你完成了任务，下去休息休息吧！」",
        "((?!你).+)向宋远桥打听有关『(.*)』的消息。",
        "^(> )*宋远桥对着.*竖起了右手大拇指，好样的。",
        "^(> )*宋远桥在((?!你).+)耳边小声地说了些话。",
        "^(> )*宋远桥对着.*点了点头。",
        "^(> )*宋远桥说道：「(.*)，这个任务确实比较难完成，下次给你简单的，先退下吧！」",
    }
    for i = 1, #TempMsgHideTriggerList do
        Fun_AddTriggerHide("trigger_wudangJob_temp_hd_" .. i, TempMsgHideTriggerList[i], "Ignore_wudang", "")
    end
    EnableGroup("Ignore_wudang", true)
end

-- 送信任务垃圾信息过滤
function songxin_Ignore()
    local TempMsgHideTriggerList =
    {
		"^(> )*褚万里交给(.+)一封密函。",
		"^(> )*褚万里开始认真考虑这个问题。",
		"^(> )*褚万里说道：「路上常有强人出没，务必小心。」",
        "((?!你).+)向褚万里打听有关『(.*)』的消息。"
    }
    for i = 1, #TempMsgHideTriggerList do
        Fun_AddTriggerHide("trigger_songxinJob_temp_hd_" .. i, TempMsgHideTriggerList[i], "Ignore_songxin", "")
    end
    EnableGroup("Ignore_songxin", true)
end
