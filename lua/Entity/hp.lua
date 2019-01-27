--
-- hp.lua
--
-- ----------------------------------------------------------
-- 实体类集合
-- ----------------------------------------------------------
--
--[[


eg.

require "Entity"


--]]

hp = {
   jingxue = 0,
   jingxue_max = 0,
   jingxue_per = 0,
   jingli = 0,
   jingli_max = 0,
   jingli_lim = 0,
   qixue = 0,
   qixue_max = 0,
   qixue_per = 0,
   neili = 0,
   neili_max = 0,
   neili_lim = 0,
   food = 100,
   water = 100,
   pot = 0,
   pot_max = 0,
   exp = 0,
   heqi = 0,
   dazuo = 10,
   tuna = 10,
   shen = 0
}

-- 更新hp状态至statusbar
function hp:update()
   if statusbar ~= nil then
      statusbar.hp_hpbrief(hp)
      statusbar.hp_shiwuyinshui(hp)
   end
end
