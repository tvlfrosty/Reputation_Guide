----------------------------------------------------------
-- Reputation Guide | Reputation sources: Cataclysm --
-- Factions (and sources) added in Cataclysm. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(1168, { -- Guild
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests", since = "cata" },
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn2", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests2", factor = 0.5, since = "cata" },
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn3", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests3", factor = 1, since = "cata" },
})

REP:RegisterFaction(1204, { -- Avengers of Hyjal
  Mob{ from = 4, to = 5, npc = 52122, name = "Druid of the Flame", rep = 5, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 52447, name = "Cinderweb Spiderling", rep = 5, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53127, name = "Fire Scorpion", rep = 5, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 52524, name = "Cinderweb Spinner", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 52581, name = "Cinderweb Drone", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53096, name = "Fire Turtle Hatchling", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53187, name = "Flamewaker Animator", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53223, name = "Flamewaker Beast Handler", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53121, name = "Flamewaker Cauterizer", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53222, name = "Flamewaker Centurion", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53119, name = "Flamewaker Forward Guard", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 54073, name = "Flamewaker Hound Master", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53120, name = "Flamewaker Pathfinder", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53085, name = "Flamewaker Sentinel", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53224, name = "Flamewaker Taskmaster", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53244, name = "Flamewaker Trainee", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53128, name = "Giant Fire Scorpion", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, text = "harbringerOfFlame", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53206, name = "Hell Hound", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53095, name = "Matriarch Fire Turtle", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53141, name = "Molten Surger", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53545, name = "Molten Spewer", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53094, name = "Patriarch Fire Turtle", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53116, name = "Unbound Blazing Elemental", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53167, name = "Unbound Pyrelord", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 5, npc = 53732, name = "Unbound Smoldering Elemental", rep = 15, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53134, name = "Ancient Core Hound", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53786, name = "Blazing Monstrosity", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 54161, name = "Flame Archon", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53185, name = "Flamewaker Overseer", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53188, name = "Flamewaker Subjugator", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53616, name = "Kar the Everburning", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53617, name = "Molten Erupter", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 54143, name = "Molten Flamefather", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53115, name = "Molten Lord", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 6, npc = 53901, name = "Unstable Magma", rep = 50, zone = "Firelands", since = "cata" },
  Mob{ from = 4, to = 8, npc = 52530, name = "Alysrazor", rep = 250, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 52498, name = "Beth'tilac", rep = 250, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 52558, name = "Lord Rhyolith", rep = 250, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 53691, name = "Shannox", rep = 250, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 53494, name = "Baleroc", rep = 400, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 52571, name = "Majordomo Staghelm", rep = 400, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, npc = 11502, name = "Ragnaros", rep = 400, zone = "Firelands", since = "shadowlands" },
  Mob{ from = 4, to = 8, text = "alysrazorNormal", rep = 250, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "alysrazorHeroic", rep = 500, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "bethTilacNormal", rep = 250, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "bethTilacHeroic", rep = 500, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "lordRhyolithNormal", rep = 250, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "lordRhyolithHeroic", rep = 500, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "shannoxNormal", rep = 250, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "shannoxHeroic", rep = 500, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "balerocNormal", rep = 400, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "balerocHeroic", rep = 800, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "majordomoStaghelmNormal", rep = 400, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "majordomoStaghelmHeroic", rep = 800, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "ragnarosNormal", rep = 400, zone = "Firelands", since = "cata", before = "shadowlands" },
  Mob{ from = 4, to = 8, text = "ragnarosHeroic", rep = 800, zone = "Firelands", since = "cata", before = "shadowlands" },
})

REP:RegisterFaction(1158, { -- Guardians of Hyjal
  Quest{ from = 4, to = 8, id = 29177, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29163, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29122, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29162, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29246, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29148, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29247, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29165, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29126, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29248, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29128, rep = 350, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29138, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29179, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29141, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29139, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29304, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29137, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29143, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29142, rep = 250, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29101, rep = 150, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29161, rep = 150, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29147, rep = 150, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29164, rep = 150, since = "cata", phase = "cata 2" },
  Quest{ from = 4, to = 8, id = 29125, rep = 150, since = "cata", phase = "cata 2" },
  Mob{ from = 1, to = 8, code = 1, rep = 10, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 1, rep = 15, map = 8, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 150, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 250, map = 8, since = "cata" },
  Item{ from = 1, to = 8, rep = 500, items = {[133152] = 1}, since = "wod" },
})

