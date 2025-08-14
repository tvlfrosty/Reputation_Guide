---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, ReputationGuide = ...

-----------------------------
-- General Addon Functions --
-----------------------------
function ReputationGuide:About()
  local ver = GetAddOnMetadata("ReputationGuide", "Version")
  local date = GetAddOnMetadata("ReputationGuide", "X-Date")
  local author = GetAddOnMetadata("ReputationGuide", "Author")
  local web = GetAddOnMetadata("ReputationGuide", "X-Website")

  if (author ~= nil) then
    if ReputationGuide.AfterShadowLands then
      ReputationGuide:Print(addonName.." "..REP_TXT.by..": "..ReputationGuide.HELP_COLOUR..author.."|r", true)
    else
      ReputationGuide:Print(addonName.." "..REP_TXT.by..": "..ReputationGuide.HELP_COLOUR..author.."|r"..", updated and maintained by: "..ReputationGuide.HELP_COLOUR.."Tvlfrosty-Firemaw".."|r", true)
    end
  end
  if (ver ~= nil) then
    ReputationGuide:Print(" "..REP_TXT.version..": "..ReputationGuide.HELP_COLOUR..ver.."|r", true)
  end

  if (date ~= nil) then
    ReputationGuide:Print(" "..REP_TXT.date..": "..ReputationGuide.HELP_COLOUR..date.."|r", true)
  end
  if (web ~= nil) then
    ReputationGuide:Print(" "..REP_TXT.web..": "..ReputationGuide.HELP_COLOUR..web.."|r", true)
  end
end
---------------------------------------------------
function ReputationGuide:Help()
  ReputationGuide:Print(" ", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..addonName..":|r "..REP_TXT.help, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep help "..ReputationGuide.HELP_COLOUR..REP_TXT.helphelp, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep about "..ReputationGuide.HELP_COLOUR..REP_TXT.helpabout, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep status "..ReputationGuide.HELP_COLOUR..REP_TXT.helpstatus, true)
  
  if ReputationGuide.AfterClassic then
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep watch <factionID> "..ReputationGuide.HELP_COLOUR.."Set faction as watched", true) -- TODO: Add as localised text
  end

  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep watchindex <factionIndex> "..ReputationGuide.HELP_COLOUR.."Set faction as watched", true) -- TODO: Add as localised text
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep enable { mobs | quests | pvpquests | instances | items | all }", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep disable { mobs | quests | pvpquests | instances | items | all }", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep toggle { mobs | quests | pvpquests | instances | items | all }", true)

  if ReputationGuide.AfterWod then
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep enable { missing | details | chat | paragon }", true)
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep disable { missing | details | chat | paragon }", true)
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep toggle { missing | details | chat | paragon }" , true)
  else
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep enable { missing | details | chat }", true)
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep disable { missing | details | chat }", true)
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep toggle { missing | details | chat }" , true)
  end
end
---------------------------------------------------
function ReputationGuide:Status()
  ReputationGuide:Print(" ", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..addonName..":|r "..REP_TXT.status, true)
  ReputationGuide:Print("   "..REP_TXT.statMobs..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowMobs).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statQuests..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowQuests).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statInstances..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowInstances).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statItems..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowItems).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statGeneral..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowGeneral).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statMissing..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowMissing).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statDetails..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ExtendDetails).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statChat..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.WriteChatMessage).."|r", true)

  ReputationGuide:Print("   "..REP_TXT.statNoGuildChat..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.NoGuildGain).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statPreview..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowPreviewRep).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statSwitch..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.SwitchFactionBar).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statNoGuildSwitch..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.NoGuildSwitch).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statSilentSwitch..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.SilentSwitch).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.EnableParagonBar..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowParagonBar).."|r", true)
end
------------------------------
-- General Helper Functions --
------------------------------
function ReputationGuide:Print(msg, forceDefault)
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
function ReputationGuide:DumpTable(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. ReputationGuide:DumpTable(v) .. ','
    end

    return s .. '} '
  else
    return tostring(o)
  end
end
---------------------------------------------------
function ReputationGuide:Printtest(msg, msg1, msg2)
  ReputationGuide:Print(""..tostring(msg).." "..tostring(msg1).."  "..tostring(msg2), nil)
end

function ReputationGuide:PrintSlash(msg, msg1)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..addonName..":|r "..msg.." ["..ReputationGuide.HELP_COLOUR..msg1.."|r]", true)
  ReputationGuide:Help()
