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
-- 检查身上的绳子是否足够, 用于进华山山洞
-- ---------------------------------------------------------------
function CheckRope(func)
	delete_all_timers()
	if not Bag["绳子"] then
		print("绳子不够")
		exe("s;s;tell rope 交货")
		wait.make(
			function()
				wait.time(2)
				exe("get sheng zi;i;n;n;")
				return func()
			end
		)
	else
		print("绳子够了")
		return func()
	end
end

function checkYaoBags(func)
	DeleteTriggerGroup("Yaobags")
	create_trigger_t("Yaobags1", "^(> )*(\\D*)(锭|两|张)(白银|黄金|壹仟两银票)\\(", "", "checkBagsMoney")
	create_trigger_t("Yaobags2", '^(> )*你把 "action" 设定为 "检查药品" 成功完成。$', "", "checkYaoBagsOver")
	create_trigger_t("Yaobags3", "^(> )*(\\D*)封失落的信笺", "", "checkBagsletter")
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
	Bag["黄金"].cnt = 0
	Bag["白银"].cnt = 0
	tmp.yaobags = func
	exe("i;look bei nang")
	exe("alias action 检查药品")
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
		Beinang = {"空"}
	end
	for i = 1, #Beinang do
		if Beinang[i] == "" or Beinang[i] == nil then
			Beinang[i] = "数据丢失"
		end
		local l_name = Beinang[i]
		if string.find(l_name, "蝉蜕金疮药") then
			cty_cur = trans(Beinang[i])
		end
		if string.find(l_name, "颗内息丸") then
			nxw_cur = trans(Beinang[i])
		end
		if string.find(l_name, "川贝内息丸") then
			cbw_cur = trans(Beinang[i])
		end
		if string.find(l_name, "黄芪内息丹") then
			hqd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "活血疗精丹") then
			hxd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "大还丹") then
			dhd_cur = trans(Beinang[i])
		end
		if string.find(l_name, "铁矿石") then
			kuang_cur = trans(Beinang[i])
		end
		-- print(cty_cur,nxw_cur,hxd_cur,dhd_cur)
	end
end

-- ----------------------------------------------------------
-- 根据物品英文名(fullid),获取物品中文名, 仅限身上Bag里的物品
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
	create_trigger_t("bags1", "^(> )*你身上携带物品的别称如下", "", "checkBagsStart")
	create_trigger_t("bags2", "^\\d*:(\\D*) = (\\D*)$", "", "checkBagsId")
	create_trigger_t("bags3", "^(> )*你目前已经拥有了(\\D*)件私有装备：(\\D*)。$", "", "checkBagsU")
	create_trigger_t("bags4", "^(> )*(\\D*)(锭|两|张)(白银|黄金|壹仟两银票)\\(", "", "checkBagsMoney")
	create_trigger_t("bags5", '^(> )*你把 "action" 设定为 "检查包裹" 成功完成。$', "", "checkBagsOver")
	create_trigger_t("bags6", "^(> )*(\\D*)封失落的信笺", "", "checkBagsletter")
	create_trigger_t("bags7", "^(> )*(\\D*)枚飞镖\\(", "", "checkBagsDart")
	create_trigger_t("bags8", "^(> )*你身上带着(\\D*)件东西\\(负重\\s*(\\d*)\\.\\d*\\%\\)：", "", "checkBagsW")
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
	Bag["黄金"] = {}
	Bag["黄金"].id = {}
	Bag["黄金"].cnt = 0
	Bag["白银"] = {}
	Bag["白银"].id = {}
	Bag["白银"].cnt = 0
	tmp.bags = func
	weaponUsave = {}
	exe("id")
	checkWield()
	exe("look bei nang")
	exe("uweapon;alias action 检查包裹")
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
	if (string.find(l_name, "残篇") or string.find(l_name, "精要")) and not itemSave[l_name] then
		exe("read book")
		exe("drop " .. Bag[l_name].fullid)
	end
	if
		string.len(l_name) == 6 and
			(string.sub(l_name, 5, 6) == "药" or string.sub(l_name, 5, 6) == "丸" or string.sub(l_name, 5, 6) == "丹") and
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
		if string.find(q, "⊕") then
			q = string.sub(q, 3, -1)
		end
		-- 加入精血判断,若精血小于2000, 很可能修不了武器,造成一直尝试修武器的死循环
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
	local l_name = "枚飞镖"
	Bag[l_name] = {}
	Bag[l_name].id = {}
	Bag[l_name].cnt = 0
	local l_cnt = trans(Trim(w[2]))
	Bag[l_name].cnt = l_cnt
