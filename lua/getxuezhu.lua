--------------------------------------------------------------------Ĭ�ϵı���-----------------------------------------------------------------------------------------
nofindxuezhu=1
---------------------------------------------------------------------��ģ��------------------------------------------------------------------------------------------------
function xuezhugo()
print('�����ӻ���Ԥ��5�������Է�����������')
print('�����ӻ���Ԥ��5�������Է�����������')
print('�����ӻ���Ԥ��5�������Է�����������')
print('�����ӻ���Ԥ��5�������Է�����������')
print('�����ӻ���Ԥ��5�������Է�����������')
        nofindxuezhu=0
        checkBags()
   wait.make(function() 
             wait.time(1) 
   if not Bag["����"] then
        return go(bhz,'����','������')
   else
        exe('unset wimpy')
       	exe('nick ȥ�置��С������')
   return go(xuezhuask,'�置','ҩ����')
end
end)
end
function bhz()
    create_trigger_t('hz1',"^(> )*��\\D*��С��������������һ֧����",'','xuezhugo')
    create_trigger_t('hz2',"^(> )*Ӵ����Ǹ�����������æ���ء��������Ժ�",'','bhz')
    create_trigger_t('xz3',"^(> )*С����˵������������Ķ���������û�С���",'','qhz')
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
      return go(qhzz,'����','�ӻ���')
end
function qhzz()
    create_trigger_t('qhz1',"^(> )*��ѻ��۴Ӹ��˴���������ȡ������",'','xuezhugo')
    SetTriggerOption("qhz1","group","qhz")
         wait.make(function() 
             wait.time(1)
    exe('qu fire')
end)
end
    
function xuezhuask()
    create_trigger_t('xz1',"^(> )*��ϲ�������ڵ��´º��ǣ�����С������ץѩ�롹",'','xuezhuask1')
    --create_trigger_t('xz2',"^(> )*��ζ��˰��죬����ʲ��Ҳû�С�",'','xuezhunofind')
    create_trigger_t('xz3',"^(> )*������ҡ�����٣���Ȼ����һֻѩ�롣",'','hitxuezhu1')
    create_trigger_t('xz4',"^(> )*ѩ�������˼��£�һ�������ε���ȥ��",'','getxuezhu1')
    create_trigger_t('xz5',"^(> )*ѩ����־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",'','getxuezhu1')
    create_trigger_t('xz6',"^(> )*ѩ�롸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','xuezhudie')
    create_trigger_t('xz7',"^(> )*���������һֻѩ�롣",'','xuezhuset')
    create_trigger_t('xz8',"^(> )*ѩ��ͻȻ�ڵ����ϲ����ˡ�",'','xuezhudie')
   -- create_trigger_t('xz9',"^(> )*�趨������������ѩ�� = "YES"",'','autofindxuezhu') 
   
    SetTriggerOption("xz1","group","xz")
    --SetTriggerOption("xz2","group","xz")
    SetTriggerOption("xz3","group","xz")
    SetTriggerOption("xz4","group","xz")
    SetTriggerOption("xz5","group","xz")
    SetTriggerOption("xz6","group","xz")
    SetTriggerOption("xz7","group","xz")
    SetTriggerOption("xz8","group","xz")


	exe('ask cheng lingsu about �嶾��')
	wait.make(function() 
        wait.time(2)
        exe('yes;fu jiuxuebiyun dan')
	exe('nick ��С������ץѩ��')
     end)
	EnableTriggerGroup("xz",true)
end
function xuezhuask1()
wait.make(function() 
        wait.time(1)
        weapon_unwield()
	exe('nw;s;w;w;nu;eu;ed;nu;nw;e;enter;dian fire;bei strike;jiali 50;hit xue zhu')----------�����滻�ɱ�����     
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
	return go(xuezhufinish,'�置','ҩ����')
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
         exe('set ��ѩ�� yes')
         EnableTriggerGroup("xz",false)
end

if nofindxuezhu==0 then
	   return xuezhugo()
end