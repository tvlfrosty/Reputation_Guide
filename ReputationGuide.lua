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
REP.Main = nil
REP.InitComplete = nil
REP.VarsLoaded = nil
REP.InitStages = 0
REP.difficultyID = 0
REP.OnLoadingScreen = false
---- Faction information
---- Tracking data
REP.Entries = {}
REP.UpdateList = {}

REP._pendingRepUpdate = false
REP._repUpdateTimer = nil

------------------------
-- 01 Addon Startup --
------------------------
function REP_OnLoad(self)
  REP.Main = self
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
    ShowStandingBar = true,
    AllowDetailResize = true,
    ShowDetailDescription = true,
    ShowDetailStatistics = true,
    ExpandSourcesByDefault = false,
    DetailListFontSize = "normal",
    DetailBackgroundAlpha = 1,
    ShowMobs = true,
    OriginalCollapsed = {},
    ShowMissing = true,
    ShowItems = true,
    ShowPreviewRep = true,
    ShowGeneral = true,
    SortByStanding = false,
    ShowSyncMessages = true,
    ShowBonusGainsInChat = false,
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
    REP.IsClassic = true
    REP:SetClientFlavorFlags()
  end

  REP:GetExternalAddonsStatus()
end

function REP:SetOriginalFunctionsBasedOnExpansion()
  REP.Orig_ReputationFrame_Update = ReputationFrame_Update
  REP.Orig_ReputationBar_OnClick = ReputationBar_OnClick

  if ReputationFrameStandingLabel then
    REP.Orig_StandingText = ReputationFrameStandingLabel:GetText()
  end

  if (not REP.UseScrollBoxReputationUI) then
    ReputationFrame_Update = REP_ReputationFrame_Update
    ReputationBar_OnClick = REP_ReputationBar_OnClick
  end

  REP.Orig_GetFactionParagonInfo = C_Reputation.GetFactionParagonInfo
  REP.Orig_IsFactionParagon = C_Reputation.IsFactionParagon
  REP.Orig_GetFriendshipReputation = C_GossipInfo.GetFriendshipReputation

  if REP.UseModernReputationUI then
    REP.Orig_GetNumFactions = C_Reputation.GetNumFactions
    REP.Orig_GetFactionDataByIndex = C_Reputation.GetFactionDataByIndex
    REP.Orig_GetFactionDataByID = C_Reputation.GetFactionDataByID
    REP.Orig_ExpandAllFactionHeaders = C_Reputation.ExpandAllFactionHeaders

    -- Blizzard functions are never replaced on modern clients, that taints the default UI (secret values in Midnight).
    REP.Orig_ExpandFactionHeader = C_Reputation.ExpandFactionHeader
    REP.Orig_CollapseFactionHeader = C_Reputation.CollapseFactionHeader

    REP.Orig_GetWatchedFactionData = C_Reputation.GetWatchedFactionData
    REP.Orig_SetWatchedFaction = C_Reputation.SetWatchedFactionByID -- Uses FactionID since 11.0.0
    REP.Orig_SetSelectedFaction = C_Reputation.SetSelectedFaction

    -- With the addon details panel the selection is kept by factionID, the default UI clears its selection when its own details hide.
    REP.Orig_GetSelectedFaction = function()
      if REP.UseDetailPanel then
        return REP:GetFactionIndexByID(REP.SelectedFactionID)
      end

      return C_Reputation.GetSelectedFaction()
    end
  else
    REP.Orig_GetNumFactions = GetNumFactions
    REP.Orig_GetFactionDataByIndex = GetFactionInfo

    if not REP.Orig_CollapseFactionHeader and type(CollapseFactionHeader) == "function" then
      REP.Orig_CollapseFactionHeader = CollapseFactionHeader
      CollapseFactionHeader = REP_CollapseFactionHeader
    end

    REP.Orig_GetWatchedFactionData = GetWatchedFactionData
    REP.Orig_GetSelectedFaction = GetSelectedFaction
    REP.Orig_SetSelectedFaction = SetSelectedFaction

    if REP.AfterClassic then
      if C_Reputation.SetWatchedFaction then
        REP.Orig_SetWatchedFaction = C_Reputation.SetWatchedFaction -- Uses FactionID up till 11.0.0, later replaced with C_Reputation.SetWatchedFactionByID
      else
        REP.Orig_SetWatchedFaction = SetWatchedFactionIndex -- Uses FactionIndex up till 11.0.0 incase C_Reputation.SetWatchedFaction is not available.
      end 
    else
      REP.Orig_SetWatchedFaction = SetWatchedFactionIndex -- Uses FactionIndex up till 11.0.0 incase C_Reputation.SetWatchedFaction is not available.
    end

    if REP.AfterWotlk then
      REP.Orig_GetFactionDataByID = GetFactionInfoByID
      REP.Orig_ExpandAllFactionHeaders = ExpandAllFactionHeaders
    end

    if not REP.Orig_ExpandFactionHeader and type(ExpandFactionHeader) == "function" then
      REP.Orig_ExpandFactionHeader = ExpandFactionHeader
      ExpandFactionHeader = REP_ExpandFactionHeader
    end

    -----------------------------
    -- Detail frame checkboxes --
    -----------------------------
    if ReputationDetailAtWarCheckBox then
      REP.Orig_DetailAtWarCheckBox = ReputationDetailAtWarCheckBox
      REP.Orig_DetailInactiveCheckBox = ReputationDetailInactiveCheckBox
      REP.Orig_DetailMainScreenCheckBox = ReputationDetailMainScreenCheckBox

      REP.Orig_DetailAtWarCheckBoxText = ReputationDetailAtWarCheckBoxText
      REP.Orig_DetailInactiveCheckBoxText = ReputationDetailInactiveCheckBoxText
    else
      REP.Orig_DetailAtWarCheckBox = ReputationDetailAtWarCheckbox
      REP.Orig_DetailInactiveCheckBox = ReputationDetailInactiveCheckbox
      REP.Orig_DetailMainScreenCheckBox = ReputationDetailMainScreenCheckbox

      REP.Orig_DetailAtWarCheckBoxText = ReputationDetailAtWarCheckboxText
      REP.Orig_DetailInactiveCheckBoxText = ReputationDetailInactiveCheckboxText
    end
  end

  if REP.UseScrollBoxReputationUI then
    REP.Orig_IsMajorFaction = C_Reputation.IsMajorFaction
    REP.Orig_GetMajorFactionIDs = C_MajorFactions.GetMajorFactionIDs
    REP.Orig_GetMajorFactionData = C_MajorFactions.GetMajorFactionData
    REP.Orig_HasMaximumRenown = C_MajorFactions.HasMaximumRenown
  end
