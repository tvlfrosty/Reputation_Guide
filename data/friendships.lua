----------------------------------------------------------
-- Reputation Guide | Friendship and renown labels --
-- Labels per reputation threshold for factions without standing names in the API (fallback),
-- and the maximum renown / friendship levels.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

---------------------------
-- Max Renown / Friendship levels
---------------------------
REP.MaxFactionLevel = {}
REP.MaxFactionLevel[2389] = 30 -- Neri Sharpfin
REP.MaxFactionLevel[2390] = 30 -- Vim Brineheart
REP.MaxFactionLevel[2503] = 25 -- Maruuk Centaur
REP.MaxFactionLevel[2507] = 25 -- Dragonscale Expedition
REP.MaxFactionLevel[2510] = 30 -- Valdrakken Accord
REP.MaxFactionLevel[2511] = 30 -- Iskaara Tuskarr
REP.MaxFactionLevel[2564] = 20 -- Loamm Niffen
REP.MaxFactionLevel[2570] = 25 -- Hallowfall Arathi
REP.MaxFactionLevel[2574] = 20 -- Dream Wardens
REP.MaxFactionLevel[2590] = 25 -- Council of Dornogal
REP.MaxFactionLevel[2593] = 40 -- Keg Leg's Crew
REP.MaxFactionLevel[2594] = 25 -- The Assembly of the Deeps
REP.MaxFactionLevel[2600] = 25 -- The Severed Threads
REP.MaxFactionLevel[2640] = 60 -- Brann Bronzebeard
REP.MaxFactionLevel[2653] = 20 -- The Cartels of Undermine

---------------------------
-- Max Friendship values
---------------------------
REP.MaxFactionReputation = {}
REP.MaxFactionReputation[2640] = 676997

---------------------------
-- Friendship labels
---------------------------
-- Thresholds step, step * 2, ... step * count.
local function Steps(step, count)
  local thresholds = {}
  for i = 1, count do thresholds[i] = step * i end
  return thresholds
end

