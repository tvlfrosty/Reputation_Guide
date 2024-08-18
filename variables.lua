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
REP.Expansions[10] = "The War Within"
REP.Expansions[11] = "Midnight"
REP.Expansions[12] = "The Last Titan"
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
REP.IsTheWarWithin = false
REP.IsMidnight = false
REP.IsTheLastTitan = false
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
REP.AfterTheWarWithin = false
REP.AfterMidnight = false
REP.AfterTheLastTitan = false
---- Phases to show
-- Classic
REP.ShowClassicPhaseOne = false
REP.ShowClassicPhaseTwo = false
REP.ShowClassicPhaseThree = false
REP.ShowClassicPhaseFour = false
REP.ShowClassicPhaseFive = false
REP.ShowClassicPhaseSix = false
-- Classic SOM
REP.ShowClassicSOMPhaseOne = false
REP.ShowClassicSOMPhaseTwo = false
REP.ShowClassicSOMPhaseThree = false
REP.ShowClassicSOMPhaseFour = false
-- Classic SOD
REP.ShowClassicSODPhaseOne = false
REP.ShowClassicSODPhaseTwo = false
REP.ShowClassicSODPhaseThree = false
REP.ShowClassicSODPhaseFour = false
REP.ShowClassicSODPhaseFive = false
-- The Burning Crusade
REP.ShowTBCPhaseOne = false
REP.ShowTBCPhaseTwo = false
REP.ShowTBCPhaseThree = false
REP.ShowTBCPhaseFour = false
REP.ShowTBCPhaseFive = false
-- Wrath of the Lich King
REP.ShowWotlkPhaseOne = false
REP.ShowWotlkPhaseTwo = false
REP.ShowWotlkPhaseThree = false
REP.ShowWotlkPhaseFour = false
REP.ShowWotlkPhaseFive = false
-- Cataclysm
REP.ShowCataPhaseOne = false
REP.ShowCataPhaseTwo = false
REP.ShowCataPhaseThree = false
REP.ShowCataPhaseFour = false
-- Mists of Pandaria
REP.ShowMoPPhaseOne = false
REP.ShowMoPPhaseTwo = false
REP.ShowMoPPhaseThree = false
REP.ShowMoPPhaseFour = false
REP.ShowMoPPhaseFive = false
-- Warlords of Draenor
REP.ShowWoDPhaseOne = false
REP.ShowWoDPhaseTwo = false
REP.ShowWoDPhaseThree = false
REP.ShowWoDPhaseFour = false
-- Legion
REP.ShowLegionPhaseOne = false
REP.ShowLegionPhaseTwo = false
REP.ShowLegionPhaseThree = false
-- Battle for Azeroth
REP.ShowBfAPhaseOne = false
REP.ShowBfAPhaseTwo = false
REP.ShowBfAPhaseThree = false
REP.ShowBfAPhaseFour = false
-- Shadowlands
REP.ShowShadowLandsPhaseOne = false
REP.ShowShadowLandsPhaseTwo = false
REP.ShowShadowLandsPhaseThree = false
-- Dragonflight
REP.ShowDragonflightPhaseOne = false
REP.ShowDragonflightPhaseTwo = false
REP.ShowDragonflightPhaseThree = false
-- The War Within
REP.ShowTheWarWithinPhaseOne = false
-- Midnight
REP.ShowMidnightPhaseOne = false
-- The Last Titan
REP.ShowTheLastTitanPhaseOne = false
----  Current phase
-- Classic
REP.IsClassicPhaseOne = false
REP.IsClassicPhaseTwo = false
REP.IsClassicPhaseThree = false
REP.IsClassicPhaseFour = false
REP.IsClassicPhaseFive = false
REP.IsClassicPhaseSix = false
-- Classic SOM
REP.IsClassicSOMPhaseOne = false
REP.IsClassicSOMPhaseTwo = false
REP.IsClassicSOMPhaseThree = false
REP.IsClassicSOMPhaseFour = false
-- Classic SOD
REP.IsClassicSODPhaseOne = false
REP.IsClassicSODPhaseTwo = false
REP.IsClassicSODPhaseThree = false
REP.IsClassicSODPhaseFour = false
REP.IsClassicSODPhaseFive = false
-- The Burning Crusade
REP.IsTBCPhaseOne = false
REP.IsTBCPhaseTwo = false
REP.IsTBCPhaseThree = false
REP.IsTBCPhaseFour = false
REP.IsTBCPhaseFive = false
-- Wrath of the Lich King
REP.IsWotlkPhaseOne = false
REP.IsWotlkPhaseTwo = false
REP.IsWotlkPhaseThree = false
REP.IsWotlkPhaseFour = false
REP.IsWotlkPhaseFive = false
-- Cataclysm
REP.IsCataPhaseOne = false
REP.IsCataPhaseTwo = false
REP.IsCataPhaseThree = false
REP.IsCataPhaseFour = false
-- Mists of Pandaria
REP.IsMoPPhaseOne = false
REP.IsMoPPhaseTwo = false
REP.IsMoPPhaseThree = false
REP.IsMoPPhaseFour = false
REP.IsMoPPhaseFive = false
-- Warlords of Draenor
REP.IsWoDPhaseOne = false
REP.IsWoDPhaseTwo = false
REP.IsWoDPhaseThree = false
REP.IsWoDPhaseFour = false
-- Legion
REP.IsLegionPhaseOne = false
REP.IsLegionPhaseTwo = false
REP.IsLegionPhaseThree = false
-- Battle for Azeroth
REP.IsBfAPhaseOne = false
REP.IsBfAPhaseTwo = false
REP.IsBfAPhaseThree = false
REP.IsBfAPhaseFour = false
-- Shadowlands
REP.IsShadowLandsPhaseOne = false
REP.IsShadowLandsPhaseTwo = false
REP.IsShadowLandsPhaseThree = false
-- Dragonflight
REP.IsDragonflightPhaseOne = false
REP.IsDragonflightPhaseTwo = false
REP.IsDragonflightPhaseThree = false
-- The War Within
REP.IsTheWarWithinPhaseOne = false
-- Midnight
REP.IsMidnightPhaseOne = false
-- The Last Titan
REP.IsTheLastTitanPhaseOne = false

