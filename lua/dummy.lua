---ɱ����
jobFindAgain = jobFindAgain or {}
jobFindAgain["dummy"] = "dummyFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["dummy"] = "dummyFindFail"
function dummyFindAgain()
    EnableTriggerGroup("dummyFind",false)
    return go(dummy_find_act,job.area,job.room) 
end
function dummyFindFail()
    EnableTriggerGroup("dummyFind",false)
    return dummyover()
end
function closedummy()
   DeleteTrigger("mydummy1")
   DeleteTriggerGroup("dummyfind")
   DeleteTriggerGroup("dummykill")
   DeleteTriggerGroup("dummy")
end
function opendummy()
        DeleteTriggerGroup("mydummy")
        create_triggerex_lvl('mydummy1','^(> )*(\\! )*��'..score.party..'��\\D*\\(\\N*\\)����˵�и�(\\D*)��ð(\\D*)(��|��|��|��|��|��|0)(\\D*)\\((\\D*)\\)֮������(\\D*)һ��','','trundummy',97)
        --^(> )*��(ؤ��|���ư�|������|����|������|����Ľ��|������|��ɽ��|�䵱��|��ɽ��|�һ���|������|������)��
          --create_trigger_t('mydummy1','��'..score.party..'��(\\D*)��ð(\\D*)(��|��|��|��|��|��|0)(\\S*)\\((\\D*)\\)֮������(\\D*)һ��','','trundummy')
        SetTriggerOption("mydummy1","group","hp")
        mydummy=false
        if score.party=='������' then map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8" end
        print('����ɱ����')
end
function trundummy(n,l,w)
    job.target4=w[6]
    job.where4=w[8]
    job.party2=w[4]
    job.id3='dummy'
    --print(job.party2,job.target4,job.id3,job.where4)
    mydummy=true
end
function dummyfind()
  if job.where4~=nil then
    if getAddr(job.where4)~=false then
      job.room,job.area=getAddr(job.where4)
    else
      messageShow('ɱ������������ص㡾'..job.where4..'�����ɵ�����������','red')
      return check_bei(dummyover) 
    end
  else
    messageShow('ɱ������������ص������'..job.where4..'�������ڣ����������','red')
    return check_bei(dummyover)
  end
       if locl.area=='��֪������' then
         locate()
         exe(locl.dir)
         messageShow('ɱ���������޷�ȷ����ǰ�ص㣬����ƶ��ص㣬���¼���·��','greenyellow')
          wait.make(function() 
             wait.time(1)
             dummyfind()
          end)
         return
      end
    dest.room=job.room
    dest.area=job.area
  if job.room==nil or not path_cal() then
       messageShow('ɱ������������ص㡾'..job.where4..'�����ܵ�����������','red')
       return check_bei(dummyover)
  end
  exe('nick ������'..job.where4)
  exe('set env_msg')
  messageShow('ɱ�������񣺿�ʼǰ����'..job.where4..'����','red')
    check_halt(dummy_find_go)
end
function dummy_find_go()
    DeleteTriggerGroup("dummyfind")
    create_trigger_t('dummyfind1','^>*\\s*\\D*'..job.target4..'\\((\\D*)\\)','','dummyco')
    create_trigger_t('dummyfind2','^(> )*(��|��)��(����|�书)��','','dummylevel')
    create_trigger_t('dummyfind3',"^  ��(���|����|����|һ������|�ֵ�|��)\\(",'','xueshan_judge_weapon')
    create_trigger_t('dummyfind4',"^(��|��)װ���ţ�$",'','npcWeapon')
    create_trigger_t('dummyfind5','^(> )*dummy ��������$','','dummy_goon')
    SetTriggerOption("dummyfind1","group","dummyfind")
    SetTriggerOption("dummyfind2","group","dummyfind")
    SetTriggerOption("dummyfind3","group","dummyfind")
    SetTriggerOption("dummyfind4","group","dummyfind")
    SetTriggerOption("dummyfind4","group","dummyfind")
    EnableTriggerGroup("dummyfind",false)
    job.name='Dummyjob'
    flag.times=1
    fight_prepare()
    return go(dummy_find_act,job.area,job.room)  
end
function dummy_goon()
    EnableTriggerGroup("dummyfind",true)
    flag.wait=0
    flag.find=0
    return walk_wait()
end 
function dummy_find_act()
    EnableTriggerGroup("dummyfind",true)
    if score.party=='������' then map.rooms["sld/lgxroom"].ways["#outSld"]=nil end    
    job.flag()
    exe('look')
    messageShow('�������񣺴��ס�'..job.target4..'���ڡ�'..job.room..'��һ�����֣���ʼѰ�ң�','greenyellow') 
    return find()
end
function dummyco(n,l,w)
    EnableTrigger("dummyfind1",false)
    --job.id=string.lower(w[1])
	flag.find=1
      -- print(job.id3)
       exe('follow '..job.id3)
       exe('look '..job.id3)
       exe('hp;compare '..job.id3)
end
function dummylevel(n,l,w)
    job.level=w[3]
    if string.find(job.level,"����") then
    return dummy_judge()
    end
    messageShow('�򲻹���'..job.target4..'���Ĵ��ף���������','red')
    return dummyover()
