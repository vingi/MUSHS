--by fqyy 2018-6-4
fqyytmp={}
fqyytmp.attValue={
	['伤害力']=5,
	['防御力']=10,
	['悟性']=100,
	['力量']=100,
	['身法']=100,
	['根骨']=100,
}
fqyytmp.goArmorD=0
fqyytmp.goCunArmor=0
fqyytmp.tmpArmorName=nil
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
	if tmptotal>500 then
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
		create_trigger_t('fqyyWeaponLog2','^(> )*(你只能拆解你自己的防具。|\\D*不可以被保存。)','','fqyyArmorDrop')
		SetTriggerOption("fqyyWeaponLog2","group","fqyylog")
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
	fqyyArmorMessage('分解了'..fqyytmp.tmpArmorName)
	return fqyyArmorGoOver()	
end
function fqyyArmorDrop()	
	exe('dofqyydrop')
	fqyyArmorMessage('丢弃了'..fqyytmp.tmpArmorName)
end
function fqyyArmorGoOver()
	fqyytmp.tmpArmorName=nil
	DeleteTriggerGroup("fqyylog")
	check_jobx()
end
------------------------
function fqyyArmorCheck(n,l,w)
	fqyyArmorMessage("拾取"..w[2].."胄。")
	fqyytmp.tmpArmorName=w[2]..'胄'
	print(fqyytmp.tmpArmorName)
	exe("l armor")
	DeleteTimer('fqyyArmorGetT')
	fqyytmp.goArmorD=1
end
function fqyyArmorGet()
	if job.name~=nil then 
		messageShow(job.name..'中获得装备。','#DC143C','#EEEEEE') 
	else
		messageShow('莫名其妙获得装备。','#DC143C','#EEEEEE') 
	end
	create_trigger_t('fqyyWeaponLog','^(> )*它的功能有：【(\\N*)】$','','checkItemByfqyyA')
    SetTriggerOption("fqyyWeaponLog","group","fqyylog")
	create_timer_s('fqyyArmorGetT',0.2,'fqyyArmorGetT')
end
function fqyyArmorGetT()
	exe('get armor')
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