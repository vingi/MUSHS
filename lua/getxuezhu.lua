--------------------------------------------------------------------默认的变量-----------------------------------------------------------------------------------------
nofindxuezhu=1
---------------------------------------------------------------------主模块------------------------------------------------------------------------------------------------
function xuezhugo()
        nofindxuezhu=0
        delete_all_triggers()
        dis_all()
	exe('nick 去苗疆找小程妹子')
	return go(xuezhuask,'苗疆','药王居')
end
function xuezhuask()
    create_trigger_t('xz1',"^(> )*恭喜！您现在的新绰号是：「帮小程妹子抓雪蛛」",'','xuezhuask1')
    create_trigger_t('xz2',"^(> )*你晃动了半天，发现什麽也没有。",'','xuezhunofind')
    create_trigger_t('xz3',"^(> )*你轻轻摇晃树藤，忽然掉下一只雪蛛。",'','hitxuezhu1')
    create_trigger_t('xz4',"^(> )*雪蛛挣扎了几下，一个不稳晕倒过去。",'','getxuezhu1')
    create_trigger_t('xz5',"^(> )*雪蛛神志迷糊，脚下一个不稳，倒在地上昏了过去。",'','getxuezhu1')
    create_trigger_t('xz6',"^(> )*雪蛛「啪」的一声倒在地上，挣扎着抽动了几下就死了。",'','xuezhudie')
    create_trigger_t('xz7',"^(> )*你给程灵素一只雪蛛。",'','xuezhuset')
    create_trigger_t('xz8',"^(> )*雪蛛突然蹿到地上不见了。",'','xuezhudie')
   -- create_trigger_t('xz9',"^(> )*设定环境变量：拿雪蛛 = "YES"",'','autofindxuezhu') 
   
    SetTriggerOption("xz1","group","xz")
    SetTriggerOption("xz2","group","xz")
    SetTriggerOption("xz3","group","xz")
    SetTriggerOption("xz4","group","xz")
    SetTriggerOption("xz5","group","xz")
    SetTriggerOption("xz6","group","xz")
    SetTriggerOption("xz7","group","xz")
    SetTriggerOption("xz8","group","xz")


	exe('ask cheng lingsu about 五毒教')
	wait.make(function() 
        wait.time(2)
        exe('yes;fu jiuxuebiyun dan')
	exe('nick 帮小程妹子抓雪蛛')
     end)
	EnableTriggerGroup("xz",true)
end
function xuezhuask1()
	exe('nw;s;w;w;nu;eu;ed;nu;nw;e;enter;dian fire;yao shuteng;unwield qiankun;unwield haoqi;unwield longquan;bei leg;jiali 30;hit xue zhu')----------兵器替换成变量吧
	end
function getxuezhu()
	exe('dian fire;yao shuteng;unwield qiankun;unwield haoqi;unwield longquan;bei leg;jiali 30;hit xue zhu')
end
function xuezhunofind()
        exe('yao shuteng')
	nofindxuezhu=1
	againxuezhu=1
end
function getxuezhu1()
	exe('get xue zhu')
	return go(xuezhufinish,'苗疆','药王居')
end
function hitxuezhu1()
	exe('unwield qiankun;unwield haoqi;unwield longquan;bei leg;jiali 30;hit xue zhu')
end
function xuezhufinish()
	exe('give xue zhu to cheng lingsu')
	nofindxuezhu=1
	againxuezhu=0
	EnableTriggerGroup("xz",false)
	return check_jobx()
end
function xuezhudie()
	nofindxuezhu=1
	againxuezhu=1
	EnableTriggerGroup("xz",false)
	return check_jobx()	
end
function xuezhuset()
         exe('set 拿雪蛛 yes')
end

if nofindxuezhu==0 then
	   return xuezhugo()
end