----------------------------------------------------------
-- Reputation Guide | Reputation sources: Dragonflight --
-- Factions (and sources) added in Dragonflight. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(2503, { -- Maruuk Centaur
  Quest{ from = 1, to = 25, text = "teethForATooth", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Teeth For A Tooth
  Quest{ from = 1, to = 25, text = "whereRiversSleep", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Where Rivers Sleep
  Quest{ from = 1, to = 25, text = "countingArgali", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Counting Argali
  Quest{ from = 1, to = 25, text = "delicacyInTheDark", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Delicacy in the Dark
  Quest{ from = 1, to = 25, text = "scalingEverHigher", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Scaling Ever Higher
  Quest{ from = 1, to = 25, text = "ofWindAndWater", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Of Wind And Water
  Quest{ from = 1, to = 25, text = "darkenedClouds", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Darkened Clouds
  Quest{ from = 1, to = 25, text = "anApportunisticApproach", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- An Apportunistic Approach
  Quest{ from = 1, to = 25, text = "traditionNotForgotten", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Tradition Not Forgotten
  Quest{ from = 1, to = 25, text = "duckDuckTrap", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Duck, Duck, Trap
  Quest{ from = 1, to = 25, text = "thunderingPlains", rep = 300, repeatable = true, renown = true, since = "dragonflight" }, -- Thundering Plains
  Quest{ from = 1, to = 25, text = "theBestDefense", rep = 300, repeatable = true, renown = true, since = "dragonflight" }, -- The Best Defense...
  Quest{ from = 1, to = 25, text = "bloodOfDragons", rep = 300, repeatable = true, renown = true, since = "dragonflight" }, -- Blood of Dragons
  Quest{ from = 1, to = 25, text = "bakarDreamOfLostArgali", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Bakar Dream of Lost Argali
  Quest{ from = 1, to = 25, text = "draconicDefensive", rep = 150, repeatable = true, renown = true, since = "dragonflight" }, -- Draconic Defensive
  Item{ from = 1, to = 25, rep = 25, items = {[200093] = 1}, renown = true, since = "dragonflight" }, -- Centaur Hunting Trophy
  Item{ from = 1, to = 25, rep = 500, items = {[200093] = 20}, renown = true, since = "dragonflight" }, -- Centaur Hunting Trophy
  Item{ from = 1, to = 25, rep = 50, items = {[200288] = 1}, renown = true, since = "dragonflight" }, -- Maruuk Centaur Insignia
})

REP:RegisterFaction(2507, { -- Dragonscale Expedition
  Quest{ from = 1, to = 25, id = 72259, rep = 30, items = {[201411] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Vault Artifacts
  Quest{ from = 1, to = 25, id = 72260, rep = 150, items = {[201411] = 5}, repeatable = true, renown = true, since = "dragonflight" }, -- Vault Artifacts
  Item{ from = 1, to = 25, rep = 15, items = {[192055] = 1}, renown = true, since = "dragonflight" }, -- Dragon Isles Artifact
  Item{ from = 1, to = 25, rep = 50, items = {[200285] = 1}, renown = true, since = "dragonflight" }, -- Dragonscale Expedition Insignia
  General{ from = 1, to = 25, text = "plantingFlagsOnHighPeaks", rep = 250, headText = "plantingFlagsOnHighPeaks", tipText = "plantingFlagsOnHighPeaksOnThe", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2510, { -- Valdrakken Accord
  Quest{ from = 1, to = 30, id = 66130, rep = 50, items = {[191264] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Unlocking Our Past QuestID: 66130
  Item{ from = 1, to = 30, rep = 15, items = {[199906] = 1}, renown = true, since = "dragonflight" }, -- Titan Relic
  Item{ from = 1, to = 30, rep = 50, items = {[200289] = 1}, renown = true, since = "dragonflight" }, -- Valdrakken Accord Insignia
  Item{ from = 5, to = 30, rep = 250, items = {[200072] = 1}, renown = true, since = "dragonflight" }, -- Dragonbane Keep Strongbox
  General{ from = 1, to = 30, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "dragonflight" },
  General{ from = 1, to = 30, text = "dragonIslesWorldBoss", rep = 150, headText = "dragonIslesWorldBoss", tipText = "defeatDragonIslesWorldBossOnceA", renown = true, since = "dragonflight" },
  General{ from = 5, to = 30, text = "siegeOnDragonbaneKeep", rep = 50, headText = "siegeOnDragonbaneKeep", tipText = "completeTheSiegeOnDragonbaneKeepEvent", renown = true, since = "dragonflight" },
  General{ from = 5, to = 30, text = "firstSiegeOnDragonbaneKeepEventOf", rep = 250, headText = "siegeOnDragonbaneKeep", tipText = "completeTheSiegeOnDragonbaneKeepEvent", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2511, { -- Iskaara Tuskarr
  Quest{ from = 1, to = 30, id = 70926, rep = 75, items = {[200071] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Stolen Totems QuestID: 70926
  Quest{ from = 1, to = 30, id = 70927, rep = 75, items = {[200071] = 5}, repeatable = true, renown = true, since = "dragonflight" }, -- More Stolen Totems QuestID: 70927
  Quest{ from = 1, to = 30, id = 70893, rep = 500, repeatable = true, renown = true, since = "dragonflight" }, -- Community Feast QuestID: 70893
  Quest{ from = 4, to = 30, id = 70199, rep = 100, items = {[194730] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Scalebelly Mackerel QuestID: 70199
  Quest{ from = 4, to = 30, id = 70200, rep = 100, items = {[194966] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Thousandbite Piranha QuestID: 70200
  Quest{ from = 4, to = 30, id = 70201, rep = 100, items = {[194967] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Aileron Seamoth QuestID: 70201
  Quest{ from = 4, to = 30, id = 70202, rep = 100, items = {[194968] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Cerulean Spinefish QuestID: 70202
  Quest{ from = 4, to = 30, id = 70203, rep = 100, items = {[194969] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Temporal Dragonhead QuestID: 70203
  Quest{ from = 4, to = 30, id = 70935, rep = 200, items = {[194970] = 20}, repeatable = true, renown = true, since = "dragonflight" }, -- Catch and Release: Islefin Dorado QuestID: 70935
  Item{ from = 1, to = 30, rep = 50, items = {[200287] = 1}, renown = true, since = "dragonflight" }, -- Iskaara Tuskarr Insignia
  General{ from = 1, to = 30, text = "chefTasksCommunityFeast", rep = 25, headText = "chefTasksCommunityFeast", tipText = "completeChefTasksDuringTheCommunityFeast", renown = true, since = "dragonflight" },
  General{ from = 1, to = 30, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2517, { -- Wrathion
  Quest{ from = 1, to = 6, id = 66130, rep = 250, items = {[191264] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Unlocking Our Past QuestID: 66130
  Quest{ from = 1, to = 6, id = 66133, rep = 1000, items = {[191255] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Keys of Loyalty QuestID: 66133
  Mob{ from = 1, to = 6, text = "shasIth", rep = 250, zone = "The_Waking_Shores", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 6, npc = 55265, name = "Morchok", rep = 100, zone = "The_Waking_Shores", renown = true, since = "dragonflight" },
  Item{ from = 1, to = 6, rep = 50, items = {[201991] = 1}, since = "dragonflight" }, -- Sargha's Signet
})

REP:RegisterFaction(2518, { -- Sabellian
  Quest{ from = 1, to = 6, id = 66131, rep = 250, items = {[191264] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Unlocking Our Past QuestID: 66131
  Quest{ from = 1, to = 6, id = 66805, rep = 1000, items = {[191255] = 1}, repeatable = true, renown = true, since = "dragonflight" }, -- Keys of Loyalty QuestID: 66805
  Mob{ from = 1, to = 6, text = "deathSShadow", rep = 250, zone = "The_Waking_Shores", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 6, npc = 55265, name = "Morchok", rep = 100, zone = "The_Waking_Shores", renown = true, since = "dragonflight" },
  Item{ from = 1, to = 6, rep = 50, items = {[200224] = 1}, since = "dragonflight" }, -- Mark of Sargha
})

REP:RegisterFaction(2524, { -- Obsidian Warders
  General{ from = 1, to = 8, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", since = "dragonflight", side = "Alliance" },
})

REP:RegisterFaction(2523, { -- Dark Talons
  General{ from = 1, to = 8, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", since = "dragonflight", side = "Horde" },
})

REP:RegisterFaction(2544, { -- Artisan's Consortium - Dragon Isles Branch
  General{ from = 1, to = 8, text = "worldQuests", rep = 100, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionWhile", since = "dragonflight" },
})

REP:RegisterFaction(2550, { -- Cobalt Assembly
  General{ from = 1, to = 8, text = "uncommonModerateArcanaFromSunderedFlameEnemies", rep = 15, headText = "sunderedFlameEnemies", tipText = "defeatSunderedFlameEnemiesNearTheCobalt", since = "dragonflight" },
  General{ from = 1, to = 8, text = "rareMajorArcanaFromSunderedFlameEnemies", rep = 45, headText = "sunderedFlameEnemies", tipText = "defeatSunderedFlameEnemiesNearTheCobalt", since = "dragonflight" },
})

REP:RegisterFaction(2553, { -- Soridormi
  Instance{ from = 1, to = 8, instance = "Dawn_Of_The_Infinite", rep = 500, since = "dragonflight" },
  Instance{ from = 1, to = 8, instance = "Dawn_Of_The_Infinite", rep = 2000, heroic = true, since = "dragonflight" },
})

REP:RegisterFaction(2564, { -- Loamm Niffen
  Quest{ from = 1, to = 20, id = 75665, rep = 500, repeatable = true, renown = true, since = "dragonflight" }, -- A Worthy Ally: Loamm Niffen QuestID: 75665
  Item{ from = 1, to = 20, rep = 50, items = {[205365] = 1}, renown = true, since = "dragonflight" }, -- Loamm Niffen Insignia
  General{ from = 1, to = 20, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "dragonflight" },
  General{ from = 5, to = 20, text = "researchersUnderFire", rep = 250, headText = "researchersUnderFire", tipText = "completeTheResearchersUnderFireEvent", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2574, { -- Dream Wardens
  Quest{ from = 1, to = 20, id = 78444, rep = 500, repeatable = true, renown = true, since = "dragonflight" }, -- QuestID: 78444 - A Worthy Ally: Dream Wardens
  Item{ from = 1, to = 20, rep = 25, items = {[211303] = 1}, renown = true, since = "dragonflight" }, -- Dryad's Supply Pouch
  Item{ from = 1, to = 20, rep = 500, items = {[210421] = 1}, renown = true, since = "dragonflight" }, -- Dream Wardens Insignia
  Mob{ from = 1, to = 20, text = "envoyOfWinter", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 20, text = "firebrandFystia", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 20, text = "greedyGessie", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 20, text = "nuoberon", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 20, text = "raszagethSLastBreath", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  Mob{ from = 1, to = 20, text = "reefbreakerMoruud", rep = 25, zone = "Emerald_dream", renown = true, since = "dragonflight" },
  General{ from = 1, to = 20, text = "worldQuests", rep = 50, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2593, { -- Keg Leg's Crew
  General{ from = 1, to = 40, text = "earnPlunderInPlunderstorm", rep = 1, headText = "earnPlunderInPlunderstorm", tipText = "earnPlunderInPlunderstormToGainRenown", renown = true, since = "dragonflight" },
})

REP:RegisterFaction(2615, { -- Azerothian Archives
  Quest{ from = 1, to = 8, id = 79226, rep = 3000, since = "dragonflight" }, -- QuestID: 79226 - The Big Dig: Traitor's Rest
  Item{ from = 1, to = 8, rep = 25, items = {[213185] = 1}, since = "dragonflight" }, -- Dusty Centaur Tome
  Item{ from = 1, to = 8, rep = 25, items = {[213175] = 1}, since = "dragonflight" }, -- Dusty Djaradin Tome
  Item{ from = 1, to = 8, rep = 25, items = {[213188] = 1}, since = "dragonflight" }, -- Dusty Dracthyr Tome
  Item{ from = 1, to = 8, rep = 25, items = {[213187] = 1}, since = "dragonflight" }, -- Dusty Drakonid Tome
  Item{ from = 1, to = 8, rep = 25, items = {[213186] = 1}, since = "dragonflight" }, -- Dusty Niffen Tome
  Item{ from = 1, to = 8, rep = 50, items = {[213190] = 1}, since = "dragonflight" }, -- Preserved Djaradin Tome
  Item{ from = 1, to = 8, rep = 50, items = {[213189] = 1}, since = "dragonflight" }, -- Preserved Dragonkin Tome
  Item{ from = 1, to = 8, rep = 50, items = {[213176] = 1}, since = "dragonflight" }, -- Preserved Isles Tome
  Item{ from = 1, to = 8, rep = 100, items = {[213177] = 1}, since = "dragonflight" }, -- Immaculate Tome
  General{ from = 1, to = 8, text = "worldQuests", rep = 300, headText = "worldQuests", tipText = "completeWorldQuestsWithThisFactionTo2", since = "dragonflight" },
})

REP:RegisterFaction(2526, { -- Winterpelt Furbolg (Azure Span)
  General{ from = 3, to = 3, text = "winterpeltQuestlines", rep = 3000, headText = "winterpeltQuestlines", tipText = "completeTheWinterpeltQuestlinesOfSonova", since = "dragonflight" }, -- up to Neutral
  -- One questline (one standing) per 25 language skill.
  General{ from = 4, to = 4, text = "furbolgLanguageQuestline", rep = 3000, headText = "furbolgLanguage", tipText = "everyTwentyFiveFurbolgLanguageSkill", since = "dragonflight" },
  General{ from = 5, to = 5, text = "furbolgLanguageQuestline", rep = 6000, headText = "furbolgLanguage", tipText = "everyTwentyFiveFurbolgLanguageSkill", since = "dragonflight" },
  General{ from = 6, to = 6, text = "furbolgLanguageQuestline", rep = 12000, headText = "furbolgLanguage", tipText = "everyTwentyFiveFurbolgLanguageSkill", since = "dragonflight" },
  General{ from = 7, to = 7, text = "furbolgLanguageQuestline", rep = 21000, headText = "furbolgLanguage", tipText = "everyTwentyFiveFurbolgLanguageSkill", since = "dragonflight" },
})
