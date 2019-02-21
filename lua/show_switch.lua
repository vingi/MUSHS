require "movewindow"  -- load the movewindow.lua module


function button_smyteam()
    win2 = "show_message_btn2"
    WindowCreate(win2, 0, 0, 140, 280, 6, 16, ColourNameToRGB("black"))
    -- movewindow.add_drag_handler (win2, 0, 0,140,20)
    local _mousedown_smy = mousedown_smy()
    _G["at_mousedown_smy"] = _mousedown_smy
    WindowAddHotspot(win2, "btn_smyteam",
    0, 0, 140, 20,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_smy",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键增加，右键减少",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_smy2 = mousedown_smy2()
    _G["at_mousedown_smy2"] = _mousedown_smy2
    WindowAddHotspot(win2, "btn_smyteam2",
    0, 20, 140, 40,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_smy2",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键增加，右键减少",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown = mousedown()
    _G["at_mousedown"] = _mousedown
    WindowAddHotspot(win2, "btn_wdj",
    0, 40, 140, 60,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags

    local _mousedown_ll = mousedown_ll()
    _G["at_mousedown_ll"] = _mousedown_ll
    WindowAddHotspot(win2, "btn_ll",
    0, 60, 140, 80,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_ll",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_kdummy = mousedown_kdummy()
    _G["at_mousedown_kdummy"] = _mousedown_kdummy
    WindowAddHotspot(win2, "btn_kdummy",
    0, 80, 140, 100,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_kdummy",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_ypt_lian = mousedown_ypt_lian()
    _G["at_mousedown_ypt_lian"] = _mousedown_ypt_lian
    WindowAddHotspot(win2, "btn_ypt_lian",
    0, 100, 140, 120,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_ypt_lian",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_taoyuan = mousedown_taoyuan()
    _G["at_mousedown_taoyuan"] = _mousedown_taoyuan
    WindowAddHotspot(win2, "btn_taoyuan",
    0, 120, 140, 140,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_taoyuan",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_waitkill = mousedown_waitkill()
    _G["at_mousedown_waitkill"] = _mousedown_waitkill
    WindowAddHotspot(win2, "btn_waitkill",
    0, 140, 140, 160,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_waitkill",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_dohs = mousedown_dohs()
    _G["at_mousedown_dohs"] = _mousedown_dohs
    WindowAddHotspot(win2, "btn_dohs",
    0, 160, 140, 180,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_dohs",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_go_on_smy = mousedown_go_on_smy()
    _G["at_mousedown_go_on_smy"] = _mousedown_go_on_smy
    WindowAddHotspot(win2, "btn_go_on_smy",
    0, 200, 140, 220,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_go_on_smy",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags
    local _mousedown_ebook = mousedown_ebook()
    _G["at_mousedown_ebook"] = _mousedown_ebook
    WindowAddHotspot(win2, "btn_ebook",
    0, 220, 140, 240,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_ebook",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键点击开关",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags


    local switch_name = ""

    switch_name = "颂摩崖战斗" .. smyteam .. "组"

    switch_name2 = "颂摩崖可死" .. smyall .. "次"

    if inwdj == 1 then
        switch_name3 = "五毒教地图--开"
    else
        switch_name3 = "五毒教地图--关"
    end
    if needdolost == 1 then
        switch_name4 = "失落的信笺--开"
    else
        switch_name4 = "失落的信笺--关"
    end
    if kdummy == 1 then
        switch_name5 = "杀大米功能--开"
    else
        switch_name5 = "杀大米功能--关"
    end
    if ypt_lianskills == 1 then
        switch_name6 = "颂摩崖练功--开"
    else
        switch_name6 = "颂摩崖练功--关"
    end
    if intaoyuan == 1 then
        switch_name7 = "桃园县地图--开"
    else
        switch_name7 = "桃园县地图--关"
    end
    if wait_kill == 'no' then
        switch_name8 = "送信等杀手--关"
    else
        switch_name8 = "送信等杀手--开"
    end
    if dohs2 == 0 then
        switch_name9 = "华山任务②--关"
    else
        switch_name9 = "华山任务②--开"
    end
    if go_on_smy == 1 then
        switch_name11 = "重启后颂摩崖-开"
    else
        switch_name11 = "重启后颂摩崖-关"
    end
    if doubleexp == 1 then
        switch_name12 = "颂摩崖双倍经验开启"
    else
        switch_name12 = "颂摩崖双倍经验关闭"
    end


    WindowFont(win2, "f", "新宋体", 10, true, false, false, false)

    WindowText(win2, "f", switch_name, 0, 0, 140, 20, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name2, 0, 20, 140, 40, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name3, 0, 40, 140, 60, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name4, 0, 60, 140, 80, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name5, 0, 80, 140, 100, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name6, 0, 100, 140, 120, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name7, 0, 120, 140, 140, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name8, 0, 140, 140, 160, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name9, 0, 160, 140, 180, ColourNameToRGB("gold"), false)
    -- not Unicode

--    WindowText(win2, "f", switch_name10, 0, 180, 140, 200, ColourNameToRGB("gold"), false)  -- 原 任务检查内力 开关
    -- not Unicode

    WindowText(win2, "f", switch_name11, 0, 180, 140, 200, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowText(win2, "f", switch_name12, 0, 200, 140, 220, ColourNameToRGB("gold"), false)
    -- not Unicode


    WindowShow(win2, true)
    -- show it


end
function mousedown_smy2()
    return function(flags, hotspot_id)


        if hotspot_id == 'btn_smyteam2' then

            if flags == 16 then

                smyall = smyall + 1
                switch_name2 = "颂摩崖可死" .. smyall .. "次"

            end
            if flags == 32 then
                if smyall >= 1 then
                    smyall = smyall - 1
                end
                switch_name2 = "颂摩崖可死" .. smyall .. "次"
            end
            -- text add

            WindowRectOp(win2, miniwin.rect_fill, 0, 20, 140, 40, ColourNameToRGB("black"))
            -- raised, filled, softer, flat 0x909090
            WindowFont(win2, "f", "宋体", 10, true, false, false, false)
            WindowText(win2, "f", switch_name2, 0, 20, 140, 40, ColourNameToRGB("gold"), false)
            -- not Unicode
            WindowShow(win2, true)
            -- show it
        end

    end
end

function mousedown_smy()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        -- 颂摩崖
        if hotspot_id == 'btn_smyteam' then

            if flags == 16 then

                smyteam = smyteam + 1
                switch_name = "颂摩崖战斗" .. smyteam .. "组"

            end
            if flags == 32 then
                if smyteam > 4 then
                    smyteam = smyteam - 1
                end
                switch_name = "颂摩崖战斗" .. smyteam .. "组"
            end
            -- text add

            -- WindowCircleOp (win, miniwin.circle_round_rectangle , 0, 0, 120, 20, 0x909090, 0, 1,0, 0, 9, 9)
            WindowRectOp(win2, miniwin.rect_fill, 0, 0, 140, 20, ColourNameToRGB("black"))
            -- raised, filled, softer, flat 0x909090
            WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
            WindowText(win2, "f", switch_name, 0, 0, 140, 20, ColourNameToRGB("gold"), false)
            -- not Unicode
            WindowShow(win2, true)
            -- show it
        end
    end
end

function mousedown()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)
        -- 五毒教
        if hotspot_id == 'btn_wdj' then
            if inwdj == 1 then
                inwdj = 0
            else
                inwdj = 1
            end
            if flags == 16 then

                if inwdj == 1 then

                    switch_name3 = "五毒教地图--开"
                    Note('去五毒教！')
                else

                    switch_name3 = "五毒教地图--关"
                    Note('不去五毒教！')
                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 40, 140, 60, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name3, 0, 40, 140, 60, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_ll()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_ll' then
            if needdolost == 1 then
                needdolost = 0
                print('关闭做LL')
            else
                condition.vpearl = 0
                wait_kill = 'yes'
                exe('cond;jobtimes')
                dolostletter()
            end
            if flags == 16 then

                if needdolost == 1 then

                    switch_name4 = "失落的信笺--开"

                else

                    switch_name4 = "失落的信笺--关"

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 60, 140, 80, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name4, 0, 60, 140, 80, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end

function mousedown_kdummy()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_kdummy' then
            if kdummy == 1 then
                kdummy = 0
                closedummy()
            else
                kdummy = 1
                opendummy()
            end
            if flags == 16 then

                if kdummy == 1 then

                    switch_name5 = "杀大米功能--开"

                else

                    switch_name5 = "杀大米功能--关"

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 80, 140, 100, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name5, 0, 80, 140, 100, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_waitkill()
    return function(flags, hotspot_id)

        if hotspot_id == 'btn_waitkill' then
            if wait_kill == 'no' then
                wait_kill = 'yes'
            else
                wait_kill = 'no'
            end
            if flags == 16 then

                if wait_kill == 'yes' then

                    switch_name8 = "送信等杀手--开"

                else

                    switch_name8 = "送信等杀手--关"

                end

                WindowRectOp(win2, miniwin.rect_fill, 0, 140, 140, 160, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name8, 0, 140, 140, 160, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_dohs()
    return function(flags, hotspot_id)

        if hotspot_id == 'btn_dohs' then
            if dohs2 == 0 then
                dohs2 = 1
            else
                dohs2 = 0
            end
            if flags == 16 then

                if dohs2 == 1 then

                    switch_name9 = "华山任务②--开"


                else

                    switch_name9 = "华山任务②--关"


                end

                WindowRectOp(win2, miniwin.rect_fill, 0, 160, 140, 180, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name9, 0, 160, 140, 180, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_ypt_lian()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_ypt_lian' then
            if ypt_lianskills == 1 then
                ypt_lianskills = 0
            else
                ypt_lianskills = 1
            end
            if flags == 16 then

                if ypt_lianskills == 1 then

                    switch_name6 = "颂摩崖练功--开"

                else

                    switch_name6 = "颂摩崖练功--关"

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 100, 140, 120, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name6, 0, 100, 140, 120, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_taoyuan()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_taoyuan' then
            if intaoyuan == 1 then
                intaoyuan = 0
                map.rooms["dali/yideng/pubu"].ways["#yuRen"] = nil
                -- 桃园县地图加入开关
            else
                intaoyuan = 1
                map.rooms["dali/yideng/pubu"].ways["#yuRen"] = "dali/yideng/shandong"
                -- 桃园县地图加入开关
            end
            if flags == 16 then

                if intaoyuan == 1 then

                    switch_name7 = "桃园县地图--开"

                else

                    switch_name7 = "桃源县地图--关"

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 120, 140, 140, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name7, 0, 120, 140, 140, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_ebook()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_ebook' then
            if doubleexp == 1 then
                doubleexp = 0
            else
                doubleexp = 1
            end
            if flags == 16 then

                if doubleexp == 1 then

                    switch_name12 = "颂摩崖双倍经验开启"
                    Note("开启双倍经验")

                else

                    switch_name12 = "颂摩崖双倍经验关闭"
                    Note("关闭双倍经验")

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 220, 140, 240, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name12, 0, 220, 140, 240, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end
function mousedown_go_on_smy()
    -- 20161117增加变量go_on_smy开关控制 防止系统重启后自动打开颂摩崖
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        if hotspot_id == 'btn_go_on_smy' then
            if go_on_smy == 1 then
                go_on_smy = 0
            else
                go_on_smy = 1

            end
            if flags == 16 then

                if go_on_smy == 1 then

                    switch_name11 = "重启后颂摩崖-开"

                else

                    switch_name11 = "重启后颂摩崖-关"

                end
                -- text add

                WindowRectOp(win2, miniwin.rect_fill, 0, 200, 140, 220, ColourNameToRGB("black"))
                -- raised, filled, softer, flat 0x909090
                WindowFont(win2, "f", "新宋体", 10, true, false, false, false)
                WindowText(win2, "f", switch_name11, 0, 200, 140, 220, ColourNameToRGB("gold"), false)
                -- not Unicode
                WindowShow(win2, true)
                -- show it
            end
        end
    end
end

function button_lostletter()

    win3 = "show_message_btn3"
    WindowCreate(win3, 0, 0, 300, 20, 7, 16, ColourNameToRGB("black"))

    local _mousedown_lostletter = mousedown_lostletter()
    _G["at_mousedown_lostletter"] = _mousedown_lostletter
    WindowAddHotspot(win3, "btn_lostletter",
    0, 0, 300, 20,
    -- rectangle
    "",
    -- MouseOver
    "",
    -- CancelMouseOver
    "at_mousedown_lostletter",
    -- MouseDown
    "",
    -- CancelMouseDown
    "",
    -- MouseUp
    "左键看信，右键去地点",
    -- tooltip text
    cursor or 1,
    -- cursor
    0)
    -- flags

    local switch_name = ""

    switch_name = "失落的信笺地点：" .. lostletter_locate


    WindowFont(win3, "f", "新宋体", 10, true, false, false, false)

    WindowText(win3, "f", switch_name, 0, 0, 300, 20, ColourNameToRGB("gold"), false)
    -- not Unicode

    WindowShow(win3, true)
    -- show it


end
function mousedown_lostletter()
    return function(flags, hotspot_id)
        -- print("hotspot_id="..hotspot_id)
        -- print("flags="..flags)

        -- 颂摩崖
        local wherell = ""
        if hotspot_id == 'btn_lostletter' then

            if flags == 16 then

                exe('look lose letter')


            end
            if flags == 32 then

                return goll()
            end
            if flags == 96 then
                return goll_always()
            end
            -- text add

            -- WindowCircleOp (win, miniwin.circle_round_rectangle , 0, 0, 120, 20, 0x909090, 0, 1,0, 0, 9, 9)
            WindowRectOp(win3, miniwin.rect_fill, 0, 0, 300, 20, ColourNameToRGB("black"))
            -- raised, filled, softer, flat 0x909090
            WindowFont(win3, "f", "新宋体", 10, true, false, false, false)
            WindowText(win3, "f", "失落的信笺地点：" .. lostletter_locate, 0, 0, 300, 20, ColourNameToRGB("gold"), false)
            -- not Unicode
            WindowShow(win3, true)
            -- show it
        end
    end
end
get_lost_locate = function(n, l, w)
    lostletter_locate = Trim(w[1])
    lostletter_locate = addrTrim(lostletter_locate)
    ll.room, ll.area = getAddr(lostletter_locate)

    -- 立即刷新地点
    WindowRectOp(win3, miniwin.rect_fill, 0, 0, 300, 20, ColourNameToRGB("black"))
    -- raised, filled, softer, flat 0x909090
    WindowFont(win3, "f", "新宋体", 10, true, false, false, false)
    WindowText(win3, "f", "失落的信笺地点：" .. lostletter_locate, 0, 0, 300, 20, ColourNameToRGB("gold"), false)
    -- not Unicode
    WindowShow(win3, true)
    -- show it

end
function goll()
    if not getAddr(lostletter_locate) then
        ColourNote("gold", "black", "房间无法到达，请重新看信!")
        return
    else
        messageShow('失落的信笺任务：前往【' .. lostletter_locate .. '】开始寻找玩家！')

        dest.rooms = getRooms(ll.room, ll.area)
        -- 获取玩家所在地的房间

        if table.getn(dest.rooms) == 0 then

            ColourNote("gold", "black", "房间无法到达，请重新看信!")

            return
            -- 获取玩家所在地房间出错，重新看信

        end


        if string.find(jiangnan_area, ll.area) then
            return goto('长江北岸')
        end
        if string.find(cjn_area, ll.room) then
            return goto('长江北岸')
        end
        if string.find(ll.area, '神龙岛') then
            return goto('黄河入海口')
        end
        if string.find(ll.area, '明教') or string.find(ll.area, '回疆') or string.find(ll.area, '天山') or string.find(ll.area, '伊犁') or string.find(ll.area, '大草原') or string.find(ll.area, '星宿') or string.find(ll.area, '昆仑') then
            return goto('兰州大渡口')
        end
        if string.find(ll.area, '塘沽') or string.find(ll.area, '沧州') then
            return goto('黄河流域大渡口')
        end
        if string.find(ll.area, '恒山') or string.find(ll.area, '黑木崖') or string.find(ll.area, '平定州') then
            return goto('陕晋渡口')
        end
        if string.find(ll.area, '桃源县') then
            return goto('桃源县茅屋')
        end
        if string.find(ll.area, '绝情谷') then
            return goto('绝情谷小溪边')
        end
        if string.find(ll.area, '兰州城') then
            return goto(lostletter_locate)
        end
        if string.find(zhongyuan_area, ll.area) then
            return goto(lostletter_locate)
        end
    end
end	

function goll_always()
    if not getAddr(lostletter_locate) then
        ColourNote("gold", "black", "房间无法到达，请重新看信!")
        return
    else
        messageShow('失落的信笺任务：开始前往【' .. lostletter_locate .. '】寻找玩家！')

        dest.rooms = getRooms(ll.room, ll.area)
        -- 获取玩家所在地的房间

        if table.getn(dest.rooms) == 0 then

            ColourNote("gold", "black", "房间无法到达，请重新看信!")

            return
            -- 获取玩家所在地房间出错，重新看信

        end


        return goto(lostletter_locate)


    end
end	
				
----------miniwindows 模块------------
FONT_NAME1 = "宋体"
FONT_NAME2 = "Webdings"
FONT_NAME3 = "Lucida Console"
FONT_SIZE_11 = 11
FONT_SIZE_12 = 9
EDGE_WIDTH = 3
WINDOW_POSITION = 8
WINDOW_BACKGROUND_COLOUR = ColourNameToRGB("white")
BOX_COLOUR = ColourNameToRGB("royalblue") -- Box boarder's colour
WINDOW_TEXT_COLOUR = ColourNameToRGB("black")
TEXT_INSET = 5
win_skills = "skills" .. GetPluginID()
windowinfo_skills = movewindow.install(win_skills, miniwin.pos_top_cente, 0)
win_skills_show = 1
flag_win_skills = 1
win_bag = "bag" .. GetPluginID()
windowinfo_bag = movewindow.install(win_bag, miniwin.pos_top_cente, 0)
win_bag_show = 1
flag_win_bag = 1
win_beinang = "beinang" .. GetPluginID()
windowinfo_beinang = movewindow.install(win_beinang, miniwin.pos_bottom_right, 0)
win_beinang_show = 1
flag_win_beinang = 1
 

function mouseup(flags, hotspotid)
    --  print(hotspotid)
    if hotspotid and hotspotid == 'skills' then
        win_skills_show = 1 - win_skills_show
        draw_skillswindow()
    end
    if hotspotid and hotspotid == 'bag' then
        win_bag_show = 1 - win_bag_show
        draw_bagwindow()
    end
    if hotspotid and hotspotid == 'beinang' then
        win_beinang_show = 1 - win_beinang_show
        draw_beinangwindow()
    end
end
function show_skills(n, l, w)
    if w[2] ~= '你' then
        EnableTrigger("hp7", false)
    end
    wait.make( function()
        wait.time(2)
        EnableTrigger("hp7", true)
        draw_skillswindow()
    end )
end
function draw_skillswindow()
    if not flag_win_skills or flag_win_skills ~= 1 then
        if win_skills then
            WindowShow(win_skills, false)
        end
        return
    end
    if not skills then
        return
    end
    local _basic = { }
    local _skills_ch = { }
    local _skills_lev = { }
    local _skills_pot = { }
    for k, v in pairs(skills) do
        table.insert(_basic, k)
    end
    for i = 1, #_basic do
        table.insert(_skills_ch, skills[_basic[i]]["name"])
        table.insert(_skills_lev, skills[_basic[i]]["lvl"])
        table.insert(_skills_pot, skills[_basic[i]]["pot"])
    end
    WINDOW_WIDTH = 190
    if win_skills_show == 0 then
        WINDOW_HEIGHT = 30
        WINDOW_WIDTH = 70
    else
        WINDOW_HEIGHT =(#_basic + 1) * 15 + 40
        WINDOW_WIDTH = 200
    end
    -- Create the window
    -- WindowCreate (win_skills, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_POSITION, 4, 0x000010)  -- create window
    WindowCreate(win_skills,
    windowinfo_skills.window_left,
    windowinfo_skills.window_top,
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    windowinfo_skills.window_mode,
    windowinfo_skills.window_flags,
    0x000010)
    -- define the fonts
    WindowFont(win_skills, "f1", FONT_NAME1, FONT_SIZE_12)
    WindowFont(win_skills, "f2", FONT_NAME2, FONT_SIZE_11)
    WindowFont(win_skills, "f3", FONT_NAME1, FONT_SIZE_12, true)
    WindowFont(win_skills, "f4", FONT_NAME3, FONT_SIZE_11, true)
    WindowFont(win_skills, "f5", FONT_NAME1, FONT_SIZE_11)

    -- work out how high the font is
    font_height = WindowFontInfo(win_skills, "f1", 1)
    -- height of the font

    movewindow.save_state(win_skills)

    -- draw the border of the whole box
    WindowCircleOp(win_skills, miniwin.circle_round_rectangle, 0, 2, WINDOW_WIDTH - 2, WINDOW_HEIGHT, 0xc0c0c0, 0, 1, 0, 0, 9, 9)
    -- ensure window visible
    local head_width =(WINDOW_WIDTH - WindowTextWidth(win_skills, "f1", "技能列表")) / 2
    local head_width1 =(WindowTextWidth(win_skills, "f1", "━")) + 11
    local head_width2 =(WindowTextWidth(win_skills, "f1", "━　　领悟中━")) + 11
    if win_skills_show == 0 then
        WindowAddHotspot(win_skills, "skills",
        0, 0, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        -- mousedown
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_skills, "f5",
        "技能列表",
        -- text
        5, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode
    else
        WindowLine(win_skills, 0, font_height + 15, WINDOW_WIDTH - 2, font_height + 15, 0xc0c0c0, 0, 1)
        movewindow.add_drag_handler(win_skills, 0, 0, 0, font_height + 15, miniwin.cursor_hand)
        WindowAddHotspot(win_skills, "skills",
        0, font_height + 15, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        -- mousedown
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_skills, "f5",
        "技能列表",
        -- text
        head_width, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode

        WindowText(win_skills, "f1",
        "共" .. #_basic .. "种技能",
        -- text
        11, 30, 0, 0,
        -- rectangle
        ColourNameToRGB("white"),
        -- colour
        false)
        -- not Unicode


        --[[ WindowText (win_skills, "f1",
               "红色",   -- text
                head_width1, 30, 0, 0,        -- rectangle
                ColourNameToRGB ("red"), -- colour
                false)              -- not Unicode

   WindowText (win_skills, "f1",
               "青绿",   -- text
                head_width2, 30, 0, 0,        -- rectangle
                ColourNameToRGB ("cyan"), -- colour
                false)              -- not Unicode
	]]
        require "gauge"
        for i = 1, #_basic do
            if _skills_ch[i] == "" or _skills_ch[i] == nil then
                _skills_ch[i] = "数据丢失"
            end
            if _basic[i] == "" or _basic[i] == nil then
                _basic[i] = "数据丢失"
            end
            if _skills_lev[i] == "" or _skills_lev[i] == nil then
                _skills_lev[i] = "数据丢失"
            end
            if _skills_pot[i] == "" or _skills_pot[i] == nil then
                _skills_pot[i] = "数据丢失"
            end

            local txt2
            if string.len(_skills_ch[i]) == 10 then
                txt2 = " " .. _skills_ch[i] .. "  " .. _skills_lev[i] .. "  "
            elseif string.len(_skills_ch[i]) == 8 then
                txt2 = " " .. _skills_ch[i] .. "    " .. _skills_lev[i] .. "  "
            elseif string.len(_skills_ch[i]) == 6 then
                txt2 = " " .. _skills_ch[i] .. "      " .. _skills_lev[i] .. "  "
            else
                txt2 = " " .. _skills_ch[i] .. "        " .. _skills_lev[i] .. "  "
            end
            local _high = i * 15 + 30
            WindowText(win_skills, "f1",
            txt2,
            -- text
            5, _high, 0, 0,
            -- rectangle
            --  ColourNameToRGB (_colour), -- colour
            ColourNameToRGB("cyan"),
            -- colour
            false)
            -- not Unicode
            if _skills_ch[i] ~= "数据丢失" and _skills_pot[i] ~= "数据丢失" and _skills_lev[i] ~= "数据丢失" then
                gauge(win_skills, txt2,(_skills_pot[i]),(_skills_lev[i] + 1) ^ 2, 110, _high, 80, 12, ColourNameToRGB("red"), 0x808080, 0, 0x000000, 0x000000, 0x000000)
            end

            --[[if _skills_ch[i] ~= "数据丢失" then
			gauge (win_skills, txt2, GetVariable(Replace("skills_pot_".._basic[i], "-", "_", true)), (_skills_lev[i]+1)^2, 102, _high, 80, 12, ColourNameToRGB (_colour), 0x808080,  0, 0x000000, 0x000000, 0x000000)
		end
	--]]


        end
    end
    if flag_win_skills and flag_win_skills == 1 then
        WindowShow(win_skills, true)
    else
        WindowShow(win_skills, false)
    end
end 
	
	
	
function draw_bagwindow()
    if not flag_win_bag or flag_win_bag ~= 1 then
        if win_bag then
            WindowShow(win_bag, false)
        end
        return
    end
    if not Bag then
        return
    end
    local _bag_ch = { }
    local _bag_cn = { }
    for k, v in pairs(Bag) do
        if k ~= 'ENCB' then
            table.insert(_bag_ch, k)
        end
    end
    for i = 1, #_bag_ch do
        table.insert(_bag_cn, Bag[_bag_ch[i]]["cnt"])
    end
    if win_bag_show == 0 then
        WINDOW_HEIGHT = 30
        WINDOW_WIDTH = 70
    else
        WINDOW_HEIGHT =(math.ceil(#_bag_ch / 2) + 1) * 15 + 40
        WINDOW_WIDTH = 190
    end
    -- Create the window
    -- WindowCreate (win_bag, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_POSITION, 4, 0x000010)  -- create window
    WindowCreate(win_bag,
    windowinfo_bag.window_left,
    windowinfo_bag.window_top,
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    windowinfo_bag.window_mode,
    windowinfo_bag.window_flags,
    0x000010)

    movewindow.save_state(win_bag)
    -- define the fonts
    WindowFont(win_bag, "f1", FONT_NAME1, FONT_SIZE_12)
    WindowFont(win_bag, "f2", FONT_NAME2, FONT_SIZE_11)
    WindowFont(win_bag, "f3", FONT_NAME1, FONT_SIZE_12, true)
    WindowFont(win_bag, "f4", FONT_NAME3, FONT_SIZE_11, true)
    WindowFont(win_bag, "f5", FONT_NAME1, FONT_SIZE_11)

    -- work out how high the font is
    font_height = WindowFontInfo(win_bag, "f1", 1)
    -- height of the font

    -- draw the border of the whole box
    WindowCircleOp(win_bag, miniwin.circle_round_rectangle, 0, 2, WINDOW_WIDTH - 2, WINDOW_HEIGHT, 0xc0c0c0, 0, 1, 0, 0, 9, 9)

    -- ensure window visible
    local head_width =(WINDOW_WIDTH - WindowTextWidth(win_bag, "f1", "物品列表")) / 2
    if win_bag_show == 0 then
        WindowAddHotspot(win_bag, "bag",
        0, 0, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_bag, "f5",
        "物品列表",
        -- text
        5, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode
    else
        WindowLine(win_bag, 0, font_height + 15, WINDOW_WIDTH - 2, font_height + 15, 0xc0c0c0, 0, 1)
        movewindow.add_drag_handler(win_bag, 0, 0, 0, font_height + 15)
        WindowAddHotspot(win_bag, "bag",
        0, font_height + 15, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_bag, "f5",
        "物品列表",
        -- text
        head_width, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode

        WindowText(win_bag, "f1",
        "共" .. #_bag_ch .. "件物品",
        -- text
        5, 30, 0, 0,
        -- rectangle
        ColourNameToRGB("white"),
        -- colour
        false)
        -- not Unicode
        if Bag["ENCB"] ~= nil and Bag["ENCB"].value then
            WindowText(win_bag, "f1",
            "负重" .. Bag["ENCB"].value .. "%",
            -- text
            100, 30, 0, 0,
            -- rectangle
            ColourNameToRGB("white"),
            -- colour
            false)
            -- not Unicode

        end
        for i = 1, #_bag_ch do
            if _bag_ch[i] == "" or _bag_ch[i] == nil then
                _bag_ch[i] = "数据丢失"
                _basic[i] = "数据丢失"
            end

            local txt2 = _bag_ch[i] .. " *" .. _bag_cn[i]
            local _high = math.ceil(i / 2) * 15 + 30
            if i / 2 < math.ceil(i / 2) then
                WindowText(win_bag, "f1",
                txt2,
                -- text
                5, _high, 0, 0,
                -- rectangle
                --  ColourNameToRGB (_colour), -- colour
                ColourNameToRGB("green"),
                -- colour
                false)
                -- not Unicode
            else
                WindowText(win_bag, "f1",
                txt2,
                -- text
                95 + 5, _high, 0, 0,
                -- rectangle
                --  ColourNameToRGB (_colour), -- colour
                ColourNameToRGB("green"),
                -- colour
                false)
                -- not Unicode
            end
        end
    end
    if flag_win_bag and flag_win_bag == 1 then
        WindowShow(win_bag, true)
    else
        WindowShow(win_bag, false)
    end
end
	
function draw_beinangwindow()
    if not flag_win_beinang or flag_win_beinang ~= 1 then
        if win_beinang then
            WindowShow(win_beinang, false)
        end
        return
    end
    if not Beinang then
        return
    end

    if win_beinang_show == 0 then
        WINDOW_HEIGHT = 30
        WINDOW_WIDTH = 70
    else
        WINDOW_HEIGHT =(#Beinang + 1) * 15 + 40
        WINDOW_WIDTH = 190
    end
    -- Create the window
    -- WindowCreate (win_beinang, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_POSITION, 4, 0x000010)  -- create window
    WindowCreate(win_beinang,
    windowinfo_beinang.window_left,
    windowinfo_beinang.window_top,
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    windowinfo_beinang.window_mode,
    windowinfo_beinang.window_flags,
    0x000010)

    movewindow.save_state(win_beinang)
    -- define the fonts
    WindowFont(win_beinang, "f1", FONT_NAME1, FONT_SIZE_12)
    WindowFont(win_beinang, "f2", FONT_NAME2, FONT_SIZE_11)
    WindowFont(win_beinang, "f3", FONT_NAME1, FONT_SIZE_12, true)
    WindowFont(win_beinang, "f4", FONT_NAME3, FONT_SIZE_11, true)
    WindowFont(win_beinang, "f5", FONT_NAME1, FONT_SIZE_11)

    -- work out how high the font is
    font_height = WindowFontInfo(win_beinang, "f1", 1)
    -- height of the font

    -- draw the border of the whole box
    WindowCircleOp(win_beinang, miniwin.circle_round_rectangle, 0, 2, WINDOW_WIDTH - 2, WINDOW_HEIGHT, 0xc0c0c0, 0, 1, 0, 0, 9, 9)

    -- ensure window visible
    local head_width =(WINDOW_WIDTH - WindowTextWidth(win_beinang, "f1", "背囊列表")) / 2
    if win_beinang_show == 0 then
        WindowAddHotspot(win_beinang, "beinang",
        0, 0, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_beinang, "f5",
        "背囊列表",
        -- text
        5, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode
    else
        WindowLine(win_beinang, 0, font_height + 15, WINDOW_WIDTH - 2, font_height + 15, 0xc0c0c0, 0, 1)
        movewindow.add_drag_handler(win_beinang, 0, 0, 0, font_height + 15)
        WindowAddHotspot(win_beinang, "beinang",
        0, font_height + 15, 0, 0,
        "",
        -- mouseover (do nothing)
        "",
        -- cancelmouseover (do nothing)
        "",
        "",
        -- cancelmousedown (do nothing)
        "mouseup",
        -- mouseup (do nothing)
        "点击关闭开启",
        -- hint text if they hover over it
        0, 0)

        WindowText(win_beinang, "f5",
        "背囊列表",
        -- text
        head_width, 9, 0, 0,
        -- rectangle
        ColourNameToRGB("yellow"),
        -- colour
        false)
        -- not Unicode

        for i = 1, #Beinang do
            if Beinang[i] == "" or Beinang[i] == nil then
                Beinang[i] = "数据丢失"
            end

            local txt2 = Beinang[i]
            local _high = i * 15 + 30
            WindowText(win_beinang, "f1",
            txt2,
            -- text
            12, _high, 0, 0,
            -- rectangle
            --  ColourNameToRGB (_colour), -- colour
            ColourNameToRGB("deeppink"),
            -- colour
            false)
            -- not Unicode
        end
    end
    if flag_win_beinang and flag_win_beinang == 1 then
        WindowShow(win_beinang, true)
    else
        WindowShow(win_beinang, false)
    end
end
	
	
	
	
	
	
	