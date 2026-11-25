---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, ReputationGuide = ...

-----------------------------
-- General Addon Functions --
-----------------------------
function ReputationGuide:About()
  local ver = ReputationGuide:GetAddOnMetadata(addonName, "Version")
  local date = ReputationGuide:GetAddOnMetadata(addonName, "X-Date")
  local author = ReputationGuide:GetAddOnMetadata(addonName, "Author")
  local web = ReputationGuide:GetAddOnMetadata(addonName, "X-Website")

  if (author ~= nil) then
    if ReputationGuide.AfterShadowLands then
      ReputationGuide:Print(addonName.." "..REP_TXT.by..": "..ReputationGuide.HELP_COLOUR..author.."|r", true)
    else
      ReputationGuide:Print(addonName.." "..REP_TXT.by..": "..ReputationGuide.HELP_COLOUR..author.."|r"..", "..REP_TXT.maintainedBy..": "..ReputationGuide.HELP_COLOUR.."Tvlfrosty-Firemaw".."|r", true)
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
    ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep watch <factionID> "..ReputationGuide.HELP_COLOUR..REP_TXT.helpwatch, true)
  end

  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep watchindex <factionIndex> "..ReputationGuide.HELP_COLOUR..REP_TXT.helpwatch, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep sync "..ReputationGuide.HELP_COLOUR..REP_TXT.helpsync, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep record [status | debug | clear] "..ReputationGuide.HELP_COLOUR..REP_TXT.helprecord, true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep enable { mobs | quests | repeatable | pvpquests | instances | items | all }", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep disable { mobs | quests | repeatable | pvpquests | instances | items | all }", true)
  ReputationGuide:Print(ReputationGuide.HELP_COLOUR..REP_TXT.usage..":|r /rep toggle { mobs | quests | repeatable | pvpquests | instances | items | all }", true)

  if ReputationGuide.AfterWoD then
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
  ReputationGuide:Print("   "..REP_TXT.statQuests..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowNonRepeatableQuests).."|r", true)
  ReputationGuide:Print("   "..REP_TXT.statRepeatableQuests..": "..ReputationGuide.HELP_COLOUR..ReputationGuide:BoolToEnabled(REP_Data.Global.ShowQuests).."|r", true)
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
    local numChatWindows = NUM_CHAT_WINDOWS or (Constants and Constants.ChatFrameConstants and Constants.ChatFrameConstants.MaxChatWindows) or 10

    for i = 1, numChatWindows do
      local chatTab = _G["ChatFrame"..i.."Tab"]
      if chatTab and chatTab:IsShown() then
        local chatFrame = _G["ChatFrame"..i]
        local messageTypes = chatFrame and chatFrame.messageTypeList or {}
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
    local _, word
    _, pos, word = string.find(str, "^ *([^%s]+) *", pos + 1)
    if(not word) then
      return ret
    end
    ret[index] = word
    index = index + 1
  end
end
---------------------------------------------------
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
---------------------------------------------------
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
-- Factions with a bonus from the Draenor trading post (by factionID, so it works in every client language).
local DRAENOR_TRADING_POST_FACTIONS = {
  [1731] = true, -- Council of Exarchs
  [1445] = true, -- Frostwolf Orcs
  [1682] = true, -- Wrynn's Vanguard
  [1681] = true, -- Vol'jin's Spear
  [1710] = true, -- Sha'tari Defense
  [1708] = true, -- Laughing Skull Orcs
  [1847] = true, -- Hand of the Prophet
  [1848] = true, -- Vol'jin's Headhunters
  [1515] = true, -- Arakkoa Outcasts
  [1849] = true, -- Order of the Awakened
  [1850] = true, -- The Saberstalkers
  [1711] = true, -- Steamwheedle Preservation Society
}

-- FactionIDs of the factions with a bonus reputation gain, read once per (re)load of the reputation sources
-- instead of scanning the faction list for every single source.
function ReputationGuide:GetBonusReputationFactions()
  if ReputationGuide._bonusRepFactions then return ReputationGuide._bonusRepFactions end

  local bonusFactions = {}

  for factionIndex = 1, ReputationGuide.Orig_GetNumFactions() do
    local factionData = ReputationGuide:GetFactionDataByIndex(factionIndex)

    if factionData and factionData.factionID and factionData.hasBonusRepGain then
      bonusFactions[factionData.factionID] = true
    end
  end

  ReputationGuide._bonusRepFactions = bonusFactions
  return bonusFactions
