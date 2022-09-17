local addonName, vars = ...
local L = vars.L
REP = vars

-- TODO: Fix all localization
-- Init/placeholder
REP.BFFLabels = {}
REP.BFFLabels[0] = {}
REP.BFFLabels[0][8400] = "Acquaintance"
REP.BFFLabels[0][16800] = "Buddy"
REP.BFFLabels[0][25200] = "Friend"
REP.BFFLabels[0][33600] = "Good Friend"
REP.BFFLabels[0][42000] = "Best Friend"
-- Nat Pagle 1358
REP.BFFLabels[1358] = {}
REP.BFFLabels[1358][8400] = "Pal"
REP.BFFLabels[1358][16800] = "Buddy"
REP.BFFLabels[1358][25200] = "Friend"
REP.BFFLabels[1358][33600] = "Good Friend"
REP.BFFLabels[1358][42000] = "Best Friend"
-- Corbyn 2100
REP.BFFLabels[2100] = {}
REP.BFFLabels[2100][8400] = "Curiosity"
REP.BFFLabels[2100][16800] = "Non-Threat"
REP.BFFLabels[2100][25200] = "Friend"
REP.BFFLabels[2100][33600] = "Helpful Friend"
REP.BFFLabels[2100][42000] = "Best Friend"
-- The Archivists' Codex 2472
REP.BFFLabels[2472] = {} -- Tier 1
REP.BFFLabels[2472][3000] = REP_TXT_STAND_LV_TIER[2]
REP.BFFLabels[2472][7500] = REP_TXT_STAND_LV_TIER[3]
REP.BFFLabels[2472][14000] = REP_TXT_STAND_LV_TIER[4]
REP.BFFLabels[2472][25000] = REP_TXT_STAND_LV_TIER[5]
REP.BFFLabels[2472][41000] = REP_TXT_STAND_LV_TIER[6]
-- Ve'nari 2432
REP.BFFLabels[2432] = {} -- Dubious
REP.BFFLabels[2432][1000] = REP_TXT_STAND_LV_TRUST[2]
REP.BFFLabels[2432][7000] = REP_TXT_STAND_LV_TRUST[3]
REP.BFFLabels[2432][14000] = REP_TXT_STAND_LV_TRUST[4]
REP.BFFLabels[2432][21000] = REP_TXT_STAND_LV_TRUST[5]
REP.BFFLabels[2432][42000] = REP_TXT_STAND_LV_TRUST[6]
