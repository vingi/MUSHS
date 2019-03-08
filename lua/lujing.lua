sour = { area = '������', room = '����' }
dest = { area = '������', room = '����' }
locl = { }
locl.area = '������'
locl.room = '����'
locl.where = '�����ǵ���'
locl.time = '��'
locl.id = { }
locl.exit = { }
road = { }
road.sour = '����_������'
road.city = '������_������'
road.dest = '������_����'
road.where = '�����ǵ���'
road.test = { }
road.detail = { }
road.act = nil
road.i = 0
road.temp = 0
road.find = 0
road.wipe_id = nil
road.wipe_who = nil
road.wipe_con = nil
road.resume = nil
road.wait = 0.15
road.steps = 10
locate_finish = 0
road.cmd = nil
road.cmd_save = nil
road.maze = nil
wait_cd = nil
exit = { }
exit.locl = { }
exit.reverse = { }
AddrIgnores = { }
WhereIgnores = { }

local WipeNoPerform = {
    ["guan bing"] = true,
    ["zhiqin bing"] = true,
    ["wu jiang"] = true,
    ["guan jia"] = true,
    ["ya yi"] = true,
    ["da yayi"] = true,
    ["huanggong shiwei"] = true,
    ["dali guanbing"] = true,
    ["dali wujiang"] = true,
    ["yu guangbiao"] = true,
    ["wu guangsheng"] = true,
    ["jia ding"] = true,
    ["ya huan"] = true,
    ["wu seng"] = true,
    ["daoyi chanshi"] = true,
    ["zhuang ding"] = true,
    ["heiyi bangzhong"] = true,
    ["xingxiu dizi"] = true,
    ["hufa lama"] = true,
    ["zayi lama"] = true,
    ["caihua zi"] = true,
    ["wudujiao dizi"] = true,
    ["wei shi"] = true,
    -- ["jiao zhong"] = true,
}

local ItemGet = {
    ["�ƽ�"] = true,
    --  ["����"] = true,
    ["ҼǪ����Ʊ"] = true,
    ["ҼǪ����Ʊ"] = true,
    ["��Ӣ֮��"] = true,
    ["����������ƪ"] = true,
    ["���콳����ƪ"] = true,
}


function exe(cmd)
    if GetConnectDuration() == 0 then
        return Connect()
    end
    if cmd == nil then cmd = 'look' end
    Execute(cmd)
end
function exe_road(cmd)
    if GetConnectDuration() == 0 then
        return Connect()
    end
    if cmd == nil then cmd = 'look' end
    road.cmd = cmd
    if locl.area and locl.area ~= "����ɽ" then
        Execute('halt')
    end
    Execute(cmd)
end
function lujing_trigger()
    walk_trigger()
end
function locate_trigger()
    DeleteTriggerGroup("locate")
    DeleteTriggerGroup("locate_unknown")
    create_trigger_t('locate_unknown1', '^(> )*�趨����������look\\s*\\=\\s*\\"YES\\"\\n>\\s*(\\D*)\\s*\\ -\\s*', '', 'local_unknown_room')
    create_trigger_t('locate2', '^(> )*��������������(\\D*)��\\n(\\D*)\\s*\\-\\s*', '', 'local_area')
    create_trigger_t('locate3', "^( )*����(�������|���Ե�|Ψһ��|���ü���Ψһ)������(\\D*)��$", '', 'local_exit')
    create_trigger_t('locate4', "^(\\D*) = (\\D*)$", '', 'local_id')
    create_trigger_t('locate5', '^(> )*��� "action" �趨Ϊ "���ڶ�λ" �ɹ���ɡ�$', '', 'local_start')
    create_trigger_t('locate6', "^(> )*������\\D*��\\D*��\\D*��(\\D*)ʱ", '', 'local_time')
    create_trigger_t('server_time', '^��������Ϸ����������ʱ����\\s*����(\\D*)\\s*\\d*-\\D*-\\s*\\d*\\s*(\\d*):(\\d*):', '', 'local_time_cal')
    create_trigger_t('locate7', "^( )*����û���κ����Եĳ�·��$", '', 'local_exitt')
    SetTriggerOption("locate_unknown1", "multi_line", "y")
    SetTriggerOption("locate_unknown1", "lines_to_match", "7")
    EnableTrigger("locate_unknown1", true)
    SetTriggerOption("locate2", "multi_line", "y")
    SetTriggerOption("locate2", "lines_to_match", "7")
    EnableTrigger("locate2", true)
    -- SetTriggerOption("locate_unknown1","group","locate_unknown")
    -- SetTriggerOption("locate2","group","locate")
    SetTriggerOption("locate3", "group", "locate")
    SetTriggerOption("locate4", "group", "locate")
    SetTriggerOption("locate5", "group", "locate")
    SetTriggerOption("locate6", "group", "locate")
    SetTriggerOption("locate7", "group", "locate")
    EnableTriggerGroup("locate", false)
    EnableTriggerGroup("locate_unknown", false)
end
function local_start()
    EnableTriggerGroup("locate", true)
    EnableTriggerGroup("locate_unknown", true)
    locl.area = '��֪������'
    exit.locl = { }
    locl.id = { }
    locl.item = { }
    locl.exit = { }
    locl.dir = "east"
end
local_unknown_room = function(n, l, w)
    local s = w[2]
    unknown_room_relation =(string.gsub(s, ' ', ''))
    r_r = string.reverse(unknown_room_relation)
    _, i = string.find(r_r, '[\n]')
    if i == nil then i = 0 end
    locl.room =(string.sub(unknown_room_relation, 1 - i))
    exe('unset look')
    locl.where = locl.area .. locl.room
    print(locl.where, locl.area, locl.room)
    locl.room_relation =(string.gsub(unknown_room_relation, '[\n]', ''))
end
local_room = function(n, l, w)
    EnableTrigger("locate1", false)
    locl.room = Trim(w[2])
    exe('unset look')
    locl.where = locl.area .. locl.room
    print(locl.where, locl.area, locl.room)
end
local_area = function(n, l, w)
    locl.area = w[2]
    local s = w[3]
    room_relation =(string.gsub(s, ' ', ''))
    r_r = string.reverse(room_relation)
    _, i = string.find(r_r, '[\n]')
    locl.room =(string.sub(room_relation, 1 - i))
    exe('unset look')
    locl.where = locl.area .. locl.room
    locl.room_relation =(string.gsub(room_relation, '[\n]', ''))
    print(locl.room_relation)
end
function room_relative(n, l, w)
    local s = w[3]
    room_relation =(string.gsub(s, ' ', ''))
    r_r = string.reverse(room_relation)
    _, i = string.find(r_r, '[\n]')
    print(string.sub(room_relation, 1 - i))
    print((string.gsub(room_relation, '[\n]', '')))
    local filename = GetInfo(67) .. "logs\\" .. score.id .. '�����ϵͼ' .. ".log"
    local file = io.open(filename, "a+")
    local s = '�������򣺡�' .. w[2] .. '�� ����������' .. '�� �����ϵ����' .. room_relation .. '��\n'
    -- print(s)
    file:write(s)
    file:close()
end
local_exit = function(n, l, w)
    EnableTimer('loclWait', false)
    local cnt
    exit.locl = exit_set(w[3])
    local l_set = exit.locl

    if roomNodir[locl.where] then
        l_set = del_element(l_set, roomNodir[locl.where])
    end
    cnt = table.getn(l_set)
    if cnt == 0 or cnt == nil then
        cnt = 1
    end
    cnt = math.random(1, cnt)
    locl.dir = l_set[cnt]
    if locl.dir == nil then
        locl.dir = 'east'
    end
    for _, p in pairs(exit.locl) do
        locl.exit[p] = true
    end
    if locate_finish ~= 0 then
        return _G[locate_finish]()
    end
end
local_exitt = function()
    EnableTimer('loclWait', false)
    localget = 1
    if locate_finish ~= 0 then
        return _G[locate_finish]()
    end
end
local_time = function(n, l, w)
    EnableTriggerGroup("locate", false)
    DeleteTriggerGroup("locate")
    locl.time = w[2]
end
local_time_cal = function(n, l, w)
    locl.weekday = Trim(tostring(w[1]))
    locl.hour = tonumber(w[2])
    locl.min = tonumber(w[3])
    if locl.weekday == '��' and(locl.hour == 6 or locl.hour == 7) and locl.min <= 45 and go_on_smy == 1 then
        -- 20161117���ӱ���go_on_smy���ؿ��� ��ֹϵͳ�������Զ�����Ħ��
        Note('�������������ˣ�')
        if job.zuhe["songmoya"] ~= nil then
            job.zuhe["songmoya"] = nil
            Note('��Ħ�������ѹرգ�')
        end
    end
    if locl.weekday == '��' and locl.hour == 8 and locl.min >= 15 and go_on_smy == 1 then
        if job.zuhe["songmoya"] == nil and tonumber(smydie) < 2 then
            job.zuhe["songmoya"] = true
            -- ����֮�����������Ħ��
        end
    end
end
local_id = function(n, l, w)
    local l_name = w[1]
    local l_id = w[2]
    local l_set = { }
    if string.find(l_id, ",") then
        l_set = utils.split(l_id, ',')
        l_id = l_set[1]
    else
        if not string.find(l_id, " ") and not string.find(l_id, 'beauty') and string.len(l_name) < 9 then
            MudUser[l_name] = l_id
        end
    end
    locl.id[l_name] = Trim(l_id)
    if ItemGet[l_name] then
        exe('get ' .. l_id)
    end
    if weaponPrepare[l_name] and(not weaponStore[l_name] or not Bag[l_name]) then
        exe('get ' .. l_id)
    end

    l_set = utils.split(w[2], ',')
    locl.item[l_name] = { }
    for p, q in pairs(l_set) do
        locl.item[l_name][Trim(q)] = true
    end
end
exit_set = function(exit)
    local l_set = { }
    local l_exit = Trim(exit)
    for w in string.gmatch(l_exit, "(%a+)") do
        table.insert(l_set, w)
    end

    return l_set
end
function locatee()
    locate_trigger()
    EnableTrigger("locate5", true)
    -- exe('alias action ���ڶ�λ')
    local_start()
    exe('id here')
    exe('set look;l;time')
end
function locate()
    locatee()
    create_timer_s('loclWait', 0.3, 'locatecheck')
end
function locatecheck()
    locatee()
end
function fastLocatee()
    locate_trigger()
    EnableTrigger("locate5", true)
    -- exe('alias action ���ڶ�λ')
    local_start()
    exe('set look;l')
end
fastLocate = function()
    fastLocatee()
    create_timer_s('loclWait', 0.3, 'fastlocatecheck')
end
fastlocatecheck = function()
    fastLocatee()
end
function walk_trigger()
    DeleteTriggerGroup("walk")
    create_trigger_t('walk1', '^(> )*��� "action" �趨Ϊ "���ڸ�·��" �ɹ���ɡ�$', '', 'walk_goon')
    SetTriggerOption("walk1", "group", "walk")
    EnableTriggerGroup("walk", false)
end
function walk_wait()
    EnableTriggerGroup("walk", true)
    EnableTrigger("hp12", true)
    if tmp.find then
        create_timer_s('walkWait', 0.4, 'walkTimer')
        if cntr1() > 0 then
            exe('alias action ���ڸ�·��')
        else
            cntr1 = countR(15)
        end
    else
        create_timer_s('walkWait', 0.1, 'walkTimer')
    end
end
function walkTimer()
    -- EnableTriggerGroup("walk",true)
    exe('alias action ���ڸ�·��')
end
function walk_goon()
    EnableTriggerGroup("walk", false)
    EnableTimer('walkwait', false)
    EnableTrigger("hp12", false)
    if tmp.find then
        return searchFunc()
    end
    EnableTrigger("hp12", true)
    create_timer_s('roadWait', road.wait, 'path_start')
end
function goto(where)
    dis_all()
    local l_dest = { }
    sour.id = nil
    dest.id = nil
    tmp.goto = true
    where = Trim(where)

    l_dest.area, l_dest.room = locateroom(where)

    if l_dest.area then
        return go(test, l_dest.area, l_dest.room)
    else
        return ColourNote("red", "blue", "�Ҳ������޷������(�ص�|����)��" .. where)
    end

end

function go_setting(job, area, room, sId)
    -- map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8"
    tmp.goto = nil
    sour.id = sId
    dest.id = nil
    if area ~= nil then
        dest.area = area
    end
    if room ~= nil then
        dest.room = room
    end
    if string.find(dest.area, "/") then
        dest.id = dest.area
        -- Note(dest.id)
        dest.room = map.rooms[dest.id].name
        -- Note(dest.room)
    end
    if job == nil then
        job = test
    end
    flag.find = 0
    flag.wait = 0
    road.act = job
    road.i = 0
    flag.dw = 1
    tmp.find = nil
end

function go(job, area, room, sId)
    quest.status = "���ڸ�·��"
    if area ~= nil and room ~= nil then
        quest.location = area .. room
    end
    quest.update()
    go_setting(job, area, room, sId)
    -- if sour.id ~= nil then
    --   return check_busy(path_consider)
    -- else
    -- ain
    return check_halt(go_locate)
    -- end
end
-- ----------------------------------------------------------
-- �趨��ǰλ��, �ﵽ�򻯰�Locate()��Ч��. (���ӵ��Ͳ�����, ��ȱ��room_relation�Ȳ���)
-- ----------------------------------------------------------
function go_direct_pre(localarea, localroom, sID)
    sour.id = sID
    locl.area = localarea
    locl.room = localroom
    locl.room_relation = ""
    locl.where = locl.area .. locl.room
    road.id = nil
end
-- ----------------------------------------------------------
-- ��ȷ����ǰλ�õ�ǰ����, ����ҪLocateֱ�Ӳ���·��ǰ��, ��checkwait����
-- ע�� ���д�sID����,����ҪsID(��ǰ����Ӣ����),��localroom����������ƥ��, �������ɴ���
-- �� localroom = "������" ����sIDʱ,�����Ϊ���Ӧ�� "emei/jietuopo"
-- ͨ��sID����ĳ�������ж��ͬ��������µ�Ψһֵ����, �� "�鷿",����ͬ���ܶ�,Ӣ����������Ψһֵ����
-- ע�� ��Ϊ�ǰ�ȫ����, ʹ��ʱӦ�������Թ�,���ֵȵ�ʹ��, ���ӵ�����ʹ�ð�ȫ���� go()
-- ----------------------------------------------------------
function go_direct(job, localarea, localroom, destarea, destroom, sID)
    quest.status = "���ڸ�·��"
    if area ~= nil and room ~= nil then
        quest.location = area .. room
    end
    quest.update()
    go_direct_pre(localarea, localroom, sID)
    go_setting(job, destarea, destroom, sId)
    check_busy(path_consider)
end
-- ----------------------------------------------------------
-- ����ͬgo_direct, �������busy����
-- ----------------------------------------------------------
function go_direct_pure(job, localarea, localroom, destarea, destroom, sID)
    quest.status = "���ڸ�·��"
    if area ~= nil and room ~= nil then
        quest.location = area .. room
    end
    quest.update()
    go_direct_pre(localarea, localroom, sID)
    go_setting(job, destarea, destroom, sId)
    path_consider()
end

function go_locate()
    locate()
    checkWait(path_consider, 0.3)
end

function goContinue()
    return go(road.act)
end

function path_consider(skip_stepto)
    -- print("call path_consider")
    -- �Ƿ���ת
    skip_stepto = skip_stepto or 0
    -- �Ƿ���ת��ĳһ��... ��·����5��, Ĭ�ϴӵ�1�ο�ʼ,����ֱ�������ӵ�3�ο�ʼ,�ɴ��� path_consider(2)

    EnableTrigger("hp12", false)
    locate_finish = 0
    if flag.find == 1 then return end
    local l_sour, l_dest, l_path, l_way
    local l_where = locl.area .. locl.room
    sour.rooms = { }
    dest.rooms = { }
    if sour.id and map.rooms[sour.id].name ~= locl.room then
        --- �жϷ�����û��npc
        sour.id = nil
    end
    if not sour.id and road.id and map.rooms[road.id] and map.rooms[road.id].name == locl.room then
        sour.id = road.id
    end
    if sour.id == nil then
        sour.room = locl.room
        sour.area = locl.area
        sour.rooms = getRooms(sour.room, sour.area)
    end
    if dest.id == nil then
        dest.rooms = getRooms(dest.room, dest.area)
    end
    if roomMaze[l_where] then
        if type(roomMaze[l_where]) == 'function' then
            l_way = roomMaze[l_where]()
        else
            l_way = roomMaze[l_where]
        end
    end
    if l_way then
        exe(l_way)
        quick_locate = 0
        chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾' .. locl.area .. locl.room .. '���޼�·�����ƶ�Ѱ��ȷ�ж�λ�㣡', 'red')
        return checkWait(goContinue, 0.3)
    end
    if locl.room_relation == '�����ߨL���׵�������ݺ������' then
        exe('sw')
        quick_locate = 0
        return checkWait(goContinue, 0.3)
    end
    if locl.room_relation == '���϶����϶�' or locl.room_relation == "��֪��������϶� ��֪������ ���϶�" then
        exe('drop fire;leave;leave;leave;leave;leave;leave;out;ne;ed;ne;ed')
        quick_locate = 0
        return checkWait(goContinue, 0.3)
    end
    if locl.room == '÷��' then
        quick_locate = 0
        exe('n')
        return mlOutt()
    end
    if locl.room == '�洬' then
        exe('out;w;s;out;w;s;out;w;s')
        quick_locate = 0
        return checkWait(goContinue, 0.3)
    end
    if sour.id ~= nil then
        chats_locate('��λϵͳ���ӡ�' .. sour.id .. '������!')
    else
        chats_locate('��λϵͳ���ӡ�' .. sour.area .. sour.room .. '������!')
        if table.getn(sour.rooms) == 0 then
            if locl.room == 'Сľ��' then
                return toSldHua()
            elseif locl.room == 'Ȫˮ��' then
                exe('tiao out;tiao out')
                quick_locate = 0
                return checkWait(goContinue, 0.3)
            elseif locl.room == 'ˮ̶' then
                exe('pa up')
                quick_locate = 0
                return checkWait(goContinue, 0.3)
            else
                if locl.room_relation ~= '' then
                    chats_locate('��λϵͳ��û�й����صķ��������room_relative�������Գ��Զ�λû�й����صķ��䡿', 'LimeGreen')
                    -- ������Գ��Զ�λû�й����صķ���
                end
                chats_locate('��λϵͳ����ͼϵͳ�޴˵ص㡾' .. locl.area .. locl.room .. '�����ϣ�����ƶ�Ѱ��ȷ�ж�λ�㣡', 'red')
                exe('stand;leave')
                exe(locl.dir)
                quick_locate = 0
                return checkWait(goContinue, 0.3)
            end
        end
        -- if table.getn(sour.rooms)>1 and sour.id~='city/jiangbei' then
        if table.getn(sour.rooms) > 1 then
            ---------------------------------------------------------------------------------------------------
            chats_locate('��λϵͳ�������һ��ͬ�������жϡ�' .. sour.room .. '����!', 'LimeGreen')
            if locl.room_relation ~= '' then
                chats_locate('��λϵͳ�������ϵΪ��' .. locl.room_relation .. '��', 'LimeGreen')
            end
            for i = 1, table.getn(sour.rooms) do
                if (locl.room_relation ~= '' and map.rooms[sour.rooms[i]].room_relative == locl.room_relation) then
                    chats_locate('��λϵͳ�����Ծ�ȷ��λ��', 'LimeGreen')
                    sour.id = sour.rooms[i]
                    return check_halt(path_consider)
                    -- return go(road.act,dest.area,dest.room,sour.rooms[i])
                end
            end
            for p in pairs(locl.id) do
                local l_cnt = 0
                local l_id
                for k, v in pairs(sour.rooms) do
                    local l_corpse
                    if string.find(p, "��ʬ��") then
                        l_corpse = del_string(p, "��ʬ��")
                    else
                        l_corpse = p
                    end
                    if map.rooms[v] and map.rooms[v].objs and(map.rooms[v].objs[p] or map.rooms[v].objs[l_corpse]) then
                        l_cnt = l_cnt + 1
                        l_id = v
                    end
                end
                if l_cnt == 1 then
                    return go(road.act, dest.area, dest.room, l_id)
                end
            end
            if not roomMaze[l_where] then
                for p in pairs(locl.exit) do
                    local l_cnt = 0
                    local l_id
                    for i = 1, table.getn(sour.rooms) do
                        if map.rooms[sour.rooms[i]] and map.rooms[sour.rooms[i]].ways and map.rooms[sour.rooms[i]].ways[p] then
                            l_cnt = l_cnt + 1
                            l_id = sour.rooms[i]
                        end
                    end
                    if l_cnt == 1 then
                        return go(road.act, dest.area, dest.room, l_id)
                    end
                end
            end
            --        end
            --        -- if table.getn(sour.rooms)>1 and sour.id~='city/jiangbei' then
            --        if table.getn(sour.rooms) > 1 then
            -------------------------------------------------------------------------
            if locl.room_relation ~= '' then
                -- ��������ȡ��������Թ�ϵ�ַ���
                for i = 1, table.getn(sour.rooms) do
                    if (locl.room_relation ~= '' and map.rooms[sour.rooms[i]].room_relative == locl.room_relation) then
                        chats_locate('��λϵͳ����ȷ��λ����idΪ����' .. sour.rooms[i] .. '��', 'LimeGreen')
                        sour.id = sour.rooms[i]
                        return check_halt(path_consider)
                        -- return go(road.act,dest.area,dest.room,sour.rooms[i])
                    else
                        chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾' .. locl.area .. locl.room .. '���޷���ȷ��λ������ƶ���', 'red')
                        exe('stand;leave')
                        exe(locl.dir)
                        quick_locate = 0
                        return checkWait(goContinue, 0.3)
                    end
                end
            else
                chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾' .. locl.area .. locl.room .. '�����ڲ�ֹһ��������ƶ�Ѱ��ȷ�ж�λ�㣡', 'red')
                exe('stand;leave')
                exe(locl.dir)
                quick_locate = 0
                return checkWait(goContinue, 0.3)
            end
        end
    end

    if dest.id == nil and table.getn(dest.rooms) == 0 then
        Note('Path Consider GetRooms Error!')
        return false
    end

    --    path_Debug()

    path_create()
    road.i = skip_stepto
    -- return check_halt(path_start)
    return check_bei(path_start)
