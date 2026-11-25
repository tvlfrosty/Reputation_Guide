----------------------------------------------------------
-- Reputation Guide | Reputation sources registry --
-- The faction files in data/factions/ register their reputation sources here (declarative).
-- Conditions are checked once when the sources are loaded (only the sources of this client are kept),
-- the sources of a standing are built when the sources list needs them.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

---------------------------
-- Source types
---------------------------
local function SourceType(kind)
  return function(source)
    source.kind = kind
    return source
  end
end

local SOURCE_TYPES = {
  Quest = SourceType("quest"),
  Mob = SourceType("mob"),
  Item = SourceType("item"),
  Instance = SourceType("instance"),
  General = SourceType("general"),
}

-- local Quest, Mob, Item, Instance, General = REP:SourceTypes()
function REP:SourceTypes()
  return SOURCE_TYPES.Quest, SOURCE_TYPES.Mob, SOURCE_TYPES.Item, SOURCE_TYPES.Instance, SOURCE_TYPES.General
end

---------------------------
-- Registration
---------------------------
-- All sources in registration order (the order of the sources list of a faction).
REP.SourceRecords = REP.SourceRecords or {}

-- group: nil for the normal sources, "guild" for the guild sources (loaded separately, the guild name is known later).
-- English quest names of the quests in the data, shown until the game has loaded the (localized) quest title.
REP.QuestFallbackNames = REP.QuestFallbackNames or {}

-- Localized quest names (data/quests, Classic versions and WoW Forever): only the client's locale is kept, English
-- separately as a fallback. Retail has none: it loads the localized title from the server.
REP.QuestNames = REP.QuestNames or {}
REP.QuestNamesEnglish = REP.QuestNamesEnglish or {}
local QUEST_LOCALES = {
  esMX = { "esMX", "esES" }, zhTW = { "zhTW", "zhCN" }, enGB = { "enUS" },
}

-- Quest names as one function per locale ({ enUS = function() return { [id] = name } end, deDE = ... }): only English
-- and the client's locale are built.
function REP:RegisterQuestNameLists(lists)
  local locale = GetLocale()
  if lists.enUS then
    for id, name in pairs(lists.enUS()) do REP.QuestNamesEnglish[id] = name end
  end
  for _, key in ipairs(QUEST_LOCALES[locale] or { locale }) do
    local list = lists[key]
    if list then
      for id, name in pairs(key == "enUS" and REP.QuestNamesEnglish or list()) do
        if not REP.QuestNames[id] or key == locale then REP.QuestNames[id] = name end
      end
    end
  end
end

function REP:RegisterFaction(factionID, sources, group)
  for _, source in ipairs(sources) do
    source.factionID = factionID
    source.group = group
    table.insert(REP.SourceRecords, source)

    if source.kind == "quest" and source.id and source.name then
      REP.QuestFallbackNames[source.id] = source.name
    end
  end
end

---------------------------
-- Texts and names
---------------------------
-- Texts of the data are locale keys: REP_TXT.sources[key] (or REP_TXT[key] for older texts).
function REP:GetSourceText(key)
  if not key then return end
  return (REP_TXT.sources and REP_TXT.sources[key]) or REP_TXT[key]
end

-- Localized NPC names from the game (the English name in the data is used until the game knows the NPC).
local npcNames = {}
local npcTooltip

local function ReadNpcName(npcID)
  local link = "unit:Creature-0-0-0-0-"..npcID.."-0000000000"

  if C_TooltipInfo and C_TooltipInfo.GetHyperlink then
    local ok, data = pcall(C_TooltipInfo.GetHyperlink, link)
    local line = ok and data and data.lines and data.lines[1]
    local text = line and line.leftText
    if type(text) == "string" and text ~= "" then return text end
    return
  end

  if not CreateFrame or not WorldFrame then return end

  if not npcTooltip then
    npcTooltip = CreateFrame("GameTooltip", "REP_NpcTooltip", nil, "GameTooltipTemplate")
  end

  npcTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
  local ok = pcall(npcTooltip.SetHyperlink, npcTooltip, link)
  local fontString = _G["REP_NpcTooltipTextLeft1"]
  local text = ok and fontString and fontString:GetText()
  npcTooltip:Hide()

  if type(text) == "string" and text ~= "" then return text end
end

