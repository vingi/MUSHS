Mchat={}
Mchat.time=os.time()

chat_trigger=function()
    DeleteTriggerGroup("chat")
    create_trigger_t('chat1',"^(> )*(\\! )*��(��������|�ٸ�ͨ��|��ɽ��|��Ĺ��|����|ؤ��|������|���ư�|������|������|����|������|����Ľ��|������|��ɽ��|�䵱��|�һ���|������|������|����|ҥ��|�齣|����|���)��",'','color_chats')
    create_triggerex_lvl('chat3',"^(> )*(\\! )*��ҥ�ԡ�ĳ�ˣ�(\\D*)Ū����һ(��|��|֧|��|��|��|��|��|��|��)(\\D*)��$",'','chat_unique',99)
    create_triggerex_lvl('chat4',"^(> )*(\\! )*��ҥ�ԡ�ĳ�ˣ����˴���(\\D*)��(\\D*)һ�����֣�$",'','rumor_unique',99)
    create_triggerex_lvl('chat5',"^(> )*(\\! )*��ҥ�ԡ�ĳ�ˣ�(\\D*)��(\\D*)���õ���һ(��|��|֧|��|��|��|��|��|��|��)(\\D*)��$",'','chat_Unique',99)
    create_triggerex_lvl('chat6',"^(> )*(\\! )*�����ġ�(\\D*)\\((\\D*)\\)��(.*)",'','chatUser',95)
    SetTriggerOption("chat1","group","chat")
    SetTriggerOption("chat3","group","chat")
    SetTriggerOption("chat4","group","chat")
    SetTriggerOption("chat5","group","chat")
    SetTriggerOption("chat6","group","chat")
end

MudUser={}
MudUnique={}
function userSave()
    local l_user
    local l_id
    for p in pairs(MudUser) do

        l_id=p .. '_' .. MudUser[p]

        if l_user then
	   l_user=l_user .. ',' .. l_id
	else
	   l_user=l_id
	end
    end
    if type(l_user)=="string" then
       SetVariable("muduser",l_user)
    end
end
function userGet()
    local l_user=GetVariable("muduser")
    local l_set={}
    local l_id={}

    if l_user==nil then return false end

    l_set=utils.split(l_user,',')
    for i=1,table.getn(l_set) do
        l_id=utils.split(l_set[i],'_')
        if l_id[1] then
	   MudUser[l_id[1]]=l_id[2]
	end
    end
end
function userAdd(set)

    for p in pairs(set) do
        MudUser[p]=set[p]
    end

end

chat_world = "chat"   --��������޸�������Ϣ���ڵ����ơ�
local first_time = true

function color_chats (name, line, wildcards, styles)

   if not flag.log or flag.log=="no" then return end

   -- try to find "chat" world
   local w = GetWorld (chat_world)   -- get "chat" world

   -- if not found, try to open it
   if first_time and not w then
     local filename = GetInfo (67) .. chat_world .. ".mcl"
     Open (filename)
     w = GetWorld (chat_world)   -- try again
     if not w then
       ColourNote ("white", "red", "Can't open chat world file: " .. filename)
       first_time = false   -- don't repeatedly show failure message
     end -- can't find world
   end -- can't find world first time around

   if w then   -- if present
     w:ColourTell ("white","black",os.date())
     for _, v in ipairs (styles) do       
       w:ColourTell (RGBColourToName (v.textcolour),
                     RGBColourToName (v.backcolour),
                     v.text)
     end -- for each style run
     w:Note ("")   -- wrap up line

   end -- world found

end -- function redirect 

function chatUser(name, line, wildcards, styles)
   color_chats(name, line, wildcards, styles)

   if score.id and score.id=='ptbx' then
      return false
   end

   local l_name=tostring(wildcards[3])
   local l_id=string.lower(tostring(wildcards[4]))
   local l_words=tostring(wildcards[5])
     if string.len(l_id)>8 then return end
   if score.id and MudUser[score.name] and l_words then
      if string.find(l_words,score.id) or string.find(l_words,score.name) then
         if string.find(l_words,"������") then
	    locate()
	if l_id=='ptbx' then
            chatChat(l_id,l_name..'ͬѧ,ȫ��λϵͳǰһ�ζ�λ�ص�Ϊ��'.. locl.area .. locl.room ..'���������׼ȷ����Ϣ�����ٲ�ѯһ�Σ�')
	    return 
	else
            chatTel(l_id,l_name..'ͬѧ,ȫ��λϵͳǰһ�ζ�λ�ص�Ϊ��'.. locl.area .. locl.room ..'���������׼ȷ����Ϣ�����ٲ�ѯһ�Σ�')
	    return 
	end
      end
   end
 end
