-- ��ػ�
local TdhIgnores = {
    ["����ׯ�Ź��һ���"] = true,
    ["�һ���������"] = true,
}
function tdh_trigger()
    DeleteTriggerGroup("tdh_find")
    DeleteTriggerGroup("tdh_ask")
    create_trigger_t('tdh_ask1', "^(> )*������ʽ�������й�", '', 'tdh_ask')
    create_trigger_t('tdh_ask2', "^(> )*����û������ˡ�$", '', 'tdh_nobody')
    SetTriggerOption("tdh_ask1", "group", "tdh_ask")
    SetTriggerOption("tdh_ask2", "group", "tdh_ask")
    EnableTriggerGroup("tdh_ask", false)
    DeleteTriggerGroup("tdh_accept")
    create_trigger_t('tdh_accept1', "^(> )*��ʽ������Ķ�������˵������ȥ", '', 'tdh_fangqi')
    create_trigger_t('tdh_accept2', "^(> )*��ʽ��˵��������Ȼ�������ˣ�Ҳ�����ˡ���", '', 'tdh')
    create_trigger_t('tdh_accept3', "^(> )*��ʽ��˵����������û������񣬷���ʲô������", '', 'tdh_lianxi')
    create_trigger_t('tdh_accept4', "^(> )*��ʽ��˵��������ʱû��������Ҫ�����Ժ���˵�ɡ���", '', 'tdh_lianxi')
    create_trigger_t('tdh_accept5', "^(> )*��ʽ������Ķ�������˵�����������ֽ�(\\D*)����·��С�ġ�", '', 'tdh_consider')
    create_trigger_t('tdh_accept6', "^(> )*��ʽ������Ķ�������˵����������ȥ(\\D*)����һ��������ֵܡ�", '', 'tdh_where')
    create_trigger_t('tdh_accept7', "^(> )*��ʽ��˵���������������񣬻���ȥ��Ϣ��ɡ���", '', 'tdh_busy')
    create_trigger_t('tdh_accept8', "^(> )*��ʽ��˵����������û������񣬷���ʲô������", '', 'tdh_finish')
    create_trigger_t('tdh_accept9', "^(> )*��ʽ��������һ�ۣ�˵�������Ĳ����İ���", '', 'tdh_join')
    create_trigger_t('tdh_accept10', "^(> )*��ʽ��˵�������㻹���������أ���", '', 'songxin')
    create_trigger_t('tdh_accept11', "^(> )*���Ǻ���Ȼ�ģ���ʽ�����ڵ�״��û�а취�����κδ𸲡�", '', 'tdh_nobody')
    create_trigger_t('tdh_accept12', "^(> )*��ʽ��˵���������Ѿ���(\\D*)��ϵ���ˣ����ǿ��ȥ��(\\D*)��ϰɣ���", '', 'tdhFangqi')
    create_trigger_t('tdh_accept13', "^(> )*��ʽ��˵��������˵���ܶ����������㣬�㻹����ȥ���ܶ���ѯ�ʰɡ���", '', 'tdhBug')
    SetTriggerOption("tdh_accept13", "group", "tdh_accept")
    SetTriggerOption("tdh_accept12", "group", "tdh_accept")
    SetTriggerOption("tdh_accept11", "group", "tdh_accept")
    SetTriggerOption("tdh_accept1", "group", "tdh_accept")
    SetTriggerOption("tdh_accept2", "group", "tdh_accept")
    SetTriggerOption("tdh_accept3", "group", "tdh_accept")
    SetTriggerOption("tdh_accept4", "group", "tdh_accept")
    SetTriggerOption("tdh_accept5", "group", "tdh_accept")
    SetTriggerOption("tdh_accept6", "group", "tdh_accept")
    SetTriggerOption("tdh_accept7", "group", "tdh_accept")
    SetTriggerOption("tdh_accept8", "group", "tdh_accept")
    SetTriggerOption("tdh_accept9", "group", "tdh_accept")
    SetTriggerOption("tdh_accept10", "group", "tdh_accept")
    EnableTriggerGroup("tdh_accept", false)
end
function tdhFangqi()
    if not locl.id[job.target2] then
        dis_all()
        return check_bei(songxin)
    end
    return tdhBack()
