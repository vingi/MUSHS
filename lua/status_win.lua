require "movewindow"
require "gauge"
require "serialize"

-- ����
local FONT_NAME = "f1"
local FONT_SIZE = "9"

-- HP��
local hp_win = "hp_window"
local hp_win_width = 260
local hp_win_height = 183

-- ������
local skill_win = "skill_window"
local skill_win_width = 260
local skill_win_height = 10

-- ������
local task_win="task_window"
local task_win_width=260
local task_win_height=100


status_win =
{
    new=function()
     local st={}
	 setmetatable(st,{__index=status_win})
	 return st
   end,
    --

	-- ����
	jing = 100,
	jing_max = 100,
	jing_pre = 100,

	-- ��Ѫ
	qi = 100,
	qi_max = 100,
	qi_pre = 100,

	-- ����
	jingli = 100,
	jingli_max = 100,
	jingli_limit=0,

	-- ����
	neili = 100,
	neili_max = 100,
	neili_limit=100,

	-- ʳ��
	food = 100,
	max_food=100,
	-- ��ˮ
	water = 100,
	max_water=100,


	-- Ǳ��
	pot = 0,
    max_pot=0, --���Ǳ��

	-- ����
	exps = 0,
	exps_percent = 0, --����ٷֱ�

	jiali = 1,
	jiajing=1,
	VERSION = 1.0,   -- for querying by plugins

}

---------------------------------------------------------------------------
-- ���õ�һЩ�����Ͷ���
---------------------------------------------------------------------------

--[[
	Alarm()				---������
	Run(cmdtext)		---�Զ���ִ������
	RunWait(WaitTime)	---����ȴ����������
	RunNextCmd()		---����������������
	RunClear()			---����������
	Printlog()			---��ӡ��ʱ��¼����
	ChangeModel()		---�ı�ģʽ
	Fun_AddAlias(name,match,group,script)		---�Զ���AddAlias����
	Fun_AddAliasRE(name,match,group,script)		---�Զ���AddAlias����(��������ʽ)
	Fun_AddTrigger(name,match,group,script)		---�Զ���AddTrigger������ͬʱ�������
	Fun_AddTriggerHide(name,match,group,script)		---����ĳЩ��ʾ��ͬʱ�������
	Fun_AddTimer(name,time,group,script)		---�Զ���AddTime���� ע����������ʽģʽ
	Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)							---�Զ�����ƽ�����
	Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)		---�Զ�����ƽ�����2������
	Fun_ChangeKM(value)							---�޸ľ����K��MΪ������ֵģʽ
	Fun_AddTaskData(taskname, taskaim)			---������������
	Fun_TimeChangeText(Time)					---���뻻������졢Сʱ�����ӡ�����ʾ������
	Fun_TimeChange(Time)						---���뻻�����Сʱ�����ӡ���
	Fun_CHNum(str)								---����������ת������������
	Fun_GetBackPath(strgo)						---����·����ȡ����·��
]]

-- ------------------------------------
-- ����: �Զ�����ƽ�����
-- ------------------------------------
local function Fun_DrawGrid(win, cur, max, left, top, width, height, curcolor, maxcolor)
	gauge (win, "", cur, max,
			left, top, width, height,
			curcolor, maxcolor,
			0, 0x000000, 0x000000, 0x000000)
end
-- ------------------------------------
-- ����: �Զ�����ƽ�����2������
-- ------------------------------------
local function Fun_DrawGrid2(win, cur, curmax, max, left, top, width, height, curcolor, curmaxcolor, maxcolor)
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

---------------------------------------------------------------------------
-- ״̬ģ��
---------------------------------------------------------------------------


