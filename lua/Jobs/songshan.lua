--songshan
-- ���������������йء�cancel������Ϣ��
--������˵��������Ȼ��ɲ���Ҳû��ϵ����ȥ�̿������ɣ��Ժ�����Ϊ���ǵĲ��ɴ�Ƴ�������

--> ��������������˵�ͷ��
--������������������Ц������
--����������ǰȥ�������ؽ�����ס���ƹ��˫�֣�������˵����������
--������˵���������ƹ�����������ɽ���ֶ���һ������������������
--���ƹ��ͷ��������ħ�������޲���������ָ�������У��͵��ǳ����ļ�����ɣ�
--��������л�Ȼ���ʣ���������ʮ����Ǳ�ܺͶ���һʮһ�㾭�飡
--���ƹ��Ц��������֪�͵��Ӵ����µ��᷿��Ϣȥ�ˡ�
--���ƹ񼱼�ææ���뿪�ˡ�
function songshanTrigger()
    DeleteTriggerGroup("songshanAsk")
    create_trigger_t('songshanAsk1',"^(> )*���������������й�",'','songshanAsk')
    create_trigger_t('songshanAsk2',"^(> )*����û������ˡ�$",'','songshanNobody')
    SetTriggerOption("songshanAsk1","group","songshanAsk")
    SetTriggerOption("songshanAsk2","group","songshanAsk")
    EnableTriggerGroup("songshanAsk",false)
    DeleteTriggerGroup("songshanAccept")
    create_trigger_t('songshanAccept1',"^(> )*������˵������(�������ˣ��е��ӻر�|���ˣ�)(\\D*)(���˶�����������֮�������|���ҽ��鲻�����������)",'','songshanNpc')
    create_trigger_t('songshanAccept2',"^(> )*������˵������(�ٺ٣�����|��ʹ�����ȥ)(\\D*)(һ������ȥ����ɱ��|��������)",'','songshanConsider')
    create_trigger_t('songshanAccept3',"^(> )*������˵��������������ȥ",'','songshanFangqi')
    create_trigger_t('songshanAccept4',"^(> )*������˵����������æ���أ���ȵȡ�",'','songshanBusy')
    create_trigger_t('songshanAccept5',"^(> )*������˵���������������������Ϣһ�°ɡ���",'','songshanFail')
    create_trigger_t('songshanAccept6',"^(> )*������˵��������û��������,��������ʲô?",'','songshanFail')
    create_trigger_t('songshanAccept7',"^(> )*������˵�������ţ�����������˼�����ɴ�ƣ������š�",'','songshanFail')
    create_trigger_t('songshanAccept8',"^(> )*������˵��������Ȼ��ɲ���Ҳû��ϵ����ȥ�̿������ɣ��Ժ�����Ϊ���ǵĲ��ɴ�Ƴ�������",'','songshanFail')
    create_trigger_t('songshanAccept9',"^(> )*������˵�������ţ�������æ�������š�",'','songshanBusy')
    create_trigger_t('songshanAccept10',"^(> )*������˵����������û����������������ɡ���",'','songshanBusy')
    SetTriggerOption("songshanAccept1","group","songshanAccept")
    SetTriggerOption("songshanAccept2","group","songshanAccept")
    SetTriggerOption("songshanAccept3","group","songshanAccept")
    SetTriggerOption("songshanAccept4","group","songshanAccept")
    SetTriggerOption("songshanAccept5","group","songshanAccept")
    SetTriggerOption("songshanAccept6","group","songshanAccept")
    SetTriggerOption("songshanAccept7","group","songshanAccept")
    SetTriggerOption("songshanAccept8","group","songshanAccept")
    SetTriggerOption("songshanAccept9","group","songshanAccept")
    SetTriggerOption("songshanAccept10","group","songshanAccept")
    EnableTriggerGroup("songshanAccept",false)
    DeleteTriggerGroup("songshanFight")
    create_trigger_t('songshanFight1','^(> )*(\\D*)��ž����һ�����ڵ���','','songshanDie')
    create_trigger_t('songshanFight2','^(> )*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','songshanFaint')
    create_trigger_t('songshanFight3',"^(> )*����û��(\\D*)��",'','songshanLost')
    create_trigger_t('songshanFight4',"^(> )*(����û�������Ү|��������Ķ���������)",'','songshanFind')
    create_trigger_t('songshanFight5',"^(> )*(��˫��һ����Ц��|��ʤ�����У����Ծ������|�������Ц��˵���������ˣ�|û����|����æ���أ���Ъ������|�����ڴ���أ��Ȼ����˵��|�����ڼ��������˼���|��Ҫ�ȵ����ѹ�����˵|�㾫��������Ϣһ�°�)",'','songshanQing')
    create_trigger_t('songshanFight6',"^(> )*(������������Ҫ�������˰�|������������Ҫ����˭��)",'','songshanFangqiGo')
    create_trigger_t('songshanFight7',"^(> )*(\\D*)�Ѿ����������룬�㲻���ٷѾ�����",'','songshanBackCheck')
    create_trigger_t('songshanFight8',"^(> )*(\\D*)����������һ���ж���",'','songshanFollow')
    create_trigger_t('songshanFight9',"^(> )*(\\D*)(���һ��|������˼�����˵��|�����ɨ��|�ٺ�һ����|��ɫ�԰ף�ֻ����|ת��ͷ�����������¿���|��ɫ΢�䣬˵������������|һ�����ͷ��ı���)",'','songshanQingCheck')
    SetTriggerOption("songshanFight1","group","songshanFight")
    SetTriggerOption("songshanFight2","group","songshanFight")
    SetTriggerOption("songshanFight3","group","songshanFight")
    SetTriggerOption("songshanFight4","group","songshanFight")
    SetTriggerOption("songshanFight5","group","songshanFight")
    SetTriggerOption("songshanFight6","group","songshanFight")
    SetTriggerOption("songshanFight7","group","songshanFight")
    SetTriggerOption("songshanFight8","group","songshanFight")
    SetTriggerOption("songshanFight9","group","songshanFight")
    EnableTriggerGroup("songshanFight",false)
    DeleteTriggerGroup("songshanCut")
    create_trigger_t('songshanCut1','^(> )*ֻ�����ǡ���һ�����㽫(\\D*)���׼�ն���������������С�','','songshanCutCon')
    create_trigger_t('songshanCut2','^(> )*����ü����������߲���������ʬ���ͷ����','','songshanCutWeapon')
    SetTriggerOption("songshanCut1","group","songshanCut") 
    SetTriggerOption("songshanCut2","group","songshanCut")
    EnableTriggerGroup("songshanCut",false)
    DeleteTriggerGroup("songshanGive")
    create_trigger_t('songshanGive1','^(> )*���������һ��(\\D*)���׼���','','songshanFinish')
    SetTriggerOption("songshanGive1","group","songshanGive")
    EnableTriggerGroup("songshanGive",false)
    DeleteTriggerGroup("songshanHead")
    create_trigger_t('songshanHead1','^(> )*����һ��(\\D*)��(�׼�|��ͷ)','','songshanHeadCheck')
    create_trigger_t('songshanHead2','^(> )*��� "action" �趨Ϊ "check_head" �ɹ���ɡ�','','songshanHeadCon')
    SetTriggerOption("songshanHead1","group","songshanHead")
    SetTriggerOption("songshanHead2","group","songshanHead")
    EnableTriggerGroup("songshanHead",false)
    DeleteTriggerGroup("songshanFinish")
    create_trigger_t('songshanFinish1','^(> )*������˵������(\\D*)����������ɽ���ֶ���һ��������','','songshanFinishCheck')
    SetTriggerOption("songshanFinish1","group","songshanFinish")
    EnableTriggerGroup("songshanFinish",false)
