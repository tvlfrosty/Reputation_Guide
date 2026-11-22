----------------------------------------------------------
-- Reputation Guide | Reputation sources: Battle for Azeroth --
-- Factions (and sources) added in Battle for Azeroth. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(2164, { -- Champions of Azeroth
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa" },
  General{ from = 1, to = 8, text = "championsOfAzerothEmissary", rep = 1500, headText = "championsOfAzerothEmissary", tipText = "complete4xChampionsOfAzerothWorldQuests", since = "bfa" },
})

REP:RegisterFaction(2163, { -- Tortollan Seekers
  General{ from = 1, to = 8, text = "tortollanSeekers", rep = 175, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa" },
  General{ from = 1, to = 8, text = "tortollanSeekersEmissary", rep = 1500, headText = "tortollanSeekersEmissary", tipText = "complete3xTortollanSeekersWorldQuestsWhile", since = "bfa" },
})

REP:RegisterFaction(2391, { -- Rustbolt Resistance
  General{ from = 1, to = 8, text = "dailyWorldQuest", rep = 850, headText = "dailyWorldQuest", tipText = "completeTheDailyWorldQuestToGain", since = "bfa" },
  General{ from = 1, to = 8, text = "dailyPetBattleWorldQuest", rep = 75, headText = "dailyPetBattle", tipText = "completeTheDailyPetBattleWorldQuest", since = "bfa" },
  General{ from = 1, to = 8, text = "pvpDailyQuest", rep = 200, headText = "dailyPvpQuest", tipText = "completeAPvpDailyQuestToGain", since = "bfa" },
  General{ from = 1, to = 8, text = "dailyQuests75Rep", rep = 75, headText = "dailyQuests", tipText = "dailyQuestsThatProvide75Reputation", since = "bfa" },
  General{ from = 1, to = 8, text = "dailyQuests150Rep", rep = 150, headText = "dailyQuests", tipText = "dailyQuestsThatProvide150Reputation", since = "bfa" },
})

REP:RegisterFaction(2415, { -- Rajani
  Quest{ from = 1, to = 8, id = 57008, rep = 500, since = "bfa" },
  Quest{ from = 1, to = 8, id = 57728, rep = 500, since = "bfa" },
  Quest{ from = 1, to = 8, id = 56064, rep = 1500, since = "bfa" },
  General{ from = 1, to = 8, text = "dailyQuests125Rep", rep = 125, headText = "dailyQuests", tipText = "dailyQuestsThatProvide125Reputation", since = "bfa" },
  General{ from = 1, to = 8, text = "threatObjectives5075Rep", rep = 50, headText = "threatObjectives", tipText = "completingThreatObjectivesMarkedByASkull", since = "bfa" },
  General{ from = 1, to = 8, text = "dailyPetBattleWorldQuest", rep = 75, headText = "dailyPetBattle", tipText = "completeTheDailyPetBattleWorldQuest", since = "bfa" },
})

REP:RegisterFaction(2417, { -- Uldum Accord
  Quest{ from = 1, to = 8, id = 55350, rep = 500, since = "bfa" },
  Quest{ from = 1, to = 8, id = 56308, rep = 500, since = "bfa" },
  Quest{ from = 1, to = 8, id = 57157, rep = 1500, since = "bfa" },
  General{ from = 1, to = 8, text = "dailyQuests125Rep", rep = 125, headText = "dailyQuests", tipText = "dailyQuestsThatProvide125Reputation", since = "bfa" },
  General{ from = 1, to = 8, text = "threatObjectives5075Rep", rep = 50, headText = "threatObjectives", tipText = "completingThreatObjectivesMarkedByASkull", since = "bfa" },
  General{ from = 1, to = 8, text = "dailyPetBattleWorldQuest", rep = 75, headText = "dailyPetBattle", tipText = "completeTheDailyPetBattleWorldQuest", since = "bfa" },
})

REP:RegisterFaction(2135, { -- Chromie
  General{ from = 1, to = 8, text = "runChromieScenariosInDragonblight", rep = 3000, headText = "completeChromieScenarios", tipText = "completeChromieTimeScenariosInDragonblight", since = "bfa" },
})

REP:RegisterFaction(2160, { -- Proudmoore Admiralty
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "proudmooreAdmiraltyEmissary", rep = 1500, headText = "proudmooreAdmiraltyEmissary", tipText = "complete4xProudmooreAdmiraltyWorldQuestsWhile", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2161, { -- Order of Embers
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "orderOfEmbersEmissary", rep = 1500, headText = "orderOfEmbersEmissary", tipText = "complete4xOrderOfEmbersWorldQuests", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2162, { -- Storm's Wake
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "stormSWakeEmissary", rep = 1500, headText = "stormSWakeEmissary", tipText = "complete4xStormSWakeWorldQuests", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2159, { -- 7th Legion
  General{ from = 1, to = 8, text = "worldQuests75Rep", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "worldQuests150Rep", rep = 150, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "t7thLegionEmissary", rep = 1500, headText = "t7thLegionEmissary", tipText = "completing4x7thLegionWorldQuestsWhile", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "warfrontContributionQuests", rep = 150, headText = "warfrontContributionQuests", tipText = "completeAnyWarfrontContributionQuestWhenAvailable", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "islandExpeditionsWeekly", rep = 1500, headText = "islandExpeditionsWeekly", tipText = "completeTheIslandExpeditionsWeeklyAzeriteFor", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "callToArmsQuest", rep = 75, headText = "callToArmsQuest", tipText = "completeCallToArmsQuestToGain", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2400, { -- Waveblade Ankoan
  Item{ from = 1, to = 8, rep = 150, items = {[170152] = 1}, since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "wavebladeAnkoanWorldQuests", rep = 75, headText = "wavebladeAnkoanEmissary", tipText = "completeWavebladeAnkoanWorldQuestsToGain", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "wavebladeAnkoanEmissary", rep = 1500, headText = "wavebladeAnkoanEmissary", tipText = "complete4xWavebladeAnkoanWorldQuestsWhile", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "laboratoryOfMardivasWeekly", rep = 500, headText = "laboratoryOfMardivasWeekly", tipText = "completeTheLaboratoryOfMardivasWeeklyQuest", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "battleForNazjatarPvpWorldQuest", rep = 500, headText = "battleForNazjatarPvpWorldQuest", tipText = "completeTheBattleForNazjatarPvpWorld", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "summonsFromTheDepthsEvent", rep = 150, headText = "summonsFromTheDepthsEvent", tipText = "completeTheSummonsFromTheDepthsEvent", since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "bountiesRequisitionQuests", rep = 50, headText = "bountesRequisitionQuets", tipText = "completeBountiesAndRequisitionQuestsToGain", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2395, { -- Honeyback Hive
  Item{ from = 1, to = 8, rep = 20, items = {[168822] = 1}, since = "bfa", side = "Alliance" }, -- Thin Jelly
  Item{ from = 1, to = 8, rep = 80, items = {[168825] = 1}, since = "bfa", side = "Alliance" }, -- Rich Jelly
  Item{ from = 1, to = 8, rep = 160, items = {[168828] = 1}, since = "bfa", side = "Alliance" }, -- Royal Jelly
  Mob{ from = 1, to = 8, text = "honeySmasherDaily", rep = 500, since = "bfa", side = "Alliance" },
  General{ from = 1, to = 8, text = "harvesterEventRareMobQuestDropWeekly", rep = 750, headText = "harvesterEventRareMobQuestDrop", tipText = "questItemsHaveAChanceToDrop", since = "bfa", side = "Alliance" },
})

REP:RegisterFaction(2103, { -- Zandalari Empire
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "zandalariEmpireEmissary", rep = 1500, headText = "zandalariEmpireEmissary", tipText = "complete4xZandalariEmpireWorldQuestsWhile", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Horde" },
})

REP:RegisterFaction(2156, { -- Talanji's Expedition
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "talanjiSExpeditionEmissary", rep = 1500, headText = "talanjiSExpeditionEmissary", tipText = "complete4xTalanjiSExpeditionWorldQuests", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Horde" },
})

REP:RegisterFaction(2158, { -- Voldunai
  General{ from = 1, to = 8, text = "worldQuests", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "voldunaiEmissary", rep = 1500, headText = "voldunaiEmissary", tipText = "complete4xVoldunaiWorldQuestsWhileThe", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Horde" },
})

REP:RegisterFaction(2157, { -- The Honorbound
  General{ from = 1, to = 8, text = "worldQuests75Rep", rep = 75, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "worldQuests150Rep", rep = 150, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "theHonorboundEmissary", rep = 1500, headText = "theHonorboundEmissary", tipText = "complete4xTheHonorboundWorldQuestsWhile", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "warfrontContributionQuests", rep = 150, headText = "warfrontContributionQuests", tipText = "completeAnyWarfrontContributionQuestWhenAvailable", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "islandExpeditionsWeekly", rep = 1500, headText = "islandExpeditionsWeekly", tipText = "completeTheIslandExpeditionsWeeklyAzeriteFor2", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "callToArmsQuest", rep = 75, headText = "callToArmsQuest", tipText = "completeCallToArmsQuestToGain", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "nagaAttackWorldQuest", rep = 150, headText = "nagaAttackWorldQuest", tipText = "completeTheNagaAttackWorldQuestTo", since = "bfa", side = "Horde" },
})

REP:RegisterFaction(2373, { -- The Unshackled
  Item{ from = 1, to = 8, rep = 150, items = {[170152] = 1}, since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "theUnshackledWorldQuests", rep = 75, headText = "theUnshackledEmissary", tipText = "completeTheUnshackledWorldQuestsToGain", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "theUnshackledEmissary", rep = 1500, headText = "theUnshackledEmissary", tipText = "complete4xTheUnshackledWorldQuestsWhile", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "laboratoryOfMardivasWeekly", rep = 500, headText = "laboratoryOfMardivasWeekly", tipText = "completeTheLaboratoryOfMardivasWeeklyQuest", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "battleForNazjatarPvpWorldQuest", rep = 500, headText = "battleForNazjatarPvpWorldQuest", tipText = "completeTheBattleForNazjatarPvpWorld", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "summonsFromTheDepthsEvent", rep = 150, headText = "summonsFromTheDepthsEvent", tipText = "completeTheSummonsFromTheDepthsEvent", since = "bfa", side = "Horde" },
  General{ from = 1, to = 8, text = "bountiesRequisitionQuests", rep = 50, headText = "bountesRequisitionQuets", tipText = "completeBountiesAndRequisitionQuestsToGain", since = "bfa", side = "Horde" },
})
