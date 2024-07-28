----------------------------------------------------------
-- Reputation Guide | A World of Warcraft addon to help you manage your reputation and Factions. --
-------------------------------------------------------
---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, vars = ...
local REP = vars
---------------------------
-- _00_ Variables Set up --
---------------------------
---- Stored data (Data saved between sessions)
REP_Data = {}
---- Initialization
REP_Main = nil
REP_InitComplete = nil
REP_VarsLoaded = nil
REP_InitStages = 0
REP_InitCount = 0
REP_difficultyID = 0
REP_UpdateRequest = nil
REP_UPDATE_INTERVAL = 5
REP_OnLoadingScreen = false
---- Faction information
REP_FactionMapping = {}
REP_FactionGain = {}
---- Tracking data
REP_Entries = {}

------------------------
-- _01_ Addon Startup --
------------------------
function REP_OnLoad(self)
  -- Events monitored by Event Handler
  REP_Main = self
  self:RegisterEvent("ADDON_LOADED")
  self:RegisterEvent("VARIABLES_LOADED")
  self:RegisterEvent("PLAYER_ENTERING_WORLD")
  self:RegisterEvent("PLAYER_LOGIN")
  self:RegisterEvent("LOADING_SCREEN_ENABLED")
  self:RegisterEvent("LOADING_SCREEN_DISABLED")

  -- Slash commands for CLI
  SLASH_REP1 = "/REP"
  SLASH_REP2 = "/reputations"
  SlashCmdList.REP = REP_SlashHandler

  -- Create data structures
  local defaultData = {
    ProfileKeys = {},
    ShowInstances = true,
    ShowQuests = true,
    ShowPvPQuests = true,
    SwitchFactionBar = false,
    SilentSwitch = false,
    WriteChatMessage = true,
    ChatFrame = 0,
    ExtendDetails = true,
    ShowMobs = true,
    OriginalCollapsed = {},
    ShowMissing = true,
    ShowItems = true,
    ShowPreviewRep = true,
    ShowGeneral = true,
    SortByStanding = false,
  }

  -- Assign the default settings
  if not REP_Data then REP_Data = {} end
  if not REP_Data.Global then REP_Data.Global = defaultData end

  for option, default in pairs(defaultData) do
    if REP_Data.Global[option] == nil then REP_Data.Global[option] = default end
  end

  local expansionIndex = GetExpansionLevel();
  if not REP_Data.Global.ExpansionIndex then REP_Data.Global.ExpansionIndex = expansionIndex end
  if (REP_Data.Global.ExpansionIndex ~= expansionIndex) then REP_Data.Global.ExpansionIndex = expansionIndex end

  if expansionIndex then
    REP:GetActiveExpansionAndPhase(expansionIndex)
  else
    REP:ResetsActiveExpansionAndPhase()
    REP.IsClassic = true
  end

  REP_Orig_GetFactionInfo = GetFactionInfo
  REP_Orig_ReputationFrame_Update = ReputationFrame_Update
  REP_Orig_ReputationBar_OnClick = ReputationBar_OnClick
  REP_Orig_ExpandFactionHeader = ExpandFactionHeader
  ExpandFactionHeader = REP_ExpandFactionHeader
  REP_Orig_CollapseFactionHeader = CollapseFactionHeader
  CollapseFactionHeader = REP_CollapseFactionHeader

  if ReputationFrameStandingLabel then
    REP_Orig_StandingText = ReputationFrameStandingLabel:GetText()
  end

  if (not REP.AfterShadowLands) then
    ReputationFrame_Update = REP_ReputationFrame_Update
    ReputationBar_OnClick = REP_ReputationBar_OnClick
  end
  
  -------------------------------
  -- Fix for 10.0 Dragonflight --
  -------------------------------
  if (REP.AfterShadowLands and not REP.AfterDragonflight)  then
    hooksecurefunc("ReputationFrame_InitReputationRow", function(factionRow)
      local factionIndex = factionRow.index
      local factionContainer = factionRow.Container
      local factionBar = factionContainer.ReputationBar
      local factionStanding = factionBar.FactionStanding
      local _, _, standingID, barMin, barMax, barValue, _, canToggleAtWar, isHeader, _, _, _, _, factionID, hasBonusRepGain, _ = GetFactionInfo(factionIndex) -- name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canSetInactive
    
      local origBarValue = barValue

      local friendReputationInfo = REP_Friend_Detail(factionID, standingID, factionRow)
      local colorIndex = friendReputationInfo.colorIndex
      local isCappedFriendship = friendReputationInfo.isCappedFriendship
      local factionStandingtext = friendReputationInfo.factionStandingtext
      local isFriend = friendReputationInfo.isFriend

      local isCapped
      -- local barColor
    
      -- check if this is a friendship faction or a Major Faction
      local isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)
      local repInfo = factionID and C_GossipInfo.GetFriendshipReputation(factionID)
      -- local isMajorFactionUnlocked = false
      if (repInfo and repInfo.friendshipFactionID > 0) then
        factionStandingtext = repInfo.reaction
        if ( repInfo.nextThreshold ) then
          barMin, barMax, barValue = repInfo.reactionThreshold, repInfo.nextThreshold, repInfo.standing
        else
          -- max rank, make it look like a full bar
          barMin, barMax, barValue = 0, 1, 1
          isCapped = true
        end
        -- local friendshipColorIndex = 5
        -- barColor = REP.FACTION_BAR_COLORS[colorIndex]						-- always color friendships green
        factionRow.friendshipID = repInfo.friendshipFactionID			-- for doing friendship tooltip
      elseif ( isMajorFaction ) then
        local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
    
        barMin, barMax = 0, majorFactionData.renownLevelThreshold
        isCapped = C_MajorFactions.HasMaximumRenown(factionID)
        barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
        -- barColor = BLUE_FONT_COLOR
    
        factionRow.friendshipID = nil
        factionStandingtext = RENOWN_LEVEL_LABEL .. majorFactionData.renownLevel
        -- isMajorFactionUnlocked = majorFactionData.isUnlocked
      else
        local gender = UnitSex("player")
        factionStandingtext = GetText("FACTION_STANDING_LABEL"..standingID, gender)
        factionRow.friendshipID = nil
      end
    
      factionStanding:SetText(factionStandingtext)
      factionRow.standingText = factionStandingtext
    
      local isParagon
      if REP.AfterMoP then
        if (factionID and C_Reputation.IsFactionParagon(factionID)) then
          isParagon = true
    
          local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
          local paragonFrame = factionRow.Container.Paragon
    
          paragonFrame.factionID = factionID
          paragonFrame:SetPoint("RIGHT", factionRow, 0, 0)
    
          origBarValue = mod(currentValue, threshold)
          C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
          paragonFrame.Glow:SetShown(hasRewardPending)
          paragonFrame.Check:SetShown(hasRewardPending)
          paragonFrame:Show()
    
          colorIndex = 9
        end
      end
    
      local isCapped
      if (standingID == MAX_REPUTATION_REACTION) then
        isCapped = true
      end
    
      if(REP.AfterCata and (isCappedFriendship or standingID == 8)) then
        -- If exalted show a full green bar
        barMin, barMax, barValue = 0, 1, 1
      end
    
      -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
      if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
        local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
        barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
      end
    
      -- Normalize Values
      barMax = barMax - barMin
      barValue = barValue - barMin
      barMin = 0
    
      if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
        factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, barValue, barMax)..FONT_COLOR_CODE_CLOSE
      elseif(isCapped or isCappedFriendship) then
        factionRow.rolloverText = nil
      elseif(REP_Data.Global.ShowMissing ~= true) then
        factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(tostring(REPUTATION_PROGRESS_FORMAT), barValue, barMax)..FONT_COLOR_CODE_CLOSE
      else
        factionRow.rolloverText = nil
      end
    
      local toExalted = 0
      if (standingID < 8) then
        toExalted = REP.ToExalted[standingID] + barMax - barValue
      end
    
      local toBFF = 0
      if (isCappedFriendship ~= true and isFriend) then
        toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
      end
    
      if (REP_Data.Global.ShowMissing) then
        if ((barMax - barValue) ~= 0 and factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
          factionRow.standingText = "Paragon".." ("..barMax - barValue..")"
        elseif ((barMax - barValue) ~= 0) then
          if factionStandingtext then
            factionRow.standingText = factionStandingtext.." ("..barMax - barValue..")"
          else
          factionRow.standingText = "("..barMax - barValue..")"
          end
        else
          factionRow.standingText = factionStandingtext
        end
      else
        if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
          factionRow.standingText = "Paragon"
        else
          factionRow.standingText = factionStandingtext
        end
      end
    
      factionStanding:SetText(factionRow.standingText)
    
      if (isCappedFriendship) then
        factionRow.tooltip = nil
      else
        factionRow.tooltip = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
      end
    
      local color
      if isMajorFaction then
        color = BLUE_FONT_COLOR
      elseif colorIndex then
        color = REP.FACTION_BAR_COLORS[colorIndex]
      else
        color = REP.FACTION_BAR_COLORS[standingID]
      end
    
      factionBar:SetMinMaxValues(0, barMax);
      factionBar:SetValue(barValue);
      factionBar:SetStatusBarColor(color.r, color.g, color.b)
    
      if REP.AfterMoP then
        factionBar.BonusIcon:SetShown(hasBonusRepGain)
      end
    
      -- Update details if this is the selected Faction
      if (factionIndex == GetSelectedFaction()) then
        if (ReputationDetailFrame:IsShown()) then
          ReputationDetailFrame:Hide()
          REP_ReputationDetailFrame:Show()
    
          local flag
          if (canToggleAtWar and (not isHeader)) then flag = 1 end
          REP_ReputationDetailFrame_IsShown(factionIndex, flag, 2)
    
          if (REP_Data.Global.ExtendDetails) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        end
    
        if (REP_ReputationDetailFrame:IsVisible()) then
          REP:Rep_Detail_Frame()
          factionContainer.ReputationBar.Highlight1:Show()
          factionContainer.ReputationBar.Highlight2:Show()
        end
      else
        factionContainer.ReputationBar.Highlight1:Hide()
        factionContainer.ReputationBar.Highlight2:Hide()
      end
    end)
  end

  if REP.AfterDragonflight then
    hooksecurefunc(ReputationEntryMixin, 'OnClick', function(self)
      REP:Rep_Detail_Frame()
    end)
    
    hooksecurefunc(ReputationSubHeaderMixin, 'OnClick', function(self)
      REP:Rep_Detail_Frame()
    end)
  end
end

