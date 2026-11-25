----------------------------------------------------------
-- Reputation Guide | Reputation sources: World of Warcraft: Forever --
-- Factions added in World of Warcraft: Forever (the Kirin Tor here is the Forever faction 2740, not the Wrath faction 1090).
-- Sources from Wowhead Forever and the Forever reputation guides (November 2026); every source only applies on Forever.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars
local Quest, Mob, Item, Instance, General = REP:SourceTypes()

local function RegisterForeverFaction(factionID, sources)
  for _, source in ipairs(sources) do source.forever = true end
  REP:RegisterFaction(factionID, sources)
end

RegisterForeverFaction(2779, { -- High Order (Alliance Skyborne)
  Quest{ from = 4, to = 8, id = 99194, name = "A Donation of Runecloth", rep = 150, items = {[14047] = 60}, repeatable = false }, -- Oura Stormspinner
})

RegisterForeverFaction(2778, { -- Windshapers (Horde Skyborne)
  Quest{ from = 4, to = 8, id = 99199, name = "A Donation of Runecloth", rep = 150, items = {[14047] = 60}, repeatable = false }, -- Oura Stormspinner
})

RegisterForeverFaction(2758, { -- Nightclaw Druids
  Quest{ from = 4, to = 8, id = 93459, name = "More Al'Aketh Ears", rep = 200, items = {[258771] = 5} }, -- Vayn Moongaze
  Quest{ from = 4, to = 8, id = 93165, name = "Mercy Falls on Deaf Ears", rep = 1000, items = {[258771] = 5}, repeatable = false },
  Quest{ from = 4, to = 8, id = 94484, name = "Unnerving Silence", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 94493, name = "A Sacrifice in Vain", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 94485, name = "Tears of the Lady", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94486, name = "Feathers for Binding", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94487, name = "Unwanted and Unworthy", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94489, name = "The Wounds of Betrayal", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94488, name = "The Ties That Bind", rep = 1000, repeatable = false },
  Quest{ from = 4, to = 8, id = 94490, name = "Ripped Missive", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94491, name = "The Fate of the Den", rep = 500, repeatable = false },
  Quest{ from = 4, to = 8, id = 94638, name = "Strength and Mercy", rep = 100, repeatable = false }, -- Skyborne druids
  Quest{ from = 4, to = 8, id = 94912, name = "Child of Nature", rep = 100, repeatable = false }, -- Skyborne druids
})

RegisterForeverFaction(2740, { -- Kirin Tor (Forever, Alliance)
  Quest{ from = 4, to = 5, id = 96602, name = "More Unstable Magic", rep = 150, items = {[274964] = 5} }, -- Archmage Celindra, until Honored
  Instance{ from = 4, to = 4, name = "City of Dalaran", rep = 900 }, -- about 900 per run (player report)
  Quest{ from = 4, to = 8, id = 92432, name = "An Alarming Request", rep = 10, repeatable = false },
  Quest{ from = 4, to = 8, id = 92458, name = "Heart of Disruption", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 92459, name = "Friend of the Kirin Tor", rep = 10, repeatable = false },
  Quest{ from = 4, to = 8, id = 92457, name = "Starving Arcane", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96800, name = "Past Due", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 97130, name = "Ancient Gurubashi Secrets", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96773, name = "The Coldbringer's Eye", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96771, name = "Vengeance of the Highborne", rep = 250, repeatable = false },
  Quest{ from = 4, to = 8, id = 96770, name = "The Witch Doctor's Head", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96609, name = "A Taste of Home", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96772, name = "The Dragon's Journal", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96603, name = "Unstable Magic", rep = 500, items = {[274964] = 10}, repeatable = false },
  Quest{ from = 4, to = 8, id = 97173, name = "Blackmaw Magic", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96797, name = "The Orphan", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96798, name = "Into the Darkness", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96811, name = "Escaping the Shadows", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96799, name = "A Heavy Responsibility", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 96812, name = "Thicker Than Water", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 94946, name = "The Magical City of Dalaran", rep = 100, repeatable = false }, -- Skyborne
  Quest{ from = 4, to = 8, id = 93963, name = "Exploring the Alliance", rep = 100, repeatable = false }, -- Skyborne
})

