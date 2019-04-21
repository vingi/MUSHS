--[[˵��:
1.��shujian.lua ��sLetterlost() ��EnableTriggerGroup("lostletter",true)�� ֮ǰ����llgo()
2.��sendOk() ��return ֮ǰ��һ��sendOk_fix()
3.��shujian.lua require ����м��� require "dolost"
-]]
require 'wait'
require 'tprint'

function letterLost()
    sLetterlost()
    go(letterLostBegin, "������", "����")
end
function letterLostBegin()
    if needvpearl == 1 and(condition.vpearl == 0 or not condition.vpearl) then
        return Govpearl()
    end
    if lostletter == 1 then
        exe("chakan letter")
        exe("look letter")
    end
end
function sLetterlost()
    DeleteTriggerGroup("lostletter")
    create_trigger_t("lostletter1", "^(> )*�����ҳ(\\N*)�鿴�����ˡ�$", "", "goMark")
    create_trigger_t("lostletter2", "^(> )*����˲�ע�⣬͵͵��ʧ����ż��ӽ���·�ߵĲݴԡ�$", "", "sendOk")
    create_trigger_t("lostletter3", "^(> )*�ŷ��ϵ��ּ�ģ�����壬��֪�������䵽�˴���$", "", "sendOk")
    create_trigger_t("lostletter4", "^(> )*�㽫ʧ����ż㽻��", "", "sendOk")
    create_trigger_t("lostletter5", "^(> )*����������д�������˵����֡�$", "", "lookXin")
    create_trigger_t("lostletter6", "^(> )*���ٿ����һ�㡣$", "", "letterLostBegin")
    create_trigger_t("lostletter7", "^(> )*�ŷ���д�ţ�(\\D*)\\((\\D*)\\)", "", "lostName")
    -- create_trigger_t('lostletter8',"^[> ]*��������������(\\D*)һ�����֡�$",'','get_lost_locate')
    SetTriggerOption("lostletter1", "group", "lostletter")
    SetTriggerOption("lostletter2", "group", "lostletter")
    SetTriggerOption("lostletter3", "group", "lostletter")
    SetTriggerOption("lostletter4", "group", "lostletter")
    SetTriggerOption("lostletter5", "group", "lostletter")
    SetTriggerOption("lostletter6", "group", "lostletter")
    SetTriggerOption("lostletter7", "group", "lostletter")
    -- SetTriggerOption("lostletter8","group","lostletter")
    llgo()
    EnableTriggerGroup("lostletter", true)
end
function goMark(n, l, w)
    print("��ʼ��дʧ���ż�����ID")
    local m_cmd = w[2]
    OpenBrowser(m_cmd)
    return Markletter()
end
function Markletter()
    l_result = utils.inputbox("�����ż�����ID������������discard��", "lostname", GetVariable("lostname"), "����", "12")
    if not isNil(l_result) then
        SetVariable("lostname", l_result)
    end
    return MarkName()
end
function MarkName()
    local lost_cmd = GetVariable("lostname")
    if lost_cmd == "discard" then
        return exe("discard letter")
    else
        return exe("mark " .. lost_cmd)
    end
end
function lookXin()
    lookxin = 1
    exe("look letter")
end
function lostName(n, l, w)
    lost_name = string.lower(w[3])
    return create_timer_s("sendTo", 0.5, "sendTo")
end
function sendXin()
    sLetterlost()
    return create_timer_s("sendTo", 0.5, "sendTo")
end
function sendTo()
    exe("follow " .. lost_name)
    exe("sendto " .. lost_name)
end
function sendOk()
    lookxin = 0
    lostletter = 0
    m_cmd = nil
    lostletter_locate = ""
    mousedown_lostletter()
    -- ����ˢ�µص�
    condition.vpearl = 0
    DeleteTimer("sendTo")
    DeleteTriggerGroup("lostletter")
    exe("follow none;cond;jobtimes")
    sendOk_fix()
    job.statistics.Category["ʧ����ż�"].Times = job.statistics.Category["ʧ����ż�"].Times + 1
    return check_food()
end


addali_reg = function(aliname, alimatch, aligroup, aliscript)
    alireturnvalue = AddAlias(aliname, alimatch, "", alias_flag.Enabled + alias_flag.Replace + alias_flag.RegularExpression, aliscript)
    SetAliasOption(aliname, "group", aligroup)
    return alireturnvalue
end
function llgo()
    create_trigger_t('lostletter8', "^[> ]*����һ���������������ͳ������š�$", '', 'lostp_look')
    SetTriggerOption("lostletter8", "group", "lostletter")
    -- create_alias_s('llgo','^llgo$','lost_goto')
    addali_reg('llgo', '^llgo$', '', 'lost_goto')
end
function lostp_look()
    DeleteTriggerGroup("lostplace")
    create_trigger_t('lostplace1', "^[> ]*��������������(\\D*)һ�����֡�$", '', 'lostp_get')
    SetTriggerOption("lostplace1", "group", "lostplace")
    EnableTriggerGroup("lostplace", true)
