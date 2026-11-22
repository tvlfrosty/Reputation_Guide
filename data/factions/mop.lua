----------------------------------------------------------
-- Reputation Guide | Reputation sources: Mists of Pandaria --
-- Factions (and sources) added in Mists of Pandaria. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(1269, { -- Golden Lotus
  Mob{ from = 1, to = 8, text = "allNormalMobs", rep = 20, zone = "Vale_of_Eternal_Blossoms", since = "mop", phase = "mop 4" },
  Mob{ from = 1, to = 8, text = "allRareMobs", rep = 400, zone = "Vale_of_Eternal_Blossoms", since = "mop", phase = "mop 4" },
  Mob{ from = 1, to = 8, npc = 65169, name = "Jade Colossus", rep = 100, zone = "Vale_of_Eternal_Blossoms", since = "mop", phase = "mop 4" },
  Mob{ from = 1, to = 8, npc = 64965, name = "Milau", rep = 60, zone = "Vale_of_Eternal_Blossoms", since = "mop", phase = "mop 4" },
  Quest{ from = 1, to = 8, id = 30240, rep = 250, since = "mop" }, -- Survival Ring: Flame QuestID: 30240
  Quest{ from = 1, to = 8, id = 30242, rep = 250, since = "mop" }, -- Survival Ring: Blades QuestID: 30242
  Quest{ from = 6, to = 8, id = 30243, rep = 250, since = "mop" }, -- Mantid Under Fire QuestID: 30243
  Quest{ from = 1, to = 8, id = 30261, rep = 350, since = "mop" }, -- Roll Club: Serpent's Spine QuestID: 30261
  Quest{ from = 6, to = 8, id = 30266, rep = 250, since = "mop" }, -- Bloodied Skies QuestID: 30266
  Quest{ from = 1, to = 8, id = 30277, rep = 250, since = "mop" }, -- The Crumbling Hall QuestID: 30277
  Quest{ from = 1, to = 8, id = 30280, notRetail = true, rep = 250, since = "mop" }, -- The Thunder Below QuestID: 30280
  Quest{ from = 1, to = 8, id = 30306, rep = 250, since = "mop" }, -- The Battle Ring QuestID: 30306
  Quest{ from = 1, to = 8, id = 30233, rep = 200, since = "mop", untilPhase = "mop 3" }, -- Cracklefang QuestID: 30233
  Quest{ from = 1, to = 8, id = 30234, rep = 200, since = "mop", untilPhase = "mop 3" }, -- Vicejaw QuestID: 30234
  Quest{ from = 1, to = 8, text = "gaothunTheSoulSeverer", rep = 200, since = "mop", untilPhase = "mop 3" }, -- Gaothun the Soul-Severer QuestID: Unknown
  Quest{ from = 1, to = 8, id = 30190, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Sprite Plight QuestID: 30190
  Quest{ from = 1, to = 8, id = 30191, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Steer Clear of the Beer Here QuestID: 30191
  Quest{ from = 1, to = 8, id = 30192, rep = 100, since = "mop", untilPhase = "mop 3" }, -- My Town, It's on Fire QuestID: 30192
  Quest{ from = 1, to = 8, id = 30193, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Meating Expectations QuestID: 30193
  Quest{ from = 1, to = 8, id = 30194, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Encroaching Storm QuestID: 30194
  Quest{ from = 1, to = 8, id = 30195, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Blooming Blossoms QuestID: 30195
  Quest{ from = 1, to = 8, id = 30196, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Lushroom Rush QuestID: 30196
  Quest{ from = 1, to = 8, id = 30231, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Pomfruit Pickup QuestID: 30231
  Quest{ from = 1, to = 8, id = 30232, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Ruffling Some Feathers QuestID: 30232
  Quest{ from = 1, to = 8, id = 30237, rep = 100, since = "mop", untilPhase = "mop 3" }, -- The Pandaren Uprising Relived QuestID: 30237
  Quest{ from = 1, to = 8, id = 30238, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Return to Rest QuestID: 30238
  Quest{ from = 1, to = 8, id = 30263, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Clearing in the Forest QuestID: 30263
  Quest{ from = 1, to = 8, id = 30285, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Wu Kao Scouting Reports QuestID: 30285
  Quest{ from = 1, to = 8, id = 30286, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Backed Into a Corner QuestID: 30286
  Quest{ from = 1, to = 8, id = 30288, rep = 100, since = "mop", untilPhase = "mop 3" }, -- My Town, It's On Fire Again QuestID: 30288
  Quest{ from = 1, to = 8, id = 30289, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Freeing Mind and Body QuestID: 30289
  Quest{ from = 1, to = 8, id = 30290, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Stonebound Killers QuestID: 30290
  Quest{ from = 1, to = 8, id = 30307, rep = 100, since = "mop", untilPhase = "mop 3" }, -- The Eternal Vigil QuestID: 30307
  Quest{ from = 1, to = 8, id = 30309, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Set in Stone QuestID: 30309
  Quest{ from = 1, to = 8, id = 30310, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Thundering Skies QuestID: 30310
  Quest{ from = 1, to = 8, id = 30312, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Given a Second Chance QuestID: 30312
  Quest{ from = 1, to = 8, id = 30320, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Free Spirits QuestID: 30320
  Quest{ from = 1, to = 8, id = 30338, rep = 100, since = "mop", untilPhase = "mop 3" }, -- A Weighty Task QuestID: 30338
  Quest{ from = 1, to = 8, id = 30340, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Stick in the Mud QuestID: 30340
  Quest{ from = 1, to = 8, id = 30341, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Under Watchful Eyes QuestID: 30341
  Quest{ from = 1, to = 8, id = 30342, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Fiery Tongue, Fragile Feet QuestID: 30342
  Quest{ from = 1, to = 8, id = 31293, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Mogu Make Poor House Guests QuestID: 31293
  Quest{ from = 1, to = 8, id = 31754, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Cannonfire QuestID: 31754
  Quest{ from = 1, to = 8, id = 31760, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Striking First QuestID: 31760
  Quest{ from = 1, to = 8, id = 31762, rep = 100, since = "mop", untilPhase = "mop 3" }, -- Crumbling Behemoth QuestID: 31762
  Quest{ from = 1, to = 8, id = 32648, rep = 300, since = "mop", phase = "mop 3" }, -- Work Order: Golden Lotus II QuestID: 32648
  Item{ from = 1, to = 8, rep = 300, items = {[143937] = 1}, since = "legion" },
})

REP:RegisterFaction(1270, { -- Shado-Pan
  Quest{ from = 1, to = 8, id = 31198, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31114, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31113, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31047, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31044, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31120, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31043, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31199, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31041, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31201, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31200, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31048, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31045, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31049, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31046, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31042, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31061, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31116, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31040, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31196, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31204, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31203, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31197, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31119, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31039, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31117, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31062, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 32650, rep = 300, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143936] = 1}, since = "legion" },
})

REP:RegisterFaction(1341, { -- The August Celestials
  Item{ from = 1, to = 8, rep = 1000, items = {[86592] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 32657, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 30740, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30716, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30730, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30725, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30739, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30727, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30732, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30728, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30737, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30717, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30734, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30273, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30729, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30731, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30735, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30726, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30718, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30738, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30733, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30736, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 31517, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30879, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30880, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30881, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30882, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30885, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30883, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30902, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30907, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30065, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30063, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30068, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30066, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30064, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30006, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30067, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30954, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30953, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30958, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30925, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30955, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30959, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30957, notRetail = true, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 30956, notRetail = true, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30952, rep = 300, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143938] = 1}, since = "legion" },
})

REP:RegisterFaction(1337, { -- The Klaxxi
  Quest{ from = 1, to = 8, id = 31268, rep = 130, items = {[85885] = 3}, since = "mop" },
  Quest{ from = 4, to = 8, id = 31603, rep = 250, items = {[87903] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 31808, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31232, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31270, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31271, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31238, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31109, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31216, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31237, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31231, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31111, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31509, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31494, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31272, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31024, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31598, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31507, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31267, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31235, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31504, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31234, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31510, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31496, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31233, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31506, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31503, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31487, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31508, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31599, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31269, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31505, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31502, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 31677, notRetail = true, rep = 130, since = "mop" },
  Quest{ from = 1, to = 8, id = 32659, rep = 400, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143935] = 1}, since = "legion" },
})

REP:RegisterFaction(1271, { -- Order of the Cloud Serpent
  Item{ from = 1, to = 8, rep = 1000, items = {[86592] = 1}, since = "mop" },
  Item{ from = 4, to = 8, rep = 500, items = {[89155] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30149, rep = 125, since = "mop" },
  Quest{ from = 1, to = 8, id = 30147, rep = 125, since = "mop" },
  Quest{ from = 1, to = 8, id = 30148, rep = 125, since = "mop" },
  Quest{ from = 1, to = 8, id = 30146, rep = 125, since = "mop" },
  Quest{ from = 1, to = 8, id = 31707, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30158, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30155, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31698, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31706, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30151, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30156, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31704, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31708, notRetail = true, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30150, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30154, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31710, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31701, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 30157, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31709, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31703, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31712, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31705, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31702, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 30159, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31714, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31194, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31699, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31713, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 31715, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31711, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31700, rep = 450, since = "mop" },
  Quest{ from = 1, to = 8, id = 30152, rep = 600, since = "mop" },
  Quest{ from = 1, to = 8, id = 31718, rep = 450, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143942] = 1}, since = "legion" },
})

REP:RegisterFaction(1216, { -- Shang Xi's Academy
  Quest{ from = 1, to = 8, id = 5, rep = 1, since = "mop" },
})

REP:RegisterFaction(1359, { -- The Black Prince
  Mob{ from = 1, to = 7, text = "twisterTerminator", rep = 5, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "graniteQuilenStoneboundQuilen", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "moguEffigyAncientMoguSpirit", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "shaoTienMarauderShaoTienFistShao", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "shaoTienSoulRenderShaoTienPillager", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "vorThikFearShaperVorThikDreadsworn", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "qiTarTheDeathcallerKzKzikIlikkax", rep = 15, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, npc = 63206, name = "Ik'thik Harvester", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "shekZeerBladeswornShekZeerClutchKeeper", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, npc = 62582, name = "Shek'zeer Swarmborn", rep = 2, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "korThikHavocKorThikChitinelKor", rep = 10, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, npc = 62754, name = "Kor'thik Warcaller", rep = 100, since = "mop", before = "legion" },
  Mob{ from = 1, to = 7, text = "rareMobs", rep = 400, map = "928", since = "mop", before = "legion" },
  General{ from = 1, to = 8, text = "timelessIsleCelestialWorldBoss", rep = 500, headText = "timelessIsleCelestialWorldBoss", tipText = "completeTimlessIsleCelestialWorldBossOnce", since = "mop" },
})

REP:RegisterFaction(1345, { -- The Lorewalkers
  General{ from = 1, to = 8, text = "scrollQuests", rep = 4100, headText = "completeAllScrollQuests", tipText = "completeAllTheScrollQuestsCollectedWithin", since = "mop" },
})

REP:RegisterFaction(1302, { -- The Anglers
  Quest{ from = 1, to = 8, id = 30613, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30754, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30588, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 31443, rep = 350, items = {[86542] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30658, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30586, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30753, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30678, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 31446, rep = 350, items = {[86545] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30763, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30698, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30584, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30700, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 31444, rep = 350, items = {[86544] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30701, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30585, rep = 500, since = "mop" },
  Quest{ from = 1, to = 8, id = 30598, rep = 500, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143946] = 1}, since = "legion" },
})

REP:RegisterFaction(1358, { -- Nat Pagle
  Quest{ from = 1, to = 8, id = 36804, rep = 350, items = {[116820] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 39283, rep = 350, items = {[127994] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 36800, rep = 350, items = {[116819] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 36802, rep = 350, items = {[116818] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 36805, rep = 350, items = {[116821] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 38406, rep = 350, items = {[122696] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 36803, rep = 350, items = {[116817] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 36806, rep = 350, items = {[116822] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 31443, rep = 600, items = {[86542] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 31444, rep = 600, items = {[86544] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 31446, rep = 600, items = {[86545] = 1}, since = "mop" },
})

REP:RegisterFaction(1272, { -- The Tillers
  General{ from = 1, to = 8, name = "1", rep = 50, headText = "t1", tipText = "t0", flag = 0, since = "mop" },
  Quest{ from = 1, to = 8, id = 30337, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 30335, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 30334, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 30336, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 30333, rep = 1000, since = "mop" },
  Quest{ from = 1, to = 8, id = 31672, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31942, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31673, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31941, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31670, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31669, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31674, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31675, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31943, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 31671, rep = 350, since = "mop" },
  Quest{ from = 1, to = 8, id = 30318, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30322, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30324, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30319, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30326, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30323, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30317, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30321, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30325, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30327, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30471, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30474, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30475, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30473, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30479, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30477, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30478, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30476, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30472, rep = 150, since = "mop" },
  Quest{ from = 1, to = 8, id = 30470, rep = 150, since = "mop" },
  Item{ from = 1, to = 8, rep = 300, items = {[143941] = 1}, since = "legion" },
})

REP:RegisterFaction(1277, { -- Chee Chee
  Item{ from = 1, to = 8, rep = 900, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30471, rep = 1400, items = {[79827] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30402, rep = 1800, items = {[74647] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30324, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1275, { -- Ella
  Item{ from = 1, to = 8, rep = 900, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30474, rep = 1400, items = {[79871] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30386, rep = 1800, items = {[74651] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30327, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1283, { -- Farmer Fung
  Item{ from = 1, to = 8, rep = 900, items = {[79268] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30475, rep = 1400, items = {[80233] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30421, rep = 1800, items = {[74654] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30317, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1282, { -- Fish Fellreed
  Item{ from = 1, to = 8, rep = 900, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30473, rep = 1400, items = {[79828] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30427, rep = 1800, items = {[74655] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30326, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1281, { -- Gina Mudclaw
  Item{ from = 1, to = 8, rep = 900, items = {[79268] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30479, rep = 1400, items = {[80231] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30390, rep = 1800, items = {[74644] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30322, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1279, { -- Haohan Mudclaw
  Item{ from = 1, to = 8, rep = 900, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30477, rep = 1400, items = {[80228] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30414, rep = 1800, items = {[74642] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30319, rep = 3300, since = "mop" },
})

REP:RegisterFaction(1273, { -- Jogu the Drunk
  Item{ from = 1, to = 8, rep = 900, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30478, rep = 1400, items = {[80236] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30439, rep = 1800, items = {[74643] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30321, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1276, { -- Old Hillpaw
  Item{ from = 1, to = 8, rep = 900, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30476, rep = 1400, items = {[80229] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30396, rep = 1800, items = {[74649] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30318, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1278, { -- Sho
  Item{ from = 1, to = 8, rep = 900, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30472, rep = 1400, items = {[79870] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30408, rep = 1800, items = {[74645] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30325, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1280, { -- Tina Mudclaw
  Item{ from = 1, to = 8, rep = 900, items = {[79264] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79265] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79266] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79267] = 1}, since = "mop" },
  Item{ from = 1, to = 8, rep = 540, items = {[79268] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30470, rep = 1400, items = {[80134] = 1}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30433, rep = 1800, items = {[74652] = 5}, since = "mop" },
  Quest{ from = 1, to = 8, id = 30323, rep = 2000, since = "mop" },
})

REP:RegisterFaction(1492, { -- Emperor Shaohao
  Mob{ from = 1, to = 7, npc = 73174, name = "Archiereus of Flame", rep = 50, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73175, name = "Cinderfall", rep = 40, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73172, name = "Flintlord Gairan", rep = 40, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73173, name = "Urdur the Cauterizer", rep = 40, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73171, name = "Champion of the Black Flame", rep = 30, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72898, name = "High Priest of Ordos", rep = 25, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72897, name = "Blazebound Chanter", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73528, name = "Eternal Kiln", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72896, name = "Eternal Kilnmaster", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, text = "jakurOfOrdan", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72888, name = "Molten Guardian", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 73170, name = "Watcher Osu", rep = 20, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72895, name = "Burning Berserker", rep = 15, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72894, name = "Ordon Fire-Watcher", rep = 10, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72892, name = "Ordon Oathguard", rep = 10, zone = "Timeless_Isle", since = "mop" },
  Mob{ from = 1, to = 7, npc = 72875, name = "Ordon Candlekeeper", rep = 5, zone = "Timeless_Isle", since = "mop" },
  Quest{ from = 1, to = 8, id = 33335, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 33340, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 33341, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 33342, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 33343, rep = 250, since = "mop" },
  Quest{ from = 1, to = 8, id = 33374, rep = 250, since = "mop" },
  Item{ from = 1, to = 8, rep = 500, items = {[143947] = 1}, since = "legion" },
})

REP:RegisterFaction(1435, { -- Shado-Pan Assault
  Mob{ from = 1, to = 4, code = 1, rep = 30, zone = "Throne_of_Thunder", since = "mop" },
  Mob{ from = 1, to = 8, code = 2, rep = 300, zone = "Throne_of_Thunder", since = "mop" },
  Mob{ from = 1, to = 8, npc = 69473, name = "Ra-den", rep = 500, zone = "Throne_of_Thunder", since = "mop" },
  Quest{ from = 1, to = 8, id = 32640, rep = 300, items = {[94221] = 3}, since = "mop", side = "Alliance" }, -- QuestID: 32640 Champions of the Thunder King
  Quest{ from = 1, to = 8, id = 32641, rep = 300, items = {[94221] = 3}, since = "mop", side = "Horde" }, -- QuestID: 32641 Champions of the Thunder King
  Item{ from = 1, to = 8, rep = 300, items = {[143945] = 1}, since = "legion" },
})

REP:RegisterFaction(1376, { -- Operation: Shieldwall
  Quest{ from = 1, to = 8, id = 32643, rep = 400, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32148, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32153, notRetail = true, rep = 300, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32149, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32152, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32150, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32151, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32143, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32145, rep = 300, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32146, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32144, rep = 300, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32142, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32347, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32119, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32122, rep = 300, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32346, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32115, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32121, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32154, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32155, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32159, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32446, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32157, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32156, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32158, notRetail = true, rep = 300, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32433, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32172, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32170, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 1, to = 8, id = 32171, rep = 200, since = "mop", side = "Alliance" },
  Item{ from = 1, to = 8, rep = 300, items = {[143944] = 1}, since = "legion", side = "Alliance" },
})

REP:RegisterFaction(1387, { -- Kirin Tor Offensive
  Quest{ from = 4, to = 8, id = 32571, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32558, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32578, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32525, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32485, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32634, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32636, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32555, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32627, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32576, notRetail = true, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32551, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32543, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32539, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32537, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32639, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32554, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32553, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32585, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32573, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32635, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32559, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32607, notRetail = true, rep = 400, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32724, notRetail = true, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32570, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32527, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32540, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32538, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32631, notRetail = true, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32581, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32528, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32546, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32560, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32548, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32552, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32632, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32638, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32536, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32586, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32301, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32588, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32557, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32637, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32541, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32544, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32701, notRetail = true, rep = 1850, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32703, notRetail = true, rep = 1900, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32704, notRetail = true, rep = 2150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32700, notRetail = true, rep = 1250, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32608, rep = 400, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32582, notRetail = true, rep = 200, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32723, notRetail = true, rep = 350, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32532, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32550, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32526, notRetail = true, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32633, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32533, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32606, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32542, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32628, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32530, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32529, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32531, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32547, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32556, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32545, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32574, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32535, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32572, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32575, rep = 150, since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 32583, notRetail = true, rep = 200, since = "mop", side = "Alliance" },
  Item{ from = 1, to = 8, rep = 300, items = {[143940] = 1}, since = "legion", side = "Alliance" },
})

REP:RegisterFaction(1419, { -- Bizmo's Brawlpub
  Quest{ from = 1, to = 8, id = 5, rep = 1, since = "mop", side = "Alliance" },
})

REP:RegisterFaction(1242, { -- Pearlfin Jinyu
  Quest{ from = 1, to = 8, id = 5, rep = 1, since = "mop", side = "Alliance" },
})

REP:RegisterFaction(1353, { -- Tushui Pandaren
  Quest{ from = 4, to = 8, id = 2, rep = 65, profession = "Cooking", since = "mop", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 4, rep = 65, profession = "Fishing", since = "mop", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreyLevelMobsInInstancesWhile20", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile20", tipText = "killingGreyLevelMobsInInstancesWhile21", since = "mop", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreyLevelBossesInInstancesWhile20", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile20", tipText = "killingGreyLevelBossesInInstancesWhile21", since = "mop", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelMobsIn21", rep = 15, headText = "killingGreenOrHigherLevelMobsIn21", tipText = "killingGreenOrHigherLevelMobsIn22", since = "mop", side = "Alliance" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelBossesIn5", rep = 300, headText = "killingGreenOrHigherLevelBossesIn5", tipText = "killingGreenOrHigherLevelBossesIn6", since = "mop", side = "Alliance" },
})

REP:RegisterFaction(1352, { -- Huojin Pandaren
  Quest{ from = 4, to = 8, id = 2, rep = 65, profession = "Cooking", since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 4, rep = 65, profession = "Fishing", since = "mop", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreyLevelMobsInInstancesWhile22", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile22", tipText = "killingGreyLevelMobsInInstancesWhile23", since = "mop", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreyLevelBossesInInstancesWhile22", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile22", tipText = "killingGreyLevelBossesInInstancesWhile23", since = "mop", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelMobsIn23", rep = 15, headText = "killingGreenOrHigherLevelMobsIn23", tipText = "killingGreenOrHigherLevelMobsIn24", since = "mop", side = "Horde" },
  General{ from = 4, to = 8, text = "killingGreenOrHigherLevelBossesIn7", rep = 300, headText = "killingGreenOrHigherLevelBossesIn7", tipText = "killingGreenOrHigherLevelBossesIn8", since = "mop", side = "Horde" },
})

REP:RegisterFaction(1374, { -- Brawl'gar Arena
  Quest{ from = 1, to = 8, id = 5, rep = 1, since = "mop", side = "Horde" },
})

REP:RegisterFaction(1228, { -- Forest Hozen
  Quest{ from = 1, to = 8, id = 5, rep = 1, since = "mop", side = "Horde" },
})

REP:RegisterFaction(1375, { -- Dominance Offensive
  Quest{ from = 1, to = 8, id = 32643, rep = 400, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32148, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32153, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32152, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32150, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32151, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32132, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32146, rep = 300, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32145, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32142, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32143, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32144, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32122, rep = 300, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32121, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32119, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32347, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32115, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32346, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32199, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32149, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32157, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32446, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32158, notRetail = true, rep = 300, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32214, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32433, notRetail = true, rep = 300, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32197, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32155, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32137, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32141, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32236, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32172, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32170, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 1, to = 8, id = 32171, rep = 200, since = "mop", side = "Horde" },
  Item{ from = 1, to = 8, rep = 300, items = {[143943] = 1}, since = "legion", side = "Horde" },
})

REP:RegisterFaction(1388, { -- Sunreaver Onslaught
  Quest{ from = 4, to = 8, id = 32571, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32578, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32525, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32485, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32634, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32636, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32627, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32576, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32576, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32551, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32543, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32539, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32537, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32639, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32492, rep = 250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32554, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32297, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32300, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32585, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32573, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32607, notRetail = true, rep = 400, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32724, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32570, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32527, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32540, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32538, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32631, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32581, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32528, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32546, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32286, rep = 250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32210, rep = 250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32229, rep = 250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32234, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32548, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32552, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32632, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32266, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32536, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32586, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32301, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32637, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32494, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32541, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32544, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32701, notRetail = true, rep = 1850, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32703, notRetail = true, rep = 1900, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32704, notRetail = true, rep = 2150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32700, notRetail = true, rep = 1250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32608, rep = 400, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32582, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32532, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32550, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32209, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32526, notRetail = true, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32633, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32533, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32606, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32275, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32628, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32482, rep = 250, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32530, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32529, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32531, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32547, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32545, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32574, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32535, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32572, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32575, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32493, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32206, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32233, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32232, rep = 150, since = "mop", side = "Horde" },
  Quest{ from = 4, to = 8, id = 32583, notRetail = true, rep = 200, since = "mop", side = "Horde" },
  Item{ from = 1, to = 8, rep = 300, items = {[143939] = 1}, since = "legion", side = "Horde" },
})

REP:RegisterFaction(1351, { -- The Brewmasters
  Quest{ from = 1, to = 8, id = 6, rep = 1, since = "mop" },
})