function REP:GetNpcName(npcID)
  if not npcID then return end
  if npcNames[npcID] then return npcNames[npcID] end

  local name = ReadNpcName(npcID)
  if name then npcNames[npcID] = name end

  return name
end

---------------------------
-- Conditions
---------------------------
local EXPANSIONS = {
  classic = 0, tbc = 1, wotlk = 2, cata = 3, mop = 4, wod = 5, legion = 6, bfa = 7,
  shadowlands = 8, dragonflight = 9, thewarwithin = 10, midnight = 11, thelasttitan = 12,
}

local SEASONS = { SOM = 1, SOD = 2 }

local CLASS_FLAGS = { DEATHKNIGHT = "IsDeathKnight", ROGUE = "IsRogue" }
local RACE_FLAGS = { Human = "IsHuman" }

local PROFESSIONS = {
  Herbalism = "LIMIT_TYPE_Herb", Skinning = "LIMIT_TYPE_Skin", Mining = "LIMIT_TYPE_Mine", Gathering = "LIMIT_TYPE_Gather",
  Engineering = "LIMIT_TYPE_Engi", Alchemy = "LIMIT_TYPE_Alch", Blacksmithing = "LIMIT_TYPE_Blac", Tailoring = "LIMIT_TYPE_Tail",
  Leatherworking = "LIMIT_TYPE_Leat", Enchanting = "LIMIT_TYPE_Ench", Jewelcrafting = "LIMIT_TYPE_Jewel", Inscription = "LIMIT_TYPE_Incr",
  FirstAid = "LIMIT_TYPE_Aid", Archaeology = "LIMIT_TYPE_Arch", Cooking = "LIMIT_TYPE_Cook", Fishing = "LIMIT_TYPE_Fish",
}

---------------------------
-- Content phases
---------------------------
-- Minimum build of every phase per expansion. Classic has a table per variant: the progression realms, Season of Mastery
-- and Season of Discovery all have their own phases (and builds), "classic 5" is phase 5 of the variant of this client.
local PHASES = {
  classic = { 10001, 11302, 11303, 11304, 11305, 11306 },
  classicSOM = { 11401, 11402, 11403, 11404, maxBuild = 11498 },
  classicSOD = { 11500, 11501, 11502, 11503, 11504, 11505, 11506, 11507, maxBuild = 11598 },
  tbc = { 20001, 20001, 20503, 20504, 20504 },
  wotlk = { 30001, 30401, 30402, 30403, 30403 },
  cata = { 40001, 40401, 40402 },
  mop = { 50001, 50501, 50502, 50503, 50504 },
  wod = { 60001, 60001, 60001, 60001 },
  legion = { 70001, 70001, 70001 },
  bfa = { 80001, 80001, 80001, 80001 },
  shadowlands = { 90001, 90001, 90001 },
  dragonflight = { 100001, 100001, 100001 },
  thewarwithin = { 109001, 110001 },
  midnight = { 119001 },
  thelasttitan = { 129001 },
}

local SEASON_KEYS = { [1] = "SOM", [2] = "SOD" }

-- Classic content phases by name: the same content came in a different phase per variant
-- (Season of Discovery started with 3 levelling phases, Molten Core came in its phase 4).
local CLASSIC_CONTENT_PHASES = {
  mc = { classic = 1, SOM = 1, SOD = 4 },   -- Molten Core, Onyxia
  bwl = { classic = 3, SOM = 3, SOD = 5 },  -- Blackwing Lair
  zg = { classic = 4, SOM = 4, SOD = 5 },   -- Zul'Gurub
  aq = { classic = 5, SOM = 5, SOD = 6 },   -- Ahn'Qiraj war effort and raids
  naxx = { classic = 6, SOM = 6, SOD = 7 }, -- Naxxramas
}

-- Current phase of an expansion on this client: 0 before the expansion, the phase number during it,
-- math.huge after it.

function REP:GetCurrentPhase(expansionKey)
  local expansion = REP.ExpansionIndex or 0
  local index = EXPANSIONS[expansionKey]

  if expansion > index then return math.huge end
  if expansion < index then return 0 end

  local build = REP.GameBuildVersion or 0
  local season = SEASON_KEYS[REP.ClassicSeason or 0]
  local phases = (expansionKey == "classic" and season and PHASES["classic"..season]) or PHASES[expansionKey]
  local phase = 0

  if not phases.maxBuild or build <= phases.maxBuild then
    for i, minBuild in ipairs(phases) do
      if build >= minBuild then phase = i end
    end
  end

  return phase
