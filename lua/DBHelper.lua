--
-- DBHelper.lua
--
-- ----------------------------------------------------------
--
-- ----------------------------------------------------------
--
--[[

    -- GetFirstValue
    local tsql = "SELECT ActivityName FROM [ActivityRecord]"
    local db = DBHelper:new()
    local val = db:GetFirstValue(tsql)

    -- GetRowAmount
    local tsql = "SELECT count(*) FROM [ActivityRecord]"
    local db = DBHelper:new()
    local val = db:GetRowAmount(tsql)


    -- Insert
    local tsql = "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('vingi', '苍月', '洪七公作菜', NULL)"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
    print(val)

--]]

-- module("DBHelper", package.seeall)

DBHelper = {
    DBName = "mainDatabase",
    DBFile = "shujian.sqlite",
}

-- ---------------------------------------------------------------
-- 创建对象实例
-- ---------------------------------------------------------------
function DBHelper:new()
    --  创建新的表作为实例的对象
    local self = { }
    -- 设置DBHelper为对象元表的__index
    setmetatable(self, { __index = DBHelper })
    -- 返回该新表
    return self
end 

-- ---------------------------------------------------------------
-- 获取SQL语句中查询的第一行的第一个column的值
-- ---------------------------------------------------------------
function DBHelper:GetFirstValue(sql)
    local columnValue = ""
    DatabaseOpen(DBHelper.DBName, DBHelper.DBFile, 6)
    DatabasePrepare(DBHelper.DBName, common.a2u(sql))
    rc = DatabaseStep(DBHelper.DBName)
    if rc == sqlite3.ROW then
        local column = DatabaseColumnValues(DBHelper.DBName)
        if column ~= nil then
            columnValue = column[1]
        end
    end
    DatabaseFinalize(DBHelper.DBName)
    DatabaseClose(DBHelper.DBName)
    return common.u2a(columnValue)
end

-- ---------------------------------------------------------------
-- 获取SQL语句中查询的行数(即数量集)
-- ---------------------------------------------------------------
function DBHelper:GetRowAmount(sql)
    local rowscount = DBHelper:GetFirstValue(sql)
    if rowscount == nil or rowscount == "" then
        rowscount = 0
    end
    return rowscount
end

-- ---------------------------------------------------------------
-- 获取SQL语句中查询的第一行的所有数据, 返回一个table
-- ---------------------------------------------------------------
function DBHelper:GetFirstRow(sql)
    local columnValue = { }
    DatabaseOpen(DBHelper.DBName, DBHelper.DBFile, 6)
    DatabasePrepare(DBHelper.DBName, sql)
    rc = DatabaseStep(DBHelper.DBName)
    if rc == sqlite3.ROW then
        columnValue = DatabaseColumnValues(DBHelper.DBName)
    end
    DatabaseFinalize(DBHelper.DBName)
    DatabaseClose(DBHelper.DBName)
    return columnValue
end

-- ---------------------------------------------------------------
-- 获取SQL语句中查询的所有行的数量, 即行数
-- 其中因Mush特性,自动转化ANSI -> UTF8
-- ---------------------------------------------------------------
function DBHelper:Insert(sql)
    DatabaseOpen(DBHelper.DBName, DBHelper.DBFile, 6)
    DatabaseExec(DBHelper.DBName, common.a2u(sql))
    DatabaseFinalize(DBHelper.DBName)
    DatabaseClose(DBHelper.DBName)
end

-- ---------------------------------------------------------------
-- Init DBHelper
-- ---------------------------------------------------------------
-- db = DBHelper:new()



