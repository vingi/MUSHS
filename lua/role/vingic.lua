--
-- vingib.lua
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
module("vingic", package.seeall)

settings = {
	-- 是否自动向韦小宝买龙泉剑 (若设定为true, 则运行start后会先去买龙泉剑,该过程可能会很久,有可能几个小时才能买到, 买到后才会开始正常job)
	AutoBuy_Xiaobao_Longquan = false,
	-- 是否每天自动洪七公作菜10次
	Auto_hqgzc_10times = false,
	-- 是否 作任务之前 先double内力
	CheckNeili_InAdvance = false,
	-- 回内武器, 没有可置空
	RecoverWeapon = "kunlun sword",
	-- 当打架无内力时(吃药在CD状态),执行的加内动作(无则可不填), 一些门派有恢复内力的内功, 如华山有yun zixia
	Recover_neili = "",
	-- 练习的指令
	PracticeCMD = "lian force 20;lian sword 20;lian dodge 20;unwield kunlun sword;lian cuff 20;lian hand 20;wield kunlun sword;",
	-- 强制练习模式, 即不作任何任务, 强制练习某些技能, 用于补技能时使用, 身上最好有回内武器
	PracticeForce = false,
	-- 是否作华山2任务
	HuashanJob_Step2 = "smart",
	-- 是否自动蝶梦楼刷分
	AutoDML = true,
	-- 是否自动论坛收矿石
	-- 说明, 自动收矿石会发送你的帐号密码至WEBAPI以调用收取矿石, 如果觉得不安全的, 请不要使用
	AutoMine = true
}

-- ---------------------------------------------------------------
-- 强制移除所有装备, 装备上回内武器 -- 自定义模式 by particular role
-- ---------------------------------------------------------------
function Wield_RecoverWeapon()
	local cmd = "unwield taiji sword;unwield mu jian;wield kunlun sword;"
	exe(cmd)
end

return vingic