end
--[[function checkBagsYao(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[3])
  if string.find(l_name,"蝉蜕金疮药") then
      cty_cur = l_cnt
   end
   if string.find(l_name,"川贝内息丸") then
      nxw_cur = l_cnt
   end
   if string.find(l_name,"活血疗精丹") then
      hxd_cur = l_cnt
   end
   if string.find(l_name,"大还丹") then
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
	if Bag["大碗茶"] then
		exe("drop cha")
	end
	if Bag["棉花种子"] then
		exe("drop " .. Bag["棉花种子"].fullid)
	end
	if Bag["棉花"] then
		exe("drop " .. Bag["棉花"].fullid)
	end
	if Bag["青铜"] then
		exe("drop " .. Bag["青铜"].fullid)
	end
	if Bag["生铁"] then
		exe("drop " .. Bag["生铁"].fullid)
	end
	if Bag["粗绳子"] and Bag["粗绳子"].cnt > 2 then
		exe("drop cu shengzi 2")
	end
	if Bag["木剑"] and Bag["木剑"].cnt > 1 then
		exe("drop mu jian 2")
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
	if Bag["韦兰之锤"] then
		exe("give " .. Bag["韦兰之锤"].fullid .. " to zhujian shi")
	end
	Bag["韦兰之锤"] = nil
	return checkPrepare()
end
function check_gold()
    tmp.cnt = 0
    return go(check_gold_dali, "大理城", "大理钱庄")
end
function check_gold_dali()
    if not locl.id["严掌柜"] then
        return go(check_gold_xy, "襄阳城", "宝龙斋")
    else
        return check_gold_count()
    end
end
function check_gold_xy()
    if not locl.id["钱善人"] then
        return go(check_gold_cd, "成都城", "墨玉斋")
    else
        return check_gold_count()
    end
end
-- function check_gold_cd()
--    if not locl.id["王掌柜"] then
--      return go(check_gold_yz,"扬州城","天阁斋")
--   else
--      return check_gold_count()
--   end
-- end
-- ain
function check_gold_cd()
    if not locl.id["钱缝"] then
        return go(check_gold_dali, "大理城", "大理钱庄")
    else
        return check_gold_count()
    end
end
function check_gold_count()
    if Bag["壹仟两银票"] and Bag["壹仟两银票"].cnt > 10 then
        exe("score;chazhang")
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) > 50 then
            return check_cash_cun()
        end
    end
    if Bag and Bag["白银"] and Bag["白银"].cnt and Bag["白银"].cnt > 500 then
        return check_silver_qu()
    end
    if
        (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt < count.gold_max and score.gold > count.gold_max) or
        (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt > count.gold_max * 4)
    then
        return check_gold_qu()
    end

    return check_gold_over()
end
function check_cash_cun()
    if Bag["壹仟两银票"] then
        local l_cnt
        if score.goldlmt and score.gold and(score.goldlmt - score.gold) < Bag["壹仟两银票"].cnt * 10 then
            l_cnt = math.modf((score.goldlmt - score.gold) / 10) -1
        else
            l_cnt = Bag["壹仟两银票"].cnt
        end
        if l_cnt > 0 then
            exe("cun " .. l_cnt .. " cash")
        end
    end
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_silver_qu()
    local l_cnt = Bag["白银"].cnt - 100
    exe("cun " .. l_cnt .. " silver")
    exe("qu 50 silver")
    checkBags()
    return checkWait(check_gold_check, 3)
end
function check_gold_qu()
    local l_cnt = Bag["黄金"].cnt - count.gold_max * 2
    if l_cnt > 0 then
        exe('cun ' .. l_cnt .. ' gold')
    end
    if Bag["黄金"].cnt < count.gold_max then
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
    return go(checkZqdBuy, randomElement(drugBuy["正气丹"]))
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
    if Bag["黄金"] and Bag["黄金"].cnt > 4 and(not Bag["正气丹"] or Bag["正气丹"].cnt < 4) then
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
    return go(checkXqwBuy, randomElement(drugBuy["邪气丸"]))
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
    if Bag["黄金"] and Bag["黄金"].cnt > 4 and(not Bag["邪气丸"] or Bag["邪气丸"].cnt < 4) then
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
-- 检查内力药是否足够
-- ---------------------------------------------------------------
function checkNxw()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and(nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) then
        return go(checkNxwBuy, randomElement(drugBuy["内息丸"]))
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
            -- 这里是买3种内力药了，购买的次序分别是黄芪丹，川贝丸和内息丸，注意：黄芪丹+70%，川贝丸+50%，内息丸是固定+3000内力。
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
    if (nxw_cur < count.nxw_max or cbw_cur < count.cbw_max or hqd_cur < count.hqd_max) and Bag["黄金"] and Bag["黄金"].cnt > 4 then
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
        return go(checkHxdBuy, randomElement(drugBuy["蝉蜕金疮药"]))
    else
        return checkNxwOver()
    end
end
function checkHxdBuy()
    tmp.cnt = tmp.cnt + 1
    if tmp.cnt > 30 then
        return checkNxwOver()
	else
		if Bag["蝉蜕金疮药"] == nil or Bag["蝉蜕金疮药"].cnt < 20 then
	        exe("buy " .. drug.heal)
		end
        checkYaoBags()
        return check_bei(checkHxdBag)
    end
end
function checkHxdBag()
    if cty_cur < count.cty_max and Bag["黄金"] and Bag["黄金"].cnt > 4 then
        return checkWait(checkHxdBuy, 1)
    else
        return checkNxwOver()
    end
end

function checkLjd()
    tmp.cnt = 0
    if score.gold and score.gold > 100 and hxd_cur < count.hxd_max then
        return go(checkLjdBuy, randomElement(drugBuy["活血疗精丹"]))
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
    if hxd_cur < count.hxd_max and Bag["黄金"] and Bag["黄金"].cnt > 4 then
        return checkWait(checkLjdBuy, 1)
    else
        return checkNxwOver()
    end
end
function checkdhd()
    tmp.cnt = 0
    if score.tb and score.tb > 100 and dhd_cur < count.dhd_max then
        return go(checkdhdBuy, randomElement(drugBuy["大还丹"]))
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
    if not Bag["火折"] then
        return go(checkFireBuy, randomElement(drugBuy["火折"]))
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
    return go(checkYuCun, "扬州城", "杂货铺")
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
    return go(checkSellDo, "扬州城", "当铺")
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