end
function songshanTriggerDel()
    DeleteTriggerGroup("songshanAsk")
    DeleteTriggerGroup("songshanAccept")
    DeleteTriggerGroup("songshanFight")
    DeleteTriggerGroup("songshanFind")
    DeleteTriggerGroup("songshanCut")
    DeleteTriggerGroup("songshanGive")
    DeleteTriggerGroup("songshanHead")
    DeleteTriggerGroup("songshanFinish")
end
function songshanNobody()
    EnableTriggerGroup("songshanAsk",false)
    songshan()
end
-- ain
job.list["songshan"] = "��ɽ������"
function songshan()
    songshanTrigger()
    job.name='songshan'
    prepare_neili(songshanGo)
end
function songshanGo()
    go(songshanStart,"��ɽ","����̨")
end
function songshanStart()
    EnableTriggerGroup("songshanAsk",true)
    exe('ask zuo lengchan about job')
end
function songshanAsk()
    EnableTriggerGroup("songshanAsk",false)
    EnableTriggerGroup("songshanAccept",true)
end
function songshanBusy()
    EnableTriggerGroup("songshanAccept",false)
    check_bei(songshanBusyDazuo)
end
function songshanBusyDazuo()
    songshanStart()
end
function songshanFail()
    print('��ɽjobʧ�ܣ�����')
    EnableTriggerGroup("songshanAccept",false)
    job.last="songshan"
    check_food()
