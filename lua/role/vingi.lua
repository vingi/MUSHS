--
-- vingi.lua
--
-- ----------------------------------------------------------
-- return-code checker for MUSHclient functions that return error codes
-- ----------------------------------------------------------
--
--[[

Call for those MUSHclient functions that return a result code (like eOK).
Not all functions return such a code.

eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]


module("vingi", package.seeall)

settings= {
    -- 是否每天自动洪七公作菜10次
    Auto_hqgzc_10times = true
}


function tt()
    print("call vingi method success")
end

return vingi 