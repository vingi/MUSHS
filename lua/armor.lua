-- by fqyy 2018-6-4
fqyytmp={}
fqyytmp.attValue={
	['�˺���']=10,
	['������']=6,
	['����']=500,
	['����']=500,
	['��']=500,
	['����']=500,
	['�м���']=37,
	['�����']=40,
	['������']=40,
	['������']=100,
	['��Ѫ']=1,
	['����']=500,
	['�ٶ�']=500,
}
fqyytmp.armorClass={
	['����']='glove',
	['����']='armor',
	['ѥ']='boot',
	['����']='belt',
	['����']='mantle',
	['����']='coat',
	['ͷ��']='cap',
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
		_,_,tmpitem=string.find(msg,v.."��(%d+)")
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
	--��������22��
	--�˺�����510�����ԣ�3������3�����ǣ�6��������5
end
function fqyyArmorGoCheck()
	fqyytmp.goArmorD=0
	if Bag[fqyytmp.tmpArmorName] then
		create_trigger_t('fqyyWeaponLog3','^(> )*(��ֻ�ܲ�����Լ��ķ��ߡ�|\\D*�����Ա����档)','','fqyyArmorDrop')
		create_trigger_t('fqyyWeaponLog4','^(> )*(\\D*)�����Ϊһ��(\\D*)��������,��������ս����ҡ�','','fqyyArmorDisShow')
		create_trigger_t('fqyyWeaponLog5','^(> )*�㶪��һ(��|��|˫|Ϯ|��|��|��|��)(\\D*)(����|ѥ|����|����|����|����|ͷ��)��','','fqyyArmorDropShow')
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
	fqyyArmorMessage('������'..fqyytmp.tmpArmorName)
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
	fqyyArmorMessage('�ֽ���['..w[2]..']��ò��ϣ�'..w[3])
end
function fqyyArmorDrop()	
	exe('dofqyydrop')
end
function fqyyArmorDropShow(n,l,w)
	local tmpw3=w[3] or ""
	fqyyArmorMessage('������'..tmpw3..w[4])
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
	fqyyArmorMessage("ʰȡ"..tmpw3..w[4])
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
		messageShow(job.name..'�л��'..tmpw4..w[4]..'��','#DC143C','#EEEEEE') 
	else
		messageShow('Ī��������'..tmpw4..w[4]..'��','#DC143C','#EEEEEE') 
	end
	fqyytmp.tmpArmorClass=w[4]
	create_trigger_t('fqyyWeaponLog','^(> )*���Ĺ����У���(\\N*)��$','','checkItemByfqyyA')
    create_trigger_t('fqyyWeaponLog2','^(> )*���Ĺ����У���(\\N*)%��$','','checkItemByfqyyA')
    SetTriggerOption("fqyyWeaponLog","group","fqyylog")
	SetTriggerOption("fqyyWeaponLog2","group","fqyylog")
	fqyyArmorGetT()
	create_timer_s('fqyyArmorGetT',0.2,'fqyyArmorGetT')
end
function fqyyArmorGetT()
	exe('get '..fqyytmp.armorClass[fqyytmp.tmpArmorClass])
end

 
function checkItemByfqyyW(n,l,w)
	messageShow("�������ԣ�"..w[2])
	DeleteTriggerGroup("fqyylog")
end
function checkItemByfqyyA(n,l,w)
	messageShow("װ�����ԣ�"..w[2])
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