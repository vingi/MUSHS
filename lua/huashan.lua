-------��ɽ
local huashanArea1 = {
    ["�˵�"] = "��ɽ��",
    ["�ӻ���"] = "��ɽ��",
    ["��"] = "��ɽ��",
    ["����"] = "��ɽ��",
    ["������"] = "��ɽ��",
    ["�����"] = "��ɽ��",
    ["��ʯ·"] = "��ɽ��",
    ["��̳��"] = "��ɽ��",
    ["������"] = "��ɽ",
    ["����"] = "��ɽ",
    ["�ٲ�"] = "��ɽ",
    ["������"] = "��ɽ",
    ["������"] = "��ɽ",
    ["�����"] = "��ɽ",
    ["ɯ��ƺ"] = "��ɽ",
    ["ǧ�ߴ�"] = "��ɽ",
    ["�ٳ�Ͽ"] = "��ɽ",
    ["���ƺ"] = "��ɽ",
    ["������"] = "��ɽ",
    ["������"] = "��ɽ",
    ["��Ů��"] = "��ɽ",
    ["��ȪԺ"] = "��ɽ",
    ["˼����"] = "��ɽ",
    ["ҩ��"] = "��ɽ",
    ["����"] = "��ɽ",
    ["ɽ��"] = "��ɽ",
    ["СϪ"] = "��ɽ",
    ["��̳"] = "��ɽ",
    ["˼���¶���"] = "��ɽ",
    ["ɽ·"] = "��ɽ",
    ["ʯ��"] = "��ɽ",
    ["����"] = "��ɽ",
    ["��ɽ����"] = "��ɽ",
    ["ɽ���ٲ�"] = "��ɽ",
    ["���䳡"] = "��ɽ",
    ["����"] = "��ɽ",
    ["�鷿"] = "��ɽ",
    ["����"] = "��ɽ",
    ["����"] = "��ɽ",
    ["ǰ��"] = "��ɽ",
    ["̨��"] = "��ɽ",
    ["������"] = "��ɽ",
    ["����"] = "��ɽ",
    ["��Ϣ��"] = "��ɽ",
    ["�Ͼ���"] = "��ɽ",
    ["Сɽ·"] = "��ɽ"
}

job.list["huashan"] = "��ɽ�Ͷ�����"

function huashan()
    hsjob2 = 0
    dis_all()
    huashan_trigger()
    job.name = "huashan"
    job.target = "����Ŀ��"
    return huashan_start()
end

jobFindAgain = jobFindAgain or {}
jobFindAgain["huashan"] = "huashanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["huashan"] = "huashanFindFail"

function huashanFindAgain()
    return go(find, dest.area, dest.room)
end

function huashanFindFail()
    return go(huashan_shibai, "��ɽ", "������")
end

function huashan_start()
    DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashan_find")
    flag.idle = nil
    return go(hsaskjob, "��ɽ", "������")
end

function hsaskjob()
    if newbie == 1 then
        return zhunbeineili(job_huashan)
    else
        return job_huashan()
    end
end

function job_huashan()
    EnableTriggerGroup("huashan_ask", true)
    exe("ask yue buqun about job")
end

