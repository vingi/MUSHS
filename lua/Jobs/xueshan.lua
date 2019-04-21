--ѩɽ
local XsIgnores = {
    ["�䵱ɽԺ��"] = true,
    ["�䵱ɽ��ɽСԺ"] = true,
    ["�䵱ɽС��"] = true
    --["�䵱��ɽ�һ����"]=true,
    --["�䵱��ɽ��Ҷ����"]=true,
    --["�䵱��ɽ��Ҷ����"]=true,
    --["�䵱��ɽ��ѩ����"]=true,
}
local XsBugRoom = {
    ["������ɼ��"] = "mjMen_check",
    ["�䵱ɽС��"] = "wdYm",
    ["�䵱ɽԺ��"] = "wdYm",
    ["�䵱ɽ��ɽСԺ"] = "wdYm",
    ["�䵱��ɽ�һ����"] = "outWdclCheck",
    ["�䵱��ɽ��Ҷ����"] = "outWdclCheck",
    ["�䵱��ɽ��Ҷ����"] = "outWdclCheck",
    ["�䵱��ɽ��ѩ����"] = "outWdclCheck",
    ["��������"] = "mjSloutCheck",
    ["��ѩɽ�вƴ󳵵�"] = "xsdcd_check",
    ["��ѩɽ����"] = "xsdcd_check"
}
function xueshan_triggerClose()
    EnableTriggerGroup("xueshan_debug", false)
    EnableTriggerGroup("xueshan_find", false)
    EnableTriggerGroup("xueshan_ask", false)
    EnableTriggerGroup("xueshan_accept", false)
    EnableTriggerGroup("xueshan_kill", false)
    EnableTriggerGroup("xueshan_guard", false)
    EnableTriggerGroup("xueshan_judge", false)
    EnableTriggerGroup("xueshan_f_ask", false)
    EnableTriggerGroup("xueshan_finish", false)
    EnableTriggerGroup("xueshan_fight", false)
    EnableTriggerGroup("xueshan_sa", false)
    EnableTriggerGroup("xueshan_safind", false)
    EnableTriggerGroup("xsbusydz", false)
    EnableTriggerGroup("xueshan_gderror", false)
end

