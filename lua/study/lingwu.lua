--
-- lingwu.lua
--
-- ----------------------------------------------------------
-- 含 lingwu(领悟) 所有function 集合
-- ----------------------------------------------------------
--
--[[


eg.

require "check
  check (SetVariable ("abc", "def"))  --> works ok
  check (SetVariable ("abc-", "def")) --> The name of this object is invalid

--]]
function lingwu_trigger()
  DeleteTriggerGroup("lingwu")
  create_trigger_t("lingwu1", "^>*\\s*(你只能从特殊技能中领悟。|你不会这种技能。|你要领悟什么？)", "", "lingwu_next")
  create_trigger_t("lingwu2", "^>*\\s*你从实战中得到的潜能已经用完了。", "", "lingwu_finish")
  create_trigger_t("lingwu3", "^>*\\s*你的\\D*不够，无法领悟更深一层的基本", "", "lingwu_next")
  create_trigger_t("lingwu9", "^>*\\s*以你现在的基本内功修为，尚无法领悟基本内功。", "", "lingwu_next")
  create_trigger_t("lingwu5", "^>*\\s*由于实战经验不足，阻碍了你的「\\D*」进步", "", "lingwu_next")
  create_trigger_t("lingwu6", '^>*\\s*你把 "action" 设定为 "少林领悟就是好啊，就是好！" 成功完成。', "", "lingwu_goon")
  create_trigger_t("lingwu7", "^>*\\s*你的内力不够。", "", "lingwu_finish")
  SetTriggerOption("lingwu1", "group", "lingwu")
  SetTriggerOption("lingwu2", "group", "lingwu")
  SetTriggerOption("lingwu3", "group", "lingwu")
  SetTriggerOption("lingwu9", "group", "lingwu")
  SetTriggerOption("lingwu5", "group", "lingwu")
  SetTriggerOption("lingwu6", "group", "lingwu")
  SetTriggerOption("lingwu7", "group", "lingwu")
  EnableTriggerGroup("lingwu", false)
end

function checklingwu()
  if lingwudie == 0 then
    return lingwu()
  end
  if xxpot < hp.pot_max then
    return lingwu()
  end
  return check_job()
end

function lingwu()
  DeleteTemporaryTriggers()
  lingwu_trigger()
  skillsLingwu = {}
  skillsLingwu = utils.split(GetVariable("lingwuskills"), "|")
  road.temp = 0
  tmp.lingwu = 1
  lingwudie = 0
  return check_busy(lingwu_go)
end

function lingwu_go()
  exe("nick 少林领悟达摩院后殿")
  messageShow("去少林领悟")
  jifaAll()

  go(lingwu_unwield, "嵩山少林", "达摩院")
end

function lingwu_unwield()
  weapon_unwield()
  return check_busy(lingwuzb)
end

function lingwuzb()
  zhunbeineili(lingwuzbok)
end

function lingwuzbok()
  go(lingwu_goon, "嵩山少林", "达摩院后殿")
end

function lingwuSleep()
  if score.gender == "男" then
    return go(lingwuSleepOver, "songshan/nan-room", "")
  else
    return go(lingwuSleepOver, "songshan/nv-room", "")
  end
end

function lingwuSleepOver()
  exe("sleep")
  checkWait(lingwu_eat, 3)
end

function lingwu_goon()
  if locl.room ~= "达摩院后殿" then
    return lingwu_finish()
  end
  EnableTriggerGroup("lingwu", true)
  local leweapon = GetVariable("learnweapon")
  exe("wield " .. leweapon)
  local skill = skillsLingwu[tmp.lingwu]

  if not skills[skill] or skills[skill].lvl == 0 or skills[skill].lvl >= hp.pot_max - 100 then
    return lingwu_next()
  end

  if hp.neili < hp.neili_max / 2 then
    if hp.exp > 20000000 or score.gender == "无" then
      return go(lingwu_eat, "武当山", "茶亭")
    else
      return lingwuSleep()
    end
  end
  yunAddInt()
  flag.idle = nil
  exe("hp;yun jing;#5(lingwu " .. skill .. ")")
  return check_bei(lingwu_alias, 1.8)
end

function lingwu_eat()
  if locl.room == "茶亭" then
    flag.food = 0
    exe("sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao")
    check_bei(lingwu_go)
  else
    return go(lingwu_eat, "武当山", "茶亭")
  end
end

function lingwu_alias()
  exe("alias action 少林领悟就是好啊，就是好！")
end

function lingwu_next()
  EnableTriggerGroup("lingwu", false)
  tmp.lingwu = tmp.lingwu + 1
  local length = table.getn(skillsLingwu)
  if tmp.lingwu > length then
    flag.lingwu = 0
    lingwudie = 1
    xxpot = hp.pot_max
    return check_bei(lingwu_finish)
  else
    local skill = skillsLingwu[tmp.lingwu]
    --print(skillsLingwu[tmp.lingwu])
    if skills[skill] and skills[skill].lvl > 0 and skills[skill].lvl < hp.pot_max - 100 then
      return check_bei(lingwu_goon, 1)
    else
      return lingwu_next()
    end
  end
end

function lingwu_finish()
  messageShow("少林领悟完成")
  local skill = skillsLingwu[tmp.lingwu]
  EnableTriggerGroup("lingwu", false)
  DeleteTriggerGroup("lingwu")
  exe("cha;hp;yun qi;yun jingli;yun jing")
  flag.lingwu = 0
  if tmp.lingwu > 1 and tmp.lingwu <= table.getn(skillsLingwu) then
    table.remove(skillsLingwu, tmp.lingwu)
    table.insert(skillsLingwu, 1, skill)
  end
  flag.lingwu = 0
  weapon_unwield()
  local leweapon = GetVariable("learnweapon")
  exe("cha;unwield " .. leweapon)
  return check_busy(check_food)
end