end

function path_Debug()
    if sour ~= nil then
        print(" -- sour below: ")
        tprint(sour)
    end
    if dest ~= nil then
        print(" -- dest below: ")
        tprint(dest)
    end
    if locl ~= nil then
        print(" -- locl below: ")
        tprint(locl)
    end
end

function path_create()
    local l_set
    local l_num = 0
    local l_cnt = 1
    road.detail = { }

    l_path = path_cal()
    -- Note(l_path)
    if type(l_path) ~= 'string' then
        if math.random(1, 4) == 1 then
            l_path = 'stand;out;northeast;northwest;southeast;southwest;south;south;south;south;south'
        elseif math.random(1, 4) == 2 then
            l_path = 'stand;out;northeast;northwest;southeast;southwest;east;east;east;east;east;east'
        elseif math.random(1, 4) == 3 then
            l_path = 'stand;out;northeast;northwest;southeast;southwest;west;west;west;west;west;west'
        else
            l_path = 'stand;out;northeast;northwest;southeast;southwest;north;north;north;north;north'
        end
    end
    l_set = utils.split(l_path, ';')
    for i = 1, table.getn(l_set) do
        if string.find(l_set[i], '#') then
            if l_num > 0 then
                l_cnt = l_cnt + 1
            end
            road.detail[l_cnt] = l_set[i]
            l_cnt = l_cnt + 1
            l_num = 0
        else
            if l_num == 0 then
                road.detail[l_cnt] = l_set[i]
            else
                road.detail[l_cnt] = road.detail[l_cnt] .. ';' .. l_set[i]
            end
            l_num = l_num + 1
            if l_num > road.steps then
                l_cnt = l_cnt + 1
                l_num = 0
            end
        end
    end
end

function path_start()
    EnableTrigger("hp12", false)
    EnableTimer("roadWait", false)
    DeleteTimer("roadWait", false)
    local l_road
    road.i = road.i + 1
    if flag.find == 1 then return end
    if road.i > table.getn(road.detail) then
        locate_finish = 'go_confirm'
        return locate()
    end
    l_road = road.detail[road.i]
    if string.find(l_road, '#') then
        local _, _, func, params = string.find(l_road, "^#(%a%w*)%s*(.-)$")
        if func then
            return _G[func](params)
        end
    else
        exe(l_road)
        exe('yun jingli')
        --        print("road.i:"..road.i)
        --        tprint(road.detail)
        --        print("run path_start: " .. l_road)
        --        print("locl.room:"..locl.room.." dest.room:"..dest.room)
        return walk_wait()
    end
end

function go_confirm()
    locate_finish = 0
    checkWield()
    sour.id = nil
    if flag.go == nil then flag.go = 0 end
    flag.go = flag.go + 1
    if flag.go > 3 then flag.go = 0 end
    if locl.room == dest.room or flag.go == 0 then
        if locl.room == dest.room then
            chats_locate('��λϵͳ���ӡ�' .. sour.area .. sour.room .. '������������Ŀ�ĵء�' .. dest.area .. dest.room .. '����', 'seagreen')
        else
            chats_locate('��λϵͳ���ӡ�' .. sour.area .. sour.room .. '��������δ��Ŀ�ĵء�' .. dest.area .. dest.room .. '�����յ�Ϊ��' .. locl.area .. locl.room .. '����', 'cyan')
        end
        flag.go = 0
        return road.act()
    else
        return go(road.act)
    end
end

function find(l_area, l_room)
    do return search() end
end

find_nobody = function()
    if string.find(job.name, 'songxin') then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. '���ҵ���' .. job.target .. '����', 'songxinFindFail')
    end
    if job.name == 'wudang' then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target .. '����', 'wudangFindFail')
        -- if flag.times>2 then return wudangFindFail() end
    end
    if job.name == 'clb' then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target .. '����', 'clbFindFail')
    end
    if job.name == 'husong' then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target .. '����', 'husongFindFail')
    end
    if job.name == 'xueshan' then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target .. '����', 'xueshanFindFail')
    end
    if job.name == 'tdh' then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target .. '����', 'tdhFindFail')
    end
    if job.name == 'huashan' then
        chats_log('��λϵͳ��δ���ڡ�' .. dest.area .. dest.room .. '���ҵ���' .. job.target .. '����', 'huashanFindFail')
    end
    if job.name == "Dummyjob" then
        chats_log('��λϵͳ��δ���ڡ�' .. job.area .. job.room .. '���ҵ���' .. job.target4 .. '����')
        return dummyover()
    end

    flag.times = flag.times + 1
    if flag.times > 2 then
        jobFindFail = jobFindFail or { }
        if job.name and jobFindFail[job.name] then
            local p = jobFindFail[job.name]
            return _G[p]()
        end
    else
        jobFindAgain = jobFindAgain or { }
        if job.name and jobFindAgain[job.name] then
            local p = jobFindAgain[job.name]
            return _G[p]()
        end
    end

    -- ����ôһ������ˣ��Ҳ����˾ͻ��ٴο��ţ�
    if job.name == 'dolost' then return lookXin() end

    return go(check_heal, '�����', 'ҩ��')
end
List = { }
-- ��������
function List.new(val)
    return { pnext = nil, index = val }
end
-- ���һ���ڵ�
function List.addNode(nodeParent, nodeChild)
    nodeChild.pnext = nodeParent.pnext
    nodeParent.pnext = nodeChild
    return nodeChild
end
function searchPre()
    road.rooms = { }
    -- print(road.id)
    local p_room = map.rooms[road.id].name
    local p_dest = getLookCity(road.id)
    local l_distance = 6
    if job.name and(job.name == "clb" or job.name == 'tdh' or job.name == 'tmonk') and flag.times == 1 then
        l_distance = 2
    end
    if job.name and job.name == 'xueshan' and flag.times == 1 then
        l_distance = 3
    end
    if p_dest == nil then
        p_dest = map.rooms[road.id].outdoor
    end
    local rooms = getAroundRooms(p_room, p_dest, l_distance, 'all')
    roomsnum = countTab(rooms)
    -- �����ڽӱ����ڵݹ�����
    -- ������ʼroad.id
    starttime = os.clock()
    -- ���Լ���ʱ��
    newrooms = { }
    for id in pairs(rooms) do
        table.insert(newrooms, id)
    end

    myrt = { }

    for _, roomid in pairs(newrooms) do
        -- ���뷿������
        roomV = List.new(roomid)
        local node = roomV
        for k, v in pairs(newrooms) do
            -- ���еķ���id
            for route, link_way in pairs(map.rooms[roomid].ways) do
                -- ��ǰid�ĳ���
                local routeLength = map.rooms[roomid]:length(route)
                -- ��ȡ·�������Ƿ�ɴ����false��ʾ��·��ͨ����ô��������·�Ͳ������������
                -- print("k="..k.."|link_way="..link_way.."|v="..v)
                if routeLength then
                    --- by fqyy 20170429 ����room.lengths����ֵ�ж�
                    if routeLength == 1 or routeLength > 1 and flag.times > 1 then
                        if v == link_way then
                            node = List.addNode(node, List.new(k))
                            -- ����ڵ����ɵ�һ������ĳ�������
                        end
                    end
                end
            end
        end
        table.insert(myrt, roomV)
    end
    visited = { }

    for i = 1, countTab(newrooms) do
        visited[i] = false
        -- ��ʼ�����нڵ�δ������
    end

    if not visited[1] then
        FastDFS(myrt, 1)
        -- ����������ͨͼ
    end
    for i = 1, countTab(newrooms) do
        if visited[i] == false then
            -- δ�����ʵĽڵ����һ�¸���һ��������ͨ�ԣ��������ͨ����ݹ�����ڵ�
            local path, len = map:getPath(myrt[1].index, myrt[i].index)
            if path then
                FastDFS(myrt, i)
                -- ��������ָ����myrt[i]����ڵ�
                -- messageShow("����ͨ·��������һ���ڵ㣡ͨ·����="..len,"red")
            end
        end
    end
    -- messageShow("��"..job.name.."��������ȼ��������������"..roomsnum.."�������䣬��ʱ��"..os.clock()-starttime.."����","SandyBrown")
end
function FastDFS(myrt, i)
    visited[i] = true
    -- �����±�ΪI�Ķ���Ϊ�ѷ���
    -- Note("myrt["..i.."]="..myrt[i].index)  --���������Ϣ
    table.insert(road.rooms, myrt[i].index)
    local p = myrt[i].pnext
    -- ��һ���߱���
    if p == nil then return end
    while p ~= nil do

        if (not visited[p.index]) then
            -- �����δ���ʵ���ݹ�
            visited[p.index] = true
            FastDFS(myrt, p.index)
        end
        p = p.pnext

    end
end
function dfs(from)
    for i = 1, countTab(tmp.to) do
        if not tmp.to then
            break
        end
        local l_dest, l_p = getNearRoom(from, tmp.to)
        if l_dest then
            local l_check = true
            for v in pairs(road.rooms) do
                if v == l_dest then
                    l_check = false
                end
            end
            if l_check then
                local path, len = map:getPath(from, l_dest)
                if path then
                    table.insert(road.rooms, l_dest)
                    table.remove(tmp.to, l_p)
                    dfs(l_dest)
                end
            end
        end
    end
end
function search()
    -- Note("run search")
    tmp.find = true
    if flag.find == 1 then return end
    searchPre()
    cntr1 = countR(15)
    exe('look;halt')
    tmpsearch = 3
    return check_halt(searchStart, 1)
end
function searchStart()
    -- Note("run searchStart")
    if flag.find == 1 then return end
    if flag.wait == 1 then return end
    if table.getn(road.rooms) == 0 then
        return find_nobody()
    end
    local path, length = map:getPath(road.id, road.rooms[1])
    -- print("path+length"..path.."|"..length)
    road.id = road.rooms[1]
    table.remove(road.rooms, 1)

    if type(path) ~= "string" then
        -- Note(road.id)
        -- Note(path)
        return searchStart()
    end

    if string.find(path, '#') or job.name ~= 'huashan' then
        -- print("path:"..path)
        return searchFunc(path)
    else
        -- print("alias:"..string.sub(string.gsub(path, "halt;", ""),1,-2))
        exe(string.sub(string.gsub(path, "halt;", ""), 1, -2))
        _, tmpnum = string.gsub(path, ";", " ")
        tmpsearch = tmpsearch + tmpnum
        -- print("n="..tmpsearch)
        if tmpsearch > road.steps then
            tmpsearch = 3
            -- print("apath:"..path)
            wait.make( function()
                wait.time(0.2)
                searchStart()
            end )
            -- return walk_wait()
        else
            tmpsearch = tmpsearch + 1
            return searchStart()
        end
    end

end
function searchFunc(path)
    -- Note("run searchFunc")
    if flag.find == 1 then return end
    if flag.wait == 1 then return end
    road.pathset = road.pathset or { }
    if path then
        road.pathset = utils.split(path, ";")
        for i = 1, table.getn(road.pathset) do
            for p = 1, table.getn(road.pathset) do
                if isNil(road.pathset[p]) or road.pathset[p] == "halt" then
                    table.remove(road.pathset, p)
                    break
                end
            end
        end
    end
    if table.getn(road.pathset) == 0 then
        return searchStart()
    end
    -- for i=1,table.getn(road.pathset) do
    -- Note(road.pathset[1])
    if string.find(road.pathset[1], '#') then
        local _, _, func, params = string.find(road.pathset[1], "^#(%a%w*)%s*(.-)$")
        if func then
            table.remove(road.pathset, 1)
            return _G[func](params)
        else
            exe(road.pathset[1])
            table.remove(road.pathset, 1)
            return walk_wait()
        end
    else
        exe(road.pathset[1])
        table.remove(road.pathset, 1)
        return walk_wait()
    end
    -- end
    -- return searchWait()
end

function searchWait()
    EnableTriggerGroup("find", true)
    exe('alias action ������Ѱ��')
end
delElement = function(set, dir)
    local l_cnt = 0
    for i = 1, table.getn(set) do
        if set[i] == dir then
            l_cnt = i
            break
        end
    end
    table.remove(set, l_cnt)
    return set
end

wipe_trigger = function()
    DeleteTriggerGroup("wipe")
    create_trigger_t('wipe1', "^>*\\s*(\\D*)��\\D*��Ķ����ˡ�$", '', 'wipe_goon')
    create_trigger_t('wipe2', "^>*\\s*(\\D*)��ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����", '', 'wipe_goon')
    create_trigger_t('wipe3', "^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ", '', 'wipe_faint')
    create_trigger_t('wipe7', "^>*\\s*(\\D*)���Ӷ��˶������������˼��������ѹ���", '', 'wipe_wake')
    create_trigger_t('wipe4', "^>*\\s*�����(\\D*)(�ͺ�|���|���|�ȵ�|����һ��)", '', 'wipe_who')
    create_trigger_t('wipe5', "^>*\\s*����û������ˡ�", '', 'wipe_over')
    create_trigger_t('wipe6', "^>*\\s*��Ҫ��˭�����������", '', 'wipe_over')
    SetTriggerOption("wipe1", "group", "wipe")
    SetTriggerOption("wipe2", "group", "wipe")
    SetTriggerOption("wipe3", "group", "wipe")
    SetTriggerOption("wipe4", "group", "wipe")
    SetTriggerOption("wipe5", "group", "wipe")
    SetTriggerOption("wipe6", "group", "wipe")
    SetTriggerOption("wipe7", "group", "wipe")
    EnableTriggerGroup("wipe", false)
end
wipe = function(wipe_str, wipe_con)
    wipe_trigger()
    EnableTriggerGroup("wipe", true)
    road.wipe_id = wipe_str
    road.wipe_con = wipe_con
    tmp.faint = 0
    weapon_wield()
    if WipeNoPerform[road.wipe_id] or tmp.gold then
        exe('kill ' .. road.wipe_id)
        if score.party and score.party == "�䵱��" then
            exe("jiali max")
        else
            exe("jiali max")
        end
        exe('unset wimpy')
    else
        killPfm(road.wipe_id)
    end
    create_timer_s('wipe', 2, 'wipe_set')
end
wipe_set = function()
    exe('kill ' .. road.wipe_id)
end
wipe_who = function(n, l, w)
    road.wipe_who = Trim(w[1])
    job.killer = job.killer or { }
    if not WipeNoPerform[road.wipe_id] then
        job.killer[road.wipe_who] = road.wipe_id
    end
end
wipe_faint = function(n, l, w)
    if tmp.faint then
        tmp.faint = tmp.faint + 1
    end
    if road.wipe_who == Trim(w[1]) then
        exe('kill ' .. road.wipe_id)
        job.killer[road.wipe_who] = "faint"
    end
end
wipe_wake = function(n, l, w)
    if tmp.faint then
        tmp.faint = 0
    end
    if road.wipe_who == Trim(w[1]) then
        exe('kill ' .. road.wipe_id)
    end
end
wipe_goon = function(n, l, w)
    if job.name == "gblu" and road.wipe_who == "�о�����" then
        chats_log('��Ч���ң��㶨��' .. locl.room .. '�����о�������')
    end
    if tmp.faint and tmp.faint > 0 then
        tmp.faint = tmp.faint - 1
    end
    if road.wipe_who == Trim(w[1]) then
        exe('kill ' .. road.wipe_id)
    end
end
wipe_over = function()
    wait_cd = os.time()
    DeleteTimer('wipe')
    DeleteTimer('perform')
    exe('set wimpy 100')
    EnableTriggerGroup("wipe", false)
    road.wipe_id = "wipe_id"
    if road.wipe_con ~= nil then
        return check_halt(road.wipe_con)
    else
        return check_halt(walk_wait)
    end
end

function thread_resume(thread)
    if type(thread) == 'thread' then
        coroutine.resume(thread)
    end
end
function walkBusy()
    return check_halt(walk_wait)
end

hsssl = function()
    road.temp = 0
    if flag.find == 1 then return end
    if flag.wait == 1 then return end
    DeleteTriggerGroup("sslcheck")
    create_trigger_t('sslcheck1', "^\\D*ʯ��", '', 'hsssl_out')
    SetTriggerOption("sslcheck1", "group", "sslcheck")
    EnableTriggerGroup("sslcheck", true)
    exe('n;e;e')
    if flag.find == 1 then return end
    create_timer_s('walkWait9', 0.05, 'sslgo')
    create_timer_s('walkWait10', 5, 'ssllook')
end
ssllook = function()
    exe('look')
end
sslgo = function()
    road.temp = road.temp + 1
    if road.temp > 200 then
        return hsssl_out()
    end
    exe('n;e;e;e;e;e;')
end
hsssl_out = function()
    locl.room = "ʯ��"
    EnableTriggerGroup("sslcheck", false)
    EnableTimer('walkWait10', false)
    EnableTimer('walkWait9', false)
    DeleteTimer("walkWait10")
    DeleteTimer("walkWait9")
    if flag.find == 1 then return end
    if flag.wait == 1 then return end
    return walk_wait()
end
function hsssl_check()
    locate()
    return checkWait(hsssl_goon, 0.2)
