------����
function songxin_trigger()
    DeleteTriggerGroup("songxin_find")
    DeleteTriggerGroup("songxin_ask")
    create_trigger_t('songxin_ask1', "^>*\\s*�������������", '', 'songxin_ask')
    create_trigger_t('songxin_ask2', "^>*\\s*����û������ˡ�$", '', 'songxin_nobody')
    SetTriggerOption("songxin_ask1", "group", "songxin_ask")
    SetTriggerOption("songxin_ask2", "group", "songxin_ask")
    EnableTriggerGroup("songxin_ask", false)
    DeleteTriggerGroup("songxin_accept")
    create_trigger_t('songxin_accept1', "^>*\\s*������\\D*˵������\\D*���㲻�Ǳ�������ӣ��˻��Ӻ�˵��", '', 'songxin_join')
    create_trigger_t('songxin_accept2', "^>*\\s*������\\D*˵������(����ȥ��Ϣһ��ɣ�|������ʱû�и��������)", '', 'songxin_busy')
    create_trigger_t('songxin_accept3', "^>*\\s*������\\D*˵��������Ȼ\\D*�����ˣ�Ҳ�Ͱ��ˡ�", '', 'songxin_fangqi_heal')
    create_trigger_t('songxin_accept4', "^>*\\s*������\\D*˵�������㲻���Ѿ��������ŵ������𣿻�����ȥ����", '', 'songxin_fangqi')
    create_trigger_t('songxin_accept5', "^>*\\s*������\\D*˵�����������������������񣬻���ȥ��Ϣһ��ɡ�", '', 'songxin_rest')
    create_trigger_t('songxin_accept6', "^>*\\s*�����ｻ����һ���ܺ���", '', 'songxin_xin')
    SetTriggerOption("songxin_accept1", "group", "songxin_accept")
    SetTriggerOption("songxin_accept2", "group", "songxin_accept")
    SetTriggerOption("songxin_accept3", "group", "songxin_accept")
    SetTriggerOption("songxin_accept4", "group", "songxin_accept")
    SetTriggerOption("songxin_accept5", "group", "songxin_accept")
    SetTriggerOption("songxin_accept6", "group", "songxin_accept")
    EnableTriggerGroup("songxin_accept", false)
    DeleteTriggerGroup("songxin_letter")
    create_trigger_t('songxin_letter1', "^>*\\s*��(\\D*) (\\D*)�� ������", '', 'songxin_consider')
    SetTriggerOption("songxin_letter1", "group", "songxin_letter")
    EnableTriggerGroup("songxin_letter", false)
    DeleteTriggerGroup("songxin_killer")
    create_trigger_t('songxin_killer1', "^>*\\s*����Լ�о�������Χ�˹�����", '', 'songxin_killer')
    create_trigger_t('songxin_killer2', "^>*\\s*(\\D*)˵������С�ӣ��Թ԰��ܺ��������ɣ�������", '', 'songxin_killer_1')
    create_trigger_t('songxin_killer3', "^>*\\s*��⣬�ֳ������˸��ˣ�", '', 'songxin_killer_2')
    create_trigger_t('songxin_killer4', "^>*\\s*(\\D*)˵������ʦ�֣�����Ӳ�úܣ��������㣡������", '', 'songxin_killer_3')
    SetTriggerOption("songxin_killer1", "group", "songxin_killer")
    SetTriggerOption("songxin_killer2", "group", "songxin_killer")
    SetTriggerOption("songxin_killer3", "group", "songxin_killer")
    SetTriggerOption("songxin_killer4", "group", "songxin_killer")
    EnableTriggerGroup("songxin_killer", false)
    DeleteTriggerGroup("songxin2_check")
    create_trigger_t('songxin2_check1', "(> )*\\D*����Ķ�������˵������Ͻ������͵���(\\D*)���ġ�(\\D*)�����ϡ�", '', 'songxin2_target')
    create_trigger_t('songxin2_check2', "(> )*\\D*����Ķ�������˵���������и��书�������(\\D*)�ļһ�Ҫ������", '', 'songxin2_level')
    SetTriggerOption("songxin2_check1", "group", "songxin2_check")
    SetTriggerOption("songxin2_check2", "group", "songxin2_check")
    EnableTriggerGroup("songxin2_check", false)
    DeleteTriggerGroup("songxin2_killer")
    create_trigger_t('songxin2_killer1', "^>*\\s*�㶨��һ����ԭ����(\\D*)�����Ҵ���\\D*���ƺ��õ���(\\D*)��(\\D*)��", '', 'songxin2_check')
    create_trigger_t('songxin2_killer2', "^(> )*���Ҳ���(����|����)����Ӱ�������Ϣ��", '', 'songxin2_refuse')
    create_trigger_t('songxin2_killer3', "^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)", '', 'songxin2_refuse')
    create_trigger_t('songxin2_killer4', "^(> )*���ﲻ׼ս����Ҳ��׼(����|����)��", '', 'songxin2_refuse')
    SetTriggerOption("songxin2_killer1", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer2", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer3", "group", "songxin2_killer")
    SetTriggerOption("songxin2_killer4", "group", "songxin2_killer")
    EnableTriggerGroup("songxin2_killer", false)
    create_trigger_t('letteryichang1', "^>*\\s*���������������һ���´������ã��ű�͵��!", '', 'sx2over')
    create_trigger_t('letteryichang2', "^>*\\s*�㿴�˿��ţ��������ǲ�ȥ�ˡ�", '', 'sx2overok')
    SetTriggerOption("letteryichang1", "group", "sx2refuse")
    SetTriggerOption("letteryichang2", "group", "sx2refuse")
    EnableTriggerGroup("sx2refuse", false)
