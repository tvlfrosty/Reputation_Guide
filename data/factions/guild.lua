----------------------------------------------------------
-- Reputation Guide | Reputation sources: Guild --
-- Factions (and sources) added in Guild. Conditions decide on which clients a source applies.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

REP:RegisterFaction(1168, { -- Guild
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests", since = "cata" },
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn2", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests2", factor = 0.5, since = "cata" },
  General{ from = 1, to = 8, text = "allYellowOrHigherLevelQuestTurn3", rep = 125, headText = "gainReputationByDoingThisQuest", tipText = "completeAnyYellowOrHigherLevelQuests3", factor = 1, since = "cata" },
}, "guild")
