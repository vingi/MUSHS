pker={}
pker.name="none"
pker.id="none"

--如如果你要和%x~((%w)~)性命相搏，请你也对这个人下一次 kill 指令。
function Openfpk()
  EnableTriggerGroup("pk",false)
	DeleteTriggerGroup("pk")
	create_trigger_t('pk1',"^(> )*如果你要和(\\D*)\\((\\D*)\\)性命相搏，",'','fpk')
	SetTriggerOption("pk1","group","pk")
	print("fpk load finish")
	return exe('wink')
end

function fpk(n,l,w)
--你喝道：「澹台赵云，看招！」
--澹台赵云对着你大喝：「可恶，又是你！」
--你和混世魔王一碰面，二话不说就打了起来！
--澹台赵云一见到你，愣了一愣，大叫：「我宰了你！」
--澹台赵云和你仇人相见分外眼红，立刻打了起来！
--小乞丐神志迷糊，脚下一个不稳，倒在地上昏了过去。
--老乞丐「啪」的一声倒在地上，挣扎着抽动了几下就死了。
	pker.name="none"
  pker.id="none"
   pker.name=w[2]
   pker.id=string.lower(w[3])
   local pkername=pker.name
  EnableTriggerGroup("pk2",false)
	--DeleteTriggerGroup("pk2")
	EnableTriggerGroup("pk3",false)
	EnableTriggerGroup("pk4",false)
	DeleteTriggerGroup("pk2")
	
	create_trigger_t('pk1',"^(> )*你和(\\D*)一碰面，二话不说就打了起来",'','fpk2')
	create_trigger_t('pk2',"^(> )*"..pker.name.."喝道：「你，我们的帐还没算完，看招！」",'','fpk2')
	create_trigger_t('pk3',"^(> )*"..pker.name.."一眼瞥见你，「哼」的一声冲了过来！",'','fpk2')
	create_trigger_t('pk4',"^(> )*"..pker.name.."一见到你，愣了一愣，大叫：「我宰了你！」",'','fpk2')
	create_trigger_t('pk5',"^(> )*"..pker.name.."和你仇人相见分外眼红，立刻打了起来！",'','fpk2')
	create_trigger_t('pk6',"^(> )*你喝道：「"..pker.name.."，看招！」",'','fpk2')
	create_trigger_t('pk7',"^(> )*"..pker.name.."神志迷糊，脚下一个不稳，倒在地上昏了过去。",'','fpk3')
	create_trigger_t('pk8',"^(> )*"..pker.name.."「啪」的一声倒在地上，挣扎着抽动了几下就死了。",'','fpk4')
	
	SetTriggerOption("pk1","group","pk2")
  SetTriggerOption("pk2","group","pk2")
  SetTriggerOption("pk3","group","pk2")
  SetTriggerOption("pk4","group","pk2")
  SetTriggerOption("pk5","group","pk2")
  SetTriggerOption("pk6","group","pk2")   
  SetTriggerOption("pk7","group","pk3")  
  SetTriggerOption("pk8","group","pk4") 

   exe('say 1 pker:'..pker.name..pker.id)
   	return exe('kill '..pker.id)
end
function fpk2()
--你和混世魔王一碰面，二话不说就打了起来！
   exe('say 2 pker:'..pker.name..pker.id)
   return exe('kill '..pker.id)
end
function fpk3()
--你和混世魔王一碰面，二话不说就打了起来！
   return exe('kill '..pker.id)
end

function fpk4()
--你和混世魔王一碰面，二话不说就打了起来！
  EnableTriggerGroup("pk2",false)
	EnableTriggerGroup("pk3",false)
	EnableTriggerGroup("pk4",false)

	DeleteTriggerGroup("pk2")
	DeleteTriggerGroup("pk3")
	DeleteTriggerGroup("pk4")
   return exe('qie corpse')
end
