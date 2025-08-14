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
REP.ShowClassicSODPhaseSix = false
REP.ShowClassicSODPhaseSeven = false
REP.ShowClassicSODPhaseEight = false
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
REP.ShowTheWarWithinPhaseTwo = false
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
REP.IsClassicSODPhaseSix = false
REP.IsClassicSODPhaseSeven = false
REP.IsClassicSODPhaseEight = false
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
REP.IsTheWarWithinPhaseTwo = false
-- Midnight
REP.IsMidnightPhaseOne = false
-- The Last Titan
REP.IsTheLastTitanPhaseOne = false

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
    REP.IsClassicSOM = false
    REP.IsClassicSOD = false

    -- Check for active Season in Classic
    local season = C_Seasons and C_Seasons.GetActiveSeason() or 0;
    if season > 0 then
    	if season == 1 then	-- SOM
    		REP.IsClassicSOM = true
    	end
    	if season == 2 then	-- SOD
    		REP.IsClassicSOD = true
    	end
      -- if season == 3 then	-- Hardcore
    		
    	-- end
      -- if season == 11 then	-- Fresh
    		
    	-- end
      -- if season == 12 then	-- FreshHardcore
    		
    	-- end
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
  -- Classic
  if gameBuildVersion > 10000 then REP.ShowClassicPhaseOne = true end
  if gameBuildVersion >= 11302 then REP.ShowClassicPhaseTwo = true end
  if gameBuildVersion >= 11303 then REP.ShowClassicPhaseThree = true end
  if gameBuildVersion >= 11304 then REP.ShowClassicPhaseFour = true end
  if gameBuildVersion >= 11305 then REP.ShowClassicPhaseFive = true end
  if gameBuildVersion >= 11306 then REP.ShowClassicPhaseSix = true end
  -- Classic SOM
  if REP.IsClassicSOM then
    if gameBuildVersion > 11400 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseOne = true end
    if gameBuildVersion > 11401 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseTwo = true end
    if gameBuildVersion > 11402 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseThree = true end
    if gameBuildVersion > 11403 and gameBuildVersion < 11499 then REP.ShowClassicSOMPhaseFour = true end
  end
  -- Classic SOD
  if REP.IsClassicSOD then
    if gameBuildVersion > 11499 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseOne = true end
    if gameBuildVersion > 11500 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseTwo = true end
    if gameBuildVersion > 11501 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseThree = true end
    if gameBuildVersion > 11502 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseFour = true end
    if gameBuildVersion > 11503 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseFive = true end
    if gameBuildVersion > 11504 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseSix = true end
    if gameBuildVersion > 11505 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseSeven = true end
    if gameBuildVersion > 11506 and gameBuildVersion < 11599 then REP.ShowClassicSODPhaseEight = true end
  end
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
  if gameBuildVersion > 40401 then REP.ShowCataPhaseThree = true end
  -- Mists of Pandaria
  if gameBuildVersion > 50000 then REP.ShowMoPPhaseOne = true end
  if gameBuildVersion > 50500 then REP.ShowMoPPhaseTwo = true end
  if gameBuildVersion > 50501 then REP.ShowMoPPhaseThree = true end
  if gameBuildVersion > 50502 then REP.ShowMoPPhaseFour = true end
  if gameBuildVersion > 50503 then REP.ShowMoPPhaseFive = true end
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
  if gameBuildVersion > 110000 then REP.ShowTheWarWithinPhaseTwo = true end
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
  if REP.IsClassicSOM then
    if REP.ShowClassicSOMPhaseOne and not REP.ShowClassicSOMPhaseTwo then REP.IsClassicSOMPhaseOne = true end
    if REP.ShowClassicSOMPhaseTwo and not REP.ShowClassicSOMPhaseThree then REP.IsClassicSOMPhaseTwo = true end
    if REP.ShowClassicSOMPhaseThree and not REP.ShowClassicSOMPhaseFour then REP.IsClassicSOMPhaseThree = true end
    if REP.ShowClassicSOMPhaseFour then REP.IsClassicSOMPhaseFour = true end
  end
 -- Classic SOD
  if REP.IsClassicSOD then
    if REP.ShowClassicSODPhaseOne and not REP.ShowClassicSODPhaseTwo then REP.IsClassicSODPhaseOne = true end
    if REP.ShowClassicSODPhaseTwo and not REP.ShowClassicSODPhaseThree then REP.IsClassicSODPhaseTwo = true end
    if REP.ShowClassicSODPhaseThree and not REP.ShowClassicSODPhaseFour then REP.IsClassicSODPhaseThree = true end
    if REP.ShowClassicSODPhaseFour and not REP.ShowClassicSODPhaseFive then REP.IsClassicSODPhaseFour = true end
    if REP.ShowClassicSODPhaseFive and not REP.ShowClassicSODPhaseFive then REP.IsClassicSODPhaseFive = true end
    if REP.ShowClassicSODPhaseSix and not REP.ShowClassicSODPhaseSeven then REP.IsClassicSODPhaseSix = true end
    if REP.ShowClassicSODPhaseSeven and not REP.ShowClassicSODPhaseEight then REP.IsClassicSODPhaseSeven = true end
    if REP.ShowClassicSODPhaseEight then REP.IsClassicSODPhaseEight = true end
  end
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
  if REP.ShowTheWarWithinPhaseOne and not REP.ShowTheWarWithinPhaseTwo then REP.IsTheWarWithinPhaseOne = true end
  if REP.ShowTheWarWithinPhaseOne and not REP.ShowMidnightPhaseOne then REP.IsTheWarWithinPhaseTwo = true end  
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
  REP.ShowClassicSODPhaseSix = false
  REP.ShowClassicSODPhaseSeven = false
  REP.ShowClassicSODPhaseEight = false
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
  REP.ShowTheWarWithinPhaseTwo = false
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
  REP.IsClassicSODPhaseSix = false
  REP.IsClassicSODPhaseSeven = false
  REP.IsClassicSODPhaseEight = false
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
  REP.IsTheWarWithinPhaseTwo = false
  -- Midnight
  REP.IsMidnightPhaseOne = false
  -- The Last Titan
  REP.IsTheLastTitanPhaseOne = false