function status_win:init(hp,lw,task)
-- ��ʼ��
  if hp~=nil then
   self.jing=hp.jingxue

   self.jing_max=hp.jingxue_max
   self.jing_pre=hp.jingxue_per

   self.qi=hp.qixue
   self.qi_max=hp.qixue_max
   self.qi_pre=hp.qixue_per

   self.jingli=hp.jingli
   self.jingli_max=hp.jingli_max
   self.jingli_limit=hp.jingli_lim


   self.neili=hp.neili
   self.neili_max=hp.neili_max
   self.neili_limit=hp.neili_lim

   self.jiali=hp.jiali

  self.food=hp.food
  if hp.max_food~=nil then
     self.max_food=hp.max_food
  end
  self.water=hp.water
  if hp.max_drink~=nil then
     self.max_water=hp.max_drink
  end
  self.pot=hp.pot
  self.max_pot=hp.pot_max
  self.exps=hp.exp
  self.exps_percent=hp.exp_per
 end
 -- seitre �޸��鷳���� ֱ�ӵ�����ֵ
  if job.expAvg ~= nil then
  self.expAvg=job.expAvg
  else
  self.expAvg=0	
  end

  ----------------skills--------------
 if lw~=nil then
  self.max_level=lw.max_level
  self.skills=lw.me_skills
 end

  if task~=nil then
     self.task_name=task.task_name
	 self.task_stepname=task.task_stepname
	 self.task_step=task.task_step
	 self.task_maxsteps=task.task_maxsteps
	 self.task_location=task.task_location
	 self.task_description=task.task_description
  end
end

