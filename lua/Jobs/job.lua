job = {}
job.statistics = {
    PreviousExp = 0,
    StartTime = os.time()
}
fight = {}
gdcname = "��֪��"
guard_id = 0
job.time = {}
job.time.b = os.time()
job.time.e = os.time()
job.time.over = os.time()
job.time["refresh"] = 94
fight.time = {}
fight.time.b = os.time()
fight.time.e = os.time()
fight.time.over = os.time()
fight.time["refresh"] = 94
job.name = nil
job.prepare = test
job.target = "����Ŀ��"
job.exp = 0
job.pot = 0
sx1wait = 0
job.guard = {}
job.party = "δ���"
job.zuhe = {}
job.killer = {}
job.list = {}
job.group = {}
job.group.times = nil
sxjob = {}
sxjob.ide =
    "�����|������|������|������ؤ|������ؤ|���°���|�嶾�̵���|��������|֪�͵���|��ľ�����|��������|��ˮ�����|���������|�һ������|������|�ͷ|ֵ�ڱ�|��һ��|��Ѳ��|����ʹ��|��ѩ��|������|���°���|����|����|������"
sxjob.cancel = ""
sxjob.skillslist = ""
sxjob.killer1 = "ɱ��һ"
sxjob.killer1 = "ɱ�ֶ�"
sxjob.skills = "XXXXX"
sxjob.sx2 = 0
gaibangCancel =
    "����|����|�����|��ӯӯ|ѦĽ��|������|������|�ź���|��Х��|����|����ʦ̫|½����|����̩|������|�ź���|��Х��|����|��Ħ��|��Ҥ����|����|������|���ĵ�|�����|������|ժ����|ƮȻ��|��Ȼ��|ʨ����|����|���ƹ�|������"
sldsmCancel =
    "����|����|�����|��ӯӯ|ѦĽ��|������|������|�ź���|��Х��|����|����ʦ̫|½����|����̩|�����|�ź���|��Х��|������|ִ�ڱ�|������|������|������|������|���ĵ�|�����|����|��Ħ��|��Ҥ����|����|������|�����|������|ժ����|ƮȻ��|��Ȼ��|ʨ����|����|���ƹ�|������"
wudangcancel = ""
sx2joblevel = "΢�����|������|С������|�ڻ��ͨ|��Ϊ�˵�|��������"
jiangnan_area = "��ɽ��|���ݳ�|���ݳ�|���˳�|÷ׯ|����Ľ��|������|��٢��ɽׯ|������|��������|���ݳ�|ţ�Ҵ�|����ׯ"
zhongyuan_area =
    "�置|���ְ�|�ɶ���|���ݳ�|�����|����ɽ|����ʹ�|��������|����ɽ|�����|����ɽ|��������|�ƺ�����|����|��ɽ|������|��ɽ|��ɽ����|�������|�������|����Ƕ�|̩ɽ|����ɽ|������|��ɽ��|�䵱ɽ|������|������|��ѩɽ|��ԭ|�ɶ�����|����Ǳ�|������"
cjn_area = "�����ϰ�|���Ϲٵ�"
job.level = "XXXXX"
wudangjobok = 0
mytime = 0
allzhen = 0
allmiao = 0
allrou = 0
allxian = 0
allkuai = 0
allman = 0
allgang = 0
allqi = 0
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
sxkiller1 = 0
sxkiller2 = 0
wudangCk = 0
backtdh = 0
tdhround = 1
roundtdh = 1
yptteam = 0
smydie = 0
nobusy = 0
hqpd = 0
damage = 0
loseTj = {}
loseTj.succ = 0
loseTj.fail = 0
wait_times = 1
tdh_npc1_to_npc2_all_path = ""
tdh_npc1_room_id = ""
wait_kill = "no"
setpo = "set po ��"
yptjob = {}
yptjob.fengzhao = false
yptjob.name1 = ""
yptjob.name2 = ""
yptsetpo = {
    ["���޵�"] = "set po ��",
    ["���浶"] = "set po ��",
    ["�ȱ���"] = "set po ��",
    ["���浶"] = "set po ��",
    ["Ѫ����"] = "set po ��",
    ["���浶"] = "set po ��",
    ["�����ǵ�"] = "set po ��",
    ["���鵶��"] = "set po ��",
    ["��Ҷ����"] = "set po ��",
    ["ȼľ����"] = "set po ��",
    ["���е���"] = "set po ��",
    ["Ľ�ݵ���"] = "set po ��",
    ["�廢���ŵ�"] = "set po ��",
    ["�������ϵ�"] = "set po ��",
    ["�һ�"] = "set po ��",
    ["��ħ��"] = "set po ��",
    ["��Ħ��"] = "set po ��",
    ["���齣��"] = "set po ��",
    ["Ľ�ݽ���"] = "set po ��",
    ["��а����"] = "set po ��",
    ["̫������"] = "set po ��",
    ["���߽���"] = "set po ��",
    ["���ǽ���"] = "set po ��",
    ["���｣��"] = "set po ��",
    ["�μҽ���"] = "set po ��",
    ["ȫ�潣��"] = "set po ��",
    ["��ɽ����"] = "set po ��",
    ["��ɽ����"] = "set po ��",
    ["��������"] = "set po ��",
    ["��ҽ���"] = "set po ��",
    ["��������"] = "set po ��",
    ["���¾Ž�"] = "set po ��",
    ["Ѹ��ʮ����"] = "set po ��",
    ["�ط������"] = "set po ��",
    ["��Ů���Ľ�"] = "set po ��",
    ["���츫"] = "set po ��",
    ["ʥ���"] = "set po ��",
    ["�����ʷ�"] = "set po ��",
    ["����ذ��"] = "set po ��",
    ["�̸���ḫ"] = "set po ��",
    ["��ս�����"] = "set po ��",
    ["��ɽ׷�깳"] = "set po ��",
    ["��ָ��ͨ"] = "set po ��",
    ["��ɳ��Ӱ"] = "set po ��",
    ["���컨��"] = "set po ��",
    ["������"] = "set po ��",
    ["�ط��"] = "set po ��",
    ["������"] = "set po ��",
    ["�Ⱥ���"] = "set po ��",
    ["���߱޷�"] = "set po ��",
    ["���±޷�"] = "set po ��",
    ["��������"] = "set po ��",
    ["����������"] = "set po ��",
    ["Τ����"] = "set po ǹ",
    ["��ħ��"] = "set po ǹ",
    ["�޳���"] = "set po ǹ",
    ["�ն���"] = "set po ǹ",
    ["Τ�Թ�"] = "set po ǹ",
    ["�������"] = "set po ǹ",
    ["�򹷰���"] = "set po ǹ",
    ["��ɽ�ȷ�"] = "set po ǹ",
    ["���ϴ�����"] = "set po ǹ"
}

WdjIgnores = {
    ["�置�߷�"] = true,
    ["�置����"] = true,
    ["�置����"] = true,
    ["�置ǰ��"] = true,
    ["�置������"] = true,
    ["�置������"] = true,
    ["�置����"] = true,
    ["�置ɽ��"] = true,
    ["�置ɽ��"] = true
}
AddrIgnores = {
    ["������"] = true,
    ["����Ľ��"] = true,
    ["�һ���"] = true,
    ["������"] = true,
    ["��٢��ɽׯ"] = true,
    ["��ľ��"] = true
}
Yiliaddr = {
    ["����ǿ�ջ"] = true,
    ["����ǿ�ջ��¥"] = true,
    ["���������"] = true,
    ["���������"] = true,
    ["����ǳ�����"] = true,
    ["����ǰ�����Ժ"] = true
}

tongji = {}

skillIgnores = {}

skillsjineng1 = {
    ["�������צ"] = true,
    ["���־�ʽ"] = true,
    ["��������"] = true,
    ["��צ��"] = true,
    ["����ذ��"] = true,
    ["��ָ��ͨ"] = true,
    ["���츫"] = true,
    ["��צ������"] = true,
    ["������"] = true,
    ["�����׹�צ"] = true
}

skillsjineng2 = {
    ["Ѫ����"] = true,
    ["�κ�ָ"] = true,
    ["��Ůȭ��"] = true,
    ["���¾Ž�"] = true,
    ["Τ����"] = true,
    ["�黨ָ"] = true,
    ["���߱޷�"] = true,
    ["���｣��"] = true,
    ["����������"] = true,
    ["�����Ʒ�"] = true,
    ["���鵶��"] = true,
    ["��ɽ�ȷ�"] = true,
    ["��ҽ���"] = true,
    ["�������ϵ�"] = true
}

skillsjineng3 = {
    ["��Ȼ������"] = true,
    ["��Ԫ��"] = true,
    ["���ص���"] = true,
    ["��������"] = true,
    ["�������"] = true,
    ["������"] = true,
    ["�����ʷ�"] = true,
    ["̫������"] = true,
    ["�������צ"] = true,
    ["������"] = true,
    ["������"] = true,
    ["����������"] = true,
    ["�����Ʒ�"] = true
}

skillsjineng4 = {
    ["������"] = true,
    ["Ѹ��ʮ����"] = true,
    ["���浶"] = true,
    ["��Ӱ������"] = true,
    ["����ɨҶ��"] = true,
    ["�μҽ���"] = true,
    ["��Ҷ����"] = true,
    ["��ɽ׷�깳"] = true,
    ["��ɽ����"] = true
}

skillsjineng5 = {
    -- ["��������"] = true,
    ["��ʯ����ȭ"] = true,
    ["����ȭ"] = true,
    ["ȼľ����"] = true,
    ["�̸���ḫ"] = true,
    ["����ʮ����"] = true
}

skillsjineng6 = {
    ["�ط������"] = true,
    ["��Ů���Ľ�"] = true,
    ["ɢ����"] = true,
    ["��������"] = true,
    ["������Ѩ��"] = true,
    ["�Ⱥ���"] = true,
    ["̫��ȭ"] = true
}

skillsjineng7 = {
    ["��ս�����"] = true,
    ["���е���"] = true,
    ["Ľ�ݵ���"] = true,
    ["ȫ�潣��"] = true,
    ["��ɽ����"] = true,
    ["�����ȷ�"] = true,
    ["������"] = true,
    ["����ȭ"] = true,
    ["һָ��"] = true,
    ["һ��ָ"] = true,
    ["��ɽ����"] = true,
    ["��������"] = true,
    ["�廢���ŵ�"] = true
}

skillsjineng8 = {
    ["���ڴ���ӡ"] = true,
    ["������"] = true,
    ["�����ǵ�"] = true,
    ["���컨��"] = true,
    ["���±޷�"] = true,
    ["����ǧҶ��"] = true,
    ["��Ӣ����"] = true,
    ["��������"] = true,
    ["ǧ������"] = true,
    ["�򹷰���"] = true
}

skillsjineng9 = {
    ["Ľ�ݽ���"] = true
}

skillsjineng10 = {
    ["ʥ���"] = true
}

skillsjineng11 = {
    ["��а����"] = true,
    ["����ȭ"] = true,
    ["��������"] = true
}

dangerousNpc = {
    ["��Ȯ"] = true,
    ["����"] = true,
    ["�蹷"] = true,
    ["ͷ��"] = true,
    ["Ұ��"] = true,
    ["����"] = true,
    ["����"] = true,
    ["�ϻ�"] = true,
    ["���"] = true,
    ["�˻���"] = true,
    ["��Ҷ��"] = true,
    ["÷����"] = true,
    ["ѩ��"] = true,
    ["Ұ��"] = true,
    ["����"] = true,
    ["����"] = true,
    ["����"] = true,
    ["��Ȯ"] = true,
    ["���"] = true,
    ["�۳彫��"] = true,
    ["ƽ�ܽ���"] = true,
    ["��������"] = true,
    ["���ｫ��"] = true,
    ["��������"] = true,
    ["������"] = true,
    ["��ɫ����"] = true,
    ["���������"] = true,
    ["��ľ�����"] = true,
    ["��������"] = true,
    ["�һ������"] = true,
    ["��ˮ�����"] = true,
    ["���°���"] = true,
    ["���°���"] = true
}

prepare_trigger = function()
    DeleteTriggerGroup("prepare_neili")
    -- ain dls nv id dazuo
    create_trigger_t(
        "prepare_neili1",
        "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
        "",
        "prepare_neili_b"
    )
    create_trigger_t(
        "prepare_neili2",
        "^(> )*(�����������޼��񹦣����۵���|�����󽣾�������������|����ϥ����������˻�����Ψ�Ҷ���|����������ͨ����Ƭ��֮��|�����������ϥ��������������|����ϥ���£�Ĭ����ħ��|������������������|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|�������廨�룬��ϥ���£�Ĭ�˿�����|�������������ù���һ����Ϣ��ʼ����������|��������ϥ������˫�ְ�����ǰ|���������죬�ų�һ�������Ϣ˳������������|����ϥ���£�˫�ֺ�ʮ����ͷ����Ǳ������|����Ϣ�������������������ִ�������֮��|����ϥ���£���Ŀ��ʲ��Ĭ�˿�������|����ϥ���£���Ŀ��ʲ������Ǭ��һ����|����ϥ���£�������������ͼ��ȡ���֮����|���������һ�����������۾���������Ů�ľ�|���������£�˫Ŀ΢�գ�˫���������������̫��|�����˵�������ڶ��������Ƴ����������������㻺��Ʈ��|����ϥ������˫�ִ�����ǰ�ɻ���״����������|����ϥ��������ʹ�����������³�|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|������һվ��˫�ֻ���̧������һ����|����ϥ������˫Ŀ���գ�������һ�������뵤��|��ϯ�ض������������죬���Ϻ��ʱ��ʱ��|�㰵���ټ�ʮ��ׯ�����۵���|�����������Ŀ�������ִ����������Ⱥ������������֮���䣬��Ȼ֮�������������Ҿ���)",
        "",
        "prepare_neili_t"
    )
    create_trigger_t("prepare_neili3", "^(> )*���Ҳ���(����|����)����Ӱ�������Ϣ��", "", "prepare_neili_w")
    create_trigger_t("prepare_neili4", "^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)", "", "prepare_neili_w")
    create_trigger_t("prepare_neili5", "^(> )*���ﲻ׼ս����Ҳ��׼(����|����)��", "", "prepare_neili_w")
    create_trigger_t("prepare_neili6", "^(> )*����ɲ����������(����|����)�ĵط���", "", "prepare_neili_w")
    create_trigger_t("prepare_neili7", "^(> )*��������ϣ�����˫�ۣ�վ��������", "", "prepare_neili_b")
    create_trigger_t("prepare_neili8", "^(> )*������۾���ʼ���ɡ�", "", "prepare_neili_t")
    create_trigger_t("prepare_neili9", "^(> )*�������ֽŴ�����������������ȷ������������", "", "prepare_neili_liaokao")
    create_trigger_t("prepare_neili10", "^(> )*������û�а����κ�����״̬��", "", "prepare_neili_over")
    SetTriggerOption("prepare_neili1", "group", "prepare_neili")
    SetTriggerOption("prepare_neili2", "group", "prepare_neili")
    SetTriggerOption("prepare_neili3", "group", "prepare_neili")
    SetTriggerOption("prepare_neili4", "group", "prepare_neili")
    SetTriggerOption("prepare_neili5", "group", "prepare_neili")
    SetTriggerOption("prepare_neili6", "group", "prepare_neili")
    SetTriggerOption("prepare_neili7", "group", "prepare_neili")
    SetTriggerOption("prepare_neili8", "group", "prepare_neili")
    SetTriggerOption("prepare_neili9", "group", "prepare_neili")
    SetTriggerOption("prepare_neili0", "group", "prepare_neili")
    EnableTriggerGroup("prepare_neili", false)
