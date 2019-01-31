--
-- StatusBar.lua
--
-- ----------------------------------------------------------
-- 状态栏扩展, 由北侠状态插件修改而来, 不再使用插件方式,  而改为lua模组方式
-- 原作者: 休莱格
-- edit: 苍月(vingi)
--[[ 
  history: 
    休莱格根据渡枫根据iceoo的状态插件改编：
    修改了Hpbrief的机制,和战斗关联,自动掉血掉精时打开,自动恢复,恢复完后自动关闭
    在你的任务机器里可以添加5个mush全局变量：
    Q_name: 任务名字
    Q_location: 任务地点
    Q_status: 任务进行状态
    Q_misc: 其它你需要显示的信息
    Q_misc2: 其它你需要显示的信息
    #设置Variable:Common_ID为你自己的id,可在重伤时自动治疗(相关代码注释)
    #设置完后请重载插件
    设置Alias:BATTLE_ON和BATTLE_OFF分别为战斗开始时和战斗结束时做的事,设置后不用重载
    设置Alias:HEAL_HARD;HEAL_NORMAL分别为重伤治疗和中等伤害治疗,中等伤害治疗可设为yun lifeheal 自己的id
    #修改BUFF的触发并设置Alias:BUFF,可自动无缝BUFF(相关代码注释)
--]]
-- ----------------------------------------------------------
--

module("StatusBar", package.seeall)

require "movewindow"
require "gauge"
require "serialize"

SetOption ("convert_ga_to_newline", 1)
SendNoEcho("unset hpbrief");

print("人物状态插件已装载，命令：hps [on][off][refresh]")
-- print(GetPluginID())


-- 公用
local FONT_NAME = "f1"
local FONT_SIZE = "9"

-- HP用
local hp_checktime = 60
local hp_checktimecur = hp_checktime
local hp_win = "hp_window"
local hp_win_width = 300
local hp_win_height = 211

local actorname = ""--GetVariable("actorname") or utils.inputbox("输入你的角色名称")



---------------------------------------------------------------------------
-- 公用的一些函数和定义
---------------------------------------------------------------------------

--[[
	Fun_AddAlias(name,match,group,script)		---自定义AddAlias函数
	Fun_AddAliasRE(name,match,group,script)		---自定义AddAlias函数(带正则表达式)
	Fun_AddTrigger(name,match,group,script)		---自定义AddTrigger函数，同时会加入组
	Fun_AddTriggerHide(name,match,group,script)		---隐藏某些显示，同时会加入组
	Fun_AddTimer(name,time,group,script)		---自定义AddTime函数 注意是正则表达式模式
	Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)							---自定义绘制进度条
	Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)		---自定义绘制进度条2个进度
	Fun_ChangeKM(value)							---修改经验的K、M为正常数值模式
	Fun_TimeChangeText(Time)					---把秒换算成以天、小时、分钟、秒显示的文字
	Fun_TimeChange(Time)						---把秒换算成以小时、分钟、秒
	Fun_CHNum(str)								---把中文数字转换成正常数字
]]	


-- ------------------------------------
-- 描述: HPBrief发送
-- ------------------------------------
Common = Common or nil;
Common_tInstanceVoid = {};
Common_InstanceRun = function(pVoid, nTime, vParam)
	local strKey = tostring(pVoid);
	if strKey == nil or strKey == "" then return false; end
	if Common_tInstanceVoid[strKey] ~= nil then return false; end
	if nTime == nil then nTime = 2; end
	Common_tInstanceVoid[strKey] = 1;
	pVoid(vParam);
	DoAfterSpecial(nTime, "Common_InstanceReset(\"" .. strKey .. "\")", 12);
	return true;
end
Common_InstanceReset = function(strKey)
	if strKey == nil or strKey == "" then return; end
	Common_tInstanceVoid[strKey] = nil;
end
Common_Hpbrief = function()
	Common_InstanceRun(hp_ontime, 1);
end

local nPluginIDStatus = "";
function GetPluginVariableSave(strKey)
	--local strValue = GetVariable(strKey);
	--if strValue == nil then strValue = "10000"; end
	--return strValue;
	return tonumber(strKey) or 1000;
end

