--songmoya
local Yptlastsk = {
	["���浶"] = true,
	["�һ�"] = true,
      ["ʥ���"] = true,
	["��������"] = true,
}
local falsesk = {
	["��������"] = true,
}
local fearsk = {
	["��������"] = true,
}
local Yptdangersk = {
	["���±޷�"] = true,
	["�򹷰���"] = true,
	["���¾Ž�"] = true,
	["Ľ�ݽ���"] = true,
	["��ָ��ͨ"] = true,
	["��а����"] = true,
	["��������"] = true,
	["���߱޷�"] = true,
	["����ذ��"] = true,
	["���｣��"] = true,
	["�̸���ḫ"] = true,
	["��ս�����"] = true,
}

function SmyTrigger()
    DeleteTriggerGroup("gbluAsk")
    create_trigger_t('gbluAsk1',"^(> )*����³�нŴ����й�",'','gbluAsk')
    create_trigger_t('gbluAsk2',"^(> )*����û������ˡ�$",'','gbluNobody')
    SetTriggerOption("gbluAsk1","group","gbluAsk")
    SetTriggerOption("gbluAsk2","group","gbluAsk")
    EnableTriggerGroup("gbluAsk",false)
    DeleteTriggerGroup("gbluAccept")
    create_trigger_t('gbluAccept1',"^(> )*³�н�˵��������Ħ����������ʿ�����ıؾ�֮�أ����ٴ�����������",'','check_food_ypt')
    create_trigger_t('gbluAccept2',"^(> )*³�н�˵���������ϴ����������ˣ���������Ϣһ����˵�ɡ�",'','gbluBusy')
    create_trigger_t('gbluAccept3',"^(> )*³�н�˵����������������Ѿ�����",'','gbluBusy')
    create_trigger_t('gbluAccept4',"^(> )*³�н�˵����������������û��ʲô������Ը��㡣",'','gbluBusy')
    create_trigger_t('gbluAccept5',"^(> )*³�н�˵�������㲻���Ѿ��ӹ���������",'','gbluBusy')
    SetTriggerOption("gbluAccept1","group","gbluAccept")
    SetTriggerOption("gbluAccept2","group","gbluAccept")
    SetTriggerOption("gbluAccept3","group","gbluAccept")
    SetTriggerOption("gbluAccept4","group","gbluAccept")
    SetTriggerOption("gbluAccept5","group","gbluAccept")
    EnableTriggerGroup("gbluAccept",false)
    DeleteTriggerGroup("yptFight")
    create_triggerex_lvl('yptFight1','^������(\\D*)��ɱ���㣡','','yptLook')
    create_trigger_t('yptFight2','^(> )*Զ����ɽ·����һ����Х����Լ��������ʩչ�Ṧ�ɳ۶�����','','yptFightbegin')
    create_trigger_t('yptFight3','^(> )*�����һ�����������±��վ�֮����','','yptFightCheck')
    SetTriggerOption("yptFight1","group","yptFight")
    SetTriggerOption("yptFight2","group","yptFight")
    SetTriggerOption("yptFight3","group","yptFight")
    job.killer[sxjob.killer1]=false
    EnableTriggerGroup("yptFight",false)
end
job.list["songmoya"] = "��Ħ�¿�������"
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
--------------------------------------------------------------------------------------------   ���´���Ϊbabycat@tj���ṩ��
function songmoya()
    SmyTrigger()
    yptteam=0
    nobusy=1
