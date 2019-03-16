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
-- ---------------------------------------------------------------
-- 领会员福利所需触发器 trigger
-- ---------------------------------------------------------------
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
    Vip.LastAsk = "ask laoban about 会员福利"
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
        "SELECT count(*) FROM [ActivityRecord] where ActivityName = '会员福利领取' and RoleID = '" ..
        score.id .. "' and CreateTime > '" .. reboottime .. "'"
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
    if GetRoleConfig("AutoVipBenefit") and string.trim(score.vip) ~= "普通会员" then
        local times = Vip.GetDBRecord()
        if tonumber(times) == 0 then
            -- 进行领取动作
            isTrue = true
        end
    end
    return isTrue
end
-- ---------------------------------------------------------------
-- 兑换 Ebook
-- ---------------------------------------------------------------
function Ebookcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Ebookcheck
    create_trigger_t("vipchk1", "^(> )*您是本站终身会员，本次购物免费。", "", "vipEbookck")
    create_trigger_t("vipchk2", "^(> )*本周你已无法使用精英之书。", "", "Yjwcheck")
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
-- ---------------------------------------------------------------
-- 兑换 玉肌丸
-- ---------------------------------------------------------------
function Yjwcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*您是本站终身会员，本次购物免费。", "", "vipYjwck")
    create_trigger_t("vipchk2", "^(> )*本周你已无法使用玉肌丸。", "", "Ygcheck")
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
-- ---------------------------------------------------------------
-- 兑换 锦帕, 以及找瑛姑
-- ---------------------------------------------------------------
function Ygcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id Yjwcheck
    create_trigger_t("vipchk1", "^(> )*您是本站终身会员，本次购物免费。", "", "vipYggo")
    create_trigger_t("vipchk2", "^(> )*本周你已无法使用鸳鸯锦帕。", "", "Gstart")
    create_trigger_t("vipchk3", "^(> )*你给瑛姑一方鸳鸯锦帕", "", "vipYgok")
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
    return go(vipGhyg, "大理城", "茶馆")
end
function vipGhyg()
    exe("guihuan ying gu")
end
function vipYgok()
    return go(vipYg, "扬州城", "当铺")
end
function vipYg()
    exe("duihuan jinpa")
end
-- ---------------------------------------------------------------
-- 兑换 朱睛冰蟾
-- ---------------------------------------------------------------
function Vipcheck()
    DeleteTriggerGroup("vipchk")
    -- ain dls nv id vipcheck
    create_trigger_t("vipchk1", "^(> )*您是本站终身会员，本次购物免费。", "", "vipxidu")
    create_trigger_t("vipchk2", "^(> )*你的朱睛冰蟾已经用完了。", "", "vipxidu_over")
    create_trigger_t("vipchk3", "^(> )*本周你已无法使用", "", "vipover")
    create_trigger_t("vipchk4", "^(> )*你先要用完现有的物品才能再次兑换。", "", "vipxidu")
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
-- ---------------------------------------------------------------
-- 兑换 大还丹
-- ---------------------------------------------------------------
function vipdhd()
    DeleteTriggerGroup("vipdhd")
    -- ain dls nv id vipcheck
    create_trigger_t("vipdhd1", "^(> )*您是本站终身会员，本次购物免费。", "", "vipeatdhd")
    create_trigger_t("vipdhd2", "^(> )*你的大还丹已经用完了。", "", "vipdhd_over")
    create_trigger_t("vipdhd3", "^(> )*本周你已无法使用", "", "vipover")
    create_trigger_t("vipdhd4", "^(> )*你先要用完现有的物品才能再次兑换。", "", "vipeatdhd")
    create_trigger_t("vipdhd5", "^(> )*看清楚点，这东西能吃吗？", "", "vipdhd_over")
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