end

-- "classic 5" -> "classic", 5 (phase 5 of the variant of this client)
-- "aq"        -> "classic", 5 / 6 (the phase with that content in the variant of this client)
local function ParsePhase(value)
  local content = CLASSIC_CONTENT_PHASES[value]

  if content then
    local variant = SEASON_KEYS[REP.ClassicSeason or 0] or "classic"
    return "classic", content[variant]
  end

  local expansionKey, number = string.match(value, "^(%a+) (%d+)$")
  return expansionKey, tonumber(number)
end

local function InMask(mask, index)
  if not index or index < 1 then return true end
  local bit = 2 ^ (index - 1)
  return math.floor(mask / bit) % 2 == 1
end

local playerRaceID, playerClassID
local function PlayerRaceID()
  if not playerRaceID then playerRaceID = select(3, UnitRace("player")) end
  return playerRaceID
end
local function PlayerClassID()
  if not playerClassID then playerClassID = select(3, UnitClass("player")) end
  return playerClassID
end

function REP:IsSourceAvailable(source)
  local expansion = REP.ExpansionIndex or 0
  local build = REP.GameBuildVersion or 0

  if source.forever and not REP.IsForever then return false end
  if source.notForever and REP.IsForever then return false end
  -- Quests removed from the retail client (checked with /rep verify), still there on the Classic clients.
  if source.notRetail and REP.IsRetail then return false end
  if source.expansion and expansion ~= EXPANSIONS[source.expansion] then return false end
  if source.notExpansion and expansion == EXPANSIONS[source.notExpansion] then return false end
  if source.since and expansion < EXPANSIONS[source.since] then return false end
  if source.before and expansion >= EXPANSIONS[source.before] then return false end
  if source.minBuild and build < source.minBuild then return false end
  if source.maxBuild and build > source.maxBuild then return false end
  if source.season and (REP.ClassicSeason or 0) ~= SEASONS[source.season] then return false end

  if source.phase then
    local expansionKey, number = ParsePhase(source.phase)
    if REP:GetCurrentPhase(expansionKey) < number then return false end
  end

  if source.untilPhase then
    local expansionKey, number = ParsePhase(source.untilPhase)
    if REP:GetCurrentPhase(expansionKey) > number then return false end
  end
  if source.side == "Alliance" and not REP.IsAlliance then return false end
  if source.side == "Horde" and REP.IsAlliance then return false end
  if source.class and not REP[CLASS_FLAGS[source.class]] then return false end
  if source.notClass and REP[CLASS_FLAGS[source.notClass]] then return false end
  if source.race and not REP[RACE_FLAGS[source.race]] then return false end
  -- Race and class masks of the quest data (bit = 2^(raceID - 1) / 2^(classID - 1)).
  if source.races and not InMask(source.races, PlayerRaceID()) then return false end
  if source.classes and not InMask(source.classes, PlayerClassID()) then return false end
  if source.notRace and REP[RACE_FLAGS[source.notRace]] then return false end

  return true
end

---------------------------
-- Loading the sources
---------------------------
-- REP.Sources[factionID] = the sources of that faction that apply to this client (in registration order).
REP.Sources = {}

local function IndexSources()
  local sources = {}

  for _, source in ipairs(REP.SourceRecords) do
    if REP:IsSourceAvailable(source) then
      local factionSources = sources[source.factionID]
      if not factionSources then
        factionSources = {}
        sources[source.factionID] = factionSources
      end
      table.insert(factionSources, source)
    end
  end

  -- Sources the player added (options of the sources list), after the sources of the data.
  if REP.ForEachManualSource then
    REP:ForEachManualSource(function(source)
      if source.kind and REP:IsSourceAvailable(source) then
        sources[source.factionID] = sources[source.factionID] or {}
        table.insert(sources[source.factionID], source)
      end
    end)
  end

  REP.Sources = sources
end

function REP:ReindexSources()
  IndexSources()
  if REP.RefreshSourcesList then REP:RefreshSourcesList() end
end

function REP_InitEnFactionGains(guildName, guildCapBase)
  REP:ClearBonusReputationFactions()
  REP:SetZoneIdsBasedOnExpansion()

  if (not REP.IsAlliance) and (not REP.IsHorde) then
    local locFaction = UnitFactionGroup("player")
    if (locFaction == FACTION_ALLIANCE) then REP.IsAlliance = true end
    if (locFaction == FACTION_HORDE) then REP.IsHorde = true end
  end

  IndexSources()
