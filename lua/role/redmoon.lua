--
-- redmoon.lua
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


module("redmoon", package.seeall)

settings= {
    test = "redmoon11111"
}


function tt()
    print("call redmoon method success")
end

function tta(arg)
    print("call arg success : "..arg)
end


return redmoon