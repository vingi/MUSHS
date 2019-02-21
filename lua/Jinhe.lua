--
-- Jinhe.lua
--
-- ----------------------------------------------------------
-- 自动挖锦盒
--
-- ----------------------------------------------------------
--
--[[

eg.

require "gag"


--]]

Jinhe = { }

function Jinhe.Start()
    jinhe() 
end

-- 检查锦盒是否存在,用于判断是否需要执行锦盒程序
function Jinhe.Check()
    if Bag["锦盒"] then
        return true
    else
        return false
    end
end

-- 你看了半天，也没有明白这盒子到底是怎么回事。
local function jinhe()
    local jinhetimes = 0
    exe('i')
    if Bag["锦盒"] then
        messageShow('=====开始挖锦盒=====')
        jinheTrigger()
        EnableTriggerGroup("jinheCheck", true)
        exe('look jinhe')
        -- return go(ask_cls,'苗疆','药王居')
    else
        return(Jinhe_over)
    end
end

local function jinheTrigger()
    DeleteTriggerGroup("jinheCheck")
    create_trigger_t('jinheCheck1', "^(> )*你可以检查", '', 'Jinhe_check')
    -- 吾纵横江湖时曾在黄河流域侠义厅留下些许物事
    -- 你打算拆屋呀？
    -- 你挖了一阵，什么也没有找到。
    -- 你从铁盒子里拿出了
    -- 盒子的夹层已经打开，你可以仔细看盒子（look jinhe）然后采取相应行动。
    create_trigger_t('jinheCheck4', "^吾纵横江湖时曾在(\\D*)留下些许物事", '', 'Jinhe_consider')
    create_trigger_t('jinheCheck5', "^(> )*你要看什么", '', 'Jinhe_over')
    create_trigger_t('jinheCheck6', "^(> )*你打算拆屋呀", '', 'redigDig')
    create_trigger_t('jinheCheck7', "^(> )*你挖了一阵，什么也没有找到", '', 'redigDig')
    create_trigger_t('jinheCheck8', "^(> )*你从铁盒子里拿出了", '', 'jinhe')
    -- create_trigger_t('jinheCheck9',"^(> )*盒子的夹层已经打开",'','jinhe')

    SetTriggerOption("jinheCheck1", "group", "jinheCheck")
    SetTriggerOption("jinheCheck4", "group", "jinheCheck")
    SetTriggerOption("jinheCheck5", "group", "jinheCheck")
    SetTriggerOption("jinheCheck6", "group", "jinheCheck")
    SetTriggerOption("jinheCheck7", "group", "jinheCheck")
    SetTriggerOption("jinheCheck8", "group", "jinheCheck")
    -- SetTriggerOption("jinheCheck9","group","jinheCheck")
    EnableTriggerGroup("jinheCheck", false)
end

local function Jinhe_check()
    exe('jiancha jinhe;look jinhe')
end

-- huashan_where=function(n,l,w)
local function Jinhe_consider(n, l, w)
    job.where = tostring(w[1])
    job.room, job.area = getAddr(job.where)
    dest.room = job.room
    dest.area = job.area
    check_busy(goJinhe)
end

local function goJinhe()
    go(digDig, job.area, job.room)
end
	
local function digDig()
    exe('dig')
end
	
local function redigDig()
    jinhetimes = jinhetimes + 1
    if jinhetimes > 10 then
        return(Jinhe_over)
    else
        wait.make( function()
            wait.time(3)
            check_busy(digDig)
        end )
    end
end

local function Jinhe_over()
    EnableTriggerGroup("jinheCheck", false)
    DeleteTriggerGroup("jinheCheck")
    messageShow('=====挖锦盒完成=====')
    check_busy(checkfood)
end