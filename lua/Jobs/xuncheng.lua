xuncheng = {
    [1] = 'wield good sword;wu;eu;wu;nu;n;s;sd;ed;sd;sw;su;nd;w;nw;sw;u;d;ne;se;sw;su',
    [2] = 'nd;ne;sw;su;nd;ne;e;ne;ed;e',
    [3] = 'n;w;e;n;w;e;n;w;e;n;w;buy huasheng;buy doufu;eat huasheng;#2(drink);eat doufu',
    [4] = 'e;n;s;e;s;e;n;n;s;e;n;cun 2 gold;cun 50 silver;qu 1 silver;',
    [5] = 's;e;n;s;e;w;s;e;w;w;w;s;s;n;e;buy ban doufu;buy doufu gan;#2(eat ban doufu);#2(eat doufu gan);',
    [6] = 'e;e;w;s;e;w;s;e;e;se;n;s;s;e;w;s;e;w;su;enter',
    [7] = 'd;d;d;e;e;up;e;w;d;w;w;up;up;up;out;nd;n;n;nw',
    [8] = 'ne;#2(eu);se;se;enter;n;n;n',
    [9] = 's;s;s;out;#2(nw);wd;wd;sw;w;w',
    [10] = 's;e;w;s;e;w;s;e;w;s;e;w;s;n;w;s;n;w;n;e;w;w',
    [11] = 'e;n;s;s;s;s;su;e;w;se;w;w;e;e;s;su',
    [12] = 'sw;ne;nd;n;su;n;s;s;n;nd;nw;nd;n;n;w',
    [13] = 's;n;w;s;n;w;e;n;w;e;n;w;e;n;w;e;n;w'
}

local i = 0
local xctuna = 0

function xunCheng()
    if hp.exp and hp.exp > 2000000 then
        return fullNeili()
    else
        go(xuncheng_start, '�����', '����')
    end
end
function xuncheng_nobody()
    DeleteTemporaryTriggers()
end

function xuncheng_start()
    opendummy = kill
    flag.idle = 0
    DeleteTemporaryTriggers()
    if hp.exp and hp.exp > 2000000 then
        return fullNeili()
    else
        i = 0
        create_trigger_f('xuncheng_start1', "^>*\\s*�����쵤�������йء�Ѳ�ǡ�����Ϣ��", '', 'xuncheng_accept')
        create_trigger_f('xuncheng_start2', "^>*\\s*����û������ˡ�", '', 'xuncheng_nobody')
        Execute('unset ����;nick Ѳ����;ask zhu danchen about Ѳ��')
    end
end
function xuncheng_start_wait()
    DeleteTemporaryTriggers()
    wait.make( function()
        wait.time(5)
        xuncheng_start()
    end )
end
function xuncheng_accept()
    DeleteTemporaryTriggers()
    create_triggerex_f('xuncheng_accept1', "^>*\\s*�쵤��˵������\\D*���㲻�Ǳ�������ӣ��˻��Ӻ�˵�𣿡�", 'xuncheng_join()', '')
    create_triggerex_f('xuncheng_accept2', "^>*\\s*�쵤��˵�������ðɣ�����ڴ������Χ�Ĵ��鿴һ��", 'xuncheng_go()', '')
    create_triggerex_f('xuncheng_accept3', "^>*\\s*�쵤��˵�������㲻���Ѿ�����Ѳ�ǵ�������", 'xuncheng_go()', '')
    create_triggerex_f('xuncheng_accept4', "^>*\\s*�쵤��˵������\\D*�����������", 'xuncheng_start_wait()', '')
end
function xuncheng_join()
    DeleteTemporaryTriggers()
    wait.make( function()
        wait.time(3)
        Execute('e;#4s;#4e;#3n;e')
        Execute('s;ask fu sigui about join')
        wait.time(2)
        check_busy(xuncheng_join_back)
    end )
end

function xuncheng_join_back()
    Execute('n')
    Execute('w;#3s;#4w;#4n;w')
    xuncheng_start()
end

