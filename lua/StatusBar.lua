--
-- StatusBar.lua
--
-- ----------------------------------------------------------
-- ״̬����չ, �ɱ���״̬����޸Ķ���, ����ʹ�ò����ʽ,  ����Ϊluaģ�鷽ʽ
-- ԭ����: ������
-- edit: ����(vingi)
--[[
  history:
    ��������ݶɷ����iceoo��״̬����ıࣺ
    �޸���Hpbrief�Ļ���,��ս������,�Զ���Ѫ����ʱ��,�Զ��ָ�,�ָ�����Զ��ر�
    ��������������������5��mushȫ�ֱ�����
    Q_name: ��������
    Q_location: ����ص�
    Q_status: �������״̬
    Q_misc: ��������Ҫ��ʾ����Ϣ
    Q_misc2: ��������Ҫ��ʾ����Ϣ
    #����Variable:Common_IDΪ���Լ���id,��������ʱ�Զ�����(��ش���ע��)
    #������������ز��
    ����Alias:BATTLE_ON��BATTLE_OFF�ֱ�Ϊս����ʼʱ��ս������ʱ������,���ú�������
    ����Alias:HEAL_HARD;HEAL_NORMAL�ֱ�Ϊ�������ƺ��е��˺�����,�е��˺����ƿ���Ϊyun lifeheal �Լ���id
    #�޸�BUFF�Ĵ���������Alias:BUFF,���Զ��޷�BUFF(��ش���ע��)
--]]
-- ----------------------------------------------------------
--

module("StatusBar", package.seeall)

require "movewindow"
require "gauge"
require "serialize"

SetOption("convert_ga_to_newline", 1)
SendNoEcho("unset hpbrief");

print("����״̬�����װ�أ����hps [on][off][refresh]")
-- print(GetPluginID())


-- ����
local FONT_NAME = "f1"
local FONT_SIZE = "9"

-- HP��
local hp_checktime = 60
local hp_checktimecur = hp_checktime
local hp_win = "hp_window"
local hp_win_width = 300
local hp_win_height = 211

local actorname = ""-- GetVariable("actorname") or utils.inputbox("������Ľ�ɫ����")



---------------------------------------------------------------------------
-- ���õ�һЩ�����Ͷ���
---------------------------------------------------------------------------

--[[
	Fun_AddAlias(name,match,group,script)		---�Զ���AddAlias����
	Fun_AddAliasRE(name,match,group,script)		---�Զ���AddAlias����(��������ʽ)
	Fun_AddTrigger(name,match,group,script)		---�Զ���AddTrigger������ͬʱ�������
	Fun_AddTriggerHide(name,match,group,script)		---����ĳЩ��ʾ��ͬʱ�������
	Fun_AddTimer(name,time,group,script)		---�Զ���AddTime���� ע����������ʽģʽ
	Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)							---�Զ�����ƽ�����
	Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)		---�Զ�����ƽ�����2������
	Fun_ChangeKM(value)							---�޸ľ����K��MΪ������ֵģʽ
	Fun_TimeChangeText(Time)					---���뻻������졢Сʱ�����ӡ�����ʾ������
	Fun_TimeChange(Time)						---���뻻�����Сʱ�����ӡ���
	Fun_CHNum(str)								---����������ת������������
]]	



local nPluginIDStatus = "";
function GetPluginVariableSave(strKey)
    -- local strValue = GetVariable(strKey);
    -- if strValue == nil then strValue = "10000"; end
    -- return strValue;
    return tonumber(strKey) or 1000;
end

Status = Status or { };

function GetStatusHP()
    return GetPluginVariableSave(Status.HP)
end

function GetStatusHPUp()
    return GetPluginVariableSave(Status.HP_UP)
end

function GetStatusHPMax()
    return GetPluginVariableSave(Status.HP_MAX)
end

function GetStatusJL()
    return GetPluginVariableSave(Status.JL)
end

function GetStatusJLUp()
    return GetPluginVariableSave(Status.JL_UP)
end

function GetStatusJLMax()
    return GetPluginVariableSave(Status.JL_MAX)
end

function GetStatusNeili()
    return GetPluginVariableSave(Status.NEILI)
end

function GetStatusNeiliMax()
    return GetPluginVariableSave(Status.NEILI_MAX)
end

function GetStatusJingli()
    return GetPluginVariableSave(Status.JINGLI)
