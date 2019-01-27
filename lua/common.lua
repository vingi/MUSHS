--
-- common.lua
--
-- ----------------------------------------------------------
-- common functions
-- ͨ��function
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
-- Common.InstanceRun(ִ�еĺ���, �����ʱ��, ִ�к����Ĳ���);
-- ������ִ�ж�Ӧ�ĺ���,�����ڼ����ʱ���ڶ������ٴ�ִ��;
-- �����ʱ�䲻����Ĭ��2��;
-- ִ�к����޲�������,
-- �ҵ�ͼƬʾ��,
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
-- �Զ���ʵ�� lua split����
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
-- �Զ���ʵ�� lua string.isempty
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
-- �Զ���ʵ�� lua string.trim
-- ----------------------------------------------------------
function string.trim(str)
  return string.gsub(str, "%s+", "")
end

-- ----------------------------------------------------------
-- �Զ���ʵ�� lua table ��������
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
-- �Զ���ʵ�� lua ��ȡtalbe����
-- ----------------------------------------------------------
function common.table_leng(t)
  local leng = 0
  for k, v in pairs(t) do
    leng = leng + 1
  end
  return leng
end

-- ----------------------------------------------------------
-- �������ֵ����Сֵ����ڸ÷�Χ�ڵ�ֵ,
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


-- �Զ���ʵ�� mush���� exe
-- function exe(cmd)
--   if GetConnectDuration() == 0 then
--     return Connect()
--   end
--   if cmd == nil then
--     cmd = "look"
--   end
--   Execute(cmd)
-- end

-- �Զ���ʵ�� mush���� exe_road
-- function exe_road(cmd)
--   if GetConnectDuration() == 0 then
--     return Connect()
--   end
--   if cmd == nil then
--     cmd = "look"
--   end
--   road.cmd = cmd
--   if locl.area and locl.area ~= "����ɽ" then
--     Execute("halt")
--   end
--   Execute(cmd)
-- end


-- ����һ����ͨ����
function create_alias(a_name, a_match, a_response)
  return AddAlias(
     a_name,
     a_match,
     a_response,
     alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression,
     ""
  )
end
-- ����һ��exe����
function create_alias_e(a_name, a_match, a_response)
  local tp =
    AddAlias(a_name, a_match, a_response, alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression, "")
  SetAliasOption(a_name, "send_to", "10")
  return tp
end
-- ����һ���ű�����
function create_alias_s(a_name, a_match, a_function)
  return AddAlias(a_name, a_match, "", alias_flag.Enabled + alias_flag.Replace, a_function)
end
-- ����һ���ֶ�ʱ��
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
-- ����һ���붨ʱ��
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
-- ����һ��һ�����붨ʱ��
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
-- ����һ��������
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
-- ����һ����ʱ�Ĵ�����
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
-- ����һ����ʱ��һ���Դ�����
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
-- ����һ��ex������
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
-- ����һ����ʱ�Ĵ�����
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
-- ����һ����ʱ��һ���Դ�����
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
-- ����һ����ʱ��һ���Զ�ʱ��
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

