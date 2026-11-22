----------------------------------------------------------
-- Reputation Guide | Reputation sources: Legion --
-- Factions (and sources) added in Legion. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(2045, { -- Armies of Legionfall
  Item{ from = 1, to = 8, rep = 250, items = {[146949] = 1}, altItems = {[146950] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 750, items = {[147727] = 1}, altItems = {[152464] = 1}, since = "legion" },
  Quest{ from = 1, to = 8, id = 46277, rep = 150, items = {[1342] = 100}, since = "legion" },
  Quest{ from = 1, to = 8, id = 46736, rep = 150, items = {[1342] = 100}, since = "legion" },
  Quest{ from = 1, to = 8, id = 46735, rep = 150, items = {[1342] = 100}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 75, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 75, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "eliteWorldQuests", rep = 75, headText = "eliteWorldQuests", tipText = "completeEliteWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "legionfallDungeonWorldQuest", rep = 250, headText = "legionfallDungeonWorldQuest", tipText = "completeDungeonWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "worldBossWorldQuest", rep = 500, headText = "worldBossWorldQuest", tipText = "completeWorldBossWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "raidWorldQuests", rep = 500, headText = "epicEliteWorldQuests", tipText = "completeRaidWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "armiesOfLegionfallEmissary", rep = 1500, headText = "armiesOfLegionfallEmissary", tipText = "complete4xArmiesOfLegionfallWorldQuests", since = "legion" },
})

REP:RegisterFaction(1900, { -- Court of Farondis
  Item{ from = 1, to = 8, rep = 250, items = {[146937] = 1}, altItems = {[146943] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 1500, items = {[147410] = 1}, altItems = {[150927] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "pvpWorldQuest", rep = 75, headText = "pvpWorldQuests", tipText = "completePvpWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "eliteWorldQuests", rep = 250, headText = "eliteWorldQuests", tipText = "completeEliteWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 250, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 250, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "courtOfFarondinsEmissary", rep = 1500, headText = "courtOfFarondinsEmissary", tipText = "complete4xCourtOfFarondisWorldQuests", since = "legion" },
})

REP:RegisterFaction(1883, { -- Dreamweavers
  Item{ from = 1, to = 8, rep = 250, items = {[146936] = 1}, altItems = {[146942] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 1500, items = {[147411] = 1}, altItems = {[150926] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "pvpWorldQuest", rep = 75, headText = "pvpWorldQuests", tipText = "completePvpWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 250, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 250, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dreamweaversEmissary", rep = 1500, headText = "dreamweaversEmissaryEmissary", tipText = "complete4xDreamweaversWorldQuestsWhileThe", since = "legion" },
})

REP:RegisterFaction(1828, { -- Highmountain Tribe
  Item{ from = 1, to = 8, rep = 250, items = {[146938] = 1}, altItems = {[146944] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 1500, items = {[147412] = 1}, altItems = {[150928] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "pvpWorldQuest", rep = 75, headText = "pvpWorldQuests", tipText = "completePvpWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "epicWorldQuest", rep = 75, headText = "epicWorldQuests", tipText = "completeEpicWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 250, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 250, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "highmountainTribeEmissary", rep = 1500, headText = "highmountainTribeEmissary", tipText = "complete4xHighmountainTribeWorldQuestsWhile", since = "legion" },
})

REP:RegisterFaction(1859, { -- The Nightfallen
  Item{ from = 1, to = 8, rep = 250, items = {[146940] = 1}, altItems = {[146946] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 750, items = {[147413] = 1}, altItems = {[150930] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction2", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis2", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 500, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 500, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "raidWorldQuests", rep = 500, headText = "raidWorldQuests", tipText = "completeRaidWorldQuestsWithThisFaction2", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeworkOrderWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "theNightfallenEmissary", rep = 1500, headText = "theNightfallenEmissary", tipText = "complete4xNightfallenWorldQuestsWhileThe", since = "legion" },
})

REP:RegisterFaction(1894, { -- The Wardens
  Item{ from = 1, to = 8, rep = 250, items = {[146939] = 1}, altItems = {[146945] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 1500, items = {[147415] = 1}, altItems = {[150929] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 350, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 250, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction2", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "theWardensEmissary", rep = 1500, headText = "theWardensEmissary", tipText = "complete4xWardensWorldQuestsWhileThe", since = "legion" },
})

REP:RegisterFaction(1948, { -- Valarjar
  Item{ from = 1, to = 8, rep = 250, items = {[146935] = 1}, altItems = {[146941] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 1500, items = {[147414] = 1}, altItems = {[150925] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "normalWorldQuest", rep = 75, headText = "normalWorldQuests", tipText = "completeNormalWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "pvpWorldQuest", rep = 75, headText = "pvpWorldQuests", tipText = "completePvpWorldQuestsWithThisFaction", since = "legion" },
  General{ from = 1, to = 8, text = "rareWorldQuests", rep = 150, headText = "rareWorldQuests", tipText = "completeRareWorldQuestsWithThisFaction2", since = "legion" },
  General{ from = 1, to = 8, text = "rareEliteWorldQuests", rep = 250, headText = "rareEliteWorldQuests", tipText = "completeRareEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "epicEliteWorldQuests", rep = 250, headText = "epicEliteWorldQuests", tipText = "completeEpicEliteWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "dungeonWorldQuests", rep = 250, headText = "dungeonWorldQuests", tipText = "completeDungeonWorldQuestsWithThisFaction2", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuests", rep = 250, headText = "workOrderWorldQuests", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "valarjarEmissary", rep = 1500, headText = "valarjarEmissary", tipText = "complete4xValarjarWorldQuestsWhileThe", since = "legion" },
})

REP:RegisterFaction(1975, { -- Conjurer Margoss
  Item{ from = 1, to = 8, rep = 50, items = {[138777] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 500, items = {[138777] = 10}, since = "legion" },
})

REP:RegisterFaction(2097, { -- Ilyssia of the Waters
  Item{ from = 1, to = 8, rep = 75, items = {[146848] = 1}, since = "legion" },
})

REP:RegisterFaction(2100, { -- Corbyn
  Item{ from = 1, to = 8, rep = 75, items = {[146961] = 1}, since = "legion" },
})

REP:RegisterFaction(2102, { -- Impus
  Item{ from = 1, to = 8, rep = 75, items = {[146963] = 1}, since = "legion" },
})

REP:RegisterFaction(2101, { -- Sha'leth
  Item{ from = 1, to = 8, rep = 75, items = {[146962] = 1}, since = "legion" },
})

REP:RegisterFaction(2098, { -- Keeper Raynae
  Item{ from = 1, to = 8, rep = 75, items = {[146959] = 1}, since = "legion" },
})

REP:RegisterFaction(2099, { -- Akule Riverhorn
  Item{ from = 1, to = 8, rep = 75, items = {[146960] = 1}, since = "legion" },
})

REP:RegisterFaction(2018, { -- Talons Vengeance
  Item{ from = 1, to = 8, rep = 100, items = {[142363] = 1}, since = "legion" },
})

REP:RegisterFaction(2165, { -- Army of the Light
  Item{ from = 1, to = 8, rep = 250, items = {[152958] = 1}, altItems = {[152957] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 750, items = {[152956] = 1}, altItems = {[152955] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", since = "legion" },
  General{ from = 1, to = 8, text = "suppliesNeededWorldQuest", rep = 25, headText = "suppliesNeededWorldQuest", tipText = "completeSuppliesNeededWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "suppliesNeededAstralGlory", rep = 10, headText = "suppliesNeededAstralGlory", tipText = "completeSuppliesNeededAstralGloryToGain", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuest", rep = 25, headText = "workOrderWorldQuest", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderAstralGlory", rep = 10, headText = "workOrderAstralGlory", tipText = "completeWorkOrderAstralGloryToGain", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderTearsOfTheNaaru", rep = 10, headText = "workOrderTearsOfTheNaaru", tipText = "completeSuppliesWorkOrderTearsOfThe", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderLightbloodElixirs", rep = 10, headText = "workOrderLightbloodElixirs", tipText = "completeWorkOrderLightbloodElixirsToGain", since = "legion" },
  General{ from = 1, to = 8, text = "armyOfTheLightEmissary", rep = 1500, headText = "armyOfTheLightEmissary", tipText = "complete4xArmyOfTheLightWorld", since = "legion" },
  General{ from = 1, to = 8, text = "invasionOnslaughtWeekly", rep = 250, headText = "weeklyQuest", tipText = "completeTheInvasionOnslaightWeeklyQuestTo", since = "legion" },
  General{ from = 1, to = 8, text = "supplyingTheAntoranCampaignWeekly", rep = 75, headText = "weeklyQuest", tipText = "completeTheSupplyingTheAntoranCampaignWeekly", since = "legion" },
})

REP:RegisterFaction(2170, { -- Argussian Reach
  Item{ from = 1, to = 8, rep = 250, items = {[152959] = 1}, altItems = {[152960] = 1}, since = "legion" },
  Item{ from = 1, to = 8, rep = 750, items = {[152961] = 1}, altItems = {[152954] = 1}, since = "legion" },
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", since = "legion" },
  General{ from = 1, to = 8, text = "suppliesNeededWorldQuest", rep = 25, headText = "suppliesNeededWorldQuest", tipText = "completeSuppliesNeededWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "suppliesNeededAstralGlory", rep = 10, headText = "suppliesNeededAstralGlory", tipText = "completeSuppliesNeededAstralGloryToGain", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderWorldQuest", rep = 25, headText = "workOrderWorldQuest", tipText = "completeWorkOrderWorldQuestsWithThis", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderAstralGlory", rep = 10, headText = "workOrderAstralGlory", tipText = "completeWorkOrderAstralGloryToGain", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderTearsOfTheNaaru", rep = 10, headText = "workOrderTearsOfTheNaaru", tipText = "completeSuppliesWorkOrderTearsOfThe", since = "legion" },
  General{ from = 1, to = 8, text = "workOrderLightbloodElixirs", rep = 10, headText = "workOrderLightbloodElixirs", tipText = "completeWorkOrderLightbloodElixirsToGain", since = "legion" },
  General{ from = 1, to = 8, text = "argussianReachEmissary", rep = 1500, headText = "argussianReachEmissary", tipText = "complete4xArgussianReachWorldQuestsWhile", since = "legion" },
  General{ from = 1, to = 8, text = "fuelOfADoomedWorldWeekly", rep = 250, headText = "weeklyQuest", tipText = "completeTheFuelOfADoomedWorld", since = "legion" },
})
