------���ֻ���
function husongTrigger()
	DeleteTriggerGroup("husongAsk")
    create_trigger_t('husongAsk1',"^(> )*�������ȴ�ʦ�����й�",'','husongAsk')
    create_trigger_t('husongAsk2',"^(> )*����û������ˡ�$",'','husongNobody')
    SetTriggerOption("husongAsk1","group","husongAsk")
    SetTriggerOption("husongAsk2","group","husongAsk")
    EnableTriggerGroup("husongAsk",false)
    DeleteTriggerGroup("husongAccept")
    create_trigger_t('husongAccept1',"^(> )*���ȴ�ʦ˵������(\\D*)����(\\D*)����$",'','husongConsider')
    create_trigger_t('husongAccept2',"^(> )*���ȴ�ʦ˵������(\\D*)�ƺ��������������������񡣡�$",'','husongFail')
    create_trigger_t('husongAccept3',"^(> )*���ȴ�ʦ˵�������ţ��Ѿ������ڰ����ˣ��㻹��ȥæ����ʲô�ɡ���",'','husongBusy')
    create_trigger_t('husongAccept4',"^(> )*���ȴ�ʦ˵��������ղŲ����Ѿ��ʹ����𣿡�",'','husongQuit')
    create_trigger_t('husongAccept5',"^(> )*���ȴ�ʦ˵���������书����Ҳ̫���ˣ�������ô��������ȥ�ɰ�����",'','husongBusy')
    create_triggerex_lvl('husongAccept6',"^(> )*���ȴ�ʦ˵����������������û��ʲô������㡣��",'','husongBusy',95)
    SetTriggerOption("husongAccept1","group","husongAccept")
    SetTriggerOption("husongAccept2","group","husongAccept")
    SetTriggerOption("husongAccept3","group","husongAccept")
    SetTriggerOption("husongAccept4","group","husongAccept")
    SetTriggerOption("husongAccept5","group","husongAccept")
    SetTriggerOption("husongAccept6","group","husongAccept")
    EnableTriggerGroup("husongAccept",false)
	DeleteTriggerGroup("husongDashiAsk")
    create_trigger_t('husongDashiAsk1',"^(> )*����(\\D*)��ʦ�����й�",'','husongDashiStart')
    create_trigger_t('husongDashiAsk2',"^(> )*����û������ˡ�$",'','husongNobody')
    SetTriggerOption("husongDashiAsk1","group","husongDashiAsk")
    SetTriggerOption("husongDashiAsk2","group","husongDashiAsk")
    EnableTriggerGroup("husongDashiAsk",false)
	DeleteTriggerGroup("husongJiaotu")
    create_trigger_t('husongJiaotu1','^(> )*ͻȻ��·�߳��һ��ħ�̽�ͽ��һ�����Ե���(\\D*)��ȥ��','','husongJiaotu')
	create_trigger_t('husongJiaotu2','^(> )*������ħ�̽�ͽ��ɱ���㣡','','husongFight')
    SetTriggerOption("husongJiaotu1","group","husongJiaotu")
	SetTriggerOption("husongJiaotu2","group","husongJiaotu")
    EnableTriggerGroup("husongJiaotu",false)
	DeleteTriggerGroup("husongFight")
    create_trigger_t('husongFight1',"^(> )*".. score.id .."'s jiaotu ��������",'','husongFightOver')
	create_trigger_t('husongFight2','^(> )*(\\D*)��ž����һ�����ڵ���','','husongDie')
	create_trigger_t('husongFight3','^(> )*����ϸ����ǰ������ħ�̽�ͽһ����','','husongCompare')
    SetTriggerOption("husongFight1","group","husongFight")
	SetTriggerOption("husongFight2","group","husongFight")
	SetTriggerOption("husongFight3","group","husongFight")
    EnableTriggerGroup("husongFight",false)
    DeleteTriggerGroup("husongFinish")
    create_trigger_t('husongFinish1','^(> )*(\\D*)����������������ʧ�ܡ�','','husongDashiDie')
    create_trigger_t('husongFinish2',"^(> )*�ã�������ɣ���õ���(\\D*)��ʵս�����(\\D*)��Ǳ�ܡ�",'','husongFinishExp')
	create_trigger_t('husongFinish3','^(> )*(\\D*)����Ķ�������˵�����ղ�����������ʦ�ܣ����ƺ���һЩ','','husongFinishQuest')
    SetTriggerOption("husongFinish1","group","husongFinish")
    SetTriggerOption("husongFinish2","group","husongFinish")
	SetTriggerOption("husongFinish3","group","husongFinish")
    EnableTriggerGroup("husongFinish",false)