end

-- The guild sources are part of the index, they are shown as soon as the guild name is known.
function REP_InitFactionForGuildOnly()
end

---------------------------
-- Sources of a standing
---------------------------
local GUILD_FACTION_ID = 1168

local LIST_KEYS = { quest = "quests", mob = "mobs", instance = "instance", item = "items", general = "general" }

local function CopyTable(source)
  if not source then return end

  local copy = {}
  for key, value in pairs(source) do copy[key] = value end
  return copy
end

local function IsValidRange(source)
  local from, to = source.from, source.to
  if not from or not to then return false end
  if from < 1 or (from > 8 and not source.renown) then return false end
  if to < 1 or (to > 8 and not source.renown) then return false end
  return from <= to
end

-- One entry of the sources list (the same fields the list always used).
local function BuildEntry(source, standing, factor)
  local kind = source.kind
  local zones = REP.zone or {}
  local entry = { maxStanding = source.to, manualSource = source.manual and source or nil }

  if kind == "quest" then
    entry.name = source.id or source.name or REP:GetSourceText(source.text)
    entry.rep = source.rep * factor
    if source.repeatable == nil then entry.repeatable = true else entry.repeatable = source.repeatable end
    entry.questID = source.id
    entry.alsoIDs = source.alsoIDs
    if source.pvp == nil then entry.isPvp = false else entry.isPvp = source.pvp end
    entry.items = CopyTable(source.items)
    entry.profession = source.profession and REP[PROFESSIONS[source.profession]]
  elseif kind == "mob" then
    entry.name = (source.npc and REP:GetNpcName(source.npc)) or source.name or source.code or REP:GetSourceText(source.text)
    entry.rep = source.rep * factor
    entry.zone = (source.zone and zones[source.zone]) or source.map
    if standing == source.to and source.limit then entry.limit = source.limit end
  elseif kind == "instance" then
    entry.name = (source.instance and zones[source.instance]) or source.code or source.name or REP:GetSourceText(source.text)
    entry.rep = source.rep * factor
    entry.level = (source.heroic and REP_TXT.heroic or REP_TXT.normal)
  elseif kind == "item" then
    entry.rep = source.rep * factor
    entry.items = CopyTable(source.items)
    entry.alternativeItems = CopyTable(source.altItems)
  elseif kind == "general" then
    entry.rep = source.rep * (factor + (source.factor or 0))
    entry.name = source.name or REP:GetSourceText(source.text)
    entry.head = source.head or REP:GetSourceText(source.headText)
    entry.tip = source.tip or REP:GetSourceText(source.tipText)
    if source.name == "1" then
      entry.name, entry.head, entry.tip = REP_TXT.tfr, REP_TXT.tfr, REP_TXT.nswts
    end
    entry.flag = source.flag
    entry.tipList = CopyTable(source.tipList)
  end

  return entry
end

-- The sources of a faction for a standing, grouped per type: { quests = { count = n - 1, data = { [0] = entry, ... } }, mobs = ..., ... }
-- The reputation factor (racial, buffs, bonus reputation) is applied here, so it always matches the current situation.
function REP:GetStandingSources(factionID, standing)
  local factionSources = factionID and REP.Sources[factionID]
  if not factionSources or not standing then return end
  if factionID == GUILD_FACTION_ID and not REP.GuildName then return end

  local factor = REP:GetReputationFactor(REP.IsHuman, factionID)
  local result

  for _, source in ipairs(factionSources) do
    local hasName
    if source.kind == "item" then
      hasName = source.items ~= nil
    elseif source.kind == "instance" and source.instance then
      hasName = (REP.zone or {})[source.instance] ~= nil
    else
      hasName = (source.id or source.name or source.code or source.npc or REP:GetSourceText(source.text)) ~= nil
    end

    if hasName and type(source.rep) == "number" and IsValidRange(source) and standing >= source.from and standing <= source.to then
      result = result or {}
      local key = LIST_KEYS[source.kind]
      local list = result[key]

      if list then
        list.count = list.count + 1
      else
        list = { count = 0, data = {} }
        result[key] = list
      end

      list.data[list.count] = BuildEntry(source, standing, factor)
    end
  end

  return result
end