end
---------------------------------------------------
function ReputationGuide:Debug(msg)
  if not (msg) then return end
  ReputationGuide:Print(msg)
end
---------------------------------------------------
function ReputationGuide:TableSize(info)
  local result = 0
  if info then
    for item in pairs(info) do result = result + 1 end
  end
  return result
end
---------------------------------------------------
function ReputationGuide:GetWords(str)
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
function ReputationGuide:Concat(list, start, stop)
  local ret = ""

  if (start == nil) then start = 0 end
  if (stop == nil) then stop = ReputationGuide:TableSize(list) end

  for i = start, stop do
    if list[i] then
      if (ret ~= "") then ret = ret.." " end
        ret = ret..list[i]
      end
    end
  return ret
end
---------------------------------------------------
function ReputationGuide:BoolToEnabled(b)
  local result = REP_TXT.disabled
  if b then result = REP_TXT.enabled end
  return result
end
---------------------------------------------------
function ReputationGuide:RGBToColour_perc(a, r, g, b)
  return string.format("|c%02X%02X%02X%02X", a*255, r*255, g*255, b*255)
end
---------------------------------------------------
function ReputationGuide:has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end
---------------------------------------------------
function ReputationGuide:TableSort(a, b)
  return a.rep > b.rep
end
---------------------------------------------------
function ReputationGuide:GetTableCount(table)
  local count = 0
  for _ in pairs(table) do count = count + 1 end
  return count
end
---------------------------------------------------
function ReputationGuide:FormatLongName(name)
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
function ReputationGuide:PlayCheckBoxSound(isChecked)
  if SOUNDKIT then
    local clickSound = isChecked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
    PlaySound(clickSound)
  end
end
---------------------------------------------------
function ReputationGuide:RoundToOneDecimal(num)
  return math.floor(num * 10 + 0.5) / 10
end
------------------------------
-- Core addon functions --
------------------------------
function ReputationGuide:GetClassColor(class)
  if class and RAID_CLASS_COLORS[class] then
    return RAID_CLASS_COLORS[class].colorStr
  else
    return "FFFFFF"
  end
