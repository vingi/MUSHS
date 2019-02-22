--songmoya
local Yptlastsk = {
	["烈焰刀"] = true,
	["烈火剑"] = true,
      ["圣火令法"] = true,
	["玄阴剑法"] = true,
}
local falsesk = {
	["玄阴剑法"] = true,
}
local fearsk = {
	["玄阴剑法"] = true,
}
local Yptdangersk = {
	["日月鞭法"] = true,
	["打狗棒法"] = true,
	["独孤九剑"] = true,
	["慕容剑法"] = true,
	["弹指神通"] = true,
	["辟邪剑法"] = true,
	["银索金铃"] = true,
	["灵蛇鞭法"] = true,
	["腾龙匕法"] = true,
	["玉箫剑法"] = true,
	["盘根错结斧"] = true,
	["金刚降伏轮"] = true,
}

function SmyTrigger()
    DeleteTriggerGroup("gbluAsk")
    create_trigger_t('gbluAsk1',"^(> )*你向鲁有脚打听有关",'','gbluAsk')
    create_trigger_t('gbluAsk2',"^(> )*这里没有这个人。$",'','gbluNobody')
    SetTriggerOption("gbluAsk1","group","gbluAsk")
    SetTriggerOption("gbluAsk2","group","gbluAsk")
    EnableTriggerGroup("gbluAsk",false)
    DeleteTriggerGroup("gbluAccept")
    create_trigger_t('gbluAccept1',"^(> )*鲁有脚说道：「颂摩崖是西夏武士东来的必经之地，你速带几名弟子埋",'','check_food_ypt')
    create_trigger_t('gbluAccept2',"^(> )*鲁有脚说道：「您上次任务辛苦了，还是先休息一下再说吧。",'','gbluBusy')
    create_trigger_t('gbluAccept3',"^(> )*鲁有脚说道：「这个任务我已经交给",'','gbluBusy')
    create_trigger_t('gbluAccept4',"^(> )*鲁有脚说道：「我这里现在没有什么任务可以给你。",'','gbluBusy')
    create_trigger_t('gbluAccept5',"^(> )*鲁有脚说道：「你不是已经接过任务了吗？",'','gbluBusy')
    SetTriggerOption("gbluAccept1","group","gbluAccept")
    SetTriggerOption("gbluAccept2","group","gbluAccept")
    SetTriggerOption("gbluAccept3","group","gbluAccept")
    SetTriggerOption("gbluAccept4","group","gbluAccept")
    SetTriggerOption("gbluAccept5","group","gbluAccept")
    EnableTriggerGroup("gbluAccept",false)
    DeleteTriggerGroup("yptFight")
    create_triggerex_lvl('yptFight1','^看起来(\\D*)想杀死你！','','yptLook')
    create_trigger_t('yptFight2','^(> )*远处的山路传来一阵轻啸，隐约听得有人施展轻功飞驰而来。','','yptFightbegin')
    create_trigger_t('yptFight3','^(> )*你孤身一人纵身翻上了崖壁险绝之处。','','yptFightCheck')
    SetTriggerOption("yptFight1","group","yptFight")
    SetTriggerOption("yptFight2","group","yptFight")
    SetTriggerOption("yptFight3","group","yptFight")
    job.killer[sxjob.killer1]=false
    EnableTriggerGroup("yptFight",false)
end
job.list["songmoya"] = "颂摩崖抗敌任务"
function SmyTriggerDel()
    DeleteTriggerGroup("gbluAsk")
    DeleteTriggerGroup("gbluAccept")
    DeleteTriggerGroup("yptFight")
    DeleteTriggerGroup("ypt_fight")
    DeleteTriggerGroup("yptdz")
    DeleteTriggerGroup("ypt_weapon")
end
function gbluNobody()
    EnableTriggerGroup("gbluAsk",false)
    songmoya()
end
--------------------------------------------------------------------------------------------   以下代码为babycat@tj所提供。
function songmoya()
    SmyTrigger()
    yptteam=0
    nobusy=1