end
function tdhBug()
    dis_all()
    tdh_triggerDel()
    job.target = '�½���'
    job.where = '���ݳǷ�԰'
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    create_trigger_t('tdh_find1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'tdh_bug_ask')
    return go(tdh_bug_find, job.area, job.room)
end
function tdh_bug_find()
    job.flag()
    exe('look')
    return find()
end
function tdh_bug_ask(n, l, w)
    dis_all()
    job.id = string.lower(w[1])
    exe('follow ' .. job.id)
    locate()
    return check_bei(tdhaover, 1)
end
function tdhaover()
    if not locl.id[job.target] then
        print("NPC�뿪��")
        return tdh_find()
    end
    exe('askk ' .. job.id .. ' about ��Ѫ��צ')
    job.target = nil
    job.where = nil
    return check_halt(check_food)
end
function tdh_join()
    EnableTrigger("tdh_accept13", false)
    return check_busy(joinAsk1)
end
function joinAsk1()
    exe('ask li about ������')
    return check_busy(joinAsk2)
end
function joinAsk2()
    exe('ask li about ��ػ�')
    return check_busy(joinAsk3)
end
function joinAsk3()
    exe('ask li about ���帴��')
    return check_busy(tdh)
end
function tdh_triggerDel()
    DeleteTriggerGroup("tdh_find")
    DeleteTriggerGroup("tdh_ask")
    DeleteTriggerGroup("tdh_cask")
    DeleteTriggerGroup("tdh_accept")
    DeleteTriggerGroup("tdh_fight")
    DeleteTriggerGroup("tdh_finish")
    DeleteTriggerGroup("tdhId")
    DeleteTriggerGroup("tdh_last_fight")
    DeleteTriggerGroup("tdh_last_Id")
    DeleteTriggerGroup("tdh_wait_npc2")
    DeleteTriggerGroup("tdh_goback_find_npc2")
end
job.list["tdh"] = "��ػ�"
function tdh()
    dis_all()
    tdh_trigger()
    job.flag()
    job.target3 = '����Ŀ��'
    exe('pfmset;set wimpycmd pfmpfm\\hp')
    return go(tdh_start, '���ݳ�', 'С��ɽ')
end
function tdh_neili()
    if hp.neili < hp.neili_max * 1.2 then
        return prepare_neili(tdh_start)
    else
        return tdh_start()
    end
end    
jobFindAgain = jobFindAgain or { }
jobFindAgain["tdh"] = "tdhFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["tdh"] = "tdhFindFail"
function tdhFindAgain()
    EnableTriggerGroup("tdh_find", false)
    if tmp.tdh then
        if tmp.tdh == 1 then
            EnableTrigger("tdh_find1", true)
            EnableTrigger("tdh_find5", true)
        end
        if tmp.tdh == 2 then
            EnableTrigger("tdh_find2", true)
            EnableTrigger("tdh_find4", true)
        end
        if tmp.tdh == 3 then
            EnableTrigger("tdh_find3", true)
        end
    end
    return go(tdh_find_act, dest.area, dest.room)
end
function tdhFindFail()
    messageShow('��ػ�����û�ҵ��ˣ���ȥ������')
    EnableTriggerGroup("tdh_find", false)
    return check_bei(tdh_fangqi_go)
end
function tdh_start()
    if job.last == 'wudang' then
        flag.idle = nil
        return prepare_lianxi(job_tdh)
    else
        return check_halt(job_tdh)
    end
end
function job_tdh()
    job.name = 'tdh'
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("tdh_ask", true)
    exe('ask li shikai about job')
    flag.idle = nil
    backtdh = 0
end
function tdh_ask()
    EnableTriggerGroup("tdh_ask", false)
    EnableTriggerGroup("tdh_accept", true)
end
function tdh_nobody()
    EnableTrigger("tdh_accept13", false)
    EnableTriggerGroup("tdh_ask", false)
    tdh_triggerDel()
    if score.party == '��ɽ��' and hp.shen < 0 then
        return clb()
    end
    return huashan()
end
function tdh_busy()
    tdh_triggerDel()
    job.last = "tdh"
    return check_heal()
end
function tdh_lianxi()
    EnableTriggerGroup("tdh_accept", false)
    return prepare_lianxi(tdh)
end
function tdh_fangqi_go()
    return go(tdh_fangqi, '���ݳ�', 'С��ɽ')
end
function tdh_fangqi()
    EnableTrigger("tdh_accept13", false)
    nobusy = 0
    EnableTriggerGroup("tdh_accept", false)
    return check_bei(tdh_fangqi_ask)
end
function tdh_fangqi_ask()
    EnableTriggerGroup("tdh_ask", true)
    exe('ask li shikai about ����')
end
function tdh_where(n, l, w)
    EnableTrigger("tdh_accept13", false)
    job.where3 = Trim(w[2])
end
function tdh_consider(n, l, w)
    nobusy = 1
    EnableTrigger("tdh_accept13", false)
    job.time.b = os.time()
    messageShow('��ػ���������ʼ��')
    exe('pfmset')
    EnableTriggerGroup("tdh_accept", false)
    job.target3 = Trim(w[2])
    job.target2 = "δ��"
    if job.where3 ~= nil then
        if getAddr(job.where3) ~= false then
            job.room, job.area = getAddr(job.where3)
        else
            messageShow('��ػ���������ص㡾' .. job.where3 .. '�����ɵ�����������')
            return check_bei(tdh_fangqi_go)
        end
    else
        messageShow('��ػ���������ص������' .. job.where3 .. '�������ڣ����������')
        return check_bei(tdh_fangqi_go)
    end
    -- job.room,job.area=getAddr(job.where3)
    dest.room = job.room
    dest.area = job.area
    job.last = "tdh"
    tmp.tdh = 1
    flag.idle = nil
    if TdhIgnores[job.where3] or not job.room or not path_cal() then
        messageShow('��ػ���������ص㡾' .. job.where3 .. '�����ɵ�����������')
        return check_bei(tdh_fangqi)
    end
    messageShow('��ػ����񣺿�ʼǰ����' .. job.where3 .. '����Ѱ�ҽС�' .. job.target3 .. '���ĸ���ͬ־��')
    exe('nick ��ػ���' .. job.where3)
    exe('set po ��')
    return check_bei(tdh_find)
end
function tdh_find()
    DeleteTriggerGroup("tdh_find")
    create_trigger_t('tdh_find1', '^>*\\s*\\D*' .. job.target3 .. '\\((\\D*)\\)', '', 'tdh_comrade')
    create_trigger_t('tdh_find2', '^>*\\s*\\D*' .. job.target2 .. '\\((\\D*)\\)', '', 'tdhProtect')
    create_trigger_t('tdh_find3', '^>*\\s*\\D*' .. job.target3 .. '\\((\\D*)\\)', '', 'tdhStop')
    create_trigger_t('tdh_find4', "^(> )*����Զ����һ�ˣ����ӻ�㱺�'..job.target3..'˵�����˺���$", '', 'tdh_findok')
    create_trigger_t('tdh_find5', '^>*\\s*' .. job.target3 .. '����������������', '', 'tdh_debug_find')
    SetTriggerOption("tdh_find1", "group", "tdh_find")
    SetTriggerOption("tdh_find2", "group", "tdh_find")
    SetTriggerOption("tdh_find3", "group", "tdh_find")
    SetTriggerOption("tdh_find4", "group", "tdh_find")
    SetTriggerOption("tdh_find5", "group", "tdh_find")
    EnableTriggerGroup("tdh_find", false)
    flag.times = 1
    return check_bei(tdh_find_go)
end
function tdh_debug_find()
    EnableTrigger("tdh_find1", true)
    EnableTrigger("tdh_find5", true)
    exe('look')
end
function tdh_findok()
    EnableTrigger("tdh_find4", false)
    EnableTrigger("tdh_find2", true)
    exe('look')
end
function tdh_find_go()
    -- EnableTriggerGroup("tdh_find",true)
    if tmp.tdh then
        if tmp.tdh == 1 then
            EnableTrigger("tdh_find1", true)
            EnableTrigger("tdh_find5", true)
        end
        if tmp.tdh == 2 then
            EnableTrigger("tdh_find2", true)
            EnableTrigger("tdh_find4", true)
        end
        if tmp.tdh == 3 then
            EnableTrigger("tdh_find3", true)
            if tdh_npc1_room_id ~= nil and tdh_npc1_room_id ~= '' then
                if map.rooms[tdh_npc1_room_id].no_fight ~= nil then
                    target_room_is_no_fight = map.rooms[tdh_npc1_room_id].no_fight
                    -- Ŀ�귿�����ڷ�ս�����䣬���һ��npc����ˢ���������·�����
                end
                -- messageShow('��ػ�����ֱ�ӷ��ظղż�¼�ġ�'..tdh_npc1_room_id ..'������Ѱ�Ҹ���ͬ־��')
                return go(tdh_find_act, tdh_npc1_room_id, '')
                -- ֱ�ӷ��ظղż�¼��tdh_npc1����ţ�
            end
        end
    end
    return go(tdh_find_act, job.area, job.room)
end
function tdh_find_act()
    job.flag()
    exe('look')
    messageShow('��ػ����񣺿�ʼѰ�ҡ�' .. dest.area .. dest.room .. '���ĸ���ͬ־��')
    return find()
end
function tdh_comrade(n, l, w)
    dis_all()
    EnableTrigger("tdh_find4", true)
    job.id = string.lower(w[1])
    exe('follow ' .. job.id)
    locate()
    if road.id ~= nil then
        tdh_npc1_room_id = road.id
    end
    return check_bei(tdhaask, 1)
end
function tdhaask()
    if not locl.id[job.target3] then
        print("NPC�뿪��")
        return tdh_find()
    end
    exe('askk ' .. job.id .. ' about ���帴��')
    return tdh_comrade_ask()
end

-- ain
-- > ������ô����йء��пڡ�����Ϣ��
-- ����˵�������пڣ��������е���˼������˵˵(qiekou)����
function tdh_comrade_ask()
    DeleteTriggerGroup("tdh_cask")
    create_trigger_t('tdh_cask1', '^( )*' .. job.target3 .. '˵��������(\\D*)��һλ����(\\D*)���ֵܣ��������������ػᡣ��', '', 'tdhConsider')
    create_trigger_t('tdh_cask2', '^( )*' .. job.target3 .. '������һ�ۣ�˵�������Ĳ����İ���', '', 'tdh_qiekou')
    create_trigger_t('tdh_cask3', '^( )*' .. job.target3 .. '˵�������пڣ��������е���˼������˵˵', '', 'tdh_qiekou')
    create_trigger_t('tdh_cask4', '^(> )*����Ъ������˵���ɡ�', '', 'tdh_askbusy')
    SetTriggerOption("tdh_cask1", "group", "tdh_cask")
    SetTriggerOption("tdh_cask2", "group", "tdh_cask")
    SetTriggerOption("tdh_cask3", "group", "tdh_cask")
    SetTriggerOption("tdh_cask4", "group", "tdh_cask")
    return tdh_askbusy()
end
function tdh_askbusy()
    wait.make( function()
        wait.time(1)
        exe('ask ' .. job.id .. ' about �п�')
    end )
end
function tdh_qiekou()
    print("����tdh_qiekou")
    -- return exe('qiekou')
    locate()
    return check_halt(tdh_qiekou2)
end
function tdh_qiekou2()
    EnableTrigger("tdh_cask4", false)
    print("�ش��п�")
    return exe('qiekou')
end
function tdhConsider(n, l, w)
    exe('follow none')
    EnableTriggerGroup("tdh_cask", false)
    job.where2 = Trim(w[2])
    job.target2 = Trim(w[3])
    if TdhIgnores[job.where2] then
        messageShow('��ػ���������ص㡾' .. job.where2 .. '�����ɵ�����������')
        return check_bei(tdh_fangqi_go)
    end
    return tdhcklol()
end
function tdhcklol()
    if locl.area == '��֪������' then
        -- locate()
        exe(locl.dir)
        Note('�޷�ȷ����ǰ�ص㣬����ƶ��ٶ�λ��')
        wait.make( function()
            wait.time(1)
            locate()
        end )
        return checkWait(tdhcklol, 1)
    else
        return check_bei(tdhConOk)
    end
end
function tdhConOk()
    if job.where2 ~= nil then
        if getAddr(job.where2) ~= false then
            job.room, job.area = getAddr(job.where2)
        else
            messageShow('��ػ���������ص㡾' .. job.where2 .. '�����ɵ�����������')
            return check_bei(tdh_fangqi_go)
        end
    else
        messageShow('��ػ���������ص������' .. job.where2 .. '�������ڣ����������')
        return check_bei(tdh_fangqi_go)
    end
    -- job.room,job.area=getAddr(job.where2)
    dest.room = job.room
    dest.area = job.area
    tmp.tdh = 2
    tdhround = 1
    roundtdh = 1
    if not path_cal() then
        tdh_npc1_to_npc2_all_path = false
    else
        tdh_npc1_to_npc2_all_path = path_cal()
    end
    if not job.room or not path_cal() then
        messageShow('��ػ���������ص㡾' .. job.where2 .. '�����ɵ�����������')
        return check_bei(tdh_fangqi_go)
    end
    exe('nick ��ػ���' .. job.where2)
    exe('set env_msg')
    messageShow('��ػ����񣺿�ʼǰ����' .. job.where2 .. '����Ѱ�ҽС�' .. job.target2 .. '���ĸ���ͬ־����')
    return check_bei(tdh_find)
end
function tdhProtect(n, l, w)
    -- EnableTriggerGroup("tdh_find",false)
    dis_all()
    flag.find = 1
    flag.wait = 1
    job.id2 = string.lower(w[1])
    exe('ask ' .. job.id2 .. ' about ��ػ�')
    locate()
    if perform.force and perform.force == "dulong-dafa" then
        exe('yun wudi')
    end
    return check_bei(tdhProtectAsk, 1)
end
function tdhProtectAsk()
    if not locl.id[job.target2] then
        return check_bei(tdh_find)
    end
    DeleteTriggerGroup("tdh_fight")
    create_trigger_t('tdh_fight1', '^(> )*(\\D*)(ת�ۼ��ߵ���Ӱ���١�|��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�)', '', 'tdhDie')
    create_trigger_t('tdh_fight2', '^(> )*(\\D*)ŭ�������ٸ������շ��������˵���������˵�ձ���' .. job.target2 .. 'ս����һ��', '', 'tdhProtectId')
    create_trigger_t('tdh_fight3', '^(> )*(\\D*)�е����������շ��������˵���������˵�ձ�����ս����һ��', '', 'tdhProtectId')
    create_trigger_t('tdh_fight4', '^(> )*���ﲻ׼ս����', '', 'tdhMoveOn')
    SetTriggerOption("tdh_fight1", "group", "tdh_fight")
    SetTriggerOption("tdh_fight2", "group", "tdh_fight")
    SetTriggerOption("tdh_fight3", "group", "tdh_fight")
    SetTriggerOption("tdh_fight4", "group", "tdh_fight")
    exe('ask ' .. job.id2 .. ' about ���帴��')
end
function tdhMoveOn()
    tdhround = 1
    roundtdh = 1
    locate()
    exe(locl.dir)
    Note('��ǰ�ص��޷�����������ƶ��ٹ�����')
    wait.make( function()
        wait.time(1)
        tdhMove()
    end )
    return
end
function tdhProtectId(n, l, w)
    dis_all()
    EnableTriggerGroup("tdh_fight", true)
    EnableTrigger("hpheqi1", true)
    tmp.kill = tmp.kill or 0
    tmp.kill = tmp.kill + 1
    job.killer[w[2]] = true
    DeleteTriggerGroup("tdhId")
    create_trigger_t('tdhId1', '^( )*(\\D*)' .. w[2] .. '\\((\\D*)\\)', '', 'tdhId')
    SetTriggerOption("tdhId1", "group", "tdhId")
    exe('look')
    exe('set wimpy 100')
end
function tdhId(n, l, w)
    EnableTriggerGroup("tdhId", false)
    for p in pairs(job.killer) do
        job.killer[p] = string.lower(w[3])
    end
    DeleteTriggerGroup("tdhSet")
    create_trigger_t('tdhSet1', "^(��|��)װ���ţ�$", '', 'npcWeapon')
    SetTriggerOption("tdhSet1", "group", "tdhSet")
    exe('look ' .. string.lower(w[3]))
    exe('kill ' .. string.lower(w[3]))
    kezhiwugong()
    kezhiwugongAddTarget(job.target, string.lower(w[3]))
end
function tdhDie(n, l, w)
    EnableTriggerGroup("tdhSet", false)
    wait_cd = os.time()
    if job.killer[w[2]] then
        job.killer[w[2]] = nil
        locate()
        exe('hp;set po ��')
        return checkNext(waithq)
    end
end
function waithq()
    if tdhdz * 1 == 1 and tmp.kill <= 6 then
        wait.make( function()
            wait.time(1)
            exe('unset ����;yun jing;yun qi;yun jingli;sxlian;dazuo ' .. hp.dazuo)
            return check_busy(tdhPrepareneili)
        end )
    else
        wait.make( function()
            wait.time(1)
            exe('unset ����;yun jing;yun qi;yun jingli;sxlian')
            return check_busy(tdhPrepareneili)
        end )
    end
end
function tdhPrepareneili()
    nobusy = 1
    if hp.neili < hp.neili_max * 1.2 then
        exe('eat ' .. drug.neili2)
    end
    return prepare_neili(tdhPrepare)
end
function tdhPrepare()
    if dest.area == '������' or dest.area == '��٢��ɽׯ' or dest.area == '����Ľ��' then
        if tmp.kill and tmp.kill > 6 then
            return tdhBack()
        elseif roundtdh > 2 then
            messageShow('��ػ�����2����������ص��ڡ�' .. job.where2 .. '������ת�ص㡾' .. roundtdh .. '������ϣ���ʼ���أ�')
            return tdhBack()
        elseif tdhround > 12 then
            tdhround = 1
            messageShow('��ػ�����2����������ص��ڡ�' .. job.where2 .. '������ת�ص�ڡ�' .. roundtdh .. '���Σ�')
            roundtdh = roundtdh + 1
            return go(road.act)
        else
            return check_busy(tdhMove)
        end
    end
    if skills["dugu-jiujian"] then
        if tmp.kill and tmp.kill > 5 then
            return tdhBack()
        elseif tdhround > 12 then
            return tdhBack()
        else
            return check_busy(tdhMove)
        end
    end
    if type(tdh_npc1_to_npc2_all_path) == 'string' then
        if string.find(tdh_npc1_to_npc2_all_path, 'jqgin') or string.find(tdh_npc1_to_npc2_all_path, 'jqgout') or string.find(tdh_npc1_to_npc2_all_path, 'yuRen') or string.find(tdh_npc1_to_npc2_all_path, 'Sld') or string.find(tdh_npc1_to_npc2_all_path, 'qu') then
            if tmp.kill and tmp.kill > 6 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        elseif string.find(tdh_npc1_to_npc2_all_path, 'duCjiang') or string.find(tdh_npc1_to_npc2_all_path, 'duHhe') then
            if tmp.kill and tmp.kill > 3 then
                return tdhBack()
            elseif tdhround > 6 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        else
            if tmp.kill and tmp.kill > 1 then
                return tdhBack()
            elseif tdhround > 3 then
                return tdhBack()
            else
                return check_busy(tdhMove)
            end
        end
    end
end
function tdhMove()
    tdhround = tdhround + 1
    -- print(tdhround)
    local l_rooms = getRooms(locl.room, locl.area)
    if tmp.troom and type(tmp.troom) == "table" then
        for k, v in pairs(tmp.troom) do
            for _, x in pairs(l_rooms) do
                if k == x then
                    for y, z in pairs(tmp.troom) do
                        if y ~= k then
                            -- messageShow(k..' '..v..' '..z..' '..y)
                            local l_cmd = v .. ';' .. z
                            -- messageShow(l_cmd)
                            -- exe('#5('.. l_cmd ..')')
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            tmp.tcnt = 1
                            return checkWait(tdhWait, 1)
                        end
                    end
                end
            end
        end
    end

    tmp.troom = nil

    if table.getn(l_rooms) == 1 then
        local l_room = l_rooms[1]
        if not map.rooms[l_room].no_fight then
            for p in pairs(map.rooms[l_room].ways) do
                if dirReverse[p] then
                    local q = dirReverse[p]
                    local r_room = map.rooms[l_room].ways[p]
                    local l_lengths = map.rooms[l_room].lengths
                    local r_lengths = map.rooms[r_room].lengths
                    local l_blocks = map.rooms[l_room].blocks
                    if (l_blocks ~= nil and l_blocks[p] ~= nil) then
                        -- messageShow('��ػ����񣺡�'..locl.area..locl.room..'������ġ�'..p..'�������е�·npc��','darkorange')
                        break
                    end
                    if map.rooms[r_room].no_fight then
                        break
                    end
                    if (not l_lengths or not l_lengths[p]) and(not r_lengths or not r_lengths[q]) then
                        if l_room == map.rooms[r_room].ways[q] then
                            tmp.troom = { }
                            tmp.troom[l_room] = p
                            tmp.troom[r_room] = q
                            -- messageShow(l_room..' '..p..' '..q..' '..r_room)
                            local l_cmd = p .. ';' .. q
                            -- messageShow(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            exe(l_cmd)
                            tmp.tcnt = 1
                            return checkWait(tdhWait, 1.5)
                        end
                    end
                end
            end
        end
    end
    exe(locl.dir)
    locate()
    exe('hp')
    return checkNext(tdhPrepare)
end
function tdhWait()
    tmp.tcnt = tmp.tcnt or 1
    tmp.tcnt = tmp.tcnt + 1
    if tmp.tcnt > 6 then
        return tdhBack()
    elseif tdhround > 12 then
        return tdhBack()
    end
    locate()
    exe('hp')
    return checkNext(tdhMove)
end
function tdhBack()
    EnableTrigger("tdh_accept13", false)
    EnableTriggerGroup("tdhId", false)
    DeleteTriggerGroup("tdh_fight")
    create_trigger_t('tdh_fight1', '^(> )*(\\D*)(ת�ۼ��ߵ���Ӱ���١�|��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�)', '', 'tdhDie')
    create_trigger_t('tdh_fight2', '^(> )*(\\D*)ŭ�������ٸ������շ��������˵���������˵�ձ���' .. job.target2 .. 'ս����һ��', '', 'tdhProtectId')
    create_trigger_t('tdh_fight3', '^(> )*(\\D*)�е����������շ��������˵���������˵�ձ�����ս����һ��', '', 'tdhProtectId')
    create_trigger_t('tdh_fight4', '^(> )*���ﲻ׼ս����', '', 'tdhMoveOn')
    SetTriggerOption("tdh_fight1", "group", "tdh_fight")
    SetTriggerOption("tdh_fight2", "group", "tdh_fight")
    SetTriggerOption("tdh_fight3", "group", "tdh_fight")
    SetTriggerOption("tdh_fight4", "group", "tdh_fight")
    job.room, job.area = getAddr(job.where3)
    dest.room = job.room
    dest.area = job.area
    if Yiliaddr[job.where3] and MidNight[locl.time] then
        if tmp.kill and tmp.kill > 6 then
            DeleteTimer("tdh_wait")
            dis_all()
            messageShow('��ػ���������ص㡾' .. job.where3 .. '��ʱ�䲻�ԣ��л�����')
            return check_bei(songxin)
        elseif tdhround > 16 then
            DeleteTimer("tdh_wait")
            dis_all()
            messageShow('��ػ���������ص㡾' .. job.where3 .. '��ʱ�䲻�ԣ��л�����')
            return check_bei(songxin)
        else
            return check_busy(tdhMove)
        end
    end
    tmp.tdh = 3
    roundtdh = 1
    local l_rooms = getRooms(locl.room, locl.area)
    if tmp.troom and type(tmp.troom) == "table" then
        for k, v in pairs(tmp.troom) do
            for _, x in pairs(l_rooms) do
                if k == x then
                    road.id = k
                end
            end
        end
    end

    tmp.troom = nil

    return check_bei(tdh_find)
end
function tdhStop()
    dis_all()
    EnableTriggerGroup("tdh_finish", true)
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("tdh_wait_npc2")
    create_trigger_t('tdh_wait_npc2_1', '^(> )*(\\D*)' .. job.target3 .. '��˻���ߵؽе�������ﲢ�����ϰ�������', '', 'tdh_arrive_many')
    create_trigger_t('tdh_wait_npc2_2', '^(> )*(\\D*)ŭ�������ٸ������շ��������˵���������˵�ձ���' .. job.target2 .. 'ս����һ��', '', 'tdh_last_Protect')
    create_trigger_t('tdh_wait_npc2_3', '^(> )*(\\D*)�е����������շ��������˵���������˵�ձ�����ս����һ��', '', 'tdh_last_Protect')
    create_trigger_t('tdh_wait_npc2_4', '^(> )*(\\D*)(ת�ۼ��ߵ���Ӱ���١�|��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�)', '', 'tdhDie')
    SetTriggerOption("tdh_wait_npc2_1", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_2", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_3", "group", "tdh_wait_npc2")
    SetTriggerOption("tdh_wait_npc2_4", "group", "tdh_wait_npc2")
    EnableTriggerGroup("tdh_wait_npc2", true)
    flag.find = 1
    flag.wait = 1
    locate()
    return checkWait(tdhStopCheck, 3)
end
function tdh_arrive_many()
    messageShow("��ػ�����һ�������˺ö����ǰ������")
    if wait_times >= 1 then
        wait_times = wait_times - 1
    end
    DeleteTriggerGroup("tdh_last_fight")
    create_trigger_t('tdh_last_fight1', '^(> )*(\\D*)�е����������շ��������˵���������˵�ձ���' .. score.name .. '��ս����һ��', '', 'tdh_last_Protect')
    SetTriggerOption("tdh_last_fight1", "group", "tdh_last_fight")
    EnableTriggerGroup("tdh_last_fight", true)
end
function tdh_last_Protect(n, l, w)
    EnableTriggerGroup("tdh_last_fight", false)
    DeleteTriggerGroup("tdh_last_fight")
    DeleteTriggerGroup("tdh_last_Id")
    create_trigger_t('tdh_last_Id1', '^( )*(\\D*)' .. w[2] .. '\\((\\D*)\\)', '', 'tdh_last_Id')
    SetTriggerOption("tdh_last_Id1", "group", "tdh_last_Id")
    exe('look')
    exe('set wimpy 100')
end
function tdh_last_Id(n, l, w)
    EnableTriggerGroup("tdh_last_Id", false)
    exe('kill ' .. string.lower(w[3]))
end
tdh_wait_npc2_begin = function()
    messageShow('��ػ����񣺵ȴ�30��' .. wait_times .. '�Σ�', 'red')
    DeleteTimer("tdh_wait")
    locate()
    return tdhStopCheck()
end
function tdhStopCheck()
    create_timer_s('tdh_wait', 30, 'tdh_wait_npc2_begin')
    if wait_times == nil then
        wait_times = 1
    else
        wait_times = wait_times + 1
    end
    if not locl.id[job.target3] then
        return check_bei(tdh_find)
    end
    if wait_times > 6 and not locl.id[job.target2] then
        messageShow("��ػ������жϡ�" .. job.target2 .. "��û���ϣ��Ѿ��ȴ���6�Σ��û�ȥ��" .. job.target2 .. "��Ѱ���ˣ�", 'red')
        wait_times = 0
        DeleteTimer("tdh_wait")
        DeleteTriggerGroup("tdh_goback_find_npc2")
        create_trigger_t('tdh_goback_find_npc2_1', '^(> )*' .. job.target2 .. '(��\\D*���˹�����|��������첽���˹�����)', '', 'tdhBack')
        SetTriggerOption("tdh_goback_find_npc2_1", "group", "tdh_goback_find_npc2")
        EnableTriggerGroup("tdh_goback_find_npc2", true)
        return check_bei(tdhseback)
    end
end
function tdhseback()
    backtdh = backtdh + 1
    if backtdh > 2 then
        messageShow('��ػ����񣺻�ȥѰ������NPC��' .. job.target2 .. '������2�Σ����������')
        return check_bei(tdh_fangqi_go)
    end
    job.room, job.area = getAddr(job.where2)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() or backtdh > 2 then
        messageShow('��ػ���������ص㡾' .. job.where2 .. '�����ɵ�����������')
        return check_bei(tdh_fangqi_go)
    end
    exe('nick ��ػ���' .. job.where2)
    exe('set env_msg')
    messageShow('��ػ����񣺸���ͬ־�����ˣ�����ǰ����' .. job.where2 .. '����Ѱ�Ҹ���ͬ־��')
    return check_bei(tdh_find)
end
function tdh_finish()
    EnableTrigger("tdh_accept13", false)
    nobusy = 0
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT('��ػ�����������ɣ���ʱ:��' .. job.time.over .. '���롣')
    flag.find = 0
    backtdh = 0
    tdhround = 1
    wait_times = 1
    exe('unset env_msg')
    tdh_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    if score.party == "����Ľ��" and need_dzxy == "yes" and string.find(jiangnan_area, locl.area) and hp.pot > 20 and hp.food > 50 and hp.water > 50 then
        messageShow("�����أ���ػ�������ɣ���ǰ����" .. locl.area .. "����˳·����Ƿ�ȥĽ������ת���ƣ�")
        return check_halt(checkdzxy)
    end
    if job.time.over <= 100 then
        return check_halt(songxin)
    else
        return check_halt(check_food)
    end
end