--[[
    玉肌丸，机器人会在经验大于2400，要去扬州药店要玉肌丸，请确保wg_yjw变量没有设置或者不等于1
    wg变量，控制main函数中是否进入即开始wg任务，1为开始武馆任务，0为忽略武馆
]]

require "addxml"

wg_tj={
    action_num=0,
    jingli_per_job=0,
} --统计数据


function wg_start()
    disAll()
    DeleteTriggerGroup("wg")
    wg_work=""
    job.name="wg"
    go(checkpoint,'武馆','武馆大厅')
end

function wg_ask()
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你向鲁坤打听有关『job』的消息。\\n(>)*\\s*鲁坤说道：「最近武馆很忙，你先在物品房领好工具",
        name="wgasklu",
        multi_line="y",
        lines_to_match="2",
        -- one_shot="y",
        regexp="y",
        script="wgaskwu",
        sequence="100",
    }
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*鲁坤说道：「你不是已经领了工作吗？还不快去做。」",
        name="wgasklu1",
        regexp="y",
        script="wgaskwu",
        sequence="100",
    }
    Execute("ask lu about job")
end
function wgaskwu()
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*吴坎交给你(\\D*)。",
        name="wgaskwu",
        regexp="y",
        script="wg_gowork",
        sequence="100",
    }
    return check_halt(function() Execute("se;ask wu kan about 工具") end)
end
function wg_gowork(n,l,w)
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*\\D+管事说道：「干的不错，好了",
        name="wgworkdone",
        regexp="y",
        script="wgworkdone",
        sequence="100",
    }
    wg_work=w[2]

    Execute('hp')--获取干活前初始hp
    wg_tj.action_num=1

    if  wg_work=="一把锄头" then
        check_halt(function() Execute("wield chu tou;nw;wd;w;n;n;n;chu 草") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你挥起锄头，对着地上的杂草锄了起来。",
            name="wg_gowork_chucao",
            regexp="y",
            script="wg_gowork_chucao",
            sequence="100",
        }
    elseif wg_work=="一把锯子" then
        check_halt(function() Execute("wield ju zi;nw;wd;w;s;s;w;ju 木头") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你摆正一根木头，慢慢锯了起来。",
            name="wg_gowork_jumutou",
            regexp="y",
            script="wg_gowork_jumutou",
            sequence="100",
        }
    elseif wg_work=="一把瓢" then
        check_halt(function() Execute("wield piao;nw;wd;w;n;n;e;jiao 水") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你用瓢从缸里舀起水，在菜地里浇起水来。",
            name="wg_gowork_jiaoshui",
            regexp="y",
            script="wg_gowork_jiaoshui",
            sequence="100",
        }
    elseif wg_work=="一只水桶" then
        check_halt(function() Execute("wield tong;nw;wd;w;s;s;e;tiao 水") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你慢慢将水桶中的水蓄满，然后倒入水缸中。",
            name="wg_gowork_tiaoshui",
            regexp="y",
            script="wg_gowork_tiaoshui",
            sequence="100",
        }
    elseif wg_work=="一把扫帚" then
        check_halt(function() Execute("wield sao zhou;nw;wd;w;s;s;s;sao 马房") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你找了个地方开始扫了起来，真够臭的，你不由闭紧了呼吸。",
            name="wg_gowork_saomafang",
            regexp="y",
            script="wg_gowork_saomafang",
            sequence="100",
        }
    elseif wg_work=="一柄柴刀" then
        check_halt(function() Execute("wield dao;nw;wd;w;n;n;w;pi 柴") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*你摆正一块木头，一刀劈了下去，“哐”的一声，木头被劈为两片。",
            name="wg_gowork_pichai",
            regexp="y",
            script="wg_gowork_pichai",
            sequence="100",
        }
    end
end

function wg_gowork_saomafang()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('sao 马房') end)
end
function wg_gowork_chucao()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('chu 草') end)
end
function wg_gowork_jiaoshui()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('jiao 水') end)
end
function wg_gowork_jumutou()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('ju 木头') end)
end
function wg_gowork_pichai()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('pi 柴') end)
end
function wg_gowork_tiaoshui()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('tiao 水') end)
end

function wgworkdone()
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你被奖励了",
        name="wgtaskok",
        regexp="y",
        script="checkpoint",
        sequence="100",
    }
    local tmp_jingli=hp.jingli
    Execute('hp')
    wait.make(function() 
        wait.time(0.2)
        wg_tj.jingli_per_job=tmp_jingli-hp.jingli
        messageShow("本次job:" .. wg_work .. " 做了" .. wg_tj.action_num .. "次动作，耗费精力：" ..wg_tj.jingli_per_job,'','')
        if wg_work=="一把锄头" then
            Execute("s;s;s;e;eu;se;give chu tou to wu kan;")
        elseif wg_work=="一把锯子" then
            Execute("e;n;n;e;eu;se;give ju zi to wu kan")
        elseif wg_work=="一把瓢" then
            Execute("w;s;s;e;eu;se;give piao to wu kan")
        elseif wg_work=="一只水桶" then
            Execute("w;n;n;e;eu;se;give tong to wu kan")
        elseif wg_work=="一把扫帚" then
            Execute("n;n;n;e;eu;se;give sao zhou to wu kan")
        elseif wg_work=="一柄柴刀" then
            Execute("e;s;s;e;eu;se;give dao to wu kan")
        end
        check_halt(function() Execute('nw;task ok') end)
        end)
end

--分割线，上面是干活，下面是学习

