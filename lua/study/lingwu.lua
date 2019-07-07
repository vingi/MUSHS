--
-- lingwu.lua
--
-- ----------------------------------------------------------
-- �� lingwu(����) ����function ����
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
function lingwu_trigger()
	DeleteTriggerGroup("lingwu")
	create_trigger_t("lingwu1", "^>*\\s*(��ֻ�ܴ����⼼��������|�㲻�����ּ��ܡ�|��Ҫ����ʲô��)", "", "lingwu_next")
	create_trigger_t("lingwu2", "^>*\\s*���ʵս�еõ���Ǳ���Ѿ������ˡ�", "", "lingwu_finish1")
	create_trigger_t("lingwu3", "^>*\\s*���\\D*�������޷��������һ��Ļ���", "", "lingwu_next")
	create_trigger_t("lingwu9", "^>*\\s*�������ڵĻ����ڹ���Ϊ�����޷���������ڹ���", "", "lingwu_next")
	create_trigger_t("lingwu5", "^>*\\s*����ʵս���鲻�㣬�谭����ġ�\\D*������", "", "lingwu_next")
	create_trigger_t("lingwu6", "^>*\\s*(���������˼����������������ö��ˡ�|�����ھ�������)", "", "lingwu_goon")
	create_trigger_t("lingwu7", "^>*\\s*�������������", "", "lingwu_finish1")
	SetTriggerOption("lingwu1", "group", "lingwu")
	SetTriggerOption("lingwu2", "group", "lingwu")
	SetTriggerOption("lingwu3", "group", "lingwu")
	SetTriggerOption("lingwu9", "group", "lingwu")
	SetTriggerOption("lingwu5", "group", "lingwu")
	SetTriggerOption("lingwu6", "group", "lingwu")
	SetTriggerOption("lingwu7", "group", "lingwu")
	EnableTriggerGroup("lingwu", false)
end
function checklingwu()
	if lingwudie == 0 then
		return lingwu()
	end
	if xxpot < hp.pot_max then
		return lingwu()
	end
	return check_job()
end
function lingwu()
	DeleteTemporaryTriggers()
	lingwu_trigger()
	skillsLingwu = {}
	skillsLingwu = utils.split(GetVariable("lingwuskills"), "|")
	road.temp = 0
	tmp.lingwu = 1
	lingwudie = 0
	return check_busy(lingwu_go)
end
function lingwu_go()
	exe("nick ���������ĦԺ���")
	messageShow("ȥ��������")
	jifaAll()

	go(lingwu_unwield, "��ɽ����", "��ĦԺ")
end
function lingwu_unwield()
	weapon_unwield()
	exe("hp")
	local leweapon = GetVariable("learnweapon")
	exe("wield " .. leweapon)
	return check_busy(lingwuzb)
 --׼����������ֱ����������ֱ�������޸�Ϊlingwuzbok��
end
function lingwuzb()
	if hp.neili > (hp.neili_max * 0.8) and hp.neili > 30000 then
		lingwuzbok()
	else
		zhunbeineili(lingwuzbok)
	end
end
function lingwuzbok()
	go(lingwu_goon, "��ɽ����", "��ĦԺ���")
end
function lingwuSleep()
	if score.gender == "��" then
		return go(lingwuSleepOver, "songshan/nan-room", "")
	else
		return go(lingwuSleepOver, "songshan/nv-room", "")
	end
end
function lingwuSleepOver()
	exe("sleep")
	EnableTimer("walkWait4", false)
	checkWait(lingwu_eat, 3)
end
--[[function lingwu_goonpre()
    EnableTimer('walkWait4',false)
	lingwu_goon()
end]]
function lingwu_goon()
	if locl.room ~= "��ĦԺ���" then
		return lingwu_finish()
	end
	EnableTriggerGroup("lingwu", true)
	local skill = skillsLingwu[tmp.lingwu]

	if not skills[skill] or skills[skill].lvl == 0 or skills[skill].lvl >= hp.pot_max - 100 then
		return lingwu_next()
	end

	if hp.neili < 1000 then
		if hp.exp > 20000000 or score.gender == "��" then
			return go(lingwu_eat, "�䵱ɽ", "��ͤ")
		else
			return lingwuSleep()
		end
	end
	yunAddInt()
	flag.idle = nil
	exe("yun jing;#5(lingwu " .. skill .. ")")
	--exe('alias action ����������Ǻð������Ǻã�')
	create_timer_s("walkWait4", 0.4, "lingwu_alias")
	--return check_bei(lingwu_alias,1.8)ԭ���ĳ���
end
function lingwu_eat()
	if locl.room == "��ͤ" then
		flag.food = 0
		exe("sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao")
		check_bei(lingwu_go)
	else
		return go(lingwu_eat, "�䵱ɽ", "��ͤ")
	end
end
function lingwu_alias()
	exe("yun jing;hp")
	--exe('alias action ����������Ǻð������Ǻã�')
end
function lingwu_next()
	EnableTriggerGroup("lingwu", false)
	tmp.lingwu = tmp.lingwu + 1
	local length = table.getn(skillsLingwu)
	if tmp.lingwu > length then
		flag.lingwu = 0
		lingwudie = 1
		xxpot = hp.pot_max
		--return check_bei(lingwu_finish)
		return lingwu_finish()
	else
		local skill = skillsLingwu[tmp.lingwu]
		--print(skillsLingwu[tmp.lingwu])
		if skills[skill] and skills[skill].lvl > 0 and skills[skill].lvl < hp.pot_max - 100 then
			return check_bei(lingwu_goon, 1)
		else
			return lingwu_next()
		end
	end
end
function lingwu_finish1()
	EnableTimer("walkWait4", false)
	checkWait(lingwu_finish, 1)
end
function lingwu_finish()
	messageShow("�����������")
	local skill = skillsLingwu[tmp.lingwu]
	EnableTriggerGroup("lingwu", false)
	DeleteTriggerGroup("lingwu")
	exe("cha")
	flag.lingwu = 0
	if tmp.lingwu > 1 and tmp.lingwu <= table.getn(skillsLingwu) then
		table.remove(skillsLingwu, tmp.lingwu)
		table.insert(skillsLingwu, 1, skill)
	end
	flag.lingwu = 0
	--weapon_unwield()
	-- local leweapon=GetVariable("learnweapon")
	-- exe('cha;unwield '..leweapon)
	return check_job()
	--return check_busy(check_food)
end