end
fight_trigger = function()
    DeleteTriggerGroup("fight")
    create_trigger_t(
        "fight1",
        "^>*\\s*\\( (\\D*)(�Ѿ��˺����ۣ���������֧���Ų�����ȥ|�����൱�ص��ˣ�ֻ�»�������Σ��|�Ѿ�һ��ͷ�ؽ����ģ������������֧���Ų�����ȥ|��Ϣ���أ�������ʼɢ�ң��������ܵ�����ʵ����|�Ѿ�һ��ͷ�ؽ����ģ������������֧���Ų�����ȥ|�ƺ�ʮ��ƣ����������Ҫ�ú���Ϣ��|�������Ѿ�����������|�������꣬������״������̫��|�����ƺ���ʼ�е㲻̫��⣬������Ȼ��������|�������������˵�����|������������Щ����|���˼����ˣ������ƺ���������|���˲��ᣬ������״������̫��|�ƺ����˵����ˣ������������������|�ƺ���Щƣ����������Ȼʮ���л���|�Ѿ���������״̬����ʱ������ˤ����ȥ|���˹��أ��Ѿ�����һϢ�����ڵ�Ϧ��|���˹��أ��Ѿ�������в�����ʱ�����ܶ���)�� \\)",
        "",
        "fight_check"
    )
    create_trigger_t("fight16", "^һ��ů�����Ե�������ȫ�����������ָֻ���֪������", "", "faint_check")
    --    create_triggerex_t101('fight17',"^(.*)��",'','fight_zhaoshi_check')
    create_trigger_t("fight18", "^(> )*��(����ʹ�ý�|����������ô��|�������|����û��|������|������|�����޽�|��ʹ�õ��⹦��û�����ֹ���)", "", "weapon_unwield")
    create_trigger_t("fight17", "^(> )*ʹ�á���ȭ��ʱ������֣�", "", "weapon_unwield")
    create_trigger_t("fight2", "^(> )*�㡸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$", "", "fightDie")
    create_trigger_t(
        "fight3",
        "^(> )*(\\D*)(ֻ��ȫ��һ��|ͻȻһ��������˲��ð������亹|Ŀǰ���Թ˲�Ͼ|���������ʼ���Ӳ�����Ӱ|����������һ������|�������˼���������ɫ�������ö���|������ͻȻ�������Σ����ظ�����������)",
        "",
        "fightXiqi"
    )
    --    create_trigger_t('fight4',"^(> )*������(\\D*)��ɱ���㣡$",'','fightConsider')
    create_trigger_t("fight5", "^(��)(����������������|����̫����|��������̫��)", "", "fight_hp")
    create_trigger_t(
        "fight6",
        "^(> )*��(��������|ʹ�õı��в���|ʹ�õı��в���ȷ|ʹ�õ���������|��ʹ�õ��⹦��û�����ֹ���|�����ݶ�|�����ͱ��ң���������İ����Ѿ�����)",
        "",
        "noweaponpfm"
    )
    create_trigger_t("fight7", "^(\\D*)�ۻ����ң������˸����ֲ�����", "", "performMie")
    create_trigger_t(
        "fight8",
        "^(> )*̫���ߣ��޼���������֮��֣���֮��ϣ��������׼�����糵�֣�����\\D*����\\D*��(\\D*)һ�ͣ����������ȣ�ȫ��������մ�",
        "",
        "fightLiuhe"
    )
    create_trigger_t("fight9", "^(> )*��(�����ջ����������еĺ��|�����޷��չ�|����������һ����ͻȻ��������|����һ�ɣ���Ҳ֧�ֲ�)", "", "yunWudiDone")
    create_trigger_t("fight10", "^(> )*��(�����е������������ͨ����ҽ�ս�޲�ʤ|�����Ľе������������ͨ����)", "", "yunWudi")
    create_trigger_t("fight11", "^(> )*���(\\D*)(��Ѫһ�ͣ��ѱ����ڵ���|��ʱ��æ���ң�ʩչ���������|��ʱ��ɫ�԰ף��о�������Ϣ)", "", "fightXiqi")
    create_trigger_t(
        "fight12",
        "^(> )*��(������̫��|��������̫��|��������|����������|��������|�������ڲ���|Ŀǰ����̫��|���������㣬�޷�|������������|�����Լ���������̫��|����̫��|������������)",
        "",
        "fightDrug"
    )
    SetTriggerOption("fight1", "group", "fight")
    SetTriggerOption("fight2", "group", "fight")
    SetTriggerOption("fight3", "group", "fight")
    SetTriggerOption("fight4", "group", "fight")
    SetTriggerOption("fight5", "group", "fight")
    SetTriggerOption("fight6", "group", "fight")
    SetTriggerOption("fight7", "group", "fight")
    SetTriggerOption("fight8", "group", "fight")
    SetTriggerOption("fight9", "group", "fight")
    SetTriggerOption("fight10", "group", "fight")
    SetTriggerOption("fight11", "group", "fight")
    SetTriggerOption("fight12", "group", "fight")
    SetTriggerOption("fight16", "group", "fight")
    SetTriggerOption("fight17", "group", "fight")
    SetTriggerOption("fight18", "group", "fight")
    --    EnableTrigger("fight4",false)
    job_exp_trigger()