end

function ReputationGuide:ClearBonusReputationFactions()
  ReputationGuide._bonusRepFactions = nil
end

function ReputationGuide:GetReputationFactor(isHuman, factionID)
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

  if factionID then
    -- WoD Faction trading post bonus
    if ReputationGuide.HasTradingPost and DRAENOR_TRADING_POST_FACTIONS[factionID] then
      factor = factor + 0.2
    end

    -- Bonus reputation gain (e.g. commendations)
    if ReputationGuide:GetBonusReputationFactions()[factionID] then
      factor = factor + 1
    end
  end

  return factor
end
---------------------------------------------------
function ReputationGuide:GetCharacterDataForToolTip(factionID)
  local charactersForToolTip = {}

  for profileKey, profileData in pairs(REP_Data.ProfileKeys) do
    local k = REP_Data.ProfileKeys[profileKey]

    if k and k.profile then
      local showCharacter = k.profile.ShowChar or false

      if showCharacter then
        local currentCharacter = {}

        if k.factions and k.factions[factionID] then
          currentCharacter = {
            name = k.profile.name,
            class = k.profile.class,
            realm = k.profile.realm,
            standing = k.factions[factionID].standing,
            standingID = k.factions[factionID].standingID,
            current = k.factions[factionID].current,
            max = k.factions[factionID].max
          }
        else
          currentCharacter = {
            name = k.profile.name,
            class = k.profile.class,
            realm = k.profile.realm,
            standing = "",
            standingID = 0,
            current = 0,
            max = 0
          }
        end

        table.insert(charactersForToolTip, currentCharacter)
      end
    end
  end

  table.sort(charactersForToolTip, function(a, b)
    if (a.standingID or 0) ~= (b.standingID or 0) then
      return (a.standingID or 0) > (b.standingID or 0)
    else
      return (a.current or 0) > (b.current or 0)
    end
  end)
  
  return charactersForToolTip
end
---------------------------------------------------
function ReputationGuide:ShowReputationTooltip(frame, factionID, anchor)
  local factionData = ReputationGuide:GetFactionDataByID(factionID)
  if not factionData then return end

  local factionName
  if factionData.factionID == 1168 then
    factionName = REP_TXT.guildReputation
  else
    factionName = factionData.name
  end

  if (not factionData.description) then
    factionData.description = ""
  end

  if anchor then
    GameTooltip:SetOwner(frame, anchor)
  elseif ReputationGuide.IsForever then
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
  else
    GameTooltip:SetOwner(frame, "ANCHOR_CURSOR", 0, 40)
  end
  GameTooltip:ClearLines()
  GameTooltip:AddLine(factionName)
  GameTooltip:AddLine(factionData.description .. "\n\n", 1, 1, 1, 1)
  GameTooltip:AddLine(" ")
  ReputationGuide:AppendLinesForAnyToolTip(factionID, GameTooltip)
  GameTooltip:Show()
end
---------------------------------------------------
function ReputationGuide:AppendLinesForAnyToolTip(factionID, tooltip)
  if not tooltip or not factionID then return end

  local charData = ReputationGuide:GetCharacterDataForToolTip(factionID)
  for _, data in ipairs(charData) do
    local classColor = RAID_CLASS_COLORS[data.class] or { r = 1, g = 1, b = 1 }
    local standingColor = ReputationGuide.FACTION_BAR_COLORS[data.standingID] or {r = 0, g = 0.6, b = 0.1}
    local charName = format("%s-%s", data.name, data.realm)

    tooltip:AddDoubleLine(
      charName,
      string.format("%s (%d/%d)", data.standing, data.current, data.max),
      classColor.r, classColor.g, classColor.b,
      standingColor.r, standingColor.g, standingColor.b
    )
  end

  tooltip:Show()
end