if doubleexp==1 and ebooktimes<40 then   --设定为开启双倍经验并且使用精英之书数量小于40本
	exe('score')
	exe('cond')
    if condition.ebook==nil then
	   condition.ebook=0
    end
	if condition.mingwu==nil then 
	   condition.mingwu=0
	end	
	need_smy_time=(smyteam*1)*125+300
 if  (condition.ebook==nil) or (condition.ebook>=need_smy_time) then
	 needebook=0
	 messageShow('判断双倍:双倍时间还有'..condition.ebook..'秒，时间够了，不用兑换')
	 messageShow('本周已使用精英之书'..ebooktimes..'次')
 elseif score.xiangyun=='死' or score.xiangyun=='衰' then
	 needebook=0
	 messageShow('判断双倍:双倍时间还有'..condition.ebook..'秒，当前理相为'..score.xiangyun..'，死衰不兑换咯')
	 messageShow('本周已使用精英之书'..ebooktimes..'次')
 else
     needebook=1
     messageShow('判断双倍:双倍时间还有'..condition.ebook..'秒，当前理相为'..score.xiangyun..'，时间不够做一轮了，要去兑换ebook')
 end

  if needebook~=0 then
      return go(ebook_get_ypt,'扬州城','当铺')
  else
      check_bei(check_mingwu_ypt)
  end
else
      job.time.b=os.time()
      return go(gbluBusyDazuo,"丐帮","土地庙")
end
end
function ebook_get_ypt()
     exe('duihuan ebook')
	 messageShow('当铺判断：双倍时间还有'..condition.ebook..'秒，双倍时间不够了，兑换一本！')
	 messageShow('本周已使用精英之书'..ebooktimes..'次')
     check_bei(check_mingwu_ypt)
end

 function check_mingwu_ypt()
 if (condition.mingwu==nil) or (condition.mingwu>=need_smy_time) or score.jjb<1000 or score.xiangyun=='死' or score.xiangyun=='衰' or score.xiangyun=='平' or score.xiangyun=='生' or score.xiangyun=='败' then
    needmingwu=0
	 messageShow('判断三倍:明悟时间还有'..condition.mingwu..'秒，不符合兑换条件，不用兑换')
  else
    needmingwu=1
	 messageShow('判断三倍:明悟时间还有'..condition.mingwu..'秒，三倍时间不够了，需要兑换明悟')
end
   if needmingwu~=0 then
      return go(mingwu_get_ypt,'扬州城','天阁斋')
    else
         job.time.b=os.time()
        go(gbluBusyDazuo,"丐帮","土地庙")
   end
 end
 function mingwu_get_ypt()
     exe('duihuan wheart')
	 messageShow('天阁斋判断：三倍时间还有'..condition.mingwu..'秒，三倍时间不够了，兑换明悟！')
	 job.time.b=os.time()
	 go(gbluBusyDazuo,"丐帮","土地庙")
end 
------------------------------------------------------------------------------------------------------------------------------- End
function gbluSmyWait()
    if locl.room~="颂摩崖" then
       return go(gbluSmyWait,"星宿海","颂摩崖")
    end
    EnableTriggerGroup("yptFight",true)
          exe('halt;unset no_kill_ap')
    messageShow('报效国家：已经到达【星宿海颂摩崖】！')
end
function gbluStart()
   EnableTriggerGroup("gbluAsk",true)
    job.name='songmoya'
    exe('ask lu youjiao about 报效国家')
end
function gbluAsk()
    EnableTriggerGroup("gbluAsk",false)
    EnableTriggerGroup("gbluAccept",true)
end
function gbluBusy()
    EnableTriggerGroup("gbluAccept",false)
    nobusy=0
    job.last="songmoya"
    mytime=os.time()+120
    return check_food()
end
function gbluBusyDazuo()
    prepare_lianxi(gbluStart)