---------------------------
-- Faction count --
---------------------------
REP.totalFactions = 0

-------------------------------
-- GetActiveExpansionAndPhase --
-------------------------------
function REP:GetActiveExpansionAndPhase()
  local expansionIndex = GetExpansionLevel()
  local gameBuildVersion = select(4, GetBuildInfo());

  if not expansionIndex or not gameBuildVersion then return end

  REP.GameExpansionIndex = expansionIndex
  REP.GameBuildVersion = gameBuildVersion

  REP:ResetsActiveExpansionAndPhase()
  REP:GetActiveExpansion(expansionIndex, gameBuildVersion)
  REP:GetActivePhase(gameBuildVersion)
end

--------------------------------------
-- Get active expansion --
--------------------------------------
function REP:GetActiveExpansion(expansionIndex, gameBuildVersion)
  if not expansionIndex then return end
  if expansionIndex == 0 then -- Classic
    REP.IsClassic = true
    -- Check for active Season in Classic
    local season = C_Seasons and C_Seasons.GetActiveSeason() or 0;
    if season > 0 then
    	if season == 1 then	-- SOM
    		REP.IsClassicSOM = true
    	end
    	if season == 2 then	-- SOD
    		REP.IsClassicSOD = true
    	end
    end
  end

  if expansionIndex > 0 then REP.AfterClassic = true end
  if expansionIndex == 1 then REP.IsTBC = true end -- The Burning Crusade
  if expansionIndex > 1 then REP.AfterTBC = true end
  if expansionIndex == 2 then REP.IsWotlk = true end -- Wrath of the Lich King
  if expansionIndex > 2 then REP.AfterWotlk = true end
  if expansionIndex == 3 then REP.IsCata = true end -- Cataclysm
  if expansionIndex > 3 then REP.AfterCata = true end
  if expansionIndex == 4 then REP.IsMoP = true end -- Mists of Pandaria
  if expansionIndex > 4 then REP.AfterMoP = true end
  if expansionIndex == 5 then REP.IsWoD = true end -- Warlords of Draenor
  if expansionIndex > 5 then REP.AfterWoD = true end
  if expansionIndex == 6 then REP.IsLegion = true end -- Legion
  if expansionIndex > 6 then REP.AfterLegion = true end
  if expansionIndex == 7 then REP.IsBfA = true end -- Battle for Azeroth
  if expansionIndex > 7 then REP.AfterBfA = true end
  if expansionIndex == 8 then REP.IsShadowLands = true end -- Shadowlands
  if expansionIndex > 8 then REP.AfterShadowLands = true end
  if expansionIndex == 9 then REP.IsDragonflight = true end -- Dragonflight
  if expansionIndex > 9 or gameBuildVersion > 109000 then REP.AfterDragonflight = true end
  if expansionIndex == 10 or gameBuildVersion > 109000 then REP.IsTheWarWithin = true end -- The War Within
  if expansionIndex > 10 then REP.AfterTheWarWithin = true end
  if expansionIndex == 11 or gameBuildVersion > 119000 then REP.IsMidnight = true end -- Midnight
  if expansionIndex > 11 then REP.AfterMidnight = true end
  if expansionIndex == 12 or gameBuildVersion > 129000 then REP.IsTheLastTitan = true end -- The Last Titan
  if expansionIndex > 12 then REP.AfterTheLastTitan = true end
