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


    -- insert
    local tsql = "INSERT INTO [ActivityRecord] ([RoleID],[RoleName],[ActivityName],[Note]) VALUES ('vingi', '����', '���߹�����', NULL)"
    local db = DBHelper:new()
    local val = db:Insert(tsql)
    print(val)

--]]

-- module("DBHelper", package.seeall)

DBHelper = {
    DBName = "mainDatabase",
    DBFile = "shujian.sqlite",
}


function DBHelper:new()
    --  �����µı���Ϊʵ���Ķ���
    local self = { }
    -- ����DBHelperΪ����Ԫ���__index
    setmetatable(self, { __index = DBHelper })
    -- ���ظ��±�
    return self
end 

-- ---------------------------------------------------------------
-- ��ȡSQL����в�ѯ�ĵ�һ�еĵ�һ��column��ֵ
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
-- ��ȡSQL����в�ѯ������(��������)
-- ---------------------------------------------------------------
function DBHelper:GetRowAmount(sql)
    local rowscount = DBHelper:GetFirstValue(sql)
    if rowscount == nil or rowscount == "" then
        rowscount = 0
    end
    return rowscount
end

-- ---------------------------------------------------------------
-- ��ȡSQL����в�ѯ�ĵ�һ�е���������, ����һ��table
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
-- ��ȡSQL����в�ѯ�������е�����, ������
-- ������Mush����,�Զ�ת��ANSI -> UTF8
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