function ReputationGuide:AppendLinesForModernToolTip(row)
  if not row then return end

  local factionID = row.factionID
  if not factionID and row.factionIndex then
    local data = ReputationGuide:GetFactionDataByIndex(row.factionIndex)
    factionID = data and data.factionID
  end

  if not factionID or factionID == 0 then return end

  local ownsTooltip = (GameTooltip:GetOwner() == row and GameTooltip:IsShown()) or (EmbeddedItemTooltip and EmbeddedItemTooltip:GetOwner() == row and EmbeddedItemTooltip:IsShown())

  if not ownsTooltip then
    -- The default UI did not show a tooltip for this row (Forever only shows progress text), so show our own.
    ReputationGuide:ShowReputationTooltip(row, factionID)
    return
  end

  if C_Reputation.IsFactionParagon(factionID) then
    local anchorTip = ReputationGuide:GetActiveAnchorTooltip(row)
    if not anchorTip then return end
    ReputationGuide:ShowExtraTooltip(anchorTip, factionID)
  else
    -- Non-paragon → just append into Blizzard's tooltip
    local modernTooltip = (EmbeddedItemTooltip and EmbeddedItemTooltip:GetOwner() == row) and EmbeddedItemTooltip or GameTooltip
    modernTooltip:AddLine(" ")
    ReputationGuide:AppendLinesForAnyToolTip(factionID, modernTooltip)
    modernTooltip:Show()
  end
end
---------------------------------------------------
function ReputationGuide:ShowExtraTooltip(anchorTip, factionID)
  if not anchorTip or not factionID then return end
  local tip = ReputationGuide:EnsureExtraTooltip()

  -- Rebuild our tooltip each time
  tip:Hide()
  tip:ClearLines()
  tip:SetOwner(UIParent, "ANCHOR_NONE")

  -- Same width as anchor, directly below it
  tip:ClearAllPoints()
  tip:SetPoint("TOPLEFT", anchorTip, "BOTTOMLEFT", 0, -6)

  ReputationGuide:AppendLinesForAnyToolTip(factionID, tip)
  tip:Show()
  tip:SetMinimumWidth(0)

  -- Ensure we follow resizing/closing of the anchor (paragon rewards can resize after data arrives)
  if not anchorTip._rgDockHooked then
    anchorTip:HookScript("OnHide", function() if tip:IsShown() then tip:Hide() end end)
    anchorTip._rgDockHooked = true
  end
end
---------------------------------------------------
function ReputationGuide:HideExtraTooltip()
  local tip = ReputationGuide and ReputationGuide.ExtraTooltip
  if tip then tip:Hide() end
end
---------------------------------------------------
function ReputationGuide:GetActiveAnchorTooltip(row)
  if EmbeddedItemTooltip and EmbeddedItemTooltip:GetOwner() == row then return EmbeddedItemTooltip end
  if GameTooltip and GameTooltip:GetOwner() == row then return GameTooltip end
  if EmbeddedItemTooltip and EmbeddedItemTooltip:IsShown() then return EmbeddedItemTooltip end
  return GameTooltip
end
---------------------------------------------------
function ReputationGuide:EnsureExtraTooltip()
  if self.ExtraTooltip then return self.ExtraTooltip end

  local tip = CreateFrame("GameTooltip", "ReputationGuideExtraTooltip", UIParent, "GameTooltipTemplate")
  tip:SetFrameStrata("TOOLTIP")
  tip:SetClampedToScreen(true)
  tip:Hide()

  self.ExtraTooltip = tip
  return tip
