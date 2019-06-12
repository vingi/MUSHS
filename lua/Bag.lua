--
-- Bag.lua
--
-- ----------------------------------------------------------
-- return-code checker for MUSHclient functions that return error codes
-- ----------------------------------------------------------
--
--[[


--]]
-- ---------------------------------------------------------------
-- ������ϵ������Ƿ��㹻, ���ڽ���ɽɽ��
-- ---------------------------------------------------------------
function CheckRope(func)
	delete_all_timers()
	if not Bag["����"] then
		print("���Ӳ���")
		exe("s;s;tell rope ����")
		wait.make(
			function()
				wait.time(2)
				exe("get sheng zi;i;n;n;")
				return func()
			end
		)
	else
		print("���ӹ���")
		return func()
	end
end

function checkYaoBags(func)
	DeleteTriggerGroup("Yaobags")
	create_trigger_t("Yaobags1", "^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(", "", "checkBagsMoney")
	create_trigger_t("Yaobags2", '^(> )*��� "action" �趨Ϊ "���ҩƷ" �ɹ���ɡ�$', "", "checkYaoBagsOver")
	create_trigger_t("Yaobags3", "^(> )*(\\D*)��ʧ����ż�", "", "checkBagsletter")
	SetTriggerOption("Yaobags1", "group", "Yaobags")
	SetTriggerOption("Yaobags2", "group", "Yaobags")
	SetTriggerOption("Yaobags3", "group", "Yaobags")
	EnableTriggerGroup("Yaobags", true)
	cty_cur = 0
	nxw_cur = 0
	cbw_cur = 0
	hqd_cur = 0
	hxd_cur = 0
	dhd_cur = 0
	-- print(cty_cur,nxw_cur,hxd_cur)
	Bag["�ƽ�"].cnt = 0
	Bag["����"].cnt = 0
	tmp.yaobags = func
	exe("i;look bei nang")
	exe("alias action ���ҩƷ")
end
function checkYaoBagsOver()
	checkBY()
	draw_beinangwindow()
	EnableTriggerGroup("Yaobags", false)
	DeleteTriggerGroup("Yaobags")
	EnableTriggerGroup("beinang", false)
	DeleteTriggerGroup("beinang")
	-- print(cty_cur,nxw_cur,hxd_cur)
	if tmp.yaobags ~= nil then
		return tmp.yaobags()
	end
end

function checkBY()
	if not Beinang then
		Beinang = {"��"}
	end
	for i = 1, #Beinang do
		if Beinang[i] == "" or Beinang[i] == nil then
			Beinang[i] = "���ݶ�ʧ"
		end
		local l_name = Beinang[i]
		if string.find(l_name, "���ɽ�ҩ") then
			cty_cur = trans(Beinang[i])
		end
		if string.find(l_name, "����Ϣ��") then
			nxw_cur = trans(Beinang[i])
		end
		if string.find(l_name, "������Ϣ��") then
			cbw_cur = trans(Beinang[i])
		end
		if string.find(l_name, "������Ϣ��") then
			hqd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "��Ѫ�ƾ���") then
			hxd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "�󻹵�") then
			dhd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "����ʯ") then
			kuang_cur = trans(Beinang[i])
		end
		-- print(cty_cur,nxw_cur,hxd_cur,dhd_cur)
	end
end

-- ----------------------------------------------------------
-- ������ƷӢ����(fullid),��ȡ��Ʒ������, ��������Bag�����Ʒ
-- ----------------------------------------------------------
function GetItemChineseInBagByFullID(tFullID)
	local CN_name = ""
	for p in pairs(Bag) do
		if Bag[p].fullid == tFullID then
			CN_name = tostring(p)
		end
	end
	return CN_name
end

