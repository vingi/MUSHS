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

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]

MissionPunishment = { }

function MissionPunishment.PunishmentHandle(busySecond)
    if busySecond > 10 then
        quest.desc = "����ͷ� " .. busySecond .. "��"
        quest.update()
    else
        quest.desc = ""
        quest.update()
    end
    if hp.pot > 100 then
        print("Mission Punishment Gap, going to Study")
        beihook = checkxue
    else
        print("Mission Punishment Gap, going to Check_Food")
        beihook = function()
            check_food(true)
            -- ǿ�� full ��ʳ
        end
    end
    beiok()
    -- �� beihook ��ֵ, ����ֵ����Ҫִ�е�function
    -- beihook = function xxx()
    -- ִ�� beiok ֹͣbei,ִ�к���
    -- beiok()
    -- switch study/prepare/food/repair/doing LL
end -- function check

