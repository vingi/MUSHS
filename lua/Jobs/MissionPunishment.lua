--
-- MissionPunishment.lua
--
-- ----------------------------------------------------------
-- ���ڴ��� ��ǰ������ͷ��ڼ�ʱִ�е�����
-- ����ɵ�����ͷ�ʱ��, ���Ч��
-- �óͷ�������ڵ�exp�ϵ�ʱ
-- ----------------------------------------------------------
--
--[[

eg.

--]]

MissionPunishment = { }

function MissionPunishment.PunishmentHandle(busySecond)
    local func = test
    if busySecond > 10 then
        quest.desc = "����ͷ� " .. busySecond .. "��"
        quest.note = ""
        quest.update()
    else
        quest.desc = ""
        quest.note = ""
        quest.update()
    end
    if hp.pot > 100 then
        print("Mission Punishment Gap, going to Study")
        func = checkxue
    else
        print("Mission Punishment Gap, going to Check_Food")
        func = function()
            check_food(true)
            -- ǿ�� full ��ʳ
        end
    end
--    beiok()
    check_busy(func)
    -- �� beihook ��ֵ, ����ֵ����Ҫִ�е�function
    -- beihook = function xxx()
    -- ִ�� beiok ֹͣbei,ִ�к���
    -- beiok()
    -- switch study/prepare/food/repair/doing LL
end -- function check