function xuncheng_go()
    quest.name = "����Ѳ��"
    quest.status = "Ѳ����"
    quest.update()
    DeleteTemporaryTriggers()
    if hp.jingxue >= hp.jingxue_max * 0.5 then
        Execute('readbook')
    end
    if hp.neili_max > hp.neili_lim - 3 and hp.jingli_max > hp.jingli_lim - 2 and hp.neili > hp.neili_max then
        Execute('sxlian')
    end
    Execute('hp')
    if hp.neili_lim <= hp.neili_max then
        Execute('yun jingli')
    end
    wait.make( function()
        wait.time(2)
        -- exe('yun jing;readbook')	
        if hp.jingli > 100 then
            i = i + 1
            xuncheng_step()
        else
            Execute('yun jingli')
            xuncheng_wait()
        end
    end )
end
function xuncheng_step()
    Execute(xuncheng[i])
    if i < 13 then
        -- Execute('dazuo 30')
        wait.make( function()
            wait.time(1)
            exe('yun jing;du book')
            check_busy(xuncheng_go)
        end )
    else
        xuncheng_task()
    end
end
function xuncheng_wait()
    wait.make( function()
        wait.time(1)
        exe('yun jing;wield good sword;readbook')
        -- Execute('dazuo '..hp.dazuo)
        check_busy(xuncheng_go)
    end )
end
function xuncheng_task()
    DeleteTemporaryTriggers()
    create_triggerex_f('xuncheng_task1', "^>*\\s*�쵤����������������ͷ��", 'xuncheng_check()', '')
    create_triggerex_f('xuncheng_task2', "^>*\\s*��ûѲ��������ʲô����", 'xuncheng_start()', '')
    create_triggerex_f('xuncheng_task3', "^>*\\s*�쵤���������ؿ����㡣", 'xuncheng_task_wait()', '')
    create_triggerex_f('xuncheng_task4', "^>*\\s*���ǲ���͵�����Ƕ�", 'xunchengdong()', '')
    create_triggerex_f('xuncheng_task5', "^>*\\s*���ǲ���͵��������", 'xunchengxi()', '')
    create_triggerex_f('xuncheng_task6', "^>*\\s*���ǲ���͵�����Ǳ�", 'xunchengbei()', '')
    create_triggerex_f('xuncheng_task7', "^>*\\s*���ǲ���͵��������", 'xuncheng_start()', '')
    create_triggerex_f('xuncheng_task8', "^>*\\s*���������Ϊ�Ѿ��޷��������������ˡ�", 'xuncheng_tuna()', '')
    create_triggerex_f('xuncheng_task9', "^>*\\s*��ľ�����Ϊ�Ѿ��ﵽ�����ڹ����ܿ��Ƶļ��ޡ�", 'xuncheng_dazuo()', '')
    wait.make( function()
        if hp.exp > 150000 then
            wait.time(0.2)
        else
            wait.time(3)
        end
        Execute('task ok')
    end )
end
function xuncheng_tuna()
    print('tuna')
    xctuna = 1
end
function xuncheng_dazuo()
    print('dazuo')
    xctuna = 0
end
function xunchengdong()
    wait.make( function()
        wait.time(2)
        exe('halt;yun jinglil;e;#4 s;#4 e;#4 n;e;e;ne;eu;eu;se;se;enter;#3 n;#3 s;out')
    end )
    wait.make( function()
        wait.time(4)
        exe('nw;nw;wd;wd;sw;w;w;#4 s;#4 w;#4 n;w;task ok')
    end )
end
function xunchengbei()
    wait.make( function()
        wait.time(2)
        exe('halt;yun jinglil;e;#4 s;e;e;s;s;su;e;w;se;w;w;e;e;s;su;sw;ne;nd;n;su;n;s;s;n;nd;nw')
    end )
    wait.make( function()
        wait.time(4)
        exe('nd;n;n;w;s;n;w;s;n;w;e;n;w;e;n;w;e;n;w;e;n;w;task ok')
    end )
end
function xunchengxi()
    wait.make( function()
        wait.time(2)
        exe('halt;yun jingli;wu;eu;wu;nu;n;s;sd;ed;sd;sw;su;nd;w;nw;sw;u;d;ne;se;sw;su')
    end )
    wait.make( function()
        wait.time(3)
        exe('nd;ne;sw;su;nd;ne;e;ne;ed;task ok')
    end )
