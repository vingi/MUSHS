--
-- quest.lua
--
-- ----------------------------------------------------------
-- 实体类集合
-- ----------------------------------------------------------
--
--[[


eg.

require "Entity"


--]]
quest = {
    name = "",
    target = "",
    status = "",
    location = "",
    desc = "",
    note = ""
}

-- 更新quest状态至statusbar
function quest:update()
    if statusbar ~= nil then
        statusbar.quest_update(quest)
     end
end
