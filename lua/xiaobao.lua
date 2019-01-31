--
-- xiaobao.lua
--
-- ----------------------------------------------------------
-- 从韦小宝处购买武器
-- ----------------------------------------------------------
--
--[[

eg.

require "xiaobao"
    xiaobao.buy()

--]]


xiaobao = { }

--------------------------------------------------------------------默认的变量-----------------------------------------------------------------------------------------
local askwcf = 1
local pokeweixiaobao = 1
-- local findweixiaobao = 1
---------------------------------------------------------------------主模块------------------------------------------------------------------------------------------------
-- 启动函数
function xiaobao.buy()
    -- askwcf=0
    -- findweixiaobao=0
    -- pokeweixiaobao=0
    EnableTriggerGroup("buyxiaobao", ture)
    EnableTriggerGroup("findxiaobao", ture)
    if hp.food > 70 and hp.water > 70 then
        return go(xiaobao.askwcf, '扬州城', '丽春院')
    else
        exe('nick 去吃饭')
        return go(xiaobao.eat, '扬州城', '茶馆')
    end
end

function xiaobao.eat()
    exe('drink;drink;drink;buy huasheng;get huasheng;get huasheng')
    wait.make( function()
        wait.time(3)
        exe('eat huasheng;eat huasheng;eat huasheng')
        wait.time(2)
        return go(xiaobao.askwcf, '扬州城', '丽春院')
    end )
end

function xiaobao.askwcf()
    exe('ask chunfang about 韦小宝')
    wait.make( function()
        wait.time(2)
        exe('nick 抢兵器')
    end )
    return xiaobao.fdxb()
end

function xiaobao.fdxb()
    DeleteTriggerGroup("findxiaobao")
    DeleteTriggerGroup("buyxiaobao")
    create_trigger_t('xiaobao_g2', "^(> )*韦春芳说道：「这位\\D*，不瞒您说，我那乖儿子正在(\\D*)卖兵器呢。」", '', 'xiaobao.goto_xiaobao')
    create_trigger_t('xiaobao_ghere', "^(> )*韦春芳说道：「我儿子就在这里呀...」", '', 'xiaobao.wxiaobao')
    create_trigger_t('xiaobao_b1', "^(> )*你在韦小宝的耳边悄声说道：111", '', 'xiaobao.bweapon')
    create_trigger_t('xiaobao_b2', "^(> )*你要对谁耳语？", '', 'xiaobao.buy')
    create_trigger_t('xiaobao_b3', "^(> )*你以\\D*的价格从韦小宝那里买下了一把龙泉剑，该钱直接从银行存款扣除。", '', 'xiaobao.stopbuy')

    SetTriggerOption("xiaobao_g2", "group", "findxiaobao")
    SetTriggerOption("xiaobao_ghere", "group", "findxiaobao")
    SetTriggerOption("xiaobao_b1", "group", "buyxiaobao")
    SetTriggerOption("xiaobao_b2", "group", "buyxiaobao")
    SetTriggerOption("xiaobao_b3", "group", "buyxiaobao")
end

local switch_xiaobaolocation = {
    ["大理城城中心"] = function()
        -- for case 1
        go(xiaobao.bweapon, '大理城', '城中心')
    end,
    ["苏州城沧浪亭"] = function()
        -- for case 2
        go(xiaobao.bweapon, '苏州城', '沧浪亭')
    end,
    ["福州城镖局正厅"] = function()
        -- for case 3
        go(xiaobao.bweapon, '福州城', '镖局正厅')
    end,
    ["峨嵋山清音阁"] = function()
        -- for case 3
        go(xiaobao.bweapon, '峨嵋山', '清音阁')
    end,
    ["襄阳城北丁字街"] = function()
        -- for case 3
        go(xiaobao.bweapon, '襄阳城', '北丁字街')
    end,
    ["恒山白云庵"] = function()
        -- for case 3
        go(xiaobao.bweapon, '恒山', '白云庵')
    end,
    ["杭州城鸿昌客栈"] = function()
        -- for case 3
        go(xiaobao.bweapon, '杭州城', '鸿昌客栈')
    end,
    ["佛山镇英雄客栈"] = function()
        -- for case 3
        go(xiaobao.bweapon, '佛山镇', '英雄客栈')
    end
}

function xiaobao.goto_xiaobao(n, l, w)
    local location_xiaobao = w[2]
    print("韦小宝位置:" .. location_xiaobao);
    exe('nick 去' .. location_xiaobao .. '找小宝')
    local switchxiaobao = switch_xiaobaolocation[location_xiaobao]
    if switchxiaobao then
        switchxiaobao()
    end
end

function xiaobao.bweapon()
    findweixiaobao = 1
    EnableTriggerGroup("buyxiaobao", false)
    exe('buy longquan')
    wait.make( function()
        wait.time(0.5)
        EnableTriggerGroup("buyxiaobao", ture)
        exe('whisper xiaobao 111')
    end )
end

function xiaobao.wxiaobao()
    --    findweixiaobao = 0
    exe('whisper xiaobao 111')
end

function xiaobao.stopbuy()
    --    findweixiaobao = 1
    pokeweixiaobao = 1
    askwcf = 1
    DeleteTriggerGroup("findxiaobao")
    DeleteTriggerGroup("buyxiaobao")
    return check_jobx()
end





