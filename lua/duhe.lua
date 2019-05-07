hstesta = 0
hstestb = 0
hstestc = 0
hstest = 0
wdtesta = 0
wdtestb = 0
wdtestc = 0
wdtest = 0
wdtestaa = 0
hstestaa = 0
wdtestaaa = 0
hstestaaa = 0
function duheduhe_trigger()
	DeleteTriggerGroup("duheduhe")
	create_trigger_t("duheduhe1", "^(> )*\\D*告诉你：长江渡船出发时间", "", "check_cjdk")
	create_trigger_t("duheduhe2", "^(> )*\\D*告诉你：澜沧江渡船出发时间", "", "check_lcjdk")
	create_trigger_t("duheduhe3", "^(> )*\\D*告诉你：澜沧江渡船到达时间", "", "check_lcjdk1")
	create_trigger_t("duheduhe4", "^(> )*\\D*告诉你：长江渡船到达时间", "", "check_cjdk1")
	--create_trigger_t('duhe5',"^(> )*\\D*告诉你：黄河流域大渡口出发时间",'','check_hhdk2')
	--create_trigger_t('duhe6',"^(> )*\\D*告诉你：黄河流域大渡口到达时间",'','check_hhdk22')
	--create_trigger_t('duhe7',"^(> )*\\D*告诉你：陕晋渡口出发时间",'','check_hhdk1')
	--create_trigger_t('duhe8',"^(> )*\\D*告诉你：陕晋渡口到达时间",'','check_hhdk11')
	--create_trigger_t('duhe9',"^(> )*\\D*告诉你：西夏渡口出发时间",'','check_hhdk3')
	--create_trigger_t('duhe10',"^(> )*\\D*告诉你：西夏渡口到达时间",'','check_hhdk33')
	--create_trigger_t('duhe11',"^(> )*\\D*告诉你：兰州渡口出发时间",'','check_hhdk4')
	--create_trigger_t('duhe12',"^(> )*\\D*告诉你：兰州渡口到达时间",'','check_hhdk44')
	SetTriggerOption("duheduhe1", "group", "duheduhe")
	SetTriggerOption("duheduhe2", "group", "duheduhe")
	SetTriggerOption("duheduhe3", "group", "duheduhe")
	SetTriggerOption("duheduhe4", "group", "duheduhe")
	--SetTriggerOption("duhe5","group","duhe")
	--SetTriggerOption("duhe6","group","duhe")
	--SetTriggerOption("duhe7","group","duhe")
	--SetTriggerOption("duhe8","group","duhe")
	--SetTriggerOption("duhe9","group","duhe")
	--SetTriggerOption("duhe10","group","duhe")
	--SetTriggerOption("duhe11","group","duhe")
	--SetTriggerOption("duhe12","group","duhe")
end