end

------------------------
-- 02 Event Handler --
------------------------
function REP_OnEvent(self, event, ...)
  if (event == "LOADING_SCREEN_ENABLED") then
    REP.OnLoadingScreen = true
  end

  if (event == "LOADING_SCREEN_DISABLED") then
    REP.OnLoadingScreen = false
    REP:FlushAfterLoadingScreen()
    -- Removed due to it causing some random situations where the script takes too long, might look for long term fix later on.
    -- REP:DumpReputationChangesToChatForAllFactions() -- Just to make sure we don't miss printing out any rep gain that occured during the loading screen
    REP:TakeReputationSnapshot()
  end

  local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13 = ...

  if (event == "ADDON_LOADED") and (arg1 == addonName) then
    REP:SetOriginalFunctionsBasedOnExpansion();
    REP.Main:UnregisterEvent("ADDON_LOADED")
    REP.InitStages = REP.InitStages + 1
    REP:Init()
  elseif (event == "VARIABLES_LOADED") then
    REP_OnShowOptionFrame()
    REP.VarsLoaded = true
    REP.InitStages = REP.InitStages + 2
    REP:Init()
  elseif (event == "PLAYER_LOGIN") then
    REP.Main:UnregisterEvent("PLAYER_LOGIN")
    REP.InitStages = REP.InitStages + 4
    REP:Init()
  elseif (event == "PLAYER_ENTERING_WORLD") then
    REP.InitStages = REP.InitStages + 8
    REP:Init()

    if not REP.Orig_GetFactionDataByID then
      REP:SetOriginalFunctionsBasedOnExpansion()
    end

    local isInitialLogin, isReloadingUi = arg1, arg2
    REP:GetExternalAddonsStatus()
    REP.UseDetailPanel = REP.UseModernReputationUI and not REP.hasPrettyRepsLoaded

    REP:IndexFactions(isInitialLogin, isReloadingUi)
    
    REP:RenderAddonSettingsFrame()
    REP:RenderProfileFrames()

    REP.Main:UnregisterEvent("PLAYER_ENTERING_WORLD")
    REP:RegisterEventSafe(REP.Main, "UPDATE_FACTION")
    REP:RegisterEventSafe(REP.Main, "COMBAT_TEXT_UPDATE")
    -- to keep item list up to date
    REP:RegisterEventSafe(REP.Main, "BAG_UPDATE")
    REP:RegisterEventSafe(REP.Main, "BANKFRAME_OPENED")
    REP:RegisterEventSafe(REP.Main, "BANKFRAME_CLOSED")

    REP:RegisterUnitEventSafe(REP.Main, "UNIT_AURA", "player")

    -- to keep list of known skills up to date
    REP:RegisterEventSafe(REP.Main, "CHAT_MSG_SKILL")
    REP:RegisterEventSafe(REP.Main, "SKILL_LINES_CHANGED")
    REP:RegisterEventSafe(REP.Main, "QUEST_COMPLETE")
    REP:RegisterEventSafe(REP.Main, "QUEST_WATCH_UPDATE")
    -- reputation gains from sources that aren't in the data
    REP:InitSourceRecording()
    -- new chat hook system
    REP:AddChatMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", REP_ChatFilter)
    REP:AddChatMessageEventFilter("COMBAT_TEXT_UPDATE", REP_ChatFilter)
    -- to keep dungeon Difficulty up to date
    if REP.AfterClassic then REP:RegisterEventSafe(REP.Main, "PLAYER_DIFFICULTY_CHANGED") end
    -- Quest titles that weren't cached yet by the client
    REP:RegisterEventSafe(REP.Main, "QUEST_DATA_LOAD_RESULT")
    -- Recast for tradeskill
    if(not REP.UseModernAPI) then REP:RegisterEventSafe(REP.Main, "UPDATE_TRADESKILL_RECAST") end
    -- to keep the Garrison up to date
    if REP.AfterMoP then REP:RegisterEventSafe(REP.Main, "GARRISON_UPDATE") end

    if(REP.UseScrollBoxReputationUI) then
      REP:RegisterEventSafe(REP.Main, "MAJOR_FACTION_RENOWN_LEVEL_CHANGED")
      REP:RegisterEventSafe(REP.Main, "MAJOR_FACTION_UNLOCKED")
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
  elseif (REP:IsFactionUpdateEvent(event) or event == "QUEST_COMPLETE" or event == "QUEST_WATCH_UPDATE") then    
    -- Only print reputation changes on faction updates
    if REP:IsFactionUpdateEvent(event) then
      if REP._pendingRepUpdate then return end

      REP._pendingRepUpdate = true

      REP._repUpdateTimer = C_Timer.After(0.1, function()
        REP._pendingRepUpdate = false
        REP._repUpdateTimer = nil

        REP:DumpReputationChangesToChatOnUpdate()
      end)
    end
    
    if (ReputationFrame:IsVisible() and not REP.UseModernReputationUI) then
      ReputationFrame_Update()
    end

    if (REP:HasSelectedFaction() and REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
      if REP.UseDetailPanel then
        REP:RequestDetailFrameRefresh()
      else
        REP_BuildUpdateList()
        REP_UpdateList_Update()
      end
    end
  elseif (event == "BAG_UPDATE") then
    if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
      if REP.UseModernReputationUI then
        REP:RequestDetailFrameRefresh()
      else
        -- Update rep frame (implicitely updates detail frame which In turn implicitely reparses bag contents)
        REP:RequestClassicReputationFrameUpdate()
      end
    end
  elseif (event == "BANKFRAME_OPENED") then
    REP.BankOpen = true
  elseif (event == "BANKFRAME_CLOSED") then
    -- this is fired twice when closing the bank window, bank contents only available at the first Event
    if (REP.BankOpen) then
      -- this is the first call
      REP.BankOpen = nil
      if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible() and not REP.UseModernReputationUI) then
        -- Update rep frame (implicitely updates detail frame which In turn implicitely reparses bag contents)
        ReputationFrame_Update()
      end
    end
  elseif (event == "PLAYER_DIFFICULTY_CHANGED") then
    -- REP:Print("PLAYER_DIFFICULTY_CHANGED", nil)
  elseif (event == "CHAT_MSG_SKILL") or (event == "SKILL_LINES_CHANGED") or (event == "UPDATE_TRADESKILL_RECAST") then
    REP:ExtractSkills()
    if (ReputationFrame:IsVisible() and not REP.UseModernReputationUI) then
      ReputationFrame_Update()
    end
    if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
      REP_BuildUpdateList()
      REP_UpdateList_Update()
    end
  elseif (event == "QUEST_DATA_LOAD_RESULT") then
    if REP.WaitingForQuestData and REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible() then
      REP.WaitingForQuestData = false
      if REP.UseDetailPanel then
        REP:RequestDetailFrameRefresh()
      else
        REP_BuildUpdateList()
        REP_UpdateList_Update()
      end
    end
  elseif (event == "UNIT_AURA") then
    local unit = ...
    if unit == "player" then REP:RequestReputationBuffCheck() end
  elseif (event == "GARRISON_UPDATE") then
    -- Get garrison buildings to check for trading post
    local garrisonBuildings
    local garrisonTypes = Enum and Enum.GarrisonType or {}
    local garrisonType = garrisonTypes.Type_6_0_Garrison or garrisonTypes.Type_6_0

    if C_Garrison and C_Garrison.GetBuildings and garrisonType then
      garrisonBuildings = C_Garrison.GetBuildings(garrisonType)
    end

    local hadTradingPost = REP.HasTradingPost

    for i, building in pairs(garrisonBuildings or {}) do
      if building["buildingID"] == 145 then
        REP.HasTradingPost = true
      end
    end

    -- The trading post bonus is applied when the sources list is built, refresh it when the trading post was found.
    if REP.InitComplete and REP.HasTradingPost and not hadTradingPost then
      REP:RequestDetailFrameRefresh()
    end

    REP.Main:UnregisterEvent("GARRISON_UPDATE")
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
  if REP.InitComplete or REP._initScheduled then return end

  -- ADDON_LOADED + VARIABLES_LOADED + PLAYER_LOGIN + PLAYER_ENTERING_WORLD. GARRISON_UPDATE isn't waited for,
  -- it doesn't fire for every character (the addon would never finish loading), it updates the data when it arrives.
  if (REP.InitStages < 15) then return end

  -- Loading all reputation sources is heavy, do it once the loading screen is gone so it doesn't make it longer.
  REP._initScheduled = true
  REP:RunAfterLoadingScreen(function() REP:RunInit() end)
