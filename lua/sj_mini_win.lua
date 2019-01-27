--���崰������
require "movewindow2"  -- pull in this module
window={
  new=function()
    local w={}
	w.items={}
	setmetatable(w,{__index=window})
	return w
  end,
  name="myStatusWin",
  background_colour = 0x909090,
  --����״̬��������
  gauge_left = 10,
  gauge_height = 13,
  gauge_right = 200,
  box_colour = 0xD3D3D3,
  --������ʾ�õ���������
  font_id = "myFont",
  font_name = "����",
  font_height = 18,
  font_size = 10,
  vertical = 8,
  items={},
}

--============================================
--Funtions
--============================================


function window:init(height,width,refresh)
    local win=self.name
 -- print("��ʼ��״̬����->"..self.name)
   local pop_menu=function(win_handle)
	  local result = WindowMenu(win_handle,WindowInfo (win_handle, 14),WindowInfo (win_handle, 15),"^�齣Quest|-|����|-|100*300|200*300")
	   --print(result)
      if result ~= "" then
	     if result=="����" then
	       --print("hide")
	       WindowShow(win_handle,false)
		   return
		  elseif result=="100*300" then
		    self:init(100,300,true)
		  elseif result=="200*300" then
			self:init(200,300,true)
         end
		 self:refresh()
	   end
  end
  local windows = WindowList()
  local exist=false
  if windows then
   for _, v in ipairs (windows) do
     if v==win then
	   exist=true
	 end
   end
  end -- if any
 if height==nil then
    height=100
 end
 if width==nil then
    width=300
 end
	--check(WindowCreate (self.name, 0, 0, 220, 160, miniwin.pos_top_right, 0, ColourNameToRGB("white")))
	--print(exist,refresh,"error")
	local windowinfo = movewindow.install (win, miniwin.pos_top_right, 0,true,nil,pop_menu)   -- get position (default to right/middle)
	if exist==false or refresh==true then
       print("��������!!")
	   WindowCreate(win,windowinfo.window_left,windowinfo.window_top,width,height,windowinfo.window_mode,windowinfo.window_flags,ColourNameToRGB "white")
    else
		if WindowInfo(win,5)==false then  --���岻��ʾ״̬
          return
        end
	end
 -- print("��ʼ������ "..self.font_name)
	 check(WindowFont (win, self.font_id, self.font_name, self.font_size, false, false, false, false))
	 WindowRectOp (win, miniwin.rect_fill, 0,0,width,height, self.background_colour)  -- raised, filled, softer, flat
	 movewindow.add_drag_handler (win, 0, 0, 0, 0, 10)  -- both-ways arrow cursor (10)
	 WindowShow (win,true)  -- show it
end

--��״̬������
--sPrompt ״̬��ǰ��ʾ����
--Percent ״̬�ٷֱ�
--sGoodColor ����ʱ�����ɫ
--sMediumColor ��״̬С��50%��ʱ�����ɫ
--sBadColor ��״̬С��30%��ʱ�����ɫ
--sText ��ʾ��״̬���ڵ�����
--bTextOnly ����������1��ʱ������ɫ�����
function window:DoGauge (sPrompt, Percent, sGoodColor, sMediumColor, sBadColor, sText, bTextOnly)

  --�����
  self:drawFrame(sPrompt)

  --��bTextOnly������1��ʱ��״̬��
  if ( bTextOnly ~= 1 ) then
    --��״̬��
    self:drawGauge(sPrompt, Percent, sGoodColor, sMediumColor, sBadColor)
  end

  --���sText��������ʾsText
  self:drawText(sText)

  --������һ��״̬����λ��
  self.vertical = self.vertical + self.font_height
end -- function


--�����ķ���
function window:drawFrame(sPrompt)
  if (sPrompt~= nil) then
    local width = WindowTextWidth (self.name, self.font_id, sPrompt)

    WindowText (self.name, self.font_id, sPrompt, self.gauge_left - width + 5, self.vertical, 0, 0, 0x000000)

    -- frame rectangle
    WindowRectOp (self.name, 1,
            self.gauge_left+5, self.vertical,
            self.gauge_right, self.vertical + self.gauge_height,
            self.box_colour)
  end
end