------------------------
-- _02_ Event Handler --
------------------------
function REP_OnEvent(self, event, ...)
  if (event == "LOADING_SCREEN_ENABLED") then
    REP_OnLoadingScreen = true
  end

  if (event == "LOADING_SCREEN_DISABLED") then
    REP_OnLoadingScreen = false
    REP:DumpReputationChangesToChat() -- Just to make sure we don't miss printing out any rep gain that occured during the loading screen
  end

  local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13 = ...

  if (event == "ADDON_LOADED") and (arg1 == addonName) then
    REP_Main:UnregisterEvent("ADDON_LOADED")
    REP_InitStages = REP_InitStages + 1
    REP:Init()
  elseif (event == "VARIABLES_LOADED") then
    REP_OnShowOptionFrame()
    REP_VarsLoaded = true
    REP_InitStages = REP_InitStages + 2
    REP:Init()
  elseif (event == "PLAYER_LOGIN") then
    REP_Main:UnregisterEvent("PLAYER_LOGIN")
    REP_InitStages = REP_InitStages + 4
    REP:Init()
  elseif (event == "PLAYER_ENTERING_WORLD") then
    REP_InitStages = REP_InitStages + 8
    REP:Init()

    REP_Main:UnregisterEvent("PLAYER_ENTERING_WORLD")
    REP_Main:RegisterEvent("UPDATE_FACTION")
    -- to keep item list up to date
    REP_Main:RegisterEvent("BAG_UPDATE")
    REP_Main:RegisterEvent("BANKFRAME_OPENED")
    REP_Main:RegisterEvent("BANKFRAME_CLOSED")

    REP_Main:RegisterEvent("UNIT_AURA")

    -- to keep list of known skills up to date
    REP_Main:RegisterEvent("CHAT_MSG_SKILL")
    REP_Main:RegisterEvent("SKILL_LINES_CHANGED")
    REP_Main:RegisterEvent("QUEST_COMPLETE")
    REP_Main:RegisterEvent("QUEST_WATCH_UPDATE")
    -- new chat hook system
    ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", REP_ChatFilter)
    ChatFrame_AddMessageEventFilter("COMBAT_TEXT_UPDATE", REP_ChatFilter)
    -- to keep dungeon Difficulty up to date
    if REP.AfterClassic then REP_Main:RegisterEvent("PLAYER_DIFFICULTY_CHANGED") end
    -- Recast for tradeskill
    if(not REP.AfterCata) then REP_Main:RegisterEvent("UPDATE_TRADESKILL_RECAST") end
    -- to keep the Garrison up to date
    if REP.AfterMoP then REP_Main:RegisterEvent("GARRISON_UPDATE") end

    if(REP.AfterBfA) then
      REP_Main:RegisterEvent("MAJOR_FACTION_RENOWN_LEVEL_CHANGED")
      REP_Main:RegisterEvent("MAJOR_FACTION_UNLOCKED")
    end

    ---- Check for (old) guild reputation buff perk ranks.
    if REP.AfterWotlk and not REP.AfterMoP then
      -- Check rank 2 first as it overrides rank 1 and should always be leading.
      local mrPopularityRankTwoBuffActive = IsSpellKnown(78635) -- Mr. Popularity (Guild Perk, Rank 2)

      if mrPopularityRankTwoBuffActive then
        REP_Data.Global.GuildRepBuffRankOne = false

        if not REP_Data.Global.GuildRepBuffRankTwo then
          REP_Data.Global.GuildRepBuffRankTwo = true
        end
      else
        local mrPopularityRankOneBuffActive = IsSpellKnown(78634) -- Mr. Popularity (Guild Perk, Rank 1)
        if mrPopularityRankOneBuffActive and not REP_Data.Global.GuildRepBuffRankOne then
          REP_Data.Global.GuildRepBuffRankOne = true
          REP_Data.Global.GuildRepBuffRankTwo = false
        end
      end
    end

    -- to keep the UI up to date based on expansion changes
    REP:MakeUIChanges()
    -- HookScripts
    if (ReputationWatchBar ~= nil) then
      ReputationWatchBar:HookScript("OnMouseDown", function(self) if (not InCombatLockdown()) then REP:WatchedFactionDetails(self.factionID) end end, nil)
    end
  elseif ((not REP.AfterShadowLands and (event == "UPDATE_FACTION" or event == "QUEST_COMPLETE" or event == "QUEST_WATCH_UPDATE")) or (REP.AfterShadowLands and (event == "UPDATE_FACTION"  or event == "QUEST_LOG_UPDATE" or event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED" or event == "MAJOR_FACTION_UNLOCKED"))) then
    if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
      ReputationFrame_Update()
    end
    if (REP_ReputationDetailFrame:IsVisible()) then
      REP_BuildUpdateList()
      REP_UpdateList_Update()
    end

    REP:DumpReputationChangesToChat()

    if REP.AfterDragonflight then
      if (C_Reputation.GetSelectedFaction() == 0) then
        ReputationFrame.ReputationDetailFrame:Hide()
      end
    else
      if (GetSelectedFaction() == 0) then
        ReputationDetailFrame:Hide();
      end
    end
  elseif (event == "BAG_UPDATE") then
    if (REP_ReputationDetailFrame:IsVisible() and not REP.AfterDragonflight) then
      -- Update rep frame (implicitely updates detail frame which In turn implicitely reparses bag contents)
      ReputationFrame_Update()
    end
  elseif (event == "BANKFRAME_OPENED") then
    REP_BankOpen = true
  elseif (event == "BANKFRAME_CLOSED") then
    -- this is fired twice when closing the bank window, bank contents only available at the first Event
    if (REP_BankOpen) then
      -- this is the first call
      REP_BankOpen = nil
      if (REP_ReputationDetailFrame:IsVisible() and not REP.AfterDragonflight) then
        -- Update rep frame (implicitely updates detail frame which In turn implicitely reparses bag contents)
        ReputationFrame_Update()
      end
    end
  elseif (event == "PLAYER_DIFFICULTY_CHANGED") then
    -- REP:Print("PLAYER_DIFFICULTY_CHANGED", nil)
  elseif (event == "CHAT_MSG_SKILL") or (event == "SKILL_LINES_CHANGED") or (event == "UPDATE_TRADESKILL_RECAST") then
    REP:ExtractSkills()
    if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
      ReputationFrame_Update()
    end
    if (REP_ReputationDetailFrame:IsVisible()) then
      REP_BuildUpdateList()
      REP_UpdateList_Update()
    end
  elseif (event == "UNIT_AURA") then
    REP:CheckActiveReputationBuffs()
  elseif (event == "GARRISON_UPDATE") then
    -- Get garrison buildings to check for trading post
    local garrisonBuildings

    if REP.AfterDragonflight then
      garrisonBuildings = C_Garrison.GetBuildings(Enum.GarrisonType.Type_6_0_Garrison)
    else
      garrisonBuildings = C_Garrison.GetBuildings(Enum.GarrisonType.Type_6_0)
    end
 
    for i, building in pairs(garrisonBuildings) do
      if building["buildingID"] == 145 then
        REP.HasTradingPost = true
      end
    end

    REP_InitStages = REP_InitStages + 5
    REP:Init()
    REP_Main:UnregisterEvent("GARRISON_UPDATE")
  end
end

-------------------------------
function REP_OnUpdate(self)
  if not REP_UpdateRequest then return end
  if REP_InitComplete and REP_InitCount > 5 then return end
  if (GetTime() < REP_UpdateRequest) then return end

  if (REP_InitCount <= 5) then
    -- Guild level seems to only return a proper value a little later
    REP_InitCount = REP_InitCount + 1
    REP_UpdateRequest = GetTime() + REP_UPDATE_INTERVAL

    if (REP_InitCount > 5) then
      REP_UpdateRequest = nil
    end
  end
end

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

-------------------------------
-- _04_ Addon Initialization --
-------------------------------
function REP:InitVariable(var, value)
  local result = 0
  if var == nil then return result end

  if (not REP_Data.Global[var]) and (not REP_Data.Global[var.."_inited"]) then
    -- this option is not Set, and has never been Set by default, do so and let the user know
    REP_Data.Global[var] = value
    REP_Data.Global[var.."_inited"] = true
    result = 1
  elseif (not REP_Data.Global[var.."_inited"]) then
    -- the option is enabled, but not marked as inited, do so silently
    REP_Data.Global[var.."_inited"] = true
  end

  return result
end

-------------------------------
function REP:Init()
  if REP_InitComplete then return end

  if (REP.AfterMoP) then
    if (REP_InitStages ~= 20) then return end
  else
    if (REP_InitStages ~= 15) then return end
  end

  local version
  if REP.AfterDragonflight then
    version = C_AddOns.GetAddOnMetadata("ReputationGuide", "Version")
  else
    version = GetAddOnMetadata("ReputationGuide", "Version")
  end

  if (version == nil) then version = "unknown" end
  REP.Version = version

  -- create data structures
  if not REP_Data.Global.OriginalCollapsed then REP_Data.Global.OriginalCollapsed = {} end
  if REP_Data.Global.ChatFrame == nil then REP_Data.Global.ChatFrame = 0 end

  local changed = 0
  changed = changed + REP:InitVariable("ShowMobs", true)
  changed = changed + REP:InitVariable("ShowQuests", true)
  changed = changed + REP:InitVariable("ShowPvPQuests", true)
  changed = changed + REP:InitVariable("ShowInstances", true)
  changed = changed + REP:InitVariable("ShowItems", true)
  changed = changed + REP:InitVariable("ShowGeneral", true)
  changed = changed + REP:InitVariable("ShowMissing", true)
  changed = changed + REP:InitVariable("ExtendDetails", true)
  changed = changed + REP:InitVariable("WriteChatMessage", true)
  changed = changed + REP:InitVariable("ShowPreviewRep", true)
  changed = changed + REP:InitVariable("SwitchFactionBar", true)
  changed = changed + REP:InitVariable("SilentSwitch", true)

  if REP.AfterWotlk then
    changed = changed + REP:InitVariable("NoGuildGain", true)
    changed = changed + REP:InitVariable("NoGuildSwitch", true)
  end

  if REP.AfterWoD then
    changed = changed + REP:InitVariable("ShowParagonBar", true)
  end

  if (changed > 0) then
    local cancelOptionsSound
    if SOUNDKIT then cancelOptionsSound = SOUNDKIT.IG_QUEST_LOG_ABANDON_QUEST end

    StaticPopupDialogs["REP_CONFIG_CHANGED"] = {
      text = REP_TXT.configQuestion,
      button1 = REP_TXT.showConfig,
      button2 = REP_TXT.later,
      OnAccept = function()
        REP_OpenSettings()
      end,
      OnCancel = function()
      	REP:Print("|cFFFFFF7F"..addonName..":|cFFFF0000 ".."If you change the settings later you will have to reload your UI for the changes to go in effect.")
      end,
      timeout = 0,
      whileDead = 1,
      hideOnEscape = 1,
      sound = cancelOptionsSound,
    }

    StaticPopup_Show("REP_CONFIG_CHANGED")
  end

  -- Set up UI
  if REP.AfterWotlk then
    REP:ExtractSkills()
  end

  if not REP.AfterShadowLands then
    REP_OrderByStandingCheckBoxText:SetText(REP_TXT.orderByStanding)
  end

  if REP.AfterShadowLands then
    REP_ReputationDetailInactiveCheckBoxText:SetText(REP_TXT.moveToInactive)
    REP_ReputationDetailMainScreenCheckBoxText:SetText(REP_TXT.showFactionOnMainscreen)
  end

  local _, race = UnitRace("player")
  local faction, locFaction = UnitFactionGroup("player")
  local class, enClass = UnitClass("player")
  local expansionIndex = REP_Data.Global.ExpansionIndex

  REP_Expansion = REP.Expansions[expansionIndex]
  REP_Player = UnitName("player")
  REP_Gender = UnitSex("player")
  REP_Realm = GetRealmName()
  REP_Class = class
  REP_ProfileKey = format("%s-%s", REP_Player, REP_Realm)

  if REP_Data.Global.ProfileKeys[REP_ProfileKey] == nil then REP_Data.Global.ProfileKeys[REP_ProfileKey] = true end
  if REP_Data[REP_ProfileKey] == nil then REP_Data[REP_ProfileKey] = {} end

  REP_Data[REP_ProfileKey].profile = {
    name	= REP_Player,
    realm	= REP_Realm,
    gender	= REP_Gender,
    level	= REP_Level,
    class	= REP_Class,
    faction	= locFaction,
    race = race,
    expansion = REP_Expansion
  }

  if REP_Data[REP_ProfileKey].quests == nil then REP_Data[REP_ProfileKey].quests = {} end

  if (IsInGuild()) then
    if (REP.GuildName == nil or REP.GuildName == "") then REP.GuildName = GetGuildInfo("player") end
  end

  if (race and faction and locFaction and REP_Player and REP_Realm) then
    if race == "Human" then
      REP.IsHuman = true
    end

    if (enClass and enClass == "DEATHKNIGHT") then
      REP.IsDeathKnight = true
    end

    if (faction == FACTION_ALLIANCE) or (locFaction == FACTION_ALLIANCE) then
      REP.IsAlliance = true
    end

    if (faction == FACTION_HORDE) or (locFaction == FACTION_HORDE) then
      REP.IsHorde = true
    end

    -- Initialize Faction information
    local locale = GetLocale()
    REP:InitFactor(REP.IsHuman)
    REP:InitFactionMap(locale, REP.GuildName)
    REP_FactionGain = {}
    REP_InitEnFactionGains(REP.GuildName)
    REP:DumpReputationChangesToChat(true)

    REP_InitComplete = true
    if (REP_InitCount <= 5) then
      REP_UpdateRequest = GetTime() + REP_UPDATE_INTERVAL
    end
  end
end

----------------------------------------
-- UI Changes based on current expansion --
----------------------------------------
function REP:MakeUIChanges()
  if REP.AfterWotlk then
    REP_ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 0, 0)
    REP_OptionsButton:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -2, -22)

    if not REP.AfterShadowLands then
      REP_OrderByStandingCheckBox:SetPoint("TOPLEFT", ReputationFrame, "TOPLEFT", 55, -20)
    end
  end
end

function REP:CheckActiveReputationBuffs()
  local hasWickermanBuff, hasHarvestBountyBuff, hasDarkmoonFaireHatBuff, hasDarkmoonFaireWeeBuff

  if REP.AfterBfA then
    hasWickermanBuff = C_UnitAuras.GetPlayerAuraBySpellID(24705) or C_UnitAuras.GetPlayerAuraBySpellID(95987)
    hasHarvestBountyBuff = C_UnitAuras.GetPlayerAuraBySpellID(61849)
    hasDarkmoonFaireHatBuff = C_UnitAuras.GetPlayerAuraBySpellID(136583)
    hasDarkmoonFaireWeeBuff = C_UnitAuras.GetPlayerAuraBySpellID(46668)
  else
    local i = 1;
    local buff = UnitBuff("player", i);
    while buff do
      local _, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", i);

      hasWickermanBuff = spellId == 24705 or spellId == 95987
      hasHarvestBountyBuff = spellId == 61849
      hasDarkmoonFaireHatBuff = spellId == 136583
      hasDarkmoonFaireWeeBuff = spellId == 46668
  
      -- Get next buff if there is any.
      i = i + 1;
      buff = UnitBuff("player", i);
    end
  end

  if hasWickermanBuff and not REP_Data.Global.WickermanRepBuff then
    REP_Data.Global.WickermanRepBuff = true
  end

  if hasHarvestBountyBuff and not REP_Data.Global.HarvestBountyRepBuff then
    REP_Data.Global.HarvestBountyRepBuff = true
  end

  if hasDarkmoonFaireHatBuff and not REP_Data.Global.DarkmoonfaireHatRepBuff then
    REP_Data.Global.DarkmoonfaireHatRepBuff = true
  end

  if hasDarkmoonFaireWeeBuff and not REP_Data.Global.DarkmoonfaireWeeRepBuff then
    REP_Data.Global.DarkmoonfaireWeeRepBuff = true
  end
end

------------------------
-- _05_ Slash Handler --
------------------------
function REP_SlashHandler(msg)
  if not msg then
    return
  else
    local msgLower = string.lower(msg)
    local words = REP:GetWords(msg)
    local wordsLower = REP:GetWords(msgLower)
    local size = REP:TableSize(wordsLower)
    local FD_SH = REP_Data.Global

    if (size > 0) then
      if (wordsLower[0]=="enable") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = true
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = true
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = true
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = true
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = true
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = true
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = true
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = true
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = true
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = true
          elseif (wordsLower[1]=="bar") then
            FD_SH.SwitchFactionBar = true
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = true
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = true
            FD_SH.ShowQuests = true
            FD_SH.ShowPvPQuests = true
            FD_SH.ShowInstances = true
            FD_SH.ShowItems = true
            FD_SH.ShowGeneral = true
            FD_SH.ShowMissing = true
            FD_SH.ExtendDetails = true
            FD_SH.WriteChatMessage = true
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = true
            FD_SH.SwitchFactionBar = true
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
            ReputationFrame_Update()
          end

          if (REP_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0]=="disable") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = false
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = false
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = false
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = false
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = false
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = false
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = false
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = false
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = false
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = false
          elseif (wordsLower[1]=="bar") then
            FD_SH.SwitchFactionBar = false
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = false
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = false
            FD_SH.ShowQuests = false
            FD_SH.ShowPvPQuests = false
            FD_SH.ShowInstances = false
            FD_SH.ShowItems = false
            FD_SH.ShowGeneral = false
            FD_SH.ShowMissing = false
            FD_SH.ExtendDetails = false
            FD_SH.WriteChatMessage = false
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = false
            FD_SH.SwitchFactionBar = false
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
            ReputationFrame_Update()
          end

          if (REP_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0]=="toggle") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = not FD_SH.ShowMobs
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = not FD_SH.ShowQuests
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = not FD_SH.ShowPvPQuests
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = not FD_SH.ShowInstances
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = not FD_SH.ShowItems
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = not FD_SH.ShowGeneral
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = not FD_SH.ShowMissing
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = not FD_SH.ExtendDetails
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = not FD_SH.WriteChatMessage
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = not FD_SH.ShowPreviewRep
          elseif (wordsLower[1]=="preview") then
            FD_SH.SwitchFactionBar = not FD_SH.SwitchFactionBar
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = not FD_SH.ShowParagonBar
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = not FD_SH.ShowMobs
            FD_SH.ShowQuests = not FD_SH.ShowQuests
            FD_SH.ShowPvPQuests = not FD_SH.ShowPvPQuests
            FD_SH.ShowInstances = not FD_SH.ShowInstances
            FD_SH.ShowItems = not FD_SH.ShowItems
            FD_SH.ShowGeneral = not FD_SH.ShowGeneral
            FD_SH.ShowMissing = not FD_SH.ShowMissing
            FD_SH.ExtendDetails = not FD_SH.ExtendDetails
            FD_SH.WriteChatMessage = not FD_SH.WriteChatMessage
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = not FD_SH.ShowPreviewRep
            FD_SH.SwitchFactionBar = not FD_SH.SwitchFactionBar
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
            ReputationFrame_Update()
          end

          if (REP_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0] == "list") then
        if (size > 1) then
          if (wordsLower[1] == "1" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL1"])) then
            REP:ListByStanding(1)
          elseif (wordsLower[1] == "2" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL2"])) then
            REP:ListByStanding(2)
          elseif (wordsLower[1] == "3" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL3"])) then
            REP:ListByStanding(3)
          elseif (wordsLower[1] == "4" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL4"])) then
            REP:ListByStanding(4)
          elseif (wordsLower[1] == "5" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL5"])) then
            REP:ListByStanding(5)
          elseif (wordsLower[1] == "6" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL6"])) then
            REP:ListByStanding(6)
          elseif (wordsLower[1] == "7" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL7"])) then
            REP:ListByStanding(7)
          elseif (wordsLower[1] == "8" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL8"])) then
            REP:ListByStanding(8)
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end
        else
          REP:ListByStanding()
        end
      elseif (wordsLower[0] == "loc") then
        if (size>1) then
          if (wordsLower[1] == "1" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL1"])) then
            REP:ListByStanding(1)
          elseif (wordsLower[1] == "2" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL2"])) then
            REP:ListByStanding(2)
          elseif (wordsLower[1] == "3" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL3"])) then
            REP:ListByStanding(3)
          elseif (wordsLower[1] == "4" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL4"])) then
            REP:ListByStanding(4)
          elseif (wordsLower[1] == "5" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL5"])) then
            REP:ListByStanding(5)
          elseif (wordsLower[1] == "6" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL6"])) then
            REP:ListByStanding(6)
          elseif (wordsLower[1] == "7" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL7"])) then
            REP:ListByStanding(7)
          elseif (wordsLower[1] == "8" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL8"])) then
            REP:ListByStanding(8)
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end
        else
          REP_ShowGerman()
        end
      elseif (wordsLower[0] == "test") then
        REP_Test()
      elseif (wordsLower[0] == "status") then
        REP:Status()
      elseif (wordsLower[0] == "help") then
        REP:Help()
      elseif (wordsLower[0] == "about") then
        REP:About()
      elseif (wordsLower[0] == "watch") then
        REP:WatchFaction(wordsLower[1])
      -- elseif (wordsLower[0] == "gain") then
      --   REP:TestRepGain(wordsLower[1], wordsLower[2], wordsLower[3])
      elseif (wordsLower[0] == "watchid" and REP.AfterDragonflight) then
        REP:WatchFactionById(wordsLower[1])
      else
        REP:PrintSlash(REP_TXT.command, msgLower)
      end
    else
      -- do nothing
    end
  end
end

-----------------------------------
-- _06_ General Helper Functions --
-----------------------------------
function REP:WatchFaction(watchID)
  if not watchID then return end

  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end
 
  for i = 1, numFactions, 1 do
    local index = i
    local factionID
    if REP.AfterDragonflight then
      factionID = C_Reputation.GetFactionDataByIndex(index).factionID
    else
      _, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _, _ = GetFactionInfo(index)
    end

    if (factionID) then
      if (tostring(watchID) == tostring(factionID)) then
        return SetWatchedFactionIndex(index)
      end
    else
      if watchID == index then
        return SetWatchedFactionIndex(index)
      else
        return REP:Print("Could not find a faction with either factionID: "..tostring(watchID).." or index #"..tostring(watchID))
      end
    end
  end
end

function REP:WatchFactionById(watchID)
  if not watchID then return end

  factionData = C_Reputation.GetFactionDataByID(watchID)

  if factionData then
    return C_Reputation.SetWatchedFactionByID(watchID)
  else
    return REP:Print("Could not find a faction with either factionID: "..tostring(watchID))
  end
end

------------------------------------------------------------
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
------------------------------------------------------------
function REP:Printtest(msg, msg1, msg2)
  REP:Print(""..tostring(msg).." "..tostring(msg1).."  "..tostring(msg2), nil)
end
------------------------------------------------------------
function REP:PrintSlash(msg, msg1)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..msg.." ["..REP.HELP_COLOUR..msg1.."|r]", true)
  REP:Help()
end
------------------------------------------------------------
function REP:Debug(msg)
  if not (msg) then return end
  REP:Print(msg)
end
------------------------------------------------------------
function REP:TableSize(info)
  local result = 0
  if info then
    for item in pairs(info) do result = result + 1 end
  end
  return result
end

------------------------------------------------------------
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

------------------------------------------------------------
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

------------------------------------------------------------
function REP:BoolToEnabled(b)
  local result = REP_TXT.disabled
  if b then result = REP_TXT.enabled end
  return result
end

------------------------------------------------------------
function REP:RGBToColour_perc(a, r, g, b)
  return string.format("|c%02X%02X%02X%02X", a*255, r*255, g*255, b*255)
end

function REP:has_value (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

------------------------
-- _07_ information
------------------------
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
------------------------------------------------------------
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
------------------------------------------------------------
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

-----------------------------------
-- _08_ Faction map --
-----------------------------------
function REP:InitMapName(fimap, returnMapNameAsString)
  local map

  if (type(fimap) == "number") then
    if fimap == 1 then
      map = REP_TXT.srfd
    elseif fimap == 2 then
      map = REP_TXT.tbd
    elseif fimap == 3 then
      map = REP_TXT.mnd
    elseif fimap == 5 then
      map = REP_TXT.nci
    elseif fimap == 6 then
      map = REP_TXT.hci
    elseif fimap == 7 then
      map = REP_TXT.ncit
    elseif fimap == 8 then
      map = REP_TXT.hcit
    elseif not fimap then
      map = " "
    else
      local mapObj
      local mapName
      if C_Map then
        mapObj = C_Map.GetMapInfo(fimap)

        if mapObj then mapName = mapObj.name end
      elseif GetMapInfo then
        mapObj = GetMapInfo(fimap)

        if mapObj then mapName = mapObj.name end
      end

      map = mapName
    end
  end

  if returnMapNameAsString and not map then
    map = fimap
  end

  return map
end

function REP:InitMobName(fimob)
  local mob

  if fimob == 1 then
    mob = REP_TXT.tmob
  elseif fimob == 2 then
    mob = REP_TXT.oboss
  elseif fimob == 3 then
    mob = REP_TXT.aboss
  elseif fimob == 4 then
    mob = REP_TXT.pboss
  elseif fimob == 5 then
    mob = REP_TXT.fclear
  elseif fimob == 11 then
    mob = (REP_TXT.AU.." "..REP_TXT.BB)
  elseif fimob == 12 then
    mob = (REP_TXT.AU.." "..REP_TXT.SSP)
  elseif fimob == 13 then
    mob = (REP_TXT.AU.." "..REP_TXT.Wa)
  elseif fimob == 14 then
    mob = REP_TXT.VCm
  elseif fimob == 15 then
    mob = (REP_TXT.AN.." "..REP_TXT.BB)
  elseif fimob == 16 then
    mob = (REP_TXT.AN.." "..REP_TXT.SSP)
  elseif fimob == 17 then
    mob = (REP_TXT.AN.." "..REP_TXT.Wa)
  else
    --[[--
      local mobName = GetmobNameByID(fimob)
      mob = mobName
    --]]--
  end

  if not mob then
    mob = fimob
  end

  return mob
end

function REP:InitItemName(fiitem, amt)
  local item_name

  if fiitem == 1 then
    item_name = REP_TXT.cdq
  elseif fiitem == 2 then
    item_name = REP_TXT.fdq
  elseif fiitem == 3 then
    item_name = REP_TXT.ndq
  elseif fiitem == 4 then
    item_name = REP_TXT.cbadge
  elseif fiitem == 5 then
    item_name = REP_TXT.deleted
  else
    if REP.AfterDragonflight then
      item_name = C_Item.GetItemInfo(fiitem)
    else
      item_name = GetItemInfo(fiitem)
    end 
  end

  if not item_name then
    item_name = fiitem

    -- item = C_CurrencyInfo.GetCurrencyInfo(fiitem)

    -- if item then
      -- item_name = item.name
    -- end
  end

  if not item_name then
    item_name = fiitem
  end

  return item_name
end

function REP:Quest_Names(questIndex)
  local quest = nil

  if (type(questIndex) == "number") then
    if (REP_QuestDB[questIndex]) then
      local localization = GetLocale()
      if localization == "esMX" then localization = "esES" end
      if localization == "zhTW" then localization = "zhCN" end

      quest = REP_QuestDB[questIndex][localization]
    else
      if REP.AfterBfA then
        quest = C_QuestLog and C_QuestLog.GetInfo(questIndex) or nil
      else
        quest = C_QuestLog and C_QuestLog.GetQuestInfo(questIndex) or nil
      end

      if not quest then
        if not REP.AfterTBC then
          quest = "Quest name translation not available. QuestID: "..questIndex
        else
          REP_HiddenQuestTooltip:SetOwner(WorldFrame, ANCHOR_NONE)
          REP_HiddenQuestTooltip:SetHyperlink(format("quest:%d", questIndex))

          quest = REP_HiddenQuestTooltipTextLeft1:GetText()
          REP_HiddenQuestTooltip:Hide()
        end
      end
    end
  else
    quest = questIndex
  end

  if questIndex == 1 then
    quest = REP_TXT.cdq
  elseif questIndex == 2 then
    quest = REP_TXT.coq
  elseif questIndex == 3 then
    quest = REP_TXT.fdq
  elseif questIndex == 4 then
    quest = REP_TXT.foq
  elseif questIndex == 5 then
    quest = REP_TXT.ndq
  elseif questIndex == 6 then
    quest = REP_TXT.deleted
  elseif questIndex == 7 then
    quest = REP_TXT.Championing
  elseif questIndex == 8 then
    quest = REP_TXT.bpqfg
  elseif questIndex == 9 then
    quest = REP_TXT.djdq
  elseif questIndex == 99 then
    quest = REP_TXT.tbd
  else
    if not quest then
      quest = questIndex
    end
  end

  return quest
end

function REP:GetTabardFaction()
  for i = 1, 40 do
    local _, _, _, _, _, _, _, _, _, _, id = UnitBuff("player", i)
    if not id then
      break
    end

    local data = championFactions[id]
    if data then
      local faction, level = data[2], data[1]
      if DEBUG then self:Debug("GetChampionedFaction:".." "..tostring(faction).." "..tostring(level)) end
      return faction, level
    end
  end

  if DEBUG then self:Debug("GetChampionedFaction: none") end
end

function REP:InitFactor(IsHuman, faction)
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

  local factor = 1.0

  -- Race check
  if IsHuman then factor = factor + 0.1 end

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

  -- WoD Faction trading post bonus
  if REP:has_value(draenorFactions, faction) and REP.HasTradingPost then
    factor = factor + 0.2
  end

  -- bonus repgain check
  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end
  local factionOffset = 0
  local factionIndex
  local factor_h = 0

  for i = 1, numFactions do
    local factionIndex = factionOffset + i
    if (factionIndex <= numFactions) then
      local name, factionID, hasBonusRepGain

      if REP.AfterDragonflight then
        name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, hasBonusRepGain, _ = C_Reputation.GetFactionDataByIndex(factionIndex)
      else
        name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, hasBonusRepGain, _ = GetFactionInfo(factionIndex)
      end

      if (faction == name) then
        if (hasBonusRepGain) then
          factor = factor + 1
        end
      end
    end
  end
  return factor
end

function REP:InitFaction(guildName, faction)
  if not faction then return end

  if faction == "guildName" or faction == REP.GuildName or faction == 1168 then
    if REP.GuildName then
      REP_faction = tostring(REP.GuildName).." (guild)"
    end
  else
    if REP.AfterDragonflight then
      if C_Reputation.GetFactionDataByID(faction) then
        REP_faction = C_Reputation.GetFactionDataByID(faction).name
      else
        REP_faction = faction
      end
      
    else
      REP_faction = GetFactionInfoByID(faction)
    end
  end

  return REP_faction
end

function REP:InitFactionMap(locale, guildName)
  REP_FactionMapping = {}
  REP_InitEnFactions()

  if (guildName) then
    REP_AddMapping(guildName, guildName)
  end
end

function REP_AddMapping(english, localised)
  if (not REP_FactionMapping) then
    REP_FactionMapping = {}
  end

  if (REP:InitFaction(REP.GuildName, localised)) then
    if localised == 1168 then
      if REP.GuildName then
        REP_FactionMapping[string.lower(REP_faction)] = tostring(string.lower(english)).." (guild)"
      end
    else
      REP_FactionMapping[string.lower(REP_faction)] = string.lower(english)
    end
  end
end

------------------------------------
-- _09_ Faction Lists --
------------------------------------
function REP:Content(faction, from, to, name, rep, isRenownFaction)
  if not faction then return 0 end
  if not from then return 0 end
  if not to then return 0 end
  if not name then return 0 end
  if not rep then return 0 end
  if (type(rep) ~= "number") then return 0 end
  if ((from < 1) or (from > 8 and not isRenownFaction)) then return 0 end
  if ((to < 1) or (to > 8 and not isRenownFaction)) then return 0 end
  if (from > to) then return 0 end
  return 1
end

function REP_AddSpell(faction, from, to, name, rep, zone, limit, isRenownFaction)
  if REP:Content(faction, from, to, name, rep, isRenownFaction) ~= 1 then return end
end

function REP_AddMob(faction, from, to, name, rep, zone, limit, isRenownFaction)
  faction = REP:InitFaction(REP.GuildName, faction)

  if REP:Content(faction, from, to, name, rep, isRenownFaction) ~= 1 then return end
  faction = string.lower(faction)
  rep = rep * REP:InitFactor(REP.IsHuman, REP_faction)

  for standing = from, to do
    local faction_info = REP_FactionGain[faction]
    if not faction_info then
      faction_info = {}
      REP_FactionGain[faction] = faction_info
    end

    local standing_info = faction_info[standing]
    if not standing_info then
      standing_info = {}
      faction_info[standing] = standing_info
    end

    local add_info = standing_info.mobs
    if add_info then
      add_info.count = add_info.count + 1
    else
      add_info = {}
      add_info.data = {}
      add_info.count = 0
      standing_info.mobs = add_info
    end

    local count = add_info.count
    add_info.data[count] = {}
    local add_count = add_info.data[count]
    add_count.name = name
    add_count.rep = rep
    add_count.maxStanding = to
    add_count.zone = zone
    if ((standing == to) and limit) then
      add_count.limit = limit
    end

    -- REP:Debug("Added mob ["..name.."] for faction ["..faction.."] and standing [".._G["FACTION_STANDING_LABEL"..standing].."]")
  end
end

function REP_AddQuest(faction, from, to, name, rep, itemList, limitType, isRepeatable, isRenownFaction, isPvp)
  faction = REP:InitFaction(REP.GuildName, faction)
  if REP:Content(faction, from, to, name, rep, isRenownFaction) ~= 1 then return end
  faction = string.lower(faction)

  if not key then key = REP_ProfileKey end
  rep = rep * REP:InitFactor(REP.IsHuman, REP_faction)

  for standing = from, to do
    local faction_info = REP_FactionGain[faction]
    if not faction_info then
      faction_info = {}
      REP_FactionGain[faction] = faction_info
    end

    local standing_info = faction_info[standing]
    if not standing_info then
      standing_info = {}
      faction_info[standing] = standing_info
    end

    local add_info = standing_info.quests
    if add_info then
      add_info.count = add_info.count + 1
    else
      add_info = {}
      add_info.data = {}
      add_info.count = 0
      standing_info.quests = add_info
    end

    local count = add_info.count
    add_info.data[count] = {}
    local add_count = add_info.data[count]
    add_count.name = name
    add_count.rep = rep
    add_count.maxStanding = to

    if (isRepeatable == nil) then
			add_count.repeatable = true
		else
			add_count.repeatable = isRepeatable
		end

    if (isPvp == nil) then
			add_count.isPvp = false
		else
			add_count.isPvp = isPvp
		end

    if (itemList) then
      if (itemList == "nil") then
        add_count.profession = limitType
      else
        add_count.items = {}

        for item in pairs(itemList) do
          add_count.items[item] = itemList[item]
        end
      end
    end

    if limitType then
      add_count.profession = limitType
    end

    if ((standing == to) and limit) then
      add_count.limit = limit
    end

    -- REP:Debug("Added quest ["..name.."] for faction ["..faction.."] and standing [".._G["FACTION_STANDING_LABEL"..standing].."]")
  end
end

function REP_AddInstance(faction, from, to, name, rep, heroic, isRenownFaction)
  faction = REP:InitFaction(REP.GuildName, faction)
  if REP:Content(faction, from, to, name, rep, isRenownFaction) ~= 1 then return end
  faction = string.lower(faction)
  rep = rep * REP:InitFactor(REP.IsHuman, REP_faction)

  for standing = from, to do
    local faction_info = REP_FactionGain[faction]
    if not faction_info then
      faction_info = {}
      REP_FactionGain[faction] = faction_info
    end

    local standing_info = faction_info[standing]
    if not standing_info then
      standing_info = {}
      faction_info[standing] = standing_info
    end

    local add_info = standing_info.instance
    if add_info then
      add_info.count = add_info.count + 1
    else
      add_info = {}
      add_info.data = {}
      add_info.count = 0
      standing_info.instance = add_info
    end

    local count = add_info.count
    add_info.data[count] = {}
    local add_count = add_info.data[count]
    add_count.name = name
    add_count.rep = rep
    add_count.maxStanding = to
    
    if ((standing == to) and limit) then
      add_count.limit = limit
    end

    add_count.level = (heroic and REP_TXT.heroic or REP_TXT.normal)
    -- REP:Debug("Added instance ["..name.."] for faction ["..faction.."] and standing [".._G["FACTION_STANDING_LABEL"..standing].."]")
  end
end

function REP_AddItems(faction, from, to, rep, itemList, alternativeItemList, isRenownFaction)
  faction = REP:InitFaction(REP.GuildName, faction)
  if REP:Content(faction, from, to, itemList, rep, isRenownFaction) ~=1 then return end
  faction = string.lower(faction)
  rep = rep * REP:InitFactor(REP.IsHuman, REP_faction)
  local itemString = ""

  for standing = from, to do
    local faction_info = REP_FactionGain[faction]
    if not faction_info then
      faction_info = {}
      REP_FactionGain[faction] = faction_info
    end

    local standing_info = faction_info[standing]
    if not standing_info then
      standing_info = {}
      faction_info[standing] = standing_info
    end

    local add_info = standing_info.items
    if add_info then
      add_info.count = add_info.count + 1
    else
      add_info = {}
      add_info.data = {}
      add_info.count = 0
      standing_info.items = add_info
    end

    local count = add_info.count
    add_info.data[count] = {}
    local add_count = add_info.data[count]
    add_count.rep = rep
    add_count.maxStanding = to
    if ((standing == to) and limit) then
      add_count.limit = limit
    end

    if (itemList) then
      add_count.items = {}
      for item in pairs(itemList) do
        add_count.items[item] = itemList[item]
      end
    end

    if (alternativeItemList) then
      add_count.alternativeItems = {}
      for item in pairs(alternativeItemList) do
        add_count.alternativeItems[item] = alternativeItemList[item]
      end
    end

    -- REP:Debug("AddItem: Added items ["..itemString.."] for faction ["..faction.."] and standing [".._G["FACTION_STANDING_LABEL"..standing].."]")
  end
end

function REP_AddGeneral(faction, from, to, name, rep, head, tip, tipList, flag, isRenownFaction, customFactor)
  faction = REP:InitFaction(REP.GuildName, faction)
  if REP:Content(faction, from, to, name, rep, isRenownFaction) ~= 1 then return end
  faction = string.lower(faction)
  if not customFactor then customFactor = 0 end
  rep = rep * (REP:InitFactor(REP.IsHuman, REP_faction) + customFactor)
  local tipString = ""

  for standing = from, to do
    local faction_info = REP_FactionGain[faction]
    if not faction_info then
      faction_info = {}
      REP_FactionGain[faction] = faction_info
    end

    local standing_info = faction_info[standing]
    if not standing_info then
      standing_info = {}
      faction_info[standing] = standing_info
    end

    local add_info = standing_info.general
    if add_info then
      add_info.count = add_info.count + 1
    else
      add_info = {}
      add_info.data = {}
      add_info.count = 0
      standing_info.general = add_info
    end

    local count = add_info.count
    add_info.data[count] = {}
    local add_count = add_info.data[count]
    add_count.name = name
    add_count.rep = rep
    add_count.maxStanding = to
    if ((standing == to) and limit) then
      add_count.limit = limit
    end

    if name == "1" then
      name = REP_TXT.tfr
      head = REP_TXT.tfr
      tip = REP_TXT.nswts
    end

    add_count.flag = flag
    add_count.head = head
    add_count.tip = tip
    if (tipList) then
      add_count.tipList = {}
      for tip in pairs(tipList) do
        if tipString ~= "" then tipString = tipString..", " end
        tipString = tipString..tipList[tip]..": "..tip
        add_count.tipList[tip] = tipList[tip]
      end
    end

    -- REP:Debug("AddGeneral: Added general rep gain ["..name.."] for faction ["..faction.."] and standing [".._G["FACTION_STANDING_LABEL"..standing].."] with tooltip ["..tipString.."]")
  end
end

-----------------------------------
-- _10_ New Hook Functions --
-----------------------------------
function REP_GetFactionInfo(factionIndex)
  -- get original information
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = REP_Orig_GetFactionInfo(factionIndex)

  -- Normalize Values to within standing
  local normMax = barMax - barMin
  local normCurrent = barValue - barMin

  -- add missing reputation
  if (REP_Data.Global.ShowMissing and isHeader and not hasRep and ((normMax - normCurrent) > 0)) then
    name = name.." ("..normMax - normCurrent..")"
  end

  -- return Values
  return name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain
end

-----------------------------------
-- REP_RepFrame_Up Start --
-----------------------------------
function REP_ReputationFrame_Update()
  local numFactionsDisplayed = NUM_FACTIONS_DISPLAYED or 14

  if (REP_OnLoadingScreen == false) then
    local numFactions
    if REP_Data.Global.SortByStanding then
      REP:StandingSort()
      numFactions = REP_OBS_numFactions
    else
      if REP.AfterDragonflight then
        numFactions = C_Reputation.GetNumFactions()
      else
        numFactions = GetNumFactions()
      end
    end

    if not REP.AfterShadowLands then
      -- Update scroll frame
      if (not FauxScrollFrame_Update(ReputationListScrollFrame, numFactions, numFactionsDisplayed, REPUTATIONFRAME_FACTIONHEIGHT)) then
        ReputationListScrollFrameScrollBar:SetValue(0)
      end
    end

    if ReputationFrameStandingLabel  then
      if (REP_Data.Global.ShowMissing) then
        ReputationFrameStandingLabel:SetText(REP_Orig_StandingText.." "..REP_TXT.missing)
      else
        ReputationFrameStandingLabel:SetText(REP_Orig_StandingText)
      end
    end

    local i
    local gender = UnitSex("player")
    local factionOffset
    local numberOfFactionsToDisplay

    if not REP.AfterShadowLands then
      factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)
    else
      factionOffset = 0
    end

    if REP.AfterWoD then
      if(ReputationFrame.paragonFramesPool) then
        ReputationFrame.paragonFramesPool:ReleaseAll()
      end

      if not REP.AfterShadowLands then
        numberOfFactionsToDisplay = numFactionsDisplayed
      end
    else
      numberOfFactionsToDisplay = numFactions
    end

    for i = 1, numFactionsDisplayed, 1 do
      local factionBar
      local factionStanding
      local factionHeader
      local factionCheck
      local factionTitle
      local factionButton
      local factionBackground
      local factionBarPreview
      local factionAtWarIndicator
      local factionRightBarTexture
      local factionIndex

      if REP.AfterShadowLands and not REP.AfterDragonflight then
        hooksecurefunc("ReputationFrame_InitReputationRow", function(factionRow, elementData)
          factionIndex = elementData.index;

          local name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _ = GetFactionInfo(factionIndex)
          local inactive = IsFactionInactive(factionIndex)

          if (REP_ProfileKey) then
            if REP_Data[REP_ProfileKey].InactiveFactions == nil then REP_Data[REP_ProfileKey].InactiveFactions = {} end

            if (inactive and not REP_Data[REP_ProfileKey].InactiveFactions[factionID]) then
              REP_Data[REP_ProfileKey].InactiveFactions[factionID] = true
            end
          end

          local factionContainer = factionRow.Container;
          factionBar = factionContainer.ReputationBar;
          factionTitle = factionContainer.Name;
          factionButton = factionContainer.ExpandOrCollapseButton;
          factionStanding = factionBar.FactionStanding;
          factionTitle:SetText(name);

          if (factionIndex <= numFactions) then
            if REP_Data.Global.SortByStanding then
              REP:SortByStandingWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
            else
              REP:OriginalRepOrderWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
            end
          else
            if REP_factionRow then REP_factionRow:Hide() end
            if factionHeader then factionHeader:Hide() end
          end
        end)
      else
        factionIndex = factionOffset + i
        local name, factionID, inactive

        if REP.AfterDragonflight then
          local reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
          name = reputationInfo.name
          factionID = reputationInfo.factionID
          inactive = C_Reputation.IsFactionActive(factionIndex) == false
        else
          name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _ = GetFactionInfo(factionIndex)
          inactive = IsFactionInactive(factionIndex)
        end

        if (REP_ProfileKey) then
          if REP_Data[REP_ProfileKey].InactiveFactions == nil then REP_Data[REP_ProfileKey].InactiveFactions = {} end

          if (inactive and not REP_Data[REP_ProfileKey].InactiveFactions[factionID]) then
            REP_Data[REP_ProfileKey].InactiveFactions[factionID] = true
          end
        end

        local factionRow = _G["ReputationBar"..i]
        factionHeader = _G["ReputationHeader"..i]
        factionCheck = _G["ReputationBar"..i.."Check"]
        factionTitle = _G["ReputationBar"..i.."FactionName"]
        factionButton = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
        factionBackground = _G["ReputationBar"..i.."Background"]
        factionBarPreview = _G["REP_StatusBar"..i]
        factionAtWarIndicator = _G["ReputationBar"..i.."AtWarCheck"]
        factionRightBarTexture = _G["ReputationBar"..i.."ReputationBarRight"]

        if REP.AfterTBC then
          factionBar = _G["ReputationBar"..i.."ReputationBar"]
          factionStanding = _G["ReputationBar"..i.."ReputationBarFactionStanding"]
        else
          factionBar = _G["ReputationBar"..i]
          factionStanding = _G["ReputationBar"..i.."FactionStanding"]
        end

        if (factionIndex <= numFactions) then
          if REP_Data.Global.SortByStanding then
            if REP.AfterDragonflight then
              REP:OriginalRepOrderWithUpdatedUI(i, factionIndex)
            else
              if REP.AfterTBC then
                REP:SortByStandingWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
              else
                REP:SortByStandingWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
              end
            end
          else
            if REP.AfterDragonflight then
              REP:OriginalRepOrderWithUpdatedUI(i, factionIndex)
            else
              if REP.AfterTBC then
                REP:OriginalRepOrderWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
              else
                REP:OriginalRepOrderWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
              end
            end
          end
        else
          if factionRow then factionRow:Hide() end
          if factionHeader then factionHeader:Hide() end
        end
      end
    end

    if REP.AfterDragonflight then
      if (C_Reputation.GetSelectedFaction() == 0) then
        ReputationDetailFrame:Hide()
        REP_ReputationDetailFrame:Hide()
      end
    else
      if (GetSelectedFaction() == 0) then
        ReputationDetailFrame:Hide()
        REP_ReputationDetailFrame:Hide()
      end
    end
  end
end

function REP_ExpandFactionHeader(index) -- replaces ExpandFactionHeader
  if not index then return end
  
  if REP.AfterShadowLands then
    -- hardcoded fix (incase it was causing issues)
    REP_Data.Global.SortByStanding = false
  end

  if REP_Data.Global.SortByStanding then
    if not REP_Entries then return end
    if not REP_Entries[index] then return end
    REP_Collapsed[REP_Entries[index].i] = nil
    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  else
    REP_Orig_ExpandFactionHeader(index)
  end
end

function REP_ReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)
  -- rowType is a binary table of type isHeader, isChild

  if (not REP.AfterShadowLands) then
    local factionRowName = factionRow:GetName()
    local factionBar = _G[factionRowName.."ReputationBar"]
    local factionTitle = _G[factionRowName.."FactionName"]
    local factionStanding = _G[factionRowName.."ReputationBarFactionStanding"]
    local factionBackground = _G[factionRowName.."Background"]
    local factionLeftTexture = _G[factionRowName.."ReputationBarLeftTexture"]
    local factionRightTexture = _G[factionRowName.."ReputationBarRightTexture"]
    local factionButton

    if not REP.AfterTBC then
      factionButton = _G[factionRowName.."ReputationHeader"]
    else
      factionButton = _G[factionRowName.."ExpandOrCollapseButton"]
    end

    if (factionLeftTexture) then factionLeftTexture:SetWidth(62) end
    if (factionRightTexture) then factionRightTexture:SetWidth(42) end
    if (factionBar) then factionBar:SetPoint("RIGHT", factionRow, "RIGHT", 0, 0) end

    if (isHeader) then
      -- show indent on child rows (isChild)
      if (false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 35, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 23, 0)
      end

      if (factionButton) then
        factionButton:SetPoint("LEFT", factionRow, "LEFT", 3, 0)
        factionButton:Show()
      end

      factionTitle:SetWidth(145)
      factionTitle:SetPoint("LEFT",factionButton,"RIGHT",10, 0)
      factionTitle:SetFontObject(GameFontNormalLeft)


      if (factionBackground) then factionBackground:Hide() end

      if (factionLeftTexture) then
        factionLeftTexture:SetHeight(15)
        factionLeftTexture:SetWidth(60)
        factionLeftTexture:SetTexCoord(0.765625, 1.0, 0.046875, 0.28125)
      end

      if (factionRightTexture) then
        factionRightTexture:SetHeight(15)
        factionRightTexture:SetWidth(39)
        factionRightTexture:SetTexCoord(0.0, 0.15234375, 0.390625, 0.625)
      end

      if (factionBar) then factionBar:SetWidth(99) end
    else
      -- show indent on child rows (no way of saying when it's a child row of an other child row)
      if(false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 41, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 29, 0)
      end

      factionTitle:SetWidth(160)
      factionButton:Hide()
      factionTitle:SetPoint("LEFT", factionRow, "LEFT", 10, 0)
      factionTitle:SetFontObject(GameFontHighlightSmall)
      factionBackground:Show()
      factionLeftTexture:SetHeight(21)
      factionRightTexture:SetHeight(21)
      factionLeftTexture:SetTexCoord(0.7578125, 1.0, 0.0, 0.328125)
      factionRightTexture:SetTexCoord(0.0, 0.1640625, 0.34375, 0.671875)
      factionBar:SetWidth(101)
    end

    if ((hasRep) or (not isHeader)) then
      factionStanding:Show()
      factionBar:Show()
      factionBar:GetParent().hasRep = true
    else
      if (factionStanding) then factionStanding:Hide() end
      if (factionBar) then
        factionBar:Hide()
        factionBar:GetParent().hasRep = false
      end
    end
  else
    local factionContainer = factionRow.Container;
  	local factionBar = factionContainer.ReputationBar;
  	local factionTitle = factionContainer.Name;
    local factionStanding = factionBar.FactionStanding;
    local factionBackground = factionContainer.Background;
    local factionLeftTexture = factionBar.LeftTexture;
  	local factionRightTexture = factionBar.RightTexture;
  	local factionButton = factionContainer.ExpandOrCollapseButton;

    if (factionLeftTexture) then factionLeftTexture:SetWidth(62) end
    if (factionRightTexture) then factionRightTexture:SetWidth(42) end
    if (factionBar) then factionBar:SetPoint("RIGHT", factionRow, "RIGHT", 0, 0) end

    if (isHeader) then
      -- show indent on child rows (isChild)
      if (false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 35, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 23, 0)
      end

      if (factionButton) then
        factionButton:SetPoint("LEFT", factionRow, "LEFT", 3, 0)
        factionButton:Show()
      end

      factionTitle:SetWidth(145)
      factionTitle:SetPoint("LEFT",factionButton,"RIGHT",10, 0)
      factionTitle:SetFontObject(GameFontNormalLeft)


      if (factionBackground) then factionBackground:Hide() end

      if (factionLeftTexture) then
        factionLeftTexture:SetHeight(15)
        factionLeftTexture:SetWidth(60)
        factionLeftTexture:SetTexCoord(0.765625, 1.0, 0.046875, 0.28125)
      end

      if (factionRightTexture) then
        factionRightTexture:SetHeight(15)
        factionRightTexture:SetWidth(39)
        factionRightTexture:SetTexCoord(0.0, 0.15234375, 0.390625, 0.625)
      end

      if (factionBar) then factionBar:SetWidth(99) end
    else
      -- show indent on child rows (no way of saying when it's a child row of an other child row)
      if(false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 41, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 29, 0)
      end

      factionTitle:SetWidth(160)
      factionButton:Hide()
      factionTitle:SetPoint("LEFT", factionRow, "LEFT", 10, 0)
      factionTitle:SetFontObject(GameFontHighlightSmall)
      factionBackground:Show()
      factionLeftTexture:SetHeight(21)
      factionRightTexture:SetHeight(21)
      factionLeftTexture:SetTexCoord(0.7578125, 1.0, 0.0, 0.328125)
      factionRightTexture:SetTexCoord(0.0, 0.1640625, 0.34375, 0.671875)
      factionBar:SetWidth(101)
    end

    if ((hasRep) or (not isHeader)) then
      factionStanding:Show()
      factionBar:Show()
      factionBar:GetParent().hasRep = true
    else
      if (factionStanding) then factionStanding:Hide() end
      if (factionBar) then
        factionBar:Hide()
        factionBar:GetParent().hasRep = false
      end
    end
  end
end

function REP_CollapseFactionHeader(index) -- replaces CollapseFactionHeader
  if not index then return end

  if REP.AfterShadowLands then
    -- hardcoded fix (incase it was causing issues)
    REP_Data.Global.SortByStanding = false
  end

  if REP_Data.Global.SortByStanding then
    if not REP_Entries then return end
    if not REP_Entries[index] then return end
    REP_Collapsed[REP_Entries[index].i] = true
    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  else
    REP_Orig_CollapseFactionHeader(index)
  end
end

function REP_ReputationBar_OnClick(self)
  -- redo from the main Reputation file
  if ((ReputationDetailFrame:IsVisible() or REP_ReputationDetailFrame:IsVisible()) and (GetSelectedFaction() == self.index)) then
    if SOUNDKIT then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF) end
    ReputationDetailFrame:Hide()
    REP_ReputationDetailFrame:Hide()
  else
    if (self.hasRep) then
      if SOUNDKIT then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end

      REP_ReputationDetailFrame:Show()
      SetSelectedFaction(self.index)
      ReputationDetailFrame:Hide()
      --REP_OptionsFrame:Hide()

      if (REP_Data.Global.ExtendDetails) then
        REP_BuildUpdateList()
        REP_UpdateList_Update()
      end

      if not REP.AfterDragonflight then
        ReputationFrame_Update()
      end
    end
  end
end

REP_UPDATE_LIST_HEIGHT = 13

function REP_UpdateList_Update()
  -- usually called In conjuction with REP_BuildUpdateList
  if (not REP_ReputationDetailFrame:IsVisible()) then return end

  -- Fix for GetGuildInfo() function returning nil upon first login.
  if (IsInGuild() and REP.GuildName == nil) then
    REP.GuildName = GetGuildInfo("player")
    REP_InitFactionForGuildOnly()
  end

  REP_UpdateListScrollFrame:Show()

  local numEntries, highestVisible = REP:GetUpdateListSize()

  -- Update scroll frame
  if (not FauxScrollFrame_Update(REP_UpdateListScrollFrame, numEntries, REP_UPDATE_LIST_HEIGHT, 16)) then
    REP_UpdateListScrollFrameScrollBar:SetValue(0)
  end

  local entryIndex
  local entryFrameName, entryFrame, entryTexture
  local entryLabel, entryName, entryRep, entryTimes
  local entryItemTimes, entryItemName, entryItemTotal
  local postfix

  local entryOffset = FauxScrollFrame_GetOffset(REP_UpdateListScrollFrame)

  local haveInfo = false
  entryIndex = 1
  local i = 0
  local max = REP:TableSize(REP_UpdateList)

  while(i < entryOffset and entryIndex < max) do
    if REP_UpdateList[entryIndex].isShown then
      i = i + 1
    end

    entryIndex = entryIndex + 1
  end

  for i = 1, REP_UPDATE_LIST_HEIGHT, 1 do
    while ((entryIndex <= highestVisible) and not REP_UpdateList[entryIndex].isShown) do
      entryIndex = entryIndex + 1
    end

    if (entryIndex <= highestVisible) then
      haveInfo = true

      entryFrameName = "REP_UpdateEntry"..i
      entryFrame = _G[entryFrameName]
      entryTexture = _G[entryFrameName.."Texture"]
      entryLabel = _G[entryFrameName.."Label"]
      entryName = _G[entryFrameName.."Name"]
      entryRep = _G[entryFrameName.."Rep"]
      entryTimes = _G[entryFrameName.."Times"]
      entryItemTimes = _G[entryFrameName.."ItemTimes"]
      entryItemName = _G[entryFrameName.."ItemName"]
      entryItemTotal = _G[entryFrameName.."TotalTimes"]
      local F_UL_ei = REP_UpdateList[entryIndex]

      if (entryFrame) then
        entryFrame:Show()
        entryFrame.id = F_UL_ei.index
        entryFrame.tooltipHead = F_UL_ei.tooltipHead
        entryFrame.tooltipTip = F_UL_ei.tooltipTip
        entryFrame.tooltipDetails = F_UL_ei.tooltipDetails
      end

      local color = ""
      if (F_UL_ei.highlight) then
        color = REP.HIGHLIGHT_COLOUR
      elseif (F_UL_ei.suppress) then
        color = REP.SUPPRESS_COLOUR
      elseif (F_UL_ei.lowlight) then
        color = REP.LOWLIGHT_COLOUR
      end

      if (F_UL_ei.type ~= "") then
        -- normal entry
        if (F_UL_ei.suppress) then
          postfix = ""
        else
          postfix = "-Green"
        end

        if (F_UL_ei.hasList) then
          if (F_UL_ei.listShown) then
            entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-MinusButton-Up"..postfix..".tga")
          else
            entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-PlusButton-Up"..postfix..".tga")
          end
        else
          entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-EmptyButton-Up"..postfix..".tga")
        end

        if (F_UL_ei.canSuppress) then
          entryTexture:Show()
        else
          entryTexture:Hide()
        end

        entryLabel:Show()
        entryName:Show()
        entryRep:Show()
        entryTimes:Show()

        entryLabel:SetText(color..F_UL_ei.type)
        entryName:SetText(color..F_UL_ei.name)
        entryRep:SetText(color..F_UL_ei.rep)
        entryTimes:SetText(color..F_UL_ei.times)

        entryItemTimes:Hide()
        entryItemName:Hide()
        entryItemTotal:Hide()
      else
        -- item entry
        entryTexture:Hide()
        entryLabel:Hide()
        entryName:Hide()
        entryRep:Hide()
        entryTimes:Hide()

        entryItemTimes:Show()
        entryItemName:Show()

        entryItemTimes:SetText(color..F_UL_ei.times)
        entryItemName:SetText(color..F_UL_ei.name)
      end

      entryIndex = entryIndex + 1
    else
      _G["REP_UpdateEntry"..i]:Hide()
    end

    if haveInfo then
      REP_NoInformationText:Hide()
    else
      REP_NoInformationText:SetText(REP_TXT.noInfo)
      REP_NoInformationText:Show()
    end
  end
end

function REP_MouseButtonUp(self, button)
  if (button and button == "LeftButton") then
    REP_UpdateEntryClick(self)
  elseif (button and button == "RightButton") then
    REP:UpdateEntrySuppress(self)
  end
end

function REP_UpdateEntryClick(self)
  -- sub function of REP_MouseButtonUp
  if (REP_UpdateList[self.id] and REP_UpdateList[self.id].hasList) then
    if (REP_UpdateList[self.id].listShown) then
      REP:ShowUpdateEntry(self.id, false)
    else
      REP:ShowUpdateEntry(self.id, true)
    end
  end
end

function REP:UpdateEntrySuppress(self)
  -- sub function of REP_UpdateEntryClick
  if (REP_UpdateList[self.id]) then
    if (REP_UpdateList[self.id].type ~= "") then
      if (REP_UpdateList[self.id].faction and REP_UpdateList[self.id].originalName) then
        if (not REP_Suppressed) then
          REP_Suppressed = {}
        end

        if (not REP_Suppressed[REP_UpdateList[self.id].faction]) then
          REP_Suppressed[REP_UpdateList[self.id].faction] = {}
        end

        if (REP_Suppressed[REP_UpdateList[self.id].faction][REP_UpdateList[self.id].originalName]) then
          REP_Suppressed[REP_UpdateList[self.id].faction][REP_UpdateList[self.id].originalName] = nil
        else
          REP_Suppressed[REP_UpdateList[self.id].faction][REP_UpdateList[self.id].originalName] = true
        end

        REP_BuildUpdateList()
      end
    end
  end
end

function REP_SupressNone(allFactions)
  if (allFactions == true) then
    REP_Suppressed = {}
    REP_BuildUpdateList()
  else
    local factionIndex = GetSelectedFaction()
    local faction, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _, _ = GetFactionInfo(factionIndex)

    if (faction) then
      faction = string.lower(faction)

      if factionID == 1168 then
        faction = faction.." (guild)"
      end

      if (REP_FactionMapping[faction]) then
        faction = REP_FactionMapping[faction]
      end

      if factionID == 1168 then
        faction = faction.." (guild)"
      end

      if (not REP_Suppressed) then
        REP_Suppressed = {}
      end

      REP_Suppressed[faction] = {}
    end

    REP_BuildUpdateList()
  end
end

-----------------------------------
-- _11_ Prepare update entries   --
-----------------------------------
function REP:Update_Tooltip(x, l1,r1)
  x = x + 1
  local ToolTip_ID = {l = l1, r = r1}
  return ToolTip_ID, x
end

function REP_BuildUpdateList(selectedIndex)
  if (not REP_ReputationDetailFrame:IsVisible()) then return end

  REP_UpdateList = {}
  REP_CurrentRepInBag = 0
  REP_CurrentRepInBagBank = 0
  REP_CurrentRepInQuest = 0

  local index = 1
  local factionIndex
  if REP.AfterDragonflight then
    factionIndex = C_Reputation.GetSelectedFaction()
  else
    factionIndex = GetSelectedFaction()
  end

  if (not factionIndex) or (factionIndex == 0) then
    if selectedIndex then
      factionIndex = selectedIndex
    else
      return
    end
  end

  local name, description, standingID, barMin, barMax, barValue, factionID, isMajorFaction

  if REP.AfterShadowLands then
    isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)

    if REP.AfterDragonflight then
      local reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
      name = reputationInfo.name
      description = reputationInfo.description
      factionID = reputationInfo.factionID

      if isMajorFaction then
        local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
        barMin = 0
        barMax = majorFactionData.renownLevelThreshold
        barValue = majorFactionData.renownReputationEarned
        standingID = majorFactionData.renownLevel
      else
        standingID = reputationInfo.reaction
        barMin = reputationInfo.currentReactionThreshold
        barValue = reputationInfo.currentStanding
  
        if standingID == 4 then
          barMax = reputationInfo.nextReactionThreshold
        elseif standingID > 4 then
          barMax = reputationInfo.nextReactionThreshold - reputationInfo.currentReactionThreshold
        else
          barMax = reputationInfo.currentReactionThreshold - reputationInfo.nextReactionThreshold
        end
  
        local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
        isFriend = friendReputationInfo.isFriend
  
        if standingID < 4 or (isFriend and standingID < 4) then
          barMin = barMin * -1
          barMax = barMax * -1
          barValue = barValue * -1
        end
      end
    else
      name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(factionIndex)

      if isMajorFaction then
        local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
        barMin = 0
        barMax = majorFactionData.renownLevelThreshold
        barValue = majorFactionData.renownReputationEarned
        standingID = majorFactionData.renownLevel
      end
    end
  else
    name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(factionIndex)
  end

  local faction = name
  if (faction) then
    local origFaction, oFaction

    if factionID == 1168 then
      origFaction = faction.." (guild)"
      oFaction = string.lower(faction).." (guild)"
      faction = string.lower(faction).." (guild)"
    else
      origFaction = faction
      oFaction = string.lower(faction)
      faction = string.lower(faction)
    end

    if (REP_FactionMapping[faction]) then
      faction = REP_FactionMapping[faction]

      if factionID == 1168 then
        faction = faction.." (guild)"
      end
    end

    if(factionID and C_Reputation.IsFactionParagon(factionID)) then
      local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
      barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
    end

    local friendID

    if (REP.AfterCata and factionID) then
      if not REP.AfterShadowLands then
        friendID, _, _, _, _, _, _, _, _ = GetFriendshipReputation(factionID)
      else
        local reputationInfo = C_GossipInfo.GetFriendshipReputation(factionID)
        if reputationInfo and reputationInfo.friendshipFactionID > 0 then friendID = reputationInfo.friendshipFactionID end
      end
    end

    if friendID ~= nil and barMax == 43000 then
      barMax = 42000
    end

    if isMajorFaction then
      local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
      local isCapped = C_MajorFactions.HasMaximumRenown(factionID)
      local hasParagon = C_Reputation.GetFactionParagonInfo(factionID)
      
      standingId = majorFactionData.renownLevel
      barMin = 0

      if isCapped and hasParagon then
        -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
        local currentValue, threshold, _, _ = C_Reputation.GetFactionParagonInfo(factionID)
        barMax, barValue = threshold, mod(currentValue, threshold)     
      else
        barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
        barMax = standingId * majorFactionData.renownLevelThreshold
        barValue = ((standingId - 1) * majorFactionData.renownLevelThreshold) + barValue
      end
    end

    -- Normalize Values
    local normMax = barMax - barMin
    local normCurrent = barValue - barMin
    local repToNext = barMax - barValue

    if (REP_FactionGain[oFaction]) then
      local fg_sid = REP_FactionGain[oFaction][standingID]

      if (fg_sid) then
        -- instances
        if (fg_sid.instance and REP_Data.Global.ShowInstances) then
          local fg_sid_x = fg_sid.instance

          for i = 0, fg_sid.instance.count do
            local fg_sid_x_d = fg_sid_x.data[i]
            if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
              local toDo = string.format("%.2f", repToNext / fg_sid_x_d.rep)
              if (fg_sid_x_d.limit) then
                toDo = string.format("%.2f", (fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
              end

              REP_UpdateList[index] = {}
              local FUL_I = REP_UpdateList[index]
              local bul_name = REP:InitMapName(fg_sid_x_d.name, true)
              FUL_I.type = REP_TXT.instanceShort
              FUL_I.times = math.ceil(toDo).."x"
              FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
              FUL_I.hasList = false
              FUL_I.listShown = nil
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              FUL_I.name = bul_name.." ("..fg_sid_x_d.level..")"
              FUL_I.tooltipHead = REP_TXT.instanceHead
              FUL_I.tooltipTip = REP_TXT.instanceTip
              FUL_I.tooltipDetails = {}
              local FUL_I_TD = FUL_I.tooltipDetails
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.instance2, bul_name)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mode, fg_sid_x_d.level)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.timesToRun, FUL_I.times)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
              FUL_I.tooltipDetails = FUL_I_TD
              REP_UpdateList[index] = FUL_I
              index = index + 1
            end
          end
        end

        -- mobs
        if (fg_sid.mobs and REP_Data.Global.ShowMobs) then
          local fg_sid_x = fg_sid.mobs

          for i = 0, fg_sid_x.count do
            local fg_sid_x_d = fg_sid_x.data[i]
            if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
              local toDo = ceil(repToNext / fg_sid_x_d.rep)
              if (fg_sid_x_d.limit) then
                toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
              end

              REP_UpdateList[index] = {}
              local FUL_I = REP_UpdateList[index]
              FUL_I.type = REP_TXT.mobShort
              FUL_I.times = math.ceil(toDo).."x"
              FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
              FUL_I.hasList = false
              FUL_I.listShown = nil
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              FUL_I.tooltipHead = REP_TXT.mobHead
              FUL_I.tooltipTip = REP_TXT.mobTip
              local bul_name = REP:InitMobName(fg_sid_x_d.name)

              if (fg_sid_x_d.zone) then
                local bul_zone = REP:InitMapName(fg_sid_x_d.zone, false)

                if bul_zone then
                  FUL_I.name = bul_name.." ("..bul_zone..")"
                else
                  FUL_I.name = bul_name
                end

                FUL_I.tooltipDetails = {}
                local FUL_I_TD = FUL_I.tooltipDetails
                local x = 0
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mob2, bul_name)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.location, bul_zone)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
                FUL_I_TD.count = x
              else
                FUL_I.name = bul_name
                FUL_I_TD = {}
                local x = 0
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mob2, bul_name)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)
                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
                FUL_I_TD.count = x
                FUL_I.tooltipDetails = FUL_I_TD
              end

              REP_UpdateList[index] = FUL_I
              index = index + 1
            end
          end
        end

        -- quests (may have items)
        local sum = 0
        local count = 0

        if fg_sid.quests then
          if (REP_Data.Global.ShowQuests or REP_Data.Global.ShowPvPQuests) then
            local fg_sid_x = fg_sid.quests

            for i = 0, fg_sid_x.count do
              local fg_sid_x_d = fg_sid_x.data[i]
              local showQuest = true
  
              if (not REP_Data.Global.ShowPvPQuests and fg_sid_x_d.isPvp) then
                showQuest = false
              end

              if (not REP_Data.Global.ShowQuests and not fg_sid_x_d.isPvp) then
                showQuest = false
              end

              if (fg_sid_x_d.profession) then
                -- REP:Print("Quest: "..tostring(fg_sid_x_d.name).." Is PvP: "..tostring(fg_sid_x_d.isPvp))
  
                local fg_sid_x_d_p = fg_sid_x_d.profession
                if ((fg_sid_x_d_p == REP.LIMIT_TYPE_Herb) and not REP.Herb) then
                  -- if list of known professions does not contain Herbology
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Skin) and not REP.Skin) then
                  -- if list of known professions does not contain Herbology
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Mine) and not REP.Mine) then
                  -- if list of known professions does not contain Herbology
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Gather) and not (REP.Herb or REP.Skin or REP.Mine)) then
                  -- no gathering profession
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Jewel) and not REP.Jewel) then
                  -- if list of known professions does not contain jewelcrafting
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Cook) and not REP.Cook) then
                  -- if list of known professions does not contain jewelcrafting
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Arch) and not REP.Arch) then
                  -- if list of known professions does not contain jewelcrafting
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Fish) and not REP.Fish) then
                  -- if list of known professions does not contain jewelcrafting
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Aid) and not REP.Aid) then
                  -- if list of known professions does not contain jewelcrafting
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Blac) and not REP.Black) then
                  -- if list of known professions does not contain BLACKsmith
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Tail) and not REP.Tailor) then
                  -- if list of known professions does not contain tailor
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Leat) and not REP.Leath) then
                  -- if list of known professions does not contain leather
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Ench) and not REP.Enchan) then
                  -- if list of known professions does not contain enchanter
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Engi) and not REP.Engin) then
                  -- if list of known professions does not contain BLACKsmith
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Incr) and not REP.Incrip) then
                  -- if list of known professions does not contain leather
                  showQuest = false
                elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Alch) and not REP.Alche) then
                  -- if list of known professions does not contain enchanter
                  showQuest = false
                else
                  -- unexpected limit -> ignore this and still show quest ggg
                end
              end
  
              if (showQuest) then
                if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
                  local toDo = ceil(repToNext / fg_sid_x_d.rep)
                  if (fg_sid_x_d.limit) then
                    toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
                  end
  
                  REP_UpdateList[index] = {}
                  local FUL_I = REP_UpdateList[index]
                  FUL_I.type = REP_TXT.questShort
                  FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
                  FUL_I.index = index
                  FUL_I.belongsTo = nil
                  FUL_I.isShown = true
                  local bul_name = REP:Quest_Names(fg_sid_x_d.name)
                  FUL_I.name = bul_name
                  FUL_I.originalName = FUL_I.name
                  FUL_I.tooltipHead = REP_TXT.questHead
  
                  if (fg_sid_x_d.repeatable) then
                    FUL_I.times = math.ceil(toDo).."x"
                    FUL_I.tooltipTip = REP_TXT.questTip
                  else
                    FUL_I.times = math.ceil(1).."x"
                    FUL_I.tooltipTip = REP_TXT.questTipNonRepeatable
                  end
  
                  FUL_I.faction = faction
                  FUL_I.canSuppress = true
                  FUL_I.suppress = nil
                  if (REP_Suppressed and REP_Suppressed[oFaction] and REP_Suppressed[oFaction][FUL_I.originalName]) then
                    FUL_I.suppress = true
                  end
  
                  FUL_I.tooltipDetails = {}
                  local FUL_I_TD = FUL_I.tooltipDetails
                  local x = 0
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.quest2, FUL_I.name)
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)
  
                  if (not FUL_I.suppress) then
                    if (fg_sid_x_d.repeatable) then
                      sum = sum + fg_sid_x_d.rep
                      count = count + 1
                    end
                  end
  
                  if (fg_sid_x_d.items) then
                    FUL_I.hasList = true
                    FUL_I.listShown = false
                    FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                    FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.itemsRequired, " ")
                    -- quest In log?
                    FUL_I.lowlight = nil
  
                    -- check if this quest is known
                    local entries, quests
  
                    if REP.AfterBfA then
                      entries, quests = C_QuestLog.GetNumQuestLogEntries()
                    else
                      entries, quests = GetNumQuestLogEntries()
                    end
  
                    for z = 1, entries do
                      local title, level, tag, group, header, collapsed, complete, daily
  
                      if REP.AfterBfA then
                        title, level, tag, group, header, collapsed, complete, daily = C_QuestLog.GetTitleForLogIndex(z)
                      else
                        title, level, tag, group, header, collapsed, complete, daily = GetQuestLogTitle(z)
                      end
  
                      if (title and not header) then
                        if string.find(string.lower(bul_name), string.lower(title)) then
                          -- this quest matches
                          FUL_I.lowlight = true
                          FUL_I.name = FUL_I.name..REP.QUEST_ACTIVE_COLOUR.." ("..REP_TXT.active..")|r"
                        end
                      end
                    end
  
                    -- add items
                    local itemIndex = index + 1
                    local currentQuestTimesBag = -1
                    local currentQuestTimesBagBank = -1
  
                    for item in pairs(fg_sid_x_d.items) do
                      REP_UpdateList[itemIndex] = {}
                      local FUL_II = REP_UpdateList[itemIndex]
                      FUL_II.type = ""
                      FUL_II.times = math.ceil((fg_sid_x_d.items[item] * toDo)).."x"
                      FUL_II.rep = nil
                      FUL_II.index = itemIndex
                      FUL_II.belongsTo = index
                      FUL_II.hasList = nil
                      FUL_II.listShown = nil
                      FUL_II.isShown = FUL_I.listShown
                      FUL_II.name = REP:InitItemName(item).." ("..fg_sid_x_d.items[item].."x)"
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, fg_sid_x_d.items[item].."x", REP:InitItemName(item))
                      FUL_II, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, FUL_II, item)
                      REP_UpdateList[itemIndex] = FUL_II
                      itemIndex = itemIndex + 1
                    end
  
                    if (currentQuestTimesBag > 0) then
                      FUL_I.highlight = true
                      FUL_I.lowlight = nil
                      FUL_I.name = FUL_I.name..REP.BAG_COLOUR.." ["..currentQuestTimesBag.."x]|r"
                      FUL_I.currentTimesBag = currentQuestTimesBag
                      FUL_I.currentRepBag = currentQuestTimesBag * FUL_I.rep
                      REP_CurrentRepInBag = REP_CurrentRepInBag + FUL_I.currentRepBag
                      --FUL_I.name = FUL_I.originalName
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBag, " ")
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBag))
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBag))
                    else
                      FUL_I.currentTimesBag = nil
                      FUL_I.currentRepBag = nil
                    end
  
                    if (currentQuestTimesBagBank > 0) then
                      FUL_I.name = FUL_I.name..REP.BAG_BANK_COLOUR.." ["..currentQuestTimesBagBank.."x]|r"
                      FUL_I.currentTimesBagBank = currentQuestTimesBagBank
                      FUL_I.currentRepBagBank = currentQuestTimesBagBank * FUL_I.rep
                      FUL_I.highlight = true
                      FUL_I.name = FUL_I.originalName
                      FUL_I.lowlight = nil
                      REP_CurrentRepInBagBank = REP_CurrentRepInBagBank + FUL_I.currentRepBagBank
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBagBank, " ")
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBagBank))
                      FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBagBank))
                    else
                      FUL_I.currentTimesBagBank = nil
                      FUL_I.currentRepBagBank = nil
                    end
  
                    if ((currentQuestTimesBag == 0) and (currentQuestTimesBagBank)) then
                      FUL_I.highlight = nil
                    end
  
                    index = itemIndex
                  else
                    -- no items to add
                    FUL_I.hasList = false
                    FUL_I.listShown = nil
                    FUL_I.highlight = nil	-- will be Changed below if needed
                    FUL_I.lowlight = nil
  
                    -- check if this quest is known and/or completed
                    local entries, quests
  
                    if REP.AfterBfA then
                      entries, quests = C_QuestLog.GetNumQuestLogEntries()
                    else
                      entries, quests = GetNumQuestLogEntries()
                    end
  
                    for z = 1, entries do
                      local title, level, tag, group, header, collapsed, complete, daily
  
                      if REP.AfterBfA then
                        title, level, tag, group, header, collapsed, complete, daily = C_QuestLog.GetTitleForLogIndex(z)
                      else
                        title, level, tag, group, header, collapsed, complete, daily = GetQuestLogTitle(z)
                      end
  
                      if (title) then
                        if string.find(string.lower(bul_name), string.lower(title)) then
                          -- this quest matches
                          if (complete) then
                            FUL_I.highlight = true
                            FUL_I.name = FUL_I.name..REP.QUEST_COLOUR.." ("..REP_TXT.complete..")|r"
                            FUL_I.currentTimesQuest = 1
                            FUL_I.currentRepQuest = FUL_I.rep
                            REP_CurrentRepInQuest = REP_CurrentRepInQuest + fg_sid_x_d.rep
                            FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.questCompleted, " ")
                            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepQuest))
                          else
                            FUL_I.lowlight = true
                            FUL_I.name = FUL_I.name..REP.QUEST_ACTIVE_COLOUR.." ("..REP_TXT.active..")|r"
                          end
                        end
                      end
                    end
  
                    index = index + 1
                  end
  
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                  FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
                  FUL_I_TD.count = x
                end
              end
            end
  
            if ((sum > 0) and (count > 1)) then
              -- add virtual quest to show summary of all quests:
              local toDo = ceil(repToNext / sum)
              REP_UpdateList[index] = {}
              local FUL_I = REP_UpdateList[index]
              FUL_I.type = REP_TXT.questShort
              FUL_I.times = math.ceil(toDo).."x"
              FUL_I.rep = string.format("%d", sum)
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              FUL_I.name = string.format(REP_TXT.allOfTheAbove, count)
              FUL_I.tooltipHead = string.format(REP_TXT.questSummaryHead, count)
              FUL_I.tooltipTip = REP_TXT.questSummaryTip
              FUL_I_TD = {}
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x  = REP:Update_Tooltip(x, REP_TXT.timesToDo, FUL_I.times)
              FUL_I_TD.count = x-1
              FUL_I.tooltipDetails = FUL_I_TD
              REP_UpdateList[index] = FUL_I
              index = index + 1
            end  
          end
        end

        -- items
        if (fg_sid.items and REP_Data.Global.ShowItems) then
          local fg_sid_x = fg_sid.items
          for i = 0, fg_sid_x.count do
            local fg_sid_x_d = fg_sid_x.data[i]
            if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
              local toDo = ceil(repToNext / fg_sid_x_d.rep)
              if (fg_sid_x_d.limit) then
                toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
              end

              if (fg_sid_x_d.items) then
                REP_UpdateList[index] = {}
                local FUL_I = REP_UpdateList[index]
                FUL_I.type = REP_TXT.itemsShort
                FUL_I.times = math.ceil(toDo).."x"
                FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
                FUL_I.index = index
                FUL_I.belongsTo = nil
                FUL_I.isShown = true
                FUL_I.name = REP_TXT.itemsName
                FUL_I.hasList = true
                FUL_I.listShown = false
                FUL_I.tooltipHead = REP_TXT.itemsHead
                FUL_I.tooltipTip = REP_TXT.itemsTip
                FUL_I.tooltipDetails = {}
                local FUL_I_TD = FUL_I.tooltipDetails

                local x = 0
                FUL_I_TD[x], x = REP:Update_Tooltip(x, FUL_I.name, " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.itemsRequired, " ")

                -- add items
                local itemIndex = index + 1
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1

                for item in pairs(fg_sid_x_d.items) do
                  REP_UpdateList[itemIndex] = {}
                  local FUL_II = REP_UpdateList[itemIndex]
                  FUL_II.type = ""
                  FUL_II.times = math.ceil((fg_sid_x_d.items[item] * toDo)).."x"
                  FUL_II.rep = nil
                  FUL_II.index = itemIndex
                  FUL_II.belongsTo = index
                  FUL_II.hasList = nil
                  FUL_II.listShown = nil
                  FUL_II.isShown = FUL_I.listShown
                  local tempItemName = REP:InitItemName(item)
                  FUL_II.name = tempItemName.." ("..fg_sid_x_d.items[item].."x)"
                  FUL_I.name = tempItemName
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, fg_sid_x_d.items[item].."x", REP:InitItemName(item))
                  FUL_II, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, FUL_II, item)

                  if fg_sid_x_d.alternativeItems ~= nil then
                    for altItem in pairs(fg_sid_x_d.alternativeItems) do
                      local temp_FUL_II, temp_currentQuestTimesBag, temp_currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.alternativeItems[altItem], -1, -1, FUL_II, altItem)

                      if temp_FUL_II then
                        -- Do something
                      end

                      if temp_currentQuestTimesBagBank > 0 then
                        if currentQuestTimesBagBank < 0 then
                          currentQuestTimesBagBank = temp_currentQuestTimesBagBank
                        else
                          currentQuestTimesBagBank = currentQuestTimesBagBank + temp_currentQuestTimesBagBank
                        end
                      end

                      if temp_currentQuestTimesBag > 0 then
                        currentQuestTimesBag = currentQuestTimesBag + temp_currentQuestTimesBag
                      end
                    end
                  end

                  REP_UpdateList[itemIndex] = FUL_II
                  itemIndex = itemIndex + 1
                end

                if (currentQuestTimesBag > 0) then
                  FUL_I.highlight = true
                  FUL_I.lowlight = nil
                  FUL_I.name = FUL_I.name..REP.BAG_COLOUR.." ["..currentQuestTimesBag.."x]|r"
                  FUL_I.currentTimesBag = currentQuestTimesBag
                  FUL_I.currentRepBag = currentQuestTimesBag * FUL_I.rep
                  REP_CurrentRepInBag = REP_CurrentRepInBag + FUL_I.currentRepBag
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBag, " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBag))
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBag))
                end

                if (currentQuestTimesBagBank > 0) then
                  FUL_I.highlight = true
                  FUL_I.lowlight = nil
                  FUL_I.name = FUL_I.name..REP.BAG_BANK_COLOUR.." ["..currentQuestTimesBagBank.."]|r"
                  FUL_I.currentTimesBagBank = currentQuestTimesBagBank
                  FUL_I.currentRepBagBank = currentQuestTimesBagBank * FUL_I.rep
                  REP_CurrentRepInBagBank = REP_CurrentRepInBagBank + FUL_I.currentRepBagBank
                  FUL_I_TD[x] = {}

                  if (not REP_UpdateList[index].hasList) then return end	-- not a list Header entry

                  FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBagBank, " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBagBank))
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBagBank))
                end

                if ((currentQuestTimesBag == 0) and (currentQuestTimesBagBank > 0 == false)) then
                  FUL_I.highlight = nil
                end

                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
                FUL_I_TD.count = x
                FUL_I.tooltipDetails = FUL_I_TD
                REP_UpdateList[index] = FUL_I
                index = itemIndex
              end
            end
          end
        end

        -- General
        if (fg_sid.general and REP_Data.Global.ShowGeneral) then
          local fg_sid_x = fg_sid.general
          for i = 0, fg_sid_x.count do
            local fg_sid_x_d = fg_sid_x.data[i]
            if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
              local toDo = string.format("%.2f", repToNext / fg_sid_x_d.rep)
              if (fg_sid_x_d.limit) then
                toDo = string.format("%.2f", (fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
              end

              -- calculate Number of times to do differently for Guild cap
              REP_UpdateList[index] = {}
              local FUL_I = REP_UpdateList[index]
              FUL_I.type = REP_TXT.generalShort
              FUL_I.times = math.ceil(toDo).."x"
              FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              FUL_I.hasList = false
              FUL_I.listShown = nil
              local bul_name = fg_sid_x_d.name
              FUL_I.name = bul_name

              if (fg_sid_x_d.head and fg_sid_x_d.head ~= "") then
                FUL_I.tooltipHead = fg_sid_x_d.head
              else
                FUL_I.tooltipHead = REP_TXT.generalHead
              end

              if (fg_sid_x_d.tip and fg_sid_x_d.tip ~= "") then
                FUL_I.tooltipTip = fg_sid_x_d.tip
              else
                FUL_I.tooltipTip = REP_TXT.generalTip
              end

              FUL_I.tooltipDetails = {}
              local FUL_I_TD = FUL_I.tooltipDetails
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.general2, bul_name)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.timesToRun, FUL_I.times)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              if (fg_sid_x_d.tipList) then
                for tip in pairs(fg_sid_x_d.tipList) do
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, tip, fg_sid_x_d.tipList[tip])
                end

                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              end

              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
              local FUL_I_TD = FUL_I.tooltipDetails
              REP_UpdateList[index] = FUL_I
              index = index + 1
            end
          end
        end
      end
    end
  end

  REP_UpdateList_Update()