end

-- Work that waits for the end of the (first) loading screen. LOADING_SCREEN_DISABLED fires after
-- PLAYER_ENTERING_WORLD; when it doesn't come (or came before this addon was loaded) a timer takes over.
local afterLoadingScreen = {}
local LOADING_SCREEN_FALLBACK = 5

function REP:RunAfterLoadingScreen(func)
  if REP.LoadingScreenDone then
    C_Timer.After(0, func)
    return
  end

  table.insert(afterLoadingScreen, func)
  if not REP._loadingScreenFallback then
    REP._loadingScreenFallback = true
    C_Timer.After(LOADING_SCREEN_FALLBACK, function() REP:FlushAfterLoadingScreen() end)
  end
end

function REP:FlushAfterLoadingScreen()
  if REP.LoadingScreenDone then return end
  REP.LoadingScreenDone = true

  local queue = afterLoadingScreen
  afterLoadingScreen = {}
  -- One per frame, so they don't all land in the same frame.
  for i, func in ipairs(queue) do C_Timer.After(0.05 * i, func) end
end

function REP:RunInit()
  if REP.InitComplete then return end

  local version = REP:GetAddOnMetadata(addonName, "Version")

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
  changed = changed + REP:InitVariable("ShowStandingBar", true)
  changed = changed + REP:InitVariable("AllowDetailResize", true)
  changed = changed + REP:InitVariable("ShowDetailDescription", true)
  changed = changed + REP:InitVariable("ShowDetailStatistics", true)
  changed = changed + REP:InitVariable("ExpandSourcesByDefault", false)
  changed = changed + REP:InitVariable("DetailListFontSize", "normal")
  changed = changed + REP:InitVariable("DetailBackgroundAlpha", 1)
  changed = changed + REP:InitVariable("WriteChatMessage", true)
  changed = changed + REP:InitVariable("ShowPreviewRep", true)
  changed = changed + REP:InitVariable("SwitchFactionBar", true)
  changed = changed + REP:InitVariable("SilentSwitch", true)
  changed = changed + REP:InitVariable("ShowAllFactionsGains", true)
  changed = changed + REP:InitVariable("ShowSyncMessages", true)

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

  if not REP.UseScrollBoxReputationUI then
    REP_OrderByStandingCheckBoxText:SetText(REP_TXT.orderByStanding)
  elseif REP_OrderByStandingCheckBox then
    -- Modern reputation frame: only with the addon's ordered list (UI/ReputationGuideSortedList.lua).
    if REP_SortedReputationList then
      REP_OrderByStandingCheckBoxText:SetText(REP_TXT.orderByStanding)
      REP_OrderByStandingCheckBox:SetChecked(REP:GetSortByStanding() and true or false)
      REP_OrderByStandingCheckBox:Show()
    else
      REP_OrderByStandingCheckBox:Hide()
    end
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
 
  REP:InitOrCheckSavedVariables()

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

    if REP.UseModernReputationUI then
      REP:HookFactionFrameMixinBar()
    end

    REP.InitComplete = true

    -- Buffs that ran out while logged out are switched off again (auras are available a moment after login).
    C_Timer.After(3, function() REP:CheckActiveReputationBuffs() end)
  end