function checkBags(func)
	DeleteTriggerGroup("bags")
	create_trigger_t("bags1", "^(> )*������Я����Ʒ�ı������", "", "checkBagsStart")
	create_trigger_t("bags2", "^\\d*:(\\D*) = (\\D*)$", "", "checkBagsId")
	create_trigger_t("bags3", "^(> )*��Ŀǰ�Ѿ�ӵ����(\\D*)��˽��װ����(\\D*)��$", "", "checkBagsU")
	create_trigger_t("bags4", "^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(", "", "checkBagsMoney")
	create_trigger_t("bags5", '^(> )*��� "action" �趨Ϊ "������" �ɹ���ɡ�$', "", "checkBagsOver")
	create_trigger_t("bags6", "^(> )*(\\D*)��ʧ����ż�", "", "checkBagsletter")
	create_trigger_t("bags7", "^(> )*(\\D*)ö����\\(", "", "checkBagsDart")
	create_trigger_t("bags8", "^(> )*�����ϴ���(\\D*)������\\(����\\s*(\\d*)\\.\\d*\\%\\)��", "", "checkBagsW")
	SetTriggerOption("bags1", "group", "bags")
	SetTriggerOption("bags2", "group", "bags")
	SetTriggerOption("bags3", "group", "bags")
	SetTriggerOption("bags4", "group", "bags")
	SetTriggerOption("bags5", "group", "bags")
	SetTriggerOption("bags6", "group", "bags")
	SetTriggerOption("bags7", "group", "bags")
	SetTriggerOption("bags8", "group", "bags")
	EnableTriggerGroup("bags", false)
	EnableTrigger("bags1", true)
	cty_cur = 0
	nxw_cur = 0
	cbw_cur = 0
	hqd_cur = 0
	hxd_cur = 0
	dhd_cur = 0
	-- print(cty_cur,nxw_cur,hxd_cur)
	bags = {}
	Bag = {}
	Bag["�ƽ�"] = {}
	Bag["�ƽ�"].id = {}
	Bag["�ƽ�"].cnt = 0
	Bag["����"] = {}
	Bag["����"].id = {}
	Bag["����"].cnt = 0
	tmp.bags = func
	weaponUsave = {}
	exe("id")
	checkWield()
	exe("look bei nang")
	exe("uweapon;alias action ������")
end
function checkBagsletter()
	lostletter = 1
end
function checkBagsStart()
	EnableTriggerGroup("bags", true)
end
function checkBagsId(n, l, w)
	local l_name = Trim(w[1])
	local l_id = w[2]
	local l_set = {}
	local l_cnt = 0
	if not Bag[l_name] then
		Bag[l_name] = {}
	end
	Bag[l_name].id = {}
	if string.find(l_id, ",") then
		l_set = utils.split(l_id, ",")
		l_id = l_set[1]
		for k, v in ipairs(l_set) do
			-- table.insert(Bag[l_name].id,1,Trim(v))
			Bag[l_name].id[Trim(v)] = true
			if string.len(Trim(v)) > l_cnt then
				Bag[l_name].fullid = Trim(v)
				l_cnt = string.len(Trim(v))
			end
		end
	else
		Bag[l_name].id[Trim(l_id)] = true
		-- table.insert(Bag[l_name].id,1,Trim(l_id))
		Bag[l_name].fullid = Trim(l_id)
	end
	if Bag[l_name].id["armor"] then
		Bag[l_name].kind = "armor"
	end
	if Bag[l_name].id["dao"] or Bag[l_name].id["blade"] then
		Bag[l_name].kind = "blade"
	end
	if Bag[l_name].id["jian"] or Bag[l_name].id["sword"] then
		Bag[l_name].kind = "sword"
	end
	if Bag[l_name].id["xiao"] then
		Bag[l_name].kind = "xiao"
	end
	if Bag[l_name].id["gun"] or Bag[l_name].id["club"] then
		Bag[l_name].kind = "club"
	end
	if Bag[l_name].id["stick"] or Bag[l_name].id["zhubang"] or Bag[l_name].id["bang"] then
		Bag[l_name].kind = "stick"
	end
	if Bag[l_name].id["bi"] or Bag[l_name].id["brush"] then
		Bag[l_name].kind = "brush"
	end
	if Bag[l_name].id["qiang"] or Bag[l_name].id["spear"] then
		Bag[l_name].kind = "spear"
	end
	if Bag[l_name].id["chui"] or Bag[l_name].id["hammer"] then
		Bag[l_name].kind = "hammer"
	end
	if Bag[l_name].id["gangzhang"] or Bag[l_name].id["staff"] or Bag[l_name].id["zhang"] or Bag[l_name].id["jiang"] then
		Bag[l_name].kind = "staff"
	end
	if Bag[l_name].id["bian"] or Bag[l_name].id["whip"] then
		Bag[l_name].kind = "whip"
	end
	if Bag[l_name].id["hook"] then
		Bag[l_name].kind = "hook"
	end
	if Bag[l_name].id["fu"] or Bag[l_name].id["axe"] then
		Bag[l_name].kind = "axe"
	end
	if Bag[l_name].id["bishou"] or Bag[l_name].id["dagger"] then
		Bag[l_name].kind = "dagger"
	end
	if weaponThrowing[l_name] then
		Bag[l_name].kind = "throwing"
	end
	if (string.find(l_name, "��ƪ") or string.find(l_name, "��Ҫ")) and not itemSave[l_name] then
		exe("read book")
		exe("drop " .. Bag[l_name].fullid)
	end
	if
		string.len(l_name) == 6 and
			(string.sub(l_name, 5, 6) == "ҩ" or string.sub(l_name, 5, 6) == "��" or string.sub(l_name, 5, 6) == "��") and
			(not drugPoison[l_name] and not drugBuy[l_name])
	 then
		exe("eat " .. Bag[l_name].fullid)
	end
	bags[l_name] = Trim(l_id)
	if Bag[l_name].cnt then
		Bag[l_name].cnt = Bag[l_name].cnt + 1
	else
		Bag[l_name].cnt = 1
	end
