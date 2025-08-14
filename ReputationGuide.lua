----------------------------------------------------------
-- Reputation Guide | A World of Warcraft addon to help you manage your reputation and factions. --
-------------------------------------------------------
---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, vars = ...
local REP = vars
---------------------------
-- 00 Variables Set up --
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
REP_FactionGain = {}
---- Tracking data
REP_Entries = {}

------------------------
-- 01 Addon Startup --
------------------------
function REP_OnLoad(self)
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
  SlashCmdList.REP =  REP_SlashHandler

  local defaultData = {
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
    ShowBonusGainsInChat = false
  }

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
end

function REP:SetOriginalFunctionsBasedOnExpansion()
  REP_Orig_ReputationFrame_Update = ReputationFrame_Update
  REP_Orig_ReputationBar_OnClick = ReputationBar_OnClick

  if ReputationFrameStandingLabel then
    REP_Orig_StandingText = ReputationFrameStandingLabel:GetText()
  end

  if (not REP.AfterShadowLands) then
    ReputationFrame_Update = REP_ReputationFrame_Update
    ReputationBar_OnClick = REP_ReputationBar_OnClick
  end

  REP_Orig_GetFactionParagonInfo = C_Reputation.GetFactionParagonInfo
  REP_Orig_IsFactionParagon = C_Reputation.IsFactionParagon
  REP_Orig_GetFriendshipReputation = C_GossipInfo.GetFriendshipReputation

  if REP.AfterDragonflight then
    REP_Orig_GetNumFactions = C_Reputation.GetNumFactions
    REP_Orig_GetFactionDataByIndex = C_Reputation.GetFactionDataByIndex
    REP_Orig_GetFactionDataByID = C_Reputation.GetFactionDataByID
    REP_Orig_ExpandAllFactionHeaders = C_Reputation.ExpandAllFactionHeaders

    REP_Orig_ExpandFactionHeader = C_Reputation.ExpandFactionHeader
    C_Reputation.ExpandFactionHeader = REP_ExpandFactionHeader

    REP_Orig_CollapseFactionHeader = C_Reputation.CollapseFactionHeader
    C_Reputation.CollapseFactionHeader = REP_CollapseFactionHeader

    REP_Orig_GetWatchedFactionData = C_Reputation.GetWatchedFactionData
    REP_Orig_SetWatchedFaction = C_Reputation.SetWatchedFactionByID -- Uses FactionID since 11.0.0
    REP_Orig_GetSelectedFaction = C_Reputation.GetSelectedFaction
  else
    REP_Orig_GetNumFactions = GetNumFactions
    REP_Orig_GetFactionDataByIndex = GetFactionInfo

    if REP.IsClassic then
      if not REP_Orig_CollapseFactionHeader and type(CollapseFactionHeader) == "function" then
        REP_Orig_CollapseFactionHeader = CollapseFactionHeader
        CollapseFactionHeader = REP_CollapseFactionHeader
      end
    else
      REP_Orig_CollapseFactionHeader = CollapseFactionHeader
      CollapseFactionHeader = REP_CollapseFactionHeader
    end

    REP_Orig_GetWatchedFactionData = GetWatchedFactionData
    REP_Orig_GetSelectedFaction = GetSelectedFaction

    if REP.AfterClassic then
      if C_Reputation.SetWatchedFaction then
        REP_Orig_SetWatchedFaction = C_Reputation.SetWatchedFaction -- Uses FactionID up till 11.0.0, later replaced with C_Reputation.SetWatchedFactionByID
      else
        REP_Orig_SetWatchedFaction = SetWatchedFactionIndex -- Uses FactionIndex up till 11.0.0 incase C_Reputation.SetWatchedFaction is not available.
      end 
    else
      REP_Orig_SetWatchedFaction = SetWatchedFactionIndex -- Uses FactionIndex up till 11.0.0 incase C_Reputation.SetWatchedFaction is not available.
    end

    if REP.AfterWotlk then
      REP_Orig_GetFactionDataByID = GetFactionInfoByID
      REP_Orig_ExpandAllFactionHeaders = ExpandAllFactionHeaders
    end

    if REP.IsClassic then
      if not REP_Orig_ExpandFactionHeader and type(ExpandFactionHeader) == "function" then
        REP_Orig_ExpandFactionHeader = ExpandFactionHeader
        ExpandFactionHeader = REP_ExpandFactionHeader
      end
    else
      REP_Orig_ExpandFactionHeader = ExpandFactionHeader
      ExpandFactionHeader = REP_ExpandFactionHeader
    end

    -----------------------------
    -- Detail frame checkboxes --
    -----------------------------
    if ReputationDetailAtWarCheckBox then
      REP_Orig_DetailAtWarCheckBox = ReputationDetailAtWarCheckBox
      REP_Orig_DetailInactiveCheckBox = ReputationDetailInactiveCheckBox
      REP_Orig_DetailMainScreenCheckBox = ReputationDetailMainScreenCheckBox

      REP_Orig_DetailAtWarCheckBoxText = ReputationDetailAtWarCheckBoxText
      REP_Orig_DetailInactiveCheckBoxText = ReputationDetailInactiveCheckBoxText
    else
      REP_Orig_DetailAtWarCheckBox = ReputationDetailAtWarCheckbox
      REP_Orig_DetailInactiveCheckBox = ReputationDetailInactiveCheckbox
      REP_Orig_DetailMainScreenCheckBox = ReputationDetailMainScreenCheckbox

      REP_Orig_DetailAtWarCheckBoxText = ReputationDetailAtWarCheckboxText
      REP_Orig_DetailInactiveCheckBoxText = ReputationDetailInactiveCheckboxText
    end
  end

  if REP.AfterShadowLands then
    REP_Orig_IsMajorFaction = C_Reputation.IsMajorFaction
    REP_Orig_GetMajorFactionIDs = C_MajorFactions.GetMajorFactionIDs
    REP_Orig_GetMajorFactionData = C_MajorFactions.GetMajorFactionData
    REP_Orig_HasMaximumRenown = C_MajorFactions.HasMaximumRenown
  end
end

