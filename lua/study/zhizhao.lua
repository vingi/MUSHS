--
-- zhizhao.lua
--
-- ----------------------------------------------------------
-- 含 zhizhao织造 所有function 集合
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
function zhizao()
    exe("nick 学习织造")
    DeleteTemporaryTriggers()
    if hp.exp < 151000 then
        master.times = 3
    else
        master.times = math.modf(hp.jingxue / 120)
        if master.times > 50 then
            master.times = 50
        end
    end
    return check_busy(zhizaoGo)
end

function zhizaoGo()
    return go(zhizaoCheck, "大理城", "裁缝店")
end

function zhizaoCheck()
    flag.idle = nil
    exe("score;hp;cha")
    checkBags()
    return checkWait(zhizaoXue, 0.8)
end

function zhizaoXue()
    if not locl.id["老裁缝"] then
        return zhizaoBack()
    end
    if hp.neili < 100 then
        if hqd_cur > 0 then
            exe('eat huangqi dan')
        else
            return zhizaoBack()
        end
    end
    if hp.neili < 1000 then
        exe('eat ' .. drug.neili2)
    end
    if skills["zhizao"] and skills["zhizao"].lvl >= 221 then
        return zhizaoBack()
    end
    if Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt > 30 and hp.pot > master.times - 1 then
        yunAddInt()
        exe("yun jing;xue caifeng zhizao " .. master.times)
        return zhizaoCheck()
    elseif hp.pot < master.times then
        return zhizaoBack()
    elseif score.gold > 300 then
        return check_bei(zhizaoQu, 1)
    else
        return zhizaoBack()
    end
end

function zhizaoQu()
    exe("e;n;#3e;n;qu 30 gold")
    exe("s;#3w;s;w")
    return check_busy(zhizaoCheck, 1)
end

function zhizaoBack()
    exe("hp")
    return check_busy(check_food)
end