end
function songshanNpc(n,l,w)
    job.target=Trim(w[3])
    job.killer={}
    job.killer[job.target]=true
end
function songshanConsider(n,l,w)
    exe('set env_msg')
    nobusy=1
    job.time.b=os.time()
    EnableTriggerGroup("songshanAccept",false)
    job.last='songshan'
    job.id=nil
    if string.find(w[4],"��") then
       job.type="qing"
    else 
       job.type="kill"
    end
    job.where=Trim(w[3])
    job.where=addrTrim(job.where)
    job.room,job.area=getAddr(job.where)
    dest.room=job.room
    dest.area=job.area

    if string.find(sldsmCancel,job.target) then
       messageShow('��ɽ��������Ŀ�꡾'..job.target..'�����ɵ�����������')
       return songshanFangqi()
    end
    if not job.room or not path_cal() then
       messageShow('��ɽ��������ص㡾'..job.where..'�����ɵ�����������')
       return songshanFangqi()
    end
    check_bei(songshanFind)
    exe('nick ��ɽ������'..job.where)
    if job.type and job.type=="qing" then
       messageShow('��ɽ���񣺿�ʼǰ����'..job.where..'���롾'..job.target..'����')
    else
       messageShow('��ɽ���񣺿�ʼǰ����'..job.where..'��ɱ��'..job.target..'����')
    end
end
function songshanFangqiGo()
    go(songshanFangqi,'��ɽ','����̨')
end
function songshanFangqi()
    nobusy=0
    EnableTriggerGroup("songshanAsk",true)
    check_bei(songshanFangqiAsk)
end

function songshanFangqiAsk()
    --ain
    EnableTriggerGroup("songshanAccept",true)
    --EnableTriggerGroup("songshanAccept",false)
    exe('ask zuo lengchan about cancel')
end
function songshanFind()
    DeleteTriggerGroup("songshanFind")
    create_trigger_t('songshanFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','songshanTarget')
    SetTriggerOption("songshanFind1","group","songshanFind")
    EnableTrigger("songshanFind1",false)
    flag.times=1
    fight_prepare()
    go(songshanFindAct,job.area,job.room)    