end

--------------------------------------
-- Get active phase --
--------------------------------------
function REP:GetActivePhase(gameBuildVersion)
  if not gameBuildVersion then return end
  ---- Show phases
  if gameBuildVersion > 10000 then REP.ShowClassicPhaseOne = true end
  if gameBuildVersion > 11302 then REP.ShowClassicPhaseTwo = true end
  if gameBuildVersion > 11303 then REP.ShowClassicPhaseThree = true end
  if gameBuildVersion > 11304 then REP.ShowClassicPhaseFour = true end
  if gameBuildVersion > 11305 then REP.ShowClassicPhaseFive = true end
  if gameBuildVersion > 11306 then REP.ShowClassicPhaseSix = true end
  -- Classic SOM
  if gameBuildVersion > 11400 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseOne = true end
  if gameBuildVersion > 11401 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseTwo = true end
  if gameBuildVersion > 11402 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseThree = true end
  if gameBuildVersion > 11403 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseFour = true end
  -- Classic SOD
  if gameBuildVersion > 11499 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseOne = true end
  if gameBuildVersion > 11500 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseTwo = true end
  if gameBuildVersion > 11501 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseThree = true end
  if gameBuildVersion > 11502 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseFour = true end
  if gameBuildVersion > 11503 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseFive = true end
  -- The Burning Crusade
  if gameBuildVersion > 20000 then REP.ShowTBCPhaseOne = true end
  if gameBuildVersion > 20000 then REP.ShowTBCPhaseTwo = true end
  if gameBuildVersion > 20502 then REP.ShowTBCPhaseThree = true end
  if gameBuildVersion > 20503 then REP.ShowTBCPhaseFour = true end
  if gameBuildVersion > 20503 then REP.ShowTBCPhaseFive = true end
  -- Wrath of the Lich King
  if gameBuildVersion > 30000 then REP.ShowWotlkPhaseOne = true end
  if gameBuildVersion > 30400 then REP.ShowWotlkPhaseTwo = true end
  if gameBuildVersion > 30401 then REP.ShowWotlkPhaseThree = true end
  if gameBuildVersion > 30402 then REP.ShowWotlkPhaseFour = true end
  if gameBuildVersion > 30402 then REP.ShowWotlkPhaseFive = true end
  -- Cataclysm
  if gameBuildVersion > 40000 then REP.ShowCataPhaseOne = true end
  if gameBuildVersion > 40400 then REP.ShowCataPhaseTwo = true end
  if gameBuildVersion > 40400 then REP.ShowCataPhaseTwo = true end
  -- Mists of Pandaria
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseOne = true end
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseTwo = true end
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseThree = true end
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseFour = true end
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseFive = true end
  -- Warlords of Draenor
  if gameBuildVersion > 60000 then REP.ShowWoDPhaseOne = true end
  if gameBuildVersion > 60000 then REP.ShowWoDPhaseTwo = true end
  if gameBuildVersion > 60000 then REP.ShowWoDPhaseThree = true end
  if gameBuildVersion > 60000 then REP.ShowWoDPhaseFour = true end
  -- Legion
  if gameBuildVersion > 70000 then REP.ShowLegionPhaseOne = true end
  if gameBuildVersion > 70000 then REP.ShowLegionPhaseTwo = true end
  if gameBuildVersion > 70000 then REP.ShowLegionPhaseThree = true end
  -- Battle for Azeroth
  if gameBuildVersion > 80000 then REP.ShowBfAPhaseOne = true end
  if gameBuildVersion > 80000 then REP.ShowBfAPhaseTwo = true end
  if gameBuildVersion > 80000 then REP.ShowBfAPhaseThree = true end
  if gameBuildVersion > 80000 then REP.ShowBfAPhaseFour = true end
  -- Shadowlands
  if gameBuildVersion > 90000 then REP.ShowShadowLandsPhaseOne = true end
  if gameBuildVersion > 90000 then REP.ShowShadowLandsPhaseTwo = true end
  if gameBuildVersion > 90000 then REP.ShowShadowLandsPhaseThree = true end
  -- Dragonflight
  if gameBuildVersion > 100000 then REP.ShowDragonflightPhaseOne = true end
  if gameBuildVersion > 100000 then REP.ShowDragonflightPhaseTwo = true end
  if gameBuildVersion > 100000 then REP.ShowDragonflightPhaseThree = true end
  -- The War Within
  if gameBuildVersion > 109000 then REP.ShowTheWarWithinPhaseOne = true end
  -- Midnight 
  if gameBuildVersion > 119000 then REP.ShowMidnightPhaseOne = true end
  -- The Last Titan
  if gameBuildVersion > 129000 then REP.ShowTheLastTitenPhaseOne = true end
  ---- Current phase
  if REP.ShowClassicPhaseOne and not REP.ShowClassicPhaseTwo then REP.IsClassicPhaseOne = true end
  if REP.ShowClassicPhaseTwo and not REP.ShowClassicPhaseThree then REP.IsClassicPhaseTwo = true end
  if REP.ShowClassicPhaseThree and not REP.ShowClassicPhaseFour then REP.IsClassicPhaseThree = true end
  if REP.ShowClassicPhaseFour and not REP.ShowClassicPhaseFive then REP.IsClassicPhaseFour = true end
  if REP.ShowClassicPhaseFive and not REP.ShowClassicPhaseSix then REP.IsClassicPhaseFive = true end
  if REP.ShowClassicPhaseSix and not REP.ShowTBCPhaseOne then REP.IsClassicPhaseSix = true end
  -- Classic SOM
  if REP.ShowClassicSOMPhaseOne and not REP.ShowClassicSOMPhaseTwo then REP.IsClassicSOMPhaseOne = true end
  if REP.ShowClassicSOMPhaseTwo and not REP.ShowClassicSOMPhaseThree then REP.IsClassicSOMPhaseTwo = true end
  if REP.ShowClassicSOMPhaseThree and not REP.ShowClassicSOMPhaseFour then REP.IsClassicSOMPhaseThree = true end
  if REP.ShowClassicSOMPhaseFour then REP.IsClassicSOMPhaseFour = true end
  -- Classic SOD
  if REP.ShowClassicSODPhaseOne and not REP.ShowClassicSODPhaseTwo then REP.IsClassicSODPhaseOne = true end
  if REP.ShowClassicSODPhaseTwo and not REP.ShowClassicSODPhaseThree then REP.IsClassicSODPhaseTwo = true end
  if REP.ShowClassicSODPhaseThree and not REP.ShowClassicSODPhaseFour then REP.IsClassicSODPhaseThree = true end
  if REP.ShowClassicSODPhaseFour and not REP.ShowClassicSODPhaseFive then REP.IsClassicSODPhaseFour = true end
  if REP.ShowClassicSODPhaseFive then REP.IsClassicSODPhaseFive = true end
  -- The Burning Crusade
  if REP.ShowTBCPhaseOne and not REP.ShowTBCPhaseTwo then REP.IsTBCPhaseOne = true end
  if REP.ShowTBCPhaseTwo and not REP.ShowTBCPhaseThree then REP.IsTBCPhaseTwo = true end
  if REP.ShowTBCPhaseThree and not REP.ShowTBCPhaseFour then REP.IsTBCPhaseThree = true end
  if REP.ShowTBCPhaseFour and not REP.ShowTBCPhaseFive then REP.IsTBCPhaseFour = true end
  if REP.ShowTBCPhaseFive and not REP.ShowWotlkPhaseOne then REP.IsTBCPhaseFive = true end
  -- Wrath of the Lich King
  if REP.ShowWotlkPhaseOne and not REP.ShowWotlkPhaseTwo then REP.IsWotlkPhaseOne = true end
  if REP.ShowWotlkPhaseTwo and not REP.ShowWotlkPhaseThree then REP.IsWotlkPhaseTwo = true end
  if REP.ShowWotlkPhaseThree and not REP.ShowWotlkPhaseFour then REP.IsWotlkPhaseThree = true end
  if REP.ShowWotlkPhaseFour and not REP.ShowWotlkPhaseFive then REP.IsWotlkPhaseFour = true end
  if REP.ShowWotlkPhaseFive and not REP.ShowCataPhaseOne then REP.IsWotlkPhaseFive = true end
  -- Cataclysm
  if REP.ShowCataPhaseOne and not REP.ShowCataPhaseTwo then REP.IsCataPhaseOne = true end
  if REP.ShowCataPhaseTwo and not REP.ShowCataPhaseThree then REP.IsCataPhaseTwo = true end
  if REP.ShowCataPhaseThree and not REP.ShowCataPhaseFour then REP.IsCataPhaseThree = true end
  if REP.ShowCataPhaseFour and not REP.ShowMoPPhaseOne then REP.IsCataPhaseFour = true end
  -- Mists of Pandaria
  if REP.ShowMoPPhaseOne and not REP.ShowMoPPhaseTwo then REP.IsMoPPhaseOne = true end
  if REP.ShowMoPPhaseTwo and not REP.ShowMoPPhaseThree then REP.IsMoPPhaseTwo = true end
  if REP.ShowMoPPhaseThree and not REP.ShowMoPPhaseFour then REP.IsMoPPhaseThree = true end
  if REP.ShowMoPPhaseFour and not REP.ShowMoPPhaseFive then REP.IsMoPPhaseFour = true end
  if REP.ShowMoPPhaseFive and not REP.ShowWoDPhaseOne then REP.IsMoPPhaseFive = true end
  -- Warlords of Draenor
  if REP.ShowWoDPhaseOne and not REP.ShowWoDPhaseTwo then REP.IsWoDPhaseOne = true end
  if REP.ShowWoDPhaseTwo and not REP.ShowWoDPhaseThree then REP.IsWoDPhaseTwo = true end
  if REP.ShowWoDPhaseThree and not REP.ShowWoDPhaseFour then REP.IsWoDPhaseThree = true end
  if REP.ShowWoDPhaseFour and not REP.ShowLegionPhaseOne then REP.IsWoDPhaseFour = true end
  -- Legion
  if REP.ShowLegionPhaseOne and not REP.ShowLegionPhaseTwo then REP.IsLegionPhaseOne = true end
  if REP.ShowLegionPhaseTwo and not REP.ShowLegionPhaseThree then REP.IsLegionPhaseTwo = true end
  if REP.ShowLegionPhaseThree and not REP.ShowBfAPhaseOne then REP.IsLegionPhaseThree = true end
  -- Battle for Azeroth
  if REP.ShowBfAPhaseOne and not REP.ShowBfAPhaseTwo then REP.IsBfAPhaseOne = true end
  if REP.ShowBfAPhaseTwo and not REP.ShowBfAPhaseThree then REP.IsBfAPhaseTwo = true end
  if REP.ShowBfAPhaseThree and not REP.ShowBfAPhaseFour then REP.IsBfAPhaseThree = true end
  if REP.ShowBfAPhaseFour and not REP.ShowShadowLandsPhaseOne then REP.IsBfAPhaseFour = true end
  -- Shadowlands
  if REP.ShowShadowLandsPhaseOne and not REP.ShowShadowLandsPhaseTwo then REP.IsShadowLandsPhaseOne = true end
  if REP.ShowShadowLandsPhaseTwo and not REP.ShowShadowLandsPhaseThree then REP.IsShadowLandsPhaseTwo = true end
  if REP.ShowShadowLandsPhaseThree and not REP.ShowDragonflightPhaseOne then REP.IsShadowLandsPhaseThree = true end
  -- Dragonflight
  if REP.ShowDragonflightPhaseOne and not REP.ShowDragonflightPhaseTwo then REP.IsDragonflightPhaseOne = true end
  if REP.ShowDragonflightPhaseTwo and not REP.ShowDragonflightPhaseThree then REP.IsDragonflightPhaseTwo = true end
  if REP.ShowDragonflightPhaseThree and not REP.ShowTheWarWithinPhaseOne then REP.IsDragonflightPhaseThree = true end
  -- The War Within
  if REP.ShowTheWarWithinPhaseOne and not REP.ShowMidnightPhaseOne then REP.IsTheWarWithinPhaseOne = true end
  -- Midnight
  if REP.ShowMidnightPhaseOne and not REP.ShowTheLastTitanPhaseOne then REP.IsMidnightPhaseOne = true end
  -- The Last Titan
  if REP.ShowTheLastTitanPhaseOne then REP.IsTheLastTitanPhaseOne = true end
