--
-- literate.lua
--
-- ----------------------------------------------------------
-- �� literate ����function ����
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
-- ���ѧϰ����
local learntime_max = 50
-- ��Сѧϰ����
local learnTime_min = 10

function literate()
    exe("nick ѧϰ����д��;i;")
    quest.name = "ѧϰ����д��"
    quest.status = ""
    quest.target = ""
    quest.location = "���ݳ���Ժ"
    quest:update()
    messageShow("ѧϰ����д�֣�")
    DeleteTemporaryTriggers()
    if hp.exp < 151000 then
        master.times = 5
    else
        master.times = math.modf(hp.jingxue / 120)
        master.times = common.GetValueByRange(master.times, learnTime_min, learntime_max)
    end
    return check_busy(literateGo)
end

function literateGo()
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)
    go(literateCheck, "���ݳ�", "��Ժ")
end

function literateCheck()
    DeleteTriggerGroup("litxuexi")
    create_trigger_t("litxuexi1", "^(> )*����������������һ�����������������ƣ���ʱ�޷��ٽ��޸������ѧ���ˡ���", "", "litxuexiover")
    SetTriggerOption("litxuexi1", "group", "litxuexi")
    EnableTriggerGroup("litxuexi", true)
    flag.idle = nil
    exe("hp")
    return checkWait(literateXue, 0.8)
end

function litxuexiover()
    DeleteTriggerGroup("litxuexi")
    dis_all()
    return check_halt(literateBack)
end

function literateXue()
    if not locl.id["������"] then
        return literateBack()
    end
    if hp.neili < 100 then
        if hqd_cur > 0 then
            exe('eat huangqi dan')
        elseif hp.exp < 800000 then
            return xuexi()
        else
            return literateBack()
        end
    end
    if hp.neili < 1000 then
        exe("eat " .. drug.neili2)
    end
    if hp.pot > master.times - 1 then
        yunAddInt()
        exe("yun jing;xue gu literate " .. master.times)
        return check_busy(literateCheck)
    elseif hp.pot < master.times then
        return literateBack()
    else
        return literateBack()
    end
end

function literateBack()
    messageShow("����д��ѧϰ��ϣ�")
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("unwield " .. leweapon)
    exe("hp;score;cha;yun jing;yun qi;yun jingli")
    dis_all()
    return check_busy(check_food)
end
