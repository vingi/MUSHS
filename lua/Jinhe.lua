--
-- Jinhe.lua
--
-- ----------------------------------------------------------
-- �Զ��ڽ���
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

-- �������Ƿ����,�����ж��Ƿ���Ҫִ�н��г���
function Jinhe.Check()
    if Bag["����"] then
        return true
    else
        return false
    end
end

-- �㿴�˰��죬Ҳû����������ӵ�������ô���¡�
local function jinhe()
    local jinhetimes = 0
    exe('i')
    if Bag["����"] then
        messageShow('=====��ʼ�ڽ���=====')
        jinheTrigger()
        EnableTriggerGroup("jinheCheck", true)
        exe('look jinhe')
        -- return go(ask_cls,'�置','ҩ����')
    else
        return(Jinhe_over)
    end
end

local function jinheTrigger()
    DeleteTriggerGroup("jinheCheck")
    create_trigger_t('jinheCheck1', "^(> )*����Լ��", '', 'Jinhe_check')
    -- ���ݺὭ��ʱ���ڻƺ���������������Щ������
    -- ��������ѽ��
    -- ������һ��ʲôҲû���ҵ���
    -- ������������ó���
    -- ���ӵļв��Ѿ��򿪣��������ϸ�����ӣ�look jinhe��Ȼ���ȡ��Ӧ�ж���
    create_trigger_t('jinheCheck4', "^���ݺὭ��ʱ����(\\D*)����Щ������", '', 'Jinhe_consider')
    create_trigger_t('jinheCheck5', "^(> )*��Ҫ��ʲô", '', 'Jinhe_over')
    create_trigger_t('jinheCheck6', "^(> )*��������ѽ", '', 'redigDig')
    create_trigger_t('jinheCheck7', "^(> )*������һ��ʲôҲû���ҵ�", '', 'redigDig')
    create_trigger_t('jinheCheck8', "^(> )*������������ó���", '', 'jinhe')
    -- create_trigger_t('jinheCheck9',"^(> )*���ӵļв��Ѿ���",'','jinhe')

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
    messageShow('=====�ڽ������=====')
    check_busy(checkfood)
end