end


function chatChat(id,chat)
   create_alias('chatt','chatt','chat '..chat)
   exe('chatt')
end

function chatTel(id,chat)
   create_alias('tel','tel','tell '..id..' '..chat)
   exe('tel')
end
function chats_log(logs,color,bcolor)
   local w = GetWorld ("log")   -- get "chat" world
   local c_text='yellow'
   local c_back= bcolor or 'black'
   local log_world='sbk'log'
   
   --if not flag.log or flag.log=="no" then return end
   
   if score.id then
      logs='��'..score.id..'��'..logs
   end

   if flag.log and flag.log=="yes" then
      -- if not found, try to open it
      if first_time and not w then
        local filename = GetInfo (67) .. log_world .. ".mcl"
        Note(filename)
        --local filename = GetInfo (67) .. "log.mcl"
        Open (filename)
        w = GetWorld (log_world)   -- try again
        if not w then
          ColourNote ("white", "red", "Can't open chat world file: " .. filename)
          first_time = false   -- don't repeatedly show failure message
        end -- can't find world
      end -- can't find world first time around
      
      if job.name=='songxin' then c_text='forestgreen' end
      if job.name=='wudang' or job.name=='clb' then c_text='cyan' end
      if job.name=='xueshan' or job.name=='gaibang' then c_text='darkred' end
      if job.name=='gblu' or job.name=='songxin2' then c_text='darkviolet' end
      if job.name=='huashan' then c_text='hotpink' end
      if color~=nil then c_text=color end
      
      if w then
         w:ColourTell ("white","black",os.date())
         w:ColourTell (c_text,c_back,logs)
         w:Note("")
      end
   else
      if GetVariable("flagnote") then
	     flag.note = tonumber(GetVariable("flagnote"))
	  end
	  if flag.note and flag.note==1 then
         ColourTell ("white","black",os.date())
         ColourTell (c_text,c_back,logs)
         Note("")
	  end
   end
end

function chats_locate(logs,color)
   local w = GetWorld ("locate")   -- get "locate" world
   local c_text='peru'
   local c_back='black'
   local locate_world='sbk'locate'
   
   if not flag.log or flag.log=="no" then return end

   if color~=nil then c_text=color end

   if score.id then
      logs='��'..score.id..'��'..logs
   end

   -- if not found, try to open it
   if first_time and not w then
     local filename = GetInfo (67) .. locate_world .. ".mcl"
     Note(filename)
     --local filename = GetInfo (67) .. "locate.mcl"
     Open (filename)
     w = GetWorld (locate_world)   -- try again
     if not w then
       ColourNote ("white", "red", "Can't open chat world file: " .. filename)
       first_time = false   -- don't repeatedly show failure message
     end -- can't find world
   end -- can't find world first time around

   if w then
      w:ColourTell ("white","black",os.date())
      w:ColourTell (c_text,c_back,logs)
      w:Note("")
   end
end

function chat_unique(name, line, wildcards, styles)

    color_chats(name, line, wildcards, styles)

    if score.id and score.id~='xxf' then
       return false
    end

    local l_flag=false
    for p, v in ipairs (styles) do
        if v.text==wildcards[5] then l_flag=true end 
    end
    if not l_flag then return end

    MudUnique = MudUnique or {}

    if MudUser[wildcards[3]] then
       if MudUnique[wildcards[5]] and MudUnique[wildcards[5]]~=wildcards[3] then
          chatUniqueEarse(wildcards[5])
       end
       if not MudUnique[wildcards[5]] then
          flag.unique=2
       end
       MudUnique[wildcards[5]]=wildcards[3]
       chatUniqueChat(wildcards[5])
    end