end

function REP:Quest_Items(itemsNeed, currentQuestTimesBag, currentQuestTimesBagBank, QuestItem, item)
  if not QuestItem.times then
    QuestItem = {}
    QuestItem.name = "James"
  end

  local itemCountIncludingBank, itemCountExcludingBank, currencyInfo

  if REP.AfterDragonflight then
    itemCountIncludingBank = C_Item.GetItemCount(item, true)
    itemCountExcludingBank = C_Item.GetItemCount(item)
  else
    itemCountIncludingBank = GetItemCount(item, true)
    itemCountExcludingBank = GetItemCount(item)
  end

  if REP.AfterCata then
    currencyInfo = C_CurrencyInfo.GetCurrencyInfo(item)
  else
    currencyInfo = GetCurrencyInfo(item)
  end

  local itemBag, itemTotal = 0, 0

  if (itemCountIncludingBank == 0 and not currencyInfo) then -- not enough of this item for quest -> set to 0
    currentQuestTimesBag = 0
  else
    if (itemCountIncludingBank == 0) then -- If GetItemCount is 0 then this is a currency and not a item
      if REP.AfterCata then
        itemBag = currencyInfo.quantity
      else
        _, itemBag = currencyInfo
      end

      itemTotal = itemBag
    else
      itemBag = itemCountExcludingBank
      itemTotal = itemCountIncludingBank
    end

    ---- Weird bug in classic where it saw 0 as nil in some situations...
    if not itemTotal then itemTotal = 0 end
    if not itemBag then itemBag = 0 end
    local itemBank = itemTotal - itemBag

    if ((itemBag >= itemsNeed) and (itemsNeed > 0)) then
      QuestItem.currentTimesBag = floor(itemBag / itemsNeed)
      QuestItem.name = QuestItem.name..REP.BAG_COLOUR.." ["..itemBag.."x]|r"

      if (currentQuestTimesBag == -1) then
        -- first items for this quest --> take value
        currentQuestTimesBag = QuestItem.currentTimesBag
      else
        -- some items already Set
        if (QuestItem.currentTimesBag < currentQuestTimesBag) then
          -- fewer of this item than of others, reduce quest count
          currentQuestTimesBag = QuestItem.currentTimesBag
        end
      end
    else
      -- not enough of this item for quest -> set to 0
      currentQuestTimesBag = 0
      QuestItem.name = QuestItem.name.." ["..itemBag.."x]"
    end

    if itemBank > 0 then
      if ((itemTotal >= itemsNeed) and (itemsNeed > 0)) then
        QuestItem.name = QuestItem.name..REP.BAG_BANK_COLOUR.." ["..itemTotal.."x]|r"
        QuestItem.currentTimesBagBank = floor(itemBank / itemsNeed)

        if (currentQuestTimesBagBank == -1) then
          -- first items for this quest --> take value
          currentQuestTimesBagBank = QuestItem.currentTimesBagBank
        else
          -- some items already Set
          if (QuestItem.currentTimesBagBank < currentQuestTimesBagBank) then
            -- fewer of this item than of others, reduce quest count
            currentQuestTimesBagBank = QuestItem.currentTimesBagBank
          end
        end
      else
        -- not enough of this item for quest -> set to 0
        currentQuestTimesBagBank = 0
        QuestItem.name = QuestItem.name.." ["..itemBank.."x]"
      end
    else
    -- none of this carried In bank
    end
  end

  return QuestItem, currentQuestTimesBag, currentQuestTimesBagBank