------------------------
-- 02 Event Handler --
------------------------
function REP_OnEvent(self, event, ...)
  if (event == "LOADING_SCREEN_ENABLED") then
    REP_OnLoadingScreen = true
  end

  if (event == "LOADING_SCREEN_DISABLED") then
    REP_OnLoadingScreen = false
    REP:DumpReputationChangesToChatForAllFactions() -- Just to make sure we don't miss printing out any rep gain that occured during the loading screen
  end

  local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13 = ...

  if (event == "ADDON_LOADED") and (arg1 == addonName) then
    REP:SetOriginalFunctionsBasedOnExpansion();
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

    if not REP_Orig_GetFactionDataByID then
      REP:SetOriginalFunctionsBasedOnExpansion()
    end

    local isInitialLogin, isReloadingUi = arg1, arg2
    REP:IndexFactions(isInitialLogin, isReloadingUi)
    
    REP:RenderAddonSettingsFrame()
    REP:RenderProfileFrames()

    REP_Main:UnregisterEvent("PLAYER_ENTERING_WORLD")
    REP_Main:RegisterEvent("UPDATE_FACTION")
    REP_Main:RegisterEvent("COMBAT_TEXT_UPDATE")
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
    -- ChatFrame_AddMessageEventFilter("COMBAT_TEXT_UPDATE", REP_ChatFilter)
    -- to keep dungeon Difficulty up to date
    if REP.AfterClassic then REP_Main:RegisterEvent("PLAYER_DIFFICULTY_CHANGED") end
    -- Recast for tradeskill
    if(not REP.AfterBfA) then REP_Main:RegisterEvent("UPDATE_TRADESKILL_RECAST") end
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
  elseif ((not REP.AfterShadowLands and (event == "UPDATE_FACTION" or event == "QUEST_COMPLETE" or event == "QUEST_WATCH_UPDATE")) or (REP.AfterShadowLands and (event == "UPDATE_FACTION"  or event == "QUEST_LOG_UPDATE" or event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED" or event == "MAJOR_FACTION_UNLOCKED"))) then    
    if (ReputationFrame:IsVisible() and not REP.AfterDragonflight) then
      ReputationFrame_Update()
    end
    
    -- if REP.AfterDragonflight then
    --   ReputationFrame.ReputationDetailFrame:Hide()
    -- else
    --   -- REP:DumpReputationChangesToChatForAllFactions()
    --   ReputationDetailFrame:Hide();
    -- end

    if (REP_Orig_GetSelectedFaction() ~= 0 and REP_Orig_ReputationDetailFrame:IsVisible()) then
      REP_BuildUpdateList()
      REP_UpdateList_Update()
    end    
  elseif (event == "COMBAT_TEXT_UPDATE" and arg1 == "FACTION") then
    local faction, change = GetCurrentCombatTextEventInfo()
    REP:DumpReputationChangesToChatOnUpdate(faction, change)
  elseif (event == "BAG_UPDATE") then
    if (REP_Orig_ReputationDetailFrame:IsVisible() and not REP.AfterDragonflight) then
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
      if (REP_Orig_ReputationDetailFrame:IsVisible() and not REP.AfterDragonflight) then
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
    if (REP_Orig_ReputationDetailFrame:IsVisible()) then
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
    REP:Init() -- Fired last in the event order due to REP_InitStages?.
    REP_Main:UnregisterEvent("GARRISON_UPDATE")
  end
end

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

-------------------------------
-- 03 Addon Initialization --
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

function REP:Init()
  if REP_InitComplete then return end

  if (REP.AfterMoP) then
    if (REP_InitStages ~= 20) then return end
  else
    if (REP_InitStages ~= 15) then return end
  end

  local version
  if REP.AfterCata then
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
  changed = changed + REP:InitVariable("ShowAllFactionsGains", true)

  if REP.AfterWotlk then
    changed = changed + REP:InitVariable("NoGuildGain", true)
    changed = changed + REP:InitVariable("NoGuildSwitch", true)
  end

  if REP.AfterCata then
    changed = changed + REP:InitVariable("ShowBonusGainsInChat", true)
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
  else
    if REP_OrderByStandingCheckBox then REP_OrderByStandingCheckBox:Hide() end
  end

  if REP.AfterDragonflight then
    hooksecurefunc(ReputationFrame.ReputationDetailFrame, 'Show', function(self)
      REP:Rep_Detail_Frame()
    end)
  end

  -- Dubble check expansion index here since it seems to fire before onLoad...
  local currentExpansionIndex = GetExpansionLevel();
  if not REP_Data.Global.ExpansionIndex then REP_Data.Global.ExpansionIndex = currentExpansionIndex end
  if (REP_Data.Global.ExpansionIndex ~= currentExpansionIndex) then REP_Data.Global.ExpansionIndex = currentExpansionIndex end

  local guid = UnitGUID("player")
  local _, race = UnitRace("player")
  local _, faction = UnitFactionGroup("player")
  local _, class = UnitClass("player")
  local level = UnitLevel("player")
  local gender = UnitSex("player")
  local playerName = UnitName("player")
  local realm = GetRealmName()

  local expansionIndex = REP_Data.Global.ExpansionIndex
  local expansion = REP.Expansions[expansionIndex]
  REP.realm = realm
 
  if not REP_Data.ProfileKeys then REP_Data.ProfileKeys = {} end
  if not REP_Data.ProfileKeys[guid] then REP_Data.ProfileKeys[guid] = {} end

  local showChar = (REP_Data.ProfileKeys[guid].profile and REP_Data.ProfileKeys[guid].profile.ShowChar) or false

  REP_Data.ProfileKeys[guid].profile = {
    name	= playerName,
    gender	= gender,
    class	= class,
    race = race,
    realm	= realm,
    level	= level,
    faction	= faction,
    expansion = expansion,
    ShowChar = showChar
  }

  if not REP_Data.ProfileKeys[guid].quests then REP_Data.ProfileKeys[guid].quests = {} end
  if not REP_Data.ProfileKeys[guid].factions then REP_Data.ProfileKeys[guid].factions = {} end
  if not REP_Data.ProfileKeys[guid].inactiveFactions then REP_Data.ProfileKeys[guid].inactiveFactions = {} end

  local profileKey = format("%s-%s", playerName, realm)
  local matchingOldProfileKey = REP_Data[profileKey]
  
  if matchingOldProfileKey and matchingOldProfileKey.InactiveFactions then
    REP_Data.ProfileKeys[guid].inactiveFactions = matchingOldProfileKey.InactiveFactions
    REP_Data[profileKey] = nil
  end

  for profileKey, profileData in pairs(REP_Data) do
    if profileKey ~= "Global" and profileKey ~= "ProfileKeys" then
      local k = REP_Data[profileKey]
      if not k.InactiveFactions or REP:TableSize(k.InactiveFactions) == 0 then REP_Data[profileKey] = nil end
    end
  end

  if (IsInGuild()) then
    if (REP.GuildName == nil or REP.GuildName == "") then REP.GuildName = GetGuildInfo("player") end
  end

  if (race and faction and playerName and realm) then
    if race == "Human" then
      REP.IsHuman = true
    end

    if (class == "DEATHKNIGHT") then
      REP.IsDeathKnight = true
    end

    if (faction == FACTION_ALLIANCE) then
      REP.IsAlliance = true
    end

    if (faction == FACTION_HORDE) then
      REP.IsHorde = true
    end

    REP_InitEnFactionGains(REP.GuildName)
    REP:HookWatchedFactionBar()

    if REP.AfterDragonflight then
      REP:HookFactionFrameMixinBar()
    end

    REP_InitComplete = true
    if (REP_InitCount <= 5) then
      REP_UpdateRequest = GetTime() + REP_UPDATE_INTERVAL
    end
  end
end

------------------------
-- 04 Slash Handler --
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

          if (REP_Orig_ReputationDetailFrame:IsVisible()) then
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

          if (REP_Orig_ReputationDetailFrame:IsVisible()) then
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

          if (REP_Orig_ReputationDetailFrame:IsVisible()) then
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
      elseif (wordsLower[0] == "status") then
        REP:Status()
      elseif (wordsLower[0] == "help") then
        REP:Help()
      elseif (wordsLower[0] == "about") then
        REP:About()
      elseif (wordsLower[0] == "watch" and REP.AfterClassic) then
        REP:WatchFactionById(wordsLower[1])
      elseif (wordsLower[0] == "watchindex") then
        REP:WatchFactionByIndex(wordsLower[1])
      else
        REP:PrintSlash(REP_TXT.command, msgLower)
      end
    else
      -- do nothing
    end
  end
end

-----------------------------------
-- 05 chat filtering
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

    if ((event == "COMBAT_TEXT_UPDATE") and (msg == "FACTION")) then
      skip = true
    end
  end

  return skip, msg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13
end

-----------------------------------
-- 06 show option window
-----------------------------------
function REP_OpenSettings()
  REP.Tools.Settings:Open()
end

function REP:ToggleDetailWindow()
  if ReputationFrame:IsVisible() then
    if (REP_Data.Global.ExtendDetails) then
      if REP_Orig_ReputationDetailFrame:IsVisible() then
        -- both windows shown -> hide them both
        REP_Orig_ReputationDetailFrame:Hide()
        HideUIPanel(CharacterFrame)
      else
        -- detail window not shown -> show it, hide any others
        REP_Orig_ReputationDetailFrame:Show()
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
        REP_Orig_ReputationDetailFrame:Hide()
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
      REP_Orig_ReputationDetailFrame:Show()
    else
      ReputationDetailFrame:Show()
    end

    if not REP.AfterDragonflight then
      ReputationFrame_Update()
    end
  end
end

----------------------------------------------
-- 07 UI Changes based on current expansion --
----------------------------------------------
function REP:MakeUIChanges()
  if REP.IsClassic then
    ReputationDetailAtWarCheckBox = ReputationDetailAtWarCheckbox
    ReputationDetailAtWarCheckBoxText = ReputationDetailAtWarCheckboxText

    ReputationDetailInactiveCheckBox = ReputationDetailInactiveCheckbox
    ReputationDetailInactiveCheckBoxText = ReputationDetailInactiveCheckboxText

    ReputationDetailMainScreenCheckBox = ReputationDetailMainScreenCheckbox
    ReputationDetailMainScreenCheckBoxText = ReputationDetailMainScreenCheckboxText
  end

  REP:ChangeReputationDetailFrameUI()

  if REP.AfterWotlk then
    if REP.AfterDragonflight then
      REP_OptionsButton:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -320, -22)
    else
      REP_OptionsButton:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -2, -22)
    end

    if not REP.AfterShadowLands then
      REP_OrderByStandingCheckBox:SetPoint("TOPLEFT", ReputationFrame, "TOPLEFT", 55, -20)
    end
  end
end

--------------------------------------
-- 08 Check active reputation buffs --
--------------------------------------
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

-----------------------------------
-- 10 Faction map --
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
    if C_Item and C_Item.GetItemInfo then
      item_name = C_Item.GetItemInfo(fiitem)
    elseif GetItemInfo then
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

function REP:InitFaction(guildName, faction)
  if not faction then return end

  local factionName

  if faction == "guildName" or faction == REP.GuildName or faction == 1168 then
    if REP.GuildName then
      factionName = tostring(REP.GuildName).." (guild)"
    end
  else
    local factionData = REP:GetFactionDataByID(faction)
    if factionData and factionData.name then
      factionName = factionData.name
    else
      factionName = faction
    end
  end

  return factionName
end

------------------------------------
-- 11 Faction Lists --
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
  rep = rep * REP:GetReputationFactor(REP.IsHuman, faction)
  faction = string.lower(faction)

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
  
  if not key then key = REP_ProfileKey end
  rep = rep * REP:GetReputationFactor(REP.IsHuman, faction)
  faction = string.lower(faction)

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
  
  rep = rep * REP:GetReputationFactor(REP.IsHuman, faction)
  faction = string.lower(faction)

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
  rep = rep * REP:GetReputationFactor(REP.IsHuman, faction)
  faction = string.lower(faction)
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
  if not customFactor then customFactor = 0 end
  rep = rep * (REP:GetReputationFactor(REP.IsHuman, faction) + customFactor)
  faction = string.lower(faction)
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
-- 12 REP_RepFrame_Up Start --
-----------------------------------
function REP_ReputationFrame_Update()
  local numFactionsDisplayed = NUM_FACTIONS_DISPLAYED or 14

  if (REP_OnLoadingScreen == false) then
    local numFactions
    if REP_Data.Global.SortByStanding then
      REP:StandingSort()
      numFactions = REP_OBS_numFactions
    else
      numFactions = REP_Orig_GetNumFactions()
    end

    if not REP.AfterShadowLands then
      -- Update scroll frame
      if (not FauxScrollFrame_Update(ReputationListScrollFrame, numFactions, numFactionsDisplayed, REPUTATIONFRAME_FACTIONHEIGHT)) then
        ReputationListScrollFrameScrollBar:SetValue(0)
      end
    end

    if ReputationFrameStandingLabel then
      if (REP_Data.Global.ShowMissing) then
        if string.find(REP_Orig_StandingText, REP_TXT.missing) then
          ReputationFrameStandingLabel:SetText(REP_Orig_StandingText)
        else
          ReputationFrameStandingLabel:SetText(REP_Orig_StandingText.." "..REP_TXT.missing)
        end
      else
        if string.find(REP_Orig_StandingText, REP_TXT.missing) then
          ReputationFrameStandingLabel:SetText(string.gsub(REP_Orig_StandingText, REP_TXT.missing, ""))
        else
          ReputationFrameStandingLabel:SetText(REP_Orig_StandingText)
        end
      end
    end

    local i
    local gender = UnitSex("player")
    local guid = UnitGUID("player")
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

          local factionData = REP:GetFactionDataByIndex(factionIndex)
          local name = factionData.name
          local factionID = factionData.factionID

          -- local name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _ = REP_Orig_GetFactionDataByIndex(factionIndex)
          local inactive = IsFactionInactive(factionIndex)

          if (guid) then
            if not REP_Data.ProfileKeys[guid].inactiveFactions then REP_Data.ProfileKeys[guid].inactiveFactions = {} end
            if (inactive and not REP_Data.ProfileKeys[guid].inactiveFactions[factionID]) then
              REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = true
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
        local factionData = REP:GetFactionDataByIndex(factionIndex)

        if factionData then
          name = factionData.name
          factionID = factionData.factionID
        end

        if REP.AfterDragonflight then
          -- local reputationInfo = REP_Orig_GetFactionDataByIndex(factionIndex)
          -- name = reputationInfo.name
          -- factionID = reputationInfo.factionID
          inactive = C_Reputation.IsFactionActive(factionIndex) == false
        else
          -- name, _, _, _, _, _, _, _, _, _, _, _, _, factionID, _ = REP_Orig_GetFactionDataByIndex(factionIndex)
          inactive = IsFactionInactive(factionIndex)
        end

        if (guid and REP_Data.ProfileKeys[guid]) then
          if not REP_Data.ProfileKeys[guid].inactiveFactions then REP_Data.ProfileKeys[guid].inactiveFactions = {} end
          if (inactive and not REP_Data.ProfileKeys[guid].inactiveFactions[factionID]) then
            REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = true
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

        if not REP.AfterDragonflight and factionRow and not factionRow._repTooltipHooked then
          factionRow:HookScript("OnEnter", function(self)
            local factionData = REP:GetFactionDataByIndex(self.index)

            if factionData and factionTitle and not string.find(factionTitle:GetText(), "->", 1, true) then
              REP:ShowReputationTooltip(self, factionData.factionID)
            end
          end)
          factionRow:HookScript("OnLeave", function() GameTooltip:Hide() end)
          factionRow._repTooltipHooked = true
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
  if ((ReputationDetailFrame:IsVisible() or REP_Orig_ReputationDetailFrame:IsVisible()) and (REP_Orig_GetSelectedFaction() == self.index)) then
    REP:PlayCheckBoxSound(false)
    REP_Orig_ReputationDetailFrame:Hide()
  else
    if (self.hasRep) then
      if not REP.AfterDragonflight then SetSelectedFaction(self.index) end

      REP:PlayCheckBoxSound(true)
      REP_Orig_ReputationDetailFrame:Show()
      REP:Rep_Detail_Frame()

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
  if (not REP_Orig_ReputationDetailFrame:IsVisible()) then return end

  -- Fix for GetGuildInfo() function returning nil upon first login.
  if (IsInGuild() and REP.GuildName == nil) then
    REP.GuildName = GetGuildInfo("player")
    REP_InitFactionForGuildOnly()
  end

  REP_DetailListScrollFrame:Show()

  local numEntries, highestVisible = REP:GetUpdateListSize()

  -- Update scroll frame
  if (not FauxScrollFrame_Update(REP_DetailListScrollFrame, numEntries, REP_UPDATE_LIST_HEIGHT, 16)) then
    REP_DetailListScrollFrameScrollBar:SetValue(0)
  end

  local entryIndex
  local entryFrameName, entryFrame, entryTexture
  local entryLabel, entryName, entryRep, entryTimes
  local entryItemTimes, entryItemName, entryItemTotal
  local postfix

  local entryOffset = FauxScrollFrame_GetOffset(REP_DetailListScrollFrame)

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

      entryFrameName = "REP_DetailUpdateEntry"..i
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
      _G["REP_DetailUpdateEntry"..i]:Hide()
    end

    if haveInfo then
      REP_DetailNoInformationText:Hide()
    else
      REP_DetailNoInformationText:SetText(REP_TXT.noInfo)
      REP_DetailNoInformationText:Show()
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
  REP:PlayCheckBoxSound(allFactions)

  if (allFactions == true) then
    REP_Suppressed = {}
    REP_BuildUpdateList()
  else
    local factionIndex = REP_Orig_GetSelectedFaction()
    local factionData = REP:GetFactionDataByIndex(factionIndex)
    local faction = factionData.name
    local factionID = factionData.factionID

    if (faction) then
      if REP.factions[factionID] and REP.factions[factionID].faction then
        faction = REP.factions[factionID].faction
      end

      faction = string.lower(faction)

      if factionID == 1168 then
        faction = faction.." (guild)"
      end

      if (not REP_Suppressed) then
        REP_Suppressed = {}
      end

      if REP_Suppressed[faction] then
        REP_Suppressed[faction] = nil
        REP_Suppressed[factionID] = {}
      else
        REP_Suppressed[factionID] = {}
      end
    end

    REP_BuildUpdateList()
  end
end

-----------------------------------
-- 13 Prepare update entries   --
-----------------------------------
function REP:Update_Tooltip(x, l1,r1)
  x = x + 1
  local ToolTip_ID = {l = l1, r = r1}
  return ToolTip_ID, x
end

function REP_BuildUpdateList()
  if (not REP_Orig_ReputationDetailFrame:IsVisible()) then return end

  REP_UpdateList = {}
  REP_CurrentRepInBag = 0
  REP_CurrentRepInBagBank = 0
  REP_CurrentRepInQuest = 0

  local index = 1
  local factionIndex = REP_Orig_GetSelectedFaction()
  local factionData = REP:GetFactionDataByIndexToBuildReputationlist(factionIndex)

  if not factionData then return end

  local factionID = factionData.factionID
  local factionName = factionData.factionNameLowercase
  local standingID = factionData.currentStandingID
  local repToNext = factionData.repToNext
  local normCurrent = factionData.normCurrent

  if (REP_FactionGain[factionName]) then
    local fg_sid = REP_FactionGain[factionName][standingID]

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
      if (fg_sid.quests and (REP_Data.Global.ShowQuests or REP_Data.Global.ShowPvPQuests)) then
        local sum = 0
        local count = 0
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
              if (REP_Suppressed and REP_Suppressed[factionName] and REP_Suppressed[factionName][FUL_I.originalName]) then
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

  REP_UpdateList_Update()
end

-- function REP_BuildUpdateList()
--   local index = 1
--   local factionIndex = REP_Orig_GetSelectedFaction()
--   local factionData = REP:GetFactionDataByIndexToBuildReputationlist(factionIndex)

--   local standingID, barMin, barMax, barValue, isCapped
--   local faction = factionData.name
--   local description = factionData.description
--   local factionID = factionData.factionID

--   if not factionID or not faction then return end

--   local isMajorFaction = REP_Orig_IsMajorFaction and REP_Orig_IsMajorFaction(factionID)

--   if isMajorFaction then
--     local majorFactionData = REP_Orig_GetMajorFactionData(factionID)
--     local hasParagon = REP_Orig_GetFactionParagonInfo(factionID)

--     barMin = 0
--     standingID = majorFactionData.renownLevel
--     isCapped = REP_Orig_HasMaximumRenown(factionID)

--     -- barValue = majorFactionData.renownReputationEarned
--     -- barMax = majorFactionData.renownLevelThreshold

--     if isCapped and hasParagon then
--       -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
--       local currentValue, threshold, _, _ = REP_Orig_GetFactionParagonInfo(factionID)
--       barMax, barValue = threshold, mod(currentValue, threshold)     
--     else
--       barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0
--       barMax = standingID * majorFactionData.renownLevelThreshold
--       barValue = ((standingID - 1) * majorFactionData.renownLevelThreshold) + barValue
--     end
--   else
--     local friendReputationInfo = REP:GetFriendFactionDataByID(factionID)
--     standingID = factionData.reaction

--     if friendReputationInfo then
--       barMin = friendReputationInfo.barMin
--       barValue = friendReputationInfo.barValue
--       barMax = friendReputationInfo.barMax
--       isCapped = friendReputationInfo.isCappedFriendship
--     else
--       barMin = factionData.currentReactionThreshold
--       barValue = factionData.currentStanding
--       isCapped = standingID == 8 and (factionData.nextReactionThreshold - factionData.currentStanding) == 1

--       if standingID >= 4 then
--         barMax = factionData.nextReactionThreshold or 0
--       else
--         barMin = barMin * -1
--         barValue = barValue * -1
--         barMax = (factionData.currentReactionThreshold - factionData.nextReactionThreshold) * -1
--       end
--     end 
--   end

--   if REP_Orig_IsFactionParagon and REP_Orig_IsFactionParagon(factionID) then
--     local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
--     barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
--   end
  
--   local origFaction, faction

--   if REP.factions[factionID] and REP.factions[factionID].faction then
--     faction = REP.factions[factionID].faction
--   end

--   if factionID == 1168 then
--     origFaction = faction.." (guild)"
--     faction = string.lower(faction).." (guild)"
--     faction = string.lower(faction).." (guild)"
--   else
--     origFaction = faction
--     faction = string.lower(faction)
--     faction = string.lower(faction)
--   end
  
--   -- Normalize Values
--   local normMax, repToNext
--   local normCurrent = barValue - barMin

--   if standingID < 4 then
--     normMax = barMax
--     repToNext = normMax - normCurrent
--   else
--     normMax = barMax - barMin

--     if isCapped then
--       repToNext = 0
--     else
--       repToNext = barMax - barValue
--     end
--   end
-- end

function REP:Quest_Items(itemsNeed, currentQuestTimesBag, currentQuestTimesBagBank, QuestItem, item)
  if not QuestItem.times then
    QuestItem = {}
    QuestItem.name = "James"
  end

  local itemCountIncludingBank, itemCountExcludingBank, currencyInfo

  if C_Item and C_Item.GetItemCount then
    itemCountIncludingBank = C_Item.GetItemCount(item, true)
    itemCountExcludingBank = C_Item.GetItemCount(item)
  elseif GetItemCount then
    itemCountIncludingBank = GetItemCount(item, true)
    itemCountExcludingBank = GetItemCount(item)
  end

  if (type(item) == "number") then
    if REP.AfterCata then
      currencyInfo = C_CurrencyInfo.GetCurrencyInfo(item)
    else
      currencyInfo = GetCurrencyInfo(item)
    end
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
  REP:PlayCheckBoxSound(show)
end

function REP_ToggleAllTypesToShow(toggled)
  REP_Data.Global.ShowQuests = toggled
  REP_Data.Global.ShowPvPQuests = toggled
  REP_Data.Global.ShowMobs = toggled
  REP_Data.Global.ShowInstances = toggled
  REP_Data.Global.ShowItems = toggled
  REP_Data.Global.ShowGeneral = toggled

  REP_BuildUpdateList()
  REP_UpdateList_Update()
  REP:PlayCheckBoxSound(toggled)
  REP:Rep_Detail_Frame()
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

-----------------------------------
-- 14 reputation Changes to chat --
-----------------------------------
function REP:DumpReputationChangesToChatOnUpdate(faction, change)
  local info = {}
  local factionID
  local found = false

  if faction == GUILD then
    faction = tostring(REP.GuildName).." (guild)"
    factionID = 1168
    info["factionID"] = factionID
  end  

  info["faction"] = faction

  for i, factionData in pairs(REP.factions) do
    if factionData.info and ((factionData.info.faction and factionData.info.faction == faction) or (factionData.info.factionID and factionData.info.factionID == factionID)) then
      found = true
      info = factionData.info
      info["new"] = false
      break
    end
  end

  if not found then info["new"] = true end

  if type(change) == "number" then
    info["change"] = math.abs(change)
    if tonumber(change) < 0 then
      info["negative"] = true
    end
  else
    info["change"] = 0
  end

  if REP_Data.Global.ShowAllFactionsGains then
    REP:DumpReputationChangesToChatForAllFactions()
  else
    if info.new then
      info = REP:getFactionInfoForNewFaction(info)
      REP:DumpReputationChangesToChatForSingleFaction(info)
    else
      info = REP:getFactionInfo(info)
      REP:DumpReputationChangesToChatForSingleFaction(info)
    end

    if REP_Data.Global.SwitchFactionBar and not info.isWatched then
      if REP.AfterClassic and (C_Reputation.SetWatchedFaction or REP.AfterDragonflight) then
        REP:WatchFactionById(info.factionID)
      else
        local watchIndex = REP:GetFactionIndexBasedOnFactionID(info.factionID)
        REP:WatchFactionByIndex(watchIndex)
      end
    end
  end
end

function REP:DumpReputationChangesToChatForAllFactions(initOnly)
  if (REP_OnLoadingScreen == false) then
    local factionIndex, watchIndex, watchID, watchedIndex, watchedID
    local name, standingID, barMin, barMax, barValue, isHeader, hasRep
    local factionID

    if not REP.factions or REP:GetTableCount(REP.factions) == 0 then return end

    for k, v in pairs(REP.factions) do
      local currentOld = v.info.current + v.info.bottom
      local info = REP:getRepInfo(v.info)
      local change = (info.current + info.bottom) - currentOld

      if info.isWatched then
        if REP.AfterClassic and (C_Reputation.SetWatchedFaction or REP.AfterDragonflight) then
          watchedID = info.factionID
        else
          watchedIndex = REP:GetFactionIndexBasedOnFactionID(info.factionID)
        end
      end

      -- if factionInfo.new and (change == 0) and (v.info.faction == factionInfo.faction) and (factionInfo.change ~= 0) then
      --   change = factionInfo.change * ((factionInfo.negative and -1) or 1)
      -- end

      if change ~= 0 then
        info.change = math.abs(change)
        info.negative = change < 0
        local session = REP:getFactionSession(info)
        REP.factions[info.factionID].session = session
        info.session = session
        info.lastUpdated = time()
        REP:DumpReputationChangesToChatForSingleFaction(info)

        if (REP_Data.Global.SwitchFactionBar and not info.negative and (not REP_Data.Global.NoGuildSwitch or info.factionID ~= 1168)) then
          if REP.AfterClassic and (C_Reputation.SetWatchedFaction or REP.AfterDragonflight) then
            watchID = info.factionID
          else
            watchIndex = REP:GetFactionIndexBasedOnFactionID(info.factionID)
          end
        end
      end
    end

    if REP_Data.Global.SwitchFactionBar then
      if(not REP.AfterTBC and REP:TableSize(factionsChanged) > 1) then
        table.sort(factionsChanged, REP:TableSort())
        watchIndex = factionsChanged[1].watchIndex
      end

      if REP.AfterClassic and (C_Reputation.SetWatchedFaction or REP.AfterDragonflight) then
        if (watchID and watchID > 0 and watchID ~= watchedID) then
          REP:WatchFactionById(watchID)
        end
      else
        if (watchIndex and watchIndex > 0 and watchIndex ~= watchedIndex) then
          REP:WatchFactionByIndex(watchIndex)
        end
      end
    end
  end
end

function REP:DumpReputationChangesToChatForSingleFaction(info)
  if info == nil or info.name == nil then return end

  if (REP_Data.Global.WriteChatMessage and (not REP_Data.Global.NoGuildGain or info.factionID ~= 1168)) then
    if info.negative then -- Decreased reputation
      if not info.isRenown then
        if (info.standingID >= 1 and not info.isFriend) then
          REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_DECREASED..REP_TXT.statsNextStanding, info.name, info.change, "", info.session, _G["FACTION_STANDING_LABEL"..info.standingID + 1], info.maximum - info.current))
        else
          REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_DECREASED..REP_TXT.stats, info.name, info.change, "", info.session, info.maximum - info.current))
        end
      end
    else -- Increased reputation
      if info.isCapped then
        REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.stats, info.name, info.change, "+", info.session, info.maximum - info.current))
      else
        if info.isRenown then
          if info.change >= (info.maximum - info.current) then
            REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, info.name, info.change, "+", info.session, REP_TXT.renown.." "..(info.renown + 1) + 1, info.maximum - info.current))
          else
            REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, info.name, info.change, "+", info.session, REP_TXT.renown.." "..info.renown + 1, info.maximum - info.current))
          end
        elseif info.isFriend then
          REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, info.name, info.change, "+", info.session, REP:GetFriendshipStandingLabelAsBackup(info), info.maximum - info.current))
        else
          if REP_Data.Global.ShowBonusGainsInChat and info.hasBonusRepGain then
            local baseReputation = info.change / 2 -- Commendations are added last after other bonuses, so it's always 100% bonus, so half of total.
            local bonusReputation = REP:RoundToOneDecimal(baseReputation)
            local changeMessage = tostring(info.change)..". (+"..tostring(bonusReputation).." bonus)"
            local factionStringWithBonus = FACTION_STANDING_INCREASED:gsub("%%d", "%%s")

            if info.standingID < 8 then
              REP:Print(REP.NEW_REP_COLOUR..string.format(factionStringWithBonus..REP_TXT.statsNextStanding, info.name, changeMessage, "+", info.session, _G["FACTION_STANDING_LABEL"..info.standingID + 1], info.maximum - info.current))
            else
              REP:Print(REP.NEW_REP_COLOUR..string.format(factionStringWithBonus..REP_TXT.stats, info.name, changeMessage, "+", info.session, info.maximum - info.current))
            end
          else
            if info.standingID < 8 then
              REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding, info.name, info.change, "+", info.session, _G["FACTION_STANDING_LABEL"..info.standingID + 1], info.maximum - info.current))
            else
              REP:Print(REP.NEW_REP_COLOUR..string.format(FACTION_STANDING_INCREASED..REP_TXT.stats, info.name, info.change, "+", info.session, info.maximum - info.current))
            end
          end
        end
      end
    end
  end

  local guid = UnitGUID("player")
  if guid and REP_Data.ProfileKeys[guid] and REP_Data.ProfileKeys[guid].factions then
    local currentStandingID

    if info.isFriend then
      currentStandingID = 5
    else
      currentStandingID = info.standingID
    end

    REP_Data.ProfileKeys[guid].factions[info.factionID] = {
      standing = info.standingText or "",
      standingID = currentStandingID or 0,
      current = info.current or 0,
      max = info.maximum or 0
    }
  end
