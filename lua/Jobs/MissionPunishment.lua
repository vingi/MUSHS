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
MissionPunishment = {
    AlreadyGiveUp = false
}

function MissionPunishment.PunishmentHandle(busySecond)
    local func = function()
        exe("yun jing;yun qi;yun jingli;")
        check_food(true)
        -- ǿ�� full ��ʳ
    end

    if busySecond > 10 then
        quest.desc = "����ͷ� " .. busySecond .. "��"
        quest.note = ""
        quest.update()
    else
        quest.desc = ""
        quest.note = ""
        quest.update()
    end
    -- �ж��Ƿ��ѷ�������, �������busy
    if MissionPunishment.AlreadyGiveUp ~= true then
        if job.last == "huashan" then
            func = huashanFindFail
        end
        if job.last == "wudang" then
            func = function()
                wudangTrigger()
                go(wudangFangqi, "�䵱ɽ", "�����")
            end
        end
        if job.last == "songxin" then
            func = function()
                songxin_trigger()
                go(songxin_fangqi, '�����', '��վ')
            end
        end
        if job.last == "xueshan" then
            func = function()
                go(xueshan_fangqi, "��ѩɽ", "���Ŀ�")
            end
        end
        return check_busy(func)
    end

    if hp.pot > 100 then
        func = check_pot
    end
    -- if not Bag["����"] then
    --     CheckRope(check_food)
    -- end

    --    beiok()
    check_busy(func)
    -- �� beihook ��ֵ, ����ֵ����Ҫִ�е�function
    -- beihook = function xxx()
    -- ִ�� beiok ֹͣbei,ִ�к���
    -- beiok()
    -- switch study/prepare/food/repair/doing LL
end -- function check