REP:RegisterFaction(1173, { -- Ramkahen
  Mob{ from = 1, to = 8, code = 1, rep = 10, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 1, rep = 15, map = 8, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 150, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 250, map = 8, since = "cata" },
  Quest{ from = 4, to = 8, id = 28250, rep = 150, since = "cata" },
  Quest{ from = 4, to = 8, id = 28736, rep = 250, since = "cata" },
  Item{ from = 1, to = 8, rep = 500, items = {[133154] = 1}, since = "wod" },
})

REP:RegisterFaction(1135, { -- The Earthen Ring
  Mob{ from = 1, to = 8, code = 1, rep = 10, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 1, rep = 15, map = 8, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 150, map = 7, since = "cata" },
  Mob{ from = 1, to = 8, code = 4, rep = 250, map = 8, since = "cata" },
  Item{ from = 1, to = 8, rep = 500, items = {[133159] = 1}, since = "wod" },
})

REP:RegisterFaction(1171, { -- Therazane
  Mob{ from = 1, to = 4, npc = 42917, name = "Twilight Duskwarden", rep = 5, zone = "Deepholm", since = "cata" },
  Mob{ from = 1, to = 4, npc = 42924, name = "Twilight Laborer", rep = 5, zone = "Deepholm", since = "cata" },
  Mob{ from = 1, to = 4, npc = 42823, name = "Twilight Priestess", rep = 5, zone = "Deepholm", since = "cata" },
  Mob{ from = 1, to = 4, npc = 42921, name = "Dragul Giantbutcher", rep = 10, zone = "Deepholm", since = "cata" },
  Mob{ from = 4, to = 8, code = 1, rep = 10, map = 7, since = "cata" },
  Mob{ from = 4, to = 8, code = 1, rep = 15, map = 8, since = "cata" },
  Mob{ from = 4, to = 8, code = 4, rep = 150, map = 7, since = "cata" },
  Mob{ from = 4, to = 8, code = 4, rep = 250, map = 8, since = "cata" },
  Quest{ from = 4, to = 8, id = 28488, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27046, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 26710, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27047, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27049, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27050, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27051, rep = 250, since = "cata" },
  Quest{ from = 4, to = 8, id = 27048, rep = 250, since = "cata" },
  Quest{ from = 5, to = 8, id = 28390, rep = 350, since = "cata" },
  Quest{ from = 5, to = 8, id = 28391, rep = 350, since = "cata" },
  Item{ from = 1, to = 8, rep = 500, items = {[133160] = 1}, since = "wod" },
  General{ from = 1, to = 6, text = "completingTheQuestlineUntilTheStoneThrone", rep = 55000, headText = "completeTheQuestlineUntilTheStoneThrone", tipText = "completingTheQuestlineUntilTheStoneThrone", since = "cata", race = "Human" },
  General{ from = 1, to = 6, text = "completingTheQuestlineUntilTheStoneThrone2", rep = 55000, headText = "completeTheQuestlineUntilTheStoneThrone", tipText = "completingTheQuestlineUntilTheStoneThrone2", since = "cata", notRace = "Human" },
})

REP:RegisterFaction(1174, { -- Wildhammer Clan
  Quest{ from = 4, to = 8, id = 28864, rep = 250, since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 28861, rep = 250, since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 28860, rep = 250, since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 28862, rep = 250, since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 28863, rep = 350, since = "cata", side = "Alliance" },
  Mob{ from = 1, to = 8, code = 1, rep = 10, map = 7, since = "cata", side = "Alliance" },
  Mob{ from = 1, to = 8, code = 1, rep = 15, map = 8, since = "cata", side = "Alliance" },
  Mob{ from = 1, to = 8, code = 4, rep = 150, map = 7, since = "cata", side = "Alliance" },
  Mob{ from = 1, to = 8, code = 4, rep = 250, map = 8, since = "cata", side = "Alliance" },
  Item{ from = 1, to = 8, rep = 500, items = {[133151] = 1}, since = "wod", side = "Alliance" },
})

