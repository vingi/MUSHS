--
-- duanzhao.lua
--
-- ----------------------------------------------------------
-- 含 duanzhao 锻造 所有function 集合
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
function duanzao()
   exe("nick 学习锻造")
   DeleteTemporaryTriggers()
   if hp.exp < 151000 then
      master.times = 3
   else
      master.times = math.modf(hp.jingxue / 120)
      if master.times > 50 then
         master.times = 50
      end
   end
   return check_busy(duanzaoGo)
end

function duanzaoGo()
   return go(duanzaoCheck, "扬州城", "兵器铺")
end

function duanzaoCheck()
   flag.idle = nil
   exe("score;hp;cha")
   checkBags()
   return checkWait(duanzaoXue, 0.8)
end

function duanzaoXue()
   if not locl.id["铸剑师"] then
      return duanzaoBack()
   end
   if hp.neili < 100 then
      if nxw_cur > 0 then
         exe("eat chuanbei wan")
      else
         return duanzaoBack()
      end
   end
   if hp.neili < 1000 then
      exe("eat " .. drug.neili)
   end
   if skills["duanzao"] and skills["duanzao"].lvl >= 221 then
      return duanzaoBack()
   end
   if Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt > 30 and hp.pot > master.times - 1 then
      yunAddInt()
      exe("yun jing;xue shi duanzao " .. master.times)
      return duanzaoCheck()
   elseif hp.pot < master.times then
      return duanzaoBack()
   elseif score.gold > 300 then
      return check_bei(duanzaoQu, 1)
   else
      return duanzaoBack()
   end
end

function duanzaoQu()
   exe("n;#3w;#3n;w;qu 30 gold")
   exe("e;#3s;#3e;s")
   return check_busy(duanzaoCheck, 1)
end

function duanzaoBack()
   exe("hp")
   return check_busy(check_food)
end