end

---------------------------
-- Character variables --
---------------------------
---- Race/Side/Difficulty
REP.IsHeroic = false
REP.IsAlliance = false
REP.IsHorde = false
REP.IsHuman = false
REP.IsDeathKnight = false
REP.IsRogue = false
---- Guild Tracking
REP.GuildName = nil
---- Garrison Trading post level 3
REP.HasTradingPost = false

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
-- Faction labels --
---------------------------
REP.BFFLabels = {}
---- Init/placeholder
REP.BFFLabels[0] = {} -- Stranger
REP.BFFLabels[0][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[0][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[0][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[0][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[0][42000] = REP_TXT.BFFLabels[0][5]
---- Jogu the Drunk 1273
REP.BFFLabels[1273] = {} -- Stranger
REP.BFFLabels[1273][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1273][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1273][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1273][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1273][42000] = REP_TXT.BFFLabels[0][5]
---- Ella 1275
REP.BFFLabels[1275] = {} -- Stranger
REP.BFFLabels[1275][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1275][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1275][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1275][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1275][42000] = REP_TXT.BFFLabels[0][5]
---- Old Hillpaw 1276
REP.BFFLabels[1276] = {} -- Stranger
REP.BFFLabels[1276][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1276][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1276][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1276][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1276][42000] = REP_TXT.BFFLabels[0][5]
---- Chee Chee 1277
REP.BFFLabels[1277] = {} -- Stranger
REP.BFFLabels[1277][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1277][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1277][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1277][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1277][42000] = REP_TXT.BFFLabels[0][5]
---- Sho 1278
REP.BFFLabels[1278] = {} -- Stranger
REP.BFFLabels[1278][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1278][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1278][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1278][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1278][42000] = REP_TXT.BFFLabels[0][5]
---- Haohan Mudclaw 1279
REP.BFFLabels[1279] = {} -- Stranger
REP.BFFLabels[1279][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1279][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1279][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1279][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1279][42000] = REP_TXT.BFFLabels[0][5]
---- Tina Mudclaw 1280
REP.BFFLabels[1280] = {} -- Stranger
REP.BFFLabels[1280][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1280][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1280][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1280][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1280][42000] = REP_TXT.BFFLabels[0][5]
---- Gina Mudclaw 1281
REP.BFFLabels[1281] = {} -- Stranger
REP.BFFLabels[1281][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1281][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1281][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1281][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1281][42000] = REP_TXT.BFFLabels[0][5]
---- Fish Fellreed 1282
REP.BFFLabels[1282] = {} -- Stranger
REP.BFFLabels[1282][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1282][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1282][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1282][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1282][42000] = REP_TXT.BFFLabels[0][5]
---- Farmer Fung 1283
REP.BFFLabels[1283] = {} -- Stranger
REP.BFFLabels[1283][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[1283][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[1283][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[1283][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[1283][42000] = REP_TXT.BFFLabels[0][5]
---- Nat Pagle 1358
REP.BFFLabels[1358] = {} -- Stranger
REP.BFFLabels[1358][8400] = REP_TXT.BFFFishingMastersLabels[2]
REP.BFFLabels[1358][16800] = REP_TXT.BFFFishingMastersLabels[3]
REP.BFFLabels[1358][25200] = REP_TXT.BFFFishingMastersLabels[4]
REP.BFFLabels[1358][33600] = REP_TXT.BFFFishingMastersLabels[5]
REP.BFFLabels[1358][42000] = REP_TXT.BFFFishingMastersLabels[6]
---- Brawl'gar Arena (Season 2) 1690
REP.BFFLabels[1690] = {} -- Rank 1
REP.BFFLabels[1690][1000] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[1690][2000] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[1690][3000] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[1690][4000] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[1690][5000] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[1690][6000] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[1690][7000] = REP_TXT.STAND_LV_RANK[8]
REP.BFFLabels[1690][8000] = REP_TXT.STAND_LV_RANK[9]
REP.BFFLabels[1690][9000] = REP_TXT.STAND_LV_MAX_RANK
---- Delvar Ironfist 1733
REP.BFFLabels[1733] = {} -- Bodyguard
REP.BFFLabels[1733][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1733][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Tormmok 1736
REP.BFFLabels[1736] = {} -- Bodyguard
REP.BFFLabels[1736][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1736][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Talonpriest Ishaal 1737
REP.BFFLabels[1737] = {} -- Bodyguard
REP.BFFLabels[1737][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1737][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Defender Illona 1738
REP.BFFLabels[1738] = {} -- Bodyguard
REP.BFFLabels[1738][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1738][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Vivianne 1739
REP.BFFLabels[1739] = {} -- Bodyguard
REP.BFFLabels[1739][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1739][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Aeda Brightdawn 1740
REP.BFFLabels[1740] = {} -- Bodyguard
REP.BFFLabels[1740][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1740][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- Leorajh 1741
REP.BFFLabels[1741] = {} -- Bodyguard
REP.BFFLabels[1741][10000] = REP_TXT.BFFBarracksBodyguardsLabels[2]
REP.BFFLabels[1741][20000] = REP_TXT.BFFBarracksBodyguardsLabels[3]
---- The First Responders 1984 (This is a hidden faction)
REP.BFFLabels[1984] = {} -- Intern
REP.BFFLabels[1984][1000] = REP_TXT.BFFLabels[1984][1]
REP.BFFLabels[1984][2000] = REP_TXT.BFFLabels[1984][2]
REP.BFFLabels[1984][3000] = REP_TXT.BFFLabels[1984][3]
---- Brawl'gar Arena (Season 3) 2010
REP.BFFLabels[2010] = {} -- Rank 1
REP.BFFLabels[2010][1000] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2010][2000] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2010][3000] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2010][4000] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2010][5000] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2010][6000] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2010][7000] = REP_TXT.STAND_LV_RANK[8]
REP.BFFLabels[2010][8000] = REP_TXT.STAND_LV_RANK[9]
REP.BFFLabels[2010][9000] = REP_TXT.STAND_LV_MAX_RANK
---- Bizmo's Brawlpub (Season 3) 2011
REP.BFFLabels[2011] = {} -- Rank 1
REP.BFFLabels[2011][1000] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2011][2000] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2011][3000] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2011][4000] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2011][5000] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2011][6000] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2011][7000] = REP_TXT.STAND_LV_RANK[8]
REP.BFFLabels[2011][8000] = REP_TXT.STAND_LV_RANK[9]
REP.BFFLabels[2011][9000] = REP_TXT.STAND_LV_MAX_RANK
---- Ilyssia of the Waters 2097
REP.BFFLabels[2097] = {}
REP.BFFLabels[2097][8400] = REP_TXT.BFFFishingMastersLabels[2]
REP.BFFLabels[2097][16800] = REP_TXT.BFFFishingMastersLabels[3]
REP.BFFLabels[2097][25200] = REP_TXT.BFFFishingMastersLabels[4]
REP.BFFLabels[2097][33600] = REP_TXT.BFFFishingMastersLabels[5]
REP.BFFLabels[2097][42000] = REP_TXT.BFFFishingMastersLabels[6]
---- Keeper Raynae 2098
REP.BFFLabels[2098] = {}
REP.BFFLabels[2098][8400] = REP_TXT.BFFFishingMastersLabels[2]
REP.BFFLabels[2098][16800] = REP_TXT.BFFFishingMastersLabels[3]
REP.BFFLabels[2098][25200] = REP_TXT.BFFFishingMastersLabels[4]
REP.BFFLabels[2098][33600] = REP_TXT.BFFFishingMastersLabels[5]
REP.BFFLabels[2098][42000] = REP_TXT.BFFFishingMastersLabels[6]
---- Akule Riverhorn 2099
REP.BFFLabels[2099] = {}
REP.BFFLabels[2099][8400] = REP_TXT.BFFFishingMastersLabels[2]
REP.BFFLabels[2099][16800] = REP_TXT.BFFFishingMastersLabels[3]
REP.BFFLabels[2099][25200] = REP_TXT.BFFFishingMastersLabels[4]
REP.BFFLabels[2099][33600] = REP_TXT.BFFFishingMastersLabels[5]
REP.BFFLabels[2099][42000] = REP_TXT.BFFFishingMastersLabels[6]
---- Corbyn 2100
REP.BFFLabels[2100] = {}
REP.BFFLabels[2100][8400] = REP_TXT.BFFLabels[2100][1]
REP.BFFLabels[2100][16800] = REP_TXT.BFFLabels[2100][2]
REP.BFFLabels[2100][25200] = REP_TXT.BFFLabels[2100][3]
REP.BFFLabels[2100][33600] = REP_TXT.BFFLabels[2100][4]
REP.BFFLabels[2100][42000] = REP_TXT.BFFLabels[2100][5]
---- Sha'leth 2101
REP.BFFLabels[2101] = {}
REP.BFFLabels[2101][8400] = REP_TXT.BFFFishingMastersLabels[2]
REP.BFFLabels[2101][16800] = REP_TXT.BFFFishingMastersLabels[3]
REP.BFFLabels[2101][25200] = REP_TXT.BFFFishingMastersLabels[4]
REP.BFFLabels[2101][33600] = REP_TXT.BFFFishingMastersLabels[5]
REP.BFFLabels[2101][42000] = REP_TXT.BFFFishingMastersLabels[6]
---- Chromie 2135
REP.BFFLabels[2135] = {} -- Whelpling
REP.BFFLabels[2135][1000] = REP_TXT.BFFLabels[2135][1]
REP.BFFLabels[2135][2500] = REP_TXT.BFFLabels[2135][2]
REP.BFFLabels[2135][4500] = REP_TXT.BFFLabels[2135][3]
REP.BFFLabels[2135][7000] = REP_TXT.BFFLabels[2135][4]
REP.BFFLabels[2135][10000] = REP_TXT.BFFLabels[2135][5]
REP.BFFLabels[2135][15000] = REP_TXT.BFFLabels[2135][6]
---- Bizmo's Brawlpub 2371
REP.BFFLabels[2371] = {} -- Rank 1
REP.BFFLabels[2371][1000] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2371][2000] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2371][3000] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2371][4000] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2371][5000] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2371][6000] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2371][7000] = REP_TXT.STAND_LV_MAX_RANK
---- Brawl'gar Arena 2372
REP.BFFLabels[2372] = {} -- Rank 1
REP.BFFLabels[2372][1000] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2372][2000] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2372][3000] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2372][4000] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2372][5000] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2372][6000] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2372][7000] = REP_TXT.STAND_LV_MAX_RANK
---- Neri Sharpfin 2389
REP.BFFLabels[2389] = {} -- Rank 1
REP.BFFLabels[2389][300] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2389][600] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2389][900] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2389][1200] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2389][1500] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2389][1800] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2389][2100] = REP_TXT.STAND_LV_RANK[8]
REP.BFFLabels[2389][2400] = REP_TXT.STAND_LV_RANK[9]
REP.BFFLabels[2389][2700] = REP_TXT.STAND_LV_RANK[10]
REP.BFFLabels[2389][3000] = REP_TXT.STAND_LV_RANK[11]
REP.BFFLabels[2389][3300] = REP_TXT.STAND_LV_RANK[12]
REP.BFFLabels[2389][3600] = REP_TXT.STAND_LV_RANK[13]
REP.BFFLabels[2389][3900] = REP_TXT.STAND_LV_RANK[14]
REP.BFFLabels[2389][4200] = REP_TXT.STAND_LV_RANK[15]
REP.BFFLabels[2389][4500] = REP_TXT.STAND_LV_RANK[16]
REP.BFFLabels[2389][4800] = REP_TXT.STAND_LV_RANK[17]
REP.BFFLabels[2389][5100] = REP_TXT.STAND_LV_RANK[18]
REP.BFFLabels[2389][5400] = REP_TXT.STAND_LV_RANK[19]
REP.BFFLabels[2389][5700] = REP_TXT.STAND_LV_RANK[20]
REP.BFFLabels[2389][6000] = REP_TXT.STAND_LV_RANK[21]
REP.BFFLabels[2389][6300] = REP_TXT.STAND_LV_RANK[22]
REP.BFFLabels[2389][6600] = REP_TXT.STAND_LV_RANK[23]
REP.BFFLabels[2389][6900] = REP_TXT.STAND_LV_RANK[24]
REP.BFFLabels[2389][7200] = REP_TXT.STAND_LV_RANK[25]
REP.BFFLabels[2389][7500] = REP_TXT.STAND_LV_RANK[26]
REP.BFFLabels[2389][7800] = REP_TXT.STAND_LV_RANK[27]
REP.BFFLabels[2389][8100] = REP_TXT.STAND_LV_RANK[28]
REP.BFFLabels[2389][8400] = REP_TXT.STAND_LV_RANK[29]
REP.BFFLabels[2389][8700] = REP_TXT.STAND_LV_RANK[30]
---- Vim Brineheart 2390
REP.BFFLabels[2390] = {} -- Rank 1
REP.BFFLabels[2390][300] = REP_TXT.STAND_LV_RANK[2]
REP.BFFLabels[2390][600] = REP_TXT.STAND_LV_RANK[3]
REP.BFFLabels[2390][900] = REP_TXT.STAND_LV_RANK[4]
REP.BFFLabels[2390][1200] = REP_TXT.STAND_LV_RANK[5]
REP.BFFLabels[2390][1500] = REP_TXT.STAND_LV_RANK[6]
REP.BFFLabels[2390][1800] = REP_TXT.STAND_LV_RANK[7]
REP.BFFLabels[2390][2100] = REP_TXT.STAND_LV_RANK[8]
REP.BFFLabels[2390][2400] = REP_TXT.STAND_LV_RANK[9]
REP.BFFLabels[2390][2700] = REP_TXT.STAND_LV_RANK[10]
REP.BFFLabels[2390][3000] = REP_TXT.STAND_LV_RANK[11]
REP.BFFLabels[2390][3300] = REP_TXT.STAND_LV_RANK[12]
REP.BFFLabels[2390][3600] = REP_TXT.STAND_LV_RANK[13]
REP.BFFLabels[2390][3900] = REP_TXT.STAND_LV_RANK[14]
REP.BFFLabels[2390][4200] = REP_TXT.STAND_LV_RANK[15]
REP.BFFLabels[2390][4500] = REP_TXT.STAND_LV_RANK[16]
REP.BFFLabels[2390][4800] = REP_TXT.STAND_LV_RANK[17]
REP.BFFLabels[2390][5100] = REP_TXT.STAND_LV_RANK[18]
REP.BFFLabels[2390][5400] = REP_TXT.STAND_LV_RANK[19]
REP.BFFLabels[2390][5700] = REP_TXT.STAND_LV_RANK[20]
REP.BFFLabels[2390][6000] = REP_TXT.STAND_LV_RANK[21]
REP.BFFLabels[2390][6300] = REP_TXT.STAND_LV_RANK[22]
REP.BFFLabels[2390][6600] = REP_TXT.STAND_LV_RANK[23]
REP.BFFLabels[2390][6900] = REP_TXT.STAND_LV_RANK[24]
REP.BFFLabels[2390][7200] = REP_TXT.STAND_LV_RANK[25]
REP.BFFLabels[2390][7500] = REP_TXT.STAND_LV_RANK[26]
REP.BFFLabels[2390][7800] = REP_TXT.STAND_LV_RANK[27]
REP.BFFLabels[2390][8100] = REP_TXT.STAND_LV_RANK[28]
REP.BFFLabels[2390][8400] = REP_TXT.STAND_LV_RANK[29]
REP.BFFLabels[2390][8700] = REP_TXT.STAND_LV_RANK[30]
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
---- Hunt-Captain Korayn 2451
REP.BFFLabels[2451] = {} -- Stranger
REP.BFFLabels[2451][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[2451][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[2451][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[2451][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[2451][42000] = REP_TXT.BFFLabels[0][5]
---- Rendle and Cudgelface 2453
REP.BFFLabels[2453] = {} -- Stranger
REP.BFFLabels[2453][8400] = REP_TXT.BFFLabels[0][1]
REP.BFFLabels[2453][16800] = REP_TXT.BFFLabels[0][2]
REP.BFFLabels[2453][25200] = REP_TXT.BFFLabels[0][3]
REP.BFFLabels[2453][33600] = REP_TXT.BFFLabels[0][4]
REP.BFFLabels[2453][42000] = REP_TXT.BFFLabels[0][5]
---- Wrathion 2517
REP.BFFLabels[2517] = {} -- Acquaintance
REP.BFFLabels[2517][8400] = REP_TXT.BFFLabels[2517][1]
REP.BFFLabels[2517][16800] = REP_TXT.BFFLabels[2517][2]
REP.BFFLabels[2517][25200] = REP_TXT.BFFLabels[2517][3]
REP.BFFLabels[2517][33600] = REP_TXT.BFFLabels[2517][4]
REP.BFFLabels[2517][42000] = REP_TXT.BFFLabels[2517][5]
---- Sabellian 2518
REP.BFFLabels[2518] = {} -- Acquaintance
REP.BFFLabels[2518][8400] = REP_TXT.BFFLabels[2518][1]
REP.BFFLabels[2518][16800] = REP_TXT.BFFLabels[2518][2]
REP.BFFLabels[2518][25200] = REP_TXT.BFFLabels[2518][3]
REP.BFFLabels[2518][33600] = REP_TXT.BFFLabels[2518][4]
REP.BFFLabels[2518][42000] = REP_TXT.BFFLabels[2518][5]
---- Artisan's Consortium - Dragon Isles Branch 2544
REP.BFFLabels[2544] = {} -- Neutral
REP.BFFLabels[2544][500] = REP_TXT.BFFLabels[2544][1]
REP.BFFLabels[2544][2500] = REP_TXT.BFFLabels[2544][2]
REP.BFFLabels[2544][5500] = REP_TXT.BFFLabels[2544][3]
REP.BFFLabels[2544][12500] = REP_TXT.BFFLabels[2544][4]
---- Cobalt Assembly 2550
REP.BFFLabels[2550] = {} -- Empty
REP.BFFLabels[2550][300] = REP_TXT.BFFLabels[2550][1]
REP.BFFLabels[2550][1200] = REP_TXT.BFFLabels[2550][2]
REP.BFFLabels[2550][3600] = REP_TXT.BFFLabels[2550][3]
REP.BFFLabels[2550][10000] = REP_TXT.BFFLabels[2550][4]
---- Soridormi 2553
REP.BFFLabels[2553] = {} -- Anomaly
REP.BFFLabels[2553][7000] = REP_TXT.BFFLabels[2553][1]
REP.BFFLabels[2553][14000] = REP_TXT.BFFLabels[2553][2]
REP.BFFLabels[2553][24000] = REP_TXT.BFFLabels[2553][3]
REP.BFFLabels[2553][42000] = REP_TXT.BFFLabels[2553][4]
---- The Weaver 2601
REP.BFFLabels[2601] = {} -- Stranger
REP.BFFLabels[2601][2500] = REP_TXT.BFFLabels[2601][1]
REP.BFFLabels[2601][5000] = REP_TXT.BFFLabels[2601][2]
REP.BFFLabels[2601][7500] = REP_TXT.BFFLabels[2601][3]
REP.BFFLabels[2601][10000] = REP_TXT.BFFLabels[2601][4]
REP.BFFLabels[2601][12500] = REP_TXT.BFFLabels[2601][5]
REP.BFFLabels[2601][15000] = REP_TXT.BFFLabels[2601][6]
REP.BFFLabels[2601][17500] = REP_TXT.BFFLabels[2601][7]
REP.BFFLabels[2601][20000] = REP_TXT.BFFLabels[2601][8]
---- The General 2605
REP.BFFLabels[2605] = {} -- Stranger
REP.BFFLabels[2605][2500] = REP_TXT.BFFLabels[2605][1]
REP.BFFLabels[2605][5000] = REP_TXT.BFFLabels[2605][2]
REP.BFFLabels[2605][7500] = REP_TXT.BFFLabels[2605][3]
REP.BFFLabels[2605][10000] = REP_TXT.BFFLabels[2605][4]
REP.BFFLabels[2605][12500] = REP_TXT.BFFLabels[2605][5]
REP.BFFLabels[2605][15000] = REP_TXT.BFFLabels[2605][6]
REP.BFFLabels[2605][17500] = REP_TXT.BFFLabels[2605][7]
REP.BFFLabels[2605][20000] = REP_TXT.BFFLabels[2605][8]
---- The Vizier 2607
REP.BFFLabels[2607] = {} -- Stranger
REP.BFFLabels[2607][2500] = REP_TXT.BFFLabels[2607][1]
REP.BFFLabels[2607][5000] = REP_TXT.BFFLabels[2607][2]
REP.BFFLabels[2607][7500] = REP_TXT.BFFLabels[2607][3]
REP.BFFLabels[2607][10000] = REP_TXT.BFFLabels[2607][4]
REP.BFFLabels[2607][12500] = REP_TXT.BFFLabels[2607][5]
REP.BFFLabels[2607][15000] = REP_TXT.BFFLabels[2607][6]
REP.BFFLabels[2607][17500] = REP_TXT.BFFLabels[2607][7]
REP.BFFLabels[2607][20000] = REP_TXT.BFFLabels[2607][8]
---- Azerothian Archives 2615
REP.BFFLabels[2615] = {} -- Graduate
REP.BFFLabels[2615][10500] = REP_TXT.BFFLabels[2615][1]
REP.BFFLabels[2615][21000] = REP_TXT.BFFLabels[2615][2]
REP.BFFLabels[2615][32500] = REP_TXT.BFFLabels[2615][3]
REP.BFFLabels[2615][42000] = REP_TXT.BFFLabels[2615][4]
---- Brann Bronzebeard 2640
REP.BFFLabels[2640] = {} -- Level 1
REP.BFFLabels[2640][1500] = REP_TXT.STAND_LV_LEVEL[2]
REP.BFFLabels[2640][3500] = REP_TXT.STAND_LV_LEVEL[3]
REP.BFFLabels[2640][6100] = REP_TXT.STAND_LV_LEVEL[4]
REP.BFFLabels[2640][9400] = REP_TXT.STAND_LV_LEVEL[5]
REP.BFFLabels[2640][13500] = REP_TXT.STAND_LV_LEVEL[6]
REP.BFFLabels[2640][18500] = REP_TXT.STAND_LV_LEVEL[7]
REP.BFFLabels[2640][24500] = REP_TXT.STAND_LV_LEVEL[8]
REP.BFFLabels[2640][31600] = REP_TXT.STAND_LV_LEVEL[9]
REP.BFFLabels[2640][39900] = REP_TXT.STAND_LV_LEVEL[10]
REP.BFFLabels[2640][48200] = REP_TXT.STAND_LV_LEVEL[11]
REP.BFFLabels[2640][56500] = REP_TXT.STAND_LV_LEVEL[12]
REP.BFFLabels[2640][64800] = REP_TXT.STAND_LV_LEVEL[13]
REP.BFFLabels[2640][73100] = REP_TXT.STAND_LV_LEVEL[14]
REP.BFFLabels[2640][81400] = REP_TXT.STAND_LV_LEVEL[15]
REP.BFFLabels[2640][98000] = REP_TXT.STAND_LV_LEVEL[16]
REP.BFFLabels[2640][114600] = REP_TXT.STAND_LV_LEVEL[17]
REP.BFFLabels[2640][131200] = REP_TXT.STAND_LV_LEVEL[18]
REP.BFFLabels[2640][147800] = REP_TXT.STAND_LV_LEVEL[19]
REP.BFFLabels[2640][164400] = REP_TXT.STAND_LV_LEVEL[20]
REP.BFFLabels[2640][181000] = REP_TXT.STAND_LV_LEVEL[21]
REP.BFFLabels[2640][197600] = REP_TXT.STAND_LV_LEVEL[22]
REP.BFFLabels[2640][214200] = REP_TXT.STAND_LV_LEVEL[23]
REP.BFFLabels[2640][230800] = REP_TXT.STAND_LV_LEVEL[24]
REP.BFFLabels[2640][247400] = REP_TXT.STAND_LV_LEVEL[25]
REP.BFFLabels[2640][280600] = REP_TXT.STAND_LV_LEVEL[26]
REP.BFFLabels[2640][313800] = REP_TXT.STAND_LV_LEVEL[27]
REP.BFFLabels[2640][347000] = REP_TXT.STAND_LV_LEVEL[28]
REP.BFFLabels[2640][380200] = REP_TXT.STAND_LV_LEVEL[29]
REP.BFFLabels[2640][413400] = REP_TXT.STAND_LV_LEVEL[30]
REP.BFFLabels[2640][446600] = REP_TXT.STAND_LV_LEVEL[31]
REP.BFFLabels[2640][479800] = REP_TXT.STAND_LV_LEVEL[32]
REP.BFFLabels[2640][513000] = REP_TXT.STAND_LV_LEVEL[33]
REP.BFFLabels[2640][546200] = REP_TXT.STAND_LV_LEVEL[34]
REP.BFFLabels[2640][579400] = REP_TXT.STAND_LV_LEVEL[35]
REP.BFFLabels[2640][645800] = REP_TXT.STAND_LV_LEVEL[36]
REP.BFFLabels[2640][712200] = REP_TXT.STAND_LV_LEVEL[37]
REP.BFFLabels[2640][778600] = REP_TXT.STAND_LV_LEVEL[38]
REP.BFFLabels[2640][845000] = REP_TXT.STAND_LV_LEVEL[39]
REP.BFFLabels[2640][911400] = REP_TXT.STAND_LV_LEVEL[40]
REP.BFFLabels[2640][977800] = REP_TXT.STAND_LV_LEVEL[41]
REP.BFFLabels[2640][1044200] = REP_TXT.STAND_LV_LEVEL[42]
REP.BFFLabels[2640][1110600] = REP_TXT.STAND_LV_LEVEL[43]
REP.BFFLabels[2640][1177000] = REP_TXT.STAND_LV_LEVEL[44]
REP.BFFLabels[2640][1243400] = REP_TXT.STAND_LV_LEVEL[45]
REP.BFFLabels[2640][1326400] = REP_TXT.STAND_LV_LEVEL[46]
REP.BFFLabels[2640][1409400] = REP_TXT.STAND_LV_LEVEL[47]
REP.BFFLabels[2640][1492400] = REP_TXT.STAND_LV_LEVEL[48]
REP.BFFLabels[2640][1575400] = REP_TXT.STAND_LV_LEVEL[49]
REP.BFFLabels[2640][1658400] = REP_TXT.STAND_LV_LEVEL[50]
REP.BFFLabels[2640][1741400] = REP_TXT.STAND_LV_LEVEL[51]
REP.BFFLabels[2640][1824400] = REP_TXT.STAND_LV_LEVEL[52]
REP.BFFLabels[2640][1907400] = REP_TXT.STAND_LV_LEVEL[53]
REP.BFFLabels[2640][1990400] = REP_TXT.STAND_LV_LEVEL[54]
REP.BFFLabels[2640][2073400] = REP_TXT.STAND_LV_LEVEL[55]
REP.BFFLabels[2640][2197900] = REP_TXT.STAND_LV_LEVEL[56]
REP.BFFLabels[2640][2322400] = REP_TXT.STAND_LV_LEVEL[57]
REP.BFFLabels[2640][2446900] = REP_TXT.STAND_LV_LEVEL[58]
REP.BFFLabels[2640][2571400] = REP_TXT.STAND_LV_LEVEL[59]
REP.BFFLabels[2640][2695900] = REP_TXT.STAND_LV_LEVEL[60]
REP.BFFLabels[2640][2820400] = REP_TXT.STAND_LV_LEVEL[61]
REP.BFFLabels[2640][2944900] = REP_TXT.STAND_LV_LEVEL[62]
REP.BFFLabels[2640][3069400] = REP_TXT.STAND_LV_LEVEL[63]
REP.BFFLabels[2640][3193900] = REP_TXT.STAND_LV_LEVEL[64]
REP.BFFLabels[2640][3318400] = REP_TXT.STAND_LV_LEVEL[65]
REP.BFFLabels[2640][3467800] = REP_TXT.STAND_LV_LEVEL[66]
REP.BFFLabels[2640][3617200] = REP_TXT.STAND_LV_LEVEL[67]
REP.BFFLabels[2640][3766600] = REP_TXT.STAND_LV_LEVEL[68]
REP.BFFLabels[2640][3916000] = REP_TXT.STAND_LV_LEVEL[69]
REP.BFFLabels[2640][4065400] = REP_TXT.STAND_LV_LEVEL[70]
REP.BFFLabels[2640][4214800] = REP_TXT.STAND_LV_LEVEL[71]
REP.BFFLabels[2640][4364200] = REP_TXT.STAND_LV_LEVEL[72]
REP.BFFLabels[2640][4513600] = REP_TXT.STAND_LV_LEVEL[73]
REP.BFFLabels[2640][4663000] = REP_TXT.STAND_LV_LEVEL[74]
REP.BFFLabels[2640][4812400] = REP_TXT.STAND_LV_LEVEL[75]
REP.BFFLabels[2640][4978400] = REP_TXT.STAND_LV_LEVEL[76]
REP.BFFLabels[2640][5144400] = REP_TXT.STAND_LV_LEVEL[77]
REP.BFFLabels[2640][5310400] = REP_TXT.STAND_LV_LEVEL[78]
REP.BFFLabels[2640][5476400] = REP_TXT.STAND_LV_LEVEL[79]
REP.BFFLabels[2640][5642400] = REP_TXT.STAND_LV_LEVEL[80]
REP.BFFLabels[2640][5808400] = REP_TXT.STAND_LV_LEVEL[81]
REP.BFFLabels[2640][5974400] = REP_TXT.STAND_LV_LEVEL[82]
REP.BFFLabels[2640][6140400] = REP_TXT.STAND_LV_LEVEL[83]
REP.BFFLabels[2640][6306400] = REP_TXT.STAND_LV_LEVEL[84]
REP.BFFLabels[2640][6472400] = REP_TXT.STAND_LV_LEVEL[85]
REP.BFFLabels[2640][6655000] = REP_TXT.STAND_LV_LEVEL[86]
REP.BFFLabels[2640][6837600] = REP_TXT.STAND_LV_LEVEL[87]
REP.BFFLabels[2640][7020200] = REP_TXT.STAND_LV_LEVEL[88]
REP.BFFLabels[2640][7202800] = REP_TXT.STAND_LV_LEVEL[89]
REP.BFFLabels[2640][7385400] = REP_TXT.STAND_LV_LEVEL[90]
REP.BFFLabels[2640][7568000] = REP_TXT.STAND_LV_LEVEL[91]
REP.BFFLabels[2640][7750600] = REP_TXT.STAND_LV_LEVEL[92]
REP.BFFLabels[2640][7933200] = REP_TXT.STAND_LV_LEVEL[93]
REP.BFFLabels[2640][8115800] = REP_TXT.STAND_LV_LEVEL[94]
REP.BFFLabels[2640][8298400] = REP_TXT.STAND_LV_LEVEL[95]
REP.BFFLabels[2640][8505900] = REP_TXT.STAND_LV_LEVEL[96]
REP.BFFLabels[2640][8713400] = REP_TXT.STAND_LV_LEVEL[97]
REP.BFFLabels[2640][8920900] = REP_TXT.STAND_LV_LEVEL[98]
REP.BFFLabels[2640][9128400] = REP_TXT.STAND_LV_LEVEL[99]
REP.BFFLabels[2640][9335900] = REP_TXT.STAND_LV_LEVEL[100]