end

--------------------------------------
-- Reset active expansion and phase --
--------------------------------------
function REP:ResetsActiveExpansionAndPhase()
  ---- Current Expansion
  REP.IsClassic = false
  REP.IsClassicSOM = false
  REP.IsClassicSOD = false
  REP.IsTBC = false
  REP.IsWotlk = false
  REP.IsCata = false
  REP.IsMoP = false
  REP.IsWoD = false
  REP.IsLegion = false
  REP.IsBfA = false
  REP.IsShadowLands = false
  REP.IsDragonflight = false
  REP.IsTheWarWithin = false
  REP.IsMidnight = false
  REP.IsTheLastTitan = false
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
  REP.AfterTheWarWithin = false
  REP.AfterMidnight = false
  REP.AfterTheLastTitan = false
  ---- Phases to show
  -- Classic
  REP.ShowClassicPhaseOne = false
  REP.ShowClassicPhaseTwo = false
  REP.ShowClassicPhaseThree = false
  REP.ShowClassicPhaseFour = false
  REP.ShowClassicPhaseFive = false
  REP.ShowClassicPhaseSix = false
  -- Classic SOM
  REP.ShowClassicSOMPhaseOne = false
  REP.ShowClassicSOMPhaseTwo = false
  REP.ShowClassicSOMPhaseThree = false
  REP.ShowClassicSOMPhaseFour = false
  -- Classic SOD
  REP.ShowClassicSODPhaseOne = false
  REP.ShowClassicSODPhaseTwo = false
  REP.ShowClassicSODPhaseThree = false
  REP.ShowClassicSODPhaseFour = false
  REP.ShowClassicSODPhaseFive = false
  -- The Burning Crusade
  REP.ShowTBCPhaseOne = false
  REP.ShowTBCPhaseTwo = false
  REP.ShowTBCPhaseThree = false
  REP.ShowTBCPhaseFour = false
  REP.ShowTBCPhaseFive = false
  -- Wrath of the Lich King
  REP.ShowWotlkPhaseOne = false
  REP.ShowWotlkPhaseTwo = false
  REP.ShowWotlkPhaseThree = false
  REP.ShowWotlkPhaseFour = false
  REP.ShowWotlkPhaseFive = false
  -- Cataclysm
  REP.ShowCataPhaseOne = false
  REP.ShowCataPhaseTwo = false
  REP.ShowCataPhaseThree = false
  REP.ShowCataPhaseFour = false
  -- Mists of Pandaria
  REP.ShowMoPPhaseOne = false
  REP.ShowMoPPhaseTwo = false
  REP.ShowMoPPhaseThree = false
  REP.ShowMoPPhaseFour = false
  REP.ShowMoPPhaseFive = false
  -- Warlords of Draenor
  REP.ShowWoDPhaseOne = false
  REP.ShowWoDPhaseTwo = false
  REP.ShowWoDPhaseThree = false
  REP.ShowWoDPhaseFour = false
  -- Legion
  REP.ShowLegionPhaseOne = false
  REP.ShowLegionPhaseTwo = false
  REP.ShowLegionPhaseThree = false
  -- Battle for Azeroth
  REP.ShowBfAPhaseOne = false
  REP.ShowBfAPhaseTwo = false
  REP.ShowBfAPhaseThree = false
  REP.ShowBfAPhaseFour = false
  -- Shadowlands
  REP.ShowShadowLandsPhaseOne = false
  REP.ShowShadowLandsPhaseTwo = false
  REP.ShowShadowLandsPhaseThree = false
  -- Dragonflight
  REP.ShowDragonflightPhaseOne = false
  REP.ShowDragonflightPhaseTwo = false
  REP.ShowDragonflightPhaseThree = false
  -- The War Within
  REP.ShowTheWarWithinPhaseOne = false
  -- Midnight
  REP.ShowMidnightPhaseOne = false
  -- The Last Titan
  REP.ShowTheLastTitanPhaseOne = false
  ----  Current phase
  -- Classic
  REP.IsClassicPhaseOne = false
  REP.IsClassicPhaseTwo = false
  REP.IsClassicPhaseThree = false
  REP.IsClassicPhaseFour = false
  REP.IsClassicPhaseFive = false
  REP.IsClassicPhaseSix = false
  -- Classic SOM
  REP.IsClassicSOMPhaseOne = false
  REP.IsClassicSOMPhaseTwo = false
  REP.IsClassicSOMPhaseThree = false
  REP.IsClassicSOMPhaseFour = false
  -- Classic SOD
  REP.IsClassicSODPhaseOne = false
  REP.IsClassicSODPhaseTwo = false
  REP.IsClassicSODPhaseThree = false
  REP.IsClassicSODPhaseFour = false
  REP.IsClassicSODPhaseFive = false
  -- The Burning Crusade
  REP.IsTBCPhaseOne = false
  REP.IsTBCPhaseTwo = false
  REP.IsTBCPhaseThree = false
  REP.IsTBCPhaseFour = false
  REP.IsTBCPhaseFive = false
  -- Wrath of the Lich King
  REP.IsWotlkPhaseOne = false
  REP.IsWotlkPhaseTwo = false
  REP.IsWotlkPhaseThree = false
  REP.IsWotlkPhaseFour = false
  REP.IsWotlkPhaseFive = false
  -- Cataclysm
  REP.IsCataPhaseOne = false
  REP.IsCataPhaseTwo = false
  REP.IsCataPhaseThree = false
  REP.IsCataPhaseFour = false
  -- Mists of Pandaria
  REP.IsMoPPhaseOne = false
  REP.IsMoPPhaseTwo = false
  REP.IsMoPPhaseThree = false
  REP.IsMoPPhaseFour = false
  REP.IsMoPPhaseFive = false
  -- Warlords of Draenor
  REP.IsWoDPhaseOne = false
  REP.IsWoDPhaseTwo = false
  REP.IsWoDPhaseThree = false
  REP.IsWoDPhaseFour = false
  -- Legion
  REP.IsLegionPhaseOne = false
  REP.IsLegionPhaseTwo = false
  REP.IsLegionPhaseThree = false
  -- Battle for Azeroth
  REP.IsBfAPhaseOne = false
  REP.IsBfAPhaseTwo = false
  REP.IsBfAPhaseThree = false
  REP.IsBfAPhaseFour = false
  -- Shadowlands
  REP.IsShadowLandsPhaseOne = false
  REP.IsShadowLandsPhaseTwo = false
  REP.IsShadowLandsPhaseThree = false
  -- Dragonflight
  REP.IsDragonflightPhaseOne = false
  REP.IsDragonflightPhaseTwo = false
  REP.IsDragonflightPhaseThree = false
  -- The War Within
  REP.IsTheWarWithinPhaseOne = false
  -- Midnight
  REP.IsMidnightPhaseOne = false
  -- The Last Titan
  REP.IsTheLastTitanPhaseOne = false