function wg_xuexi_lit()
    DeleteTriggerGroup('wg')
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你今天太累了，结果什么也没有学到。|你现在学习一次所需要的费用是\\D+文铜钱，你身上带的零钱不够了。|这项技能你的程度已经不输你师父了。|也许是缺乏实战经验，你对\\D*的回答总是无法领会。|你没有这么多潜能来学习，没有办法再成长了。",
        name="wgxuelitover",
        regexp="y",
        script="backto_checkpoint",
        sequence="100",
    }
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你听了卜垣的指导，似乎有些心得。",
        name="wgxuelit",
        regexp="y",
        send="xue bo literate",
        sequence="100",
    }
    Execute('ed;e;n')
    Execute('xue bo literate')
end

function backto_checkpoint()
    DeleteTriggerGroup('wg')
    Execute('s;w;wu')
    return checkpoint()
end

function wg_xuexi_force()
    DeleteTriggerGroup('wg')
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你听了\\D+的指导，似乎有些心得。",
        name="wgnopot",
        regexp="y",
        send="xue jiaotou force",
        sequence="100",
    }
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*你今天太累了，结果什么也没有学到。|也许是缺乏实战经验，你对\\D*的回答总是无法领会。|你没有这么多潜能来学习，没有办法再成长了。",
        name="jiaotoutocheckpoint",
        regexp="y",
        script="jiaotoutocheckpoint",
        sequence="100",
    }
    return findjiaotou()
end

function findjiaotou()
    return go(findjiaotou_act,'武馆','东武场')
end
function findjiaotou_act()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*武馆教头\\((\\D*)\\)",
        name="findjiaotou",
        regexp="y",
        script="jiaotoufound",
        sequence="100",
    }
    flag.times=1
    exe('look')
    find()
end
function jiaotoufound()
    dis_all()
    EnableTriggerGroup('wg')
    exe('follow jiaotou;xue jiaotou force')
end

-- function jiaotoutosleep()
--     go(function ()  
--             if score.gender=="男" then
--                 exe("s;w;w;wu")
--             else
--                 exe("n;w;w;wu")
--             end
--             checkpoint()
--         end,('end,'武馆','武馆大厅')
-- end
function jiaotoutocheckpoint()
    DeleteTriggerGroup('wg')
    go(checkpoint,'武馆','武馆大厅')
end

function wgsleep(func)
    Execute("ed;e;e")
    if score.gender=="男" then
        Execute("n;sleep")
    else
        Execute("s;sleep")
    end
    return check_halt(function()
                        if score.gender=="男" then
                            Execute("s;w;w;wu")
                        else
                            Execute("n;w;w;wu")
                        end
                        func()
                    end)
end

----------------------------------------------------------
--武馆吃喝wg_chihe()，返回wg_ask()
----------------------------------------------------------
function wg_chihe()
    Execute('wd;w;w;ask wang about 食物;')
    return check_halt(wg_chihe_askwater)
end
function wg_chihe_askwater() 
    Execute('ask wang about 水')
    check_halt(
        function() 
            Execute ('get rice;get tea;eat rice;eat rice;eat rice;drink tea;drink tea;drink tea;drop rice;drop tea;e;e;eu')
            checkpoint()
        end)
end

function checkpoint()
    job.name="wg"--玉肌丸，防止误食
    checkBags()
    Execute('hp;cha;score;i')
    wait.make(function() 
        wait.time(1)
        checkpoint_check()
        end)
end

function checkpoint_check()
    DeleteTriggerGroup("wg")
    if hp.exp<3000 then
        if hp.food<60 or hp.water<60 then
            return wg_chihe()
        elseif hp.exp>2400 and (GetVariable('wg_yjw')==nil or GetVariable('wg_yjw')~='1') then
            return ask_yujiwan()
        elseif hp.exp>2000 and hp.jingli>50 then --攒pot
            return wg_ask()
        elseif hp.jingxue>50 and isInBags('silver') and hp.pot>10 and (skills['literate']==nil or (skills['literate'].lvl<hp.pot_max-100 and skills['literate'].lvl<30)) then
            return wg_xuexi_lit()
        elseif hp.jingxue>50 and hp.pot>10 and (skills['force']==nil or (skills['force'].lvl<hp.pot_max-100 and skills['force'].lvl<=32)) then
            return wg_xuexi_force()
        elseif hp.jingli<50 or hp.jingxue<50 then
            return wgsleep(checkpoint)
        else
            return wg_ask()
        end
    end
    if hp.exp>3000 then
        return ask_liguan()
    end
end

function ask_liguan()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*万震山给你一封「付韩兄书」。|万震山说道：「你不是已经来打听过了么？」",
        name="ask_liguan",
        regexp="y",
        script="ask_liguan_sun",
        sequence="100",
    }
    SetVariable('wg','0')
    exe('enter;n;n;ask wan about 离馆')
end
-- |万震山说道：「你不是已经来打听过了么？」
function ask_liguan_sun()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*孙均递给你一颗玉肌丸和一本襄阳地图册。",
        name="ask_liguan_sun",
        regexp="y",
        send="ok",
        sequence="100",
    }
    exe('s;s;out;sd;s;s;ask sun about 离馆')
end
function ask_yujiwan()
    DeleteTriggerGroup("wg")
    EnableTrigger("fight16",false)
    exe('enter;n;e;e;ask qi about 狄云')
    check_halt(ask_yujiwan1)
end
function ask_yujiwan1()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*药铺伙计递给你一颗玉肌丸。",
        name="wgyujiwan",
        regexp="y",
        script="wgyujiwan",
        sequence="100",
    }
    exe('s;#11 e;s;s;e;e;n;ask huoji about 玉肌丸')
    check_bei(ask_yujiwan2)
end
function ask_yujiwan2()
    go(checkpoint,'武馆','武馆大厅')
end
function wgyujiwan()
    SetVariable('wg_yjw','1')
end