end

function REP:GetFriendshipStandingLabelAsBackup(info)
  if info.standingTextNext then
    return info.standingTextNext
  else
    info["standingTextNext"] = REP:GetFriendFactionStandingLabel(info.factionID, info.top)
    
    if info.standingTextNext then
      return info.standingTextNext
    else
      return ""
    end
  end
end

function REP_ClearSessionGain()
  REP:PlayCheckBoxSound(false)

  local factionIndex = REP_Orig_GetSelectedFaction()
  local factionID = REP:GetFactionDataByIndex(factionIndex).factionID

  if (factionID and REP.factions and REP.factions[factionID]) then
    REP.factions[factionID].session = 0
  end

  if not REP.AfterDragonflight then
    ReputationFrame_Update()
  end
end

-------------------------------------------
-- 15 Getting reputation ready to hand In
-------------------------------------------
function REP:GetReadyReputation(factionIndex)
  local result = 0
  return result 
  --[[-- curently disabled
  if not factionIndex then return result end

  if (not ReputationFrame:IsVisible()) then return result end

  local maxFactionIndex = REP_Orig_GetNumFactions()
  if (factionIndex > maxFactionIndex) then return result end

  local faction, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild = REP_Orig_GetFactionDataByIndex(factionIndex)
  if (isHeader) then return result end

  if (faction) then
    origFaction = faction
    faction = string.lower(faction)

    -- Normalize Values
    local normMax = barMax - barMin
    local normCurrent = barValue - barMin
    local repToNext = barMax - barValue

    local REP_FG_f=REP_FactionGain[faction]
    if (REP_FG_f) then
      local REP_FG_fs=REP_FG_f[standingID]
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
-- 16 FSS // RDF_IS // RDF
-----------------------------------
function REP:StandingSort()
  local standings = {}
  local guid = UnitGUID("player")

  for i = 1, REP_Orig_GetNumFactions() do
    local reputationInfo = REP:GetFactionDataByIndex(i)

    if not reputationInfo then return end

    local name = reputationInfo.name
    local description = reputationInfo.description
    local standingID = reputationInfo.reaction
    local barMax = reputationInfo.nextReactionThreshold
    local barValue = reputationInfo.currentStanding
    local isHeader = reputationInfo.isHeader
    local hasRep = reputationInfo.isHeaderWithRep
    local isWatched = reputationInfo.isWatched
    local isChild = reputationInfo.isChild
    local factionID = reputationInfo.factionID
    local hasBonusRepGain = reputationInfo.hasBonusRepGain
    
    local friendReputationInfo = REP:GetFriendFactionDataByID(factionID)
    local isFrend = (friendReputationInfo and friendReputationInfo.isFriend) or false

    if isFrend then
      standingID = standingID + 2
    end

    if (guid and REP_Data.ProfileKeys[guid] and not REP_Data.ProfileKeys[guid].inactiveFactions[factionID]) then
      if (REP.AfterWoD and REP_Orig_IsFactionParagon and REP_Orig_IsFactionParagon(factionID) and REP_Data.Global.ShowParagonBar) then
        local currentValue, threshold, _, _ = REP_Orig_GetFactionParagonInfo(factionID)
        barMax, barValue, standingID = threshold, mod(currentValue, threshold), 9
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

function REP_ReputationDetailFrame_IsShown(flag, flag2, i)
  local name, description, atWarWith, canToggleAtWar, isWatched

  local reputationInfo = REP:GetFactionDataByIndex(REP_Orig_GetSelectedFaction())
  name = reputationInfo.name
  description = reputationInfo.description
  atWarWith = reputationInfo.atWarWith
  canToggleAtWar = reputationInfo.canToggleAtWar
  isWatched = reputationInfo.isWatched

  ReputationDetailFactionName:SetText(name)
  ReputationDetailFactionDescription:SetText(description)

  if (atWarWith) then
    REP_Orig_DetailAtWarCheckBox:SetChecked(true)
  else
    REP_Orig_DetailAtWarCheckBox:SetChecked(false)
  end

  if flag then
    REP_Orig_DetailAtWarCheckBox:Enable()
    REP_Orig_DetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
  else
    REP_Orig_DetailAtWarCheckBox:Disable()
    REP_Orig_DetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
  end  

  if flag2 == 2 then
    if (not isHeader) then
      REP_Orig_DetailInactiveCheckBox:Enable()
      REP_Orig_DetailInactiveCheckBoxText:SetTextColor(REP_Orig_DetailInactiveCheckBoxText:GetFontObject():GetTextColor())
    else
      REP_Orig_DetailInactiveCheckBox:Disable()
      REP_Orig_DetailInactiveCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
    end

    if not REP.AfterShadowLands and i then
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
    end
  end

  if (IsFactionInactive(REP_Orig_GetSelectedFaction())) then
    REP_Orig_DetailInactiveCheckBox:SetChecked(true)
  else
    REP_Orig_DetailInactiveCheckBox:SetChecked(false)
  end

  if (isWatched) then
    REP_Orig_DetailMainScreenCheckBox:SetChecked(true)
  else
    REP_Orig_DetailMainScreenCheckBox:SetChecked(false)
  end
end

function REP_GetReputationGains(factionIndex, factionID)
  if not factionID and not factionIndex then return end
  if factionIndex and type(factionIndex) ~= 'number' then return end
  if factionID and type(factionID) ~= 'number' then return end

  local name, isMajorFaction, isFriend, isCappedFriendship
  local reputationGainsInfo = {}

  local reputationGainedSession, reputationGainedTotal = 0, 0
  local reputationCurrent, reputationNeededCurrent, reputationMissingCurrent, reputationNeededToMax = 0, 0, 0, 0

  if REP.AfterShadowLands then
    isMajorFaction = factionID and REP_Orig_IsMajorFaction(factionID)
  end

  if REP.AfterCata then
    local friendReputationInfo = REP_Friend_Detail(factionID)
    isFriend = friendReputationInfo.isFriend
    isCappedFriendship = friendReputationInfo.isCappedFriendship
  end

  if isFriend then
    if not isCappedFriendship then
      local friendRep, friendMaxRep, friendThreshold, nextFriendThreshold

      if REP.AfterMoP and GetFriendshipReputation and not REP.AfterShadowLands then
        -- friendID, friendRep, friendMaxRep, friendName, friendText, _, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
        _, friendRep, friendMaxRep, _, friendName, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP_Orig_GetFriendshipReputation(factionID)
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
    local majorFactionData = REP_Orig_GetMajorFactionData(factionID)
    name = majorFactionData.name
    isCapped = REP_Orig_HasMaximumRenown(factionID)

    if isCapped then
      local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID) -- TODO CHECK The War Within
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
      
      local maxFactionLevel = 25

      if(REP.MaxFactionLevel[factionID]) then
        maxFactionLevel = REP.MaxFactionLevel[factionID]
      end
      
      local maxRenown = maxFactionLevel * majorFactionData.renownLevelThreshold
      reputationNeededToMax = maxRenown - reputationGainedTotal
    end
  else
    local isParagon = false
    if REP.AfterMoP then
      if (factionID and REP_Orig_IsFactionParagon(factionID)) then
        isParagon = true
      end
    end

    local reputationInfo = {}

    if factionIndex then
      reputationInfo = REP:GetFactionDataByIndex(factionIndex)
    else
      reputationInfo = REP:GetFactionDataByID(factionID)
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
    end

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
      local currentValue, threshold, _, _ = REP_Orig_GetFactionParagonInfo(factionID)
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

  if factionID and REP.factions and REP.factions[factionID] then
    reputationGainedSession = REP.factions[factionID].session
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
  local selectedFactionIndex = REP_Orig_GetSelectedFaction()
  if not selectedFactionIndex or selectedFactionIndex == 0 then return end
  REP:FillReputationDetailFrameWithData()
end

function REP_Friend_Detail(factionID, standingID, factionRow)
  local colorIndex, factionStandingtext, isCappedFriendship, isFriend, friendID
  local friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold

  if REP.AfterCata then
    if (factionID) then
      if REP.AfterMoP and not REP.AfterShadowLands then
        friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold = REP_Orig_GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP_Orig_GetFriendshipReputation(factionID)
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
  friendReputationInfo.barMax = nextFriendThreshold or nil
  friendReputationInfo.barValue = friendRep or nil
  friendReputationInfo.barMin = friendThreshold or nil

  return friendReputationInfo
end

-----------------------------------
-- 17 Listing by standing
-----------------------------------
function REP:ListByStanding(standing)
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, hasRep, isCollapsed, isWatched
  local list = {}

  -- get factions by standing
  for i = 1, REP_Orig_GetNumFactions() do
    name, description, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep = REP_Orig_GetFactionDataByIndex(i)
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
-- 18 extracting Skill information
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
-- 19 classic options
--------------------------
function REP_OnShowOptionFrame()
  if not REP.AfterShadowLands then
    REP_OrderByStandingCheckBox:SetChecked(REP_Data.Global.SortByStanding)
  end
end

function REP_GetFriendFactionRemaining(factionID)
  local friendRep, friendMaxRep
  local bodyguards = {1738, 1740, 1733, 1741, 1737, 1736, 1739}

  if (REP.AfterCata and factionID) then
    if REP.AfterMoP and GetFriendshipReputation and not REP.AfterShadowLands then
      _, friendRep, friendMaxRep, _, _, _, _, _, _ = GetFriendshipReputation(factionID)
    else
      local friendshipInfo = REP_Orig_GetFriendshipReputation(factionID)
      if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
        friendRep = friendshipInfo.standing
        friendMaxRep = friendshipInfo.maxRep

        if friendRep > friendMaxRep and REP.MaxFactionReputation[factionID] then
          friendMaxRep = REP.MaxFactionReputation[factionID]
        end
      end
    end
  end

  -- WoD bodyguards are capped at 20k reputation but GetFriendshipReputation still returns 42k reputation as maximum so we need to check for that and set max to 20k
  if tContains(bodyguards, factionID) then
    friendMaxRep = 20000
  end

  return friendMaxRep - friendRep
end

----------------------------------------------
-- 20 Trigger ReputationFrame Update
----------------------------------------------
function REP:CustomTriggerReputationFrameUpdate()
  if REP.AfterShadowLands then
    ReputationFrame_Update()
  else
    REP_ReputationFrame_Update()
  end
end

----------------------------------------------
-- SetFactionActive Or SetFactionInactive
----------------------------------------------
function REP:CustomSetFactionActiveOrInactive(isChecked, factionIndex)
  if not factionIndex then return end

  local shouldBeActive = not isChecked
  local reputationInfo = REP:GetFactionDataByIndex(factionIndex)

  if not reputationInfo then return end

  local name = reputationInfo.name
  local isHeader = reputationInfo.isHeader
  local factionID = reputationInfo.factionID

  if (REP_Orig_ReputationDetailFrame:IsShown() and isChecked) then
    REP_Orig_ReputationDetailFrame:Hide()
  end

  if REP.AfterDragonflight then
    C_Reputation.SetFactionActive(factionIndex, shouldBeActive)
  else
    if shouldBeActive then
      SetFactionActive(factionIndex)
    else
      SetFactionInactive(factionIndex)
    end   

    if REP.AfterShadowLands then
      ReputationFrame_Update()
    else
      REP_ReputationFrame_Update()
    end
  end

  if (factionID) then
    local guid = UnitGUID("player")
    
    if not REP_Data.ProfileKeys[guid].inactiveFactions then REP_Data.ProfileKeys[guid].inactiveFactions = {} end

    if shouldBeActive then
      REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = nil
    else
      REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = true
    end
  end

  REP:PlayCheckBoxSound(isChecked)
end

--------------------------
-- 21 rep Main window
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
    local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = REP_Orig_GetFactionDataByIndex(OBS_fi_i)
    
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
      if (factionID and REP_Orig_IsFactionParagon(factionID)) then
        isParagon = true
  
        local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()
        local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
  
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
          local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
          barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
        end
      end
    end

    if(isParagon and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
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
      if ((barMax - barValue) ~= 0 and isParagon and REP_Data.Global.ShowParagonBar) then
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
      if(isParagon and REP_Data.Global.ShowParagonBar) then
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

    if(REP.AfterMoP) then
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

    if (OBS_fi_i == REP_Orig_GetSelectedFaction()) then
      if (REP_Orig_ReputationDetailFrame and REP_Orig_ReputationDetailFrame:IsVisible()) then
        local flag = canToggleAtWar and 1 or nil
        REP_ReputationDetailFrame_IsShown(flag, 1)

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
    local reputationInfo = REP_Orig_GetFactionDataByIndex(factionIndex)
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
    name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = REP_Orig_GetFactionDataByIndex(factionIndex)
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
    if (factionID and REP_Orig_IsFactionParagon(factionID)) then
      isParagon = true

      local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
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
  if(isParagon and REP_Data.Global.ShowParagonBar) then
    local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
    barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
  end

  -- Normalize Values
  barMax = barMax - barMin
  barValue = barValue - barMin
  barMin = 0

  if(isParagon and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
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
    if ((barMax - barValue) ~= 0 and isParagon and REP_Data.Global.ShowParagonBar) then
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
    if(isParagon and REP_Data.Global.ShowParagonBar) then
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

  if(REP.AfterMoP) then
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

  if (factionIndex == REP_Orig_GetSelectedFaction()) then
    if (ReputationDetailFrame:IsShown()) then
      if (canToggleAtWar and (not isHeader)) then local flag = 1 end
      REP_ReputationDetailFrame_IsShown(flag, 2)
    end

    if (REP_Orig_ReputationDetailFrame and REP_Orig_ReputationDetailFrame:IsVisible()) then
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

  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = REP_Orig_GetFactionDataByIndex(OBS_fi_i)
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

    if (OBS_fi_i == REP_Orig_GetSelectedFaction()) then
      if (REP_Orig_ReputationDetailFrame and REP_Orig_ReputationDetailFrame:IsVisible()) then
        local flag = canToggleAtWar and 1 or nil
        REP_ReputationDetailFrame_IsShown(flag, 1)

        REP:Rep_Detail_Frame()

        _G["ReputationBar"..i.."Highlight1"]:Show()
        _G["ReputationBar"..i.."Highlight2"]:Show()
      end
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
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = REP_Orig_GetFactionDataByIndex(factionIndex)
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

    if (factionIndex == REP_Orig_GetSelectedFaction()) then
      if (REP_Orig_ReputationDetailFrame and REP_Orig_ReputationDetailFrame:IsVisible()) then
        REP_ReputationDetailFrame_IsShown(1, 2)

        REP:Rep_Detail_Frame()

        _G["ReputationBar"..i.."Highlight1"]:Show()
        _G["ReputationBar"..i.."Highlight2"]:Show()
      end
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
  local name, _, _, _, _ = GetWatchedFactionInfo()
  local watchedFactionName = name
  local factionIndex = nil
  local toExalted, ToBFF = 0, 0
  local repValue, repMax, origBarValue, repFactionStandingtext, isRepParagon, isRepFriend, isRepCappedFriendship

  for i = 1, REP_Orig_GetNumFactions(), 1 do
    local index = i
    local name, _, standingID, _, barMax, barValue, _, _, _, _, _, _, _, factionID, _, _ = REP_Orig_GetFactionDataByIndex(index)
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
      isRepParagon = REP_Orig_IsFactionParagon(factionID)
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

    if (not REP_Orig_ReputationDetailFrame:IsVisible()) then REP_Orig_ReputationDetailFrame:Show() end

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