end
function xuncheng_task_wait()
    if hp.exp and hp.exp > 150000 then
        if xctuna == 1 then
            Execute('e;yun jing;tuna ' .. hp.jingxue / 2)
            return check_busy(xuncheng_task_goon)
        else
            if hp.neili_max > hp.neili_lim - 3 and hp.jingli_max > hp.jingli_lim - 2 then
                exe('yun jing;yun qi;yun jingli;sxlian')
            end
            Execute('e;yun qi;dazuo ' .. hp.dazuo)
            return check_busy(xuncheng_task_goon)
        end
    else
        if xctuna == 1 then
            Execute('e;yun jing;yun jingli;tuna ' .. hp.jingxue / 3)
        else
            Execute('e;dazuo ' .. hp.dazuo * 2)
        end
        return check_busy(xuncheng_task_goon)
    end
end
function xuncheng_task_goon()
    DeleteTemporaryTriggers()
    Execute('w')
    xuncheng_task()
end
function xuncheng_check()
    quest.status = "Ѳ�ǽ���"
    quest.update()
    DeleteTemporaryTriggers()
    Execute('cha;score;hp')
    check_bei(xuncheng_checkpot)
end

function xuncheng_checkpot()
    quest.name = "״̬���"
    quest.update()
    if hp.pot >= hp.pot_max * 6 / 7 then
        if hp.jingli > 100 then
            if score.gold and skills["literate"] and score.gold > 300 and skills["literate"].lvl < hp.pot_max - 100 then
                return literate()
            end
            return check_xuexi()
            -- return go(xuexi,"�����","���")
        else
            return checkWait(xuncheng_check, 5)
        end
    else
        return xuncheng_start()
    end
end

function dushu(p_book)
    disAll()
    create_triggerex('dushu1', "^(> )*(����������̫��|���ж���һ���|��Ļ�����û�д��|���ʵս���鲻��)", '', 'check_heal')
    create_triggerex('dushu2', "^(> )*(����ϸ�ض���һ��|���Ѿ��޷��ٴ��ؼ���ѧ��ʲô|������Ļ�����������|��о��Լ������廢���ŵ�|�㽫�����ؼ��ж�����)", '', 'check_heal')
    tmp.book = p_book
    return check_bei(dushuStart)
end
function dushuStart()
    exe('yun jing;cha;hp')
    check_bei(dushuDazuo)
end
function dushuDazuo()
    if hp.qixue > hp.dazuo then
        exe('dazuo ' .. hp.qixue)
    end
    check_bei(dushuAct)
end
function dushuAct()
    exe('hp')
    check_bei(dushuCheck)
end
function dushuCheck()
    local bookRead = {
        ["medicine book"] = true,
        ["bo juan"] = true,
        ["miji"] = true,
        ["jiuyin-baiguzhua"] = true,
        ["cuixin-zhang"] = true,
        ["yinlong-bian"] = true,
        ["jianfa"] = true,
        ["zhangfa"] = true,
    }
    if hp.neili > hp.neili_max * 0.4 then
        exe('yun jing')
        if bookRead[tmp.book] then
            exe('#5(read ' .. tmp.book .. ')')
        else
            exe('#5(du ' .. tmp.book .. ')')
        end
        return check_bei(dushuAct)
    else
        return prepare_neili(dushuAct)
    end
end

function fullNeili()
    exe('unset ����')
    exe('cha;hp')
    if score.party and score.party == "ؤ��" then
        go(fullNeiliStart, 'ؤ��', 'Ĺ��ͨ��')
    else
        go(fullNeiliStart, '����ɽ', '���۵�')
    end
end
function fullNeiliStart()
    exe('unset ����')
    exe('hp')
    check_bei(fullNeiliCheck)
end
function fullNeiliCheck()
    flag.idle = 0

    if hp.neili_max >= hp.neili_lim then
        return check_heal()
    end

    if hp.qixue < hp.dazuo * 2 then
        exe('yun qi;dazuo ' .. hp.dazuo)
    else
        exe('dazuo ' .. hp.dazuo)
    end

    return fullNeiliCon()
end
function fullNeiliCon()
    exe('hp')
    check_bei(fullNeiliCheck)
end

function fullSkill(xskill)
    tmp.i = 0
    tmp.xskill = xskill
    tmp.pskill = nil
    tmp.oskill = nil
    return go(fullSkillStart, '����ɽ', '���۵�')
end
function fullSkillStart()
    return prepare_neili(fullSkillCheck)