end
function dummykill()
    DeleteTriggerGroup('dummykill')
    create_trigger_t('dummy1kill','^>*\\s*(\\D*)��ž����һ�����ڵ���','','dummyover')
    create_trigger_t('dummy2kill','^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','dummy_kill_faint')
    create_trigger_t('dummy3kill','^(> )*���ﲻ׼ս����','','dummy_kill_nofight')
    SetTriggerOption("dummy1kill","group","dummykill") 
    SetTriggerOption("dummy2kill","group","dummykill")
    SetTriggerOption("dummy3kill","group","dummykill")
    exe('unset no_kill_ap')
    exe('kill '..job.id3)
    exe('set wimpycmd pfmpfm\\hp;set wimpy 100')
    messageShow('ɱ���ף���ʼɱ���ף���'..job.target4..'����','greenyellow')
    create_timer_s('dummy',5,'dummyMove')
    if score.party=='������' then
	     messageShow('����������.ɱ���ף�yun wudi','greenyellow')
	     exe('yun wudi')
	  end
	  if score.party=='��Ĺ��' then
	     messageShow('���ɹ�Ĺ��.ɱ���ף�yun xinjing','greenyellow')
	     exe('yun yun xinjing')
	  end
end
function dummyMove()
	if job.id3 then
	   exe('kick '..job.id3)
	   exe('kill '..job.id3)
	end
end
function dummy_kill_nofight()
       exe('askk dummy about fight')
    return check_busy(dummy_judge,2)
end
function dummy_kill_faint()
 DeleteTimer("wudang")
 exe('kill '..job.id3)
end
function dummy_judge(n,l,w)
    EnableTriggerGroup("dummy_find",false)
    EnableTrigger("hpheqi1",true)
    job.skill='��'
    messageShow('ɱ���ף��������ԡ�'..job.party2..'����','greenyellow')
    if job.party2 and job.party2=='����Ľ' and job.weapon=='sword' then
       messageShow('ɱ���ף���������Ľ�ݣ�װ��������������ʹ��Ľ�ݽ���ר��PFM��','greenyellow')
	   exe('pfmmrjf')
    end
    if job.party2 and job.party2=='����Ľ' and job.weapon=='blade' then
       messageShow('ɱ���ף���������Ľ�ݣ�װ���������ֵ���ʹ��������PFM��','greenyellow')
	   exe('pfmmiao')
    end
    if job.party2 and job.party2=='��' and job.weapon=='dagger' then
       messageShow('ɱ���ף��������̣�װ��������һ�����ʹ��ʥ���ר������PFM��','greenyellow')
	   exe('pfmshlf')
    end    
    if job.party2 and job.party2=='����' and job.weapon=='whip' then
       messageShow('ɱ���ף��������֣�װ�����������ޡ�ʹ��������PFM��','greenyellow')
	   exe('pfmxian')
    end
    if job.party2 and job.party2=='��Ĺ' and job.weapon=='unarmed' then
       messageShow('ɱ���ף�������Ĺ�ɣ�װ�����������֡�ʹ��������PFM��','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='��Ĺ' and job.weapon=='sword' then
       messageShow('ɱ���ף�������Ĺ�ɡ�ʹ�ÿ�����PFM��','greenyellow')
	   exe('pfmkuai')
	elseif job.party2 and job.party2=='��Ĺ' then
       messageShow('ɱ���ף�������Ĺ�ɣ�ʹ�ø�����PFM��','greenyellow')
       exe('pfmgang')
    end
    if job.party2 and job.party2=='����' then
       messageShow('ɱ���ף��������ҡ�ʹ��������PFM��','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='ؤ' and job.weapon=='stick' then
       messageShow('ɱ���ף�����ؤ�װ�������������ʹ��������PFM��','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='ؤ' then
       messageShow('ɱ���ף�����ؤ�ʹ��������PFM��','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='�䵱' and job.weapon=='blade' then
       messageShow('ɱ���ף������䵱��װ���������ֵ���ʹ��������PFM��','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='�䵱' then
       messageShow('ɱ���ף������䵱��ʹ��������PFM��','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='�һ�' then
       messageShow('ɱ���ף������һ�����ʹ��������PFM��','greenyellow')
	   exe('pfmxian')
    end
    if job.party2 and job.party2=='��ɽ' then
       messageShow('ɱ���ף�������ɽ��ʹ��������PFM��','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='����' and job.weapon=='sword' then
       messageShow('ɱ���ף����������ɡ��书��������ʹ��������PFM����','greenyellow')
	   exe('pfmrou')
    end
    if job.party2 and job.party2=='����' and job.weapon=='unarmed' then
       messageShow('ɱ���ף����������ɡ��书�����ص���or�����ȷ���ʹ�ø�����PFM����','greenyellow')
	   exe('pfmgang')
    end
	exe('jifa all')
     return dummykill()
end
function dummyover()
    exe('unset env_msg')
        exe('get yushi from corpse 1')
        exe('get yushi from corpse 2')
        exe('get yushi from corpse 3')
        exe('follow none')
    DeleteTimer("wudang")
    mydummy=false
    if score.party=='������' then map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8" end
    job.target4=nil
    job.where4=nil
    job.party2=nil
    job.id3=nil
   DeleteTriggerGroup("dummyfind")
   DeleteTriggerGroup("dummykill")
   DeleteTriggerGroup("dummy")
   return go(Sellyushi,'������','����')
end
function Sellyushi()
   if locl.room=="����" then
       exe('sell yushi')
           messageShow('Kill Dummy Is Over��','red')
       check_bei(check_food)
    else
       return go(Sellyushi,'������','����')
    end
end