end
function check_food_ypt()
   job.lat='songmoya'
   exe('hp')
   if hp.food<100 or hp.water<100 then
      return go(wudang_eat_ypt,'武当山','茶亭')
   else
      check_bei(gbluYpt)
   end
end
function wudang_eat_ypt()
   if locl.room=="茶亭" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(gbluYpt)
    else
       return go(wudang_eat_ypt,'武当山','茶亭')
    end
end
function gbluYpt()
    EnableTriggerGroup("gbluAccept",false)
    dis_all()
    job.time.b=os.time()
    job.last="songmoya"
    exe('nick 颂摩崖任务进行中')
    go(gbluSmyWait,"星宿海","颂摩崖")
    messageShow('报效国家：开始前往【星宿海颂摩崖】！')
end
function yptLook(n,l,w)
    if job.killer[sxjob.killer1]~=true then
    sxjob.killer1=tostring(w[1])
    yptjob.name1=sxjob.killer1
    job.killer[sxjob.killer1]=true
    fight.time.b=os.time()
    yptteam=yptteam+1
    return
    end
    if job.killer[sxjob.killer1]==true then
    sxjob.killer2=tostring(w[1])
    yptjob.name2=sxjob.killer2
    end
    --print(sxjob.killer1,sxjob.killer2)
    sxjob.id1='wu shi'
    sxjob.id2='wu shi'
    DeleteTriggerGroup("ypt_fight")
    --create_trigger_t('ypt_fight1','^>*\\s*\\D*'..sxjob.killer1..'\\((\\D*)\\)','','ypt_print_1')
    --create_trigger_t('ypt_fight2','^>*\\s*\\D*'..sxjob.killer2..'\\((\\D*)\\)','','ypt_print_2')
    --create_trigger_t('ypt_fight3','^(> )*此人看上去师承(\\D*)，擅长使用(\\D*)伤敌！','','ypt_chksk')
    --create_trigger_t('ypt_fight4','^(> )*此人看上去师承(\\D*)，擅长使用(\\D*)伤敌！','','ypt_chksk2')
    create_trigger_t('ypt_fight1','^>*\\s*(\\D*)「啪」的一声倒在地上','','ypt_kill_die')
    create_trigger_t('ypt_fight2','^>*\\s*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。','','ypt_kill_faint')
    create_trigger_t('ypt_fight3','^>*\\s*(看清楚一点，那并不是|你想攻击谁？)','','ypt_kill_over')
    create_trigger_t('ypt_fight4','^>*\\s*\\( 你气息不匀，暂时不能施用外功。\\)','','yptfail')
    create_trigger_t('ypt_fight5','^>*\\s*啊！总算双目没有被真正刺伤，你又可以看见事物啦！','','ypt_cimu')
    create_trigger_t('ypt_fight6','^(> )*你把 "ppp1" 设定为 "\\D*;perform\\s*(\\D*)\\s*" 成功完成。','','ypt_pfm1')
    create_trigger_t('ypt_fight7','^(> )*你把 "ppp2" 设定为 "\\D*;perform\\s*(\\D*)\\s*" 成功完成。','','ypt_pfm2')
     --你把 "ppp1" 设定为 "bei none;bei leg;jifa parry shenlong-tuifa;unwield bishou;unwield bian;jiali max;perform zhuiming wushi" 成功完成。
    create_trigger_t('ypt_catch_id','^>*\\s*西夏一品堂\\s*武士\\s*(\\D*)\\s*\\((\\D*)\\)\\n这是西夏一品堂从江湖上重金招聘的一名武林高手。\\n此人看上去师承\\D*，擅长使用(\\D*)伤敌！','','ypt_check_skills') --new
    SetTriggerOption("ypt_catch_id","multi_line","y") --new
    SetTriggerOption("ypt_catch_id","lines_to_match","3") --new
    EnableTrigger("ypt_catch_id",true) --new
    SetTriggerOption("ypt_fight1","group","ypt_fight") 
    SetTriggerOption("ypt_fight2","group","ypt_fight")
    SetTriggerOption("ypt_fight3","group","ypt_fight") 
    SetTriggerOption("ypt_fight4","group","ypt_fight")
    SetTriggerOption("ypt_fight5","group","ypt_fight") 
    SetTriggerOption("ypt_fight6","group","ypt_fight")
    SetTriggerOption("ypt_fight7","group","ypt_fight")
    --SetTriggerOption("ypt_fight8","group","ypt_fight")
    if skills["dugu-jiujian"] then
    DeleteTriggerGroup("ypt_weapon")
    create_trigger_t('ypt_weapon1',"^(他|她)装备着：$",'','npcWeapon')
    SetTriggerOption("ypt_weapon1","group","ypt_weapon")
    end
    exe('look wu shi 1;look wu shi 2')