--��״̬��
function window:drawGauge(sPrompt, Percent, sGoodColor, sMediumColor, sBadColor)
    local colour
    --  Below 30% warn by sBadColor
    --  Below 50% warn by sMediumColor
    Percent = tonumber (Percent)
    if Percent <= 20 then
      colour = sBadColor
    elseif Percent <= 50 then
      colour = sMediumColor
    else
      colour = sGoodColor
    end -- if

    local pixels = (self.gauge_right - self.gauge_left - 1) * Percent / 100

    -- fill rectangle
    WindowRectOp (self.name, 2,
            self.gauge_left + 6, self.vertical + 1,
            self.gauge_left + pixels, self.vertical + self.gauge_height - 1,
            ColourNameToRGB (colour))
end

--��ʾ����
function window:drawText(sText)
    if sText ~= nil then
      WindowText (self.name, self.font_id, sText, self.gauge_left, self.vertical, 0, 0, 0x00FFFF)
	   --������һ��״̬����λ��
      self.vertical = self.vertical + self.font_height
    end
	Redraw()
end

--���������ֵ���ڴ�����ˢ��״̬��
function window:draw_bar ()
  check (WindowRectOp (self.name, 2, 0, 0, 0, 0, self.background_colour))

  -- ���߿�
  check (WindowRectOp (self.name, 5, 0, 0, 0, 0, 10, 15))

  -- pixel to start at
  self.vertical = 8

  --DoGauge ("����: ", percentSpirit, "darkgreen", "mediumblue", "darkred", currSpirit.."/"..maxSpirit, 0)
  --DoGauge ("��Ѫ: ", percentHP, "darkgreen", "mediumblue", "darkred", currHp.."/"..maxHp, 0)
  --DoGauge ("����: ", percentEnergy, "darkgreen", "mediumblue", "darkred", currEnergy.."/"..maxEnergy, 0)
  --DoGauge ("����: ", percentMana, "darkgreen", "mediumblue", "darkred", currMana.."/"..maxMana, 0)
  --DoGauge ("ʳ��: ", percentFood, "darkgreen", "mediumblue", "darkred", currFood.."/"..maxFood, 0)
  --DoGauge ("��ˮ: ", percentWater, "darkgreen", "mediumblue", "darkred", currWater.."/"..maxWater, 0)
  --DoGauge ("Ǳ��: ", 100, "darkgreen", "mediumblue", "darkred", sPotential, 1)
  --DoGauge ("����: ", 100, "darkgreen", "mediumblue", "darkred", sExp, 1)
  for _,i in ipairs(self.items) do
     if i.label~=nil then
      self:drawText(i.label)
	 elseif i.Percent~=nil then
	  self:DoGauge(i.sPrompt,i.Percent,i.sGoodColor,i.sMediumColor,i.sBadColor,i.sText,i.bTextOnly)
	 end
  end
  Redraw()
end -- draw_bar

--��ӱ�ǩ
function window:addText(id,text)
    local item={}
    for _,i in ipairs(self.items) do
      if i.id==id then
	     --print("text_id:",id)
	     item=i
		 item.label=text
         return
	  end
    end
   item.id=id
   item.label=text
   table.insert(self.items,item)
   --Repaint ()  -- update window location
end
--��ӽ�����
function window:addGauge(id,sPrompt, Percent, sGoodColor, sMediumColor, sBadColor, sText, bTextOnly)
   local item={}
   for _,i in ipairs(self.items) do
      if i.id==id then
	     item=i
         item.sPrompt=sPrompt
         item.Percent=Percent
         item.sGoodColor=sGoodColor
         item.sMediumColor=sMediumColor
         item.sBadColor=sBadColor
         item.sText=sText
         item.bTextOnly=bTextOnly
		 return
	  end
   end
   item.id=id
   item.sPrompt=sPrompt
   item.Percent=Percent
   item.sGoodColor=sGoodColor
   item.sMediumColor=sMediumColor
   item.sBadColor=sBadColor
   item.sText=sText
   item.bTextOnly=bTextOnly
   table.insert(self.items,item)
end

--�رմ���
function window:close()
   WindowDelete(self.name)
end

function close_byName(win_name)
   WindowDelete(win_name)
end

--����
function window:refresh()
  self.vertical=8
  self:init()
  self:draw_bar()
end


