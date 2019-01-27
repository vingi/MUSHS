------长乐帮
function clbTrigger()
	DeleteTriggerGroup("clbAsk")
    create_trigger_t('clbAsk1',"^(> )*你向贝海石打听有关",'','clbAsk')
    create_trigger_t('clbAsk2',"^(> )*这里没有这个人。$",'','clbNobody')
    SetTriggerOption("clbAsk1","group","clbAsk")
    SetTriggerOption("clbAsk2","group","clbAsk")
    EnableTriggerGroup("clbAsk",false)
    DeleteTriggerGroup("clbAccept")
    create_trigger_t('clbAccept1',"^(> )*贝海石在你的耳边悄声说道：我接到飞鸽传书，(龙灵堂|狮威堂|熊敏堂|虎猛堂|豹捷堂)属下帮众(\\D*)在(\\D*)处遇到袭击",'','clbConsider')
    create_trigger_t('clbAccept2',"^(> )*贝海石说道：「(你不是已经知道了|啊……，对不起|你不是已经进展|我不是告诉你了吗)",'','clbFangqi')
    create_trigger_t('clbAccept3',"^(> )*贝海石说道：「你刚做完长乐帮任务",'','clbFail')
    create_trigger_t('clbAccept4',"^(> )*贝海石说道：「(我帮现在比较空闲|现在我这里没有给你的任务|暂时没有任务需要做)",'','clbBusy')
    create_trigger_t('clbAccept5',"^(> )*贝海石说道：「你刚做完(惩恶扬善|大理送信)任务",'','clbBusy')
    create_trigger_t('clbAccept6',"^(> )*贝海石说道：「现在暂时没有适合你的工作",'','clbBusy')
    create_trigger_t('clbAccept7',"^(> )*贝海石说道：「暂时没有任务需要做，你过一会儿再来吧",'','clbBusy')
    create_trigger_t('clbAccept8',"^(> )*贝海石说道：「既然你无法完成",'','clbFail')
    create_trigger_t('clbAccept9',"^(> )*贝海石说道：「你根本就没有领任务",'','clbFail')
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
    --create_trigger_t('clbChakan1','^(> )*你仔细地查看','','clbBack')
    create_trigger_t('clbChakan1','^(> )*看来只能查看到这步了，还是先回去交差吧。','','clbCkBack')
	create_trigger_t('clbChakan2','^(> )*(\\D*)「啪」的一声倒在地上','','clbDie')
	--create_trigger_t('clbChakan3','^(> )*你把 "action" 设定为 "chakan" 成功完成。$','','clbCkBack')
	create_trigger_t('clbChakan3','^(> )*你暗下寻思询问(\\D*)的(\\D*)\\((\\D*)\\)或许能得到提示，传闻(他|她)曾在(\\D*)附近出现。','','clbwho')
    SetTriggerOption("clbChakan1","group","clbChakan")
	SetTriggerOption("clbChakan2","group","clbChakan")
	SetTriggerOption("clbChakan3","group","clbChakan")
    EnableTriggerGroup("clbChakan",false)
    DeleteTriggerGroup("clbFinish")
    create_trigger_t('clbFinish1','^(> )*贝海石说道：「(你根本就没有领任务|既然已经知道了是|哎，可惜不能手刃此奸贼|做的好！这些金子)','','clbFinish')
    create_trigger_t('clbFinish2',"^(> )*贝海石说道：「你真的完成任务了",'','clbFangqi')
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
job.list["clb"] = "长乐帮任务"
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
       return go(clbFangqi,"长乐帮","小厅")
    end
end
function clbGo()
    return go(clbaskjob,"长乐帮","小厅")
end
function clbaskjob()
    if newbie==1 then return zhunbeineili(clbStart) else return clbStart() end
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
	messageShow('长乐帮任务：任务开始。')
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
       messageShow('长乐帮任务：任务地点【'..job.where..'】不可到达，任务放弃。')
       return check_halt(clbFangqi)
    end
    exe('nick 长乐帮'..job.where)
    messageShow('长乐帮任务：开始前往【'..job.where..'】！')
	return check_halt(clbFind)
end
function clbFangqiGo()
    go(clbFangqi,'长乐帮','小厅')
end
function clbFangqi()
exe('nick 长乐帮任务放弃')
flag.idle = nil
clb2=false
    EnableTriggerGroup("clbAsk",true)
    EnableTriggerGroup("clbAccept",false)
    EnableTriggerGroup("clbFinish",false)
    check_halt(clbFangqiAsk)
end
function clbFangqiAsk()
	nobusy=0
    exe('ask bei haishi about 放弃')