end
function husongTriggerDel()
    DeleteTriggerGroup("husongAsk")
    DeleteTriggerGroup("husongAccept")
    DeleteTriggerGroup("husongDashiAsk")
    DeleteTriggerGroup("husongJiaotu")
    DeleteTriggerGroup("husongFind")
	DeleteTriggerGroup("husongFight")
	DeleteTriggerGroup("husongFinish")
	DeleteTriggerGroup("husongBoat")
end
husongRoom={
    ["ɽ��"]   = "group/entry/slxiaoj1",
	["��·"]   = "group/entry/canroad6",
	["ũ���"] = "zhiye/nongtian0",
	["ɣ����"] = "zhiye/sanglin0",
}
function husongNobody()
    EnableTriggerGroup("husongAsk",false)
    return prepare_neili(husong)
end
job.list["husong"] = "���ֻ���"
function husong()
    if job.hstime then
	   if type(job.hstime)~="number" or os.time()-job.hstime<20*60 then
	      return checkJob()
	   end
	end 
    husongTrigger()
    job.name='husong'
    flag.idle = nil
    return prepare_lianxi(husongGo)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["husong"] = "husongFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["husong"] = "husongFindFail"
function husongFindAgain()
    EnableTriggerGroup("husongFind",false)
    return go(find,road.id_o,dest.room)
end
function husongFindFail()
    EnableTriggerGroup("husongFind",false)
    return go(husongLostDashi,road.id_o,dest.room)
end
function husongGo()
    return go(husongStart,"��ɽ����","������")
end
function husongStart()
    EnableTriggerGroup("husongAsk",true)
    fight_prepare()
    flag.idle = nil
    exe('ask xuanci about job')
end
function husongAsk()
    EnableTriggerGroup("husongAsk",false)
    EnableTriggerGroup("husongAccept",true)
end
function husongBusy()
    EnableTriggerGroup("husongAccept",false)
	EnableTriggerGroup("husongFinish",false)
	job.hstime=os.time()-14*60
    return check_heal()
end
function husongQuit()
    EnableTriggerGroup("husongAccept",false)
	checkBags()
	return go(husongCunWeapon,"���ݳ�","�ӻ���")
end
function husongCunWeapon()
    weapon_unwield()
	exe('drop zhen')
    for p in pairs(Bag) do
	    if weaponStore[p] then
		   exe('cun '.. Bag[p].fullid)
		   exe('cun '.. Bag[p].fullid .. ' 2')
		   exe('cun '.. Bag[p].fullid .. ' 3')
		end
	end
	checkBags()
	return check_busy(husongjinhe,1)
end
function husongjinhe()
    local l_flag = false
	for p in pairs(Bag) do
	    if weaponStore[p] then
		   l_flag = true
		end
	end
    if l_flag then
	   return husongCunWeapon()
	end
	if Bag["����"] then
	   exe('cun jin he')
	end
	checkBags()
	return check_busy(husongCunBook)
end
function husongCunBook()
    if Bag["����"] then
	   return husongCunJinhe()
	end
	if Bag["���콳����ƪ"] or Bag["����������ƪ"] then
	   exe('cun book')
	end
	checkBags()
	return check_busy(husongCunHammer)
end
function husongCunHammer()
    if Bag["���콳����ƪ"] or Bag["����������ƪ"] then
	   return husongCunBook()
	end
	if Bag["Τ��֮��"] then
	   exe("cun weilan's hammer")
	end
	checkBags()
	return check_busy(husongCunQuit)