end

function REP:GetUpdateListSize()
  -- sub function of	REP_UpdateList_Update()
  local count = 0
  local highest = 0
  for i in pairs(REP_UpdateList) do
    if (REP_UpdateList[i].isShown) then
      count = count + 1
      if (i > highest) then
        highest = i
      end
    end
  end

  return count, highest
end

function REP:ShowUpdateEntry(index, show)
  if (not REP_UpdateList[index]) then return end		-- invalid index
  if (not REP_UpdateList[index].hasList) then return end	-- not a list Header entry
  if (type(show) ~= "boolean") then return end -- wrong data type

  REP_UpdateList[index].listShown = show
  for i in pairs(REP_UpdateList) do
    if (REP_UpdateList[i].belongsTo == index) then
      REP_UpdateList[i].isShown = show
    end
  end

  REP_UpdateList_Update()
end

function REP_ShowUpdateEntries(show)
  if (type(show) ~= "boolean") then return end -- wrong data type

  for i in pairs(REP_UpdateList) do
    if (REP_UpdateList[i].belongsTo == nil) then
      -- always show parent entries, show or Hide their children
      REP_UpdateList[i].isShown = true
      REP_UpdateList[i].listShown = show
    else
      -- show or Hide child entries
      REP_UpdateList[i].isShown = show
    end
  end

  REP_UpdateList_Update()