end
function clbFind()
    DeleteTriggerGroup("clbFind")
    create_trigger_t('clbFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','clbTarget')
	create_trigger_t('clbFind2','^(> )*\\D*'..job.target..'的尸体\\((\\D*)\\)','','clbTarget')
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
	messageShow('长乐帮任务：开始寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
    return find()
end
function clbTarget(n,l,w)
    EnableTriggerGroup("clbFind",false)
    dis_all()
   if job.clb2==true then
		job.id=string.lower(w[2])
		job.killer[job.target]=job.id
		exe('unset no_kill_ap')
		clbfight()  --调用战斗
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
	elseif locl.id[job.target ..'的尸体'] then
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
    messageShow("任务监控：长乐帮询问的玩家是【"..w[2].."】的【"..w[3].."】，id【"..w[4].."】，位于【"..w[6].."】","deepskyblue")
        job.playername=Trim(w[3])
        job.playerid=string.lower(tostring(Trim(w[4])))
        job.where2=Trim(w[6])
        job.where2=addrTrim(job.where2)    
        job.room2,job.area2=getAddr(job.where2)
		if not getAddr(job.where2) then 
			ColourNote ("gold","black","房间无法到达，自动返回!")
			return check_halt(clbBack)
		else
			messageShow('长乐帮任务⑵：开始前往【'..job.where2..'】寻找玩家！【'..w[3]..'】，id【'..w[4]..'】')
			return check_halt(clbFindPlayer)
		end
end
function clbFindPlayer()
    create_timer_s('xunWen',0.5,'xunWen')
    --print(job.where2,job.area2,job.room2)
    DeleteTriggerGroup("clb_xunwen")
    create_trigger_t('clb_xunwen4','^(> )*\\D*'..job.playername..'(\\D*)','','xWgood')
    create_trigger_t('clb_xunwen1','^(> )*\\D*在你的耳边悄声说道：适才(\\D*)弟子(\\D*)从我身边经过，好像前往了(\\D*)。','','clbConsider2')
	  create_trigger_t('clb_xunwen2','^(> )*\\D*在你的耳边悄声说道：刚才是有人从我身边经过，可惜我没看清楚他往哪个方向离开了。','','clbBack')
	  create_trigger_t('clb_xunwen3','^(> )*\\D*你不是已经询问过了？还不快去。','','clbBack')
    SetTriggerOption("clb_xunwen1","group","clb_xunwen")
    SetTriggerOption("clb_xunwen2","group","clb_xunwen")
    SetTriggerOption("clb_xunwen3","group","clb_xunwen")
    SetTriggerOption("clb_xunwen4","group","clb_xunwen")
  	EnableTriggerGroup("clb_xunwen",true)
  	DeleteTriggerGroup("clb_debug")
  	create_trigger_t('clb_debug1','^(> )*\\D*你(身旁有这个人么|不是已经询问过了)','','debugBack')
  	SetTriggerOption("clb_debug1","group","clb_debug")
  	EnableTriggerGroup("clb_debug",false)
    flag.times=1
    job.clb2=true
    return go(clbFindPAct,job.area2,job.room2) 
end
function debugBack()
    dis_all()
    return go(clbFinishWait,'长乐帮','小厅')
end
function clbFindPAct()
    EnableTriggerGroup("clb_xunwen",true)
    job.room=job.room2
    job.area=job.area2
    job.target=job.playerid
    job.flag()
    exe('look')
    exe('unset env_msg')
	messageShow('长乐帮任务⑵：开始寻找【'..job.area .. job.room ..'】的'..'【'.. job.playerid ..'】！')
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
      messageShow('长乐帮任务⑵：任务地点【'..job.where..'】不可到达，任务放弃。','red')
      return check_bei(clbBack) 
    end
  else
    messageShow('长乐帮任务⑵：任务地点出错，【'..job.where..'】不存在，任务放弃。')
    return check_bei(clbBack)
  end
       if locl.area=='不知道哪里' then
         locate()
         exe(locl.dir)
         messageShow('长乐帮任务⑵：无法确定当前地点，随机移动地点，重新计算路径','white')
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
       messageShow('长乐帮任务⑵：任务地点【'..job.where..'】不可到达，任务放弃。','red')
       return check_bei(clbBack)
  end
  exe('nick 长乐帮在'..job.where)
  exe('set env_msg')
  messageShow('长乐帮任务⑵：开始前往【'..job.where..'】！')
    return check_bei(clbFind)   	
	------------------------------
end
function clbfight()
	DeleteTriggerGroup("clbFight")
    create_trigger_t('clbFight1','^(> )*(\\D*)「啪」的一声倒在地上','','clbBack')
    create_trigger_t('clbFight2','^(> )*(\\D*)大喊一声：不好！！转身几个起落就不见了','','clbBack')
    create_trigger_t('clbFight3',"^(> )*(\\D*)看见你手中握着的粗布碎片，不由脸色大变，大喝道：既然已被你看破，你也就别活了！",'','clbKillAct')
  	create_trigger_t('clbFight4',"^(> )*(\\D*)大喊一声：老子不奉陪了！转身几个起落就不见了",'','clbBack')
    create_trigger_t('clbFight5','^>*\\s*一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……','','clbFangqiGo')
    create_trigger_t('clbFight6',"^(他|她)装备着：$",'','npcWeapon')
    create_trigger_t('clbFight7','^(> )*你要对谁做这个动作？','','clbFind')
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
    return go(clbFinishWait,'长乐帮','小厅')
end
function clbFinishWait()
	if locl.id["贝海石"] then
	   EnableTriggerGroup("clbFinish",true)
	   exe('ask bei haishi about 完成')
	else
	   return go(clbFinishWait,'长乐帮','小厅')
	end
end
function clbFinish()
	nobusy=0
	clb2=false
	  clbTriggerDel()
    EnableTriggerGroup("clbFinish",false)
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
	messageShowT('长乐帮任务：任务结束，用时:【'..job.time.over..'】秒。')
    return check_halt(check_food)
end