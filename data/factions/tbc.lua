----------------------------------------------------------
-- Reputation Guide | Reputation sources: The Burning Crusade --
-- Factions (and sources) added in The Burning Crusade. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(967, { -- The Violet Eye
  Instance{ from = 4, to = 8, instance = "Karazhan", rep = 6000, heroic = false, since = "tbc" },
})

REP:RegisterFaction(1012, { -- Ashtongue Deathsworn
  Instance{ from = 4, to = 8, instance = "Black_Temple", rep = 8000, since = "tbc" },
})

REP:RegisterFaction(990, { -- The Scale of the Sands
  Instance{ from = 4, to = 8, instance = "Hyjal_Summit", rep = 6500, since = "tbc" },
})

REP:RegisterFaction(942, { -- Cenarion Expedition
  Quest{ from = 4, to = 5, id = 9802, name = "Plants of Zangarmarsh", rep = 250, items = {[24401] = 10}, since = "tbc" }, -- Plants of Zangarmarsh QuestID: 9802
  Quest{ from = 4, to = 6, id = 9875, name = "Uncatalogued Species", rep = 500, items = {[24407] = 1}, since = "tbc" }, -- Uncatalogued Species QuestID: 9875
  Quest{ from = 4, to = 8, id = 9766, notRetail = true, name = "Coilfang Armaments", rep = 75, items = {[24368] = 1}, since = "tbc" }, -- Coilfang Armaments QuestID: 9766
  Quest{ from = 4, to = 8, id = 11867, rep = 150, since = "wotlk" }, -- Can't Get Ear-nough... QuestID: 11867
  Mob{ from = 4, to = 4, npc = 18340, name = "Steam Pump Overseer", rep = 1, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 18123, name = "Wrekt Slave", rep = 2.5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 18122, name = "Dreghood Drudge", rep = 2.5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 20088, name = "Bloodscale Overseer", rep = 5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 20089, name = "Bloodscale Wavecaller", rep = 5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 19947, name = "Darkcrest Sorceress", rep = 5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 19946, name = "Darkcrest Slaver", rep = 5, zone = "Zangarmarsh", since = "tbc" },
  Mob{ from = 4, to = 4, npc = 20477, name = "Terrorclaw", rep = 7, zone = "Zangarmarsh", since = "tbc" },
  Instance{ from = 4, to = 5, instance = "The_Slave_Pens", rep = 650, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 5, instance = "The_Underbog", rep = 1000, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Steamvault", rep = 1662, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Slave_Pens", rep = 650, heroic = true, since = "tbc", phase = "cata 1" },
  Instance{ from = 4, to = 8, instance = "The_Underbog", rep = 1000, heroic = true, since = "tbc", phase = "cata 1" },
  Instance{ from = 4, to = 8, instance = "The_Steamvault", rep = 2319, heroic = true, since = "tbc", phase = "cata 1" },
  Instance{ from = 6, to = 8, instance = "The_Slave_Pens", rep = 650, heroic = true, since = "tbc", untilPhase = "cata 0" },
  Instance{ from = 6, to = 8, instance = "The_Underbog", rep = 1000, heroic = true, since = "tbc", untilPhase = "cata 0" },
  Instance{ from = 4, to = 8, instance = "The_Steamvault", rep = 2319, heroic = true, since = "tbc", untilPhase = "cata 0" },
  General{ from = 4, to = 8, text = "freeingCenarionExpeditionEthereumPrisoners", rep = 500, headText = "freeingCenarionExpeditionEthereumPrisoners", tipText = "freeingCenarionExpeditionEthereumPrisonersTheseAre", since = "tbc" },
  Item{ from = 1, to = 8, rep = 500, items = {[129949] = 1}, since = "wod" },
})

