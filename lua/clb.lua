------���ְ�
function clbTrigger()
	DeleteTriggerGroup("clbAsk")
    create_trigger_t('clbAsk1',"^(> )*���򱴺�ʯ�����й�",'','clbAsk')
    create_trigger_t('clbAsk2',"^(> )*����û������ˡ�$",'','clbNobody')
    SetTriggerOption("clbAsk1","group","clbAsk")
    SetTriggerOption("clbAsk2","group","clbAsk")
    EnableTriggerGroup("clbAsk",false)
    DeleteTriggerGroup("clbAccept")
    create_trigger_t('clbAccept1',"^(> )*����ʯ����Ķ�������˵�����ҽӵ��ɸ봫�飬(������|ʨ����|������|������|������)���°���(\\D*)��(\\D*)������Ϯ��",'','clbConsider')
    create_trigger_t('clbAccept2',"^(> )*����ʯ˵������(�㲻���Ѿ�֪����|���������Բ���|�㲻���Ѿ���չ|�Ҳ��Ǹ���������)",'','clbFangqi')
    create_trigger_t('clbAccept3',"^(> )*����ʯ˵������������곤�ְ�����",'','clbFail')
    create_trigger_t('clbAccept4',"^(> )*����ʯ˵������(�Ұ����ڱȽϿ���|����������û�и��������|��ʱû��������Ҫ��)",'','clbBusy')
    create_trigger_t('clbAccept5',"^(> )*����ʯ˵�������������(�Ͷ�����|��������)����",'','clbBusy')
    create_trigger_t('clbAccept6',"^(> )*����ʯ˵������������ʱû���ʺ���Ĺ���",'','clbBusy')
    create_trigger_t('clbAccept7',"^(> )*����ʯ˵��������ʱû��������Ҫ�������һ���������",'','clbBusy')
    create_trigger_t('clbAccept8',"^(> )*����ʯ˵��������Ȼ���޷����",'','clbFail')
    create_trigger_t('clbAccept9',"^(> )*����ʯ˵�������������û��������",'','clbFail')
    SetTriggerOption("clbAccept1","group","clbAccept")
    SetTriggerOption("clbAccept2","group","clbAccept")
    SetTriggerOption("clbAccept3","group","clbAccept")
    SetTriggerOption("clbAccept4","group","clbAccept")
    SetTriggerOption("clbAccept5","group","clbAccept")
    SetTriggerOption("clbAccept6","group","clbAccept")
    SetTriggerOption("clbAccept7","group","clbAccept")
    SetTriggerOption("clbAccept8","group","clbAccept")
    SetTriggerOption("clbAccept9","group","clbAccept")
    EnableTriggerGroup("clbAccept",false)
	DeleteTriggerGroup("clbChakan")
    --create_trigger_t('clbChakan1','^(> )*����ϸ�ز鿴','','clbBack')
    create_trigger_t('clbChakan1','^(> )*����ֻ�ܲ鿴���ⲽ�ˣ������Ȼ�ȥ����ɡ�','','clbCkBack')
	create_trigger_t('clbChakan2','^(> )*(\\D*)��ž����һ�����ڵ���','','clbDie')
	--create_trigger_t('clbChakan3','^(> )*��� "action" �趨Ϊ "chakan" �ɹ���ɡ�$','','clbCkBack')
	create_trigger_t('clbChakan3','^(> )*�㰵��Ѱ˼ѯ��(\\D*)��(\\D*)\\((\\D*)\\)�����ܵõ���ʾ������(��|��)����(\\D*)�������֡�','','clbwho')
    SetTriggerOption("clbChakan1","group","clbChakan")
	SetTriggerOption("clbChakan2","group","clbChakan")
	SetTriggerOption("clbChakan3","group","clbChakan")
    EnableTriggerGroup("clbChakan",false)
    DeleteTriggerGroup("clbFinish")
    create_trigger_t('clbFinish1','^(> )*����ʯ˵������(�������û��������|��Ȼ�Ѿ�֪������|������ϧ�������д˼���|���ĺã���Щ����)','','clbFinish')
    create_trigger_t('clbFinish2',"^(> )*����ʯ˵��������������������",'','clbFangqi')
    SetTriggerOption("clbFinish1","group","clbFinish")
    SetTriggerOption("clbFinish2","group","clbFinish")
    EnableTriggerGroup("clbFinish",false)