end

function REP_ShowLineToolTip(self)
  if not self then return end

  if (self.tooltipHead) then
    GameTooltip_SetDefaultAnchor(GameTooltip, self)
    GameTooltip:SetText(self.tooltipHead, 1, 1, 0.5, 1)
    if (self.tooltipTip) then
      GameTooltip:AddLine(self.tooltipTip, 1, 1, 1, 1)
    end

    if (self.tooltipDetails and type(self.tooltipDetails) == "table") then
      GameTooltip:AddLine(" ", 1, 1, 1, 1)
      for i = 0, self.tooltipDetails.count do
        if (self.tooltipDetails[i].l and self.tooltipDetails[i].r) then
          if (self.tooltipDetails[i].r == " " or self.tooltipDetails[i].r=="") then
            GameTooltip:AddDoubleLine(self.tooltipDetails[i].l, self.tooltipDetails[i].r, 1, 1, 0, 1, 1, 1)
          else
            GameTooltip:AddDoubleLine(self.tooltipDetails[i].l, self.tooltipDetails[i].r, 1, 1, 0.5, 1, 1, 1)
          end
        end
      end
    end

    GameTooltip:Show()
  end
end

function REP_ShowHelpToolTip(self, element)
  if not element then return end

  local name = ""
  -- cut off leading frame name
  --if (string.find(element, GLDG_GUI)) then
  --	name = string.sub(element, string.len(GLDG_GUI)+1)
  --elseif (string.find(element, GLDG_COLOUR)) then
  --	name = string.sub(element, string.len(GLDG_COLOUR)+1)
  --elseif (string.find(element, GLDG_LIST)) then
  name = element
  --end

  -- cut off trailing Number In case of line and collect
  --local s,e = string.find(name, "Line")
  --if (s and e) then
  --	name = string.sub(name, 0, e)
  --end
  --s,e = string.find(name, "Collect")
  --if (s and e) then
  --	name = string.sub(name, 0, e)
  --end

  -- cut off colour button/texture
  --if (string.find(name, "Colour") == 1) then
  --	-- ["ColourGuildNewButton"] = true,
  --	s,e = string.find(name, "Button")
  --	if (s and e) then
  --		name = string.sub(name, 0, s-1)
  --	end
  --	-- ["ColourGuildNewColour"] = true,
  --	s,e = string.find(name, "Colour", 2)	-- start at 2 to skip the initial Colour
  --	if (s and e) then
  --		name = string.sub(name, 0, s-1)
  --	end
  --end

  local tip = ""
  local head = ""
  if (REP_TXT.elements and
    REP_TXT.elements.name and
    REP_TXT.elements.tip and
    REP_TXT.elements.name[name] and
    REP_TXT.elements.tip[name]) then
    tip = REP_TXT.elements.tip[name]
    head = REP_TXT.elements.name[name]

    if (REP_Data.Global.needsTip and REP_Data.Global.needsTip[name]) then
      REP_Data.Global.needsTip[name] = nil
    end
  else
    if (not REP_Data.Global.needsTip) then
      REP_Data.Global.needsTip = {}
    end

    REP_Data.Global.needsTip[name] = true
  end

  --GameTooltip_SetDefaultAnchor(GameTooltip, self)
  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")

  if (head ~= "") then
    GameTooltip:SetText(head, 1, 1, 0.5, 1.0, 1)
    GameTooltip:AddLine(tip, 1, 1, 1, 1.0, 1)
    -- GameTooltip:AddLine(name, 1, 0, 0, 1.0, 1)
    -- else
    -- GameTooltip:SetText(element, 1, 1, 0.5, 1.0, 1)
    -- GameTooltip:AddLine(name, 1, 1, 1, 1.0, 1)
  end

  GameTooltip:Show()
end

function TableSort(a, b)
  return a.rep > b.rep
end

-----------------------------------
-- _12_ reputation Changes to chat
-----------------------------------
function REP:TestRepGain(factionID, repEarned, newRenownLevel)
  if (not factionID or not repEarned) then return end

  local repGained = 0
  local isMajorFaction

  if REP.AfterShadowLands then
    isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)
  end

  if isMajorFaction then
    local isCapped = C_MajorFactions.HasMaximumRenown(factionID)
    local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)

    local name = majorFactionData.name
    local barMin = 0
    local barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
    local renownLevel = majorFactionData.renownLevel
    local barMax = (renownLevel + 1) * majorFactionData.renownLevelThreshold
    barValue = ((renownLevel - 1) * majorFactionData.renownLevelThreshold) + barValue
    barValue = barValue + repEarned

    if (barValue - REP_StoredRep[name].origRep) > 0 then
      repGained = barValue - REP_StoredRep[name].origRep
    end

    if REP_StoredRep[name] then
      local sign = "+"
      REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, name, barValue - REP_StoredRep[name].rep, sign, repEarned, RENOWN_LEVEL_LABEL..renownLevel + 1, barMax - barValue))
      REP:Print("=========================================================")
      REP:Print(REP.NEW_REP_COLOUR.."Name: "..tostring(name).." origRep: "..tostring(REP_StoredRep[name].origRep).." repEarned: "..tostring(repEarned).." CurrentStanding: "..tostring(barValue))
      REP:Print("=========================================================")
    end
  end
end

function REP:DumpReputationChangesToChat(initOnly)
  if not REP_StoredRep then REP_StoredRep = {} end

  if (REP_OnLoadingScreen == false) then
    local numFactions
    if REP.AfterDragonflight then
      numFactions = C_Reputation.GetNumFactions()
    else
      numFactions = GetNumFactions()
    end
    local factionIndex, watchIndex, watchedIndex, watchName
    local name, standingID, barMin, barMax, barValue, isHeader, hasRep
    local factionID

    watchIndex = 0
    watchedIndex = 0
    watchName = nil

    for factionIndex = 1, numFactions, 1 do
      if REP.AfterDragonflight then
        local reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
        name = reputationInfo.name
        standingID = reputationInfo.reaction
        barMin = reputationInfo.currentReactionThreshold
        barMax = reputationInfo.nextReactionThreshold
        barValue = reputationInfo.currentStanding
        isHeader = reputationInfo.isHeader
        hasRep = reputationInfo.isHeaderWithRep
        isWatched = reputationInfo.isWatched
        factionID = reputationInfo.factionID
      else
        name, _, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep, isWatched, _, factionID = GetFactionInfo(factionIndex)
      end

      if not barValue then
        barValue = 0
      end

      local friendID, friendTextLevel, nextFriendThreshold, artificialBarValue, artificialBarMax, isFriendRep
      local isCapped = false
      local isMajorFaction
      local renownLevel

      if not name then return end

      if factionID == 1168 then
        name = name.." (guild)"
      end

      if REP.AfterWoD then
        if(factionID and C_Reputation.IsFactionParagon(factionID)) then
          local currentValue, threshold = C_Reputation.GetFactionParagonInfo(factionID)
          barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
        end
      end

      if (REP.AfterCata and factionID) then
        if not REP.AfterShadowLands then
          friendID, _, _, _, _, _, friendTextLevel, _, nextFriendThreshold = GetFriendshipReputation(factionID)
        else
          local friendshipReputationInfo = C_GossipInfo.GetFriendshipReputation(factionID)
          if friendshipReputationInfo and friendshipReputationInfo.friendshipFactionID > 0 then
            friendID = friendshipReputationInfo.friendshipFactionID
            friendTextLevel = friendshipReputationInfo.reaction
            nextFriendThreshold = friendshipReputationInfo.nextThreshold
            if (friendshipReputationInfo.nextThreshold) then
              barMin, barMax, barValue = friendshipReputationInfo.reactionThreshold, friendshipReputationInfo.nextThreshold, friendshipReputationInfo.standing
            else
              barMin, barMax, barValue = 0, 1, 1
              isCapped = true
            end
          end
        end

        if REP.AfterShadowLands then
          isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)
        end

        if isMajorFaction then
          local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
          local hasParagon = C_Reputation.GetFactionParagonInfo(factionID)
          barMin = 0
          isCapped = C_MajorFactions.HasMaximumRenown(factionID)
          renownLevel = majorFactionData.renownLevel

          if isCapped and hasParagon then
            -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
            local currentValue, threshold, _, _ = C_Reputation.GetFactionParagonInfo(factionID)
            barMax, barValue = threshold, mod(currentValue, threshold)
          else
            barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
            barMax = renownLevel * majorFactionData.renownLevelThreshold
            artificialBarValue = barValue
            artificialBarMax = majorFactionData.renownLevelThreshold
            barValue = ((renownLevel - 1) * majorFactionData.renownLevelThreshold) + barValue
          end
        end
      end

      if (not isHeader or hasRep) then
        if (isWatched) then
          watchedIndex = factionIndex
        end

        if REP_StoredRep[name] and not initOnly then
          if (REP_Data.Global.WriteChatMessage) then
            if (not REP_Data.Global.NoGuildGain or name ~= REP.GuildName) then
              local sign = ""
              if ((barValue - REP_StoredRep[name].origRep) > 0 or isMajorFaction) then
                sign = "+"
              end

              if (isMajorFaction and not isCapped) then
                if (barValue < REP_StoredRep[name].rep) then
                  barValue = REP_StoredRep[name].rep + (artificialBarMax - math.fmod(REP_StoredRep[name].rep, artificialBarMax)) + artificialBarValue
                  renownLevel = renownLevel + 1
                  barMax = renownLevel * artificialBarMax
                end
              end

              if (barValue > REP_StoredRep[name].rep) then
                if isMajorFaction then
                  if isCapped then
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.stats, name, barValue - REP_StoredRep[name].rep, sign, barValue - REP_StoredRep[name].origRep, barMax - barValue))
                  else
                    -- If isMajorFaction below max rank use the format (Total: %s%d, Left to %s: %d) if not use the normal format (Total: %s%d, Left: %d)
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, name, barValue - REP_StoredRep[name].rep, sign, barValue - REP_StoredRep[name].origRep, RENOWN_LEVEL_LABEL..renownLevel + 1, barMax - barValue))
                  end
                else
                  -- increased rep
                  if (friendID ~= nil and nextFriendThreshold ~= nil) then
                    -- If the faction is a friend faction and not at max rank get the next standing text
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, name, barValue - REP_StoredRep[name].rep, sign, barValue - REP_StoredRep[name].origRep, REP_GetFriendFactionStandingLabel(factionID, nextFriendThreshold), barMax - barValue))
                  elseif (friendID == nil and standingID < 8 and not isMajorFaction) then
                    -- If not a friend faction and below max rank use the format (Total: %s%d, Left to %s: %d) if not use the normal format (Total: %s%d, Left: %d)
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, name, barValue - REP_StoredRep[name].rep, sign, barValue - REP_StoredRep[name].origRep, _G["FACTION_STANDING_LABEL"..standingID + 1], barMax - barValue))
                  else
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.stats, name, barValue - REP_StoredRep[name].rep, sign, barValue - REP_StoredRep[name].origRep, barMax - barValue))
                  end
                end
              elseif (not isMajorFaction) then
                if(barValue < REP_StoredRep[name].rep) then
                  -- decreased rep
                  if (standingID > 1 and friendID == nil) then --  and not isMajorFaction
                    -- Only use the new format (Total: %s%d, Left to %s: %d) if we are above the lowest rank, otherwise use the normal format (Total: %s%d, Left: %d)
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_DECREASED..REP_TXT.statsNextStanding, name, REP_StoredRep[name].rep - barValue, sign, barValue - REP_StoredRep[name].origRep, _G["FACTION_STANDING_LABEL"..standingID + 1], barMax - barValue))
                  else
                    REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_DECREASED..REP_TXT.stats, name, REP_StoredRep[name].rep - barValue, sign, barValue - REP_StoredRep[name].origRep, barMax - barValue))
                  end
                end
              end

              if isMajorFaction then
                if (REP_StoredRep[name].standingID ~= renownLevel) then
                  REP:Print(REP.NEW_STANDING_COLOUR..string.format(FACTION_STANDING_CHANGED, RENOWN_LEVEL_LABEL..renownLevel, name))
                end
              else
                if (REP_StoredRep[name].standingID ~= standingID) then
                  if friendID == nil then
                    REP:Print(REP.NEW_STANDING_COLOUR..string.format(FACTION_STANDING_CHANGED, _G["FACTION_STANDING_LABEL"..standingID], name))
                  else
                    REP:Print(REP.NEW_STANDING_COLOUR..string.format(FACTION_STANDING_CHANGED, friendTextLevel, name))
                  end
                end
              end
            end
          end

          if (REP_Data.Global.SwitchFactionBar) then
            if (not REP_Data.Global.NoGuildSwitch or name ~= REP.GuildName) then
              if (barValue > REP_StoredRep[name].rep) then
                watchIndex = factionIndex
                watchName = name
              end
            end
          end
        else
          REP_StoredRep[name] = {}
          REP_StoredRep[name].origRep = barValue
          REP_StoredRep[name].barMax = barMax
        end

        if isMajorFaction then
          REP_StoredRep[name].standingID = renownLevel
        else
          REP_StoredRep[name].standingID = standingID
        end

        REP_StoredRep[name].rep = barValue
      end
    end

    if(not REP.AfterTBC) then
      if (REP_Data.Global.SwitchFactionBar and REP:TableSize(factionsChanged) > 1) then
        table.sort(factionsChanged, TableSort)
        watchIndex = factionsChanged[1].watchIndex
        watchName = factionsChanged[1].watchName
      end
    end

    if (watchIndex > 0) then
      if (watchIndex ~= watchedIndex) then
        if (not REP_Data.Global.SilentSwitch) then
          REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.switchBar.." ["..tostring(watchName).."|r]")
        end
      end

      -- choose Faction to show
      if REP.AfterDragonflight then
        C_Reputation.SetWatchedFactionByIndex(watchIndex)
      else
        SetWatchedFactionIndex(watchIndex)
      end
    end
  end
end

