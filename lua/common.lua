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



-- ------------------------------------
-- ����: �Զ���AddAlias����
-- ------------------------------------
function Fun_AddAlias(name,match,group,script)
	local value = AddAlias(name, match, "", alias_flag.Enabled + alias_flag.Replace + alias_flag.Temporary + alias_flag.RegularExpression, script)
	SetAliasOption(name,"group",group)
	
	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_AddAlias false")
	end
	
	return value
end

-- ------------------------------------
-- ����: �Զ���AddAlias����(��������ʽ)
-- ------------------------------------
function Fun_AddAliasRE(name,match,group,script)
	local value = AddAlias(name, match, "", alias_flag.Enabled + alias_flag.Replace + alias_flag.Temporary + alias_flag.RegularExpression, script)
	SetAliasOption(name,"group",group)
	
	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_AddAlias false")
	end
	
	return value
end

-- ------------------------------------
-- ����: �Զ���AddTrigger������ͬʱ�������
-- ------------------------------------
function Fun_AddTrigger(name,match,group,script)
	local value = AddTrigger(name, match, "", trigger_flag.KeepEvaluating + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary, custom_colour.NoChange, 0, "", script)
	SetTriggerOption(name,"group",group)

	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_AddTrigger false")
	end
	
	return value
end

-- ------------------------------------
-- ����: ����ĳЩ��ʾ��ͬʱ�������
-- ------------------------------------
function Fun_AddTriggerHide(name,match,group,script)
	local value = AddTrigger(name, match, "", trigger_flag.KeepEvaluating + trigger_flag.RegularExpression + trigger_flag.Replace + trigger_flag.Temporary + trigger_flag.OmitFromOutput, custom_colour.NoChange, 0, "", script)
	SetTriggerOption(name,"group",group)

	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_AddTriggerHide false")
	end
	
	return value
end

-- ------------------------------------
-- ����: �Զ���AddTime���� ע����������ʽģʽ
-- ------------------------------------
function Fun_AddTimer(name,time,group,script)
	local Hour = math.floor(time / 3600)
	time = time - Hour * 3600
	local Min = math.floor(time / 60)
	time = time - Min * 60
	local value = AddTimer(name, Hour, Min, time, "", timer_flag.Replace + timer_flag.Temporary, script)
	SetTimerOption(name,"group",group)
	
	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_AddTimer false")
		ColourNote("red", "black", "Hour "..Hour.." Min "..Min.." Time "..time)
	end
	
	return value
end

-- ------------------------------------
-- ����: ���ô���������
-- ------------------------------------
function Fun_SetTriggerLine(name, line)
	local value = SetTriggerOption(name, "multi_line", "y")
	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_SetTriggerLine false")
	end
	value = SetTriggerOption(name, "lines_to_match", line)
	if value ~= 0 then
		ColourNote("red", "black", name.." Fun_SetTriggerLine false")
	end
end
-- ------------------------------------
-- ����: �Զ�����ƽ�����
-- ------------------------------------
function Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)
	gauge (win, "", cur, max,
			left, top, width, height,
			curcolor, maxcolor,
			0, 0x000000, 0x000000, 0x000000)
end
-- ------------------------------------
-- ����: �Զ�����ƽ�����2������
-- ------------------------------------
function Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)
	gauge (win, "", cur, max,
			left, top, width, height,
			curcolor, maxcolor,
			0, 0x000000, 0x000000, 0x000000)

	if curmax < max then
		local lenght = math.floor((max - curmax) * width / max)
		if lenght < 1 then
			lenght = 1
		end
		WindowRectOp (win, 2, left + width - lenght - 1, top + 1, left + width + 1, top + height - 1, curmaxcolor)
	end
end