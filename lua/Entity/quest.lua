--
-- quest.lua
--
-- ----------------------------------------------------------
-- ʵ���༯��
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

-- ����quest״̬��statusbar
function quest:update()
    if statusbar ~= nil then
        statusbar.quest_update(quest)
     end
end
