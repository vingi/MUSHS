pker={}
pker.name="none"
pker.id="none"

--�������Ҫ��%x~((%w)~)�����ಫ������Ҳ���������һ�� kill ָ�
function Openfpk()
  EnableTriggerGroup("pk",false)
	DeleteTriggerGroup("pk")
	create_trigger_t('pk1',"^(> )*�����Ҫ��(\\D*)\\((\\D*)\\)�����ಫ��",'','fpk')
	SetTriggerOption("pk1","group","pk")
	print("fpk load finish")
	return exe('wink')
end

function fpk(n,l,w)
--��ȵ������̨���ƣ����У���
--�̨���ƶ������ȣ����ɶ������㣡��
--��ͻ���ħ��һ���棬������˵�ʹ���������
--�̨����һ�����㣬���һ㶣���У����������㣡��
--�̨���ƺ��������������ۺ죬���̴���������
--С��ؤ��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��
--����ؤ��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�
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
	
	create_trigger_t('pk1',"^(> )*���(\\D*)һ���棬������˵�ʹ�������",'','fpk2')
	create_trigger_t('pk2',"^(> )*"..pker.name.."�ȵ������㣬���ǵ��ʻ�û���꣬���У���",'','fpk2')
	create_trigger_t('pk3',"^(> )*"..pker.name.."һ��Ƴ���㣬���ߡ���һ�����˹�����",'','fpk2')
	create_trigger_t('pk4',"^(> )*"..pker.name.."һ�����㣬���һ㶣���У����������㣡��",'','fpk2')
	create_trigger_t('pk5',"^(> )*"..pker.name.."���������������ۺ죬���̴���������",'','fpk2')
	create_trigger_t('pk6',"^(> )*��ȵ�����"..pker.name.."�����У���",'','fpk2')
	create_trigger_t('pk7',"^(> )*"..pker.name.."��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",'','fpk3')
	create_trigger_t('pk8',"^(> )*"..pker.name.."��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','fpk4')
	
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
--��ͻ���ħ��һ���棬������˵�ʹ���������
   exe('say 2 pker:'..pker.name..pker.id)
   return exe('kill '..pker.id)
end
function fpk3()
--��ͻ���ħ��һ���棬������˵�ʹ���������
   return exe('kill '..pker.id)
end

function fpk4()
--��ͻ���ħ��һ���棬������˵�ʹ���������
  EnableTriggerGroup("pk2",false)
	EnableTriggerGroup("pk3",false)
	EnableTriggerGroup("pk4",false)

	DeleteTriggerGroup("pk2")
	DeleteTriggerGroup("pk3")
	DeleteTriggerGroup("pk4")
   return exe('qie corpse')
end
