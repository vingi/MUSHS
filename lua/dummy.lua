---杀大米
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
        create_triggerex_lvl('mydummy1','^(> )*(\\! )*【'..score.party..'】\\D*\\(\\N*\\)：听说有个(\\D*)假冒(\\D*)(容|派|帮|寺|岛|教|0)(\\D*)\\((\\D*)\\)之名，在(\\D*)一带','','trundummy',97)
        --^(> )*【(丐帮|铁掌帮|天龙寺|明教|星宿派|姑苏慕容|神龙教|华山派|武当派|嵩山派|桃花岛|少林派|峨嵋派)】
          --create_trigger_t('mydummy1','【'..score.party..'】(\\D*)假冒(\\D*)(容|派|帮|寺|岛|教|0)(\\S*)\\((\\D*)\\)之名，在(\\D*)一带','','trundummy')
        SetTriggerOption("mydummy1","group","hp")
        mydummy=false
        if score.party=='神龙教' then map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8" end
        print('开启杀大米')
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
      messageShow('杀大米任务：任务地点【'..job.where4..'】不可到达，任务放弃。','red')
      return check_bei(dummyover) 
    end
  else
    messageShow('杀大米任务：任务地点出错，【'..job.where4..'】不存在，任务放弃。','red')
    return check_bei(dummyover)
  end
       if locl.area=='不知道哪里' then
         locate()
         exe(locl.dir)
         messageShow('杀大米任务：无法确定当前地点，随机移动地点，重新计算路径','greenyellow')
          wait.make(function() 
             wait.time(1)
             dummyfind()
          end)
         return
      end
    dest.room=job.room
    dest.area=job.area
  if job.room==nil or not path_cal() then
       messageShow('杀大米任务：任务地点【'..job.where4..'】不能到达，任务放弃。','red')
       return check_bei(dummyover)
  end
  exe('nick 大米在'..job.where4)
  exe('set env_msg')
  messageShow('杀大米任务：开始前往【'..job.where4..'】！','red')
    check_halt(dummy_find_go)
end
function dummy_find_go()
    DeleteTriggerGroup("dummyfind")
    create_trigger_t('dummyfind1','^>*\\s*\\D*'..job.target4..'\\((\\D*)\\)','','dummyco')
    create_trigger_t('dummyfind2','^(> )*(他|她)的(武艺|武功)看','','dummylevel')
    create_trigger_t('dummyfind3',"^  □(竹棒|长剑|长鞭|一块铁令|钢刀|箫)\\(",'','xueshan_judge_weapon')
    create_trigger_t('dummyfind4',"^(他|她)装备着：$",'','npcWeapon')
    create_trigger_t('dummyfind5','^(> )*dummy 不在这里$','','dummy_goon')
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
    if score.party=='神龙教' then map.rooms["sld/lgxroom"].ways["#outSld"]=nil end    
    job.flag()
    exe('look')
    messageShow('大米任务：大米【'..job.target4..'】在【'..job.room..'】一带出现，开始寻找！','greenyellow') 
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
    if string.find(job.level,"武艺") then
    return dummy_judge()
    end
    messageShow('打不过【'..job.target4..'】的大米，放弃任务！','red')
    return dummyover()