end
function fullSkillCheck()
    flag.idle = 0
    messageShow(tmp.xskill)
    lianxi(5, tmp.xskill)
    if (tmp.pskill and tmp.oskill == nil) or(tmp.oskill and tmp.pskill and tmp.oskill ~= tmp.pskill) then
        tmp.oskill = tmp.pskill
        tmp.skillpot = nil
        tmp.i = 0
    end
    if tmp.oskill and tmp.pskill and tmp.oskill == tmp.pskill and skills[tmp.pskill] then
        if tmp.skillpot == nil then
            tmp.skillpot = skills[tmp.pskill].pot
        end
        if tmp.skillpot == skills[tmp.pskill].pot then
            tmp.i = tmp.i + 1
            if tmp.i > 100 then
                skills[tmp.pskill].fullever = true
                return check_heal()
            end
        end
    end
    if flag.lianxi == 1 then
        if tmp.xskill and tmp.pskill then
            messageShow(tmp.xskill .. ' ' .. tmp.pskill)
        end
        if tmp.xskill and tmp.pskill and tmp.xskill == tmp.pskill and skills[tmp.xskill].lvl < skills["force"].lvl and skills[tmp.xskill].lvl < hp.pot_max - 100 then
            return lingwu()
        else
            return check_heal()
        end
    end
    if hp.neili < hp.neili_max / 2 then
        return fullSkillStart()
    end
    if hp.neili == hp.neili_max * 2 then
        return check_heal()
    end
    local l_cnt = math.modf(hp.neili_max / 50)
    if l_cnt < 1 then l_cnt = 1 end
    exe('yun jingli')
    lianxi(l_cnt, tmp.xskill)
    exe('cha;hp')
    return check_bei(fullSkillCheck)
end

function learnSzj()
    return go(learnSzjChk, "���ݳ�", "���ű�Ӫ")
end
function learnSzjChk()
    if hp.exp > 500000 then
        return wipe("zhao liangdong", learnSzjGo)
    else
        return learnSzjGo()
    end
end
function learnSzjGo()
    exe('west')
    locate()
    return check_busy(learnSzjAsk, 1)
end
function learnSzjAsk()
    flag.idle = 0
    if not locl.id["����"] then
        return check_bei(learnSzjOver)
    end
    if skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl >= 200 then
        return check_bei(learnSzjOver)
    end
    if hp.pot < 10 then
        return check_bei(learnSzjOver)
    end
    if hp.neili < 1000 and Bag["������Ϣ��"] then
        exe('eat chuanbei wan')
    end
    if hp.neili < 500 then
        if Bag["�󻹵�"] then
            exe('eat dan')
        else
            return check_bei(learnSzjOver)
        end
    end
    exe('yun jing;ask ding dian about ���վ�;cha;hp')
    locate()
    checkBags()
    return check_busy(learnSzjAsk, 1)
end
function learnSzjOver()
    if hp.pot >= hp.pot_max then
        return potSave()
    end
    return check_heal()
end

function huxi()
    return go(huxiStart, "����ɽ", "��ţɽ")
end
function huxiStart()
    if locl.room ~= "��ţɽ" then
        return huxi()
    end
    DeleteTriggerGroup("huxi")
    create_trigger_t('huxi1', "^(> )*�㼯��������������������������", '', 'huxiCheck')
    create_trigger_t('huxi2', "^(> )*��������������˹���", '', 'huxiChk')
    SetTriggerOption("huxi1", "group", "huxi")
    SetTriggerOption("huxi2", "group", "huxi")
    exe('enable force shenzhao-jing')
    exe('wo stone;huxi;hp')
end
function huxiChk()
    flag.idle = 0
    if skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl == hp.pot_max - 100 then
        return check_bei(huxiOver, 1)
    end
    wait.make( function()
        wait.time(1)
        if hp.jingxue < 60 then
            exe('yun jing')
        end
        if hp.qixue < 60 then
            exe('yun qi')
        end
        exe('wo stone;huxi;hp;cha')
    end )
end
function huxiCheck()
    flag.idle = 0
    if skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl == hp.pot_max - 100 then
        return check_bei(huxiOver, 1)
    end
    wait.make( function()
        wait.time(2)
        if hp.jingxue < 60 then
            exe('yun jing')
        end
        if hp.qixue < 60 then
            exe('yun qi')
        end
        exe('wo stone;huxi;hp;cha')
    end )
end
function huxiOver()
    DeleteTriggerGroup("huxi")
    return check_heal()
end

function wxjzFofa()
    return go(wxjzFofaPre, "��ɽ����", "������")