end

function GetStatusJingliMax()
    return GetPluginVariableSave(Status.JINGLI_MAX)
end

function GetStatusFood()
    return GetPluginVariableSave(Status.S_FOOD)
end

function GetStatusWater()
    return GetPluginVariableSave(Status.S_WATER)
end

function GetStatusPower()
    return GetPluginVariableSave(Status.S_POWER)
end

function GetStatusPowerMax()
    return GetPluginVariableSave(Status.S_POWER_MAX)
end

function GetStatusPot()
    return GetPluginVariableSave(Status.S_POT)
end


-- ------------------------------------
-- ����: ս�����
-- ------------------------------------
-- Battle = Battle or {};
-- Battle.bBattle = false;
-- Battle.Damaged = function(num, str, args)
-- 	Note("============== HP: " .. args[2] .. "\% / " .. args[3] .. "\% ===== ����:" .. args[1] .. " ==============");
-- 	Battle.FightStart();
-- 	Common_Hpbrief();
-- end

-- Battle.Poison = function(num, str, args)
-- 	Note("============== HP: " .. args[3] .. "\% / " .. args[4] .. "\% ===== �ж�-" .. args[2] .. ":" .. args[1] .. " ==============");
-- 	Common_Hpbrief();
-- end

-- Battle.TryHeal = function()
-- 	local nHpMax = GetStatusHPMax();
-- 	local nHpUp = GetStatusHPUp();
-- 	local nJlMax = GetStatusJLMax();
-- 	local nJlUp = GetStatusJLUp();
-- 	local nHp = GetStatusHP();
-- 	local bHp = false;
-- 	if Battle.bBattle == false then
-- 		if nHpUp < nHpMax/5 then
-- 			--��������
-- 			Execute("HEAL_HARD");
-- 			bHp = true;
-- 		elseif nHpUp < nHpMax/2 then
-- 			--if GetVariable("Q_name") ~= "����" and Common_id ~= nil and Common_id ~= "" then
-- 			--	SendNoEcho("yun lifeheal " .. Common_id);
-- 			--end
-- 			Execute("HEAL_NORMAL");
-- 			bHp = true;
-- 		elseif nHpUp < nHpMax then
-- 			local nNum = math.ceil((nHpMax - nHpUp)/400);
-- 			if nNum > 8 then nNum = 8; end
-- 			for i = 1, nNum do
-- 				SendNoEcho("yun heal");
-- 			end
-- 			bHp = true;
-- 		end
-- 		if nJlUp < nJlMax then
-- 		--[[
-- 			local nNum = math.ceil((nJlMax - nJlUp)/400);
-- 			for i = 1, nNum do
-- 		]]--��Busy
-- 				SendNoEcho("yun inspire");
-- 			bHp = true;
-- 			--end
-- 		end
-- 	end
-- 	if Battle.bBattle == true then
-- 		Common_InstanceRun(Battle.SetHpEcho, 5);
-- 	end
-- 	if bHp == true then
-- 		SendNoEcho("hpbrief")
-- 	end
-- 	return nHp >= nHpMax;
-- end

-- Battle.SetHpEcho = function()
-- 	SendNoEcho("hp");
-- end

-- Battle.FightStart = function()
-- 	if Battle.bBattle == false then
-- 		Note("ս����ʼ");
-- 		SendNoEcho("set BATTLE 1");
-- 		Execute("hps on");
-- 		Execute("BATTLE_ON");
-- 		EnableGroup("battle_check", true);
-- 	end
-- 	Battle.bBattle = true;
-- end

-- Battle.FightOverAction = function()
-- 	if Battle.bBattle == true then
-- 		Note("ս������");
-- 		SendNoEcho("set BATTLE 0");
-- 		Execute("hps off");
-- 		Execute("BATTLE_OFF");
-- 		EnableGroup("battle_check", false);
-- 	end
-- 	Battle.bBattle = false;
-- end

-- Battle.SetPower = function(nPower)
-- --	Note("||����: " .. nPower .. "||")
-- 	SetVariable("Q_qishi", tostring(nPower));
-- 	Battle.FightStart();
-- end




