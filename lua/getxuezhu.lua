--------------------------------------------------------------------Ĭ�ϵı���-----------------------------------------------------------------------------------------
nofindxuezhu=1
---------------------------------------------------------------------��ģ��------------------------------------------------------------------------------------------------
function xuezhugo()
        nofindxuezhu=0
        delete_all_triggers()
        dis_all()
	exe('nick ȥ�置��С������')
	return go(xuezhuask,'�置','ҩ����')
end
function xuezhuask()
    create_trigger_t('xz1',"^(> )*��ϲ�������ڵ��´º��ǣ�����С������ץѩ�롹",'','xuezhuask1')
    create_trigger_t('xz2',"^(> )*��ζ��˰��죬����ʲ��Ҳû�С�",'','xuezhunofind')
    create_trigger_t('xz3',"^(> )*������ҡ�����٣���Ȼ����һֻѩ�롣",'','hitxuezhu1')
    create_trigger_t('xz4',"^(> )*ѩ�������˼��£�һ�������ε���ȥ��",'','getxuezhu1')
    create_trigger_t('xz5',"^(> )*ѩ����־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",'','getxuezhu1')
    create_trigger_t('xz6',"^(> )*ѩ�롸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','xuezhudie')
    create_trigger_t('xz7',"^(> )*���������һֻѩ�롣",'','xuezhuset')
    create_trigger_t('xz8',"^(> )*ѩ��ͻȻ�ڵ����ϲ����ˡ�",'','xuezhudie')
   -- create_trigger_t('xz9',"^(> )*�趨������������ѩ�� = "YES"",'','autofindxuezhu') 
   
    SetTriggerOption("xz1","group","xz")
    SetTriggerOption("xz2","group","xz")
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
	exe('nw;s;w;w;nu;eu;ed;nu;nw;e;enter;dian fire;yao shuteng;unwield qiankun;unwield haoqi;unwield longquan;bei leg;jiali 30;hit xue zhu')----------�����滻�ɱ�����
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
	return go(xuezhufinish,'�置','ҩ����')
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
         exe('set ��ѩ�� yes')
end

if nofindxuezhu==0 then
	   return xuezhugo()
end