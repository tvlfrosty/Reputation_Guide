---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, REP = ...

-----------------------------
-- General Addon Functions --
-----------------------------
function REP:About()
  local ver = GetAddOnMetadata("ReputationGuide", "Version")
  local date = GetAddOnMetadata("ReputationGuide", "X-Date")
  local author = GetAddOnMetadata("ReputationGuide", "Author")
  local web = GetAddOnMetadata("ReputationGuide", "X-Website")

  if (author ~= nil) then
    if REP.AfterShadowLands then
      REP:Print(addonName.." "..REP_TXT.by..": "..REP.HELP_COLOUR..author.."|r", true)
    else
      REP:Print(addonName.." "..REP_TXT.by..": "..REP.HELP_COLOUR..author.."|r"..", updated and maintained by: "..REP.HELP_COLOUR.."Tvlfrosty-Firemaw".."|r", true)
    end
  end
  if (ver ~= nil) then
    REP:Print(" "..REP_TXT.version..": "..REP.HELP_COLOUR..ver.."|r", true)
  end

  if (date ~= nil) then
    REP:Print(" "..REP_TXT.date..": "..REP.HELP_COLOUR..date.."|r", true)
  end
  if (web ~= nil) then
    REP:Print(" "..REP_TXT.web..": "..REP.HELP_COLOUR..web.."|r", true)
  end
end
---------------------------------------------------
function REP:Help()
  REP:Print(" ", true)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.help, true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP help "..REP.HELP_COLOUR..REP_TXT.helphelp, true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP about "..REP.HELP_COLOUR..REP_TXT.helpabout, true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP status "..REP.HELP_COLOUR..REP_TXT.helpstatus, true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP watch <factionID> set faction as watched", true) -- TODO: Add as localised text
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP enable { mobs | quests | pvpquests | instances | items | all }", true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP disable { mobs | quests | pvpquests | instances | items | all }", true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP toggle { mobs | quests | pvpquests | instances | items | all }", true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP enable { missing | details | chat | paragon }", true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP disable { missing | details | chat | paragon }", true)
  REP:Print(REP.HELP_COLOUR..REP_TXT.usage..":|r /REP toggle { missing | details | chat | paragon }" , true)
end
---------------------------------------------------
function REP:Status()
  REP:Print(" ", true)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.status, true)
  REP:Print("   "..REP_TXT.statMobs..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowMobs).."|r", true)
  REP:Print("   "..REP_TXT.statQuests..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowQuests).."|r", true)
  REP:Print("   "..REP_TXT.statInstances..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowInstances).."|r", true)
  REP:Print("   "..REP_TXT.statItems..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowItems).."|r", true)
  REP:Print("   "..REP_TXT.statGeneral..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowGeneral).."|r", true)
  REP:Print("   "..REP_TXT.statMissing..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowMissing).."|r", true)
  REP:Print("   "..REP_TXT.statDetails..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ExtendDetails).."|r", true)
  REP:Print("   "..REP_TXT.statChat..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.WriteChatMessage).."|r", true)

  REP:Print("   "..REP_TXT.statNoGuildChat..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.NoGuildGain).."|r", true)
  REP:Print("   "..REP_TXT.statPreview..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowPreviewRep).."|r", true)
  REP:Print("   "..REP_TXT.statSwitch..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.SwitchFactionBar).."|r", true)
  REP:Print("   "..REP_TXT.statNoGuildSwitch..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.NoGuildSwitch).."|r", true)
  REP:Print("   "..REP_TXT.statSilentSwitch..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.SilentSwitch).."|r", true)
  REP:Print("   "..REP_TXT.EnableParagonBar..": "..REP.HELP_COLOUR..REP:BoolToEnabled(REP_Data.Global.ShowParagonBar).."|r", true)
end
------------------------------
-- General Helper Functions --
------------------------------
function REP:Print(msg, forceDefault)
  if not (msg) then return end

  if ((REP_Data == nil) or forceDefault) then
    DEFAULT_CHAT_FRAME:AddMessage(msg)
  else
    for i = 1, NUM_CHAT_WINDOWS do
      local chatTab = _G["ChatFrame"..i.."Tab"]
      if chatTab:IsShown() then
        local chatFrame = _G["ChatFrame"..i]
        local messageTypes = chatFrame.messageTypeList
        for j = 1, #messageTypes do
          if messageTypes[j] == "COMBAT_FACTION_CHANGE" then
            _G["ChatFrame"..i]:AddMessage(msg)
          end
        end
      end
    end
  end
