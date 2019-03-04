-----
-- murong.lua
--
-- ----------------------------------------------------------
-- 慕容门派自有
-- ----------------------------------------------------------
--
--[[

eg.

--]]


function dzxy_trigger()
    DeleteTriggerGroup("dzxy")
    create_trigger_t("dzxy1", "^>*\\s*你仰首望天，太阳挂在天空中，白云朵朵，阳光顺着云层的边缘洒下来，你觉得有些刺眼。", "", "dzxy_finish")
    create_trigger_t(
    "dzxy2",
    "^>*\\s*你仰首望天，天上繁星点点，你体会出了星斗的移动与你所学的“斗转星移”有莫大的联系，却苦于实战经验不足，无法将你看到的东西与实际作战联系到一起。",
    "",
    "dzxy_finish"
    )
    create_trigger_t("dzxy3", '^>*\\s*你把 "action" 设定为 "慕容斗转星移" 成功完成。', "", "dzxy_goon")
    create_trigger_t("dzxy4", "^>*\\s*你的内力不够。", "", "dzxy_finish")
    create_trigger_t("dzxy5", "^>*\\s*先从木桩上跳下来\\(down\\)再说吧！", "", "dzxy_finish")
    create_trigger_t("dzxy6", "^>*\\s*恭喜恭喜！你已经融会贯通了斗转星移的绝妙之处！", "", "dzxy_finish")
    create_trigger_t("dzxy7", "^>*\\s*你已经没有潜能来领悟学习斗转星移了。", "", "dzxy_finish")

    create_trigger_t("dzxy8", "^>*\\s*你仰首望天，天上繁星点点，你顺着银河的方向看去，却发现部分的夜空被周围的树冠挡住了。", "", "dzxy_goon")
    SetTriggerOption("dzxy1", "group", "dzxy")
    SetTriggerOption("dzxy2", "group", "dzxy")
    SetTriggerOption("dzxy3", "group", "dzxy")
    SetTriggerOption("dzxy4", "group", "dzxy")
    SetTriggerOption("dzxy5", "group", "dzxy")
    SetTriggerOption("dzxy6", "group", "dzxy")
    SetTriggerOption("dzxy7", "group", "dzxy")
    SetTriggerOption("dzxy8", "group", "dzxy")
    EnableTriggerGroup("dzxy", false)
    DeleteTimer("mr_dzxy_timer")
    -- create_timer_m('mr_dzxy_timer',4,'dzxy_finish')
end

function checkdzxy()
    dis_all()
    tmp = { }
    -- jobTriggerDel()
    job.name = "heal"
    if skills["douzhuan-xingyi"] ~= nil then
        if skills["douzhuan-xingyi"].lvl > 130 and skills["douzhuan-xingyi"].lvl < 170 then
            dzxy_level = 1
            -- 慕容复开始(#3 w;jump liang;lingwu zihua)，可以到171级。
            return dzxy()
        end
        if skills["douzhuan-xingyi"].lvl > 170 and skills["douzhuan-xingyi"].lvl < 200 then
            dzxy_level = 2
            -- 还施水阁 去:sit chair;zhuan;n;lingwu miji 回:s;push shujia，可以到201级。
            return dzxy()
        end
        if
            skills["douzhuan-xingyi"].lvl > 200 and skills["douzhuan-xingyi"].lvl < hp.pot_max - 100 and
            (locl.time == "戊" or locl.time == "亥" or locl.time == "子" or locl.time == "丑")
        then
            dzxy_level = 3
            -- 观星台 上去jump zhuang;look sky，下来jump down。只能晚上look sky。可以到N级。
            return dzxy()
        end
        messageShow("任务监控：慕容领悟斗转星移条件不够！继续任务！", "white")
        print("dzxy_level:" .. dzxy_level)
    end

    return go(xueshan_finish_ask, "大雪山", "入幽口")
end
function open_dzxy_timer()
    return create_timer_m("mr_dzxy_timer", 4, "dzxy_finish")
end
function dzxy()
    DeleteTemporaryTriggers()
    dzxy_trigger()

    if dzxy_level == 1 then
        return check_busy(dzxy1_go)
    end
    if dzxy_level == 2 then
        return check_busy(dzxy2_go)
    end
    if dzxy_level == 3 then
        return check_busy(dzxy3_go)
    end
end
function dzxy1_go()
    exe("nick 燕子坞碧水厅领悟")
    messageShow("任务监控：去慕容领悟字画去了！", "white")
    go(dzxy1_unwield, "燕子坞", "碧水厅")
end
function dzxy2_go()
    exe("nick 燕子坞还施水阁领悟")
    messageShow("任务监控：去慕容领悟秘籍去了！", "white")
    go(dzxy2_unwield, "燕子坞", "还施水阁")
end
function dzxy3_go()
    exe("nick 燕子坞观星台领悟")
    messageShow("任务监控：去慕容看星星去了！", "white")
    go(dzxy3_unwield, "燕子坞", "观星台")
end
function dzxy1_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    exe("jump liang")
    return check_busy(dzxy_goon)
end
function dzxy2_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    return check_busy(dzxy_goon)
end
function dzxy3_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    exe("jump zhuang")
    return check_busy(dzxy_goon)
end

function dzxy_goon()
    -- EnableTimer('mr_dzxy_timer',true)
    if not(locl.room == "观星台" or locl.room == "还施水阁" or locl.room == "梁上") then
        messageShow("慕容领悟：斗转星移的位置不对！当前位置：" .. locl.room)
        return dzxy_finish()
    end
    EnableTriggerGroup("dzxy", true)
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)

    if
        not skills["douzhuan-xingyi"] or skills["douzhuan-xingyi"].lvl == 0 or
        skills["douzhuan-xingyi"].lvl >= hp.pot_max - 100
    then
        messageShow("慕容领悟：斗转星移的等级不对！当前等级：" .. skills["douzhuan-xingyi"].lvl)
        return check_busy(dzxy_finish)
    end
    if flag.idle > 7 then
        return check_busy(dzxy_finish)
    end
    if hp.neili < hp.neili_max * 0.5 then
        messageShow("慕容领悟：斗转星移的内力不够！当前内力【" .. hp.neili .. "】", "white")
        return check_busy(dzxy_finish)
    else
        if dzxy_level == 1 then
            exe("hp;yun jing;#10(lingwu zihua)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
        if dzxy_level == 2 then
            exe("hp;yun jing;#10(lingwu miji)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
        if dzxy_level == 3 then
            exe("hp;yun jing;#7(look sky)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
    end
end
function dzxy_alias()
    exe("alias action 慕容斗转星移")
end

function dzxy_finish()
    EnableTimer("mr_dzxy_timer", false)
    DeleteTimer("mr_dzxy_timer")
    messageShow("任务监控：慕容斗转星移完成！")
    exe("jump down")
    EnableTriggerGroup("dzxy", false)
    DeleteTriggerGroup("dzxy")
    exe("cha;hp")
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("unwield " .. leweapon)
    exe("jump down")
    return go(xueshan_finish_ask, "大雪山", "入幽口")
end