end
---------------------------------------------------
function ReputationGuide:GetReputationFactor(isHuman, factionName)
  local factor = 1.0

  -- Race check (Human racial removed in 11.0.0)
  if isHuman and not ReputationGuide.AfterDragonflight then factor = factor + 0.1 end

  -- Wickerman (Hallow's end) reputation buff setting
  if REP_Data.Global.WickermanRepBuff then
    factor = factor + 0.1
  end

  -- Pilgrim's Bounty festival reputation buff setting
  if REP_Data.Global.HarvestBountyRepBuff then
    factor = factor + 0.1
  end

  -- Guild reputation buff rank setting, rank 2 overrides rank 1 and should always be leading.
  if REP_Data.Global.GuildRepBuffRankTwo then
    factor = factor + 0.1
  elseif REP_Data.Global.GuildRepBuffRankOne then
    factor = factor + 0.05
  end

  -- Darkmoon Faire reputation buff setting
  if REP_Data.Global.DarkmoonfaireWeeRepBuff or REP_Data.Global.DarkmoonfaireHatRepBuff then
    factor = factor + 0.1
  end

  if factionName then
    local draenorFactions = {
      "Council of Exarchs",
      "Frostwolf Orcs",
      "Wrynn's Vanguard",
      "Vol'jin's Spear",
      "Sha'tari Defense",
      "Laughing Skull Orcs",
      "Hand of the Prophet",
      "Vol'jin's Headhunters",
      "Arakkoa Outcasts",
      "Order of the Awakened",
      "The Saberstalkers",
      "Steamwheedle Preservation Society"
    }

    -- WoD Faction trading post bonus
    if ReputationGuide:has_value(draenorFactions, factionName) and ReputationGuide.HasTradingPost then
      factor = factor + 0.2
    end
  
    -- bonus repgain check
    local factionOffset = 0
    local factionIndex
    local numFactions = REP_Orig_GetNumFactions()

    for i = 1, numFactions do
      local factionIndex = factionOffset + i
      if (factionIndex <= numFactions) then
        local factionData = ReputationGuide:GetFactionDataByIndex(factionIndex)

        if factionData then
          name = factionData.name
          factionID = factionData.factionID
          hasBonusRepGain = factionData.hasBonusRepGain

          if factionID == 1168 then
            name = tostring(name).." (guild)"
          end
        end

        if (factionName == name) and hasBonusRepGain then
          factor = factor + 1
        end
      end
    end
  end

  return factor or 1.0
end
---------------------------------------------------
function ReputationGuide:GetCharacterDataForToolTip(factionID)
  local charactersForToolTip = {}

  for profileKey, profileData in pairs(REP_Data.ProfileKeys) do
    local k = REP_Data.ProfileKeys[profileKey]
    local showCharacter = k.profile.ShowChar or false

    if showCharacter then
      local currentCharacter = {}

      if k.factions and k.factions[factionID] then
        currentCharacter = {
          name = k.profile.name,
          class = k.profile.class,
          standing = k.factions[factionID].standing,
          standingID = k.factions[factionID].standingID,
          current = k.factions[factionID].current,
          max = k.factions[factionID].max
        }
      else
        currentCharacter = {
          name = k.profile.name,
          class = k.profile.class,
          standing = "",
          standingID = 0,
          current = 0,
          max = 0
        }
      end

      table.insert(charactersForToolTip, currentCharacter)
    end
  end
  
  return charactersForToolTip
end
---------------------------------------------------
function ReputationGuide:ShowReputationTooltip(frame, factionID)
  local factionData = ReputationGuide:GetFactionDataByID(factionID)
  if not factionData then return end

  GameTooltip:SetOwner(frame, "ANCHOR_CURSOR", 0, 40)
  GameTooltip:ClearLines()
  GameTooltip:AddLine(factionData.name)
  GameTooltip:AddLine(factionData.description .. "\n\n", 1, 1, 1, 1 )

  local charData = ReputationGuide:GetCharacterDataForToolTip(factionID)
  table.sort(charData, function(a, b)
    if (a.standingID or 0) ~= (b.standingID or 0) then
      return (a.standingID or 0) > (b.standingID or 0)
    else
      return (a.current or 0) > (b.current or 0)
    end
  end)

  for _, data in ipairs(charData) do
    local classColor = RAID_CLASS_COLORS[data.class] or { r = 1, g = 1, b = 1 }
    local standingColor = ReputationGuide.FACTION_BAR_COLORS[data.standingID] or {r = 0, g = 0.6, b = 0.1}

    GameTooltip:AddDoubleLine(
      data.name,
      string.format("%s (%d/%d)", data.standing, data.current, data.max),
      classColor.r, classColor.g, classColor.b,
      standingColor.r, standingColor.g, standingColor.b
    )
  end

  GameTooltip:Show()
end
---------------------------------------------------
function ReputationGuide:HookWatchedFactionBar()
  if ReputationGuide.AfterDragonflight then
    if MainStatusTrackingBarContainer then
      MainStatusTrackingBarContainer:HookScript("OnEnter", function(self)
        self:ShowText()
        local factionInfo = C_Reputation.GetWatchedFactionData()
        if factionInfo then
          ReputationGuide:ShowReputationTooltip(self, factionInfo.factionID)
        end
      end)
      MainStatusTrackingBarContainer:HookScript("OnLeave", function(self) self:HideText() GameTooltip:Hide() end)
    end
  else
    if ReputationWatchBar then
      ReputationWatchBar:HookScript("OnEnter", function(self) ReputationGuide:ShowReputationTooltip(self, self.factionID) end)
      ReputationWatchBar:HookScript("OnLeave", function() GameTooltip:Hide() end)
    end
  end
end
---------------------------------------------------
function ReputationGuide:AppendLinesForModernToolTip(row)    
  if not row then return end

  local factionID = row.factionID
  if not factionID and row.factionIndex then
    local data = ReputationGuide.GetFactionDataByIndex(row.factionIndex)
    factionID = data and data.factionID
  end
  if not factionID then return end

  local tip = (EmbeddedItemTooltip:GetOwner() == row) and EmbeddedItemTooltip or GameTooltip

  tip:AddLine(" ")

  local charData = ReputationGuide:GetCharacterDataForToolTip(factionID)
  for _, data in ipairs(charData) do
    local classColor = RAID_CLASS_COLORS[data.class] or { r = 1, g = 1, b = 1 }
    local standingColor = FACTION_BAR_COLORS[data.standingID] or { r = 1, g = 1, b = 1 }

    tip:AddDoubleLine(
      data.name,
      string.format("%s (%d/%d)", data.standing, data.current, data.max),
      classColor.r, classColor.g, classColor.b,
      standingColor.r, standingColor.g, standingColor.b
    )
  end

  tip:Show()
end
---------------------------------------------------
function ReputationGuide:HookFactionFrameMixinBar()    
  if ReputationEntryMixin then hooksecurefunc(ReputationEntryMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end) end
  if ReputationSubHeaderMixin then hooksecurefunc(ReputationSubHeaderMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end) end
end
------------------------------
-- Reputation Functions --
------------------------------
function ReputationGuide:WatchFactionByIndex(watchIndex)
  if not watchIndex then return end
 
  local factionData = ReputationGuide:GetFactionDataByIndex(watchIndex)

  if factionData then
    REP_Orig_SetWatchedFaction(watchIndex)
    local name = factionData.name
    ReputationGuide:PrintNewWatchedFaction(name)
  else
    ReputationGuide:Print("Could not find an active faction with index #"..tostring(watchIndex))
  end
end
---------------------------------------------------
function ReputationGuide:WatchFactionById(watchID)
  if not watchID then return end

  local factionData = ReputationGuide:GetFactionDataByID(watchID)

  if factionData then
    REP_Orig_SetWatchedFaction(watchID)
    local name = factionData.name
    ReputationGuide:PrintNewWatchedFaction(name)
  else
    ReputationGuide:Print("Could not find a faction with factionID: "..tostring(watchID))
  end
end
---------------------------------------------------
function ReputationGuide:PrintNewWatchedFaction(name)
  if not name or REP_Data.Global.SilentSwitch then return end
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..addonName..":|r "..REP_TXT.switchBar.." ["..tostring(name).."|r]")
end
---------------------------------------------------
function ReputationGuide:GetFactionIndexBasedOnFactionID(factionIdForIndex)
  local factionIndexByID

  for i = 1, REP_Orig_GetNumFactions(), 1 do
    local index = i
    local factionID = ReputationGuide:GetFactionDataByIndex(index).factionID

    if factionID and factionID == factionIdForIndex then
      factionIndexByID = index
    end
  end

  return factionIndexByID
