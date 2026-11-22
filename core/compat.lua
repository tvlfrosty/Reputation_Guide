-------------------------------------------------------------------------------
-- API compatibility layer
-- Wraps Blizzard API functions that differ (or were removed) between game flavors,
-- so the rest of the addon can call one function regardless of the client.
-------------------------------------------------------------------------------
local addonName, REP = ...

---------------------------
-- Events --
---------------------------
function REP:RegisterEventSafe(frame, event)
  if not frame or not event then return false end

  if C_EventUtils and C_EventUtils.IsEventValid and not C_EventUtils.IsEventValid(event) then
    return false
  end

  return pcall(frame.RegisterEvent, frame, event)
end

-- Only events of the given unit (for example only the player's auras instead of every unit around).
function REP:RegisterUnitEventSafe(frame, event, unit)
  if not frame or not event then return false end

  if C_EventUtils and C_EventUtils.IsEventValid and not C_EventUtils.IsEventValid(event) then
    return false
  end

  if frame.RegisterUnitEvent and pcall(frame.RegisterUnitEvent, frame, event, unit) then
    return true
  end

  return pcall(frame.RegisterEvent, frame, event)
end

function REP:AddChatMessageEventFilter(event, filter)
  if ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter then
    ChatFrameUtil.AddMessageEventFilter(event, filter)
  elseif ChatFrame_AddMessageEventFilter then
    ChatFrame_AddMessageEventFilter(event, filter)
  end
end

---------------------------
-- Addon metadata --
---------------------------
function REP:GetAddOnMetadata(name, field)
  if C_AddOns and C_AddOns.GetAddOnMetadata then
    return C_AddOns.GetAddOnMetadata(name, field)
  elseif GetAddOnMetadata then
    return GetAddOnMetadata(name, field)
  end
end

---------------------------
-- Auras --
---------------------------
function REP:PlayerHasAura(spellID)
  if not spellID then return false end

  if C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID then
    local ok, aura = pcall(C_UnitAuras.GetPlayerAuraBySpellID, spellID)
    return (ok and aura) and true or false
  end

  if UnitBuff then
    for i = 1, 40 do
      local name, _, _, _, _, _, _, _, _, auraSpellID = UnitBuff("player", i)
      if not name then break end
      if auraSpellID == spellID then return true end
    end
  end

  return false
end

---------------------------
-- Quest log --
---------------------------
function REP:GetNumQuestLogEntries()
  if C_QuestLog and C_QuestLog.GetNumQuestLogEntries then
    return C_QuestLog.GetNumQuestLogEntries() or 0
  elseif GetNumQuestLogEntries then
    return GetNumQuestLogEntries() or 0
  end

  return 0
end

-- Returns title, isHeader, isComplete for a quest log index.
function REP:GetQuestLogEntry(index)
  if C_QuestLog and C_QuestLog.GetInfo then
    local info = C_QuestLog.GetInfo(index)
    if not info then return end

    local isComplete = false
    if not info.isHeader and info.questID and C_QuestLog.IsComplete then
      isComplete = C_QuestLog.IsComplete(info.questID) and true or false
    end

    return info.title, info.isHeader, isComplete
  elseif GetQuestLogTitle then
    local title, _, _, isHeader, _, isComplete = GetQuestLogTitle(index)
    return title, isHeader, (isComplete == 1 or isComplete == true)
  end
end

-- Quest titles don't change during a session, they're looked up once.
local questTitleCache = {}
REP.WaitingForQuestData = false

function REP:GetQuestTitleByID(questID)
  if not questID then return end
  if questTitleCache[questID] then return questTitleCache[questID] end

  local title = REP:LookupQuestTitleByID(questID)
  if title then questTitleCache[questID] = title end

  return title
end

function REP:LookupQuestTitleByID(questID)

  if C_QuestLog then
    if C_QuestLog.GetTitleForQuestID then
      local title = C_QuestLog.GetTitleForQuestID(questID)
      if title and title ~= "" then return title end

      if C_QuestLog.RequestLoadQuestByID then
        -- The title arrives with QUEST_DATA_LOAD_RESULT, the details are refreshed then.
        C_QuestLog.RequestLoadQuestByID(questID)
        REP.WaitingForQuestData = true
      end
    elseif C_QuestLog.GetQuestInfo then
      local title = C_QuestLog.GetQuestInfo(questID)
      if type(title) == "string" and title ~= "" then return title end
    end
  end

  if REP_HiddenQuestTooltip and (REP.AfterTBC or REP.UseModernAPI) then
    REP_HiddenQuestTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
    REP_HiddenQuestTooltip:SetHyperlink(format("quest:%d", questID))
    local line = _G["REP_HiddenQuestTooltipTextLeft1"]
    local title = line and line:GetText()
    REP_HiddenQuestTooltip:Hide()
    if title and title ~= "" then return title end
  end
end

---------------------------
-- Skills --
---------------------------
-- Returns a list with the names of all skill lines (professions, secondary skills) of the player.
function REP:GetSkillLineNames()
  local names = {}

  if C_SkillInfo and C_SkillInfo.GetNumSkillLines and C_SkillInfo.GetSkillLineInfo then
    for i = 1, C_SkillInfo.GetNumSkillLines() or 0 do
      local info = C_SkillInfo.GetSkillLineInfo(i)
      if info and info.name and not info.isHeader then
        table.insert(names, info.name)
      end
    end
  elseif GetNumSkillLines and GetSkillLineInfo then
    for i = 1, GetNumSkillLines() do
      local name, isHeader = GetSkillLineInfo(i)
      if name and not isHeader then
        table.insert(names, name)
      end
    end
  elseif GetProfessions and GetProfessionInfo then
    for _, index in pairs({GetProfessions()}) do
      local name = GetProfessionInfo(index)
      if name then table.insert(names, name) end
    end
  end

  return names
end

---------------------------
-- Factions --
---------------------------
-- Order by Standing is saved per character (REP_Data.ProfileKeys[guid].SortByStanding).
local function GetCharacterProfile()
  local guid = UnitGUID and UnitGUID("player")
  if not guid or not REP_Data then return end
  REP_Data.ProfileKeys = REP_Data.ProfileKeys or {}
  REP_Data.ProfileKeys[guid] = REP_Data.ProfileKeys[guid] or {}
  return REP_Data.ProfileKeys[guid]
end

function REP:GetSortByStanding()
  local profile = GetCharacterProfile()
  return profile and profile.SortByStanding and true or false
end

function REP:SetSortByStanding(enabled)
  local profile = GetCharacterProfile()
  if profile then profile.SortByStanding = enabled and true or false end
end

function REP:GetCharacterProfile() return GetCharacterProfile() end

function REP_GetSortByStanding() return REP:GetSortByStanding() end
function REP_SetSortByStanding(enabled) REP:SetSortByStanding(enabled) end

-- Paragon only counts from Exalted on: max renown for renown factions, the highest level for friendships.
-- Factions with a paragon track below Exalted show their normal standing and values.
function REP:IsAtParagon(factionID, reaction)
  if not factionID or not REP.Orig_IsFactionParagon or not REP.Orig_IsFactionParagon(factionID) then return false end

  if REP.Orig_IsMajorFaction and REP.Orig_IsMajorFaction(factionID) then
    return REP.Orig_HasMaximumRenown and REP.Orig_HasMaximumRenown(factionID) and true or false
  end

  local friend = REP.GetFriendFactionDataByID and REP:GetFriendFactionDataByID(factionID)
  if friend then return friend.isCappedFriendship and true or false end

  if not reaction then
    local data = REP:GetFactionDataByID(factionID)
    reaction = data and data.reaction
  end

  return (reaction or 0) >= 8
end

function REP:IsFactionInactiveByIndex(factionIndex)
  if not factionIndex or factionIndex == 0 then return false end

  if C_Reputation and C_Reputation.IsFactionActive then
    return C_Reputation.IsFactionActive(factionIndex) == false
  elseif IsFactionInactive then
    return IsFactionInactive(factionIndex) and true or false
  end

  return false
end




---------------------------
-- Selected faction (addon details panel) --
---------------------------
-- In the modern reputation UI the selected faction is reset as soon as the default side pane hides,
-- so the selection is tracked by factionID instead.
REP.SelectedFactionID = nil

function REP:GetFactionIndexByID(factionID)
  if not factionID then return 0 end

  for i = 1, REP.Orig_GetNumFactions() do
    local factionData = REP:GetFactionDataByIndex(i)
    if factionData and factionData.factionID == factionID then
      return i
    end
  end

  return 0
end

function REP:GetSelectedFactionData()
  if REP.UseDetailPanel then
    if REP.SelectedFactionID then
      return REP:GetFactionDataByID(REP.SelectedFactionID)
    end

    return
  end

  return REP:GetFactionDataByIndex(REP.Orig_GetSelectedFaction())
end

function REP:HasSelectedFaction()
  if REP.UseDetailPanel then
    return REP.SelectedFactionID ~= nil
  end

  local index = REP.Orig_GetSelectedFaction and REP.Orig_GetSelectedFaction()
  return index ~= nil and index ~= 0
end

---------------------------------------------------------------------------------------------
-- Locales: texts missing in the client language fall back to the English texts.
---------------------------------------------------------------------------------------------
local function InheritTexts(texts, defaults, seen)
  if type(texts) ~= "table" or type(defaults) ~= "table" or texts == defaults or seen[texts] then return end
  seen[texts] = true

  for key, value in pairs(defaults) do
    if type(value) == "table" and type(rawget(texts, key)) == "table" then
      InheritTexts(texts[key], value, seen)
    end
  end

  if not getmetatable(texts) then
    setmetatable(texts, { __index = defaults })
  end
end

InheritTexts(REP_TXT, REP.DefaultTXT, {})
