----------------------------------------------------------
-- Reputation Guide | Reputation sources: Classic (incl. seasonal) --
-- Factions (and sources) added in Classic (incl. seasonal). Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(169, { -- Steamwheedle Cartel
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 150, items = {[18250] = 1}, expansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, expansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, expansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 50, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, expansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 350, items = {[18250] = 1}, notExpansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, notExpansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, notExpansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 75, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, notExpansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Mob{ from = 1, to = 7, npc = 5617, name = "Wastewander Shadow Mage", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 5623, name = "Wastewander Assassin", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 5615, name = "Wastewander Rogue", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 5616, name = "Wastewander Thief", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 5618, name = "Wastewander Bandit", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 7856, name = "Southsea Freebooter", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 7855, name = "Southsea Pirate", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 7857, name = "Southsea Dock Worker", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 7858, name = "Southsea Swashbuckler", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 7883, name = "Andre Firebeard", rep = 13, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3381, name = "Southsea Brigand", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3382, name = "Southsea Cannoneer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3383, name = "Southsea Cutthroat", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3384, name = "Southsea Privateer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3467, name = "Baron Longshore", rep = 12.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, code = 11, rep = 5, zone = "The_Cape_of_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 12, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 13, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 17, rep = 7.5, zone = "The_Cape_of_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 14, rep = 5, zone = "Northern_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 15, rep = 12.5, zone = "Northern_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata", untilPhase = "thewarwithin 1" },
  Mob{ from = 1, to = 7, text = "capNGarveyAliciaCuthbert", rep = 5, zone = "Northern_Barrens", since = "cata", untilPhase = "thewarwithin 1" },
})

REP:RegisterFaction(21, { -- Booty Bay
  Quest{ from = 1, to = 3, id = 9259, rep = 500, items = {[4306] = 40, [2604] = 4} },
  Quest{ from = 1, to = 3, id = 9266, rep = 250, items = {[14047] = 40, [3857] = 4} },
  Quest{ from = 1, to = 3, id = 9268, rep = 250, items = {[4338] = 40, [3466] = 4} },
  Quest{ from = 1, to = 3, id = 9267, rep = 250, items = {[2589] = 40, [3371] = 4} },
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 150, items = {[18250] = 1}, expansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, expansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, expansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 50, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, expansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 350, items = {[18250] = 1}, notExpansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, notExpansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, notExpansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 75, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, notExpansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Mob{ from = 1, to = 8, npc = 5617, name = "Wastewander Shadow Mage", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5623, name = "Wastewander Assassin", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5615, name = "Wastewander Rogue", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5616, name = "Wastewander Thief", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5618, name = "Wastewander Bandit", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7856, name = "Southsea Freebooter", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7855, name = "Southsea Pirate", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7857, name = "Southsea Dock Worker", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7858, name = "Southsea Swashbuckler", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7883, name = "Andre Firebeard", rep = 13, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3381, name = "Southsea Brigand", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3382, name = "Southsea Cannoneer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3383, name = "Southsea Cutthroat", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3384, name = "Southsea Privateer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3467, name = "Baron Longshore", rep = 12.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, code = 11, rep = 5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 12, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 13, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 17, rep = 7.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 14, rep = 5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 15, rep = 12.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "capNGarveyAliciaCuthbert", rep = 5, zone = "Northern_Barrens", since = "cata" },
})

REP:RegisterFaction(577, { -- Everlook
  Quest{ from = 1, to = 3, id = 9266, rep = 500, items = {[14047] = 40, [3857] = 4} },
  Quest{ from = 1, to = 3, id = 9268, rep = 250, items = {[4338] = 40, [3466] = 4} },
  Quest{ from = 1, to = 3, id = 9267, rep = 250, items = {[2589] = 40, [3371] = 4} },
  Quest{ from = 1, to = 3, id = 9259, rep = 250, items = {[4306] = 40, [2604] = 4} },
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 150, items = {[18250] = 1}, expansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, expansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, expansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 50, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, expansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 350, items = {[18250] = 1}, notExpansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, notExpansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, notExpansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 75, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, notExpansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Mob{ from = 1, to = 8, npc = 5617, name = "Wastewander Shadow Mage", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5623, name = "Wastewander Assassin", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5615, name = "Wastewander Rogue", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5616, name = "Wastewander Thief", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5618, name = "Wastewander Bandit", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7856, name = "Southsea Freebooter", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7855, name = "Southsea Pirate", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7857, name = "Southsea Dock Worker", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7858, name = "Southsea Swashbuckler", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7883, name = "Andre Firebeard", rep = 13, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3381, name = "Southsea Brigand", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3382, name = "Southsea Cannoneer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3383, name = "Southsea Cutthroat", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3384, name = "Southsea Privateer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3467, name = "Baron Longshore", rep = 12.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, code = 11, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 12, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 13, rep = 5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 17, rep = 12.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 14, rep = 2.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, text = "capNGarveyAliciaCuthbert", rep = 12.5, zone = "Northern_Barrens", since = "cata" },
})

REP:RegisterFaction(369, { -- Gadgetzan
  Quest{ from = 1, to = 3, id = 9268, rep = 500, items = {[4338] = 40, [3466] = 4} },
  Quest{ from = 1, to = 3, id = 9266, rep = 250, items = {[14047] = 40, [3857] = 4} },
  Quest{ from = 1, to = 3, id = 9267, rep = 250, items = {[2589] = 40, [3371] = 4} },
  Quest{ from = 1, to = 3, id = 9259, rep = 250, items = {[4306] = 40, [2604] = 4} },
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 150, items = {[18250] = 1}, expansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, expansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, expansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 50, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, expansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 350, items = {[18250] = 1}, notExpansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, notExpansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, notExpansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 75, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, notExpansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Mob{ from = 1, to = 5, npc = 5617, name = "Wastewander Shadow Mage", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 5, npc = 5623, name = "Wastewander Assassin", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 5, npc = 5615, name = "Wastewander Rogue", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 5, npc = 5616, name = "Wastewander Thief", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 5, npc = 5618, name = "Wastewander Bandit", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 5, npc = 7847, name = "Caliph Scorpidsting", rep = 15, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 6, npc = 7856, name = "Southsea Freebooter", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 6, npc = 7855, name = "Southsea Pirate", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 6, npc = 7857, name = "Southsea Dock Worker", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 6, npc = 7858, name = "Southsea Swashbuckler", rep = 5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 6, npc = 7883, name = "Andre Firebeard", rep = 25, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3381, name = "Southsea Brigand", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3382, name = "Southsea Cannoneer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3383, name = "Southsea Cutthroat", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3384, name = "Southsea Privateer", rep = 2.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, npc = 3467, name = "Baron Longshore", rep = 12.5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, code = 11, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 12, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 13, rep = 5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 17, rep = 12.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 14, rep = 2.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 15, rep = 12.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "capNGarveyAliciaCuthbert", rep = 25, zone = "Northern_Barrens", since = "cata" },
})

REP:RegisterFaction(470, { -- Ratchet
  Quest{ from = 1, to = 3, id = 9267, rep = 500, items = {[2589] = 40, [3371] = 4} },
  Quest{ from = 1, to = 3, id = 9266, rep = 250, items = {[14047] = 40, [3857] = 4} },
  Quest{ from = 1, to = 3, id = 9268, rep = 250, items = {[4338] = 40, [3466] = 4} },
  Quest{ from = 1, to = 3, id = 9259, rep = 250, items = {[4306] = 40, [2604] = 4} },
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 150, items = {[18250] = 1}, expansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, expansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, expansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 50, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, expansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Quest{ from = 1, to = 8, id = 7429, name = "Free Knot!", rep = 350, items = {[18250] = 1}, notExpansion = "classic", before = "cata" }, -- Free Knot! (Gordok Shackle Key) QuestID: 7429
  Quest{ from = 1, to = 8, id = 7726, name = "Refuel for the Zapping", rep = 25, items = {[18958] = 6}, notExpansion = "classic", before = "cata" }, -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
  Quest{ from = 1, to = 8, id = 7725, name = "Again With the Zapped Giants", rep = 25, items = {[18956] = 10}, notExpansion = "classic", before = "cata" }, -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
  Quest{ from = 1, to = 8, id = 5519, name = "The Gordok Ogre Suit", rep = 75, items = {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}, notExpansion = "classic", before = "cata" }, -- The Gordok Ogre Suit (repeatable) QuestID: 5519
  Mob{ from = 1, to = 8, npc = 5617, name = "Wastewander Shadow Mage", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5623, name = "Wastewander Assassin", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5615, name = "Wastewander Rogue", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5616, name = "Wastewander Thief", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 5618, name = "Wastewander Bandit", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7856, name = "Southsea Freebooter", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7855, name = "Southsea Pirate", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7857, name = "Southsea Dock Worker", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7858, name = "Southsea Swashbuckler", rep = 2.5, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7883, name = "Andre Firebeard", rep = 13, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 8, npc = 7847, name = "Caliph Scorpidsting", rep = 8, zone = "Tanaris", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3381, name = "Southsea Brigand", rep = 5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3382, name = "Southsea Cannoneer", rep = 5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3467, name = "Baron Longshore", rep = 25, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3383, name = "Southsea Cutthroat", rep = 5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 7, npc = 3384, name = "Southsea Privateer", rep = 5, zone = "The_Barrens", before = "cata" },
  Mob{ from = 1, to = 8, code = 11, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 12, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 13, rep = 2.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 17, rep = 12.5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 14, rep = 2.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, code = 15, rep = 7.5, zone = "Northern_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 8, text = "capNGarveyAliciaCuthbert", rep = 12.5, zone = "Northern_Barrens", since = "cata" },
})

REP:RegisterFaction(87, { -- Bloodsail Buccaneers
  Quest{ from = 5, to = 8, id = 9272, name = "Dressing the Part", rep = 10, repeatable = false }, -- QuestID: 9272 ("Dressing the Part")
  Quest{ from = 5, to = 8, id = 1036, name = "Avast Ye, Scallywag", rep = 25, repeatable = false }, -- QuestID: 1036 ("Avast Ye, Scallywag")
  Quest{ from = 5, to = 8, id = 4621, name = "Avast Ye, Admiral!", rep = 200, repeatable = false, expansion = "classic" }, -- QuestID: 4621 ("Avast Ye, Admiral!")
  Quest{ from = 5, to = 8, id = 4621, name = "Avast Ye, Admiral!", rep = 500, repeatable = false, notExpansion = "classic" }, -- QuestID: 4621 ("Avast Ye, Admiral!")
  Mob{ from = 1, to = 6, text = "bootyBayInnkeepersTradersBankersAuctioneers", rep = 5, zone = "Stranglethorn_Vale", before = "cata" },
  Mob{ from = 1, to = 6, npc = 4624, name = "Booty Bay Bruiser", rep = 25, zone = "Stranglethorn_Vale", before = "cata" },
  Mob{ from = 1, to = 6, npc = 15088, name = "Booty Bay Elite", rep = 25, zone = "Stranglethorn_Vale", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2496, name = "Baron Revilgaz", rep = 5, zone = "Stranglethorn_Vale", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2769, name = "Captain Steelgut", rep = 25, zone = "Arathi_Highlands", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2767, name = "First Mate Nilzlix", rep = 5, zone = "Arathi_Highlands", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2774, name = "Doctor Draxlegauge", rep = 5, zone = "Arathi_Highlands", before = "cata" }, -- Might only give 1 ReputationGuide.
  Mob{ from = 1, to = 2, npc = 2610, name = "Shakes O'Breen", rep = 5, zone = "Arathi_Highlands", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2636, name = "Blackwater Deckhand", rep = 5, zone = "Arathi_Highlands", before = "cata" },
  Mob{ from = 1, to = 6, npc = 2778, name = "Deckhand Moishe", rep = 5, zone = "Arathi_Highlands", before = "cata" },
  Mob{ from = 1, to = 7, npc = 9179, name = "Jazzrik", rep = 5, zone = "Badlands", before = "cata" },
  Mob{ from = 1, to = 8, text = "highAdmiralShellyJorrik", rep = 5, zone = "Dun_Morogh", since = "wotlk", before = "cata" }, -- Double check rep cutoff after wotlk classic
  Mob{ from = 1, to = 8, text = "bootyBayBruiserElite", rep = 25, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "someBootyBayNamed", rep = 5, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "mostBootyBayNamed", rep = 1, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "baronRevilgazGrizzlowe", rep = 25, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, npc = 4631, name = "Wharfmaster Lozgil", rep = 15, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "viznikRickleGoldgrubberBankers", rep = 25, zone = "The_Cape_of_Stranglethorn", since = "cata" },
  Mob{ from = 1, to = 7, text = "mostFaldirSCoveNamed", rep = 5, zone = "Arathi_Highlands", since = "cata" },
})

REP:RegisterFaction(529, { -- Argent Dawn
  Quest{ from = 4, to = 8, id = 5510, name = "Minion's Scourgestones", rep = 25, items = {[12840] = 20}, before = "cata" }, -- Minion's Scourgestones QuestID: 5510
  Quest{ from = 4, to = 8, id = 5509, name = "Invader's Scourgestones", rep = 25, items = {[12841] = 10}, before = "cata" }, -- Invader's Scourgestones QuestID: 5509
  Quest{ from = 4, to = 8, text = "corruptorSScourgestone", rep = 25, items = {[12843] = 1}, before = "cata" }, -- Corruptor's Scourgestone QuestID: 5508
  Quest{ from = 4, to = 8, id = 9132, rep = 10, items = {[22528] = 30}, before = "cata" }, -- Dark Iron Scraps QuestID: 9132
  Quest{ from = 4, to = 8, id = 9127, rep = 10, items = {[22526] = 30}, before = "cata" }, -- Bone Fragments QuestID: 9127
  Quest{ from = 4, to = 8, id = 9129, rep = 10, items = {[22527] = 30}, before = "cata" }, -- Core of Elements QuestID: 9129
  Quest{ from = 4, to = 8, id = 9125, rep = 10, items = {[22524] = 30}, before = "cata" }, -- Crypt Fiend Parts QuestID: 9125
  Quest{ from = 4, to = 8, id = 5227, name = "Gahrron's Withering Cauldron", rep = 25, items = {[13320] = 1, [13354] = 4, [14047] = 4}, before = "cata" }, -- Gahrron's Withering Cauldron QuestID: 5227
  Quest{ from = 4, to = 8, id = 5221, name = "Dalson's Tears Cauldron", rep = 25, items = {[13320] = 1, [13356] = 5, [14047] = 4}, before = "cata" }, -- Dalson's Tears Cauldron QuestID: 5221
  Quest{ from = 4, to = 8, id = 5218, name = "Felstone Field Cauldron", rep = 25, items = {[13320] = 1, [13357] = 6, [14047] = 4}, before = "cata" }, -- Felstone Field Cauldron QuestID: 5218
  Quest{ from = 4, to = 8, id = 5224, name = "Writhing Haunt Cauldron", rep = 25, items = {[13320] = 1, [13356] = 5, [14047] = 4}, before = "cata" }, -- Writhing Haunt Cauldron QuestID: 5224
  Item{ from = 4, to = 8, rep = 25, items = {[12844] = 1}, before = "cata" }, -- Argent Dawn Valor Token
  Mob{ from = 4, to = 5, text = "nonElitesInPlaguelands", rep = 5, before = "cata" },
  Mob{ from = 4, to = 6, text = "elitesAndShadowmagesPlaguelands", rep = 5, before = "cata" },
  Mob{ from = 4, to = 6, text = "cauldronLords", rep = 12, before = "cata" },
  Mob{ from = 4, to = 6, code = 1, rep = 5, zone = "Stratholme", expansion = "classic", before = "cata" },
  Mob{ from = 4, to = 6, code = 1, rep = 5, map = 'ScholomanceOLD', expansion = "classic", before = "cata" },
  Mob{ from = 4, to = 6, code = 1, rep = 10, zone = "Stratholme", notExpansion = "classic", before = "cata" },
  Mob{ from = 4, to = 6, code = 1, rep = 10, map = 'ScholomanceOLD', notExpansion = "classic", before = "cata" },
  Mob{ from = 4, to = 8, code = 3, rep = 25, zone = "Stratholme", before = "cata" },
  Mob{ from = 4, to = 8, code = 3, rep = 25, map = 'ScholomanceOLD', before = "cata" },
  Quest{ from = 7, to = 8, id = 28756, name = "Aberrations of Bone", rep = 2000, since = "cata" }, -- Aberrations of Bone QuestID: 28756
  Quest{ from = 7, to = 8, id = 28755, name = "Annals of the Silver Hand", rep = 2000, since = "bfa" }, -- Annals of the Silver Hand QuestID: 28755
  General{ from = 3, to = 6, text = "fionaSCaravanQuests", rep = 24000, headText = "fionaSCaravanQuests", tipText = "fionaSCaravanQuestsUntil42Argent", since = "cata" },
})

REP:RegisterFaction(909, { -- Darkmoon Faire
  Quest{ from = 4, to = 4, id = 7881, rep = 100, items = {[2309] = 3}, expansion = "classic" }, -- Carnival Boots QuestID: 7881
  Quest{ from = 4, to = 4, id = 7882, rep = 100, items = {[2314] = 3}, expansion = "classic" }, -- Carnival Jerkins QuestID: 7882
  Quest{ from = 4, to = 4, id = 7883, rep = 100, items = {[5739] = 3}, expansion = "classic" }, -- The World's Largest Gnome! QuestID: 7883
  Quest{ from = 4, to = 4, id = 7884, rep = 100, items = {[8185] = 1}, expansion = "classic" }, -- Crocolisk Boy and the Bearded Murloc QuestID: 7884
  Quest{ from = 4, to = 4, id = 7885, rep = 100, items = {[15564] = 8}, expansion = "classic" }, -- Armor Kits QuestID: 7885
  Quest{ from = 4, to = 4, id = 7889, rep = 100, items = {[3240] = 10}, expansion = "classic" }, -- Coarse Weightstone QuestID: 7889
  Quest{ from = 4, to = 4, id = 7890, rep = 100, items = {[3486] = 7}, expansion = "classic" }, -- Heavy Grinding Stone QuestID: 7890
  Quest{ from = 4, to = 4, id = 7891, rep = 100, items = {[3835] = 3}, expansion = "classic" }, -- Green Iron Bracers QuestID: 7891
  Quest{ from = 4, to = 4, id = 7892, rep = 100, items = {[7945] = 1}, expansion = "classic" }, -- Big Black Mace QuestID: 7892
  Quest{ from = 4, to = 4, id = 7893, rep = 100, items = {[12644] = 8}, expansion = "classic" }, -- Rituals of Strength QuestID: 7893
  Quest{ from = 4, to = 4, id = 7894, rep = 100, items = {[4363] = 5}, expansion = "classic" }, -- Copper Modulator QuestID: 7894
  Quest{ from = 4, to = 4, id = 7895, rep = 100, items = {[4375] = 7}, expansion = "classic" }, -- Whirring Bronze Gizmo QuestID: 7895
  Quest{ from = 4, to = 4, id = 7896, rep = 100, items = {[9313] = 36}, expansion = "classic" }, -- Green Fireworks QuestID: 7896
  Quest{ from = 4, to = 4, id = 7897, rep = 100, items = {[11590] = 6}, expansion = "classic" }, -- Mechanical Repair Kits QuestID: 7897
  Quest{ from = 4, to = 4, id = 7898, rep = 100, items = {[15994] = 6}, expansion = "classic" }, -- Thorium Widget QuestID: 7898
  Quest{ from = 4, to = 4, id = 7899, rep = 100, items = {[5134] = 5}, expansion = "classic" }, -- Small Furry Paws QuestID: 7899
  Quest{ from = 4, to = 4, id = 7900, rep = 100, items = {[11407] = 5}, expansion = "classic" }, -- Torn Bear Pelts QuestID: 7900
  Quest{ from = 4, to = 4, id = 7901, rep = 100, items = {[4582] = 5}, expansion = "classic" }, -- Soft Bushy Tails QuestID: 7901
  Quest{ from = 4, to = 4, id = 7902, rep = 100, items = {[5117] = 5}, expansion = "classic" }, -- Vibrant Plumes QuestID: 7902
  Quest{ from = 4, to = 4, id = 7903, rep = 100, items = {[11404] = 10}, expansion = "classic" }, -- Evil Bat Eyes QuestID: 7903
  Quest{ from = 4, to = 4, id = 8222, rep = 100, items = {[19933] = 10}, expansion = "classic" }, -- Glowing Scorpid Blood QuestID: 8222
  Quest{ from = 4, to = 8, id = 7929, rep = 150, items = {[19267] = 1}, expansion = "classic" }, -- Darkmoon Elementals Deck QuestID: 7929
  Quest{ from = 4, to = 8, id = 7907, rep = 150, items = {[19228] = 1}, expansion = "classic" }, -- Darkmoon Beast Deck QuestID: 7907
  Quest{ from = 4, to = 8, id = 7928, rep = 150, items = {[19257] = 1}, expansion = "classic" }, -- Darkmoon Warlords Deck QuestID: 7928
  Quest{ from = 4, to = 8, id = 7927, rep = 150, items = {[19277] = 1}, expansion = "classic" }, -- Darkmoon Portals Deck QuestID: 7927
  Quest{ from = 4, to = 8, id = 82055, rep = 150, items = {[221289] = 1}, expansion = "classic", phase = "classic 3", season = "SOD" }, -- Darkmoon Dunes Deck QuestID: 82055
  Quest{ from = 4, to = 8, id = 82058, rep = 150, items = {[221272] = 1}, expansion = "classic", phase = "classic 3", season = "SOD" }, -- Darkmoon Wilds Deck QuestID: 82058
  Quest{ from = 4, to = 8, id = 82057, rep = 150, items = {[221280] = 1}, expansion = "classic", phase = "classic 3", season = "SOD" }, -- Darkmoon Plagues Deck QuestID: 82057
  Quest{ from = 4, to = 8, id = 82056, rep = 150, items = {[221299] = 1}, expansion = "classic", phase = "classic 3", season = "SOD" }, -- Darkmoon Nightmares Deck QuestID: 82056
  Quest{ from = 4, to = 8, id = 7937, rep = 50, items = {[19423] = 1}, expansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7937
  Quest{ from = 4, to = 8, id = 7938, rep = 50, items = {[19424] = 1}, expansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7938
  Quest{ from = 4, to = 8, id = 7944, rep = 50, items = {[19443] = 1}, expansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7944
  Quest{ from = 4, to = 8, id = 7945, rep = 50, items = {[19452] = 1}, expansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7945
  Quest{ from = 4, to = 4, id = 7881, rep = 250, items = {[2309] = 3}, notExpansion = "classic", before = "cata" }, -- Carnival Boots QuestID: 7881
  Quest{ from = 4, to = 4, id = 7882, rep = 250, items = {[2314] = 3}, notExpansion = "classic", before = "cata" }, -- Carnival Jerkins QuestID: 7882
  Quest{ from = 4, to = 4, id = 7883, rep = 250, items = {[5739] = 3}, notExpansion = "classic", before = "cata" }, -- The World's Largest Gnome! QuestID: 7883
  Quest{ from = 4, to = 4, id = 7884, rep = 250, items = {[8185] = 1}, notExpansion = "classic", before = "cata" }, -- Crocolisk Boy and the Bearded Murloc QuestID: 7884
  Quest{ from = 4, to = 4, id = 7885, rep = 250, items = {[15564] = 8}, notExpansion = "classic", before = "cata" }, -- Armor Kits QuestID: 7885
  Quest{ from = 4, to = 4, id = 7889, rep = 250, items = {[3240] = 10}, notExpansion = "classic", before = "cata" }, -- Coarse Weightstone QuestID: 7889
  Quest{ from = 4, to = 4, id = 7890, rep = 250, items = {[3486] = 7}, notExpansion = "classic", before = "cata" }, -- Heavy Grinding Stone QuestID: 7890
  Quest{ from = 4, to = 4, id = 7891, rep = 250, items = {[3835] = 3}, notExpansion = "classic", before = "cata" }, -- Green Iron Bracers QuestID: 7891
  Quest{ from = 4, to = 4, id = 7892, rep = 250, items = {[7945] = 1}, notExpansion = "classic", before = "cata" }, -- Big Black Mace QuestID: 7892
  Quest{ from = 4, to = 4, id = 7893, rep = 250, items = {[12644] = 8}, notExpansion = "classic", before = "cata" }, -- Rituals of Strength QuestID: 7893
  Quest{ from = 4, to = 4, id = 7894, rep = 250, items = {[4363] = 5}, notExpansion = "classic", before = "cata" }, -- Copper Modulator QuestID: 7894
  Quest{ from = 4, to = 4, id = 7895, rep = 250, items = {[4375] = 7}, notExpansion = "classic", before = "cata" }, -- Whirring Bronze Gizmo QuestID: 7895
  Quest{ from = 4, to = 4, id = 7896, rep = 250, items = {[9313] = 36}, notExpansion = "classic", before = "cata" }, -- Green Fireworks QuestID: 7896
  Quest{ from = 4, to = 4, id = 7897, rep = 250, items = {[11590] = 6}, notExpansion = "classic", before = "cata" }, -- Mechanical Repair Kits QuestID: 7897
  Quest{ from = 4, to = 4, id = 7898, rep = 250, items = {[15994] = 6}, notExpansion = "classic", before = "cata" }, -- Thorium Widget QuestID: 7898
  Quest{ from = 4, to = 4, id = 7899, rep = 250, items = {[5134] = 5}, notExpansion = "classic", before = "cata" }, -- Small Furry Paws QuestID: 7899
  Quest{ from = 4, to = 4, id = 7900, rep = 250, items = {[11407] = 5}, notExpansion = "classic", before = "cata" }, -- Torn Bear Pelts QuestID: 7900
  Quest{ from = 4, to = 4, id = 7901, rep = 250, items = {[4582] = 5}, notExpansion = "classic", before = "cata" }, -- Soft Bushy Tails QuestID: 7901
  Quest{ from = 4, to = 4, id = 7902, rep = 250, items = {[5117] = 5}, notExpansion = "classic", before = "cata" }, -- Vibrant Plumes QuestID: 7902
  Quest{ from = 4, to = 4, id = 7903, rep = 250, items = {[11404] = 10}, notExpansion = "classic", before = "cata" }, -- Evil Bat Eyes QuestID: 7903
  Quest{ from = 4, to = 4, id = 8222, rep = 250, items = {[19933] = 10}, notExpansion = "classic", before = "cata" }, -- Glowing Scorpid Blood QuestID: 8222
  Quest{ from = 1, to = 8, id = 29443, rep = 250, items = {[71635] = 1}, notExpansion = "classic", since = "cata" }, -- A Curious Crystal QuestID: 29443
  Quest{ from = 1, to = 8, id = 29446, rep = 250, items = {[71638] = 1}, notExpansion = "classic", since = "cata" }, -- A Wondrous Weapon QuestID: 29446
  Quest{ from = 1, to = 8, id = 29456, rep = 250, items = {[71951] = 1}, notExpansion = "classic", since = "cata" }, -- A Captured Banner QuestID: 29456
  Quest{ from = 1, to = 8, id = 29444, rep = 250, items = {[71636] = 1}, notExpansion = "classic", since = "cata" }, -- An Exotic Egg QuestID: 29444
  Quest{ from = 1, to = 8, id = 29445, rep = 250, items = {[71637] = 1}, notExpansion = "classic", since = "cata" }, -- An Intriguing Grimoire QuestID: 29445
  Quest{ from = 1, to = 8, id = 29458, rep = 250, items = {[71953] = 1}, notExpansion = "classic", since = "cata" }, -- The Captured Journal QuestID: 29458
  Quest{ from = 1, to = 8, id = 29457, rep = 250, items = {[71952] = 1}, notExpansion = "classic", since = "cata" }, -- The Enemy's Insignia QuestID: 29457
  Quest{ from = 1, to = 8, id = 29451, rep = 250, items = {[71715] = 1}, notExpansion = "classic", since = "cata" }, -- The Master Strategist QuestID: 29451
  Quest{ from = 1, to = 8, id = 29464, rep = 250, items = {[71716] = 1}, notExpansion = "classic", since = "cata" }, -- Tools of Divination QuestID: 29464
  Quest{ from = 1, to = 8, id = 29463, rep = 250, notExpansion = "classic", since = "cata" }, -- It's Hammer Time QuestID: 29463
  Quest{ from = 1, to = 8, id = 29438, rep = 250, notExpansion = "classic", since = "cata" }, -- He Shoots, He Scores! QuestID: 29438
  Quest{ from = 1, to = 8, id = 29455, rep = 250, notExpansion = "classic", since = "cata" }, -- Target: Turtle QuestID: 29455
  Quest{ from = 1, to = 8, id = 29436, rep = 250, notExpansion = "classic", since = "cata" }, -- The Humanoid Cannonball QuestID: 29436
  Quest{ from = 1, to = 8, id = 29434, rep = 250, notExpansion = "classic", since = "cata" }, -- Tonk Commander QuestID: 29434
  Quest{ from = 1, to = 8, id = 29433, rep = 250, notExpansion = "classic", since = "cata" }, -- Test Your Strength QuestID: 29433
  Quest{ from = 1, to = 8, id = 37910, rep = 250, notExpansion = "classic", since = "wod" }, -- The Real Race QuestID: 37910
  Quest{ from = 1, to = 8, id = 36481, rep = 250, notExpansion = "classic", since = "wod" }, -- Firebird's Challenge QuestID: 36481
  Quest{ from = 1, to = 8, id = 64783, rep = 250, notExpansion = "classic", since = "shadowlands" }, -- Dance Dance Darkmoon QuestID: 64783
  Quest{ from = 1, to = 8, id = 29514, rep = 250, profession = "Herbalism", notExpansion = "classic", since = "cata" }, -- Herbs for Healing QuestID: 29514
  Quest{ from = 1, to = 8, id = 29519, rep = 250, profession = "Skinning", notExpansion = "classic", since = "cata" }, -- Tan My Hide QuestID: 29519
  Quest{ from = 1, to = 8, id = 29518, rep = 250, profession = "Mining", notExpansion = "classic", since = "cata" }, -- Rearm, Reuse, Recycle QuestID: 29518
  Quest{ from = 1, to = 8, id = 29511, rep = 250, profession = "Engineering", notExpansion = "classic", since = "cata" }, -- Talkin' Tonks QuestID: 29511
  Quest{ from = 1, to = 8, id = 29506, rep = 250, profession = "Alchemy", notExpansion = "classic", since = "cata" }, -- A Fizzy Fusion QuestID: 29506
  Quest{ from = 1, to = 8, id = 29508, rep = 250, profession = "Blacksmithing", notExpansion = "classic", since = "cata" }, -- Baby Needs Two Pair of Shoes QuestID: 29508
  Quest{ from = 1, to = 8, id = 29520, rep = 250, profession = "Tailoring", notExpansion = "classic", since = "cata" }, -- Banners, Banners Everywhere! QuestID: 29520
  Quest{ from = 1, to = 8, id = 29517, rep = 250, profession = "Leatherworking", notExpansion = "classic", since = "cata" }, -- Eyes on the Prizes QuestID: 29517
  Quest{ from = 1, to = 8, id = 29510, rep = 250, profession = "Enchanting", notExpansion = "classic", since = "cata" }, -- Putting Trash to Good Use QuestID: 29510
  Quest{ from = 1, to = 8, id = 29516, rep = 250, profession = "Jewelcrafting", notExpansion = "classic", since = "cata" }, -- Keeping the Faire Sparkling QuestID: 29516
  Quest{ from = 1, to = 8, id = 29515, rep = 250, profession = "Inscription", notExpansion = "classic", since = "cata" }, -- Writing the Future QuestID: 29515
  Quest{ from = 1, to = 8, id = 29507, rep = 250, profession = "Archaeology", notExpansion = "classic", since = "cata" }, -- Fun for the Little Ones QuestID: 29507
  Quest{ from = 1, to = 8, id = 29509, rep = 250, profession = "Cooking", notExpansion = "classic", since = "cata" }, -- Putting the Crunch in the Frog QuestID: 29509
  Quest{ from = 1, to = 8, id = 29513, rep = 250, profession = "Fishing", notExpansion = "classic", since = "cata" }, -- Spoilin' for Salty Sea Dogs QuestID: 29513
  Quest{ from = 1, to = 8, id = 29512, rep = 250, profession = "FirstAid", notExpansion = "classic", since = "cata", untilPhase = "bfa 0" }, -- Putting the Carnies Back Together Again QuestID: 29512
  Quest{ from = 4, to = 8, id = 7929, rep = 350, items = {[19267] = 1}, notExpansion = "classic" }, -- Darkmoon Elementals Deck QuestID: 7929
  Quest{ from = 4, to = 8, id = 7907, rep = 350, items = {[19228] = 1}, notExpansion = "classic" }, -- Darkmoon Beast Deck QuestID: 7907
  Quest{ from = 4, to = 8, id = 7928, rep = 350, items = {[19257] = 1}, notExpansion = "classic" }, -- Darkmoon Warlords Deck QuestID: 7928
  Quest{ from = 4, to = 8, id = 7927, rep = 350, items = {[19277] = 1}, notExpansion = "classic" }, -- Darkmoon Portals Deck QuestID: 7927
  Quest{ from = 4, to = 8, id = 10940, rep = 350, items = {[31907] = 1}, notExpansion = "classic", phase = "tbc 1" }, -- Darkmoon Furies Deck QuestID: 10940
  Quest{ from = 4, to = 8, id = 10941, rep = 350, items = {[31914] = 1}, notExpansion = "classic", phase = "tbc 1" }, -- Darkmoon Lunacy Deck QuestID: 10941
  Quest{ from = 4, to = 8, id = 10939, rep = 350, items = {[31891] = 1}, notExpansion = "classic", phase = "tbc 1" }, -- Darkmoon Storms Deck QuestID: 10939
  Quest{ from = 4, to = 8, id = 10938, rep = 350, items = {[31890] = 1}, notExpansion = "classic", phase = "tbc 1" }, -- Darkmoon Blessings Deck QuestID: 10938
  Quest{ from = 4, to = 8, id = 12517, rep = 25, items = {[43039] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Rogues Deck QuestID: 12517
  Quest{ from = 4, to = 8, id = 12518, rep = 25, items = {[44184] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Mages Deck QuestID: 12518
  Quest{ from = 4, to = 8, id = 12798, rep = 25, items = {[42922] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Swords Deck QuestID: 12798
  Quest{ from = 4, to = 8, id = 13311, rep = 25, items = {[44185] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Demons Deck QuestID: 13311
  Quest{ from = 4, to = 8, id = 13324, rep = 350, items = {[44259] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Darkmoon Prisms Deck QuestID: 13324
  Quest{ from = 4, to = 8, id = 13325, rep = 350, items = {[44276] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Darkmoon Chaos Deck QuestID: 13325
  Quest{ from = 4, to = 8, id = 13326, rep = 350, items = {[44326] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Darkmoon Nobles Deck QuestID: 13326
  Quest{ from = 4, to = 8, id = 13327, rep = 350, items = {[44294] = 1}, notExpansion = "classic", phase = "wotlk 1" }, -- Darkmoon Undeath Deck QuestID: 13327
  Quest{ from = 4, to = 8, id = 27664, rep = 350, items = {[62021] = 1}, notExpansion = "classic", phase = "cata 1" }, -- Darkmoon Volcanic Deck QuestID: 27664
  Quest{ from = 4, to = 8, id = 27665, rep = 350, items = {[62045] = 1}, notExpansion = "classic", phase = "cata 1" }, -- Darkmoon Hurricane Deck QuestID: 27665
  Quest{ from = 4, to = 8, id = 27666, rep = 350, items = {[62044] = 1}, notExpansion = "classic", phase = "cata 1" }, -- Darkmoon Tsunami Deck QuestID: 27666
  Quest{ from = 4, to = 8, id = 27667, rep = 350, items = {[62046] = 1}, notExpansion = "classic", phase = "cata 1" }, -- Darkmoon Earthquake Deck QuestID: 27667
  Quest{ from = 4, to = 8, id = 30449, rep = 350, items = {[79325] = 1}, notExpansion = "classic", phase = "mop 1" }, -- Darkmoon Crane Deck QuestID: 30449
  Quest{ from = 4, to = 8, id = 30450, rep = 350, items = {[79324] = 1}, notExpansion = "classic", phase = "mop 1" }, -- Darkmoon Ox Deck QuestID: 30450
  Quest{ from = 4, to = 8, id = 30451, rep = 350, items = {[79326] = 1}, notExpansion = "classic", phase = "mop 1" }, -- Darkmoon Serpent Deck QuestID: 30451
  Quest{ from = 4, to = 8, id = 30452, rep = 350, items = {[79323] = 1}, notExpansion = "classic", phase = "mop 1" }, -- Darkmoon Tiger Deck QuestID: 30452
  Quest{ from = 4, to = 8, id = 7937, rep = 75, items = {[19423] = 1}, notExpansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7937
  Quest{ from = 4, to = 8, id = 7938, rep = 75, items = {[19424] = 1}, notExpansion = "classic", before = "cata" }, -- Your Fortune Awaits You... Quest ID: 7938
  Quest{ from = 4, to = 8, id = 7944, rep = 75, items = {[19443] = 1}, notExpansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7944
  Quest{ from = 4, to = 8, id = 7945, rep = 75, items = {[19452] = 1}, notExpansion = "classic" }, -- Your Fortune Awaits You... Quest ID: 7945
})

REP:RegisterFaction(349, { -- Ravenholdt
  Mob{ from = 4, to = 6, text = "syndicateMobs", rep = 5, zone = "Hillsbrad_Foothills", before = "cata" },
  Mob{ from = 4, to = 6, text = "syndicateMobs", rep = 5, zone = "Arathi_Highlands", since = "cata" },
  Quest{ from = 4, to = 4, id = 6701, rep = 100, items = {[17124] = 1}, expansion = "classic", before = "cata", class = "ROGUE" },
  Quest{ from = 4, to = 4, id = 6701, rep = 250, items = {[17124] = 1}, notExpansion = "classic", before = "cata", class = "ROGUE" },
  Quest{ from = 4, to = 8, id = 8249, rep = 75, items = {[16885] = 5} },
})

REP:RegisterFaction(70, { -- Syndicate
  Mob{ from = 1, to = 4, npc = 13085, name = "Myrokos Silentform", rep = 25, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 7323, name = "Winstone Wolfe", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6768, name = "Lord Jorach Ravenholdt", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6707, name = "Fahrad", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6777, name = "Zan Shivsproket", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6779, name = "Smudge Thunderwood", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 7324, name = "Simone Cantrell", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 7325, name = "Master Kang", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 8309, name = "Carlo Aurelius", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6771, name = "Ravenholdt Assassin", rep = 5, zone = "Hillsbrad_Foothills" },
  Mob{ from = 1, to = 4, npc = 6766, name = "Ravenholdt Guard", rep = 5, zone = "Hillsbrad_Foothills" },
})

REP:RegisterFaction(59, { -- Thorium Brotherhood
  Quest{ from = 4, to = 8, id = 84355, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- More Like Lame-bringers! QuestID: 84355
  Quest{ from = 4, to = 8, id = 84356, rep = 150, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Oh, Shiny! QuestID: 84356
  Quest{ from = 4, to = 8, id = 84349, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Priority Target: Duke Searbrand QuestID: 84349
  Quest{ from = 4, to = 8, id = 84348, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Priority Target: Duke Tectonis QuestID: 84348
  Quest{ from = 4, to = 8, id = 84359, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Sleepless Nights QuestID: 84359
  Quest{ from = 4, to = 8, id = 84351, rep = 300, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Work Smarter, Not Harder QuestID: 84351
  Quest{ from = 4, to = 8, id = 84350, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Grinding Them Down QuestID: 84350
  Quest{ from = 4, to = 8, id = 84360, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Firefighting QuestID: 84360
  Quest{ from = 4, to = 8, id = 84372, rep = 200, expansion = "classic", phase = "classic 4", season = "SOD" }, -- Lava Diving QuestID: 84372
  Quest{ from = 6, to = 8, id = 6642, rep = 50, items = {[11370] = 10}, expansion = "classic" }, -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
  Quest{ from = 6, to = 8, id = 6645, rep = 150, items = {[17012] = 2}, expansion = "classic" }, -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
  Quest{ from = 6, to = 8, id = 6646, rep = 200, items = {[11382] = 1}, expansion = "classic" }, -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
  Quest{ from = 6, to = 8, id = 6643, rep = 200, items = {[17010] = 1}, expansion = "classic" }, -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
  Quest{ from = 6, to = 8, id = 6644, rep = 200, items = {[17011] = 1}, expansion = "classic" }, -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
  Quest{ from = 6, to = 8, id = 6642, rep = 75, items = {[11370] = 10}, notExpansion = "classic", before = "cata" }, -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
  Quest{ from = 6, to = 8, id = 6645, rep = 350, items = {[17012] = 2}, notExpansion = "classic", before = "cata" }, -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
  Quest{ from = 6, to = 8, id = 6646, rep = 500, items = {[11382] = 1}, notExpansion = "classic", before = "cata" }, -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
  Quest{ from = 6, to = 8, id = 6643, rep = 500, items = {[17010] = 1}, notExpansion = "classic", before = "cata" }, -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
  Quest{ from = 6, to = 8, id = 6644, rep = 500, items = {[17011] = 1}, notExpansion = "classic", before = "cata" }, -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
  Quest{ from = 4, to = 8, id = 6642, rep = 1200, items = {[11370] = 10}, notExpansion = "classic", since = "cata" }, -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
  Quest{ from = 4, to = 8, id = 6645, rep = 1400, items = {[17012] = 2}, notExpansion = "classic", since = "cata" }, -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
  Quest{ from = 4, to = 8, id = 6646, rep = 2000, items = {[11382] = 1}, notExpansion = "classic", since = "cata" }, -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
  Quest{ from = 4, to = 8, id = 6643, rep = 2000, items = {[17010] = 1}, notExpansion = "classic", since = "cata" }, -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
  Quest{ from = 4, to = 8, id = 6644, rep = 2000, items = {[17011] = 1}, notExpansion = "classic", since = "cata" }, -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
  Quest{ from = 4, to = 4, id = 7736, rep = 25, items = {[18944] = 2, [3356] = 4, [3857] = 1}, before = "wotlk" }, -- Restoring Fiery Flux Supplies via Kingsblood QuestID: 7736
  Quest{ from = 4, to = 4, id = 8241, rep = 25, items = {[18944] = 2, [3575] = 4, [3857] = 1}, before = "wotlk" }, -- Restoring Fiery Flux Supplies via Iron QuestID: 8241
  Quest{ from = 4, to = 4, id = 8242, rep = 25, items = {[18944] = 2, [4234] = 10, [3857] = 1}, before = "wotlk" }, -- Restoring Fiery Flux Supplies via Heavy Leather QuestID: 8242
  Quest{ from = 5, to = 5, id = 7737, rep = 25, items = {[18945] = 4}, before = "wotlk" }, -- Gaining Acceptance QuestID 7737
  Quest{ from = 5, to = 5, id = 13662, rep = 25, items = {[18945] = 4}, since = "wotlk", before = "cata" }, -- Gaining Acceptance QuestID 13662
  Quest{ from = 5, to = 5, id = 7737, rep = 625, items = {[18945] = 100}, since = "wotlk", before = "cata" }, -- Gaining Even More Acceptance QuestID: 7737
  Quest{ from = 7, to = 7, id = 13662, rep = 60, items = {[18945] = 4}, since = "cata" }, -- Gaining Acceptance QuestID 13662
  Quest{ from = 7, to = 7, id = 7737, rep = 1500, items = {[18945] = 100}, since = "cata" }, -- Gaining Even More Acceptance QuestID: 7737
})

REP:RegisterFaction(576, { -- Timbermaw Hold
  Quest{ from = 2, to = 8, id = 8467, rep = 50, items = {[21377] = 5}, expansion = "classic" },
  Quest{ from = 2, to = 8, id = 8466, rep = 50, items = {[21377] = 5}, expansion = "classic" },
  Quest{ from = 2, to = 8, id = 8469, rep = 50, items = {[21383] = 5}, expansion = "classic" },
  Mob{ from = 2, to = 6, text = "deadwoodAvengerDenWatcherShamanGardenerPathfinder", rep = 5, zone = "Felwood", expansion = "classic" },
  Mob{ from = 2, to = 6, text = "winterfellRunnerDenWatcherShamanPathfinderTotemic", rep = 5, zone = "Winterspring", expansion = "classic" },
  Mob{ from = 2, to = 8, npc = 9462, name = "Chieftain Bloodmaw", rep = 15, zone = "Felwood", expansion = "classic" },
  Mob{ from = 2, to = 8, npc = 9464, name = "Overlord Ror", rep = 15, zone = "Felwood", expansion = "classic" },
  Mob{ from = 2, to = 8, text = "ragepawRare", rep = 50, zone = "Felwood", expansion = "classic" },
  Mob{ from = 2, to = 8, npc = 10738, name = "High Chief Winterfall", rep = 20, zone = "Winterspring", expansion = "classic" },
  Mob{ from = 2, to = 8, text = "grizzleSnowpawRare", rep = 50, zone = "Winterspring", expansion = "classic" },
  Quest{ from = 2, to = 8, id = 8467, rep = 75, items = {[21377] = 5}, expansion = "tbc" },
  Quest{ from = 2, to = 8, id = 8466, rep = 75, items = {[21377] = 5}, expansion = "tbc" },
  Quest{ from = 2, to = 8, id = 8469, rep = 75, items = {[21383] = 5}, expansion = "tbc" },
  Mob{ from = 2, to = 6, text = "deadwoodAvengerDenWatcherShamanGardenerPathfinder", rep = 10, zone = "Felwood", expansion = "tbc" },
  Mob{ from = 2, to = 6, text = "winterfellRunnerDenWatcherShamanPathfinderTotemic", rep = 10, zone = "Winterspring", expansion = "tbc" },
  Mob{ from = 2, to = 8, npc = 9462, name = "Chieftain Bloodmaw", rep = 30, zone = "Felwood", expansion = "tbc" },
  Mob{ from = 2, to = 8, npc = 9464, name = "Overlord Ror", rep = 30, zone = "Felwood", expansion = "tbc" },
  Mob{ from = 2, to = 8, text = "ragepawRare", rep = 50, zone = "Felwood", expansion = "tbc" },
  Mob{ from = 2, to = 8, npc = 10738, name = "High Chief Winterfall", rep = 20, zone = "Winterspring", expansion = "tbc" },
  Mob{ from = 2, to = 8, text = "grizzleSnowpawRare", rep = 50, zone = "Winterspring", expansion = "tbc" },
  Quest{ from = 2, to = 8, id = 8467, rep = 300, items = {[21377] = 5}, since = "wotlk", before = "cata" },
  Quest{ from = 2, to = 8, id = 8466, rep = 300, items = {[21377] = 5}, since = "wotlk", before = "cata" },
  Quest{ from = 2, to = 8, id = 8469, rep = 300, items = {[21383] = 5}, since = "wotlk", before = "cata" },
  Quest{ from = 2, to = 8, id = 28395, rep = 2000, items = {[21377] = 5}, since = "cata" },
  Quest{ from = 2, to = 8, id = 28396, rep = 2000, items = {[21377] = 5}, since = "cata" },
  Quest{ from = 2, to = 8, id = 28523, rep = 2000, items = {[21383] = 5}, since = "cata" },
  Mob{ from = 2, to = 6, text = "deadwoodAvengerDenWatcherShamanGardenerPathfinder", rep = 20, zone = "Felwood", since = "wotlk" },
  Mob{ from = 2, to = 6, text = "winterfellRunnerDenWatcherShamanPathfinderTotemic", rep = 20, zone = "Winterspring", since = "wotlk" },
  Mob{ from = 2, to = 8, npc = 9462, name = "Chieftain Bloodmaw", rep = 60, zone = "Felwood", since = "wotlk" },
  Mob{ from = 2, to = 8, npc = 9464, name = "Overlord Ror", rep = 60, zone = "Felwood", since = "wotlk" },
  Mob{ from = 2, to = 8, text = "ragepawRare", rep = 100, zone = "Felwood", since = "wotlk" },
  Mob{ from = 2, to = 8, npc = 10738, name = "High Chief Winterfall", rep = 40, zone = "Winterspring", since = "wotlk" },
  Mob{ from = 2, to = 8, text = "grizzleSnowpawRare", rep = 100, zone = "Winterspring", since = "wotlk" },
})

REP:RegisterFaction(910, { -- Brood of Nozdormu
  Mob{ from = 1, to = 4, npc = 15277, name = "Anubisath Defender", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15264, name = "Anubisath Sentinel", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15262, name = "Obsidian Eradicator", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, text = "qirajLasher", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15240, name = "Vekniss Hive Crawler", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15229, name = "Vekniss Soldier", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15235, name = "Vekniss Stinger", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15230, name = "Vekniss Warrior", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 4, npc = 15236, name = "Vekniss Wasp", rep = 100, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, text = "mostBosses", rep = 50, zone = "Ruins_of_AhnQiraj" },
  Mob{ from = 1, to = 8, text = "ossirian", rep = 100, zone = "Ruins_of_AhnQiraj" },
  Mob{ from = 1, to = 8, npc = 15516, name = "Battleguard Sartura", rep = 500, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, npc = 15510, name = "Fankriss the Unyielding", rep = 500, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, npc = 15509, name = "Princess Huhuran", rep = 500, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, text = "twinEmperors", rep = 200, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, npc = 15517, name = "Ouro", rep = 500, zone = "Temple_of_AhnQiraj" },
  Mob{ from = 1, to = 8, text = "cthun", rep = 2500, zone = "Temple_of_AhnQiraj" },
  Quest{ from = 1, to = 8, id = 8595, name = "Mortal Champions", rep = 500, items = {[21229] = 1} }, -- Qiraji Lord's Insignia QuestID: 8595
  Quest{ from = 1, to = 8, id = 8784, name = "Secrets of the Qiraji", rep = 1000, items = {[21230] = 1} }, -- Ancient Qiraji Artifact
})

REP:RegisterFaction(609, { -- Cenarion Circle
  Instance{ from = 4, to = 8, instance = "Ruins_of_AhnQiraj", rep = 3000, phase = "aq" },
  Instance{ from = 4, to = 8, instance = "Temple_of_AhnQiraj", rep = 1200, phase = "aq" },
  General{ from = 4, to = 8, text = "silithystGeyser", rep = 10, headText = "silithystGeyser", tipText = "turnInTheSilithystGeyserAtYour" },
  Quest{ from = 4, to = 8, id = 8319, rep = 100, items = {[20404] = 10}, expansion = "classic" }, -- Encrypted Twilight Texts QuestID: 8319
  Quest{ from = 4, to = 8, id = 8595, name = "Mortal Champions", rep = 100, items = {[21229] = 1}, expansion = "classic" }, -- Mortal Champions QuestID: 8595
  Mob{ from = 4, to = 5, text = "anyTwilightCultistMobs", rep = 1, zone = "Silithus", expansion = "classic" },
  Mob{ from = 4, to = 6, npc = 15201, name = "Twilight Flamereaver", rep = 1, zone = "Silithus", expansion = "classic" },
  Mob{ from = 4, to = 6, text = "twilightKeeper", rep = 1, zone = "Silithus", expansion = "classic" },
  Mob{ from = 4, to = 6, npc = 14479, name = "Twilight Lord Everun", rep = 5, zone = "Silithus", expansion = "classic" },
  Mob{ from = 4, to = 6, npc = 15308, name = "Twilight Prophet", rep = 5, zone = "Silithus", expansion = "classic" },
  Quest{ from = 4, to = 8, id = 8319, rep = 500, items = {[20404] = 10}, notExpansion = "classic" }, -- Encrypted Twilight Texts QuestID: 8319
  Quest{ from = 4, to = 8, id = 8595, name = "Mortal Champions", rep = 250, items = {[21229] = 1}, notExpansion = "classic" }, -- Mortal Champions QuestID: 8595
  Mob{ from = 4, to = 5, text = "anyTwilightCultistMobs", rep = 10, zone = "Silithus", notExpansion = "classic" },
  Mob{ from = 4, to = 6, npc = 15201, name = "Twilight Flamereaver", rep = 10, zone = "Silithus", notExpansion = "classic" },
  Mob{ from = 4, to = 6, text = "twilightKeeper", rep = 10, zone = "Silithus", notExpansion = "classic" },
  Mob{ from = 4, to = 6, npc = 14479, name = "Twilight Lord Everun", rep = 10, zone = "Silithus", notExpansion = "classic" },
  Mob{ from = 4, to = 6, npc = 15308, name = "Twilight Prophet", rep = 30, zone = "Silithus", notExpansion = "classic" },
  Quest{ from = 4, to = 8, id = 8362, rep = 50, items = {[20513] = 3}, expansion = "classic", before = "cata" }, -- Abyssal Crests QuestID: 8362
  Quest{ from = 5, to = 8, id = 8363, rep = 100, items = {[20514] = 3}, expansion = "classic", before = "cata" }, -- Abyssal Signets QuestID: 8363
  Quest{ from = 7, to = 8, id = 8364, rep = 150, items = {[20515] = 3}, expansion = "classic", before = "cata" }, -- Abyssal Scepters QuestID: 8364
  Quest{ from = 4, to = 8, id = 8362, rep = 150, items = {[20513] = 3}, notExpansion = "classic", before = "cata" }, -- Abyssal Crests QuestID: 8362
  Quest{ from = 5, to = 8, id = 8363, rep = 250, items = {[20514] = 3}, expansion = "tbc", notExpansion = "classic", before = "cata" }, -- Abyssal Signets QuestID: 8363
  Quest{ from = 7, to = 8, id = 8364, rep = 350, items = {[20515] = 3}, expansion = "tbc", notExpansion = "classic", before = "cata" }, -- Abyssal Scepters QuestID: 8364
  Quest{ from = 5, to = 8, id = 8363, rep = 500, items = {[20514] = 3}, expansion = "wotlk", notExpansion = "classic", before = "cata" }, -- Abyssal Signets QuestID: 8363
  Quest{ from = 7, to = 8, id = 8364, rep = 700, items = {[20515] = 3}, expansion = "wotlk", notExpansion = "classic", before = "cata" }, -- Abyssal Scepters QuestID: 8364
  Mob{ from = 4, to = 8, text = "abyssalTemplarsLesserWindstones", rep = 5, zone = "Silithus", before = "cata" },
  Mob{ from = 4, to = 8, text = "abyssalDukesWindstones", rep = 25, zone = "Silithus", before = "cata" },
  Mob{ from = 4, to = 8, text = "abyssalLordsGreaterWindstones", rep = 50, zone = "Silithus", before = "cata" },
})

REP:RegisterFaction(749, { -- Hydraxian Waterlords
  Instance{ from = 4, to = 7, instance = "Molten_Core", rep = 1050 },
  Instance{ from = 8, to = 8, instance = "Molten_Core", rep = 350 },
  Mob{ from = 4, to = 5, npc = 11746, name = "Desert Rumbler", rep = 5, zone = "Silithus" },
  Mob{ from = 4, to = 5, npc = 11744, name = "Dust Stormer", rep = 5, zone = "Silithus" },
  Mob{ from = 4, to = 5, npc = 11745, name = "Cyclone Warrior", rep = 5, zone = "Silithus" },
  Mob{ from = 4, to = 5, npc = 11738, name = "Sand Skitterer", rep = 5, zone = "Silithus" },
  Mob{ from = 4, to = 6, text = "huricanianRare", rep = 25, zone = "Silithus" },
  Mob{ from = 4, to = 5, npc = 7032, name = "Greater Obsidian Elemental", rep = 5, zone = "Burning_Steppes" },
  Mob{ from = 4, to = 6, npc = 9017, name = "Lord Incendius", rep = 15, zone = "Blackrock_Depths" },
  Mob{ from = 4, to = 6, npc = 9816, name = "Pyroguard Emberseer", rep = 50, zone = "Blackrock_Spire" },
  Mob{ from = 4, to = 6, text = "moltenCoreTrash", rep = 20, zone = "Molten_Core" },
  Mob{ from = 4, to = 6, text = "moltenDestroyerLavaPack", rep = 40, zone = "Molten_Core" },
  Mob{ from = 4, to = 6, text = "dukeSearbrand", rep = 100, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 5, text = "dukeTectonis", rep = 5, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 5, text = "obsidianSurger", rep = 5, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 5, text = "obsidianReaver", rep = 5, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 5, npc = 5858, name = "Greater Lava Spider", rep = 5, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 5, text = "infernusSiegeGiant", rep = 20, zone = "Searing_Gorge", phase = "classic 4", season = "SOD" },
  Mob{ from = 4, to = 8, text = "fireswornElite", rep = 50, zone = "Burning_Steppes", phase = "classic 4", season = "SOD" },
  Quest{ from = 4, to = 8, id = 84355, rep = 200, phase = "classic 4", season = "SOD" }, -- More Like Lame-bringers! QuestID: 84355
  Quest{ from = 4, to = 8, id = 84349, rep = 200, phase = "classic 4", season = "SOD" }, -- Priority Target: Duke Searbrand QuestID: 84349
  Quest{ from = 4, to = 8, id = 84348, rep = 200, phase = "classic 4", season = "SOD" }, -- Priority Target: Duke Tectonis QuestID: 84348
  Quest{ from = 4, to = 8, id = 84359, rep = 150, phase = "classic 4", season = "SOD" }, -- Sleepless Nights QuestID: 84359
  Quest{ from = 4, to = 8, id = 84351, rep = 150, phase = "classic 4", season = "SOD" }, -- Work Smarter, Not Harder QuestID: 84351
  Quest{ from = 4, to = 8, id = 84350, rep = 150, phase = "classic 4", season = "SOD" }, -- Grinding Them Down QuestID: 84350
  Quest{ from = 4, to = 8, id = 84360, rep = 150, phase = "classic 4", season = "SOD" }, -- Firefighting QuestID: 84360
  Quest{ from = 4, to = 8, id = 84372, rep = 150, phase = "classic 4", season = "SOD" }, -- Lava Diving QuestID: 84372
})

REP:RegisterFaction(809, { -- Shen'dralar
  Quest{ from = 4, to = 8, id = 7483, rep = 200, items = {[18332] = 1, [18335] = 1, [14344] = 2, [12938] = 2}, expansion = "classic", before = "cata" }, -- Libram of Rapidity QuestID: 7483
  Quest{ from = 4, to = 8, id = 7484, rep = 200, items = {[18333] = 1, [18335] = 1, [14344] = 4, [12753] = 2}, expansion = "classic", before = "cata" }, -- Libram of Focus QuestID: 7484
  Quest{ from = 4, to = 8, id = 7485, rep = 200, items = {[18334] = 1, [18335] = 1, [14344] = 2, [12735] = 1}, expansion = "classic", before = "cata" }, -- Libram of Protection QuestID: 7485
  Quest{ from = 4, to = 8, id = 7483, rep = 500, items = {[18332] = 1, [18335] = 1, [14344] = 2, [12938] = 2}, notExpansion = "classic", before = "cata" }, -- Libram of Rapidity QuestID: 7483
  Quest{ from = 4, to = 8, id = 7484, rep = 500, items = {[18333] = 1, [18335] = 1, [14344] = 4, [12753] = 2}, notExpansion = "classic", before = "cata" }, -- Libram of Focus QuestID: 7484
  Quest{ from = 4, to = 8, id = 7485, rep = 500, items = {[18334] = 1, [18335] = 1, [14344] = 2, [12735] = 1}, notExpansion = "classic", before = "cata" }, -- Libram of Protection QuestID: 7485
})

REP:RegisterFaction(270, { -- Zandalar Tribe
  Quest{ from = 4, to = 8, id = 9210, rep = 200, items = {[18330] = 1}, expansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 9208, rep = 200, items = {[18331] = 1}, expansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 9209, rep = 200, items = {[18329] = 1}, expansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 9210, rep = 500, items = {[18330] = 1}, notExpansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 9208, rep = 500, items = {[18331] = 1}, notExpansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 9209, rep = 500, items = {[18329] = 1}, notExpansion = "classic", before = "cata" },
  Quest{ from = 4, to = 8, id = 8238, rep = 25, items = {[19701] = 1, [19702] = 1, [19703] = 1}, before = "cata" },
  Quest{ from = 4, to = 8, id = 8239, rep = 25, items = {[19704] = 1, [19705] = 1, [19706] = 1}, before = "cata" },
  Quest{ from = 4, to = 8, id = 8195, rep = 25, items = {[19698] = 1, [19699] = 1, [19700] = 1}, before = "cata" },
  Item{ from = 4, to = 8, rep = 50, items = {[19858] = 1}, before = "cata" },
  General{ from = 4, to = 8, text = "destoyABijouAtTheAltarOf", rep = 75, before = "cata" },
  Instance{ from = 4, to = 8, text = "zulGurub", rep = 2750, before = "cata" },
})

REP:RegisterFaction(92, { -- Gelkis Clan Centaur
  Quest{ from = 1, to = 8, id = 14394, rep = 100000, since = "cata", repeatable = false }, -- Death to Agogridon QuestID: 14394
  Mob{ from = 1, to = 4, npc = 6068, name = "Warug's Bodyguard", rep = 5, before = "cata" },
  Mob{ from = 1, to = 5, npc = 5601, name = "Khan Jehn", rep = 25, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4662, name = "Magram Bonepaw", rep = 25, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4638, name = "Magram Scout", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4640, name = "Magram Wrangler", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4641, name = "Magram Windchaser", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4642, name = "Magram Stormer", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4644, name = "Magram Marauder", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4645, name = "Magram Mauler", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4639, name = "Magram Outrunner", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4643, name = "Magram Pack Runner", rep = 20, before = "cata" },
})

REP:RegisterFaction(93, { -- Magram Clan Centaur
  Quest{ from = 1, to = 8, id = 14394, rep = 100000, since = "cata", repeatable = false }, -- Death to Agogridon QuestID: 14394
  Mob{ from = 1, to = 5, npc = 5602, name = "Khan Shaka", rep = 25, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4652, name = "Gelkis Mauler", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4653, name = "Gelkis Marauder", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4661, name = "Gelkis Rumbler", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4646, name = "Gelkis Outrunner", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4648, name = "Gelkis Stamper", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4649, name = "Gelkis Windchaser", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4647, name = "Gelkis Scout", rep = 20, before = "cata" },
  Mob{ from = 1, to = 6, npc = 4651, name = "Gelkis Earthcaller", rep = 20, before = "cata" },
})

REP:RegisterFaction(469, { -- Alliance
  General{ from = 5, to = 8, text = "completeAnyElderQuestDuringTheLunar", rep = 50, headText = "completeAnyElderQuestDuringTheLunar", tipText = "completeAnyElderQuestDuringTheLunar", expansion = "classic", side = "Alliance" },
  General{ from = 5, to = 8, text = "completeAnyElderQuestDuringTheLunar", rep = 75, headText = "completeAnyElderQuestDuringTheLunar", tipText = "completeAnyElderQuestDuringTheLunar", notExpansion = "classic", side = "Alliance" },
})

REP:RegisterFaction(72, { -- Stormwind
  Quest{ from = 4, to = 8, id = 7796, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8822, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8814, rep = 5, items = {[21436] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- One Commendation Signet QuestID = 8814
  Quest{ from = 4, to = 8, id = 8822, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- Ten Commendation Signet QuestID = 8822
  Quest{ from = 4, to = 8, id = 7796, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 1423, rep = 25, items = {[6172] = 1}, before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 18.75, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 2.5, items = {[17423] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6943, rep = 10, items = {[17504] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 2.5, items = {[17643] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Item{ from = 4, to = 8, rep = 250, items = {[45718] = 1}, since = "wotlk", side = "Alliance" }, -- Stormwind Commendation Badge: 45718
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile5", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile5", tipText = "killingGreyLevelMobsInInstancesWhile6", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile5", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile5", tipText = "killingGreyLevelBossesInInstancesWhile6", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn5", rep = 15, headText = "killingGreenOrHigherLevelMobsIn5", tipText = "killingGreenOrHigherLevelMobsIn6", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(47, { -- Ironforge
  Quest{ from = 4, to = 8, id = 7806, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8821, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8813, rep = 5, items = {[21436] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- One Commendation Signet QuestID = 8813
  Quest{ from = 4, to = 8, id = 8821, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- Ten Commendation Signet QuestID = 8821
  Quest{ from = 4, to = 8, id = 7806, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 50, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, expansion = "classic", side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 75, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, notExpansion = "classic", side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 10, items = {[17423] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6943, rep = 10, items = {[17504] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 10, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 10, items = {[17643] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 10, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Item{ from = 4, to = 8, rep = 250, items = {[45717] = 1}, since = "wotlk", side = "Alliance" }, -- Ironforge Commendation Badge: 45717
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile7", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile7", tipText = "killingGreyLevelMobsInInstancesWhile8", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile7", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile7", tipText = "killingGreyLevelBossesInInstancesWhile8", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn7", rep = 15, headText = "killingGreenOrHigherLevelMobsIn7", tipText = "killingGreenOrHigherLevelMobsIn8", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(69, { -- Darnassus
  Quest{ from = 4, to = 8, id = 7801, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8819, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8811, rep = 5, items = {[21436] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- One Commendation Signet QuestID = 8811
  Quest{ from = 4, to = 8, id = 8819, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- Ten Commendation Signet QuestID = 8819
  Quest{ from = 4, to = 8, id = 7801, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 18.75, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 2.5, items = {[17423] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6943, rep = 10, items = {[17504] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 2.5, items = {[17643] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Item{ from = 4, to = 8, rep = 250, items = {[45714] = 1}, since = "wotlk", side = "Alliance" }, -- Darnassus Commendation Badge: 45714
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile9", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile9", tipText = "killingGreyLevelMobsInInstancesWhile10", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile9", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile9", tipText = "killingGreyLevelBossesInInstancesWhile10", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn9", rep = 15, headText = "killingGreenOrHigherLevelMobsIn9", tipText = "killingGreenOrHigherLevelMobsIn10", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(54, { -- Gnomeregan Exiles
  Quest{ from = 4, to = 8, id = 7812, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8820, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 8812, rep = 5, items = {[21436] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- One Commendation Signet QuestID = 8812
  Quest{ from = 4, to = 8, id = 8820, rep = 75, items = {[21436] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Alliance" }, -- Ten Commendation Signet QuestID = 8820
  Quest{ from = 4, to = 8, id = 7812, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 18.75, items = {[17423] = 5}, repeatable = true, renown = false, pvp = true, side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 2.5, items = {[17423] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6943, rep = 10, items = {[17504] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 2.5, items = {[17643] = 1}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Alliance" },
  Item{ from = 4, to = 8, rep = 250, items = {[45716] = 1}, since = "wotlk", side = "Alliance" }, -- Gnomeregan Commendation Badge: 45716
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile11", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile11", tipText = "killingGreyLevelMobsInInstancesWhile12", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile11", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile11", tipText = "killingGreyLevelBossesInInstancesWhile12", since = "cata", side = "Alliance" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn11", rep = 15, headText = "killingGreenOrHigherLevelMobsIn11", tipText = "killingGreenOrHigherLevelMobsIn12", since = "cata", side = "Alliance" },
})

REP:RegisterFaction(890, { -- Silverwing Sentinels (Warsong Gulch)
  Quest{ from = 4, to = 8, id = 8385, name = "Concerted Efforts", rep = 100, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", before = "wod", side = "Alliance" }, -- Concerted Efforts QuestID: 8385
  Quest{ from = 4, to = 8, id = 8408, name = "Fight for Warsong Gulch", rep = 50, items = {[20558] = 3}, expansion = "classic", before = "wod", side = "Alliance" }, -- Fight for Warsong Gulch QuestID: 8408 (and so many more...)
  Quest{ from = 4, to = 8, text = "repellingInvaders", rep = 1000, items = {["Warsong Outrider Mark"] = 1}, expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" }, -- Repelling Invaders QuestID: 79090 (ItemID: 211814)
  General{ from = 4, to = 7, text = "killingEliteMobsInEitherCampBattle", rep = 10, headText = "killingEliteMobsInEitherCampBattle", tipText = "killingEliteMobsInEitherCampWill", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" },
  General{ from = 4, to = 7, text = "killingEnemyLieutenantsBattleForAshenvale", rep = 400, headText = "killingEnemyLieutenantsBattleForAshenvale", tipText = "killingEnemyLieutenants", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" },
  General{ from = 4, to = 7, text = "killingEnemyFactionLeaderBattleForAshenvale", rep = 200, headText = "killingEnemyFactionLeaderBattleForAshenvale", tipText = "killingEnemyFactionLeader", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" },
  General{ from = 4, to = 7, text = "winningTeamFriendlyLieutenantsRemainingBattleFor", rep = 200, headText = "winningTeamFriendlyLieutenantsRemainingBattleFor", tipText = "theWinningTeamWillReceive200Reputation", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" },
  General{ from = 4, to = 8, text = "warsongGulchFlagCapture", rep = 35, headText = "warsongGulchFlagCapture", tipText = "everyTimeYourTeamCapturesAFlag", before = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "warsongGulchFlagCapture", rep = 100, headText = "warsongGulchFlagCapture", tipText = "everyTimeYourTeamCapturesAFlag", since = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "warsongGulchVictory", rep = 100, headText = "warsongGulchVictory", tipText = "everyTimeYourTeamWinsYouGain", since = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "warsongGulchLoss", rep = 35, headText = "warsongGulchLoss", tipText = "everyTimeYourTeamLoseYouGain", since = "wod", side = "Alliance" },
})

REP:RegisterFaction(730, { -- Stormpike Guard (Alterac Valley)
  Quest{ from = 4, to = 8, text = "concertedEfforts", rep = 150, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", side = "Alliance" }, -- Concerted Efforts QuestID: 8388
  Quest{ from = 4, to = 8, id = 8383, name = "Remember Alterac Valley!", rep = 100, items = {[20560] = 3}, expansion = "classic", side = "Alliance" }, -- Remember Alterac Valley! QuestID: 8383
  Quest{ from = 4, to = 8, id = 7386, name = "Crystal Cluster", rep = 18.75, items = {[17423] = 5}, side = "Alliance" }, -- Crystal Cluster QuestID: 7386
  Quest{ from = 4, to = 8, id = 6881, rep = 2.5, items = {[17423] = 1}, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6942, rep = 10, items = {[17502] = 1}, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6941, rep = 10, items = {[17503] = 1}, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 7026, rep = 2.5, items = {[17643] = 1}, side = "Alliance" },
  Quest{ from = 4, to = 8, id = 6781, rep = 2.5, items = {[17422] = 20}, side = "Alliance" },
})

REP:RegisterFaction(509, { -- The League of Arathor (Arathi Basin)
  Quest{ from = 4, to = 8, id = 8385, name = "Concerted Efforts", rep = 100, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", before = "wod", side = "Alliance" }, -- Concerted Efforts QuestID: 8385
  Quest{ from = 4, to = 8, id = 8298, name = "More Resource Crates", rep = 75, items = {[19725] = 1}, expansion = "classic", before = "wod", side = "Alliance" }, -- More Resource Crates QuestID: 8298
  Quest{ from = 4, to = 8, text = "stranglethornLumber", rep = 200, items = {["Shipment of Stranglethorn Lumber"] = 1}, expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Alliance" }, -- Stranglethorn Lumber QuestID: 79990 (ItemId: 216491)
  General{ from = 4, to = 8, text = "arathiBasinCollect160Resources", rep = 10, headText = "collect160Resources", tipText = "forEvery160ResourcesYourTeamCollects", before = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "arathiBasinWin1500Resources", rep = 100, headText = "arathiBasinWin1500Resources", tipText = "ifYourTeamWinsWith1500Resources", before = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "arathiBasinCollect160Resources", rep = 50, headText = "collect160Resources", tipText = "forEvery160ResourcesYourTeamCollects2", since = "wod", side = "Alliance" },
  General{ from = 4, to = 8, text = "arathiBasinWin1500Resources", rep = 500, headText = "arathiBasinWin1500Resources", tipText = "ifYourTeamWinsWith1500Resources2", since = "wod", side = "Alliance" },
})

REP:RegisterFaction(471, { -- Wildhammer Clan
  Quest{ from = 4, to = 8, id = 2881, rep = 25, items = {[9259] = 5}, expansion = "classic", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 2881, rep = 25, items = {[9259] = 5}, expansion = "classic", side = "Alliance" },
  Mob{ from = 4, to = 8, text = "witherbarkMobs", rep = 5, zone = "The_Hinterlands", expansion = "classic", side = "Alliance" },
  Mob{ from = 4, to = 8, text = "vilebranchMobs", rep = 5, zone = "The_Hinterlands", expansion = "classic", side = "Alliance" },
})

REP:RegisterFaction(589, { -- Wintersaber Trainers
  Quest{ from = 4, to = 8, id = 4970, rep = 50, items = {[12622] = 5, [12623] = 5}, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 5201, rep = 50, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 6, to = 8, id = 5981, rep = 50, expansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 4970, rep = 250, items = {[12622] = 5, [12623] = 5}, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 4, to = 8, id = 5201, rep = 250, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 6, to = 8, id = 5981, rep = 350, notExpansion = "classic", before = "cata", side = "Alliance" },
  Quest{ from = 1, to = 4, id = 29032, rep = 3000, since = "cata", side = "Alliance", repeatable = false }, -- Get Them While They're Young QuestID: 29032
  Quest{ from = 4, to = 6, id = 29035, rep = 1500, since = "cata", side = "Alliance" }, -- A Cub's Cravings QuestID: 29035
  Quest{ from = 4, to = 6, id = 29037, rep = 1500, since = "cata", side = "Alliance" }, -- 'Borrowing' From the Winterfall QuestID: 29037
  Quest{ from = 4, to = 6, id = 29038, rep = 1500, since = "cata", side = "Alliance" }, -- Hunting Practice QuestID: 29038
  Quest{ from = 4, to = 6, id = 29040, rep = 1500, since = "cata", side = "Alliance" }, -- Cub's First Toy QuestID: 29040
  Quest{ from = 5, to = 8, id = 29034, rep = 42999, since = "cata", side = "Alliance", repeatable = false }, -- They Grow Up So Fast QuestID: 29034
})

REP:RegisterFaction(2586, { -- Azeroth Commerce Authority
  Item{ from = 4, to = 5, rep = 300, items = {[211331] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211331  Waylaid Supplies: Brilliant Smallfish
  Item{ from = 4, to = 5, rep = 300, items = {[210771] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 210771  Waylaid Supplies: Copper Bars
  Item{ from = 4, to = 5, rep = 300, items = {[211332] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211332  Waylaid Supplies: Heavy Linen Bandages
  Item{ from = 4, to = 5, rep = 300, items = {[211329] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211329  Waylaid Supplies: Herb Baked Eggs
  Item{ from = 4, to = 5, rep = 300, items = {[211315] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211315  Waylaid Supplies: Light Leather
  Item{ from = 4, to = 5, rep = 300, items = {[211316] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211316  Waylaid Supplies: Peacebloom
  Item{ from = 4, to = 5, rep = 300, items = {[211933] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211933  Waylaid Supplies: Rough Stone
  Item{ from = 4, to = 5, rep = 300, items = {[211317] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211317  Waylaid Supplies: Silverleaf
  Item{ from = 4, to = 5, rep = 300, items = {[211330] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211330  Waylaid Supplies: Spiced Wolf Meat
  Item{ from = 4, to = 5, rep = 450, items = {[211328] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211328  Waylaid Supplies: Brown Linen Robes
  Item{ from = 4, to = 5, rep = 450, items = {[211319] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211319  Waylaid Supplies: Copper Shortswords
  Item{ from = 4, to = 5, rep = 450, items = {[211326] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211326  Waylaid Supplies: Embossed Leather Vests
  Item{ from = 4, to = 5, rep = 450, items = {[211325] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211325  Waylaid Supplies: Handstitched Leather Belts
  Item{ from = 4, to = 5, rep = 450, items = {[211934] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211934  Waylaid Supplies: Healing Potions
  Item{ from = 4, to = 5, rep = 450, items = {[211321] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211321  Waylaid Supplies: Lesser Magic Wands
  Item{ from = 4, to = 5, rep = 450, items = {[211318] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211318  Waylaid Supplies: Minor Healing Potions
  Item{ from = 4, to = 5, rep = 450, items = {[211322] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211322  Waylaid Supplies: Minor Wizard Oil
  Item{ from = 4, to = 5, rep = 450, items = {[211324] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211324  Waylaid Supplies: Rough Boomsticks
  Item{ from = 4, to = 5, rep = 450, items = {[211323] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211323  Waylaid Supplies: Rough Copper Bombs
  Item{ from = 4, to = 5, rep = 450, items = {[211320] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211320  Waylaid Supplies: Runed Copper Pants
  Item{ from = 5, to = 6, rep = 500, items = {[211819] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211819  Waylaid Supplies: Bronze Bars
  Item{ from = 5, to = 6, rep = 500, items = {[211822] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211822  Waylaid Supplies: Bruiseweed
  Item{ from = 5, to = 6, rep = 500, items = {[211837] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211837  Waylaid Supplies: Goblin Deviled Clams
  Item{ from = 5, to = 6, rep = 500, items = {[211838] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211838  Waylaid Supplies: Heavy Wool Bandages
  Item{ from = 5, to = 6, rep = 500, items = {[211821] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211821  Waylaid Supplies: Medium Leather
  Item{ from = 5, to = 6, rep = 500, items = {[211820] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211820  Waylaid Supplies: Silver Bars
  Item{ from = 5, to = 6, rep = 500, items = {[211836] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211836  Waylaid Supplies: Smoked Bear Meat
  Item{ from = 5, to = 6, rep = 500, items = {[211835] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211835  Waylaid Supplies: Smoked Sagefish
  Item{ from = 5, to = 6, rep = 500, items = {[211823] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211823  Waylaid Supplies: Swiftthistle
  Item{ from = 5, to = 6, rep = 650, items = {[211831] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211831  Waylaid Supplies: Dark Leather Cloaks
  Item{ from = 5, to = 6, rep = 650, items = {[211833] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211833  Waylaid Supplies: Gray Woolen Shirts
  Item{ from = 5, to = 6, rep = 650, items = {[211824] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211824  Waylaid Supplies: Lesser Mana Potions
  Item{ from = 5, to = 6, rep = 650, items = {[211828] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211828  Waylaid Supplies: Minor Mana Oil
  Item{ from = 5, to = 6, rep = 650, items = {[211825] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211825  Waylaid Supplies: Rough Bronze Boots
  Item{ from = 5, to = 6, rep = 650, items = {[211829] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211829  Waylaid Supplies: Small Bronze Bombs
  Item{ from = 5, to = 6, rep = 800, items = {[211935] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211935  Waylaid Supplies: Elixir of Firepower
  Item{ from = 5, to = 6, rep = 800, items = {[211832] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211832  Waylaid Supplies: Hillman's Shoulders
  Item{ from = 5, to = 6, rep = 800, items = {[211830] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211830  Waylaid Supplies: Ornate Spyglasses
  Item{ from = 5, to = 6, rep = 800, items = {[211834] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211834  Waylaid Supplies: Pearl-clasped Cloaks
  Item{ from = 5, to = 6, rep = 800, items = {[211827] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211827  Waylaid Supplies: Runed Silver Rods
  Item{ from = 5, to = 6, rep = 800, items = {[211826] = 1}, phase = "classic 1", season = "SOD", side = "Alliance" }, -- 211826  Waylaid Supplies: Silver Skeleton Keys
  Item{ from = 6, to = 7, rep = 700, items = {[215413] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215413  Waylaid Supplies: Formal White Shirts
  Item{ from = 6, to = 7, rep = 700, items = {[215421] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215421  Waylaid Supplies: Fire Oil
  Item{ from = 6, to = 7, rep = 700, items = {[215391] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215391  Waylaid Supplies: Wintersbite
  Item{ from = 6, to = 7, rep = 700, items = {[215420] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215420  Waylaid Supplies: Rockscale Cod
  Item{ from = 6, to = 7, rep = 700, items = {[215389] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215389  Waylaid Supplies: Fadeleaf
  Item{ from = 6, to = 7, rep = 700, items = {[215400] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215400  Waylaid Supplies: Solid Grinding Stones
  Item{ from = 6, to = 7, rep = 700, items = {[215387] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215387  Waylaid Supplies: Heavy Hide
  Item{ from = 6, to = 7, rep = 700, items = {[215392] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215392  Waylaid Supplies: Purple Lotus
  Item{ from = 6, to = 7, rep = 700, items = {[215418] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215418  Waylaid Supplies: Spider Sausages
  Item{ from = 6, to = 7, rep = 700, items = {[215417] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215417  Waylaid Supplies: Soothing Turtle Bisque
  Item{ from = 6, to = 7, rep = 700, items = {[215419] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215419  Waylaid Supplies: Heavy Silk Bandages
  Item{ from = 6, to = 7, rep = 700, items = {[215388] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215388  Waylaid Supplies: Thick Leather
  Item{ from = 6, to = 7, rep = 700, items = {[215386] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215386  Waylaid Supplies: Mithril Bars
  Item{ from = 6, to = 7, rep = 700, items = {[215390] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215390  Waylaid Supplies: Khadgar's Whisker
  Item{ from = 6, to = 7, rep = 850, items = {[215411] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215411  Waylaid Supplies: Frost Leather Cloaks
  Item{ from = 6, to = 7, rep = 850, items = {[215408] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215408  Waylaid Supplies: Guardian Gloves
  Item{ from = 6, to = 7, rep = 850, items = {[215398] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215398  Waylaid Supplies: Green Iron Bracers
  Item{ from = 6, to = 7, rep = 850, items = {[215403] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215403  Waylaid Supplies: Deadly Scopes
  Item{ from = 6, to = 7, rep = 850, items = {[215402] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215402  Waylaid Supplies: Big Iron Bombs
  Item{ from = 6, to = 7, rep = 850, items = {[215407] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215407  Waylaid Supplies: Barbaric Shoulders
  Item{ from = 6, to = 7, rep = 850, items = {[215415] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215415  Waylaid Supplies: Rich Purple Silk Shirts
  Item{ from = 6, to = 7, rep = 850, items = {[215399] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215399  Waylaid Supplies: Heavy Mithril Gauntlets
  Item{ from = 6, to = 7, rep = 850, items = {[215414] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215414  Waylaid Supplies: Crimson Silk Pantaloons
  Item{ from = 6, to = 7, rep = 850, items = {[215401] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215401  Waylaid Supplies: Compact Harvest Reaper Kits
  Item{ from = 6, to = 7, rep = 850, items = {[215385] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215385  Waylaid Supplies: Gold Bars
  Item{ from = 6, to = 7, rep = 850, items = {[215395] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215395  Waylaid Supplies: Elixirs of Agility
  Item{ from = 6, to = 7, rep = 850, items = {[215393] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215393  Waylaid Supplies: Greater Healing Potions
  Item{ from = 6, to = 7, rep = 1000, items = {[215416] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215416  Waylaid Supplies: White Bandit Masks
  Item{ from = 6, to = 7, rep = 1000, items = {[215409] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215409  Waylaid Supplies: Turtle Scale Bracers
  Item{ from = 6, to = 7, rep = 1000, items = {[215397] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215397  Waylaid Supplies: Massive Iron Axes
  Item{ from = 6, to = 7, rep = 1000, items = {[215396] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215396  Waylaid Supplies: Elixirs of Greater Defense
  Item{ from = 6, to = 7, rep = 1000, items = {[215404] = 1}, phase = "classic 2", season = "SOD", side = "Alliance" }, -- 215404  Waylaid Supplies: Mithril Blunderbuss
  Item{ from = 7, to = 8, rep = 950, items = {[220927] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220927  Waylaid Supplies: Thick Hide
  Item{ from = 7, to = 8, rep = 950, items = {[220926] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220926  Waylaid Supplies: Rugged Leather
  Item{ from = 7, to = 8, rep = 950, items = {[220925] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220925  Waylaid Supplies: Thorium Bars
  Item{ from = 7, to = 8, rep = 950, items = {[220924] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220924  Waylaid Supplies: Truesilver Bars
  Item{ from = 7, to = 8, rep = 950, items = {[220923] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220923  Waylaid Supplies: Dreamfoil
  Item{ from = 7, to = 8, rep = 950, items = {[220922] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220922  Waylaid Supplies: Sungrass
  Item{ from = 7, to = 8, rep = 950, items = {[220921] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220921  Waylaid Supplies: Heavy Mageweave Bandages
  Item{ from = 7, to = 8, rep = 950, items = {[220920] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220920  Waylaid Supplies: Tender Wolf Steaks
  Item{ from = 7, to = 8, rep = 950, items = {[220919] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220919  Waylaid Supplies: Nightfin Soup
  Item{ from = 7, to = 8, rep = 950, items = {[220918] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220918  Waylaid Supplies: Undermine Clam Chowder
  Item{ from = 7, to = 8, rep = 1300, items = {[220942] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220942  Waylaid Supplies: Tuxedo Shirts
  Item{ from = 7, to = 8, rep = 1300, items = {[220940] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220940  Waylaid Supplies: Black Mageweave Headbands
  Item{ from = 7, to = 8, rep = 1300, items = {[220938] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220938  Waylaid Supplies: Wicked Leather Bracers
  Item{ from = 7, to = 8, rep = 1300, items = {[220937] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220937  Waylaid Supplies: Rugged Armor Kits
  Item{ from = 7, to = 8, rep = 1300, items = {[220935] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220935  Waylaid Supplies: Thorium Belts
  Item{ from = 7, to = 8, rep = 1300, items = {[220934] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220934  Waylaid Supplies: Mithril Coifs
  Item{ from = 7, to = 8, rep = 1300, items = {[220932] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220932  Waylaid Supplies: Thorium Grenades
  Item{ from = 7, to = 8, rep = 1300, items = {[220931] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220931  Waylaid Supplies: Hi-Explosive Bombs
  Item{ from = 7, to = 8, rep = 1300, items = {[220930] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220930  Waylaid Supplies: Major Healing Potions
  Item{ from = 7, to = 8, rep = 1300, items = {[220929] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220929  Waylaid Supplies: Superior Mana Potions
  Item{ from = 7, to = 8, rep = 1300, items = {[220928] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220928  Waylaid Supplies: Enchanted Thorium Bars
  Item{ from = 7, to = 8, rep = 1850, items = {[220941] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220941  Waylaid Supplies: Runecloth Belts
  Item{ from = 7, to = 8, rep = 1850, items = {[220939] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220939  Waylaid Supplies: Runic Leather Bracers
  Item{ from = 7, to = 8, rep = 1850, items = {[220936] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220936  Waylaid Supplies: Truesilver Gauntlets
  Item{ from = 7, to = 8, rep = 1850, items = {[220933] = 1}, phase = "classic 3", season = "SOD", side = "Alliance" }, -- 220933  Waylaid Supplies: Thorium Rifles
})

REP:RegisterFaction(67, { -- Horde
  General{ from = 5, to = 8, text = "completeAnyElderQuestDuringTheLunar", rep = 50, headText = "completeAnyElderQuestDuringTheLunar", tipText = "completeAnyElderQuestDuringTheLunar", expansion = "classic", side = "Horde" },
  General{ from = 5, to = 8, text = "completeAnyElderQuestDuringTheLunar", rep = 75, headText = "completeAnyElderQuestDuringTheLunar", tipText = "completeAnyElderQuestDuringTheLunar", notExpansion = "classic", side = "Horde" },
})

REP:RegisterFaction(76, { -- Orgrimmar
  Quest{ from = 4, to = 8, id = 7832, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7832
  Quest{ from = 4, to = 8, id = 8815, rep = 5, items = {[21438] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- One Commendation Signet QuestID: 8815
  Quest{ from = 4, to = 8, id = 8823, rep = 75, items = {[21438] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- Ten Commendation Signets QuestID: 8823
  Quest{ from = 4, to = 8, id = 7832, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7832
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7385, rep = 18.75, items = {[17306] = 5}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Item{ from = 4, to = 8, rep = 250, items = {[45719] = 1}, since = "wotlk", side = "Horde" },
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile13", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile13", tipText = "killingGreyLevelMobsInInstancesWhile14", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile13", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile13", tipText = "killingGreyLevelBossesInInstancesWhile14", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn13", rep = 15, headText = "killingGreenOrHigherLevelMobsIn13", tipText = "killingGreenOrHigherLevelMobsIn14", since = "cata", side = "Horde" },
})

REP:RegisterFaction(81, { -- Thunder Bluff
  Quest{ from = 4, to = 8, id = 7825, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7825
  Quest{ from = 4, to = 8, id = 8818, rep = 5, items = {[21438] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- One Commendation Signet QuestID: 8818
  Quest{ from = 4, to = 8, id = 8825, rep = 75, items = {[21438] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- Ten Commendation Signets QuestID: 8825
  Quest{ from = 4, to = 8, id = 7825, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7825
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7385, rep = 18.75, items = {[17306] = 5}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Item{ from = 4, to = 8, rep = 250, items = {[45722] = 1}, since = "wotlk", side = "Horde" },
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile15", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile15", tipText = "killingGreyLevelMobsInInstancesWhile16", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile15", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile15", tipText = "killingGreyLevelBossesInInstancesWhile16", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn15", rep = 15, headText = "killingGreenOrHigherLevelMobsIn15", tipText = "killingGreenOrHigherLevelMobsIn16", since = "cata", side = "Horde" },
})

REP:RegisterFaction(68, { -- Undercity
  Quest{ from = 4, to = 8, id = 7819, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7819
  Quest{ from = 4, to = 8, id = 8817, rep = 5, items = {[21438] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- One Commendation Signet QuestID: 8817
  Quest{ from = 4, to = 8, id = 8826, rep = 75, items = {[21438] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- Ten Commendation Signets QuestID: 8826
  Quest{ from = 4, to = 8, id = 7819, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7819
  Quest{ from = 4, to = 8, text = "cdq", rep = 250, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "fdq", rep = 250, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7385, rep = 18.75, items = {[17306] = 5}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Item{ from = 4, to = 8, rep = 250, items = {[45723] = 1}, since = "wotlk", side = "Horde" },
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile17", rep = 3, headText = "killingMobsInInstancesWhileWearingThe", tipText = "killingMobsInInstancesWhileWearingThe2", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile17", rep = 60, headText = "killingBossesInInstancesWhileWearingThe", tipText = "killingBossesInInstancesWhileWearingThe2", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn17", rep = 15, headText = "killingGreenOrHigherLevelMobsIn17", tipText = "killingGreenOrHigherLevelMobsIn18", since = "cata", side = "Horde" },
})

REP:RegisterFaction(530, { -- Darkspear Trolls
  Quest{ from = 4, to = 8, id = 7837, rep = 50, items = {[14047] = 20}, expansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7837
  Quest{ from = 4, to = 8, id = 8816, rep = 5, items = {[21438] = 1}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- One Commendation Signet QuestID: 8816
  Quest{ from = 4, to = 8, id = 8824, rep = 75, items = {[21438] = 10}, expansion = "classic", before = "cata", phase = "aq", untilPhase = "aq", side = "Horde" }, -- Ten Commendation Signets QuestID: 8824
  Quest{ from = 4, to = 8, id = 7837, rep = 75, items = {[14047] = 20}, notExpansion = "classic", before = "cata", side = "Horde" }, -- Additional Runecloth QuestID: 7837
  Quest{ from = 4, to = 8, text = "coq", rep = 65, profession = "Cooking", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, text = "foq", rep = 65, profession = "Fishing", since = "cata", side = "Horde" },
  Quest{ from = 4, to = 8, id = 7385, rep = 18.75, items = {[17306] = 5}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, repeatable = true, renown = false, pvp = true, side = "Horde" },
  Item{ from = 4, to = 8, rep = 250, items = {[45720] = 1}, since = "wotlk", side = "Horde" },
  Item{ from = 4, to = 8, rep = 62.5, items = {[4] = 1}, since = "wotlk", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelMobsInInstancesWhile18", rep = 3, headText = "killingGreyLevelMobsInInstancesWhile18", tipText = "killingGreyLevelMobsInInstancesWhile19", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreyLevelBossesInInstancesWhile18", rep = 60, headText = "killingGreyLevelBossesInInstancesWhile18", tipText = "killingGreyLevelBossesInInstancesWhile19", since = "cata", side = "Horde" },
  General{ from = 5, to = 8, text = "killingGreenOrHigherLevelMobsIn19", rep = 15, headText = "killingGreenOrHigherLevelMobsIn19", tipText = "killingGreenOrHigherLevelMobsIn20", since = "cata", side = "Horde" },
})

REP:RegisterFaction(889, { -- Warsong Outriders (Warsong Gulch)
  Quest{ from = 4, to = 8, id = 8388, name = "For Great Honor", rep = 100, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", before = "wod", side = "Horde" }, -- For Great Honor QuestID: 8388
  Quest{ from = 4, to = 8, id = 8435, name = "Battle of Warsong Gulch", rep = 50, items = {[20558] = 3}, expansion = "classic", before = "wod", side = "Horde" }, -- Battle of Warsong Gulch QuestID: 8435 (and so many more...)
  Quest{ from = 4, to = 8, text = "clearTheForest", rep = 1000, items = {["Silverwing Sentinel Charm"] = 1}, expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" }, -- Clear the Forest! QuestID: 79098 (ItemID: 211813)
  General{ from = 4, to = 7, text = "killingEliteMobsInEitherCampBattle", rep = 10, headText = "killingEliteMobsInEitherCampBattle", tipText = "killingEliteMobsInEitherCampWill", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" },
  General{ from = 4, to = 7, text = "killingEnemyLieutenantsBattleForAshenvale", rep = 400, headText = "killingEnemyLieutenantsBattleForAshenvale", tipText = "killingEnemyLieutenants", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" },
  General{ from = 4, to = 7, text = "killingEnemyFactionLeaderBattleForAshenvale", rep = 200, headText = "killingEnemyFactionLeaderBattleForAshenvale", tipText = "killingEnemyFactionLeader", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" },
  General{ from = 4, to = 7, text = "winningTeamFriendlyLieutenantsRemainingBattleFor", rep = 200, headText = "winningTeamFriendlyLieutenantsRemainingBattleFor2", tipText = "theWinningTeamWillReceive200Reputation", expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" },
  General{ from = 4, to = 8, text = "warsongGulchFlagCapture", rep = 35, headText = "warsongGulchFlagCapture", tipText = "everyTimeYourTeamCapturesAFlag2", before = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "warsongGulchFlagCapture", rep = 100, headText = "warsongGulchFlagCapture", tipText = "everyTimeYourTeamCapturesAFlag", since = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "warsongGulchVictory", rep = 100, headText = "warsongGulchVictory", tipText = "everyTimeYourTeamWinsYouGain", since = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "warsongGulchLoss", rep = 35, headText = "warsongGulchLoss", tipText = "everyTimeYourTeamLoseYouGain", since = "wod", side = "Horde" },
})

REP:RegisterFaction(729, { -- Frostwolf Clan (Alterac Valley)
  Quest{ from = 4, to = 8, id = 8388, name = "For Great Honor", rep = 150, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", side = "Horde" }, -- For Great Honor QuestID: 8388
  Quest{ from = 4, to = 8, id = 8387, name = "Invaders of Alterac Valley", rep = 100, items = {[20560] = 3}, expansion = "classic", side = "Horde" }, -- Invaders of Alterac Valley QuestID: 8387
  Quest{ from = 4, to = 8, id = 7385, rep = 18.75, items = {[17306] = 5}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6801, rep = 2.5, items = {[17306] = 1}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6825, rep = 10, items = {[17326] = 1}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6826, rep = 10, items = {[17327] = 1}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6827, rep = 10, items = {[17328] = 1}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7027, rep = 2.5, side = "Horde" },
  Quest{ from = 4, to = 8, id = 7002, rep = 2.5, items = {[17642] = 1}, side = "Horde" },
  Quest{ from = 4, to = 8, id = 6741, rep = 2.5, items = {[17422] = 20}, side = "Horde" },
})

REP:RegisterFaction(510, { -- The Defilers (Arathi Basin)
  Quest{ from = 4, to = 8, id = 8388, name = "For Great Honor", rep = 100, items = {[20560] = 3, [20559] = 3, [20558] = 3}, expansion = "classic", before = "wod", side = "Horde" }, -- For Great Honor QuestID: 8388
  Quest{ from = 4, to = 8, id = 8300, name = "More Resource Crates", rep = 75, items = {[19725] = 1}, expansion = "classic", before = "wod", side = "Horde" }, -- More Resource Crates QuestID: 8300
  Quest{ from = 4, to = 8, text = "stranglethornLumber", rep = 200, items = {["Shipment of Stranglethorn Lumber"] = 1}, expansion = "classic", before = "wod", phase = "classic 1", season = "SOD", side = "Horde" }, -- Stranglethorn Lumber QuestID: 79991 (ItemId: 216491)
  General{ from = 4, to = 8, text = "arathiBasinCollect160Resources", rep = 10, headText = "collect160Resources", tipText = "forEvery160ResourcesYourTeamCollects", before = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "arathiBasinWin1500Resources", rep = 100, headText = "arathiBasinWin1500Resources", tipText = "ifYourTeamWinsWith1500Resources", before = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "arathiBasinCollect160Resources", rep = 50, headText = "collect160Resources", tipText = "forEvery160ResourcesYourTeamCollects2", since = "wod", side = "Horde" },
  General{ from = 4, to = 8, text = "arathiBasinWin1500Resources", rep = 500, headText = "arathiBasinWin1500Resources", tipText = "ifYourTeamWinsWith1500Resources2", since = "wod", side = "Horde" },
})

REP:RegisterFaction(2587, { -- Durotar Supply and Logistics
  Item{ from = 4, to = 5, rep = 300, items = {[211331] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211331  Waylaid Supplies: Brilliant Smallfish
  Item{ from = 4, to = 5, rep = 300, items = {[210771] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 210771  Waylaid Supplies: Copper Bars
  Item{ from = 4, to = 5, rep = 300, items = {[211332] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211332  Waylaid Supplies: Heavy Linen Bandages
  Item{ from = 4, to = 5, rep = 300, items = {[211329] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211329  Waylaid Supplies: Herb Baked Eggs
  Item{ from = 4, to = 5, rep = 300, items = {[211315] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211315  Waylaid Supplies: Light Leather
  Item{ from = 4, to = 5, rep = 300, items = {[211316] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211316  Waylaid Supplies: Peacebloom
  Item{ from = 4, to = 5, rep = 300, items = {[211933] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211933  Waylaid Supplies: Rough Stone
  Item{ from = 4, to = 5, rep = 300, items = {[211317] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211317  Waylaid Supplies: Silverleaf
  Item{ from = 4, to = 5, rep = 300, items = {[211330] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211330  Waylaid Supplies: Spiced Wolf Meat
  Item{ from = 4, to = 5, rep = 450, items = {[211328] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211328  Waylaid Supplies: Brown Linen Robes
  Item{ from = 4, to = 5, rep = 450, items = {[211319] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211319  Waylaid Supplies: Copper Shortswords
  Item{ from = 4, to = 5, rep = 450, items = {[211326] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211326  Waylaid Supplies: Embossed Leather Vests
  Item{ from = 4, to = 5, rep = 450, items = {[211325] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211325  Waylaid Supplies: Handstitched Leather Belts
  Item{ from = 4, to = 5, rep = 450, items = {[211934] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211934  Waylaid Supplies: Healing Potions
  Item{ from = 4, to = 5, rep = 450, items = {[211321] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211321  Waylaid Supplies: Lesser Magic Wands
  Item{ from = 4, to = 5, rep = 450, items = {[211318] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211318  Waylaid Supplies: Minor Healing Potions
  Item{ from = 4, to = 5, rep = 450, items = {[211322] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211322  Waylaid Supplies: Minor Wizard Oil
  Item{ from = 4, to = 5, rep = 450, items = {[211324] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211324  Waylaid Supplies: Rough Boomsticks
  Item{ from = 4, to = 5, rep = 450, items = {[211323] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211323  Waylaid Supplies: Rough Copper Bombs
  Item{ from = 4, to = 5, rep = 450, items = {[211320] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211320  Waylaid Supplies: Runed Copper Pants
  Item{ from = 5, to = 6, rep = 500, items = {[211819] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211819  Waylaid Supplies: Bronze Bars
  Item{ from = 5, to = 6, rep = 500, items = {[211822] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211822  Waylaid Supplies: Bruiseweed
  Item{ from = 5, to = 6, rep = 500, items = {[211837] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211837  Waylaid Supplies: Goblin Deviled Clams
  Item{ from = 5, to = 6, rep = 500, items = {[211838] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211838  Waylaid Supplies: Heavy Wool Bandages
  Item{ from = 5, to = 6, rep = 500, items = {[211821] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211821  Waylaid Supplies: Medium Leather
  Item{ from = 5, to = 6, rep = 500, items = {[211820] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211820  Waylaid Supplies: Silver Bars
  Item{ from = 5, to = 6, rep = 500, items = {[211836] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211836  Waylaid Supplies: Smoked Bear Meat
  Item{ from = 5, to = 6, rep = 500, items = {[211835] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211835  Waylaid Supplies: Smoked Sagefish
  Item{ from = 5, to = 6, rep = 500, items = {[211823] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211823  Waylaid Supplies: Swiftthistle
  Item{ from = 5, to = 6, rep = 650, items = {[211831] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211831  Waylaid Supplies: Dark Leather Cloaks
  Item{ from = 5, to = 6, rep = 650, items = {[211833] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211833  Waylaid Supplies: Gray Woolen Shirts
  Item{ from = 5, to = 6, rep = 650, items = {[211824] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211824  Waylaid Supplies: Lesser Mana Potions
  Item{ from = 5, to = 6, rep = 650, items = {[211828] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211828  Waylaid Supplies: Minor Mana Oil
  Item{ from = 5, to = 6, rep = 650, items = {[211825] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211825  Waylaid Supplies: Rough Bronze Boots
  Item{ from = 5, to = 6, rep = 650, items = {[211829] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211829  Waylaid Supplies: Small Bronze Bombs
  Item{ from = 5, to = 6, rep = 800, items = {[211935] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211935  Waylaid Supplies: Elixir of Firepower
  Item{ from = 5, to = 6, rep = 800, items = {[211832] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211832  Waylaid Supplies: Hillman's Shoulders
  Item{ from = 5, to = 6, rep = 800, items = {[211830] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211830  Waylaid Supplies: Ornate Spyglasses
  Item{ from = 5, to = 6, rep = 800, items = {[211834] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211834  Waylaid Supplies: Pearl-clasped Cloaks
  Item{ from = 5, to = 6, rep = 800, items = {[211827] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211827  Waylaid Supplies: Runed Silver Rods
  Item{ from = 5, to = 6, rep = 800, items = {[211826] = 1}, phase = "classic 1", season = "SOD", side = "Horde" }, -- 211826  Waylaid Supplies: Silver Skeleton Keys
  Item{ from = 6, to = 7, rep = 700, items = {[215413] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215413  Waylaid Supplies: Formal White Shirts
  Item{ from = 6, to = 7, rep = 700, items = {[215421] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215421  Waylaid Supplies: Fire Oil
  Item{ from = 6, to = 7, rep = 700, items = {[215391] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215391  Waylaid Supplies: Wintersbite
  Item{ from = 6, to = 7, rep = 700, items = {[215420] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215420  Waylaid Supplies: Rockscale Cod
  Item{ from = 6, to = 7, rep = 700, items = {[215389] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215389  Waylaid Supplies: Fadeleaf
  Item{ from = 6, to = 7, rep = 700, items = {[215400] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215400  Waylaid Supplies: Solid Grinding Stones
  Item{ from = 6, to = 7, rep = 700, items = {[215387] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215387  Waylaid Supplies: Heavy Hide
  Item{ from = 6, to = 7, rep = 700, items = {[215392] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215392  Waylaid Supplies: Purple Lotus
  Item{ from = 6, to = 7, rep = 700, items = {[215418] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215418  Waylaid Supplies: Spider Sausages
  Item{ from = 6, to = 7, rep = 700, items = {[215417] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215417  Waylaid Supplies: Soothing Turtle Bisque
  Item{ from = 6, to = 7, rep = 700, items = {[215419] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215419  Waylaid Supplies: Heavy Silk Bandages
  Item{ from = 6, to = 7, rep = 700, items = {[215388] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215388  Waylaid Supplies: Thick Leather
  Item{ from = 6, to = 7, rep = 700, items = {[215386] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215386  Waylaid Supplies: Mithril Bars
  Item{ from = 6, to = 7, rep = 700, items = {[215390] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215390  Waylaid Supplies: Khadgar's Whisker
  Item{ from = 6, to = 7, rep = 850, items = {[215411] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215411  Waylaid Supplies: Frost Leather Cloaks
  Item{ from = 6, to = 7, rep = 850, items = {[215408] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215408  Waylaid Supplies: Guardian Gloves
  Item{ from = 6, to = 7, rep = 850, items = {[215398] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215398  Waylaid Supplies: Green Iron Bracers
  Item{ from = 6, to = 7, rep = 850, items = {[215403] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215403  Waylaid Supplies: Deadly Scopes
  Item{ from = 6, to = 7, rep = 850, items = {[215402] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215402  Waylaid Supplies: Big Iron Bombs
  Item{ from = 6, to = 7, rep = 850, items = {[215407] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215407  Waylaid Supplies: Barbaric Shoulders
  Item{ from = 6, to = 7, rep = 850, items = {[215415] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215415  Waylaid Supplies: Rich Purple Silk Shirts
  Item{ from = 6, to = 7, rep = 850, items = {[215399] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215399  Waylaid Supplies: Heavy Mithril Gauntlets
  Item{ from = 6, to = 7, rep = 850, items = {[215414] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215414  Waylaid Supplies: Crimson Silk Pantaloons
  Item{ from = 6, to = 7, rep = 850, items = {[215401] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215401  Waylaid Supplies: Compact Harvest Reaper Kits
  Item{ from = 6, to = 7, rep = 850, items = {[215385] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215385  Waylaid Supplies: Gold Bars
  Item{ from = 6, to = 7, rep = 850, items = {[215395] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215395  Waylaid Supplies: Elixirs of Agility
  Item{ from = 6, to = 7, rep = 850, items = {[215393] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215393  Waylaid Supplies: Greater Healing Potions
  Item{ from = 6, to = 7, rep = 1000, items = {[215416] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215416  Waylaid Supplies: White Bandit Masks
  Item{ from = 6, to = 7, rep = 1000, items = {[215409] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215409  Waylaid Supplies: Turtle Scale Bracers
  Item{ from = 6, to = 7, rep = 1000, items = {[215397] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215397  Waylaid Supplies: Massive Iron Axes
  Item{ from = 6, to = 7, rep = 1000, items = {[215396] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215396  Waylaid Supplies: Elixirs of Greater Defense
  Item{ from = 6, to = 7, rep = 1000, items = {[215404] = 1}, phase = "classic 2", season = "SOD", side = "Horde" }, -- 215404  Waylaid Supplies: Mithril Blunderbuss
  Item{ from = 7, to = 8, rep = 950, items = {[220927] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220927  Waylaid Supplies: Thick Hide
  Item{ from = 7, to = 8, rep = 950, items = {[220926] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220926  Waylaid Supplies: Rugged Leather
  Item{ from = 7, to = 8, rep = 950, items = {[220925] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220925  Waylaid Supplies: Thorium Bars
  Item{ from = 7, to = 8, rep = 950, items = {[220924] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220924  Waylaid Supplies: Truesilver Bars
  Item{ from = 7, to = 8, rep = 950, items = {[220923] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220923  Waylaid Supplies: Dreamfoil
  Item{ from = 7, to = 8, rep = 950, items = {[220922] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220922  Waylaid Supplies: Sungrass
  Item{ from = 7, to = 8, rep = 950, items = {[220921] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220921  Waylaid Supplies: Heavy Mageweave Bandages
  Item{ from = 7, to = 8, rep = 950, items = {[220920] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220920  Waylaid Supplies: Tender Wolf Steaks
  Item{ from = 7, to = 8, rep = 950, items = {[220919] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220919  Waylaid Supplies: Nightfin Soup
  Item{ from = 7, to = 8, rep = 950, items = {[220918] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220918  Waylaid Supplies: Undermine Clam Chowder
  Item{ from = 7, to = 8, rep = 1300, items = {[220942] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220942  Waylaid Supplies: Tuxedo Shirts
  Item{ from = 7, to = 8, rep = 1300, items = {[220940] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220940  Waylaid Supplies: Black Mageweave Headbands
  Item{ from = 7, to = 8, rep = 1300, items = {[220938] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220938  Waylaid Supplies: Wicked Leather Bracers
  Item{ from = 7, to = 8, rep = 1300, items = {[220937] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220937  Waylaid Supplies: Rugged Armor Kits
  Item{ from = 7, to = 8, rep = 1300, items = {[220935] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220935  Waylaid Supplies: Thorium Belts
  Item{ from = 7, to = 8, rep = 1300, items = {[220934] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220934  Waylaid Supplies: Mithril Coifs
  Item{ from = 7, to = 8, rep = 1300, items = {[220932] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220932  Waylaid Supplies: Thorium Grenades
  Item{ from = 7, to = 8, rep = 1300, items = {[220931] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220931  Waylaid Supplies: Hi-Explosive Bombs
  Item{ from = 7, to = 8, rep = 1300, items = {[220930] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220930  Waylaid Supplies: Major Healing Potions
  Item{ from = 7, to = 8, rep = 1300, items = {[220929] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220929  Waylaid Supplies: Superior Mana Potions
  Item{ from = 7, to = 8, rep = 1300, items = {[220928] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220928  Waylaid Supplies: Enchanted Thorium Bars
  Item{ from = 7, to = 8, rep = 1850, items = {[220941] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220941  Waylaid Supplies: Runecloth Belts
  Item{ from = 7, to = 8, rep = 1850, items = {[220939] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220939  Waylaid Supplies: Runic Leather Bracers
  Item{ from = 7, to = 8, rep = 1850, items = {[220936] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220936  Waylaid Supplies: Truesilver Gauntlets
  Item{ from = 7, to = 8, rep = 1850, items = {[220933] = 1}, phase = "classic 3", season = "SOD", side = "Horde" }, -- 220933  Waylaid Supplies: Thorium Rifles
})

REP:RegisterFaction(2641, { -- Emerald Wardens
  Quest{ from = 4, to = 8, id = 81716, rep = 10, phase = "classic 3", season = "SOD" }, -- QuestID: 81716 - Recover Incursion Field Report: Duskwood
  Quest{ from = 4, to = 8, id = 81730, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81730 - Duskwood Mission I: Defeat Worgen
  Quest{ from = 4, to = 8, id = 81731, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81731 - Duskwood Mission II: Defeat Ogres
  Quest{ from = 4, to = 8, id = 81732, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81732 - Duskwood Mission III: Defeat Dragonkin
  Quest{ from = 4, to = 8, id = 81733, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81733 - Duskwood Mission IV: Ogre Intelligence
  Quest{ from = 4, to = 8, id = 81734, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81734 - Duskwood Mission V: Worgen Intelligence
  Quest{ from = 4, to = 8, id = 81735, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81735 - Duskwood Mission VI: Dragon Intelligence
  Quest{ from = 4, to = 8, id = 81736, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81736 - Duskwood Mission VII: Recover Shadowscythe
  Quest{ from = 4, to = 8, id = 81737, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81737 - Duskwood Mission VIII: Recover Ogre Magi text
  Quest{ from = 4, to = 8, id = 81738, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81738 - Duskwood Mission IX: Recover Dragon Egg
  Quest{ from = 4, to = 8, id = 81739, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81739 - Duskwood Mission X: Nightmare Moss
  Quest{ from = 4, to = 8, id = 81740, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81740 - Duskwood Mission XI: Cold Iron Ore
  Quest{ from = 4, to = 8, id = 81741, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81741 - Duskwood Mission XII: Dream-Touched Dragonscale
  Quest{ from = 4, to = 8, id = 81742, rep = 200, phase = "classic 3", season = "SOD" }, -- QuestID: 81742 - Duskwood Mission XIII: Defeat Ylanthrius
  Quest{ from = 4, to = 8, id = 81743, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81743 - Duskwood Mission XIV: Defeat Vvarc'zul
  Quest{ from = 4, to = 8, id = 81744, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81744 - Duskwood Mission XV: Defeat Amokarok
  Quest{ from = 4, to = 8, id = 81745, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81745 - Duskwood Mission XVI: Rescue Kroll Mountainshade
  Quest{ from = 4, to = 8, id = 81746, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81746 - Duskwood Mission XVII: Rescue Alara Grovemender
  Quest{ from = 4, to = 8, id = 81747, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81747 - Duskwood Mission XVIII: Rescue Elenora Marshwalker
  Quest{ from = 4, to = 8, id = 81727, rep = 10, phase = "classic 3", season = "SOD" }, -- QuestID: 81727 - Recover Incursion Field Report: Ashenvale
  Quest{ from = 4, to = 8, id = 81768, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81768 - Ashenvale Mission I: Defeat Satyrs
  Quest{ from = 4, to = 8, id = 81769, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81769 - Ashenvale Mission II: Defeat Treants
  Quest{ from = 4, to = 8, id = 81770, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81770 - Ashenvale Mission III: Defeat Dragonkin
  Quest{ from = 4, to = 8, id = 81771, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81771 - Ashenvale Mission IV: Dragon Intelligence
  Quest{ from = 4, to = 8, id = 81772, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81772 - Ashenvale Mission V: Satyr Intelligence
  Quest{ from = 4, to = 8, id = 81773, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81773 - Ashenvale Mission VI: Treant Intelligence
  Quest{ from = 4, to = 8, id = 81774, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81774 - Ashenvale Mission VII: Recover Dreamengine
  Quest{ from = 4, to = 8, id = 81775, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81775 - Ashenvale Mission VIII: Recover Azsharan Prophecy
  Quest{ from = 4, to = 8, id = 81776, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81776 - Ashenvale Mission IX: Recover Dream-Touched Dragonegg
  Quest{ from = 4, to = 8, id = 81777, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81777 - Ashenvale Mission X: Dreamroot
  Quest{ from = 4, to = 8, id = 81778, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81778 - Ashenvale Mission XI: Fool's Gold Dust
  Quest{ from = 4, to = 8, id = 81779, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81779 - Ashenvale Mission XII: Dream-Infused Dragonscale
  Quest{ from = 4, to = 8, id = 81780, rep = 200, phase = "classic 3", season = "SOD" }, -- QuestID: 81780 - Ashenvale Mission XIII: Defeat Larsera
  Quest{ from = 4, to = 8, id = 81781, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81781 - Ashenvale Mission XIV: Defeat Zalius
  Quest{ from = 4, to = 8, id = 81782, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81782 - Ashenvale Mission XV: Defeat Shredder 9000
  Quest{ from = 4, to = 8, id = 81783, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81783 - Ashenvale Mission XVI: Rescue Alyssian Windcaller
  Quest{ from = 4, to = 8, id = 81784, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81784 - Ashenvale Mission XVII: Rescue Doran Dreambough
  Quest{ from = 4, to = 8, id = 81785, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81785 - Ashenvale Mission XVIII: Rescue Maseara Autumnmoon
  Quest{ from = 4, to = 8, id = 81786, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81786 - Hinterlands Mission I: Defeat Moonkin
  Quest{ from = 4, to = 8, id = 81787, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81787 - Hinterlands Mission II: Defeat Giant Turtles
  Quest{ from = 4, to = 8, id = 81788, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81788 - Hinterlands Mission III: Defeat Dragonkin
  Quest{ from = 4, to = 8, id = 81789, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81789 - Hinterlands Mission IV: Dragon Intelligence
  Quest{ from = 4, to = 8, id = 81817, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81817 - Hinterlands Mission V: Turtle Intelligence
  Quest{ from = 4, to = 8, id = 81820, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81820 - Hinterlands Mission VI: Moonkin Intelligence
  Quest{ from = 4, to = 8, id = 81826, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81826 - Hinterlands Mission VII: Recover Star-Touched Dragonegg
  Quest{ from = 4, to = 8, id = 81830, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81830 - Hinterlands Mission VIII: Recover Elunar Relic
  Quest{ from = 4, to = 8, id = 81832, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81832 - Hinterlands Mission IX: Recover Dreampearl
  Quest{ from = 4, to = 8, id = 81833, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81833 - Hinterlands Mission X: Star Lotus
  Quest{ from = 4, to = 8, id = 81834, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81834 - Hinterlands Mission XI: Starsilver Ore
  Quest{ from = 4, to = 8, id = 81835, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81835 - Hinterlands Mission XII: Starshells
  Quest{ from = 4, to = 8, id = 81837, rep = 200, phase = "classic 3", season = "SOD" }, -- QuestID: 81837 - Hinterlands Mission XIII: Defeat Florius
  Quest{ from = 4, to = 8, id = 81838, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81838 - Hinterlands Mission XIV: Defeat Doomkin
  Quest{ from = 4, to = 8, id = 81839, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81839 - Hinterlands Mission XV: Defeat Ghamoo-Raja
  Quest{ from = 4, to = 8, id = 81850, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81850 - Hinterlands Mission XVI: Rescue Elianar Shadowdrinker
  Quest{ from = 4, to = 8, id = 81851, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81851 - Hinterlands Mission XVII: Rescue Serlina Starbright
  Quest{ from = 4, to = 8, id = 81852, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81852 - Hinterlands Mission XVIII: Rescue Veanna Cloudsleeper
  Quest{ from = 4, to = 8, id = 81855, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81855 - Feralas Mission I: Defeat Children of Cenarius
  Quest{ from = 4, to = 8, id = 81856, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81856 - Feralas Mission II: Defeat Harpies
  Quest{ from = 4, to = 8, id = 81857, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81857 - Feralas Mission III: Defeat Dragonkin
  Quest{ from = 4, to = 8, id = 81858, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81858 - Feralas Mission IV: Dragon Intelligence
  Quest{ from = 4, to = 8, id = 81859, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81859 - Feralas Mission V: Cenarion Intelligence
  Quest{ from = 4, to = 8, id = 81860, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81860 - Feralas Mission VI: Harpy Intelligence
  Quest{ from = 4, to = 8, id = 81861, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81861 - Feralas Mission VII: Recover Moonglow Dragonegg
  Quest{ from = 4, to = 8, id = 81863, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81863 - Feralas Mission VIII: Recover Keeper's Notes
  Quest{ from = 4, to = 8, id = 81864, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81864 - Feralas Mission IX: Recover Harpy Screed
  Quest{ from = 4, to = 8, id = 81865, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81865 - Feralas Mission X: Moonroot
  Quest{ from = 4, to = 8, id = 81866, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81866 - Feralas Mission XI: Greater Moonstone
  Quest{ from = 4, to = 8, id = 81867, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81867 - Feralas Mission XII: Greater Moondragon Scales
  Quest{ from = 4, to = 8, id = 81868, rep = 200, phase = "classic 3", season = "SOD" }, -- QuestID: 81868 - Feralas Mission XIII: Defeat Tyrannikus
  Quest{ from = 4, to = 8, id = 81870, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81870 - Feralas Mission XIV: Defeat Alondrius
  Quest{ from = 4, to = 8, id = 81871, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81871 - Feralas Mission XV: Defeat Slirena
  Quest{ from = 4, to = 8, id = 81872, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81872 - Feralas Mission XVI: Rescue Mellias Earthtender
  Quest{ from = 4, to = 8, id = 81873, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81873 - Feralas Mission XVII: Rescue Nerene Brooksinger
  Quest{ from = 4, to = 8, id = 81874, rep = 75, phase = "classic 3", season = "SOD" }, -- QuestID: 81874 - Feralas Mission XVIII: Rescue Jamniss Treemender
  Quest{ from = 4, to = 8, id = 82068, rep = 1000, phase = "classic 3", season = "SOD" }, -- QuestID: 82068 - Fight the Nightmare Incursions
})
