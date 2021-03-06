--
-- literate.lua
--
-- ----------------------------------------------------------
-- 含 literate 所有function 集合
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
-- 最大学习次数
local learntime_max = 50
-- 最小学习次数
local learnTime_min = 10

function literate()
    exe("nick 学习读书写字;i;")
    quest.name = "学习读书写字"
    quest.status = ""
    quest.target = ""
    quest.location = "扬州城书院"
    quest:update()
    messageShow("学习读书写字！")
    DeleteTemporaryTriggers()
    if hp.exp < 151000 then
        master.times = 5
    else
        master.times = math.modf(hp.jingxue / 120)
        master.times = common.GetValueByRange(master.times, learnTime_min, learntime_max)
    end
    return check_busy(literateGo)
end

function literateGo()
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)
    go(literateCheck, "扬州城", "书院")
end

function literateCheck()
    DeleteTriggerGroup("litxuexi")
    create_trigger_t("litxuexi1", "^(> )*顾炎武对着你端详了一番道：“你因经验所制，暂时无法再进修更高深的学问了。”", "", "litxuexiover")
    SetTriggerOption("litxuexi1", "group", "litxuexi")
    EnableTriggerGroup("litxuexi", true)
    flag.idle = nil
    exe("hp")
    return checkWait(literateXue, 0.8)
end

function litxuexiover()
    DeleteTriggerGroup("litxuexi")
    dis_all()
    return check_halt(literateBack)
end

function literateXue()
    if not locl.id["顾炎武"] then
        return literateBack()
    end
    if hp.neili < 100 then
        if hqd_cur > 0 then
            exe('eat huangqi dan')
        elseif hp.exp < 800000 then
            return xuexi()
        else
            return literateBack()
        end
    end
    if hp.neili < 1000 then
        exe("eat " .. drug.neili2)
    end
    if hp.pot > master.times - 1 then
        yunAddInt()
        exe("yun jing;xue gu literate " .. master.times)
        return check_busy(literateCheck)
    elseif hp.pot < master.times then
        return literateBack()
    else
        return literateBack()
    end
end

function literateBack()
    messageShow("读书写字学习完毕！")
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("unwield " .. leweapon)
    exe("hp;score;cha;yun jing;yun qi;yun jingli")
    dis_all()
    return check_busy(check_food)
end