end
---------------------------------------------------
function REP:DumpTable(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. REP:DumpTable(v) .. ','
    end

    return s .. '} '
  else
    return tostring(o)
  end
end
---------------------------------------------------
function REP:Printtest(msg, msg1, msg2)
  REP:Print(""..tostring(msg).." "..tostring(msg1).."  "..tostring(msg2), nil)
end

function REP:PrintSlash(msg, msg1)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..msg.." ["..REP.HELP_COLOUR..msg1.."|r]", true)
  REP:Help()
end
---------------------------------------------------
function REP:Debug(msg)
  if not (msg) then return end
  REP:Print(msg)
end
---------------------------------------------------
function REP:TableSize(info)
  local result = 0
  if info then
    for item in pairs(info) do result = result + 1 end
  end
  return result
end
---------------------------------------------------
function REP:GetWords(str)
  local ret = {}
  local pos = 0
  local index = 0
  while(true) do
    local word
    _, pos, word = string.find(str, "^ *([^%s]+) *", pos + 1)
    if(not word) then
      return ret
    end
    ret[index] = word
    index = index + 1
  end
end
---------------------------------------------------
function REP:Concat(list, start, stop)
  local ret = ""

  if (start == nil) then start = 0 end
  if (stop == nil) then stop = REP:TableSize(list) end

  for i = start, stop do
    if list[i] then
      if (ret ~= "") then ret = ret.." " end
        ret = ret..list[i]
      end
    end
  return ret
end
---------------------------------------------------
function REP:BoolToEnabled(b)
  local result = REP_TXT.disabled
  if b then result = REP_TXT.enabled end
  return result
end
---------------------------------------------------
function REP:RGBToColour_perc(a, r, g, b)
  return string.format("|c%02X%02X%02X%02X", a*255, r*255, g*255, b*255)
end
---------------------------------------------------
function REP:has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end
---------------------------------------------------
function TableSort(a, b)
  return a.rep > b.rep
end
---------------------------------------------------
function REP:GetTableCount(table)
  local count = 0
  for _ in pairs(table) do count = count + 1 end
  return count
end
---------------------------------------------------
function REP:FormatLongName(name)
  -- Fix for super long names to force name on 2nd line
  local formattedName = name
  if (string.len(name) > 25 and string.find(name, "-")) then
    local tb = {}
    for i in (name .. "-"):gmatch("([^-]*)-") do
      table.insert(tb, i)
    end

    formattedName = tostring(tb[1]).." -"..string.char(10)..tostring(tb[2])
  end

  return formattedName
end
---------------------------------------------------
function REP:PlayCheckBoxSound(isChecked)
  if SOUNDKIT then
    local clickSound = isChecked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
    PlaySound(clickSound)
  end
end

-----------------------------------
-- Testing
-----------------------------------
function REP:Test()
  if REP_GuildFactionBar then
    if (REP_GuildFactionBar:GetParent()) then
      REP:Print("REP_GuildFactionBar parent: "..tostring(REP_GuildFactionBar:GetParent():GetName()))
    else
      REP:Print("REP_GuildFactionBar has no parent")
    end
  end

  if REP_GuildFactionBarCapHeader then
    if (REP_GuildFactionBarCapHeader:GetParent()) then
      REP:Print("REP_GuildFactionBarCapHeader parent: "..tostring(REP_GuildFactionBarCapHeader:GetParent():GetName()))
    else
      REP:Print("REP_GuildFactionBarCapHeader has no parent")
    end
  end

  if REP_GuildFactionBarCapText then
    if (REP_GuildFactionBarCapText:GetParent()) then
      REP:Print("REP_GuildFactionBarCapText parent: "..tostring(REP_GuildFactionBarCapText:GetParent():GetName()))
    else
      REP:Print("REP_GuildFactionBarCapText has no parent")
    end
  end

  if REP_GuildFactionBarCapMarker then
    if (REP_GuildFactionBarCapMarker:GetParent()) then
      REP:Print("REP_GuildFactionBarCapMarker parent: "..tostring(REP_GuildFactionBarCapMarker:GetParent():GetName()))
    else
      REP:Print("REP_GuildFactionBarCapMarker has no parent")
    end
  end

  if REP_GuildFactionBarBaseMarker then
    if (REP_GuildFactionBarBaseMarker:GetParent()) then
      REP:Print("REP_GuildFactionBarBaseMarker parent: "..tostring(REP_GuildFactionBarBaseMarker:GetParent():GetName()))
    else
      REP:Print("REP_GuildFactionBarBaseMarker has no parent")
    end
  end
end