end

function REP:InitOrCheckSavedVariables()
  local guid = UnitGUID("player")

  if not REP_Data.ProfileKeys then REP_Data.ProfileKeys = {} end
  if not REP_Data.ProfileKeys[guid] then REP_Data.ProfileKeys[guid] = {} end
  if not REP_Data.ProfileKeys[guid].quests then REP_Data.ProfileKeys[guid].quests = {} end
  if not REP_Data.ProfileKeys[guid].factions then REP_Data.ProfileKeys[guid].factions = {} end
  if not REP_Data.ProfileKeys[guid].inactiveFactions then REP_Data.ProfileKeys[guid].inactiveFactions = {} end
end

----------------------------------------------
-- 07 UI Changes based on current expansion --
----------------------------------------------
function REP:MakeUIChanges()
  if REP.IsClassic and not REP.UseModernReputationUI then
    ReputationDetailAtWarCheckBox = ReputationDetailAtWarCheckbox
    ReputationDetailAtWarCheckBoxText = ReputationDetailAtWarCheckboxText

    ReputationDetailInactiveCheckBox = ReputationDetailInactiveCheckbox
    ReputationDetailInactiveCheckBoxText = ReputationDetailInactiveCheckboxText

    ReputationDetailMainScreenCheckBox = ReputationDetailMainScreenCheckbox
    ReputationDetailMainScreenCheckBoxText = ReputationDetailMainScreenCheckboxText
  end

  REP:ChangeReputationDetailFrameUI()

  if REP.IsForever then
    REP_OptionsButton:ClearAllPoints()
    if CharacterFrame and CharacterFrame.LeftPaneHost then
      REP_OptionsButton:SetPoint("TOPRIGHT", CharacterFrame.LeftPaneHost, "TOPRIGHT", -34, -6)
    else
      REP_OptionsButton:SetPoint("TOPLEFT", ReputationFrame, "TOPLEFT", 70, -28)
    end
    REP_OptionsButton:SetFrameLevel(ReputationFrame:GetFrameLevel() + 20)
  elseif REP.AfterWotlk then
    if REP.UseModernReputationUI then
      REP_OptionsButton:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -320, -22)
    else
      REP_OptionsButton:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -2, -22)
    end

    if not REP.UseScrollBoxReputationUI then
      REP_OrderByStandingCheckBox:SetPoint("TOPLEFT", ReputationFrame, "TOPLEFT", 55, -20)
    end
  end

  -- ElvUI: the parts that aren't skinned where they are created (profile buttons, Order by Standing).
  REP:SetReputationDetailFrameAndOptionsSkins()
end
