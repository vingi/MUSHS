--
-- common.lua
--
-- ----------------------------------------------------------
-- common functions
-- 通用function
-- ----------------------------------------------------------
--
--[[

eg.

require "common"
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
require "lc"

common = { }

-- ----------------------------------------------------------
-- Common.InstanceRun(执行的函数, 间隔的时间, 执行函数的参数);
-- 会立刻执行对应的函数,并且在间隔的时间内都不会再次执行;
-- 间隔的时间不填则默认2秒;
-- 执行函数无参数则不填,
-- 我的图片示例,
-- common.InstanceRun(common.Test);
-- ----------------------------------------------------------
common.tInstanceVoid = { }
common.InstanceRun = function(pVoid, nTime, vParam)
    local strKey = tostring(pVoid)
    if strKey == nil or strKey == "" then
        return false
    end
    if common.tInstanceVoid[strKey] ~= nil then
        return false
    end
    if nTime == nil then
        nTime = 2
    end
    common.tInstanceVoid[strKey] = 1
    pVoid(vParam)
    DoAfterSpecial(nTime, 'common.InstanceReset("' .. strKey .. '")', 12)
    return true
end
common.InstanceReset = function(strKey)
    if strKey == nil or strKey == "" then
        return
    end
    common.tInstanceVoid[strKey] = nil
end
common.Test = function()
    Note("CT 1")
end

-- ---------------------------------------------------------------
-- Lua获取系统时间, 返回标准日期格式
-- ---------------------------------------------------------------
function common.date()
    return os.date("%Y-%m-%d", os.time())
end

-- ---------------------------------------------------------------
-- Lua获取系统时间, 返回标准时间标式
-- ---------------------------------------------------------------
function common.time()
    return os.date("%Y-%m-%d %H:%M:%S", os.time())
end

-- ---------------------------------------------------------------
-- 时间字符串转为时间戳
-- ---------------------------------------------------------------
function common.string2time(timeString)
    if type(timeString) ~= "string" then
        error("string2time: timeString is not a string")
        return 0
    end
    local fun = string.gmatch(timeString, "%d+")
    local y = fun() or 0
    if y == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    local m = fun() or 0
    if m == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    local d = fun() or 0
    if d == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    local H = fun() or 0
    if H == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    local M = fun() or 0
    if M == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    local S = fun() or 0
    if S == 0 then
        error("timeString is a invalid time string")
        return 0
    end
    return os.time( { year = y, month = m, day = d, hour = H, min = M, sec = S })
end

-- ---------------------------------------------------------------
-- 获取两个时间的间隔
-- ---------------------------------------------------------------
function common.timediff(long_time, short_time)
    local n_short_time, n_long_time, carry, diff = os.date("*t", short_time), os.date("*t", long_time), false, { }
    local colMax = {
        60,
        60,
        24,
        os.date("*t",os.time { year = n_short_time.year, month = n_short_time.month + 1, day = 0 }).day,
        12,
        0
    }
    n_long_time.hour = n_long_time.hour -(n_long_time.isdst and 1 or 0) +(n_short_time.isdst and 1 or 0)
    -- handle dst
    for i, v in ipairs( { "sec", "min", "hour", "day", "month", "year" }) do
        diff[v] = n_long_time[v] - n_short_time[v] +(carry and -1 or 0)
        carry = diff[v] < 0
        if carry then
            diff[v] = diff[v] + colMax[i]
        end
    end
    return diff
end
-- ---------------------------------------------------------------
-- 获取最后一次服务器重启时间, for safety, 按每周四的8点计算
-- ---------------------------------------------------------------
function common.GetLastRebootTime()
    local weektime = os.date("%w", os.time())
    local day_gap = 0
    if tonumber(weektime) > 4 then
        day_gap = weektime - 4
    elseif tonumber(weektime) == 4 and tonumber(os.date("%H", os.time())) >= 8 then
        day_gap = 0
    else
        day_gap = weektime + 3
    end
    curH = tonumber(os.date("%H", os.time()))
    curM = tonumber(os.date("%M", os.time()))
    curS = tonumber(os.date("%S", os.time()))
    reboottime =(os.time() - day_gap * 24 * 3600 - curH * 3600 - curM * 60 - curS) + 8 * 3600
    return os.date("%Y-%m-%d %H:%M:%S", reboottime)
end
-- ----------------------------------------------------------
-- 自定义实现 lua split方法
-- ----------------------------------------------------------
function string.split(s, p)
    local rt = { }
    string.gsub(
    s,
    "[^" .. p .. "]+",
    function(w)
        table.insert(rt, w)
    end
    )
    return rt
end

-- ----------------------------------------------------------
-- 自定义实现 lua string.isempty
-- ----------------------------------------------------------
function string.isempty(str)
    local isem = true
    if str ~= nil and string.len(str) > 0 then
        str = trim(str)
        if string.len(x) >= 1 then
            isem = false
        else
            isem = true
        end
    end
    return isem
end
-- ----------------------------------------------------------
-- 自定义实现 lua string.trim
-- ----------------------------------------------------------
function string.trim(s)
    return(s:gsub("^%s*(.-)%s*$", "%1"))
end

-- ----------------------------------------------------------
-- 自定义实现 lua table 倒序排列
-- ----------------------------------------------------------
function common.reverseTable(tab)
    local tmp = { }
    for i = 1, #tab do
        local key = #tab
        tmp[i] = table.remove(tab)
    end
    return tmp
end
-- ----------------------------------------------------------
-- 自定义实现 lua 获取talbe长度
-- ----------------------------------------------------------
function common.table_leng(t)
    local leng = 0
    for k, v in pairs(t) do
        leng = leng + 1
    end
    return leng
end
-- ----------------------------------------------------------
-- 根据最大值和最小值获得在该范围内的值,
-- return value
-- ----------------------------------------------------------
function common.GetValueByRange(num, min, max)
    if num > max then
        num = max
    end
    if num < min then
        num = min
    end
    return num
end
-- ---------------------------------------------------------------
-- 随机获取table数组表中的一条集合, 不适用于key/value集合
-- ---------------------------------------------------------------
function common.RandomValueInTable(Table)
    return Table[math.random(#Table)]
end
-- ---------------------------------------------------------------
-- 字符转换lc.dll的帮助文件

-- a2w(ansi to unicode)

-- u2w(utf8 to unicode)

-- w2a(unicode to ansi)

-- w2u(unicode to utf8)

-- u2a(utf8 to ansi)

-- a2u(ansi to utf8)

-- bstr(bytes of str)

-- help(show this)
-- ---------------------------------------------------------------
function common.LcHelp()
    print(lc.help())
end
-- ---------------------------------------------------------------
-- 字符转换, 从 utf8 to ansi
-- ---------------------------------------------------------------
function common.u2a(str)
    return lc.u2a(str)
end
-- ---------------------------------------------------------------
-- 字符转换, 从 ansi to utf8
-- ---------------------------------------------------------------
function common.a2u(str)
    return lc.a2u(str)
end

-- 自定义实现 mush方法 exe
-- function exe(cmd)
--   if GetConnectDuration() == 0 then
--     return Connect()
--   end
--   if cmd == nil then
--     cmd = "look"
--   end
--   Execute(cmd)
-- end

-- 自定义实现 mush方法 exe_road
-- function exe_road(cmd)
--   if GetConnectDuration() == 0 then
--     return Connect()
--   end
--   if cmd == nil then
--     cmd = "look"
--   end
--   road.cmd = cmd
--   if locl.area and locl.area ~= "峨嵋山" then
--     Execute("halt")
--   end
--   Execute(cmd)
-- end

-- 创建一个普通别名
function create_alias(a_name, a_match, a_response)
    return AddAlias(
    a_name,
    a_match,
    a_response,
    alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,
    ""
    )
end
-- 创建一个exe别名
function create_alias_e(a_name, a_match, a_response)
    local tp =
    AddAlias(
    a_name,
    a_match,
    a_response,
    alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,
    ""
    )
    SetAliasOption(a_name, "send_to", "10")
    return tp
end
-- 创建一个脚本别名
function create_alias_s(a_name, a_match, a_function)
    return AddAlias(a_name, a_match, "", alias_flag.Enabled + alias_flag.Replace, a_function)
end
-- 创建一个分定时器
function create_timer_m(t_name, t_min, t_function)
    return AddTimer(
    t_name,
    0,
    t_min,
    0,
    "",
    timer_flag.Enabled + timer_flag.ActiveWhenClosed + timer_flag.Replace,
    t_function
    )
end
-- 创建一个秒定时器
function create_timer_s(t_name, t_second, t_function)
    return AddTimer(
    t_name,
    0,
    0,
    t_second,
    "",
    timer_flag.Enabled + timer_flag.ActiveWhenClosed + timer_flag.Replace,
    t_function
    )
end
-- 创建一个一次性秒定时器
function create_timer_st(t_name, t_second, t_function)
    return AddTimer(
    t_name,
    0,
    0,
    t_second,
    "",
    timer_flag.Enabled + timer_flag.ActiveWhenClosed + timer_flag.Replace + timer_flag.OneShot,
    t_function
    )
end
-- 创建一个触发器
function create_trigger_t(t_name, t_match, t_response, t_function)
    return AddTrigger(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace,
    - 1,
    0,
    "",
    t_function
    )
end
-- 创建一个临时的触发器
function create_trigger_f(t_name, t_match, t_response, t_function)
    return AddTrigger(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary,
    - 1,
    0,
    "",
    t_function
    )
end
-- 创建一个临时的一次性触发器
function create_trigger(t_name, t_match, t_response, t_function)
    return AddTrigger(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary +
    trigger_flag.OneShot,
    - 1,
    0,
    "",
    t_function
    )
end
-- 创建一个ex触发器
function create_triggerex_t(t_name, t_match, t_response, t_function)
    return AddTriggerEx(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace,
    - 1,
    0,
    "",
    t_function,
    12,
    99
    )
end

function create_triggerex_t101(t_name, t_match, t_response, t_function)
    return AddTriggerEx(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace,
    - 1,
    0,
    "",
    t_function,
    12,
    101
    )
end
function create_triggerex_lvl(t_name, t_match, t_response, t_function, lvl)
    return AddTriggerEx(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace,
    - 1,
    0,
    "",
    t_function,
    12,
    lvl
    )
end
-- 创建一个临时的触发器
function create_triggerex_f(t_name, t_match, t_response, t_function)
    return AddTriggerEx(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary,
    - 1,
    0,
    "",
    t_function,
    12,
    100
    )
end
-- 创建一个临时的一次性触发器
function create_triggerex(t_name, t_match, t_response, t_function)
    return AddTriggerEx(
    t_name,
    t_match,
    t_response,
    trigger_flag.Enabled + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary +
    trigger_flag.OneShot,
    - 1,
    0,
    "",
    t_function,
    12,
    100
    )
end
-- 创建一个临时的一次性定时器
function create_timer(t_name, t_time, t_com, t_function)
    return AddTimer(
    t_name,
    0,
    0,
    t_time,
    t_com,
    timer_flag.Enabled + timer_flag.OneShot + timer_flag.TimerSpeedWalk + timer_flag.Replace + timer_flag.Temporary,
    t_function
    )
end

-- ------------------------------------
-- 描述: 自定义AddAlias函数
-- ------------------------------------
function Fun_AddAlias(name, match, group, script)
    local value =
    AddAlias(
    name,
    match,
    "",
    alias_flag.Enabled + alias_flag.Replace + alias_flag.Temporary + alias_flag.RegularExpression,
    script
    )
    SetAliasOption(name, "group", group)

    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_AddAlias false")
    end

    return value
end
-- ------------------------------------
-- 描述: 自定义AddAlias函数(带正则表达式)
-- ------------------------------------
function Fun_AddAliasRE(name, match, group, script)
    local value =
    AddAlias(
    name,
    match,
    "",
    alias_flag.Enabled + alias_flag.Replace + alias_flag.Temporary + alias_flag.RegularExpression,
    script
    )
    SetAliasOption(name, "group", group)

    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_AddAlias false")
    end

    return value
end
-- ------------------------------------
-- 描述: 自定义AddTrigger函数，同时会加入组
-- ------------------------------------
function Fun_AddTrigger(name, match, group, script)
    local value =
    AddTrigger(
    name,
    match,
    "",
    trigger_flag.KeepEvaluating + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary,
    custom_colour.NoChange,
    0,
    "",
    script
    )
    SetTriggerOption(name, "group", group)

    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_AddTrigger false")
    end

    return value
end
-- ------------------------------------
-- 描述: 隐藏某些显示，同时会加入组
-- ------------------------------------
function Fun_AddTriggerHide(name, match, group, script)
    local value =
    AddTrigger(
    name,
    match,
    "",
    trigger_flag.KeepEvaluating + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary +
    trigger_flag.OmitFromOutput,
    custom_colour.NoChange,
    0,
    "",
    script
    )
    SetTriggerOption(name, "group", group)

    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_AddTriggerHide false")
    end

    return value
end
-- ------------------------------------
-- 描述: 自定义AddTime函数 注意是正则表达式模式
-- ------------------------------------
function Fun_AddTimer(name, time, group, script)
    local Hour = math.floor(time / 3600)
    time = time - Hour * 3600
    local Min = math.floor(time / 60)
    time = time - Min * 60
    local value = AddTimer(name, Hour, Min, time, "", timer_flag.Replace + timer_flag.Temporary, script)
    SetTimerOption(name, "group", group)

    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_AddTimer false")
        ColourNote("red", "black", "Hour " .. Hour .. " Min " .. Min .. " Time " .. time)
    end

    return value
end
-- ---------------------------------------------------------------
-- 判断一个Observer是否存在
-- ---------------------------------------------------------------
function ExistObserver(obname)
    local isExist = IsTimer(obname)
    if isExist ~= nill and tonumber(isExist) == 0 then
        return true
    else
        return false
    end
end
-- ---------------------------------------------------------------
-- 新建一个监视器, 通过新建计时器的方式, 监视命令是否被正常执行, 通常该命令执行后续会触发方法将这个定时器关闭
-- args:
-- obname: 监视器名称
-- ticktime: 间隔时间
-- cmd: 需要执行的命令
-- ---------------------------------------------------------------
function NewObserver(obname, cmd, ticktime)
    if not ExistObserver(obname) then
        exe(cmd)
        local ticktime = ticktime or 2
        AddTimer(obname, 0, 0, ticktime, cmd, timer_flag.Enabled + timer_flag.ActiveWhenClosed, "")
    end
end
-- ---------------------------------------------------------------
-- 新建一个监视器, 通过新建计时器的方式, 监视命令是否被正常执行, 通常该命令执行后续会触发方法将这个定时器关闭
-- args:
-- obname: 监视器名称
-- ticktime: 间隔时间
-- func: 需要执行的方法
-- ---------------------------------------------------------------
function NewObserverByFunc(obname, func, ticktime)
    if not ExistObserver(obname) then
        _G[func]()
        local ticktime = ticktime or 2
        create_timer_s(obname, ticktime, func)
    end
end
-- ---------------------------------------------------------------
-- 移除监视器
-- ---------------------------------------------------------------
function RemoveObserver(obname)
    DeleteTimer(obname)
end

-- ------------------------------------
-- 描述: 设置触发器行数
-- ------------------------------------
function Fun_SetTriggerLine(name, line)
    local value = SetTriggerOption(name, "multi_line", "y")
    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_SetTriggerLine false")
    end
    value = SetTriggerOption(name, "lines_to_match", line)
    if value ~= 0 then
        ColourNote("red", "black", name .. " Fun_SetTriggerLine false")
    end
end
-- ------------------------------------
-- 描述: 自定义绘制进度条
-- ------------------------------------
function Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)
    gauge(win, "", cur, max, left, top, width, height, curcolor, maxcolor, 0, 0x000000, 0x000000, 0x000000)
end
-- ------------------------------------
-- 描述: 自定义绘制进度条2个进度
-- ------------------------------------
function Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)
    gauge(win, "", cur, max, left, top, width, height, curcolor, maxcolor, 0, 0x000000, 0x000000, 0x000000)

    if curmax < max then
        local lenght = math.floor((max - curmax) * width / max)
        if lenght < 1 then
            lenght = 1
        end
        WindowRectOp(win, 2, left + width - lenght - 1, top + 1, left + width + 1, top + height - 1, curmaxcolor)
    end
end
