--[[
    ���裬�����˻��ھ������2400��Ҫȥ����ҩ��Ҫ���裬��ȷ��wg_yjw����û�����û��߲�����1
    wg����������main�������Ƿ���뼴��ʼwg����1Ϊ��ʼ�������0Ϊ�������
]]

require "addxml"

wg_tj={
    action_num=0,
    jingli_per_job=0,
} --ͳ������


function wg_start()
    disAll()
    DeleteTriggerGroup("wg")
    wg_work=""
    job.name="wg"
    go(checkpoint,'���','��ݴ���')
end

function wg_ask()
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*����³�������йء�job������Ϣ��\\n(>)*\\s*³��˵�����������ݺ�æ����������Ʒ����ù���",
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
        match="^(>)*\\s*³��˵�������㲻���Ѿ����˹����𣿻�����ȥ������",
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
        match="^(>)*\\s*�⿲������(\\D*)��",
        name="wgaskwu",
        regexp="y",
        script="wg_gowork",
        sequence="100",
    }
    return check_halt(function() Execute("se;ask wu kan about ����") end)
end
function wg_gowork(n,l,w)
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*\\D+����˵�������ɵĲ�������",
        name="wgworkdone",
        regexp="y",
        script="wgworkdone",
        sequence="100",
    }
    wg_work=w[2]

    Execute('hp')--��ȡ�ɻ�ǰ��ʼhp
    wg_tj.action_num=1

    if  wg_work=="һ�ѳ�ͷ" then
        check_halt(function() Execute("wield chu tou;nw;wd;w;n;n;n;chu ��") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*������ͷ�����ŵ��ϵ��Ӳݳ���������",
            name="wg_gowork_chucao",
            regexp="y",
            script="wg_gowork_chucao",
            sequence="100",
        }
    elseif wg_work=="һ�Ѿ���" then
        check_halt(function() Execute("wield ju zi;nw;wd;w;s;s;w;ju ľͷ") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*�����һ��ľͷ����������������",
            name="wg_gowork_jumutou",
            regexp="y",
            script="wg_gowork_jumutou",
            sequence="100",
        }
    elseif wg_work=="һ��ư" then
        check_halt(function() Execute("wield piao;nw;wd;w;n;n;e;jiao ˮ") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*����ư�Ӹ���Ҩ��ˮ���ڲ˵��ｽ��ˮ����",
            name="wg_gowork_jiaoshui",
            regexp="y",
            script="wg_gowork_jiaoshui",
            sequence="100",
        }
    elseif wg_work=="һֻˮͰ" then
        check_halt(function() Execute("wield tong;nw;wd;w;s;s;e;tiao ˮ") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*��������ˮͰ�е�ˮ������Ȼ����ˮ���С�",
            name="wg_gowork_tiaoshui",
            regexp="y",
            script="wg_gowork_tiaoshui",
            sequence="100",
        }
    elseif wg_work=="һ��ɨ��" then
        check_halt(function() Execute("wield sao zhou;nw;wd;w;s;s;s;sao ��") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*�����˸��ط���ʼɨ���������湻���ģ��㲻�ɱս��˺�����",
            name="wg_gowork_saomafang",
            regexp="y",
            script="wg_gowork_saomafang",
            sequence="100",
        }
    elseif wg_work=="һ����" then
        check_halt(function() Execute("wield dao;nw;wd;w;n;n;w;pi ��") end)
        addxml.trigger {
            custom_colour="2",
            enabled="y",
            group="wg",
            match="^(>)*\\s*�����һ��ľͷ��һ��������ȥ�����ѡ���һ����ľͷ����Ϊ��Ƭ��",
            name="wg_gowork_pichai",
            regexp="y",
            script="wg_gowork_pichai",
            sequence="100",
        }
    end
end

function wg_gowork_saomafang()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('sao ��') end)
end
function wg_gowork_chucao()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('chu ��') end)
end
function wg_gowork_jiaoshui()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('jiao ˮ') end)
end
function wg_gowork_jumutou()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('ju ľͷ') end)
end
function wg_gowork_pichai()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('pi ��') end)
end
function wg_gowork_tiaoshui()
    wg_tj.action_num=wg_tj.action_num+1
    check_halt(function() Execute('tiao ˮ') end)
end

function wgworkdone()
    DeleteTriggerGroup("wg")
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*�㱻������",
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
        messageShow("����job:" .. wg_work .. " ����" .. wg_tj.action_num .. "�ζ������ķѾ�����" ..wg_tj.jingli_per_job,'','')
        if wg_work=="һ�ѳ�ͷ" then
            Execute("s;s;s;e;eu;se;give chu tou to wu kan;")
        elseif wg_work=="һ�Ѿ���" then
            Execute("e;n;n;e;eu;se;give ju zi to wu kan")
        elseif wg_work=="һ��ư" then
            Execute("w;s;s;e;eu;se;give piao to wu kan")
        elseif wg_work=="һֻˮͰ" then
            Execute("w;n;n;e;eu;se;give tong to wu kan")
        elseif wg_work=="һ��ɨ��" then
            Execute("n;n;n;e;eu;se;give sao zhou to wu kan")
        elseif wg_work=="һ����" then
            Execute("e;s;s;e;eu;se;give dao to wu kan")
        end
        check_halt(function() Execute('nw;task ok') end)
        end)