end
---------------------------------------------------
function ReputationGuide:HookFactionFrameMixinBar()
  if ReputationGuide.hasPrettyRepsLoaded then
    if PrettyRepsReputationEntryMixin then
      hooksecurefunc(PrettyRepsReputationEntryMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end)
      hooksecurefunc(PrettyRepsReputationEntryMixin, "OnLeave", function() ReputationGuide:HideExtraTooltip() end)
      hooksecurefunc(PrettyRepsReputationEntryMixin, "OnClick", function(self)
        ReputationGuide.PrettyRepsFactonID = nil
        local isSelected = self:IsSelected();  
        
        if isSelected and self.factionID ~= 0 then -- Due to hook, the IsSelected is fired late, so isntead of isAlreadySelected, we check if isSelected.
          ReputationGuide.PrettyRepsFactonID = self.factionID
        else
          ReputationGuide.PrettyRepsFactonID = nil
        end

        ReputationGuide:FillReputationDetailFrameWithData()
      end)
    end
    if PrettyRepsReputationSubHeaderMixin then
      hooksecurefunc(PrettyRepsReputationSubHeaderMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end)
      hooksecurefunc(PrettyRepsReputationSubHeaderMixin, "OnLeave", function() ReputationGuide:HideExtraTooltip() end)
      hooksecurefunc(PrettyRepsReputationSubHeaderMixin, "OnClick", function(self)
        ReputationGuide.PrettyRepsFactonID = nil
        local isSelected = self:IsSelected();  
        
        if isSelected and self.factionID ~= 0 then -- Due to hook, the IsSelected is fired late, so isntead of isAlreadySelected, we check if isSelected.
          ReputationGuide.PrettyRepsFactonID = self.factionID
        else
          ReputationGuide.PrettyRepsFactonID = nil
        end

        ReputationGuide:FillReputationDetailFrameWithData()
      end)
    end
    if PrettyRepsReputationHeaderMixin then
      hooksecurefunc(PrettyRepsReputationHeaderMixin, "OnClick", function(self)
        if ReputationGuide.Orig_ReputationDetailFrame and ReputationGuide.Orig_ReputationDetailFrame:IsShown() then
          ReputationGuide.Orig_ReputationDetailFrame:Hide();
        end
      end)
    end
  else
    local function OnLeave(row)
      ReputationGuide:HideExtraTooltip()

      -- The tooltip is our own when the default UI doesn't show one (Forever), so hide it as well.
      if GameTooltip:GetOwner() == row then
        GameTooltip:Hide()
      end
    end

    if ReputationEntryMixin then
      hooksecurefunc(ReputationEntryMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end)
      hooksecurefunc(ReputationEntryMixin, "OnLeave", OnLeave)
    end
    if ReputationSubHeaderMixin then
      hooksecurefunc(ReputationSubHeaderMixin, "OnEnter", function(row) ReputationGuide:AppendLinesForModernToolTip(row) end)
      hooksecurefunc(ReputationSubHeaderMixin, "OnLeave", OnLeave)
    end
  end
end
---------------------------------------------------
function ReputationGuide:HookWatchedFactionBar()
  if ReputationGuide.UseModernReputationUI then
    -- Hook the reputation bar itself, so the tooltip doesn't show on the experience (or any other) bar.
    local reputationBarIndex = StatusTrackingBarInfo and StatusTrackingBarInfo.BarsEnum and StatusTrackingBarInfo.BarsEnum.Reputation
    local hookedAny = false

    if reputationBarIndex then
      for _, container in ipairs({MainStatusTrackingBarContainer, SecondaryStatusTrackingBarContainer}) do
        local bar = container and container.bars and container.bars[reputationBarIndex]

        if bar and not bar._repTooltipHooked then
          bar:HookScript("OnEnter", function(self)
            -- Paragon factions already show their rewards tooltip.
            if EmbeddedItemTooltip and EmbeddedItemTooltip:IsShown() and EmbeddedItemTooltip:GetOwner() == self then return end

            local factionInfo = C_Reputation.GetWatchedFactionData()
            if factionInfo and factionInfo.factionID and factionInfo.factionID > 0 then
              ReputationGuide:ShowReputationTooltip(self, factionInfo.factionID, "ANCHOR_TOP")
            end
          end)
          bar:HookScript("OnLeave", function(self)
            if GameTooltip:GetOwner() == self then GameTooltip:Hide() end
          end)

          bar._repTooltipHooked = true
          hookedAny = true
        end
      end
    end

    if not hookedAny and MainStatusTrackingBarContainer and not MainStatusTrackingBarContainer._repTooltipHooked then
      MainStatusTrackingBarContainer:HookScript("OnEnter", function(self)
        local factionInfo = C_Reputation.GetWatchedFactionData()
        if factionInfo and factionInfo.factionID and factionInfo.factionID > 0 then
          ReputationGuide:ShowReputationTooltip(self, factionInfo.factionID, "ANCHOR_TOP")
        end
      end)
      MainStatusTrackingBarContainer:HookScript("OnLeave", function(self) if GameTooltip:GetOwner() == self then GameTooltip:Hide() end end)
      MainStatusTrackingBarContainer._repTooltipHooked = true
    end
  else
    if ReputationWatchBar then
      ReputationWatchBar:HookScript("OnEnter", function(self) ReputationGuide:ShowReputationTooltip(self, self.factionID) end)
      ReputationWatchBar:HookScript("OnLeave", function() GameTooltip:Hide() end)
    end
  end