end
---------------------------------------------------
function ReputationGuide:GetFactionDataByIndex(factionIndex)
  if not factionIndex then return end

  local factionDataObj

  if ReputationGuide.AfterDragonflight then
    factionDataObj = REP_Orig_GetFactionDataByIndex(factionIndex)
  else
    local factionData = {REP_Orig_GetFactionDataByIndex(factionIndex)}
    factionDataObj = {
      name = factionData[1],
      description = factionData[2],
      reaction = factionData[3], -- standingID
      currentReactionThreshold = factionData[4], -- barMin
      nextReactionThreshold = factionData[5], -- barMax
      currentStanding = factionData[6], -- barValue
      atWarWith = factionData[7],
      canToggleAtWar = factionData[8],
      isHeader = factionData[9],
      isCollapsed = factionData[10],
      isHeaderWithRep = factionData[11], -- hasRep
      isWatched = factionData[12],
      isChild = factionData[13],
      factionID = factionData[14],
      hasBonusRepGain = factionData[15],
      canBeLFGBonus = factionData[16],
      canSetInactive = not factionData[9] or factionData[11],
      isAccountWide = false
    }
  end

  return factionDataObj or {}
end
---------------------------------------------------
function ReputationGuide:GetFactionDataByID(factionID)
  if not factionID then return end

  local factionDataObj

  if ReputationGuide.AfterDragonflight then
    factionDataObj = REP_Orig_GetFactionDataByID(factionID)
  else
    local factionData
    if REP_Orig_GetFactionDataByID then
      factionData = {REP_Orig_GetFactionDataByID(factionID)}
    else
      factionData = {GetFactionInfoByID(factionID)}
    end

    factionDataObj = {
      name = factionData[1],
      description = factionData[2],
      reaction = factionData[3], -- standingID
      currentReactionThreshold = factionData[4], -- barMin
      nextReactionThreshold = factionData[5], -- barMax
      currentStanding = factionData[6], -- barValue
      atWarWith = factionData[7],
      canToggleAtWar = factionData[8],
      isHeader = factionData[9],
      isCollapsed = factionData[10],
      isHeaderWithRep = factionData[11], -- hasRep
      isWatched = factionData[12],
      isChild = factionData[13],
      factionID = factionData[14],
      hasBonusRepGain = factionData[15],
      canBeLFGBonus = factionData[16],
      canSetInactive = not factionData[9] or factionData[11],
      isAccountWide = false
    }
  end

  return factionDataObj or {}