end
hsssl_goon = function()
    road.temp = road.temp + 1
    if road.temp > 100 then
        dis_all()
        return check_heal()
    end
    if locl.room == '����' or locl.room == '������' or locl.room == '�յ�' then
        exe('n;e;e;e;e;e')
        return check_halt(hsssl_check, 1)
    else
        return hsssl_out()
    end
end
------------------------------���ݿ�ջ----------------------------------------
lanzhoukedian = function()
    exe('give xiao 5 silver;up')
    return checkWait(lanzhoukedian1, 0.15)
end
lanzhoukedian1 = function()
    if flag.find == 1 then return end
    exe('enter')
    return checkWait(lanzhoukedian2, 0.15)
end
lanzhoukedian2 = function()
    if flag.find == 1 then return end
    exe('out')
    return walk_wait()
end
lzkdoutgo = function()
    EnableTriggerGroup("lzkedianout", false)
    DeleteTriggerGroup("lzkedianout")
    exe('out;down;e')
    return walk_wait()
end

lzkedianoutgosleep = function()
    exe('east')
    fastLocate()
    wait.make( function()
        wait.time(0.3)
        if flag.find == 1 then return end
        return lzkedianoutgosleepdo()
    end )
end
lzkedianoutgosleepdo = function()
    locate_finish = 0
    DeleteTriggerGroup("lzkedianout")
    create_trigger_t('lzkedianout1', '^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$', '', 'lzkdoutgo')
    create_trigger_t('lzkedianout2', '^>*\\s*��С��һ�µ���¥��ǰ������һ���������ţ����ס����$', '', 'lzkzgogo')
    SetTriggerOption("lzkedianout1", "group", "lzkedianout")
    SetTriggerOption("lzkedianout2", "group", "lzkedianout")
    if locl.room_relation == '�͵��¥���͵�-----���ǿ͵�' then
        exe('up;enter;sleep')
    else
        return lzkzgogogo()
    end
end
lzkzgogo = function()
    EnableTriggerGroup("lzkedianout", false)
    DeleteTriggerGroup("lzkedianout")
    exe('east')
    return walk_wait()
end
lzkzgogogo = function()
    EnableTriggerGroup("lzkedianout", false)
    DeleteTriggerGroup("lzkedianout")
    return walk_wait()
end
------------------------------�ۺ���ջ----------------------------------------
jhkz = function()
    exe('give xiao 5 silver;up')
    return checkWait(jhkz1, 0.15)
end
jhkz1 = function()
    if flag.find == 1 then return end
    exe('north')
    return checkWait(jhkz2, 0.15)
end
jhkz2 = function()
    if flag.find == 1 then return end
    exe('south')
    return walk_wait()
end
jhkzout = function()
    exe('east')
    fastLocate()
    return checkWait(jhkzcheck, 0.3)
end
jhkzcheck = function()
    DeleteTriggerGroup("jhkz")
    create_trigger_t('jhkz1', '^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$', '', 'jhkzoutgo')
    create_trigger_t('jhkz2', '^>*\\s*��ô�ţ����ס����$', '', 'jhkzoutgogogo')
    SetTriggerOption("jhkz1", "group", "jhkz")
    SetTriggerOption("jhkz2", "group", "jhkz")
    if locl.room_relation == '���ȡ��ۺ���ջ---����־ۺ���ջ' then
        exe('up;n;sleep')
    else
        return jhkzoutgogo()
    end
end
jhkzoutgo = function()
    EnableTriggerGroup("jhkz", false)
    DeleteTriggerGroup("jhkz")
    exe('s;d;e')
    return walk_wait()
end
jhkzoutgogogo = function()
    EnableTriggerGroup("jhkz", false)
    DeleteTriggerGroup("jhkz")
    exe('e')
    return walk_wait()
end
jhkzoutgogo = function()
    EnableTriggerGroup("jhkz", false)
    DeleteTriggerGroup("jhkz")
    return walk_wait()
end
-----------------------------������ջ---------------------------------------
bckz = function()
    exe('give xiao 5 silver;up')
    return checkWait(bckz1, 0.15)
end
bckz1 = function()
    if flag.find == 1 then return end
    exe('enter')
    return checkWait(bckz2, 0.15)
end
bckz2 = function()
    if flag.find == 1 then return end
    exe('out')
    return walk_wait()
end
bckzout = function()
    exe('west')
    fastLocate()
    wait.make( function()
        wait.time(0.3)
        return bckzcheck()
    end )
end
bckzcheck = function()
    if flag.find == 1 then return end
    DeleteTriggerGroup("bckz")
    create_trigger_t('bckz1', '^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$', '', 'bckzoutgo')
    create_trigger_t('bckz2', '^>*\\s*��ô�ţ����ס���Ǳ�����ջ����$', '', 'bckzoutgogogo')
    SetTriggerOption("bckz1", "group", "bckz")
    SetTriggerOption("bckz2", "group", "bckz")
    if locl.room_relation == '�͵��¥�������---������ջ---ƫ��������ջ' then
        exe('up;enter;sleep')
    else
        return bckzoutgogo()
    end
end
bckzoutgo = function()
    EnableTriggerGroup("bckz", false)
    DeleteTriggerGroup("bckz")
    exe('out;d;w')
    return walk_wait()
end
bckzoutgogogo = function()
    EnableTriggerGroup("bckz", false)
    DeleteTriggerGroup("bckz")
    exe('w')
    return walk_wait()
end
bckzoutgogo = function()
    EnableTriggerGroup("bckz", false)
    DeleteTriggerGroup("bckz")
    return walk_wait()
end
--------------------------����ϲ����ջ-----------------------------------------------
xfkz = function()
    exe('give xiao 5 silver;up')
    return checkWait(xfkz1, 0.2)
end
xfkz1 = function()
    if flag.find == 1 then return end
    exe('enter')
    return checkWait(xfkz2, 0.2)
end
xfkz2 = function()
    if flag.find == 1 then return end
    exe('out')
    return walk_wait()
end
xfkzoutgo = function()
    EnableTriggerGroup("xfkz", false)
    DeleteTriggerGroup("xfkz")
    exe('out;down;n')
    return walk_wait()
end
xfkzoutgosleep = function()
    exe('north')
    fastLocate()
    return checkWait(xfkzout1, 0.3)
end
xfkzout1 = function()
    DeleteTriggerGroup("xfkz")
    create_trigger_t('xfkz1', '^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$', '', 'xfkzoutgo')
    create_trigger_t('xfkz2', '^>*\\s*��С��һ�µ���¥��ǰ������һ���������ţ����ס����$', '', 'xfkzsleepgogo')
    SetTriggerOption("xfkz1", "group", "xfkz")
    SetTriggerOption("xfkz2", "group", "xfkz")
    if locl.room_relation == '���֣�ϲ����ջϲ����ջ' then
        exe('up;enter;sleep')
    else
        return xfkzsleepgo()
    end
end
xfkzsleepgogo = function()
    EnableTriggerGroup("xfkz", false)
    DeleteTriggerGroup("xfkz")
    exe('n')
    return walk_wait()
end
xfkzsleepgo = function()
    EnableTriggerGroup("xfkz", false)
    DeleteTriggerGroup("xfkz")
    return walk_wait()
end
-----------------------------------���ݿ͵�---------------------------------
szkedian = function()
    exe('give xiao 5 silver;up')
    return checkWait(szkedian1, 0.15)
end
szkedian1 = function()
    if flag.find == 1 then return end
    exe('enter')
    return checkWait(szkedian2, 0.15)
end
szkedian2 = function()
    if flag.find == 1 then return end
    exe('out')
    return walk_wait()
end
szkdout = function()
    exe('up;enter;out;down;w')
    return walk_wait()
end
-------------------��÷ׯ------------------------------
function inmz()
    fastLocate()
    wait.make( function()
        wait.time(3)
        if flag.find == 1 then return end
        return inmzcheck()
    end )
end
function inmzcheck()
    if locl.room_relation == 'С·��С·��÷��С·' then
        exe('s')
        if flag.find == 1 then return end
        return walk_wait()
    else
        if flag.find == 1 then return end
        return go_locate()
    end
end
-----------------------------------------------��÷��-------------------------------------
function mlOutt()
    exe('look')
    wait.make( function()
        wait.time(2.5)
        if flag.find == 1 then return end
        exe('n')
        return mloutdo()
    end )
end
function mloutdo()
    fastLocate()
    wait.make( function()
        wait.time(1)
        if flag.find == 1 then return end
        if locl.room ~= '÷��' then
            return walk_wait()
        else
            return mlOut()
        end
    end )
end
function mlOut()
    tmp.way = "north"
    tmp.ml = "out"
    exe('w;e;n')
    fastLocate()
    return checkWait(wayMl, 0.1)
end
function wayMl()
    local ways = {
        ["north"] = "east",
        ["east"] = "south",
        ["south"] = "west",
        ["west"] = "north",
    }
    local wayt = {
        ["north"] = "west",
        ["east"] = "north",
        ["south"] = "east",
        ["west"] = "south",
    }
    if not tmp.way or not ways[tmp.way] then
        tmp.way = 'south'
    end
    if locl.room == "��ʯ���·" then
        if tmp.ml and tmp.ml == "in" then
            return wayMlOver()
        else
            tmp.way = "north"
            exe(tmp.way)
            fastLocate()
            return checkWait(wayMl, 0.07)
        end
    end
    if locl.room == "С·" then
        if tmp.ml and tmp.ml == "out" then
            return wayMlOver()
        else
            tmp.way = "south"
            exe('south;south')
            locate()
            return checkWait(wayMl, 0.1)
        end
    end
    if locl.room ~= "С·" and locl.room ~= "��ʯ���·" and locl.room ~= "÷��" then
        return wayMlOver()
    end
    tmp.way = ways[tmp.way]
    while not locl.exit[tmp.way] do
        Note(tmp.way)
        tmp.way = wayt[tmp.way]
    end
    exe(tmp.way)
    fastLocate()
    return checkWait(wayMl, 0.1)
end
function wayMlOver()
    return walk_wait()
end
-------------------------------------------------------------------------------------------
hscaidi = function()
    DeleteTriggerGroup("hscaidi")
    create_trigger_t('hscaidi1', '^>*\\s*��� "action" �趨Ϊ "�뿪�˵�����" �ɹ���ɡ�$', '', 'hscaidi_goon')
    create_trigger_t('hscaidi2', '^>*\\s*������\\s*\\-', '', 'hscaidi_out')
    SetTriggerOption("hscaidi1", "group", "hscaidi")
    SetTriggerOption("hscaidi2", "group", "hscaidi")
    flag.find = 0
    road.temp = 0
    exe('n;alias action �뿪�˵�����')
end
hscaidi_goon = function()
    if flag.find == 1 then
        EnableTriggerGroup("hscaidi", false)
        return walk_wait()
    else
        road.temp = road.temp + 1
        if road.temp > 100 then
            dis_all()
            return check_heal()
        end
        wait.make( function()
            wait.time(0.5)
            exe('n;alias action �뿪�˵�����')
        end )
    end
end
hscaidi_out = function()
    EnableTriggerGroup("hscaidi", false)
    return walk_wait()
end
-----------------------�¹Ȼ��ٹ��------------------
eaea = function()
    locate_finish = 0
    fastLocate()
    return check_bei(eaea_start, 0.5)
end
eaea_start = function()
    if string.find(locl.room, '�¹Ȼ��ٹ��') then
        exe('east')
        return eaea_over()
    else
        return go(road.act)
    end
end
eaea_over = function()
    return walk_wait()
end

eaeab = function()
    locate_finish = 0
    fastLocate()
    return check_bei(eaea_startb, 0.5)
end
eaea_startb = function()
    if string.find(locl.room, '�¹Ȼ��ٹ��') then
        exe('west')
        return eaea_overb()
    else
        return go(road.act)
    end
end
eaea_overb = function()
    return walk_wait()
end

eaeac = function()
    locate_finish = 0
    fastLocate()
    return check_bei(eaea_startc, 0.5)
end
eaea_startc = function()
    if string.find(locl.room, '�¹Ȼ��ٹ��') then
        exe('northwest')
        return eaea_overc()
    else
        return go(road.act)
    end
end
eaea_overc = function()
    return walk_wait()
end

eaead = function()
    locate_finish = 0
    fastLocate()
    return check_bei(eaea_startd, 0.5)
end
eaea_startd = function()
    if string.find(locl.room, '�¹Ȼ��ٹ��') then
        exe('north')
        return eaea_overd()
    else
        return go(road.act)
    end
end
eaea_overd = function()
    return walk_wait()
end
----------------------------------�������------------------------------------
check_yilitriger = function()
    DeleteTriggerGroup("yilidoorr")
    -- create_trigger_t('yilidoorr1','^>*\\s*Ҫ��ʲô','','yilidoor_close')
    -- create_trigger_t('yilidoorr2','^>*\\s*������','','yilidoor_open')
    create_trigger_t('yilidoorr3', "^(> )*(��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)", '', 'yilicheckwd')
    -- SetTriggerOption("yilidoorr1","group","yilidoorr")
    -- SetTriggerOption("yilidoorr2","group","yilidoorr")
    SetTriggerOption("yilidoorr3", "group", "yilidoorr")
    EnableTriggerGroup("yilidoorr", false)
end
yilicheckwd = function()
    -- check_yilitriger()
    -- EnableTriggerGroup("yilidoorr",true)
    -- exe('look north')
    fastLocate()
    if flag.find == 1 then return end
    wait.make( function()
        wait.time(0.5)
        return yilidoor_checkk()
    end )
end
yilidoor_close = function()
    exe('lianfc;yun jingli;yun qi;dazuo ' .. hp.dazuo)
end
yilidoor_open = function()
    wdyilidz = 0

end
yilidoor_checkk = function()
    if locl.room_relation == '�ϳ��ţ�������ϳ���' then
        wait.make( function()
            wait.time(1)
            return yilicheckwd()
        end )
    elseif locl.room_relation == '�����ģ��ϳ��ţ�������ϳ���' then
        -- EnableTriggerGroup("yilidoorr",false)
        return check_halt(yilidoor_over)
    else
        return go_locate()
    end
end
yilidoor_over = function()
    exe('n')
    if flag.find == 1 then return end
    return walk_wait()
end
yilicheckwds = function()
    fastLocate()
    if flag.find == 1 then return end
    wait.make( function()
        wait.time(0.5)
        return yilidoor_checkks()
    end )
end
yilidoor_checkks = function()
    if locl.room == '�ϳ���' then
        return check_halt(yilidoor_overs)
    else
        return go_locate()
    end
end
yilidoor_overs = function()
    exe('s')
    if flag.find == 1 then return end
    return walk_wait()
end
duhe_trigger = function()
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTriggerGroup("duhe")
    create_trigger_t('duhe1', '^>*\\s*�����ǰ�̤�Ű�������', '', 'duhe_duhe')
    create_trigger_t('duhe2', '^>*\\s*˵�Ž�һ��̤�Ű���ϵ̰����γ�һ����ȥ', '', 'duhe_out')
    create_trigger_t('duhe3', '^>*\\s*(��|��)��̫���ˣ����û����;�����ĵط�����û����Խ��ȥ��', '', 'duhe_wait')
    create_trigger_t('duhe4', '^>*\\s*��ľ���������', '', 'duhe_jingli')
    create_trigger_t('duhe5', '^>*\\s*���\\D*��Ϊ����', '', 'duhe_cannt')
    create_trigger_t('duhe6', '^>*\\s*������������ˣ�', '', 'duhe_go_enter')
    create_trigger_t('duhe7', '^>*\\s*��������������ȴ�������ϴ���Ǯ�����ˡ�', '', 'duhe_silver')
    create_trigger_t('duhe8', '^>*\\s*��һ����Ϣ����׼��(��|��)�жɴ�λ�ã�ʹ��', '', 'duhe_fly')
    create_trigger_t('duhe9', '^>*\\s*�����ǰ�̤�Ű���������������һ��', '', 'duhe_duhe')
    create_trigger_t('duhe10', '^>*\\s*һ�Ҷɴ�������ʻ�˹�����������һ��̤�Ű���ϵ̰����Ա�˿�����', '', 'duhe_enter')
    create_trigger_t('duhe11', '^>*\\s*�д������������Cool����', '', 'duhe_wait')
    create_trigger_t('duhe12', '^>*\\s*���ڽ��жɴ�������һ�㣬��������', '', 'duhe_fly')
    create_trigger_t('duhe13', "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)", '', 'duhe_jump')
    create_trigger_t('duhe14', '^>*\\s*����Ϣ���ȣ���ʱ����ʩ���ڹ���', '', 'duhe_jump')
    SetTriggerOption("duhe1", "group", "duhe")
    SetTriggerOption("duhe2", "group", "duhe")
    SetTriggerOption("duhe3", "group", "duhe")
    SetTriggerOption("duhe4", "group", "duhe")
    SetTriggerOption("duhe5", "group", "duhe")
    SetTriggerOption("duhe6", "group", "duhe")
    SetTriggerOption("duhe7", "group", "duhe")
    SetTriggerOption("duhe8", "group", "duhe")
    SetTriggerOption("duhe9", "group", "duhe")
    SetTriggerOption("duhe10", "group", "duhe")
    SetTriggerOption("duhe11", "group", "duhe")
    SetTriggerOption("duhe12", "group", "duhe")
    SetTriggerOption("duhe13", "group", "duhe")
    SetTriggerOption("duhe14", "group", "duhe")
    EnableTriggerGroup("duhe", true)
end
duHhe = function()
    if hp.neili_max > 3000 and skills['dodge'].lvl >= 200 then
        flag.duhe = 1
    else
        flag.duhe = 0
    end
    duhe_trigger()
    locate()
    return check_bei(duHhe_start)
end
duHhe_start = function()
    if string.find(locl.room, '��') then
        EnableTriggerGroup("duhe", true)
        if flag.duhe == 1 then
            return exe('yell boat;duhe')
        else
            return duhe_enter()
        end
    else
        if math.random(1, 10) > 1 then
            return go(road.act)
        else
            return duhe_over()
        end
    end
end
duhe_duhe = function()
    if flag.duhe == 1 then
        prepare_neili_stop()
        return check_bei(duhe_jump)
    end
end
duhe_jump = function()
    return exe('yun qi;yell boat;duhe')
end
duhe_go_enter = function()
    if flag.duhe == 1 then
        prepare_neili_stop()
        -- exe('set ����')
        exe('yun qi;dazuo ' .. hp.dazuo)
    end
end
duhe_enter = function()
    if flag.duhe == 0 then
        prepare_neili_stop()
        return check_bei(duhe_enter_in)
    end
end
duhe_enter_in = function()
    prepare_neili_stop()
    exe('yell boat;enter')
    locate()
    return check_busy(duhe_enter_check)
end
duhe_enter_check = function()
    if string.find(locl.room, '��') or string.find(locl.room, '��') then
        prepare_neili_stop()
    else
        exe('sxlian')
        return exe('yun qi;dazuo ' .. hp.dazuo)
    end
end
duhe_out = function()
    exe('out')
    return duhe_over()
end
duhe_over = function()
    EnableTriggerGroup("duhe", false)
    DeleteTriggerGroup("duhe")
    weapon_unwield()
    weapon_wield()
    return walk_wait()
end
duhe_wait = function()
    -- exe('set ����')
    if road.huanghe1 ~= nil and road.huanghe2 ~= nil then
        duhe_change()
        return go(road.act)
    end
    if hp.exp > 300000 then
        exe('yun jing;yun qi;yun jingli;sxlian;dazuo ' .. hp.dazuo)
    else
        exe('yun jing;yun qi;yun jingli;dazuo ' .. hp.dazuo)
    end

end
duhe_jingli = function()
    return exe('yun jingli;duhe')
end
duhe_cannt = function()
    flag.duhe = 0
    jifaDodge()
    return checkWait(duHhe_start, 0.5)