end
function songxin_triggerDel()
    kezhiwugongclose()
    DeleteTriggerGroup("songxin_find_begin")
    DeleteTriggerGroup("songxin_find")
    DeleteTriggerGroup("songxin_ask")
    DeleteTriggerGroup("songxin_accept")
    DeleteTriggerGroup("songxin_letter")
    DeleteTriggerGroup("songxin_killer")
    DeleteTriggerGroup("songxin2_check")
    DeleteTriggerGroup("songxin2_killer")
    DeleteTriggerGroup("songxin_fight")
    DeleteTriggerGroup("sx2refuse")
    DeleteTriggerGroup("sx1lian")
    DeleteTriggerGroup("sx_fight")
    sx1wait = 0
    sx1zhen = 0
    sx1miao = 0
    sx1rou = 0
    sx1xian = 0
    sx1kuai = 0
    sx1man = 0
    sx1gang = 0
    sx1qi = 0
    sx2zhen = 0
    sx2miao = 0
    sx2rou = 0
    sx2xian = 0
    sx2kuai = 0
    sx2man = 0
    sx2gang = 0
    sx2qi = 0
end
job.list["songxin"] = "��������"
job.list["songxin2"] = "��������2"
function songxin()
    songxin_trigger()
    job.name = 'songxin'
    return check_busy(songxin_start)
end
jobFindAgain = jobFindAgain or { }
jobFindAgain["songxin"] = "songxinFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["songxin"] = "songxinFindFail"
jobFindAgain = jobFindAgain or { }
jobFindAgain["songxin2"] = "songxinFindAgain"
jobFindFail = jobFindFail or { }
jobFindFail["songxin2"] = "songxinFindFail"
function songxinFindAgain()
    EnableTriggerGroup("songxin_find", false)
    return go(songxin_find_go, dest.area, dest.room)
end
function songxinFindFail()
    EnableTriggerGroup("songxin_find", false)
    return go(songxin_fangqi, '�����', '��վ')
end
function songxin_start()
    flag.idle = nil
    if GetRoleConfig("CheckNeili_InAdvance") then 
        return go(sxaskjob, '�����', '��') 
    else 
        return go(job_songxin, '�����', '��վ') 
    end
end
function sxaskjob()
    return zhunbeineili(songxin_begin)
end
function songxin_begin()
    flag.idle = nil
    return go(job_songxin, '�����', '��վ')
end
function job_songxin()
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("songxin_ask", true)
    -- ain ��ֹ����Ǯ
    --  if score.goldlmt==nil
    --    score.goldlmt=28000
    --  end
    job.time.b = os.time()
    create_timer_s('songxin_checkask', 1.5, 'job_songxin_checkask')
    exe('ask zhu wanli about job')
end
function job_songxin_checkask()
    exe('ask zhu wanli about job')
end
function songxin_ask()
    DeleteTimer("songxin_checkask")
    EnableTriggerGroup("songxin_ask", false)
    EnableTriggerGroup("songxin_accept", true)
end
function songxin_nobody()
    EnableTriggerGroup("songxin_ask", false)
    songxin_start()
end
function songxin_join()
    EnableTriggerGroup("songxin_accept", false)
    check_halt(songxin_join_go)
end
function songxin_join_go()
    exe('w;s;e;e;n;n;n;e;s;askk fu about join')
    check_halt(songxin_huanggong_ask)
end
function songxin_huanggong_ask()
    exe('n;w;#3s;#4w;#3n;w;askk gao shengtai about ��ʹ�')
    check_halt(songxin_start)
end
function songxin_busy()
    EnableTriggerGroup("songxin_accept", false)
    if job.last == "wudang" then
        job.time.b = os.time()
        check_halt(job_songxin)
    else
        check_halt(songxin_busy_dazuo)
    end
end
function songxin_busy_dazuo()
    exe('w;w')
    prepare_lianxi(songxin_start)
end
function songxin_fangqi()
    exe('nick �����������')
    dis_all()
    flag.idle = nil
    EnableTriggerGroup("songxin_accept", false)
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Failure = job.statistics.Failure + 1
    job.statistics.Category["����"].Times = job.statistics.Category["����"].Times + 1
    job.statistics.Category["����"].Failure = job.statistics.Category["����"].Failure + 1
    job.statistics_Update()
    check_bei(songxin_fangqi_ask)
end
function songxin_fangqi_ask()
    EnableTriggerGroup("songxin_ask", true)
    exe('ask zhu wanli about ����')
end
function songxin_fangqi_heal()
    songxin_triggerDel()
    MissionPunishment.AlreadyGiveUp = true
    return check_halt(check_food)
end
function songxin_rest()
    EnableTriggerGroup("songxin_accept", false)
    if score.party == '��ɽ��' and hp.shen < 0 then
        return clb()
    end
    if job.zuhe["songmoya"] or job.zuhe["tdh"] then
        return huashan()
    end
    job.last = "songxin"
    return check_food()
end
function songxin_xin()
    job.time.b = os.time()
    -- messageShow('������������ʼ��')
    quest.name = "��������"
    quest.desc = ""
    quest.note = ""
    quest:update()
    EnableTriggerGroup("songxin_accept", false)
    EnableTriggerGroup("songxin_letter", true)
    job.last = "songxin"
    MissionPunishment.AlreadyGiveUp = false
    sxkiller1 = 0
    sxkiller2 = 0
    create_timer_s('songxin_checklookletter', 1.5, 'Execute_lookletter')
    Execute_lookletter()