end
function lostp_get(n, l, w)
    -- exe('look lose letter')
    ll_place = w[1]
    if string.find(ll_place, '������') then
        ll_place = '�ƺ��뺣��'
    elseif string.find(ll_place, '�����ϰ�') or string.find(ll_place, '����Ľ��') or string.find(ll_place, '������') or string.find(ll_place, '��٢��ɽׯ') then
        ll_place = '���ݳǳ�������'
    end
    if string.find(ll_place, '��ɼ��') then
        ll_place = '���ݴ�ɿ�'
    end
    if string.find(ll_place, '��Դ��') then
        ll_place = '��Դ��é��'
    end
    if string.find(ll_place, '�����') then
        ll_place = '�����СϪ��'
    end

    if score.party == '����Ľ��' then
        ll_place = ll_place
    end
    -- messageShow('ʧ����ż����񣺿�ʼǰ����'..ll_place..'��Ѱ����ң�')
    DoAfterSpecial(0.2, 'llgo', 10)
end
function lost_goto()
    -- exe('look lose letter')
    if ll_place == nil then
        return Note('�յط�������ȥ��P!')
    end
    if ll_place == '���޺�����' then
        return Execute('discard letter')
    end
    messageShow('ʧ����ż����񣺿�ʼǰ����' .. ll_place .. '��Ѱ�����' .. '��' .. lost_name .. '��')
    if ll_place == '�ƺ��뺣��' or ll_place == '���ݳǳ�������' or ll_place == '���ݴ�ɿ�' or ll_place == '��Դ��é��' or ll_place == '�����СϪ��' then
        return goto(ll_place)
    else
        dest.room, dest.area = getAddr(ll_place)
        if job.area and job.area == dest.area and job.room and job.room == dest.room then
            return go(find, dest.area, dest.room)
        else
            job.area = dest.area
            job.room = dest.room
        end
        if dest.area == nil or not dest.room then
            exe('look lose letter')
        else
            return go(lookXin, dest.area, dest.room)
        end
    end
end
function sendOk_fix()
    ll_place = nil
    DeleteTriggerGroup("lostplace")
end

-- =======================================���Դ涫��=========================================
--[[> ����಼ɮ�´Ӹ��˴���������ȡ������
> ��Ѳ��ĴӸ��˴���������ȡ������
> ��������ó�һ˫���ģ������Լ��ĸ��˴����䡣
> ��Ѳ��ĴӸ��˴���������ȡ������
> ����æ�ţ�
�㴩���ţ�
  ��ɮЬ(Seng xie)
  ������(Hu wan)
  ������(Hu yao)
  ���ƽ�(VIP Card)
  ������(Bei Nang)
  ����װ(Cloth)
��װ���ţ�
  ��������ͨ��(Shentong sword)]]
local armor_list = { }
function cun_armor_list()
    wait.make( function()
        Execute('i;say װ��������')
        repeat
            local l, w = wait.regexp('^[> ]*[��]\\S+\\((.+)\\)$|^[> ]*��˵������װ�������ϡ�$')
            table.insert(armor_list, string.lower(Trim(w[1])))
        until string.find(l, 'װ��������')
        tprint(armor_list)
    end )
    return armor_list
end
function cun_armor()
    i = cun_i
    wait.make( function()
        if i < #armor_list and armor_list[i] ~= '' and #armor_list > 1 and not string.find(armor_list[i], 'nang') and not string.find(armor_list[i], 'card') and not string.find(armor_list[i], 'sword') and not string.find(armor_list[i], 'axe') then
            Execute('cun ' .. armor_list[i])
            local l, w = wait.regexp('^[> ]*��������ó�.+�������Լ��ĸ��˴����䡣$|^[> ]*����æ�ţ�$|^[> ]*������û������������$|^[> ]*.+�����Ա����档$')
            if string.find(l, '�����Լ��ĸ��˴�����') or string.find(l, '������û����������') or string.find(l, '���Ա�����') then
                i = i + 1
                cun_i = i
                return cun_armor()
            elseif string.find(l, '����æ��') then
                cun_i = i
                wait.time(0.5)
                return cun_armor()
            end
        elseif i >= #armor_list then
            print('������')
        end
    end )
end
function cun_cmd()
    armor_list = { }
    cun_armor_list()
    Execute('remove all')
    cun_i = 1
    DoAfterSpecial(0.5, 'cun_armor()', 12)
end
function qu_cmd()
    armor_list = { }
    qu_armor_list()
    cun_i = 1
    DoAfterSpecial(0.5, 'qu_armor()', 12)
end
function qu_armor_list()
    wait.make( function()
        Execute('dlist')
        repeat
            local l, w = wait.regexp('^[> ]*��\\s+(.+)\\s+\\S+\\s+\.+��\\s+��$|^[> ]*����������������������������������������������������������������$')
            table.insert(armor_list, string.lower(Trim(w[1])))
        until string.find(l, '����������������������������������������������������������������')
        tprint(armor_list)
    end )
    return armor_list
end
function qu_armor()
    i = cun_i
    wait.make( function()
        if i < #armor_list and armor_list[i] ~= '' then
            Execute('qu ' .. armor_list[i])
            local l, w = wait.regexp('^[> ]*���.+�Ӹ��˴���������ȡ������$|^[> ]*����æ�ţ�$|^[> ]*�㲢û�б������Ʒ��$')
            if string.find(l, '���˴���������ȡ����') or string.find(l, '�㲢û�б������Ʒ��') then
                i = i + 1
                cun_i = i
                return qu_armor()
            elseif string.find(l, '����æ��') then
                cun_i = i
                wait.time(0.5)
                return qu_armor()
            end
        elseif i >= #armor_list then
            print('ȡ����')
            DoAfter(3, 'wear all;dlist')
        end
    end )
end