end
---------------------------------------------------
function ReputationGuide:IsFactionUpdateEvent(event)
  if event == "UPDATE_FACTION" then return true end

  return ReputationGuide.UseScrollBoxReputationUI and (
    event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED"
    or event == "MAJOR_FACTION_UNLOCKED"
  )
end
------------------------------
-- Reputation Functions --
------------------------------
function ReputationGuide:WatchFactionByIndex(watchIndex)
  watchIndex = tonumber(watchIndex)
  if not watchIndex then return end
 
  local factionData = ReputationGuide:GetFactionDataByIndex(watchIndex)

  if factionData and factionData.name then
    if C_Reputation and C_Reputation.SetWatchedFactionByIndex then
      C_Reputation.SetWatchedFactionByIndex(watchIndex)
    elseif SetWatchedFactionIndex then
      SetWatchedFactionIndex(watchIndex)
    else
      ReputationGuide.Orig_SetWatchedFaction(watchIndex)
    end
    local name = factionData.name
    ReputationGuide:PrintNewWatchedFaction(name)
  else
    ReputationGuide:Print(string.format(REP_TXT.watchIndexNotFound, tostring(watchIndex)))
  end
end
---------------------------------------------------
function ReputationGuide:WatchFactionById(watchID)
  watchID = tonumber(watchID)
  if not watchID then return end

  local factionData = ReputationGuide:GetFactionDataByID(watchID)

  if factionData and factionData.name then
    if C_Reputation and C_Reputation.SetWatchedFactionByID then
      C_Reputation.SetWatchedFactionByID(watchID)
    elseif C_Reputation and C_Reputation.SetWatchedFaction then
      C_Reputation.SetWatchedFaction(watchID)
    else
      local watchIndex = ReputationGuide:GetFactionIndexBasedOnFactionID(watchID)
      if watchIndex then ReputationGuide:WatchFactionByIndex(watchIndex) end
      return
    end
    local name = factionData.name
    ReputationGuide:PrintNewWatchedFaction(name)
  else
    ReputationGuide:Print(string.format(REP_TXT.watchIDNotFound, tostring(watchID)))
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

  for i = 1, ReputationGuide.Orig_GetNumFactions(), 1 do
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

  if ReputationGuide.UseModernReputationUI then
    factionDataObj = ReputationGuide.Orig_GetFactionDataByIndex(factionIndex)
  else
    local factionData = {ReputationGuide.Orig_GetFactionDataByIndex(factionIndex)}
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

  if ReputationGuide.UseModernReputationUI then
    factionDataObj = ReputationGuide.Orig_GetFactionDataByID(factionID)
  else
    local factionData
    if ReputationGuide.Orig_GetFactionDataByID then
      factionData = {ReputationGuide.Orig_GetFactionDataByID(factionID)}
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
  if ReputationGuide.BFFLabels[factionID] ~= nil then
    if ReputationGuide.BFFLabels[factionID][nextFriendThreshold] then
      return ReputationGuide.BFFLabels[factionID][nextFriendThreshold]
    else
      return ""
    end
  else
    if ReputationGuide.BFFLabels[0][nextFriendThreshold] ~= nil then
      return ReputationGuide.BFFLabels[0][nextFriendThreshold]
    else
      return ""
    end
  end