if doubleexp==1 and ebooktimes<40 then   --�趨Ϊ����˫�����鲢��ʹ�þ�Ӣ֮������С��40��
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
	 messageShow('�ж�˫��:˫��ʱ�仹��'..condition.ebook..'�룬ʱ�乻�ˣ����öһ�')
	 messageShow('������ʹ�þ�Ӣ֮��'..ebooktimes..'��')
 elseif score.xiangyun=='��' or score.xiangyun=='˥' then
	 needebook=0
	 messageShow('�ж�˫��:˫��ʱ�仹��'..condition.ebook..'�룬��ǰ����Ϊ'..score.xiangyun..'����˥���һ���')
	 messageShow('������ʹ�þ�Ӣ֮��'..ebooktimes..'��')
 else
     needebook=1
     messageShow('�ж�˫��:˫��ʱ�仹��'..condition.ebook..'�룬��ǰ����Ϊ'..score.xiangyun..'��ʱ�䲻����һ���ˣ�Ҫȥ�һ�ebook')
 end

  if needebook~=0 then
      return go(ebook_get_ypt,'���ݳ�','����')
  else
      check_bei(check_mingwu_ypt)
  end
else
      job.time.b=os.time()
      return go(gbluBusyDazuo,"ؤ��","������")
end
end
function ebook_get_ypt()
     exe('duihuan ebook')
	 messageShow('�����жϣ�˫��ʱ�仹��'..condition.ebook..'�룬˫��ʱ�䲻���ˣ��һ�һ����')
	 messageShow('������ʹ�þ�Ӣ֮��'..ebooktimes..'��')
     check_bei(check_mingwu_ypt)
end

 function check_mingwu_ypt()
 if (condition.mingwu==nil) or (condition.mingwu>=need_smy_time) or score.jjb<1000 or score.xiangyun=='��' or score.xiangyun=='˥' or score.xiangyun=='ƽ' or score.xiangyun=='��' or score.xiangyun=='��' then
    needmingwu=0
	 messageShow('�ж�����:����ʱ�仹��'..condition.mingwu..'�룬�����϶һ����������öһ�')
  else
    needmingwu=1
	 messageShow('�ж�����:����ʱ�仹��'..condition.mingwu..'�룬����ʱ�䲻���ˣ���Ҫ�һ�����')
end
   if needmingwu~=0 then
      return go(mingwu_get_ypt,'���ݳ�','���ի')
    else
         job.time.b=os.time()
        go(gbluBusyDazuo,"ؤ��","������")
   end
 end
 function mingwu_get_ypt()
     exe('duihuan wheart')
	 messageShow('���ի�жϣ�����ʱ�仹��'..condition.mingwu..'�룬����ʱ�䲻���ˣ��һ�����')
	 job.time.b=os.time()
	 go(gbluBusyDazuo,"ؤ��","������")
end 
------------------------------------------------------------------------------------------------------------------------------- End
function gbluSmyWait()
    if locl.room~="��Ħ��" then
       return go(gbluSmyWait,"���޺�","��Ħ��")
    end
    EnableTriggerGroup("yptFight",true)
          exe('halt;unset no_kill_ap')
    messageShow('��Ч���ң��Ѿ�������޺���Ħ�¡���')
end
function gbluStart()
   EnableTriggerGroup("gbluAsk",true)
    job.name='songmoya'
    exe('ask lu youjiao about ��Ч����')
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
      return go(wudang_eat_ypt,'�䵱ɽ','��ͤ')
   else
      check_bei(gbluYpt)
   end
end
function wudang_eat_ypt()
   if locl.room=="��ͤ" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(gbluYpt)
    else
       return go(wudang_eat_ypt,'�䵱ɽ','��ͤ')
    end