end
function husongCunQuit()
    if Bag["Τ��֮��"] then
	   return husongCunHammer()
	end
    flag.quit=true
    wait.make(function()
         exe('quit')
	     wait.time(2)
		 exe('quit')
		 wait.time(5)
		 exe('look')
	end)
end
function husongFail()
    EnableTriggerGroup("husongAccept",false)
	job.zuhe["husong"] = nil
	dis_all()
	return husongQuest()
end
function husongFinishExp(n,l,w)
    nobusy=0
    exe('unset env_msg')
    tmp.jiaotu = tmp.jiaotu or 0
    messageShow('���ֻ��ͽ������ɵ���'.. tmp.jiaotu ..'����ħ�̽�ͽ����þ���:��'.. w[2] ..'���㣬��Ǳ��:��'.. w[3] ..'���㣡','darkorange')
	return husongFinish()
end
function husongFinishQuest(n,l,w)
    if Trim(w[2]) == job.target then
	   messageShow('���ֻ������񣺻�������ָѧϰ��ʾ��','red')
	   --dis_all()
	   --return husongQuest()
	   tmp.wxjz = true
	end
end
function husongQuest()
    return go(husongQuestAsk,"��ɽ����","������")
end
function husongQuestAsk()
    exe('askk fangsheng about �����似')
	return check_heal()
end
function husongFinish()
   EnableTriggerGroup("husongAccept",false)
	messageShow('���ֻ����������������')
	wait.make(function()
	   wait.time(1.5)
	   if tmp.wxjz then
	      dis_all()
	      return husongQuest()
	      end
		  return check_food()
	end)
end
function husongConsider(n,l,w)
	nobusy=1
	messageShow('���ֻ�����������ʼ��')
    job.hstime=os.time()
    EnableTriggerGroup("husongAccept",false)
    job.target=Trim(w[2])
    job.killer={}
    job.where=Trim(w[3])
	if job.where=="��¥" then job.where="��¥�߲�" end
	if job.where=="��¥" then job.where="��¥�߲�" end
    job.where="��ɽ����".. job.where
    job.room,job.area=getAddr(job.where)
    dest.room=job.room
    dest.area=job.area
	tmp.jiaotu=0
    if not job.room or not path_cal() then
       messageShow('���ֻ�����������ص㡾'..job.where..'�����ɵ�����������')
       return check_bei(husongFail)
    end
    messageShow('���ֻ������񣺿�ʼǰ����'..job.where..'����')
	return go(husongDashi,dest.area,dest.room)
end
function husongDashi()
    if locl.room~=job.room then
	   return go(husongDashi,job.area,job.room)
	end
	if not locl.id[job.target] then
	   return husongBusy()
	end
	return husongDashiAsk()
end
function husongDashiAsk()
    EnableTriggerGroup("husongDashiAsk",true)
    exe("ask ".. score.id .."'s dashi about ��Ԯ")
end
function husongDashiStart()
    flag.idle = nil
      exe('���ֻ���������')
      exe('set env_msg')
    EnableTriggerGroup("husongDashiAsk",false)
	EnableTriggerGroup("husongFinish",true)
	local path, len = map:getPath(road.id,"hengshan/baiyunan")
	road.husong=utils.split(path,";")
	return checkWait(husongStep,2)
end
function husongStep()
       flag.idle = nil
       EnableTriggerGroup("husongFinish",true)
       if locl.room=="������" then
	      return
	   end
	   if type(road.husong)~="table" then
	      return husongWhere()
	   end
	   if table.getn(road.husong)==0 then
	      return husongWhere()
	   end
	   if hp.qixue_per<60 then
	      exe('fu dan')
	   end
	   road.step = road.husong[1]
	   if isNil(road.step) or road.step=="halt" or road.step=="open gate" then
	      table.remove(road.husong,1)
	      return husongStep()
	   end
	   EnableTriggerGroup("husongJiaotu",true)
	   flag.jiaotu=nil
	   flag.lost=nil
	   if locl.room=="ɽ�ŵ�" then
	      exe('open gate')
	   end
	   if locl.room=="�ɴ�" then
	      return husongBoat()
	   end
	   if locl.room=="�½��ɿ�" and road.id=="changan/road2" then
		  exe('yell boat;enter')
		  -- ain
		  return check_halt(husongBoat)
	   end
	   exe(road.step)
	   exe('hp')
	   return check_halt(husongLocate)