REP:RegisterFaction(1177, { -- Baradin's Wardens
  Quest{ from = 4, to = 8, id = 27991, rep = 250, since = "cata", side = "Alliance" }, -- Taking the Overlook Back QuestID: 27991
  Quest{ from = 4, to = 8, id = 27975, rep = 250, since = "cata", side = "Alliance" }, -- WANTED: Foreman Wellson QuestID: 27975
  Quest{ from = 4, to = 8, id = 28275, rep = 250, since = "cata", side = "Alliance" }, -- Bombs Away! QuestID: 28275
  Quest{ from = 4, to = 8, id = 27987, rep = 250, since = "cata", side = "Alliance" }, -- Cannonball! QuestID: 27987
  Quest{ from = 4, to = 8, id = 27978, rep = 250, since = "cata", side = "Alliance" }, -- Ghostbuster QuestID: 27978
  Quest{ from = 4, to = 8, id = 27973, rep = 250, since = "cata", side = "Alliance" }, -- Watch Out For Splinters! QuestID: 27973
  Quest{ from = 4, to = 8, id = 28063, rep = 250, since = "cata", side = "Alliance" }, -- Leave No Weapon Behind QuestID: 28063
  Quest{ from = 4, to = 8, id = 28130, rep = 250, since = "cata", side = "Alliance" }, -- Not The Friendliest Town QuestID: 28130
  Quest{ from = 4, to = 8, id = 28059, rep = 250, since = "cata", side = "Alliance" }, -- Claiming The Keep QuestID: 28059
  Quest{ from = 4, to = 8, id = 28137, rep = 250, since = "cata", side = "Alliance" }, -- Teach A Man To Fish.... Or Steal QuestID: 28137
  Quest{ from = 4, to = 8, id = 27948, rep = 250, since = "cata", side = "Alliance" }, -- A Sticky Task QuestID: 27948
  Quest{ from = 4, to = 8, id = 27972, rep = 250, since = "cata", side = "Alliance" }, -- Boosting Morale QuestID: 27972
  Quest{ from = 4, to = 8, id = 27970, rep = 250, since = "cata", side = "Alliance" }, -- Captain P. Harris QuestID: 27970
  Quest{ from = 4, to = 8, id = 27971, rep = 250, since = "cata", side = "Alliance" }, -- Rattling Their Cages QuestID: 27971
  Quest{ from = 4, to = 8, id = 28050, rep = 350, since = "cata", side = "Alliance" }, -- Shark Tank QuestID: 28050
  Quest{ from = 4, to = 8, id = 27944, rep = 250, since = "cata", side = "Alliance" }, -- Thinning the Brood QuestID: 27944
  Quest{ from = 4, to = 8, id = 28046, rep = 250, since = "cata", side = "Alliance" }, -- Finish The Job QuestID: 28046
  Quest{ from = 4, to = 8, id = 27967, rep = 250, since = "cata", side = "Alliance" }, -- First Lieutenant Connor QuestID: 27967
  Quest{ from = 4, to = 8, id = 27992, rep = 250, since = "cata", side = "Alliance" }, -- Magnets, How Do They Work? QuestID: 27992
  Quest{ from = 4, to = 8, id = 27966, rep = 250, since = "cata", side = "Alliance" }, -- Salvaging the Remains QuestID: 27966
  Quest{ from = 4, to = 8, id = 27949, rep = 250, since = "cata", side = "Alliance" }, -- The Forgotten QuestID: 27949
  Quest{ from = 4, to = 8, id = 28122, rep = 350, since = "cata", side = "Alliance" }, -- A Huge Problem QuestID: 28122
  Quest{ from = 4, to = 8, id = 28162, rep = 350, since = "cata", side = "Alliance" }, -- Swamp Bait QuestID: 28162
  Quest{ from = 4, to = 8, id = 28163, rep = 350, since = "cata", side = "Alliance" }, -- The Leftovers QuestID: 28163
  Quest{ from = 4, to = 8, id = 28186, rep = 350, since = "cata", side = "Alliance" }, -- Cursed Shackles QuestID: 28186
  Quest{ from = 4, to = 8, id = 28165, rep = 350, since = "cata", side = "Alliance" }, -- D-Block QuestID: 28165
  Quest{ from = 4, to = 8, id = 28185, rep = 350, since = "cata", side = "Alliance" }, -- Svarnos QuestID: 28185
  Quest{ from = 4, to = 8, id = 28117, rep = 350, since = "cata", side = "Alliance" }, -- Clearing the Depths QuestID: 28117
  Quest{ from = 4, to = 8, id = 28120, rep = 350, since = "cata", side = "Alliance" }, -- Learning From The Past QuestID: 28120
  Quest{ from = 4, to = 8, id = 28118, rep = 350, since = "cata", side = "Alliance" }, -- The Imprisoned Archmage QuestID: 28118
  Quest{ from = 4, to = 8, id = 28232, rep = 350, since = "cata", side = "Alliance" }, -- Food From Below QuestID: 28232
  Quest{ from = 4, to = 8, id = 28188, rep = 350, since = "cata", side = "Alliance" }, -- Prison Revolt QuestID: 28188
  Quest{ from = 4, to = 8, id = 28223, rep = 350, since = "cata", side = "Alliance" }, -- The Warden QuestID: 28223
  Item{ from = 4, to = 8, rep = 250, items = {[63517] = 1}, since = "cata", side = "Alliance" },
})