end
function gbluYpt()
    EnableTriggerGroup("gbluAccept",false)
    dis_all()
    job.time.b=os.time()
    job.last="songmoya"
    exe('nick ��Ħ�����������')
    go(gbluSmyWait,"���޺�","��Ħ��")
    messageShow('��Ч���ң���ʼǰ�������޺���Ħ�¡���')
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
    --create_trigger_t('ypt_fight3','^(> )*���˿���ȥʦ��(\\D*)���ó�ʹ��(\\D*)�˵У�','','ypt_chksk')
    --create_trigger_t('ypt_fight4','^(> )*���˿���ȥʦ��(\\D*)���ó�ʹ��(\\D*)�˵У�','','ypt_chksk2')
    create_trigger_t('ypt_fight1','^>*\\s*(\\D*)��ž����һ�����ڵ���','','ypt_kill_die')
    create_trigger_t('ypt_fight2','^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','ypt_kill_faint')
    create_trigger_t('ypt_fight3','^>*\\s*(�����һ�㣬�ǲ�����|���빥��˭��)','','ypt_kill_over')
    create_trigger_t('ypt_fight4','^>*\\s*\\( ����Ϣ���ȣ���ʱ����ʩ���⹦��\\)','','yptfail')
    create_trigger_t('ypt_fight5','^>*\\s*��������˫Ŀû�б��������ˣ����ֿ��Կ�����������','','ypt_cimu')
    create_trigger_t('ypt_fight6','^(> )*��� "ppp1" �趨Ϊ "\\D*;perform\\s*(\\D*)\\s*" �ɹ���ɡ�','','ypt_pfm1')
    create_trigger_t('ypt_fight7','^(> )*��� "ppp2" �趨Ϊ "\\D*;perform\\s*(\\D*)\\s*" �ɹ���ɡ�','','ypt_pfm2')
     --��� "ppp1" �趨Ϊ "bei none;bei leg;jifa parry shenlong-tuifa;unwield bishou;unwield bian;jiali max;perform zhuiming wushi" �ɹ���ɡ�
    create_trigger_t('ypt_catch_id','^>*\\s*����һƷ��\\s*��ʿ\\s*(\\D*)\\s*\\((\\D*)\\)\\n��������һƷ�ôӽ������ؽ���Ƹ��һ�����ָ��֡�\\n���˿���ȥʦ��\\D*���ó�ʹ��(\\D*)�˵У�','','ypt_check_skills') --new
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
    create_trigger_t('ypt_weapon1',"^(��|��)װ���ţ�$",'','npcWeapon')
    SetTriggerOption("ypt_weapon1","group","ypt_weapon")
    end
    exe('look wu shi 1;look wu shi 2')
end
function ypttest()
  sxjob.id1='wushi'
create_trigger_t('ypt_fight5','^(> )*��� "ppp1" �趨Ϊ "\\D*;perform\\s*(\\D*)\\s*" �ɹ���ɡ�','','ypt_pfm1')
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
    messageShow('��ǰ���һ����ʿ��������'..sxjob.killer1..'����ID��'..sxjob.id1..'����ʹ�ü��ܡ�'..sxjob.skills1..'����')
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
  messageShow('��ǰ��ڶ�����ʿ��������'..sxjob.killer2..'����ID��'..sxjob.id2..'����ʹ�ü��ܡ�'..sxjob.skills2..'����')
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
       print('�����޵����������С�')
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
      yptjob.name1='����в'
       exe('kill '..sxjob.id1)
       exe('set wimpycmd ppp2\\pp2\\hp')
       hqpd=0
    end
    if w[1]==sxjob.killer2 then
      yptjob.name2='����в'
       exe('kill '..sxjob.id2)
       exe('set wimpycmd ppp1\\pp1\\hp')
       hqpd=0
    end    