end
function wxjzFofaPre()
    EnableTrigger("fight16", false)
    if Bag["�ӹ�"] and Bag["����"] then
        exe('n')
        exe('pray pearl')
        for p in pairs(Bag) do
            if Bag[p].kind then
                for i = 1, Bag[p].cnt do
                    exe('drop ' .. Bag[p].fullid)
                end
            end
        end
        exe('drop silver')
        exe('shuai tao suo')
        exe('da nao gou;pa up;enter')
        locate()
        return check_busy(wxjzFofaAsk, 1)
    end
    if locl.id["������ʦ"] then
        if not Bag["�ӹ�"] then
            exe('ask fangsheng about �ӹ�')
        end
        if not Bag["����"] then
            exe('ask fangsheng about ����')
        end
        checkBags()
        return check_busy(wxjzFofaPre, 1)
    else
        return check_heal()
    end
end
function wxjzFofaAsk()
    if locl.room == "������" then
        exe('n')
        exe('pray pearl')
        exe('shuai tao suo')
        exe('da nao gou;pa up;enter')
        locate()
        return check_busy(wxjzFofaAsk, 1)
    end
    if not locl.id["������ʦ"] then
        return check_heal()
    end
    DeleteTriggerGroup("fofa")
    create_trigger_t('fofa1', "^(> )*����������ʦ�����йء��𷨡�����Ϣ", '', 'fofaAccept')
    create_trigger_t('fofa2', "^(> )*����û������ˡ�$", '', 'fofaNobody')
    SetTriggerOption("fofa1", "group", "fofa")
    SetTriggerOption("fofa2", "group", "fofa")
    exe('ask wuxiang chanshi about ��')
end
function fofaNobody()
    EnableTriggerGroup("fofa", false)
    return check_bei(wxjzFofaOver)
end
function wxjzFofaOver()
    DeleteTriggerGroup("fofa")
    DeleteTriggerGroup("ffacp")
    exe('out;d;get all')
    return check_heal()
end
function fofaAccept()
    EnableTriggerGroup("fofa", false)
    DeleteTriggerGroup("ffacp")
    create_trigger_t('ffacp1', "^(> )*��������ã���������", '', 'fofaAskCon')
    create_trigger_t('ffacp2', "^(> )*������ʦ(����|)˵����(��|)���Ǳ�ܲ����ˡ�", '', 'fofaAskPot')
    create_trigger_t('ffacp3', "^(> )*������ʦ(����|)˵����(��|)��ʦ�𷨾���", '', 'fofaAskOver')
    SetTriggerOption("ffacp1", "group", "ffacp")
    SetTriggerOption("ffacp2", "group", "ffacp")
    SetTriggerOption("ffacp3", "group", "ffacp")
end
function fofaAskCon()
    EnableTriggerGroup("ffacp", false)
    return check_bei(wxjzFofaAsk, 1)
end
function fofaAskPot()
    EnableTriggerGroup("ffacp", false)
    return check_bei(wxjzFofaOver, 1)
end
function fofaAskOver()
    EnableTriggerGroup("ffacp", false)
    flag.wxjz = 1
    return check_bei(wxjzFofaOver, 1)
end

function tiaoshui()
    return go(tiaoshuiAsk, "��ɽ����", "���")
end
function tiaoshuiAsk()
    if locl.id["�ۿ�����"] then
        wait.make( function()
            exe('ask huikong zunzhe about ��ˮ')
            wait.time(3)
            exe('get tie tong')
            checkBags()
            return check_busy(tiaoshuiTong, 1)
        end )
    end
    return go(tiaoshuiAsk, "��ɽ����", "���")
end
function tiaoshuiTong()
    if Bag["����Ͱ"] then
        return go(tiaoshuiFill, "��ɽ����", "���ľ�")
    end
    return go(tiaoshuiAsk, "��ɽ����", "���")
end
function tiaoshuiFill()
    flag.idle = 0
    exe('fill tie tong')
    return go(tiaoshuiPour, "��ɽ����", "���")
end
function tiaoshuiPour()
    exe('pour gang')
    checkBags()
    return check_busy(tiaoshuiChk, 1)
end
function tiaoshuiChk()
    if not Bag["����"] then
        return check_heal()
    end
    if not Bag["����Ͱ"] then
        return go(tiaoshuiAsk, "��ɽ����", "���")
    end
    return go(tiaoshuiFill, "��ɽ����", "���ľ�")
end