end
function Execute_lookletter()
    if score.party == '��ɽ��' then
        exe('set po ��')
    end
    exe('look letter')
end
function songxin_consider(n, l, w)
    DeleteTimer("songxin_checklookletter")
    nobusy = 1
    EnableTriggerGroup("songxin_letter", false)
    EnableTrigger("songxin_killer1", true)
    job.where = tostring(w[1])
    job.target = tostring(w[2])
    if string.find(sxjob.cancel, job.target) then
        messageShow('������������Ŀ�꡾' .. job.target .. '�������ʹ���������', 'blue')
        return check_halt(songxin_fangqi)
    end
    if job.target == "�߷��ٱ�" and job.where == "�����ض�����" then
        messageShow('������������Ŀ�꡾�����ض�����Ϊ�����ʵĿɺޱ߷������ǲ������˸������ŵġ�', 'blue')
        return check_halt(songxin_fangqi)
    end

    exe('nick ����һ' .. job.where)
    songxin_find()
    --------------------
    -- job.area,job.room = locateroom(job.target)
    -- if not job.area then
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        messageShow('������������ص㡾' .. job.where .. '�����ɵ�����������', 'blue')
        return check_halt(songxin_fangqi)
    end
    -- end
    if Yiliaddr[job.where] and MidNight[locl.time] then
        messageShow('������������ص㡾' .. job.where .. '��ʱ�䲻�ԣ����������', 'blue')
        return check_halt(songxin_fangqi)
    end
    if Yiliaddr[job.where] then
        messageShow('������������Ŀ�꡾' .. job.target .. '����������ڣ�ֱ�͡�')
        return go(songxin_find_go, job.area, job.room)
    end
    if wait_kill == 'yes' then
        messageShow('������������Ŀ�꡾' .. job.target .. '������ʼǰ����' .. job.where .. '����')
        return check_bei(songxin_find_begin)
    end
    if job.area == "�䵱ɽ" or job.area == "�䵱��" then
        if job.where == "Ժ��" or job.where == "��ɽСԺ" then
            return go(sx1job_wait, job.area, "����")
        end
    end
    messageShow('������������Ŀ�꡾' .. job.target .. '������ʼǰ����' .. job.where .. '����')
    return go(songxin_find_go, job.area, job.room)
end
function songxin_find()
    DeleteTriggerGroup("songxin_find")
    create_trigger_t('songxin_find1', '^>*\\s*\\D*\\s*' .. job.target .. '\\((\\D*)\\)', '', 'songxin_send')
    create_trigger_t('songxin_find2', '^>*\\s*��Ҫ�͸�˭', '', 'songxin_goon')
    create_trigger_t('songxin_find3', '^>*\\s*\\D*����(����Ų��Ǹ��ҵģ�|�㿴�����)', '', 'songxin_add')
    create_trigger_t('songxin_find4', '^>*\\s*(����Ų����͸�����˵ġ�|������㣬���ǻ����𣿣�)', '', 'songxin_add')
    create_trigger_t('songxin_find5', '^>*\\s*�����һ�Ѷ�ͷ�ĺ����ӻ����ͳ��Ž���', '', 'songxin_finish')
    SetTriggerOption("songxin_find1", "group", "songxin_find")
    SetTriggerOption("songxin_find2", "group", "songxin_find")
    SetTriggerOption("songxin_find3", "group", "songxin_find")
    SetTriggerOption("songxin_find4", "group", "songxin_find")
    SetTriggerOption("songxin_find5", "group", "songxin_find")
    EnableTriggerGroup("songxin_find", false)