-- ------------------------------------
-- ����: �޸ľ����K��MΪ������ֵģʽ
-- ------------------------------------
function Fun_ChangeKM(value)
    local num = 0

    if string.find(value, "K") ~= nil then
        num = math.floor(tonumber((string.gsub(value, "K", "")) * 1000))
    elseif string.find(value, "M") ~= nil then
        num = math.floor(tonumber((string.gsub(value, "M", "")) * 1000000))
    else
        num = math.floor(tonumber(value))
    end

    return num
end

-- ------------------------------------
-- ����: ���뻻������졢Сʱ�����ӡ�����ʾ������
-- ------------------------------------
function Fun_TimeChangeText(Time)
    local szText = ''
    local nTime = 0;

    local Day = math.floor(Time /(3600 * 24))
    if Day > 0 then
        nTime = 60;
        szText = szText .. Day .. '��'
        Time = math.fmod(Time,(3600 * 24))
    end

    local Hour = math.floor(Time / 3600)
    if Hour > 0 then
        nTime = 60;
        szText = szText .. Hour .. 'Сʱ'
        Time = math.fmod(Time, 3600)
    end

    local Min = math.floor(Time / 60)
    if Min > 0 then
        nTime = nTime + Min;
        szText = szText .. Min .. '��'
        Time = math.fmod(Time, 60);
        SetVariable("FULLME_TIME", "" .. nTime);
    end

    szText = szText .. Time .. '��'

    return szText
end

-- ------------------------------------
-- ����: ���뻻�����Сʱ�����ӡ���
-- ------------------------------------
function Fun_TimeChange(Time)
    local Hour = math.floor(Time / 3600)
    Time = math.fmod(Time, 3600)
    local Min = math.floor(Time / 60)
    local Sec = math.fmod(Time, 60)

    return Hour, Min, Sec
end