--[[function check_hhdk11()
    ck_hhdk1=1
    dkclose1=os.clock()	
	checkdktime1=dkclose1-dkopen1
	--print('陕晋渡口关闭->对应关系：黄河流域大渡口')
end
function check_hhdk2()
    ck_hhdk2=0
    dkopen2=os.clock()	
	checkdktime2=dkopen2-dkclose2
	--print('黄河流域大渡口开启->对应关系：陕晋渡口')
end
function check_hhdk22()
    ck_hhdk2=1
    dkclose2=os.clock()	
	checkdktime2=dkclose2-dkopen2
	--print('黄河流域大渡口关闭->对应关系：陕晋渡口')
end
function check_hhdk3()
    ck_hhdk3=0
    dkopen3=os.clock()	
	checkdktime3=dkopen3-dkclose3
	--print('西夏渡口开启->对应关系：兰州渡口')
end
function check_hhdk33()
    ck_hhdk3=1
    dkclose3=os.clock()	
	checkdktime3=dkclose3-dkopen3
	--print('西夏渡口关闭->对应关系：兰州渡口')
end
function check_hhdk4()
    ck_hhdk4=0
    dkopen4=os.clock()	
	checkdktime4=dkopen4-dkclose4
	
print('兰州渡口开启->对应关系：西夏渡口')
end
function check_hhdk44()
    ck_hhdk4=1
    dkclose4=os.clock()	
	checkdktime4=dkclose4-dkopen4
	--print('兰州渡口关闭->对应关系：西夏渡口')
end]]
--[[function check_hh()
	dhopen()
    if ck_hhdk1==0 and ck_hhdk2==0 then
		if dkopen1>dkopen2 then
			map.rooms["huanghe/road2"].ways["#duHhe"]=nil
			map.rooms["huanghe/road3"].ways["#duHhe"]=nil
			return checkhhh()
		else
			map.rooms["changan/road2"].ways["#duHhe"]=nil
			map.rooms["changan/road3"].ways["#duHhe"]=nil
			return checkhhh()
		end
	end
	if ck_hhdk1==1 and ck_hhdk2==1 then 
		if dkclose1>dkclose2 then
			map.rooms["changan/road3"].ways["#duHhe"]=nil	
			map.rooms["changan/road2"].ways["#duHhe"]=nil
			return checkhhh()
		else
			map.rooms["huanghe/road3"].ways["#duHhe"]=nil	
			map.rooms["huanghe/road2"].ways["#duHhe"]=nil
            return checkhhh()
		end
	end
	if ck_hhdk1==0 and ck_hhdk2==1 then
		map.rooms["huanghe/road3"].ways["#duHhe"]=nil	
		map.rooms["huanghe/road2"].ways["#duHhe"]=nil
        return checkhhh()
	end
	if ck_hhdk1==1 and ck_hhdk2==0 then
		map.rooms["changan/road2"].ways["#duHhe"]=nil
		map.rooms["changan/road3"].ways["#duHhe"]=nil
		return checkhhh()
	end
end]]
--[[function checkhhh()
	if ck_hhdk3==0 and ck_hhdk4==0 then
		if dkopen3>dkopen4 then
			map.rooms["lanzhou/road2"].ways["#duHhe"]=nil
			map.rooms["lanzhou/road3"].ways["#duHhe"]=nil
			return
	    else
			map.rooms["lanzhou/dukou2"].ways["#duHhe"]=nil
			map.rooms["lanzhou/dukou3"].ways["#duHhe"]=nil	
			return
		end
	end
	if ck_hhdk3==1 and ck_hhdk4==1 then
		if dkclose3>dkclose4 then
			map.rooms["lanzhou/dukou2"].ways["#duHhe"]=nil
			map.rooms["lanzhou/dukou3"].ways["#duHhe"]=nil	
			return
	    else
		    map.rooms["lanzhou/road2"].ways["#duHhe"]=nil
			map.rooms["lanzhou/road3"].ways["#duHhe"]=nil
			return
		end
	end
	if ck_hhdk3==0 and ck_hhdk4==1 then
		map.rooms["lanzhou/road2"].ways["#duHhe"]=nil
		map.rooms["lanzhou/road3"].ways["#duHhe"]=nil
		return
	end
	if ck_hhdk3==1 and ck_hhdk4==0 then
		map.rooms["lanzhou/dukou2"].ways["#duHhe"]=nil
		map.rooms["lanzhou/dukou3"].ways["#duHhe"]=nil	
		return
	end
end]]
function check_cjdk()
	print("长江渡口开启")
	first_leave = "changjiang"
	check_cjdkkk = 0
	hstestaaa = os.clock()
	cj_test = hstestaaa - hstestaa
end
function check_cjdk1()
	print("长江渡口关闭")
	first_arrive = "changjiang"
	check_cjdkkk = 1
	hstestaa = os.clock()
	cj_test = hstestaa - hstestaaa
end
function check_lcjdk()
	print("澜沧江渡口开启")
	first_leave = "lancangjiang"
	check_lcjdkkk = 0
	wdtestaaa = os.clock()
	lcj_test = wdtestaaa - wdtestaa
end
function check_lcjdk1()
	print("澜沧江渡口关闭")
	first_arrive = "lancangjiang"
	check_lcjdkkk = 1
	wdtestaa = os.clock()
	lcj_test = wdtestaa - wdtestaaa
end
function check_cjn()
	if check_cjdkkk == 0 and check_lcjdkkk == 0 then
		map.rooms["city/jiangbei"].ways["#duCjiang"] = "city/jiangnan"
		map.rooms["city/jiangnan"].ways["#duCjiang"] = "city/jiangbei"
		map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = nil
		map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = nil
		return
	end
	if check_cjdkkk == 1 and check_lcjdkkk == 1 then
		if hstestaa < wdtestaa then
			map.rooms["city/jiangbei"].ways["#duCjiang"] = "city/jiangnan"
			map.rooms["city/jiangnan"].ways["#duCjiang"] = "city/jiangbei"
			map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = nil
			map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = nil
			return
		else
			map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = "dali/dalisouth/jiangbei"
			map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = "dali/dalisouth/jiangnan"
			map.rooms["city/jiangbei"].ways["#duCjiang"] = nil
			map.rooms["city/jiangnan"].ways["#duCjiang"] = nil
			return
		end
	end
	if check_cjdkkk == 0 and check_lcjdkkk == 1 then
		map.rooms["city/jiangbei"].ways["#duCjiang"] = "city/jiangnan"
		map.rooms["city/jiangnan"].ways["#duCjiang"] = "city/jiangbei"
		map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = nil
		map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = nil
		return
	end
	if check_cjdkkk == 1 and check_lcjdkkk == 0 then
		map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = "dali/dalisouth/jiangbei"
		map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = "dali/dalisouth/jiangnan"
		map.rooms["city/jiangbei"].ways["#duCjiang"] = nil
		map.rooms["city/jiangnan"].ways["#duCjiang"] = nil
		return
	end
end