end
function ypttest()
  sxjob.id1='wushi'
create_trigger_t('ypt_fight5','^(> )*你把 "ppp1" 设定为 "\\D*;perform\\s*(\\D*)\\s*" 成功完成。','','ypt_pfm1')
end
function ypt_pfm1(n,l,w)
--print(w[2],w[3])
   local pp1=string.lower(w[2])
   --print(pp1)
   create_alias('yptpp1','yptpp1','alias pp1 perform '.. pp1 ..';perform '.. pp1)
       exe('yptpp1')
end
function ypt_pfm2(n,l,w)
--print(w[2],w[3])
   local pp2=string.lower(w[2])
   --print(pp2)
   create_alias('yptpp2','yptpp2','alias pp2 perform '.. pp2 ..';perform '.. pp2)
       exe('yptpp2')
end
function ypt_cimu()
      exe('kill '..sxjob.id1)
      exe('kill '..sxjob.id2)
end
function ypt_print_1(n,l,w)
    EnableTrigger("ypt_fight1",false)
    EnableTrigger("ypt_fight4",false)
    sxjob.id1=string.lower(w[1])
 --print('sxjob.id1')
 --print(sxjob.id1)
 exe('look '..sxjob.id1)
end
function ypt_print_2(n,l,w)
    EnableTrigger("ypt_fight2",false)
    sxjob.id2=string.lower(w[1])
 --print('sxjob.id2')
 --print(sxjob.id2)
	   wait.make(function() 
          wait.time(0.5)
    EnableTrigger("ypt_fight3",false)
    EnableTrigger("ypt_fight4",true)
       exe('look '..sxjob.id2)
       end)
end
function ypt_check_skills(n,l,w)
	if sxjob.killer1==tostring(w[1]) then
		sxjob.id1=string.lower(w[2])  
		sxjob.skills1=tostring(w[3])
		if skills["dugu-jiujian"] then setpo=yptsetpo[sxjob.skills1] end
--print(sxjob.id1)
--print(sxjob.skills1)
		if yptteam*1 > 7 then
		  if falsesk[yptjob.skills1] then
			 exe('halt;down')
			 return yptfail()
		  end
		end
   if Yptlastsk[sxjob.skills1] then
      sxkiller1=1
   elseif Yptdangersk[sxjob.skills1] then
      sxkiller1=9
   else
      sxkiller1=5
   end
    if yptteam*1 > 10 then
      if fearsk[sxjob.skills1] then
      sxkiller1=0
      end
    end
    local l_cmd=GetVariable("performpre")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    if skillsjineng1[sxjob.skills1] then
    local l_cmd=GetVariable("pzhen")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng2[sxjob.skills1] then
    local l_cmd=GetVariable("pqi")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng3[sxjob.skills1] then
    local l_cmd=GetVariable("pgang")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng4[sxjob.skills1] then
    local l_cmd=GetVariable("prou")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng5[sxjob.skills1] then
    local l_cmd=GetVariable("pkuai")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng6[sxjob.skills1] then
    local l_cmd=GetVariable("pman")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng7[sxjob.skills1] then
    local l_cmd=GetVariable("pmiao")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng8[sxjob.skills1] then
    local l_cmd=GetVariable("pxian")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng9[sxjob.skills1] then
    local l_cmd=GetVariable("pfmmrjf")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng10[sxjob.skills1] then
    local l_cmd=GetVariable("pfmshlf")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    if skillsjineng11[sxjob.skills1] then
    local l_cmd=GetVariable("pfmwu")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp1 '.. l_cmd ..' '..sxjob.id1)
       exe('yptpfm1')
    end
    messageShow('当前组第一个武士：姓名【'..sxjob.killer1..'】，ID【'..sxjob.id1..'】，使用技能【'..sxjob.skills1..'】！')
   end

	if sxjob.killer2==tostring(w[1]) then
		sxjob.id2=string.lower(w[2])  
		sxjob.skills2=tostring(w[3])
		if skills["dugu-jiujian"] then setpo=yptsetpo[sxjob.skills2] end 
    if yptteam*1 > 7 then
      if falsesk[sxjob.skills2] then
         exe('halt;down')
         return yptfail()
      end
    end