end
function husongBoat()
    flag.idle = nil
       locate()
	   return check_busy(husongBoatChk)
end
function husongBoatChk()
    flag.idle = nil
       if locl.room=="�ɴ�" then
	      if not locl.id[job.target] then
		     exe('out')
			 locate()
			 checkWait(husongStep,1)
		  end
	      return husongBoatWait()
	   else
	      return checkWait(husongStep,2)
	   end
end
function husongBoatWait()
    flag.idle = nil
       DeleteTriggerGroup("husongBoat")
       create_trigger_t('husongBoat1','^>*\\s*(˵�Ž�һ��̤�Ű���ϵ̰����γ�һ����ȥ|�ɴ��͵�һ���Ѿ�����)','','husongBoatOut')
	   SetTriggerOption("husongBoat1","group","husongBoat")
end
function husongBoatOut()
    flag.idle = nil
    EnableTriggerGroup("husongBoat",false)
	exe('out')
	--road.id="changan/road3"
	--table.remove(road.husong,1)
	return check_halt(husongLocate)
end
function husongJiaotu(n,l,w)
    if w[2]== job.target then
	   tmp.jiaotu = tmp.jiaotu or 0
	   tmp.jiaotu = tmp.jiaotu + 1
	   return husongFight()
	end
end
function husongFight()
    flag.idle = nil
    flag.times=1
    dis_all()
    EnableTriggerGroup("husongJiaotu",false)
	EnableTriggerGroup("husongFight",true)
	EnableTriggerGroup("husongFinish",true)
    EnableTrigger("hpheqi1",true)
	flag.jiaotu=true
	exe('set wimpy 100')
	exe("compare ".. score.id .."'s jiaotu")
	exe("kill ".. score.id .."'s jiaotu")
	--exe('pfmpfm')
end
function husongCompare()
    --flag.jiaotu=true
	job.killer["ħ�̽�ͽ"]=score.id .."'s jiaotu"
	killPfm(score.id .."'s jiaotu")
end
function husongDie()
    flag.idle = nil
    exe("compare ".. score.id .."'s jiaotu")
end
function husongFightOver()
    EnableTriggerGroup("husongFight",false)
	flag.jiaotu=nil
	job.killer={}
    return husongLocate()
end
function husongLocate()
    DeleteTimer('husong')
    for i=1,2 do
	    exe('get silver from corpse '.. i)
	end
    if flag.jiaotu then
	   return
	end
    locate()
	return check_busy(husongChkDashi)
end
function husongChkDashi()
    flag.idle = nil
    if flag.lost then
	   flag.lost=nil
	   return husongDashiStart()
	end
    --if not flag.jiaotu then
	   table.remove(road.husong,1)
	   road.id=map.rooms[road.id].ways[road.step]
	--end
	flag.jiaotu=nil
	if isNil(road.id) then
	   return husongWhere()
	end
	if locl.room~=map.rooms[road.id].name then
	   return husongWhere()
	end
    if locl.id[job.target] then
	   if hp.neili<hp.neili_max then
		exe('eat '.. drug.neili3)
	      return prepare_neili(husongStep)
	   else
	      return husongStep()
	   end
	else
	   return husongLost()
	end
