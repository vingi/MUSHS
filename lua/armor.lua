-- by fqyy 2018-6-4
fqyytmp={}
fqyytmp.attValue={
	['伤害力']=10,
	['防御力']=6,
	['悟性']=500,
	['力量']=500,
	['身法']=500,
	['根骨']=500,
	['招架率']=37,
	['躲避率']=40,
	['命中率']=40,
	['致命率']=100,
	['气血']=1,
	['幸运']=500,
	['速度']=500,
}
fqyytmp.armorClass={
	['手套']='glove',
	['甲胄']='armor',
	['靴']='boot',
	['腰带']='belt',
	['披风']='mantle',
	['彩衣']='coat',
	['头盔']='cap',
}
fqyytmp.goArmorD=0
fqyytmp.goCunArmor=0
fqyytmp.tmpArmorName=nil
fqyytmp.tmpArmorClass=nil
------------------------
function fqyyArmorCheckValue(msg)
	local tmpitem=0
	local tmptotal=0
	for v in pairs(fqyytmp.attValue) do
		_,_,tmpitem=string.find(msg,v.."＋(%d+)")
		if tmpitem~=nil then
--			print(v..":"..tmpitem)
			tmptotal=tmptotal+tmpitem*fqyytmp.attValue[v]
		end
	end
	print(tmptotal)
	if tmptotal>500 or tmptotal==0 then
		fqyytmp.goCunArmor=1
	else
		fqyytmp.goCunArmor=0
	end
	--防御力＋22】
	--伤害力＋510，悟性＋3，身法＋3，根骨＋6，力量＋5
end
function fqyyArmorGoCheck()
	fqyytmp.goArmorD=0
	if Bag[fqyytmp.tmpArmorName] then
		create_trigger_t('fqyyWeaponLog3','^(> )*(你只能拆解你自己的防具。|\\D*不可以被保存。)','','fqyyArmorDrop')
		create_trigger_t('fqyyWeaponLog4','^(> )*(\\D*)被拆解为一堆(\\D*)落在桌上,被你拣起收进背囊。','','fqyyArmorDisShow')
		create_trigger_t('fqyyWeaponLog5','^(> )*你丢下一(件|副|双|袭|顶|个|条|对)(\\D*)(手套|靴|甲胄|腰带|披风|彩衣|头盔)。','','fqyyArmorDropShow')
		SetTriggerOption("fqyyWeaponLog3","group","fqyylog")
		SetTriggerOption("fqyyWeaponLog4","group","fqyylog")
		SetTriggerOption("fqyyWeaponLog5","group","fqyylog")
		if fqyytmp.goCunArmor==1 then
			fqyytmp.goCunArmor=0
			fqyyArmorSave()
		else
			fqyyArmorDis()
		end
	else
		check_jobx()
	end
end
function fqyyArmorSave()
	if not Bag[fqyytmp.tmpArmorName] then
	   return check_jobx()
	end
	go(fqyyArmorSave2,'city/zahuopu')
end
function fqyyArmorSave2()
    if Bag[fqyytmp.tmpArmorName] then
	   exe('remove all;cun '..Bag[fqyytmp.tmpArmorName].fullid)
	   checkBags()
	   return check_busy(fqyyArmorSave2,1)
	end
	fqyyArmorMessage('保存了'..fqyytmp.tmpArmorName)
	return fqyyArmorGoOver()	
end
function fqyyArmorDis()
	if not Bag[fqyytmp.tmpArmorName] then
	   return check_jobx()
	end
	go(fqyyArmorDis2,'zhiye/caifengpu1')
end
function fqyyArmorDis2()
	if Bag[fqyytmp.tmpArmorName] then
	   exe('remove all;dismantle '..Bag[fqyytmp.tmpArmorName].fullid)
		exe('y')
		exe('alias dofqyydrop drop '..Bag[fqyytmp.tmpArmorName].fullid)
	   checkBags()
	   return check_busy(fqyyArmorDis2,1)
	end
	checkWait(fqyyArmorGoOver,1)
end
function fqyyArmorDisShow(n,l,w)
	fqyyArmorMessage('分解了['..w[2]..']获得材料：'..w[3])
end
function fqyyArmorDrop()	
	exe('dofqyydrop')
end
function fqyyArmorDropShow(n,l,w)
	local tmpw3=w[3] or ""
	fqyyArmorMessage('丢弃了'..tmpw3..w[4])
end
function fqyyArmorGoOver()
	fqyytmp.tmpArmorName=nil
	DeleteTriggerGroup("fqyylog")
	exe('wear all')
	check_jobx()
end
------------------------
function fqyyArmorCheck(n,l,w)
	print(w[3].."|"..w[4])
	local tmpw3=w[3] or ""
	fqyyArmorMessage("拾取"..tmpw3..w[4])
	fqyytmp.tmpArmorName=tmpw3..w[4]
	--fqyytmp.tmpArmorClass=w[4]
	exe("l "..fqyytmp.armorClass[w[4]])
	DeleteTimer('fqyyArmorGetT')
	fqyytmp.goArmorD=1
	checkBags()
end
function fqyyArmorGet(n,l,w)
	print(w[2].."|"..w[3].."|"..w[4])
	local tmpw4=w[3] or ""
	
	if job.name~=nil then 
		messageShow(job.name..'中获得'..tmpw4..w[4]..'。','#DC143C','#EEEEEE') 
	else
		messageShow('莫名其妙获得'..tmpw4..w[4]..'。','#DC143C','#EEEEEE') 
	end
	fqyytmp.tmpArmorClass=w[4]
	create_trigger_t('fqyyWeaponLog','^(> )*它的功能有：【(\\N*)】$','','checkItemByfqyyA')
    create_trigger_t('fqyyWeaponLog2','^(> )*它的功能有：【(\\N*)%】$','','checkItemByfqyyA')
    SetTriggerOption("fqyyWeaponLog","group","fqyylog")
	SetTriggerOption("fqyyWeaponLog2","group","fqyylog")
	fqyyArmorGetT()
	create_timer_s('fqyyArmorGetT',0.2,'fqyyArmorGetT')
end
function fqyyArmorGetT()
	exe('get '..fqyytmp.armorClass[fqyytmp.tmpArmorClass])
end

 
function checkItemByfqyyW(n,l,w)
	messageShow("武器属性："..w[2])
	DeleteTriggerGroup("fqyylog")
end
function checkItemByfqyyA(n,l,w)
	messageShow("装备属性："..w[2])
	fqyyArmorCheckValue(w[2])
	DeleteTriggerGroup("fqyylog")
end
function fqyyRepairMessage(msg)
	if msg~=nil then
		messageShow(msg,'#FF1493','#004444')
	end
end
function fqyyArmorMessage(msg)
	if msg~=nil then
		messageShow(msg,'#1E90FF','#FFFFFF')
	end
end