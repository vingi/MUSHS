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

settings= {
    -- 是否自动向韦小宝买龙泉剑 (若设定为true, 则运行start后会先去买龙泉剑,该过程可能会很久,有可能几个小时才能买到, 买到后才会开始正常job)
    AutoBuy_Xiaobao_Longquan = false,

    -- 是否每天自动洪七公作菜10次
    Auto_hqgzc_10times = true,

    -- 是否 作任务之前 先double内力
    CheckNeili_InAdvance = false,

    -- 当打架无内力时(吃药在CD状态),执行的加内动作(无则可不填), 一些门派有恢复内力的内功, 如华山有yun zixia
    Recover_neili = "yun zixia",

    -- 是否作华山2任务
    HuashanJob_Step2 = true,

    -- 是否自动蝶梦楼刷分
    AutoDML = true,

    -- 是否自动论坛收矿石
    -- 说明, 自动收矿石会发送你的帐号密码至WEBAPI以调用收取矿石, 如果觉得不安全的, 请不要使用
    AutoMine = true,
}


function tt()
    print("call vingi method success")
end

return vingi 