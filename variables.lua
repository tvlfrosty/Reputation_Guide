---------------------------
-- Initialize Addon vars --
---------------------------
local _, vars = ...
local REP = vars
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
---- Current Expansion
REP.IsClassic = false
REP.IsTBC = false
REP.IsWotlk = false
REP.IsCata = false
REP.IsMoP = false
REP.IsWoD = false
REP.IsLegion = false
REP.IsBfA = false
REP.IsShadowLands = false
REP.IsDragonflight = false
---- After Expansion
REP.AfterClassic = false
REP.AfterTBC = false
REP.AfterWotlk = false
REP.AfterCata = false
REP.AfterMoP = false
REP.AfterWoD = false
REP.AfterLegion = false
REP.AfterBfA = false
REP.AfterShadowLands = false
REP.AfterDragonflight = false
---- After Expansion
REP.REP_ExpansionFunctionsTable = {
  [0] = function () REP.IsClassic = true end,
  [1] = function ()
    REP.AfterClassic = true
    REP.IsClassic = false
    REP.IsTBC = true
  end,
  [2] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = true
  end,
  [3] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = true
  end,
  [4] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = true
  end,
  [5] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = false
    REP.IsWoD = true
  end,
  [6] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.AfterWoD = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = false
    REP.IsWoD = false
    REP.IsLegion = true
  end,
  [7] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.AfterWoD = true
    REP.AfterLegion = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = false
    REP.IsWoD = false
    REP.IsLegion = false
    REP.IsBfA = true
  end,
  [8] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.AfterWoD = true
    REP.AfterLegion = true
    REP.AfterBfA = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = false
    REP.IsWoD = false
    REP.IsLegion = false
    REP.IsBfA = false
    REP.IsShadowLands = true
  end,
  [9] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.AfterWoD = true
    REP.AfterLegion = true
    REP.AfterBfA = true
    REP.AfterShadowLands = true
    REP.IsClassic = false
    REP.IsTBC = false
    REP.IsWotlk = false
    REP.IsCata = false
    REP.IsMoP = false
    REP.IsWoD = false
    REP.IsLegion = false
    REP.IsBfA = false
    REP.IsShadowLands = false
    REP.IsDragonflight = true
  end,
  [10] = function ()
    REP.AfterClassic = true
    REP.AfterTBC = true
    REP.AfterWotlk = true
    REP.AfterCata = true
    REP.AfterMoP = true
    REP.AfterWoD = true
    REP.AfterLegion = true
    REP.AfterBfA = true
    REP.AfterShadowLands = true
    REP.AfterDragonflight = true
  end,
}
---------------------------
-- Character variables --
---------------------------
---- Race/Side/Difficulty
REP.IsHuman = false
REP.IsDeathKnight = false
REP.IsAlliance = false
REP.IsHorde = false
REP.IsHeroic = false
---- Guild Tracking
REP.GuildName = nil
---- Garrison Trading post level 3
REP.HasTradingPost = false
---------------------------
-- Faction labels --
---------------------------
-- TODO: Fix all localization
---- Init/placeholder
REP.BFFLabels = {}
REP.BFFLabels[0] = {}
REP.BFFLabels[0][8400] = "Acquaintance"
REP.BFFLabels[0][16800] = "Buddy"
REP.BFFLabels[0][25200] = "Friend"
REP.BFFLabels[0][33600] = "Good Friend"
REP.BFFLabels[0][42000] = "Best Friend"
---- Nat Pagle 1358
REP.BFFLabels[1358] = {}
REP.BFFLabels[1358][8400] = "Pal"
REP.BFFLabels[1358][16800] = "Buddy"
REP.BFFLabels[1358][25200] = "Friend"
REP.BFFLabels[1358][33600] = "Good Friend"
REP.BFFLabels[1358][42000] = "Best Friend"
---- Corbyn 2100
REP.BFFLabels[2100] = {}
REP.BFFLabels[2100][8400] = "Curiosity"
REP.BFFLabels[2100][16800] = "Non-Threat"
REP.BFFLabels[2100][25200] = "Friend"
REP.BFFLabels[2100][33600] = "Helpful Friend"
REP.BFFLabels[2100][42000] = "Best Friend"
---- The Archivists' Codex 2472
REP.BFFLabels[2472] = {} -- Tier 1
REP.BFFLabels[2472][3000] = REP_TXT.STAND_LV_TIER[2]
REP.BFFLabels[2472][7500] = REP_TXT.STAND_LV_TIER[3]
REP.BFFLabels[2472][14000] = REP_TXT.STAND_LV_TIER[4]
REP.BFFLabels[2472][25000] = REP_TXT.STAND_LV_TIER[5]
REP.BFFLabels[2472][41000] = REP_TXT.STAND_LV_TIER[6]
---- Ve'nari 2432
REP.BFFLabels[2432] = {} -- Dubious
REP.BFFLabels[2432][1000] = REP_TXT.STAND_LV_TRUST[2]
REP.BFFLabels[2432][7000] = REP_TXT.STAND_LV_TRUST[3]
REP.BFFLabels[2432][14000] = REP_TXT.STAND_LV_TRUST[4]
REP.BFFLabels[2432][21000] = REP_TXT.STAND_LV_TRUST[5]
REP.BFFLabels[2432][42000] = REP_TXT.STAND_LV_TRUST[6]
---- Dragonscale Expedition 2507
REP.BFFLabels[2507] = {} -- Unknown
REP.BFFLabels[2507][2500] = REP_TXT.STAND_LV_RENOWN[1]
REP.BFFLabels[2507][5000] = REP_TXT.STAND_LV_RENOWN[2]
REP.BFFLabels[2507][7500] = REP_TXT.STAND_LV_RENOWN[3]
REP.BFFLabels[2507][10000] = REP_TXT.STAND_LV_RENOWN[4]
REP.BFFLabels[2507][12500] = REP_TXT.STAND_LV_RENOWN[5]
REP.BFFLabels[2507][15000] = REP_TXT.STAND_LV_RENOWN[6]
REP.BFFLabels[2507][17500] = REP_TXT.STAND_LV_RENOWN[7]
REP.BFFLabels[2507][20000] = REP_TXT.STAND_LV_RENOWN[8]
REP.BFFLabels[2507][22500] = REP_TXT.STAND_LV_RENOWN[9]
REP.BFFLabels[2507][25000] = REP_TXT.STAND_LV_RENOWN[10]
REP.BFFLabels[2507][27500] = REP_TXT.STAND_LV_RENOWN[11]
REP.BFFLabels[2507][30000] = REP_TXT.STAND_LV_RENOWN[12]
REP.BFFLabels[2507][32500] = REP_TXT.STAND_LV_RENOWN[13]
REP.BFFLabels[2507][35000] = REP_TXT.STAND_LV_RENOWN[14]
REP.BFFLabels[2507][37500] = REP_TXT.STAND_LV_RENOWN[15]
REP.BFFLabels[2507][40000] = REP_TXT.STAND_LV_RENOWN[16]
REP.BFFLabels[2507][42500] = REP_TXT.STAND_LV_RENOWN[17]
REP.BFFLabels[2507][45000] = REP_TXT.STAND_LV_RENOWN[18]
REP.BFFLabels[2507][47500] = REP_TXT.STAND_LV_RENOWN[19]
REP.BFFLabels[2507][50000] = REP_TXT.STAND_LV_RENOWN[20]
REP.BFFLabels[2507][52500] = REP_TXT.STAND_LV_RENOWN[21]
REP.BFFLabels[2507][55000] = REP_TXT.STAND_LV_RENOWN[22]
REP.BFFLabels[2507][57500] = REP_TXT.STAND_LV_RENOWN[23]
REP.BFFLabels[2507][60000] = REP_TXT.STAND_LV_RENOWN[24]
REP.BFFLabels[2507][62500] = REP_TXT.STAND_LV_RENOWN[25]