Status = Status or {};

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
-- 描述: 战斗相关
-- ------------------------------------
-- Battle = Battle or {};
-- Battle.bBattle = false;
-- Battle.Damaged = function(num, str, args)
-- 	Note("============== HP: " .. args[2] .. "\% / " .. args[3] .. "\% ===== 受伤:" .. args[1] .. " ==============");
-- 	Battle.FightStart();
-- 	Common_Hpbrief();
-- end

-- Battle.Poison = function(num, str, args)
-- 	Note("============== HP: " .. args[3] .. "\% / " .. args[4] .. "\% ===== 中毒-" .. args[2] .. ":" .. args[1] .. " ==============");
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
-- 			--处理超重伤
-- 			Execute("HEAL_HARD");
-- 			bHp = true;
-- 		elseif nHpUp < nHpMax/2 then
-- 			--if GetVariable("Q_name") ~= "破阵" and Common_id ~= nil and Common_id ~= "" then
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
-- 		]]--有Busy
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
-- 		Note("战斗开始");
-- 		SendNoEcho("set BATTLE 1");
-- 		Execute("hps on");
-- 		Execute("BATTLE_ON");
-- 		EnableGroup("battle_check", true);
-- 	end
-- 	Battle.bBattle = true;
-- end

-- Battle.FightOverAction = function()
-- 	if Battle.bBattle == true then
-- 		Note("战斗结束");
-- 		SendNoEcho("set BATTLE 0");
-- 		Execute("hps off");
-- 		Execute("BATTLE_OFF");
-- 		EnableGroup("battle_check", false);
-- 	end
-- 	Battle.bBattle = false;
-- end

-- Battle.SetPower = function(nPower)
-- --	Note("||气势: " .. nPower .. "||")
-- 	SetVariable("Q_qishi", tostring(nPower));
-- 	Battle.FightStart();
-- end


	
	
-- ------------------------------------
-- 描述: 修改经验的K、M为正常数值模式
-- ------------------------------------
function Fun_ChangeKM(value)
	local num = 0

	if string.find (value, "K")~=nil then
		num = math.floor(tonumber((string.gsub(value, "K", ""))*1000))
	elseif string.find (value, "M")~=nil then
		num = math.floor(tonumber((string.gsub(value, "M", ""))*1000000))
	else
		num = math.floor(tonumber(value))
	end
	
	return num
end

-- ------------------------------------
-- 描述: 把秒换算成以天、小时、分钟、秒显示的文字
-- ------------------------------------
function Fun_TimeChangeText(Time)
	local szText = ''
	local nTime = 0;
	
	local Day = math.floor(Time / (3600 * 24))
	if Day > 0 then
		nTime = 60;
		szText = szText..Day..'天'
		Time = math.fmod(Time, (3600 * 24))
	end
	
	local Hour = math.floor(Time / 3600)
	if Hour > 0 then
		nTime = 60;
		szText = szText..Hour..'小时'
		Time = math.fmod(Time, 3600)
	end
	
	local Min = math.floor(Time / 60)
	if Min > 0 then
		nTime = nTime + Min;
		szText = szText..Min..'分'
		Time = math.fmod(Time, 60);	
		SetVariable("FULLME_TIME", "" .. nTime);
	end
	
	szText = szText..Time..'秒'
	
	return szText
end

-- ------------------------------------
-- 描述: 把秒换算成以小时、分钟、秒
-- ------------------------------------
function Fun_TimeChange(Time)
	local Hour = math.floor(Time / 3600)
	Time = math.fmod(Time, 3600)	
	local Min = math.floor(Time / 60)
	local Sec = math.fmod(Time, 60)
	
	return Hour,Min,Sec
end