end
---------------------------------------------------
function ReputationGuide:getFactionLabel(standingID)
	if standingID == "paragon" then
		return "Paragon"
	end

	if (standingID == "renown") then
		return "Renown"
	end

  if (standingID == "friendship") then
		return "Renown"
	end

	return GetText("FACTION_STANDING_LABEL" .. standingID, UnitSex("player"))
end
---------------------------------------------------
function ReputationGuide:GetFriendFactionStandingLabel(factionID, nextFriendThreshold)
  local REP_BFFLabels = ReputationGuide.BFFLabels

  if REP_BFFLabels[factionID] ~= nil then
    if REP_BFFLabels[factionID][nextFriendThreshold] then
      return REP_BFFLabels[factionID][nextFriendThreshold]
    else
      return ""
    end
  else
    if REP_BFFLabels[0][nextFriendThreshold] ~= nil then
      return REP_BFFLabels[0][nextFriendThreshold]
    else
      return ""
    end
  end
end
---------------------------------------------------
function ReputationGuide:GetFriendFactionDataByID(factionID)
  if not factionID then return end

  local friendshipFactionDataObj = {}

  if REP_Orig_GetFriendshipReputation then
    friendshipFactionDataObj = REP_Orig_GetFriendshipReputation(factionID)
  else
    local friendshipFactionData = {GetFriendshipReputation(factionID)}

    friendshipFactionDataObj = {
      friendshipFactionID = friendshipFactionData[1], -- friendID
      standing = friendshipFactionData[2], -- friendRep
      maxRep = friendshipFactionData[3], -- friendMaxRep
      name = friendshipFactionData[4], -- friendName
      text = friendshipFactionData[5], -- friendText
      texture = friendshipFactionData[6], -- friendTexture
      reaction = friendshipFactionData[7], -- friendTextLevel
      reactionThreshold = friendshipFactionData[8], -- friendThreshold
      nextThreshold = friendshipFactionData[9], -- nextFriendThreshold
    }
  end
  
  if (not friendshipFactionDataObj or not friendshipFactionDataObj.standing or not friendshipFactionDataObj.friendshipFactionID or friendshipFactionDataObj.friendshipFactionID == 0) then return end

  local friendReputationInfo = friendshipFactionDataObj or {}

  local nonCappedBarMax, nonCappedBarValue
  if friendReputationInfo.nextThreshold and friendReputationInfo.reactionThreshold then
    nonCappedBarMax = friendReputationInfo.nextThreshold - friendReputationInfo.reactionThreshold
    nonCappedBarValue = friendReputationInfo.standing - friendReputationInfo.reactionThreshold
  end

  friendReputationInfo.colorIndex = 5	-- always color friendships green
  friendReputationInfo.factionStandingtext = friendReputationInfo.reaction
  friendReputationInfo.isCappedFriendship = not friendReputationInfo.nextThreshold
  friendReputationInfo.barMax = nonCappedBarMax or 1
  friendReputationInfo.barValue = nonCappedBarValue or 1
  friendReputationInfo.barMin = friendReputationInfo.reactionThreshold or 0
  friendReputationInfo.isFriend = true

  return friendReputationInfo
