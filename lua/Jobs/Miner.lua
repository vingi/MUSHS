--
-- Miner.lua
--
-- ----------------------------------------------------------
-- ÿ�ն�ʱ��̳����տ�
-- ֻ������ʯ�ͽ��ʯ
-- ----------------------------------------------------------
--
--[[


eg.

require "miner"


--]]


Miner = {
    APIUrl = "http://www.iseotw.com/controls/mud/miner.aspx"
}

-- ---------------------------------------------------------------
-- �ڿ� Main
-- ---------------------------------------------------------------
function Miner.Mining()
    local username = GetVariable("id")
    local password = GetVariable("passwd")
    -- ����API�����տ�
    local ret = Miner.CallMinerAPI(Miner.APIUrl, username, password)
    print("�ɿ�API���ؽ��: "..ret)
    if ret ~= nil and string.len(ret) > 2 then
        messageShow("��̳�տ� " .. common.u2a(ret))
        -- ���տ�����¼DB
        Miner.InsertDB(common.u2a(tostring(ret)))
    end
end

-- ---------------------------------------------------------------
-- ����WEBAPI, �����տ�
-- ---------------------------------------------------------------
function Miner.CallMinerAPI(requesturl, username, password)
    local result = "bad connection"
    local request_body = "username=" .. username .. "&password=" .. password
    local response_body = { }
    local http = require("socket.http")
    http.TIMEOUT = 20
    local res, code, response_headers = http.request {
        url = requesturl,
        method = "POST",
        headers =
        {
            ["Content-Type"] = "application/x-www-form-urlencoded";
            ["Content-Length"] = #request_body;
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body),
    }
    if type(response_body) == "table" then
        result = table.concat(response_body)
    end
    return result
end

-- ---------------------------------------------------------------
-- ���һ����̳, ����¼д�����ݿ�
-- ---------------------------------------------------------------
function Miner.InsertDB(notes)
    local tsql = "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" .. score.id .. "', '" .. score.name .. "', '��̳�տ�ʯ', '{0}')"
    if string.len(notes) > 5 then
        notes = string.sub(notes, 1, string.len(notes) -1)
    end
    tsql = string.gsub(tsql, "{0}", notes .. " �Զ��ɼ����!")
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end

-- ---------------------------------------------------------------
-- ���DB������ϴ��Զ��տ��¼, �Ƿ񳬹�6Сʱ,�������򷵻�true, ����false
-- ---------------------------------------------------------------
function Miner.CheckMineGap()
    local tsql = "SELECT [CreateTime] FROM [ActivityRecord] where ActivityName = '��̳�տ�ʯ' and RoleID = '" .. score.id .. "' ORDER BY [ID] DESC LIMIT 1"
    local db = DBHelper:new()
    local lasttime = db:GetFirstValue(tsql)
    if lasttime == nil or lasttime == "" then
        return true
    end 
    local gap = common.timediff(common.string2time(common.time()), common.string2time(lasttime))
    if gap["year"] > 0 or gap["month"] > 0 or gap["day"] > 0 or gap["hour"] > 5 then
        return true
    else
        return false
    end
end
-- ---------------------------------------------------------------
-- �Զ��ڿ�,���жϵ�ǰ�Ƿ�ﵽҪ�ڵ�����
-- ---------------------------------------------------------------
function Miner.AutoMine()
    if GetRoleConfig("AutoMine") == true then
        if Miner.CheckMineGap() then
            Miner.Mining()
        end
    end
end

-- tprint(common.timediff(common.string2time("2019-03-06 15:45:09"),common.string2time("2019-03-05 10:41:45")))