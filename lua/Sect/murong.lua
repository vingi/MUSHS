-----
-- murong.lua
--
-- ----------------------------------------------------------
-- Ľ����������
-- ----------------------------------------------------------
--
--[[

eg.

--]]


function dzxy_trigger()
    DeleteTriggerGroup("dzxy")
    create_trigger_t("dzxy1", "^>*\\s*���������죬̫����������У����ƶ�䣬����˳���Ʋ�ı�Ե���������������Щ���ۡ�", "", "dzxy_finish")
    create_trigger_t(
    "dzxy2",
    "^>*\\s*���������죬���Ϸ��ǵ�㣬���������Ƕ����ƶ�������ѧ�ġ���ת���ơ���Ī�����ϵ��ȴ����ʵս���鲻�㣬�޷����㿴���Ķ�����ʵ����ս��ϵ��һ��",
    "",
    "dzxy_finish"
    )
    create_trigger_t("dzxy3", '^>*\\s*��� "action" �趨Ϊ "Ľ�ݶ�ת����" �ɹ���ɡ�', "", "dzxy_goon")
    create_trigger_t("dzxy4", "^>*\\s*�������������", "", "dzxy_finish")
    create_trigger_t("dzxy5", "^>*\\s*�ȴ�ľ׮��������\\(down\\)��˵�ɣ�", "", "dzxy_finish")
    create_trigger_t("dzxy6", "^>*\\s*��ϲ��ϲ�����Ѿ��ڻ��ͨ�˶�ת���Ƶľ���֮����", "", "dzxy_finish")
    create_trigger_t("dzxy7", "^>*\\s*���Ѿ�û��Ǳ��������ѧϰ��ת�����ˡ�", "", "dzxy_finish")

    create_trigger_t("dzxy8", "^>*\\s*���������죬���Ϸ��ǵ�㣬��˳�����ӵķ���ȥ��ȴ���ֲ��ֵ�ҹ�ձ���Χ�����ڵ�ס�ˡ�", "", "dzxy_goon")
    SetTriggerOption("dzxy1", "group", "dzxy")
    SetTriggerOption("dzxy2", "group", "dzxy")
    SetTriggerOption("dzxy3", "group", "dzxy")
    SetTriggerOption("dzxy4", "group", "dzxy")
    SetTriggerOption("dzxy5", "group", "dzxy")
    SetTriggerOption("dzxy6", "group", "dzxy")
    SetTriggerOption("dzxy7", "group", "dzxy")
    SetTriggerOption("dzxy8", "group", "dzxy")
    EnableTriggerGroup("dzxy", false)
    DeleteTimer("mr_dzxy_timer")
    -- create_timer_m('mr_dzxy_timer',4,'dzxy_finish')
end

