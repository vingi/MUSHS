--
-- vingi.lua
--
-- ----------------------------------------------------------
-- return-code checker for MUSHclient functions that return error codes
-- ----------------------------------------------------------
--
--[[

Call for those MUSHclient functions that return a result code (like eOK).
Not all functions return such a code.

eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
module("vingi", package.seeall)

settings = {
	-- 是否自动向韦小宝买龙泉剑 (若设定为true, 则运行start后会先去买龙泉剑,该过程可能会很久,有可能几个小时才能买到, 买到后才会开始正常job)
	AutoBuy_Xiaobao_Longquan = false,
	-- 是否每天自动洪七公作菜10次
	Auto_hqgzc_10times = true,
	-- 是否 作任务之前 先double内力
	CheckNeili_InAdvance = false,
	-- 回内武器, 没有可置空
	RecoverWeapon = "taiji sword",
	-- 当打架无内力时(吃药在CD状态),执行的加内动作(无则可不填), 一些门派有恢复内力的内功, 如华山有yun zixia
	Recover_neili = "",
	-- 练习的指令 (建议单条练习不要超过10条指令, 容易引发flood,从而idle, 如需练习很多, 可选择使用table数组表的方式, 分多段进行)
	-- PracticeCMD = "wield taiji;jifa sword huashan-jianfa;lian sword 20;jifa sword jinshe-jianfa;lian sword 20;jifa sword huashan-jianfa;lian dodge 20;unwield taiji;bei none;jifa strike jinshe-zhangfa;lian strike 20;lian strike 20;lian cuff 20;wield taiji;lian force 20;unwield taiji;wield taibai;lian blade 20;unwield taibai;wield taiji;yun jingli;",
	PracticeCMD = {
		"unwield taiji;wield taibai blade;lian blade 20;lian blade 20;lian blade 20;lian blade 20;unwield taibai blade;wield taiji;yun jingli;",

		"wield taiji;lian sword 20;lian dodge 20;unwield taiji;lian strike 20;lian cuff 20;lian force 20;wield taibai blade;lian blade 20;unwield taibai blade;wield taiji;yun jingli;",

		-- "drop mi tao;unwield taiji;jifa cuff taizu-quan;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;lian cuff 20;yun jingli;wield taiji;"
	},
	-- 强制练习模式, 即不作任何任务, 强制练习某些技能, 用于补技能时使用, 身上最好有回内武器
	PracticeForce = true,
	-- 强制补技能模式, 即一直作洪七公任务来补pot, 满pot后去学习/领悟
	GetPotForce = false,
	-- 是否作华山2任务 (true, false, "smart" : smart为智能判断, 即综合判断当前 理相, 内力, 距离上一个武当任务的CD(可避免去送信)等因素综合考虑是否作华山2) 
	HuashanJob_Step2 = "smart",
	-- 是否自动蝶梦楼刷分
	AutoDML = false,
	-- 是否自动论坛收矿石
	-- 说明, 自动收矿石会发送你的帐号密码至WEBAPI以调用收取矿石, 如果觉得不安全的, 请不要使用
	AutoMine = true,
	-- 是否每周四自动领取会员福利
	AutoVipBenefit = true,
	-- 是否自动吃满Ebook双倍经验书
	AutoEbook = false
}

-- ---------------------------------------------------------------
-- 强制移除所有装备, 装备上回内武器 -- 自定义模式 by particular role
-- ---------------------------------------------------------------
function Wield_RecoverWeapon()
	local cmd = "unwield kunlun sword;unwield mu jian;unwield taibai blade;wield taiji sword;"
	exe(cmd)
end

return vingi