function huashan_trigger()
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    create_trigger_t("huashan_ask1", "^(> )*��������Ⱥ�����йء�job������Ϣ��$", "", "huashan_ask")
    create_trigger_t("huashan_ask2", "^(> )*����û������ˡ�$", "", "huashan_nobody")
    SetTriggerOption("huashan_ask1", "group", "huashan_ask")
    SetTriggerOption("huashan_ask2", "group", "huashan_ask")
    EnableTriggerGroup("huashan_ask", false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t("huashan_accept1", "^(> )*����Ⱥ˵�������㲻�ܹ�˵ѽ������������ɼ����ҿ�����", "", "huashan_shibai")
    create_trigger_t("huashan_accept2", "^(> )*����Ⱥ˵��������������æ�������������أ�", "", "huashan_busy")
    create_trigger_t("huashan_accept3", "^(> )*����Ⱥ˵����������û����˵�ж���Ϊ������", "", "huashan_fangqi")
    create_trigger_t("huashan_accept4", "^(> )*����Ⱥ������һ�����ơ�$", "", "huashan_npc")
    create_trigger_t("huashan_accept5", "^(> )*����Ⱥ����˵�����㻹����ȥ˼�������˼��ȥ�ɡ�", "", "huashanjjQuest")
    create_trigger_t("huashan_accept6", "^(> )*����Ⱥ˵����������û����˵�ж���Ϊ�����գ����Լ�ȥ��ϰ�书ȥ�ɣ���", "", "huashan_fangqi")
    SetTriggerOption("huashan_accept1", "group", "huashan_accept")
    SetTriggerOption("huashan_accept2", "group", "huashan_accept")
    SetTriggerOption("huashan_accept3", "group", "huashan_accept")
    SetTriggerOption("huashan_accept4", "group", "huashan_accept")
    SetTriggerOption("huashan_accept5", "group", "huashan_accept")
    SetTriggerOption("huashan_accept6", "group", "huashan_accept")
    EnableTriggerGroup("huashan_accept", false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t("huashan_npc1", "^(> )*(�䲻��|ͻȻ|�͵�|��Ȼ|�䲻��)������\\D*������ƣ���(\\D*)(��|����)\\D*��ȥ��$", "", "huashan_where")
    create_trigger_t(
        "huashan_npc2",
        "^(> )*��һ��ץ����������ͼ�������ƣ��������������ݵö��˹�ȥ����˳�ֳ��������˵����֣�����ԭ�����������𽭺���(\\D*)��",
        "",
        "huashan_find"
    )
    create_trigger_t("huashan_npc3", '^(> )*��� "hsjob" �趨Ϊ "�й���" �ɹ���ɡ�', "", "huashan_npc_goon")
    SetTriggerOption("huashan_npc1", "group", "huashan_npc")
    SetTriggerOption("huashan_npc2", "group", "huashan_npc")
    SetTriggerOption("huashan_npc3", "group", "huashan_npc")
    EnableTriggerGroup("huashan_npc", false)
    DeleteTriggerGroup("huashanQuest")
    create_trigger_t("huashanQuest1", "^(> )*����Ⱥ˵������" .. score.name .. "��ɱ�˲��ٶ��ˣ�δ��ɱ�����ز�����˼���������ڰ�", "", "huashanDgjj")
    SetTriggerOption("huashanQuest1", "group", "huashanQuest")
    EnableTriggerGroup("huashanQuest", false)
    -- ��ʱ���ؿ���flood�����ִ�����
    local TempMsgHideTriggerList =
    {
        "^(> )*����Ⱥ˵����������.*���Ŭ�����պ������л����",
        "^(> )*����Ⱥ����.*���˵�ͷ��",
        "^(> )*����Ⱥ����.*���������ִ�Ĵָ�������ġ�",
        "^(> )*����ɺ˵�������һ�ɽ�ɲ�ϲ��ɱ��(.*)�´β�����˺��¶����ˡ���",
        "^$",
    }
	for i=1,#TempMsgHideTriggerList do
		Fun_AddTriggerHide("trigger_huashanJob_temp_hd_"..i, TempMsgHideTriggerList[i], "huashanJob_temp", "")
	end
    EnableGroup("huashanJob_temp", true)
end

function huashan_triggerDel()
    DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    DeleteTriggerGroup("huashan_accept")
    DeleteTriggerGroup("huashan_npc")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashanQuest")
    DeleteTriggerGroup("huashanJob_temp")
end

function huashan_ask()
    EnableTriggerGroup("huashan_ask", false)
    EnableTriggerGroup("huashan_accept", true)
end

function huashan_nobody()
    EnableTriggerGroup("huashan_ask", false)
    return huashan_start()
end

function huashan_shibai()
    EnableTriggerGroup("huashan_accept", false)
    kezhiwugongclose()
    return check_busy(huashan_shibai_b)
end

function huashan_shibai_b()
    flag.idle = nil
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    huashan_triggerDel()
    Execute("ask yue buqun about ʧ��")
    if job.where ~= nil and string.find(job.where, "���͵�") then
        mjlujingLog("���͵�")
    end
    messageShow("��ɽ��������ʧ�ܡ�")
    return check_halt(check_food)
end

function huashan_fangqi()
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    huashan_triggerDel()
    job.last = "huashan"
    hsjob2 = 0
    --if job.zuhe["wudang"] then
    --   job.last='wudang'
    --end
    return check_halt(check_food)
end

function huashan_busy()
    EnableTriggerGroup("huashan_accept", false)
    return check_bei(huashan_busy_dazuo)
end

function huashan_busy_dazuo()
    exe("#3s")
    return prepare_lianxi(check_heal)
end

function huashan_npc()
    exe("nick ��ɽ������")
    quest.name = "��ɽ������"
    quest:update()
    job.time.b = os.time()
    EnableTriggerGroup("huashan_accept", false)
    job.last = "huashan"
    if hsjob2 < 1 then
        messageShow("��ɽ���񣺿�ʼ����")
        return check_bei(huashan_npc_go)
    else
        return check_bei(huashan_npc_go2)
    end
end

function huashan_npc_go()
    go(huashan_npc_get, "��ɽ", "ɽ����", "huashan/zhengqi")
end

function huashan_npc_go2()
    go(huashan_npc_get, "��ɽ", "ɽ����", "huashan/jitan")
end

function huashan_npc_get()
    EnableTriggerGroup("huashan_npc", true)
    exe("unset wimpy;set wimpycmd pfmpfm\\hp")
    exe("s")
    return check_bei(huashan_npc_goon)
end

function huashan_npc_goon()
    quest.status = "�й���"
    quest:update()
    exe("n;e;e")
    locate()
    return check_busy(huashan_ssl, 1)
end

function huashan_ssl()
    if locl.room == "ʯ��" or locl.room == "��ȪԺ" then
        return check_bei(huashan_npc_ssl)
    else
        return check_bei(huashan_npc_goon)
    end
end

function huashan_npc_ssl()
    return exe("w;s;s;alias hsjob �й���")
end

function huashan_where(n, l, w)
    job.where = tostring(w[3])
    --print("1"..job.where)
end

function huashan_find(n, l, w)
    local flag_huashan = 0
    dis_all()
    job.target = tostring(w[2])
    job.killer = {}
    job.killer[job.target] = true
    quest.target = job.target
    quest:update()
    DeleteTriggerGroup("huashan_find")
    create_trigger_t("huashan_find1", "^( )*" .. job.target .. "\\((\\D*)\\)", "", "huashan_fight")
    create_trigger_t("huashan_find2", "^(> )*������(\\D*)��ɱ���㣡", "", "huashan_debug_fight")
    create_trigger_t("huashan_find3", "^(> )*�ɻ�����������㿴����֪����Щʲô���⡣", "", "huashan_dadao")
    SetTriggerOption("huashan_find1", "group", "huashan_find")
    SetTriggerOption("huashan_find2", "group", "huashan_find")
    SetTriggerOption("huashan_find3", "group", "huashan_find")
    if string.find(job.where, "ϴ���") or string.find(job.where, "���º�ȭ��") then
        messageShow("��ɽ����ڣ�����ص㡾" .. job.where .. "�����ɵ�����������")
        return check_halt(huashanFindFail)
    end
    --print("2"..job.where)
    if huashanArea1[job.where] then
        job.room = job.where
        job.area = huashanArea1[job.where]
    else
        job.room, job.area = getAddr(job.where)
    end
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        messageShow("��ɽ��������ص㡾" .. job.where .. "�����ɵ�����������", "Plum")
        return check_halt(huashanFindFail)
    end
    print(dest.room, dest.area, job.room, job.area)
    messageShow("��ɽ����׷ɱ���ܵ���" .. job.where .. "���ġ�" .. job.target .. "����")
    locl.room = "����"
    return go(huashanFindAct, job.area, job.room, "huashan/shulin")
end

function huashan_debug_fight()
    --dis_all()
    EnableTrigger("huashan_find1", true)
    exe("look")
end

function huashanFindAct()
    EnableTriggerGroup("huashan_find", true)
    job.flag()
    exe("look")
    find()
end

function huashanFindKill()
    dis_all()
    EnableTrigger("huashan_find1", true)
    exe("look")
end

function huashan_dadao()
    dis_all()
    exe("yes")
    return go(huashanFindAct, dest.area, dest.room)
end

function huashan_fight(n, l, w)
    EnableTrigger("huashan_find2", false)
    job.id = string.lower(w[2])
    exe("unset no_kill_ap;yield no")
    exe("follow " .. job.id)
    job.killer[job.target] = job.id
    exe("kill " .. job.id)
    exe("set wimpycmd pfmpfm\\hp")
    exe("pfmwu")
    exe("set wimpy 100")

    --kezhiwugong(job.target,job.id,'pfmpfm')
    dis_all()
    kezhiwugong()
    kezhiwugongAddTarget(job.target, job.id)
    fight.time.b = os.time()
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("huashan_fight")
    create_trigger_t("huashan_fight1", "^(> )*" .. job.target .. "��ž����һ�����ڵ���", "", "huashan_cut")
    create_trigger_t("huashan_fight2", "^(> )*" .. job.target .. "��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "huashan_faint")
    create_trigger_t("huashan_fight3", "^(> )*" .. job.target .. "�Ҵ��뿪��", "", "huashanFindFail")
    create_trigger_t("huashan_fight4", "^(> )*����û�� " .. job.id .. "��", "", "huashanFindAct")
    SetTriggerOption("huashan_fight1", "group", "huashan_fight")
    SetTriggerOption("huashan_fight2", "group", "huashan_fight")
    SetTriggerOption("huashan_fight3", "group", "huashan_fight")
    SetTriggerOption("huashan_fight4", "group", "huashan_fight")
end

function huashan_faint()
    exe("kill " .. job.id)
end

function huashan_cut()
    EnableTriggerGroup("huashan_fight", false)
    EnableTriggerGroup("huashan_find", false)
    DeleteTriggerGroup("huashan_cut")
    create_trigger_t("huashan_cut1", "^(> )*ֻ�����ǡ���һ�����㽫(\\D*)���׼�ն���������������С�", "", "huashan_cut_con")
    create_trigger_t("huashan_cut2", "^(> )*(���б���ɱ���˸��ﰡ|��������������޷�����|����ü����������߲���������ʬ���ͷ��)", "", "huashan_cut_weapon")
    SetTriggerOption("huashan_cut1", "group", "huashan_cut")
    SetTriggerOption("huashan_cut2", "group", "huashan_cut")
    -- ��մ����road.id(��ʱ����)
    -- ���������� opposite path
    road.id = nil
    job.killer = {}
    fight.time.e = os.time()
    fight.time.over = fight.time.e - fight.time.b
    messageShowT("��ɽ����ս����ʱ:��" .. fight.time.over .. "����,�㶨�����ˣ���" .. job.target .. "����")
    return check_halt(huashan_cut_act)
end

function huashan_cut_act()
    DeleteTimer("perform")
    weapon_unwield()
    weaponWieldCut()
    for i = 1, 5 do
        exe("halt;get ling pai from corpse " .. i)
        exe("qie corpse " .. i)
    end
end

function huashan_cut_weapon()
    return check_halt(huashan_cut_act, 1)
end

function huashan_cut_con(n, l, w)
    DeleteTriggerGroup("all_fight")
    kezhiwugongclose()
    exe("pfmset")
    flag.find = 1
    if job.target ~= tostring(w[2]) then
        exe("drop head")
        return check_halt(huashan_cut_act)
    else
        EnableTriggerGroup("huashan_cut", false)
        return go(huashan_yls, "��ɽ", "��̳")
    end
end

function huashan_yls()
    DeleteTriggerGroup("huashan_yls")
    create_trigger_t(
        "huashan_yls1",
        "^(> )*(����û������ˡ�|������û������������|���˺�������ɱ�İɣ�|���������|�㻹û��ȥ�Ҷ�������ô������̳�ˣ�)",
        "",
        "huashan_yls_fail"
    )
    create_trigger_t("huashan_yls2", "^(> )*����ɺ�����������д����һ�� (һ|��) �֡�", "", "huashan_yls_ask")
    create_trigger_t("huashan_yls3", "^(> )*���������������ưɣ�", "", "huashan_yls_lingpai")
    SetTriggerOption("huashan_yls1", "group", "huashan_yls")
    SetTriggerOption("huashan_yls2", "group", "huashan_yls")
    SetTriggerOption("huashan_yls3", "group", "huashan_yls")
    return exe("give head to yue lingshan;hp")
end

function huashan_yls_fail()
    EnableTriggerGroup("huashan_yls", false)
    if locl.room ~= "��̳" then
        return go(huashan_yls, "��ɽ", "��̳")
    end
    exe("out;w;s;se;su;su;s")
    return check_halt(huashan_shibai_b)
end

function huashan_yls_lingpai()
    EnableTriggerGroup("huashan_yls", false)
    exe("drop ling pai")
    return check_halt(huashan_yls)
end

function huashan_heal()
    exe("set no_kill_ap")
    return check_bei(huashan_neili)
end

function huashan_neili()
    hsjob2 = 1
    return zhunbeineili(huashan_npc)
end

function huashan_yls_lbcx()
    EnableTriggerGroup("huashan_yls_ask", true)
    weapon_unwield()
    return exe("drop head;askk yue lingshan about ��������")
end

function huashan_yls_ask(n, l, w)
    EnableTriggerGroup("huashan_yls", false)
    DeleteTriggerGroup("huashan_yls_ask")
    create_trigger_t("huashan_yls_ask1", "^(> )*��������ɺ�����йء��������ġ�����Ϣ��", "", "huashan_yls_back")
    SetTriggerOption("huashan_yls_ask1", "group", "huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask", false)
    if w[2] == "��" then
        return huashan_yls_back()
    end
    if w[2] == "һ" and dohs2 == 0 then
        return check_bei(huashan_yls_lbcx)
    else
        return check_bei(huashan_heal)
    end
end

function huashan_yls_back()
    EnableTriggerGroup("huashan_yls_ask", false)
    EnableTriggerGroup("huashanQuest", true)
    DeleteTriggerGroup("huashan_over")
    create_trigger_t("huashan_over1", "^(> )*�������Ⱥһ�����ơ�", "", "huashan_finish")
    create_trigger_t("huashan_over2", "^(> )*����û������ˡ�", "", "")
    SetTriggerOption("huashan_over1", "group", "huashan_over")
    SetTriggerOption("huashan_over2", "group", "huashan_over")
    -- return go(huashan_over, "��ɽ", "������", "huashan/jitan")
    return check_busy(huashan_ysl_after)
end

-- ------------------------------------
-- �� ����ɺ ������ ����Ⱥ path
-- ------------------------------------
function huashan_ysl_after()
    local backto_ybq = "out;w;s;se;su;su;s;give ling pai to yue buqun"
    exe(backto_ybq);
end

-- ------------------------------------
-- ��ɽ�������
-- ------------------------------------
function huashan_finish()
    weapon_unwield()
    EnableTriggerGroup("huashanQuest", true)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("��ɽ�������������ʱ:��" .. job.time.over .. "���롣")
    map.rooms["village/zhongxin"].ways["northwest"] = "village/caidi"
    map.rooms["village/zhongxin"].ways["northeast"] = "village/caidi"
    EnableTriggerGroup("huashan_over", false)
    EnableTriggerGroup("huashanQuest", true)
    flag.times = 1
    hsjob2 = 0
    exe("drop ling pai")
    --jobExpTongji()
    huashan_triggerDel()
    --if job.zuhe["wudang"] then
    --     job.last='wudang'
    --end
    setLocateRoomID = "huashan/zhengqi"
    return check_halt(check_food)
end

function huashanDgjj()
    if score.party and score.party == "��ɽ��" then
        messageShow("��ɽ���񣺳��������ʾ�ˣ�")
    end
    return huashan_finish()
end

function huashanjjQuest()
    EnableTriggerGroup("huashan_accept", false)
    if score.party and score.party == "��ɽ��" then
        messageShow("��ɽ������ʾҪ�����˼����ֹͣ����ɽ����")
        job.zuhe["huashan"] = nil
        return check_heal()
    else
        return huashan_finish()
    end
end
