----------------------------------------------------------
-- Reputation Guide | Recording unknown reputation sources --
-- Reputation gains from sources that aren't in the data are saved account wide in
-- REP_Data.Global.RecordedSources[factionID] = { name = "Faction", sources = { { type = "Quest", id = 123, rep = 250, standing = 5, ... } } }
-- Manually added sources (REP_Data.Global.ManualSources) are part of the sources list like the data.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

local WINDOW = 3 -- seconds between the action (turn-in, kill, item use) and the reputation gain
local MAX_PER_FACTION = 500 -- recorded sources per faction (the saved variables stay small)
local SKIPPED_FACTIONS = { [1168] = true } -- guild: every quest gives guild reputation

local recent = {}
local pendingQuestID

local function IsSecret(value)
  return issecretvalue and issecretvalue(value) or false
end

local function IsRecent(action)
  return action and (GetTime() - action.time) <= WINDOW
end

local function NpcIDFromGUID(guid)
  if type(guid) ~= "string" or IsSecret(guid) then return end
  local unitType, _, _, _, _, npcID = strsplit("-", guid)
  if unitType == "Creature" or unitType == "Vehicle" then return tonumber(npcID) end
end

local function GetZone()
  local zone = GetRealZoneText and GetRealZoneText()
  if IsSecret(zone) or zone == "" then zone = nil end

  local mapID = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
  if IsSecret(mapID) then mapID = nil end

  return zone, mapID
end

local function GetInstance()
  if not IsInInstance then return end
  local inInstance, instanceType = IsInInstance()
  if not inInstance or (instanceType ~= "party" and instanceType ~= "raid") then return end

  local name, _, _, _, _, _, _, instanceID = GetInstanceInfo()
  if IsSecret(name) then name = nil end
  if IsSecret(instanceID) then instanceID = nil end
  return instanceID, name
end

---------------------------
-- Saved variables
---------------------------
function REP:IsRecordingSources()
  return REP_Data and REP_Data.Global and REP_Data.Global.RecordSources ~= false
end

local function GetStore(key)
  if not REP_Data or not REP_Data.Global then return end
  REP_Data.Global[key] = REP_Data.Global[key] or {}
  return REP_Data.Global[key]
end

---------------------------
-- Standing as the sources list uses it
---------------------------
-- Normal factions: 1 (Hated) - 8 (Exalted, also at paragon), renown factions: the renown level,
-- friendships: the reaction + 2 (as the sources list does).
function REP:GetSourceStanding(factionID)
  if not factionID then return end

  if REP.Orig_IsMajorFaction and REP.Orig_IsMajorFaction(factionID) then
    local data = REP.Orig_GetMajorFactionData and REP.Orig_GetMajorFactionData(factionID)
    return data and data.renownLevel, "renown"
  end

  local factionData = REP:GetFactionDataByID(factionID)
  if not factionData or not factionData.reaction then return end

  if REP:GetFriendFactionDataByID(factionID) then
    return factionData.reaction + 2, "friendship"
  end

  local isParagon = REP:IsAtParagon(factionID, factionData.reaction)
  return factionData.reaction, isParagon and "paragon" or "reaction"
end

---------------------------
-- Known sources
---------------------------
local function InRange(source, standing)
  if not standing then return true end
  return source.from and source.to and standing >= source.from and standing <= source.to
end

local function MatchesSource(source, record)
  local kind = source.kind

  if record.type == "Quest" then
    return kind == "quest" and source.id == record.id
  elseif record.type == "Mob" or record.type == "Instance" then
    -- Instance sources are per clear, a kill inside is only known when the mob itself is in the data.
    return kind == "mob" and ((source.npc and source.npc == record.npc) or (record.name and source.name == record.name)) or false
  elseif record.type == "Item" then
    return (kind == "item" or kind == "quest") and source.items and record.item and source.items[record.item] ~= nil
  elseif record.type == "General" then
    return kind == "general"
  end

  return false
end

function REP:IsKnownSource(factionID, record)
  local sources = REP.Sources and REP.Sources[factionID]
  if not sources then return false end

  for _, source in ipairs(sources) do
    if InRange(source, record.standing) and MatchesSource(source, record) then return true end
  end

  return false
end

---------------------------
-- What caused a reputation gain
---------------------------
local function BuildRecord()
  local zone, mapID = GetZone()
  local record = { zone = zone, mapID = mapID }

  if IsRecent(recent.quest) then
    record.type = "Quest"
    record.id = recent.quest.id
    record.name = recent.quest.name
    return record
  end

  local kill = IsRecent(recent.kill) and recent.kill
  if not kill and UnitExists and UnitExists("target") and UnitIsDead("target") and not UnitIsPlayer("target") then
    local npcID = NpcIDFromGUID(UnitGUID("target"))
    local name = UnitName("target")
    if npcID then kill = { npc = npcID, name = not IsSecret(name) and name or nil } end
  end

  if kill then
    local instanceID, instanceName = GetInstance()
    record.type = instanceID and "Instance" or "Mob"
    record.npc = kill.npc
    record.name = kill.name
    record.instance = instanceID
    record.instanceName = instanceName
    return record
  end

  if IsRecent(recent.item) then
    record.type = "Item"
    record.item = recent.item.item
    record.spell = recent.item.spell
    return record
  end

  record.type = "General"
  record.instance, record.instanceName = GetInstance()
  return record