--print(sxjob.id2)
--print(sxjob.skills2)
   if Yptlastsk[sxjob.skills2] then
      sxkiller2=1
   elseif Yptdangersk[sxjob.skills2] then
      sxkiller2=9
   else
      sxkiller2=5
   end
    if yptteam*1 > 10 then
      if fearsk[sxjob.skills2] then
      sxkiller2=0
      end
    end
    local l_cmd=GetVariable("performpre")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm1','yptpfm1','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm1')
    if skillsjineng1[sxjob.skills2] then
    local l_cmd=GetVariable("pzhen")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng2[sxjob.skills2] then
    local l_cmd=GetVariable("pqi")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng3[sxjob.skills2] then
    local l_cmd=GetVariable("pgang")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng4[sxjob.skills2] then
    local l_cmd=GetVariable("prou")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng5[sxjob.skills2] then
    local l_cmd=GetVariable("pkuai")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng6[sxjob.skills2] then
    local l_cmd=GetVariable("pman")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng7[sxjob.skills2] then
    local l_cmd=GetVariable("pmiao")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng8[sxjob.skills2] then
    local l_cmd=GetVariable("pxian")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng9[sxjob.skills2] then
    local l_cmd=GetVariable("pfmmrjf")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng10[sxjob.skills2] then
    local l_cmd=GetVariable("pfmshlf")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
    if skillsjineng11[sxjob.skills2] then
    local l_cmd=GetVariable("pfmwu")
    if skills["dugu-jiujian"] then l_cmd=setpo..';'..l_cmd end
      create_alias('yptpfm2','yptpfm2','alias ppp2 '.. l_cmd ..' '..sxjob.id2)
       exe('yptpfm2')
    end
  messageShow('当前组第二个武士：姓名【'..sxjob.killer2..'】，ID【'..sxjob.id2..'】，使用技能【'..sxjob.skills2..'】！')
  return checkWait(yptKillgo,0.5)
  end
end
function yptKillgo()
    EnableTrigger("yptFight1",false)
    EnableTrigger("ypt_catch_id",false)
    if yptteam*1 > 10 then
      if sxkiller1*1==0 and sxkiller2*1==0 then
         exe('halt;down')
         return yptfail()
      end
    end
    hqpd=1
    exe('kill '..sxjob.id1)
    exe('kill '..sxjob.id2)
    if perform.force and perform.force=="dulong-dafa" then
      if not flag.wudi or flag.wudi==0 then
       exe('yun wudi')
      else
       print('神龙无敌正在运行中。')
      end
    end
    exe('jiali 0;set wimpycmd pfmbuff\\hp;set wimpy 100')
   --[[if sxkiller1 > sxkiller2 then
    if skills["dugu-jiujian"] then exe('look '..sxjob.id1) end
    exe('kill '..sxjob.id1)
    exe('kill '..sxjob.id2)
    exe('set wimpycmd ppp1\\hp;set wimpy 100')
       return
   end
   if sxkiller2 > sxkiller1 then
    if skills["dugu-jiujian"] then exe('look '..sxjob.id2) end
    exe('kill '..sxjob.id2)
    exe('kill '..sxjob.id1)
    exe('set wimpycmd ppp2\\hp;set wimpy 100')
       return
   end
   if sxkiller1 == sxkiller2 then
    if skills["dugu-jiujian"] then exe('look '..sxjob.id1) end
    exe('kill '..sxjob.id1)
    exe('kill '..sxjob.id2)
    exe('set wimpycmd ppp1\\hp;set wimpy 100')
       return
   end]]
