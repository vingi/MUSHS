--------------------------------------------------------------------默认的变量-----------------------------------------------------------------------------------------
nofindxuezhu=1
---------------------------------------------------------------------主模块------------------------------------------------------------------------------------------------
function xuezhugo()
print('请在杂货铺预存5个火折以防火折售罄！')
print('请在杂货铺预存5个火折以防火折售罄！')
print('请在杂货铺预存5个火折以防火折售罄！')
print('请在杂货铺预存5个火折以防火折售罄！')
print('请在杂货铺预存5个火折以防火折售罄！')
        nofindxuezhu=0
        checkBags()
   wait.make(function() 
             wait.time(1) 
   if not Bag["火折"] then
        return go(bhz,'苏州','宝带桥')
   else
        exe('unset wimpy')
       	exe('nick 去苗疆找小程妹子')
   return go(xuezhuask,'苗疆','药王居')
end
end)
end
function bhz()
    create_trigger_t('hz1',"^(> )*你\\D*从小贩子那里买下了一支火折",'','xuezhugo')
    create_trigger_t('hz2',"^(> )*哟，抱歉啊，我这儿正忙着呢……您请稍候。",'','bhz')
    create_trigger_t('xz3',"^(> )*小贩子说道：「你想买的东西我这里没有。」",'','qhz')
    SetTriggerOption("hz1","group","hz")
    SetTriggerOption("hz2","group","hz")
    SetTriggerOption("hz3","group","hz")
    wait.make(function() 
             wait.time(1)
    exe('buy fire')
end)
end
function qhz()
      EnableTriggerGroup("hz",false)
      return go(qhzz,'扬州','杂货铺')
end
function qhzz()
    create_trigger_t('qhz1',"^(> )*你把火折从个人储物箱中提取出来。",'','xuezhugo')
    SetTriggerOption("qhz1","group","qhz")
         wait.make(function() 
             wait.time(1)
    exe('qu fire')
end)
end
    
function xuezhuask()
    create_trigger_t('xz1',"^(> )*恭喜！您现在的新绰号是：「帮小程妹子抓雪蛛」",'','xuezhuask1')
    --create_trigger_t('xz2',"^(> )*你晃动了半天，发现什麽也没有。",'','xuezhunofind')
    create_trigger_t('xz3',"^(> )*你轻轻摇晃树藤，忽然掉下一只雪蛛。",'','hitxuezhu1')
    create_trigger_t('xz4',"^(> )*雪蛛挣扎了几下，一个不稳晕倒过去。",'','getxuezhu1')
    create_trigger_t('xz5',"^(> )*雪蛛神志迷糊，脚下一个不稳，倒在地上昏了过去。",'','getxuezhu1')
    create_trigger_t('xz6',"^(> )*雪蛛「啪」的一声倒在地上，挣扎着抽动了几下就死了。",'','xuezhudie')
    create_trigger_t('xz7',"^(> )*你给程灵素一只雪蛛。",'','xuezhuset')
    create_trigger_t('xz8',"^(> )*雪蛛突然蹿到地上不见了。",'','xuezhudie')
   -- create_trigger_t('xz9',"^(> )*设定环境变量：拿雪蛛 = "YES"",'','autofindxuezhu') 
   
    SetTriggerOption("xz1","group","xz")
    --SetTriggerOption("xz2","group","xz")
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
wait.make(function() 
        wait.time(1)
        weapon_unwield()
	exe('nw;s;w;w;nu;eu;ed;nu;nw;e;enter;dian fire;bei strike;jiali 50;hit xue zhu')----------兵器替换成变量吧     
end)
        return xuezhunofind()
	end
function getxuezhu()
        weapon_unwield()
	exe('dian fire;bei strike;jiali 50;hit xue zhu')
        xuezhunofind()
end
function yaoshuteng()
    create_timer_s('yst',0.1,'yaoshuteng1')
end
function yaoshuteng1()
    exe('yao shuteng;get xue zhu')
end         
function xuezhunofind()
        exe('dian fire')
        wait.make(function() 
        wait.time(2)
        yaoshuteng()
end)
	nofindxuezhu=1
	againxuezhu=1
end
function getxuezhu1()
        EnableTimer('yst',false)
	exe('get xue zhu')
	return go(xuezhufinish,'苗疆','药王居')
end
function hitxuezhu1()
	exe('unwield qiankun;unwield haoqi;unwield longquan;bei leg;jiali 50;hit xue zhu')
end
function xuezhufinish()
	exe('give xue zhu to cheng lingsu')
	nofindxuezhu=1
	againxuezhu=0
	return check_job()
end
function xuezhudie()
	nofindxuezhu=1
	againxuezhu=1
	EnableTriggerGroup("xz",false)
	return check_job()	
end
function xuezhuset()
         exe('set 拿雪蛛 yes')
         EnableTriggerGroup("xz",false)
end

if nofindxuezhu==0 then
	   return xuezhugo()
end