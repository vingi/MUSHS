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
common = {}


-- ----------------------------------------------------------
-- Common.InstanceRun(执行的函数, 间隔的时间, 执行函数的参数);
-- 会立刻执行对应的函数,并且在间隔的时间内都不会再次执行;
-- 间隔的时间不填则默认2秒;
-- 执行函数无参数则不填,
-- 我的图片示例,
-- common.InstanceRun(common.Test);
-- ----------------------------------------------------------
common.tInstanceVoid = {};
common.InstanceRun = function(pVoid, nTime, vParam)
        local strKey = tostring(pVoid);
        if strKey == nil or strKey == "" then return false; end
        if common.tInstanceVoid[strKey] ~= nil then return false; end
        if nTime == nil then nTime = 2; end
        common.tInstanceVoid[strKey] = 1;
        pVoid(vParam);
        DoAfterSpecial(nTime, "common.InstanceReset(\"" .. strKey .. "\")", 12);
        return true;
end
common.InstanceReset = function(strKey)
        if strKey == nil or strKey == "" then return; end
        common.tInstanceVoid[strKey] = nil;
end
common.Test = function()
        Note("CT 1");
end

-- ----------------------------------------------------------
-- 自定义实现 lua split方法
-- ----------------------------------------------------------
function string.split(s, p)
  local rt = {}
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
function string.trim(str)
  return string.gsub(str, "%s+", "")
end

-- ----------------------------------------------------------
-- 自定义实现 lua table 倒序排列
-- ----------------------------------------------------------
function common.reverseTable(tab)
  local tmp = {}
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
    AddAlias(a_name, a_match, a_response, alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression, "")
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
     -1,
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
     -1,
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
     -1,
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
     -1,
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
    -1,
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
    -1,
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
    -1,
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
    -1,
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