end
function clbTriggerDel()
    DeleteTriggerGroup("clbAsk")
    DeleteTriggerGroup("clbAccept")
    DeleteTriggerGroup("clbChakan")
    DeleteTriggerGroup("clbFinish")
    DeleteTriggerGroup("clbFind")
    DeleteTriggerGroup("clb_xunwen")
    DeleteTriggerGroup("clbFight")
    DeleteTriggerGroup("clb_debug")
end
function clbNobody()
    EnableTriggerGroup("clbAsk",false)
    return clb()
end
job.list["clb"] = "���ְ�����"
function clb()
    dis_all()
    clbTrigger()
    job.name='clb'
    job.clb2=false
    return clbGo()
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["clb"] = "clbFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["clb"] = "clbFindFail"
function clbFindAgain()
    if job.clb2==true then 
       dis_all()
       return clbBack() 
    else
       EnableTriggerGroup("clbFind",false)
       return go(clbFindAct,dest.area,dest.room)
    end
end
function clbFindFail()
    if job.clb2==true then 
       dis_all()
       return clbBack() 
    else
       EnableTriggerGroup("clbFind",false)
       return go(clbFangqi,"���ְ�","С��")
    end
end
function clbGo()
    return go(clbaskjob,"���ְ�","С��")
end
function clbaskjob()
    if GetRoleConfig("CheckNeili_InAdvance") == true then return zhunbeineili(clbStart) else return clbStart() end
end
function clbStart()
    EnableTriggerGroup("clbAsk",true)
    exe('ask bei haishi about job')
end
function clbAsk()
    EnableTriggerGroup("clbAsk",false)
    EnableTriggerGroup("clbAccept",true)
end
function clbBusy()
    EnableTriggerGroup("clbAccept",false)
    return check_halt(clbBusyDazuo)
end
function clbBusyDazuo()
    exe('e')
    return clbGo()
end
function clbFail()
    EnableTriggerGroup("clbAccept",false)
    job.last='clb'
	--return getGold()
    return check_food()
end
function clbConsider(n,l,w)
    nobusy=1
    job.clb2=false
    job.time.b=os.time()
    EnableTriggerGroup("clbAccept",false)
	messageShow('���ְ���������ʼ��')
    job.last='clb'
    job.target=Trim(w[3])
    job.killer={}
    job.killer[job.target]=true
    job.where=Trim(w[4])
    job.where=addrTrim(job.where)    
    job.room,job.area=getAddr(job.where)
    dest.room=job.room
    dest.area=job.area
    if not job.room or not path_cal() then
       messageShow('���ְ���������ص㡾'..job.where..'�����ɵ�����������')
       return check_halt(clbFangqi)
    end
    exe('nick ���ְ�'..job.where)
    messageShow('���ְ����񣺿�ʼǰ����'..job.where..'����')
	return check_halt(clbFind)
end
function clbFangqiGo()
    go(clbFangqi,'���ְ�','С��')
end
function clbFangqi()
exe('nick ���ְ��������')
flag.idle = nil
clb2=false
    EnableTriggerGroup("clbAsk",true)
    EnableTriggerGroup("clbAccept",false)
    EnableTriggerGroup("clbFinish",false)
    check_halt(clbFangqiAsk)
end
function clbFangqiAsk()
	nobusy=0
    exe('ask bei haishi about ����')
end
function clbFind()
    DeleteTriggerGroup("clbFind")
    create_trigger_t('clbFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','clbTarget')
	create_trigger_t('clbFind2','^(> )*\\D*'..job.target..'��ʬ��\\((\\D*)\\)','','clbTarget')
    SetTriggerOption("clbFind1","group","clbFind")
	SetTriggerOption("clbFind2","group","clbFind")
	EnableTriggerGroup("clbFind",false)
    flag.times=1
	flag.clbdie=nil
    return go(clbFindAct,job.area,job.room)    
end
function clbFindAct()
    EnableTriggerGroup("clbFind",true)
    DeleteTimer("clb")
    job.flag()
    exe('look')
