--
-- zhizhao.lua
--
-- ----------------------------------------------------------
-- �� zhizhao֯�� ����function ����
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
function zhizao()
   exe("nick ѧϰ֯��")
   DeleteTemporaryTriggers()
   if hp.exp < 151000 then
      master.times = 3
   else
      master.times = math.modf(hp.jingxue / 120)
      if master.times > 50 then
         master.times = 50
      end
   end
   return check_busy(zhizaoGo)
end

function zhizaoGo()
   return go(zhizaoCheck, "�����", "�÷��")
end

function zhizaoCheck()
   flag.idle = nil
   exe("score;hp;cha")
   checkBags()
   return checkWait(zhizaoXue, 0.8)
end

function zhizaoXue()
   if not locl.id["�ϲ÷�"] then
      return zhizaoBack()
   end
   if hp.neili < 100 then
      if nxw_cur > 0 then
         exe("eat chuanbei wan")
      else
         return zhizaoBack()
      end
   end
   if hp.neili < 1000 then
      exe("eat " .. drug.neili)
   end
   if skills["zhizao"] and skills["zhizao"].lvl >= 221 then
      return zhizaoBack()
   end
   if Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt > 30 and hp.pot > master.times - 1 then
      yunAddInt()
      exe("yun jing;xue caifeng zhizao " .. master.times)
      return zhizaoCheck()
   elseif hp.pot < master.times then
      return zhizaoBack()
   elseif score.gold > 300 then
      return check_bei(zhizaoQu, 1)
   else
      return zhizaoBack()
   end
end

function zhizaoQu()
   exe("e;n;#3e;n;qu 30 gold")
   exe("s;#3w;s;w")
   return check_busy(zhizaoCheck, 1)
end

function zhizaoBack()
   exe("hp")
   return check_busy(check_food)
end