REP:RegisterFaction(989, { -- Keepers of Time
  Instance{ from = 4, to = 8, instance = "Old_Hillsbrad_Foothills", rep = 1133, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Old_Hillsbrad_Foothills", rep = 2445, heroic = true, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Black_Morass", rep = 1110, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Black_Morass", rep = 1725, heroic = true, since = "tbc" },
  General{ from = 4, to = 8, text = "freeingKeepersOfTimeEthereumPrisoners", rep = 500, headText = "freeingKeepersOfTimeEthereumPrisoners", tipText = "freeingKeepersOfTimeEthereumPrisonersThese", since = "tbc" },
  Item{ from = 1, to = 8, rep = 500, items = {[129950] = 1}, since = "wod" },
})

REP:RegisterFaction(1015, { -- Netherwing
  Quest{ from = 4, to = 8, id = 11017, name = "Netherdust Pollen", rep = 250, items = {[32468] = 40}, profession = "Herbalism", since = "tbc" }, -- Netherdust Pollen QuestID: 11017
  Quest{ from = 4, to = 8, id = 11018, name = "Nethercite Ore", rep = 250, items = {[32464] = 40}, profession = "Mining", since = "tbc" }, -- Nethercite Ore QuestID: 11018
  Quest{ from = 4, to = 8, id = 11016, name = "Nethermine Flayer Hide", rep = 250, items = {[32470] = 35}, profession = "Skinning", since = "tbc" }, -- Nethermine Flayer Hide QuestID: 11016
  Quest{ from = 4, to = 8, id = 11020, name = "A Slow Death", rep = 250, since = "tbc" }, -- A Slow Death QuestID: 11020
  Quest{ from = 4, to = 8, id = 11035, name = "The Not-So-Friendly Skies...", rep = 250, items = {[32509] = 10}, since = "tbc" }, -- The Not-So-Friendly Skies... QuestID: 11035
  Quest{ from = 4, to = 8, id = 11015, name = "Netherwing Crystals", rep = 250, items = {[32427] = 30}, since = "tbc" }, -- Netherwing Crystals QuestID: 11015
  Quest{ from = 5, to = 8, id = 11077, name = "Dragons are the Least of Our Problems", rep = 350, since = "tbc" }, -- Dragons are the Least of Our Problems QuestID: 11077
  Quest{ from = 5, to = 8, id = 11076, name = "Picking Up The Pieces...", rep = 350, items = {[32723] = 15}, since = "tbc" }, -- Picking Up The Pieces... QuestID: 11076
  Quest{ from = 5, to = 8, id = 11055, name = "The Booterang: A Cure For The Common Worthless Peon", rep = 350, since = "tbc" }, -- The Booterang: A Cure For The Common Worthless Peon QuestID: 11055
  Quest{ from = 6, to = 8, id = 11086, name = "Disrupting the Twilight Portal", rep = 500, since = "tbc" }, -- Disrupting the Twilight Portal QuestID: 11086
  Quest{ from = 7, to = 8, id = 11101, name = "The Deadliest Trap Ever Laid", rep = 500, since = "tbc" }, -- The Deadliest Trap Ever Laid QuestID: 11101
  Item{ from = 4, to = 8, rep = 250, items = {[32506] = 1}, since = "tbc" }, -- Netherwing egg
})

REP:RegisterFaction(1038, { -- Ogri'la
  Quest{ from = 4, to = 8, id = 11080, name = "The Relic's Emanation", rep = 350, since = "tbc" }, -- The Relic's Emanation QuestID: 11080
  Quest{ from = 4, to = 8, id = 11066, name = "Wrangle More Aether Rays!", rep = 350, since = "tbc" }, -- Wrangle More Aether Rays! QuestID: 11066
  Quest{ from = 4, to = 8, id = 11023, name = "Bomb Them Again!", rep = 500, since = "tbc" }, -- Bomb Them Again! QuestID: 11023
  Quest{ from = 6, to = 8, id = 11051, name = "Banish More Demons", rep = 350, since = "tbc" }, -- Banish More Demons QuestID: 11051
})

REP:RegisterFaction(1031, { -- Sha'tari Skyguard
  Quest{ from = 4, to = 8, id = 11004, name = "World of Shadows", rep = 150, items = {[32388] = 6}, since = "tbc" }, -- World of Shadows QuestID: 11004
  Quest{ from = 4, to = 8, id = 11074, name = "Tokens of the Descendants", rep = 350, items = {[32718] = 1, [32715] = 1, [32717] = 1, [32716] = 1}, since = "tbc" }, -- Tokens of the Descendants QuestID: 11074
  Quest{ from = 4, to = 8, id = 11008, name = "Fires Over Skettis", rep = 350, since = "tbc" }, -- Fires Over Skettis QuestID: 11008
  Quest{ from = 4, to = 8, id = 11085, name = "Escape from Skettis", rep = 150, since = "tbc" }, -- Escape from Skettis QuestID: 11085
  Quest{ from = 4, to = 8, id = 11066, name = "Wrangle More Aether Rays!", rep = 350, since = "tbc" }, -- Wrangle More Aether Rays! QuestID: 11066
  Quest{ from = 4, to = 8, id = 11023, name = "Bomb Them Again!", rep = 500, since = "tbc" }, -- Bomb Them Again! QuestID: 11023
  Mob{ from = 4, to = 6, npc = 21804, name = "Skettis Kaliri", rep = 2.5, zone = "Terokkar_Forest", since = "tbc", before = "cata" },
  Mob{ from = 4, to = 8, text = "skettisTalonpriestsTimeLostSkettisMonstrousKaliri", rep = 5, zone = "Terokkar_Forest", since = "tbc", before = "cata" },
  Mob{ from = 4, to = 8, npc = 23029, name = "Talonsworn Forest-Rager", rep = 15, zone = "Terokkar_Forest", since = "tbc", before = "cata" },
  Mob{ from = 4, to = 6, npc = 21804, name = "Skettis Kaliri", rep = 5, zone = "Terokkar_Forest", since = "cata" },
  Mob{ from = 4, to = 8, text = "skettisTalonpriestsTimeLostSkettisMonstrousKaliri", rep = 10, zone = "Terokkar_Forest", since = "cata" },
  Mob{ from = 4, to = 8, npc = 23029, name = "Talonsworn Forest-Rager", rep = 30, zone = "Terokkar_Forest", since = "cata" },
  Mob{ from = 4, to = 8, text = "karrogGezzarakTheHuntress", rep = 100, zone = "Terokkar_Forest", since = "tbc" },
  Mob{ from = 4, to = 8, npc = 21838, name = "Terokk", rep = 500, zone = "Terokkar_Forest", since = "tbc" },
})

REP:RegisterFaction(970, { -- Sporeggar
  Mob{ from = 3, to = 6, text = "bogLordsBogGiants", rep = 15, since = "tbc" },
  Mob{ from = 3, to = 8, text = "marshDredgerMarshLurker", rep = 15, since = "tbc" },
  Quest{ from = 3, to = 4, id = 9739, name = "The Sporelings' Plight", rep = 250, items = {[24290] = 10}, since = "tbc" }, -- The Sporelings' Plight QuestID: 9739
  Quest{ from = 3, to = 4, id = 9744, name = "More Tendrils!", rep = 750, items = {[24291] = 6}, since = "tbc" }, -- More Tendrils! QuestID: 9744
  Quest{ from = 3, to = 4, id = 9809, notRetail = true, name = "More Glowcaps", rep = 250, items = {[24245] = 10}, since = "tbc" }, -- Glowcap Mushrooms QuestID: 9809
  Quest{ from = 4, to = 8, id = 9727, name = "Now That We're Still Friends...", rep = 750, since = "tbc" }, -- Now That We're Still Friends... QuestID: 9727
  Quest{ from = 4, to = 8, id = 9807, name = "More Fertile Spores", rep = 750, items = {[24449] = 6}, since = "tbc" }, -- More Fertile Spores QuestID: 9807
  Quest{ from = 4, to = 8, id = 9714, notRetail = true, name = "Bring Me Another Shrubbery!", rep = 750, items = {[24246] = 5}, since = "tbc" }, -- QuestID: 9714
  Instance{ from = 3, to = 7, instance = "The_Underbog", rep = 15, heroic = false, since = "tbc" },
  Instance{ from = 3, to = 7, instance = "The_Underbog", rep = 45, heroic = true, since = "tbc" },
  General{ from = 4, to = 8, text = "freeingSporeggarEthereumPrisoners", rep = 500, headText = "freeingSporeggarEthereumPrisoners", tipText = "freeingSporeggarEthereumPrisonersTheseAreNot", since = "tbc" },
})

REP:RegisterFaction(933, { -- The Consortium
  Quest{ from = 4, to = 4, id = 9883, name = "More Crystal Fragments", rep = 250, items = {[25416] = 10}, since = "tbc" }, -- More Crystal Fragments QuestID: 9883
  Quest{ from = 4, to = 4, id = 9915, name = "More Heads Full of Ivory", rep = 250, items = {[25463] = 3}, since = "tbc" }, -- More Heads Full of Ivory QuestID: 9915
  Quest{ from = 5, to = 8, id = 9892, name = "More Obsidian Warbeads", rep = 250, items = {[25433] = 10}, since = "tbc" }, -- More Obsidian Warbeads QuestID: 9892
  Quest{ from = 5, to = 8, id = 10308, name = "Another Heap of Ethereals", rep = 250, items = {[29209] = 10}, since = "tbc" }, -- Another Heap of Ethereals QuestID: 10308
  Quest{ from = 6, to = 8, id = 10972, name = "Ethereum Prisoner I.D. Catalogue", rep = 250, items = {[31957] = 1}, since = "tbc" }, -- Ethereum Prisoner I.D. Catalogue QuestID: 10972
  Quest{ from = 7, to = 8, id = 10973, name = "A Thousand Worlds", rep = 500, items = {[29460] = 5}, since = "tbc" }, -- A Thousand Worlds QuestID: 10973
  Quest{ from = 7, to = 8, id = 10975, name = "Purging the Chambers of Bash'ir", rep = 500, items = {[29460] = 5}, since = "tbc" }, -- Purging the Chambers of Bash'ir QuestID: 10975
  Instance{ from = 4, to = 5, instance = "Mana_Tombs", rep = 1200, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Mana_Tombs", rep = 2400, heroic = true, since = "tbc", phase = "cata 1" },
  Instance{ from = 6, to = 8, instance = "Mana_Tombs", rep = 2400, heroic = true, since = "tbc", untilPhase = "cata 0" },
  Item{ from = 1, to = 8, rep = 500, items = {[129945] = 1}, since = "wod" },
  General{ from = 4, to = 8, text = "freeingTheConsortiumEthereumPrisoners", rep = 500, headText = "freeingTheConsortiumEthereumPrisoners", tipText = "freeingTheConsortiumEthereumPrisonersTheseAre", since = "tbc" },
})

REP:RegisterFaction(1011, { -- Lower City
  Quest{ from = 4, to = 5, id = 10918, name = "More Feathers", rep = 250, items = {[25719] = 30}, since = "tbc" }, -- More Feathers QuestID: 10918
  Instance{ from = 4, to = 5, instance = "Auchenai_Crypts", rep = 750, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Auchenai_Crypts", rep = 750, heroic = true, since = "tbc", phase = "cata 1" },
  Instance{ from = 6, to = 8, instance = "Auchenai_Crypts", rep = 750, heroic = true, since = "tbc", untilPhase = "cata 0" },
  Instance{ from = 4, to = 8, instance = "Sethekk_Halls", rep = 1080, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Sethekk_Halls", rep = 1250, heroic = true, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Shadow_Labyrinth", rep = 2000, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Shadow_Labyrinth", rep = 2700, heroic = true, since = "tbc" },
  Item{ from = 1, to = 8, rep = 500, items = {[129951] = 1}, since = "wod" },
  General{ from = 4, to = 8, text = "freeingLowerCityEthereumPrisoners", rep = 500, headText = "freeingLowerCityEthereumPrisoners", tipText = "freeingLowerCityEthereumPrisonersTheseAre", since = "tbc" },
})

REP:RegisterFaction(1077, { -- Shattered Sun Offensive
  Quest{ from = 4, to = 8, id = 11875, name = "Gaining the Advantage", rep = 250, items = {[35229] = 8}, profession = "Gathering", since = "tbc" }, -- Gaining the Advantage QuestID: 11877
  Quest{ from = 4, to = 8, id = 11877, name = "Sunfury Attack Plans", rep = 250, since = "tbc" }, -- Sunfury Attack Plans QuestID: 11877
  Quest{ from = 4, to = 8, id = 11880, name = "The Multiphase Survey", rep = 150, since = "tbc" }, -- The Multiphase Survey QuestID: 11880
  Quest{ from = 4, to = 8, id = 11515, name = "Blood for Blood", rep = 250, since = "tbc" }, -- Blood for Blood QuestID: 11515
  Quest{ from = 4, to = 8, id = 11516, name = "Blast the Gateway", rep = 250, since = "tbc" }, -- Blast the Gateway QuestID: 11516
  Quest{ from = 4, to = 8, id = 11523, name = "Arm the Wards!", rep = 150, since = "tbc" }, -- Arm the Wards! QuestID: 11523
  Quest{ from = 4, to = 8, id = 11525, name = "Further Conversions", rep = 150, since = "tbc" }, -- Further Conversions QuestID: 11525
  Quest{ from = 4, to = 8, id = 11514, name = "Maintaining the Sunwell Portal", rep = 250, items = {[34246] = 10}, since = "tbc" }, -- Maintaining the Sunwell Portal QuestID: 11514
  Quest{ from = 4, to = 8, id = 11547, name = "Know Your Ley Lines", rep = 250, since = "tbc" }, -- Know Your Ley Lines QuestID: 11547
  Quest{ from = 4, to = 8, id = 11537, name = "The Battle Must Go On", rep = 250, since = "tbc" }, -- The Battle Must Go On QuestID: 11537
  Quest{ from = 4, to = 8, id = 11533, name = "The Air Strikes Must Continue", rep = 150, since = "tbc" }, -- The Air Strikes Must Continue QuestID: 11533
  Quest{ from = 4, to = 8, id = 11544, name = "Ata'mal Armaments", rep = 350, items = {[34501] = 5}, since = "tbc" }, -- Ata'mal Armaments QuestID: 11544
  Quest{ from = 4, to = 8, id = 11536, name = "Don't Stop Now....", rep = 250, items = {[34479] = 3}, since = "tbc" }, -- Don't Stop Now.... QuestID: 11536
  Quest{ from = 4, to = 8, id = 11541, name = "Disrupt the Greengill Coast", rep = 250, since = "tbc" }, -- Disrupt the Greengill Coast QuestID: 11541
  Quest{ from = 4, to = 8, id = 11543, name = "Keeping the Enemy at Bay", rep = 250, since = "tbc" }, -- Keeping the Enemy at Bay QuestID: 11543
  Quest{ from = 4, to = 8, id = 11540, name = "Crush the Dawnblade", rep = 250, since = "tbc" }, -- Crush the Dawnblade QuestID: 11540
  Quest{ from = 4, to = 8, id = 11548, name = "Your Continued Support", rep = 150, items = {["Gold"] = 10}, since = "tbc" }, -- Your Continued Support QuestID: 11548
  Quest{ from = 4, to = 8, id = 11521, name = "Rediscovering Your Roots", rep = 350, items = {[34254] = 5}, since = "tbc" }, -- Rediscovering Your Roots QuestID: 11521
  Quest{ from = 4, to = 8, id = 11546, name = "Open for Business", rep = 250, items = {[34502] = 5}, since = "tbc" }, -- Open for Business QuestID: 11546
  Instance{ from = 4, to = 7, instance = "Magisters_Terrace", rep = 1640, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "Magisters_Terrace", rep = 2503, heroic = true, since = "tbc" },
})

REP:RegisterFaction(932, { -- The Aldor
  Quest{ from = 1, to = 3, id = 10019, name = "More Venom Sacs", rep = 250, items = {[25802] = 8}, since = "tbc" }, -- More Venom Sacs QuestID: 10019
  Quest{ from = 4, to = 5, id = 10327, name = "Single Mark of Kil'jaeden", rep = 25, items = {[29425] = 1}, since = "tbc" }, -- Single Mark of Kil'jaeden QuestID: 10327
  Quest{ from = 4, to = 5, id = 10326, name = "More Marks of Kil'jaeden", rep = 250, items = {[29425] = 10}, since = "tbc" }, -- More Marks of Kil'jaeden QuestID: 10326
  Quest{ from = 5, to = 8, id = 10655, name = "Single Mark of Sargeras", rep = 25, items = {[30809] = 1}, since = "tbc" }, -- Single Mark of Sargeras QuestID: 10655
  Quest{ from = 5, to = 8, id = 10654, name = "More Marks of Sargeras", rep = 250, items = {[30809] = 10}, since = "tbc" }, -- More Marks of Sargeras QuestID: 10654
  Quest{ from = 5, to = 8, id = 10421, name = "Fel Armaments", rep = 350, items = {[29740] = 1}, since = "tbc" }, -- Fel Armaments QuestID: 10421
})

REP:RegisterFaction(934, { -- The Scryers
  Quest{ from = 1, to = 3, id = 10025, name = "More Basilisk Eyes", rep = 250, items = {[25744] = 8}, since = "tbc" }, -- More Basilisk Eyes QuestID: 10025
  Quest{ from = 4, to = 5, id = 10414, name = "Single Firewing Signet", rep = 25, items = {[29426] = 1}, since = "tbc" }, -- Single Firewing Signet QuestID: 10414
  Quest{ from = 4, to = 5, id = 10415, name = "More Firewing Signets", rep = 250, items = {[29426] = 10}, since = "tbc" }, -- More Firewing Signets QuestID: 10415
  Quest{ from = 5, to = 8, id = 10659, name = "Single Sunfury Signet", rep = 25, items = {[30810] = 1}, since = "tbc" }, -- Single Sunfury Signet QuestID: 10659
  Quest{ from = 5, to = 8, id = 10658, name = "More Sunfury Signets", rep = 250, items = {[30810] = 10}, since = "tbc" }, -- More Sunfury Signets QuestID: 10658
  Quest{ from = 5, to = 8, id = 10419, name = "Arcane Tomes", rep = 350, items = {[29739] = 1}, since = "tbc" }, -- Arcane Tomes QuestID: 10419
})

REP:RegisterFaction(935, { -- The Sha'tar
  Quest{ from = 4, to = 5, id = 10327, name = "Single Mark of Kil'jaeden", rep = 12.5, items = {[29425] = 1}, since = "tbc" }, -- Single Mark of Kil'jaeden QuestID: 10327
  Quest{ from = 4, to = 5, id = 10326, name = "More Marks of Kil'jaeden", rep = 125, items = {[29425] = 10}, since = "tbc" }, -- More Marks of Kil'jaeden QuestID: 10326
  Quest{ from = 4, to = 5, id = 10655, name = "Single Mark of Sargeras", rep = 12.5, items = {[30809] = 1}, since = "tbc" }, -- Single Mark of Sargeras QuestID: 10655
  Quest{ from = 4, to = 5, id = 10654, name = "More Marks of Sargeras", rep = 125, items = {[30809] = 10}, since = "tbc" }, -- More Marks of Sargeras QuestID: 10654
  Quest{ from = 4, to = 5, id = 10414, name = "Single Firewing Signet", rep = 12.5, items = {[29426] = 1}, since = "tbc" }, -- Single Firewing Signet QuestID: 10414
  Quest{ from = 4, to = 5, id = 10415, name = "More Firewing Signets", rep = 125, items = {[29426] = 10}, since = "tbc" }, -- More Firewing Signets QuestID: 10415
  Quest{ from = 4, to = 5, id = 10659, name = "Single Sunfury Signet", rep = 12.5, items = {[30810] = 1}, since = "tbc" }, -- Single Sunfury Signet QuestID: 10659
  Quest{ from = 4, to = 5, id = 10658, name = "More Sunfury Signets", rep = 125, items = {[30810] = 10}, since = "tbc" }, -- More Sunfury Signets QuestID: 10658
  Quest{ from = 4, to = 5, id = 10019, name = "More Venom Sacs", rep = 125, items = {[25802] = 8}, since = "tbc" }, -- More Venom Sacs QuestID: 10019 TODO: Double check in wotlk.
  Quest{ from = 4, to = 5, id = 10025, name = "More Basilisk Eyes", rep = 125, items = {[25744] = 8}, since = "tbc" }, -- More Basilisk Eyes QuestID: 10025 TODO: Double check in wotlk.
  Quest{ from = 4, to = 5, id = 10421, name = "Fel Armaments", rep = 175, items = {[29740] = 1}, since = "tbc" }, -- Fel Armaments QuestID: 10421
  Quest{ from = 4, to = 5, id = 10419, name = "Arcane Tomes", rep = 175, items = {[29739] = 1}, since = "tbc" }, -- Arcane Tomes QuestID: 10419
  Instance{ from = 4, to = 8, instance = "The_Mechanar", rep = 1620, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Mechanar", rep = 3000, heroic = true, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Botanica", rep = 2000, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Botanica", rep = 3000, heroic = true, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Arcatraz", rep = 1800, heroic = false, since = "tbc" },
  Instance{ from = 4, to = 8, instance = "The_Arcatraz", rep = 3000, heroic = true, since = "tbc" },
  Item{ from = 1, to = 8, rep = 500, items = {[129946] = 1}, since = "wod" },
  General{ from = 4, to = 8, text = "freeingTheShaTarEthereumPrisoners", rep = 500, headText = "freeingTheShaTarEthereumPrisoners", tipText = "freeingTheShaTarEthereumPrisonersThese", since = "tbc" },
})

REP:RegisterFaction(930, { -- Exodar
  Quest{ from = 4, to = 8, id = 10358, rep = 75, items = {[14047] = 20}, since = "tbc", before = "cata", side = "Alliance" }, -- Additional Runecloth QuestID: 10358
  Quest{ from = 4, to = 8, id = 2, rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 4, rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 18.75, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 2.5, items = {[17423] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6943, rep = 10, items = {[17504] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 2.5, items = {[17643] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Alliance" },
  Item{ from = 4, to = 8, rep = 250, items = {[45715] = 1}, since = "wotlk", side = "Alliance" }, -- Exodar Commendation Badge: 45715
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile24", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile24", tipText = "killingGreyLevelMobsInInstancesWhile25", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile24", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile24", tipText = "killingGreyLevelBossesInInstancesWhile25", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn25", rep = 15, headText = "killingGreenOrHigherLevelMobsIn25", tipText = "killingGreenOrHigherLevelMobsIn26", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(946, { -- Honor Hold
  Quest{ from = 4, to = 7, id = 13410, name = "Hellfire Fortifications", rep = 150, since = "tbc", side = "Alliance" }, -- Hellfire Fortifications QuestID: 13410
  Instance{ from = 4, to = 5, instance = "Hellfire_Ramparts", rep = 600, heroic = false, since = "tbc", side = "Alliance" },
  Instance{ from = 6, to = 8, instance = "Hellfire_Ramparts", rep = 2000, heroic = true, since = "tbc", side = "Alliance" },
  Instance{ from = 4, to = 5, instance = "The_Blood_Furnace", rep = 750, heroic = false, since = "tbc", side = "Alliance" },
  Instance{ from = 6, to = 8, instance = "The_Blood_Furnace", rep = 2700, heroic = true, since = "tbc", side = "Alliance" },
  Instance{ from = 4, to = 8, instance = "The_Shattered_Halls", rep = 1600, heroic = false, since = "tbc", side = "Alliance" },
  Instance{ from = 4, to = 8, instance = "The_Shattered_Halls", rep = 2900, heroic = true, since = "tbc", side = "Alliance" },
  Item{ from = 1, to = 8, rep = 500, items = {[129948] = 1}, since = "wod", side = "Alliance" },
})

REP:RegisterFaction(978, { -- Kurenai
  Quest{ from = 4, to = 8, id = 10477, name = "More Warbeads", rep = 500, items = {[25433] = 10}, since = "tbc", side = "Alliance" }, -- More Warbeads QuestID: 10477
  Quest{ from = 4, to = 8, id = 11502, name = "In Defense of Halaa", rep = 250, since = "tbc", side = "Alliance" }, -- In Defense of Halaa QuestID: 11502
  Mob{ from = 4, to = 8, text = "boulderfistCrusherHunterMageMysticWarrior", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" }, -- REP_TXT.Mob.BoulderfistOgre
  Mob{ from = 4, to = 8, text = "warmaulBruteReaverShamanWarlock", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" }, -- Warmaul non-elite
  Mob{ from = 4, to = 8, text = "kilSorrowCultistDeathswornRitualistSpellbinder", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" },
  Mob{ from = 4, to = 8, text = "murkbloodBruteInvaderPutrifierRaider", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" },
  Mob{ from = 4, to = 8, npc = 18207, name = "Murkblood Scavenger", rep = 2, zone = "Nagrand", since = "tbc", side = "Alliance" },
  Mob{ from = 4, to = 8, npc = 18204, name = "Ortor of Murkblood", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" },
  Mob{ from = 4, to = 8, npc = 18413, name = "Zorbo the Advisor", rep = 10, zone = "Nagrand", since = "tbc", side = "Alliance" },
})

REP:RegisterFaction(911, { -- Silvermoon City
  Quest{ from = 4, to = 8, id = 10363, rep = 75, items = {[14047] = 20}, since = "tbc", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 10363
  Quest{ from = 4, to = 8, id = 2, rep = 65, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 4, rep = 65, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7385, name = "A Gallon of Blood", rep = 18.75, items = {[17306] = 5}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" }, -- A Gallon of Blood QuestID: 7385
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, since = "tbc", side = "Horde" },
  Item{ from = 4, to = 8, rep = 250, items = {[45721] = 1}, since = "wotlk", side = "Horde" }, -- Silvermoon commendation badge: 45721
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile26", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile26", tipText = "killingGreyLevelMobsInInstancesWhile27", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile26", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile26", tipText = "killingGreyLevelBossesInInstancesWhile27", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn27", rep = 15, headText = "killingGreenOrHigherLevelMobsIn27", tipText = "killingGreenOrHigherLevelMobsIn28", since = "cata", side = "Horde" },
})

REP:RegisterFaction(947, { -- Thrallmar
  Quest{ from = 4, to = 7, id = 13410, rep = 150, since = "tbc", side = "Horde" },
  Instance{ from = 4, to = 5, instance = "Hellfire_Ramparts", rep = 600, heroic = false, since = "tbc", side = "Horde" },
  Instance{ from = 6, to = 8, instance = "Hellfire_Ramparts", rep = 2000, heroic = true, since = "tbc", side = "Horde" },
  Instance{ from = 4, to = 5, instance = "The_Blood_Furnace", rep = 750, heroic = false, since = "tbc", side = "Horde" },
  Instance{ from = 6, to = 8, instance = "The_Blood_Furnace", rep = 2700, heroic = true, since = "tbc", side = "Horde" },
  Instance{ from = 4, to = 8, instance = "The_Shattered_Halls", rep = 1600, heroic = false, since = "tbc", side = "Horde" },
  Instance{ from = 4, to = 8, instance = "The_Shattered_Halls", rep = 2900, heroic = true, since = "tbc", side = "Horde" },
  Item{ from = 1, to = 8, rep = 500, items = {[129947] = 1}, since = "wod", side = "Horde" },
})

REP:RegisterFaction(941, { -- The Mag'har
  Quest{ from = 4, to = 8, text = "moreWarbeads", rep = 500, items = {[25433] = 10}, since = "tbc", side = "Horde" }, -- More Warbeads QuestID: 10479
  Quest{ from = 4, to = 8, text = "inDefenseOfHalaa", rep = 250, since = "tbc", side = "Horde" }, -- In Defense of Halaa QuestID: 11503
  Mob{ from = 4, to = 8, text = "boulderfistCrusherHunterMageMysticWarrior", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" }, -- REP_TXT.Mob.BoulderfistOgre
  Mob{ from = 4, to = 8, text = "warmaulBruteReaverShamanWarlock", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" }, -- Warmaul non-elite
  Mob{ from = 4, to = 8, text = "kilSorrowCultistDeathswornRitualistSpellbinder", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" },
  Mob{ from = 4, to = 8, text = "murkbloodBruteInvaderPutrifierRaider", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" },
  Mob{ from = 4, to = 8, npc = 18207, name = "Murkblood Scavenger", rep = 2, zone = "Nagrand", since = "tbc", side = "Horde" },
  Mob{ from = 4, to = 8, npc = 18204, name = "Ortor of Murkblood", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" },
  Mob{ from = 4, to = 8, npc = 18413, name = "Zorbo the Advisor", rep = 10, zone = "Nagrand", since = "tbc", side = "Horde" },
})

REP:RegisterFaction(922, { -- Tranquillien
  Quest{ from = 4, to = 8, id = 9217, rep = 500, items = {[22641] = 10}, since = "tbc", side = "Horde" },
  Quest{ from = 4, to = 8, id = 9219, rep = 500, items = {[22642] = 10}, since = "tbc", side = "Horde" },
})