REP:RegisterFaction(1134, { -- Gilneas
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreyLevelMobsInInstancesWhile", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile", tipText = "killingGreyLevelMobsInInstancesWhile2", since = "cata", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreyLevelBossesInInstancesWhile", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile", tipText = "killingGreyLevelBossesInInstancesWhile2", since = "cata", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelMobsIn", rep = 15, headText = "killingGreenOrHigherLevelMobsIn", tipText = "killingGreenOrHigherLevelMobsIn2", since = "cata", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelBossesIn", rep = 300, headText = "killingGreenOrHigherLevelBossesIn", tipText = "killingGreenOrHigherLevelBossesIn2", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(1133, { -- Bilgewater Cartel
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreyLevelMobsInInstancesWhile3", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile3", tipText = "killingGreyLevelMobsInInstancesWhile4", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreyLevelBossesInInstancesWhile3", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile3", tipText = "killingGreyLevelBossesInInstancesWhile4", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelMobsIn3", rep = 15, headText = "killingGreenOrHigherLevelMobsIn3", tipText = "killingGreenOrHigherLevelMobsIn4", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelBossesIn3", rep = 300, headText = "killingGreenOrHigherLevelBossesIn3", tipText = "killingGreenOrHigherLevelBossesIn4", since = "cata", untilPhase = "thewarwithin 1", side = "Horde" },
})

REP:RegisterFaction(1172, { -- Dragonmaw Clan
  Quest{ from = 4, to = 8, id = 28873, rep = 250, since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 28875, rep = 350, since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 28871, rep = 250, since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 28874, rep = 250, since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 28872, rep = 250, since = "cata", side = "Horde" },
  Mob{ from = 1, to = 8, code = 1, rep = 10, map = 5, since = "cata", side = "Horde" },
  Mob{ from = 1, to = 8, code = 1, rep = 15, map = 6, since = "cata", side = "Horde" },
  Mob{ from = 1, to = 8, code = 4, rep = 150, map = 5, since = "cata", side = "Horde" },
  Mob{ from = 1, to = 8, code = 4, rep = 250, map = 6, since = "cata", side = "Horde" },
  Item{ from = 1, to = 8, rep = 500, items = {[133150] = 1}, since = "wod", side = "Horde" },
})

REP:RegisterFaction(1178, { -- Hellscream's Reach
  Quest{ from = 4, to = 8, id = 28700, rep = 250, since = "cata", side = "Horde" }, -- Taking the Overlook Back QuestID: 28700
  Quest{ from = 4, to = 8, id = 28695, rep = 250, since = "cata", side = "Horde" }, -- WANTED: Foreman Wellson QuestID: 28695
  Quest{ from = 4, to = 8, id = 28696, rep = 250, since = "cata", side = "Horde" }, -- Bombs Away! QuestID: 28696
  Quest{ from = 4, to = 8, id = 28698, rep = 250, since = "cata", side = "Horde" }, -- Cannonball! QuestID: 28698
  Quest{ from = 4, to = 8, id = 28697, rep = 250, since = "cata", side = "Horde" }, -- Ghostbuster QuestID: 28697
  Quest{ from = 4, to = 8, id = 28694, rep = 250, since = "cata", side = "Horde" }, -- Watch Out For Splinters! QuestID: 28694
  Quest{ from = 4, to = 8, id = 28685, rep = 250, since = "cata", side = "Horde" }, -- Leave No Weapon Behind QuestID: 28685
  Quest{ from = 4, to = 8, id = 28686, rep = 250, since = "cata", side = "Horde" }, -- Not The Friendliest Town QuestID: 28686
  Quest{ from = 4, to = 8, id = 28682, rep = 250, since = "cata", side = "Horde" }, -- Claiming The Keep QuestID: 28682
  Quest{ from = 4, to = 8, id = 28687, rep = 250, since = "cata", side = "Horde" }, -- Teach A Man To Fish.... Or Steal QuestID: 28687
  Quest{ from = 4, to = 8, id = 28684, rep = 250, since = "cata", side = "Horde" }, -- A Sticky Task QuestID: 28684
  Quest{ from = 4, to = 8, id = 28680, rep = 250, since = "cata", side = "Horde" }, -- Boosting Morale QuestID: 28680
  Quest{ from = 4, to = 8, id = 28678, rep = 250, since = "cata", side = "Horde" }, -- Captain P. Harris QuestID: 28678
  Quest{ from = 4, to = 8, id = 28679, rep = 250, since = "cata", side = "Horde" }, -- Rattling Their Cages QuestID: 28679
  Quest{ from = 4, to = 8, id = 28681, rep = 350, since = "cata", side = "Horde" }, -- Shark Tank QuestID: 28681
  Quest{ from = 4, to = 8, id = 28683, rep = 250, since = "cata", side = "Horde" }, -- Thinning the Brood QuestID: 28683
  Quest{ from = 4, to = 8, id = 28693, rep = 250, since = "cata", side = "Horde" }, -- Finish The Job QuestID: 28693
  Quest{ from = 4, to = 8, id = 28691, rep = 250, since = "cata", side = "Horde" }, -- First Lieutenant Connor QuestID: 28691
  Quest{ from = 4, to = 8, id = 28692, rep = 250, since = "cata", side = "Horde" }, -- Magnets, How Do They Work? QuestID: 28692
  Quest{ from = 4, to = 8, id = 28690, rep = 250, since = "cata", side = "Horde" }, -- Salvaging the Remains QuestID: 28690
  Quest{ from = 4, to = 8, id = 28689, rep = 250, since = "cata", side = "Horde" }, -- The Forgotten QuestID: 28689
  Quest{ from = 4, to = 8, id = 28657, rep = 350, since = "cata", side = "Horde" }, -- A Huge Problem QuestID: 28657
  Quest{ from = 4, to = 8, id = 28658, rep = 350, since = "cata", side = "Horde" }, -- Swamp Bait QuestID: 28658
  Quest{ from = 4, to = 8, id = 28659, rep = 350, since = "cata", side = "Horde" }, -- The Leftovers QuestID: 28659
  Quest{ from = 4, to = 8, id = 28665, rep = 350, since = "cata", side = "Horde" }, -- Cursed Shackles QuestID: 28665
  Quest{ from = 4, to = 8, id = 28663, rep = 350, since = "cata", side = "Horde" }, -- D-Block QuestID: 28663
  Quest{ from = 4, to = 8, id = 28664, rep = 350, since = "cata", side = "Horde" }, -- Svarnos QuestID: 28664
  Quest{ from = 4, to = 8, id = 28660, rep = 350, since = "cata", side = "Horde" }, -- Clearing the Depths QuestID: 28660
  Quest{ from = 4, to = 8, id = 28662, rep = 350, since = "cata", side = "Horde" }, -- Learning From The Past QuestID: 28662
  Quest{ from = 4, to = 8, id = 28661, rep = 350, since = "cata", side = "Horde" }, -- The Imprisoned Archmage QuestID: 28661
  Quest{ from = 4, to = 8, id = 28670, rep = 350, since = "cata", side = "Horde" }, -- Food From Below QuestID: 28670
  Quest{ from = 4, to = 8, id = 28668, rep = 350, since = "cata", side = "Horde" }, -- Prison Revolt QuestID: 28668
  Quest{ from = 4, to = 8, id = 28669, rep = 350, since = "cata", side = "Horde" }, -- The Warden QuestID: 28669
  Item{ from = 4, to = 8, rep = 250, items = {[63518] = 1}, since = "cata", side = "Horde" },
})