end
function chat_Unique(name, line, wildcards, styles)

    color_chats(name, line, wildcards, styles)

    if score.id and score.id~='xxf' then
       return false
    end

    local l_flag=false
    for p, v in ipairs (styles) do
        if v.text==wildcards[6] then l_flag=true end 
    end
    if not l_flag then return end

    MudUnique = MudUnique or {}

    if MudUser[wildcards[3]] then
       if MudUser[wildcards[4]] then
          if MudUnique[wildcards[6]] and MudUnique[wildcards[6]]~=wildcards[3] then
             chatUniqueEarse(wildcards[6])
          end
          if not MudUnique[wildcards[6]] then
             flag.unique=2
          end
          MudUnique[wildcards[6]]=wildcards[3]
          chatUniqueChat(wildcards[6])
       end
    end
end
function chatUniqueEarse(p_unique)
    if score.id and score.id~='xxf' then
       return false
    end
    if os.time()-Mchat.time<20 or math.random(1,8)>5 then
       flag.unique=3
       return false
    end
    flag.unique=1
    Mchat.time=os.time()
    exe('chat* �ͳ�һ��С���������������'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'�����֡�')
end
function chatUniqueChat(p_unique)
    if score.id and score.id~='xxf' then
       return false
    end
    if flag.unique==3 then
       flag.unique=0
       return false
    end
    if (os.time()-Mchat.time<30 or math.random(1,8)>4) and flag.unique and flag.unique==0 then
       return false
    end
    Mchat.time=os.time()
    if flag.unique and flag.unique==2 then
       if math.random(1,3)==1 then
          exe('chat* �ͳ�һ��С�����ɿ��дд��������Լ���Կ�������ŤŤ��'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'�����֡�')
       elseif math.random(1,3)==2 then
          exe('chat* ��æ���һ����ֽ��д��'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'�����֣��ְ�������һ���ʼǱ����档')
       else
          exe('chat* �ó�һ����Ƥ�������˼�ҳ���˶�������д��'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'�������֡�')
       end
    elseif flag.unique and flag.unique==1 then
       exe('chat* ���ں�������'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'�����֡�')
    else
       exe('chat* �ͳ�һ��С������'.. p_unique .. MudUnique[p_unique] .. MudUser[MudUnique[p_unique]] ..'��������������һ�顣')
    end
    flag.unique=0
end

function rumor_unique(name, line, wildcards, styles)

    color_chats(name, line, wildcards, styles)

end

function printTab(tab,sp)
   local l_dis = 20
   if tmp.objs then l_dis = 5 end
   tmp.i = sp or 1
   if type(tab) ~= "table" then
      if type(v)=="boolean" then
	     if v then v = "true" else v = "false" end
	  end
	  if type(v)=="function" then
	     v = "function"
	  end
	  Note(v)
   else
      for p,v in pairs(tab) do
          if type(v) == "table" then
	    	  Tell (string.rep(" ",(tmp.i-1)*l_dis))
	    	  local s = p..' = '
	    	  local s = s.. string.rep(" ",l_dis - #s)
	    	  Tell (s)
	    	  Note('{')
	    	  printTab(v,tmp.i+1)
	    	  Tell (string.rep(" ",(tmp.i-2)*l_dis))
	    	  Note('},')
	    	  tmp.i = tmp.i - 1
	       else
	          Tell (string.rep(" ",(tmp.i-1)*l_dis))
	    	  if type(v)=="boolean" then
	    	     if v then v = "true" else v = "false" end
	    	  end
	    	  if type(v)=="function" then
	    	     v = "function"
	    	  end
	          Note('["'..p,'"] = "',v..'",')
	       end
      end
   end
end

function getRandomIndex(p_set)
    if type(p_set)~="table" then
	   return false
	end
	local l_cnt = countTab(p_set)
	if l_cnt == 0 then return false end
	local l_n = math.random(1,l_cnt)
	local l_i = 0
	for p in pairs(p_set) do
	    l_i = l_i + 1
		if l_i == l_n then
		   return p
		end
	end
	return false
end
function getRandomElement(p_set)
    if type(p_set)~="table" then
	   return false
	end
	local l_cnt = countTab(p_set)
	if l_cnt == 0 then return false end
	local l_n = math.random(1,l_cnt)
	local l_i = 0
	for p,q in pairs(p_set) do
	    l_i = l_i + 1
		if l_i == l_n then
		   return q
		end
	end
	return false
end


