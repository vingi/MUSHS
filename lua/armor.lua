--by fqyy 2018-6-4
fqyytmp={}
fqyytmp.attValue={
	['�˺���']=5,
	['������']=10,
	['����']=100,
	['����']=100,
	['��']=100,
	['����']=100,
}
fqyytmp.goArmorD=0
fqyytmp.goCunArmor=0
fqyytmp.tmpArmorName=nil
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
	if tmptotal>500 then
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
		create_trigger_t('fqyyWeaponLog2','^(> )*(��ֻ�ܲ�����Լ��ķ��ߡ�|\\D*�����Ա����档)','','fqyyArmorDrop')
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
	fqyyArmorMessage('�ֽ���'..fqyytmp.tmpArmorName)
	return fqyyArmorGoOver()	
end
function fqyyArmorDrop()	
	exe('dofqyydrop')
	fqyyArmorMessage('������'..fqyytmp.tmpArmorName)
end
function fqyyArmorGoOver()
	fqyytmp.tmpArmorName=nil
	DeleteTriggerGroup("fqyylog")
	check_jobx()
end
------------------------
function fqyyArmorCheck(n,l,w)
	fqyyArmorMessage("ʰȡ"..w[2].."�С�")
	fqyytmp.tmpArmorName=w[2]..'��'
	print(fqyytmp.tmpArmorName)
	exe("l armor")
	DeleteTimer('fqyyArmorGetT')
	fqyytmp.goArmorD=1
end
function fqyyArmorGet()
	if job.name~=nil then 
		messageShow(job.name..'�л��װ����','#DC143C','#EEEEEE') 
	else
		messageShow('Ī��������װ����','#DC143C','#EEEEEE') 
	end
	create_trigger_t('fqyyWeaponLog','^(> )*���Ĺ����У���(\\N*)��$','','checkItemByfqyyA')
    SetTriggerOption("fqyyWeaponLog","group","fqyylog")
	create_timer_s('fqyyArmorGetT',0.2,'fqyyArmorGetT')
end
function fqyyArmorGetT()
	exe('get armor')
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