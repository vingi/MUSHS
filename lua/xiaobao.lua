--
-- xiaobao.lua
--
-- ----------------------------------------------------------
-- ��ΤС������������
-- ----------------------------------------------------------
--
--[[

eg.

require "xiaobao"
    xiaobao.buy()

--]]


xiaobao = { }

--------------------------------------------------------------------Ĭ�ϵı���-----------------------------------------------------------------------------------------
local askwcf = 1
local pokeweixiaobao = 1
-- local findweixiaobao = 1
---------------------------------------------------------------------��ģ��------------------------------------------------------------------------------------------------
-- ��������
function xiaobao.buy()
    -- askwcf=0
    -- findweixiaobao=0
    -- pokeweixiaobao=0
    EnableTriggerGroup("buyxiaobao", ture)
    EnableTriggerGroup("findxiaobao", ture)
    if hp.food > 70 and hp.water > 70 then
        return go(xiaobao.askwcf, '���ݳ�', '����Ժ')
    else
        exe('nick ȥ�Է�')
        return go(xiaobao.eat, '���ݳ�', '���')
    end
end

function xiaobao.eat()
    exe('drink;drink;drink;buy huasheng;get huasheng;get huasheng')
    wait.make( function()
        wait.time(3)
        exe('eat huasheng;eat huasheng;eat huasheng')
        wait.time(2)
        return go(xiaobao.askwcf, '���ݳ�', '����Ժ')
    end )
end

function xiaobao.askwcf()
    exe('ask chunfang about ΤС��')
    wait.make( function()
        wait.time(2)
        exe('nick ������')
    end )
    return xiaobao.fdxb()
end

function xiaobao.fdxb()
    DeleteTriggerGroup("findxiaobao")
    DeleteTriggerGroup("buyxiaobao")
    create_trigger_t('xiaobao_g2', "^(> )*Τ����˵��������λ\\D*��������˵�����ǹԶ�������(\\D*)�������ء���", '', 'xiaobao.goto_xiaobao')
    create_trigger_t('xiaobao_ghere', "^(> )*Τ����˵�������Ҷ��Ӿ�������ѽ...��", '', 'xiaobao.wxiaobao')
    create_trigger_t('xiaobao_b1', "^(> )*����ΤС���Ķ�������˵����111", '', 'xiaobao.bweapon')
    create_trigger_t('xiaobao_b2', "^(> )*��Ҫ��˭���", '', 'xiaobao.buy')
    create_trigger_t('xiaobao_b3', "^(> )*����\\D*�ļ۸��ΤС������������һ����Ȫ������Ǯֱ�Ӵ����д��۳���", '', 'xiaobao.stopbuy')

    SetTriggerOption("xiaobao_g2", "group", "findxiaobao")
    SetTriggerOption("xiaobao_ghere", "group", "findxiaobao")
    SetTriggerOption("xiaobao_b1", "group", "buyxiaobao")
    SetTriggerOption("xiaobao_b2", "group", "buyxiaobao")
    SetTriggerOption("xiaobao_b3", "group", "buyxiaobao")
end

local switch_xiaobaolocation = {
    ["����ǳ�����"] = function()
        -- for case 1
        go(xiaobao.bweapon, '�����', '������')
    end,
    ["���ݳǲ���ͤ"] = function()
        -- for case 2
        go(xiaobao.bweapon, '���ݳ�', '����ͤ')
    end,
    ["���ݳ��ھ�����"] = function()
        -- for case 3
        go(xiaobao.bweapon, '���ݳ�', '�ھ�����')
    end,
    ["����ɽ������"] = function()
        -- for case 3
        go(xiaobao.bweapon, '����ɽ', '������')
    end,
    ["�����Ǳ����ֽ�"] = function()
        -- for case 3
        go(xiaobao.bweapon, '������', '�����ֽ�')
    end,
    ["��ɽ������"] = function()
        -- for case 3
        go(xiaobao.bweapon, '��ɽ', '������')
    end,
    ["���ݳǺ����ջ"] = function()
        -- for case 3
        go(xiaobao.bweapon, '���ݳ�', '�����ջ')
    end,
    ["��ɽ��Ӣ�ۿ�ջ"] = function()
        -- for case 3
        go(xiaobao.bweapon, '��ɽ��', 'Ӣ�ۿ�ջ')
    end
}

function xiaobao.goto_xiaobao(n, l, w)
    local location_xiaobao = w[2]
    print("ΤС��λ��:" .. location_xiaobao);
    exe('nick ȥ' .. location_xiaobao .. '��С��')
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