end
function hp_heqi_check(n, l, w)
    heqi = tonumber(w[1])
    hp.heqi = heqi
    if hp.qixue_per < 35 and dhd_cur > 0 then
        exe("fu dahuan dan")
    end
    if hp.qixue_per < 70 and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if (hp.qixue / (hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe("yun qi")
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe("yun jing")
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- ����С��40%������ྴ����裡
        exe("eat " .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- ����С��30%����ྻ��ε���
        exe("eat " .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- ����С��10%�����Ϣ�裡
        exe("eat " .. drug.neili1)
    end
    if hp.neili < 1000 and hp.neili_max > 3000 and hp.heqi > 150 and GetRoleConfig("Recover_neili") ~= "" then
        exe(GetRoleConfig("Recover_neili"))
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe("yun jingli")
    end
    if job.name == "songmoya" then
        if hp.qixue_per < 80 then
            exe("eat " .. drug.heal)
        end
        if perform.force and perform.force == "dulong-dafa" and (not flag.wudi or flag.wudi == 0) then
            exe("yun wudi")
        end
        if perform.force and perform.force == "dulong-dafa" and hp.qixue_per < 70 then
            exe("yun wudi")
        end
        if os.time() > fight.time.b + 120 then
            exe("set wimpycmd halt\\down")
            return
        end
        if heqi == 1000 and hp.qixue_per < 55 then
            chats_log("��Ч�������񣺺�������1000��ֵ����������", "cyan")
            exe("set wimpycmd halt\\down")
            return
        end
        if yptjob.fengzhao == false then
            if yptjob.name2 == "����в" then
                if heqi > 320 then
                    exe("ppp1;pp1;set wimpycmd pfmbuff\\ppp1\\pp1\\hp")
                    hqpd = 0
                    return
                elseif hqpd == 0 then
                    exe("set wimpycmd hp")
                    hqpd = 1
                    print("���ܺ�����")
                    return
                end
            end

            if yptjob.name1 == "����в" then
                if heqi > 320 then
                    exe("ppp2;pp2;set wimpycmd pfmbuff\\ppp2\\pp2\\hp")
                    hqpd = 0
                    return
                elseif hqpd == 0 then
                    exe("set wimpycmd hp")
                    hqpd = 1
                    print("���ܺ�����")
                    return
                end
            end
        end
        if yptjob.name1 ~= "����в" and yptjob.name2 ~= "����в" then
            if heqi > 400 then
                if GetVariable("double_kill") ~= nil and GetVariable("double_kill") == "yes" then
                    if sxkiller1 >= sxkiller2 then
                        exe("set wimpycmd pfmbuff\\ppp1\\ppp2\\hp")
                        hqpd = 0
                    else
                        exe("set wimpycmd pfmbuff\\ppp2\\ppp1\\hp")
                        hqpd = 0
                    end
                else
                    if sxkiller1 >= sxkiller2 then
                        exe("ppp1;pp1;set wimpycmd pfmbuff\\ppp1\\pp1\\hp")
                        hqpd = 0
                    else
                        exe("ppp2;pp2;set wimpycmd pfmbuff\\ppp2\\pp2\\hp")
                        hqpd = 0
                    end
                end
            elseif hqpd == 0 then
                exe("set wimpycmd hp")
                hqpd = 1
                print("��ʼ���ܺ�����")
            end
        end
    end

    if heqi == 1000 and hp.neili < hp.neili_max * 0.2 then
        dis_all()
        locate()
        exe("yield yes;set wimpycmd halt\\hp\\" .. locl.dir)
        geta()
        EnableTrigger("hpheqi1", true)
        if job.name == "songxin" then
            chats_log("�������񣺺�������1000��ֵ����������", "cyan")
            EnableTrigger("songxin_fight7", true)
            return check_halt(songxinKillFail, 1)
        end
        if job.name == "wudang" then
            chats_log("�䵱���񣺺�������1000��ֵ����������", "cyan")
            return check_halt(wudangKillFail, 1)
        end
        if job.name == "xueshan" then
            chats_log("ѩɽ���񣺺�������1000��ֵ����������", "cyan")
            return check_halt(xueshanKillFail, 1)
        end
    end
end
function songxinKillFail()
    exe("yield no")
    return go(songxin_fangqi, "�����", "��վ")
end
function wudangKillFail()
    exe("yield no")
    return go(wudangFangqi, "�䵱ɽ", "�����")
end
function xueshanKillFail()
    exe("yield no")
    return go(xueshan_fangqi, "��ѩɽ", "���Ŀ�")
end
function noweaponpfm()
    exe("pfmks")
end

function yunWudiDone()
    flag.wudi = 0
end
function yunWudi()
    flag.wudi = 1
end
function fightDrug()
    if isInBags(drug.neili1) then
        exe("eat " .. drug.neili1)
    end
    if isInBags(drug.neili2) then
        exe("eat " .. drug.neili2)
    end
    if isInBags(drug.neili3) then
        exe("eat " .. drug.neili3)
    end
end
function npcWeapon()
    DeleteTriggerGroup("npcWeapon")
    create_trigger_t("npcWeapon1", "^  ��(\\D*)\\(", "", "npcWP")
    SetTriggerOption("npcWeapon1", "group", "npcWeapon")
    EnableTriggerGroup("npcWeapon", true)
end
function npcWP(n, l, w)
    local n_words = tostring(w[1])
    -- print(n_words)
    if string.find(n_words, "����") then
        exe("set po ǹ")
    elseif string.find(n_words, "����") then
        exe("set po ǹ")
    elseif string.find(n_words, "���") then
        job.weapon = "stick"
        exe("set po ǹ")
    elseif string.find(n_words, "����") then
        job.weapon = "sword"
        exe("set po ��")
    elseif string.find(n_words, "��") then
        job.weapon = "xiao"
        exe("set po ��")
    elseif string.find(n_words, "��") then
        exe("set po ��")
    elseif string.find(n_words, "�ֵ�") then
        job.weapon = "blade"
        exe("set po ��")
    elseif string.find(n_words, "��") then
        job.weapon = "whip"
        exe("set po ��")
    elseif string.find(n_words, "ʯ") then
        exe("set po ��")
    elseif string.find(n_words, "ذ��") then
        exe("set po ��")
    elseif string.find(n_words, "�ָ�") then
        exe("set po ��")
    elseif string.find(n_words, "���Ǵ�") then
        exe("set po ��")
    elseif string.find(n_words, "����") then
        job.weapon = "dagger"
        exe("set po ��")
    elseif string.find(n_words, "����") then
        exe("set po ��")
    elseif string.find(n_words, "����") then
        exe("set po ��")
    elseif string.find(n_words, "����") then
        exe("set po ��")
    else
        job.weapon = "unarmed"
        exe("set po ��")
    end
    EnableTrigger("npcWeapon1", false)
    DeleteTriggerGroup("npcWeapon")
end
function fightLiuhe(n, l, w)
    local l_force = w[2]
    if string.len(l_force) < 6 then
        return
    end
    if string.find("������|��Ԫ���ɷ�|������", w[2]) then
        exe("set ���Ͼ� ����")
    end
    if string.find("��������|���������|��󡹦", w[2]) then
        exe("set ���Ͼ� �귭")
    end
    if string.find("Ǭ��һ����|�׽|��������", w[2]) then
        exe("set ���Ͼ� ����")
    end
    if string.find("��Ԫ��|��ϼ��|ʥ����", w[2]) then
        exe("set ���Ͼ� ����")
    end
    if string.find("��Ů�ľ�|���վ�", w[2]) then
        exe("set ���Ͼ� ����")
    end
    if string.find("�ټ�ʮ��ׯ|��������|�����޼���|���칦|�̺�������", w[2]) then
        exe("set ���Ͼ� ����")
    end
end

function fightConsider(n, l, w)
    -- if not (job.killer and job.killer[w[2]]) and not (road.wipe_who and road.wipe_who==w[2]) then
    --  exe(perform.huaxue)
    -- end
end
function fightXiqi(n, l, w)
    do
        return
    end
    if not perform.xiqi then
        return
    end

    local l_jiali = max
    if job.killer and job.killer[w[2]] then
        for p in pairs(skillEnable) do
            if skills[p] and skillEnable[p] == "force" and skills["force"] then
                l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
                l_jiali = math.modf(l_jiali)
                break
            end
        end
        if l_jiali > 200 then
            l_jiali = max
        end
        if skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
        else
            exe("jiali max")
        end

        fightHpCheck()

        if type(job.killer[w[2]]) == "string" then
            exe(perform.xiqi .. " " .. job.killer[w[2]])
        else
            exe(perform.xiqi)
        end
        if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 then
        elseif skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
        elseif perform.skill and perform.skill == "huagu-mianzhang" then
            exe("jiali max")
        else
            exe("jiali max")
        end
    end
end

function performMie(n, l, w)
    do
        return
    end
    if not perform.xiqi then
        return
    end
    if job.killer and job.killer[w[1]] then
        return performBusy(w[1], 2)
    end
end
function performBusy(p_id, p_sec)
    if not p_id or type(p_id) ~= "string" then
        return
    end
    tmp.pfmid = p_id
    if p_sec and type(p_sec) == "number" then
        create_timer_s("performbusy", p_sec, "performAction")
    else
        return performAction()
    end
end
function performAction()
    local l_jiali
    if tmp.pfmid == nil then
        return
    end
    if not job.killer[tmp.pfmid] then
        tmp.pfmid = nil
        return
    end
    for p in pairs(skills) do
        if skillEnable[p] and skillEnable[p] == "force" and skills["force"] then
            l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
            l_jiali = math.modf(l_jiali)
            break
        end
    end
    if l_jiali > 200 then
        l_jiali = max
    end
    if skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
    else
        exe("jiali max")
    end

    fightHpCheck()

    exe(perform.xiqi .. " " .. job.killer[tmp.pfmid])
    tmp.pfmid = nil
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 then
    elseif skills["yinyun-ziqi"] and skills["yinyun-ziqi"].lvl < 300 then
    elseif perform.skill and perform.skill == "huagu-mianzhang" then
        exe("jiali max")
    else
        exe("jiali max")
    end
end

function fightDie()
    dieLog()
    dis_all()
    nobusy = 0
    messageShow("���ˣ�")
    if job.name == "songmoya" then
        smydie = smydie + 1
    end
    job.name = nil
    if hp.exp < 2000000 then
        create_triggerex("die", "^(> )*������", "", "xcquit")
    else
        create_triggerex("die", "^(> )*������", "", "main")
    end
end
function xcquit()
    exe("quit")
    wait.make(
        function()
            wait.time(3)
            Disconnect()
            Connect()
        end
    )
end
function fight_hurt()
    local per = 100 - damage
    if per > 20 or (hp.qixue_per <= 70 and per > 10) then
        world.Send("yun qi")
    end
end
function fight_hp()
    exe("hp")
    checkWait(fightHpCheck, 0.2)
end
function fight_check(n, l, w, styles)
    --[[print(w[2])
    if w[1]=='��' then
       exe('hp')
       checkWait(fightHpCheck,0.2)
    elseif job.name=="sldsm" and job.type and job.type=="zh" and w[1]==job.target then
       return sldsmZh(n,l,w,styles)
    end]]
    if w[1] == "��" then
        local l = w[2]
        -- print(l)
        if string.find(l, "��������Ѫ��ӯ����û������") then
            damage = 100
            return fight_hurt()
        end
        if string.find(l, "�ƺ����˵����ˣ������������������") then
            damage = 90
            return fight_hurt()
        end
        if string.find(l, "�������������˵�����") then
            damage = 80
            return fight_hurt()
        end

        if string.find(l, "���˼����ˣ������ƺ���������") then
            damage = 70
            return fight_hurt()
        end
        if string.find(l, "���˲��ᣬ������״������̫��") then
            damage = 60
        end
        if string.find(l, "��Ϣ���أ�������ʼɢ�ң��������ܵ�����ʵ����") then
            damage = 50
            return fight_hurt()
        end

        if string.find(l, "�Ѿ��˺����ۣ���������֧���Ų�����ȥ") then
            damage = 40
            return fight_hurt()
        end

        if string.find(l, "�����൱�ص��ˣ�ֻ�»�������Σ��") then
            damage = 30
            return fight_hurt()
        end
        if string.find(l, "����֮���Ѿ�����֧�ţ��ۿ���Ҫ���ڵ���") then
            damage = 20
            return fight_hurt()
        end
        if string.find(l, "���˹��أ��Ѿ�����һϢ�����ڵ�Ϧ��") then
            damage = 10
            return fight_hurt()
        end
        if string.find(l, "���˹��أ��Ѿ�������в�����ʱ�����ܶ���") then
            damage = 0
            return fight_hurt()
        end
        if string.find(l, "����������������һ��Ҳ����") then
            damage = 99
            return fight_hurt()
        end
        if string.find(l, "�ƺ���Щƣ����������Ȼʮ���л���") then
            damage = 88
            return fight_hurt()
        end
        if string.find(l, "������������Щ����") then
            damage = 77
            return fight_hurt()
        end

        if string.find(l, "�����ƺ���ʼ�е㲻̫��⣬������Ȼ��������") then
            damage = 66
            return fight_hurt()
        end
        if string.find(l, "�������꣬������״������̫��") then
            damage = 55
            return fight_hurt()
        end
        if string.find(l, "�ƺ�ʮ��ƣ����������Ҫ�ú���Ϣ��") then
            damage = 44
            return fight_hurt()
        end
        if string.find(l, "�Ѿ�һ��ͷ�ؽ����ģ������������֧���Ų�����ȥ") then
            damage = 33
            return fight_hurt()
        end
        if string.find(l, "�������Ѿ�����������") then
            damage = 22
            return fight_hurt()
        end
        if string.find(l, "ҡͷ���ԡ�����бб��վ��վ���ȣ��ۿ���Ҫ���ڵ���") then
            damage = 11
            return fight_hurt()
        end
        if string.find(l, "�Ѿ���������״̬����ʱ������ˤ����ȥ") then
            damage = 1
            return fight_hurt()
        end
    end
end
function fightHpCheck()
    -- if score.party and score.party=="������" and hp.qixue_per<75 then
    --   exe('yun yinyang')
    -- end
    -- if score.party and score.party=="������" and hp.qixue_per<40 then
    --   exe('yield yes;fu '..drug.heal..';yield no')
    -- end
    -- if score.party and score.party=="������" and hp.qixue_per<50 then
    --   exe('yun wudi '.. score.id)
    -- end
    if hp.qixue_per < 50 and cty_cu > 0 then
        exe("eat chantui yao")
    end
    if (hp.qixue / (hp.qixue_max / hp.qixue_per) < 35) and cty_cur > 0 then
        exe("eat chantui yao")
    end
    if hp.qixue < hp.qixue_max * 0.7 then
        exe("yun qi")
    end
    if hp.jingxue < hp.jingxue_max * 0.5 then
        exe("yun jing")
    end
    if hp.neili < hp.neili_max * 0.4 and cbw_cur > 0 then
        -- ����С��40%������ྴ����裡
        exe("eat " .. drug.neili2)
    end
    if hp.neili < hp.neili_max * 0.3 and hqd_cur > 0 then
        -- ����С��30%����ྻ��ε���
        exe("eat " .. drug.neili3)
    end
    if hp.neili < hp.neili_max * 0.1 and nxw_cur > 0 then
        -- ����С��10%�����Ϣ�裡
        exe("eat " .. drug.neili1)
    end
    if hp.neili < 1000 and hp.neili_max > 3000 and hp.heqi > 480 and GetRoleConfig("Auto_hqgzc_10times") ~= "" then
        exe(GetRoleConfig("Recover_neili"))
    end
    if hp.jingli < hp.jingli_max * 0.5 or hp.jingli < 500 then
        exe("yun jingli")
    end
end

faintFunc = faintFunc or {}
function faint_check()
    fightHpCheck()
    job.killer = {}
    tmp = {}
    faintFunc = faintFunc or {}
    for k, v in pairs(faintFunc) do
        if job.name == k then
            return _G[v]()
        end
    end
    return check_heal()
end
--[[
function fight_zhaoshi_check(n,l,w)
    local l_npc

    if job.name ~= 'huashan' and job.name ~= 'xueshan' then
       EnableTrigger("fight17",false)
       return false
    end
    if job.target=='����Ŀ��' then
       EnableTrigger("fight17",false)
       return false
    end

    if string.len(w[1]) > 8 then
       l_npc = w[1]
    else
       return false
    end

    if string.find(l_npc,job.target) then
       l_npc=del_string(l_npc,job.target)
       skills_zhaoshi(l_npc)
    end
end
--]]
function ppp()
    local l_cmd = GetVariable("pzhen")
    print(l_cmd)
    local l_cmd = GetVariable("pqi")
    print(l_cmd)
    local l_cmd = GetVariable("pxian")
    print(l_cmd)
    local l_cmd = GetVariable("pgang")
    print(l_cmd)
    local l_cmd = GetVariable("prou")
    print(l_cmd)
    local l_cmd = GetVariable("pkuai")
    print(l_cmd)
    local l_cmd = GetVariable("pman")
    print(l_cmd)
    local l_cmd = GetVariable("pmiao")
    print(l_cmd)
    local l_cmd = GetVariable("pkpfm")
    print(l_cmd)
end

function killPfm(id, p_cmd)
    local l_cmd = "kill"
    if p_cmd and type(p_cmd) == "string" then
        l_cmd = p_cmd
    end
    if id then
        exe(l_cmd .. " " .. id)
    -- exe('pfmpfm')
    end
    tmp.pfm = 100
    tmp.busytest = 0
    exe("set wimpycmd pfmpfm\\hp;set wimpy 100")
end
function performPre()
    if GetVariable("performpre") then
        perform.pre = GetVariable("performpre")
    end

    local l_pfm = perform.pre
    local l_jiali
    if job.name == "gaibang" and perform.skill and perform.skill == "taiji-quan" then
        l_pfm = perform.xiqi
    end

    for p in pairs(skillEnable) do
        if skills[p] and skillEnable[p] == "force" and skills["force"] then
            l_jiali = math.modf(skills[p].lvl + skills["force"].lvl / 2) / 2
            l_jiali = math.modf(l_jiali)
            break
        end
    end
    if l_jiali > 200 then
        l_jiali = max
    end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 149 and string.find(perform.huaxue, "yun riyue") then
        exe("jiali max")
    else
        if skills["yinyun-ziqi"] then
            exe("jiali max")
        else
            exe("jiali max")
        end
    end
    if job.name == "gblu" and road.wipe_id == "shiwei" and score.party == "ؤ��" then
        l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.chuo shiwei")
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" and score.party == "ؤ��" then
        l_pfm = string.gsub(l_pfm, "perform stick.chuo", "perform stick.chuo wu shi")
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" and score.party == "������" then
        l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi")
    end
    if job.name == "zhuoshe" and score.party == "ؤ��" then
        l_pfm = string.gsub(l_pfm, "perform stick.chuo", "perform stick.zhuan")
    end
    if score.party == "������" and flag.wudi and flag.wudi == 0 then
        l_pfm = "yun wudi " .. score.id .. ";" .. l_pfm
    end
    exe(l_pfm)
end
function pfmhuaxue()
    if not tmp.pfmid then
        DeleteTimer("performbusy")
    end
    if tmp.busytest then
        tmp.busytest = tmp.busytest + 1
    else
        tmp.busytest = 1
    end
    if tmp.busytest < 3 then
        exe("alias action pfmhuaxue")
    end
end
function performhuaxue()
    tmp.pfm = tmp.pfm - 1
    if tmp.pfm < 1 then
        DeleteTimer("perform")
        return
    end
    tmp.busytest = 0
    local l_pfm = perform.huaxue
    if not perform.huaxue then
        return
    end
    fightHpCheck()
    if job.name == "gblu" and road.wipe_id == "shiwei" and score.party == "ؤ��" then
        if tmp.faint and tmp.faint > 0 then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan shiwei " .. tmp.faint + 1)
        else
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan shiwei")
        end
    end
    if job.name == "gblu" and road.wipe_id == "wu shi" then
        if tmp.faint and tmp.faint > 0 then
            l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.chan wu shi " .. tmp.faint + 1)
            l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi " .. tmp.faint + 1)
        else
            l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.chan wu shi")
            l_pfm = string.gsub(l_pfm, "perform stick.mie", "perform stick.mie wu shi")
        end
    end
    if job.name == "zhuoshe" and score.party == "ؤ��" then
        l_pfm = string.gsub(l_pfm, "perform stick.chan", "perform stick.zhuan")
    end
    if job.name == "songxin" then
        if job.killer[sxjob.killer1] == "faint" and type(job.killer[sxjob.killer2]) == "string" then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan " .. job.killer[sxjob.killer2])
        elseif job.killer[sxjob.killer2] == "faint" and type(job.killer[sxjob.killer1]) == "string" then
            l_pfm = string.gsub(l_pfm, "perform stick.zhuan", "perform stick.zhuan " .. job.killer[sxjob.killer1])
        end
    end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl > 150 and hp.qixue_per < 70 then
        l_pfm = "yun yinyang;" .. l_pfm
    end
    if score.party == "������" and (hp.qixue_per < 40 or (flag.wudi and flag.wudi == 0)) then
        l_pfm = "yun wudi " .. score.id .. ";" .. l_pfm
    end
    exe(l_pfm)
    if score.party == "������" and job.type and job.type == "zh" and job.name == "sldsm" and job.id then
        exe("zh " .. job.id .. ";no")
    end
end

fight_prepare = function()
    if Bag[weapon.first] and weaponKind[skillEnable[perform.skill]] then
        exe("wield " .. Bag[weapon.first].fullid)
    elseif Bag[weapon.second] and weaponKind[skillEnable[perform.skill]] then
        exe("wield " .. Bag[weapon.second].fullid)
    else
        weapon_wield()
    end

    local l_pfm
    exe("i;remove biao;jiali max;yield no")
    weapon_unwield()
    weapon_wield()
    --[[
   if perform and perform.skill and skillEnable[perform.skill] and string.find('strike|hand|cuff|finger|leg|claw',skillEnable[perform.skill]) then
      exe('bei none')
   end
   if perform and perform.skill and skillEnable[perform.skill] then
      exe('jifa '.. skillEnable[perform.skill] ..' '.. perform.skill)
	  if score.party=="������" and skills["banruo-zhang"] and skills["banruo-zhang"].lvl>350 then
	     exe('jifa parry banruo-zhang')
	  else
         exe('jifa parry '.. perform.skill)
	  end
   end
   --]]
    beiUnarmed()
    exe("set wimpycmd pfmpfm\\hp")
    exe("set wimpy 100;yield no")
    if score.party == "�һ���" then
        l_pfm = "perform dodge.wuzhuan " .. score.id
        exe(l_pfm)
    end
    -- if skills["yunu-xinjing"] and perform.force and perform.force=="yunu-xinjing" then
    --   exe('yun xinjing')
    -- end
    -- if skills["bihai-chaosheng"] and perform.force and perform.force=="bihai-chaosheng" then
    -- exe('yun qimen')
    -- end
    if skills["yijin-jing"] and perform.force and perform.force == "yijin-jing" then
        exe("yun powerup")
    end
    if skills["lingbo-weibu"] then
        exe("enable dodge lingbo-weibu;perform dodge.luoshen " .. score.id)
    end
    -- ai
    -----------------------------------   -- ain
    --  if skills["longxiang-boruo"] and perform.force and perform.force=="longxiang-boruo" then
    --     exe('yun shield')
    --  end

    if skills["xiantian-gong"] and perform.force and perform.force == "xiantian-gong" then
        exe("yun wuqi")
    end

    if skills["huagong-dafa"] and perform.force and perform.force == "huagong-dafa" then
        exe("yun huadu")
    end

    if skills["bahuang-gong"] and perform.force and perform.force == "bahuang-gong" then
        exe("yun duzun")
        exe("yun bahuang")
    end
    -- if skills["shenzhao-jing"] and perform.force and perform.force=="shenzhao-jing" then
    --    exe('yun shenzhao')
    -- ��Ϊ����ɢ�� ȡ����
    -- end
    if skills["yunu-xinjing"] and perform.force and perform.force == "yunu-xinjing" then
        exe("yun xinjing")
    end
    if skills["hanbing-zhenqi"] and perform.force and perform.force == "hanbing-zhenqi" then
        exe("yun huti")
    end
end

prepare_lianxi = function(func)
    prepare_trigger()
    EnableTriggerGroup("prepare_neili", true)
    flag.prepare = 1
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end
    condition = {}
    exe("cond")
    return check_busy(prepareLianxi)
end
function prepareLianxi()
    if mydummy == true then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        return dummyfind()
    end
    if (not condition.busy or condition.busy == 0) and job.prepare ~= duHhe_start and job.prepare ~= duCjiang_start then
        return prepare_neili(job.prepare)
    end
    if condition.busy > 60 then
        if
            score.party == "����Ľ��" and need_dzxy == "yes" and dzxy_level == 3 and hp.food > 50 and hp.water > 50 and
                (locl.time == "��" or locl.time == "��" or locl.time == "��" or locl.time == "��")
         then
            messageShow("�����أ������ζ�ת���ƣ����������ϣ�����ȥ����������ת�����ˣ�", "white")
            return check_halt(checkdzxy)
        end
    end
    flag.jixu = 1
    if hp.neili_max > hp.neili_lim - 10 then
        exe("unset ����")
    elseif job.prepare and (job.prepare == test or job.prepare == duHhe_start or job.prepare == duCjiang_start) then
        exe("unset ����")
    else
        flag.jixu = 0
        exe("unset ����")
    end

    if job.zuhe["gblu"] and not locl.id["ͭǮ"] and hp.exp < 2000000 then
        exe("drop 1 coin")
    end

    prepare_neili_a()
end
prepare_neili = function(func, p_cmd)
    local l_db
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end

    tmp.db = p_cmd
    l_db = 1 / 2
    if tmp.db and type(tmp.db) == "number" and tmp.db < 2 then
        l_db = tmp.db
    end

    if hp.neili > hp.neili_max * l_db and job.prepare ~= test and job.prepare ~= fight_prepare then
        return check_bei(job.prepare)
    end

    prepare_trigger()
    EnableTriggerGroup("prepare_neili", true)
    flag.jixu = 1
    exe("unset ����")
    flag.prepare = 0
    exe("yun jing;yun jingli;hp")
    if job.zuhe["gblu"] and not locl.id["ͭǮ"] then
        exe("drop 1 coin")
    end
    prepare_neili_a()
end
prepare_neili_at = function()
    if tmp.prepare then
        job.prepare = tmp.prepare
    end
    prepare_trigger()

    if job.zuhe["gblu"] and not locl.id["ͭǮ"] then
        exe("drop 1 coin")
    end

    EnableTriggerGroup("prepare_neili", true)
    create_timer_s("neili", 3, "prepare_neili_idle")
end
prepare_neili_a = function()
    condition.busy = 0
    prepare_neili_idle()
    if hp.qixue_per < 50 and isInBags(drug.heal) then
        exe("eat chantui yao")
    end
    create_timer_s("neili", 3, "prepare_neili_idle")
end
prepare_neili_b = function()
    if mydummy == true then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        return dummyfind()
    end
    if score.party == "��ͨ����" and nobusy == 0 and condition.busy ~= nil and condition.busy >= 100 and hp.pot >= 60 then
        if skills["literate"] and score.gold > 1000 and skills["literate"].lvl < hp.pot_max - 100 then
            return check_halt(literate)
        elseif
            (skills["force"].lvl > 200 and skills["force"].lvl < hp.pot_max - 100) or
                (skills["dodge"].lvl > 101 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl > 101 and skills["parry"].lvl < hp.pot_max - 100)
         then
            return check_halt(lingwu)
        end
    end
    if score.party ~= "��ͨ����" and nobusy == 0 and condition.busy ~= nil and condition.busy >= 100 and hp.pot >= 60 then
        if skills["literate"] and score.gold > 1000 and skills["literate"].lvl < hp.pot_max - 100 then
            return check_halt(literate)
        elseif
            (skills["dodge"].lvl < 450 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl < 450 and skills["parry"].lvl < hp.pot_max - 100) or
                (skills["force"].lvl < 450 and skills["force"].lvl < hp.pot_max - 100)
         then
            return check_halt(xuexi)
        elseif
            (skills["force"].lvl >= 450 and skills["force"].lvl < hp.pot_max - 100) or
                (skills["dodge"].lvl >= 450 and skills["dodge"].lvl < hp.pot_max - 100) or
                (skills["parry"].lvl >= 450 and skills["parry"].lvl < hp.pot_max - 100)
         then
            return check_halt(lingwu)
        end
    end
    exe("yun qi;hp")
    check_bei(prepare_neili_c)
end
prepare_neili_c = function()
    local l_db = 1 / 2
    -- if score.party and score.party=='������' then
    --   l_db=5/4
    -- end
    -- if perform.skill and perform.skill=="jieshou-jiushi" then
    --   l_db=7/4
    -- end
    if tmp.db and type(tmp.db) == "number" and tmp.db < 2 then
        l_db = tmp.db
    end

    -- if job.zuhe["wudang"] then l_db = 1 end

    if not flag.prepare or type(flag.prepare) ~= "number" then
        flag.prepare = 0
    end
    if condition.busy and condition.busy > 20 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = 4
    end
    if condition.busy and condition.busy == 0 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = flag.prepare + 5
    end
    if job.prepare == duHhe_start or job.prepare == duCjiang_start then
        flag.prepare = 0
    end
    if flag.prepare > 4 then
        flag.prepare = 0
    end
    if (hp.neili > hp.neili_max * l_db or hp.jingli > hp.jingli_max) and flag.prepare == 0 then
        EnableTriggerGroup("prepare_neili", false)
        DeleteTriggerGroup("prepare_neili")
        DeleteTimer("neili")
        exe("yun jing;yun qi;yun jingli")
        check_bei(job.prepare)
    else
        prepare_neili_a()
    end
end
prepare_neili_w = function()
    locate()
    check_bei(prepare_neili_g)
end
prepare_neili_g = function()
    exe(locl.dir)
end
prepare_neili_t = function()
    DeleteTimer("neili")
    tmp.i = 1
end
prepare_neili_idle = function()
    local l_cnt = 0
    local l_db = 3 / 2

    for p in pairs(skills) do
        if skillEnable[p] and skillEnable[p] == "force" then
            tmp.fskill = p
            break
        end
    end
    if perform.force then
        tmp.fskill = perform.force
    end

    if
        ((hp.neili_max > hp.neili_lim - 20 and score.party and score.party == "������") or hp.neili_max >= hp.neili_lim - 5 or
            flag.jixu == 1 or
            skills[tmp.fskill].full == 0) and
            hp.neili > hp.neili_max * l_db
     then
        if hp.neili > hp.neili_max * 7 / 4 then
            l_cnt = l_cnt + math.modf((hp.neili - hp.neili_max * 7 / 4) / 10)
        end
        l_cnt = l_cnt + math.modf(hp.neili_max / 300)
        if l_cnt < 1 then
            l_cnt = 1
        end
        lianxi(l_cnt)
    end
    if score.gold and score.gold > 1000 and hp.neili < hp.neili_max * 0.5 then
        exe("eat " .. drug.neili3)
    end
    exe("yun jingli;yun jing;yun qi")
    if
        hp.jingli_max < hp.jingli_lim - 500 and flag.lianxi == 1 and hp.neili > hp.neili_max * l_db and
            ((hp.neili_max > hp.neili_lim - 20 and score.party and score.party == "������") or
                hp.neili_max >= hp.neili_lim - 5 or
                flag.jixu == 1)
     then
        exe("unset ����")
        exe("tuna " .. hp.jingxue / 2)
    else
        -- if score.party and score.party=="������" and locl.room=="ţ��ʯ" then
        --   exe('lianneili '..hp.dazuo)
        -- end
        exe("unset ����")
        exe("dazuo " .. hp.dazuo)
    end
    exe("cond")
end
prepare_neili_stop = function()
    DeleteTimer("neili")
    DeleteTimer("bei")
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    beihook = test
    busyhook = test
    EnableTriggerGroup("check_bei", false)
    EnableTriggerGroup("check_busy", false)
    exe("halt")
end
prepare_neili_liaokao = function()
    dis_all()
    return tiaoshui()
end
prepare_neili_over = function()
    condition.busy = 0
    check_halt(prepare_neili_guanbi)
end
prepare_neili_guanbi = function()
    if not flag.prepare or type(flag.prepare) ~= "number" then
        flag.prepare = 0
    end
    if condition.busy and condition.busy > 20 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = 4
    end
    if condition.busy and condition.busy == 0 and job.prepare and job.prepare ~= test and flag.prepare > 0 then
        flag.prepare = flag.prepare + 5
    end
    if job.prepare == duHhe_start or job.prepare == duCjiang_start then
        flag.prepare = 0
    end
    if flag.prepare > 4 then
        flag.prepare = 0
    end
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTimer("neili")
    exe("yun jing;yun qi;yun jingli")
    check_bei(job.prepare)
end
function job.find()
    if job.name == nil then
        return 0
    end
end
function job.flag()
    flag.find = 0
    flag.wait = 0
end

function job_exp_trigger()
    DeleteTriggerGroup("job_exp")
    create_trigger_t("job_exp1", "^(> )*(\\D*)��Ǳ��!$", "", "jobExppot")
    create_trigger_t("job_exp2", "^(> )*(\\D*)�㾭��!$", "", "jobExpexp")
    create_trigger_t("job_exp3", "^(> )*�㾲����������������ղŵ�������̣�������Ȼ���ʡ��������صõ���(\\D*)�㾭�飡", "", "jobExpExtra")
    create_trigger_t("job_exp4", "^>*\\s*��������л�Ȼ���ʣ�������(\\D*)��Ǳ�ܺ�(\\D*)�㾭�飡", "", "job_exp_gb")
    create_trigger_t("job_exp5", "^(> )*��ϲ�㣡��ɹ��������(\\D*)�����㱻������", "", "jobExp")
    create_trigger_t("job_exp6", "^>*\\s*�ã���������ˣ���õ���(\\D*)��ʵս���飬(\\D*)��Ǳ��", "", "job_exp_gblu")
    create_trigger_t("job_exp7", "^>*\\s*�㱻������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ�(\\D*)�㸺��$", "", "job_exp_shenlong")
    create_trigger_t("job_exp8", "^(> )*����������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ����Ѿ�Ϊ���ְ����(\\D*)�Ρ�", "", "job_exp_clb")
    -- ����������һ�㾭�飬��ʮ����Ǳ�ܣ����Ѿ�Ϊ���ְ����һ�ٶ�ʮ�ĴΡ�
    -- create_trigger_t('job_exp8','^(> )*�㱻������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ�(\\D*)���ƽ�','','hubiaoFinish')
    -- create_triggerex_lvl('job_exp9',"^(> )*�����顿(\\D*)\\((\\D*)\\)��gblu start",'','gbluTeamStart',95)
    create_trigger_t("job_exp10", "^(> )*�ã�������ɣ��㱻�����ˣ�(\\D*)��ʵս���飬(\\D*)��Ǳ�ܡ�(\\D*)��$", "", "job_exp_songxin")
    create_trigger_t("job_exp11", "^(> )*������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ�����������������ˣ�$", "", "job_exp_wudang")
    create_trigger_t("job_exp12", "^(> )*������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ�(\\D*)��\\D*��$", "", "job_exp_huashan")
    create_trigger_t("job_exp13", "^(> )*�㱻������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ���о�а��֮����ʤ��ǰ��$", "", "job_exp_xueshan")
    create_trigger_t("job_exp14", "^(> )*�㱻�����ˣ�(\\D*)��ʵս���飬(\\D*)��Ǳ�ܣ�(\\D*)������(\\D*)��$", "", "job_exp_xuncheng")
    -- �����������ʮ�ŵ㾭�飬һ����ʮ����Ǳ�ܣ��㹲Ϊ�����̲������ĸ�������
    create_trigger_t("job_exp15", "^(> )*������(\\D*)�㾭�飬(\\D*)��Ǳ�ܣ��㹲Ϊ(\\D*)������(\\D*)��������$", "", "job_exp_dummy")
    create_trigger_t("job_exp16", "^(> )*��ϲ������˳����ɣ�������(\\D*)���飬(\\D*)��Ǳ�ܵĽ�����$", "", "job_exp_tdh")
    create_trigger_t("job_exp17", "^(> )*(������ְ�أ�����ʧ�ܡ�|���ٶ�̫����������ʿ�ѹ���Ħ�£�����ʧ�ܡ�)", "", "job_gblu_fail")
    create_trigger_t("job_exp18", "^(> )*���ˣ�(\\D*)����������ʧ�ܣ�", "", "jobtdhfail")
    SetTriggerOption("job_exp1", "group", "job_exp")
    SetTriggerOption("job_exp2", "group", "job_exp")
    SetTriggerOption("job_exp3", "group", "job_exp")
    SetTriggerOption("job_exp4", "group", "job_exp")
    SetTriggerOption("job_exp5", "group", "job_exp")
    SetTriggerOption("job_exp6", "group", "job_exp")
    SetTriggerOption("job_exp7", "group", "job_exp")
    SetTriggerOption("job_exp8", "group", "job_exp")
    -- SetTriggerOption("job_exp9","group","job_exp")
    SetTriggerOption("job_exp10", "group", "job_exp")
    SetTriggerOption("job_exp11", "group", "job_exp")
    SetTriggerOption("job_exp12", "group", "job_exp")
    SetTriggerOption("job_exp13", "group", "job_exp")
    SetTriggerOption("job_exp14", "group", "job_exp")
    SetTriggerOption("job_exp15", "group", "job_exp")
    SetTriggerOption("job_exp16", "group", "job_exp")
    SetTriggerOption("job_exp17", "group", "job_exp")
    SetTriggerOption("job_exp18", "group", "job_exp")
    EnableTrigger("job_exp1", false)
    EnableTrigger("job_exp2", false)
end
function jobtdhfail()
    messageShow("��ػ����񣺽�ͷ������������ʧ�ܣ�")
    tdh_triggerDel()
    return check_food()
end
function jobExp(n, l, w)
    EnableTrigger("job_exp1", true)
    EnableTrigger("job_exp2", true)
    hp.exp_name = tostring(w[2])
end
function jobExpexp(n, l, w)
    hp.exp_exp = tostring(w[2])
end
function job_exp_clb(n, l, w)
    messageShow("���ְ�������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
end
function jobExppot(n, l, w)
    EnableTrigger("job_exp1", false)
    EnableTrigger("job_exp2", false)
    hp.exp_pot = tostring(w[2])
    if not isNil(hp.exp_name) and not isNil(hp.exp_exp) and not isNil(hp.exp_pot) then
        return messageShow(hp.exp_name .. "������������:��" .. hp.exp_exp .. "���㣬��Ǳ��:��" .. hp.exp_pot .. "���㣡", "darkorange")
    end
    hp.exp_name = nil
    hp.exp_exp = nil
    hp.exp_pot = nil
end

function job_exp_tdh(n, l, w)
    messageShow("��ػ�������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
    dis_all()
    return tdh_finish()
end
function jobExpExtra(n, l, w)
    messageShow("����������������:��" .. w[2] .. "���㣡", "darkorange")
end
function job_exp_dummy(n, l, w)
    messageShow("����������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "����,�����" .. w[4] .. "��" .. w[5] .. "���β���������")
end
function job_exp_xueshan(n, l, w)
    messageShow("ѩɽ������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
end
function job_exp_wudang(n, l, w)
    messageShow("�䵱������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
    wudangjobok = 1
    job.wdtime = os.time() + 40
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("�䵱����������ɣ���ʱ:��" .. job.time.over .. "���롣")
    dis_all()
    return checkWait(wudangFinish, 1)
end
function job_exp_huashan(n, l, w)
    messageShow("��ɽ������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
end
function job_exp_shenlong(n, l, w)
    messageShow("����������������:��" .. w[1] .. "���㣬Ǳ��:��" .. w[2] .. "���㣡")
end
function job_exp_songxin(n, l, w)
    messageShow("����������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
end
function job_exp_xuncheng(n, l, w)
    messageShow("Ѳ��������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[3] .. "���㣡")
end

function job_exp_gb(n, l, w)
    if job.name == "gaibang" then
        messageShow("ؤ��������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[1] .. "���㣡")
    end
    if job.name == "songshan" then
        messageShow("��ɽ������������:��" .. w[2] .. "���㣬Ǳ��:��" .. w[1] .. "���㣡")
    end
end
function job_exp_zs(n, l, w)
    messageShow("׽��������������:��" .. w[1] .. "���㣬Ǳ��:��" .. w[2] .. "���㣡")
end
function job_exp_gblu(n, l, w)
    messageShow("��Ч���ҽ���������:��" .. w[1] .. "���㣬Ǳ��:��" .. w[2] .. "���㣡")
    if hp.exp > 2000000 then
        exe("yield no")
        return gbluFinish()
    end
end
-- ---------------------------------------------------------------
-- ����ͳ�Ƴ�ʼ��
-- ---------------------------------------------------------------
function job.statistics_Init()
    if job.statistics.PreviousExp == 0 then
        job.statistics = {
            PreviousExp = hp.exp,
            StartTime = os.time(),
            -- ����ʱ��
            Duration = "",
            Times = 0,
            Success = 0,
            Failure = 0,
            Efficiency = 0,
            Category = Category or {}
        }
        job.statistics.Category["��ɽ"] = {}
        job.statistics.Category["��ɽ"].Times = 0
        job.statistics.Category["��ɽ"].Success = 0
        job.statistics.Category["��ɽ"].Failure = 0
        job.statistics.Category["�䵱"] = {}
        job.statistics.Category["�䵱"].Times = 0
        job.statistics.Category["�䵱"].Success = 0
        job.statistics.Category["�䵱"].Failure = 0
        job.statistics.Category["����"] = {}
        job.statistics.Category["����"].Times = 0
        job.statistics.Category["����"].Success = 0
        job.statistics.Category["����"].Failure = 0
        job.statistics.Category["��Ħ��"] = {}
        job.statistics.Category["��Ħ��"].Times = 0
        job.statistics.Category["��Ħ��"].Success = 0
        job.statistics.Category["��Ħ��"].Failure = 0
        job.statistics.Category["ʧ����ż�"] = {}
        job.statistics.Category["ʧ����ż�"].Times = 0
    end
end
-- ---------------------------------------------------------------
-- ����ͳ����dashboard��
-- ---------------------------------------------------------------
function job.statistics_Update()
    job.statistics = job.statistics or {}
    if job.statistics.PreviousExp == nil or job.statistics.PreviousExp == 0 then
        job.statistics.PreviousExp = hp.exp
    end
    local l_exp = hp.exp
    local l_time = os.time() - job.statistics.StartTime
    local l_hour = math.modf(l_time / 3600)
    local l_min = math.modf((l_time - l_hour * 3600) / 60)
    local l_sec = l_time - l_hour * 3600 - l_min * 60
    local l_exp = hp.exp - job.statistics.PreviousExp
    local l_avg = math.modf(l_exp * 3600 / l_time)

    job.statistics.Duration = l_hour .. "Сʱ" .. l_min .. "��" .. l_sec .. "��"
    job.statistics.Efficiency = l_avg
end
-- ---------------------------------------------------------------
-- ����ͳ����messageShow����
-- ---------------------------------------------------------------
function job_exp_tongji(p_cmd)
    tongji = tongji or {}
    if tongji.exp == nil then
        tongji.exp = hp.exp
        tongji.time = os.time()
        tongji.hour = math.modf(os.time() / 900)
        messageShowT("������ͳ�ƣ�ͳ�ƿ�ʼ", "orange")
        return
    end

    if not tongji.time or not tongji.hour then
        tongji.exp = nil
        return
    end
    if math.modf(os.time() / 900) <= tongji.hour and not p_cmd then
        return
    end

    tongji.hour = math.modf(os.time() / 900)

    local l_exp = hp.exp
    local l_time = os.time() - tongji.time
    local l_hour = math.modf(l_time / 3600)
    local l_min = math.modf((l_time - l_hour * 3600) / 60)
    local l_sec = l_time - l_hour * 3600 - l_min * 60
    local l_exp = hp.exp - tongji.exp
    local l_avg = math.modf(l_exp * 3600 / l_time)

    job.expAvg = l_avg

    if flag.log and flag.log == "yes" then
        messageShowT(
            "������ͳ�ƣ������С�" ..
                l_hour .. "Сʱ" .. l_min .. "��" .. l_sec .. "��" .. "������þ��顾" .. l_exp .. "���㣬ƽ��ÿСʱ��" .. l_avg .. "���㣡",
            "orange"
        )
    else
        ColourNote(
            "white",
            "black",
            "������ͳ�ƣ������С�" ..
                l_hour .. "Сʱ" .. l_min .. "��" .. l_sec .. "��" .. "������þ��顾" .. l_exp .. "���㣬ƽ��ÿСʱ��" .. l_avg .. "���㣡"
        )
    end
end
function jobExpTongji()
    return job_exp_tongji(1)
end

JobTriggerDel = JobTriggerDel or {}

function jobTriggerDel()
    huashan_triggerDel()
    songxin_triggerDel()
    gaibangTriggerDel()
    zhuosheTriggerDel()
    clbTriggerDel()
    SmyTriggerDel()
    sldsmTriggerDel()
    -- hubiaoTriggerDel()
    tmonkTriggerDel()
    clbTriggerDel()
    husongTriggerDel()
    wudangTriggerDel()
    xueshan_triggerDel()
    tdh_triggerDel()
    JobTriggerDel = JobTriggerDel or {}
    for p, q in pairs(JobTriggerDel) do
        _G[q]()
    end
end

-- gaibang
function gaibangTrigger()
    DeleteTriggerGroup("gaibangAsk")
    create_trigger_t("gaibangAsk1", "^(> )*�����ⳤ�ϴ����й�", "", "gaibangAsk")
    create_trigger_t("gaibangAsk2", "^(> )*����û������ˡ�$", "", "gaibangNobody")
    SetTriggerOption("gaibangAsk1", "group", "gaibangAsk")
    SetTriggerOption("gaibangAsk2", "group", "gaibangAsk")
    EnableTriggerGroup("gaibangAsk", false)
    DeleteTriggerGroup("gaibangAccept")
    create_trigger_t("gaibangAccept1", "^(> )*�ⳤ��˵�������ðɣ������(\\D*)��һֱ����ؤ������", "", "gaibangTarget")
    create_trigger_t("gaibangAccept2", "^(> )*�ⳤ��˵����������������(\\D*)һ��", "", "gaibangConsider")
    create_trigger_t("gaibangAccept3", "^(> )*�ⳤ��˵��������Ȼ��ɲ���Ҳû��ϵ", "", "gaibangFail")
    create_trigger_t("gaibangAccept4", "^(> )*�ⳤ��˵�����������ϸ�����ȥ������ȥ", "", "gaibangFail")
    create_trigger_t("gaibangAccept5", "^(> )*�ⳤ��˵�����������ҿ�û�и�������񣬵Ȼ������ɣ�", "", "gaibangBusy")
    create_trigger_t("gaibangAccept6", "^(> )*�ⳤ��˵��������û��������", "", "gaibang")
    create_trigger_t("gaibangAccept7", "^(> )*�ⳤ��˵������û��������æ����", "", "gaibangWait")
    create_trigger_t("gaibangAccept8", "^(> )*�ⳤ��˵��������������ȥɱ", "", "gaibangFangqiGo")
    create_trigger_t("gaibangAccept9", "^(> )*�ⳤ��˵����������������û�и����������ȥ�����ط������ɣ���", "", "gaibangFail")
    -- ain
    -- create_trigger_t('gaibangAccept9',"^(> )*�ⳤ��˵�����������ҿ�û�и�������񣬵Ȼ���ô����",'','gaibangFail')
    SetTriggerOption("gaibangAccept1", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept2", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept3", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept4", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept5", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept6", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept7", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept8", "group", "gaibangAccept")
    SetTriggerOption("gaibangAccept9", "group", "gaibangAccept")
    EnableTriggerGroup("gaibangAccept", false)
    DeleteTriggerGroup("gaibangFight")
    create_trigger_t("gaibangFight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "gaibangDie")
    create_trigger_t("gaibangFight2", "^(> )*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "gaibangFaint")
    create_trigger_t("gaibangFight3", "^(> )*(\\D*)����ææ���뿪�ˡ�", "", "gaibangRun")
    create_trigger_t("gaibangFight4", "^(> )*����û�п�ʹ�õĶ���", "", "gaibangNoTarget")
    SetTriggerOption("gaibangFight1", "group", "gaibangFight")
    SetTriggerOption("gaibangFight2", "group", "gaibangFight")
    SetTriggerOption("gaibangFight3", "group", "gaibangFight")
    SetTriggerOption("gaibangFight4", "group", "gaibangFight")
    EnableTriggerGroup("gaibangFight", false)
    DeleteTriggerGroup("gaibangCut")
    create_trigger_t("gaibangCut1", "^>*\\s*ֻ�����ǡ���һ�����㽫(\\D*)���׼�ն���������������С�", "", "gaibangCutCon")
    create_trigger_t("gaibangCut2", "^>*\\s*����ü����������߲���������ʬ���ͷ����", "", "gaibangCutWeapon")
    create_trigger_t("gaibangCut3", '(> )*��� "action" �趨Ϊ "Cut" �ɹ���ɡ�', "", "gaibangCutFail")
    SetTriggerOption("gaibangCut1", "group", "gaibangCut")
    SetTriggerOption("gaibangCut2", "group", "gaibangCut")
    SetTriggerOption("gaibangCut3", "group", "gaibangCut")
    EnableTriggerGroup("gaibangCut", false)
    DeleteTriggerGroup("gaibangGive")
    create_trigger_t("gaibangGive1", "^(> )*����ⳤ��һ��(\\D*)���׼���", "", "gaibangFinish")
    create_trigger_t("gaibangGive2", "^(> )*�ⳤ��˵�������ٺ١���������ɱ�����ˡ���", "", "gaibangFinish")
    create_trigger_t("gaibangGive3", "^(> )*�ⳤ��˵��������������æ���أ����Ե�һ�°ɡ���", "", "gaibangGiveBusy")
    SetTriggerOption("gaibangGive1", "group", "gaibangGive")
    SetTriggerOption("gaibangGive2", "group", "gaibangGive")
    SetTriggerOption("gaibangGive3", "group", "gaibangGive")
    EnableTriggerGroup("gaibangGive", false)
    DeleteTriggerGroup("gaibangHead")
    create_trigger_t("gaibangHead1", "^(> )*����һ��(\\D*)��(�׼�|��ͷ)", "", "gaibangHeadCheck")
    create_trigger_t("gaibangHead2", '^(> )*��� "action" �趨Ϊ "check_head" �ɹ���ɡ�', "", "gaibangHeadCon")
    SetTriggerOption("gaibangHead1", "group", "gaibangHead")
    SetTriggerOption("gaibangHead2", "group", "gaibangHead")
    EnableTriggerGroup("gaibangHead", false)
end
function gaibangTriggerDel()
    DeleteTriggerGroup("gaibangAsk")
    DeleteTriggerGroup("gaibangAccept")
    DeleteTriggerGroup("gaibangFight")
    DeleteTriggerGroup("gaibangCut")
    DeleteTriggerGroup("gaibangGive")
    DeleteTriggerGroup("gaibangHead")
    DeleteTriggerGroup("gaibangFind")
end
function gaibangNobody()
    EnableTriggerGroup("gaibangAsk", false)
    gaibang()
end
-- ain
----job.list[gbwu"] = "ؤ���ⳤ��"
job.list["gaibang"] = "ؤ���ⳤ��"
function gaibang()
    gaibangTrigger()
    job.name = "gaibang"
    print("gaibang start...")
    prepare_neili(gaibangGo)
end
function gaibangGo()
    -- ain
    -- go(gaibangStart,"ؤ��","���ŷֶ�")
    go(gaibangStart, "���ݳ�", "����")
end
function gaibangStart()
    EnableTriggerGroup("gaibangAsk", true)
    exe("ask wu zhanglao about job")
end
function gaibangAsk()
    EnableTriggerGroup("gaibangAsk", false)
    EnableTriggerGroup("gaibangAccept", true)
end
function gaibangBusy()
    EnableTriggerGroup("gaibangAccept", false)
    if condition.busy and condition.busy == 0 then
        job.last = "gaibang"
        return check_heal()
    else
        check_bei(gaibangBusyDazuo)
    end
end
function gaibangBusyDazuo()
    exe("out")
    prepare_lianxi(gaibangBusyStart)
end
function gaibangBusyStart()
    exe("enter")
    gaibangStart()
end
function gaibangWait()
    EnableTriggerGroup("gaibangAccept", false)
    if job.name == "fangqi" then
        check_bei(gaibangFangqi)
    else
        check_bei(gaibangStart)
    end
end
function gaibangTarget(n, l, w)
    job.target = Trim(w[2])
    job.killer = {}
    job.killer[job.target] = true
end
function gaibangConsider(n, l, w)
    nobusy = 1
    job.time.b = os.time()
    print("ؤ��job ץ��ַ")
    EnableTriggerGroup("gaibangAccept", false)
    job.last = "gaibang"
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area

    if string.find(gaibangCancel, job.target) then
        check_bei(gaibangFangqi)
        messageShow("ؤ����������Ŀ�꡾" .. job.target .. "����Cannel�б�����������")
        return 0
    end
    if not job.room or not path_cal() then
        check_bei(gaibangFangqi)
        messageShow("ؤ����������ص㡾" .. job.where .. "�����ɵ�����������")
        return
    end
    check_bei(gaibangFind)
    exe("ؤ��������" .. job.where)
    messageShow("ؤ�����񣺿�ʼǰ����" .. job.where .. "����Ѱ������NPC����" .. job.target .. "������")
end
function gaibangFangqi()
    flag.idle = nil
    nobusy = 0
    EnableTriggerGroup("gaibangAsk", true)
    job.name = "fangqi"
    exe("ask wu zhanglao about ����")
end
function gaibangFangqiGo()
    EnableTriggerGroup("gaibangAccept", false)
    -- ain
    go(gaibangFangqi, "���ݳ�", "����")
end
function gaibangFind()
    DeleteTriggerGroup("gaibangFind")
    create_trigger_t("gaibangFind1", "^>*\\s*\\D*" .. job.target .. "\\((\\D*)\\)", "", "gaibangFight")
    SetTriggerOption("gaibangFind1", "group", "gaibangFind")
    EnableTriggerGroup("gaibangFind", false)
    flag.times = 1
    fight_prepare()
    go(gaibangFindAct, job.area, job.room)
end
function gaibangFindAct()
    EnableTriggerGroup("gaibangFind", true)
    job.flag()
    exe("look")
    find()
    exe("ؤ��������" .. job.where)
    messageShow("ؤ�����񣺿�ʼѰ�ҡ�" .. dest.area .. dest.room .. "��������NPC����" .. job.target .. "������")
end
function gaibangFight(n, l, w)
    EnableTriggerGroup("gaibangFind", false)
    EnableTriggerGroup("gaibangFight", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = string.lower(w[1])
    job.killer[job.target] = job.id
    exe("halt;follow " .. job.id)
    -- exe('kill '..job.id)
    killPfm(job.id)
end
function gaibangFaint(n, l, w)
    if job.target == w[2] then
        exe("kill " .. job.id)
    end
end
function gaibangDie(n, l, w)
    if job.target == w[2] then
        DeleteTimer("perform")
        gaibangCut()
    end
end
function gaibangRun(n, l, w)
    EnableTriggerGroup("gaibangFight", false)
    if job.target == w[2] then
        check_bei(gaibangFind)
    end
end
function gaibangNoTarget()
    EnableTriggerGroup("gaibangFight", false)
    check_bei(gaibangFind)
end
function gaibangCut()
    EnableTriggerGroup("gaibangFight", false)
    messageShow("ؤ�����񣺸㶨����NPC����" .. job.target .. "����")
    check_halt(gaibangCutAct)
end
gaibangCutAct = function()
    EnableTriggerGroup("gaibangCut", true)
    exe("halt;i")
    weapon_unwield()
    weaponWieldCut()
    for i = 1, 3 do
        exe("qie corpse " .. i)
    end
    exe("alias action Cut")
end
gaibangCutFail = function()
    EnableTriggerGroup("gaibangCut", false)
    gaibangFind()
end
gaibangCutWeapon = function()
    weapon_unwield()
    gaibangCutAct()
end
gaibangCutCon = function(n, l, w)
    if job.target ~= tostring(w[1]) then
        exe("drop head")
        check_bei(gaibangCutAct)
    else
        EnableTriggerGroup("gaibangCut", false)
        return check_bei(gaibangBack)
    end
end
function gaibangBack()
    weapon_unwield()
    for i = 1, 2 do
    end
    -- ain
    go(gaibangHead, "���ݳ�", "����")
end
function gaibangHead()
    EnableTriggerGroup("gaibangHead", true)
    tmp.flag = 0
    exe("look head")
    exe("alias action check_head")
end
function gaibangHeadCheck(n, l, w)
    if w[2] == job.target then
        tmp.flag = 1
    end
end
function gaibangHeadCon()
    EnableTriggerGroup("gaibangHead", false)
    if tmp.flag == 1 then
        gaibangGive()
    else
        gaibangFinish()
    end
end
function gaibangGive()
    EnableTriggerGroup("gaibangGive", true)
    exe("give wu head")
end
function gaibangGiveBusy()
    EnableTriggerGroup("gaibangGive", false)
    checkWait(gaibangGive)
end
function gaibangFail()
    -- ain
    if job.last == "gaibang" then
        --     gaibangBusy()
        EnableTriggerGroup("gaibangAccept", false)
        job.name = "fangqi"
        job.last = "gaibang"
        gaibangFinish()
    else
        gaibangBusy()
    end
end
function gaibangFinish()
    nobusy = 0
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    messageShowT("ؤ���ⳤ������������ɣ���ʱ:��" .. job.time.over .. "���롣")
    EnableTriggerGroup("gaibangAccept", false)
    EnableTriggerGroup("gaibangGive", false)
    checkWait(check_food)
end

-- zhuoshe
function zhuosheTrigger()
    DeleteTriggerGroup("zhuosheAsk")
    create_trigger_t("zhuosheAsk1", "^(> )*����³��ϴ����й�", "", "zhuosheAsk")
    create_trigger_t("zhuosheAsk2", "^(> )*����û������ˡ�$", "", "zhuosheNobody")
    SetTriggerOption("zhuosheAsk1", "group", "zhuosheAsk")
    SetTriggerOption("zhuosheAsk2", "group", "zhuosheAsk")
    EnableTriggerGroup("zhuosheAsk", false)
    DeleteTriggerGroup("zhuosheAccept")
    create_trigger_t("zhuosheAccept1", "^(> )*�³���˵������ȥ(\\D*)��������׽���߻����ɣ�", "", "zhuosheConsider")
    create_trigger_t("zhuosheAccept2", "^(> )*�³���˵��������ﲻ���ң������ȥ�����ɡ��Ժ��������㡣��", "", "zhuosheFail")
    create_trigger_t("zhuosheAccept3", "^(> )*�³�����ʱ����ץ�ߣ����һ��������ɡ�", "", "zhuosheBusy")
    create_trigger_t("zhuosheAccept4", "^(> )*�³���˵�������ղŲ����������ץ��ȥ��������ô����ȥ", "", "zhuosheFangqiGo")
    create_trigger_t("zhuosheAccept5", "^(> )*�³���˵������ʲô��������ʲô����", "", "check_heal")
    create_trigger_t("zhuosheAccept6", "^(> )*�³���˵����������ͷ�����������°ɣ���һ�������ɣ�", "", "zhuosheBusy")
    create_trigger_t("zhuosheAccept7", "^(> )*�³���˵���������ץ���ߣ�������ȥ��Ϣһ��ɡ�", "", "zhuosheFail")
    SetTriggerOption("zhuosheAccept1", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept2", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept3", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept4", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept5", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept6", "group", "zhuosheAccept")
    SetTriggerOption("zhuosheAccept7", "group", "zhuosheAccept")
    EnableTriggerGroup("zhuosheAccept", false)
    DeleteTriggerGroup("zhuosheFind")
    create_trigger_t("zhuosheFind1", "^(> )*ͻȻ�㷢�ֲݴ�����һ���ߡ�", "", "zhuosheTarget")
    SetTriggerOption("zhuosheFind1", "group", "zhuosheFind")
    EnableTriggerGroup("zhuosheFind", false)
    DeleteTriggerGroup("zhuosheFight")
    create_trigger_t("zhuosheFight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "zhuosheBack")
    create_trigger_t("zhuosheFight2", "^(> )*(\\D*)����һ�ţ������ˡ�������ץ��������", "", "zhuosheBack")
    create_trigger_t("zhuosheFight3", "^(> )*���������(\\D*)һ���ж���", "", "zhuosheName")
    SetTriggerOption("zhuosheFight1", "group", "zhuosheFight")
    SetTriggerOption("zhuosheFight2", "group", "zhuosheFight")
    SetTriggerOption("zhuosheFight3", "group", "zhuosheFight")
    EnableTriggerGroup("zhuosheFight", false)
    DeleteTriggerGroup("zhuosheFinish")
    create_trigger_t("zhuosheFinish1", "^(> )*�³��ϴ�������ӹ��ߣ�ת��װ��һ���ڴ��", "", "zhuosheFinish")
    create_trigger_t("zhuosheFinish2", "^(> )*�³���˵��������ô�򵥵��¶��첻�ã�����ȥ��", "", "zhuosheFinish")
    SetTriggerOption("zhuosheFinish1", "group", "zhuosheFinish")
    SetTriggerOption("zhuosheFinish2", "group", "zhuosheFinish")
    EnableTriggerGroup("zhuosheFinish", false)
end
function zhuosheTriggerDel()
    DeleteTriggerGroup("zhuosheAsk")
    DeleteTriggerGroup("zhuosheAccept")
    DeleteTriggerGroup("zhuosheFind")
    DeleteTriggerGroup("zhuosheFight")
    DeleteTriggerGroup("zhuosheFinish")
end
function zhuosheNobody()
    EnableTriggerGroup("zhuosheAsk", false)
    zhuoshe()
end
function zhuoshe()
    zhuosheTrigger()
    job.name = "zhuoshe"
    prepare_neili(zhuosheGo)
end
function zhuosheGo()
    go(zhuosheStart, "ؤ��", "�յ�")
end
function zhuosheStart()
    EnableTriggerGroup("zhuosheAsk", true)
    exe("ask chen zhanglao about job")
end
function zhuosheAsk()
    EnableTriggerGroup("zhuosheAsk", false)
    EnableTriggerGroup("zhuosheAccept", true)
end
function zhuosheBusy()
    EnableTriggerGroup("zhuosheAccept", false)
    check_bei(zhuosheBusyDazuo)
end
function zhuosheBusyDazuo()
    prepare_lianxi(zhuosheStart)
end
function zhuosheFail()
    EnableTriggerGroup("zhuosheAccept", false)
    job.last = "zhuoshe"
    check_bei(zhuosheDan)
end
function zhuosheWait()
    EnableTriggerGroup("zhuosheAccept", false)
    if job.name == "fangqi" then
        check_bei(zhuosheFangqi)
    else
        check_bei(zhuosheStart)
    end
end
function zhuosheConsider(n, l, w)
    job.time.b = os.time()
    EnableTriggerGroup("zhuosheAccept", false)
    job.last = "zhuoshe"
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if not job.room or not path_cal() then
        check_bei(zhuosheFangqi)
        messageShow("׽����������ص㡾" .. job.where .. "�����ɵ�����������")
        return
    end
    check_bei(zhuosheFind)
    exe("ؤ��׽����" .. job.where)
    messageShow("׽�����񣺿�ʼǰ����" .. job.where .. "����")
end
function zhuosheFangqiGo()
    go(zhuosheFangqi, "ؤ��", "�յ�")
end
function zhuosheFangqi()
    flag.idle = nil
    EnableTriggerGroup("zhuosheAsk", true)
    job.name = "fangqi"
    exe("ask chen zhanglao about ����")
end
function zhuosheFind()
    EnableTriggerGroup("zhuosheFind", true)
    flag.times = 1
    fight_prepare()
    go(zhuosheFindAct, job.area, job.room)
end
function zhuosheFindAct()
    EnableTriggerGroup("zhuosheFind", true)
    job.flag()
    exe("look")
    find()
    messageShow("׽�����񣺿�ʼѰ�ҡ�" .. dest.area .. dest.room .. "���Ķ��ߣ�")
end
function zhuosheName(n, l, w)
    job.target = Trim(w[2])
    job.killer = {}
    job.killer[job.target] = "du she"
end
function zhuosheTarget()
    dis_all()
    zhuosheFight()
end
function zhuosheFight()
    EnableTriggerGroup("zhuosheFind", false)
    EnableTriggerGroup("zhuosheFight", true)
    EnableTrigger("hpheqi1", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = "du she"
    exe("follow " .. job.id)
    killPfm(job.id)
end
function zhuosheFaint(n, l, w)
    if job.target == w[2] then
        exe("kill " .. job.id)
    end
end
function zhuosheBack(n, l, w)
    job.time.e = os.time()
    job.time.over = job.time.e - job.time.b
    if job.target == w[2] then
        EnableTriggerGroup("zhuosheFight", false)
        EnableTriggerGroup("zhuosheFinish", true)
        DeleteTimer("perform")
        exe("halt;fu bai caodan")
        messageShowT("׽�����񣺸㶨���ߣ�������ʱ:��" .. job.time.over .. "���롣")
        return go(zhuosheReady, "ؤ��", "�յ�")
    end
end
function zhuosheReady()
    exe("e;w")
    checkWait(zhuosheReadyWait, 2)
end
function zhuosheReadyWait()
    exe("e;w")
    checkWait(zhuosheReadyFail, 2)
end
function zhuosheReadyFail()
    exe("e;w")
    checkWait(zhuosheFangqi, 2)
end
function zhuosheFinish()
    EnableTriggerGroup("zhuosheFinish", false)
    dis_all()
    check_bei(zhuosheDan)
end
function zhuosheDan()
    exe("ask chen zhanglao about �ٲݵ�")
    check_bei(zhuosheFudan)
end
function zhuosheFudan()
    exe("fu bai caodan")
    check_bei(zhuosheDan2)
end
function zhuosheDan2()
    exe("ask chen zhanglao about �ٲݵ�")
    check_bei(check_heal)
end

-- thd
function thdTrigger()
    DeleteTriggerGroup("thdAsk")
    create_trigger_t("thdAsk1", "^(> )*������ش����й�", "", "thdAsk")
    create_trigger_t("thdAsk2", "^(> )*����û������ˡ�$", "", "thdNobody")
    SetTriggerOption("thdAsk1", "group", "thdAsk")
    SetTriggerOption("thdAsk2", "group", "thdAsk")
    EnableTriggerGroup("thdAsk", false)
    DeleteTriggerGroup("thdAccept")
    create_trigger_t(
        "thdAccept1",
        "^(> )*��������Ķ�������˵������˵(����|����|����|��ԭ|����|����|�ӱ�|����)(�ݿ�|կ��|���|ɽ��|����|����|����)(\\D*)����(\\D*)����",
        "",
        "thdConsider"
    )
    create_trigger_t("thdAccept2", "^(> )*����˵�������Ҳ��Ǹ���������������", "", "thdFangqi")
    create_trigger_t("thdAccept3", "^(> )*��������Ķ�������˵��(\\D*)��Ϊ�ó�(\\D*)�Ĺ���", "", "thdNpc")
    create_trigger_t("thdAccept4", "^(> )*����˵����������æ�ű��������", "", "thdBusy")
    create_trigger_t("thdAccept5", "^(> )*����˵�������������(�䵱����|�Ͷ�����|��������)����", "", "thdFail")
    create_trigger_t("thdAccept6", "^(> )*����˵������������ʱû���ʺ���Ĺ���", "", "thdBusy")
    create_trigger_t("thdAccept7", "^(> )*����˵��������ʱû��������Ҫ�������һ���������", "", "thdBusy")
    create_trigger_t("thdAccept8", "^(> )*����˵������\\D*����̫����ʧ���ˣ���Ȼ��ô���ɲ��ã������°�", "", "thdFail")
    create_trigger_t("thdAccept9", "^(> )*����˵������\\D*������û��������������Ϲ����ʲôѽ", "", "thdFail")
    SetTriggerOption("thdAccept1", "group", "thdAccept")
    SetTriggerOption("thdAccept2", "group", "thdAccept")
    SetTriggerOption("thdAccept3", "group", "thdAccept")
    SetTriggerOption("thdAccept4", "group", "thdAccept")
    SetTriggerOption("thdAccept5", "group", "thdAccept")
    SetTriggerOption("thdAccept6", "group", "thdAccept")
    SetTriggerOption("thdAccept7", "group", "thdAccept")
    SetTriggerOption("thdAccept8", "group", "thdAccept")
    SetTriggerOption("thdAccept9", "group", "thdAccept")
    EnableTriggerGroup("thdAccept", false)
    DeleteTriggerGroup("thdFight")
    create_trigger_t("thdFight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "thdBack")
    create_trigger_t("thdFight2", "^(> )*(\\D*)��һ�������ã���ת��������Ͳ�����", "", "thdBack")
    create_trigger_t("thdFight3", "^(> )*����û��(\\D*)��", "", "thdLost")
    create_trigger_t("thdFight4", "^(> )*(\\D*)�����㷢��һ����Ц��˵��", "", "thdKillAct")
    create_trigger_t("thdFight5", "^(> )*(\\D*)��һ�������Ӳ������ˣ�ת��������Ͳ�����", "", "thdBack")
    SetTriggerOption("thdFight1", "group", "thdFight")
    SetTriggerOption("thdFight2", "group", "thdFight")
    SetTriggerOption("thdFight3", "group", "thdFight")
    SetTriggerOption("thdFight4", "group", "thdFight")
    SetTriggerOption("thdFight5", "group", "thdFight")
    EnableTriggerGroup("thdFight", false)
    DeleteTriggerGroup("thdFinish")
    create_trigger_t("thdFinish1", "^(> )*���ض��������������ִ�Ĵָ�������ġ�", "", "thdFinish")
    create_trigger_t("thdFinish2", "^(> )*���ر������û��˹�ȥ��", "", "thdFinish")
    create_trigger_t("thdFinish3", "^(> )*����˵������" .. score.name .. "����ô��ģ���Ȼ���Ƕ���������", "", "thdFinish")
    SetTriggerOption("thdFinish1", "group", "thdFinish")
    SetTriggerOption("thdFinish2", "group", "thdFinish")
    SetTriggerOption("thdFinish3", "group", "thdFinish")
    EnableTriggerGroup("thdFinish", false)
end
function thdTriggerDel()
    DeleteTriggerGroup("thdAsk")
    DeleteTriggerGroup("thdAccept")
    DeleteTriggerGroup("thdFight")
    DeleteTriggerGroup("thdFinish")
    DeleteTriggerGroup("thdFind")
end
function thdNobody()
    EnableTriggerGroup("thdAsk", false)
    thd()
end
function thd()
    thdTrigger()
    job.name = "thd"
    job.time.b = os.time()
    prepare_lianxi(thdGo)
end
function thdGo()
    go(thdStart, "�һ���", "����")
end
function thdStart()
    EnableTriggerGroup("thdAsk", true)
    exe("ask song yuanqiao about job")
end
function thdAsk()
    EnableTriggerGroup("thdAsk", false)
    EnableTriggerGroup("thdAccept", true)
end

-- sldsm
function sldsmTrigger()
    DeleteTriggerGroup("sldsmAsk")
    create_trigger_t("sldsmAsk1", "^(> )*����鰲ͨ�����й�", "", "sldsmAsk")
    create_trigger_t("sldsmAsk2", "^(> )*����û������ˡ�$", "", "sldsmNobody")
    SetTriggerOption("sldsmAsk1", "group", "sldsmAsk")
    SetTriggerOption("sldsmAsk2", "group", "sldsmAsk")
    EnableTriggerGroup("sldsmAsk", false)
    DeleteTriggerGroup("sldsmAccept")
    create_trigger_t("sldsmAccept1", "^(> )*�鰲ͨ˵������(\\D*)���뱾�����ԣ�����ȥ(\\D*)����ɱ�ˣ�", "", "sldsmConsiderK")
    create_trigger_t("sldsmAccept2", "^(> )*�鰲ͨ˵����������������ȥ(\\D*)�跨��(\\D*)��˳���̣���", "", "sldsmConsiderZ")
    create_trigger_t("sldsmAccept3", "^(> )*�鰲ͨ˵���������Ȱ�ǰһ�����������˵����", "", "sldsmFangqi")
    create_trigger_t("sldsmAccept4", "^(> )*�鰲ͨ˵��������С�Ӿ���͵͵���������ɵ����񣬻����������������ȥô", "", "sldsmBusy")
    create_trigger_t("sldsmAccept5", "^(> )*�鰲ͨ˵���������������������Ϣһ�°ɡ���", "", "sldsmFail")
    create_trigger_t("sldsmAccept6", "^(> )*�鰲ͨ˵������������Ϣһ�°ɡ�", "", "sldsmBusy")
    create_trigger_t("sldsmAccept7", "^(> )*�鰲ͨ˵��������ô�������뿹�����ɣ���", "", "sldsmBusy")
    create_trigger_t("sldsmAccept8", "^(> )*�鰲ͨ˵��������ô�����鶼�첻�ˣ�Ҫ����������֮�˺��ã���", "", "sldsmBusy")
    create_trigger_t("sldsmAccept9", "^(> )*�鰲ͨ˵��������������ο��������ǲ��ǲ����", "", "sldsmHeiw")
    create_trigger_t("sldsmAccept10", "^(> )*�鰲ͨ˵����������û����������������ɡ���", "", "sldsmBusy")
    SetTriggerOption("sldsmAccept1", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept2", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept3", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept4", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept5", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept6", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept7", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept8", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept9", "group", "sldsmAccept")
    SetTriggerOption("sldsmAccept10", "group", "sldsmAccept")
    EnableTriggerGroup("sldsmAccept", false)
    DeleteTriggerGroup("sldsmFight")
    create_trigger_t("sldsmFight1", "^(> )*(\\D*)��ž����һ�����ڵ���", "", "sldsmDie")
    create_trigger_t("sldsmFight2", "^(> )*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "sldsmFaint")
    create_trigger_t("sldsmFight3", "^(> )*����û��(\\D*)��", "", "sldsmLost")
    create_trigger_t("sldsmFight4", "^(> )*(\\D*)���ڵأ��ߺ������������ͨ���ս�޲�ʤ��", "", "sldsmFlop")
    create_trigger_t("sldsmFight5", "^(> )*û��������������˹�˳ѽ!", "", "sldsmZhNext")
    SetTriggerOption("sldsmFight1", "group", "sldsmFight")
    SetTriggerOption("sldsmFight2", "group", "sldsmFight")
    SetTriggerOption("sldsmFight3", "group", "sldsmFight")
    SetTriggerOption("sldsmFight4", "group", "sldsmFight")
    SetTriggerOption("sldsmFight5", "group", "sldsmFight")
    EnableTriggerGroup("sldsmFight", false)
end
function sldsmTriggerDel()
    DeleteTriggerGroup("sldsmAsk")
    DeleteTriggerGroup("sldsmAccept")
    DeleteTriggerGroup("sldsmFight")
    DeleteTriggerGroup("sldsmFind")
end
function sldsmNobody()
    EnableTriggerGroup("sldsmAsk", false)
    sldsm()
end
function sldsm()
    sldsmTrigger()
    job.name = "sldsm"
    prepare_neili(sldsmGo)
end
function sldsmGo()
    go(sldsmStart, "������", "����")
end
function sldsmStart()
    EnableTriggerGroup("sldsmAsk", true)
    exe("ask hong antong about job")
end
function sldsmAsk()
    EnableTriggerGroup("sldsmAsk", false)
    EnableTriggerGroup("sldsmAccept", true)
end
function sldsmBusy()
    EnableTriggerGroup("sldsmAccept", false)
    check_bei(sldsmBusyDazuo)
end
function sldsmBusyDazuo()
    if not Bag["��ϥ"] then
        exe("ask shou toutuo about ��ϥ")
    end
    prepare_lianxi(sldsmStart)
end
function sldsmFail()
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    check_heal()
end
function sldsmHeiw()
    EnableTriggerGroup("sldsmAccept", false)
end
function sldsmConsiderK(n, l, w)
    job.time.b = os.time()
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    job.target = Trim(w[2])
    job.id = nil
    job.sldtime = os.time()
    job.type = "sm"
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[3])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if string.find(sldsmCancel, job.target) then
        messageShow("������������Ŀ�꡾" .. job.target .. "�����ɵ�����������")
        return check_pot(1)
    end
    if not job.room or not path_cal() then
        messageShow("������������ص㡾" .. job.where .. "�����ɵ�����������")
        return check_pot(1)
    end
    check_bei(sldsmFind)
    exe("nick ��������" .. job.where)
    messageShow("�������񣺿�ʼǰ����" .. job.where .. "��������" .. job.target .. "����")
end
function sldsmConsiderZ(n, l, w)
    EnableTriggerGroup("sldsmAccept", false)
    job.last = "sldsm"
    job.target = Trim(w[3])
    job.id = nil
    job.sldtime = os.time()
    job.type = "zh"
    job.killer = {}
    job.killer[job.target] = true
    job.where = Trim(w[2])
    job.where = addrTrim(job.where)
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    if string.find(sldsmCancel, job.target) then
        messageShow("������������Ŀ�꡾" .. job.target .. "�����ɵ�����������")
        return check_pot(1)
    end
    if not job.room or not path_cal() then
        messageShow("������������ص㡾" .. job.where .. "�����ɵ�����������")
        return check_pot(1)
    end
    check_bei(sldsmFind)
    exe("nick ��������" .. job.where)
    messageShow("�������񣺿�ʼǰ����" .. job.where .. "���л꡾" .. job.target .. "����")
end
function sldsmFangqiGo()
    go(sldsmFangqi, "������", "����")
end
function sldsmFangqi()
    EnableTriggerGroup("sldsmAccept", false)
    if job.sldtime and os.time() - job.sldtime < 600 then
        return prepare_lianxi(sldsmFangqi)
    end
    check_bei(sldsmFangqiAsk)
end
function sldsmFangqiAsk()
    EnableTriggerGroup("sldsmAsk", true)
    exe("ask hong antong about cancel")
end
function sldsmFind()
    DeleteTriggerGroup("sldsmFind")
    create_trigger_t("sldsmFind1", "^(> )*\\D*" .. job.target .. "\\((\\D*)\\)", "", "sldsmTarget")
    SetTriggerOption("sldsmFind1", "group", "sldsmFind")
    EnableTrigger("sldsmFind1", false)
    flag.times = 1
    fight_prepare()
    go(sldsmFindAct, job.area, job.room)
end
function sldsmFindAct()
    EnableTriggerGroup("sldsmFind", true)
    job.flag()
    exe("look")
    find()
    messageShow("�������񣺿�ʼѰ�ҡ�" .. dest.area .. dest.room .. "����" .. "��" .. job.target .. "����")
end
function sldsmTarget(n, l, w)
    EnableTriggerGroup("sldsmFind", false)
    EnableTriggerGroup("sldsmFight", true)
    EnableTrigger("hpheqi1", true)
    flag.wait = 0
    flag.find = 1
    thread_resume(lookfor)
    job.id = string.lower(w[2])
    job.killer[job.target] = job.id
    exe("halt;follow " .. job.id)
    if job.type and job.type == "zh" then
        killPfm(job.id, "zh")
    else
        killPfm(job.id)
    end
end
function sldsmZh(n, l, w, styles)
    local l_flag = false
    for _, v in ipairs(styles) do
        -- Note(v.text,RGBColourToName (v.textcolour))
        if RGBColourToName(v.textcolour) == "maroon" then
            l_flag = true
        end
    end
    if flag and job.id then
        exe("zh " .. job.id)
    end
end
function sldsmZhNext()
    job.id = job.id .. " 2"
    exe("follow " .. job.id)
end
function sldsmFaint(n, l, w)
    if job.target == w[2] then
        if job.type and job.type == "zh" then
            exe("halt")
        else
            exe("kill " .. job.id)
        end
    end
end
function sldsmDie(n, l, w)
    if job.target == w[2] then
        if job.type and job.type == "zh" then
            exe("follow " .. job.id)
        else
            check_bei(sldsmSm)
        end
    else
        if job.type and job.type == "sm" then
            exe("kill " .. job.id)
        end
    end
end
function sldsmFlop(n, l, w)
    if job.target == w[2] then
        return sldsmFinish()
    end
end
function sldsmSm()
    exe("halt")
    for i = 1, 3 do
        exe("sm corpse " .. i)
    end
    return sldsmFinish()
end
function sldsmLost(n, l, w)
    if job.id == Trim(w[2]) then
        dis_all()
        return sldsmFind()
    end
end
function sldsmFinish()
    EnableTriggerGroup("sldsmFight", false)
    DeleteTimer("perform")
    messageShow("��������������ɣ�")
    return go(check_heal, "������", "ҩ��")
end

-- tmonk
function tmonkTrigger()
    DeleteTriggerGroup("tmonkFollow")
    create_trigger_t("tmonkFollow1", "^(> )*������������Ѵ�ʦһ���ж���", "", "tmonkFollow")
    create_trigger_t("tmonkFollow2", "^(> )*����û�� xuancan dashi��$", "", "tmonkNobody")
    SetTriggerOption("tmonkFollow1", "group", "tmonkFollow")
    SetTriggerOption("tmonkFollow2", "group", "tmonkFollow")
    EnableTriggerGroup("tmonkFollow", false)
    DeleteTriggerGroup("tmonkAsk")
    create_trigger_t("tmonkAsk1", "^(> )*�������Ѵ�ʦ�����й�", "", "tmonkAsk")
    create_trigger_t("tmonkAsk2", "^(> )*����û������ˡ�$", "", "tmonkNobody")
    SetTriggerOption("tmonkAsk1", "group", "tmonkAsk")
    SetTriggerOption("tmonkAsk2", "group", "tmonkAsk")
    EnableTriggerGroup("tmonkAsk", false)
    DeleteTriggerGroup("tmonkAccept")
    create_trigger_t("tmonkAccept1", "^(> )*���Ѵ�ʦ˵��������ղŲ����Ѿ��ʹ�����", "", "tmonkStart")
    create_trigger_t("tmonkAccept2", "^(> )*���Ѵ�ʦ˵������������æ�������������ء�", "", "tmonkBusy")
    create_trigger_t("tmonkAccept3", "^(> )*���Ѵ�ʦ˵���������ѵ����ɮ��������������Ϣһ��ɡ�", "", "tmonkFangqi")
    create_trigger_t("tmonkAccept4", "^(> )*���Ѵ�ʦ˵��������������æ��������������", "", "tmonkBusy")
    create_trigger_t("tmonkAccept5", "^(> )*���Ѵ�ʦ˵������\\D*���۷����䣬�������", "", "tmonkGuilty")
    create_trigger_t("tmonkAccept6", "^(> )*����˵�����ðɣ�������޺�����ѵ����ɮ", "", "tmonkStart")
    SetTriggerOption("tmonkAccept1", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept2", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept3", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept4", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept5", "group", "tmonkAccept")
    SetTriggerOption("tmonkAccept6", "group", "tmonkAccept")
    EnableTriggerGroup("tmonkAccept", false)
    DeleteTriggerGroup("tmonkFind")
    create_trigger_t("tmonkFind1", "^^(> )*\\D*���Ѵ�ʦ\\((\\D*)\\)", "", "tmonkDashi")
    SetTriggerOption("tmonkFind1", "group", "tmonkFind")
    EnableTriggerGroup("tmonkFind", false)
    DeleteTriggerGroup("tmonkWujiAsk")
    create_trigger_t("tmonkWujiAsk1", "^(> )*����Բ(��|ҵ|��|��|��|��)���д����й�", "", "tmonkWujiAsk")
    create_trigger_t("tmonkWujiAsk2", "^(> )*����û������ˡ�$", "", "tmonkWujiNobody")
    SetTriggerOption("tmonkWujiAsk1", "group", "tmonkWujiAsk")
    SetTriggerOption("tmonkWujiAsk2", "group", "tmonkWujiAsk")
    EnableTriggerGroup("tmonkWujiAsk", false)
    DeleteTriggerGroup("tmonkWujiReply")
    create_trigger_t("tmonkWujiReply1", "^(> )*Բ(��|ҵ|��|��|��|��)����˵����������ɲ�����˵��", "", "tmonkFinish")
    create_trigger_t("tmonkWujiReply2", "^(> )*Բ(��|ҵ|��|��|��|��)����һ�����ص�", "", "tmonkWujiNobody")
    create_trigger_t("tmonkWujiReply3", "^(> )*Բ(��|ҵ|��|��|��|��)���������ؿ�����", "", "tmonkWujiNobody")
    create_trigger_t("tmonkWujiReply4", "^(> )*Բ(��|ҵ|��|��|��|��)����˵������Сɮ��ѧ", "", "tmonkTeachStart")
    SetTriggerOption("tmonkWujiReply1", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply2", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply3", "group", "tmonkWujiReply")
    SetTriggerOption("tmonkWujiReply4", "group", "tmonkWujiReply")
    EnableTriggerGroup("tmonkWujiReply", false)
    DeleteTriggerGroup("tmonkTeach")
    create_trigger_t("tmonkTeach1", "^(> )*�㻹����ȥ�����Ѵ�ʦ�����к��ɡ�", "", "tmonkFinish")
    create_trigger_t("tmonkTeach2", "^(> )*Բ(��|ҵ|��|��|��|��)����˵������������", "", "tmonkWujiNobody")
    create_trigger_t("tmonkTeach3", "^(> )*�����Ϊ���������أ�������ң�", "", "tmonkWujiKill")
    create_trigger_t("tmonkTeach4", "^(> )*Բ(��|ҵ|��|��|��|��)����̫���ˣ�����û�а취ѧ��", "", "tmonkChange")
    create_trigger_t("tmonkTeach5", "^(> )*Բ(��|ҵ|��|��|��|��)������æ���ء�", "", "tmonkChange")
    create_trigger_t("tmonkTeach6", "^(> )*��(��æ���ء�|���Ľ�������)", "", "tmonkContinue")
    create_trigger_t("tmonkTeach7", '^(> )*��� "action" �趨Ϊ "teach" �ɹ���ɡ�$', "", "tmonkTeachCon")
    create_trigger_t("tmonkTeach8", "^(> )*(\\D*)�����Աߣ����޷�ר��ָ�㡣", "", "tmonkChange")
    create_trigger_t("tmonkTeach9", "^(> )*Բ(��|ҵ|��|��|��|��)����������ܣ�һ�������(\\D*)��ȥ", "", "tmonkMotou")
    SetTriggerOption("tmonkTeach1", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach2", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach3", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach4", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach5", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach6", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach7", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach8", "group", "tmonkTeach")
    SetTriggerOption("tmonkTeach9", "group", "tmonkTeach")
    EnableTriggerGroup("tmonkTeach", false)
    DeleteTriggerGroup("tmonkMotouFind")
    create_trigger_t("tmonkMotouFind1", "^^(> )*а��ħͷ�߾���ȭ��������", "", "tmonkMotouKill")
    SetTriggerOption("tmonkMotouFind1", "group", "tmonkMotouFind")
    EnableTriggerGroup("tmonkMotouFind", false)
    DeleteTriggerGroup("tmonkFight")
    create_trigger_t("tmonkFight1", "^(> )*а��ħͷ��ž����һ�����ڵ���", "", "tmonkDie")
    create_trigger_t("tmonkFight2", "^(> )*а��ħͷ��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "tmonkFaint")
    SetTriggerOption("tmonkFight1", "group", "tmonkFight")
    SetTriggerOption("tmonkFight2", "group", "tmonkFight")
    EnableTriggerGroup("tmonkFight", false)
end
function tmonkTriggerDel()
    DeleteTriggerGroup("tmonkFollow")
    DeleteTriggerGroup("tmonkAsk")
    DeleteTriggerGroup("tmonkAccept")
    DeleteTriggerGroup("tmonkFight")
    DeleteTriggerGroup("tmonkFind")
    DeleteTriggerGroup("tmonkWujiAsk")
    DeleteTriggerGroup("tmonkWujiReply")
    DeleteTriggerGroup("tmonkTeach")
    DeleteTriggerGroup("tmonkMotouFind")
end
job.list["tmonk"] = "���ֽ̺���"
function tmonk()
    job.name = "tmonk"
    tm = tm or {}
    tmroom = {}
    tmroom["shaolin/wstang1"] = true
    tmroom["shaolin/wstang2"] = true
    tmroom["shaolin/wstang3"] = true
    tmroom["shaolin/wstang4"] = true
    tmroom["shaolin/wstang5"] = true
    tmroom["shaolin/wstang6"] = true
    for p in pairs(tm) do
        tmroom[p] = nil
    end
    tmonkTrigger()
    messageShow("Tmonk��������ʼ��", "green")
    job.findAgain = tmonkFindAgain
    return prepare_neili(tmonkGuilty)
end
function tmonkFindAgain()
    EnableTriggerGroup("tmonkFind", false)
    EnableTriggerGroup("tmonkMotouFind", false)
    return go(find, dest.area, dest.room)
end
function tmonkGo()
    return go(tmonkXuancan, "��ɽ����", "������")
end
function tmonkXuancan()
    EnableTriggerGroup("tmonkFind", true)
    job.flag()
    return find()
end
function tmonkDashi()
    flag.find = 1
    dis_all()
    EnableTriggerGroup("tmonkFind", false)
    EnableTriggerGroup("tmonkFollow", true)
    exe("follow xuancan dashi")
end
function tmonkNobody()
    EnableTriggerGroup("tmonkFollow", false)
    EnableTriggerGroup("tmonkAsk", false)
    return go(tmonkXuancan, "��ɽ����", "������")
end
function tmonkFollow()
    EnableTriggerGroup("tmonkFollow", false)
    EnableTriggerGroup("tmonkAsk", true)
    exe("ask xuancan dashi about �޺���ֵ��")
end
function tmonkAsk()
    EnableTriggerGroup("tmonkAsk", false)
    EnableTriggerGroup("tmonkAccept", true)
    exe("follow none")
end
function tmonkGuilty()
    EnableTriggerGroup("tmonkAccept", false)
    if
        score.party and score.party == "������" and score.master == "������ɮ" and skills["buddhism"] and
            skills["buddhism"].lvl == 200
     then
        return go(tmonkFofa, "��ɽ����", "����")
    end
    return go(tmonkCh, "��ɽ����", "����Ժ")
end
function tmonkFofa()
    exe("ask wuming about ��")
    return tmonkGo()
end
function tmonkCh()
    checkWait(tmonkGo, 2)
end
function tmonkFangqi()
    EnableTriggerGroup("tmonkAccept", false)
    job.last = "tmonk"
    return check_heal()
end
function tmonkBusy()
    EnableTriggerGroup("tmonkAccept", false)
    return prepare_lianxi(tmonk)
end
function tmonkStart()
    EnableTriggerGroup("tmonkAccept", false)
    job.last = "tmonk"
    if countTab(tm) > 0 then
        local l_id
        for p in pairs(tm) do
            l_id = p
        end
        return go(tmonkWuji, l_id)
    else
        return go(tmonkWuji, "shaolin/wstang1")
    end
end
function tmonkWuji()
    EnableTriggerGroup("tmonkWujiAsk", true)
    exe("ask monk about �似")
end
function tmonkWujiAsk()
    EnableTriggerGroup("tmonkWujiAsk", false)
    EnableTriggerGroup("tmonkWujiReply", true)
end
function tmonkWujiNobody()
    EnableTriggerGroup("tmonkWujiReply", false)
    EnableTriggerGroup("tmonkWujiAsk", false)
    EnableTriggerGroup("tmonkTeach", false)
    tm[road.id] = nil
    tmroom[road.id] = nil
    return check_bei(tmonkWujiFind)
end
function tmonkWujiFind()
    if countTab(tmroom) == 0 then
        if countTab(tm) == 0 then
            return tmonkFinish()
        else
            return tmonkStart()
        end
    else
        local l_id
        for p in pairs(tmroom) do
            l_id = p
        end
        return go(tmonkWuji, l_id)
    end
end
function tmonkChange()
    tmchg = true
end
function tmonkChgMonk()
    EnableTriggerGroup("tmonkTeach", false)
    if countTab(tm) > 1 then
        local l_id
        for p in pairs(tm) do
            if p ~= road.id then
                l_id = p
            end
        end
        if l_id then
            return go(tmonkTeach, l_id)
        else
            return tmonkWujiFind()
        end
    else
        if countTab(tmroom) == 0 then
            return check_bei(tmonkTeach)
        else
            return tmonkWujiFind()
        end
    end
end
function tmonkTeachStart()
    EnableTriggerGroup("tmonkWujiReply", false)
    tm[road.id] = true
    tmroom[road.id] = nil
    return check_bei(tmonkTeach)
end
function tmonkTeach()
    EnableTriggerGroup("tmonkTeach", true)
    tmcon = nil
    tmchg = nil
    exe("yun jing;#2(teach monk)")
    exe("alias action teach")
end
function tmonkTeachCon()
    EnableTriggerGroup("tmonkTeach", false)
    if tmchg then
        return tmonkChgMonk()
    end
    if tmcon then
        return check_bei(tmonkTeach)
    else
        return tmonkWujiNobody()
    end
end
function tmonkContinue()
    tmcon = true
end
function tmonkWujiKill()
    EnableTriggerGroup("tmonkTeach", false)
    return wipe("monk", tmonkWujiNobody)
end
function tmonkMotou(n, l, w)
    EnableTriggerGroup("tmonkTeach", false)
    dest.room = Trim(w[3])
    dest.area = "��ɽ����"
    road.idold = road.id
    if not dest.room or not path_cal() then
        messageShow("Teach����ħͷ���ֵص㡾" .. dest.area .. dest.room .. "�����ɵ������MONK!")
        road.id = road.idold
        return tmonkWujiNobody()
    else
        messageShow("Tmonk����а��ħͷ������" .. dest.room .. "��", "green")
        return tmonkMotouFind()
    end
end
function tmonkMotouFind()
    EnableTriggerGroup("tmonkMotouFind", true)
    return go(find, dest.area, dest.room)
end
function tmonkMotouKill()
    flag.find = 1
    dis_all()
    EnableTrigger("hpheqi1", true)
    EnableTriggerGroup("tmonkFight", true)
    exe("set wimpy 100")
    exe("kill mo tou")
    job.killer["а��ħͷ"] = "mo tou"
end
function tmonkFaint()
    exe("unset wimpy")
    exe("kill mo tou")
end
function tmonkDie()
    EnableTriggerGroup("tmonkFight", false)
    messageShow("Tmonk���񣺸㶨а��ħͷ��", "green")
    return check_bei(tmonkGet)
end
function tmonkGet()
    for i = 1, 3 do
    end
    checkBags()
    return check_busy(tmonkMuou)
end
function tmonkMuou()
    if Bag["ʮ��ľż"] then
        messageShow("Tmonk���������ܺã��㵽ʮ��ľż��", "green")
        return go(tmonkMuouGive, "��ɽ����", "������")
    else
        return tmonkStart()
    end
end
function tmonkMuouGive()
    exe("give muou to xuanci dashi")
    return tmonkStart()
end
function tmonkFinish()
    messageShow("Tmonk����������ɡ�", "green")
    return check_heal()
end

zhunbeineili = function(func, p_cmd)
    if func ~= nil then
        job.prepare = func
    else
        job.prepare = test
    end
    if hp.neili >= hp.neili_max * 1.5 then
        return check_bei(job.prepare)
    end

    DeleteTriggerGroup("zbneili")
    create_trigger_t(
        "zbneili1",
        "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",
        "",
        "zhunbeineili_b"
    )
    create_trigger_t("zbneili3", "^(> )*���Ҳ���(����|����)����Ӱ�������Ϣ��", "", "zbneili_w")
    create_trigger_t("zbneili4", "^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)", "", "zbneili_w")
    create_trigger_t("zbneili5", "^(> )*���ﲻ׼ս����Ҳ��׼(����|����)��", "", "zbneili_w")
    create_trigger_t("zbneili2", "^(> )*����ɲ����������(����|����)�ĵط���", "", "zbneili_w")
    SetTriggerOption("zbneili1", "group", "zbneili")
    SetTriggerOption("zbneili2", "group", "zbneili")
    SetTriggerOption("zbneili3", "group", "zbneili")
    SetTriggerOption("zbneili4", "group", "zbneili")
    SetTriggerOption("zbneili5", "group", "zbneili")
    exe("yun jing;yun jingli;yun qi;hp")
    zhunbeineili_a()
end
zbneili_w = function()
    locate()
    check_bei(zbneili_g)
end
zbneili_g = function()
    exe(locl.dir)
    checkWait(zhunbeineili_a, 1)
end
zhunbeineili_a = function()
    if hp.qixue_per < 50 and isInBags(drug.heal) then
        exe("eat chantui yao")
    end
    exe("set ����")
    exe("dazuo " .. hp.dazuo)
end
zhunbeineili_b = function()
    if mydummy == true then
        EnableTriggerGroup("zbneili", false)
        DeleteTriggerGroup("zbneili")
        return dummyfind()
    end
    exe("yun qi;hp")
    check_bei(zhunbeineili_c)
end
zhunbeineili_c = function()
    if hp.neili >= hp.neili_max * 1.5 then
        EnableTriggerGroup("zbneili", false)
        DeleteTriggerGroup("zbneili")
        exe("yun jing;yun qi;yun jingli")
        check_bei(job.prepare)
    else
        zhunbeineili_a()
    end
end

function pfmjineng()
    -- print(sxjob.skills)
    if skillsjineng1[sxjob.skills] then
        exe("pfmzhen")
    end
    if skillsjineng2[sxjob.skills] then
        exe("pfmqi")
    end
    if skillsjineng3[sxjob.skills] then
        exe("pfmgang")
    end
    if skillsjineng4[sxjob.skills] then
        exe("pfmrou")
    end
    if skillsjineng5[sxjob.skills] then
        exe("pfmkuai")
    end
    if skillsjineng6[sxjob.skills] then
        exe("pfmman")
    end
    if skillsjineng7[sxjob.skills] then
        exe("pfmmiao")
    end
    if skillsjineng8[sxjob.skills] then
        exe("pfmxian")
    end
    if skillsjineng9[sxjob.skills] then
        exe("pfmmrjf")
    end
    if skillsjineng10[sxjob.skills] then
        exe("pfmshlf")
    end
    if skillsjineng11[sxjob.skills] then
        exe("pfmwu")
    end
end

function messageShow(p_msg, ccolor, bcolor)
    local c_color = ccolor or "white"
    local b_color = bcolor or "green"

    if isNil(p_msg) then
        return
    end

    if GetVariable("flagnote") then
        flag.note = tonumber(GetVariable("flagnote"))
    end
    if flag.note and flag.note == 1 then
        if flag.log and flag.log == "yes" then
            chats_log(p_msg, c_color, b_color)
        else
            ColourNote("white", "black", p_msg)
        end
    else
        chats_log(p_msg, c_color, b_color)
    end
end
function messageShowT(p_msg, ccolor, bcolor)
    local c_color = ccolor or "yellow"
    local b_color = bcolor or "green"

    if isNil(p_msg) then
        return
    end

    chats_log(p_msg, c_color, b_color)
end

function setJobwhere(p)
    job.where = p
end

function scrLog()
    local filename = GetInfo(67) .. "logs\\" .. score.id .. "����" .. os.date("%Y%m%d_%Hʱ%M��%S��") .. ".log"

    local file = io.open(filename, "w")

    local t = {}

    for i = 1, GetLinesInBufferCount() do
        table.insert(t, GetLineInfo(i, 1))
    end

    local s = table.concat(t, "\n") .. "\n"

    file:write(s)

    file:close()
end
function dieLog()
    local filename = GetInfo(67) .. "logs\\" .. score.id .. "����" .. os.date("%Y%m%d_%Hʱ%M��%S��") .. ".log"

    local file = io.open(filename, "w")

    local t = {}

    for i = 1, GetLinesInBufferCount() do
        table.insert(t, GetLineInfo(i, 1))
    end

    local s = table.concat(t, "\n") .. "\n"

    file:write(s)

    file:close()
end

-- ---------------------------------------------------------------
-- job�л�����ʵ�ַ��� -- ����ʵ��
-- ---------------------------------------------------------------
function checkJob()
    -- if hp.exp>2000000 then job.zuhe["zhuoshe"]=nil end
    -- if hp.shen>0 or hp.exp>6000000 then job.zuhe["songshan"]=nil end
    if job.zuhe["songxin2"] then
        job.zuhe["songxin2"] = nil
        job.zuhe["songxin"] = true
        flag.sx2 = true
    end
    if job.last and job.zuhe[job.last] then
        if type(job.zuhe[job.last]) == "number" then
            job.zuhe[job.last] = job.zuhe[job.last] + 1
        else
            job.zuhe[job.last] = 1
        end
    end
    if
        countTab(job.zuhe) > 2 and not skills["xixing-dafa"] and job.zuhe["huashan"] and job.zuhe["wudang"] and
            jobtimes["��ɽ����Ⱥ�Ͷ�����"] and
            jobtimes["�䵱��Զ��ɱ����"]
     then
        local t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
        local t_wd = jobtimes["�䵱��Զ��ɱ����"]
        local t_times = math.fmod((t_hs + t_wd), 50)
        if t_times > 48 then
            exe("pray pearl")
            if job.last ~= "huashan" then
                return huashan()
            else
                for p in pairs(job.zuhe) do
                    if p ~= "huashan" and p ~= "wudang" and p ~= "hubiao" and p ~= "husong" and p ~= "songmoya" then
                        return _G[p]()
                    end
                end
            end
        end
    end
    if
        score.party and score.party == "��ɽ��" and countTab(job.zuhe) > 2 and not skills["dugu-jiujian"] and
            job.zuhe["huashan"] and
            job.zuhe["songxin"]
     then
        local t_hs, t_sx, t_gb

        if jobtimes["��ɽ����Ⱥ�Ͷ�����"] then
            t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
        else
            t_hs = 0
        end
        if jobtimes["����������������"] then
            t_sx = jobtimes["����������������"]
        else
            t_sx = 0
        end
        if jobtimes["ؤ���ⳤ��ɱ������"] then
            t_gb = jobtimes["ؤ���ⳤ��ɱ������"]
        else
            t_gb = 0
        end
        local t_times = math.fmod((t_hs + t_sx + t_gb), 50)
        if t_times > 47 then
            exe("pray pearl")
            if job.last ~= "huashan" then
                return huashan()
            else
                for p in pairs(job.zuhe) do
                    if p ~= "huashan" and p ~= "songxin" and p ~= "hubiao" and p ~= "husong" and p ~= "songmoya" then
                        return _G[p]()
                    end
                end
            end
        end
    end

    if job.third and job.zuhe[job.third] and job.last ~= job.third then
        if job.second and job.last == job.second then
            if job.third == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
                return _G[job.third]()
            end
            if job.third ~= "wudang" and job.third ~= "songmoya" then
                return _G[job.third]()
            end
        end
    end
    if job.first and job.zuhe[job.first] and job.last ~= job.first then
        if job.first ~= "xueshan" and job.first ~= "wudang" and job.first ~= "songmoya" then
            return _G[job.first]()
        end
        if job.first == "xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.first]()
        end
        if job.first == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
            return _G[job.first]()
        end
        if job.first == "xueshan" and condition.xueshan and condition.busy and condition.busy >= condition.xueshan then
            return _G[job.first]()
        end
    end
    if job.second and job.zuhe[job.second] and job.last ~= job.second then
        if job.second ~= "xueshan" and job.second ~= "wudang" and job.second ~= "songmoya" then
            return _G[job.second]()
        end
        if job.second == "xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan <= 0)) then
            return _G[job.second]()
        end
        if job.second == "wudang" and (not job.wdtime or job.wdtime <= os.time()) then
            return _G[job.second]()
        end
        if job.second == "xueshan" and condition.xueshan and condition.busy and condition.busy >= condition.xueshan then
            return _G[job.second]()
        end
    end

    for p in pairs(job.zuhe) do
        if job.last ~= p and job.first ~= p and job.second ~= p and p ~= "songmoya" then
            return _G[p]()
        end
    end

    for p in pairs(job.zuhe) do
        if job.last ~= p and p ~= "songmoya" then
            return _G[p]()
        end
    end
    if job.zuhe["xueshan"] and job.last ~= "xueshan" then
        return xueshan()
    end
    if job.zuhe["huashan"] and job.last ~= "huashan" then
        return huashan()
    end
    if job.zuhe["tmonk"] and job.last ~= "tmonk" then
        return tmonk()
    end
    if job.zuhe["wudang"] and job.last ~= "wudang" then
        return wudang()
    end
    if job.zuhe["songxin"] and job.last ~= "songxin" then
        return songxin()
    end
    if job.zuhe["gaibang"] and job.last ~= "gaibang" then
        return gaibang()
    end
    if job.zuhe["zhuoshe"] and job.last ~= "zhuoshe" then
        return zhuoshe()
    end
    if job.zuhe["sldsm"] and job.last ~= "sldsm" then
        return sldsm()
    end
    if job.zuhe["songshan"] and job.last ~= "songshan" then
        return songshan()
    end
    if job.last ~= "songxin" then
        return songxin()
    end
    if job.last ~= "xueshan" and hp.shen < 0 then
        return xueshan()
    end
    if job.last ~= "wudang" and hp.shen > 100000 then
        return wudang()
    end
    if job.last ~= "gaibang" and hp.exp < 2000000 and hp.shen > 0 then
        return gaibang()
    end
    if job.last ~= "songshan" and hp.shen < 0 and hp.exp < 2000000 then
        return songshan()
    end
end
-- ---------------------------------------------------------------
-- ����ͳ�� ����������1
-- ---------------------------------------------------------------
function job.statistics_JobTimePlus()
    job.statistics.Times = job.statistics.Times + 1
    job.statistics_Update()
end
-- ---------------------------------------------------------------
-- job�л�����ʵ�ַ���
-- ---------------------------------------------------------------
function job.Switch()
    -- ִ������������1
    job.statistics_JobTimePlus()

    -- ---------------------------------------------------------------
    -- ��������, �޴���
    -- ---------------------------------------------------------------

    -- �Զ���ȡ��Ա����
    if Vip.CheckGetBenefit() then
        return Vip.GetBenefit()
    end

    -- �Զ� ����¥
    if dml_CheckAutoDML() then
        return dml_AutoStart()
    end

    -- �Զ� ��̳�տ�
    Miner.AutoMine()

    -- �Զ� 10�κ��߹�����
    if CheckAutohqgzc() then
        return hqgzc()
    end

    -- ---------------------------------------------------------------
    -- �������񲿷����ж�
    -- ---------------------------------------------------------------
    if xcexp == 0 and hp.exp < 1000000 then
        print("Ѳ�ǵ�1M")
        kdummy = 0
        return xunCheng()
    end
    if xcexp == 1 and hp.exp < 2000000 then
        print("Ѳ�ǵ�2M")
        kdummy = 0
        return xunCheng()
    end
    if score.party == "�һ���" and (hp.shen > 150000 or hp.shen < -150000) then
        return thdJiaohui()
    end
    -- ---------------------------------------------------------------
    -- �ɳ��׶�����
    -- ---------------------------------------------------------------
    -- ���������, ���ڽ�ʡÿ������������ж�, һЩ�жϸ�Ϊÿ��������(10��)����һ�μ��
    job.group.times = job.group.times + 1

    for p in pairs(weaponUsave) do
        if Bag and not Bag[p] then
            job.zuhe["songmoya"] = nil
        end
    end
    if fqyytmp.goArmorD == 1 then
        return fqyyArmorGoCheck()
    end
    if job.zuhe == nil then
        job.zuhe = {}
    end
    if job.zuhe["zhuoshe"] and score.party ~= "ؤ��" then
        job.zuhe["zhuoshe"] = nil
    end
    if job.zuhe["sldsm"] and score.party ~= "������" then
        job.zuhe["sldsm"] = nil
    end
    if job.zuhe["songmoya"] and hp.exp < 5000000 then
        job.zuhe["songmoya"] = nil
    end
    if smydie * 1 >= smyall * 1 then
        job.zuhe["songmoya"] = nil
    end
    if job.zuhe["husong"] and (score.party ~= "������" or hp.exp < 2000000) then
        job.zuhe["husong"] = nil
    end
    if job.zuhe["songmoya"] and job.last ~= "songmoya" and mytime <= os.time() then
        return songmoya()
    end
    if job.zuhe["hubiao"] and job.last ~= "hubiao" and job.teamname and
            ((not condition.hubiao) or (condition.hubiao and condition.hubiao <= 0))
     then
        return hubiao()
    elseif job.zuhe["husong"] then
        return husong()
    else
        return checkJob()
    end
end