end
function songxin_find_begin()
    DeleteTriggerGroup("songxin_begin")
    create_trigger_t('songxin_begin1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'sx1job_wait')
    SetTriggerOption("songxin_begin1", "group", "songxin_begin")
    EnableTriggerGroup("songxin_begin", false)
    EnableTrigger("songxin_killer1", true)
    job.flag()
    flag.times = 1
    local tmppfm = GetVariable("pfmsanqing")
    -- ��Ĺ�ɺ�����ߴ������÷�ֹ����kezhiwugong.luaʶ���˵�npc��ʽ
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm')


    if string.find(sxjob.ide, job.target) then
        messageShow('������������Ŀ�꡾' .. job.target .. '����������ֱ�͡�')
        return go(songxin_find_go, job.area, job.room)
    else
        return go(songxin_find_npc, job.area, job.room)
    end
end
function songxin_find_npc()
    EnableTriggerGroup("songxin_begin", true)
    job.flag()
    exe('look')
    messageShow('�������񣺿�ʼѰ�ҡ�' .. job.target .. '����ȷ��λ�ã�')
    return find()
end
function songxin_find_go()
    EnableTriggerGroup("songxin_find", true)
    job.flag()
    exe('look')
    messageShow('�������񣺿�ʼѰ�ҡ�' .. dest.area .. dest.room .. '���ġ�' .. job.target .. '�����������ţ�')
    return find()
end
function songxin_send(n, l, w)
    EnableTrigger("songxin_find1", false)
    if flag.wait == 0 then
        flag.wait = 1
        sxjob.cnt = 1
        sxjob.id = string.lower(w[1])
        exe('hp;follow ' .. sxjob.id)
        -- checkBags()
        return checkNext(songxin_send_act)
        -- return check_halt(songxin_send_act)
    end
end
-- function songxin_check()
--     if Bag["�ż�"] then
--         return check_halt(songxin_send_act)
--     else
--         return check_heal()
--     end
-- end
function songxin_send_act()
    exe('halt;songxin ' .. sxjob.id)
    tmp.cnt = 0
    EnableTrigger("hp12", true)
    create_timer_s('songxin', 1, 'songxin_act_set')
end
function songxin_act_set()
    EnableTrigger("hp12", false)
    if tmp.cnt then
        tmp.cnt = tmp.cnt + 1
    end
    if not tmp.cnt or tmp.cnt > 20 then
        return check_heal()
    end
    exe('halt;songxin ' .. sxjob.id .. ' ' .. sxjob.cnt)
end
function songxin_add()
    sxjob.cnt = sxjob.cnt + 1
    exe('halt;songxin ' .. sxjob.id .. ' ' .. sxjob.cnt)
    tmp.cnt = 0
    EnableTrigger("hp12", true)
    create_timer_s('songxin', 1, 'songxin_act_set')
end
function songxin_goon()
    EnableTrigger("songxin_find1", true)
    flag.wait = 0
    DeleteTimer('songxin')
    return walk_wait()
    -- thread_resume(lookfor)
end
function songxin_finish()
    chats_locate('������������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����', 'red')
    dis_all()
    flag.find = 1
    flag.times = 1
    locate()
    sxjob.sx2 = 0
    exe('follow none')
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT('��������������ɣ���ʱ:��' .. job.time.over .. '����')
    if locl.area == '��֪������' then
        locl.area = job.area
        Note('�޷�ȷ����ǰ�ص㣬�趨��ǰ�ص�Ϊ����ص㡣')
    end
    EnableTrigger("hpheqi1", true)
    EnableTriggerGroup("sx2refuse", true)
    EnableTriggerGroup("songxin2_check", true)
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["����"].Times = job.statistics.Category["����"].Times + 1
    job.statistics.Category["����"].Success = job.statistics.Category["����"].Success + 1
    job.statistics_Update()
    return check_halt(songxin2_consider)
end
function songxin_killer()
    fight.time.b = os.time()
    sx1wait = 0
    flag.find = 1
    dis_all()
    EnableTrigger("hpheqi1", true)
    DeleteTriggerGroup("sx1lian")
    EnableTrigger("songxin_killer2", true)
end
function songxin_killer_1(n, l, w)
    EnableTrigger("songxin_killer2", false)
    EnableTrigger("songxin_killer3", true)
    sxjob.killer1 = tostring(w[1])
    sxjob.killer2 = '͵��ɱ��2'
    sxjob.letter = 0
    sxjob.id1 = 'killer1'
    sxjob.id2 = 'killer2'
    job.killer[sxjob.killer1] = true
    DeleteTriggerGroup("songxin_fight")
    create_trigger_t('songxin_fight1', '^>*\\s*\\D*' .. sxjob.killer1 .. '\\((\\D*)\\)', '', 'songxin_kill_1')
    create_trigger_t('songxin_fight2', '^>*\\s*(\\D*)��ž����һ�����ڵ���', '', 'songxin_kill_die')
    create_trigger_t('songxin_fight3', '^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��', '', 'songxin_kill_faint')
    create_trigger_t('songxin_fight4', '^  (\\D*)���ż�', '', 'songxin_letter')
    create_trigger_t('songxin_fight5', '^>*\\s*���빥��˭��', '', 'songxin_kill_over')
    create_trigger_t('songxin_fight6', '^>*\\s*��� "action" �趨Ϊ "check_letter" �ɹ���ɡ�', '', 'songxin_kill_check')
    create_trigger_t('songxin_fight7', '^(> )*(\\D*)�������ù���һ�㲻��ʮ�壬���ǻ������ģ�', '', 'songxin_kill_fail')
    SetTriggerOption("songxin_fight1", "group", "songxin_fight")
    SetTriggerOption("songxin_fight2", "group", "songxin_fight")
    SetTriggerOption("songxin_fight3", "group", "songxin_fight")
    SetTriggerOption("songxin_fight4", "group", "songxin_fight")
    SetTriggerOption("songxin_fight5", "group", "songxin_fight")
    SetTriggerOption("songxin_fight6", "group", "songxin_fight")
    SetTriggerOption("songxin_fight7", "group", "songxin_fight")
    exe('look')
    exe('set wimpy 100;yield no')
    kezhiwugong()
    -- messageShow('�������񣺿�ʼ���͵��ɱ��1��'..sxjob.killer1)
end
function songxin_letter(n, l, w)
    if tostring(w[1]) == 'һ' or tostring(w[1]) == '��' then
        sxjob.letter = 1
    end
end
function songxin_killer_2()
    EnableTrigger("songxin_killer3", false)
    EnableTrigger("songxin_killer4", true)
end
function songxin_killer_3(n, l, w)
    EnableTrigger("songxin_killer4", false)
    EnableTriggerGroup("songxin_fight", true)
    sxjob.killer2 = tostring(w[1])
    job.killer[sxjob.killer2] = true
    create_trigger_t('songxin_fight8', '^>*\\s*\\D*' .. sxjob.killer2 .. '\\((\\D*)\\)', '', 'songxin_kill_2')
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    exe('look')
    -- messageShow('�������񣺿�ʼ���͵��ɱ��2��'..sxjob.killer2)
end
function songxin_killer_31()
    EnableTrigger("songxin_killer4", false)
    EnableTriggerGroup("songxin_fight", true)
    create_trigger_t('songxin_fight8', '^>*\\s*\\D*' .. sxjob.killer2 .. '\\((\\D*)\\)', '', 'songxin_kill_2')
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    exe('look')
    -- messageShow('�������񣺿�ʼ���͵��ɱ��2��'..sxjob.killer2)
end
function songxin_kill_1(n, l, w)
    sxjob.id1 = string.lower(w[1])
    job.killer[sxjob.killer1] = sxjob.id1
    exe('kill ' .. sxjob.id1)
    exe("pfmgang")
    kezhiwugongAddTarget(sxjob.killer1, sxjob.id1)
    -- killPfm(sxjob.id1)
end
function songxin_kill_2(n, l, w)
    sxjob.id2 = string.lower(w[1])
    job.killer[sxjob.killer2] = sxjob.id2
    exe('kill ' .. sxjob.id2)
    kezhiwugongAddTarget(sxjob.killer2, sxjob.id2)
    -- killPfm(sxjob.id2)
end
function songxin_kill_21(n, l, w)
    EnableTrigger("songxin_look1", false)
    DeleteTriggerGroup("songxin_look")
    sxjob.id1 = string.lower(w[1])
    job.killer[sxjob.killer1] = sxjob.id1
    return songxin2_kill()
end
function songxin_kill_faint(n, l, w)
    if w[1] == sxjob.killer1 then
        exe('kill ' .. sxjob.id1)
    end
    if w[1] == sxjob.killer2 then
        exe('kill ' .. sxjob.id2)
    end
end
function songxin_kill_die(n, l, w)
    if w[1] == sxjob.killer1 then
        sxkiller1 = 1
        -- messageShow('�������񣺸㶨͵��ɱ��1��'..sxjob.killer1)
        kezhiwugongRemoveTarget(w[1])
        kezhiwugongkill(2)
        -- return songxinWaitKill2()
        wait.make( function()
            wait.time(2)
            exe('fight ' .. sxjob.id2)
        end )
    end
    if w[1] == sxjob.killer2 then
        sxkiller2 = 1
        -- messageShow('�������񣺸㶨͵��ɱ��2��'..sxjob.killer2)
        kezhiwugongRemoveTarget(w[2])
        kezhiwugongkill(1)
        -- return songxinWaitKill1()
        wait.make( function()
            wait.time(2)
            exe('fight ' .. sxjob.id1)
        end )
    end
end
function songxin_kill_over()
    if sxjob.killer2 == '͵��ɱ��2' then
        sxkiller2 = 1
    end
    if sxkiller1 == 1 and sxkiller2 == 1 then
        fight.time.e = os.time()
        fight.time.over = fight.time.e - fight.time.b
        messageShowT('��������ս����ʱ:��' .. fight.time.over .. '���롣')
        EnableTriggerGroup("songxin_killer", false)
        kezhiwugongclose()
        job.killer = { }
        return check_halt(songxin_kill_get)
    else
        messageShowT('��ôֻɱ��һֻ������һֻ�أ�')
        EnableTriggerGroup("songxin_killer", true)
        songxin_killer_31()
    end
end
function songxin_kill_get()
    for i = 1, 6 do
        exe('get letter from corpse ' .. i)
    end
    geta()
    exe('i;alias action check_letter')
    weapon_unwield()
end
function geta()
    local w_cmd = GetVariable("myweapon")
    local u_cmd = GetVariable("muweapon")
    if w_cmd ~= nil then
        exe('get ' .. w_cmd)
        exe('get ' .. w_cmd .. ' from corpse')
    end
    if u_cmd ~= nil then
        exe('get ' .. u_cmd)
        exe('get ' .. u_cmd .. ' from corpse')
    end
end
function songxin_kill_check()
    if locl.area == '��֪������' then
        locate()
        exe(locl.dir)
        Note('�޷�ȷ����ǰ�ص㣬����ƶ��ٶ�λ��')
        wait.make( function()
            wait.time(1)
            songxin_kill_check()
        end )
        return
    end
    EnableTriggerGroup("songxin_fight", false)
    if sxjob.letter == 1 then
        if locl.room == job.room and locl.area == job.area then
            return songxin_find_go()
        else
            return go(songxin_find_go, job.area, job.room)
        end
    else
        messageShow('���������Ų����ˣ�ȥ������', 'blue')
        return go(songxin_fangqi, '�����', '��վ')
    end
end
function songxin2_kill_check()
    if locl.area == '��֪������' then
        locate()
        exe(locl.dir)
        Note('�޷�ȷ����ǰ�ص㣬����ƶ��ٶ�λ��')
        wait.make( function()
            wait.time(1)
            songxin2_kill_check()
        end )
        return
    end
    if not job.room or not path_cal() then
        messageShow('������������ص㡾' .. job.where .. '�����ɵ�����������', 'blue')
        return go(songxin_fangqi, '�����', '��վ')
    end
    -- ain add no party no sx2
    if score.party and score.party == '��ͨ����' and(dest.area == '������' or dest.area == '��٢��ɽׯ' or dest.area == '����Ľ��') then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '������ʼȥ���ţ�')
        return songxin2_sendto()
    end
    if score.party and score.party == '����Ľ��' and(dest.area == '������' or dest.area == '��٢��ɽׯ' or dest.area == '����Ľ��') then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '������ʼȥ���ţ�')
        return songxin2_sendto()
    end
    if score.party and score.party == '������' and dest.area == '������' then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '������ʼȥ���ţ�')
        return songxin2_sendto()
    end
    if AddrIgnores[dest.area] then
        messageShow('��������2������ص㡾' .. job.where .. '��·̫Զ�ˣ�����ܾ���', 'blue')
        return go(songxin_fangqi, '�����', '��վ')
    end
    if inwdj == 0 and WdjIgnores[job.where] then
        messageShow('��������2������ص㡾' .. job.where .. '��·̫Զ�ˣ�����ܾ���', 'blue')
        return go(songxin_fangqi, '�����', '��վ')
    end
    return songxin2_sendto()