function xueshan_trigger()
    DeleteTriggerGroup("xueshan_find")
    DeleteTriggerGroup("xueshan_ask")
    create_trigger_t("xueshan_ask1", "^(> )*�������´������㣬�ٺ���Ц��������", "", "job_xueshan")
    create_trigger_t("xueshan_ask2", "^(> )*����������й�", "", "xueshan_ask")
    create_trigger_t("xueshan_ask3", "^(> )*����û������ˡ�$", "", "xueshan_nobody")
    SetTriggerOption("xueshan_ask1", "group", "xueshan_ask")
    SetTriggerOption("xueshan_ask2", "group", "xueshan_ask")
    SetTriggerOption("xueshan_ask3", "group", "xueshan_ask")
    EnableTriggerGroup("xueshan_ask", false)
    DeleteTriggerGroup("xueshan_accept")
    create_trigger_t("xueshan_accept1", "^(> )*����˵��������ô�򵥵���������ô���Է����أ���ȥ�ɣ���", "", "xueshan_shibai")
    create_trigger_t("xueshan_accept2", "^(> )*����˵��������������ǱȽ����ѣ����겻��Ҳ����ȫ���㡣��", "", "xueshan_fangqi_heal")
    create_trigger_t("xueshan_accept3", "^(> )*����˵�������Ҳ��ǽ���", "", "xueshan_finish")
    create_trigger_t("xueshan_accept4", "^(> )*����˵�����������Ǹ����ı�Ǯ����ͬ־���㻹����ЪϢһ����ɡ���", "", "xueshan_busy")
    create_trigger_t("xueshan_accept5", "^(> )*����˵��������Ҫ����������үү����һ�ߴ���ȥ����", "", "xueshan_rest")
    create_trigger_t("xueshan_accept7", "^(> )*����˵��������(������û����|�ú÷�ʡ)", "", "xueshan_busy")
    create_trigger_t("xueshan_accept8", "^(> )*����˵���������У��е�רҵ����ò��ã�", "", "xueshan_shibai")
    create_trigger_t("xueshan_accept9", "^(> )*����ʼ�����Ƿ�Ҫɱ���㡣", "", "xueshan_busy")
    create_trigger_t("xueshan_accept10", "^(> )*����˵�������ҿ��㲻���ĺ�������үү�Ҳ�ϲ������", "", "xueshan_xieqi")
    create_trigger_t("xueshan_accept6", "^(> )*��������Ķ�������˵������˵���(\\D*)�������˸�Ư����С椣���ȥ����Ū����", "", "xueshan_consider")
    SetTriggerOption("xueshan_accept1", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept2", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept3", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept4", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept5", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept6", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept7", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept8", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept9", "group", "xueshan_accept")
    SetTriggerOption("xueshan_accept10", "group", "xueshan_accept")
    EnableTriggerGroup("xueshan_accept", false)
    DeleteTriggerGroup("xueshan_kill")
    create_trigger_t("xueshan_kill1", "^(> )*�����(\\D*)(�ٺ�һЦ|˵��|�ͺ�|���|���|�ȵ�|����һ��)", "", "xueshan_kill_who")
    create_trigger_t("xueshan_kill2", "^(> )*(\\D*)˵���������컯��Ҳ�����٣���", "", "xueshan_kill_judge")
    create_trigger_t("xueshan_kill3", "^(> )*����û������ˡ�", "", "xueshan_kill_nobody")
    create_trigger_t("xueshan_kill4", "^(> )*���ﲻ׼ս����", "", "xueshan_kill_nofight")
    create_trigger_t("xueshan_kill5", "^(> )*����Ҫ����������ͻȻ�������˽���һ��", "", "xueshan_kill_nofight")
    SetTriggerOption("xueshan_kill1", "group", "xueshan_kill")
    SetTriggerOption("xueshan_kill2", "group", "xueshan_kill")
    SetTriggerOption("xueshan_kill3", "group", "xueshan_kill")
    SetTriggerOption("xueshan_kill4", "group", "xueshan_kill")
    SetTriggerOption("xueshan_kill5", "group", "xueshan_kill")
    EnableTriggerGroup("xueshan_kill", false)
    DeleteTriggerGroup("xueshan_guard")
    create_trigger_t(
        "xueshan_guard1",
        "^(> )*(����|����|����|����|����|��ԭ|����|����|�ӱ�|����)(��ͷ|����|��ͷ|��Ժ|����) (\\D*)\\((\\D*)\\)",
        "",
        "xueshan_guard_check"
    )
    --create_trigger_t('xueshan_guard2',"^(> )*��λ�����ƺ�����(\\D*)��",'','xueshan_judge_party')
    create_trigger_t("xueshan_guard3", "^����ΰ���̫�ã�����������ر�Ӿ��������ģ���˵�������Ǵ��ڸ����أ�", "", "xueshan_judge_super")
    --create_trigger_t('xueshan_guard6',"^  ��(���|����|����|һ������|�ֵ�|��)\\(",'','xueshan_judge_weapon')
    create_trigger_t("xueshan_guard5", "^(> )*��Ҫ��ʲô��", "", "xueshan_kill_nobody")
    --create_trigger_t('xueshan_guard4',"^(��|��)װ���ţ�$",'','npcWeapon')
    SetTriggerOption("xueshan_guard1", "group", "xueshan_guard")
    --SetTriggerOption("xueshan_guard2","group","xueshan_guard")
    SetTriggerOption("xueshan_guard3", "group", "xueshan_guard")
    --SetTriggerOption("xueshan_guard4","group","xueshan_guard")
    SetTriggerOption("xueshan_guard5", "group", "xueshan_guard")
    --SetTriggerOption("xueshan_guard6","group","xueshan_guard")
    EnableTriggerGroup("xueshan_guard", false)
    DeleteTriggerGroup("xueshan_f_ask")
    create_trigger_t("xueshan_f_ask1", "^(> )*����������й�", "", "xueshan_f_ask")
    create_trigger_t("xueshan_f_ask2", "^(> )*����û������ˡ�$", "", "xueshan_f_nobody")
    SetTriggerOption("xueshan_f_ask1", "group", "xueshan_f_ask")
    SetTriggerOption("xueshan_f_ask2", "group", "xueshan_f_ask")
    EnableTriggerGroup("xueshan_f_ask", false)
    DeleteTriggerGroup("xueshan_finish")
    create_trigger_t("xueshan_finish1", "^(> )*����˵���������������������������", "", "xueshan_over")
    create_trigger_t("xueshan_finish2", "^(> )*����˵��������ʲô��˼����", "", "xueshan_over")
    create_trigger_t("xueshan_finish3", "^(> )*����˵��������С��û��ɣ����뵽����үү", "", "xueshan_fangqi")
    SetTriggerOption("xueshan_finish1", "group", "xueshan_finish")
    SetTriggerOption("xueshan_finish2", "group", "xueshan_finish")
    SetTriggerOption("xueshan_finish3", "group", "xueshan_finish")
    EnableTriggerGroup("xueshan_finish", false)
    DeleteTriggerGroup("xueshan_fight")
    create_trigger_t("xueshan_fight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "xueshan_sa")
    create_trigger_t("xueshan_fight2", "^(> )*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "xueshan_faint")
    --create_trigger_t('xueshan_fight3',"^(> )*(\\D*)(������Ц��˵��|˫��һ����Ц��˵��|ʤ�����У����Ծ��|���һ�ݣ�˵��|���һ�ݣ�������Ҿ|������˼�����˵��|��ɫ΢�䣬˵������������)",'','xueshan_fight_over')
    SetTriggerOption("xueshan_fight1", "group", "xueshan_fight")
    SetTriggerOption("xueshan_fight2", "group", "xueshan_fight")
    SetTriggerOption("xueshan_fight3", "group", "xueshan_fight")
    EnableTriggerGroup("xueshan_fight", false)
    DeleteTriggerGroup("xueshan_sa")
    create_trigger_t("xueshan_sa1", "^(> )*��ٺ���Ц�˼���", "", "xueshan_finish")
    create_trigger_t("xueshan_sa2", "^(> )*��Ҫ��˭��", "", "xueshan_finish_error")
    create_trigger_t("xueshan_sa3", "^(> )*hmm�����ƺ�������BUG��", "", "xueshansa_look")
    SetTriggerOption("xueshan_sa1", "group", "xueshan_sa")
    SetTriggerOption("xueshan_sa2", "group", "xueshan_sa")
    SetTriggerOption("xueshan_sa3", "group", "xueshan_sa")
    EnableTriggerGroup("xueshan_sa", false)
    DeleteTriggerGroup("xueshan_debug")
    create_trigger_t("xueshan_debug1", "^(> )*�������һ���������", "", "xs_guard_check")
    SetTriggerOption("xueshan_debug1", "group", "xueshan_debug")
    EnableTriggerGroup("xueshan_debug", true)
end
function xueshan_triggerDel()
    DeleteTriggerGroup("xueshan_debug")
    DeleteTriggerGroup("xueshan_find")
    DeleteTriggerGroup("xueshan_ask")
    DeleteTriggerGroup("xueshan_accept")
    DeleteTriggerGroup("xueshan_kill")
    DeleteTriggerGroup("xueshan_guard")
    DeleteTriggerGroup("xueshan_judge")
    DeleteTriggerGroup("xueshan_f_ask")
    DeleteTriggerGroup("xueshan_finish")
    DeleteTriggerGroup("xueshan_fight")
    DeleteTriggerGroup("xueshan_sa")
    DeleteTriggerGroup("xueshan_safind")
    DeleteTriggerGroup("xsbusydz")
    DeleteTriggerGroup("xueshan_gderror")
end
job.list["xueshan"] = "ѩɽ����Ů"
function xueshan()
    if hp.shen >= 0 then
        return turnShen("-")
    end
    xueshan_trigger()
    job.name = "xueshan"
    job.flag()
    flag.xueshan = 1
    job.target = "����Ŀ��"
    return xueshan_start()
end
function xueshan_xieqi()
    return go(xieqiwan, "�����", "ҩ��")
end
function xieqiwan()
    exe("buy xieqi wan;fu xieqi wan")
    return check_busy(xueshan)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["xueshan"] = "xueshanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["xueshan"] = "xueshanFindFail"
function xueshanFindAgain()
    if tmp.kill then
        EnableTrigger("xueshan_safind1", true)
        return go(xueshan_find_saact, job.area, job.room)
    else
        EnableTriggerGroup("xueshan_find", false)
        return go(xueshan_find_act, dest.area, dest.room)
    end
end
function xueshanFindFail()
    EnableTriggerGroup("xueshan_find", false)
    return check_halt(xueshan_find_fangqi)
end
function xueshan_start()
    EnableTimer("walkWait4", false)
    DeleteTriggerGroup("xsbusydz")
    return go(xsaskjob, "��ѩɽ", "���Ŀ�")
end
function xsaskjob()
    if newbie == 1 then
        return zhunbeineili(job_xueshan)
    else
        return job_xueshan()
    end
end
function job_xueshan_ti()
    exe("ask bao xiang about job") --------------ѩɽask job ����
end
function job_xueshan()
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("xueshan_ask", true)
    exe("nick ѩɽ����Ů������")
    flag.idle = nil
    create_timer_s("girlbusy", 0.9, "job_xueshan_ti") ----------����ѩɽask job ��ʱ��
end
function xueshan_ask()
    EnableTriggerGroup("xueshan_ask", false)
    EnableTriggerGroup("xueshan_accept", true)
    EnableTimer("girlbusy", false) ------------�ر�ѩɽask job ��ʱ��
end
function xueshan_nobody()
    EnableTimer("girlbusy", false) ------------�ر�ѩɽask job ��ʱ��
    EnableTriggerGroup("xueshan_ask", false)
    return xueshan_start()
end
function xueshan_busy()
    EnableTimer("girlbusy", false) ------------�ر�ѩɽask job ��ʱ��
    EnableTriggerGroup("xueshan_accept", false)
    prepare_neili_stop()
    condition = {}
    exe("cond")
    return check_busy(xueshan_busy_dazuo)
end
function xueshan_busy_dazuo()
    EnableTimer("girlbusy", false) ------------�ر�ѩɽask job ��ʱ��
    if not condition.busy or condition.busy == 0 then
        if score.party == "��ɽ��" or job.last == "huashan" then
            DeleteTriggerGroup("xsbusydz")
            create_trigger_t(
                "xsbusydz1",
                "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
                "",
                "xueshan_start"
            )
            SetTriggerOption("xsbusydz1", "group", "xsbusydz")
            return exe("yun jing;yun jingli;yun qi;dazuo " .. hp.dazuo)
        else
            xueshan_triggerDel()
            return huashan()
        end
    end
    return prepare_lianxi(xueshan_start)
end
faintFunc = faintFunc or {}
faintFunc["xueshan"] = "xueshan_fangqi_go"
function xueshan_fangqi_go()
    return go(xueshan_fangqi, "��ѩɽ", "���Ŀ�")
end
function xueshan_fangqi()
    EnableTimer("xsfinishti", false) -------------�ر�ѩɽ�������ʱ��
    nobusy = 0
    exe("nick ѩɽ�������;unset no_kill_ap")
    xueshan_triggerClose()
    flag.idle = nil
    EnableTriggerGroup("xueshan_finish", false)
    EnableTriggerGroup("xueshan_accept", false)
    return check_halt(xueshan_fangqi_ask)
end
function xueshan_fangqi_ask()
    EnableTimer("killti", false) -------------�ر�ѩɽkill��ʱ��
    EnableTimer("xsfinishti", false) -------------�ر�ѩɽ�������ʱ��
    EnableTriggerGroup("xueshan_ask", true)
    messageShow("ѩɽ�����������!", "blue")
    exe("ask bao xiang about ����")
end
function xueshan_find_fangqi()
    return go(xueshan_shibai_ask, "��ѩɽ", "���Ŀ�")
end
function xueshan_shibai()
    EnableTimer("killti", false) -------------�ر�ѩɽkill��ʱ��
    EnableTriggerGroup("xueshan_accept", false)
    return check_halt(xueshan_shibai_ask)
end
function xueshan_shibai_ask()
    EnableTriggerGroup("xueshan_ask", true)
    EnableTimer("lookti", false) -------------�ر�ѩɽ����Ů��ʱ��
    exe("ask bao xiang about ʧ��")
    if job.where ~= nil and string.find(job.where, "���͵�") then
        mjlujingLog("���͵�")
    end
end
function xueshan_fangqi_heal()
    EnableTriggerGroup("xueshan_accept", false)
    job.last = "xueshan"
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["ѩɽ"].Times = job.statistics.Category["ѩɽ"].Times + 1
    job.statistics.Category["ѩɽ"].Failure = job.statistics.Category["ѩɽ"].Failure + 1
    job.statistics_Update()
    return check_food()
end
function xueshan_rest()
    EnableTriggerGroup("xueshan_accept", false)
    job.last = "xueshan"
    return check_food()
end
function xueshan_finish()
    gdcname = "��֪��"
    guard_id = 0
    EnableTriggerGroup("xueshan_accept", false)
    EnableTriggerGroup("xueshan_sa", false)
    for i = 1, 3 do
    end
    flag.times = 1
    --���ص��Ƿ�ȥ������ �հ� sx����ж�
    if
        score.party == "����Ľ��" and need_dzxy == "yes" and string.find(jiangnan_area, locl.area) and hp.pot > 0 and
            hp.food > 50 and
            hp.water > 50
     then
        messageShow("�����أ�����������ɣ���ǰ����" .. locl.area .. "����˳·����Ƿ�ȥĽ������ת���ƣ�")
        return check_halt(checkdzxy)
    end
    checkBags()
    return go(xueshan_finish_ask, "��ѩɽ", "���Ŀ�")
end
function xueshan_finish_error()
    gdcname = "��֪��"
    guard_id = 0
    messageShow("ѩɽ����Beauty�����ˣ����������", "blue")
    EnableTriggerGroup("xueshan_sa", false)
    return xueshan_fangqi_go()
end
function xueshan_finish_ask()
    EnableTriggerGroup("xueshan_accept", false)
    EnableTriggerGroup("xueshan_f_ask", true)
    check_halt(xueshan_finish_ask1)
end
function xueshan_finish_ask_ti()
    exe("ask bao xiang about finish;unset no_kill_ap")
end
function xueshan_finish_ask1()
    create_timer_s("xsfinishti", 0.9, "xueshan_finish_ask_ti") -----------------����ѩɽ�������ʱ��
end
function xueshan_f_ask()
    EnableTriggerGroup("xueshan_f_ask", false)
    EnableTriggerGroup("xueshan_finish", true)
end
function xueshan_f_nobody()
    EnableTriggerGroup("xueshan_f_ask", false)
    xueshan_finish()
end
function xueshan_over()
    EnableTimer("xsfinishti", false) -------------�ر�ѩɽ�������ʱ��
    job.name = "idle"
    nobusy = 0
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    EnableTriggerGroup("xueshan_finish", false)
    xueshan_triggerDel()
    --print('ѩɽjob��ɣ����food...')
    -- ִ������������1
    job.statistics_JobTimePlus()
    job.statistics.Success = job.statistics.Success + 1
    job.statistics.Category["ѩɽ"].Times = job.statistics.Category["ѩɽ"].Times + 1
    job.statistics.Category["ѩɽ"].Success = job.statistics.Category["ѩɽ"].Success + 1
    job.statistics_Update()
    messageShowT("ѩɽ����������ɣ���ʱ:��" .. job.time.over .. "���롣")
    setLocateRoomID = "xueshan/shanlu4"
    --check_halt(check_food)--���Թر�ѩɽ�����check��
    button_smyteam()
     --check_heal()���Ų����������
    button_lostletter()
     --check_heal()���Ų����������
    checkPrepareOver()
 --��check��ֱ��over��
end
function xsgosongxin()
    songxin_trigger()
    return songxin_start()
end
function xueshan_consider(n, l, w)
    nobusy = 1
    job.time.b = os.time()
    --messageShow('ѩɽ��������ʼ��')
    EnableTriggerGroup("xueshan_accept", false)
    EnableTriggerGroup("xsbusydz", false)
    DeleteTriggerGroup("xsbusydz")
    job.where = tostring(w[2])
    if XsIgnores[job.where] then
        messageShow("ѩɽ��������ص㡾" .. job.where .. "�����׳������������", "blue")
        return check_halt(xueshan_fangqi)
    end
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    job.last = "xueshan"
    if not job.room or not path_cal() then
        messageShow("ѩɽ��������ص㡾" .. job.where .. "�����ɵ�����������", "blue")
        return check_halt(xueshan_fangqi)
    end
    if job.area == "����" and (job.room == "��ɼ��" or string.find(job.room, "����")) then
        job.room = "���䳡"
    end
    if string.find(job.where, "��ɽʯ��") then
        job.where = "��ɽɽ��"
    end

    --if job.area=="����" and string.find(job.room,"����") then
    --	job.room="��ɼ��"
    --end
    exe("nick ��Ů��" .. job.where)
    xueshan_find()

    messageShow("ѩɽ���񣺿�ʼǰ����" .. job.where .. "����Ѱ����Ů��")
end
function xueshan_find()
    DeleteTriggerGroup("xueshan_find")
    create_trigger_t("xueshan_find1", "^\\s*\\D*(���|����|С��|����|����|����)\\(Beauty\\)", "", "xueshan_look")
    create_trigger_t("xueshan_find2", "^(> )*��Ҫ��ʲô��", "", "xueshan_goon")
    create_trigger_t("xueshan_find3", "^��������Ѫ������Ҫ��(\\D*)\\(\\D*\\)ǿ������Ů��", "", "xueshan_add")
    create_trigger_t("xueshan_find4", "^(> )*����û�� beauty", "", "xueshan_goon")
    create_trigger_t("xueshan_find5", "^(> )*���������\\D*һ���ж���", "", "xueshan_guard")
    create_trigger_t("xueshan_find6", "^(> )*���Ѿ��������ˡ�", "", "xueshan_guard")
    SetTriggerOption("xueshan_find1", "group", "xueshan_find")
    SetTriggerOption("xueshan_find2", "group", "xueshan_find")
    SetTriggerOption("xueshan_find3", "group", "xueshan_find")
    SetTriggerOption("xueshan_find4", "group", "xueshan_find")
    SetTriggerOption("xueshan_find5", "group", "xueshan_find")
    SetTriggerOption("xueshan_find6", "group", "xueshan_find")
    EnableTriggerGroup("xueshan_find", false)
    flag.times = 1
    flag.wait = 0
    local tmppfm = GetVariable("pfmsanqing") --��Ĺ�ɺ�����ߴ������÷�ֹ����kezhiwugong.luaʶ���˵�npc��ʽ
    create_alias("kezhiwugongpfm", "kezhiwugongpfm", "alias pfmpfm " .. tmppfm)
    --exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
    exe("kezhiwugongpfm;set wimpy 100;set wimpycmd pfmpfm\\hp;yield no")
    check_halt(xueshan_find_go)
end
function xueshan_find_go()
    --EnableTrigger("xueshan_find1",true)
    --exe('jifa all')
    go(xueshan_find_act, job.area, job.room, "xueshan/shanlu4")
end
function xueshan_find_act()
    EnableTriggerGroup("xueshan_find", true)
    job.flag()
    exe("look")
    messageShow("ѩɽ���񣺿�ʼѰ�ҡ�" .. dest.area .. dest.room .. "������Ů��")
    return find()
end
function xueshan_look_ti() ----------------����ѩɽ����Ů����
    exe("look beauty")
end
function xueshan_look()
    print("flag.wait=" .. flag.wait)
    if flag.wait == 0 then
        flag.wait = 1
        job.cnt = 1
        exe("hp;look beauty")
        create_timer_s("lookti", 0.9, "xueshan_look_ti") -------------����ѩɽ����Ů��ʱ��
    end
end
function xueshan_add(n, l, w)
    if w[1] == score.name then
        exe("follow beauty " .. job.cnt)
        EnableTimer("lookti", false) -------------�ر�ѩɽ����Ů��ʱ��
    else
        job.cnt = job.cnt + 1
        exe("look beauty " .. job.cnt)
        create_timer_s("lookti", 0.9, "xueshan_look_ti") --------------����ѩɽ����Ů��ʱ��
    end
end
function xueshan_goon()
    EnableTrigger("xueshan_find1", true)
    flag.wait = 0
    flag.find = 0
    job.cnt = 0
    print(locl.area .. "|locl|" .. locl.room)
    if XsBugRoom[locl.area .. locl.room] then
        print("run " .. XsBugRoom[locl.area .. locl.room])
        return _G[XsBugRoom[locl.area .. locl.room]]()
    else
        return walk_wait()
    end
end
function xueshan_fight()
    if tmp.kill then
        return
    end
    EnableTriggerGroup("xueshan_find", false)
    EnableTriggerGroup("xueshan_kill", true)
    job.guard = job.guard or {}
    exe("jifa all;unset wimpy;set wimpycmd pfmpfm\\hp")
    messageShow("ѩɽ���񣺿�ʼFight���ڡ�" .. job.target .. "����")
    for i = 1, 3 do
        exe("fight guard " .. i)
    end
    exe("alias action fight")
end
function xueshan_fight_unaccept(n, l, w)
    job.guard[w[2]] = nil
end

function xueshan_fight_judge()
    EnableTriggerGroup("xueshan_kill", false)
    if countTab(job.guard) == 1 then
        EnableTriggerGroup("xueshan_fight", true)
        for p in pairs(job.guard) do
            job.target = p
            create_timer_s("xsfight", 3, "xueshan_fight")
        end
    else
        return check_halt(xueshan_kill, 1)
    end
end
function xueshan_fight_over(n, l, w)
    if w[2] == job.target or w[2] == "��" then
        DeleteTimer("xsfight")
        -- ain
        return check_bei(xueshan_fight, 1)
    end
end
function xueshan_kill_ti()
    exe("kill " .. guard_id)
end

function xueshan_kill_act()
    EnableTimer("lookti", false) -------------�ر�ѩɽ����Ů��ʱ��
    create_timer_s("killti", 0.9, "xueshan_kill_ti") -------------����ѩɽkillʱ��
    exe("kill " .. guard_id)
end
function xueshan_kill()
    EnableTimer("lookti", false) -------------�ر�ѩɽ����Ů��ʱ��
    fight.time.b = os.time()
    EnableTriggerGroup("xueshan_find", false)
    EnableTriggerGroup("xueshan_kill", true)
    EnableTriggerGroup("xueshan_fight", true)

    job.guard = {}
    exe("kill " .. guard_id)
    create_timer_s("killti", 0.9, "xueshan_kill_ti") -------------����ѩɽkillʱ��
    kezhiwugong()
    kezhiwugongAddTarget(gdcname, guard_id)
    print(gdcname .. guard_id)
end
function xueshan_kill_error()
    EnableTriggerGroup("xueshan_gderror", false)
    DeleteTriggerGroup("xueshan_gderror")
    EnableTriggerGroup("xueshan_kill", false)
    EnableTriggerGroup("xueshan_find", true)
    job.party = nil
    guard_id = nil
    gdcname = nil
    flag.wait = 0
    flag.find = 0
    return walk_wait()
end
function xueshan_kill_who(n, l, w)
    EnableTimer("killti", false) -------------�ر�ѩɽkill��ʱ��
    job.guard[w[2]] = true
end
function xueshan_kill_judge(n, l, w)
    for i = 1, countTab(job.guard) do
        if job.guard[w[2]] and w[2] ~= "������ʿ" and w[2] ~= "������ʿ" and w[2] ~= "������ʿ" then
            job.target = w[2]
            xueshan_triggerClose()
            EnableTriggerGroup("xueshan_debug", true)
            EnableTriggerGroup("xueshan_kill", false)
            EnableTriggerGroup("xueshan_fight", true)
            EnableTrigger("hpheqi1", true)
            break
        end
    end
end
function xueshan_kill_nobody()
    EnableTriggerGroup("xueshan_guard", false)
    EnableTriggerGroup("xueshan_judge", false)
    EnableTriggerGroup("xueshan_find", false)
    EnableTriggerGroup("xueshan_kill", false)
    if flag.xueshan > 1 then
        return check_halt(xueshan_fangqi_go)
    else
        flag.xueshan = flag.xueshan + 1
        if tmp.kill then
            return xueshan_sa_act()
        else
            return check_halt(xueshan_find_go)
        end
    end
end
function xueshan_kill_nofight()
    wait.make(
        function()
            wait.time(3)
            exe("askk " .. guard_id .. " about fight")
            return check_busy(xueshan_judge, 2)
        end
    )
end
function xueshan_faint(n, l, w)
    if w[2] == job.target then
        tmp.kill = true
        DeleteTimer("xsfight")
        --messageShow('ѩɽ���񣺿�ʼ������ڡ�'..job.target..'����')
        exe("kill " .. guard_id)
    end
end
function xueshan_sa(n, l, w)
    EnableTimer("killti", false) -------------�ر�ѩɽkill��ʱ��
    fight.time.e = os.time()
    fight.time.over = fight.time.e - fight.time.b
    if job.target == w[2] then
        tmp.kill = true
        EnableTriggerGroup("xueshan_fight", false)
        messageShowT("ѩɽ���񣺸㶨���ڡ�" .. job.target .. "����ս����ʱ:��" .. fight.time.over .. "���롣")

        geta()
        --exe('pfmset')
        -- ain
        DeleteTriggerGroup("xueshan_safind")
        create_trigger_t("xueshan_safind1", "^\\s*\\D*(���|����|С��|����|����|����)\\(Beauty\\)", "", "xueshansa_look")
        create_trigger_t("xueshan_safind2", "^(> )*��Ҫ��ʲô��", "", "xueshansa_goon")
        create_trigger_t("xueshan_safind3", "^��������Ѫ������Ҫ��(\\D*)\\(\\D*\\)ǿ������Ů��", "", "xueshansa_add")
        create_trigger_t("xueshan_safind4", "^(> )*����û�� beauty", "", "xueshansa_goon")
        SetTriggerOption("xueshan_safind1", "group", "xueshan_safind")
        SetTriggerOption("xueshan_safind2", "group", "xueshan_safind")
        SetTriggerOption("xueshan_safind3", "group", "xueshan_safind")
        SetTriggerOption("xueshan_safind4", "group", "xueshan_safind")
        EnableTriggerGroup("xueshan_safind", true)
        flag.times = 1
        return check_halt(xueshansa_look)
    end
end
function xueshansa_look()
    EnableTimer("killti", false) -------------�ر�ѩɽkill��ʱ��
    EnableTriggerGroup("xueshan_safind", true)
    EnableTrigger("xueshan_safind1", false)
    flag.wait = 1
    job.cnt = 1
    exe("hp;look beauty")
end
function xueshansa_add(n, l, w)
    if w[1] == score.name then
        return xueshan_sa_act()
    else
        job.cnt = job.cnt + 1
        exe("look beauty " .. job.cnt)
    end
end
function xueshansa_goon()
    EnableTrigger("xueshan_safind1", true)
    flag.wait = 0
    flag.find = 0
    return go(xueshan_find_saact, job.area, job.room)
end
function xueshan_find_saact()
    EnableTriggerGroup("xueshan_safind", true)
    job.flag()
    exe("look")
    messageShow("ѩɽ���񣺿�ʼѰ�ҡ�" .. dest.area .. dest.room .. "������Ů��")
    return find()
end
function xueshan_sa_act()
    EnableTriggerGroup("xueshan_safind", false)
    EnableTriggerGroup("xueshan_sa", true)
    exe("sa beauty " .. job.cnt)
end
function xueshan_guard()
    EnableTimer("lookti", false)
    create_timer_s("killti", 0.9, "xueshan_kill_ti") -------------����ѩɽkillʱ��
    EnableTrigger("xueshan_find1", false)
    EnableTriggerGroup("xueshan_find", false)
    EnableTriggerGroup("xueshan_guard", true)
    flag.wait = 1
    flag.find = 1
    --thread_resume(lookfor)
    --locate()
    exe("look guard " .. job.cnt)
    job.weapon = "unarmed"
end
function xueshan_guard_check(n, l, w)
    guard_id = string.lower(w[5])
    gdcname = w[4]
    --xueshan_guard_look()
    --exe('compare '.. guard_id)
    xueshan_judge()
end
function xs_guard_check()
    --xueshan_guard_look()
    --exe('compare '.. guard_id)
    xueshan_judge()
end
function xueshan_guard_look()
    DeleteTriggerGroup("xueshan_judge")
    create_trigger_t("xueshan_judge1", "^(> )*����ϸ����ǰ������" .. gdcname .. "һ����", "", "xueshan_judge")
    create_trigger_t("xueshan_judge2", "^(> )*" .. guard_id .. " ��������$", "", "xueshan_kill_nobody")
    SetTriggerOption("xueshan_judge1", "group", "xueshan_judge")
    SetTriggerOption("xueshan_judge2", "group", "xueshan_judge")
    EnableTriggerGroup("xueshan_judge", true)
end
function xueshan_judge_party(n, l, w)
    job.party = w[2]
end
function xueshan_judge_super()
    tmp.super = true
    exe("set wimpycmd pfmpower\\pfmpfm\\hp")
end
function xueshan_judge_weapon(n, l, w)
    if w[1] == "���" then
        job.weapon = "stick"
    elseif w[1] == "����" then
        job.weapon = "sword"
    elseif w[1] == "�ֵ�" then
        job.weapon = "blade"
    elseif w[1] == "����" then
        job.weapon = "whip"
    elseif w[1] == "��" then
        job.weapon = "xiao"
    elseif w[1] == "һ������" then
        job.weapon = "dagger"
    else
        job.weapon = "unarmed"
    end
end
function xueshan_judge()
    xueshan_triggerClose()
    DeleteTriggerGroup("xueshan_gderror")
    create_trigger_t("xueshan_gderror1", "^(> )*" .. gdcname .. "˵���������Ӱ�����", "", "xueshan_kill_error")
    SetTriggerOption("xueshan_gderror1", "group", "xueshan_gderror")
    EnableTriggerGroup("xueshan_gderror", true)
    EnableTrigger("hpheqi1", true)
    exe("unset no_kill_ap")
    job.skill = "��"
    --messageShow('ѩɽ���񣺱������ԡ�'..job.party..'����')

    if tmp.super then
        messageShow("ѩɽ�����������ڸ��֡�")
    end
    job.guard = {}
    --return check_busy(waitcd)
    return xueshan_kill()
end
function waitcd()
    mytime = os.time()
    if not wait_cd or mytime > wait_cd + 8 then
        return check_busy(xueshan_kill)
    else
        wait.make(
            function()
                wait.time(1)
                exe("alias acton �ȴ�������ȴ��")
                return waitcd()
            end
        )
    end
end