end
function checkBagsU(n, l, w)
	local t = Trim(w[3])
	local s = utils.split(t, ",")
	for p, q in pairs(s) do
		if string.find(q, "��") then
			q = string.sub(q, 3, -1)
		end
		-- ���뾫Ѫ�ж�,����ѪС��2000, �ܿ����޲�������,���һֱ��������������ѭ��
		if hp.jingxue > 2000 then
			weaponUsave[q] = true
		end
	end
end
function checkBagsMoney(n, l, w)
	local l_cnt = trans(Trim(w[2]))
	local l_name = Trim(w[4])
	if Bag[l_name] then
		Bag[l_name].cnt = l_cnt
	end
end
function checkBagsW(n, l, w)
	local t = tonumber(w[3])
	Bag = Bag or {}
	Bag["ENCB"] = {}
	Bag["ENCB"].value = t
end
function checkBagsDart(n, l, w)
	local l_name = "ö����"
	Bag[l_name] = {}
	Bag[l_name].id = {}
	Bag[l_name].cnt = 0
	local l_cnt = trans(Trim(w[2]))
	Bag[l_name].cnt = l_cnt
end
--[[function checkBagsYao(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[3])
  if string.find(l_name,"���ɽ�ҩ") then
      cty_cur = l_cnt
   end
   if string.find(l_name,"������Ϣ��") then
      nxw_cur = l_cnt
   end
   if string.find(l_name,"��Ѫ�ƾ���") then
      hxd_cur = l_cnt
   end
   if string.find(l_name,"�󻹵�") then
      dhd_cur = l_cnt
   end
end]]
function checkBagsOver()
	draw_bagwindow()
	checkBY()
	draw_beinangwindow()
	EnableTriggerGroup("bags", false)
	DeleteTriggerGroup("bags")
	EnableTriggerGroup("beinang", false)
	DeleteTriggerGroup("beinang")
	if Bag["�����"] then
		exe("drop cha")
	end
	if Bag["�޻�����"] then
		exe("drop " .. Bag["�޻�����"].fullid)
	end
	if Bag["�޻�"] then
		exe("drop " .. Bag["�޻�"].fullid)
	end
	if Bag["��ͭ"] then
		exe("drop " .. Bag["��ͭ"].fullid)
	end
	if Bag["����"] then
		exe("drop " .. Bag["����"].fullid)
	end
	if Bag["������"] and Bag["������"].cnt > 2 then
		exe("drop cu shengzi 2")
	end
	if Bag["ľ��"] and Bag["ľ��"].cnt > 1 then
		exe("drop mu jian 2")
	end
	if Bag["ˮ����"] then
		exe("drop mi tao")
	end
	-- print(cty_cur,nxw_cur,hxd_cur)
	if tmp.bags ~= nil then
		return tmp.bags()
	end
end