end
function dummykill()
    DeleteTriggerGroup('dummykill')
    create_trigger_t('dummy1kill','^>*\\s*(\\D*)「啪」的一声倒在地上','','dummyover')
    create_trigger_t('dummy2kill','^>*\\s*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。','','dummy_kill_faint')
    create_trigger_t('dummy3kill','^(> )*这里不准战斗。','','dummy_kill_nofight')
    SetTriggerOption("dummy1kill","group","dummykill") 
    SetTriggerOption("dummy2kill","group","dummykill")
    SetTriggerOption("dummy3kill","group","dummykill")
    exe('unset no_kill_ap')
    exe('kill '..job.id3)
    exe('set wimpycmd pfmpfm\\hp;set wimpy 100')
    messageShow('杀大米：开始杀大米：【'..job.target4..'】！','greenyellow')
    create_timer_s('dummy',5,'dummyMove')
    if score.party=='神龙岛' then
	     messageShow('门派神龙岛.杀大米：yun wudi','greenyellow')
	     exe('yun wudi')
	  end
	  if score.party=='古墓派' then
	     messageShow('门派古墓派.杀大米：yun xinjing','greenyellow')
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
    job.skill='无'
    messageShow('杀大米：大米来自【'..job.party2..'】！','greenyellow')
    if job.party2 and job.party2=='姑苏慕' and job.weapon=='sword' then
       messageShow('杀大米：遇到姑苏慕容，装备武器：长剑。使用慕容剑法专用PFM！','greenyellow')
	   exe('pfmmrjf')
    end
    if job.party2 and job.party2=='姑苏慕' and job.weapon=='blade' then
       messageShow('杀大米：遇到姑苏慕容，装备武器：钢刀。使用妙属性PFM！','greenyellow')
	   exe('pfmmiao')
    end
    if job.party2 and job.party2=='明' and job.weapon=='dagger' then
       messageShow('杀大米：遇到明教，装备武器：一块铁令。使用圣火令法专用武器PFM！','greenyellow')
	   exe('pfmshlf')
    end    
    if job.party2 and job.party2=='少林' and job.weapon=='whip' then
       messageShow('杀大米：遇到少林，装备武器：长鞭。使用险属性PFM！','greenyellow')
	   exe('pfmxian')
    end
    if job.party2 and job.party2=='古墓' and job.weapon=='unarmed' then
       messageShow('杀大米：遇到古墓派，装备武器：空手。使用奇属性PFM！','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='古墓' and job.weapon=='sword' then
       messageShow('杀大米：遇到古墓派。使用快属性PFM！','greenyellow')
	   exe('pfmkuai')
	elseif job.party2 and job.party2=='古墓' then
       messageShow('杀大米：遇到古墓派，使用刚属性PFM！','greenyellow')
       exe('pfmgang')
    end
    if job.party2 and job.party2=='峨嵋' then
       messageShow('杀大米：遇到峨嵋。使用正属性PFM！','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='丐' and job.weapon=='stick' then
       messageShow('杀大米：遇到丐帮，装备武器：竹棒。使用奇属性PFM！','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='丐' then
       messageShow('杀大米：遇到丐帮。使用正属性PFM！','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='武当' and job.weapon=='blade' then
       messageShow('杀大米：遇到武当，装备武器：钢刀。使用奇属性PFM！','greenyellow')
	   exe('pfmqi')
       elseif job.party2 and job.party2=='武当' then
       messageShow('杀大米：遇到武当。使用正属性PFM！','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='桃花' then
       messageShow('杀大米：遇到桃花岛。使用奇属性PFM！','greenyellow')
	   exe('pfmxian')
    end
    if job.party2 and job.party2=='华山' then
       messageShow('杀大米：遇到华山。使用正属性PFM！','greenyellow')
	   exe('pfmzhen')
    end
    if job.party2 and job.party2=='昆仑' and job.weapon=='sword' then
       messageShow('杀大米：遇到昆仑派。武功：剑法。使用柔属性PFM！！','greenyellow')
	   exe('pfmrou')
    end
    if job.party2 and job.party2=='昆仑' and job.weapon=='unarmed' then
       messageShow('杀大米：遇到昆仑派。武功：昆仑叠掌or穿云腿法。使用刚属性PFM！！','greenyellow')
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
    if score.party=='神龙教' then map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8" end
    job.target4=nil
    job.where4=nil
    job.party2=nil
    job.id3=nil
   DeleteTriggerGroup("dummyfind")
   DeleteTriggerGroup("dummykill")
   DeleteTriggerGroup("dummy")
   return go(Sellyushi,'襄阳城','当铺')
end
function Sellyushi()
   if locl.room=="当铺" then
       exe('sell yushi')
           messageShow('Kill Dummy Is Over！','red')
       check_bei(check_food)
    else
       return go(Sellyushi,'襄阳城','当铺')
    end
end