end
function songshanFindAct()
    EnableTriggerGroup("songshanFind",true)
    job.flag()
    exe('look')
    find()
    messageShow('��ɽ���񣺿�ʼѰ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
end
function songshanTarget(n,l,w)
    EnableTriggerGroup("songshanFind",false)
    EnableTriggerGroup("songshanFight",true)
    EnableTrigger("hpheqi1",true)
    flag.wait=0
    flag.find=1
    thread_resume(lookfor)
    job.id=string.lower(w[2])
    job.killer[job.target]=job.id
    exe('halt;follow '..job.id)
    if job.type and job.type=="qing" then
       killPfm(job.id,"qing")
    else
       killPfm(job.id)
    end
end
function songshanFaint(n,l,w)
    if job.target==w[2] then
       if job.type and job.type=="qing" then
          exe('halt')
	  return songshanQing()
       else
          exe('kill '..job.id)
       end
    end
end
function songshanFollow(n,l,w)
    if job.target==w[2] then
       if job.type and job.type=="qing" then
          exe('halt')
	  return songshanBack()
       end
    end
end
function songshanDie(n,l,w)
    if job.target==w[2] then
       if job.type and job.type=="qing" then
          exe('follow '..job.id)
       else
          DeleteTimer("perform")
          check_halt(songshanCut)
       end
    end
end
function songshanQingCheck(n,l,w)
    if job.target==w[2] then
       songshanQing()
    end
end
function songshanQing()
    exe('yun qi;hp')
 --   exe('yun qi')
 --  print('Ϊɶ����ˢ1')
    -- ain ��ֹˢ��
    checkWait(songshanQingAct,3)
 --   check_halt(songshanQingAct)
end
function songshanQingAct()
  --  print('Ϊɶ����ˢ2')
  --  exe('dazuo '..hp.dazuo)
    if hp.neili<hp.neili_lim then
       exe('dazuo '..hp.dazuo)
       return prepare_neili(songshanQing,1)
    else
       exe('yun jing;yun jingli;qing '..job.id)
    end
end
function songshanCut()
    EnableTriggerGroup("songshanFight",false)
    EnableTriggerGroup("songshanCut",true)
    exe('halt')
	weaponWieldCut()
    for i=1,3 do
        exe('qie corpse '..i)
    end
end
function songshanCutWeapon()
    EnableTriggerGroup("songshanCut",false)
    checkWait(songshanCut,1)
end
function songshanCutCon(n,l,w)
    EnableTriggerGroup("songshanCut",false)
    if job.target~=tostring(w[2]) then
       exe('drop head')
       check_bei(songshanCut)
    else
       return songshanBack()
    end
end
function songshanLost(n,l,w)
    if job.id==Trim(w[2]) then
       dis_all()
       return songshanFind()
    end
end
function songshanBckCheck(n,l,w)
    if job.target==w[2] then
       songshanBack()
    end
end
function songshanBack()
    DeleteTimer("perform")
    EnableTriggerGroup("songshanFight",false)
    EnableTriggerGroup("songshanFinish",true)
    go(songshanHead,'��ɽ','����̨')
end
function songshanHead()
    if job.type and job.type=="qing" then
       cntr1 = countR(8)
       return songshanFinishWait()
    else
       EnableTriggerGroup("songshanHead",true)
       tmp.flag=0
       exe('look head')
       exe('alias action check_head')
    end
end
function songshanHeadCheck(n,l,w)
    if w[2] == job.target then
       tmp.flag=1
    end
end
function songshanHeadCon()
    EnableTriggerGroup("songshanHead",false)
    if tmp.flag==1 then
       return songshanGive()
    else
       return songshanFinish()
    end
end
function songshanGive()
    EnableTriggerGroup("songshanGive",true)
    exe('give zuo head')
end
function songshanFinishWait()
    if cntr1()<3 then
       return songshanFinish()
    else
       -- ain  ��ɽλ�ò���
       exe('sd;nu')
       print('NPC ��û����')
       checkWait(songshanFinishWait,3)
    end
end
function songshanFinishCheck(n,l,w)
    if w[2]==job.target then
       return songshanFinish()
    end
end
function songshanFinish()
    exe('unset env_msg')
	nobusy=0
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
    EnableTriggerGroup("songshanFight",false)
    messageShowT('��ɽ����������ɣ�������ʱ:��'..job.time.over..'���롣')
    print('��ɽ������ɣ�')
    exe('sd;nu')
    -- ain need
    checkWait(check_food)
  --   return check_halt(check_heal)
    --return go(check_heal,'������','ҩ��')
end