local CH_NUM =
{
    ["һ"] = 1,
    ["��"] = 2,
    ["��"] = 3,
    ["��"] = 4,
    ["��"] = 5,
    ["��"] = 6,
    ["��"] = 7,
    ["��"] = 8,
    ["��"] = 9,
}
-- ------------------------------------
-- ����: ����������ת������������
-- ------------------------------------
function Fun_CHNum(str)
    if (#str % 2) == 1 then
        return 0
    end
    result = 0
    wan = 1
    unit = 1
    for i = #str - 2, 0, -2 do
        char = string.sub(str, i + 1, i + 2)
        if (char == "ʮ") then
            unit = 10 * wan
            if (i == 0) then
                result = result + unit
            elseif CH_NUM[string.sub(str, i - 1, i)] == nil then
                result = result + unit
            end
        elseif (char == "��") then
            unit = 100 * wan
        elseif (char == "ǧ") then
            unit = 1000 * wan
        elseif (char == "��") then
            unit = 10000 * wan
            wan = 10000
        else
            if CH_NUM[char] ~= nil then
                result = result + CH_NUM[char] * unit
            end
        end
    end
    return result
end

function format_number(str)
    local formated = str
    formated = string.gsub(formated, "(%d)(%d%d%d)$", "%1,%2", 1)
    while true do
        formated, found = string.gsub(formated, "(%d)(%d%d%d),", "%1,%2,", 1)
        if found == 0 then break end
    end
    return formated
end
---------------------------------------------------------------------------
-- ״̬ģ��
---------------------------------------------------------------------------

status =
{
    -- ����
    jing = 1000,
    jing_curmax = 1000,
    jing_max = 1000,
    jing_pre = 100,

    -- ��Ѫ
    qi = 1000,
    qi_curmax = 1000,
    qi_max = 1000,
    qi_pre = 100,

    -- ����
    jingli = 10000,
    jingli_curmax = 10000,
    jingli_canadd = 0,

    -- ����
    neili = 10000,
    neili_curmax = 10000,
    neili_canadd = 0,

    -- ����
    heqi = 0,

    -- ʳ��
    shiwu = 1000,
    shiwu_max = 1000,

    -- ��ˮ
    yinsui = 1000,
    yinsui_max = 1000,

    -- Ǳ��
    pot = 0,
    pot_lastadd = 0,

    -- ����
    exp = "0",
    exp_lastadd = 0,

    -- ������ 1����2�˾�
    yun = 0,
    yuntime = 0,
    -- ̫������
    jiali = false,

}

-- �������
quest = {
    name = "",
    target = "",
    location = "",
    status = "",
    misc = "",
    misc2 = ""
}


---------------------------------------------------------------------------
-- ��¼������Ϣ
---------------------------------------------------------------------------

-- ------------------------------------
-- ���ƴ���
-- ------------------------------------
function hp_draw_win()
    -- if status.zhenqi_per>0 then
    -- 	WindowResize(hp_win, hp_win_width, hp_win_height+15, 0x000010)
    -- 	WindowCircleOp (hp_win, miniwin.circle_round_rectangle, 0, 2, hp_win_width - 2, hp_win_height+15, 0xc0c0c0, 0, 1,0, 0, 9, 9)
    -- else
    WindowCircleOp(hp_win, miniwin.circle_round_rectangle, 0, 2, hp_win_width - 2, hp_win_height, 0xc0c0c0, 0, 1, 0, 0, 9, 9)
    -- end
    local left = 5
    local top = 10
    local title_length = 28
    local titletarger_length = 75
    local grid_length = 100
    local grid_height = 12

    -- Title & Bank account information
    local win_title = GetPluginVariable("", "id_ch")
    if win_title == nil then win_title = "" end
    win_title = win_title .. "��ǰ״̬"
    if bank_info == nil then bank_info = "0(0%)" end
    local win_title_left = 0
    if (hp_win_width / 2 - WindowTextWidth(hp_win, FONT_NAME, win_title) / 2 - 45) < WindowTextWidth(hp_win, FONT_NAME, bank_info) then
        win_title_left = hp_win_width - WindowTextWidth(hp_win, FONT_NAME, win_title) -45 - WindowTextWidth(hp_win, FONT_NAME, bank_info)
    else
        win_title_left = hp_win_width / 2 - WindowTextWidth(hp_win, FONT_NAME, win_title) / 2
    end
    WindowText(hp_win, FONT_NAME, win_title,
    win_title_left, top, 0, 0,
    ColourNameToRGB("white"), false)
    -- Bank account info
    WindowText(hp_win, FONT_NAME, bank_info,
    hp_win_width - 6 - WindowTextWidth(hp_win, FONT_NAME, bank_info), top, 0, 0,
    ColourNameToRGB("yellow"), false)

    top = top + 15
    -- ����
    WindowText(hp_win, FONT_NAME, "����",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    Fun_DrawGrid2(hp_win, status.jing, status.jing_curmax, status.jing_max,
    left + title_length, top + 1, grid_length, grid_height,
    0x40FF40, ColourNameToRGB("red"), ColourNameToRGB("white"))
    WindowText(hp_win, FONT_NAME, status.jing .. "/" .. status.jing_curmax .. "(" .. status.jing_pre .. "%)",
    left + title_length + grid_length + 2, top, 0, 0,
    0x40FF40, false)

    top = top + 15
    -- ��Ѫ
    WindowText(hp_win, FONT_NAME, "��Ѫ",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    Fun_DrawGrid2(hp_win, status.qi, status.qi, status.qi_max,
    left + title_length, top + 1, grid_length, grid_height,
    0x40FF40, ColourNameToRGB("red"), ColourNameToRGB("white"))
    WindowText(hp_win, FONT_NAME, status.qi .. "/" .. status.qi_max .. "(" .. status.qi_pre .. "%)",
    left + title_length + grid_length + 2, top, 0, 0,
    0x40FF40, false)

    top = top + 15
    -- ����
    WindowText(hp_win, FONT_NAME, "����",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    if status.jingli > status.jingli_curmax then
        Fun_DrawGrid(hp_win, status.jingli - status.jingli_curmax, status.jingli_curmax,
        left + title_length, top + 1, grid_length, grid_height,
        0xFFDA58, 0xFF6060)
        WindowText(hp_win, FONT_NAME, status.jingli .. "/" .. status.jingli_curmax .. "(" .. status.jingli_canadd .. ")",
        left + title_length + grid_length + 2, top, 0, 0,
        0xFFDA58, false)
    else
        Fun_DrawGrid(hp_win, status.jingli, status.jingli_curmax,
        left + title_length, top + 1, grid_length, grid_height,
        0xFF6060, ColourNameToRGB("white"))
        WindowText(hp_win, FONT_NAME, status.jingli .. "/" .. status.jingli_curmax .. "(" .. status.jingli_canadd .. ")",
        left + title_length + grid_length + 2, top, 0, 0,
        0x40FF40, false)
    end

    top = top + 15
    -- ����
    WindowText(hp_win, FONT_NAME, "����",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    if status.neili > status.neili_curmax then
        Fun_DrawGrid(hp_win, status.neili - status.neili_curmax, status.neili_curmax,
        left + title_length, top + 1, grid_length, grid_height,
        0xFFDA58, 0xFF6060)
        WindowText(hp_win, FONT_NAME, status.neili .. "/" .. status.neili_curmax .. "(" .. status.neili_canadd .. ")",
        left + title_length + grid_length + 2, top, 0, 0,
        0xFFDA58, false)
    else
        Fun_DrawGrid(hp_win, status.neili, status.neili_curmax,
        left + title_length, top + 1, grid_length, grid_height,
        0xFF6060, ColourNameToRGB("white"))
        WindowText(hp_win, FONT_NAME, status.neili .. "/" .. status.neili_curmax .. "(" .. status.neili_canadd .. ")",
        left + title_length + grid_length + 2, top, 0, 0,
        0x40FF40, false)
    end

    top = top + 15
    -- ʳ��
    WindowText(hp_win, FONT_NAME, "ʳ��",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    Fun_DrawGrid(hp_win, status.shiwu, status.shiwu_max,
    left + title_length, top + 1, grid_length, grid_height,
    0x58A7FF, ColourNameToRGB("white"))
    WindowText(hp_win, FONT_NAME, status.shiwu .. "%",
    left + title_length + grid_length + 2, top, 0, 0,
    0x40FF40, false)

    -- ���� TEXT
    WindowText(hp_win, FONT_NAME, "������",
    hp_win_width - 6 - WindowTextWidth(hp_win, FONT_NAME, "������"), top, 0, 0,
    ColourNameToRGB("white"), false)

    top = top + 15
    -- ��ˮ
    WindowText(hp_win, FONT_NAME, "��ˮ",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    Fun_DrawGrid(hp_win, status.yinsui, status.yinsui_max,
    left + title_length, top + 1, grid_length, grid_height,
    0x58A7FF, ColourNameToRGB("white"))
    WindowText(hp_win, FONT_NAME, status.yinsui .. "%",
    left + title_length + grid_length + 2, top, 0, 0,
    0x40FF40, false)

    -- ����ֵ
    -- local timetext = Fun_TimeChangeText(status.fullmetime)
    WindowText(hp_win, FONT_NAME, status.heqi,
    hp_win_width - 6 - WindowTextWidth(hp_win, FONT_NAME, status.heqi), top, 0, 0,
    ColourNameToRGB("white"), false)

    top = top + 15
    -- Ǳ��
    WindowText(hp_win, FONT_NAME, "Ǳ��",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    WindowText(hp_win, FONT_NAME, format_number(status.pot) .. "(" .. status.pot_lastadd .. ")",
    left + title_length, top, 0, 0,
    0x40FF40, false)

    if status.yun == 1 then
        -- �˾���
        WindowText(hp_win, FONT_NAME, "������",
        hp_win_width - 41, top, 0, 0,
        ColourNameToRGB("yellow"), false)
    elseif status.yun == 2 then
        WindowText(hp_win, FONT_NAME, "�˾���",
        hp_win_width - 41, top, 0, 0,
        0xFFDA58, false)
    end

    top = top + 15
    -- ����
    WindowText(hp_win, FONT_NAME, "����",
    left, top, 0, 0,
    ColourNameToRGB("white"), false)
    WindowText(hp_win, FONT_NAME, status.exp .. "(" .. status.exp_lastadd .. ")",
    left + title_length, top, 0, 0,
    0x40FF40, false)

    -- ��
    -- WindowText (hp_win, FONT_NAME, status.week,
    --             hp_win_width - 55 - WindowTextWidth (hp_win, FONT_NAME, status.week), top, 0, 0,
    --             ColourNameToRGB ("white"), false)

    -- ̫������
    if status.jiali == true then
        WindowText(hp_win, FONT_NAME, "�˹���",
        hp_win_width - 41, top, 0, 0,
        ColourNameToRGB("red"), false)
        ---------//��BUFF�Զ�BUFF
        -- else
        -- Execute("BUFF");
    end

    -- ���������Ϣ

    -- local quest_name=GetPluginVariable ("", "Q_name")
    -- local quest_location=GetPluginVariable ("", "Q_location")
    -- local quest_status=GetPluginVariable ("", "Q_status")
    -- local quest_misc=GetPluginVariable ("", "Q_misc")
    -- local quest_misc2=GetPluginVariable ("", "Q_misc2")
    -- local quest_qishi = GetVariable("Q_qishi");
    -- if quest_name==nil then quest_name="" end
    -- if quest_location==nil then quest_location="" end
    -- if quest_status==nil then quest_status="" end
    -- if quest_misc==nil then quest_misc="" end
    -- if quest_misc2==nil then quest_misc2="" end
    -- if quest_qishi==nil then quest_qishi="0" end

    top = top + 15
    WindowText(hp_win, FONT_NAME, "����" .. quest.name,
    left - 1, top, 0, 0, ColourNameToRGB("white"), false)
    WindowText(hp_win, FONT_NAME, "�ص㣺" .. quest.location,
    left + 130, top, 0, 0, ColourNameToRGB("white"), false)
    top = top + 15
    WindowText(hp_win, FONT_NAME, "״̬��" .. quest.status,
    left, top, 0, 0, ColourNameToRGB("white"), false)
    WindowText(hp_win, FONT_NAME, "Ŀ�꣺" .. quest.target,
    left + 130, top, 0, 0, ColourNameToRGB("white"), false)
    top = top + 15
    WindowText(hp_win, FONT_NAME, "������" .. quest.misc,
    left, top, 0, 0, ColourNameToRGB("white"), false)
    top = top + 15
    WindowText(hp_win, FONT_NAME, "��ע��" .. quest.misc2,
    left, top, 0, 0, ColourNameToRGB("white"), false)

    WindowShow(hp_win, true)
    movewindow.save_state(hp_win)
end

-- ------------------------------------
-- hpbrief����
-- ------------------------------------
function hp_hpbrief(w)
    local Lastexp = status.exp
    local LastPot = status.pot

    status.exp = w.exp
    status.pot = tonumber(w.pot)
    status.neili_curmax = tonumber(w.neili_max)
    status.neili = tonumber(w.neili)
    status.jingli_curmax = tonumber(w.jingli_max)
    status.jingli = tonumber(w.jingli)
    status.qi_max = tonumber(w.qixue_max)
    status.qi_curmax = tonumber(w.qixue)
    status.qi = tonumber(w.qixue)
    status.jing_max = tonumber(w.jingxue_max)
    status.jing_curmax = tonumber(w.jingxue)
    status.jing = tonumber(w.jingxue)
    status.heqi = tonumber(w.heqi)

    status.jing_pre = math.floor(status.jing_curmax * 100 / status.jing_max)
    status.qi_pre = math.floor(status.qi_curmax * 100 / status.qi_max)

    if Lastexp ~= "0" and Lastexp ~= status.exp then
        status.exp_lastadd = Fun_ChangeKM(status.exp) - Fun_ChangeKM(Lastexp)
        if status.exp_lastadd > 0 then
            status.exp_lastadd = "+" .. status.exp_lastadd
        end
    end

    if LastPot ~= 0 and LastPot ~= status.pot then
        status.pot_lastadd = status.pot - LastPot
        if status.pot_lastadd > 0 then
            status.pot_lastadd = "+" .. status.pot_lastadd
        end
    end


    Status.HP = tonumber(w.qixue)
    Status.HP_MAX = tonumber(w.qixue_max)
    Status.HP_UP = tonumber(w.qixue)
    Status.JL = tonumber(w.jingli)
    Status.JL_MAX = tonumber(w.jingxue_max)
    Status.JL_UP = tonumber(w.jingxue)
    Status.JINGLI = tonumber(w.jingxue)
    Status.JINGLI_MAX = tonumber(w.jingli_max)
    Status.NEILI = tonumber(w.neili)
    Status.NEILI_MAX = tonumber(w.neili_max)
    Status.S_POT = tonumber(w.pot)

    hp_draw_win()
end
-- ------------------------------------
-- ������Ѫ�������;���
-- ------------------------------------
function hp_jingqishen(w)
    status.jing = tonumber(w[1])
    status.jing_curmax = tonumber(w[2])
    status.jing_pre = tonumber(w[3])
    status.jing_max = tonumber(status.jing_curmax * 100 / status.jing_pre)
    status.jingli = tonumber(w[4])
    status.jingli_curmax = tonumber(w[5])
    status.qi = tonumber(w[6])
    status.qi_curmax = tonumber(w[7])
    status.qi_pre = tonumber(w[8])
    status.qi_max = tonumber(status.qi_curmax * 100 / status.qi_pre)
    status.neili = tonumber(w[9])
    status.neili_curmax = tonumber(w[10])
    -- print(w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9],w[10])

    SetVariable("HP", w[6])
    SetVariable("NEILI", w[9])
    SetVariable("NEILI_MAX", w[10])

    hp_draw_win()
end
-- ------------------------------------
-- ʳ�����ˮ
-- ------------------------------------
function hp_shiwuyinshui(w)
    status.shiwu = w.food
    status.shiwu_max = 100
    -- status.pot = w[3]
    status.yinsui = w.water
    status.yinsui_max = 100
    status.heqi = tonumber(w.heqi)
    -- status.exp = w[6]

    hp_draw_win()

    SetVariable("S_FOOD", status.shiwu)
    SetVariable("S_WATER", status.yinsui)
end
-- ------------------------------------
-- ����ֵ
-- ------------------------------------
function hp_heqi(w)
    status.heqi = tonumber(w.heqi)
end
-- ------------------------------------
-- ������
-- ------------------------------------
function hp_yunqi()
    status.yun = 1
    status.yuntime = 0
    hp_draw_win()
end
-- ------------------------------------
-- �˾���
-- ------------------------------------
function hp_yunjing()
    status.yun = 2
    status.yuntime = 0
    hp_draw_win()
end
-- ------------------------------------
-- ����������
-- ------------------------------------
function hp_yunover()
    status.yun = 0
    hp_draw_win()
end
-- ------------------------------------
-- yun powerup����
-- ------------------------------------
function hp_jiali()
    status.jiali = true
    hp_draw_win()
end
-- ------------------------------------
-- yun powerup��������
-- ------------------------------------
function hp_jialiover()
    status.jiali = false
    hp_draw_win()
end
-- ------------------------------------
-- �����������
-- ------------------------------------
function quest_update(w)
    quest.name = w.name
    quest.target = w.target
    quest.status = w.status
    quest.location = w.location
    quest.misc = w.desc
    quest.misc2 = w.note
    hp_draw_win()
end

-- ------------------------------------
-- jifa����
-- ------------------------------------
function hp_jifaupdate(w)
    status.jingli_canadd = tonumber(w[1]) * 10 - status.jingli_curmax
    if status.neili_canadd == 0 then
        status.neili_canadd = tonumber(w[1]) * 10 - status.neili_curmax
    end
    hp_draw_win()
end

-- ------------------------------------
-- maxneili����
-- ------------------------------------
function hp_maxnlupdate(w)
    status.neili_canadd = tonumber(w[1]) - status.neili_curmax
    -- print(w[1])
    hp_draw_win()
end

-- ------------------------------------
-- bank info
-- ------------------------------------
function hp_bank(w)
    local a, b, c = string.find(l, "��(%S+)���ƽ�")
    if c then
        bank_balance = Fun_CHNum(c)
    end
    a, b, c = string.find(l, "�����ǣ�(%S+)���ƽ�")
    if c then
        bank_limit = Fun_CHNum(c)
    end
    if bank_balance == nil then
        bank_info = "0(0%)"
        return
    end
    local balance = format_number(bank_balance)
    if bank_limit == nil then
        bank_info = balance .. "(0%)"
        return
    end
    bank_balance = tonumber(bank_balance)
    bank_limit = tonumber(bank_limit)
    local bank_percent = math.floor(bank_balance * 100 / bank_limit)
    bank_info = balance .. "(" .. bank_percent .. "%)"
end


---------------------------------------------------------------------------
local HideTriggerList =
{
    "^#(.+),(.+),(\\d+),(\\d+),(\\d+),(\\d+)",
}
function AddHideTriggerList()
    for i = 1, #HideTriggerList do
        Fun_AddTriggerHide("trigger_hp_hd_" .. i, HideTriggerList[i], "hp_temp", "")
    end
end

---------------------------------------------------------------------------
function hp_status(w)
    if w[1] == "on" then
        -- ��hpbrief timer
        EnableGroup("hp_temp", true)
        EnableTimer("timer_hp", true)
    elseif w[1] == "off" then
        -- �ر�hpbrief timer
        EnableGroup("hp_temp", true)
        EnableTimer("timer_hp", false)
    elseif w[1] == "refresh" then
        -- �ֶ�ˢ��hp״̬��������
        hp_draw_win()
    elseif w[1] == "reset" then
        -- reset����
        -- 	WindowDelete(hp_win)
        WindowCreate(hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
        movewindow.save_state(hp_win)
        movewindow.add_drag_handler(hp_win, 0, 0, hp_win_width, 30)
        WindowFont(hp_win, FONT_NAME, "Arial", FONT_SIZE)
        hp_draw_win()
        -- show_skill_win=true
    end
end

function battle_status(w)
    if w[1] == "on" then
        EnableGroup("battle", true)
    elseif w[1] == "off" then
        EnableGroup("battle", false)
    end
end
---------------------------------------------------------------------------
-- ��ʱ��ѯ
function hp_ontime()
    SendNoEcho("hp")
end
function hp_week()
    EnableGroup("week_ignore", true)
    SendNoEcho("time")
    SendNoEcho("hp")
end
function hp_fullme()
    fullme_timer2 = utils.timer()
    status.fullmetime = math.floor(fullme_timer2 - fullme_timer1)
    hp_draw_win()
end
---------------------------------------------------------------------------
function AddStatus_Bar_Timer()
    Fun_AddTimer("timer_hp", 1, "hp", "hp_ontime")
    Fun_AddTimer("timer_week", 180, "hp", "hp_week")
    Fun_AddTimer("timer_fullme", 2, "hp", "hp_fullme")
    Fun_AddTimer("battle_heal", 1, "battle", "Battle.TryHeal")
end

-- ����������Ϣ -----------------------------------------------------------
-- fullme_timer1=utils.timer()
-- fullme_timer2=fullme_timer1
-- EnableGroup("skill", true)
-- EnableGroup("skill_temp", false)
EnableGroup("hp_temp", true)
EnableGroup("hp", true)
EnableTimer("timer_hp", false)
EnableTimer("battle_heal", true)
-- Control End -------------------------------------------------------------

function Status_Bar_Install()
    -- Note("OnPluginInstall")
    print("��ʼ�� StatusBar ״̬��� ���")
    ------------------------------------------------------------------------
    -- Init ��ʼ��Status_bar
    WindowCreate(hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
    local hp_win_info = movewindow.install(hp_win, miniwin.pos_bottom_left, miniwin.create_absolute_location, true)
    WindowCreate(hp_win, hp_win_info.window_left, hp_win_info.window_top, hp_win_width, hp_win_height, hp_win_info.window_mode, hp_win_info.window_flags, 0x000010)
    movewindow.add_drag_handler(hp_win, 0, 0, hp_win_width, 30)
    WindowFont(hp_win, FONT_NAME, "Arial", FONT_SIZE)
    -- ��ʼ��Status_bar -- ��� ------------------------------------------------
end

function Status_Bar_Close()
    -- Note("OnPluginClose")
    if GetPluginInfo(GetPluginID(), 17) then
        OnPluginDisable()
    end
end

function Status_Bar_Enable()
    -- Note("OnPluginEnable")
    WindowShow(hp_win, true)
    -- if we are connected when the plugin loads, it must have been reloaded while playing
    if IsConnected() then
    end
    -- if already connected
    OnPluginSaveState()
end -- OnPluginEnable

function Status_Bar_SaveState()
    -- Note("OnPluginSaveState")
    -- save window current location for next time
    SetVariable("enabled", tostring(GetPluginInfo(GetPluginID(), 17)))
    movewindow.save_state(hp_win)

    -- SetVariable("actorname", actorname)
end --  OnPluginSaveState

function Status_Bar_Disable()
    -- Note("OnPluginDisable")
    WindowShow(hp_win, false)
    OnPluginSaveState()
end

function Activate()
    EnableGroup("hp_temp", true)
    EnableGroup("hp", true)
end

----------------------------------------------------------------------
-- Init Status_Bar Extension()
----------------------------------------------------------------------
function Init()
    Status_Bar_Install()
    -- AddTriggerList()
    -- AddStatus_Bar_Timer()
    -- AddHideTriggerList()
    Activate()
end