RegisterForeverFaction(2787, { -- Earthen Ring (Forever, Horde)
  Quest{ from = 4, to = 5, id = 98476, name = "More Unstable Magic", rep = 150, items = {[274964] = 5} }, -- Nuara Tremorhoof, until Honored
  Quest{ from = 4, to = 8, id = 96774, name = "Ancient Gurubashi Idol", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 97196, name = "The Coldbringer's Eye", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96775, name = "Zum'rah's Head", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 96776, name = "An'she's Radiance", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 97197, name = "Fragment of the Firelands", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 98477, name = "Unstable Magic", rep = 500, items = {[274964] = 10}, repeatable = false },
  Quest{ from = 4, to = 8, id = 97198, name = "Blackmaw Magic", rep = 300, repeatable = false },
  Quest{ from = 4, to = 8, id = 95928, name = "Crystalline Elements", rep = 100, repeatable = false },
  Quest{ from = 4, to = 8, id = 95349, name = "The Earthen Ring", rep = 100, repeatable = false }, -- Windshaper Skyborne
  Quest{ from = 4, to = 8, id = 93739, name = "Exploring the Horde", rep = 100, repeatable = false }, -- Windshaper Skyborne
})

RegisterForeverFaction(2765, { -- Guardians of Hyjal
  Quest{ from = 4, to = 8, id = 92169, name = "Paying Back the Pact", rep = 150, repeatable = false },
  Quest{ from = 4, to = 8, id = 92833, name = "Ve'han's Fall", rep = 150, repeatable = false },
  Quest{ from = 4, to = 8, id = 93521, name = "Challenger of the Gods", rep = 50, repeatable = false },
  Quest{ from = 4, to = 8, id = 93848, name = "Work Well Done", rep = 150, repeatable = false },
  Quest{ from = 4, to = 8, id = 99670, name = "Return to Jereman", rep = 150, repeatable = false },
})

RegisterForeverFaction(2747, { -- Barkskin Burrow
  Quest{ from = 4, to = 8, id = 93925, name = "Beads for Brerufa", rep = 150, items = {[263439] = 8} }, -- Brerufa, until Exalted
  Item{ from = 2, to = 8, rep = 150, items = {[269025] = 1} }, -- Ceremonial Mastic
  Quest{ from = 2, to = 8, id = 91696, name = "Open Season", rep = 500, repeatable = false },
  Quest{ from = 2, to = 8, id = 93952, name = "Balance Through Strength", rep = 400, repeatable = false },
  Quest{ from = 2, to = 8, id = 95273, name = "Water of Hyjal", rep = 350, repeatable = false },
  Quest{ from = 2, to = 8, id = 93825, name = "Barkbound Blessings", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93826, name = "Deal Dread to Deadwood", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93827, name = "Windswept Wards", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93828, name = "Herbs of the Hollow", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93830, name = "Water of Hyjal", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93832, name = "Shatter the Stonewatchers", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93833, name = "Wicked Wisdom", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93834, name = "Burrow Beetles", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 95107, name = "Deeproar Down", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 95108, name = "Mystic Mix", rep = 325, repeatable = false },
  Quest{ from = 2, to = 8, id = 93831, name = "Sweetpaw Jam", rep = 200, repeatable = false },
  Quest{ from = 2, to = 8, id = 94504, name = "Barkskin Beginnings", rep = 200, repeatable = false },
  Quest{ from = 2, to = 8, id = 96666, name = "Burrow Bonding", rep = 200, repeatable = false },
  Quest{ from = 2, to = 8, id = 96830, name = "Farsight Guided", rep = 200, repeatable = false },
  Quest{ from = 2, to = 8, id = 91697, name = "Meet the Elders", rep = 150, repeatable = false },
})

RegisterForeverFaction(2799, { -- Theramore Expeditionary Force (Darkspear Islands, Alliance)
  Quest{ from = 4, to = 8, id = 98896, name = "Darkspear Islands Clash", rep = 100, pvp = true },
  Quest{ from = 4, to = 8, id = 98901, name = "Darkspear Islands Clash", rep = 150, pvp = true, repeatable = false },
  Quest{ from = 4, to = 8, id = 98905, name = "The Battle for Darkspear Islands!", rep = 200, pvp = true, repeatable = false },
})

RegisterForeverFaction(2798, { -- Darkspear Raiders (Darkspear Islands, Horde)
  Quest{ from = 4, to = 8, id = 98888, name = "Conflict at Darkspear Islands", rep = 100, pvp = true },
  Quest{ from = 4, to = 8, id = 98893, name = "Conflict at Darkspear Islands", rep = 150, pvp = true, repeatable = false },
  Quest{ from = 4, to = 8, id = 98908, name = "The Battle for Darkspear Islands!", rep = 200, pvp = true, repeatable = false },
})

-- No known sources yet: 2719 Cenarion Scouts, 2782 Bolder'ok Clan, 2819 The Watchers, 2826 Brotherhood of the Horse, 2827 Powderfuse.
