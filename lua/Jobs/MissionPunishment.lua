--
-- MissionPunishment.lua
--
-- ----------------------------------------------------------
-- 用于处理 当前在任务惩罚期间时执行的事情
-- 避免干等任务惩罚时间, 提高效率
-- 该惩罚多出现于当exp较低时
-- ----------------------------------------------------------
--
--[[

eg.

--]]

MissionPunishment = { }

function MissionPunishment.PunishmentHandle(busySecond)
    local func = test
    if busySecond > 10 then
        quest.desc = "任务惩罚 " .. busySecond .. "秒"
        quest.note = ""
        quest.update()
    else
        quest.desc = ""
        quest.note = ""
        quest.update()
    end
    if hp.pot > 100 then
        print("Mission Punishment Gap, going to Study")
        func = check_pot
    else
        print("Mission Punishment Gap, going to Check_Food")
        func = function()
            check_food(true)
            -- 强制 full 饮食
        end
    end
--    beiok()
    check_busy(func)
    -- 给 beihook 赋值, 即赋值后续要执行的function
    -- beihook = function xxx()
    -- 执行 beiok 停止bei,执行后续
    -- beiok()
    -- switch study/prepare/food/repair/doing LL
end -- function check