end
function ypt_kill_die(n,l,w)
    if w[1]==sxjob.killer1 then
    yptjob.name1='����в'
    exe('set wimpycmd ppp2\\pp2\\hp')
    hqpd=0
	   wait.make(function() 
          wait.time(1)
          exe('fight '.. sxjob.id2)
       end)
    end
    if w[1]==sxjob.killer2 then
    yptjob.name2='����в'
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
    messageShowT('��Ч�������񣺵�ǰ����������'.. smydie ..'���Σ�ɱ���ڡ�'..yptteam..'������ʿ��ս����ʱ:��'..fight.time.over..'���롣')
    print('������Ħ�������У���ǰ����������'.. smydie ..'���Σ�ɱ���ڡ�'.. yptteam ..'������ʿ��ɡ��趨ɱ����ʿ��������Ϊ��'.. smyteam ..'���顣')
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
  print('��ʼ������')
  flag.idle = nil
    DeleteTriggerGroup("yptdz")
    create_trigger_t('yptdz1',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','yptdazuo_desc')
    create_trigger_t('yptdz2',"^(> )*(�����������޼��񹦣����۵���|�����󽣾�������������|����ϥ����������˻�����Ψ�Ҷ���|����������ͨ����Ƭ��֮��|�����������ϥ��������������|����ϥ���£�Ĭ����ħ��|������������������|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|�������廨�룬��ϥ���£�Ĭ�˿�����|�������������ù���һ����Ϣ��ʼ����������|��������ϥ������˫�ְ�����ǰ|���������죬�ų�һ�������Ϣ˳������������|����ϥ���£�˫�ֺ�ʮ����ͷ����Ǳ������|����Ϣ�������������������ִ�������֮��|����ϥ���£���Ŀ��ʲ��Ĭ�˿�������|����ϥ���£���Ŀ��ʲ������Ǭ��һ����|����ϥ���£�������������ͼ��ȡ���֮����|���������һ�����������۾���������Ů�ľ�|���������£�˫Ŀ΢�գ�˫���������������̫��|�����˵�������ڶ��������Ƴ����������������㻺��Ʈ��|����ϥ������˫�ִ�����ǰ�ɻ���״����������|����ϥ��������ʹ�����������³�|���������£�˫��ƽ����˫ϥ��Ĭ��ھ�|������һվ��˫�ֻ���̧������һ����|����ϥ������˫Ŀ���գ�������һ�������뵤��|��ϯ�ض������������죬���Ϻ��ʱ��ʱ��|�㰵���ټ�ʮ��ׯ�����۵���|�����������Ŀ�������ִ����������Ⱥ������������֮���䣬��Ȼ֮�������������Ҿ���)",'','yptdazuobegin_desc')
    create_trigger_t('yptdz3',"^(> )*(���������Ϊ�Ѿ��ﵽԲ��֮��|���������Ϊ�Ѿ��޷���������������)",'','yptDzover')
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
   exe('unset ����;yun heal')
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
       print('������ϣ��ȴ�׼���У�')
    end)
end
function yptHaltover()
        exe('halt;yun qi;yun jingli;yun jing')
        if perform.force and perform.force=="bihai-chaosheng" then
       exe('yun maze')
    end
    if score.id and score.id=='ptbx' then exe('wield taibai sword') end
        	print('׼����ϣ����˿������')
end
function job_gblu_fail()
   SmyTriggerDel()
   job.name=nil
   nobusy=0
   yptjob.fengzhao=false
   messageShow('��Ч���ң����ʧ�ܣ�')
       job.time.e=os.time()
       job.time.over=job.time.e-job.time.b
    messageShowT('��Ч������������ʧ�ܣ���ʱ:��'..job.time.over..'���롣')
    return check_food()
end
function gbluFinish()
    SmyTriggerDel()
    job.name=nil
    nobusy=0
    yptjob.fengzhao=false
    messageShow('��Ч���ң��������')
       job.time.e=os.time()
       job.time.over=job.time.e-job.time.b
    messageShowT('��Ч��������������ɣ���ʱ:��'..job.time.over..'���롣')
       mytime=job.time.e+2400
       exe('set whdmd ��')
       messageShow('�趨smy�ȴ�ʱ��Ϊ��ǰϵͳʱ��['..mytime..']')
    --return check_food()
    return go(wudang_eat_lingwu,'�䵱ɽ','��ͤ')
end
function wudang_eat_lingwu()
   if locl.room=="��ͤ" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(lingwu)
    else
       return go(wudang_eat_lingwu,'�䵱ɽ','��ͤ')
    end
end