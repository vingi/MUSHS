--
-- Miner.lua
--
-- ----------------------------------------------------------
-- 每日定时论坛矿产收矿
-- 只挖铁矿石和金矿石
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
-- 挖矿 Main
-- ---------------------------------------------------------------
function Miner.Mining()
    local username = GetVariable("id")
    local password = GetVariable("passwd")
    -- 调用API进行收矿
    local ret = Miner.CallMinerAPI(Miner.APIUrl, username, password)
    if ret ~= nil and string.len(ret) > 2 then
        messageShow("论坛收矿： " .. common.u2a(ret))
        -- 将收矿动作记录DB
        Miner.InsertDB(common.u2a(tostring(ret)))
    end
end

-- ---------------------------------------------------------------
-- 呼叫WEBAPI, 进行收矿
-- ---------------------------------------------------------------
function Miner.CallMinerAPI(requesturl, username, password)
    local result = "bad connection"
    local request_body = "username=" .. username .. "&password=" .. password
    local response_body = { }
    local http = require("socket.http")
    http.TIMEOUT = 2
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
-- 完成一次论坛, 将记录写入数据库
-- ---------------------------------------------------------------
function Miner.InsertDB(notes)
    local tsql = "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('" .. score.id .. "', '" .. score.name .. "', '论坛收矿石', '{0}')"
    if string.len(notes) > 5 then
        notes = string.sub(notes, 1, string.len(notes) -1)
    end
    tsql = string.gsub(tsql, "{0}", notes .. " 自动采集完成!")
    local db = DBHelper:new()
    local val = db:Insert(tsql)
end

-- ---------------------------------------------------------------
-- 检查DB里距离上次自动收矿记录, 是否超过6小时,若超过则返回true, 否则false
-- ---------------------------------------------------------------
function Miner.CheckMineGap()
    local tsql = "SELECT [CreateTime] FROM [ActivityRecord] where ActivityName = '论坛收矿石' and RoleID = '" .. score.id .. "' ORDER BY [ID] DESC LIMIT 1"
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
-- 自动挖矿,含判断当前是否达到要挖的条件
-- ---------------------------------------------------------------
function Miner.AutoMine()
    if GetRoleConfig("AutoMine") == true then
        if Miner.CheckMineGap() then
            Miner.Mining()
        end
    end
end

-- tprint(common.timediff(common.string2time("2019-03-06 15:45:09"),common.string2time("2019-03-05 10:41:45")))