local CH_NUM =
{
	["一"] = 1,
	["二"] = 2,
	["三"] = 3,
	["四"] = 4,
	["五"] = 5,
	["六"] = 6,
	["七"] = 7,
	["八"] = 8,
	["九"] = 9,
}
-- ------------------------------------
-- 描述: 把中文数字转换成正常数字
-- ------------------------------------
function Fun_CHNum(str)
	if (#str % 2) ==1 then
		return 0
	end
	result=0
	wan=1
	unit=1
	for i=#str -2 ,0,-2 do
		char=string.sub(str,i+1,i+2)
		if (char=="十") then
			unit=10*wan
			if (i==0) then
				result=result+unit
			elseif CH_NUM[string.sub(str,i-1,i)]==nil then
				result=result+unit
			end
		elseif (char=="百") then
			unit=100*wan
		elseif (char=="千") then
			unit=1000*wan
		elseif (char=="万") then
			unit=10000*wan
			wan=10000
		else
			if CH_NUM[char]~=nil then
				result=result+CH_NUM[char]*unit
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
-- 状态模块
---------------------------------------------------------------------------

status =
{
	-- 精神
	jing = 1000,
	jing_curmax = 1000,
	jing_max = 1000,
	jing_pre = 100,
	
	-- 气血
	qi = 1000,
	qi_curmax = 1000,
	qi_max = 1000,
	qi_pre = 100,
	
	-- 精力
	jingli = 10000,
	jingli_curmax = 10000,
	jingli_canadd = 0,
	
	-- 内力
	neili = 10000,
	neili_curmax = 10000,
	neili_canadd = 0,
	
	-- 真气
	heqi = 0,
	
	-- 食物
	shiwu = 1000,
	shiwu_max = 1000,
	
	-- 饮水
	yinsui = 1000,
	yinsui_max = 1000,
	
	-- 潜能
	pot = 0,
	pot_lastadd = 0,
	
	-- 经验
	exp = "0",
	exp_lastadd = 0,
	
	-- 运气精 1运气2运精
	yun = 0,
	yuntime = 0,
	-- 太极加力
	jiali = false,
	
}

-- 任务相关
quest = {
	name = "",
	target = "",
	location = "",
	status = "",
	misc = "",
	misc2 = ""
}


---------------------------------------------------------------------------
-- 记录生命信息
---------------------------------------------------------------------------

-- ------------------------------------
-- 绘制窗口
-- ------------------------------------
function hp_draw_win()
	-- if status.zhenqi_per>0 then
	-- 	WindowResize(hp_win, hp_win_width, hp_win_height+15, 0x000010)
	-- 	WindowCircleOp (hp_win, miniwin.circle_round_rectangle, 0, 2, hp_win_width - 2, hp_win_height+15, 0xc0c0c0, 0, 1,0, 0, 9, 9)
	-- else
		WindowCircleOp (hp_win, miniwin.circle_round_rectangle, 0, 2, hp_win_width - 2, hp_win_height, 0xc0c0c0, 0, 1,0, 0, 9, 9)
	-- end
	local left = 5
	local top = 10
	local title_length = 28
	local titletarger_length = 75
	local grid_length = 100
	local grid_height = 12
	
	-- Title & Bank account information
	local win_title=GetPluginVariable ("", "id_ch")
	if win_title==nil then win_title="" end
	win_title=win_title.."当前状态"
	if bank_info==nil then bank_info="0(0%)" end
	local win_title_left=0
	if (hp_win_width/2 - WindowTextWidth(hp_win, FONT_NAME, win_title)/2 - 45) < WindowTextWidth (hp_win, FONT_NAME, bank_info) then
		win_title_left = hp_win_width - WindowTextWidth(hp_win, FONT_NAME, win_title) - 45 - WindowTextWidth (hp_win, FONT_NAME, bank_info)
	else
		win_title_left = hp_win_width/2 - WindowTextWidth(hp_win, FONT_NAME, win_title)/2
	end
	WindowText (hp_win, FONT_NAME, win_title,
				win_title_left, top, 0, 0,
				ColourNameToRGB ("white"), false)
	-- Bank account info
    WindowText (hp_win, FONT_NAME, bank_info,
                hp_win_width - 6 - WindowTextWidth (hp_win, FONT_NAME, bank_info), top, 0, 0,
                ColourNameToRGB ("yellow"), false)

				top = top + 15		-- 精神
    WindowText (hp_win, FONT_NAME, "精神",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)				
	Fun_DrawGrid2(hp_win, status.jing, status.jing_curmax, status.jing_max,
				left + title_length, top + 1, grid_length, grid_height,
				0x40FF40, ColourNameToRGB("red"), ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, status.jing.."/"..status.jing_curmax.."("..status.jing_pre.."%)",
                left + title_length + grid_length + 2, top, 0, 0,
                0x40FF40, false)
				
	top = top + 15		-- 气血
    WindowText (hp_win, FONT_NAME, "气血",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid2(hp_win, status.qi, status.qi, status.qi_max,
				left + title_length, top + 1, grid_length, grid_height,
				0x40FF40, ColourNameToRGB("red"), ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, status.qi.."/"..status.qi_max.."("..status.qi_pre.."%)",
                left + title_length + grid_length + 2, top, 0, 0,
                0x40FF40, false)
				
	top = top + 15		-- 精力
    WindowText (hp_win, FONT_NAME, "精力",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	if status.jingli > status.jingli_curmax then
		Fun_DrawGrid(hp_win, status.jingli - status.jingli_curmax, status.jingli_curmax,
					left + title_length, top + 1, grid_length, grid_height,
					0xFFDA58, 0xFF6060)
		WindowText (hp_win, FONT_NAME, status.jingli.."/"..status.jingli_curmax.."("..status.jingli_canadd..")",
					left + title_length + grid_length + 2, top, 0, 0,
					0xFFDA58, false)
	else
		Fun_DrawGrid(hp_win, status.jingli, status.jingli_curmax,
					left + title_length, top + 1, grid_length, grid_height,
					0xFF6060, ColourNameToRGB ("white"))
		WindowText (hp_win, FONT_NAME, status.jingli.."/"..status.jingli_curmax.."("..status.jingli_canadd..")",
					left + title_length + grid_length + 2, top, 0, 0,
					0x40FF40, false)
	end
	
	top = top + 15		-- 内力
    WindowText (hp_win, FONT_NAME, "内力",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	if status.neili > status.neili_curmax then
		Fun_DrawGrid(hp_win, status.neili - status.neili_curmax, status.neili_curmax,
					left + title_length, top + 1, grid_length, grid_height,
					0xFFDA58, 0xFF6060)
		WindowText (hp_win, FONT_NAME, status.neili.."/"..status.neili_curmax.."("..status.neili_canadd..")",
					left + title_length + grid_length + 2, top, 0, 0,
					0xFFDA58, false)
	else
		Fun_DrawGrid(hp_win, status.neili, status.neili_curmax,
					left + title_length, top + 1, grid_length, grid_height,
					0xFF6060, ColourNameToRGB ("white"))
		WindowText (hp_win, FONT_NAME, status.neili.."/"..status.neili_curmax.."("..status.neili_canadd..")",
					left + title_length + grid_length + 2, top, 0, 0,
					0x40FF40, false)
	end

	top = top + 15		-- 食物
    WindowText (hp_win, FONT_NAME, "食物",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid(hp_win, status.shiwu, status.shiwu_max,
				left + title_length, top + 1, grid_length, grid_height,
				0x58A7FF, ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, status.shiwu.."%",
                left + title_length + grid_length + 2, top, 0, 0,
                0x40FF40, false)
	
	-- 合气 TEXT
    WindowText (hp_win, FONT_NAME, "合气度",
                hp_win_width - 6 - WindowTextWidth (hp_win, FONT_NAME, "合气度"), top, 0, 0,
                ColourNameToRGB ("white"), false)
	
	top = top + 15		-- 饮水
    WindowText (hp_win, FONT_NAME, "饮水",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid(hp_win, status.yinsui, status.yinsui_max,
				left + title_length, top + 1, grid_length, grid_height,
				0x58A7FF, ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, status.yinsui.."%",
                left + title_length + grid_length + 2, top, 0, 0,
                0x40FF40, false)
	
	-- 合气值
	-- local timetext = Fun_TimeChangeText(status.fullmetime)
    WindowText (hp_win, FONT_NAME, status.heqi,
                hp_win_width - 6 - WindowTextWidth (hp_win, FONT_NAME, status.heqi), top, 0, 0,
                ColourNameToRGB ("white"), false)
	
	top = top + 15		-- 潜能
    WindowText (hp_win, FONT_NAME, "潜能",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
    WindowText (hp_win, FONT_NAME, format_number(status.pot).."("..status.pot_lastadd..")",
                left + title_length, top, 0, 0,
                0x40FF40, false)
	
	if status.yun == 1 then		-- 运精气
		WindowText (hp_win, FONT_NAME, "运气中",
					hp_win_width - 41, top, 0, 0,
					ColourNameToRGB ("yellow"), false)
	elseif status.yun == 2 then
		WindowText (hp_win, FONT_NAME, "运精中",
					hp_win_width - 41, top, 0, 0,
					0xFFDA58, false)
	end
	
	top = top + 15		-- 经验
    WindowText (hp_win, FONT_NAME, "经验",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
    WindowText (hp_win, FONT_NAME, status.exp.."("..status.exp_lastadd..")",
                left + title_length, top, 0, 0,
                0x40FF40, false)

	-- 周
    -- WindowText (hp_win, FONT_NAME, status.week,
    --             hp_win_width - 55 - WindowTextWidth (hp_win, FONT_NAME, status.week), top, 0, 0,
    --             ColourNameToRGB ("white"), false)
	
	-- 太极加力
	if status.jiali == true then
		WindowText (hp_win, FONT_NAME, "运功中",
					hp_win_width - 41, top, 0, 0,
					ColourNameToRGB ("red"), false)
	---------//无BUFF自动BUFF
	--else
	--	Execute("BUFF");
	end
	
	-- 任务相关信息

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
	WindowText (hp_win, FONT_NAME, "任务："..quest.name,
                left-1, top, 0, 0, ColourNameToRGB ("white"), false)
	WindowText (hp_win, FONT_NAME, "地点："..quest.location,
                left+130, top, 0, 0, ColourNameToRGB ("white"), false)
	top = top + 15
	WindowText (hp_win, FONT_NAME, "状态："..quest.status,
                left, top, 0, 0, ColourNameToRGB ("white"), false)
	WindowText (hp_win, FONT_NAME, "目标："..quest.target,
                left+130, top, 0, 0, ColourNameToRGB ("white"), false)
	top = top + 15
	WindowText (hp_win, FONT_NAME, "描述："..quest.misc,
                left, top, 0, 0, ColourNameToRGB ("white"), false)
	top = top + 15
	WindowText (hp_win, FONT_NAME, "备注："..quest.misc2,
                left, top, 0, 0, ColourNameToRGB ("white"), false)
				
	WindowShow (hp_win, true)
	movewindow.save_state(hp_win)
end

-- ------------------------------------
-- hpbrief命令
-- ------------------------------------
function hp_hpbrief(w)
	local Lastexp = status.exp
	local LastPot = status.pot
	
	status.exp 				= w.exp
	status.pot 				= tonumber(w.pot)
	status.neili_curmax 	= tonumber(w.neili_max)
	status.neili 			= tonumber(w.neili)
	status.jingli_curmax 	= tonumber(w.jingli_max)
	status.jingli 			= tonumber(w.jingli)
	status.qi_max 			= tonumber(w.qixue_max)
	status.qi_curmax 		= tonumber(w.qixue)
	status.qi 				= tonumber(w.qixue)
	status.jing_max 		= tonumber(w.jingxue_max)
	status.jing_curmax 		= tonumber(w.jingxue)
	status.jing 			= tonumber(w.jingxue)
	status.heqi             = tonumber(w.heqi)
	
	status.jing_pre = math.floor(status.jing_curmax * 100 / status.jing_max)
	status.qi_pre = math.floor(status.qi_curmax * 100 / status.qi_max)
	
	if Lastexp ~= "0" and Lastexp ~= status.exp then
		status.exp_lastadd = Fun_ChangeKM(status.exp) - Fun_ChangeKM(Lastexp)
		if status.exp_lastadd > 0 then
		   status.exp_lastadd = "+"..status.exp_lastadd
		end
	end
	
	if LastPot ~= 0 and LastPot ~= status.pot then
		status.pot_lastadd = status.pot - LastPot
		if status.pot_lastadd > 0 then
		   status.pot_lastadd = "+"..status.pot_lastadd
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
-- 精神、气血、内力和精力
-- ------------------------------------
function hp_jingqishen(w)
	status.jing				= tonumber(w[1])
	status.jing_curmax		= tonumber(w[2])
	status.jing_pre			= tonumber(w[3])
	status.jing_max			= tonumber(status.jing_curmax*100/status.jing_pre)
	status.jingli			= tonumber(w[4])
	status.jingli_curmax	= tonumber(w[5])
	status.qi				= tonumber(w[6])
	status.qi_curmax		= tonumber(w[7])
	status.qi_pre			= tonumber(w[8])
	status.qi_max			= tonumber(status.qi_curmax*100/status.qi_pre)
	status.neili			= tonumber(w[9])
	status.neili_curmax		= tonumber(w[10])
	--print(w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9],w[10])

	SetVariable("HP", w[6])
	SetVariable("NEILI", w[9])
	SetVariable("NEILI_MAX", w[10])

	hp_draw_win()
end
-- ------------------------------------
-- 食物和饮水
-- ------------------------------------
function hp_shiwuyinshui(w)
	status.shiwu 			= w.food
	status.shiwu_max 		= 100
	--status.pot = w[3]
	status.yinsui 			= w.water
	status.yinsui_max 		= 100
	status.heqi             = tonumber(w.heqi)
		--status.exp = w[6]
	
	hp_draw_win()
	
	SetVariable("S_FOOD", status.shiwu)
	SetVariable("S_WATER", status.yinsui)
end
-- ------------------------------------
-- 合气值
-- ------------------------------------
function hp_heqi(w)
	status.heqi = tonumber(w.heqi)
end
-- ------------------------------------
-- 运气中
-- ------------------------------------
function hp_yunqi()
	status.yun = 1
	status.yuntime = 0
	hp_draw_win()
end
-- ------------------------------------
-- 运精中
-- ------------------------------------
function hp_yunjing()
	status.yun = 2
	status.yuntime = 0
	hp_draw_win()
end
-- ------------------------------------
-- 运气精结束
-- ------------------------------------
function hp_yunover()
	status.yun = 0
	hp_draw_win()
end
-- ------------------------------------
-- yun powerup加力
-- ------------------------------------
function hp_jiali()
	status.jiali = true
	hp_draw_win()
end
-- ------------------------------------
-- yun powerup加力结束
-- ------------------------------------
function hp_jialiover()
	status.jiali = false
	hp_draw_win()
end
-- ------------------------------------
-- 任务区块更新
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
-- jifa更新
-- ------------------------------------
function hp_jifaupdate(w)
	status.jingli_canadd = tonumber(w[1]) * 10 - status.jingli_curmax
	if status.neili_canadd == 0 then
	  status.neili_canadd = tonumber(w[1]) * 10 - status.neili_curmax
	end
	hp_draw_win()
end

-- ------------------------------------
-- maxneili更新
-- ------------------------------------
function hp_maxnlupdate(w)
	status.neili_canadd = tonumber(w[1]) - status.neili_curmax
	--print(w[1])
	hp_draw_win()
end

-- ------------------------------------
-- bank info
-- ------------------------------------
function hp_bank(w)
	local a, b, c = string.find(l, "有(%S+)两黄金")
	if c then
	  bank_balance = Fun_CHNum(c)
	end
	a , b, c = string.find(l, "上限是：(%S+)两黄金")
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
	local bank_percent = math.floor(bank_balance*100/bank_limit)
	bank_info = balance .. "(" .. bank_percent .. "%)"
end


---------------------------------------------------------------------------
local HideTriggerList =
{
	"^#(.+),(.+),(\\d+),(\\d+),(\\d+),(\\d+)",
}
function AddHideTriggerList()
	for i=1,#HideTriggerList do
		Fun_AddTriggerHide("trigger_hp_hd_"..i, HideTriggerList[i], "hp_temp", "")
	end
end
---------------------------------------------------------------------------
-- 临时隐藏time文字触发器
local TempTimeHideTriggerList =
{
	"^北大侠客行已经执行了.*",
	"^(> )*\\s悉尼时间是 星期.*",
	"^(> )*\\s*奥克兰、惠灵顿时间是 星期.*",
	"^(> )*\\s*温哥华、洛杉矶时间是 星期.*",
	"^(> )*\\s*多伦多、纽约时间是 星期(.*)",
	"^(> )*\\s*柏林、罗马、巴黎时间是 星期(.*)",
	"^$",
}
function AddTempTimeHideTrigger()
	for i=1,#TempTimeHideTriggerList do
		Fun_AddTriggerHide("trigger_time_temp_hd_"..i, TempTimeHideTriggerList[i], "week_temp", "")
	end
end

---------------------------------------------------------------------------
function hp_status(w)
	if w[1]=="on" then		-- 打开hpbrief timer
		EnableGroup("hp_temp",true)
		EnableTimer("timer_hp", true)
	elseif w[1]=="off" then		-- 关闭hpbrief timer
		EnableGroup("hp_temp",true)
		EnableTimer("timer_hp", false)
	elseif w[1]=="refresh" then		-- 手动刷新hp状态窗口内容
		hp_draw_win()
	elseif w[1]=="reset" then		-- reset窗口
--		WindowDelete(hp_win)
		WindowCreate (hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
		movewindow.save_state(hp_win)
		movewindow.add_drag_handler (hp_win, 0, 0, hp_win_width, 30)
		WindowFont (hp_win, FONT_NAME, "Arial", FONT_SIZE)
		hp_draw_win()
		-- show_skill_win=true
	end
end

function battle_status(w)
	if w[1]=="on" then
		EnableGroup("battle", true)
	elseif w[1]=="off" then
		EnableGroup("battle", false)
	end
end
---------------------------------------------------------------------------
-- 定时查询
function hp_ontime()
	SendNoEcho("hp")
end
function hp_week()
	EnableGroup("week_temp", true)
	SendNoEcho("time")
	SendNoEcho("hp")
	DoAfterSpecial(2, 'EnableGroup("week_temp", false)', 12)
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

-- 开启技能信息 -----------------------------------------------------------
-- fullme_timer1=utils.timer()
-- fullme_timer2=fullme_timer1
-- EnableGroup("skill", true)
-- EnableGroup("skill_temp", false)
EnableGroup("week_temp", false)
EnableGroup("hp_temp", true)
EnableGroup("hp", true)
EnableTimer("timer_hp", false)
EnableTimer("battle_heal", true)
-- Control End -------------------------------------------------------------

function Status_Bar_Install()
  -- Note("OnPluginInstall")
  print("初始化 StatusBar 状态插件 完成")
  ------------------------------------------------------------------------
  -- Init 初始化Status_bar 
	WindowCreate (hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
	local hp_win_info = movewindow.install (hp_win, miniwin.pos_bottom_left, miniwin.create_absolute_location, true)
	WindowCreate(hp_win, hp_win_info.window_left, hp_win_info.window_top, hp_win_width, hp_win_height, hp_win_info.window_mode, hp_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (hp_win, 0, 0, hp_win_width, 30)
  WindowFont (hp_win, FONT_NAME, "Arial", FONT_SIZE)
  -- 初始化Status_bar -- 完成 ------------------------------------------------ 
end

function Status_Bar_Close ()
	--Note("OnPluginClose")
   if GetPluginInfo(GetPluginID(), 17) then
      OnPluginDisable()
   end
end

function Status_Bar_Enable ()
	--Note("OnPluginEnable")
   WindowShow(hp_win, true)
   -- if we are connected when the plugin loads, it must have been reloaded while playing
   if IsConnected() then
   end -- if already connected
   OnPluginSaveState()
end -- OnPluginEnable

function Status_Bar_SaveState()
	--Note("OnPluginSaveState")
   -- save window current location for next time  
   SetVariable("enabled", tostring (GetPluginInfo (GetPluginID(), 17)))
   movewindow.save_state(hp_win)
   
   --SetVariable("actorname", actorname)
end --  OnPluginSaveState

function Status_Bar_Disable()
	--Note("OnPluginDisable")
   WindowShow(hp_win, false)
   OnPluginSaveState()
end

----------------------------------------------------------------------
-- Init Status_Bar Extension()
----------------------------------------------------------------------
function Init()
	Status_Bar_Install()
	-- AddTriggerList()
	-- AddStatus_Bar_Timer()
	-- AddHideTriggerList()
	-- AddTempTimeHideTrigger()
	-- hp_hpbrief(stus)
end