function isInBags(p_item)
	if p_item == nil then
		return false
	end
	local l_cnt = 0
	local l_item
	if Bag[p_item] then
		l_item = p_item
		l_cnt = l_cnt + Bag[p_item].cnt
	-- return p_item,Bag[p_item].cnt
	end
	for k, v in pairs(Bag) do
		if type(v.id) == "table" then
			if v.id[p_item] then
				l_item = k
				l_cnt = l_cnt + Bag[k].cnt
			end
		end
	end
	if l_cnt > 0 then
		return l_item, l_cnt
	end
	return false
end
function checkHmGive()
	if Bag["Τ��֮��"] then
		exe("give " .. Bag["Τ��֮��"].fullid .. " to zhujian shi")
	end
	Bag["Τ��֮��"] = nil
	return checkPrepare()
end
function check_gold()
    tmp.cnt = 0
    return go(check_gold_dali, "�����", "����Ǯׯ")
end
function check_gold_dali()
    if not locl.id["���ƹ�"] then
        return go(check_gold_xy, "������", "����ի")
    else
        return check_gold_count()
    end
end
function check_gold_xy()
    if not locl.id["Ǯ����"] then
        return go(check_gold_cd, "�ɶ���", "ī��ի")
    else
        return check_gold_count()
    end
end
-- function check_gold_cd()
--    if not locl.id["���ƹ�"] then
--      return go(check_gold_yz,"���ݳ�","���ի")
--   else
--      return check_gold_count()
--   end
-- end
-- ain
function check_gold_cd()
    if not locl.id["Ǯ��"] then
        return go(check_gold_dali, "�����", "����Ǯׯ")
    else
        return check_gold_count()
    end
end
function check_gold_count()
    if Bag["ҼǪ����Ʊ"] and Bag["ҼǪ����Ʊ"].cnt > 10 then
        exe("score;chazhang")
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) > 50 then
            return check_cash_cun()
        end
    end
    if Bag and Bag["����"] and Bag["����"].cnt and Bag["����"].cnt > 500 then
        return check_silver_qu()
    end
    if
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt < count.gold_max and score.gold > count.gold_max) or
        (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt > count.gold_max * 4)
    then
        return check_gold_qu()
    end

    return check_gold_over()
end
function check_cash_cun()
    if Bag["ҼǪ����Ʊ"] then
        local l_cnt
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) < Bag["ҼǪ����Ʊ"].cnt * 10 then
            l_cnt = math.modf((score.goldlmt - score.gold) / 10) -1
        else
            l_cnt = Bag["ҼǪ����Ʊ"].cnt
        end
        if l_cnt > 0 then
            exe("cun " .. l_cnt .. " cash")
        end
    end
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_silver_qu()
    local l_cnt = Bag["����"].cnt - 100
    exe("cun " .. l_cnt .. " silver")
    exe("qu 50 silver")
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_gold_qu()
    local l_cnt = Bag["�ƽ�"].cnt - count.gold_max * 2
    if l_cnt > 0 then
        exe('cun ' .. l_cnt .. ' gold')
    end
    if Bag["�ƽ�"].cnt < count.gold_max then
        exe("qu " .. count.gold_max .. " gold")
    end
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_gold_check()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return check_heal()
    end
    return check_gold_count()
end
function check_gold_over()
    return checkPrepare()
end

function checkZqd()
    tmp.cnt = 0
    return go(checkZqdBuy, randomElement(drugBuy["������"]))
end
function checkZqdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkZqdOver()
    else
        exe("buy zhengqi dan")
        checkBags()
        return check_bei(checkZqdi)
    end
end
function checkZqdi()
    if Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 and(not Bag["������"] or Bag["������"].cnt < 4) then
        return checkWait(checkZqdBuy, 1)
    else
        return checkZqdOver()
    end
end
function checkZqdOver()
    checkBags()
    return check_bei(checkPrepare, 1)
end

function checkXqw()
    tmp.cnt = 0
    return go(checkXqwBuy, randomElement(drugBuy["а����"]))
end
function checkXqwBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkXqwOver()
    else
        exe("buy xieqi wan")
        checkBags()
        return check_bei(checkXqwi)
    end
end
function checkXqwi()
    if Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 and(not Bag["а����"] or Bag["а����"].cnt < 4) then
        return checkWait(checkXqwBuy, 1)
    else
        return checkXqwOver()
    end