end
function ypt_kill_faint(n,l,w)
    if w[1]==sxjob.killer1 then
      yptjob.name1='无威胁'
       exe('kill '..sxjob.id1)
       exe('set wimpycmd ppp2\\pp2\\hp')
       hqpd=0
    end
    if w[1]==sxjob.killer2 then
      yptjob.name2='无威胁'
       exe('kill '..sxjob.id2)
       exe('set wimpycmd ppp1\\pp1\\hp')
       hqpd=0
    end    
end
function ypt_kill_die(n,l,w)
    if w[1]==sxjob.killer1 then
    yptjob.name1='无威胁'
    exe('set wimpycmd ppp2\\pp2\\hp')
    hqpd=0
	   wait.make(function() 
          wait.time(1)
          exe('fight '.. sxjob.id2)
       end)
    end
    if w[1]==sxjob.killer2 then
    yptjob.name2='无威胁'
    exe('set wimpycmd ppp1\\pp1\\hp')
    hqpd=0
	   wait.make(function() 
          wait.time(1)
          exe('fight '.. sxjob.id1)
       end)
    end
end
function ypt_kill_over()
    exe('unset wimpy')
    EnableTrigger("ypt_weapon1",false)
    EnableTriggerGroup("ypt_weapon",false)
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
    messageShowT('报效国家任务：当前死亡次数【'.. smydie ..'】次！杀死第【'..yptteam..'】组武士，战斗用时:【'..fight.time.over..'】秒。')
    print('正在颂摩崖任务中，当前死亡次数【'.. smydie ..'】次！杀死第【'.. yptteam ..'】组武士完成。设定杀死武士组数上限为【'.. smyteam ..'】组。')
    if yptteam*1 >= smyteam*1 then
       return check_halt(fangqiypt)
    end
    EnableTrigger("yptFight1",true)
	job.killer={}
    EnableTriggerGroup("yptdz",true)
    exe('yun jing;yun jingli;yun qi;hp')
    return check_busy(ckypt)
end
function yptfail()
yptjob.fengzhao=true
    exe('set wimpycmd halt\\down\\hp')
end
function ckypt()
    if hp.qixue_per<65 then
       return check_halt(fangqiypt)
    end
    exe('score')
    return yptFightCheck()
end
function fangqiypt()
    exe('down')