end

local IDENTITY_FIELDS = { "type", "id", "npc", "instance", "item", "spell", "standing", "rep" }

local function IsSameRecord(a, b)
  for _, field in ipairs(IDENTITY_FIELDS) do
    if a[field] ~= b[field] then return false end
  end
  if a.type == "General" and a.mapID ~= b.mapID then return false end
  return true
end

local function SaveRecord(factionID, factionName, record)
  local store = GetStore("RecordedSources")
  if not store then return end

  local faction = store[factionID]
  if not faction then
    faction = { name = factionName, sources = {} }
    store[factionID] = faction
  end
  faction.name = factionName or faction.name

  for _, saved in ipairs(faction.sources) do
    if IsSameRecord(saved, record) then
      saved.count = (saved.count or 1) + 1
      return
    end
  end

  if #faction.sources >= MAX_PER_FACTION then return end

  record.count = 1
  table.insert(faction.sources, record)
end

local function RoundRep(value)
  return math.floor(value * 100 + 0.5) / 100
end

-- changes: the result of REP:DetectReputationChanges()
function REP:RecordReputationChanges(changes)
  if not REP:IsRecordingSources() or not changes then return end

  for _, change in ipairs(changes) do
    local amount = tonumber(change.change)
    local info = change.info or {}

    if change.factionID and not SKIPPED_FACTIONS[change.factionID] and not change.isNewFaction and amount and amount > 0 then
      local standing, standingType = REP:GetSourceStanding(change.factionID)

      -- A gain that reached the next standing was earned at the previous one.
      if standing and info.current and amount > info.current and standing > 1 and standingType ~= "paragon" then
        standing = standing - 1
      end

      local record = BuildRecord()
      record.standing = standing
      if standingType and standingType ~= "reaction" then record.standingType = standingType end

      local factor = REP:GetReputationFactor(REP.IsHuman, change.factionID) or 1
      record.rep = RoundRep(amount / factor)
      if factor ~= 1 then record.gained = amount end
      record.side = REP.IsAlliance and "Alliance" or "Horde"
      record.build = REP.GameBuildVersion

      if not REP:IsKnownSource(change.factionID, record) then
        SaveRecord(change.factionID, info.name, record)
      end
    end
  end
end

---------------------------
-- Events
---------------------------
local function OnQuestTurnedIn(questID)
  if not questID or IsSecret(questID) then return end
  local name = C_QuestLog and C_QuestLog.GetTitleForQuestID and C_QuestLog.GetTitleForQuestID(questID)
  if not name and REP.GetQuestTitleByID then name = REP:GetQuestTitleByID(questID) end
  recent.quest = { id = questID, name = not IsSecret(name) and name or nil, time = GetTime() }
end

local function OnCombatLog()
  local _, subEvent, _, _, _, _, _, destGUID, destName = CombatLogGetCurrentEventInfo()
  if subEvent ~= "PARTY_KILL" and subEvent ~= "UNIT_DIED" then return end

  if subEvent == "UNIT_DIED" then
    local targetGUID = UnitGUID("target")
    if IsSecret(targetGUID) or targetGUID ~= destGUID then return end
  end

  local npcID = NpcIDFromGUID(destGUID)
  if npcID then
    recent.kill = { npc = npcID, name = not IsSecret(destName) and destName or nil, time = GetTime() }
  end
end

local function OnItemUsed(itemID, spellID)
  recent.item = { item = itemID, spell = spellID, time = GetTime() }
end