end
duhe_silver = function()
    EnableTriggerGroup("duhe", false)
    exe('dig')
    return check_bei(duHhe)
end
duhe_fly = function()
    return check_bei(duhe_over)
end
dujiang_trigger = function()
    EnableTriggerGroup("prepare_neili", false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTriggerGroup("dujiang")
    -- create_trigger_t('dujiang1','^(> )*�����ˮ̫��̫������ɲ���ȥ��','','')
    create_trigger_t('dujiang2', '^(> )*(�ɴ��͵�һ���Ѿ�����|����˵���������ϰ��ɡ�)', '', 'dujiang_out')
    create_trigger_t('dujiang3', '^(> )*(��|��)��̫���ˣ����û����;�����ĵط�����û����Խ��ȥ��', '', 'dujiang_wait')
    create_trigger_t('dujiang4', '^(> )*��ľ��������ˣ�', '', 'dujiang_jingli')
    create_trigger_t('dujiang5', '^(> )*���\\D*��Ϊ����', '', 'dujiang_cannt')
    create_trigger_t('dujiang6', '^(> )*������������ˣ�', '', 'dujiang_go_enter')
    create_trigger_t('dujiang7', '^(> )*�����ˮ̫��̫������ɲ���ȥ��', '', 'dujiang_move')
    create_trigger_t('dujiang8', '^(> )*��һ����Ϣ����׼��(��|��)�жɴ�λ�ã�ʹ��', '', 'dujiang_fly')
    create_trigger_t('dujiang9', '^(> )*����(��|)��̤�Ű���', '', 'dujiang_dujiang')
    create_trigger_t('dujiang10', '^(> )*һ�Ҷɴ�������ʻ�˹�����������һ��̤�Ű���ϵ̰����Ա�˿�����', '', 'dujiang_enter')
    create_trigger_t('dujiang11', '^(> )*�д������������Cool����', '', 'dujiang_wait')
    create_trigger_t('dujiang12', '^(> )*���ڽ��жɴ�������һ�㣬��������', '', 'dujiang_fly')
    create_trigger_t('dujiang13', "^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)", '', 'dujiang_jump')
    create_trigger_t('dujiang14', '^>*\\s*����Ϣ���ȣ���ʱ����ʩ���ڹ���', '', 'dujiang_jump')
    -- SetTriggerOption("dujiang1","group","dujiang")
    SetTriggerOption("dujiang2", "group", "dujiang")
    SetTriggerOption("dujiang3", "group", "dujiang")
    SetTriggerOption("dujiang4", "group", "dujiang")
    SetTriggerOption("dujiang5", "group", "dujiang")
    SetTriggerOption("dujiang6", "group", "dujiang")
    SetTriggerOption("dujiang7", "group", "dujiang")
    SetTriggerOption("dujiang8", "group", "dujiang")
    SetTriggerOption("dujiang9", "group", "dujiang")
    SetTriggerOption("dujiang10", "group", "dujiang")
    SetTriggerOption("dujiang11", "group", "dujiang")
    SetTriggerOption("dujiang12", "group", "dujiang")
    SetTriggerOption("dujiang13", "group", "dujiang")
    SetTriggerOption("dujiang14", "group", "dujiang")
    EnableTriggerGroup("dujiang", true)
end
duCjiang = function()
    if hp.neili_max > 3500 and skills['dodge'].lvl >= 200 then
        flag.dujiang = 1
    else
        flag.dujiang = 0
    end
    dujiang_trigger()
    locate()
    return check_bei(duCjiang_check)
end
duCjiang_check = function()
    if string.find(locl.room, '���Ϲٵ�') then
        exe('halt;n')
        return duCjiang_start()
    else
        return duCjiang_start()
    end
end
duCjiang_start = function()
    if string.find(locl.room, '��') then
        EnableTriggerGroup("dujiang", true)
        if flag.dujiang == 1 then
            return exe('yell boat;dujiang')
        else
            return dujiang_enter()
        end
    else
        if math.random(1, 10) > 1 then
            return go(road.act)
        else
            return dujiang_over()
        end
    end
end
dujiang_dujiang = function()
    if flag.dujiang == 1 then
        prepare_neili_stop()
        return check_bei(dujiang_jump)
    end
end
dujiang_jump = function()
    exe('yun qi;yell boat;dujiang')
end
dujiang_go_enter = function()
    if flag.dujiang == 1 then
        -- exe('set ����')
        exe('yun qi;dazuo ' .. hp.dazuo)
    end
end
dujiang_enter = function()
    if flag.dujiang == 0 then
        prepare_neili_stop()
        return check_bei(dujiang_enter_in)
    end
end
dujiang_enter_in = function()
    prepare_neili_stop()
    exe('yell boat;enter')
    locate()
    return check_busy(dujiang_enter_check)
end
dujiang_enter_check = function()
    if string.find(locl.room, '��') or string.find(locl.room, '��') then
        return prepare_neili_stop()
    else
        exe('sxlian')
        return exe('yun qi;dazuo ' .. hp.dazuo)
    end
end
dujiang_out = function()
    exe('out')
    return dujiang_over()
end
dujiang_over = function()
    EnableTriggerGroup("dujiang", false)
    DeleteTriggerGroup("dujiang")
    weapon_unwield()
    weapon_wield()
    return walk_wait()
end
dujiang_wait = function()
    -- exe('set ����')
    if hp.exp > 2000000 then
        exe('yun jing;yun qi;yun jingli;sxlian;dazuo ' .. hp.dazuo)
    else
        exe('yun jing;yun qi;yun jingli;dazuo ' .. hp.dazuo)
    end
end
dujiang_jingli = function()
    return exe('yun jingli;dujiang')
end
dujiang_cannt = function()
    flag.dujiang = 0
    jifaDodge()
    return checkWait(duCjiang_start, 0.5)
end
dujiang_fly = function()
    -- ain
    return check_bei(dujiang_over)
end
dujiang_move = function()
    exe('e;e;w')
    return dujiang_dujiang()
end

jqgin = function()
    DeleteTriggerGroup("jqgin")
    create_trigger_t('jqgin1', '^>*\\s*��Ҫ��ʲô��', '', 'jqgin_look')
    create_trigger_t('jqgin2', '^>*\\s*һҶС�ۣ�ƮƮ����������Ϫ����������ȥ��', '', 'jqgin_jump')
    create_trigger_t('jqgin3', '^>*\\s*�ֻ��������Ϫ�ĺ��оſ��ʯӭ����������������һ�㣬��ס������ȥ·��', '', 'jqgin_out')
    create_trigger_t('jqgin4', '^>*\\s*�������������ȵ�վ����С��֮��', '', 'jqglian')
    SetTriggerOption("jqgin1", "group", "jqgin")
    SetTriggerOption("jqgin2", "group", "jqgin")
    SetTriggerOption("jqgin3", "group", "jqgin")
    SetTriggerOption("jqgin4", "group", "jqgin")
    road.temp = 0
    exe('look boat')
    create_timer_s('walkWait111', 0.5, 'jqglook')
end
jqglook = function()
    exe('look boat')
end
jqgin_look = function()
    EnableTimer('walkWait111', false)
    road.temp = road.temp + 1
    if road.temp > 20 then
        dis_all()
        check_heal()
        return
    end
    fastLocate()
    wait.make( function()
        wait.time(0.5)
        if locl.room == "СϪ��" then
            exe('look boat')
            create_timer_s('walkWait111', 0.5, 'jqglook')
        else
            return go_locate()
        end
    end )
end
jqgin_jump = function()
    EnableTimer('walkWait111', false)
    exe('jump boat')
    create_timer_s('walkWait111', 0.5, 'jqgjump')
end
jqgin_out = function()
    EnableTriggerGroup("jqgin", false)
    exe('out')
    -- thread_resume(walk)
    walk_wait()
end
jqgout = function()
    DeleteTriggerGroup("jqgout")
    create_trigger_t('jqgout1', '^>*\\s*�����ű�����ô�ƶ�С�ۣ�', '', 'jqgout_weapon')
    create_trigger_t('jqgout2', '^>*\\s*�ֻ��������Ϫ�����ۣ�С�۾������˼�������ֻص�Ϫ�ߡ�', '', 'jqgout_out')
    create_trigger_t('jqgout3', '^>*\\s*��Ҫ��˭�����������', '', 'jqgout_out')

    SetTriggerOption("jqgout1", "group", "jqgout")
    SetTriggerOption("jqgout2", "group", "jqgout")
    SetTriggerOption("jqgout3", "group", "jqgout")
    jqgout_weapon()
end
jqgout_weapon = function()
    weapon_unwield()
    exe('tui boat')
    check_halt(jgqout_jump)
end
jgqout_jump = function()
    exe('jump boat')
end
jqgout_out = function()
    EnableTriggerGroup("jqgout", false)
    DeleteTriggerGroup("jqgout")
    exe('out')
    -- thread_resume(walk)
    walk_wait()
end
jqgzlin = function()
    DeleteTriggerGroup("jqgzlin")
    create_trigger_t('jqgzlin1', '^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�', '', 'jqgzlin_goon')
    SetTriggerOption("jqgzlin1", "group", "jqgzlin")
    exe('nd')
    locate()
    check_halt(jqgzlin_con)
end
function jqgzlin_con()
    exe('alias action �뿪��������')
end
jqgzlin_goon = function()
    if locl.room ~= "����" then
        return jqgzlin_over()
    end
    local l_set = { 'east', 'west', 'south', 'north' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    exe('su;nd;wd')
    locate()
    checkWait(jqgzlin_con, 2)
end
jqgzlin_over = function()
    EnableTriggerGroup("jqgzlin", false)
    DeleteTriggerGroup("jqgzlin")
    walk_wait()
end
jqgzlout = function()
    DeleteTriggerGroup("jqgzlout")
    create_trigger_t('jqgzlout1', '^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�', '', 'jqgzlout_goon')
    SetTriggerOption("jqgzlout1", "group", "jqgzlout")
    exe('eu')
    locate()
    check_halt(jqgzlout_con)
end
function jqgzlout_con()
    exe('alias action �뿪��������')
end
jqgzlout_goon = function()
    if locl.room ~= "����" then
        return jqgzlout_over()
    end
    local l_set = { 'east', 'west', 'south', 'north' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    exe('wd;eu;su')
    locate()
    checkWait(jqgzlout_con, 2)
end
jqgzlout_over = function()
    EnableTriggerGroup("jqgzlout", false)
    DeleteTriggerGroup("jqgzlout")
    walk_wait()
end

function outJjl()
    locate()
    check_halt(outJjl_check)
end
function outJjl_check()
    if locl.room ~= '������' and locl.room ~= 'ɽ·' then
        return outJjl_over()
    else
        exe('yun jingli;yun qi;s')
        return outJjl()
    end
end
function outJjl_over()
    walk_wait()
end

function goHt()
    exe("ask gongsun zhi about �����")
    check_halt(goHt_act)
end
function goHt_act()
    exe("xian hua;zuan dao")
    walk_wait()
end

function outGb()
    locate()
    check_halt(outGb_check)
end
function outGb_check()
    if locl.room ~= "����" then
        return outGb_over()
    else
        wait.make( function()
            exe("#12s")
            wait.time(1.5)
            return outGb()
        end )
    end
end
function outGb_over()
    exe('north')
    walk_wait()
end

function toQc()
    locate()
    check_halt(toQc_check)
end
function toQc_check()
    if locl.room ~= "ɳĮ" then
        return toQc_over()
    else
        -- wait.make(function()
        exe("#5s;#5n")
        --  wait.time(1.5)
        return toQc()
        --  end)
    end
end
function toQc_over()
    walk_wait()
end

---------------
-- ain ��Ĺ����
gmmsout = function()
    DeleteTriggerGroup("gmmsout")
    create_trigger_t('gmmsout1', '^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�', '', 'gmmsout_goon')
    SetTriggerOption("gmmsout1", "group", "gmmsout")
    locate()
    exe('e;e;e;e;e;enter;s;s;s;s;s;enter;w;w;w;w;w;enter;n;n;n;n;n;enter')
    check_halt(gmmsout_con)
end
function gmmsout_con()
    locate()
    exe('alias action �뿪��������')
end
gmmsout_goon = function()
    if locl.room ~= "ʯ��" then
        exe('say �����߳�����')
        return gmmsout_over()
    end
    local l_set = { 'east', 'west', 'south', 'north' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    print(l_set[l_cnt])
    exe('get fire;enter;say �߲���ȥ...')
    locate()
    checkWait(gmmsout_con, 2)
end
gmmsout_over = function()
    EnableTriggerGroup("gmmsout", false)
    DeleteTriggerGroup("gmmsout")
    walk_wait()
end

---------------
--------------by fqyy 20170502 ��ɼ�������㷨---------------
local ZslOutArea = {
    ["��ɼ�֣���ˮ��----��ɼ��----��ɼ�֣���ɼ����ɼ��"] = { "w" },
    ["��ɼ�֣������----��ɼ��----��ɼ�֣���ɼ����ɼ��"] = { "w;s;s;s" },
    ["��ɼ�֣���ɼ��----��ɼ��----���������ɼ����ɼ��"] = { "e;s;s;s;e;e;e;e" },
    ["��ɼ�֣���ɼ��----��ɼ��----�һ������ɼ����ɼ��"] = { "e;e;e;e;e" },
}
local ZslInArea = {
    ["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = { "s", "w", "n", "e" },
    ["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = { "e", "s", "w", "n" },
    ["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = { "n", "e", "s", "w" },
    ["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = { "w", "n", "e", "s" },
}
-------------by fqyy ���㷨 20170502
local ZslMen = 0
local ZslMenRun = false
function outzsl()
    fastLocate()
    return checkWait(outzsl_check, 0.5)
end
function outzsl_check()
    ZslMenRun = false
    if locl.room == "��ɼ��" then
        tmpr = { }
        tmpr = ZslOutArea[locl.room_relation]
        if tmpr ~= nil then
            exe(tmpr[1])
            print("��ɼ�ֳ���·��" .. tmpr[1])
            walk_wait()
        else
            exe("ne;w")
            return outzsl()
        end
    else
        walk_wait()
    end
end
function tianMen()
    mjMenF(1)
end
function diMen()
    mjMenF(2)
end
function fengMen()
    mjMenF(3)
end
function leiMen()
    mjMenF(4)
end
function mjMenF(namen)
    ZslMen = namen
    -- ZslMenRun=false
    mjMen()
end
function mjMen()
    print("mjmen")
    fastLocate()
    ZslMenRun = true
    wait.make( function()
        wait.time(0.5)
        return mjMen_checkF()
    end )
end
function mjMen_checkF()
    print("mencheckf")
    ZslMenRun = false
    mjMen_check()
end
function mjMen_check()
    if ZslMenRun then
        print("mencheck:" .. locl.room .. "|wait=" .. flag.wait .. "|ZslMenRun=true")
    else
        print("mencheck:" .. locl.room .. "|wait=" .. flag.wait .. "|ZslMenRun=false")
    end
    if locl.room == "��ɼ��" then
        if flag.wait == 0 then
            if not ZslMenRun then
                local tmpr = { }
                tmpr = ZslInArea[locl.room_relation]
                if tmpr ~= nil then
                    exe(tmpr[ZslMen])
                    print("�������·��" .. tmpr[ZslMen])
                else
                    exe("n")
                end
                return mjMen()
            end
        else
            ZslMenRun = false
        end
    else
        walk_wait()
    end
end
--------------------------------------------------------------
function outZyl()
    DeleteTriggerGroup("outzyl")
    create_trigger_t('outzyl1', '^>*\\s*��� "action" �趨Ϊ "�뿪��Ҷ������" �ɹ���ɡ�', '', 'outZylCheck')
    create_trigger_t('outzyl2', '^>*\\s*���۵ð���������ҵ�����ȷ�ķ���', '', 'outZyl_over')
    SetTriggerOption("outzyl1", "group", "outzyl")
    SetTriggerOption("outzyl2", "group", "outzyl")
    -- exe('alias action �뿪��Ҷ������')
    cntr1 = countR(50)
    return outZylCheck()
end
function outZylCheck()
    wait.make( function()
        wait.time(2)
        locate()
        return check_busy(outZyl_goon, 1)
    end )
end
function outZyl_goon()
    if locl.room ~= "��Ҷ��" then
        return go(road.act)
    end
    road.zyl = road.zyl or { }
    if countTab(road.zyl) == 0 then
        road.zyl["#15e"] = true
        road.zyl["#15s"] = true
        road.zyl["#15w"] = true
        road.zyl["#15n"] = true
    end
    for p in pairs(road.zyl) do
        tmp.zyl = p
        road.zyl[p] = nil
        exe('halt;ne')
        exe(p)
        return exe('alias action �뿪��Ҷ������')
    end
end
function outZyl_over()
    EnableTriggerGroup("outzyl", false)
    road.zyl = { }
    -- road.zyl[tmp.zyl] = true
    walk_wait()
end

function dmd()
    if not tmp.dmd then
        tmp.dmd = true
        exe("s;w;n;nw;n")
    else
        exe('nw;w;e;e;s;w;n;nw;n')
    end
    locate()
    check_halt(dmd_check)
end
function dmd_check()
    if locl.room ~= "����" then
        return dmd_over()
    else
        wait.make( function()
            wait.time(1)
            return dmd()
        end )
    end
end
function dmd_over()
    walk_wait()
end

function toXcm()
    weapon_unwield()
    weaponWieldCut()
    exe("zhan tielian")
    return check_halt(toXcm_jump)
end
function toXcm_jump()
    exe("jump duimian")
    return check_halt(toXcm_over)
end
function toXcm_over()
    weapon_unwield()
    return walk_wait()
end

function outTlsSsl()
    exe("s;w;s;w")
    exe("#11 s")
    locate()
    return check_halt(outTlsSsl_check, 1)
end
function outTlsSsl_check()
    if locl.room ~= "������" and locl.room ~= "ʯ��·" then
        return outTlsSsl_over()
    else
        return outTlsSsl()
    end
end
function outTlsSsl_over()
    return walk_wait()
end

function hmyUp()
    jifaDodge()
    exe('zong')
    return check_halt(hmyUpLocate)
end
function hmyUpWait()
    exe('yun qi;dazuo ' .. hp.dazuo)
    check_busy(hmyUp)
end
function hmyUpLocate()
    locate()
    return check_halt(hmyUpCheck, 1)
end
function hmyUpCheck()
    if locl.room ~= "����ƺ" then
        return hmyUpOver()
    else
        return hmyUpWait()
    end
end
function hmyUpOver()
    return walk_wait()
end

function hmyDown()
    jifaDodge()
    exe('zong')
    check_halt(hmyDownLocate)
end
function hmyDownLocate()
    locate()
    return check_halt(hmyDownCheck, 1)
end
function hmyDownCheck()
    if locl.room ~= "�¶�" then
        return hmyDownOver()
    else
        return hmyDownWait()
    end
end
function hmyDownWait()
    exe('yun qi;dazuo ' .. hp.dazuo)
    check_busy(hmyDown)
end
function hmyDownOver()
    return walk_wait()
end

function toRyp()
    exe("whisper bu �����ĳ���£�һͳ����")
    exe("whisper bu ����ǧ�����أ�һͳ����")
    exe("whisper bu ��������Ϊ������������")
    exe("whisper bu ������ּӢ���������Ų�")
    exe("whisper bu �����������£��츣����")
    exe("whisper bu ����ս�޲�ʤ�����޲���")
    exe("whisper bu ��������ĳ���¡�����Ӣ��")
    exe("whisper bu ��������ʥ�̣��󱻲���")
    exe("wu")
    return walk_wait()
end
---------by fqyy test ���Һ�ɽ��ľ��-------------
function emeishuitan()
    exe('pa up')
    check_busy(walk_wait)
end
function outemgmc()
    DeleteTriggerGroup("outemgmc")
    create_trigger_t('outemgmc1', '^>*\\s*��� "action" �趨Ϊ "�뿪���ҹ�ľ������" �ɹ���ɡ�', '', 'outemgmcCheck')
    create_trigger_t('outemgmc2', '^>*\\s*�������߳��˹�ľ�ԡ�', '', 'outemgmc_over')
    SetTriggerOption("outemgmc1", "group", "outemgmc")
    SetTriggerOption("outemgmc2", "group", "outemgmc")
    cntr1 = countR(50)
    return outemgmcCheck()
end
function outemgmcCheck()
    wait.make( function()
        wait.time(2)
        locate()
        return check_busy(outemgmc_goon, 1)
    end )
end
function outemgmc_goon()
    if locl.room ~= "��ľ��" then
        return go(road.act)
    end
    road.zyl = road.zyl or { }
    if countTab(road.zyl) == 0 then
        road.zyl["yun jingli;ne;ne;ne;ne;ne;ne;ne;ne;ne;yue qiaobi"] = true
    end
    for p in pairs(road.zyl) do
        tmp.zyl = p
        road.zyl[p] = nil
        exe('halt;ne')
        exe(p)
        return exe('alias action �뿪���ҹ�ľ������')
    end
end
function outemgmc_over()
    EnableTriggerGroup("outemgmc", false)
    road.zyl = { }
    walk_wait()
end
function Toghz()
    exe("get axe;wield axe;wield jian;wield dao;kan guanmu;drop axe")
    if score.party and score.party == '������' and score.master == '�º���' then
        exe("ed;yue qiaobi")
    end
    return walk_wait()
end
---------by fqyy test �䵱��ɽé��---------------
function Wdmw()
    DeleteTriggerGroup("inwdmw")
    create_trigger_t('inwdmw1', '^>*\\s*����û������ˡ�', '', 'Wdmw_error')
    create_trigger_t('inwdmw2', '^>*\\s*�����ҩ���������йء�ҩ�䡻����Ϣ��', '', 'Wdmw_find')
    -- �����ҩ���������йء�ֻ�ǡ�����Ϣ��
    SetTriggerOption("inwdmw1", "group", "inwdmw")
    SetTriggerOption("inwdmw2", "group", "inwdmw")
    exe("w;d;nd;nd;nd;nd;nw;ask caiyao about ҩ��")
    -- return check_bei(Wdmw1)
end
function Wdmw_error()
    DeleteTriggerGroup("inwdmw")
    exe("se;su;su;su;su;pa up")
    return walk_wait()
end
function Wdmw_find()
    return check_bei(Wdmw1)
end
function Wdmw1()
    exe("ask caiyao about ֻ��")
    return check_bei(Wdmw2)
end
function Wdmw2()
    DeleteTriggerGroup("inwdmw")
    exe("yun jingli;w;nd;nd;nd;nd;n;n;nd;out;nd;nd;nd;ed;nd;nd;nu;nd;nd;ed;nd;ed;nd;nd;nd;nd;nd;e;se")
    return Wdmw3()
end
function Wdmw3()
    wait.make( function()
        wait.time(2)
        exe("ask tao hua about rumor")
        return check_bei(Wdmw4)
    end )
end
function Wdmw4()
    exe("yun jingli;nw;w;su;su;su;su;su;wu;su;wu;su;su;sd;su;su;wu;su;su;su;enter;su;s;s")
    return Wdmw5()
end
function Wdmw5()
    wait.make( function()
        wait.time(2)
        exe("yun jingli;su;su;su;su;e;se;su;su;su;su;pa up;e;zuan shulin")
        return walk_wait()
    end )
end
--------------by fqyy�䵱��ɽ����----------------
function OutWdhs()
    wait.make( function()
        wait.time(0.5)
        exe("halt;eu")
        return OutWdhs1()
    end )
end
function OutWdhs1()
    wait.make( function()
        wait.time(0.5)
        exe("halt;su")
        return OutWdhs2()
    end )
end
function OutWdhs2()
    wait.make( function()
        wait.time(0.5)
        exe("halt;nd;nd;")
        return OutWdhs3()
    end )
end
function OutWdhs3()
    wait.make( function()
        wait.time(0.5)
        exe("halt;su;wd;wd")
        return walk_wait()
    end )
end
-----------------by fqyy �䵱��ɽ���ִ���------
function inWdcl()
    exe("hold teng;jump down")
    return walk_wait()
end
local wdclorder = {
    ["�һ����"] = 1,
    ["��Ҷ����"] = 2,
    ["��ѩ����"] = 3,
    ["��Ҷ����"] = 4,
    ["���ֱ�Ե"] = 5,
}
local wdclOutDoorCmd = { "nw", "n", "ne", "w", "look", "e", "sw", "s", "se" }
local wdclOutAreaNum = { 1, 9, 17, 31, 42, 53, 67, 75, 83 }
local tt_step = 1
local wdclCurrentRoom = ""

function outWdcllh()
    wdclCurrentRoom = "�һ����"
    flag.times = 2
    tt_step = 1
    outWdcl1()
end
function outWdclly()
    wdclCurrentRoom = "��Ҷ����"
    tt_step = 1
    outWdcl1()
end
function outWdcljx()
    wdclCurrentRoom = "��ѩ����"
    tt_step = 1
    outWdcl1()
end
function outWdclky()
    wdclCurrentRoom = "��Ҷ����"
    tt_step = 1
    outWdcl1()
end
function outWdcl1()
    fastLocate()
    return checkWait(outWdclCheck0, 1)
end
function outWdclCheck0()
    return check_halt(outWdclCheck)
end
function outWdclCheck()
    if not wdclorder[locl.room] then
        return walk_wait()
    end
    local p, n, randomN, findRoomN
    local wdclOutDoor = {
    }
    -- print(dest.room)
    if dest.room ~= "�һ����" and dest.room ~= "��Ҷ����" and dest.room ~= "��ѩ����" and dest.room ~= "��Ҷ����" and dest.room ~= "���ֱ�Ե" then
        tt_step = 6
    end
    wdclOutDoor[1] = { }
    wdclOutDoor[2] = { }
    wdclOutDoor[3] = { }
    wdclOutDoor[4] = { }
    wdclOutDoor[5] = { }
    -- print(tt_step,locl.room,wdclCurrentRoom)
    if not(wdclorder[wdclCurrentRoom] < wdclorder[locl.room]) then
        if flag.wait == 0 then
            for i = 1, 9 do
                if i ~= 5 then
                    p = string.sub(locl.room_relation, wdclOutAreaNum[i], wdclOutAreaNum[i] + 7)
                    -- print(p)
                    table.insert(wdclOutDoor[wdclorder[p]], wdclOutDoorCmd[i])
                end
            end
            if tt_step < 6 then
                findRoomN = wdclorder[locl.room]
            else
                findRoomN = wdclorder[locl.room] + 1
            end
            randomN = table.getn(wdclOutDoor[findRoomN])
            tt_step = tt_step + 1
            if randomN ~= nil and randomN > 0 then
                dn = math.random(randomN)
                print("�����䵱��ɽ���ֳ���Ϊ" .. wdclOutDoor[findRoomN][dn] .. "���Ҵ���=" .. flag.times)
                exe(wdclOutDoor[findRoomN][dn])
            else
                findRoomN = findRoomN - 1
                randomN = table.getn(wdclOutDoor[findRoomN])
                dn = math.random(randomN)
                print("�����䵱��ɽ����û�г���ԭ������ƶ�" .. wdclOutDoor[findRoomN][dn] .. "���Ҵ���=" .. flag.times)
                exe(wdclOutDoor[findRoomN][dn])
            end
            return outWdcl1()
        end
    else
        return walk_wait()
    end
end
function wdclToHsda()
    exe("jump river")
    DeleteTriggerGroup("wdclToHsda")
    create_trigger_t('wdclToHsda1', '^>*\\s*���沨���������ڷ����˰��ߣ�����ʪ�����������˺�ˮ������', '', 'wdclToHsda2')
    SetTriggerOption("wdclToHsda1", "group", "wdclToHsda")
    EnableTriggerGroup("wdclToHsda", true)
end
function wdclToHsda2()
    EnableTriggerGroup("wdclToHsda", false)
    DeleteTriggerGroup("wdclToHsda")
    return walk_wait()
end

--------------------------------------------
function Togudi()
    exe('cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;bang song;pa down')
    locate()
    return check_busy(Goyadi, 1)
end
function Goyadi()
    if string.find(locl.room, '�ȵ�') then
        return walk_wait()
    elseif string.find(locl.room, '�±�') then
        exe("pa down")
        locate()
        return check_busy(Goyadi, 1)
    end
end
function Toqiaobi()
    exe('pa yabi')
    locate()
    return check_busy(Goqiaobi, 1)
end
function Goqiaobi()
    if string.find(locl.room, '�ͱ�') then
        return walk_wait()
    elseif string.find(locl.room, '�±�') then
        exe("pa up")
        locate()
        return check_busy(Goqiaobi, 1)
    end
end

function Totanan()
    DeleteTriggerGroup("qqs")
    create_trigger_t('qqs1', '^>*\\s*��Ҫ������Ǳ��$', '', 'qQydok')
    create_trigger_t('qqs2', '^>*\\s*�����������������޷�������Ǳ!$', '', 'qQyderorr')
    SetTriggerOption("qqs1", "group", "qqs")
    SetTriggerOption("qqs2", "group", "qqs")
    EnableTriggerGroup("qqs", true)
    exe('#15(jian shi);tiao tan')
    create_timer_s('gotanan', 4, 'qQianshui')
end
function qQianshui()
    exe('qian down')
end
function qQyderorr()
    exe('pa up;#6(drop shitou);#6(drop e);#10(jian shi);tiao tan')
    create_timer_s('gotanan', 4, 'qQianshui')
end
function qQydok()
    DeleteTriggerGroup("qqs")
    DeleteTimer('gotanan')
    exe('#20(drop stone);qian zuoshang')
    return check_busy(qQup, 1)
end
function qQup()
    exe("qian up")
    return check_busy(qQsover, 1)
end
function qQsover()
    exe("pa up")
    exe("#5(drop stone)")
    return walk_wait()
end
----------------------------------------------------------
function Hgudi()
    locate_finish = 'Hgudigo'
    return fastLocate()
end
function Hgudigo()
    locate_finish = 0
    wait.make( function()
        wait.time(3)
        if locl.room == 'ˮ̶����' then
            return check_halt(Hgudii)
        else
            return go_locate()
        end
    end )
end
function Hgudii()
    exe("#20(jian shi);tiao tan")
    locate_finish = 0
    return Hyadi1()
end
function Hyadi1()
    DeleteTriggerGroup("qqs")
    create_trigger_t('qqs1', '^>*\\s*��Ҫ������Ǳ��$', '', 'hhqok')
    create_trigger_t('qqs2', '^>*\\s*�����������������޷�������Ǳ!$', '', 'hQyderror')
    create_trigger_t('qqs3', '^>*\\s*����ˮ���ϵĹȵ�������ȥ��$', '', 'yangguoout')
    SetTriggerOption("qqs1", "group", "qqs")
    SetTriggerOption("qqs2", "group", "qqs")
    EnableTriggerGroup("qqs", true)
    exe('qian down')
    create_timer_s('hyadi', 2, 'hQianshui1')
end
function Hyadi()
    if string.find(locl.room, '�ȵ�ˮ̶') then
        DeleteTriggerGroup("qqs")
        create_trigger_t('qqs1', '^>*\\s*��Ҫ������Ǳ��$', '', 'hhqok')
        SetTriggerOption("qqs1", "group", "qqs")
        EnableTriggerGroup("qqs", true)
        exe('#20(drop stone)')
        create_timer_s('hyadi', 3, 'hQianshui')
    else
        DeleteTriggerGroup("qqs")
        create_trigger_t('qqs1', '^>*\\s*��Ҫ������Ǳ��$', '', 'hhqok')
        create_trigger_t('qqs2', '^>*\\s*�����������������޷�������Ǳ!$', '', 'hQyderror')
        SetTriggerOption("qqs1", "group", "qqs")
        SetTriggerOption("qqs2", "group", "qqs")
        EnableTriggerGroup("qqs", true)
        create_timer_s('hyadi', 3, 'hQianshui1')
    end
end

function hQyderror()
    DeleteTimer('hyadi')
    exe('pa up;#5(drop shitou);#5(drop e)')
    wait.make( function()
        wait.time(1)
        exe('#5(jian shi);tiao tan;qian down')
        return Hyadi1()
    end )
end
function hQianshui()
    exe('qian up;pa up')
end
function hQianshui1()
    exe('qian down')
end
function hhqok()
    DeleteTriggerGroup("hqs")
    DeleteTimer('hyadi')
    exe("#20(drop stone)")
    create_timer_s('hyadi', 2, 'hQianshui')
end
function yangguoout()
    DeleteTriggerGroup("hqs")
    DeleteTimer('hyadi')
    exe('pa up')
    return walk_wait()
end
----------------------------------------------------------------
function Fqy()
    exe("enter")
    return walk_wait()
end
function Inwdj()
    exe("northup")
    return walk_wait()
end
---------by fqyy test �������߿�----------
function Insldsk()
    exe("#10(kan ɽ��);climb")
    return walk_wait()
end
function Outsldsk()
    exe("drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi;wear all;go east;go east;go east;go east")
    return walk_wait()
end
------------------------------------------
function boatYell()
    exe("yell boat;;enter")
    locate()
    tmp.cnt = 0
    DeleteTimer('boat')
    create_timer_s('boat', 3, 'boatInCheck')
end
function boatInCheck()
    DeleteTimer('boat')
    exe('yell boat;enter')
    if string.find(locl.room, '��') or string.find(locl.room, '��') then
        return boatWait()
    elseif string.find(locl.room, '������') then
        exe('south;#3w;#2e;#3s;qu xiaozhu')
        locate()
        return create_timer_s('boat', 3, 'boatInCheck')
    elseif string.find(locl.room, '����') or string.find(locl.room, 'С����') then
        locate()
        return create_timer_s('boat', 3, 'boatInCheck')
    else
        return go(road.act)
    end
end
function boatWait()
    DeleteTimer('boat')
    boatOutTrigger()
    create_timer_s('boat', 20, 'boatCheck')
end
function CboatWait()
    DeleteTimer('boat')
    create_timer_s('boat', 10, 'Checkloboat')
end
function Checkloboat()
    DeleteTimer('boat')
    locate()
    create_timer_s('boat', 2, 'Checkboat')
end
function Checkboat()
    if string.find(locl.room, '��') or string.find(locl.room, '��') then
        return boatCheck()
    elseif string.find(locl.room, '����') then
        exe('qu xiaozhu')
        return create_timer_s('boat', 3, 'Checkloboat')
    else
        return go(road.act)
    end
end
function boatCheck()
    DeleteTimer('boat')
    locate()
    return check_halt(boatOutCheck)
end
function boatReCheck()
    DeleteTimer('boat')
    boatOutTrigger()
    create_timer_s('boat', 2, 'boatCheck')
end
function boatOutCheck()
    DeleteTimer('boat')
    local cnt = table.getn(exit.locl)
    if cnt == 0 then
        check_halt(boatReCheck)
    else
        return boatOut()
    end
end
function boatOutTrigger()
    DeleteTriggerGroup("boat")
    create_trigger_t('boat1', '^(> )*(�����С�ۿ��ڰ��ߣ����´��ɡ�|����˵���������ϰ��ɡ����漴��һ��̤�Ű���ϵ̰���|���ڵ���С���ߣ������С�ۿ��ڰ��ߣ����´��ɡ�|���ڵ��˰��ߣ������С�ۿ��ڰ��ߣ����´��ɡ�)', '', 'boatOut')
    SetTriggerOption("boat1", "group", "boat")
end
function boatOut()
    EnableTimer('boat', false)
    DeleteTimer('boat')
    exe("out")
    walk_wait()
end

function outJgzW()
    return outJgz()
end
function outJgzE()
    return outJgz()
end 
function outJgz()
    DeleteTriggerGroup("jiugz")
    create_trigger_t('jiugz1', '^>*\\s*����һƬï�ܵ��һ��ԣ���һ�߽�������ʧ�˷��򡣵�����(\\D*)���һ�\\(taohua\\)��$', '', 'outJgzGet')
    create_trigger_t('jiugz2', '^>*\\s*����һƬï�ܵ��һ��ԣ���һ�߽�������ʧ�˷��򡣵���һ���һ�\\(taohua\\)Ҳû�С�$', '', 'outJgzGo')
    SetTriggerOption("jiugz1", "group", "jiugz")
    SetTriggerOption("jiugz2", "group", "jiugz")
    EnableTriggerGroup("jiugz", false)
    exe('w;w;n;n')
    return outJgzTaohua(1)
end
function outJgzTaohua(p_cnt)
    if p_cnt then tmp.i = p_cnt else tmp.i = tmp.i + 1 end
    if tmp.i == 2 then exe('e') end
    if tmp.i == 3 then exe('e') end
    if tmp.i == 4 then exe('s') end
    if tmp.i == 5 then exe('w') end
    if tmp.i == 6 then exe('w') end
    if tmp.i == 7 then exe('s') end
    if tmp.i == 8 then exe('e') end
    if tmp.i == 9 then exe('e') end
    if tmp.i == 10 then
        return outJgzDrop()
    end
    EnableTriggerGroup("jiugz", true)
    exe('look')
end
function outJgzGet(n, l, w)
    EnableTriggerGroup("jiugz", false)
    exe('get ' .. trans(w[1]) .. ' taohua')
    return check_halt(outJgzTaohua)
end
function outJgzGo()
    EnableTriggerGroup("jiugz", false)
    return check_halt(outJgzTaohua)
end
function outJgzDrop()
    exe('w;w;n;n')
    exe('drop 2 taohua')
    exe('e')
    exe('drop 9 taohua')
    exe('e')
    exe('drop 4 taohua')
    exe('s')
    exe('drop 3 taohua')
    exe('w')
    exe('drop 5 taohua')
    exe('w')
    exe('drop 7 taohua')
    exe('s')
    exe('drop 6 taohua')
    exe('e')
    exe('drop 1 taohua')
    exe('e')
    exe('drop 8 taohua')
    locate()
    return check_halt(outJgzCheck)
end
function outJgzCheck()
    if locl.room == "�Ź��һ���" then
        return outJgz()
    else
        return outJgzOver()
    end
end
function outJgzOver()
    EnableTriggerGroup("jiugz", false)
    DeleteTriggerGroup("jiugz")
    return walk_wait()
end

function wdYm()
    DeleteTriggerGroup("wdxj")
    create_trigger_t('wdxj1', '^>*\\s*��վ��С���ϣ����ܴ������·𿴼�(\\D*)����Щ���⡣$', '', 'wdYmGo')
    SetTriggerOption("wdxj1", "group", "wdxj")
    exe('s')
    locate()
    check_halt(wdYmCheck)
    tmp.i = 1
end
function wdYmCheck()
    DeleteTimer("wdxjTimer")
    if locl.room ~= "С��" then
        return wdYmOver()
    end
    create_timer_s('wdxjTimer', 16, 'wdYmRandom')
end
function wdYmRandom()
    tmp.i = tmp.i + 1
    exe('n;n;n;n;n;n;n;n;n;s;s;s;s;s;s')
    fastLocate()
    wait.make( function()
        wait.time(0.5)
        check_halt(wdYmCheck)
    end )
end
function wdYmGo(n, l, w)
    if flag.wait == 0 then
        local l_dir
        DeleteTimer("wdxjTimer")
        if w[1] == "��" then l_dir = 'e' end
        if w[1] == "��" then l_dir = 'w' end
        if w[1] == "��" then l_dir = 's' end
        if w[1] == "��" then l_dir = 'n' end
        exe("halt;" .. l_dir)
        fastLocate()
        wait.make( function()
            wait.time(0.5)
            check_halt(wdYmCheck)
        end )
    end
end
function wdYmOver()
    DeleteTimer("wdxjTimer")
    EnableTriggerGroup("wdxj", false)
    walk_wait()
end
----------by fqyy 20170504 ������������----------------
local mjslOutArea = {
    ["���֣�����-----����-----���֣����������"] = "s",
    ["���֣������-----����-----���֣���������"] = "w",
    ["�����������-----����-----���֣���������"] = "n",
    ["���֣�����-----����-----���������������"] = "e",
}
local mjslOutArea1 = {
    ["���֣�����-----����-----��ľ�����������"] = true,
}
local mjslOutArea4 = {
    ["���֣���ľ��-----����-----���֣����������"] = true,
}
local mjslOutAreaFlag = 1;
function mjSlout1()
    mjslOutAreaFlag = 1
    mjSlout()
end
function mjSlout4()
    mjslOutAreaFlag = 4
    mjSlout()
end
function mjSlout()
    fastLocate()
    wait.make( function()
        wait.time(0.5)
        check_halt(mjSloutCheck)
    end )
end
function mjSloutCheck()
    if flag.wait == 0 then
        if locl.room == "����" then
            if mjslOutArea1[locl.room_relation] then
                if mjslOutAreaFlag == 1 then
                    exe("s")
                else
                    exe("e;e;n")
                end
                return mjSlout()
            end
            if mjslOutArea4[locl.room_relation] then
                if mjslOutAreaFlag == 4 then
                    exe("n")
                else
                    exe("w;w;s")
                end
                return mjSlout()
            end
            local tmpsl = mjslOutArea[locl.room_relation]
            if tmpsl ~= nil then
                exe(tmpsl)
                print("�������ֳ���" .. tmpsl)
            end
            return mjSlout()
        else
            walk_wait()
        end
    end
end

---------------------------------------------

function PoutShangguan()
    DeleteTriggerGroup("tiezhangsg")
    create_trigger_t('tiezhangsg1', '^(> )*������������������˿�������Ĺ�������������ƿ���', '', 'ShangguanOk')
    create_trigger_t('tiezhangsg2', '^(> )*���в�ѽ��û����Ĺ����ʲô����', '', 'ShangguanAsk')
    create_trigger_t('tiezhangsg3', '^(> )*��һЩ����˵�����������������ϵķ�Ĺ�У������������ٺ٣�һ����ʲô���������棡', '', 'GoShangguan')
    create_trigger_t('tiezhangsg4', '^(> )*����û������ˡ�', '', 'GoShangguanQiuError')
    SetTriggerOption("tiezhangsg1", "group", "tiezhangsg")
    SetTriggerOption("tiezhangsg2", "group", "tiezhangsg")
    SetTriggerOption("tiezhangsg3", "group", "tiezhangsg")
    SetTriggerOption("tiezhangsg4", "group", "tiezhangsg")
    EnableTriggerGroup("tiezhangsg", true)
    -- return check_busy(GoShangguan)
    exe("move bei")
end
function ShangguanAsk()
    exe("sd;se;sd;sd;se;sd;se;sd;sd;s;s;s;sd;e;ask qianzhang about �ֹ�")
end
function GoShangguan()
    return check_halt(GoShangguanOk)
end
function GoShangguanOk()
    exe("sd;sd;n;n;nw;w;w;e;nu;n;n;n;nu;nu;nw;nu;nw;nu;nu;nw;nu;move bei")
end
function GoShangguanQiuError()
    EnableTrigger("tiezhangsg4", false)
    exe("se;ask qianzhang about �ֹ�;nw;w;ask qianzhang about �ֹ�;w;ask qianzhang about �ֹ�;e;nu;ask qianzhang about �ֹ�;sd;s;ask qianzhang about �ֹ�;n;e")
end
function ShangguanOk()
    EnableTriggerGroup("tiezhangsg", false)
    DeleteTriggerGroup("tiezhangsg")
    exe('move bei;enter')
    return walk_wait()
end
function ptoSld()
    exe('yell ������鸣����')
    checkWait(ptoSldCheck, 2)
end
function ptoSldCheck()
    locate()
    check_halt(ptosldDukou, 2)
end
function ptosldDukou()
    if locl.room == "�ɿ�" then
        return toSldOver()
    elseif locl.room ~= "����" then
        return walk_wait()
    else
        return checkWait(ptoSldCheck, 2)
    end
end
sld_unwield = function()
    for p in pairs(Bag) do
        if Bag[p].kind and(not itemWield or itemWield[p]) then
            local _, l_cnt = isInBags(Bag[p].fullid)
            for i = 1, l_cnt do
                exe('unwield ' .. Bag[p].fullid .. ' ' .. i)
            end
        end
    end
end
sld_weaponWieldCut = function()
    for p in pairs(Bag) do
        if Bag[p].kind and weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind] == "cut" then
            if not(Bag[p].kind == "xiao" and weaponUsave[p]) then
                for q in pairs(Bag) do
                    if Bag[q].kind == "xiao" and weaponUsave[q] then
                        exe('unwield ' .. Bag[q].fullid)
                    end
                end
                exe('wield ' .. Bag[p].fullid)
            end
        end
    end
end
function toSld()
    locate()
    wait.make( function()
        wait.time(1)
        if locl.room == '��̲' then
            sld_unwield()
            sld_weaponWieldCut()
            if not Bag["������"] then
                exe('buy cu shengzi')
                exe('drop cu shengzi 2')
            end
            exe('get cu shengzi')
            exe('drop cu shengzi 2')
            return check_halt(toSldTrigger)
        else
            return go_locate()
        end
    end )
end
function toSldTrigger()
    DeleteTriggerGroup("mufabusy")
    create_trigger_t('mufabusy1', '^(> )*ľ����û����ʵ�����������ɡ�', '', 'wait_mufa')
    create_trigger_t('mufabusy2', '^(> )*ֻ��(\\D*)����һԾ��������ľ���ϡ�', '', 'mufaok')
    create_trigger_t('mufabusy3', '^(> )*�����û�����������ֿ���', '', 'sld_need_weapon')
    create_trigger_t('mufabusy4', '^(> )*��Ҫ��ʲô��', '', 'wait_mufa')
    create_trigger_t('mufabusy5', '^*ʲô��', '', 'wait_mufa')
    create_trigger_t('mufabusy6', '^(> )*������ľ���ϵ�һ��ľͷ����ľ����ǰ��ȥ��', '', 'toSldHua')
    SetTriggerOption("mufabusy1", "group", "mufabusy")
    SetTriggerOption("mufabusy2", "group", "mufabusy")
    SetTriggerOption("mufabusy3", "group", "mufabusy")
    SetTriggerOption("mufabusy4", "group", "mufabusy")
    SetTriggerOption("mufabusy5", "group", "mufabusy")
    SetTriggerOption("mufabusy6", "group", "mufabusy")
    EnableTriggerGroup("mufabusy", true)
    toSldChop()
end
function toSldChop()
    exe('chop tree;bang mu tou;zuo mufa')
end
function toSldDelTrigger()
    DeleteTriggerGroup("mufabusy")
end
function sld_need_weapon()
    wait.make( function()
        wait.time(1)
        sld_unwield()
        sld_weaponWieldCut()
        return check_bei(toSldChop)
    end )
end
function wait_mufa()
    wait.make( function()
        wait.time(0.2)
        return check_bei(toSldChop)
    end )
end
function mufaok(n, l, w)
    print("mufaokw--" .. w[2])
    if string.find(w[2], "��") then
        print("mufaokw--toslddk")
        EnableTriggerGroup("mufabusy", false)
        DeleteTriggerGroup("mufabusy")
        toSldDukou()
    else
        sld_need_weapon()
    end
end
function toSldCheck()
    print("toSldCheck")
    if locl.room == "Сľ��" or locl.room == "ľ��" then
        return toSldHua()
    else
        return check_halt(toSld)
    end
end
function toSldHua()
    print("toSldHua")
    sld_unwield()
    exe('hua mufa')
    wait.make( function()
        wait.time(3)
        return toSldDukou()
    end )
end
function toSldDukou()
    print("toSldDukou")
    fastLocate()
    wait.make( function()
        wait.time(2)
        return toSldDkCheck()
    end )
end
function toSldDkCheck()
    print("toSldDkCheck")
    toSldDelTrigger()
    if locl.room == "�ɿ�" then
        return toSldOver()
    elseif locl.room == "Сľ��" or locl.room == "ľ��" then
        return toSldHua()
    elseif locl.area and locl.area == '������' and locl.room == '��̲' then
        return toSld()
    elseif locl.area and locl.area ~= '������' then
        return walk_wait()
    end
end
function toSldOver()
    return walk_wait()
end

function outSld()
    if score.party and score.party == "������" then
        exe('ask lu gaoxuan about ling pai')
    else
        exe('steal lingpai')
    end
    check_busy(outSldGive)
end
function outSldGive()
    wait.make( function()
        wait.time(2)
        exe('out;#3s;give ling pai to chuan fu')
        check_busy(outSldWait, 3)
    end )
end
function outSldWait()
    wait.make( function()
        wait.time(6)
        locate()
        check_busy(outSldCheck)
    end )
end
function outSldCheck()
    if locl.room == "�ɿ�" then
        exe('#3n;enter')
        return outSld()
    else
        -- cntr1 = countR(20)
        return walk_wait()
    end
end
function outSldBoat()
    if cntr1() < 1 then
        return go(road.act)
    end
    exe('order ����')
    locate()
    return check_halt(outSldBoatCheck)
end
function outSldBoatCheck()
    if locl.room == "��̲" then
        return outSldOver()
    else
        return checkWait(outSldBoat, 3)
    end
end
function outSldOver()
    walk_wait()
end

function outHeiw()
    exe('repent')
    locate()
    check_bei(outHeiwCheck)
end
function outHeiwCheck()
    if locl.room ~= "����" then
        return outHeiwOver()
    end
    checkWait(outHeiw, 15)
end
function outHeiwOver()
    walk_wait()
end

--[[function goXtj()
    DeleteTriggerGroup("goxtj")
    create_trigger_t('goxtj1',"^(> )*����\\s*\\-",'','goXtjShulin')
    create_trigger_t('goxtj2',"^(> )*ɽ·\\s*\\-",'','goXtjShanlu')
    SetTriggerOption("goxtj1","group","goxtj")
    SetTriggerOption("goxtj2","group","goxtj")
    EnableTriggerGroup("goxtj",false)

    exe('n')
    locate()
    check_halt(goXtjCheck)
end
function goXtjCheck()
    if locl.room~="����" then
       return goXtjOver()
    end

    tmp.goxtj=0
    EnableTriggerGroup("goxtj",true)
    exe('l east;l south;l west;l north')
end
function goXtjShulin()
    if not tmp.goxtj then tmp.goxtj=0 end
    tmp.goxtj = tmp.goxtj + 1
    if tmp.goxtj>3 then
       EnableTriggerGroup("goxtj",false)
       checkWait(goXtjGo,1.5)
    end
end
function goXtjShanlu()
    EnableTriggerGroup("goxtj",false)
    if not tmp.goxtj then tmp.goxtj=0 end
    if tmp.goxtj==1 then
       exe('s')
    end
    exe('n')
    locate()
    checkWait(goXtjCheck,1)
end
function goXtjGo()
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(goXtjCheck)
end]]
------------------------------------------------����Ĺ����������------------------------------------------------
function goXtj()
    exe('n')
    if flag.find == 1 then return end
    locate_finish = 'goxtjck'
    return fastLocate()
end
function goxtjck()
    locate_finish = 0
    if flag.find == 1 then return end
    wait.make( function()
        wait.time(0.3)
        if locl.room_relation == 'ɽ·������-----����-----���֣���������' or locl.room_relation == 'ɽ·��ɽ·��ɽ·ɽ·' then
            return goXtjOver()
        end
        if locl.room_relation == 'ɽ·��ɽ·�Kɽ��յ�ɽ·' then
            exe('n')
            return goXtj()
        end
        return goXtjGo()
    end )
end
function goXtjGo()
    local l_set = { 'e', 's', 'w', 'n' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    return goXtj()
end
function goXtjOver()
    walk_wait()
end
-------------------------------------------------����Ĺ����������----------------------------------------------------------
function outXtj()
    exe('s')
    if flag.find == 1 then return end
    locate_finish = 'outxtjck'
    return fastLocate()
end
function outxtjck()
    locate_finish = 0
    if flag.find == 1 then return end
    wait.make( function()
        wait.time(0.3)
        if locl.room_relation == 'ɽ·������-----����-----���֣���������' or locl.room_relation == 'ɽ·��ɽ·��ɽ·ɽ·' then
            exe('s')
            return outXtj()
        end
        if locl.room_relation == 'ɽ·��ɽ·�Kɽ��յ�ɽ·' or locl.room_relation == '���֣�����-----����-----���֣�ɽ·����' then
            exe('s')
            return outXtjOver()
        end
        return outXtjGo()
    end )
end
function outXtjGo()
    local l_set = { 'e', 's', 'w', 'n' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    return outXtj()
end
function outXtjOver()
    walk_wait()
end
-----------by fqyy 2017-05-24 ���޺�ɽ��
function xingxiushandong()
    DeleteTriggerGroup("xxsdAsk")
    create_trigger_t('xxsdAsk1', "^(> )*����ʨ���Ӵ����йء�fqyy������Ϣ", '', 'xxsdask')
    create_trigger_t('xxsdAsk2', "^(> )*����û������ˡ�$", '', 'xxsdover')
    create_trigger_t('xxsdAsk3', "^(> )*ʨ������־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��$", '', 'xxsdget')
    create_trigger_t('xxsdAsk4', "^(> )*ʨ���ӡ�ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$", '', 'xxsdover')
    create_trigger_t('xxsdAsk5', "^(> )*���빥��˭��$", '', 'xxsdover')
    create_trigger_t('xxsdAsk6', "^(> )*ʨ�����Ѿ��޷������ˣ�$", '', 'xxsdget')
    SetTriggerOption("xxsdAsk1", "group", "xxsdAsk")
    SetTriggerOption("xxsdAsk2", "group", "xxsdAsk")
    SetTriggerOption("xxsdAsk3", "group", "xxsdAsk")
    SetTriggerOption("xxsdAsk4", "group", "xxsdAsk")
    SetTriggerOption("xxsdAsk5", "group", "xxsdAsk")
    SetTriggerOption("xxsdAsk6", "group", "xxsdAsk")
    EnableTriggerGroup("xxsdAsk", true)
    exe("ask shihou zi about fqyy")
end
function xxsdask()
    exe("jiali max;hit shihou zi")
    create_timer_s('xxsdhit', 3, 'xxsdask1')
end
function xxsdask1()
    exe("jiali max;hit shihou zi")
end
function xxsdget()
    exe("get shihou zi;enter cave;drop shihou zi")
    inxxsd()
end
function xxsdover()
    exe("enter cave")
    inxxsd()
end
function inxxsd()
    DeleteTimer("xxsdhit")
    EnableTriggerGroup("xxsdAsk", false)
    DeleteTriggerGroup("xxsdAsk")
    return walk_wait()
end
--------------by fqyy 20170526�ƺ���������------------------
function inxiaofu()
    DeleteTriggerGroup("xiaofuask")
    create_trigger_t('xiaofuask1', "^(> )*�����η�������йء�fqyy������Ϣ", '', 'xiaofuask')
    create_trigger_t('xiaofuask2', "^(> )*����û������ˡ�$", '', 'xiaofuover')
    create_trigger_t('xiaofuask3', "^(> )*����һ�ְ���ץס��˵������һ����Ҳ��������$", '', 'xiaofugetchai')
    create_trigger_t('xiaofuask4', "^(> )*�η��ࡸž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$", '', 'xiaofuover')
    create_trigger_t('xiaofuask5', "^(> )*���빥��˭��$", '', 'xiaofuover')
    create_trigger_t('xiaofuask6', "^(> )*�η����Ѿ��޷������ˣ�$", '', 'xxsdget')
    SetTriggerOption("xiaofuask1", "group", "xiaofuask")
    SetTriggerOption("xiaofuask2", "group", "xiaofuask")
    SetTriggerOption("xiaofuask3", "group", "xiaofuask")
    SetTriggerOption("xiaofuask4", "group", "xiaofuask")
    SetTriggerOption("xiaofuask5", "group", "xiaofuask")
    SetTriggerOption("xiaofuask6", "group", "xiaofuask")
    EnableTriggerGroup("xiaofuask", true)
    exe("n")
    fastLocate()
    wait.make( function()
        wait.time(1)
        return xiaofu_check()
    end )
end
function xiaofu_check()
    if locl.room == "��������" then
        check_busy(walk_wait)
    elseif locl.room == "��������" then
        wait.make( function()
            wait.time(1)
            return xiaofu_check()
        end )
    end
end
function xiaofuask()
    check_busy(xiaofuask1)
end
function xiaofuask1()
    exe("jiali max;kill ren feiyan")
end
function xiaofuover()
    check_busy(xiaofuover1)
end
function xiaofuover1()
    exe("get chai from corpse;ne;nw;give zhang chai;n")
    DeleteTriggerGroup("xiaofuask")
    walk_wait()
end
function xiaofugetchai()
    exe("se;sw;ask ren feiyan about fqyy")
end
-----------ѩɽ �вƴ󳵵�---------------
function xsdachedian()
    DeleteTriggerGroup("xsdcd")
    create_trigger_t('xsdcd1', "^(> )*�͹��Ѿ��������ӣ���ô��ס��������أ����˻���ΪС���ź����أ�", '', 'xsdachedian1')
    create_trigger_t('xsdcd2', "^(> )*��һ��������", '', 'xsdachedian2')
    SetTriggerOption("xsdcd1", "group", "xsdcd")
    SetTriggerOption("xsdcd2", "group", "xsdcd")
    EnableTriggerGroup("xsdcd", true)
    exe("w")
    fastLocate()
    create_timer_st('xsdcdtimer', 1, 'xsdcd_check')
end
function xsdcd_check()
    if locl.room == "�ֵ�" then
        DeleteTriggerGroup("xsdcd")
        walk_wait()
    else
        xsdachedian()
    end
end
function xsdachedian1()
    DeleteTimer("xsdcdtimer")
    exe("enter;sleep")
end
function xsdachedian2()
    DeleteTimer("xsdcdtimer")
    DeleteTriggerGroup("xsdcd")
    exe("out;w")
    walk_wait()
end
------------------------------------------------------------
function toThd()
    DeleteTriggerGroup("toThd")
    create_trigger_t('toThd1', "^(> )*��ԶԶ��ȥ�����������дУ�һ���̡�һ�ź졢һ�Żơ�һ���ϣ��˵��Ƿ����ƽ���", '', 'toThdOver')
    create_trigger_t('toThd2', "^(> )*��Ҫ��˭�����������", '', 'toThdOver')
    SetTriggerOption("toThd1", "group", "toThd")
    SetTriggerOption("toThd2", "group", "toThd")
    EnableTriggerGroup("toThd", true)
    exe('l rock;jump boat')
end
function toThdOver()
    locate()
    wait.make( function()
        wait.time(1)
        return toThdCheck()
    end )
end
function toThdCheck()
    EnableTriggerGroup("toThd", false)
    if locl.room == "����" then
        walk_wait()
    else
        toThd()
    end
end
-- ����
function songlinIn()
    DeleteTriggerGroup("songlin")
    create_trigger_t('songlin1', "^(> )*������\\s*\\-", '', 'songlinInSonglin')
    create_trigger_t('songlin2', "^(> )*���ٲ�\\s*\\-", '', 'songlinInPubu')
    create_trigger_t('songlin3', "^(> )*��Ժ\\s*\\-", '', 'songlinInSonglin')
    SetTriggerOption("songlin1", "group", "songlin")
    SetTriggerOption("songlin2", "group", "songlin")
    SetTriggerOption("songlin3", "group", "songlin")
    EnableTriggerGroup("songlin", false)
    exe('n')
    cntrl = countR(100)
    locate()
    check_halt(songlinInCheck)
end
function songlinInCheck()
    if locl.room == "���ٲ�" then
        return songlinInOver()
    end
    if locl.room == "��Ժ" then
        exe('n')
    end
    tmp.songlin = 0
    EnableTriggerGroup("songlin", true)
    exe('l east;l south;l west;l north')
end
function songlinInSonglin()
    if not tmp.songlin then tmp.songlin = 0 end
    tmp.songlin = tmp.songlin + 1
    if tmp.songlin > 3 then
        EnableTriggerGroup("songlin", false)
        checkWait(songlinInGo, 1)
    end
end
function songlinInPubu()
    EnableTriggerGroup("songlin", false)
    exe('e')
    locate()
    checkWait(songlinInCheck, 1)
end
function songlinInGo()
    local l_set = { 'e', 's', 'w', 'n' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(songlinInCheck)
end
function songlinInOver()
    EnableTriggerGroup("songlin", false)
    -- DeleteTriggerGroup("songlin")
    walk_wait()
end
function songlinOut()
    DeleteTriggerGroup("songlin")
    create_trigger_t('songlin1', "^(> )*������\\s*\\-", '', 'songlinOutSonglin')
    create_trigger_t('songlin2', "^(> )*���ٲ�\\s*\\-", '', 'songlinOutPubu')
    create_trigger_t('songlin3', "^(> )*��Ժ\\s*\\-", '', 'songlinOutHouyuan')
    SetTriggerOption("songlin1", "group", "songlin")
    SetTriggerOption("songlin2", "group", "songlin")
    SetTriggerOption("songlin3", "group", "songlin")
    EnableTriggerGroup("songlin", false)
    exe('n')
    locate()
    check_halt(songlinOutCheck)
end
function songlinOutCheck()
    if locl.room == "���ٲ�" then
        exe('w;s')
        return songlinOutOver()
    end
    if locl.room == "��Ժ" then
        return songlinOutOver()
    end

    tmp.songlin = 0
    EnableTriggerGroup("songlin", true)
    exe('l east;l south;l west;l north')
end
function songlinOutSonglin()
    if not tmp.songlin then tmp.songlin = 0 end
    tmp.songlin = tmp.songlin + 1
    if tmp.songlin > 2 then
        EnableTriggerGroup("songlin", false)
        checkWait(songlinOutGo, 1)
    end
end
function songlinOutPubu()
    EnableTriggerGroup("songlin", false)
    exe('e')
    locate()
    checkWait(songlinOutCheck, 1)
end
function songlinOutHouyuan()
    EnableTriggerGroup("songlin", false)
    exe('s')
    return songlinOutOver()
end
function songlinOutGo()
    local l_set = { 'e', 's', 'w', 'n' }
    local l_cnt = math.random(1, table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(songlinOutCheck)
end
function songlinOutOver()
    EnableTriggerGroup("songlin", false)
    DeleteTriggerGroup("songlin")
    walk_wait()
end

function xsMianbi()
    if hp.shen > 0 then
        return xsMianbiOver()
    else
        exe('#20(mianbi);hp')
        return check_halt(xsMianbiChk, 1)
    end
end
function xsMianbiChk()
    if hp.shen > 0 then
        return xsMianbiOver()
    else
        exe('#20(mianbi);hp')
        return check_halt(xsMianbi, 1)
    end
end
function xsMianbiOver()
    return walk_wait()
end

function mlIn()
    tmp.way = "south"
    tmp.ml = "in"
    locate()
    return checkWait(wayMl, 0.1)
end
function mlOut()
    tmp.way = "north"
    tmp.ml = "out"
    locate()
    return checkWait(wayMl, 0.1)
end
function wayMl()
    local ways = {
        ["north"] = "east",
        ["east"] = "south",
        ["south"] = "west",
        ["west"] = "north",
    }
    local wayt = {
        ["north"] = "west",
        ["east"] = "north",
        ["south"] = "east",
        ["west"] = "south",
    }
    if not tmp.way or not ways[tmp.way] then
        tmp.way = 'south'
    end
    if locl.room == "��ʯ���·" then
        if tmp.ml and tmp.ml == "in" then
            return wayMlOver()
        else
            tmp.way = "north"
            exe(tmp.way)
            locate()
            return checkWait(wayMl, 0.1)
        end
    end
    if locl.room == "С·" then
        if tmp.ml and tmp.ml == "out" then
            return wayMlOver()
        else
            tmp.way = "south"
            exe('south;south')
            locate()
            return checkWait(wayMl, 0.1)
        end
    end
    if locl.room ~= "С·" and locl.room ~= "��ʯ���·" and locl.room ~= "÷��" then
        return wayMlOver()
    end
    tmp.way = ways[tmp.way]
    while not locl.exit[tmp.way] do
        Note(tmp.way)
        tmp.way = wayt[tmp.way]
    end
    exe(tmp.way)
    locate()
    return checkWait(wayMl, 0.2)
end
function wayMlOver()
    return walk_wait()
end

function mzDoor()
    create_trigger_f('xxdf', "^(> )*���˰��Σ����Ż����򿪣������߳���������װ��������", '', 'mzDoorHuida')
    wait.make( function()
        exe('qiao gate 4 times')
        wait.time(3)
        exe('qiao gate 2 times')
        wait.time(3)
        exe('qiao gate 5 times')
        wait.time(3)
        exe('qiao gate 3 times')
    end )
end
function mzDoorHuida()
    exe('huida �����������;show wuyue lingqi;s')
    return check_halt(mzDoorOver)
end
function mzDoorOver()
    return walk_wait()
end

---------
-- ain �����·��
---------------
ht2ss = function()
    DeleteTriggerGroup("gmout1")
    --  create_trigger_t('gmout1','^>*\\s*�����ű�����ô�ƶ�С�ۣ�','','jqgout_weapon')
    create_trigger_t('jqgout2', '^>*\\s*�Ҷ�ʯ������������������', '', 'gmss_outss')
    SetTriggerOption("gmout1", "group", "gmout")
    SetTriggerOption("jqgout2", "group", "gmout")
    ht2ssgo()
end
ht2ssgo = function()
    exe('tang bed;ban shiban;out')
end
gmss_outss = function()
    DeleteTriggerGroup("gmout")
    create_trigger_t('gmout1', '^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�', '', 'gmss_outssok')
    SetTriggerOption("gmout1", "group", "gmout")
    exe('e;e;e;e;e;s;s;s;s;s;w;w;w;w;w;n;n;n;n;n')
    -- locate()
    -- check_bei(jqgzlin_con)
end

gmss_outssok = function()
    DeleteTriggerGroup("gmout")
    create_trigger_t('gmout1', '^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�', '', 'gmss_outssok')
    SetTriggerOption("gmout1", "group", "gmout")
    exe('e;e;e;e;e;s;s;s;s;s;w;w;w;w;w;n;n;n;n;n')
    -- locate()
    -- check_bei(jqgzlin_con)
end
---------------


-----------

function yuRen()
    DeleteTriggerGroup("yrAsk")
    create_trigger_t('yrAsk1', "^(> )*�������˴����йء�һ�ƴ�ʦ������Ϣ", '', 'yuRenAsk')
    create_trigger_t('yrAsk2', "^(> )*����û������ˡ�$", '', 'yuRenOver')
    SetTriggerOption("yrAsk1", "group", "yrAsk")
    SetTriggerOption("yrAsk2", "group", "yrAsk")
    checkWield()
    return exe('ask yu ren about һ�ƴ�ʦ')
end
function yuRenAsk()
    EnableTriggerGroup("yrAsk", false)
    DeleteTriggerGroup("yren")
    create_trigger_t('yren1', "^(> )*����(����|)˵����(��|)�Ҳ����Ѿ���������ɽ�ķ�����ô��", '', 'yuRenBag')
    create_trigger_t('yren2', '^(> )*����(����|)˵����(��|)������ȥ�ҵĽ������أ�', '', 'yuRenWaa')
    create_trigger_t('yren3', "^(> )*����(����|)˵����(��|)Ҫ����ʦ����Ҳ���ѣ������Ҹն�ʧ������������", '', 'yuRenWaa')
    SetTriggerOption("yren1", "group", "yren")
    SetTriggerOption("yren2", "group", "yren")
    SetTriggerOption("yren3", "group", "yren")
end
function yuRenWaa()
    DeleteTimer("ydzy")
    EnableTriggerGroup("yren", false)
    EnableTriggerGroup("yrj", false)
    EnableTriggerGroup("yrz", false)
    cntr1 = countR(20)
    return check_halt(yuRenJump)
end
function yuRenJump()
    EnableTriggerGroup("yren", false)
    EnableTriggerGroup("yrz", false)
    DeleteTriggerGroup("yrj")
    create_trigger_t('yrj1', "^(> )*�ٲ����Ѿ������ˣ�������ȥ̫Σ���ˡ�", '', 'yuRenWait')
    create_trigger_t('yrj2', '^(> )*�㵱��һ�ﲻ����Ҳ�����¿�Ь�࣬ӿ������ٲ������䡣', '', 'yuRenZhua')
    create_trigger_t('yrj3', "^(> )*����æ���ء�", '', 'yuRenWaa')
    create_trigger_t('yrj4', '^(> )*���ٲ����ڶ�ȥ��ˮĭ�Ľ���ֻ��\\D*����վ��ˮ�ף�һ���ٲ�����ͻ������Ӿ�δҡ�Ρ�', '', 'yuRenWait')
    SetTriggerOption("yrj1", "group", "yrj")
    SetTriggerOption("yrj2", "group", "yrj")
    SetTriggerOption("yrj3", "group", "yrj")
    SetTriggerOption("yrj4", "group", "yrj")
    weapon_unwield()
    exe('look pubu')
    exe('jump pubu')
end
function yuRenWait()
    EnableTriggerGroup("yrj", false)
    if cntr1() < 1 then
        return yuRenOver()
    end
    return checkWait(yuRenJump, 3)
end
function yuRenZhua()
    EnableTriggerGroup("yrj", false)
    DeleteTriggerGroup("yrj")
    DeleteTriggerGroup("yrz")
    create_trigger_t('yrz1', "^(> )*�㲻���Ѿ�ץ����������ô��", '', 'yuRenCheck')
    create_trigger_t('yrz2', '^(> )*����\\D*��ץ������ô��', '', 'yuRenUw')
    -- create_trigger_t('yrz3',"^(> )*����æ���ء�",'','yuRenZhuaYu')
    -- create_trigger_t('yrz4','^(> )*����������ȥ׽�ǶԽ����ޣ�һ��һ��','','yuRenZhuaYu')
    create_trigger_t('yrz5', "^(> )*�����ֵ����������Ǵ�ʯ��������һ̧", '', 'yuRenCheck')
    create_trigger_t('yrz6', "^(> )*��ʵ��֧�Ų���ȥ�ˣ������������ٲ����ߡ�", '', 'yuRenWaa')
    create_trigger_t('yrz7', "^(> )*���������Ź��㣬ֻ��һ�����ֱ�������ȥ��������ˮ����������������һ��", '', 'yuRenBag')

    SetTriggerOption("yrz1", "group", "yrz")
    SetTriggerOption("yrz2", "group", "yrz")
    -- SetTriggerOption("yrz3","group","yrz")
    -- SetTriggerOption("yrz4","group","yrz")
    SetTriggerOption("yrz5", "group", "yrz")
    SetTriggerOption("yrz6", "group", "yrz")
    SetTriggerOption("yrz7", "group", "yrz")
    return yuRenZhuaYu()
end
function yuRenUw()
    DeleteTimer("ydzy")
    weapon_unwield()
    return check_halt(yuRenZhuaYu)
end
function yuRenZhuaYu()
    EnableTriggerGroup("yrz", true)
    create_timer_s('ydzy', 3, 'yrzhuayu')
end
function yrzhuayu()
    exe('zhua yu')
end
function yuRenCheck()
    DeleteTimer("ydzy")
    checkBags()
    create_timer_s('ydzy', 1, 'jumpab')
end
function jumpab()
    exe('jump anbian')
end
function yuRenBag()
    DeleteTimer("ydzy")
    if not Bag["������"] then
        return check_bei(yuRenAsk)
    end
    EnableTriggerGroup("yrz", false)
    exe('give jin wawa to yu ren')
    return checkWait(yuRenGive, 4)
end
function yuRenGive()
    DeleteTriggerGroup("yrp")
    create_trigger_t('yrp1', "^(> )*�ٲ���ˮ�������ļ��������Ѿ����������ں����ˣ��㻹���ȵȻ�ɡ�", '', 'yuRenPao')
    create_trigger_t('yrp2', '^(> )*��ת��ɽ�ǣ���һ�������𣡡����������ٲ�������', '', 'yuRenHua')
    create_trigger_t('yrp3', "^(> )*����æ���ء�", '', 'yuRenPao')
    SetTriggerOption("yrp1", "group", "yrp")
    SetTriggerOption("yrp2", "group", "yrp")
    SetTriggerOption("yrp3", "group", "yrp")
    return yuRenPao()
end
function yuRenPao()
    wait.make( function()
        wait.time(1)
        exe('zhi boat')
    end )
end
function yuRenHua()
    EnableTriggerGroup("yrp", false)
    DeleteTriggerGroup("yrh")
    -- create_trigger_t('yrh1',"^(> )*(�����У�|�����ڻ��أ�|������������æ�ӳ�)",'','yuRenBoat')
    create_trigger_t('yrh2', '^(> )*���Ѿ��������ˣ���취�ϰ��ɣ�', '', 'yuRenTiao')
    -- create_trigger_t('yrh3',"^(> )*����æ���ء�",'','yuRenBoat')
    create_trigger_t('yrh4', "^(> )*ͻȻ��һ�ɴ����嵽", '', 'yuRenOver')
    -- SetTriggerOption("yrh1","group","yrh")
    SetTriggerOption("yrh2", "group", "yrh")
    -- SetTriggerOption("yrh3","group","yrh")
    SetTriggerOption("yrh4", "group", "yrh")
    return yuRenBoat()
end
function yuRenBoat()
    weapon_unwield()
    EnableTriggerGroup("yrh", true)
    create_timer_s('yrb', 3, 'huaboat')
end
function huaboat()
    exe('wield tie jiang')
    exe('hua boat')
end
function yuRenTiao()
    DeleteTimer("yrb")
    EnableTriggerGroup("yrh", false)
    exe('jump shandong')
    return check_busy(yuRenOver)
end
function yuRenOver()
    DeleteTimer("yrb")
    exe('unwield tie jiang')
    EnableTriggerGroup("yrh", false)
    DeleteTriggerGroup("yrh")
    DeleteTriggerGroup("yrp")
    DeleteTriggerGroup("yrz")
    DeleteTriggerGroup("yrj")
    DeleteTriggerGroup("yren")
    DeleteTriggerGroup("yrAsk")
    return walk_wait()
end

function jiaoZi()
    locate()
    return checkNext(jiaoZiLoc)
end
function jiaoZiLoc()
    if locl.room ~= "����" then
        return jiaoZiOver()
    end
    if not locl.id["����"] then
        return jiaoZiWait()
    end
    wait.make( function()
        wait.time(2)
        return jiaoZiAnswer()
    end )
end
function jiaoZiWait()
    wait.make( function()
        wait.time(2)
        return jiaoZi()
    end )
end
function jiaoZiAnswer()
    EnableTriggerGroup("jiao", false)
    exe('answer ��ɽ����������మ���β��������۹��ƽ����һéի��Ұ����������˭���˷�˭�ɰܣ�ª�ﵥư�����ա�ƶ�������ģ��־���ģ�')
    exe('pa teng')
    return jiaoZiOver()
end
function jiaoZiOver()
    DeleteTriggerGroup("jiao")
    return walk_wait()
end 

function duZi()
    locate()
    return checkNext(duZiLoc)
end
function duZiLoc()
    if locl.room ~= "ʯ����ͷ" then
        return duZiOver()
    end
    if not locl.id["����"] then
        return duZiWait()
    end
    DeleteTriggerGroup("du")
    create_trigger_t('du1', "^(> )*����(����|)˵����(��|)�ҳ�������Ŀ�����㣬", '', 'duZiQuestion')
    create_trigger_t('du2', "^(> )*����(����|)˵����(��|)������һ��ʫ��˵�������³������������ĸ��ֶ�", '', 'duZiAnswer')
    create_trigger_t('du3', "^(> )*����(����|)˵����(��|)�úã���Ȼ������һ�⣬����һ������", '', 'duZiAnswerTwo')
    create_trigger_t('du4', "^(> )*����(����|)˵����(��|)�һ���һ������", '', 'duZiAnswerThree')
    create_trigger_t('du5', "^(> )*����(����|)˵����(��|)��ɻش�ĳ��ҵ����⣿", '', 'duZiAnswerAll')
    create_trigger_t('du6', "^(> )*����(����|)˵����(��|)��λ\\D*����ʦ������ǰ�治Զ����ʯ���", '', 'duZiOver')
    SetTriggerOption("du1", "group", "du")
    SetTriggerOption("du2", "group", "du")
    SetTriggerOption("du3", "group", "du")
    SetTriggerOption("du4", "group", "du")
    SetTriggerOption("du5", "group", "du")
    SetTriggerOption("du6", "group", "du")
    return check_halt(duZiAsk)
end
function duZiAsk()
    exe('ask shu sheng about һ�ƴ�ʦ')
end
function duZiQuestion()
    wait.make( function()
        wait.time(4)
        exe('ask shu sheng about ��Ŀ')
    end )
end
function duZiWait()
    wait.make( function()
        wait.time(2)
        return duZi()
    end )
end
function duZiAnswerAll()


    wait.make( function()


        wait.time(3)


        exe('answer ��δ״Ԫ')


        exe('answer ˪���Ҷ�����Ź����ң��')


        exe('answer �������ˣ���С����Զǳ�')


        exe('north')


    end )


end
function duZiAnswer()
    wait.make( function()
        wait.time(4)
        exe('answer ��δ״Ԫ')
    end )
end
function duZiAnswerTwo()
    exe('answer ˪���Ҷ�����Ź����ң��')
end
function duZiAnswerThree()
    exe('answer �������ˣ���С����Զǳ�')
    exe('north')
    return duZiOver()
end
function duZiOver()
    EnableTriggerGroup("du", false)
    return walk_wait()
end 

function nongFu()
    locate()
    return checkNext(nongFuLoc)
end
function nongFuLoc()
    if locl.room ~= "ɽ��" then
        return nongFuOver()
    end
    if not locl.id["ũ��"] then
        return nongFuWait()
    end
    DeleteTriggerGroup("nong")
    create_trigger_t('nong1', "^(> )*(�Ѿ����������ˡ�|ũ���ڣ���ô���ʯ����һ�����޷�����)", '', 'nongFuTuo')
    create_trigger_t('nong2', '^(> )*���Ѿ���ũ������ʯ���ˣ��������뿪��', '', 'nongFuLeave')
    create_trigger_t('nong3', "^(> )*����æ���ء�", '', 'nongFuTuo')
    create_trigger_t('nong4', "^(> )*ũ��˫����ס��ʯ�������˾���ͦ���ʯ������˵��", '', 'nongFuLeave')
    SetTriggerOption("nong1", "group", "nong")
    SetTriggerOption("nong2", "group", "nong")
    SetTriggerOption("nong3", "group", "nong")
    SetTriggerOption("nong4", "group", "nong")
    return nongFuTuo()
end
function nongFuTuo()
    EnableTriggerGroup("nong", true)
    wait.make( function()
        wait.time(2)
        exe('tuo shi')
    end )
end
function nongFuWait()
    wait.make( function()
        wait.time(2)
        return nongFu()
    end )
end
function nongFuLeave()
    EnableTriggerGroup("nong", false)
    wait.make( function()
        wait.time(3)
        exe('east')
        return nongFuOver()
    end )
end
function nongFuOver()
    DeleteTriggerGroup("nong")
    return walk_wait()
end 

function liangFront()
    if hp.neili < 6000 then
        return prepare_neili(liangFrontJump)
    end
    return liangFrontJump()
end
function liangFrontJump()
    exe('jump front;hp')
    return check_halt(liangFrontOver, 1)
end
function liangFrontOver()
    return walk_wait()
end 

function liangBack()
    if hp.neili < 2000 then
        return prepare_neili(liangBackJump)
    end
    return liangBackJump()
end
function liangBackJump()
    exe('jump back;hp')
    return check_halt(liangBackOver, 1)
end
function liangBackOver()
    return walk_wait()
end 



 
room = { }
roomMaze = {
    ['���ԭ�ݺ�'] = function() return locl.dir end,
    ['����ɽ��ʮ����'] = 'ne;nd',
    ['����ɽ���϶�'] = function() if locl.exit["enter"] then return 'enter' else return 'drop fire;leave;leave;leave;leave' end end,
    ['����ɽ��ɼ��'] = 'sw;se',
    ['����ɽʮ����'] = 'ne;ed;ne;ed',
    ['����ɽ������'] = 'ed;ed',
    ['����ɽ�����'] = 'out;w;e;w;e;w;e;w;e',
    ['����ɽ��ɼ��'] = function()
        wait.make( function()
            wait.time(1)
            local r = math.random(6)
            if r == 1 then
                exe("e;n;w;nw;ne")
            elseif r == 2 then
                exe("n;w;nw;ne")
            elseif r == 3 then
                exe("w;nw;ne")
            elseif r == 4 then
                exe("nw;ne")
            elseif r == 5 then
                exe("e;ne")
            elseif r == 6 then
                exe("ne")
            end
        end )
    end,
    ['��ɽ���ּ��'] = '#2e;nw;ne;se;n',
    ['���ݳ�����'] = '#3n',
    ['�ؽ���Ҷ��'] = function() if math.random(1, 4) == 1 then return 'ne;#15e' elseif math.random(1, 4) == 2 then return 'ne;#15w' elseif math.random(1, 4) == 3 then return 'ne;#15s' else return 'ne;#15n' end end,
    ['��ɽ������'] = function() return hsssl() end,
    ['�ƺ�����ƺӰ���'] = 'nu;#2(sw);#2w',
    ['�ƺ���������'] = 'e;ne;#2n',
    ['�ƺ�����ݵ�'] = 'e;s',
    ['�ƺ��������'] = '#2e;ne;n',
    ['ؤ��������'] = 'e;n;w;n',
    ['����ׯ�����'] = 's;se;w;#2s;w;s',
    ['����ׯ����'] = '#2e;w;#2s',
    ['����ׯ�ݵ�'] = '#2e;w;s',
    ['����Ľ��������'] = 'e;n;w;n;yue tree',
    ['������С��'] = 's;e;e;e;e;e;e;e;e',
    ['�����볤��'] = 's;s;e;e;e;e;e;e;e;e;e;e;n;e;s',
    ['����Сɳ��'] = '#4e',
    ['����ջ��'] = '#2(sw);#2(se);s',
    ['����ɽ·'] = 'ed;wd;sd;nd',
    ['���������'] = function() if locl.id["�ϻ�"] then return 'halt;n;w;nu' elseif locl.id["С��֦"] then return 'halt;w;nw;n;w;nu' elseif locl.id["����ʬ��"] then return 'halt;nw;n;w;nu' elseif locl.id["������"] then return 'halt;w;n;w;nu' else return locl.dir end end,
    ['��������'] = function() if locl.id["��ʯͷ"] then return 'halt;e;nu' elseif locl.id["������"] then return 'halt;w;nu' else return locl.dir end end,
    ['������Сľ��'] = function() return toSldHua() end,
    ['������ɳ̲'] = 'sw;se',
    ['����������'] = 'sw;se;s',
    ['����������'] = '#2e;n',
    ['��������ɽ·'] = 'nd;wd;sw;w;nw;ne;ne;ne;se;e;n;nw',
    ['�������������'] = 'nu;n;ne;e;e;e',
    ['���ݳ�ɽ·'] = 'sw;w;nw;sw;w;sw;w;nw;sw;su;sd;s',
    ['������ɽ��'] = 'd;wd;su;sd;wd',
    ['������ɽ·'] = 's;sd;d;wd;su',
    ['��ɽ��������'] = function()
        wait.make( function()
            wait.time(1)
            local r = math.random(14)
            if r == 1 then
                exe("sd;s")
            elseif r == 2 then
                exe("sw;n;s;w;e;w;e;e;s;w;n;nw;n")
            elseif r == 3 then
                exe("n;s;w;e;w;e;e;s;w;n;nw;n")
            elseif r == 4 then
                exe("s;w;e;w;e;e;s;w;n;nw;n")
            elseif r == 5 then
                exe("w;e;w;e;e;s;w;n;nw;n")
            elseif r == 6 then
                exe("e;w;e;e;s;w;n;nw;n")
            elseif r == 7 then
                exe("w;e;e;s;w;n;nw;n")
            elseif r == 8 then
                exe("e;e;s;w;n;nw;n")
            elseif r == 9 then
                exe("e;s;w;n;nw;n")
            elseif r == 10 then
                exe("s;w;n;nw;n")
            elseif r == 11 then
                exe("w;n;nw;n")
            elseif r == 12 then
                exe("n;nw;n")
            elseif r == 13 then
                exe("nw;n")
            elseif r == 14 then
                exe("n")
            end
        end )
    end,
    ['��ɽ��������'] = 'n;n;s;e',
    ['��ɽ���ֲ�԰��'] = 's;w;n;n;n;nw;n;n;w;w;w',
    ['��ɽ���ֻ���'] = 'n;w;n',
    ['��ɽ�������䳡'] = 's;s;n;e',
    ['��ɽ������ɮ��'] = 'n;n;n;e',
    ['��ɽ����ʯ��'] = 'sd;sd;sd;ed;sd;e',
    -- ain
    ['��ɽ��������'] = function()
        wait.make( function()
            wait.time(1)
            local r = math.random(11)
            if r == 1 then
                exe("ne;se;n;e;sw;e;ne;se;s;se;open door;e")
            elseif r == 2 then
                exe("se;n;e;sw;e;ne;se;s;se;open door;e")
            elseif r == 3 then
                exe("n;e;sw;e;ne;se;s;se;open door;e")
            elseif r == 4 then
                exe("e;sw;e;ne;se;s;se;open door;e")
            elseif r == 5 then
                exe("sw;e;ne;se;s;se;open door;e")
            elseif r == 6 then
                exe("e;ne;se;s;se;open door;e")
            elseif r == 7 then
                exe("ne;se;s;se;open door;e")
            elseif r == 8 then
                exe("se;s;se;open door;e")
            elseif r == 9 then
                exe("s;se;open door;e")
            elseif r == 10 then
                exe("se;open door;e")
            elseif r == 11 then
                exe("open door;e")
            end
        end )
    end,
    ['��ɽ����������'] = 'w;n;nw',
    ['��ɽ����ɮ��'] = function() if locl.id["�ۺ�����"] then return 'w;s;e' elseif locl.id["��������"] then return 'e;s;w' else return locl.dir end end,
    ['������������'] = 's;w;s;w;#8s',
    ['�䵱ɽ����·'] = 'e;e',
    ['�䵱ɽС��'] = '#5n',
    ['����ɽ������'] = 'n;e;n;w;n',
    ['������ɽ��С·'] = 'ne;nd;se;se;#2s;n;e',
    ['��Դ��ʯ��'] = 'jump front',
    ['���޺����޺�'] = 'se;#7n',
    ['���޺���ɳĮ'] = '#8w',
    ['���ݳǳ�������'] = 'w;w;e;n',
    ['���ݳǳ����ϰ�'] = 'w;w;e;s;se;s',
    ['��٢��ɽׯ������'] = 'south;#3w;#2e;#3s',
}

roomNodir = {
    ['����ʹ�����'] = { 'north' },
    ['���ݳ����'] = { 'northeast' },
    ['��������·'] = { 'east', 'west' },
    ['���ݳ�ɽ·'] = { 'east', 'west' },
    ['���ݳ�С��'] = { 'southwest' },
    ['�ƺ���������'] = { 'southwest' },
    ['��ɽ�������'] = { 'northwest', 'northeast' },
    ['��ɽ�յ�'] = { 'southdown' },
    ['��ɽɽ����'] = { 'south' },
    ['�����ɽ��ƽ��'] = { 'northdown' },
    ['���ݳ����ׯ�ſ�'] = { 'west' },
    ['����ɽ���پ�'] = { 'west' },
    ['����ɽ������'] = { 'southwest' },
    ['����ɽ��Ժ��'] = { 'east' },
    ['����ɽ��Ժ'] = { 'south' },
    ['÷ׯС·'] = { 'south' },
    ['���̻���ƺ'] = { 'south', 'east' },
    ['���̾�ľ��'] = { 'west', 'east' },
    ['�����һ���'] = { 'west' },
    ['���̺�ˮ��'] = { 'east' },
    ['���������'] = { 'east' },
    ['���̺�����'] = { 'east', 'west' },
    ['���̾�����'] = { 'west' },
    ['�置ɽ��'] = { 'northup', 'northwest' },
    ['�������ֽ��Ժ'] = { 'south' },

    ['��ɽ����������'] = { 'west' },
    ['��ɽ��������Ժ'] = { 'west' },
    ['��ɽ����ɽ·'] = { 'east', 'northwest' },

    ['��ɽ�޵�'] = { 'north' },
    ['���ݳǺ�Ժ'] = { 'north' },
    ['�䵱ɽС��'] = { 'south', 'west', 'east' },
    ['����ɽ������'] = { 'north', 'west' },
    ['����ɽ��Ժ'] = { 'north' },

    ['���޺��¹Ȼ��ٹ��'] = { 'south' },
    ['���޺���ɽ����'] = { 'southwest' },
    ['���޺����޺�'] = { 'south', 'north', 'east' },
    ['���޺����¶���'] = { 'west', 'east' },
    ['���޺����¶�'] = { 'north' },
    ['���޺�С·'] = { 'south', 'west' },
    ['���޺����߻�·'] = { 'south', 'north', 'east' },

}

MidNight = {
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = false,
    ['î'] = false,
    ['��'] = false,
    ['��'] = false,
    ['��'] = false,
    ['δ'] = false,
    ['��'] = false,
}

MidDay = {
    ['��'] = false,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['î'] = false,
    ['��'] = false,
    ['��'] = false,
    ['��'] = false,
    ['δ'] = false,
    ['��'] = false,
}

MidHsDay = {
    ['��'] = false,
    ['��'] = false,
    ['��'] = false,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['��'] = true,
    ['î'] = true,
    ['��'] = false,
    ['��'] = false,
    ['��'] = false,
    ['δ'] = false,
}

function del_element(set, element)
    for i = 1, table.getn(element) do
        set = delElement(set, element[i])
    end
    return set
end

function del_string(string, sub)
    local l_s, l_e
    for i = 1, string.len(string) do
        l_s, l_e = string.find(string, sub)
        if l_s == nil then break end
        string = string.sub(string, 1, l_s - 1) .. string.sub(string, l_e + 1, string.len(string))
    end
    return string
end

function addrTrim(addr)
    addr = del_string(addr, '����')
    addr = string.gsub(addr, 'С��', '��ɽ��', 1)
    addr = string.gsub(addr, '����������', '������', 1)
    addr = string.gsub(addr, 'Ľ��', '����Ľ��', 1)
    -- addr=string.gsub(addr,'����Ϫ��','������Ϫ��',1)
    return addr
end

goto_set = { }
goto_set.lzdk = function()
    return goto('���ݳǴ�ɿ�')
end
goto_set.xy = function()
    return goto('�����ǵ���')
end
goto_set.sl = function()
    return goto('��ɽ���ִ��۱���')
end
goto_set.xs = function()
    return goto('��ѩɽ���Ŀ�')
end
goto_set.hs = function()
    return goto('��ɽ������')
end
goto_set.yz = function()
    return goto('���ݳǵ���')
end
goto_set.wd = function()
    return goto('�䵱ɽ�����')
end
goto_set.thd = function()
    return goto('�һ�������ͤ')
end
goto_set.dl = function()
    return goto('�����ҩ��')
end

wxbGo = function()
    dis_all()
    return go(wxbAsk, "���ݳ�", "����Ժ")
end
wxbAsk = function()
    create_trigger_f('wxbask', "^Τ����˵��������λ׳ʿ��������˵�����ǹԶ�������(\\D*)�������ء���", '', 'wxbGoto')
    Execute('ask wei chunfang about wei xiaobao')
end
wxbGoto = function(n, l, w)
    DeleteTemporaryTriggers()
    return goto(w[1])
end

function thdJiaohui()
    road.id = nil
    dis_all()
    return go(thdJiaohuiAsk, "�һ���", "����ͤ")
end
function thdJiaohuiAsk()
    exe('ask huang yaoshi about �̻�')
    return check_heal()
end

function searchNpc(city, npc)
    if city then
        tmp.rooms = getCityRooms(city)
    end
    if npc then
        tmp.npc = npc
    end
    tmp.rooms = tmp.rooms or { }
    tmp.sour = tmp.sour or "city/dangpu"
    while countTab(tmp.rooms) > 0 do
        local l_sour = "city/dangpu"
        if tmp.sour ~= "city/dangpu" then
            l_sour = tmp.sour
        end
        local l_dest, l_distance = getNearRoom(l_sour, tmp.rooms)
        if l_dest then
            tmp.rooms = delElement(tmp.rooms, l_dest)
            local l_path = map:getPath(l_sour, l_dest)
            if l_path then
                tmp.sour = l_dest
                return go(searchNpcLocate, l_dest, '', l_sour)
            end
        else
            tmp.rooms = { }
        end
    end
    ColourNote("white", "blue", "Object������ϣ�")
    printTab(tmp.objs)
end
function searchNpcLocate()
    locate()
    return check_halt(searchNpcAdd, 1)
end
function searchNpcAdd()
    tmp.objs = tmp.objs or { }
    for p, q in pairs(locl.id) do
        Note(p .. " = " .. q)
        if tmp.npc and p == tmp.npc then
            exe('follow ' .. q)
            return disAll()
        end
        if ItemGet[p] or weaponStore[p] or weaponThrowing[p] or drugBuy[p] or drugPoison[p] or itemSave[p] then
            locl.id[p] = nil
        end
        if string.find(p, "�ڳ�") or string.find(p, "����") or string.find(p, "��ƪ") or string.find(p, "��Ҫ") or string.find(p, "�佫") or string.find(p, "�ٱ�") or string.find(p, "���ϵ�") or string.find(p, "����") or string.find(p, "��ʦ") or string.find(p, "����") or string.find(p, "����") or string.find(p, "�趨��������") or string.find(p, "��ʬ") or string.find(p, "Ůʬ") or string.find(p, "ʬ��") or string.find(p, "�ϵ���") or string.find(p, "�����") or string.find(p, "�׼�") or string.find(p, "����") or string.find(p, "����") then
            locl.id[p] = nil
        end
        if p == score.name or MudUser[p] then
            locl.id[p] = nil
        end
        if locl.item[p]["cloth"] or locl.item[p]["shoes"] or locl.item[p]["shoe"] or locl.item[p]["blade"] or locl.item[p]["sword"] then
            locl.id[p] = nil
        end
        if map.rooms[tmp.sour] and map.rooms[tmp.sour].objs and type(map.rooms[tmp.sour].objs) == "table" then
            for k in pairs(map.rooms[tmp.sour].objs) do
                if p == k then
                    locl.id[p] = nil
                end
            end
        end
    end
    if countTab(locl.id) > 0 then
        for p, q in pairs(locl.id) do
            tmp.objs[tmp.sour] = tmp.objs[tmp.sour] or { }
            tmp.objs[tmp.sour].objs = tmp.objs[tmp.sour].objs or { }
            ColourNote("white", "blue", p .. " = " .. q)
            tmp.objs[tmp.sour].objs[p] = q
        end
    end
    return searchNpc()
end

function locateroom(where)
    local l_dest = { }
    where = Trim(where)
    if string.find(where, "/") then
        local l_path = map:getPath("xiangyang/dangpu", where)
        if l_path then
            return where
        end
    else
        l_dest.room, l_dest.area = getAddr(Trim(where))
    end
    if l_dest.area then
        local l_rooms = getRooms(l_dest.room, l_dest.area)
        for k, v in pairs(l_rooms) do
            local l_path = map:getPath("xiangyang/dangpu", v)
            if l_path then
                return l_dest.area, l_dest.room
            end
        end
    end

    for p in pairs(map.rooms) do
        if map.rooms[p].objs then
            for k in pairs(map.rooms[p].objs) do
                if k == where then
                    local l_path = map:getPath("xiangyang/dangpu", p)
                    if l_path then
                        return p
                    end
                end
            end
        end
    end
    return false
end

dirReverse = {
    ["up"] = "down",
    ["down"] = "up",
    ["east"] = "west",
    ["west"] = "east",
    ["eastup"] = "westdown",
    ["westup"] = "eastdown",
    ["eastdown"] = "westup",
    ["westdown"] = "eastup",
    ["south"] = "north",
    ["north"] = "south",
    ["southup"] = "northdown",
    ["northup"] = "southdown",
    ["southdown"] = "northup",
    ["northdown"] = "southup",
    ["southeast"] = "northwest",
    ["southwest"] = "northeast",
    ["northeast"] = "southwest",
    ["northwest"] = "southeast",
    ["enter"] = "out",
    ["out"] = "enter",
}
function mjlujingLog(jname)
    local filename = GetInfo(67) .. "lujing\\" .. score.id .. '����' .. jname .. '·��' .. os.date("%Y%m%d_%Hʱ%M��%S��") .. ".log"

    local file = io.open(filename, "w")

    local t = { }

    for i = 1, GetLinesInBufferCount() do
        table.insert(t, GetLineInfo(i, 1))
    end

    local s = table.concat(t, "\n") .. "\n"

    file:write(s)

    file:close()
end

function path_cal()
    local l_sour, l_dest, l_path, l_distance
    sour.rooms = { }
    dest.rooms = { }

    if sour.id == nil then
        sour.room = locl.room
        sour.area = locl.area
        sour.rooms = getRooms(sour.room, sour.area)
        if table.getn(sour.rooms) == 0 then
            Note('Path Cal GetSourRooms 0 Error!')
            return false
        end
        l_sour = sour.rooms[1]
    else
        l_sour = sour.id
    end
    if dest.id == nil then
        dest.rooms = getRooms(dest.room, dest.area)

        -- if WhereIgnores[dest.area..dest.room] then
        --   return false
        -- end
        if table.getn(dest.rooms) == 0 then
            Note('Path Cal GetDestRooms 0 Error!')
            return false
        end

        l_dest, l_distance = getNearRoom(l_sour, dest.rooms)
        if not l_dest then
            Note("�޷�����" .. dest.area .. dest.room)
            return false
        end
    end

    if dest.id ~= nil then l_dest = dest.id end
    if sour.id ~= nil then l_sour = sour.id end
    road.id = l_dest
    l_path = map:getPath(l_sour, l_dest)
    if not l_path then
        Note('GetPath Error!')
        return false
    end

    return l_path
end