end
function yptFightCheck()
  print('开始打坐！')
  flag.idle = nil
    DeleteTriggerGroup("yptdz")
    create_trigger_t('yptdz1',"^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",'','yptdazuo_desc')
    create_trigger_t('yptdz2',"^(> )*(你运起玄天无极神功，气聚丹田|你手捏剑诀，将寒冰真气|你盘膝而坐，运起八荒六合唯我独尊功|你运起纯阳神通功，片刻之间|你抉弃杂念盘膝坐定，手捏气诀|你盘膝坐下，默运天魔大法|你凝神静气，盘坐下来|你随意坐下，双手平放在双膝，默念口诀|你手捏绣花针，盘膝坐下，默运葵花神功|你坐下来运气用功，一股内息开始在体内流动|你慢慢盘膝而坐，双手摆于胸前|你五心向天，排除一切杂念，内息顺经脉缓缓流动|你盘膝坐下，双手合十置于头顶，潜运内力|你屏息静气，坐了下来，左手搭在右手之上|你盘膝坐下，垂目合什，默运枯荣禅功|你盘膝坐下，闭目合什，运起乾天一阳神功|你盘膝坐下，暗运内力，试图采取天地之精华|你轻轻的吸一口气，闭上眼睛，运起玉女心经|你盘腿坐下，双目微闭，双手掌心相向成虚握太极|你气运丹田，将体内毒素慢慢逼出，控制着它环绕你缓缓飘动|你盘膝而坐，双手垂于胸前成火焰状，深吸口气|你盘膝而坐，运使九阳，气向下沉|你随意坐下，双手平放在双膝，默念口诀|你随意一站，双手缓缓抬起，深吸一口气|你盘膝而坐，双目紧闭，深深吸一口气引入丹田|你席地而坐，五心向天，脸上红光时隐时现|你暗运临济十二庄，气聚丹田|你收敛心神闭目打坐，手搭气诀，调匀呼吸，感受天地之深邃，自然之精华，渐入无我境界)",'','yptdazuobegin_desc')
    create_trigger_t('yptdz3',"^(> )*(你的内力修为已经达到圆满之境|你的内力修为已经无法靠打坐来提升了)",'','yptDzover')
    SetTriggerOption("yptdz1","group","yptdz")
    SetTriggerOption("yptdz2","group","yptdz")
    SetTriggerOption("yptdz3","group","yptdz")
    EnableTriggerGroup("yptdz",true)
    if perform.force and perform.force=="bihai-chaosheng" then
       exe('yun maze')
    end
    prepare_neili_stop()
    return check_busy(yptheal)
end
function yptheal()
   exe('unset 积蓄;yun heal')
 check_bei(yptdazuo_desc,3)
end
function yptdazuo_desc()
   if ypt_lianskills==1 then
    exe('yun jingli;yun jing;yun qi;sxlian;dazuo '..hp.dazuo)
   else
    exe('yun qi;dazuo '..hp.dazuo)
   end
end
yptdazuobegin_desc=function()
    DeleteTimer("ydz")
end
function yptFightCon()
   EnableTriggerGroup("yptFight",true)
end
function yptFightbegin()
    DeleteTimer("ydz")
    EnableTriggerGroup("yptdz",false)
    EnableTrigger("hpheqi1",true)
    check_halt(yptHaltover)
end
function yptDzover()
    DeleteTimer("ydz")
    EnableTriggerGroup("yptdz",false)
    EnableTrigger("hpheqi1",true)
    exe('halt')
      wait.make(function() 
       wait.time(2)
       exe('halt;yun qi;yun jingli;yun jing')
       print('打座完毕，等待准备中！')
    end)
end
function yptHaltover()
        exe('halt;yun qi;yun jingli;yun jing')
        if perform.force and perform.force=="bihai-chaosheng" then
       exe('yun maze')
    end
    if score.id and score.id=='ptbx' then exe('wield taibai sword') end
        	print('准备完毕，坏人快出来！')
end
function job_gblu_fail()
   SmyTriggerDel()
   job.name=nil
   nobusy=0
   yptjob.fengzhao=false
   messageShow('报效国家：完成失败！')
       job.time.e=os.time()
       job.time.over=job.time.e-job.time.b
    messageShowT('报效国家任务：任务失败，用时:【'..job.time.over..'】秒。')
    return check_food()
end
function gbluFinish()
    SmyTriggerDel()
    job.name=nil
    nobusy=0
    yptjob.fengzhao=false
    messageShow('报效国家：完成任务！')
       job.time.e=os.time()
       job.time.over=job.time.e-job.time.b
    messageShowT('报效国家任务：任务完成，用时:【'..job.time.over..'】秒。')
       mytime=job.time.e+2400
       exe('set whdmd 断')
       messageShow('设定smy等待时间为当前系统时间['..mytime..']')
    --return check_food()
    return go(wudang_eat_lingwu,'武当山','茶亭')
end
function wudang_eat_lingwu()
   if locl.room=="茶亭" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(lingwu)
    else
       return go(wudang_eat_lingwu,'武当山','茶亭')
    end
end