end

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
-- Max Renown levels
---------------------------
REP.MaxRenownLevel = {}
REP.MaxRenownLevel[2503] = 25
REP.MaxRenownLevel[2507] = 25
REP.MaxRenownLevel[2510] = 30
REP.MaxRenownLevel[2511] = 30
REP.MaxRenownLevel[2564] = 20
REP.MaxRenownLevel[2570] = 25
REP.MaxRenownLevel[2574] = 20
REP.MaxRenownLevel[2590] = 25
REP.MaxRenownLevel[2593] = 40
REP.MaxRenownLevel[2594] = 25
REP.MaxRenownLevel[2600] = 25
REP.MaxRenownLevel[2640] = 60

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
---- Chromie
REP.BFFLabels[2135] = {} -- Whelpling
REP.BFFLabels[2135][1000] = REP_TXT.BFFLabels[2135][1]
REP.BFFLabels[2135][2500] = REP_TXT.BFFLabels[2135][2]
REP.BFFLabels[2135][4500] = REP_TXT.BFFLabels[2135][3]
REP.BFFLabels[2135][7000] = REP_TXT.BFFLabels[2135][4]
REP.BFFLabels[2135][10000] = REP_TXT.BFFLabels[2135][5]
REP.BFFLabels[2135][15000] = REP_TXT.BFFLabels[2135][6]
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
---- Wrathion 2517
REP.BFFLabels[2517] = {} -- Acquaintance
REP.BFFLabels[2517][8400] = "Cohort"
REP.BFFLabels[2517][16800] = "Ally"
REP.BFFLabels[2517][25200] = "Fang"
REP.BFFLabels[2517][33600] = "Friend"
REP.BFFLabels[2517][42000] = "True Friend"
---- Sabellian 2518
REP.BFFLabels[2518] = {} -- Acquaintance
REP.BFFLabels[2518][8400] = "Cohort"
REP.BFFLabels[2518][16800] = "Ally"
REP.BFFLabels[2518][25200] = "Fang"
REP.BFFLabels[2518][33600] = "Friend"
REP.BFFLabels[2518][42000] = "True Friend"
---- Artisan's Consortium - Dragon Isles Branch 2544
REP.BFFLabels[2544] = {} -- Neutral
REP.BFFLabels[2544][500] = "Preferred"
REP.BFFLabels[2544][2500] = "Respected"
REP.BFFLabels[2544][5500] = "Valued"
REP.BFFLabels[2544][12500] = "Esteemed"
---- Cobalt Assembly 2550
REP.BFFLabels[2550] = {} -- Empty
REP.BFFLabels[2550][300] = "Low"
REP.BFFLabels[2550][1200] = "Medium"
REP.BFFLabels[2550][3600] = "High"
REP.BFFLabels[2550][10000] = "Maximum"
---- Soridormi 2553
REP.BFFLabels[2553] = {} -- Anomaly
REP.BFFLabels[2553][7000] = "Future Friend"
REP.BFFLabels[2553][14000] = "Rift-Mender"
REP.BFFLabels[2553][24000] = "Timewalker"
REP.BFFLabels[2553][42000] = "Legend"
---- Azerothian Archives 2615
REP.BFFLabels[2615] = {} -- Graduate
REP.BFFLabels[2615][10500] = "Assistant"
REP.BFFLabels[2615][21000] = "Contract"
REP.BFFLabels[2615][32500] = "Resident"
REP.BFFLabels[2615][42000] = "Tenured"