function REP_ClearSessionGain()
  local factionIndex = GetSelectedFaction()
  local name, _, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep, isWatched, _, factionID = GetFactionInfo(factionIndex)

  if (name) then
    if factionID == 1168 then
      name = name.." (guild)"
    end

    REP_StoredRep[name] = {}

    if REP.AfterShadowLands then
      local isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)

      if isMajorFaction then
        local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
        isCapped = C_MajorFactions.HasMaximumRenown(factionID)
        barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
        
        local renownLevel = majorFactionData.renownLevel
        barMax = renownLevel * majorFactionData.renownLevelThreshold
        barValue = ((renownLevel - 1) *  majorFactionData.renownLevelThreshold) + barValue -- artificialBarValue
  
        REP_StoredRep[name].standingID = renownLevel
      else
        REP_StoredRep[name].standingID = standingID
      end
    else
      REP_StoredRep[name].standingID = standingID
    end

    REP_StoredRep[name].origRep = barValue
    REP_StoredRep[name].rep = barValue
    REP_StoredRep[name].barMax = barMax
  end

  if not REP.AfterDragonflight then
    ReputationFrame_Update()
  end
end

-----------------------------------
-- _13_ chat filtering
-----------------------------------
function REP_ChatFilter(chatFrame, event, ...)
  -- chatFrame = self
  --[[
    CHAT_MSG_COMBAT_FACTION_CHANGE
    Fires when player's faction changes. ie: "Your reputation with Timbermaw Hold has very slightly increased." -- NEW 1.9
    arg1
    The message to display

    COMBAT_TEXT_UPDATE
    arg1
    Combat message type.
    Known values include "HONOR_GAINED", and "FACTION".
    arg2
    for faction gain, this is the faction name.
    arg3
    for faction gain, the amount of reputation gained.
  ]]--

  local msg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13 = ...

  local skip = false
  if (REP_Data.Global.WriteChatMessage and event) then

    if (event == "CHAT_MSG_COMBAT_FACTION_CHANGE") then
      skip = true
    end

    if ((event == "COMBAT_TEXT_UPDATE") and (msg=="FACTION")) then
      skip = true
    end
  end

  return skip, msg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13
end

-----------------------------------
-- _13_ show option window
-----------------------------------
function REP_OpenSettings()
  REP.Tools.Settings:Open()
end

function REP:ToggleConfigWindow()
  REP.Tools.Settings:Open()

  -- if ReputationFrame:IsVisible() then
  --   if REP_OptionsFrame:IsVisible() then
  --     -- both windows shown -> hide them both
  --     REP_OptionsFrame:Hide()
  --     HideUIPanel(CharacterFrame)
  --   else
  --     -- options window not shown -> show, hide any detail window
  --     REP_OptionsFrame:Show()
  --     REP_ReputationDetailFrame:Hide()
  --     ReputationDetailFrame:Hide()
  --   end

  -- else
  --   -- window not shown -> show both
  --   ToggleCharacter("ReputationFrame")
  --   REP_ReputationDetailFrame:Hide()
  --   ReputationDetailFrame:Hide()
  --   REP_OptionsFrame:Show()
  -- end
end

function REP:ToggleDetailWindow()
  if ReputationFrame:IsVisible() then
    if (REP_Data.Global.ExtendDetails) then
      if REP_ReputationDetailFrame:IsVisible() then
        -- both windows shown -> hide them both
        REP_ReputationDetailFrame:Hide()
        HideUIPanel(CharacterFrame)
      else
        -- detail window not shown -> show it, hide any others
        REP_ReputationDetailFrame:Show()
        ReputationDetailFrame:Hide()
        if not REP.AfterDragonflight then
          ReputationFrame_Update()
        end
      end
    else
      if ReputationDetailFrame:IsVisible() then
        -- both windows shown -> hide them both
        ReputationDetailFrame:Hide()
        HideUIPanel(CharacterFrame)
      else
        -- detail window not shown -> show it, hide any others
        REP_ReputationDetailFrame:Hide()
        ReputationDetailFrame:Show()
        if not REP.AfterDragonflight then
          ReputationFrame_Update()
        end
      end
    end
  else
    -- window not shown -> show both
    ToggleCharacter("ReputationFrame")
    if (REP_Data.Global.ExtendDetails) then
      REP_ReputationDetailFrame:Show()
    else
      ReputationDetailFrame:Show()
    end

    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  end
end

-----------------------------------
-- _14_ Testing
-----------------------------------
function REP_Test()
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

-------------------------------------------
-- _15_ Getting reputation ready to hand In
-------------------------------------------
function REP:GetReadyReputation(factionIndex)
  local result = 0
  return result 
  --[[-- curently disabled
  if not factionIndex then return result end

  if (not ReputationFrame:IsVisible()) then return result end

  local maxFactionIndex = GetNumFactions()
  if (factionIndex > maxFactionIndex) then return result end

  local faction, description, standingId, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild = REP_Orig_GetFactionInfo(factionIndex)
  if (isHeader) then return result end

  if (faction) then
    origFaction = faction
    faction = string.lower(faction)
    if (REP_FactionMapping[faction]) then
      faction = REP_FactionMapping[faction]
    end

    -- Normalize Values
    local normMax = barMax - barMin
    local normCurrent = barValue - barMin
    local repToNext = barMax - barValue

    local REP_FG_f=REP_FactionGain[faction]
    if (REP_FG_f) then
      local REP_FG_fs=REP_FG_f[standingId]
      if (REP_FG_fs) then
        -- quests (may have items)
        local REP_FG_fs_h=REP_FG_fs.quests
        if (REP_FG_fs_h) then
          for i = 0, REP_FG_fs_h.count do
            local REP_FG_fs_h_d=REP_FG_fs_h.data[i]
            if (not REP_FG_fs_h_d.limit or (normCurrent < REP_FG_fs_h_d.limit)) then
              local toDo = ceil(repToNext / REP_FG_fs_h_d.rep)
              if (REP_FG_fs_h_d.limit) then
                toDo = ceil((REP_FG_fs_h_d.limit - normCurrent) / REP_FG_fs_h_d.rep)
              end

              if (REP_FG_fs_h_d.items) then
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1
                for item in pairs(REP_FG_fs_h_d.items) do
                  _, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(REP_FG_fs_h_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, "nil", item)
                end

                if (currentQuestTimesBag > toDo) then
                  currentQuestTimesBag = toDo
                end

                if (currentQuestTimesBagBank > toDo) then
                  currentQuestTimesBagBank = toDo
                end

                if (currentQuestTimesBagBank > 0) then
                  result = result + currentQuestTimesBagBank * REP_FG_fs_h_d.rep
                elseif (currentQuestTimesBag > 0) then
                  result = result + currentQuestTimesBag * REP_FG_fs_h_d.rep
                else
                -- nothing to add
                end
              else
                -- no items, check if this quest is completed
                local entries, quests = GetNumQuestLogEntries()
                for z=1,entries do
                  local title,level,tag,group,header,collapsed,complete,daily = GetQuestLogTitle(z)
                  if (title and not header and complete) then
                    if string.find(string.lower(REP:Quest_Names(REP_FG_fs_h_d.name)), string.lower(title)) then
                      -- this quest matches
                      result = result + REP_FG_fs_h_d.rep
                    end
                  end
                end
              end
            end
          end
        end

        -- items
        local REP_FG_fs_h=REP_FG_fs.items
        if (REP_FG_fs_h and REP_Data.Global.ShowItems) then
          for i = 0, REP_FG_fs_h.count do
            local REP_FG_fs_h_d=REP_FG_fs_h.data[i]
            if (not REP_FG_fs_h_d.limit or (normCurrent < REP_FG_fs_h_d.limit)) then
              local toDo = ceil(repToNext / REP_FG_fs_h_d.rep)
              if (REP_FG_fs_h_d.limit) then
                toDo = ceil((REP_FG_fs_h_d.limit - normCurrent) / REP_FG_fs_h_d.rep)
              end

              if (REP_FG_fs_h_d.items) then
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1
                for item in pairs(REP_FG_fs_h_d.items) do
                  _, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(REP_FG_fs_h_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, "nil", item)
                end

                if (currentQuestTimesBag > toDo) then
                  currentQuestTimesBag = toDo
                end

                if (currentQuestTimesBagBank > toDo) then
                  currentQuestTimesBagBank = toDo
                end

                if (currentQuestTimesBagBank > 0) then
                  result = result + currentQuestTimesBagBank * REP_FG_fs_h_d.rep
                elseif (currentQuestTimesBag > 0) then
                  result = result + currentQuestTimesBag * REP_FG_fs_h_d.rep
                end
              end
            end
          end
        end
      end
    end
  end

  return result
  --]]--
end	

----------------------------------
-- _16_ FSS // RDF_IS // RDF
-----------------------------------
function REP:StandingSort()
  local standings = {}
  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end

  for i = 1, numFactions do
    local name, description, standingID, barMax, barValue, isHeader, hasRep, isWatched, isChild, factionID, hasBonusRepGain
    
    if REP.AfterDragonflight then
      local reputationInfo = C_Reputation.GetFactionDataByIndex(i)
      name = reputationInfo.name
      description = reputationInfo.description
      standingID = reputationInfo.reaction
      barMax = reputationInfo.nextReactionThreshold
      barValue = reputationInfo.currentStanding
      isHeader = reputationInfo.isHeader
      hasRep = reputationInfo.isHeaderWithRep
      isWatched = reputationInfo.isWatched
      isChild = reputationInfo.isChild
      factionID = reputationInfo.factionID
      hasBonusRepGain = reputationInfo.hasBonusRepGain
    else
      name, description, standingID, _, barMax, barValue, _, _, isHeader, _, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(i)
    end

    local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
    local isFriend = friendReputationInfo.isFriend

    if (REP_ProfileKey) then
      if REP_Data[REP_ProfileKey].InactiveFactions == nil then REP_Data[REP_ProfileKey].InactiveFactions = {} end
    end

    if (not REP_ProfileKey or not REP_Data[REP_ProfileKey].InactiveFactions[factionID]) then
      if (REP.AfterWoD) then
        if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
          local currentValue, threshold, _, _ = C_Reputation.GetFactionParagonInfo(factionID)
          barMax, barValue, standingID = threshold, mod(currentValue, threshold), 9
        end

        -- if isFriend then -- Fix reputations with only 6 reputation levels
        --   if (standingID == 6) and (not C_Reputation.IsFactionParagon(factionID)) then
        --     standingID = standingID + 2
        --   else
        --     standingID = standingID + 3
        --   end
        -- end
      end

      if (not isHeader or hasRep) then
        if not standings[standingID] then
          standings[standingID] = {}
        end

        local size = REP:TableSize(standings[standingID])
        local entry = {}
        local inserted = false
        entry.missing = barMax - barValue
        entry.i = i

        if (size) then
          for j = 1, size do
            if (not inserted) then
              if (standings[standingID][j].missing > entry.missing) then
                table.insert(standings[standingID], j, entry)
                inserted = true
              end
            end
          end

          if (not inserted) then
            table.insert(standings[standingID], entry)
          end
        else
          table.insert(standings[standingID], entry)
        end
      end
    end
  end

  -- find Number of elements to display
  local numFactions = 0
  REP_Entries = {}

  if (not REP_Collapsed) then
    REP_Collapsed = {}
  end

  for i = 9, 1, -1 do
    if REP:TableSize(standings[i]) then
      if (standings[i]) then
        numFactions = numFactions + 1 -- count standing as header
        REP_Entries[numFactions] = {}
        REP_Entries[numFactions].header = true
        REP_Entries[numFactions].i = i	-- this is the standingID
        REP_Entries[numFactions].size = REP:TableSize(standings[i]) -- this is the number of factions with this standing

        if (not REP_Collapsed[i]) then
          for j in pairs(standings[i]) do
            numFactions = numFactions + 1 -- count each faction in the current standing
            REP_Entries[numFactions] = {}
            REP_Entries[numFactions].header = false
            REP_Entries[numFactions].i = standings[i][j].i -- this is the index into the faction table
            REP_Entries[numFactions].size = 0
          end
        end
      end
    end
  end

  REP_OBS_numFactions = numFactions
end

function REP_ReputationDetailFrame_IsShown(faction, flag, flag2, i)
  local name, description, atWarWith, canToggleAtWar, isWatched

  if REP.AfterDragonflight then
    local reputationInfo = C_Reputation.GetFactionDataByIndex(faction)
    name = reputationInfo.name
    description = reputationInfo.description
    atWarWith = reputationInfo.atWarWith
    canToggleAtWar = reputationInfo.canToggleAtWar
    isWatched = reputationInfo.isWatched
  else
    name, description, _, _, _, _, atWarWith, canToggleAtWar, _, _, _, isWatched, _, _, _, _ = GetFactionInfo(faction)
  end

  ReputationDetailFactionName:SetText(name)
  ReputationDetailFactionDescription:SetText(description)

  if (atWarWith) then
    ReputationDetailAtWarCheckBox:SetChecked(true)
  else
    ReputationDetailAtWarCheckBox:SetChecked(false)
  end

  if flag then
    ReputationDetailAtWarCheckBox:Enable()
    ReputationDetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
  else
    ReputationDetailAtWarCheckBox:Disable()
    ReputationDetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
  end

  if flag2 == 2 then
    if (not isHeader) then
      ReputationDetailInactiveCheckBox:Enable()
      ReputationDetailInactiveCheckBoxText:SetTextColor(ReputationDetailInactiveCheckBoxText:GetFontObject():GetTextColor())
    else
      ReputationDetailInactiveCheckBox:Disable()
      ReputationDetailInactiveCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
    end

    if not REP.AfterShadowLands then
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
    end
  end

  if (IsFactionInactive(faction)) then
    ReputationDetailInactiveCheckBox:SetChecked(true)
  else
    ReputationDetailInactiveCheckBox:SetChecked(false)
  end

  if (isWatched) then
    ReputationDetailMainScreenCheckBox:SetChecked(true)
  else
    ReputationDetailMainScreenCheckBox:SetChecked(false)
  end
end

-----------------------------------
--      Format name / string     --
-----------------------------------
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

function REP_GetReputationGains(factionID, factionIndex)
  if not factionID and not factionIndex then return end
  if factionID and type(factionID) ~= 'number' then return end
  if factionIndex and type(factionIndex) ~= 'number' then return end

  local name, isMajorFaction, isFriend, isCappedFriendship
  local reputationGainsInfo = {}

  local reputationGainedSession, reputationGainedTotal = 0, 0 -- Calculated values
  local reputationCurrent, reputationNeededCurrent, reputationMissingCurrent, reputationNeededToMax = 0, 0, 0, 0 -- Values for detail frame

  if REP.AfterShadowLands then
    isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)
  end

  if REP.AfterCata then
    local friendReputationInfo = REP_Friend_Detail(factionID)
    isFriend = friendReputationInfo.isFriend
    isCappedFriendship = friendReputationInfo.isCappedFriendship
  end

  if isFriend then
    if not isCappedFriendship then
      local friendRep, friendMaxRep, friendThreshold, nextFriendThreshold

      if not REP.AfterShadowLands then
        -- friendID, friendRep, friendMaxRep, friendName, friendText, _, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
        _, friendRep, friendMaxRep, _, friendName, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = C_GossipInfo.GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          friendRep = friendshipInfo.standing
          friendMaxRep = friendshipInfo.maxRep
          nextFriendThreshold = friendshipInfo.nextThreshold
          friendThreshold = friendshipInfo.reactionThreshold
          friendName = friendshipInfo.name
        end
      end

      name = friendName
      reputationGainedTotal = friendRep
      reputationCurrent = friendRep - friendThreshold
      reputationNeededCurrent = nextFriendThreshold - friendThreshold
      reputationMissingCurrent = nextFriendThreshold - friendRep
      reputationNeededToMax = REP_GetFriendFactionRemaining(factionID)
    end
  elseif isMajorFaction then
    local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
    name = majorFactionData.name
    isCapped = C_MajorFactions.HasMaximumRenown(factionID)

    if isCapped then
      local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID) -- TODO CHECK The War Within
      reputationCurrent = currentValue
      reputationGainedTotal = (majorFactionData.renownLevelThreshold * majorFactionData.renownLevel) + currentValue
      reputationNeededCurrent = threshold
      reputationMissingCurrent = threshold - currentValue
      reputationNeededToMax = threshold
    else
      reputationCurrent = majorFactionData.renownReputationEarned
      reputationGainedTotal = (majorFactionData.renownLevelThreshold * (majorFactionData.renownLevel - 1)) + majorFactionData.renownReputationEarned
      reputationNeededCurrent = majorFactionData.renownLevelThreshold
      reputationMissingCurrent = majorFactionData.renownLevelThreshold - majorFactionData.renownReputationEarned
      
      local maxRenownLevel = REP.MaxRenownLevel[factionID]
      local maxRenown = maxRenownLevel * majorFactionData.renownLevelThreshold
      reputationNeededToMax = maxRenown - reputationGainedTotal
    end
  else
    local isParagon = false
    if REP.AfterMoP then
      if (factionID and C_Reputation.IsFactionParagon(factionID)) then
        isParagon = true
      end
    end

    if REP.AfterDragonflight then
      local reputationInfo = {}
      if factionIndex then
        reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
      else
        reputationInfo = C_Reputation.GetFactionDataByID(factionID)
      end

      if reputationInfo then
        name = reputationInfo.name
        reputationCurrent = reputationInfo.currentStanding - reputationInfo.currentReactionThreshold
        reputationGainedTotal = reputationInfo.currentStanding
        reputationNeededCurrent = reputationInfo.nextReactionThreshold
        reputationMissingCurrent = reputationNeededCurrent - reputationCurrent
        standingID = reputationInfo.reaction
        barMin = reputationInfo.currentReactionThreshold
        barValue = reputationInfo.currentStanding

        if standingID == 4 then
          barMax = reputationInfo.nextReactionThreshold
        elseif standingID > 4 then
          barMax = reputationInfo.nextReactionThreshold - reputationInfo.currentReactionThreshold
        else
          barMax = reputationInfo.currentReactionThreshold - reputationInfo.nextReactionThreshold
        end

        barValue = barValue - barMin

        if standingID < 4 then
          if barMin < 0 then barMin = barMin * -1 end
          if barValue < 0 then barValue = barValue * -1 end
          if barMax < 0 then barMax = barMax * -1 end
        end

        if isParagon then
          local currentValue, threshold, _, _ = C_Reputation.GetFactionParagonInfo(factionID)
          reputationNeededCurrent = threshold
          reputationMissingCurrent = threshold - currentValue
          reputationNeededToMax = threshold
          reputationCurrent = currentValue
          reputationGainedTotal = currentValue
        else
          reputationNeededCurrent = barMax
          reputationMissingCurrent = barMax - barValue
          reputationCurrent = barValue
          reputationGainedTotal = barValue
          reputationNeededToMax = REP.ToExalted[standingID] + barMax - barValue
        end
      end
    else
      local barValue, barMin

      if factionIndex then
        name, _, standingID, barMin, barMax, barValue, _, _, _, _, _, _, _, _, _ = GetFactionInfo(factionIndex)

        barMax = barMax - barMin
        barValue = barValue - barMin

        if standingID < 4 then
          if barMin < 0 then barMin = barMin * -1 end
          if barValue < 0 then barValue = barValue * -1 end
          if barMax < 0 then barMax = barMax * -1 end
        end

        if isParagon then
          local currentValue, threshold, _, _ = C_Reputation.GetFactionParagonInfo(factionID)
          reputationNeededCurrent = threshold
          reputationMissingCurrent = threshold - currentValue
          reputationNeededToMax = threshold
          reputationCurrent = currentValue
          reputationGainedTotal = currentValue
        else
          reputationNeededCurrent = barMax
          reputationCurrent = barValue
          reputationGainedTotal = barValue
          reputationMissingCurrent = barMax - barValue
          reputationNeededToMax = REP.ToExalted[standingID] + barMax - barValue
        end
      else

      end
    end
  end
  
  if name then
    if (REP_StoredRep and REP_StoredRep[name] and REP_StoredRep[name].origRep and REP_StoredRep[name].rep) then
      reputationGainedTotal = REP_StoredRep[name].rep or 0
      local currentStoredOrigRep = REP_StoredRep[name].origRep or 0
      reputationGainedSession = reputationGainedTotal - currentStoredOrigRep
    end
  end

  reputationGainsInfo.factionName = name
  reputationGainsInfo.reputationGainedSession = reputationGainedSession
  reputationGainsInfo.reputationGainedTotal = reputationGainedTotal
  reputationGainsInfo.reputationCurrent = reputationCurrent
  reputationGainsInfo.reputationNeededCurrent = reputationNeededCurrent
  reputationGainsInfo.reputationMissingCurrent = reputationMissingCurrent
  reputationGainsInfo.reputationNeededToMax = reputationNeededToMax

  return reputationGainsInfo
end

