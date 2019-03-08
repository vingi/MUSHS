-----
-- gumu.lua
--
-- ----------------------------------------------------------
-- ��Ĺ������
-- ----------------------------------------------------------
--
--[[

eg.

--]]


function gmpfmException()
    DeleteTriggerGroup("gmpfmException")
    create_trigger_t('gmpfmException0', '^(> )*\\D(�������е���ϲ���|�Ʋ������������е�ȭ�ż������|�����ȷ�����Ŀǰװ������)', '', 'beibeinone')
    -- ����ȭ��

    create_trigger_t('gmpfmException1', '^(> )*��(�����޷�ʹ�á��������ס�����|�����޷�ʹ�á���Ȼ���꡹����|����������ô��ʹ�á���Ȼ���꡹|����������ô��ʹ�á��������ס�)', '', 'beiarz')
    -- ��Ȼ������

    create_trigger_t('gmpfmException2', '^(> )*��(û��ʹ����Ůȭ����Ϊ�м�|�ֳ����������ʹ�á����ġ�����)', '', 'beimnqf')
    -- ��Ůȭ��
    create_trigger_t('gmpfmException3', '^(> )*(�������޷�ʹ�á��������̡����й���|ֻ�п��ֲ���ʩչ���������̡�)', '', 'beitldw')
    -- ���޵���ʽ

    create_trigger_t('gmpfmException4', '^(> )*��(װ�����������ԣ��޷�ʩչ�����������֡�|�����޷�ʹ�á����������֡����й���|��ʹ�õ��мܲ���|�����޷�ʹ�á����������������Է�|���뽫��Ů���Ľ���Ϊ��Ľ���ʹ��)', '', 'beiysjl')
    -- ��������

    create_trigger_t('gmpfmException5', '^(> )*��(����ʹ����������ʹ�á�������ӿ��|�����޷�ʹ�á�������ӿ��|�����޽������ʹ�ĳ����������ľ���|�����޷�ʹ�á��޽�ʤ�н���)', '', 'beixtjf')
    -- ��������

    create_trigger_t('gmpfmException6', '^(> )*��(�����޷�ʹ�����Ǿ�����|�����޽�����ʹ��һ��������)', '', 'beiqzjf')
    -- ȫ�潣��

    create_trigger_t('gmpfmException7', '^(> )*��(û����Ů���Ľ���ôʹ������Ů���ġ�|�����޷�ʹ�á���Ů���ġ�)', '', 'beiynjf')
    -- ��Ů����
    for i = 0, 7 do
        SetTriggerOption("gmpfmException" .. i, "group", "gmpfmException")
    end
end

function gmpfmExceptionOn()
    gmpfmException()
    EnableTriggerGroup("gmpfmException", true)
    -- ColourNote ("red","blue","pfm�쳣��⿪��")
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