end
function songxin2_sendto()
    -- if mzAddr[job.where] then
    -- job.area='changan/ljzt'
    -- end
    EnableTriggerGroup("songxin_fight", false)
    if sxjob.letter == 1 then
        if locl.room == job.room and locl.area == job.area then
            print(locl.room, locl.area, job.room, job.area)
            return songxin_find_go()
        else
            return go(songxin_find_go, job.area, job.room)
        end
    else
        messageShow('���������Ų����ˣ�ȥ������', 'blue')
        return go(songxin_fangqi, '�����', '��վ')
    end
end
function songxin_kill_fail(n, l, w)
    if w[2] == sxjob.killer1 or w[2] == sxjob.killer2 then
        EnableTriggerGroup("songxin_fight", false)
        job.killer = { }
        checkBags()
        return check_halt(songxin_kill_letter)
    end
end
function songxin_kill_letter()
    if Bag["�ż�"] then
        return go(songxin_find_go, job.area, job.room)
    else
        return go(songxin_fangqi, '�����', '��վ')
    end
end
function songxin2_target(n, l, w)
    sxjob.sx2 = 1
    sxjob.killer1 = '͵��ɱ��1'
    sxjob.killer2 = '͵��ɱ��2'
    sxjob.letter = 0
    sxjob.id1 = 'killer1'
    sxjob.id2 = 'killer2'
    job.target = tostring(w[3])
    job.where = tostring(w[2])
    DeleteTrigger("songxin_find1")
    create_trigger_t('songxin_find1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'songxin_send')
    SetTriggerOption("songxin_find1", "group", "songxin_find")
    EnableTriggerGroup("songxin_find", false)
end
function songxin2_level(n, l, w)
    job.level = tostring(w[2])
end
function songxin2_consider()
    EnableTriggerGroup("songxin2_killer", true)
    -- if sxjob.sx2==0 then return Sx2toTdh() end
    -- do return songxin2_refuse() end
    if sxjob.sx2 == 0 then return sx2overok() end
    if not flag.sx2 and sxjob.sx2 == 1 then return songxin2_refuse() end
    if job.zuhe["hubiao"] and(not condition.hubiao or condition.hubiao == 0) then
        return sx2overok()
    end
    print('sx2ɱ�ֵȼ�:' .. sx2joblevel)
    if not string.find(sx2joblevel, job.level) and sxjob.sx2 == 1 then
        messageShow('��������2��ɱ�ֵȼ���' .. job.level .. '���򲻹�������ܾ���', 'white')
        return songxin2_refuse()
    end
    if Yiliaddr[job.where] and MidNight[locl.time] then
        messageShow('��������2������ص㡾' .. job.where .. '��ʱ�䲻��������ܾ���', 'white')
        return songxin2_refuse()
    end

    exe('nick ���Ŷ�' .. job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    job.name = 'songxin2'
    if not job.room or not path_cal() then
        messageShow('������������ص㡾' .. job.where .. '�����ɵ�����������', 'blue')
        return songxin2_refuse()
    end
    if inwdj == 0 and WdjIgnores[job.where] then
        messageShow('��������2������ص㡾' .. job.where .. '��·̫Զ�ˣ�����ܾ���', 'white')
        return go(songxin_fangqi, '�����', '��վ')
    end
    -- ain add no party no sx2
    if score.party and score.party == '��ͨ����' and(dest.area == '������' or dest.area == '��٢��ɽׯ' or dest.area == '����Ľ��') then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '����ԭ�صȴ�Killer��')
        return songxin2_wait()
    end
    if score.party and score.party == '����Ľ��' and(dest.area == '������' or dest.area == '��٢��ɽׯ' or dest.area == '����Ľ��') then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '����ԭ�صȴ�Killer��')
        return songxin2_wait()
    end
    if score.party and score.party == '������' and dest.area == '������' then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '����ԭ�صȴ�Killer��')
        return songxin2_wait()
    end
    if AddrIgnores[dest.area] then
        messageShow('��������2������ص㡾' .. job.where .. '��·̫Զ�ˣ�����ܾ���', 'white')
        return songxin2_refuse()
    end
    if not job.room or not path_cal() then
        messageShow('��������2������ص㡾' .. job.where .. '��û�ҵ�·��������ܾ���', 'blue')
        return songxin2_refuse()
    end
    if wait_kill == 'yes' then
        messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '����ԭ�صȴ�Killer��')
        return songxin2_wait()
    end
    messageShow('��������2������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '������ʼǰ����')
    return songxin2_find_begin()
end
function songxin2_find_begin()
    DeleteTriggerGroup("songxin_begin")
    create_trigger_t('songxin_begin1', '^>*\\s*\\D*' .. job.target .. '\\((\\D*)\\)', '', 'songxin2_wait')
    SetTriggerOption("songxin_begin1", "group", "songxin_begin")
    EnableTriggerGroup("songxin_begin", false)
    EnableTrigger("songxin2_killer1", true)
    job.flag()
    flag.times = 1
    local tmppfm = GetVariable("pfmsanqing")
    -- ��Ĺ�ɺ�����ߴ������÷�ֹ����kezhiwugong.luaʶ���˵�npc��ʽ
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm')

    if string.find(sxjob.ide, job.target) then
        messageShow('��������2������Ŀ�꡾' .. job.target .. '����������ֱ�͡�')
        return songxin2_sendto()
    else
        return go(songxin_find_npc, job.area, job.room)
    end
end
function sx2overok()
    nobusy = 0
    condition = { }
    exe('cond')
    songxin_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    return checkWait(sxCondconsider, 1)
end
function sxCondconsider()
    if condition.busy and condition.busy > 60 then
        return huashan()
    end
    return check_halt(check_food)
end
function Sx2toTdh()
    nobusy = 0
    songxin_triggerDel()
    if mydummy == true then
        return dummyfind()
    end
    if needdolost == 1 or job.name == 'songxin2' then
        return sx2overok()
    end
    return check_halt(huashan)
end
function songxin2_refuse()
    EnableTriggerGroup("sx2refuse", true)
    exe('no')
    sxjob.sx2 = 0
end
function sx2over()
    dis_all()
    fight.time.b = os.time()
    EnableTriggerGroup("sx2refuse", false)
    EnableTriggerGroup("songxin2_check", true)
    EnableTriggerGroup("songxin2_killer", true)
    messageShow('��������2��killer��ǰ�����������ˣ�ɱ���㣡')
    print('��������2��killer����ǰ���������ˣ�ɱ���㣡')
    print('sx2ɱ�ֵȼ�:' .. sx2joblevel)
    exe('nick ���Ŷ�' .. job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    job.name = 'songxin2'
    messageShow('������������Ŀ���ǡ�' .. job.where .. '���ġ�' .. job.target .. '����ɱ�ֵȼ�Ϊ��' .. job.level .. '����ԭ�صȴ�Killer��')
    return songxin2_wait()
end
function songxin2_wait()
    if flag.wait == 0 then
        flag.wait = 1
        EnableTriggerGroup("songxin_begin", false)
        DeleteTriggerGroup("songxin_begin")
    end
    EnableTriggerGroup("sx2refuse", false)
    EnableTriggerGroup("songxin2_check", false)
    EnableTriggerGroup("songxin2_killer", true)
    exe('set wimpy 100;yun qi;yun jing;yun jingli;dazuo ' .. hp.dazuo * 2)
end
function songxin2_check(n, l, w)
    fight.time.b = os.time()
    EnableTriggerGroup("songxin2_killer", false)
    sxjob.killer1 = tostring(w[1])
    sxjob.skills = tostring(w[3])
    job.killer[sxjob.killer1] = true
    if skillIgnores[sxjob.skills] then
        messageShow('��������ɱ��ʹ�õ��书�ǡ�' .. w[2] .. '���ġ�' .. sxjob.skills .. '���������У����������', 'blue')
        return songxin2_fangqi()
    else
        messageShow('��������ɱ��ʹ�õ��书�ǡ�' .. w[2] .. '���ġ�' .. sxjob.skills .. '������ʼ�����')
        -- pfmjineng()
        songxin2_look()
    end
end
function songxin2_fangqi()
    EnableTriggerGroup("songxin_fight", false)
    geta()
    dis_all()
    exe('set wimpycmd halt\\' .. locl.dir)
    return go(songxin_fangqi, '�����', '��վ')
end
faintFunc = faintFunc or { }
faintFunc["songxin"] = "songxin_fangqi_go"
faintFunc["songxin2"] = "songxin_fangqi_go"
function songxin_fangqi_go()
    dis_all()
    return go(songxin_fangqi, '�����', '��վ')
end
function songxin2_look()
    DeleteTriggerGroup("songxin_look")
    create_trigger_t('songxin_look1', '^>*\\s*\\D*' .. sxjob.killer1 .. '\\((\\D*)\\)', '', 'songxin_kill_21')
    SetTriggerOption("songxin_look1", "group", "songxin_look")
    exe('look')
end
function songxin2_kill()
    DeleteTriggerGroup("songxin_look")
    -- create_trigger_t('songxin_fight1',"^(��|��)װ���ţ�$",'','npcWeapon')
    create_trigger_t('songxin_fight2', '^>*\\s*(\\D*)��ž����һ�����ڵ���', '', 'songxin_kill_die')
    create_trigger_t('songxin_fight3', '^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��', '', 'songxin_kill_faint')
    create_trigger_t('songxin_fight4', '^  (\\D*)���ż�', '', 'songxin_letter')
    create_trigger_t('songxin_fight5', '^>*\\s*���빥��˭��', '', 'songxin_kill_over')
    create_trigger_t('songxin_fight6', '^>*\\s*��� "action" �趨Ϊ "check_letter" �ɹ���ɡ�', '', 'songxin2_kill_check')
    create_trigger_t('songxin_fight7', '^>*\\s*(\\D*)���������������', '', 'songxin2_fangqi')
    create_trigger_t('songxin_fight8', '^>*\\s*һ��ů�����Ե�������ȫ�����������ָֻ���֪������', '', 'songxin2_fangqi')
    create_trigger_t('songxin_fight9', '^>*\\s*��������˫Ŀû�б��������ˣ����ֿ��Կ�����������', '', 'songxin_kill_get')
    SetTriggerOption("songxin_fight1", "group", "songxin_fight")
    SetTriggerOption("songxin_fight2", "group", "songxin_fight")
    SetTriggerOption("songxin_fight3", "group", "songxin_fight")
    SetTriggerOption("songxin_fight4", "group", "songxin_fight")
    SetTriggerOption("songxin_fight5", "group", "songxin_fight")
    SetTriggerOption("songxin_fight6", "group", "songxin_fight")
    SetTriggerOption("songxin_fight7", "group", "songxin_fight")
    SetTriggerOption("songxin_fight8", "group", "songxin_fight")
    SetTriggerOption("songxin_fight9", "group", "songxin_fight")
    -- exe('look '..sxjob.id1)
    exe('kill ' .. sxjob.id1)
    -- killPfm(sxjob.id1)
    local tmppfm = GetVariable("pfmsanqing")
    -- ��Ĺ�ɺ�����ߴ������÷�ֹ����kezhiwugong.luaʶ���˵�npc��ʽ
    create_alias('kezhiwugongpfm', 'kezhiwugongpfm', 'alias pfmpfm ' .. tmppfm)
    -- exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('kezhiwugongpfm;set wimpy 100;set wimpycmd pfmpower\\pfmpfm\\hp;yield no')
    kezhiwugong()
    kezhiwugongAddTarget(sxjob.killer1, sxjob.id1)
end
 
-- ����1����
function sx1job_wait()
    if flag.wait == 0 then
        flag.wait = 1
        EnableTriggerGroup("songxin_begin", false)
        DeleteTriggerGroup("songxin_begin")
    end
    messageShow('�ҵ�����Ŀ�꡾' .. job.target .. '������ʼ�������ȴ�Killer��')
    DeleteTriggerGroup("sx1lian")
    -- ain dls nv id dazuo
    create_trigger_t('liangong1', "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)", '', 'sx1dazuo_desc')
    create_trigger_t('liangong2', "^(> )*(�����������޼��񹦣����۵���|�����󽣾�������������|����ϥ����������˻�����Ψ�Ҷ���|����������ͨ����Ƭ��֮��|�����������ϥ��������������|����ϥ���£�Ĭ����ħ��|������������������|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|�������廨�룬��ϥ���£�Ĭ�˿�����|�������������ù���һ����Ϣ��ʼ����������|��������ϥ������˫�ְ�����ǰ|���������죬�ų�һ�������Ϣ˳������������|����ϥ���£�˫�ֺ�ʮ����ͷ����Ǳ������|����Ϣ�������������������ִ�������֮��|����ϥ���£���Ŀ��ʲ��Ĭ�˿�������|����ϥ���£���Ŀ��ʲ������Ǭ��һ����|����ϥ���£�������������ͼ��ȡ���֮����|���������һ�����������۾���������Ů�ľ�|���������£�˫Ŀ΢�գ�˫���������������̫��|�����˵�������ڶ��������Ƴ����������������㻺��Ʈ��|����ϥ������˫�ִ�����ǰ�ɻ���״����������|����ϥ��������ʹ�����������³�|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|������һվ��˫�ֻ���̧������һ����|����ϥ������˫Ŀ���գ�������һ�������뵤��|��ϯ�ض������������죬���Ϻ��ʱ��ʱ��|�㰵���ټ�ʮ��ׯ�����۵���|�����������Ŀ�������ִ����������Ⱥ������������֮���䣬��Ȼ֮�������������Ҿ���)", '', 'sx1dazuobegin_desc')
    create_trigger_t('liangong3', "^(> )*���Ҳ���(����|����)����Ӱ�������Ϣ��", '', 'sx1songxin')
    create_trigger_t('liangong4', "^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)", '', 'sx1songxin')
    create_trigger_t('liangong5', "^(> )*���ﲻ׼ս����Ҳ��׼(����|����)��", '', 'sx1songxin')
    create_trigger_t('liangong6', "^(> )*����ɲ����������(����|����)�ĵط���", '', 'sx1nodazuo')
    create_trigger_t('liangong7', "^(> )*��������ϣ�����˫�ۣ�վ��������", '', 'sx1tuna')
    create_trigger_t('liangong8', "^(> )*��ľ�����Ϊ�Ѿ��ﵽ�����ڹ����ܿ��Ƶļ��ޡ�", '', 'sx1tunaover')
    SetTriggerOption("liangong1", "group", "sx1lian")
    SetTriggerOption("liangong2", "group", "sx1lian")
    SetTriggerOption("liangong3", "group", "sx1lian")
    SetTriggerOption("liangong4", "group", "sx1lian")
    SetTriggerOption("liangong5", "group", "sx1lian")
    SetTriggerOption("liangong6", "group", "sx1lian")
    SetTriggerOption("liangong7", "group", "sx1lian")
    SetTriggerOption("liangong8", "group", "sx1lian")
    EnableTriggerGroup("sx1lian", true)
    if perform.force and perform.force == "bihai-chaosheng" then
        exe('yun maze')
    end
    prepare_neili_stop()
    return check_busy(sxgodazuo)
end
sxgodazuo = function()
    if hp.exp > 10000000 then exe('unset ����') else exe('set ����') end
    exe('halt;yun jing;yun jingli;yun qi;dazuo ' .. hp.dazuo)
end
sx1tunaover = function()
    EnableTriggerGroup("sx1lian", false)
    exe('halt;yun jing;yun qi')
end
sx1dazuo_desc = function()
    if sx1wait < 20 then
        exe('yun qi;sxlian;dazuo ' .. hp.dazuo)
        return
    else
        print('������ɡ����ɻ��ˣ�')
        exe('yun qi')
        -- exe('yun qi;tuna '..hp.jingxue/2)
    end
end
sx1dazuobegin_desc = function()
    sx1wait = sx1wait + 1
end
sx1songxin = function()
    return songxin_find_go()
end
sx1nodazuo = function()
    exe('yun qi;yun jing;yun jingli;jiali max;halt')
end
sx1tuna = function()
    exe('yun jing;tuna ' .. hp.jingxue / 2)
end