--	messageShow('���ְ����񣺿�ʼѰ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
    return find()
end
function clbTarget(n,l,w)
    EnableTriggerGroup("clbFind",false)
    dis_all()
   if job.clb2==true then
		job.id=string.lower(w[2])
		job.killer[job.target]=job.id
		exe('unset no_kill_ap')
		clbfight()  --����ս��
		exe('follow '..job.id)
		exe('look '..job.id)
		exe('kick '..job.id)
		exe('set wimpy 100;yield no')
		exe('kill '..job.id)
		return
	else
    EnableTriggerGroup("clbChakan",true)
	  locate()	
	  return check_halt(clbLocate)
	end
end
function clbLocate()
    if locl.id[job.target] then
	   return checkWait(clbTarget,1)
	elseif locl.id[job.target ..'��ʬ��'] then
	   return check_halt(clbChakan)
	else
	   return clbFind()
	end
end
function clbDie(n,l,w)
    if job.target==tostring(w[2]) then
	   flag.clbdie=true
       --return check_bei(clbChakan)
	end
end
function clbChakan()
    exe('yield yes')
    exe('halt')
    for i=1,3 do
	    exe('get cu bu from corpse '.. i)
	end
	exe('chakan cu bu')
	exe('chakan corpse')
	exe('get corpse 2;drop corpse')
	--exe('chakan cu bu')
	exe('chakan corpse')
	exe('get corpse 3;drop corpse')
	--exe('chakan cu bu')
	exe('chakan corpse')
	exe('yield no')
	exe('alias action chakan')
end
function clbwho(n,l,w)
    messageShow("�����أ����ְ�ѯ�ʵ�����ǡ�"..w[2].."���ġ�"..w[3].."����id��"..w[4].."����λ�ڡ�"..w[6].."��","deepskyblue")
        job.playername=Trim(w[3])
        job.playerid=string.lower(tostring(Trim(w[4])))
        job.where2=Trim(w[6])
        job.where2=addrTrim(job.where2)    
        job.room2,job.area2=getAddr(job.where2)
		if not getAddr(job.where2) then 
			ColourNote ("gold","black","�����޷�����Զ�����!")
			return check_halt(clbBack)
		else
--			messageShow('���ְ�����ƣ���ʼǰ����'..job.where2..'��Ѱ����ң���'..w[3]..'����id��'..w[4]..'��')
			return check_halt(clbFindPlayer)
		end
end
function clbFindPlayer()
    create_timer_s('xunWen',0.5,'xunWen')
    --print(job.where2,job.area2,job.room2)
    DeleteTriggerGroup("clb_xunwen")
    create_trigger_t('clb_xunwen4','^(> )*\\D*'..job.playername..'(\\D*)','','xWgood')
    create_trigger_t('clb_xunwen1','^(> )*\\D*����Ķ�������˵�����ʲ�(\\D*)����(\\D*)������߾���������ǰ����(\\D*)��','','clbConsider2')
	  create_trigger_t('clb_xunwen2','^(> )*\\D*����Ķ�������˵�����ղ������˴�����߾�������ϧ��û����������ĸ������뿪�ˡ�','','clbBack')
	  create_trigger_t('clb_xunwen3','^(> )*\\D*�㲻���Ѿ�ѯ�ʹ��ˣ�������ȥ��','','clbBack')
    SetTriggerOption("clb_xunwen1","group","clb_xunwen")
    SetTriggerOption("clb_xunwen2","group","clb_xunwen")
    SetTriggerOption("clb_xunwen3","group","clb_xunwen")
    SetTriggerOption("clb_xunwen4","group","clb_xunwen")
  	EnableTriggerGroup("clb_xunwen",true)
  	DeleteTriggerGroup("clb_debug")
  	create_trigger_t('clb_debug1','^(> )*\\D*��(�����������ô|�����Ѿ�ѯ�ʹ���)','','debugBack')
  	SetTriggerOption("clb_debug1","group","clb_debug")
  	EnableTriggerGroup("clb_debug",false)
    flag.times=1
    job.clb2=true
    return go(clbFindPAct,job.area2,job.room2) 
end
function debugBack()
    dis_all()
    return go(clbFinishWait,'���ְ�','С��')
end
function clbFindPAct()
    EnableTriggerGroup("clb_xunwen",true)
    job.room=job.room2
    job.area=job.area2
    job.target=job.playerid
    job.flag()
    exe('look')
    exe('unset env_msg')
	messageShow('���ְ�����ƣ���ʼѰ�ҡ�'..job.area .. job.room ..'����'..'��'.. job.playerid ..'����')
    return find()
end
function xWgood()
    exe('follow '..job.playerid)
    dis_all()
    EnableTrigger("clb_xunwen1",true)
    EnableTrigger("clb_xunwen2",true)
    EnableTrigger("clb_xunwen3",true)
    EnableTrigger("clb_debug1",true)
    create_timer_s('xunWen',0.2,'xunWen')
end
function xunWen()
    exe('xunwen '..job.playerid)
end
function clbConsider2(n,l,w)
    exe('follow none')
    dis_all()
    EnableTriggerGroup("clb_xunwen",false)
    DeleteTriggerGroup("clb_xunwen")
    job.target=Trim(w[3])
    job.killer={}
    job.killer[job.target]=true
    job.where=Trim(w[4])
    --locate()
    return check_halt(clb2_relocate)
end
function clb2_relocate()
  if job.where~=nil then
    if getAddr(job.where)~=false then
      job.room,job.area=getAddr(job.where)
    else
      messageShow('���ְ�����ƣ�����ص㡾'..job.where..'�����ɵ�����������','red')
      return check_bei(clbBack) 
    end
  else
    messageShow('���ְ�����ƣ�����ص������'..job.where..'�������ڣ����������')
    return check_bei(clbBack)
  end
       if locl.area=='��֪������' then
         locate()
         exe(locl.dir)
         messageShow('���ְ�����ƣ��޷�ȷ����ǰ�ص㣬����ƶ��ص㣬���¼���·��','white')
          wait.make(function() 
             wait.time(1)
             clb2_relocate()
          end)
         return
      end
	------------------------------
    dest.room=job.room
    dest.area=job.area
  if job.room==nil or not path_cal() then
       messageShow('���ְ�����ƣ�����ص㡾'..job.where..'�����ɵ�����������','red')
       return check_bei(clbBack)
  end
  exe('nick ���ְ���'..job.where)
  exe('set env_msg')
  messageShow('���ְ�����ƣ���ʼǰ����'..job.where..'����')
    return check_bei(clbFind)   	
	------------------------------
end
function clbfight()
	DeleteTriggerGroup("clbFight")
    create_trigger_t('clbFight1','^(> )*(\\D*)��ž����һ�����ڵ���','','clbBack')
    create_trigger_t('clbFight2','^(> )*(\\D*)��һ�������ã���ת��������Ͳ�����','','clbBack')
    create_trigger_t('clbFight3',"^(> )*(\\D*)�������������ŵĴֲ���Ƭ��������ɫ��䣬��ȵ�����Ȼ�ѱ��㿴�ƣ���Ҳ�ͱ���ˣ�",'','clbKillAct')
  	create_trigger_t('clbFight4',"^(> )*(\\D*)��һ�������Ӳ������ˣ�ת��������Ͳ�����",'','clbBack')
    create_trigger_t('clbFight5','^>*\\s*һ��ů�����Ե�������ȫ�����������ָֻ���֪������','','clbFangqiGo')
    create_trigger_t('clbFight6',"^(��|��)װ���ţ�$",'','npcWeapon')
    create_trigger_t('clbFight7','^(> )*��Ҫ��˭�����������','','clbFind')
    SetTriggerOption("clbFight1","group","clbFight")
    SetTriggerOption("clbFight2","group","clbFight")
    SetTriggerOption("clbFight3","group","clbFight")
    SetTriggerOption("clbFight4","group","clbFight")
  	SetTriggerOption("clbFight5","group","clbFight")
    SetTriggerOption("clbFight6","group","clbFight")
    SetTriggerOption("clbFight7","group","clbFight")
    EnableTriggerGroup("clbFight",true)
end
function clbKillAct()
    exe('set wimpy 100;yield no')
    --exe('look '..job.id)
    exe('kill '..job.id)
	  --exe('pfmpfm')
end
function clbCkBack()
    EnableTriggerGroup("clbChakan",false)
    return check_halt(clbCkSec,1)
end
function clbCkSec()
    clbChakan()
	return clbBack()
end
function clbBack()
    EnableTriggerGroup("clbChakan",false)
    return go(clbFinishWait,'���ְ�','С��')
end
function clbFinishWait()
	if locl.id["����ʯ"] then
	   EnableTriggerGroup("clbFinish",true)
	   exe('ask bei haishi about ���')
	else
	   return go(clbFinishWait,'���ְ�','С��')
	end
end
function clbFinish()
	nobusy=0
	clb2=false
	  clbTriggerDel()
    EnableTriggerGroup("clbFinish",false)
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
	messageShowT('���ְ����������������ʱ:��'..job.time.over..'���롣')
    return check_halt(check_food)
end