end
function checkXqwOver()
    checkBags()
    return check_bei(checkPrepare, 1)
end
-- ---------------------------------------------------------------
-- �������ҩ�Ƿ��㹻
-- ---------------------------------------------------------------
function checkNxw()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and (nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) then
        return go(checkNxwBuy, randomElement(drugBuy["��Ϣ��"]))
    else
        return checkNxwOver()
    end
end
function checkNxwBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        if hqd_cur < count.hqd_max then
            -- ��������3������ҩ�ˣ�����Ĵ���ֱ��ǻ��ε������������Ϣ�裬ע�⣺���ε�+70%��������+50%����Ϣ���ǹ̶�+3000������
            exe('buy ' .. drug.neili3)
        end
        if cbw_cur < count.cbw_max then
            exe('buy ' .. drug.neili2)
        end
        if nxw_cur < count.nxw_max then
            exe('buy ' .. drug.neili1)
        end
        checkYaoBags()
        return check_bei(checkNxwi)
    end
end
function checkNxwi()
    if (nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkNxwBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkNxwOver()
    return check_bei(checkPrepare, 1)
end

function checkHxd()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and cty_cur < count.cty_max then
        return go(checkHxdBuy, randomElement(drugBuy["���ɽ�ҩ"]))
    else
        return checkNxwOver()
    end
end
function checkHxdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
	else
		if (Bag["���ɽ�ҩ"] == nil or Bag["���ɽ�ҩ"].cnt < 20) and GetRoleConfig("PracticeForce") ~= true and GetRoleConfig("GetPotForce") ~= true then
	        exe("buy " .. drug.heal)
		end
        checkYaoBags()
        return check_bei(checkHxdBag)
    end
end
function checkHxdBag()
    if cty_cur < count.cty_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkHxdBuy, 1)
    else
        return checkNxwOver()
    end
end

function checkLjd()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and hxd_cur < count.hxd_max then
        return go(checkLjdBuy, randomElement(drugBuy["��Ѫ�ƾ���"]))
    else
        return checkNxwOver()
    end
end
function checkLjdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        exe("buy " .. drug.jingxue)
        checkYaoBags()
        return check_bei(checkLjdBag)
    end
end
function checkLjdBag()
    if hxd_cur < count.hxd_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt > 4 then
        return checkWait(checkLjdBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkdhd()
    tmp.cnt = 0
    if score.tb and score.tb > 100 and dhd_cur < count.dhd_max then
        return go(checkdhdBuy, randomElement(drugBuy["�󻹵�"]))
    else
        return checkNxwOver()
    end
end
function checkdhdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
    else
        exe("duihuan dahuan dan;score")
        checkYaoBags()
        return check_halt(checkdhdBag)
    end
end
function checkdhdBag()
    if dhd_cur < count.dhd_max and score.tb and score.tb > 100 then
        return checkWait(checkdhdBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkFire()
    if not Bag["����"] then
        return go(checkFireBuy, randomElement(drugBuy["����"]))
    else
        return checkFireOver()
    end
end
function checkFireBuy()
    exe("buy fire")
    checkBags()
    return checkFireOver()
end
function checkFireOver()
    exe("drop fire 2")
    return check_busy(checkPrepare, 1)
end

function checkYu(p_yu)
    tmp.yu = p_yu
    return go(checkYuCun, "���ݳ�", "�ӻ���")
end
function checkYuCun()
    exe("cun " .. Bag[tmp.yu].fullid)
    return check_bei(checkYuOver)
end
function checkYuOver()
    exe("cun yu;drop yu")
    checkBags()
    return check_busy(checkPrepare, 1)
end

function checkSell(p_sell)
    tmp.sell = p_sell
    return go(checkSellDo, "���ݳ�", "����")
end
function checkSellDo()
    if Bag[tmp.sell] then
        exe("sell " .. Bag[tmp.sell].fullid)
    end
    return check_bei(checkSellOver)
end
function checkSellOver()
    if Bag[tmp.sell] then
        exe("sell " .. Bag[tmp.sell].fullid)
        exe("drop " .. Bag[tmp.sell].fullid)
    end
    checkBags()
    return check_busy(checkPrepare, 1)
end