function REP:InitSourceRecording()
  if REP.RecordFrame then return end

  local frame = CreateFrame("Frame")
  REP.RecordFrame = frame

  REP:RegisterEventSafe(frame, "QUEST_TURNED_IN")
  REP:RegisterEventSafe(frame, "QUEST_COMPLETE")
  -- Midnight (and later) no longer gives addons the combat log, the dead target is used there.
  if CombatLogGetCurrentEventInfo and (REP.ExpansionIndex or 0) < 11 then
    REP:RegisterEventSafe(frame, "COMBAT_LOG_EVENT_UNFILTERED")
  end
  REP:RegisterUnitEventSafe(frame, "UNIT_SPELLCAST_SUCCEEDED", "player")

  frame:SetScript("OnEvent", function(_, event, ...)
    if not REP:IsRecordingSources() then return end

    if event == "QUEST_TURNED_IN" then
      OnQuestTurnedIn(...)
    elseif event == "QUEST_COMPLETE" then
      pendingQuestID = GetQuestID and GetQuestID()
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
      OnCombatLog()
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
      local _, _, spellID = ...
      -- Spells of the player are abilities, the others come from items or objects.
      if spellID and not IsSecret(spellID) and IsPlayerSpell and not IsPlayerSpell(spellID) then
        if IsRecent(recent.item) and recent.item.item and not recent.item.spell then
          recent.item.spell = spellID
          recent.item.time = GetTime()
        else
          OnItemUsed(nil, spellID)
        end
      end
    end
  end)

  -- Clients without QUEST_TURNED_IN: the reward is taken in the quest frame.
  if GetQuestReward then
    hooksecurefunc("GetQuestReward", function()
      if pendingQuestID and pendingQuestID > 0 and not IsRecent(recent.quest) then OnQuestTurnedIn(pendingQuestID) end
    end)
  end

  local function OnUseContainerItem(bag, slot)
    local itemID = C_Container and C_Container.GetContainerItemID and C_Container.GetContainerItemID(bag, slot)
    if not itemID and GetContainerItemID then itemID = GetContainerItemID(bag, slot) end
    if itemID then OnItemUsed(itemID) end
  end

  if C_Container and C_Container.UseContainerItem then
    hooksecurefunc(C_Container, "UseContainerItem", OnUseContainerItem)
  elseif UseContainerItem then
    hooksecurefunc("UseContainerItem", OnUseContainerItem)
  end
end

function REP:ToggleSourceRecording()
  if not REP_Data or not REP_Data.Global then return end
  REP_Data.Global.RecordSources = not REP:IsRecordingSources()

  local state = REP:IsRecordingSources() and REP_TXT.recordOn or REP_TXT.recordOff
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..state, true)
end

function REP:PrintRecordedSources()
  local store = REP_Data and REP_Data.Global and REP_Data.Global.RecordedSources or {}
  local factions, sources = 0, 0

  for _, faction in pairs(store) do
    factions = factions + 1
    sources = sources + #(faction.sources or {})
  end

  local state = REP:IsRecordingSources() and REP_TXT.recordOn or REP_TXT.recordOff
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..state.." "..string.format(REP_TXT.recordCount, sources, factions), true)
end

---------------------------
-- Manually added sources
---------------------------
-- REP_Data.Global.ManualSources[factionID] = { { kind = "quest", from = 4, to = 8, id = 123, rep = 250, ... } }
function REP:GetManualSources(factionID)
  local store = REP_Data and REP_Data.Global and REP_Data.Global.ManualSources
  return store and store[factionID]
end

-- Called by the sources index (data/registry.lua).
function REP:ForEachManualSource(callback)
  local store = REP_Data and REP_Data.Global and REP_Data.Global.ManualSources
  if not store then return end

  for factionID, sources in pairs(store) do
    for _, source in ipairs(sources) do
      source.factionID = tonumber(factionID) or factionID
      source.manual = true
      if source.kind == "quest" and source.id and source.name and REP.QuestFallbackNames then
        REP.QuestFallbackNames[source.id] = REP.QuestFallbackNames[source.id] or source.name
      end
      callback(source)
    end
  end
end

function REP:AddManualSource(factionID, source)
  local store = GetStore("ManualSources")
  if not store or not factionID then return end

  store[factionID] = store[factionID] or {}
  table.insert(store[factionID], source)

  REP:ReindexSources()
end

function REP:RemoveManualSource(factionID, index)
  local sources = REP:GetManualSources(factionID)
  if not sources or not sources[index] then return end

  table.remove(sources, index)
  if #sources == 0 then REP_Data.Global.ManualSources[factionID] = nil end

  REP:ReindexSources()
end

function REP:RemoveManualSourceByRef(source)
  local factionID = source and source.factionID
  local sources = factionID and REP:GetManualSources(factionID)
  if not sources then return false end

  for index, saved in ipairs(sources) do
    if saved == source then
      REP:RemoveManualSource(factionID, index)
      return true
    end
  end

  return false
end

function REP:DescribeManualSource(source)
  local typeText = REP_TXT["manualType_"..(source.kind or "")] or source.kind or "?"
  local id = source.id or source.npc or source.instanceID or (source.items and next(source.items)) or ""
  local text = source.name or ""
  if text ~= "" and id ~= "" then text = " "..text end
  return string.format("%s %s%s (%s, %d-%d)", typeText, tostring(id), text, tostring(source.rep), source.from or 0, source.to or 0)
end

function REP:ListManualSources(factionID)
  local sources = REP:GetManualSources(factionID)
  REP:Print(REP.HELP_COLOUR..addonName..":|r "..string.format(REP_TXT.manualListHeader, sources and #sources or 0), true)

  for index, source in ipairs(sources or {}) do
    REP:Print("  "..index..". "..REP:DescribeManualSource(source), true)
  end
end

function REP:RefreshSourcesList()
  if REP.UseDetailPanel then
    if REP.RequestDetailFrameRefresh then REP:RequestDetailFrameRefresh() end
  elseif REP_BuildUpdateList then
    REP_BuildUpdateList()
    if REP_UpdateList_Update then REP_UpdateList_Update() end
  end
end