function REP:Rep_Detail_Frame()
  local factionIndex
  if REP.AfterDragonflight then
    factionIndex = C_Reputation.GetSelectedFaction()
  else
    factionIndex = GetSelectedFaction()
  end
  if not factionIndex or factionIndex == 0 then return end

  REP_ReputationDetailFrame:Show()

  if REP.AfterDragonflight then
    ReputationFrame.ReputationDetailFrame:Hide()
  else
    ReputationDetailFrame:Hide()
  end

  if REP.AfterDragonflight then
    REP_ReputationDetailMainScreenCheckBox.factionIndex = factionIndex
    REP_ReputationDetailInactiveCheckBox.factionIndex = factionIndex
    REP_ReputationDetailAtWarCheckBox.factionIndex = factionIndex
  end

  -----------------------------------
  --  Default detail frame settings
  -----------------------------------
  REP_ReputationDetailStandingCurrent:SetText(REP_TXT.currentRep)
  REP_ReputationDetailStandingNeeded:SetText(REP_TXT.neededRep)
  REP_ReputationDetailStandingMissing:SetText(REP_TXT.missingRep)
  REP_ReputationDetailStandingBag:SetText(REP_TXT.repInBag)
  REP_ReputationDetailStandingBagBank:SetText(REP_TXT.repInBagBank)
  REP_ReputationDetailStandingQuests:SetText(REP_TXT.repInQuest)
  REP_ReputationDetailStandingGained:SetText(REP_TXT.factionGained)

  REP_ShowNonPvPQuestsButtonText:SetText(REP_TXT.showQuests)
  REP_ShowPvPQuestsButtonText:SetText(REP_TXT.showPvPQuests)
  REP_ShowItemsButtonText:SetText(REP_TXT.showItems)
  REP_ShowMobsButtonText:SetText(REP_TXT.showMobs)
  REP_ShowInstancesButtonText:SetText(REP_TXT.showInstances)
  REP_ShowGeneralButtonText:SetText(REP_TXT.showGeneral)

  REP_ShowAllButton:SetText(REP_TXT.showAll)
  REP_ShowNoneButton:SetText(REP_TXT.showNone)
  REP_ExpandButton:SetText(REP_TXT.expand)
  REP_CollapseButton:SetText(REP_TXT.collapse)

  REP_SupressNoneFactionButton:SetText(REP_TXT.supressNoneFaction)
  REP_SupressNoneGlobalButton:SetText(REP_TXT.supressNoneGlobal)
  REP_ReputationDetailSuppressHint:SetText(REP_TXT.suppressHint)
  REP_ClearSessionGainButton:SetText(REP_TXT.clearSessionGain)

  REP_ShowNonPvPQuestsButton:SetChecked(REP_Data.Global.ShowQuests)
  REP_ShowPvPQuestsButton:SetChecked(REP_Data.Global.ShowPvPQuests)
  REP_ShowItemsButton:SetChecked(REP_Data.Global.ShowItems)
  REP_ShowMobsButton:SetChecked(REP_Data.Global.ShowMobs)
  REP_ShowInstancesButton:SetChecked(REP_Data.Global.ShowInstances)
  REP_ShowGeneralButton:SetChecked(REP_Data.Global.ShowGeneral)

  --------------------------------------------
  --  Faction specific detail frame settings
  --------------------------------------------
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, isMajorFaction, isFriend

  if REP.AfterDragonflight then
    local reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
    name = reputationInfo.name
    description = reputationInfo.description
    factionID = reputationInfo.factionID
    atWarWith = reputationInfo.atWarWith
    canToggleAtWar = reputationInfo.canToggleAtWar
    isHeader = reputationInfo.isHeader
    isCollapsed = reputationInfo.isCollapsed
    hasRep = reputationInfo.isHeaderWithRep
    isWatched = reputationInfo.isWatched
    isChild = reputationInfo.isChild
    hasBonusRepGain = reputationInfo.hasBonusRepGain
    isAccountWide = reputationInfo.isAccountWide

    isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)

    if isMajorFaction then
      local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
      barMin = 0
      barMax = majorFactionData.renownLevelThreshold
      barValue = majorFactionData.renownReputationEarned
      standingID = majorFactionData.renownLevel

      REP_ReputationDetailViewRenownButton.factionID = factionID
    else
      standingID = reputationInfo.reaction
      barMin = reputationInfo.currentReactionThreshold
      barValue = reputationInfo.currentStanding

      if standingID == 4 then
        barMax = reputationInfo.nextReactionThreshold
      elseif standingID > 4 then
        barMax = reputationInfo.nextReactionThreshold - reputationInfo.currentReactionThreshold
      else
        barMax = reputationInfo.currentReactionThreshold - reputationInfo.nextReactionThreshold
      end
    end
  else
    name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(factionIndex)

    if REP.AfterShadowLands then
      isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)

      if isMajorFaction then
        local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)
        barMin = 0
        barMax = majorFactionData.renownLevelThreshold
        barValue = majorFactionData.renownReputationEarned
        standingID = majorFactionData.renownLevel
      end
    end

    if standingID < 4 then barMax = barMax - barMin end
    if not isMajorFaction then
      if standingID < 4 or (isFriend and standingID < 4) then
        if barMin < 0 then barMin = barMin * -1 end
        if barValue < 0 then barValue = barValue * -1 end
        if barMax < 0 then barMax = barMax * -1 end
      end
    end
  end

  if REP.AfterCata then
    local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
    isFriend = friendReputationInfo.isFriend
  end

  --------------------------------------------
  --  Faction name
  --------------------------------------------
  local formattedName = REP:FormatLongName(name)
  if string.len(formattedName) > 25 and string.find(formattedName, "-") then
    REP_ReputationDetailFactionName:SetSize(0, 24)
  else
    REP_ReputationDetailFactionName:SetSize(0, 12)
  end
  REP_ReputationDetailFactionName:SetText(formattedName)

  if factionID == 1168 then
    name = name.." (guild)"
  end

  --------------------------------------------
  --  Faction descroption
  --------------------------------------------
  if description == nil or description == '' then
    if (name == "Alliance") then
      description = "In a time when chaos and uncertainty reign, the Alliance remains steadfast in its determination to bring light to the darkest corners of the world."
    elseif (name == "Horde") then
      description = "In the Horde, action and strength are valued above diplomacy, and its leaders earn respect by the blade, wasting no time with politics. The brutality of the Horde's champions is focused, giving a voice to those who fight for survival."
    end
  end
  REP_ReputationDetailFactionDescription:SetText(description)

  --------------------------------------------
  --  Renown button + detail frame height
  --------------------------------------------
  if isMajorFaction then
    REP_ReputationDetailFrame:SetHeight(565)
    REP_ReputationDetailAtWarCheckBox:SetPoint("TOPLEFT", REP_ReputationDetailDivider, "BOTTOMLEFT", 10, 40)
    REP_ReputationDetailDivider:SetHeight(75)

    if REP.AfterShadowLands then
      REP_ReputationDetailViewRenownButton:Show()
    end
  else
    REP_ReputationDetailFrame:SetHeight(520)
    REP_ReputationDetailAtWarCheckBox:SetPoint("TOPLEFT", REP_ReputationDetailDivider, "BOTTOMLEFT", 10, 20)
    REP_ReputationDetailDivider:SetHeight(32)

    if REP.AfterShadowLands then
      REP_ReputationDetailViewRenownButton:Hide()
    end
  end

  ---------------------------------------------------
  --  CurrentStanding Name + color
  ---------------------------------------------------
  local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
  local factionStandingtext = friendReputationInfo.factionStandingtext
  local isCappedFriendship = friendReputationInfo.isCappedFriendship
  local color

  local isParagon = false
  if REP.AfterMoP then
    if (factionID and C_Reputation.IsFactionParagon(factionID)) then
      isParagon = true
    end
  end

  if isParagon then
    colorID = 9
    color = REP.FACTION_BAR_COLORS[colorID]
    REP_ReputationDetailStandingName:SetText(REP_TXT.STAND_LV[9])
  else
    if isMajorFaction then
      color = BLUE_FONT_COLOR
      factionStandingtext = RENOWN_LEVEL_LABEL .. standingID
    else      
      if isFriend then
        colorID = 5
      else
        colorID = standingID
      end  
      color = REP.FACTION_BAR_COLORS[colorID]
    end

    REP_ReputationDetailStandingName:SetText(factionStandingtext)
  end
  REP_ReputationDetailStandingName:SetTextColor(color.r, color.g, color.b)

  -----------------------------------------------------------------
  --  Reputation needed/missing for next rank + current reputation
  --  NextStanding Name + color + reputation till exalted/max
  -----------------------------------------------------------------
  local reputationGains = REP_GetReputationGains(factionID, factionIndex)
  local toExalted, toBFF = 0, 0

  REP_ReputationDetailStandingNeededValue:SetText(reputationGains.reputationNeededCurrent)
  REP_ReputationDetailStandingCurrentValue:SetText(reputationGains.reputationCurrent)
  REP_ReputationDetailStandingMissingValue:SetText(reputationGains.reputationMissingCurrent)
  REP_ReputationDetailStandingToExaltedValue:SetText(reputationGains.reputationNeededToMax)

  if isFriend then
    if isCappedFriendship then
      REP_ReputationDetailStandingNextValue:SetText("")
      REP_ReputationDetailStandingToExaltedHeader:SetText("")
      REP_ReputationDetailStandingToExaltedValue:SetText("")
    else
      local friendRep, friendMaxRep, friendThreshold, nextFriendThreshold

      if not REP.AfterShadowLands then
        _, friendRep, friendMaxRep, _, _, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = C_GossipInfo.GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          nextFriendThreshold = friendshipInfo.nextThreshold
        end
      end

      color = REP.FACTION_BAR_COLORS[8]
      REP_ReputationDetailStandingNextValue:SetText("(--> "..REP_GetFriendFactionStandingLabel(factionID, nextFriendThreshold)..")")
      REP_ReputationDetailStandingToExaltedHeader:SetText("Reputation to max") -- TODO: Add to localization file sometime
    end
  elseif isMajorFaction then
    local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID);
    local renownLevel = majorFactionData.renownLevel
    barMax = majorFactionData.renownLevelThreshold
    barValue = ((renownLevel - 1) *  majorFactionData.renownLevelThreshold) + barValue
    isCapped = C_MajorFactions.HasMaximumRenown(factionID)

    local maxRenownLevel = REP.MaxRenownLevel[factionID]
    local maxRenown = maxRenownLevel * barMax
    toExalted = maxRenown - reputationGains.reputationGainedTotal

    if isCapped then
      local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
      barMax = threshold
      toExalted = threshold

      REP_ReputationDetailStandingNextValue:SetText("")
    else
      REP_ReputationDetailStandingNextValue:SetText("(--> "..RENOWN_LEVEL_LABEL..(majorFactionData.renownLevel + 1)..")")
    end
    
    REP_ReputationDetailStandingToExaltedHeader:SetText(RENOWN_LEVEL_LABEL.."to max")
  else
    if (standingID >= 7) then
      REP_ReputationDetailStandingToExaltedHeader:SetText("")
      REP_ReputationDetailStandingToExaltedValue:SetText("")
    end

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
      color = REP.FACTION_BAR_COLORS[standingID + 1]
      REP_ReputationDetailStandingNextValue:SetText("(--> "..GetText("FACTION_STANDING_LABEL"..standingID + 1, gender)..")")

      if (standingID < 7) then
        REP_ReputationDetailStandingToExaltedHeader:SetText(REP_TXT.toExalted)
      end
    else
      REP_ReputationDetailStandingNextValue:SetText("")
    end
  end

  REP_ReputationDetailStandingNextValue:SetTextColor(color.r, color.g, color.b)

  ------------------------------------
  --  Reputation gained this session 
  ------------------------------------
  REP_ReputationDetailStandingGainedValue:SetText(reputationGains.reputationGainedSession)

  ------------------------------
  --  Reputation in bags/bank
  ------------------------------
  if not REP_CurrentRepInBag then REP_CurrentRepInBag = 0 end
  if not REP_CurrentRepInBagBank then REP_CurrentRepInBagBank = 0 end
  if not REP_CurrentRepInQuest then REP_CurrentRepInQuest = 0 end

  REP_ReputationDetailStandingBagValue:SetText(REP_CurrentRepInBag)
  REP_ReputationDetailStandingBagBankValue:SetText(REP_CurrentRepInBagBank)
  REP_ReputationDetailStandingQuestsValue:SetText(REP_CurrentRepInQuest)

  ------------------------------
  --  Detail Frame Checkboxes
  ------------------------------
  if (atWarWith) then
    REP_ReputationDetailAtWarCheckBox:SetChecked(true)
  else
    REP_ReputationDetailAtWarCheckBox:SetChecked(false)
  end

  if (canToggleAtWar) then
    REP_ReputationDetailAtWarCheckBox:Enable()
    REP_ReputationDetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
  else
    REP_ReputationDetailAtWarCheckBox:Disable()
    REP_ReputationDetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
  end

  if REP.AfterDragonflight then
    if (C_Reputation.IsFactionActive(factionIndex)) then
      REP_ReputationDetailInactiveCheckBox:SetChecked(false)
    else
      REP_ReputationDetailInactiveCheckBox:SetChecked(true)
    end
  else
    if (IsFactionInactive(factionIndex)) then
      REP_ReputationDetailInactiveCheckBox:SetChecked(true)
    else
      REP_ReputationDetailInactiveCheckBox:SetChecked(false)
    end
  end

  if (isWatched) then
    REP_ReputationDetailMainScreenCheckBox:SetChecked(true)
  else
    REP_ReputationDetailMainScreenCheckBox:SetChecked(false)
  end

  if (REP_ReputationDetailFrame:IsVisible()) then
    REP_BuildUpdateList(factionIndex)
    -- REP_UpdateList_Update()
  end
end

function REP_Friend_Detail(factionID, standingID, factionRow)
  local colorIndex, factionStandingtext, isCappedFriendship, isFriend, friendID
  local friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold

  if REP.AfterCata then
    if (factionID) then
      if not REP.AfterShadowLands then
        friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = C_GossipInfo.GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          friendID = friendshipInfo.friendshipFactionID
          friendRep = friendshipInfo.standing
          friendMaxRep = friendshipInfo.maxRep
          friendName = friendshipInfo.name
          friendText = friendshipInfo.text
          friendTexture = friendshipInfo.texture
          friendTextLevel = friendshipInfo.reaction
          friendThreshold = friendshipInfo.reactionThreshold
          nextFriendThreshold = friendshipInfo.nextThreshold
        end
      end
    end
  end

  if (friendID ~= nil) then
    if (nextFriendThreshold) then
      barMin, barMax, barValue = friendThreshold, nextFriendThreshold, friendRep
    else	-- max rank, make it look like a full bar
      barMin, barMax, barValue = 0, 1, 1
      isCappedFriendship = true
    end

    colorIndex = 5	-- always color friendships green
    factionStandingtext = friendTextLevel
    isFriend = true

    if not REP.AfterDragonflight then
      if factionRow then factionRow.friendshipID = friendID end
    end
  else
    isFriend = false

    if standingID then
      factionStandingtext = GetText("FACTION_STANDING_LABEL"..standingID)
      colorIndex = standingID
    end

    if not REP.AfterDragonflight then
      if factionRow then factionRow.friendshipID = nil end
    end
  end

  local friendReputationInfo = {}
  friendReputationInfo.colorIndex = colorIndex or nil
  friendReputationInfo.isCappedFriendship = isCappedFriendship or nil
  friendReputationInfo.factionStandingtext = factionStandingtext or nil
  friendReputationInfo.isFriend = isFriend or nil

  return friendReputationInfo
end

-----------------------------------
-- _16_ Listing by standing
-----------------------------------
function REP:ListByStanding(standing)
  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, hasRep, isCollapsed, isWatched
  local list = {}

  -- get factions by standing
  for i = 1, numFactions do
    name, description, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep = GetFactionInfo(i)
    if (not isHeader or hasRep) then
      if ((standing == nil) or (standing == standingID)) then
        if (not list[standingID]) then
          list[standingID] = {}
        end

        list[standingID][name] = {}
        list[standingID][name].max = barMax - barMin
        list[standingID][name].value = barValue - barMin
      end
    end
  end

  -- output
  for i = 1, 8 do
    if (list[i]) then
      REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP:RGBToColour_perc(1, REP.FACTION_BAR_COLORS[i].r, REP.FACTION_BAR_COLORS[i].g, REP.FACTION_BAR_COLORS[i].b).."--- "..REP_TXT.STAND_LV[i].." ("..i..") ---|r")

      for p in pairs(list[i]) do
        REP:Print("    "..p..": "..REP_TXT.missing2..": "..list[i][p].max - list[i][p].value)
      end

      if (not standing) then
        REP:Print(" ")
      end
    end
  end
end

------------------------
-- _17_ extracting Skill information
------------------------
function REP:ExtractSkills()
  if (REP.AfterCata) then
    local professions = {}
    local name, skillLine
    local prof1, prof2, archaeology, fishing, cooking, firstaid = GetProfessions()

    if (prof1) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(prof1)
      if name then professions[1] = name end
    end

    if (prof2) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(prof2)
      if name then professions[2] = name end
    end

    if (archaeology) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(archaeology)
      if name then professions[3] = name end
    end

    if (fishing) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(fishing)
      if name then professions[4] = name end
    end

    if (cooking) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(cooking)
      if name then professions[5] = name end
    end

    if (firstaid) then
      name, _, _, _, _, _, skillLine = GetProfessionInfo(firstaid)
      if name then professions[6] = name end
    end

    for skillIndex in pairs(professions) do
      skillName = professions[skillIndex]
      if (skillName == REP_TXT.skillHerb) then
        REP.Herb = true
      elseif (skillName == REP_TXT.skillSkin) then
        REP.Skin = true
      elseif (skillName == REP_TXT.skillMine) then
        REP.Mine = true
      elseif (skillName == REP_TXT.skillAlch) then
        REP.Alche = true
      elseif (skillName == REP_TXT.skillBlack) then
        REP.Black = true
      elseif (skillName == REP_TXT.skillEnch) then
        REP.Enchan = true
      elseif (skillName == REP_TXT.skillEngi) then
        REP.Engin = true
      elseif (skillName == REP_TXT.skillIncrip) then
        REP.Incrip = true
      elseif (skillName == REP_TXT.skillJewel) then
        REP.Jewel = true
      elseif (skillName == REP_TXT.skillLeath) then
        REP.Leath = true
      elseif (skillName == REP_TXT.skillTail) then
        REP.Tailor = true
      elseif (skillName == REP_TXT.skillAid) then
        REP.Aid = true
      elseif (skillName == REP_TXT.skillArch) then
        REP.Arch = true
      elseif (skillName == REP_TXT.skillCook) then
        REP.Cook = true
      elseif (skillName == REP_TXT.skillFish) then
        REP.Fish = true
      end
    end
  else
    for i = 1, GetNumSkillLines() do
      local skillName = GetSkillLineInfo(i)

      if (skillName == REP_TXT.skillAlch) then
        REP.Alche = true
      end

      if (skillName == REP_TXT.skillBlack) then
        REP.Black = true
      end

      if (skillName == REP_TXT.skillEnch) then
        REP.Enchan = true
      end

      if (skillName == REP_TXT.skillEngi) then
        REP.Engin = true
      end

      if (skillName == REP_TXT.skillHerb) then
        REP.Herb = true
      end

      if (skillName == REP_TXT.skillLeath) then
        REP.Leath = true
      end

      if (skillName == REP_TXT.skillMine) then
        REP.Mine = true
      end

      if (skillName == REP_TXT.skillSkin) then
        REP.Skin = true
      end

      if (skillName == REP_TXT.skillTail) then
        REP.Tailor = true
      end

      if (skillName == REP_TXT.skillCook) then
        REP.Cook = true
      end

      if (skillName == REP_TXT.skillAid) then
        REP.Aid = true
      end

      if (skillName == REP_TXT.skillFish) then
        REP.Fish = true
      end
    end
  end
end

--------------------------
-- _18_ classic options
--------------------------
function REP_OnShowOptionFrame()
  if not REP.AfterShadowLands then
    REP_OrderByStandingCheckBox:SetChecked(REP_Data.Global.SortByStanding)
  end
end

--------------------------
-- _19_ interface options
--------------------------
function REP_OnLoadOptions(panel)
  panel.name = addonName
  panel.okay = REP_OptionsOk
  panel.cancel = REP_OptionsCancel
  panel.default = REP_OptionsDefault

  if REP.AfterDragonflight then
    Settings.OpenToCategory(REP.settingsCategory.ID)
  else
    InterfaceOptionsFrame_OpenToCategory(panel)
  end

  -- Settings.OpenToCategory(panel)
  -- InterfaceOptions_AddCategory(panel)

  REP_OptionEnableMissingCBText:SetText(REP_TXT.showMissing)
  REP_OptionExtendDetailsCBText:SetText(REP_TXT.extendDetails)
  REP_OptionGainToChatCBText:SetText(REP_TXT.gainToChat)
  REP_OptionShowPreviewRepCBText:SetText(REP_TXT.showPreviewRep)
  REP_OptionSwitchFactionBarCBText:SetText(REP_TXT.switchFactionBar)
  REP_OptionSilentSwitchCBText:SetText(REP_TXT.silentSwitch)

  if REP.AfterWotlk then
    REP_OptionNoGuildSwitchCBText:SetText(REP_TXT.noGuildSwitch)
    REP_OptionNoGuildGainCBText:SetText(REP_TXT.noGuildGain)
  end

  if REP.AfterWoD then
    REP_OptionEnableParagonBarCBText:SetText(REP_TXT.EnableParagonBar)
  end
end

------------------------------------------------------------
function REP_OnShowOptions(self)
  if (REP_Data and REP_VarsLoaded) then
    REP_OptionsShown = true
    REP_OptionEnableMissingCB:SetChecked(REP_Data.Global.ShowMissing)
    REP_OptionExtendDetailsCB:SetChecked(REP_Data.Global.ExtendDetails)
    REP_OptionGainToChatCB:SetChecked(REP_Data.Global.WriteChatMessage)
    REP_OptionShowPreviewRepCB:SetChecked(REP_Data.Global.ShowPreviewRep)
    REP_OptionSwitchFactionBarCB:SetChecked(REP_Data.Global.SwitchFactionBar)
    REP_OptionSilentSwitchCB:SetChecked(REP_Data.Global.SilentSwitch)

    if REP.AfterWotlk then
      REP_OptionNoGuildGainCB:SetChecked(REP_Data.Global.NoGuildGain)
      REP_OptionNoGuildSwitchCB:SetChecked(REP_Data.Global.NoGuildSwitch)
    end
  
    if REP.AfterWoD then
      REP_OptionEnableParagonBarCB:SetChecked(REP_Data.Global.ShowParagonBar)
    end
  end
end

------------------------------------------------------------
function REP_OptionsOk()
  if (REP_OptionsShown) then
    REP_Data.Global.ShowMissing = REP_OptionEnableMissingCB:GetChecked()
    REP_Data.Global.ExtendDetails = REP_OptionExtendDetailsCB:GetChecked()
    REP_Data.Global.WriteChatMessage = REP_OptionGainToChatCB:GetChecked()
    REP_Data.Global.ShowPreviewRep = REP_OptionShowPreviewRepCB:GetChecked()
    REP_Data.Global.SwitchFactionBar = REP_OptionSwitchFactionBarCB:GetChecked()
    REP_Data.Global.SilentSwitch = REP_OptionSilentSwitchCB:GetChecked()

    if REP.AfterWotlk then
      REP_Data.Global.NoGuildGain = REP_OptionNoGuildGainCB:GetChecked()
      REP_Data.Global.NoGuildSwitch = REP_OptionNoGuildSwitchCB:GetChecked()
    end
  
    if REP.AfterWoD then
      REP_Data.Global.ShowParagonBar = REP_OptionEnableParagonBarCB:GetChecked()
    end

    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  end

  REP_OptionsShown = nil
end

------------------------------------------------------------
function REP_OptionsCancel()
  -- nothing to do
  REP_OptionsShown = nil
end

------------------------------------------------------------
function REP_OptionsDefault()
  -- nothing to do
end

function REP_GetFriendFactionRemaining(factionID)
  local friendRep, friendMaxRep
  local bodyguards = {1738, 1740, 1733, 1741, 1737, 1736, 1739}

  if (REP.AfterCata and factionID) then
    if not REP.AfterShadowLands then
      _, friendRep, friendMaxRep, _, _, _, _, _, _ = GetFriendshipReputation(factionID)
    else
      local friendshipInfo = C_GossipInfo.GetFriendshipReputation(factionID)
      if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
        friendRep = friendshipInfo.standing
        friendMaxRep = friendshipInfo.maxRep
      end
    end
  end

  -- WoD bodyguards are capped at 20k reputation but GetFriendshipReputation still returns 42k reputation as maximum so we need to check for that and set max to 20k
  if tContains(bodyguards, factionID) then
    friendMaxRep = 20000
  end

  return friendMaxRep - friendRep
end

function REP_GetFriendFactionStandingLabel(factionID, nextFriendThreshold)
  local REP_BFFLabels = REP.BFFLabels

  if REP_BFFLabels[factionID] ~= nil then
    return REP_BFFLabels[factionID][nextFriendThreshold]
  else
    if REP_BFFLabels[0][nextFriendThreshold] ~= nil then
      return REP_BFFLabels[0][nextFriendThreshold]
    else
      return ""
    end
  end
end