end

--�ָ��ߣ������Ǹɻ������ѧϰ

function wg_xuexi_lit()
    DeleteTriggerGroup('wg')
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*�����̫���ˣ����ʲôҲû��ѧ����|������ѧϰһ������Ҫ�ķ�����\\D+��ͭǮ�������ϴ�����Ǯ�����ˡ�|�������ĳ̶��Ѿ�������ʦ���ˡ�|Ҳ����ȱ��ʵս���飬���\\D*�Ļش������޷���ᡣ|��û����ô��Ǳ����ѧϰ��û�а취�ٳɳ��ˡ�",
        name="wgxuelitover",
        regexp="y",
        script="backto_checkpoint",
        sequence="100",
    }
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*�����˲�ԫ��ָ�����ƺ���Щ�ĵá�",
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
        match="^(>)*\\s*������\\D+��ָ�����ƺ���Щ�ĵá�",
        name="wgnopot",
        regexp="y",
        send="xue jiaotou force",
        sequence="100",
    }
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*�����̫���ˣ����ʲôҲû��ѧ����|Ҳ����ȱ��ʵս���飬���\\D*�Ļش������޷���ᡣ|��û����ô��Ǳ����ѧϰ��û�а취�ٳɳ��ˡ�",
        name="jiaotoutocheckpoint",
        regexp="y",
        script="jiaotoutocheckpoint",
        sequence="100",
    }
    return findjiaotou()
end

function findjiaotou()
    return go(findjiaotou_act,'���','���䳡')
end
function findjiaotou_act()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*��ݽ�ͷ\\((\\D*)\\)",
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
--             if score.gender=="��" then
--                 exe("s;w;w;wu")
--             else
--                 exe("n;w;w;wu")
--             end
--             checkpoint()
--         end,('end,'���','��ݴ���')
-- end
function jiaotoutocheckpoint()
    DeleteTriggerGroup('wg')
    go(checkpoint,'���','��ݴ���')
end

function wgsleep(func)
    Execute("ed;e;e")
    if score.gender=="��" then
        Execute("n;sleep")
    else
        Execute("s;sleep")
    end
    return check_halt(function()
                        if score.gender=="��" then
                            Execute("s;w;w;wu")
                        else
                            Execute("n;w;w;wu")
                        end
                        func()
                    end)
end

----------------------------------------------------------
--��ݳԺ�wg_chihe()������wg_ask()
----------------------------------------------------------
function wg_chihe()
    Execute('wd;w;w;ask wang about ʳ��;')
    return check_halt(wg_chihe_askwater)
end
function wg_chihe_askwater() 
    Execute('ask wang about ˮ')
    check_halt(
        function() 
            Execute ('get rice;get tea;eat rice;eat rice;eat rice;drink tea;drink tea;drink tea;drop rice;drop tea;e;e;eu')
            checkpoint()
        end)
end

function checkpoint()
    job.name="wg"--���裬��ֹ��ʳ
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
        elseif hp.exp>2000 and hp.jingli>50 then --��pot
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
        match="^(>)*\\s*����ɽ����һ�⡸�������项��|����ɽ˵�������㲻���Ѿ�����������ô����",
        name="ask_liguan",
        regexp="y",
        script="ask_liguan_sun",
        sequence="100",
    }
    SetVariable('wg','0')
    exe('enter;n;n;ask wan about ���')
end
-- |����ɽ˵�������㲻���Ѿ�����������ô����
function ask_liguan_sun()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*����ݸ���һ�������һ��������ͼ�ᡣ",
        name="ask_liguan_sun",
        regexp="y",
        send="ok",
        sequence="100",
    }
    exe('s;s;out;sd;s;s;ask sun about ���')
end
function ask_yujiwan()
    DeleteTriggerGroup("wg")
    EnableTrigger("fight16",false)
    exe('enter;n;e;e;ask qi about ����')
    check_halt(ask_yujiwan1)
end
function ask_yujiwan1()
    addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="wg",
        match="^(>)*\\s*ҩ�̻�Ƶݸ���һ�����衣",
        name="wgyujiwan",
        regexp="y",
        script="wgyujiwan",
        sequence="100",
    }
    exe('s;#11 e;s;s;e;e;n;ask huoji about ����')
    check_bei(ask_yujiwan2)
end
function ask_yujiwan2()
    go(checkpoint,'���','��ݴ���')
end
function wgyujiwan()
    SetVariable('wg_yjw','1')
end