end
---------------------------------------------------
function ReputationGuide:GetFriendFactionDataByID(factionID)
  if not factionID then return end

  local friendshipFactionDataObj = {}

  if ReputationGuide.Orig_GetFriendshipReputation then
    friendshipFactionDataObj = ReputationGuide.Orig_GetFriendshipReputation(factionID)
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
function ReputationGuide:GetFactionDataToBuildReputationlist()
  local factionDataObj

  if ReputationGuide.hasPrettyRepsLoaded and ReputationGuide.PrettyRepsFactonID and ReputationGuide.PrettyRepsFactonID ~= 0 then
    factionDataObj = ReputationGuide:GetFactionDataByID(ReputationGuide.PrettyRepsFactonID)
  elseif ReputationGuide.UseDetailPanel then
    factionDataObj = ReputationGuide:GetSelectedFactionData()
  else
    local factionIndex = ReputationGuide.Orig_GetSelectedFaction()
    factionDataObj = ReputationGuide:GetFactionDataByIndex(factionIndex)
  end

  if not factionDataObj or not factionDataObj.factionID then return end

  local standingID, barMin, barMax, barValue, isCapped, repToNext
  local isFriend, atParagon = false, false
  local factionID = factionDataObj.factionID
  local isMajorFaction = ReputationGuide.Orig_IsMajorFaction and ReputationGuide.Orig_IsMajorFaction(factionID)

  if isMajorFaction then
    local majorFactionData = ReputationGuide.Orig_GetMajorFactionData(factionID)
    local hasParagon = ReputationGuide:IsAtParagon(factionID)

    barMin = 0
    standingID = majorFactionData.renownLevel
    isCapped = ReputationGuide.Orig_HasMaximumRenown(factionID)

    if isCapped and hasParagon then
      -- Max renown with a paragon track: the sources count towards the next paragon reward.
      local currentValue, threshold, _, _ = ReputationGuide.Orig_GetFactionParagonInfo(factionID)
      barMax, barValue = threshold, mod(currentValue, threshold)
      atParagon = true
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
      standingID = factionDataObj.reaction
      isCapped = standingID == 8 and (factionDataObj.nextReactionThreshold - factionDataObj.currentStanding) <= 1

      if standingID >= 4 then
        barMax = factionDataObj.nextReactionThreshold or 0
      else
        barMin = barMin * -1
        barValue = barValue * -1
        barMax = (factionDataObj.currentReactionThreshold - factionDataObj.nextReactionThreshold) * -1
      end
    end
  end

  if not isMajorFaction and ReputationGuide:IsAtParagon(factionID, factionDataObj.reaction) then
    local currentValue, threshold, rewardQuestID, hasRewardPending = ReputationGuide.Orig_GetFactionParagonInfo(factionID)
    barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
    atParagon = true
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

    if atParagon then
      -- Capped, but the paragon track keeps going.
      repToNext = barMax - barValue
    elseif isCapped then
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
---------------------------------------------------
function ReputationGuide:DetectReputationChanges()
  local changes = {}

  if ReputationGuide.UseModernReputationUI then
    ReputationGuide:IndexNewFactionsFromList()
  end
  local oldSnapshot = ReputationGuide._repSnapshot or {}
  local newSnapshot = ReputationGuide:BuildReputationSnapshot()

  -- Building the snapshot refreshes the cached info of every faction, so afterwards every faction
  -- is back at "no change" (0). Store that directly instead of scanning all factions again.
  local baseline = {}
  for factionID in pairs(newSnapshot) do
    baseline[factionID] = 0
  end

  for factionID, newValue in pairs(newSnapshot) do
    local oldValue = oldSnapshot[factionID]

    if oldValue == nil or newValue ~= oldValue then
      local info = {}
      info["factionID"] = factionID

      if type(newValue) == "number" then
        info["change"] = math.abs(newValue)
        if tonumber(newValue) < 0 then
          info["negative"] = true
        end
      else
        info["change"] = 0
      end

      if oldValue == nil then
        info = ReputationGuide:getFactionInfoForNewFaction(info)

        changes[#changes + 1] = {
          factionID = factionID,
          change = newValue,
          isNewFaction = true,
          info = info
        }
      elseif newValue ~= oldValue then
        info = ReputationGuide:getFactionInfo(info)

        changes[#changes + 1] = {
          factionID = factionID,
          change = newValue,
          isNewFaction = false,
          info = info
        }
      end
    end
  end

  -- A new faction can index more factions, take a full snapshot then (rare).
  local hasNewFaction = false
  for _, change in ipairs(changes) do
    if change.isNewFaction then hasNewFaction = true break end
  end

  if hasNewFaction then
    ReputationGuide:TakeReputationSnapshot()
  else
    ReputationGuide._repSnapshot = baseline
  end

  return changes
end