-- Label of the n-th threshold is labels[first + n - 1]; lastLabel (optional) replaces the label of the last threshold.
local function Ladder(thresholds, labels, first, lastLabel)
  local ladder = {}

  for i, threshold in ipairs(thresholds) do
    ladder[threshold] = labels and labels[first + i - 1]
  end

  if lastLabel then ladder[thresholds[#thresholds]] = lastLabel end

  return ladder
end

REP.BFFLabels = {}

local ladder1 = Ladder(Steps(8400, 5), REP_TXT.BFFLabels[0], 1)
REP.BFFLabels[0] = ladder1 -- Default (Stranger ... Best Friend)
REP.BFFLabels[1273] = ladder1 -- Jogu the Drunk
REP.BFFLabels[1275] = ladder1 -- Ella
REP.BFFLabels[1276] = ladder1 -- Old Hillpaw
REP.BFFLabels[1277] = ladder1 -- Chee Chee
REP.BFFLabels[1278] = ladder1 -- Sho
REP.BFFLabels[1279] = ladder1 -- Haohan Mudclaw
REP.BFFLabels[1280] = ladder1 -- Tina Mudclaw
REP.BFFLabels[1281] = ladder1 -- Gina Mudclaw
REP.BFFLabels[1282] = ladder1 -- Fish Fellreed
REP.BFFLabels[1283] = ladder1 -- Farmer Fung
REP.BFFLabels[2451] = ladder1 -- Hunt-Captain Korayn
REP.BFFLabels[2453] = ladder1 -- Rendle and Cudgelface

local ladder2 = Ladder(Steps(8400, 5), REP_TXT.BFFFishingMastersLabels, 2)
REP.BFFLabels[1358] = ladder2 -- Nat Pagle
REP.BFFLabels[2097] = ladder2 -- Ilyssia of the Waters
REP.BFFLabels[2098] = ladder2 -- Keeper Raynae
REP.BFFLabels[2099] = ladder2 -- Akule Riverhorn
REP.BFFLabels[2101] = ladder2 -- Sha'leth

local ladder3 = Ladder(Steps(1000, 9), REP_TXT.STAND_LV_RANK, 2, REP_TXT.STAND_LV_MAX_RANK)
REP.BFFLabels[1690] = ladder3 -- Brawl'gar Arena (Season 2)
REP.BFFLabels[2010] = ladder3 -- Brawl'gar Arena (Season 3)
REP.BFFLabels[2011] = ladder3 -- Bizmo's Brawlpub (Season 3)

local ladder4 = Ladder(Steps(10000, 2), REP_TXT.BFFBarracksBodyguardsLabels, 2)
REP.BFFLabels[1733] = ladder4 -- Delvar Ironfist
REP.BFFLabels[1736] = ladder4 -- Tormmok
REP.BFFLabels[1737] = ladder4 -- Talonpriest Ishaal
REP.BFFLabels[1738] = ladder4 -- Defender Illona
REP.BFFLabels[1739] = ladder4 -- Vivianne
REP.BFFLabels[1740] = ladder4 -- Aeda Brightdawn
REP.BFFLabels[1741] = ladder4 -- Leorajh

REP.BFFLabels[1984] = Ladder(Steps(1000, 3), REP_TXT.BFFLabels[1984], 1) -- The First Responders

REP.BFFLabels[2100] = Ladder(Steps(8400, 5), REP_TXT.BFFLabels[2100], 1) -- Corbyn

REP.BFFLabels[2135] = Ladder({1000, 2500, 4500, 7000, 10000, 15000}, REP_TXT.BFFLabels[2135], 1) -- Chromie

local ladder5 = Ladder(Steps(1000, 7), REP_TXT.STAND_LV_RANK, 2, REP_TXT.STAND_LV_MAX_RANK)
REP.BFFLabels[2371] = ladder5 -- Bizmo's Brawlpub
REP.BFFLabels[2372] = ladder5 -- Brawl'gar Arena

local ladder6 = Ladder(Steps(300, 29), REP_TXT.STAND_LV_RANK, 2)
REP.BFFLabels[2389] = ladder6 -- Neri Sharpfin
REP.BFFLabels[2390] = ladder6 -- Vim Brineheart

REP.BFFLabels[2472] = Ladder({3000, 7500, 14000, 25000, 41000}, REP_TXT.STAND_LV_TIER, 2) -- The Archivists' Codex

REP.BFFLabels[2432] = Ladder({1000, 7000, 14000, 21000, 42000}, REP_TXT.STAND_LV_TRUST, 2) -- Ve'nari

REP.BFFLabels[2517] = Ladder(Steps(8400, 5), REP_TXT.BFFLabels[2517], 1) -- Wrathion

REP.BFFLabels[2518] = Ladder(Steps(8400, 5), REP_TXT.BFFLabels[2518], 1) -- Sabellian

REP.BFFLabels[2544] = Ladder({500, 2500, 5500, 12500}, REP_TXT.BFFLabels[2544], 1) -- Artisan's Consortium - Dragon Isles Branch

REP.BFFLabels[2550] = Ladder({300, 1200, 3600, 10000}, REP_TXT.BFFLabels[2550], 1) -- Cobalt Assembly

REP.BFFLabels[2553] = Ladder({7000, 14000, 24000, 42000}, REP_TXT.BFFLabels[2553], 1) -- Soridormi

REP.BFFLabels[2601] = Ladder(Steps(2500, 8), REP_TXT.BFFLabels[2601], 1) -- The Weaver

REP.BFFLabels[2605] = Ladder(Steps(2500, 8), REP_TXT.BFFLabels[2605], 1) -- The General

REP.BFFLabels[2607] = Ladder(Steps(2500, 8), REP_TXT.BFFLabels[2607], 1) -- The Vizier

REP.BFFLabels[2615] = Ladder({10500, 21000, 32500, 42000}, REP_TXT.BFFLabels[2615], 1) -- Azerothian Archives

REP.BFFLabels[2640] = Ladder({1500, 3500, 6100, 9400, 13500, 18500, 24500, 31600, 39900, 48200, 56500, 64800, 73100, 81400, 98000, 114600, 131200, 147800, 164400, 181000, 197600, 214200, 230800, 247400, 280600, 313800, 347000, 380200, 413400, 446600, 479800, 513000, 546200, 579400, 645800, 712200, 778600, 845000, 911400, 977800, 1044200, 1110600, 1177000, 1243400, 1326400, 1409400, 1492400, 1575400, 1658400, 1741400, 1824400, 1907400, 1990400, 2073400, 2197900, 2322400, 2446900, 2571400, 2695900, 2820400, 2944900, 3069400, 3193900, 3318400, 3467800, 3617200, 3766600, 3916000, 4065400, 4214800, 4364200, 4513600, 4663000, 4812400, 4978400, 5144400, 5310400, 5476400, 5642400, 5808400, 5974400, 6140400, 6306400, 6472400, 6655000, 6837600, 7020200, 7202800, 7385400, 7568000, 7750600, 7933200, 8115800, 8298400, 8505900, 8713400, 8920900, 9128400, 9335900}, REP_TXT.STAND_LV_LEVEL, 2) -- Brann Bronzebeard
