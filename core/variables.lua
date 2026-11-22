---------------------------
-- Initialize Addon vars --
---------------------------
local _, vars = ...
local REP = vars
-------------------------------
-- Other addon compatibility --
-------------------------------
REP.hasElvUILoaded = false
---------------------------
-- Colours --
---------------------------
---- Generic colours
REP.HELP_COLOUR = "|cFFFFFF7F"
REP.NEW_REP_COLOUR = "|cFF7F7FFF"
REP.NEW_STANDING_COLOUR = "|cFF6060C0"
REP.BAG_COLOUR = "|cFFC0FFC0"
REP.BAG_BANK_COLOUR = "|cFFFFFF7F"
REP.QUEST_COLOUR = "|cFFC0FFC0"
REP.HIGHLIGHT_COLOUR = "|cFF00FF00"
REP.QUEST_ACTIVE_COLOUR = "|cFFFF7F7F"
REP.LOWLIGHT_COLOUR = "|cFFFF3F3F"
REP.SUPPRESS_COLOUR = "|cFF7F7F7F"
---- Faction bar colours
REP.FACTION_BAR_COLORS = {
  [0] = {r = 0.8, g = 0.3, b = 0.22},
  [1] = {r = 0.8, g = 0.3, b = 0.22},
  [2] = {r = 0.8, g = 0.3, b = 0.22},
  [3] = {r = 0.75, g = 0.27, b = 0},
  [4] = {r = 0.9, g = 0.7, b = 0},
  [5] = {r = 0, g = 0.6, b = 0.1},
  [6] = {r = 0, g = 0.6, b = 0.1},
  [7] = {r = 0, g = 0.6, b = 0.1},
  [8] = {r = 0, g = 0.6, b = 0.1},
  [9] = {r = 0, g = 0.5, b = 0.9},
}
---------------------------
-- Profestions --
---------------------------
---- Limit types
REP.LIMIT_TYPE_Herb = 1
REP.LIMIT_TYPE_Skin = 2
REP.LIMIT_TYPE_Mine = 3
REP.LIMIT_TYPE_Gather = 4
REP.LIMIT_TYPE_Engi = 5
REP.LIMIT_TYPE_Alch = 6
REP.LIMIT_TYPE_Blac = 7
REP.LIMIT_TYPE_Tail = 8
REP.LIMIT_TYPE_Leat = 9
REP.LIMIT_TYPE_Ench = 10
REP.LIMIT_TYPE_Jewel = 11
REP.LIMIT_TYPE_Incr = 12
REP.LIMIT_TYPE_Aid = 13
REP.LIMIT_TYPE_Arch = 14
REP.LIMIT_TYPE_Cook = 15
REP.LIMIT_TYPE_Fish = 16
---- Skill Tracking
REP.Herb = false
REP.Skin = false
REP.Mine = false
REP.Jewel = false
REP.Cook = false
REP.Arch = false
REP.Fish = false
REP.Aid = false
REP.Black = false
REP.Tailor = false
REP.Leath = false
REP.Enchan = false
REP.Engin = false
REP.Incrip = false
REP.Alche = false
---------------------------
-- Reputation values --
---------------------------
REP.ToExalted = {}
REP.ToExalted[0] = 84000
REP.ToExalted[1] = 48000	-- working on Hated -> Hostile, base offset 21k+12k+6k+3k+3k+3k
REP.ToExalted[2] = 45000	-- working on Hostile -> Unfriendly, base offset 21k+12k+6k+3k+3k
REP.ToExalted[3] = 42000	-- working on Unfriendly -> Neutral, base offset 21k+12k+6k+3k
REP.ToExalted[4] = 39000	-- working on Neutral -> Friendly, base offset 21k+12k+6k
REP.ToExalted[5] = 33000	-- working on Friendly -> Honored, base offset 21k+12k
REP.ToExalted[6] = 21000	-- working on Honored -> Revered, base offset 21k
REP.ToExalted[7] = 0	-- working on Revered -> Exalted, so no base offset
REP.ToExalted[8] = 0	-- already at Exalted -> no offset
---------------------------
-- Expansions --
---------------------------
---- Expansion Labels
REP.Expansions = {}
REP.Expansions[0] = "Classic"
REP.Expansions[1] = "The Burning Crusade"
REP.Expansions[2] = "Wrath of the Lich King"
REP.Expansions[3] = "Cataclysm"
REP.Expansions[4] = "Mists of Pandaria"
REP.Expansions[5] = "Warlords of Draenor"
REP.Expansions[6] = "Legion"
REP.Expansions[7] = "Battle for Azeroth"
REP.Expansions[8] = "Shadowlands"
REP.Expansions[9] = "Dragonflight"
REP.Expansions[10] = "The War Within"
REP.Expansions[11] = "Midnight"
REP.Expansions[12] = "The Last Titan"