-- ------------------------------------
-- ���ƴ���
-- ------------------------------------
function status_win:hp_draw_win()
	SetVariable ("mw_hp_window_windowx",930)
    SetVariable ("mw_hp_window_windowy",100)
    WindowCreate (hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
	local hp_win_info = movewindow.install (hp_win, miniwin.pos_bottom_left, miniwin.create_absolute_location, true)
	WindowCreate(hp_win, hp_win_info.window_left, hp_win_info.window_top, hp_win_width, hp_win_height, hp_win_info.window_mode, hp_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (hp_win, 0, 0, hp_win_width, 30)
	WindowFont (hp_win, FONT_NAME, "Arial", FONT_SIZE)

	WindowCircleOp (hp_win, miniwin.circle_round_rectangle, 0, 2, hp_win_width - 2, hp_win_height, 0xc0c0c0, 0, 1,0, 0, 9, 9)
	-- seitre ����ȷ���߶�
    hp_win_height = 60
	local left = 35
	local top = 8
	local title_leght = 28
	local titletarger_leght = 30
	local grid_lenght = 30
	local grid_height = 12
   --print(hp_win,"test")
	-- seitre ȡ������ģ��
	--[[
	WindowText (hp_win, FONT_NAME, "�����Ϣ",
					left+94, top, 0, 0,
					ColourNameToRGB ("white"), false)


	top = top + 15
    WindowText (hp_win, FONT_NAME, "������������������������������������������",
                left, top, 0, 0,
                ColourNameToRGB ("gray"), false)
	top = top + 15

	-- ����
    WindowText (hp_win, FONT_NAME, "��Ѫ",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid2(hp_win, self.jing, self.jing_max, self.jing_max*100/self.jing_pre,
				left + title_leght, top + 1, grid_lenght, grid_height,
				0x40FF40, ColourNameToRGB("red"), ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, self.jing.."/"..self.jing_max.."("..self.jing_pre.."%)",
                left + title_leght + grid_lenght + 2, top, 0, 0,
                0x40FF40, false)

	top = top + 15

	-- ��Ѫ
    WindowText (hp_win, FONT_NAME, "��Ѫ",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid2(hp_win, self.qi, self.qi_max, self.qi_max*100/self.qi_pre,
				left + title_leght, top + 1, grid_lenght, grid_height,
				0x40FF40, ColourNameToRGB("red"), ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, self.qi.."/"..self.qi_max.."("..self.qi_pre.."%)",
                left + title_leght + grid_lenght + 2, top, 0, 0,
                0x40FF40, false)

	top = top + 15

	-- ����
    WindowText (hp_win, FONT_NAME, "����",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)

		Fun_DrawGrid(hp_win, self.jingli, self.jingli_max,
					left + title_leght, top + 1, grid_lenght, grid_height,
					0xFFDA58, 0xFF6060)
		WindowText (hp_win, FONT_NAME, self.jingli.."/"..self.jingli_max.."("..self.jingli_limit..")",
					left + title_leght + grid_lenght + 2, top, 0, 0,
					0xFFDA58, false)


	top = top + 15

	-- ����
    WindowText (hp_win, FONT_NAME, "����",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)

	Fun_DrawGrid(hp_win, self.neili, self.neili_max,
					left + title_leght, top + 1, grid_lenght, grid_height,
					0xFFDA58, 0xFF6060)
	WindowText (hp_win, FONT_NAME, self.neili.."/"..self.neili_max.."(+"..self.jiali..")",
					left + title_leght + grid_lenght + 2, top, 0, 0,
					0xFFDA58, false)


	top = top + 15
    WindowText (hp_win, FONT_NAME, "������������������������������������������",
                left, top, 0, 0,
                ColourNameToRGB ("gray"), false)
	top = top + 15

	-- ʳ��

    WindowText (hp_win, FONT_NAME, "ʳ��",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid(hp_win, self.food, self.max_food,
				left + title_leght, top + 1, grid_lenght, grid_height,
				0x58A7FF, ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, self.food.."/"..self.max_food,
                left + title_leght + grid_lenght + 2, top, 0, 0,
                0x40FF40, false)

	top = top + 15

	-- ��ˮ
    WindowText (hp_win, FONT_NAME, "��ˮ",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
	Fun_DrawGrid(hp_win, self.water, self.max_water,
				left + title_leght, top + 1, grid_lenght, grid_height,
				0x58A7FF, ColourNameToRGB ("white"))
    WindowText (hp_win, FONT_NAME, self.water.."/"..self.max_water,
                left + title_leght + grid_lenght + 2, top, 0, 0,
                0x40FF40, false)

	-- fullme�󾭹�ʱ��


	top = top + 15
]]
	-- Ǳ��
	-- seitre ���� ��Ϊ��ʾ���ܵȼ�
    WindowText (hp_win, FONT_NAME, "���飺"..hp.exp,
                left + 50, top, 0, 0,
                ColourNameToRGB ("yellow"), false)

	top = top + 15

	-- ����
	-- ȡ����ʾ����
    --WindowText (hp_win, FONT_NAME, "����",
    --            left, top, 0, 0,
    --            ColourNameToRGB ("white"), false)
    -- WindowText (hp_win, FONT_NAME,"Ч�ʣ�"..self.expAvg..'/h',  seitre  ����
    WindowText (hp_win, FONT_NAME,"Ч�ʣ�"..self.expAvg..'/h',
                left + 50, top, 0, 0,
                ColourNameToRGB ("yellow"), false)
	top = top + 15
	WindowText (hp_win, FONT_NAME, "----Seitre ��������----",
				left + 35, top, 0, 0,
				ColourNameToRGB ("white"), false)

	

	WindowShow (hp_win, true)
	movewindow.save_state(hp_win)

end


-- ------------------------------------
-- ���ƴ���
-- ------------------------------------
function status_win:skill_draw_win()
	--skill = skilltemp
	WindowCreate (skill_win, 0, 0, skill_win_width, skill_win_height, miniwin.pos_top_left, 0, 0x000010)
	local skill_win_info = movewindow.install (skill_win, miniwin.pos_top_left, miniwin.create_absolute_location, true)
	WindowCreate(skill_win, skill_win_info.window_left, skill_win_info.window_top, skill_win_width, skill_win_height, skill_win_info.window_mode, skill_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (skill_win, 0, 0, skill_win_width, 30)
	WindowFont (skill_win, FONT_NAME, "Arial", FONT_SIZE)

	-- ȷ���߶�
	skill_win_height = 35+table.getn(self.skills)*15+15
	--[[for i = 1,#skilltypetemp do
		skill_win_height = skill_win_height + 15
		for j = 1,#skilltypetemp[i].list do
			skill_win_height = skill_win_height + 15
		end
	end]]

	-- ���Ʊ���
	WindowResize (skill_win, skill_win_width, skill_win_height, 0x000010)
	WindowCircleOp (skill_win, miniwin.circle_round_rectangle, 0, 2, skill_win_width - 2, skill_win_height, 0xc0c0c0, 0, 1,0, 0, 9, 9)

	local left = 40
	local top = 10
	local title_leght = 68
	local grid_off = title_leght + 30
	local grid_lenght = 100
	local grid_height = 12

	WindowText (skill_win, FONT_NAME, "�������ȼ����ƣ�"..self.max_level,
				left + 60, top, 0, 0,ColourNameToRGB ("white"), false)
	top = top + 15
	WindowText (skill_win, FONT_NAME, "������������������������������������������",
                left, top, 0, 0,
                ColourNameToRGB ("gray"), false)

	top = top + 15

	--[[for i = 1,#skilltypetemp do
		local skilltype = skilltypetemp[i]
		WindowText (skill_win, FONT_NAME, "����������������"..skilltype.name.."������������������",
					left, top, 0, 0,
					ColourNameToRGB ("gray"), false)
		top = top + 15]]
		for _,skillobj in ipairs(self.skills) do

			local color = ColourNameToRGB ("white")
			if skillobj.level >= self.max_level then
				color = 0xFFDA58
			else
				color = 0x40FF40
			end
			WindowText (skill_win, FONT_NAME, skillobj.name,
						left + title_leght - WindowTextWidth (skill_win, FONT_NAME, skillobj.name), top, 0, 0,
						color, false)
			WindowText (skill_win, FONT_NAME, skillobj.level,
						left + title_leght + 2, top, 0, 0,
						color, false)
			Fun_DrawGrid(skill_win, skillobj.pots, (skillobj.level+1)*(skillobj.level+1),
						left + grid_off, top + 1, grid_lenght, grid_height,
						color, ColourNameToRGB ("gray"))

			top = top + 15
		end
	--end

	WindowShow (skill_win, true)
	movewindow.save_state(skill_win)
end

-- ------------------------------------
-- ���ƴ���
-- ------------------------------------
function status_win:task_draw_win()
	SetVariable ("mw_task_window_windowx",930)
    SetVariable ("mw_task_window_windowy",0)
	WindowCreate (task_win, 0, 0, task_win_width, task_win_height, miniwin.pos_top_left, 0, 0x000010)
	local task_win_info = movewindow.install (task_win, miniwin.pos_top_left, miniwin.create_absolute_location, true)
	WindowCreate(task_win, task_win_info.window_left, task_win_info.window_top, task_win_width, task_win_height, task_win_info.window_mode, task_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (task_win, 0, 0, task_win_width, 30)
	WindowFont (task_win, FONT_NAME, "Arial", FONT_SIZE)



	--print("���Ʊ���")
	WindowResize (task_win, task_win_width, task_win_height, 0x000010)
	WindowCircleOp (task_win, miniwin.circle_round_rectangle, 0, 2, task_win_width - 2, task_win_height, 0xc0c0c0, 0, 1,0, 0, 9, 9)
	-- seitre ����ȷ���߶�

	local left = 10
	local top = 15
	local title_leght = 68
	local grid_off = title_leght + 30
	local grid_lenght = 100
	local grid_height = 12

	WindowText (task_win, FONT_NAME, "��ǰ����"..self.task_name,
				left + 60, top, 0, 0,
				0x40FF40, false)
	top = top + 15

	local color = ColourNameToRGB ("white")
    WindowText (task_win, FONT_NAME, "��ǰ���裺",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
    WindowText (task_win, FONT_NAME, self.task_stepname,
                left + title_leght + 6, top, 0, 0,
                0x40FF40, false)



	top = top + 15

    WindowText (task_win, FONT_NAME, "����λ�ã�",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
    WindowText (task_win, FONT_NAME, self.task_location,
                left + title_leght + 6, top, 0, 0,
                0x40FF40, false)

	top = top + 15

	WindowText (task_win, FONT_NAME, "�������ݣ�",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)
    WindowText (task_win, FONT_NAME, self.task_description,
                left + title_leght + 6, top, 0, 0,
                0x40FF40, false)
    top = top + 15


	WindowText (task_win, FONT_NAME, "���ȣ�",
                left, top, 0, 0,
                ColourNameToRGB ("white"), false)

	WindowText (task_win, FONT_NAME, self.task_step..'/'..self.task_maxsteps,
						left + title_leght + 2, top, 0, 0,color, false)

	Fun_DrawGrid(task_win, self.task_step, self.task_maxsteps,
						left + grid_off + 24, top + 1, grid_lenght, grid_height,
						color, ColourNameToRGB ("gray"))
	WindowShow (task_win, true)
	movewindow.save_state(task_win)
end

--[[function OnPluginInstall ()
	--Note("OnPluginInstall")

	WindowCreate (hp_win, 0, 0, hp_win_width, hp_win_height, miniwin.pos_bottom_left, 0, 0x000010)
	hp_win_info = movewindow.install (hp_win, miniwin.pos_bottom_left, miniwin.create_absolute_location, true)
	WindowCreate(hp_win, hp_win_info.window_left, hp_win_info.window_top, hp_win_width, hp_win_height, hp_win_info.window_mode, hp_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (hp_win, 0, 0, hp_win_width, 30)
	WindowFont (hp_win, FONT_NAME, "Arial", FONT_SIZE)

	WindowCreate (skill_win, 0, 0, skill_win_width, skill_win_height, miniwin.pos_top_left, 0, 0x000010)
	skill_win_info = movewindow.install (skill_win, miniwin.pos_top_left, miniwin.create_absolute_location, true)
	WindowCreate(skill_win, skill_win_info.window_left, skill_win_info.window_top, skill_win_width, skill_win_height, skill_win_info.window_mode, skill_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (skill_win, 0, 0, skill_win_width, 30)
	WindowFont (skill_win, FONT_NAME, "Arial", FONT_SIZE)


	WindowCreate (task_win, 0, 0, task_win_width, task_win_height, miniwin.pos_top_left, 0, 0x000010)
	task_win_info = movewindow.install (task_win, miniwin.pos_top_left, miniwin.create_absolute_location, true)
	WindowCreate(task_win, task_win_info.window_left, task_win_info.window_top, task_win_width, task_win_height, task_win_info.window_mode, task_win_info.window_flags, 0x000010)
	movewindow.add_drag_handler (task_win, 0, 0, task_win_width, 30)
	WindowFont (task_win, FONT_NAME, "Arial", FONT_SIZE)

end

function OnPluginClose ()
	--Note("OnPluginClose")
   if GetPluginInfo(GetPluginID(), 17) then
      OnPluginDisable()
   end
end

function OnPluginEnable ()
	--Note("OnPluginEnable")
   WindowShow(hp_win, true)
   WindowShow(skill_win, true)
   WindowShow(task_win, true)
   -- if we are connected when the plugin loads, it must have been reloaded while playing
   if IsConnected() then
   end -- if already connected
   OnPluginSaveState()
end -- OnPluginEnable

function OnPluginSaveState()
	--Note("OnPluginSaveState")
   -- save window current location for next time
   SetVariable("enabled", tostring (GetPluginInfo (GetPluginID(), 17)))
   movewindow.save_state(hp_win)
   movewindow.save_state(skill_win)
   movewindow.save_state(task_win)
   --SetVariable("actorname", actorname)
end --  OnPluginSaveState

function OnPluginDisable()
	--Note("OnPluginDisable")
   WindowShow(hp_win, false)
   WindowShow(skill_win, false)
   WindowShow(task_win, false)
   OnPluginSaveState()
end]]

