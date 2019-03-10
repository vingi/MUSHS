--
-- Vip.lua
--
-- ----------------------------------------------------------
-- Vip相关操作
-- ----------------------------------------------------------
--
--[[

eg.


--]]
Vip = {
    LastAsk = nil
}

function Vip.Trigger()
        DeleteTriggerGroup("vipbenefit")
        create_trigger_t("vipbenefit1", "^(> )*当铺老板不耐烦的瞪了你一眼，说道：没看我正忙着吗？", "", "Vip.vipbenefit_DoItAgain")
        create_trigger_t("vipbenefit2", "^(> )*当铺老板说：您是本站(.*)会员,这里有巫师大人为你准备的", "", "Vip.Benefit_DBRecord")
        create_trigger_t("vipbenefit3", "^(> )*当铺老板说道：「您本周已经领过福利了，等下周再来吧。」", "", "Vip.Benefit_DBRecord")
        SetTriggerOption("vipbenefit1", "group", "vipbenefit")
        SetTriggerOption("vipbenefit2", "group", "vipbenefit")
        SetTriggerOption("vipbenefit3", "group", "vipbenefit")
end
-- ---------------------------------------------------------------
-- 领取会员成员
-- ---------------------------------------------------------------
function Vip.ask()
    Vip.LastAsk = "ask laoban about 会员福利";
    exe(Vip.LastAsk)
    check_bei(Vip.ask2)
end
-- ---------------------------------------------------------------
-- 领取会员福利
-- ---------------------------------------------------------------
function Vip.ask2()
    Vip.LastAsk = "ask laoban about 会员基金"
    exe(Vip.LastAsk)
    if GetRoleConfig("AutoEbook") then
        check_bei(Ebookcheck)
    else
        DeleteTriggerGroup("vipbenefit")
        Gstart()
    end
end
-- ---------------------------------------------------------------
-- 当铺老板busy时, 再次Ask
-- ---------------------------------------------------------------
function Vip.vipbenefit_DoItAgain()
    if Vip.LastAsk ~= nil then
        wait.make(
            function()
                wait.time(0.5)
                return exe(Vip.LastAsk)
            end
        )
    end
end
-- ---------------------------------------------------------------
-- 完成一次会员福利领取, 将记录写入数据库
-- ---------------------------------------------------------------
function Vip.Benefit_DBRecord()
    local tsql =
        "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" ..
        score.id .. "', '" .. score.name .. "', '会员福利领取', '')"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end
-- ---------------------------------------------------------------
-- 获取本周领取记录
-- ---------------------------------------------------------------
function Vip.GetDBRecord()
    local reboottime = tostring(common.GetLastRebootTime())
    local tsql =
        "SELECT count(*) FROM [ActivityRecord] where ActivityName = '会员福利领取' and RoleID = '" .. score.id .. "' and CreateTime > '" .. reboottime .. "'"
    local db = DBHelper:new()
    return db:GetRowAmount(tsql)
end
-- ---------------------------------------------------------------
-- 执行领取会员福利和会员基金的动作
-- ---------------------------------------------------------------
function Vip.GetBenefit()
    -- 激活领会员福利触发
    Vip.Trigger()
    go(Vip.ask, "扬州城", "当铺")
end
-- ---------------------------------------------------------------
-- 检查是否已经领取会员福利和会员基金
-- ---------------------------------------------------------------
function Vip.CheckGetBenefit()
    local isTrue = false
    if GetRoleConfig("AutoVipBenefit") and score.vip ~= "普通会员" then
        local times = Vip.GetDBRecord()
        if tonumber(times) == 0 then
            -- 进行领取动作
            isTrue = true
        end
    end
    return isTrue
end