----------------------------------------------
-- SetFactionInactive
----------------------------------------------
function REP_CustomSetFactionInactive(factionIndex)
  local name, _, _, _, _, _, _, _, isHeader, _, _, _, _, factionID = GetFactionInfo(factionIndex)

  if (name) then
    if REP_Data[REP_ProfileKey].InactiveFactions == nil then REP_Data[REP_ProfileKey].InactiveFactions = {} end
    REP_Data[REP_ProfileKey].InactiveFactions[factionID] = true

    SetFactionInactive(factionIndex)
    if REP.AfterShadowLands then
      if not REP.AfterDragonflight then
        ReputationFrame_Update()
      end
    else
      REP_ReputationFrame_Update()
    end
  else
    SetFactionInactive(factionIndex)
  end
end

----------------------------------------------
-- SetFactionActive
----------------------------------------------
function REP_CustomSetFactionActive(factionIndex)
  local name, _, _, _, _, _, _, _, isHeader, _, _, _, _, factionID = GetFactionInfo(factionIndex)

  if (name) then
    if REP_Data[REP_ProfileKey].InactiveFactions == nil then REP_Data[REP_ProfileKey].InactiveFactions = {} end
    REP_Data[REP_ProfileKey].InactiveFactions[factionID] = nil

    SetFactionActive(factionIndex)
    if REP.AfterShadowLands then
      if not REP.AfterDragonflight then
        ReputationFrame_Update()
      end
    else
      REP_ReputationFrame_Update()
    end
  else
    SetFactionActive(factionIndex)
  end
end

--------------------------
-- _20_ rep Main window
--------------------------
function REP:SortByStandingWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
  local OBS_fi = REP_Entries[factionIndex]
  local OBS_fi_i = OBS_fi.i

  if (OBS_fi.header) then
    REP_ReputationFrame_SetRowType(factionRow, isChild, OBS_fi.header, hasRep)

    -- display the standingID as Header
    if (OBS_fi_i == 9) then
      factionTitle:SetText("Paragon".." ("..tostring(OBS_fi.size)..")")
    elseif (OBS_fi_i == 8) then
      factionTitle:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." ("..tostring(OBS_fi.size)..")")
    else
      factionTitle:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." -> "..GetText("FACTION_STANDING_LABEL"..OBS_fi_i + 1, gender).." ("..tostring(OBS_fi.size)..")")
    end

    if (REP_Collapsed[OBS_fi_i]) then
      factionButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionRow.index = factionIndex
    factionRow.isCollapsed = REP_Collapsed[OBS_fi_i]
  else
    -- get the info for this Faction
    local isParagon
    local isCapped
    local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(OBS_fi_i)
    
    local friendReputationInfo = REP_Friend_Detail(factionID, standingID, factionRow)
    local colorIndex = friendReputationInfo.colorIndex
    local isCappedFriendship = friendReputationInfo.isCappedFriendship
    local factionStandingtext = friendReputationInfo.factionStandingtext
    local isFriend = friendReputationInfo.isFriend

    -- Normalize Values
    local origBarValue = barValue

    if (standingID == MAX_REPUTATION_REACTION) then
      isCapped = true
    end

    if(REP.AfterCata and (isCappedFriendship or standingID == 8)) then
      -- If exalted show a full green bar
      barMin, barMax, barValue = 0, 1, 1
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if REP.AfterWoD then
      if (factionID and C_Reputation.IsFactionParagon(factionID)) then
        isParagon = true
  
        local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()
        local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
  
        origBarValue = mod(currentValue, threshold)
        C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
  
        paragonFrame.factionID = factionID
        paragonFrame:SetPoint("RIGHT", factionRow, 11, 0)
        paragonFrame.Glow:SetShown(hasRewardPending)
        paragonFrame.Check:SetShown(hasRewardPending)
        paragonFrame:Show()
  
        colorIndex = 9
  
        -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
        if REP_Data.Global.ShowParagonBar then
          local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
          barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
        end
      end
    end

    if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
      factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, barValue, barMax)..FONT_COLOR_CODE_CLOSE
    elseif(isCapped or isCappedFriendship) then
      factionRow.rolloverText = nil
    elseif(REP_Data.Global.ShowMissing ~= true) then
      factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(tostring(REPUTATION_PROGRESS_FORMAT), barValue, barMax)..FONT_COLOR_CODE_CLOSE
    else
      factionRow.rolloverText = nil
    end

    local toExalted = 0
    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    local toBFF = 0
    if (isCappedFriendship ~= true and isFriend) then
      toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
    end

    factionRow.index = OBS_fi_i

    if (REP_Data.Global.ShowMissing) then
      if ((barMax - barValue) ~= 0 and factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
        factionRow.standingText = tostring(REP_TXT.STAND_LV[9]).." ("..barMax - barValue..")"
      elseif ((barMax - barValue) ~= 0) then
        if(factionStandingtext) then
          factionRow.standingText = factionStandingtext.." ("..barMax - barValue..")"
        else
          factionRow.standingText = "("..barMax - barValue..")"
        end
      else
        factionRow.standingText = factionStandingtext
      end
    else
      if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
        factionRow.standingText = tostring(REP_TXT.STAND_LV[9])
      else
        factionRow.standingText = factionStandingtext
      end
    end

    factionTitle:SetText(name)
    factionStanding:SetText(factionRow.standingText)

    if (isCappedFriendship) then
      factionRow.tooltip = nil
    else
      factionRow.tooltip = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    end

    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)

    local color
    if colorIndex then
      color = REP.FACTION_BAR_COLORS[colorIndex]
    else
      color = REP.FACTION_BAR_COLORS[standingID]
    end

    factionBar:SetStatusBarColor(color.r, color.g, color.b)

    if(REP.AfterCata) then
      factionBar.BonusIcon:SetShown(hasBonusRepGain)
    end

    local previewValue = 0
    if (REP_Data.Global.ShowPreviewRep) then
      previewValue = REP:GetReadyReputation(OBS_fi_i)
    end

    if ((previewValue > 0) and not ((standingID == 8) and (barMax - barValue == 1))) then
      factionBarPreview:Show()
      factionBarPreview:SetMinMaxValues(0, barMax)
      previewValue = previewValue + barValue

      if (previewValue > barMax) then previewValue = barMax end

      factionBarPreview:SetValue(previewValue)
      factionBarPreview:SetID(factionIndex)
      factionBarPreview:SetStatusBarColor(0.8, 0.8, 0.8, 0.5)
    else
      if factionBarPreview then
        factionBarPreview:Hide()
      end
    end

    REP_ReputationFrame_SetRowType(factionRow, isChild, OBS_fi.header, hasRep)
    factionRow:Show()

    -- Update details if this is the selected Faction
    if (atWarWith) then
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Show()
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Hide()
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Hide()
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    -- Update details if this is the selected Faction
    if (OBS_fi_i == GetSelectedFaction()) then
      if (ReputationDetailFrame:IsShown()) then
        if (canToggleAtWar) then local flag = 1 end
        REP_ReputationDetailFrame_IsShown(OBS_fi_I, flag, 1)
      end

      if (REP_ReputationDetailFrame:IsVisible()) then
        REP:Rep_Detail_Frame()

        _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
        _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
      end
    else
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Hide()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Hide()
    end
  end
end

----------------------------------------------
-- REP:OriginalRepOrderWithoutFactionHeader
----------------------------------------------
function REP:OriginalRepOrderWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
  -- get the info for this Faction
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, isAccountWide
  local isParagon

  if REP.AfterDragonflight then
    local reputationInfo = C_Reputation.GetFactionDataByIndex(factionIndex)
    name = reputationInfo.name
    description = reputationInfo.description
    standingID = reputationInfo.reaction
    barMin = reputationInfo.currentReactionThreshold
    barMax = reputationInfo.nextReactionThreshold
    barValue = reputationInfo.currentStanding
    atWarWith = reputationInfo.atWarWith
    canToggleAtWar = reputationInfo.canToggleAtWar
    isHeader = reputationInfo.isHeader
    isCollapsed = reputationInfo.isCollapsed
    hasRep = reputationInfo.isHeaderWithRep
    isWatched = reputationInfo.isWatched
    isChild = reputationInfo.isChild
    factionID = reputationInfo.factionID
    hasBonusRepGain = reputationInfo.hasBonusRepGain
    isAccountWide = reputationInfo.isAccountWide
  else
    name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = GetFactionInfo(factionIndex)
  end

  factionTitle:SetText(name)

  if (isCollapsed) then
    factionButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
  else
    factionButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
  end

  factionRow.index = factionIndex
  factionRow.isCollapsed = isCollapsed

  local friendReputationInfo = REP_Friend_Detail(factionID, standingID, factionRow)
  local colorIndex = friendReputationInfo.colorIndex
  local isCappedFriendship = friendReputationInfo.isCappedFriendship
  local factionStandingtext = friendReputationInfo.factionStandingtext
  local isFriend = friendReputationInfo.isFriend

  local origBarValue = barValue

  if REP.AfterWoD then
    if (factionID and C_Reputation.IsFactionParagon(factionID)) then
      isParagon = true

      local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
      local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()

      paragonFrame.factionID = factionID
      paragonFrame:SetPoint("RIGHT", factionRow, 11, 0)

      origBarValue = mod(currentValue, threshold)
      C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
      paragonFrame.Glow:SetShown(hasRewardPending)
      paragonFrame.Check:SetShown(hasRewardPending)
      paragonFrame:Show()

      colorIndex = 9
    end
  end

  local isCapped
  if (standingID == MAX_REPUTATION_REACTION) then
    isCapped = true
  end

  if(REP.AfterCata and (isCappedFriendship or standingID == 8)) then
    -- If exalted show a full green bar
    barMin, barMax, barValue = 0, 1, 1
  end

  -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
  if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
    local currentValue, threshold, rewardQuestID, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
    barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
  end

  -- Normalize Values
  barMax = barMax - barMin
  barValue = barValue - barMin
  barMin = 0

  if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
    factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, barValue, barMax)..FONT_COLOR_CODE_CLOSE
  elseif(isCapped or isCappedFriendship) then
    factionRow.rolloverText = nil
  elseif(REP_Data.Global.ShowMissing ~= true) then
    factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(tostring(REPUTATION_PROGRESS_FORMAT), barValue, barMax)..FONT_COLOR_CODE_CLOSE
  else
    factionRow.rolloverText = nil
  end

  local toExalted = 0
  if (standingID < 8) then
    toExalted = REP.ToExalted[standingID] + barMax - barValue
  end

  local toBFF = 0
  if (isCappedFriendship ~= true and isFriend) then
    toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
  end

  if (REP_Data.Global.ShowMissing) then
    if ((barMax - barValue) ~= 0 and factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
      factionRow.standingText = "Paragon".." ("..barMax - barValue..")"
    elseif ((barMax - barValue) ~= 0) then
      if factionStandingtext then
        factionRow.standingText = factionStandingtext.." ("..barMax - barValue..")"
      else
       factionRow.standingText = "("..barMax - barValue..")"
      end
    else
      factionRow.standingText = factionStandingtext
    end
  else
    if(factionID and C_Reputation.IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
      factionRow.standingText = "Paragon"
    else
      factionRow.standingText = factionStandingtext
    end
  end

  factionStanding:SetText(factionRow.standingText)

  if (isCappedFriendship) then
    factionRow.tooltip = nil
  else
    factionRow.tooltip = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
  end

  REP_ReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)
  factionRow:Show()

  factionBar:SetMinMaxValues(0, barMax)
  factionBar:SetValue(barValue)

  local color
  if colorIndex then
    color = REP.FACTION_BAR_COLORS[colorIndex]
  else
    color = REP.FACTION_BAR_COLORS[standingID]
  end

  factionBar:SetStatusBarColor(color.r, color.g, color.b)

  if(REP.AfterCata) then
    factionBar.BonusIcon:SetShown(hasBonusRepGain)
  end

  local previewValue = 0
  if (REP_Data.Global.ShowPreviewRep) then
    previewValue = REP:GetReadyReputation(factionIndex)
  end

  if ((previewValue > 0) and not ((standingID == 8) and (barMax - barValue == 1))) then
    factionBarPreview:Show()
    factionBarPreview:SetMinMaxValues(0, barMax)
    previewValue = previewValue + barValue

    if (previewValue > barMax) then previewValue = barMax end

    factionBarPreview:SetValue(previewValue)
    factionBarPreview:SetID(factionIndex)
    factionBarPreview:SetStatusBarColor(0.8, 0.8, 0.8, 0.5)
  else
    -- factionBarPreview:Hide()
  end

  -- Update details if this is the selected Faction
  if (atWarWith) then
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Show()
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Show()
    if factionAtWarIndicator then
      factionAtWarIndicator:Show()
    end
  else
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Hide()
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Hide()
    if factionAtWarIndicator then
      factionAtWarIndicator:Hide()
    end
  end

  local selectedFactionIndex
  if REP.AfterDragonflight then
    selectedFactionIndex = C_Reputation.GetSelectedFaction()
  else
    selectedFactionIndex = GetSelectedFaction()
  end

  if (factionIndex == selectedFactionIndex) then
    if (ReputationDetailFrame:IsShown()) then
      if (canToggleAtWar and (not isHeader)) then local flag = 1 end
      REP_ReputationDetailFrame_IsShown(factionIndex, flag, 2)
    end

    if (REP_ReputationDetailFrame:IsVisible()) then
      REP:Rep_Detail_Frame()
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
    end
  else
    _G["ReputationBar"..i.."ReputationBarHighlight1"]:Hide()
    _G["ReputationBar"..i.."ReputationBarHighlight2"]:Hide()
  end
end
----------------------------------------------
-- REP:SortByStandingWithFactionHeader
----------------------------------------------
function REP:SortByStandingWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
  local OBS_fi = REP_Entries[factionIndex]
  local OBS_fi_i = OBS_fi.i

  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfo(OBS_fi_i)
  local origBarValue = barValue
  local toExalted

  if (OBS_fi.header) then
    if (OBS_fi_i == 8) then
      factionHeader.Text:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." ("..tostring(OBS_fi.size)..")")
    else
      factionHeader.Text:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." -> "..GetText("FACTION_STANDING_LABEL"..OBS_fi_i + 1, gender).." ("..tostring(OBS_fi.size)..")")
    end

    if (REP_Collapsed[OBS_fi_i]) then
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionHeader.index = factionIndex
    factionHeader.isCollapsed = REP_Collapsed[OBS_fi_i]

    factionBar:Hide()
    factionHeader:Show()
    factionCheck:Hide()
  else
    factionStandingText = GetText("FACTION_STANDING_LABEL"..standingID, gender)
    factionStanding:SetText(factionStandingText)
    factionTitle:SetText(name)

    if (atWarWith) then
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    factionBar.index = OBS_fi_i
    factionBar.standingText = factionStandingText
    factionBar.tooltip  = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)
    color = REP.FACTION_BAR_COLORS[standingID]
    factionBar:SetStatusBarColor(color.r, color.g, color.b)
    factionBar:SetID(factionIndex)
    factionBar:Show()
    factionHeader:Hide()

    if (REP_Data.Global.ShowMissing) then
      if (barMax - barValue ~= 0) then
        factionStanding:SetText(factionStandingText .. " ("..barMax - barValue..")")
        factionBar.standingText = factionStandingText .. " ("..barMax - barValue..")"
        factionBar.tooltip = nil
      end
    end

    if (hasRep) or (not isHeader) then
      factionBar.hasRep = true
    else
      factionBar.hasRep = false
    end

    if (isWatched) then
      factionCheck:Show()
      factionTitle:SetWidth(100)
      factionCheck:SetPoint("LEFT", factionTitle, "LEFT", factionTitle:GetStringWidth(), 0)
    else
      factionCheck:Hide()
      factionTitle:SetWidth(110)
    end

    if (OBS_fi_i == GetSelectedFaction()) then
      if (ReputationDetailFrame:IsShown()) then
        ReputationDetailfactionTitle:SetText(name)
        ReputationDetailFactionDescription:SetText(description)

        if (atWarWith) then
          ReputationDetailAtWarCheckBox:SetChecked(1)
        else
          ReputationDetailAtWarCheckBox:SetChecked(nil)
        end

        if (canToggleAtWar) then
          ReputationDetailAtWarCheckBox:Enable()
          ReputationDetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
          REP_ReputationDetailFrame_IsShown(OBS_fi_i, 1, 1)
        else
          ReputationDetailAtWarCheckBox:Disable()
          ReputationDetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
        end

        if (IsFactionInactive(factionIndex)) then
          ReputationDetailInactiveCheckBox:SetChecked(1)
        else
          ReputationDetailInactiveCheckBox:SetChecked(nil)
        end

        if (isWatched) then
          ReputationDetailMainScreenCheckBox:SetChecked(1)
        else
          ReputationDetailMainScreenCheckBox:SetChecked(nil)
        end
      end

      if (REP_ReputationDetailFrame:IsVisible()) then
        REP:Rep_Detail_Frame()
      end

      _G["ReputationBar"..i.."Highlight1"]:Show()
      _G["ReputationBar"..i.."Highlight2"]:Show()
    else
      _G["ReputationBar"..i.."Highlight1"]:Hide()
      _G["ReputationBar"..i.."Highlight2"]:Hide()
    end
  end
end

----------------------------------------------
-- REP:OriginalRepOrderWithFactionHeader
----------------------------------------------
function REP:OriginalRepOrderWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
  -- get the info for this Faction
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfo(factionIndex)
  local origBarValue = barValue
  local toExalted

  if (isHeader) then
    factionHeader.Text:SetText(name)

    if (isCollapsed) then
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionHeader.index = factionIndex
    factionHeader.isCollapsed = isCollapsed

    factionBar:Hide()
    factionHeader:Show()
    factionCheck:Hide()
  else
    factionStandingText = GetText("FACTION_STANDING_LABEL"..standingID, gender)
    factionStanding:SetText(factionStandingText)
    factionTitle:SetText(name)

    if (atWarWith) then
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    factionBar.index = factionIndex
    factionBar.standingText = factionStandingText
    factionBar.tooltip  = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)
    color = REP.FACTION_BAR_COLORS[standingID]
    factionBar:SetStatusBarColor(color.r, color.g, color.b)
    factionBar:SetID(factionIndex)
    factionBar:Show()
    factionHeader:Hide()

    if (REP_Data.Global.ShowMissing) then
      if (barMax - barValue ~= 0) then
        factionStanding:SetText(factionStandingText .. " ("..barMax - barValue..")")
        factionBar.standingText = factionStandingText .. " ("..barMax - barValue..")"
        factionBar.tooltip = nil
      end
    end

    if (hasRep) or (not isHeader) then
      factionBar.hasRep = true
    else
      factionBar.hasRep = false
    end

    if (isWatched) then
      factionCheck:Show()
      factionTitle:SetWidth(100)
      factionCheck:SetPoint("LEFT", factionTitle, "LEFT", factionTitle:GetStringWidth(), 0)
    else
      factionCheck:Hide()
      factionTitle:SetWidth(110)
    end

    if (factionIndex == GetSelectedFaction()) then
      if (ReputationDetailFrame:IsShown()) then
        ReputationDetailFactionName:SetText(name)
        ReputationDetailFactionDescription:SetText(description)

        if (atWarWith) then
          ReputationDetailAtWarCheckBox:SetChecked(1)
        else
          ReputationDetailAtWarCheckBox:SetChecked(nil)
        end

        if (canToggleAtWar) then
          ReputationDetailAtWarCheckBox:Enable()
          ReputationDetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
          REP_ReputationDetailFrame_IsShown(factionIndex, 1, 2)
        else
          ReputationDetailAtWarCheckBox:Disable()
          ReputationDetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
        end

        if (IsFactionInactive(factionIndex)) then
          ReputationDetailInactiveCheckBox:SetChecked(1)
        else
          ReputationDetailInactiveCheckBox:SetChecked(nil)
        end

        if (isWatched) then
          ReputationDetailMainScreenCheckBox:SetChecked(1)
        else
          ReputationDetailMainScreenCheckBox:SetChecked(nil)
        end
      end

      if (REP_ReputationDetailFrame:IsVisible()) then
        REP:Rep_Detail_Frame()
      end

      _G["ReputationBar"..i.."Highlight1"]:Show()
      _G["ReputationBar"..i.."Highlight2"]:Show()
    else
      _G["ReputationBar"..i.."Highlight1"]:Hide()
      _G["ReputationBar"..i.."Highlight2"]:Hide()
    end
  end
end

----------------------------------------------
-- REP:WatchedFactionDetails
----------------------------------------------
function REP:WatchedFactionDetails(watchedFactionID)
  -- if (REP_OptionsFrame:IsVisible()) then REP_OptionsFrame:Hide() end
  
  local name, _, _, _, _ = GetWatchedFactionInfo()
  local watchedFactionName = name
  local factionIndex = nil
  local toExalted, ToBFF = 0, 0
  local repValue, repMax, origBarValue, repFactionStandingtext, isRepParagon, isRepFriend, isRepCappedFriendship

  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end
  for i = 1, numFactions, 1 do
    local index = i
    local name, _, standingID, _, barMax, barValue, _, _, _, _, _, _, _, factionID, _, _ = GetFactionInfo(index)
    local isMatchingFaction


    if (factionID and factionID == 1168 and name == REP.GuildName and name == watchedFactionName) then
      isMatchingFaction = true
    elseif (factionID and name ~= REP.GuildName and name == watchedFactionName) then
      isMatchingFaction = true
    else
      isMatchingFaction = false
    end


    if (isMatchingFaction) then
      if (standingID < 8) then toExalted = REP.ToExalted[standingID] + barMax - barValue end

      local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
      local isCappedFriendship = friendReputationInfo.isCappedFriendship
      local factionStandingtext = friendReputationInfo.factionStandingtext
      local isFriend = friendReputationInfo.isFriend

      if (isCappedFriendship ~= true and isFriend) then
        toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
      end

      factionIndex = index
      repValue = barValue
      repMax = barMax
      origBarValue = barValue
      isRepParagon = C_Reputation.IsFactionParagon(factionID)
      isRepFriend = isFriend
      isRepCappedFriendship = isCappedFriendship
      repFactionStandingtext = factionStandingtext
    end
  end

  if factionIndex ~= nil then
    if (ReputationDetailFrame:IsVisible()) then ReputationDetailFrame:Hide() end

    if (not CharacterFrame:IsVisible()) then
      CharacterFrame:Show()      
      tinsert(UISpecialFrames, "CharacterFrame")
      if (not ReputationFrame:IsVisible()) then ToggleCharacter('ReputationFrame') end
    end

    if (not REP_ReputationDetailFrame:IsVisible()) then REP_ReputationDetailFrame:Show() end

    SetSelectedFaction(factionIndex)
    REP:Rep_Detail_Frame()

    if (REP_Data.Global.ExtendDetails) then
      REP_BuildUpdateList()
      REP_UpdateList_Update()
    end

    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  elseif (watchedFactionName == "Alliance" or watchedFactionName == "Horde") then
    REP:Print(tostring(watchedFactionName)..' can only be shown if a child faction is visible/active in the reputaion list.')
  end
end