end
---------------------------------------------------
function ReputationGuide:GetFactionDataByIndexToBuildReputationlist(factionIndex)
  if not factionIndex then return end

  local factionDataObj

  if ReputationGuide.AfterDragonflight then
    factionDataObj = REP_Orig_GetFactionDataByIndex(factionIndex)
  else
    local factionData = {REP_Orig_GetFactionDataByIndex(factionIndex)}
    factionDataObj = {
      name = factionData[1],
      description = factionData[2],
      reaction = factionData[3], -- standingID
      currentReactionThreshold = factionData[4], -- barMin
      nextReactionThreshold = factionData[5], -- barMax
      currentStanding = factionData[6], -- barValue
      atWarWith = factionData[7],
      canToggleAtWar = factionData[8],
      isHeader = factionData[9],
      isCollapsed = factionData[10],
      isHeaderWithRep = factionData[11], -- hasRep
      isWatched = factionData[12],
      isChild = factionData[13],
      factionID = factionData[14],
      hasBonusRepGain = factionData[15],
      canBeLFGBonus = factionData[16],
      canSetInactive = not factionData[9] or factionData[11],
      isAccountWide = false
    }
  end

  if not factionDataObj or not factionDataObj.factionID then return end

  local standingID, barMin, barMax, barValue, isCapped, repToNext
  local isFriend = false
  local factionID = factionDataObj.factionID
  local isMajorFaction = REP_Orig_IsMajorFaction and REP_Orig_IsMajorFaction(factionID)

  if isMajorFaction then
    local majorFactionData = REP_Orig_GetMajorFactionData(factionID)
    local hasParagon = REP_Orig_GetFactionParagonInfo(factionID)

    barMin = 0
    standingID = majorFactionData.renownLevel
    isCapped = REP_Orig_HasMaximumRenown(factionID)

    if isCapped and hasParagon then
      -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
      local currentValue, threshold, _, _ = REP_Orig_GetFactionParagonInfo(factionID)
      barMax, barValue = threshold, mod(currentValue, threshold)     
    else
      barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
      barMax = standingID * majorFactionData.renownLevelThreshold
      barValue = ((standingID - 1) * majorFactionData.renownLevelThreshold) + barValue
    end
  else
    local friendReputationInfo = ReputationGuide:GetFriendFactionDataByID(factionID)
    
    if friendReputationInfo then
      barMin = friendReputationInfo.barMin
      barValue = friendReputationInfo.barValue
      barMax = friendReputationInfo.barMax
      isCapped = friendReputationInfo.isCappedFriendship
      standingID = factionDataObj.reaction + 2
      isFriend = true
    else
      barMin = factionDataObj.currentReactionThreshold
      barValue = factionDataObj.currentStanding
      isCapped = standingID == 8 and (factionDataObj.nextReactionThreshold - factionDataObj.currentStanding) == 1
      standingID = factionDataObj.reaction

      if standingID >= 4 then
        barMax = factionDataObj.nextReactionThreshold or 0
      else
        barMin = barMin * -1
        barValue = barValue * -1
        barMax = (factionDataObj.currentReactionThreshold - factionDataObj.nextReactionThreshold) * -1
      end
    end
  end

  if REP_Orig_IsFactionParagon and REP_Orig_IsFactionParagon(factionID) then
    local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
    barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
  end

  -- Normalize Values
  local normMax, repToNext, normCurrent

  if isFriend then
    normCurrent = barValue
  else 
    normCurrent = barValue - barMin
  end

  if standingID < 4 then
    normMax = barMax
    repToNext = normMax - normCurrent
  else
    normMax = barMax - barMin

    if isCapped then
      repToNext = 0
    else
      repToNext = barMax - barValue
    end
  end

  local faction = factionDataObj.name
  local factionNameLowercase, originalFactionName

  if factionID == 1168 then
    originalFactionName = faction.." (guild)"
    factionNameLowercase = string.lower(faction).." (guild)"
  else
    originalFactionName = faction
    factionNameLowercase = string.lower(faction)
  end

  factionDataObj.normMin = barMin or 0
  factionDataObj.normMax = barMax or 1
  factionDataObj.normCurrent = normCurrent or 1
  factionDataObj.repToNext = repToNext or 0
  factionDataObj.currentStandingID = standingID
  factionDataObj.originalFactionName = originalFactionName
  factionDataObj.factionNameLowercase = factionNameLowercase

  return factionDataObj or {}
end