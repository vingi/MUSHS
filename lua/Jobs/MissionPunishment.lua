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
MissionPunishment = {
    AlreadyGiveUp = false
}

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
    -- 判断是否已放弃任务, 避免二次busy
    if MissionPunishment.AlreadyGiveUp ~= true then
        if job.last == "huashan" then
            func = huashanFindFail
        end
        if job.last == "wudang" then
            func = function()
                go(wudangFangqi, "武当山", "三清殿")
            end
        end
        if job.last == "songxin" then
            func = function()
                go(wudangFangqi, "武当山", "三清殿")
            end
        end
        if job.last == "xueshan" then
            func = function()
                go(xueshan_fangqi, "大雪山", "入幽口")
            end
        end
        return check_busy(func)
    end

    if hp.pot > 100 then
        func = check_pot
    end
    -- if not Bag["绳子"] then
    --     CheckRope(check_food)
    -- end

    func = function()
        exe("yun jing;yun qi;yun jingli;")
        check_food(true)
        -- 强制 full 饮食
    end
    --    beiok()
    check_busy(func)
    -- 给 beihook 赋值, 即赋值后续要执行的function
    -- beihook = function xxx()
    -- 执行 beiok 停止bei,执行后续
    -- beiok()
    -- switch study/prepare/food/repair/doing LL
end -- function check
