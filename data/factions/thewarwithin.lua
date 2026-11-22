----------------------------------------------------------
-- Reputation Guide | Reputation sources: The War Within --
-- Factions (and sources) added in The War Within. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(2570, { -- Hallowfall Arathi
  Quest{ from = 1, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 150, zone = "Hallowfall", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 8, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2590, { -- Council of Dornogal
  Quest{ from = 3, to = 25, id = 83240, rep = 1000, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83240 - The Theater Troupe
  Quest{ from = 3, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
  General{ from = 1, to = 8, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2594, { -- The Assembly of the Deeps
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 150, zone = "The_Ringing_Deeps", renown = true, since = "thewarwithin" },
  Quest{ from = 1, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
})

REP:RegisterFaction(2600, { -- The Severed Threads
  General{ from = 1, to = 8, text = "gainANewRankWithOneOf", rep = 2500, headText = "gainANewRankWithTheSub", tipText = "gainingANewReputationRankWithOne", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2601, { -- The Weaver
  Quest{ from = 1, to = 8, id = 80670, rep = 1500, since = "thewarwithin" }, -- QuestID: 80670 - Eyes of the Weaver
  Quest{ from = 1, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 50, zone = "Azj_Kahet", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 8, text = "nerubianOfferings", rep = 50, headText = "nerubianOfferings", tipText = "openingNerubianOfferingsAroundAzjKahetWill", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2605, { -- The General
  Quest{ from = 1, to = 8, id = 80671, rep = 1500, since = "thewarwithin" }, -- QuestID: 80671 - Blade of the General
  Quest{ from = 1, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 50, zone = "Azj_Kahet", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 8, text = "nerubianOfferings", rep = 50, headText = "nerubianOfferings", tipText = "openingNerubianOfferingsAroundAzjKahetWill", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2607, { -- The Vizier
  Quest{ from = 1, to = 8, id = 80672, rep = 1500, since = "thewarwithin" }, -- QuestID: 80672 - Hand of the Vizier
  Quest{ from = 1, to = 25, id = 83458, rep = 1500, repeatable = true, renown = true, since = "thewarwithin" }, -- QuestID: 83458 - Priory of the Sacred Flame (weekly)
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 50, zone = "Azj_Kahet", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 8, text = "nerubianOfferings", rep = 50, headText = "nerubianOfferings", tipText = "openingNerubianOfferingsAroundAzjKahetWill", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2640, { -- Brann Bronzebeard
  Item{ from = 1, to = 60, rep = 100, items = {[228071] = 1}, renown = true, since = "thewarwithin" }, -- Chunk of Companion Experience (Uncommon)
  Item{ from = 1, to = 60, rep = 250, items = {[228072] = 1}, renown = true, since = "thewarwithin" }, -- Chunk of Companion Experience (Rare)
  Item{ from = 1, to = 60, rep = 525, items = {[228073] = 1}, renown = true, since = "thewarwithin" }, -- Chunk of Companion Experience (Epic)
  General{ from = 1, to = 60, text = "firstDelveOfTheDay", rep = 5600, headText = "firstDelveOfTheDay", tipText = "completeTheFirstDelveOfTheDay", renown = true, since = "thewarwithin" },
})

REP:RegisterFaction(2653, { -- The Cartels of Undermine
  Mob{ from = 1, to = 20, text = "allRareMobs", rep = 50, zone = "Undermine", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 20, text = "manyJobsHandleIt", rep = 1000, headText = "weeklyQuest", tipText = "completeTheManyJobsHandleItWeekly", renown = true, since = "thewarwithin" }, -- QuestID: 85869
  General{ from = 1, to = 20, text = "urgeToSurge", rep = 1000, headText = "weeklyQuest", tipText = "completeTheUrgeToSurgeWeeklyQuest", renown = true, since = "thewarwithin" }, -- QuestID: 86775
  General{ from = 1, to = 8, text = "reduceReuseResell", rep = 1000, headText = "weeklyQuest", tipText = "completeTheReduceReuseResellWeeklyQuest", renown = true, since = "thewarwithin" }, -- QuestID: 85879
})

REP:RegisterFaction(2671, { -- Venture Company
  General{ from = 1, to = 8, text = "manyJobsHandleIt", rep = 1000, headText = "weeklyQuest", tipText = "completeTheManyJobsHandleItWeekly", since = "thewarwithin" }, -- QuestID: 85869
  General{ from = 1, to = 8, text = "urgeToSurge", rep = 1000, headText = "weeklyQuest", tipText = "completeTheUrgeToSurgeWeeklyQuest", since = "thewarwithin" }, -- QuestID: 86775
  General{ from = 1, to = 8, text = "reduceReuseResell", rep = 1000, headText = "weeklyQuest", tipText = "completeTheReduceReuseResellWeeklyQuest", since = "thewarwithin" }, -- QuestID: 85879
})

REP:RegisterFaction(2673, { -- The Bilgewater Cartel
  General{ from = 1, to = 8, text = "manyJobsHandleIt", rep = 1000, headText = "weeklyQuest", tipText = "completeTheManyJobsHandleItWeekly", since = "thewarwithin" }, -- QuestID: 85869
  General{ from = 1, to = 8, text = "urgeToSurge", rep = 1000, headText = "weeklyQuest", tipText = "completeTheUrgeToSurgeWeeklyQuest", since = "thewarwithin" }, -- QuestID: 86775
  General{ from = 1, to = 8, text = "reduceReuseResell", rep = 1000, headText = "weeklyQuest", tipText = "completeTheReduceReuseResellWeeklyQuest", since = "thewarwithin" }, -- QuestID: 85879
})

REP:RegisterFaction(2675, { -- The Blackwater Cartel
  General{ from = 1, to = 8, text = "manyJobsHandleIt", rep = 1000, headText = "weeklyQuest", tipText = "completeTheManyJobsHandleItWeekly", since = "thewarwithin" }, -- QuestID: 85869
  General{ from = 1, to = 8, text = "urgeToSurge", rep = 1000, headText = "weeklyQuest", tipText = "completeTheUrgeToSurgeWeeklyQuest", since = "thewarwithin" }, -- QuestID: 86775
  General{ from = 1, to = 8, text = "reduceReuseResell", rep = 1000, headText = "weeklyQuest", tipText = "completeTheReduceReuseResellWeeklyQuest", since = "thewarwithin" }, -- QuestID: 85879
})

REP:RegisterFaction(2677, { -- Steamwheedle Cartel
  General{ from = 1, to = 8, text = "manyJobsHandleIt", rep = 1000, headText = "weeklyQuest", tipText = "completeTheManyJobsHandleItWeekly", since = "thewarwithin" }, -- QuestID: 85869
  General{ from = 1, to = 8, text = "urgeToSurge", rep = 1000, headText = "weeklyQuest", tipText = "completeTheUrgeToSurgeWeeklyQuest", since = "thewarwithin" }, -- QuestID: 86775
  General{ from = 1, to = 8, text = "reduceReuseResell", rep = 1000, headText = "weeklyQuest", tipText = "completeTheReduceReuseResellWeeklyQuest", since = "thewarwithin" }, -- QuestID: 85879
})

REP:RegisterFaction(2658, { -- The K'aresh Trust (renown 1 - 20, 2500 per rank)
  General{ from = 1, to = 20, text = "kareshLoreObjects", rep = 250, headText = "kareshLoreObjects", tipText = "readTheLoreObjectsInKaresh", renown = true, since = "thewarwithin" }, -- 10 lore objects, once per warband
  Mob{ from = 1, to = 20, text = "allRareMobs", rep = 5, zone = "K_aresh", renown = true, since = "thewarwithin" }, -- once a day per warband
  General{ from = 1, to = 20, text = "weeklyDungeonQuestDornogal", rep = 1500, headText = "weeklyQuest", tipText = "chooseTheKareshTrustTokenFromTheWeekly", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 20, text = "bountifulDelveKareshToken", rep = 1100, headText = "bountifulDelves", tipText = "bountifulDelveChestsCanRewardAKaresh", renown = true, since = "thewarwithin" }, -- chance, once per warband
})

REP:RegisterFaction(2685, { -- Gallagio Loyalty Rewards Club (raid renown 1 - 20, max +1 renown per week)
  General{ from = 1, to = 20, text = "louBosses", rep = 450, headText = "liberationOfUndermine", tipText = "defeatTheFirstSixBossesOfLiberation", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 20, text = "louMugZee", rep = 600, headText = "liberationOfUndermine", tipText = "defeatMugZeeInLiberationOfUndermine", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 20, text = "louGallywix", rep = 1000, headText = "liberationOfUndermine", tipText = "defeatChromeKingGallywixInLiberation", renown = true, since = "thewarwithin" },
  General{ from = 1, to = 20, text = "louLieutenants", rep = 100, headText = "liberationOfUndermine", tipText = "defeatTheSevenLieutenantsInLiberation", renown = true, since = "thewarwithin" },
})