end
function husongWhere()
    flag.idle = nil
    if locl.area=="��֪������" then
	   if husongRoom[locl.room] then
	      road.id=husongRoom[locl.room]
		  messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'���ҵ���ʦ���������̡�')
		  return husongDashiStart()
	   else
	      --messageShow('���ֻ��������޷��ڵص㡾'.. locl.area .. locl.room ..'���������̣����������')
	      return husongLostDashi()
	   end
	elseif locl.room=="�½��ɿ�" then
	   messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'���ҵ���ʦ���������̡�')
	   if locl.exit["southeast"] or locl.exit["south"] then
	      road.id="changan/road2"
		  return husongDashiStart()
	   end
	   if locl.exit["north"] then
	      road.id="changan/road3"
		  return husongDashiStart()
	   end
	   locate()
	   return check_busy(husongWhere)
	else
	   if locl.room=="ʯ��" then 
	      road.id="shaolin/ting"
		  messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'���ҵ���ʦ���������̡�')
		  return husongDashiStart()
	   end
	   local l_rooms=getRooms(locl.room,locl.area)
	   if locl.area=="������" and locl.room=="���" then
	      local l_cnt = math.random(1,table.getn(l_rooms))
		  road.id=l_rooms[l_cnt]
		  messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'���ҵ���ʦ���������̡�')
		  return husongDashiStart()
	   end
	   if table.getn(l_rooms)==0 then
	      --messageShow('���ֻ��������޷��ڵص㡾'.. locl.area .. locl.room ..'���������̣����������')
	      return husongLostDashi()
	   else
	      local l_dest,l_distance=getNearRoom("shaolin/fumoquan",l_rooms)
		  if l_dest then
		     road.id=l_dest
			 messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'���ҵ���ʦ���������̡�')
			 return husongDashiStart()
		  else
		     --messageShow('���ֻ��������޷��ڵص㡾'.. locl.area .. locl.room ..'���������̣����������')
		     return husongLostDashi()
		  end
	   end
	end
end
function husongDashiDie(n,l,w)
    if w[2] == job.target then
	   return husongLostEver()
	end
end
function husongLostEver()
    dis_all()
    nobusy=0
    messageShow('���ֻ��������ڵص㡾'.. locl.area .. locl.room ..'����Զ��ʧȥ��ʦ�����������','blue')
	return husongBusy()
end
function husongLost()
    DeleteTriggerGroup("husongFind")
    create_trigger_t('husongFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)$','','husongTarget')
	create_trigger_t('husongFind2','^(> )*\\D*'..job.target..'�����˹�����','','husongTarget')
	create_trigger_t('husongFind3','^(> )*\\D*'..job.target..'��ʬ��\\((\\D*)\\)','','husongLostEver')
	create_trigger_t('husongFind4','^(> )*\\D*'..job.target..'\\((\\D*)\\) <���Բ���>$','','husongTargetWait')
	create_trigger_t('husongFind5','^(> )*\\D*'..job.target..'\\((\\D*)\\) <ս����>$','','husongTarget')
    SetTriggerOption("husongFind1","group","husongFind")
	SetTriggerOption("husongFind2","group","husongFind")
	SetTriggerOption("husongFind3","group","husongFind")
	SetTriggerOption("husongFind4","group","husongFind")
	SetTriggerOption("husongFind5","group","husongFind")
	--EnableTriggerGroup("husongFind",false)
	job.flag()
	messageShow('���ֻ��������ڡ�'.. locl.area .. locl.room ..'����ʧ��ʦ����ʼѰ�ң�')
	if locl.room=="��·" and road.id=="group/entry/canroad6" then
                exe("sw")
        end
	flag.idle = nil
	flag.lost=true
	road.id_o =road.id
	find()
end
function husongTargetWait()
    dis_all()
	flag.times=1
	EnableTriggerGroup("husongFinish",true)
	locate()
	DeleteTriggerGroup("husongFaint")
    create_trigger_t('husongFaint1','^(> )*\\D*'..job.target..'���Ӷ��˶������������˼��������ѹ���','','husongWake')
	SetTriggerOption("husongFaint1","group","husongFaint")
	create_timer_s('husong',50,'husongWake')
	--return check_busy(husongLostDashi)
end
function husongWake()
    EnableTriggerGroup("husongWake",false)
    return check_busy(husongLostDashi)
end
function husongTarget()
    flag.times=1
    DeleteTimer('husong')
    dis_all()
	EnableTriggerGroup("husongFinish",true)
	locate()
	return check_busy(husongLostDashi)
end
function husongLostDashi()
    DeleteTimer('husong')
    if locl.id[job.target] then
	   return husongFight()
	else
	   return husongLost()
	end
end