function checkdzxy()
    dis_all()
    tmp = { }
    -- jobTriggerDel()
    job.name = "heal"
    if skills["douzhuan-xingyi"] ~= nil then
        if skills["douzhuan-xingyi"].lvl > 130 and skills["douzhuan-xingyi"].lvl < 170 then
            dzxy_level = 1
            -- Ľ�ݸ���ʼ(#3 w;jump liang;lingwu zihua)�����Ե�171����
            return dzxy()
        end
        if skills["douzhuan-xingyi"].lvl > 170 and skills["douzhuan-xingyi"].lvl < 200 then
            dzxy_level = 2
            -- ��ʩˮ�� ȥ:sit chair;zhuan;n;lingwu miji ��:s;push shujia�����Ե�201����
            return dzxy()
        end
        if
            skills["douzhuan-xingyi"].lvl > 200 and skills["douzhuan-xingyi"].lvl < hp.pot_max - 100 and
            (locl.time == "��" or locl.time == "��" or locl.time == "��" or locl.time == "��")
        then
            dzxy_level = 3
            -- ����̨ ��ȥjump zhuang;look sky������jump down��ֻ������look sky�����Ե�N����
            return dzxy()
        end
        messageShow("�����أ�Ľ������ת����������������������", "white")
        print("dzxy_level:" .. dzxy_level)
    end

    return go(xueshan_finish_ask, "��ѩɽ", "���Ŀ�")
end
function open_dzxy_timer()
    return create_timer_m("mr_dzxy_timer", 4, "dzxy_finish")
end
function dzxy()
    DeleteTemporaryTriggers()
    dzxy_trigger()

    if dzxy_level == 1 then
        return check_busy(dzxy1_go)
    end
    if dzxy_level == 2 then
        return check_busy(dzxy2_go)
    end
    if dzxy_level == 3 then
        return check_busy(dzxy3_go)
    end
end
function dzxy1_go()
    exe("nick �������ˮ������")
    messageShow("�����أ�ȥĽ�������ֻ�ȥ�ˣ�", "white")
    go(dzxy1_unwield, "������", "��ˮ��")
end
function dzxy2_go()
    exe("nick �����뻹ʩˮ������")
    messageShow("�����أ�ȥĽ�������ؼ�ȥ�ˣ�", "white")
    go(dzxy2_unwield, "������", "��ʩˮ��")
end
function dzxy3_go()
    exe("nick ���������̨����")
    messageShow("�����أ�ȥĽ�ݿ�����ȥ�ˣ�", "white")
    go(dzxy3_unwield, "������", "����̨")
end
function dzxy1_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    exe("jump liang")
    return check_busy(dzxy_goon)
end
function dzxy2_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    return check_busy(dzxy_goon)
end
function dzxy3_unwield()
    flag.idle = 0
    -- open_dzxy_timer()
    weapon_unwield()
    exe("jump zhuang")
    return check_busy(dzxy_goon)
end

function dzxy_goon()
    -- EnableTimer('mr_dzxy_timer',true)
    if not(locl.room == "����̨" or locl.room == "��ʩˮ��" or locl.room == "����") then
        messageShow("Ľ�����򣺶�ת���Ƶ�λ�ò��ԣ���ǰλ�ã�" .. locl.room)
        return dzxy_finish()
    end
    EnableTriggerGroup("dzxy", true)
    local leweapon = GetVariable("learnweapon")
    exe("wield " .. leweapon)

    if
        not skills["douzhuan-xingyi"] or skills["douzhuan-xingyi"].lvl == 0 or
        skills["douzhuan-xingyi"].lvl >= hp.pot_max - 100
    then
        messageShow("Ľ�����򣺶�ת���Ƶĵȼ����ԣ���ǰ�ȼ���" .. skills["douzhuan-xingyi"].lvl)
        return check_busy(dzxy_finish)
    end
    if flag.idle > 7 then
        return check_busy(dzxy_finish)
    end
    if hp.neili < hp.neili_max * 0.5 then
        messageShow("Ľ�����򣺶�ת���Ƶ�������������ǰ������" .. hp.neili .. "��", "white")
        return check_busy(dzxy_finish)
    else
        if dzxy_level == 1 then
            exe("hp;yun jing;#10(lingwu zihua)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
        if dzxy_level == 2 then
            exe("hp;yun jing;#10(lingwu miji)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
        if dzxy_level == 3 then
            exe("hp;yun jing;#7(look sky)")
            -- EnableTimer('mr_dzxy_timer',false)
            return check_bei(dzxy_alias, 1)
        end
    end
end
function dzxy_alias()
    exe("alias action Ľ�ݶ�ת����")
end

function dzxy_finish()
    EnableTimer("mr_dzxy_timer", false)
    DeleteTimer("mr_dzxy_timer")
    messageShow("�����أ�Ľ�ݶ�ת������ɣ�")
    exe("jump down")
    EnableTriggerGroup("dzxy", false)
    DeleteTriggerGroup("dzxy")
    exe("cha;hp")
    weapon_unwield()
    local leweapon = GetVariable("learnweapon")
    exe("unwield " .. leweapon)
    exe("jump down")
    return go(xueshan_finish_ask, "��ѩɽ", "���Ŀ�")
end