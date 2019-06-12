--
-- score.lua
--
-- ----------------------------------------------------------
-- 实体类集合
-- ----------------------------------------------------------
--
--[[


eg.

require "Entity"


--]]
score = {}
score.id = "id"
score.name = "name"
score.dex = 20
score.dex_t = 20
score.int = 20
score.int_t = 20
score.str = 20
score.str_t = 20
score.con = 20
score.con_t = 20
score.age = 14
score.gold = 0
score.vip = nil
-- 书剑通宝
score.tb = 0
-- 元宝
score.yb = 0
-- 竞技币
score.jjb = 0
-- 游戏等级
score.level = 1
-- 死亡次数
score.dead = 0
-- 打造次数
score.buildweapon = 0
-- 理相
score.xiangyun = "平"