-- Expansion flags (REP.IsClassic, REP.AfterClassic, REP.IsTBC, ...) are generated from this list.
-- The order is the expansion index (GetExpansionLevel) + 1.
local EXPANSION_KEYS = {
  "Classic", "TBC", "Wotlk", "Cata", "MoP", "WoD", "Legion", "BfA", "ShadowLands", "Dragonflight", "TheWarWithin", "Midnight", "TheLastTitan",
}

-- Retail: the account's expansion level can be lower than the content of the client (for example a trial account
-- on a newer client), the client build decides the minimum.
local EXPANSION_MIN_BUILD = {
  [10] = 109001, -- The War Within (11.0)
  [11] = 119001, -- Midnight (12.0)
  [12] = 129001, -- The Last Titan (13.0)
}

---- Client flavor
REP.IsForever = false
REP.UseModernReputationUI = false
REP.UseScrollBoxReputationUI = false
REP.UseModernAPI = false
REP.HasParagonAPI = false
REP.HasFriendshipAPI = false
REP.UseDetailPanel = false

-------------------------------
-- GetActiveExpansionAndPhase --
-------------------------------
function REP:GetActiveExpansionAndPhase()
  local expansionIndex = GetExpansionLevel()
  local gameBuildVersion = select(4, GetBuildInfo())

  if not expansionIndex or not gameBuildVersion then return end

  REP.GameExpansionIndex = expansionIndex
  REP.GameBuildVersion = gameBuildVersion

  REP:GetActiveExpansion(expansionIndex, gameBuildVersion)
end

--------------------------------------
-- Get active expansion --
--------------------------------------
function REP:GetActiveExpansion(expansionIndex, gameBuildVersion)
  if not expansionIndex then return end

  for index, minBuild in pairs(EXPANSION_MIN_BUILD) do
    if gameBuildVersion and gameBuildVersion >= minBuild and index > expansionIndex then
      expansionIndex = index
    end
  end

  REP.ExpansionIndex = expansionIndex

  for index, key in ipairs(EXPANSION_KEYS) do
    REP["Is"..key] = (expansionIndex == index - 1)
    REP["After"..key] = (expansionIndex > index - 1)
  end

  -- Active season in Classic
  local season = (expansionIndex == 0 and C_Seasons and C_Seasons.GetActiveSeason and C_Seasons.GetActiveSeason()) or 0
  REP.ClassicSeason = season
  REP.IsClassicSOM = (season == 1)
  REP.IsClassicSOD = (season == 2)

  REP:SetClientFlavorFlags()
end

--------------------------------------
-- Client flavor flags --
--------------------------------------
-- Expansion flags describe content, these flags describe which UI/API style the client uses.
-- World of Warcraft: Forever (Camelot) is classic content running on the modern (Midnight) UI/API.
function REP:SetClientFlavorFlags()
  REP.IsForever = (WOW_PROJECT_CAMELOT ~= nil and WOW_PROJECT_ID == WOW_PROJECT_CAMELOT) or false
  -- The live retail client (The War Within / Midnight and later), not Forever or a Classic client.
  REP.IsRetail = (WOW_PROJECT_MAINLINE ~= nil and WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and not REP.IsForever) or false
  REP.UseModernReputationUI = REP.AfterDragonflight or REP.IsForever
  REP.UseScrollBoxReputationUI = REP.AfterShadowLands or REP.IsForever
  REP.UseModernAPI = REP.AfterBfA or REP.IsForever
  REP.HasParagonAPI = REP.AfterWoD or REP.IsForever
  REP.HasFriendshipAPI = REP.AfterCata or REP.IsForever
  -- The addon shows its own details panel next to the modern reputation frame (unless PrettyReps replaces the frame).
  REP.UseDetailPanel = REP.UseModernReputationUI
end
