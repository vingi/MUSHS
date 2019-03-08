-----
-- gumu.lua
--
-- ----------------------------------------------------------
-- 古墓派自有
-- ----------------------------------------------------------
--
--[[

eg.

--]]


function gmpfmException()
    DeleteTriggerGroup("gmpfmException")
    create_trigger_t('gmpfmException0', '^(> )*\\D(与你现有的组合不符|掌不能用于你现有的拳脚技能组合|必须先放下你目前装备的武)', '', 'beibeinone')
    -- 基本拳脚

    create_trigger_t('gmpfmException1', '^(> )*你(现在无法使用「嫉世愤俗」绝技|现在无法使用「黯然销魂」绝技|拿着武器怎么能使用「黯然销魂」|拿着武器怎么能使用「嫉世愤俗」)', '', 'beiarz')
    -- 黯然销魂掌

    create_trigger_t('gmpfmException2', '^(> )*你(没有使用美女拳法作为招架|手持武器，如何使用「摄心」绝技)', '', 'beimnqf')
    -- 美女拳法
    create_trigger_t('gmpfmException3', '^(> )*(你现在无法使用「罗网清烟」进行攻击|只有空手才能施展「罗网清烟」)', '', 'beitldw')
    -- 天罗地网式

    create_trigger_t('gmpfmException4', '^(> )*你(装备的武器不对，无法施展「三无三不手」|现在无法使用「三无三不手」进行攻击|所使用的招架不对|现在无法使用「乐音绝技」攻击对方|必须将玉女素心剑作为你的剑法使用)', '', 'beiysjl')
    -- 银锁金铃

    create_trigger_t('gmpfmException5', '^(> )*你(必须使用武器才能使用「海潮汹涌」|现在无法使用「海潮汹涌」|手中无剑，如何使的出玄铁剑法的绝技|现在无法使用「无剑胜有剑」)', '', 'beixtjf')
    -- 玄铁剑法

    create_trigger_t('gmpfmException6', '^(> )*你(现在无法使用七星绝命剑|手中无剑怎能使用一剑化三清)', '', 'beiqzjf')
    -- 全真剑法

    create_trigger_t('gmpfmException7', '^(> )*你(没用玉女素心剑怎么使出「玉女素心」|现在无法使用「玉女素心」)', '', 'beiynjf')
    -- 玉女剑法
    for i = 0, 7 do
        SetTriggerOption("gmpfmException" .. i, "group", "gmpfmException")
    end
end

function gmpfmExceptionOn()
    gmpfmException()
    EnableTriggerGroup("gmpfmException", true)
    -- ColourNote ("red","blue","pfm异常检测开启")
end

function beibeinone()
    exe('bei none;jifa cuff meinu-quanfa;unwield bian;unwield jian')
end

function beiarz()
    exe('unwield whip;unwield jian;unwield sword;bei none;jifa parry anran-zhang;jifa strike anran-zhang;bei strike')
end

function beimnqf()
    exe('unwield whip;unwield jian;unwield sword;bei none;jifa parry meinu-quanfa;jifa cuff meinu-quanfa;bei cuff')
end

function beitldw()
    exe('unwield whip;unwield jian;unwield sword;bei none;jifa parry tianluo-diwang;jifa hand tianluo-diwang;bei hand')
end

function beiysjl()
    exe('unwield jian;unwield sword;wield bian;bei none;jifa parry yinsuo-jinling;jifa cuff meinu-quanfa;bei cuff;jifa whip yinsuo-jinling;jifa sword yunu-jianfa')
end

function beixtjf()
    exe('unwield whip;wield jian;jifa parry xuantie-jianfa;jifa sword xuantie-jianfa')
end

function beiqzjf()
    exe('unwield whip;wield jian;jifa parry quanzhen-jianfa;jifa sword quanzhen-jianfa')
end

function beiynjf()
    exe('unwield whip;wield jian;jifa sword yunu-jianfa')
end

function gmpfmExceptionClose()
    DeleteTriggerGroup("gmpfmException")
end