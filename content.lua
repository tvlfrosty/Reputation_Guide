---------------------------
-- Initialize Addon vars --
---------------------------
local _, vars = ...
local REP = vars

function REP_InitEnFactionGains(guildName, guildCapBase)
  REP:SetZoneIdsBasedOnExpansion()
  local zone = REP.zone

  if (not REP.IsAlliance) and (not REP.IsHorde) then
    local locFaction = UnitFactionGroup("player")
    if (locFaction == FACTION_ALLIANCE) then REP.IsAlliance = true end
    if (locFaction == FACTION_HORDE) then REP.IsHorde = true end
  end

--------------------------------------------------
-- Factions released 'during' Vanilla/Classic
--------------------------------------------------
	---------------------------
	-- Steamwheedle Cartel 169
	---------------------------
	---- Quests
	if (not REP.AfterWotlk) then
		if (REP.IsClassic) then
			REP_AddQuest(169, 1, 8, "Free Knot!", 150, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(169, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(169, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(169, 1, 8, "The Gordok Ogre Suit", 50, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		else
			REP_AddQuest(169, 1, 8, "Free Knot!", 350, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(169, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(169, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(169, 1, 8, "The Gordok Ogre Suit", 75, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		end
		---- Mobs
		REP_AddMob(169, 1, 7, "Wastewander Shadow Mage", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Wastewander Assassin", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Wastewander Rogue", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Wastewander Thief", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Wastewander Bandit", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Southsea Freebooter", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Southsea Pirate", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Southsea Dock Worker", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Southsea Swashbuckler", 2.5, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Andre Firebeard", 13, zone.Tanaris)
		REP_AddMob(169, 1, 7, "Southsea Brigand", 2.5, zone.The_Barrens)
		REP_AddMob(169, 1, 7, "Southsea Cannoneer", 2.5, zone.The_Barrens)
		REP_AddMob(169, 1, 7, "Southsea Cutthroat", 2.5, zone.The_Barrens)
		REP_AddMob(169, 1, 7, "Southsea Privateer", 2.5, zone.The_Barrens)
		REP_AddMob(169, 1, 7, "Baron Longshore", 12.5, zone.The_Barrens)
	else
    ---- Mobs
    REP_AddMob(169, 1, 7, 11, 5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(169, 1, 7, 12, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(169, 1, 7, 13, 2.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(169, 1, 7, 17, 7.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(169, 1, 7, 14, 5, zone.Northern_Stranglethorn)
    REP_AddMob(169, 1, 7, 15, 12.5, zone.Northern_Stranglethorn)
    REP_AddMob(169, 1, 7, 15, 7.5, zone.Northern_Stranglethorn)
    REP_AddMob(169, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 5, zone.Northern_Barrens)
	end

	---------------------------
	-- Booty Bay 21
	---------------------------
	---- Quests
	REP_AddQuest(21, 1, 3, 9259, 500, {[4306] = 40, [2604] = 4})
	REP_AddQuest(21, 1, 3, 9266, 250, {[14047] = 40, [3857] = 4})
	REP_AddQuest(21, 1, 3, 9268, 250, {[4338] = 40, [3466] = 4})
	REP_AddQuest(21, 1, 3, 9267, 250, {[2589] = 40, [3371] = 4})
	if (not REP.AfterWotlk) then
		if (REP.IsClassic) then
			REP_AddQuest(21, 1, 8, "Free Knot!", 150, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(21, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(21, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(21, 1, 8, "The Gordok Ogre Suit", 50, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		else
			REP_AddQuest(21, 1, 8, "Free Knot!", 350, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(21, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(21, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(21, 1, 8, "The Gordok Ogre Suit", 75, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		end
		---- Mobs
		REP_AddMob(21, 1, 8, "Wastewander Shadow Mage", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Wastewander Assassin", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Wastewander Rogue", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Wastewander Thief", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Wastewander Bandit", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Southsea Freebooter", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Southsea Pirate", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Southsea Dock Worker", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Southsea Swashbuckler", 2.5, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Andre Firebeard", 13, zone.Tanaris)
		REP_AddMob(21, 1, 8, "Southsea Brigand", 2.5, zone.The_Barrens)
		REP_AddMob(21, 1, 8, "Southsea Cannoneer", 2.5, zone.The_Barrens)
		REP_AddMob(21, 1, 8, "Southsea Cutthroat", 2.5, zone.The_Barrens)
		REP_AddMob(21, 1, 8, "Southsea Privateer", 2.5, zone.The_Barrens)
		REP_AddMob(21, 1, 8, "Baron Longshore", 12.5, zone.The_Barrens)
	else
    ---- Mobs
    REP_AddMob(21, 1, 7, 11, 5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(21, 1, 7, 12, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(21, 1, 7, 13, 2.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(21, 1, 7, 17, 7.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(21, 1, 7, 14, 5, zone.Northern_Stranglethorn)
    REP_AddMob(21, 1, 7, 15, 12.5, zone.Northern_Stranglethorn)
    REP_AddMob(21, 1, 7, 15, 7.5, zone.Northern_Stranglethorn)
    REP_AddMob(21, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 5, zone.Northern_Barrens)
	end

	---------------------------
	-- Everlook 577
	---------------------------
	---- Quests
	REP_AddQuest(577, 1, 3, 9266, 500, {[14047] = 40, [3857] = 4})
	REP_AddQuest(577, 1, 3, 9268, 250, {[4338] = 40, [3466] = 4})
	REP_AddQuest(577, 1, 3, 9267, 250, {[2589] = 40, [3371] = 4})
	REP_AddQuest(577, 1, 3, 9259, 250, {[4306] = 40, [2604] = 4})
	if (not REP.AfterWotlk) then
		if (REP.IsClassic) then
			REP_AddQuest(577, 1, 8, "Free Knot!", 150, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(577, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(577, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(577, 1, 8, "The Gordok Ogre Suit", 50, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		else
			REP_AddQuest(577, 1, 8, "Free Knot!", 350, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(577, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(577, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(577, 1, 8, "The Gordok Ogre Suit", 75, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		end
		---- Mobs
		REP_AddMob(577, 1, 8, "Wastewander Shadow Mage", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Wastewander Assassin", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Wastewander Rogue", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Wastewander Thief", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Wastewander Bandit", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Southsea Freebooter", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Southsea Pirate", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Southsea Dock Worker", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Southsea Swashbuckler", 2.5, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Andre Firebeard", 13, zone.Tanaris)
		REP_AddMob(577, 1, 8, "Southsea Brigand", 2.5, zone.The_Barrens)
		REP_AddMob(577, 1, 8, "Southsea Cannoneer", 2.5, zone.The_Barrens)
		REP_AddMob(577, 1, 8, "Southsea Cutthroat", 2.5, zone.The_Barrens)
		REP_AddMob(577, 1, 8, "Southsea Privateer", 2.5, zone.The_Barrens)
		REP_AddMob(577, 1, 8, "Baron Longshore", 12.5, zone.The_Barrens)
	else
		---- Mobs
		REP_AddMob(577, 1, 7, 11, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(577, 1, 7, 12, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(577, 1, 8, 13, 5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(577, 1, 7, 17, 12.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(577, 1, 7, 14, 2.5, zone.Northern_Stranglethorn)
		REP_AddMob(577, 1, 8, 15, 7.5, zone.Northern_Stranglethorn)
		REP_AddMob(577, 1, 8, 15, 7.5, zone.Northern_Stranglethorn)
		REP_AddMob(577, 1, 8, "Cap'n Garvey & Alicia Cuthbert", 12.5, zone.Northern_Barrens)
	end

	---------------------------
	-- Gadgetzan 369
	---------------------------
	---- Quests
	REP_AddQuest(369, 1, 3, 9268, 500, {[4338] = 40, [3466] = 4})
	REP_AddQuest(369, 1, 3, 9266, 250, {[14047] = 40, [3857] = 4})
	REP_AddQuest(369, 1, 3, 9267, 250, {[2589] = 40, [3371] = 4})
	REP_AddQuest(369, 1, 3, 9259, 250, {[4306] = 40, [2604] = 4})
	if (not REP.AfterWotlk) then
		if (REP.IsClassic) then
			REP_AddQuest(369, 1, 8, "Free Knot!", 150, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(369, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(369, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(369, 1, 8, "The Gordok Ogre Suit", 50, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		else
			REP_AddQuest(369, 1, 8, "Free Knot!", 350, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(369, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(369, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(369, 1, 8, "The Gordok Ogre Suit", 75, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		end
		---- Mobs
		REP_AddMob(369, 1, 5, "Wastewander Shadow Mage", 5, zone.Tanaris)
		REP_AddMob(369, 1, 5, "Wastewander Assassin", 5, zone.Tanaris)
		REP_AddMob(369, 1, 5, "Wastewander Rogue", 5, zone.Tanaris)
		REP_AddMob(369, 1, 5, "Wastewander Thief", 5, zone.Tanaris)
		REP_AddMob(369, 1, 5, "Wastewander Bandit", 5, zone.Tanaris)
		REP_AddMob(369, 1, 5, "Caliph Scorpidsting", 15, zone.Tanaris)
		REP_AddMob(369, 1, 6, "Southsea Freebooter", 5, zone.Tanaris)
		REP_AddMob(369, 1, 6, "Southsea Pirate", 5, zone.Tanaris)
		REP_AddMob(369, 1, 6, "Southsea Dock Worker", 5, zone.Tanaris)
		REP_AddMob(369, 1, 6, "Southsea Swashbuckler", 5, zone.Tanaris)
		REP_AddMob(369, 1, 6, "Andre Firebeard", 25, zone.Tanaris)
		REP_AddMob(369, 1, 8, "Southsea Brigand", 2.5, zone.The_Barrens)
		REP_AddMob(369, 1, 8, "Southsea Cannoneer", 2.5, zone.The_Barrens)
		REP_AddMob(369, 1, 8, "Southsea Cutthroat", 2.5, zone.The_Barrens)
		REP_AddMob(369, 1, 8, "Southsea Privateer", 2.5, zone.The_Barrens)
		REP_AddMob(369, 1, 8, "Baron Longshore", 12.5, zone.The_Barrens)
	else
		---- Mobs
		REP_AddMob(369, 1, 8, 11, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(369, 1, 8, 12, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(369, 1, 7, 13, 5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(369, 1, 8, 17, 12.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(369, 1, 7, 14, 2.5, zone.Northern_Stranglethorn)
		REP_AddMob(369, 1, 8, 15, 7.5, zone.Northern_Stranglethorn)
		REP_AddMob(369, 1, 7, 15, 12.5, zone.Northern_Stranglethorn)
		REP_AddMob(369, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 25, zone.Northern_Barrens)
	end

	---------------------------
	-- Ratchet 470
	---------------------------
	---- Quests
	REP_AddQuest(470, 1, 3, 9267, 500, {[2589] = 40, [3371] = 4})
	REP_AddQuest(470, 1, 3, 9266, 250, {[14047] = 40, [3857] = 4})
	REP_AddQuest(470, 1, 3, 9268, 250, {[4338] = 40, [3466] = 4})
	REP_AddQuest(470, 1, 3, 9259, 250, {[4306] = 40, [2604] = 4})
	if (not REP.AfterWotlk) then
		if (REP.IsClassic) then
			REP_AddQuest(470, 1, 8, "Free Knot!", 150, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(470, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(470, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(470, 1, 8, "The Gordok Ogre Suit", 50, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		else
			REP_AddQuest(470, 1, 8, "Free Knot!", 350, {[18250] = 1}) -- Free Knot! (Gordok Shackle Key) QuestID: 5525
			REP_AddQuest(470, 1, 8, "Refuel for the Zapping", 25, {[18958] = 6}) -- Refuel for the Zapping (Water Elemental Core) QuestID: 7726
			REP_AddQuest(470, 1, 8, "Again With the Zapped Giants", 25, {[18956] = 10}) -- Again With the Zapped Giants (Miniaturization Residue) QuestID: 7725
			REP_AddQuest(470, 1, 8, "The Gordok Ogre Suit", 75, {[18240] = 1, [14048] = 4, [8170] = 8, [14341] = 2}) -- The Gordok Ogre Suit (repeatable) QuestID: 5519
		end
		---- Mobs
		REP_AddMob(470, 1, 8, "Wastewander Shadow Mage", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Wastewander Assassin", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Wastewander Rogue", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Wastewander Thief", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Wastewander Bandit", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Southsea Freebooter", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Southsea Pirate", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Southsea Dock Worker", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Southsea Swashbuckler", 2.5, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Andre Firebeard", 13, zone.Tanaris)
		REP_AddMob(470, 1, 8, "Caliph Scorpidsting", 8, zone.Tanaris)
		REP_AddMob(470, 1, 7, "Southsea Brigand", 5, zone.The_Barrens)
		REP_AddMob(470, 1, 7, "Southsea Cannoneer", 5, zone.The_Barrens)
		REP_AddMob(470, 1, 7, "Baron Longshore", 25, zone.The_Barrens)
		REP_AddMob(470, 1, 7, "Southsea Cutthroat", 5, zone.The_Barrens)
		REP_AddMob(470, 1, 7, "Southsea Privateer", 5, zone.The_Barrens)
	else
		---- Mobs
		REP_AddMob(470, 1, 8, 11, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(470, 1, 8, 12, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(470, 1, 8, 13, 2.5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(470, 1, 7, 17, 12.5, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(470, 1, 7, 14, 2.5, zone.Northern_Stranglethorn)
		REP_AddMob(470, 1, 7, 15, 7.5, zone.Northern_Stranglethorn)
		REP_AddMob(470, 1, 8, 15, 7.5, zone.Northern_Stranglethorn)
		REP_AddMob(470, 1, 8, "Cap'n Garvey & Alicia Cuthbert", 12.5, zone.Northern_Barrens)
	end

	---------------------------
	-- Bloodsail Buccaneers 87
	---------------------------
	---- Quests
	REP_AddQuest(87, 5, 8, "Dressing the Part", 10, nil, nil, false) -- QuestID: 9272 ("Dressing the Part")
	REP_AddQuest(87, 5, 8, "Avast Ye, Scallywag", 25, nil, nil, false) -- QuestID: 1036 ("Avast Ye, Scallywag")
	if (REP.IsClassic) then
		REP_AddQuest(87, 5, 8, "Avast Ye, Admiral!", 200, nil, nil, false) -- QuestID: 4621 ("Avast Ye, Admiral!")
	else
		REP_AddQuest(87, 5, 8, "Avast Ye, Admiral!", 500, nil, nil, false) -- QuestID: 4621 ("Avast Ye, Admiral!")
	end
	if (not REP.AfterWotlk) then
		---- Mobs
		REP_AddMob(87, 1, 6, "Booty Bay innkeepers/traders/bankers/auctioneers", 5, zone.Stranglethorn_Vale)
		REP_AddMob(87, 1, 6, "Booty Bay Bruiser", 25, zone.Stranglethorn_Vale)
		REP_AddMob(87, 1, 6, "Booty Bay Elite", 25, zone.Stranglethorn_Vale)
		REP_AddMob(87, 1, 6, "Baron Revilgaz", 5, zone.Stranglethorn_Vale)
		REP_AddMob(87, 1, 6, "Captain Steelgut", 25, zone.Arathi_Highlands)
		REP_AddMob(87, 1, 6, "First Mate Nilzlix", 5, zone.Arathi_Highlands)
		REP_AddMob(87, 1, 6, "Doctor Draxlegauge", 5, zone.Arathi_Highlands) -- Might only give 1 rep.
		REP_AddMob(87, 1, 2, "Shakes O'Breen", 5, zone.Arathi_Highlands)
		REP_AddMob(87, 1, 6, "Blackwater Deckhand", 5, zone.Arathi_Highlands)
		REP_AddMob(87, 1, 6, "Deckhand Moishe", 5, zone.Arathi_Highlands)
		REP_AddMob(87, 1, 7, "Jazzrik", 5, zone.Badlands)
		if (REP.AfterTBC) then
			REP_AddMob(87, 1, 8, "High Admiral 'Shelly' Jorrik", 5, zone.Dun_Morogh) -- Double check rep cutoff after wotlk classic
		end
	else
		---- Mobs
		REP_AddMob(87, 1, 7, "Booty Bay Bruiser & Elite", 25, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(87, 1, 7, "Some Booty Bay Named", 5, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(87, 1, 7, "Most Booty Bay Named", 1, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(87, 1, 7, "Baron Revilgaz, Grizzlowe, & Wharfmaster Lozgil", 25, zone.The_Cape_of_Stranglethorn)
		REP_AddMob(87, 1, 7, "Viznik & Rickle Goldgrubber (bankers)", 25, zone.The_Cape_of_Stranglethorn)
    REP_AddMob(87, 1, 7, "Most Faldir's Cove Named", 5, zone.Arathi_Highlands)
	end

	---------------------------
	-- Argent Dawn 529
	---------------------------
	if (not REP.AfterWotlk) then
		---- Quests
		REP_AddQuest(529, 4, 8, "Minion's Scourgestones", 25, {[12840] = 20}) -- Minion's Scourgestones QuestID: 5510
		REP_AddQuest(529, 4, 8, "Invader's Scourgestones", 25, {[12841] = 10}) -- Invader's Scourgestones QuestID: 5509
		REP_AddQuest(529, 4, 8, "Corruptor's Scourgestone", 25, {[12843] = 1}) -- Corruptor's Scourgestone QuestID: 5508
		REP_AddQuest(529, 4, 8, 9132, 10, {[22528] = 30}) -- Dark Iron Scraps QuestID: 9132
		REP_AddQuest(529, 4, 8, 9127, 10, {[22526] = 30}) -- Bone Fragments QuestID: 9127
		REP_AddQuest(529, 4, 8, 9129, 10, {[22527] = 30}) -- Core of Elements QuestID: 9129
		REP_AddQuest(529, 4, 8, 9125, 10, {[22524] = 30}) -- Crypt Fiend Parts QuestID: 9125
		REP_AddQuest(529, 4, 8, "Gahrron's Withering Cauldron", 25, {[13320] = 1, [13354] = 4, [14047] = 4}) -- Gahrron's Withering Cauldron QuestID: 5227
		REP_AddQuest(529, 4, 8, "Dalson's Tears Cauldron", 25, {[13320] = 1, [13356] = 5, [14047] = 4}) -- Dalson's Tears Cauldron QuestID: 5221
		REP_AddQuest(529, 4, 8, "Felstone Field Cauldron", 25, {[13320] = 1, [13357] = 6, [14047] = 4}) -- Felstone Field Cauldron QuestID: 5218
		REP_AddQuest(529, 4, 8, "Writhing Haunt Cauldron", 25, {[13320] = 1, [13356] = 5, [14047] = 4}) -- Writhing Haunt Cauldron QuestID: 5224
		---- Items
		REP_AddItems(529, 4, 8, 25, {[12844] = 1}) -- Argent Dawn Valor Token
		---- Mobs
		REP_AddMob(529, 4, 5, "Non-Elites in Plaguelands", 5)
		REP_AddMob(529, 4, 6, "Elites and Shadowmages Plaguelands", 5)
		REP_AddMob(529, 4, 6, "Cauldron Lords", 12)
		if(REP.IsClassic) then
			REP_AddMob(529, 4, 7, "Trash mobs in Stratholme and Scholomance", 5)
		else
			REP_AddMob(529, 4, 8, "Trash mobs in Stratholme and Scholomance", 5)
		end
		REP_AddMob(529, 4, 8, "Bosses in Stratholme and Scholomance", 25)
	else
		---- Quests
	  REP_AddQuest(529, 7, 8, "Aberrations of Bone", 1000) -- Aberrations of Bone QuestID: 28756
		if (REP.AfterLegion) then
			REP_AddQuest(529, 7, 8, "Annals of the Silver Hand", 2000) -- Annals of the Silver Hand QuestID: 28755
		end
		---- General
	  REP_AddGeneral(529, 3, 6, "Fiona's Caravan Quests", 24000, "Fiona's Caravan Quests", "Fiona's Caravan Quests until '[42] Argent Call: The Trial of the Crypt will give enough reputation to reach Revered reputation.")
	end

	---------------------------
	-- Darkmoon Faire 909
	---------------------------
	-- TODO: Find a way to work around the weird rep cut off of 2500/6000.
	if (REP.IsClassic) then
		---- Quests
		REP_AddQuest(909, 4, 4, "Small Furry Paws", 100, {[5134] = 5}) -- Small Furry Paws QuestID: 7899
		REP_AddQuest(909, 4, 4, "Torn Bear Pelts", 100, {[11407] = 5}) -- Torn Bear Pelts QuestID: 7900
		REP_AddQuest(909, 4, 4, "Soft Bushy Tails", 100, {[4582] = 5}) -- Soft Bushy Tails QuestID: 7901
		REP_AddQuest(909, 4, 4, "Vibrant Plumes", 100, {[5117] = 5}) -- Vibrant Plumes QuestID: 7902
		REP_AddQuest(909, 4, 4, "Evil Bat Eyes", 100, {[11404] = 10}) -- Evil Bat Eyes QuestID: 7903
		REP_AddQuest(909, 4, 4, "Glowing Scorpid Blood", 100, {[19933] = 10}) -- Glowing Scorpid Blood QuestID: 8222
		REP_AddQuest(909, 4, 4, "Coarse Weightstone", 100, {[3240] = 10}) -- Coarse Weightstone QuestID: 7889
		REP_AddQuest(909, 4, 4, "Heavy Grinding Stone", 100, {[3486] = 7}) -- Heavy Grinding Stone QuestID: 7890
		REP_AddQuest(909, 4, 4, "Green Iron Bracers", 100, {[3835] = 3}) -- Green Iron Bracers QuestID: 7891
		REP_AddQuest(909, 4, 4, "Big Black Mace", 100, {[7945] = 1}) -- Big Black Mace QuestID: 7892
		REP_AddQuest(909, 4, 4, "Rituals of Strength", 100, {[12644] = 8}) -- Rituals of Strength QuestID: 7893
		REP_AddQuest(909, 4, 4, "Copper Modulator", 100, {[4363] = 5}, 500) -- Copper Modulator QuestID: 7894
		REP_AddQuest(909, 4, 4, "Whirring Bronze Gizmo", 100, {[4375] = 7}) -- Whirring Bronze Gizmo QuestID: 7895
		REP_AddQuest(909, 4, 4, "Green Fireworks", 100, {[9313] = 36}) -- Green Fireworks QuestID: 7896
		REP_AddQuest(909, 4, 4, "Mechanical Repair Kits", 100, {[11590] = 6}) -- Mechanical Repair Kits QuestID: 7897
		REP_AddQuest(909, 4, 4, "Thorium Widget", 100, {[15994] = 6}) -- Thorium Widget QuestID: 7898
		REP_AddQuest(909, 4, 4, "Carnival Boots", 100, {[2309] = 3}) -- Carnival Boots QuestID: 7881
		REP_AddQuest(909, 4, 4, "Carnival Jerkins", 100, {[2314] = 3}) -- Carnival Jerkins QuestID: 7882
		REP_AddQuest(909, 4, 4, "The World's Largest Gnome!", 100, {[5739] = 3}) -- The World's Largest Gnome! QuestID: 7883
		REP_AddQuest(909, 4, 4, "Crocolisk Boy and the Bearded Murloc", 100, {[8185] = 1}) -- Crocolisk Boy and the Bearded Murloc QuestID: 7884
		REP_AddQuest(909, 4, 4, "Armor Kits", 100, {[15564] = 8}) -- Armor Kits QuestID: 7885
		---- Quests (Decks)
		REP_AddQuest(909, 4, 8, 7929, 150, {[19267] = 1}) -- Darkmoon Elementals Deck QuestID: 7929
		REP_AddQuest(909, 4, 8, 7907, 150, {[19228] = 1}) -- Darkmoon Beast Deck QuestID: 7907
		REP_AddQuest(909, 4, 8, 7928, 150, {[19257] = 1}) -- Darkmoon Warlords Deck QuestID: 7928
		REP_AddQuest(909, 4, 8, 7927, 150, {[19277] = 1}) -- Darkmoon Portals Deck QuestID: 7927

    if REP.ShowClassicSODPhaseThree then
      REP_AddQuest(909, 4, 8, 82055, 150, {[221289] = 1}) -- Darkmoon Dunes Deck QuestID: 82055
      REP_AddQuest(909, 4, 8, 82058, 150, {[221272] = 1}) -- Darkmoon Wilds Deck QuestID: 82058
      REP_AddQuest(909, 4, 8, 82057, 150, {[221280] = 1}) -- Darkmoon Plagues Deck QuestID: 82057
      REP_AddQuest(909, 4, 8, 82056, 150, {[221299] = 1}) -- Darkmoon Nightmares Deck QuestID: 82056
    end

		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 50, {["Sayge's Fortune #23"] = 1}) -- Quest ID: 7937, Item ID: 19423 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 50, {["Sayge's Fortune #24"] = 1}) -- Quest ID: 7938, Item ID: 19424 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 50, {["Sayge's Fortune #25"] = 1}) -- Quest ID: 7944, Item ID: 19443 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 50, {["Sayge's Fortune #27"] = 1}) -- Quest ID: 7945, Item ID: 19452 (not added to questdb.lua)
	else
		if (not REP.AfterWotlk) then
			---- Quests
			REP_AddQuest(909, 4, 4, "Small Furry Paws", 250, {[5134] = 5}) -- Small Furry Paws QuestID: 7899
			REP_AddQuest(909, 4, 4, "Torn Bear Pelts", 250, {[11407] = 5}) -- Torn Bear Pelts QuestID: 7900
	 		REP_AddQuest(909, 4, 4, "Soft Bushy Tails", 250, {[4582] = 5}) -- Soft Bushy Tails QuestID: 7901
			REP_AddQuest(909, 4, 4, "Vibrant Plumes", 250, {[5117] = 5}) -- Vibrant Plumes QuestID: 7902
			REP_AddQuest(909, 4, 4, "Evil Bat Eyes", 250, {[11404] = 10}) -- Evil Bat Eyes QuestID: 7903
			REP_AddQuest(909, 4, 4, "Glowing Scorpid Blood", 250, {[19933] = 10}) -- Glowing Scorpid Blood QuestID: 8222
			REP_AddQuest(909, 4, 4, "Coarse Weightstone", 250, {[3240] = 10}) -- Coarse Weightstone QuestID: 7889
			REP_AddQuest(909, 4, 4, "Heavy Grinding Stone", 250, {[3486] = 7}) -- Heavy Grinding Stone QuestID: 7890
			REP_AddQuest(909, 4, 4, "Green Iron Bracers", 250, {[3835] = 3}) -- Green Iron Bracers QuestID: 7891
			REP_AddQuest(909, 4, 4, "Big Black Mace", 250, {[7945] = 1}) -- Big Black Mace QuestID: 7892
			REP_AddQuest(909, 4, 4, "Rituals of Strength", 100, {[12644] = 8}) -- Rituals of Strength QuestID: 7893
			REP_AddQuest(909, 4, 4, "Copper Modulator", 250, {[4363] = 5}, 500) -- Copper Modulator QuestID: 7894
			REP_AddQuest(909, 4, 4, "Whirring Bronze Gizmo", 250, {[4375] = 7}) -- Whirring Bronze Gizmo QuestID: 7895
			REP_AddQuest(909, 4, 4, "Green Fireworks", 250, {[9313] = 36}) -- Green Fireworks QuestID: 7896
			REP_AddQuest(909, 4, 4, "Mechanical Repair Kits", 250, {[11590] = 6}) -- Mechanical Repair Kits QuestID: 7897
			REP_AddQuest(909, 4, 4, "Thorium Widget", 250, {[15994] = 6}) -- Thorium Widget QuestID: 7898
			REP_AddQuest(909, 4, 4, "Carnival Boots", 250, {[2309] = 3}) -- Carnival Boots QuestID: 7881
			REP_AddQuest(909, 4, 4, "Carnival Jerkins", 250, {[2314] = 3}) -- Carnival Jerkins QuestID: 7882
			REP_AddQuest(909, 4, 4, "The World's Largest Gnome!", 250, {[5739] = 3}) -- The World's Largest Gnome! QuestID: 7883
			REP_AddQuest(909, 4, 4, "Crocolisk Boy and the Bearded Murloc", 250, {[8185] = 1}) -- Crocolisk Boy and the Bearded Murloc QuestID: 7884
			REP_AddQuest(909, 4, 4, "Armor Kits", 250, {[15564] = 8}) -- Armor Kits QuestID: 7885
		end
		---- Quests (Major decks)
		REP_AddQuest(909, 4, 8, 7929, 350, {[19267] = 1}) -- Darkmoon Elementals Deck QuestID: 7929
		REP_AddQuest(909, 4, 8, 7907, 350, {[19228] = 1}) -- Darkmoon Beast Deck QuestID: 7907
		REP_AddQuest(909, 4, 8, 7928, 350, {[19257] = 1}) -- Darkmoon Warlords Deck QuestID: 7928
		REP_AddQuest(909, 4, 8, 7927, 350, {[19277] = 1}) -- Darkmoon Portals Deck QuestID: 7927
		REP_AddQuest(909, 4, 8, "Darkmoon Furies Deck", 350, {[31907] = 1}) -- Darkmoon Furies Deck QuestID: 10940
		REP_AddQuest(909, 4, 8, "Darkmoon Lunacy Deck", 350, {[31914] = 1}) -- Darkmoon Lunacy Deck QuestID: 10941
		REP_AddQuest(909, 4, 8, "Darkmoon Storms Deck", 350, {[31891] = 1}) -- Darkmoon Storms Deck QuestID: 10939
		REP_AddQuest(909, 4, 8, "Darkmoon Blessings Deck", 350, {[31890] = 1}) -- Darkmoon Blessings Deck QuestID: 10938

		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 75, {["Sayge's Fortune #23"] = 1}) -- Quest ID: 7937, Item ID: 19423 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 75, {["Sayge's Fortune #24"] = 1}) -- Quest ID: 7938, Item ID: 19424 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 75, {["Sayge's Fortune #25"] = 1}) -- Quest ID: 7944, Item ID: 19443 (not added to questdb.lua)
		REP_AddQuest(909, 4, 8, "Your Fortune Awaits You...", 75, {["Sayge's Fortune #27"] = 1}) -- Quest ID: 7945, Item ID: 19452 (not added to questdb.lua)

		if(REP.AfterTBC) then
			---- Quests (Minor decks)
			REP_AddQuest(909, 4, 8, 12517, 25, {[43039] = 1}) -- rogues-deck
			REP_AddQuest(909, 4, 8, 12798, 25, {[42922] = 1}) -- swords-deck
			REP_AddQuest(909, 4, 8, 12518, 25, {[44184] = 1}) -- mages-deck
			REP_AddQuest(909, 4, 8, 13311, 25, {[44185] = 1}) -- demons-deck
			---- Quests (Major decks)
			REP_AddQuest(909, 4, 8, 13325, 350, {[44276] = 1}) -- darkmoon-chaos-deck
			REP_AddQuest(909, 4, 8, 13326, 350, {[44326] = 1}) -- darkmoon-nobles-deck
			REP_AddQuest(909, 4, 8, 13324, 350, {[44259] = 1}) -- darkmoon-prisms-deck
			REP_AddQuest(909, 4, 8, 13327, 350, {[44294] = 1}) -- darkmoon-undeath-deck

			if (REP.AfterWotlk) then
				---- Quests (Major decks)
				REP_AddQuest(909, 4, 8, 27667, 350, {[62046] = 1}) -- darkmoon-earthquake-deck
				REP_AddQuest(909, 4, 8, 27665, 350, {[62045] = 1}) -- darkmoon-hurricane-deck
				REP_AddQuest(909, 4, 8, 27666, 350, {[62044] = 1}) -- darkmoon-tsunami-deck
				REP_AddQuest(909, 4, 8, 27664, 350, {[62021] = 1}) -- darkmoon-volcanic-deck
				---- Dungons Arch
				REP_AddQuest(909, 1, 8, 29443, 250, {[71635] = 1})
				REP_AddQuest(909, 1, 8, 29446, 250, {[71638] = 1})
				REP_AddQuest(909, 1, 8, 29456, 250, {[71951] = 1})
				REP_AddQuest(909, 1, 8, 29444, 250, {[71636] = 1})
				REP_AddQuest(909, 1, 8, 29445, 250, {[71637] = 1})
				REP_AddQuest(909, 1, 8, 29458, 250, {[71953] = 1})
				REP_AddQuest(909, 1, 8, 29457, 250, {[71952] = 1})
				REP_AddQuest(909, 1, 8, 29451, 250, {[71715] = 1})
				REP_AddQuest(909, 1, 8, 29464, 250, {[71716] = 1})
				---- Darkmoon Game Token
				------ Base Games
				REP_AddQuest(909, 1, 8, 29463, 250)
				REP_AddQuest(909, 1, 8, 29438, 250)
				REP_AddQuest(909, 1, 8, 29455, 250)
				REP_AddQuest(909, 1, 8, 29436, 250)
				REP_AddQuest(909, 1, 8, 29434, 250)
				REP_AddQuest(909, 1, 8, 29761, 250)
				REP_AddQuest(909, 1, 8, 29433, 250)
				------ Main profesion
				REP_AddQuest(909, 1, 8, 29514, 250, "nil", REP.LIMIT_TYPE_Herb)
				REP_AddQuest(909, 1, 8, 29519, 250, "nil", REP.LIMIT_TYPE_Skin)
				REP_AddQuest(909, 1, 8, 29518, 250, "nil", REP.LIMIT_TYPE_Mine)
				REP_AddQuest(909, 1, 8, 29511, 250, "nil", REP.LIMIT_TYPE_Engi)
				REP_AddQuest(909, 1, 8, 29506, 250, "nil", REP.LIMIT_TYPE_Alch)
				REP_AddQuest(909, 1, 8, 29508, 250, "nil", REP.LIMIT_TYPE_Blac)
				REP_AddQuest(909, 1, 8, 29520, 250, "nil", REP.LIMIT_TYPE_Tail)
				REP_AddQuest(909, 1, 8, 29517, 250, "nil", REP.LIMIT_TYPE_Leat)
				REP_AddQuest(909, 1, 8, 29510, 250, "nil", REP.LIMIT_TYPE_Ench)
				REP_AddQuest(909, 1, 8, 29516, 250, "nil", REP.LIMIT_TYPE_Jewel)
				REP_AddQuest(909, 1, 8, 29515, 250, "nil", REP.LIMIT_TYPE_Incr)
				------ Secondary profesion
				REP_AddQuest(909, 1, 8, 29512, 250, "nil", REP.LIMIT_TYPE_Aid)
				REP_AddQuest(909, 1, 8, 29507, 250, "nil", REP.LIMIT_TYPE_Arch)
				REP_AddQuest(909, 1, 8, 29509, 250, "nil", REP.LIMIT_TYPE_Cook)
				REP_AddQuest(909, 1, 8, 29513, 250, "nil", REP.LIMIT_TYPE_Fish)
			end
		end
	end

	---------------------------
	-- Ravenholdt 349 --
	---------------------------
	---- Mobs
	REP_AddMob(349, 4, 6, "All Syndicate members", 5, zone.Hillsbrad_Foothills)
	---- Quests
	if(REP_Class == 'Rogue') then
		REP_AddQuest(349, 4, 4, 6701, 250, {[17124] = 1})
	end
	REP_AddQuest(349, 4, 8, 8249, 75, {[16885] = 5})

	---------------------------
	-- Syndicate 70 --
	---------------------------
	---- Mobs
	REP_AddMob(70, 1, 4, "Myrokos Silentform", 25, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Winstone Wolfe", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Lord Jorach Ravenholdt", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Fahrad", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Zan Shivsproket", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Smudge Thunderwood", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Simone Cantrell", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Master Kang", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Carlo Aurelius", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Ravenholdt Assassin", 5, zone.Hillsbrad_Foothills)
	REP_AddMob(70, 1, 4, "Ravenholdt Guard", 5, zone.Hillsbrad_Foothills)

	---------------------------
	-- Thorium Brotherhood 59 --
	---------------------------
	---- Quests
	REP_AddQuest(59, 4, 4, "Restoring Fiery Flux Supplies via Heavy Leather", 25, {[18944] = 2, [4234] = 10, [3857] = 1}) -- Restoring Fiery Flux Supplies via Heavy Leather QuestID: 8242
	REP_AddQuest(59, 4, 4, "Restoring Fiery Flux Supplies via Iron", 25, {[18944] = 2, [3575] = 4, [3857] = 1}) -- Restoring Fiery Flux Supplies via Iron QuestID: 8241
	REP_AddQuest(59, 4, 4, "Restoring Fiery Flux Supplies via Kingsblood", 25, {[18944] = 2, [3356] = 4, [3857] = 1}) -- Restoring Fiery Flux Supplies via Kingsblood QuestID: 7736	
  if (not REP.AfterWotlk) then
    REP_AddQuest(59, 5, 5, "Gaining Acceptance", 25, {[18945] = 4}) -- Gaining Acceptance QuestID 13662
    REP_AddQuest(59, 5, 5, 7737, 625, {[18945] = 100}) -- Gaining Even More Acceptance QuestID: 7737
    if (REP.IsClassic) then
      REP_AddQuest(59, 6, 8, 6642, 50, {[11370] = 10}) -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
      REP_AddQuest(59, 6, 8, 6645, 150, {[17012] = 2}) -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
      REP_AddQuest(59, 6, 8, 6646, 200, {[11382] = 1}) -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
      REP_AddQuest(59, 6, 8, 6643, 200, {[17010] = 1}) -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
      REP_AddQuest(59, 6, 8, 6644, 200, {[17011] = 1}) -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
    else
      REP_AddQuest(59, 6, 8, 6642, 75, {[11370] = 10}) -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
			REP_AddQuest(59, 6, 8, 6645, 350, {[17012] = 2}) -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
			REP_AddQuest(59, 6, 8, 6646, 500, {[11382] = 1}) -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
			REP_AddQuest(59, 6, 8, 6643, 500, {[17010] = 1}) -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
			REP_AddQuest(59, 6, 8, 6644, 500, {[17011] = 1}) -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
    end
  else
    REP_AddQuest(59, 5, 7, "Gaining Acceptance", 60, {[18945] = 4}) -- Gaining Acceptance QuestID 13662
    REP_AddQuest(59, 5, 7, 7737, 1500, {[18945] = 100}) -- Gaining Even More Acceptance QuestID: 7737
    -- TODO: Check when rep values were changed
    REP_AddQuest(59, 6, 8, 6642, 75, {[11370] = 10}) -- Favor Amongst the Brotherhood, Dark Iron Ore QuestID: 6642
    REP_AddQuest(59, 6, 8, 6645, 1400, {[17012] = 2}) -- Favor Amongst the Brotherhood, Core Leather QuestID: 6645
    REP_AddQuest(59, 6, 8, 6646, 2000, {[11382] = 1}) -- Favor Amongst the Brotherhood, Blood of the Mountain QuestID: 6646
    REP_AddQuest(59, 6, 8, 6643, 2000, {[17010] = 1}) -- Favor Amongst the Brotherhood, Fiery Core QuestID: 6643
    REP_AddQuest(59, 6, 8, 6644, 2000, {[17011] = 1}) -- Favor Amongst the Brotherhood, Lava Core QuestID: 6644
  end

	---------------------------
	-- Timbermaw Hold 576 --
	---------------------------
	if(REP.IsClassic) then
		---- Quests
		REP_AddQuest(576, 2, 8, 8467, 50, {[21377] = 5})
		REP_AddQuest(576, 2, 8, 8466, 50, {[21377] = 5})
		REP_AddQuest(576, 2, 8, 8469, 50, {[21383] = 5})
		---- Mobs
		REP_AddMob(576, 2, 6, "Deadwood Avenger, Den Watcher, Shaman, Gardener, Pathfinder & Warrior", 5, zone.Felwood)
		REP_AddMob(576, 2, 6, "Winterfell Runner, Den Watcher, Shaman, Pathfinder, Totemic,  & Ursa", 5, zone.Winterspring)
		REP_AddMob(576, 2, 8, "Chieftain Bloodmaw", 15, zone.Felwood)
		REP_AddMob(576, 2, 8, "Overlord Ror", 15, zone.Felwood)
		REP_AddMob(576, 2, 8, "Ragepaw (Rare)", 50, zone.Felwood)
		REP_AddMob(576, 2, 8, "High Chief Winterfall", 20, zone.Winterspring)
		REP_AddMob(576, 2, 8, "Grizzle Snowpaw (Rare)", 50, zone.Winterspring)
	else
		if (REP.IsTBC) then
			---- Quests
			REP_AddQuest(576, 2, 8, 8467, 75, {[21377] = 5})
			REP_AddQuest(576, 2, 8, 8466, 75, {[21377] = 5})
			REP_AddQuest(576, 2, 8, 8469, 75, {[21383] = 5})
			---- Mobs
			REP_AddMob(576, 2, 6, "Deadwood Avenger, Den Watcher, Shaman, Gardener, Pathfinder & Warrior", 10, zone.Felwood)
			REP_AddMob(576, 2, 6, "Winterfell Runner, Den Watcher, Shaman, Pathfinder, Totemic,  & Ursa", 10, zone.Winterspring)
			REP_AddMob(576, 2, 8, "Chieftain Bloodmaw", 30, zone.Felwood)
			REP_AddMob(576, 2, 8, "Overlord Ror", 30, zone.Felwood)
			REP_AddMob(576, 2, 8, "Ragepaw (Rare)", 50, zone.Felwood)
			REP_AddMob(576, 2, 8, "High Chief Winterfall", 20, zone.Winterspring)
			REP_AddMob(576, 2, 8, "Grizzle Snowpaw (Rare)", 50, zone.Winterspring)
		else
			if (not REP.AfterWotlk) then
				---- Quests
				REP_AddQuest(576, 2, 8, 8467, 300, {[21377] = 5})
				REP_AddQuest(576, 2, 8, 8466, 300, {[21377] = 5})
				REP_AddQuest(576, 2, 8, 8469, 300, {[21383] = 5})
			else
				---- Quests
				REP_AddQuest(576, 2, 8, 28395, 2000, {[21377] = 5})
				REP_AddQuest(576, 2, 8, 28396, 2000, {[21377] = 5})
				REP_AddQuest(576, 2, 8, 28523, 2000, {[21383] = 5})
			end
			---- Mobs
			REP_AddMob(576, 2, 6, "Deadwood Avenger, Den Watcher, Shaman, Gardener, Pathfinder & Warrior", 20, zone.Felwood)
			REP_AddMob(576, 2, 6, "Winterfell Runner, Den Watcher, Shaman, Pathfinder, Totemic,  & Ursa", 20, zone.Winterspring)
			REP_AddMob(576, 2, 8, "Chieftain Bloodmaw", 60, zone.Felwood)
			REP_AddMob(576, 2, 8, "Overlord Ror", 60, zone.Felwood)
			REP_AddMob(576, 2, 8, "Ragepaw (Rare)", 100, zone.Felwood)
			REP_AddMob(576, 2, 8, "High Chief Winterfall", 40, zone.Winterspring)
			REP_AddMob(576, 2, 8, "Grizzle Snowpaw (Rare)", 100, zone.Winterspring)
		end
	end

	---------------------------
	-- Brood of Nozdormu 910 --
	---------------------------
	---- Mobs
	REP_AddMob(910, 1, 4, "Anubisath Defender", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Anubisath Sentinel", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Obsidian Eradicator", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Qiraj Lasher", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Vekniss Hive Crawler", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Vekniss Soldier", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Vekniss Stinger", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Vekniss Warrior", 100, zone.Temple_of_AhnQiraj)
	REP_AddMob(910, 1, 4, "Vekniss Wasp", 100, zone.Temple_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Most Bosses", 50, zone.Ruins_of_AhnQiraj)
	REP_AddMob(910, 1, 8, "Ossirian", 100, zone.Ruins_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Battleguard Sartura", 500, zone.Temple_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Fankriss the Unyielding", 500, zone.Temple_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Princess Huhuran", 500, zone.Temple_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Twin Emperors", 200, zone.Temple_of_AhnQiraj)
  REP_AddMob(910, 1, 8, "Ouro", 500, zone.Temple_of_AhnQiraj)  
	REP_AddMob(910, 1, 8, "Cthun", 2500, zone.Temple_of_AhnQiraj)
	---- Quests
	REP_AddQuest(910, 1, 8, "Mortal Champions", 500, {[21229] = 1}) -- Qiraji Lord's Insignia QuestID: 8579
	REP_AddQuest(910, 1, 8, "Secrets of the Qiraji", 1000, {[21230] = 1}) -- Ancient Qiraji Artifact

	---------------------------
	-- Cenarion Circle 609 --
	---------------------------
	---- General
	REP_AddGeneral(609, 4, 8, "Silithyst Geyser", 10, "Silithyst Geyser", "Turn in the Silithyst Geyser at your faction's camp.")
	---- Quests
	if (REP.IsClassic) then
		REP_AddQuest(609, 4, 8, 8319, 100, {[20404] = 10}) -- Encrypted Twilight Texts QuestID: 8319
		REP_AddQuest(609, 4, 8, "Mortal Champions", 100, {[21229] = 1}) -- Mortal Champions QuestID: 8579
	else
		REP_AddQuest(609, 4, 8, 8319, 500, {[20404] = 10}) -- Encrypted Twilight Texts QuestID: 8319
		REP_AddQuest(609, 4, 8, "Mortal Champions", 250, {[21229] = 1}) -- Mortal Champions QuestID: 8579
	end
	---- Mobs
	REP_AddMob(609, 4, 5, "Any Twilight's Hammer mobs", 10)
	---- Instances
	REP_AddInstance(609, 4, 8, zone.Ruins_of_AhnQiraj, 3000)
	REP_AddInstance(609, 4, 8, zone.AhnQiraj_The_Fallen_Kingdom, 1200)

	---------------------------
	-- Hydraxian Waterlords 749 --
	---------------------------
	---- Mobs
	REP_AddMob(749, 4, 5, "Desert Rumbler, Dust Stormer", 5, zone.Silithus)
	REP_AddMob(749, 4, 5, "Greater Obsidian Elemental", 5, zone.Burning_Steppes)
	REP_AddMob(749, 4, 6, "Lord Incendius", 15, zone.Blackrock_Depths)
	REP_AddMob(749, 4, 6, "Huricanian (Rare)", 25, zone.Silithus)
	REP_AddMob(749, 4, 6, "Pyroguard Emberseer", 50, zone.Blackrock_Spire)
	REP_AddMob(749, 4, 6, "Molten Core Trash", 20, zone.Molten_Core)
	REP_AddMob(749, 4, 6, "Molten Destroyer & Lava Pack", 40, zone.Molten_Core)
	---- Instances
	REP_AddInstance(749, 4, 7, zone.Molten_Core, 1050)
	REP_AddInstance(749, 8, 8, zone.Molten_Core, 350)

	if (not REP.AfterWotlk) then
		---------------------------
		-- Shen'dralar 809 --
		---------------------------
		---- Quests
		if (REP.IsClassic) then
			REP_AddQuest(809, 4, 8, 7483, 200, {[18332] = 1, [18335] = 1, [14344] = 2, [12938] = 2}) -- Libram of Rapidity QuestID: 7483
			REP_AddQuest(809, 4, 8, 7484, 200, {[18333] = 1, [18335] = 1, [14344] = 4, [12753] = 2}) -- Libram of Focus QuestID: 7484
			REP_AddQuest(809, 4, 8, 7485, 200, {[18334] = 1, [18335] = 1, [14344] = 2, [12735] = 1}) -- Libram of Protection QuestID: 7485
		else
			REP_AddQuest(809, 4, 8, 7483, 500, {[18332] = 1, [18335] = 1, [14344] = 2, [12938] = 2}) -- Libram of Rapidity QuestID: 7483
			REP_AddQuest(809, 4, 8, 7484, 500, {[18333] = 1, [18335] = 1, [14344] = 4, [12753] = 2}) -- Libram of Focus QuestID: 7484
			REP_AddQuest(809, 4, 8, 7485, 500, {[18334] = 1, [18335] = 1, [14344] = 2, [12735] = 1}) -- Libram of Protection QuestID: 7485
		end

		---------------------------
		-- Zandalar Tribe 270 --
		---------------------------
		---- Quests
		if (REP.IsClassic) then
			REP_AddQuest(270, 4, 8, 9210, 200, {[18330] = 1})
			REP_AddQuest(270, 4, 8, 9208, 200, {[18331] = 1})
			REP_AddQuest(270, 4, 8, 9209, 200, {[18329] = 1})
			-- REP_AddQuest(270, 4, 8, "A Bijou for Zanza", 150, nil, nil, false) -- A Bijou for Zanza QuestID: 8240
		else
			if (not REP.AfterWotlk) then
				REP_AddQuest(270, 4, 8, 9210, 500, {[18330] = 1})
				REP_AddQuest(270, 4, 8, 9208, 500, {[18331] = 1})
				REP_AddQuest(270, 4, 8, 9209, 500, {[18329] = 1})
			end
			-- REP_AddQuest(270, 4, 8, "A Bijou for Zanza", 350, nil, nil, false) -- A Bijou for Zanza QuestID: 8240
		end
		REP_AddQuest(270, 4, 8, 8238, 25, {[19701] = 1, [19702] = 1, [19703] = 1})
		REP_AddQuest(270, 4, 8, 8239, 25, {[19704] = 1, [19705] = 1, [19706] = 1})
		REP_AddQuest(270, 4, 8, 8195, 25, {[19698] = 1, [19699] = 1, [19700] = 1})
		---- Items
		REP_AddItems(270, 4, 8, 50, {[19858] = 1})
		---- General
		REP_AddGeneral(270, 4, 8, "Destoy a Bijou at the Altar of Zanza", 75)
		---- Instances
		REP_AddInstance(270, 4, 8, "Zul'Gurub", 2750)
	end

	---------------------------
	-- Magram Clan Centaur 93 --
	---------------------------
	if (REP.AfterWotlk) then
		---- Quests (1 quest rewards exalted with both)
		REP_AddQuest(93, 1, 8, 14394, 100000) -- Death to Agogridon QuestID: 14394
	else
		---- Mobs
		REP_AddMob(93, 1, 5, "Khan Shaka", 25)
		REP_AddMob(93, 1, 6, "Gelkis Mauler", 20)
		REP_AddMob(93, 1, 6, "Gelkis Marauder", 20)
		REP_AddMob(93, 1, 6, "Gelkis Rumbler", 20)
		REP_AddMob(93, 1, 6, "Gelkis Outrunner", 20)
		REP_AddMob(93, 1, 6, "Gelkis Stamper", 20)
		REP_AddMob(93, 1, 6, "Gelkis Windchaser", 20)
		REP_AddMob(93, 1, 6, "Gelkis Scout", 20)
		REP_AddMob(93, 1, 6, "Gelkis Earthcaller", 20)
	end

	---------------------------
	-- Gelkis Clan Centaur 92 --
	---------------------------
	if (REP.AfterWotlk) then
		---- Quests (1 quest rewards exalted with both)
		REP_AddQuest(92, 1, 8, 14394, 100000) -- Death to Agogridon QuestID: 14394
	else
		---- Mobs
		REP_AddMob(92, 1, 4, "Warug's Bodyguard", 5)
		REP_AddMob(92, 1, 5, "Khan Jehn", 25)
		REP_AddMob(92, 1, 6, "Magram Bonepaw", 25)
		REP_AddMob(92, 1, 6, "Magram Scout", 20)
		REP_AddMob(92, 1, 6, "Magram Wrangler", 20)
		REP_AddMob(92, 1, 6, "Magram Windchaser", 20)
		REP_AddMob(92, 1, 6, "Magram Stormer", 20)
		REP_AddMob(92, 1, 6, "Magram Marauder", 20)
		REP_AddMob(92, 1, 6, "Magram Mauler", 20)
		REP_AddMob(92, 1, 6, "Magram Outrunner", 20)
		REP_AddMob(92, 1, 6, "Magram Pack Runner", 20)
	end

	if (REP.IsAlliance) then
		---------------------------
		-- Alliance 469
		---------------------------
		---- Quests
		if (REP.IsClassic) then
      REP_AddGeneral(469, 5, 8, "Complete any Elder quest during the Lunar Festival", 50, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
		else
      REP_AddGeneral(469, 5, 8, "Complete any Elder quest during the Lunar Festival", 75, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
		end

		---------------------------
		-- Aliance Cities --
		---------------------------
		---------------------------
		-- Stormwind 72 --
		---------------------------
		---- Quests
    if (not REP.AfterWotlk) then
      if(REP.IsClassic) then
        REP_AddQuest(72, 4, 8, 7796, 50, {[14047] = 20})
        REP_AddQuest(72, 4, 8, 8822, 75, {[21436] = 10})
        if REP.IsClassicPhaseFive then
          REP_AddQuest(72, 4, 8, 8814, 5, {[21436] = 1}) -- One Commendation Signet QuestID = 8814
          REP_AddQuest(72, 4, 8, 8822, 75, {[21436] = 10}) -- Ten Commendation Signet QuestID = 8822
        end

        -- REP_AddGeneral(72, 5, 8, "Complete any Elder quest during the Lunar Festival", 50, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
      else
        REP_AddQuest(72, 4, 8, 7796, 75, {[14047] = 20})
        -- REP_AddGeneral(72, 5, 8, "Complete any Elder quest during the Lunar Festival", 50, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
      end
      REP_AddQuest(72, 4, 8, 1423, 25, {[6172] = 1})
    else
      REP_AddQuest(72, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
      REP_AddQuest(72, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
      REP_AddQuest(72, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
      REP_AddQuest(72, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
    end  
		---- Quests (Spillover from Alterac Valley) TODO: Double check rep values
		REP_AddQuest(72, 4, 8, "Crystal Cluster", 18.75, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
	  REP_AddQuest(72, 4, 8, 6881, 2.5, {[17423] = 1}, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 6943, 10, {[17504] = 1}, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 6942, 10, {[17502] = 1}, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 6941, 10, {[17503] = 1}, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 7027, 2.5, nil, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 7026, 2.5, {[17643] = 1}, nil, true, false, true)
	  REP_AddQuest(72, 4, 8, 6781, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
			REP_AddItems(72, 4, 8, 250, {[45718] = 1}) -- Stormwind Commendation Badge: 45718
			REP_AddItems(72, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(72, 5, 8, "Killing (grey level) mobs in instances while wearing the Stormwind tabard.", 3, "Killing (grey level) mobs in instances while wearing the Stormwind tabard.", "Killing (grey level) mobs in instances while wearing the Stormwind tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(72, 5, 8, "Killing (grey level) bosses in instances while wearing the Stormwind tabard.", 60, "Killing (grey level) bosses in instances while wearing the Stormwind tabard.", "Killing (grey level) bosses in instances while wearing the Stormwind tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(72, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Stormwind tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Stormwind tabard.", "Killing (green or higher level) mobs in instances while wearing the Stormwind tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Ironforge 47 --
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if (REP.IsClassic) then
				REP_AddQuest(47, 4, 8, 7806, 50, {[14047] = 20})
				REP_AddQuest(47, 4, 8, 8821, 75, {[21436] = 10})
        if REP.IsClassicPhaseFive then
          REP_AddQuest(47, 4, 8, 8813, 5, {[21436] = 1}) -- One Commendation Signet QuestID = 8813
          REP_AddQuest(47, 4, 8, 8821, 75, {[21436] = 10}) -- Ten Commendation Signet QuestID = 8821
        end
			else
				REP_AddQuest(47, 4, 8, 7806, 75, {[14047] = 20})
			end
		else
			REP_AddQuest(47, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(47, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(47, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
			REP_AddQuest(47, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
		---- Quests (Spillover from Alterac Valley)
		if (REP.IsClassic) then
			REP_AddQuest(47, 4, 8, "Crystal Cluster", 50, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
		else
			REP_AddQuest(47, 4, 8, "Crystal Cluster", 75, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
		end
		REP_AddQuest(47, 4, 8, 6881, 10, {[17423] = 1}, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 6943, 10, {[17504] = 1}, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 6942, 10, {[17502] = 1}, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 6941, 10, {[17503] = 1}, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 7027, 10, nil, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 7026, 10, {[17643] = 1}, nil, true, false, true)
		REP_AddQuest(47, 4, 8, 6781, 10, {[17422] = 20}, nil, true, false, true)

		if (REP.AfterTBC) then
			---- Items
			REP_AddItems(47, 4, 8, 250, {[45717] = 1}) -- Ironforge Commendation Badge: 45717
			REP_AddItems(47, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(47, 5, 8, "Killing (grey level) mobs in instances while wearing the Ironforge tabard.", 3, "Killing (grey level) mobs in instances while wearing the Ironforge tabard.", "Killing (grey level) mobs in instances while wearing the Ironforge tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(47, 5, 8, "Killing (grey level) bosses in instances while wearing the Ironforge tabard.", 60, "Killing (grey level) bosses in instances while wearing the Ironforge tabard.", "Killing (grey level) bosses in instances while wearing the Ironforge tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(47, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Ironforge tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Ironforge tabard.", "Killing (green or higher level) mobs in instances while wearing the Ironforge tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Darnassus 69 --
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if (REP.IsClassic) then
				REP_AddQuest(69, 4, 8, 7801, 50, {[14047] = 20})
				REP_AddQuest(69, 4, 8, 8819, 75, {[21436] = 10})
        if REP.IsClassicPhaseFive then
          REP_AddQuest(69, 4, 8, 8811, 5, {[21436] = 1}) -- One Commendation Signet QuestID = 8811
          REP_AddQuest(69, 4, 8, 8819, 75, {[21436] = 10}) -- Ten Commendation Signet QuestID = 8819
        end
			else
				REP_AddQuest(69, 4, 8, 7801, 75, {[14047] = 20})
			end
		else
			REP_AddQuest(69, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(69, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(69, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
			REP_AddQuest(69, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
		---- Spillover from Alterac Valley
		REP_AddQuest(69, 4, 8, "Crystal Cluster", 18.75, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
		REP_AddQuest(69, 4, 8, 6881, 2.5, {[17423] = 1}, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 6943, 10, {[17504] = 1}, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 6942, 10, {[17502] = 1}, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 6941, 10, {[17503] = 1}, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 7027, 2.5, nil, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 7026, 2.5, {[17643] = 1}, nil, true, false, true)
		REP_AddQuest(69, 4, 8, 6781, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
			REP_AddItems(69, 4, 8, 250, {[45714] = 1}) -- Darnassus Commendation Badge: 45714
			REP_AddItems(69, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(69, 5, 8, "Killing (grey level) mobs in instances while wearing the Darnassus tabard.", 3, "Killing (grey level) mobs in instances while wearing the Darnassus tabard.", "Killing (grey level) mobs in instances while wearing the Darnassus tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(69, 5, 8, "Killing (grey level) bosses in instances while wearing the Darnassus tabard.", 60, "Killing (grey level) bosses in instances while wearing the Darnassus tabard.", "Killing (grey level) bosses in instances while wearing the Darnassus tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(69, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Darnassus tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Darnassus tabard.", "Killing (green or higher level) mobs in instances while wearing the Darnassus tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Gnomeregan Exiles 54
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if (REP.IsClassic) then
				REP_AddQuest(54, 4, 8, 7812, 50, {[14047] = 20})
				REP_AddQuest(54, 4, 8, 8820, 75, {[21436] = 10})
        if REP.IsClassicPhaseFive then
          REP_AddQuest(54, 4, 8, 8812, 5, {[21436] = 1}) -- One Commendation Signet QuestID = 8812
          REP_AddQuest(54, 4, 8, 8820, 75, {[21436] = 10}) -- Ten Commendation Signet QuestID = 8820
        end
			else
				REP_AddQuest(54, 4, 8, 7812, 75, {[14047] = 20})
			end
		else
			REP_AddQuest(54,4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(54,4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
		---- Spillover from Alterac Valley
	  REP_AddQuest(54, 4, 8, "Crystal Cluster", 18.75, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
	  REP_AddQuest(54, 4, 8, 6881, 2.5, {[17423] = 1}, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 6943, 10, {[17504] = 1}, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 6942, 10, {[17502] = 1}, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 6941, 10, {[17503] = 1}, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 7027, 2.5, nil, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 7026, 2.5, {[17643] = 1}, nil, true, false, true)
	  REP_AddQuest(54, 4, 8, 6781, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
			REP_AddItems(54, 4, 8, 250, {[45716] = 1}) -- Gnomeregan Commendation Badge: 45716
			REP_AddItems(54, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(54, 5, 8, "Killing (grey level) mobs in instances while wearing the Gnomeregan tabard.", 3, "Killing (grey level) mobs in instances while wearing the Gnomeregan tabard.", "Killing (grey level) mobs in instances while wearing the Gnomeregan tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(54, 5, 8, "Killing (grey level) bosses in instances while wearing the Gnomeregan tabard.", 60, "Killing (grey level) bosses in instances while wearing the Gnomeregan tabard.", "Killing (grey level) bosses in instances while wearing the Gnomeregan tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(54, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Gnomeregan tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Gnomeregan tabard.", "Killing (green or higher level) mobs in instances while wearing the Gnomeregan tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Alliance Forces
		---------------------------
		---------------------------
		-- Silverwing Sentinels (Warsong Gulch) 890
		---------------------------
		---- Quests
		if (not REP.AfterMoP) then
			if (REP.IsClassic) then
				REP_AddQuest(890, 4, 8, "Concerted Efforts", 100, {[20560] = 3, [20559] = 3, [20558] = 3}) -- Concerted Efforts QuestID: 8385
				REP_AddQuest(890, 4, 8, "Fight for Warsong Gulch", 50, {[20558] = 3}) -- Fight for Warsong Gulch QuestID: 8408 (and so many more...)
        if REP.ShowClassicSODPhaseOne then
          REP_AddQuest(890, 4, 8, "Repelling Invaders", 1000, {["Warsong Outrider Mark"] = 1}) -- Repelling Invaders QuestID: 79090 (ItemID: 211814)
          REP_AddGeneral(890, 4, 7, "Killing elite mobs in either camp (Battle for Ashenvale)", 10, "Killing elite mobs in either camp (Battle for Ashenvale)", "Killing elite mobs in either camp will reward 10-15 reputation.")
          REP_AddGeneral(890, 4, 7, "Killing enemy Lieutenants (Battle for Ashenvale)", 400, "Killing enemy Lieutenants (Battle for Ashenvale)", "Killing enemy Lieutenants")
          REP_AddGeneral(890, 4, 7, "Killing enemy faction leader (Battle for Ashenvale)", 200, "Killing enemy faction leader (Battle for Ashenvale)", "Killing enemy faction leader")
          REP_AddGeneral(890, 4, 7, "Winning team friendly Lieutenants remaining (Battle for Ashenvale)", 200, "Winning team friendly Lieutenants remaining (Battle for Ashenvale)", "The winning team will receive 200 reputation per friendly Lieutenant remaining.")
        end
      end
			REP_AddGeneral(890, 4, 8, "Warsong Gulch flag capture", 35, "Warsong Gulch flag capture", "Every time your team captures a flag you gain 100 reputation")
		else
			REP_AddGeneral(890, 4, 8, "Warsong Gulch flag capture", 100, "Warsong Gulch flag capture", "Every time your team captures a flag you gain 100 reputation")
			REP_AddGeneral(890, 4, 8, "Warsong Gulch victory", 100, "Warsong Gulch victory", "Every time your team wins you gain 100 reputation")
			REP_AddGeneral(890, 4, 8, "Warsong Gulch loss", 35, "Warsong Gulch loss", "Every time your team lose you gain 35 reputation")
			if (REP.AfterWoD) then
				----  TODO: Add Brawl reputation rewards
			end
		end

		---------------------------
		-- Stormpike Guard (Alterac Valley) 730
		---------------------------
		---- Quests
		if (REP.IsClassic) then
			REP_AddQuest(730, 4, 8, "Concerted Efforts", 150, {[20560] = 3, [20559] = 3, [20558] = 3}) -- Concerted Efforts QuestID: 8388
			REP_AddQuest(730, 4, 8, "Remember Alterac Valley!", 100, {[20560] = 3}) -- Remember Alterac Valley! QuestID: 8383
		end
		REP_AddQuest(730, 4, 8, "Crystal Cluster", 18.75, {[17423] = 5}) -- Crystal Cluster QuestID: 7386
		REP_AddQuest(730, 4, 8, 6881, 2.5, {[17423] = 1})
		REP_AddQuest(730, 4, 8, 6941, 10, {[17503] = 1})
		REP_AddQuest(730, 4, 8, 6942, 10, {[17502] = 1})
		REP_AddQuest(730, 4, 8, 6941, 10, {[17503] = 1})
		REP_AddQuest(730, 4, 8, 7027, 2.5)
		REP_AddQuest(730, 4, 8, 7026, 2.5, {[17643] = 1})
		REP_AddQuest(730, 4, 8, 6781, 2.5, {[17422] = 20})

		---------------------------
		-- The League of Arathor (Arathi Basin) 509
		---------------------------
		---- Quests
		if (not REP.AfterMoP) then
			if (REP.IsClassic) then
				REP_AddQuest(509, 4, 8, "Concerted Efforts", 100, {[20560] = 3, [20559] = 3, [20558] = 3}) -- Concerted Efforts QuestID: 8385
				REP_AddQuest(509, 4, 8, "Arathi Basin Resources!", 100, {[20559] = 3}) -- Arathi Basin Resources! QuestID: 8297 (and so many more...)
        if REP.ShowClassicSODPhaseOne then
          REP_AddQuest(509, 4, 8, "Stranglethorn Lumber", 200, {["Shipment of Stranglethorn Lumber"] = 1}) -- Stranglethorn Lumber QuestID: 79990 (ItemId: 216491)
        end
      end
			REP_AddGeneral(509, 4, 8, "Arathi Basin collect 160 Resources", 10, "Collect 160 Resources", "For every 160 resources your team collects you gain 10 reputation")
			REP_AddGeneral(509, 4, 8, "Arathi Basin win (1500 Resources)", 100, "Arathi Basin win (1500 Resources)", "If your team wins with 1500 resources you will earn a total of 100 reputation")
		else
			REP_AddGeneral(509, 4, 8, "Arathi Basin collect 160 Resources", 50, "Collect 160 Resources", "For every 160 resources your team collects you gain 50 reputation")
			REP_AddGeneral(509, 4, 8, "Arathi Basin win (1500 Resources)", 500, "Arathi Basin win (1500 Resources)", "If your team wins with 1500 resources you will earn a total of 500 reputation")
		end

		---------------------------
		-- Wildhammer Clan 471
		---------------------------
		if (REP.IsClassic) then
			---- Quests
			REP_AddQuest(471, 4, 8, 2880, 100, {[9259] = 5})
			REP_AddQuest(471, 4, 8, 2881, 25, {[9259] = 5})
			---- Mobs
			REP_AddMob(471, 4, 8, "Witherbark mobs", 5, zone.The_Hinterlands)
			REP_AddMob(471, 4, 8, "Vilebranch mobs", 5, zone.The_Hinterlands)
		end

		---------------------------
		-- Wintersaber Trainers 589
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if (REP.IsClassic) then
				REP_AddQuest(589, 4, 8, 4970, 50, {[12622] = 5, [12623] = 5})
				REP_AddQuest(589, 4, 8, 5201, 50)
				REP_AddQuest(589, 6, 8, 5981, 50)
			else
				REP_AddQuest(589, 4, 8, 4970, 250, {[12622] = 5, [12623] = 5})
				REP_AddQuest(589, 4, 8, 5201, 250)
				REP_AddQuest(589, 6, 8, 5981, 350)
			end
		else
			REP_AddQuest(589, 1, 4, 29032, 3000) -- Get Them While They're Young
      REP_AddQuest(589, 4, 6, "A Cub's Cravings", 1500) -- A Cub's Cravings QuestID: 29035
			REP_AddQuest(589, 4, 6, "'Borrowing' From the Winterfall", 1500) -- 'Borrowing' From the Winterfall QuestID: 29037
			REP_AddQuest(589, 4, 6, 29038, 1500) -- Hunting Practice
			REP_AddQuest(589, 4, 6, 29040, 1500) -- Cub's First Toy
			REP_AddQuest(589, 5, 8, 29034, 42999)
		end

    if REP.ShowClassicSODPhaseOne then
      ---------------------------
      -- Azeroth Commerce Authority 2586
      ---------------------------
      ---- Items
      REP_AddItems(2586, 4, 5, 300, {[211331] = 1}) -- 211331  Waylaid Supplies: Brilliant Smallfish
      REP_AddItems(2586, 4, 5, 300, {[210771] = 1}) -- 210771  Waylaid Supplies: Copper Bars
      REP_AddItems(2586, 4, 5, 300, {[211332] = 1}) -- 211332  Waylaid Supplies: Heavy Linen Bandages
      REP_AddItems(2586, 4, 5, 300, {[211329] = 1}) -- 211329  Waylaid Supplies: Herb Baked Eggs
      REP_AddItems(2586, 4, 5, 300, {[211315] = 1}) -- 211315  Waylaid Supplies: Light Leather
      REP_AddItems(2586, 4, 5, 300, {[211316] = 1}) -- 211316  Waylaid Supplies: Peacebloom
      REP_AddItems(2586, 4, 5, 300, {[211933] = 1}) -- 211933  Waylaid Supplies: Rough Stone
      REP_AddItems(2586, 4, 5, 300, {[211317] = 1}) -- 211317  Waylaid Supplies: Silverleaf
      REP_AddItems(2586, 4, 5, 300, {[211330] = 1}) -- 211330  Waylaid Supplies: Spiced Wolf Meat
      REP_AddItems(2586, 4, 5, 450, {[211328] = 1}) -- 211328  Waylaid Supplies: Brown Linen Robes
      REP_AddItems(2586, 4, 5, 450, {[211319] = 1}) -- 211319  Waylaid Supplies: Copper Shortswords
      REP_AddItems(2586, 4, 5, 450, {[211326] = 1}) -- 211326  Waylaid Supplies: Embossed Leather Vests
      REP_AddItems(2586, 4, 5, 450, {[211325] = 1}) -- 211325  Waylaid Supplies: Handstitched Leather Belts
      REP_AddItems(2586, 4, 5, 450, {[211934] = 1}) -- 211934  Waylaid Supplies: Healing Potions
      REP_AddItems(2586, 4, 5, 450, {[211321] = 1}) -- 211321  Waylaid Supplies: Lesser Magic Wands
      REP_AddItems(2586, 4, 5, 450, {[211318] = 1}) -- 211318  Waylaid Supplies: Minor Healing Potions
      REP_AddItems(2586, 4, 5, 450, {[211322] = 1}) -- 211322  Waylaid Supplies: Minor Wizard Oil
      REP_AddItems(2586, 4, 5, 450, {[211324] = 1}) -- 211324  Waylaid Supplies: Rough Boomsticks
      REP_AddItems(2586, 4, 5, 450, {[211323] = 1}) -- 211323  Waylaid Supplies: Rough Copper Bombs
      REP_AddItems(2586, 4, 5, 450, {[211320] = 1}) -- 211320  Waylaid Supplies: Runed Copper Pants
      REP_AddItems(2586, 5, 6, 500, {[211819] = 1}) -- 211819  Waylaid Supplies: Bronze Bars
      REP_AddItems(2586, 5, 6, 500, {[211822] = 1}) -- 211822  Waylaid Supplies: Bruiseweed
      REP_AddItems(2586, 5, 6, 500, {[211837] = 1}) -- 211837  Waylaid Supplies: Goblin Deviled Clams
      REP_AddItems(2586, 5, 6, 500, {[211838] = 1}) -- 211838  Waylaid Supplies: Heavy Wool Bandages
      REP_AddItems(2586, 5, 6, 500, {[211821] = 1}) -- 211821  Waylaid Supplies: Medium Leather
      REP_AddItems(2586, 5, 6, 500, {[211820] = 1}) -- 211820  Waylaid Supplies: Silver Bars
      REP_AddItems(2586, 5, 6, 500, {[211836] = 1}) -- 211836  Waylaid Supplies: Smoked Bear Meat
      REP_AddItems(2586, 5, 6, 500, {[211835] = 1}) -- 211835  Waylaid Supplies: Smoked Sagefish
      REP_AddItems(2586, 5, 6, 500, {[211823] = 1}) -- 211823  Waylaid Supplies: Swiftthistle
      REP_AddItems(2586, 5, 6, 650, {[211831] = 1}) -- 211831  Waylaid Supplies: Dark Leather Cloaks
      REP_AddItems(2586, 5, 6, 650, {[211833] = 1}) -- 211833  Waylaid Supplies: Gray Woolen Shirts
      REP_AddItems(2586, 5, 6, 650, {[211824] = 1}) -- 211824  Waylaid Supplies: Lesser Mana Potions
      REP_AddItems(2586, 5, 6, 650, {[211828] = 1}) -- 211828  Waylaid Supplies: Minor Mana Oil
      REP_AddItems(2586, 5, 6, 650, {[211825] = 1}) -- 211825  Waylaid Supplies: Rough Bronze Boots
      REP_AddItems(2586, 5, 6, 650, {[211829] = 1}) -- 211829  Waylaid Supplies: Small Bronze Bombs
      REP_AddItems(2586, 5, 6, 800, {[211935] = 1}) -- 211935  Waylaid Supplies: Elixir of Firepower
      REP_AddItems(2586, 5, 6, 800, {[211832] = 1}) -- 211832  Waylaid Supplies: Hillman's Shoulders
      REP_AddItems(2586, 5, 6, 800, {[211830] = 1}) -- 211830  Waylaid Supplies: Ornate Spyglasses
      REP_AddItems(2586, 5, 6, 800, {[211834] = 1}) -- 211834  Waylaid Supplies: Pearl-clasped Cloaks
      REP_AddItems(2586, 5, 6, 800, {[211827] = 1}) -- 211827  Waylaid Supplies: Runed Silver Rods
      REP_AddItems(2586, 5, 6, 800, {[211826] = 1}) -- 211826  Waylaid Supplies: Silver Skeleton Keys
    end
    ---- SOD phase 2
    if REP.ShowClassicSODPhaseTwo then
      REP_AddItems(2586, 6, 7, 700, {[215413] = 1}) -- 215413  Waylaid Supplies: Formal White Shirts
      REP_AddItems(2586, 6, 7, 700, {[215421] = 1}) -- 215421  Waylaid Supplies: Fire Oil
      REP_AddItems(2586, 6, 7, 700, {[215391] = 1}) -- 215391  Waylaid Supplies: Wintersbite
      REP_AddItems(2586, 6, 7, 700, {[215420] = 1}) -- 215420  Waylaid Supplies: Rockscale Cod
      REP_AddItems(2586, 6, 7, 700, {[215389] = 1}) -- 215389  Waylaid Supplies: Fadeleaf
      REP_AddItems(2586, 6, 7, 700, {[215400] = 1}) -- 215400  Waylaid Supplies: Solid Grinding Stones
      REP_AddItems(2586, 6, 7, 700, {[215387] = 1}) -- 215387  Waylaid Supplies: Heavy Hide
      REP_AddItems(2586, 6, 7, 700, {[215392] = 1}) -- 215392  Waylaid Supplies: Purple Lotus
      REP_AddItems(2586, 6, 7, 700, {[215418] = 1}) -- 215418  Waylaid Supplies: Spider Sausages
      REP_AddItems(2586, 6, 7, 700, {[215417] = 1}) -- 215417  Waylaid Supplies: Soothing Turtle Bisque
      REP_AddItems(2586, 6, 7, 700, {[215419] = 1}) -- 215419  Waylaid Supplies: Heavy Silk Bandages
      REP_AddItems(2586, 6, 7, 700, {[215388] = 1}) -- 215388  Waylaid Supplies: Thick Leather
      REP_AddItems(2586, 6, 7, 700, {[215386] = 1}) -- 215386  Waylaid Supplies: Mithril Bars
      REP_AddItems(2586, 6, 7, 700, {[215390] = 1}) -- 215390  Waylaid Supplies: Khadgar's Whisker
      REP_AddItems(2586, 6, 7, 850, {[215411] = 1}) -- 215411  Waylaid Supplies: Frost Leather Cloaks
      REP_AddItems(2586, 6, 7, 850, {[215408] = 1}) -- 215408  Waylaid Supplies: Guardian Gloves
      REP_AddItems(2586, 6, 7, 850, {[215398] = 1}) -- 215398  Waylaid Supplies: Green Iron Bracers
      REP_AddItems(2586, 6, 7, 850, {[215403] = 1}) -- 215403  Waylaid Supplies: Deadly Scopes
      REP_AddItems(2586, 6, 7, 850, {[215402] = 1}) -- 215402  Waylaid Supplies: Big Iron Bombs
      REP_AddItems(2586, 6, 7, 850, {[215407] = 1}) -- 215407  Waylaid Supplies: Barbaric Shoulders
      REP_AddItems(2586, 6, 7, 850, {[215415] = 1}) -- 215415  Waylaid Supplies: Rich Purple Silk Shirts
      REP_AddItems(2586, 6, 7, 850, {[215399] = 1}) -- 215399  Waylaid Supplies: Heavy Mithril Gauntlets
      REP_AddItems(2586, 6, 7, 850, {[215414] = 1}) -- 215414  Waylaid Supplies: Crimson Silk Pantaloons
      REP_AddItems(2586, 6, 7, 850, {[215401] = 1}) -- 215401  Waylaid Supplies: Compact Harvest Reaper Kits
      REP_AddItems(2586, 6, 7, 850, {[215385] = 1}) -- 215385  Waylaid Supplies: Gold Bars
      REP_AddItems(2586, 6, 7, 850, {[215395] = 1}) -- 215395  Waylaid Supplies: Elixirs of Agility
      REP_AddItems(2586, 6, 7, 850, {[215393] = 1}) -- 215393  Waylaid Supplies: Greater Healing Potions
      REP_AddItems(2586, 6, 7, 1000, {[215416] = 1}) -- 215416  Waylaid Supplies: White Bandit Masks
      REP_AddItems(2586, 6, 7, 1000, {[215409] = 1}) -- 215409  Waylaid Supplies: Turtle Scale Bracers
      REP_AddItems(2586, 6, 7, 1000, {[215397] = 1}) -- 215397  Waylaid Supplies: Massive Iron Axes
      REP_AddItems(2586, 6, 7, 1000, {[215396] = 1}) -- 215396  Waylaid Supplies: Elixirs of Greater Defense
      REP_AddItems(2586, 6, 7, 1000, {[215404] = 1}) -- 215404  Waylaid Supplies: Mithril Blunderbuss
    end
    ---- SOD Phase 3
    if REP.ShowClassicSODPhaseThree then
      REP_AddItems(2586, 7, 8, 950, {[220927] = 1}) -- 220927  Waylaid Supplies: Thick Hide
      REP_AddItems(2586, 7, 8, 950, {[220926] = 1}) -- 220926  Waylaid Supplies: Rugged Leather
      REP_AddItems(2586, 7, 8, 950, {[220925] = 1}) -- 220925  Waylaid Supplies: Thorium Bars
      REP_AddItems(2586, 7, 8, 950, {[220924] = 1}) -- 220924  Waylaid Supplies: Truesilver Bars
      REP_AddItems(2586, 7, 8, 950, {[220923] = 1}) -- 220923  Waylaid Supplies: Dreamfoil
      REP_AddItems(2586, 7, 8, 950, {[220922] = 1}) -- 220922  Waylaid Supplies: Sungrass
      REP_AddItems(2586, 7, 8, 950, {[220921] = 1}) -- 220921  Waylaid Supplies: Heavy Mageweave Bandages
      REP_AddItems(2586, 7, 8, 950, {[220920] = 1}) -- 220920  Waylaid Supplies: Tender Wolf Steaks
      REP_AddItems(2586, 7, 8, 950, {[220919] = 1}) -- 220919  Waylaid Supplies: Nightfin Soup
      REP_AddItems(2586, 7, 8, 950, {[220918] = 1}) -- 220918  Waylaid Supplies: Undermine Clam Chowder
      REP_AddItems(2586, 7, 8, 1300, {[220942] = 1}) -- 220942  Waylaid Supplies: Tuxedo Shirts
      REP_AddItems(2586, 7, 8, 1300, {[220940] = 1}) -- 220940  Waylaid Supplies: Black Mageweave Headbands
      REP_AddItems(2586, 7, 8, 1300, {[220938] = 1}) -- 220938  Waylaid Supplies: Wicked Leather Bracers
      REP_AddItems(2586, 7, 8, 1300, {[220937] = 1}) -- 220937  Waylaid Supplies: Rugged Armor Kits
      REP_AddItems(2586, 7, 8, 1300, {[220935] = 1}) -- 220935  Waylaid Supplies: Thorium Belts
      REP_AddItems(2586, 7, 8, 1300, {[220934] = 1}) -- 220934  Waylaid Supplies: Mithril Coifs
      REP_AddItems(2586, 7, 8, 1300, {[220932] = 1}) -- 220932  Waylaid Supplies: Thorium Grenades
      REP_AddItems(2586, 7, 8, 1300, {[220931] = 1}) -- 220931  Waylaid Supplies: Hi-Explosive Bombs
      REP_AddItems(2586, 7, 8, 1300, {[220930] = 1}) -- 220930  Waylaid Supplies: Major Healing Potions
      REP_AddItems(2586, 7, 8, 1300, {[220929] = 1}) -- 220929  Waylaid Supplies: Superior Mana Potions
      REP_AddItems(2586, 7, 8, 1300, {[220928] = 1}) -- 220928  Waylaid Supplies: Enchanted Thorium Bars
      REP_AddItems(2586, 7, 8, 1850, {[220941] = 1}) -- 220941  Waylaid Supplies: Runecloth Belts
      REP_AddItems(2586, 7, 8, 1850, {[220939] = 1}) -- 220939  Waylaid Supplies: Runic Leather Bracers
      REP_AddItems(2586, 7, 8, 1850, {[220936] = 1}) -- 220936  Waylaid Supplies: Truesilver Gauntlets
      REP_AddItems(2586, 7, 8, 1850, {[220933] = 1}) -- 220933  Waylaid Supplies: Thorium Rifles
    end
	else
		---------------------------
		-- Horde 67
		---------------------------
    ---- Quests
		if (REP.IsClassic) then
      REP_AddGeneral(67, 5, 8, "Complete any Elder quest during the Lunar Festival", 50, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
		else
      REP_AddGeneral(67, 5, 8, "Complete any Elder quest during the Lunar Festival", 75, "Complete any Elder quest during the Lunar Festival", "Complete any Elder quest during the Lunar Festival")
		end
		
		---------------------------
		-- Orgrimmar 76
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if(REP.IsClassic) then
				REP_AddQuest(76, 4, 8, 7832, 50, {[14047] = 20}) -- Additional Runecloth QuestID: 7832
        if REP.IsClassicPhaseFive then
          REP_AddQuest(76, 4, 8, 8815, 5, {[21438] = 1}) -- One Commendation Signet QuestID: 8815
				  REP_AddQuest(76, 4, 8, 8823, 75, {[21438] = 10}) -- Ten Commendation Signets QuestID: 8823
        end
			else
				REP_AddQuest(76, 4, 8, 7832, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 7832
			end
		else
			REP_AddQuest(76, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(76, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(76, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
			REP_AddQuest(76, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
    ---- Spillover from Alterac Valley
	  REP_AddQuest(76, 4, 8, 7385, 18.75, {[17306] = 5}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 6801, 2.5, {[17306] = 1}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 6825, 10, {[17326] = 1}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 6826, 10, {[17327] = 1}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 6827, 10, {[17328] = 1}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 7027, 2.5, nil, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 7002, 2.5, {[17642] = 1}, nil, true, false, true)
	  REP_AddQuest(76, 4, 8, 6741, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
		  REP_AddItems(76, 4, 8, 250, {[45719] = 1})
		  REP_AddItems(76, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(76, 5, 8, "Killing (grey level) mobs in instances while wearing the Orgrimmar tabard.", 3, "Killing (grey level) mobs in instances while wearing the Orgrimmar tabard.", "Killing (grey level) mobs in instances while wearing the Orgrimmar tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(76, 5, 8, "Killing (grey level) bosses in instances while wearing the Orgrimmar tabard.", 60, "Killing (grey level) bosses in instances while wearing the Orgrimmar tabard.", "Killing (grey level) bosses in instances while wearing the Orgrimmar tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(76, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Orgrimmar tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Orgrimmar tabard.", "Killing (green or higher level) mobs in instances while wearing the Orgrimmar tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Thunder Bluff 81
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if(REP.IsClassic) then
				REP_AddQuest(81, 4, 8, 7825, 50, {[14047] = 20}) -- Additional Runecloth QuestID: 7825
        if REP.IsClassicPhaseFive then
          REP_AddQuest(81, 4, 8, 8818, 5, {[21438] = 1}) -- One Commendation Signet QuestID: 8818
				  REP_AddQuest(81, 4, 8, 8825, 75, {[21438] = 10}) -- Ten Commendation Signets QuestID: 8825
        end
			else
				REP_AddQuest(81, 4, 8, 7825, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 7825
			end
		else
			REP_AddQuest(81, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(81, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(81, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
			REP_AddQuest(81, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
    ---- Spillover from Alterac Valley
	  REP_AddQuest(81, 4, 8, 7385, 18.75, {[17306] = 5}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 6801, 2.5, {[17306] = 1}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 6825, 10, {[17326] = 1}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 6826, 10, {[17327] = 1}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 6827, 10, {[17328] = 1}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 7027, 2.5, nil, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 7002, 2.5, {[17642] = 1}, nil, true, false, true)
	  REP_AddQuest(81, 4, 8, 6741, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
		  REP_AddItems(81, 4, 8, 250, {[45722] = 1})
		  REP_AddItems(81, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(81, 5, 8, "Killing (grey level) mobs in instances while wearing the Thunder Bluff tabard.", 3, "Killing (grey level) mobs in instances while wearing the Thunder Bluff tabard.", "Killing (grey level) mobs in instances while wearing the Thunder Bluff tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(81, 5, 8, "Killing (grey level) bosses in instances while wearing the Thunder Bluff tabard.", 60, "Killing (grey level) bosses in instances while wearing the Thunder Bluff tabard.", "Killing (grey level) bosses in instances while wearing the Thunder Bluff tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(81, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Thunder Bluff tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Thunder Bluff tabard.", "Killing (green or higher level) mobs in instances while wearing the Thunder Bluff tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Undercity 68
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if(REP.IsClassic) then
				REP_AddQuest(68, 4, 8, 7819, 50, {[14047] = 20}) -- Additional Runecloth QuestID: 7819
        if REP.IsClassicPhaseFive then
          REP_AddQuest(68, 4, 8, 8817, 5, {[21438] = 1}) -- One Commendation Signet QuestID: 8817
          REP_AddQuest(68, 4, 8, 8826, 75, {[21438] = 10}) -- Ten Commendation Signets QuestID: 8826
        end
			else
				REP_AddQuest(68, 4, 8, 7819, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 7819
			end
		else
			REP_AddQuest(68, 4, 8, 1, 250, "nil", REP.LIMIT_TYPE_Cook)
		  REP_AddQuest(68, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
		  REP_AddQuest(68, 4, 8, 3, 250, "nil", REP.LIMIT_TYPE_Fish)
		  REP_AddQuest(68, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
    ---- Spillover from Alterac Valley
		REP_AddQuest(68, 4, 8, 7385, 18.75, {[17306] = 5}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 6801, 2.5, {[17306] = 1}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 6825, 10, {[17326] = 1}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 6826, 10, {[17327] = 1}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 6827, 10, {[17328] = 1}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 7027, 2.5, nil, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 7002, 2.5, {[17642] = 1}, nil, true, false, true)
		REP_AddQuest(68, 4, 8, 6741, 2.5, {[17422] = 20}, nil, true, false, true)
		if (REP.AfterTBC) then
			---- Items
			REP_AddItems(68, 4, 8, 250, {[45723] = 1})
			REP_AddItems(68, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(68, 5, 8, "Killing (grey level) mobs in instances while wearing the Undercity tabard.", 3, "Killing mobs in instances while wearing the Undercity tabard.", "Killing mobs in instances while wearing the Undercity tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(68, 5, 8, "Killing (grey level) bosses in instances while wearing the Undercity tabard.", 60, "Killing bosses in instances while wearing the Undercity tabard.", "Killing bosses in instances while wearing the Undercity tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(68, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Undercity tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Undercity tabard.", "Killing (green or higher level) mobs in instances while wearing the Undercity tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Darkspear Trolls 530
		---------------------------
		---- Quests
		if (not REP.AfterWotlk) then
			if(REP.IsClassic) then
				REP_AddQuest(530, 4, 8, 7837, 50, {[14047] = 20}) -- Additional Runecloth QuestID: 7837
        if REP.IsClassicPhaseFive then
          REP_AddQuest(530, 4, 8, 8816, 5, {[21438] = 1}) -- One Commendation Signet QuestID: 8816
				  REP_AddQuest(530, 4, 8, 8824, 75, {[21438] = 10}) -- Ten Commendation Signets QuestID: 8824
        end
			else
				REP_AddQuest(530, 4, 8, 7837, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 7837
			end
		else
			REP_AddQuest(530, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(530, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
		end
		---- Spillover from Alterac Valley
		REP_AddQuest(530, 4, 8, 7385, 18.75, {[17306] = 5}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 6801, 2.5, {[17306] = 1}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 6825, 10, {[17326] = 1}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 6826, 10, {[17327] = 1}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 6827, 10, {[17328] = 1}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 7027, 2.5, nil, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 7002, 2.5, {[17642] = 1}, nil, true, false, true)
		REP_AddQuest(530, 4, 8, 6741, 2.5, {[17422] = 20}, nil, true, false, true)
		if(REP.AfterTBC) then
			---- Items
			REP_AddItems(530, 4, 8, 250, {[45720] = 1})
			REP_AddItems(530, 4, 8, 62.5, {[4] = 1})
      if (REP.AfterWotlk) then
        ---- General
        REP_AddGeneral(530, 5, 8, "Killing (grey level) mobs in instances while wearing the Darkspear tabard.", 3, "Killing (grey level) mobs in instances while wearing the Darkspear tabard.", "Killing (grey level) mobs in instances while wearing the Darkspear tabard will reward you roughly 3 reputation per kill.")
        REP_AddGeneral(530, 5, 8, "Killing (grey level) bosses in instances while wearing the Darkspear tabard.", 60, "Killing (grey level) bosses in instances while wearing the Darkspear tabard.", "Killing (grey level) bosses in instances while wearing the Darkspear tabard will reward you roughly 60 reputation per kill.")
        REP_AddGeneral(530, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Darkspear tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Darkspear tabard.", "Killing (green or higher level) mobs in instances while wearing the Darkspear tabard will reward you roughly 15 reputation per kill.")
      end
    end

		---------------------------
		-- Horde Forces
		---------------------------
		---------------------------
		-- Warsong Outriders (Warsong Gulch) 889
		---------------------------
		---- Quests
		if (not REP.AfterMoP) then
			if (REP.IsClassic) then
				REP_AddQuest(889, 4, 8, "For Great Honor", 100, {[20560] = 3, [20559] = 3, [20558] = 3}) -- For Great Honor QuestID: 8388
				REP_AddQuest(889, 4, 8, "Battle of Warsong Gulch", 50, {[20558] = 3}) -- Battle of Warsong Gulch QuestID: 8435 (and so many more...)
        if REP.ShowClassicSODPhaseOne then
          REP_AddQuest(889, 4, 8, "Clear the Forest!", 1000, {["Silverwing Sentinel Charm"] = 1}) -- Clear the Forest! QuestID: 79098 (ItemID: 211813)
          REP_AddGeneral(889, 4, 7, "Killing elite mobs in either camp (Battle for Ashenvale)", 10, "Killing elite mobs in either camp (Battle for Ashenvale)", "Killing elite mobs in either camp will reward 10-15 reputation.")
          REP_AddGeneral(889, 4, 7, "Killing enemy Lieutenants (Battle for Ashenvale)", 400, "Killing enemy Lieutenants (Battle for Ashenvale)", "Killing enemy Lieutenants")
          REP_AddGeneral(889, 4, 7, "Killing enemy faction leader (Battle for Ashenvale)", 200, "Killing enemy faction leader (Battle for Ashenvale)", "Killing enemy faction leader")
          REP_AddGeneral(889, 4, 7, "Winning team friendly Lieutenants remaining (Battle for Ashenvale)", 200, "Winning team friendly Lieutenants remaining  (Battle for Ashenvale)", "The winning team will receive 200 reputation per friendly Lieutenant remaining.")
        end
      end
			REP_AddGeneral(889, 4, 8, "Warsong Gulch flag capture", 35, "Warsong Gulch flag capture", "Every time your team captures a flag you gain 35 reputation")
		else
			REP_AddGeneral(889, 4, 8, "Warsong Gulch flag capture", 100, "Warsong Gulch flag capture", "Every time your team captures a flag you gain 100 reputation")
			REP_AddGeneral(889, 4, 8, "Warsong Gulch victory", 100, "Warsong Gulch victory", "Every time your team wins you gain 100 reputation")
			REP_AddGeneral(889, 4, 8, "Warsong Gulch loss", 35, "Warsong Gulch loss", "Every time your team lose you gain 35 reputation")
			if (REP.AfterWoD) then
				----  TODO: Add Brawl reputation rewards from
			end
		end

		---------------------------
		-- Frostwolf Clan (Alterac Valley) 729
		---------------------------
		---- Quests
		if (REP.IsClassic) then
			REP_AddQuest(729, 4, 8, "For Great Honor", 150, {[20560] = 3, [20559] = 3, [20558] = 3}) -- For Great Honor QuestID: 8388
			REP_AddQuest(729, 4, 8, "Invaders of Alterac Valley", 100, {[20560] = 3}) -- Invaders of Alterac Valley QuestID: 8387
		end
	  REP_AddQuest(729, 4, 8, 7385, 18.75, {[17306] = 5})
	  REP_AddQuest(729, 4, 8, 6801, 2.5, {[17306] = 1})
	  REP_AddQuest(729, 4, 8, 6825, 10, {[17326] = 1})
	  REP_AddQuest(729, 4, 8, 6826, 10, {[17327] = 1})
	  REP_AddQuest(729, 4, 8, 6827, 10, {[17328] = 1})
	  REP_AddQuest(729, 4, 8, 7027, 2.5)
	  REP_AddQuest(729, 4, 8, 7002, 2.5, {[17642] = 1})
	  REP_AddQuest(729, 4, 8, 6741, 2.5, {[17422] = 20})

		---------------------------
		-- The Defilers (Arathi Basin) 510
		---------------------------
		---- General
		if (not REP.AfterMoP) then
			if (REP.IsClassic) then
				---- Quests
				REP_AddQuest(510, 4, 8, "For Great Honor", 100, {[20560] = 3, [20559] = 3, [20558] = 3}) -- For Great Honor QuestID: 8388
				REP_AddQuest(510, 4, 8, "Arathi Basin Resources!", 75, {[20559] = 1}) -- Arathi Basin Resources! QuestID: 8297 (and so many more...)
        if REP.ShowClassicSODPhaseOne then
          REP_AddQuest(510, 4, 8, "Stranglethorn Lumber", 200, {["Shipment of Stranglethorn Lumber"] = 1}) -- Stranglethorn Lumber QuestID: 79991 (ItemId: 216491)
        end
      end
			---- General
			REP_AddGeneral(510, 4, 8, "Arathi Basin collect 160 Resources", 10, "Collect 160 Resources", "For every 160 resources your team collects you gain 10 reputation")
		  REP_AddGeneral(510, 4, 8, "Arathi Basin win (1500 Resources)", 100, "Arathi Basin win (1500 Resources)", "If your team wins with 1500 resources you will earn a total of 100 reputation")
		else
			---- General
			REP_AddGeneral(510, 4, 8, "Arathi Basin collect 160 Resources", 50, "Collect 160 Resources", "For every 160 resources your team collects you gain 50 reputation")
		  REP_AddGeneral(510, 4, 8, "Arathi Basin win (1500 Resources)", 500, "Arathi Basin win (1500 Resources)", "If your team wins with 1500 resources you will earn a total of 500 reputation")
		end


    if REP.ShowClassicSODPhaseOne then
      ---------------------------
      -- Durotar Supply and Logistics 2587
      ---------------------------
      ---- Items
      REP_AddItems(2587, 4, 5, 300, {[211331] = 1}) -- 211331  Waylaid Supplies: Brilliant Smallfish
      REP_AddItems(2587, 4, 5, 300, {[210771] = 1}) -- 210771  Waylaid Supplies: Copper Bars
      REP_AddItems(2587, 4, 5, 300, {[211332] = 1}) -- 211332  Waylaid Supplies: Heavy Linen Bandages
      REP_AddItems(2587, 4, 5, 300, {[211329] = 1}) -- 211329  Waylaid Supplies: Herb Baked Eggs
      REP_AddItems(2587, 4, 5, 300, {[211315] = 1}) -- 211315  Waylaid Supplies: Light Leather
      REP_AddItems(2587, 4, 5, 300, {[211316] = 1}) -- 211316  Waylaid Supplies: Peacebloom
      REP_AddItems(2587, 4, 5, 300, {[211933] = 1}) -- 211933  Waylaid Supplies: Rough Stone
      REP_AddItems(2587, 4, 5, 300, {[211317] = 1}) -- 211317  Waylaid Supplies: Silverleaf
      REP_AddItems(2587, 4, 5, 300, {[211330] = 1}) -- 211330  Waylaid Supplies: Spiced Wolf Meat
      REP_AddItems(2587, 4, 5, 450, {[211328] = 1}) -- 211328  Waylaid Supplies: Brown Linen Robes
      REP_AddItems(2587, 4, 5, 450, {[211319] = 1}) -- 211319  Waylaid Supplies: Copper Shortswords
      REP_AddItems(2587, 4, 5, 450, {[211326] = 1}) -- 211326  Waylaid Supplies: Embossed Leather Vests
      REP_AddItems(2587, 4, 5, 450, {[211325] = 1}) -- 211325  Waylaid Supplies: Handstitched Leather Belts
      REP_AddItems(2587, 4, 5, 450, {[211934] = 1}) -- 211934  Waylaid Supplies: Healing Potions
      REP_AddItems(2587, 4, 5, 450, {[211321] = 1}) -- 211321  Waylaid Supplies: Lesser Magic Wands
      REP_AddItems(2587, 4, 5, 450, {[211318] = 1}) -- 211318  Waylaid Supplies: Minor Healing Potions
      REP_AddItems(2587, 4, 5, 450, {[211322] = 1}) -- 211322  Waylaid Supplies: Minor Wizard Oil
      REP_AddItems(2587, 4, 5, 450, {[211324] = 1}) -- 211324  Waylaid Supplies: Rough Boomsticks
      REP_AddItems(2587, 4, 5, 450, {[211323] = 1}) -- 211323  Waylaid Supplies: Rough Copper Bombs
      REP_AddItems(2587, 4, 5, 450, {[211320] = 1}) -- 211320  Waylaid Supplies: Runed Copper Pants
      REP_AddItems(2587, 5, 6, 500, {[211819] = 1}) -- 211819  Waylaid Supplies: Bronze Bars
      REP_AddItems(2587, 5, 6, 500, {[211822] = 1}) -- 211822  Waylaid Supplies: Bruiseweed
      REP_AddItems(2587, 5, 6, 500, {[211837] = 1}) -- 211837  Waylaid Supplies: Goblin Deviled Clams
      REP_AddItems(2587, 5, 6, 500, {[211838] = 1}) -- 211838  Waylaid Supplies: Heavy Wool Bandages
      REP_AddItems(2587, 5, 6, 500, {[211821] = 1}) -- 211821  Waylaid Supplies: Medium Leather
      REP_AddItems(2587, 5, 6, 500, {[211820] = 1}) -- 211820  Waylaid Supplies: Silver Bars
      REP_AddItems(2587, 5, 6, 500, {[211836] = 1}) -- 211836  Waylaid Supplies: Smoked Bear Meat
      REP_AddItems(2587, 5, 6, 500, {[211835] = 1}) -- 211835  Waylaid Supplies: Smoked Sagefish
      REP_AddItems(2587, 5, 6, 500, {[211823] = 1}) -- 211823  Waylaid Supplies: Swiftthistle
      REP_AddItems(2587, 5, 6, 650, {[211831] = 1}) -- 211831  Waylaid Supplies: Dark Leather Cloaks
      REP_AddItems(2587, 5, 6, 650, {[211833] = 1}) -- 211833  Waylaid Supplies: Gray Woolen Shirts
      REP_AddItems(2587, 5, 6, 650, {[211824] = 1}) -- 211824  Waylaid Supplies: Lesser Mana Potions
      REP_AddItems(2587, 5, 6, 650, {[211828] = 1}) -- 211828  Waylaid Supplies: Minor Mana Oil
      REP_AddItems(2587, 5, 6, 650, {[211825] = 1}) -- 211825  Waylaid Supplies: Rough Bronze Boots
      REP_AddItems(2587, 5, 6, 650, {[211829] = 1}) -- 211829  Waylaid Supplies: Small Bronze Bombs
      REP_AddItems(2587, 5, 6, 800, {[211935] = 1}) -- 211935  Waylaid Supplies: Elixir of Firepower
      REP_AddItems(2587, 5, 6, 800, {[211832] = 1}) -- 211832  Waylaid Supplies: Hillman's Shoulders
      REP_AddItems(2587, 5, 6, 800, {[211830] = 1}) -- 211830  Waylaid Supplies: Ornate Spyglasses
      REP_AddItems(2587, 5, 6, 800, {[211834] = 1}) -- 211834  Waylaid Supplies: Pearl-clasped Cloaks
      REP_AddItems(2587, 5, 6, 800, {[211827] = 1}) -- 211827  Waylaid Supplies: Runed Silver Rods
      REP_AddItems(2587, 5, 6, 800, {[211826] = 1}) -- 211826  Waylaid Supplies: Silver Skeleton Keys
    end
    ---- SOD phase 2
    if REP.ShowClassicSODPhaseTwo then
      REP_AddItems(2587, 6, 7, 700, {[215413] = 1}) -- 215413  Waylaid Supplies: Formal White Shirts
      REP_AddItems(2587, 6, 7, 700, {[215421] = 1}) -- 215421  Waylaid Supplies: Fire Oil
      REP_AddItems(2587, 6, 7, 700, {[215391] = 1}) -- 215391  Waylaid Supplies: Wintersbite
      REP_AddItems(2587, 6, 7, 700, {[215420] = 1}) -- 215420  Waylaid Supplies: Rockscale Cod
      REP_AddItems(2587, 6, 7, 700, {[215389] = 1}) -- 215389  Waylaid Supplies: Fadeleaf
      REP_AddItems(2587, 6, 7, 700, {[215400] = 1}) -- 215400  Waylaid Supplies: Solid Grinding Stones
      REP_AddItems(2587, 6, 7, 700, {[215387] = 1}) -- 215387  Waylaid Supplies: Heavy Hide
      REP_AddItems(2587, 6, 7, 700, {[215392] = 1}) -- 215392  Waylaid Supplies: Purple Lotus
      REP_AddItems(2587, 6, 7, 700, {[215418] = 1}) -- 215418  Waylaid Supplies: Spider Sausages
      REP_AddItems(2587, 6, 7, 700, {[215417] = 1}) -- 215417  Waylaid Supplies: Soothing Turtle Bisque
      REP_AddItems(2587, 6, 7, 700, {[215419] = 1}) -- 215419  Waylaid Supplies: Heavy Silk Bandages
      REP_AddItems(2587, 6, 7, 700, {[215388] = 1}) -- 215388  Waylaid Supplies: Thick Leather
      REP_AddItems(2587, 6, 7, 700, {[215386] = 1}) -- 215386  Waylaid Supplies: Mithril Bars
      REP_AddItems(2587, 6, 7, 700, {[215390] = 1}) -- 215390  Waylaid Supplies: Khadgar's Whisker
      REP_AddItems(2587, 6, 7, 850, {[215411] = 1}) -- 215411  Waylaid Supplies: Frost Leather Cloaks
      REP_AddItems(2587, 6, 7, 850, {[215408] = 1}) -- 215408  Waylaid Supplies: Guardian Gloves
      REP_AddItems(2587, 6, 7, 850, {[215398] = 1}) -- 215398  Waylaid Supplies: Green Iron Bracers
      REP_AddItems(2587, 6, 7, 850, {[215403] = 1}) -- 215403  Waylaid Supplies: Deadly Scopes
      REP_AddItems(2587, 6, 7, 850, {[215402] = 1}) -- 215402  Waylaid Supplies: Big Iron Bombs
      REP_AddItems(2587, 6, 7, 850, {[215407] = 1}) -- 215407  Waylaid Supplies: Barbaric Shoulders
      REP_AddItems(2587, 6, 7, 850, {[215415] = 1}) -- 215415  Waylaid Supplies: Rich Purple Silk Shirts
      REP_AddItems(2587, 6, 7, 850, {[215399] = 1}) -- 215399  Waylaid Supplies: Heavy Mithril Gauntlets
      REP_AddItems(2587, 6, 7, 850, {[215414] = 1}) -- 215414  Waylaid Supplies: Crimson Silk Pantaloons
      REP_AddItems(2587, 6, 7, 850, {[215401] = 1}) -- 215401  Waylaid Supplies: Compact Harvest Reaper Kits
      REP_AddItems(2587, 6, 7, 850, {[215385] = 1}) -- 215385  Waylaid Supplies: Gold Bars
      REP_AddItems(2587, 6, 7, 850, {[215395] = 1}) -- 215395  Waylaid Supplies: Elixirs of Agility
      REP_AddItems(2587, 6, 7, 850, {[215393] = 1}) -- 215393  Waylaid Supplies: Greater Healing Potions
      REP_AddItems(2587, 6, 7, 1000, {[215416] = 1}) -- 215416  Waylaid Supplies: White Bandit Masks
      REP_AddItems(2587, 6, 7, 1000, {[215409] = 1}) -- 215409  Waylaid Supplies: Turtle Scale Bracers
      REP_AddItems(2587, 6, 7, 1000, {[215397] = 1}) -- 215397  Waylaid Supplies: Massive Iron Axes
      REP_AddItems(2587, 6, 7, 1000, {[215396] = 1}) -- 215396  Waylaid Supplies: Elixirs of Greater Defense
      REP_AddItems(2587, 6, 7, 1000, {[215404] = 1}) -- 215404  Waylaid Supplies: Mithril Blunderbuss
    end
    ---- SOD Phase 3
    if REP.ShowClassicSODPhaseThree then
      REP_AddItems(2587, 7, 8, 950, {[220927] = 1}) -- 220927  Waylaid Supplies: Thick Hide
      REP_AddItems(2587, 7, 8, 950, {[220926] = 1}) -- 220926  Waylaid Supplies: Rugged Leather
      REP_AddItems(2587, 7, 8, 950, {[220925] = 1}) -- 220925  Waylaid Supplies: Thorium Bars
      REP_AddItems(2587, 7, 8, 950, {[220924] = 1}) -- 220924  Waylaid Supplies: Truesilver Bars
      REP_AddItems(2587, 7, 8, 950, {[220923] = 1}) -- 220923  Waylaid Supplies: Dreamfoil
      REP_AddItems(2587, 7, 8, 950, {[220922] = 1}) -- 220922  Waylaid Supplies: Sungrass
      REP_AddItems(2587, 7, 8, 950, {[220921] = 1}) -- 220921  Waylaid Supplies: Heavy Mageweave Bandages
      REP_AddItems(2587, 7, 8, 950, {[220920] = 1}) -- 220920  Waylaid Supplies: Tender Wolf Steaks
      REP_AddItems(2587, 7, 8, 950, {[220919] = 1}) -- 220919  Waylaid Supplies: Nightfin Soup
      REP_AddItems(2587, 7, 8, 950, {[220918] = 1}) -- 220918  Waylaid Supplies: Undermine Clam Chowder
      REP_AddItems(2587, 7, 8, 1300, {[220942] = 1}) -- 220942  Waylaid Supplies: Tuxedo Shirts
      REP_AddItems(2587, 7, 8, 1300, {[220940] = 1}) -- 220940  Waylaid Supplies: Black Mageweave Headbands
      REP_AddItems(2587, 7, 8, 1300, {[220938] = 1}) -- 220938  Waylaid Supplies: Wicked Leather Bracers
      REP_AddItems(2587, 7, 8, 1300, {[220937] = 1}) -- 220937  Waylaid Supplies: Rugged Armor Kits
      REP_AddItems(2587, 7, 8, 1300, {[220935] = 1}) -- 220935  Waylaid Supplies: Thorium Belts
      REP_AddItems(2587, 7, 8, 1300, {[220934] = 1}) -- 220934  Waylaid Supplies: Mithril Coifs
      REP_AddItems(2587, 7, 8, 1300, {[220932] = 1}) -- 220932  Waylaid Supplies: Thorium Grenades
      REP_AddItems(2587, 7, 8, 1300, {[220931] = 1}) -- 220931  Waylaid Supplies: Hi-Explosive Bombs
      REP_AddItems(2587, 7, 8, 1300, {[220930] = 1}) -- 220930  Waylaid Supplies: Major Healing Potions
      REP_AddItems(2587, 7, 8, 1300, {[220929] = 1}) -- 220929  Waylaid Supplies: Superior Mana Potions
      REP_AddItems(2587, 7, 8, 1300, {[220928] = 1}) -- 220928  Waylaid Supplies: Enchanted Thorium Bars
      REP_AddItems(2587, 7, 8, 1850, {[220941] = 1}) -- 220941  Waylaid Supplies: Runecloth Belts
      REP_AddItems(2587, 7, 8, 1850, {[220939] = 1}) -- 220939  Waylaid Supplies: Runic Leather Bracers
      REP_AddItems(2587, 7, 8, 1850, {[220936] = 1}) -- 220936  Waylaid Supplies: Truesilver Gauntlets
      REP_AddItems(2587, 7, 8, 1850, {[220933] = 1}) -- 220933  Waylaid Supplies: Thorium Rifles
    end
	end

--------------------------------------------------
-- Factions released 'during' Seasonal classic
--------------------------------------------------
if REP.ShowClassicSODPhaseThree then
  ---------------------------
	-- Emerald Wardens 2641 --
	---------------------------
  ---- Quests
  -- DuskWood
  REP_AddQuest(2641, 4, 8, 81716, 10) -- QuestID: 81716 - Recover Incursion Field Report: Duskwood
  REP_AddQuest(2641, 4, 8, 81730, 75) -- QuestID: 81730 - Duskwood Mission I: Defeat Worgen
  REP_AddQuest(2641, 4, 8, 81731, 75) -- QuestID: 81731 - Duskwood Mission II: Defeat Ogres
  REP_AddQuest(2641, 4, 8, 81732, 75) -- QuestID: 81732 - Duskwood Mission III: Defeat Dragonkin
  REP_AddQuest(2641, 4, 8, 81733, 75) -- QuestID: 81733 - Duskwood Mission IV: Ogre Intelligence
  REP_AddQuest(2641, 4, 8, 81734, 75) -- QuestID: 81734 - Duskwood Mission V: Worgen Intelligence
  REP_AddQuest(2641, 4, 8, 81735, 75) -- QuestID: 81735 - Duskwood Mission VI: Dragon Intelligence
  REP_AddQuest(2641, 4, 8, 81736, 75) -- QuestID: 81736 - Duskwood Mission VII: Recover Shadowscythe
  REP_AddQuest(2641, 4, 8, 81737, 75) -- QuestID: 81737 - Duskwood Mission VIII: Recover Ogre Magi text
  REP_AddQuest(2641, 4, 8, 81738, 75) -- QuestID: 81738 - Duskwood Mission IX: Recover Dragon Egg
  REP_AddQuest(2641, 4, 8, 81739, 75) -- QuestID: 81739 - Duskwood Mission X: Nightmare Moss
  REP_AddQuest(2641, 4, 8, 81740, 75) -- QuestID: 81740 - Duskwood Mission XI: Cold Iron Ore
  REP_AddQuest(2641, 4, 8, 81741, 75) -- QuestID: 81741 - Duskwood Mission XII: Dream-Touched Dragonscale
  REP_AddQuest(2641, 4, 8, 81742, 200) -- QuestID: 81742 - Duskwood Mission XIII: Defeat Ylanthrius
  REP_AddQuest(2641, 4, 8, 81743, 75) -- QuestID: 81743 - Duskwood Mission XIV: Defeat Vvarc'zul
  REP_AddQuest(2641, 4, 8, 81744, 75) -- QuestID: 81744 - Duskwood Mission XV: Defeat Amokarok
  REP_AddQuest(2641, 4, 8, 81745, 75) -- QuestID: 81745 - Duskwood Mission XVI: Rescue Kroll Mountainshade
  REP_AddQuest(2641, 4, 8, 81746, 75) -- QuestID: 81746 - Duskwood Mission XVII: Rescue Alara Grovemender
  REP_AddQuest(2641, 4, 8, 81747, 75) -- QuestID: 81747 - Duskwood Mission XVIII: Rescue Elenora Marshwalker
  -- Ashenvale
  REP_AddQuest(2641, 4, 8, 81727, 10) -- QuestID: 81727 - Recover Incursion Field Report: Ashenvale
  REP_AddQuest(2641, 4, 8, 81768, 75) -- QuestID: 81768 - Ashenvale Mission I: Defeat Satyrs
  REP_AddQuest(2641, 4, 8, 81769, 75) -- QuestID: 81769 - Ashenvale Mission II: Defeat Treants
  REP_AddQuest(2641, 4, 8, 81770, 75) -- QuestID: 81770 - Ashenvale Mission III: Defeat Dragonkin
  REP_AddQuest(2641, 4, 8, 81771, 75) -- QuestID: 81771 - Ashenvale Mission IV: Dragon Intelligence
  REP_AddQuest(2641, 4, 8, 81772, 75) -- QuestID: 81772 - Ashenvale Mission V: Satyr Intelligence
  REP_AddQuest(2641, 4, 8, 81773, 75) -- QuestID: 81773 - Ashenvale Mission VI: Treant Intelligence
  REP_AddQuest(2641, 4, 8, 81774, 75) -- QuestID: 81774 - Ashenvale Mission VII: Recover Dreamengine
  REP_AddQuest(2641, 4, 8, 81775, 75) -- QuestID: 81775 - Ashenvale Mission VIII: Recover Azsharan Prophecy
  REP_AddQuest(2641, 4, 8, 81776, 75) -- QuestID: 81776 - Ashenvale Mission IX: Recover Dream-Touched Dragonegg
  REP_AddQuest(2641, 4, 8, 81777, 75) -- QuestID: 81777 - Ashenvale Mission X: Dreamroot
  REP_AddQuest(2641, 4, 8, 81778, 75) -- QuestID: 81778 - Ashenvale Mission XI: Fool's Gold Dust
  REP_AddQuest(2641, 4, 8, 81779, 75) -- QuestID: 81779 - Ashenvale Mission XII: Dream-Infused Dragonscale
  REP_AddQuest(2641, 4, 8, 81780, 200) -- QuestID: 81780 - Ashenvale Mission XIII: Defeat Larsera
  REP_AddQuest(2641, 4, 8, 81781, 75) -- QuestID: 81781 - Ashenvale Mission XIV: Defeat Zalius
  REP_AddQuest(2641, 4, 8, 81782, 75) -- QuestID: 81782 - Ashenvale Mission XV: Defeat Shredder 9000
  REP_AddQuest(2641, 4, 8, 81783, 75) -- QuestID: 81783 - Ashenvale Mission XVI: Rescue Alyssian Windcaller
  REP_AddQuest(2641, 4, 8, 81784, 75) -- QuestID: 81784 - Ashenvale Mission XVII: Rescue Doran Dreambough
  REP_AddQuest(2641, 4, 8, 81785, 75) -- QuestID: 81785 - Ashenvale Mission XVIII: Rescue Maseara Autumnmoon
  -- Hinterlands
  REP_AddQuest(2641, 4, 8, 81786, 75) -- QuestID: 81786 - Hinterlands Mission I: Defeat Moonkin
  REP_AddQuest(2641, 4, 8, 81787, 75) -- QuestID: 81787 - Hinterlands Mission II: Defeat Giant Turtles
  REP_AddQuest(2641, 4, 8, 81788, 75) -- QuestID: 81788 - Hinterlands Mission III: Defeat Dragonkin
  REP_AddQuest(2641, 4, 8, 81789, 75) -- QuestID: 81789 - Hinterlands Mission IV: Dragon Intelligence
  REP_AddQuest(2641, 4, 8, 81817, 75) -- QuestID: 81817 - Hinterlands Mission V: Turtle Intelligence
  REP_AddQuest(2641, 4, 8, 81820, 75) -- QuestID: 81820 - Hinterlands Mission VI: Moonkin Intelligence
  REP_AddQuest(2641, 4, 8, 81826, 75) -- QuestID: 81826 - Hinterlands Mission VII: Recover Star-Touched Dragonegg
  REP_AddQuest(2641, 4, 8, 81830, 75) -- QuestID: 81830 - Hinterlands Mission VIII: Recover Elunar Relic
  REP_AddQuest(2641, 4, 8, 81832, 75) -- QuestID: 81832 - Hinterlands Mission IX: Recover Dreampearl
  REP_AddQuest(2641, 4, 8, 81833, 75) -- QuestID: 81833 - Hinterlands Mission X: Star Lotus
  REP_AddQuest(2641, 4, 8, 81834, 75) -- QuestID: 81834 - Hinterlands Mission XI: Starsilver Ore
  REP_AddQuest(2641, 4, 8, 81835, 75) -- QuestID: 81835 - Hinterlands Mission XII: Starshells
  REP_AddQuest(2641, 4, 8, 81837, 200) -- QuestID: 81837 - Hinterlands Mission XIII: Defeat Florius
  REP_AddQuest(2641, 4, 8, 81838, 75) -- QuestID: 81838 - Hinterlands Mission XIV: Defeat Doomkin
  REP_AddQuest(2641, 4, 8, 81839, 75) -- QuestID: 81839 - Hinterlands Mission XV: Defeat Ghamoo-Raja
  REP_AddQuest(2641, 4, 8, 81850, 75) -- QuestID: 81850 - Hinterlands Mission XVI: Rescue Elianar Shadowdrinker
  REP_AddQuest(2641, 4, 8, 81851, 75) -- QuestID: 81851 - Hinterlands Mission XVII: Rescue Serlina Starbright
  REP_AddQuest(2641, 4, 8, 81852, 75) -- QuestID: 81852 - Hinterlands Mission XVIII: Rescue Veanna Cloudsleeper
  -- Feralas
  REP_AddQuest(2641, 4, 8, 81855, 75) -- QuestID: 81855 - Feralas Mission I: Defeat Children of Cenarius
  REP_AddQuest(2641, 4, 8, 81856, 75) -- QuestID: 81856 - Feralas Mission II: Defeat Harpies
  REP_AddQuest(2641, 4, 8, 81857, 75) -- QuestID: 81857 - Feralas Mission III: Defeat Dragonkin
  REP_AddQuest(2641, 4, 8, 81858, 75) -- QuestID: 81858 - Feralas Mission IV: Dragon Intelligence
  REP_AddQuest(2641, 4, 8, 81859, 75) -- QuestID: 81859 - Feralas Mission V: Cenarion Intelligence
  REP_AddQuest(2641, 4, 8, 81860, 75) -- QuestID: 81860 - Feralas Mission VI: Harpy Intelligence
  REP_AddQuest(2641, 4, 8, 81861, 75) -- QuestID: 81861 - Feralas Mission VII: Recover Moonglow Dragonegg
  REP_AddQuest(2641, 4, 8, 81863, 75) -- QuestID: 81863 - Feralas Mission VIII: Recover Keeper's Notes
  REP_AddQuest(2641, 4, 8, 81864, 75) -- QuestID: 81864 - Feralas Mission IX: Recover Harpy Screed
  REP_AddQuest(2641, 4, 8, 81865, 75) -- QuestID: 81865 - Feralas Mission X: Moonroot
  REP_AddQuest(2641, 4, 8, 81866, 75) -- QuestID: 81866 - Feralas Mission XI: Greater Moonstone
  REP_AddQuest(2641, 4, 8, 81867, 75) -- QuestID: 81867 - Feralas Mission XII: Greater Moondragon Scales
  REP_AddQuest(2641, 4, 8, 81868, 200) -- QuestID: 81868 - Feralas Mission XIII: Defeat Tyrannikus
  REP_AddQuest(2641, 4, 8, 81870, 75) -- QuestID: 81870 - Feralas Mission XIV: Defeat Alondrius
  REP_AddQuest(2641, 4, 8, 81871, 75) -- QuestID: 81871 - Feralas Mission XV: Defeat Slirena
  REP_AddQuest(2641, 4, 8, 81872, 75) -- QuestID: 81872 - Feralas Mission XVI: Rescue Mellias Earthtender
  REP_AddQuest(2641, 4, 8, 81873, 75) -- QuestID: 81873 - Feralas Mission XVII: Rescue Nerene Brooksinger
  REP_AddQuest(2641, 4, 8, 81874, 75) -- QuestID: 81874 - Feralas Mission XVIII: Rescue Jamniss Treemender
  -- Hinterlands/Feralas
  REP_AddQuest(2641, 4, 8, 82068, 1000) -- QuestID: 82068 - Fight the Nightmare Incursions
end

--------------------------------------------------
-- Factions released 'after' Vanilla/Classic
--------------------------------------------------
	if(REP.AfterClassic) then
		---------------------------
		-- The Violet Eye 967 --
		---------------------------
		---- Instances
		REP_AddInstance(967, 4, 8, zone.Karazhan, 6000, false)

		---------------------------
		-- Ashtongue Deathsworn 1012 --
		---------------------------
		---- Instances
		REP_AddInstance(1012, 4, 8, zone.Black_Temple, 8000)

		---------------------------
		-- The Scale of the Sands 990 --
		---------------------------
		---- Instances
		REP_AddInstance(990, 4, 8, zone.Hyjal_Summit, 6500)

		---------------------------
		-- Cenarion Expedition 942 --
		---------------------------
		---- Quests
		REP_AddQuest(942, 4, 5, "Plants of Zangarmarsh", 250, {[24401] = 10}) -- Plants of Zangarmarsh QuestID: 9802
		REP_AddQuest(942, 4, 6, "Uncatalogued Species", 500, {[24407] = 1}) -- Uncatalogued Species QuestID: 9875
		REP_AddQuest(942, 4, 8, "Coilfang Armaments", 75, {[24368] = 1}) -- Coilfang Armaments QuestID: 9766
		if (REP.AfterTBC) then
			REP_AddQuest(942, 4, 8, 11867, 150) -- Can't Get Ear-nough... QuestID: 11867
		end
		---- Mobs
		REP_AddMob(942, 4, 4, "Steam Pump Overseer", 1, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Wrekt Slave", 2.5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Dreghood Drudge", 2.5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Bloodscale Overseer", 5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Bloodscale Wavecaller", 5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Darkcrest Sorceress", 5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Darkcrest Slaver", 5, zone.Zangarmarsh)
		REP_AddMob(942, 4, 4, "Terrorclaw", 7, zone.Zangarmarsh)
		---- Instances
		REP_AddInstance(942, 4, 5, zone.The_Slave_Pens, 650, false)
		REP_AddInstance(942, 4, 5, zone.The_Underbog, 1000, false)
		REP_AddInstance(942, 4, 8, zone.The_Steamvault, 1662, false)
    if REP.ShowCataPhaseOne then
      REP_AddInstance(942, 4, 8, zone.The_Slave_Pens, 650, true)
      REP_AddInstance(942, 4, 8, zone.The_Underbog, 1000, true)
      REP_AddInstance(942, 4, 8, zone.The_Steamvault, 2319, true)
    else
      REP_AddInstance(942, 6, 8, zone.The_Slave_Pens, 650, true)
      REP_AddInstance(942, 6, 8, zone.The_Underbog, 1000, true)
      REP_AddInstance(942, 4, 8, zone.The_Steamvault, 2319, true)
    end

    ---- General
    REP_AddGeneral(942, 4, 8, "Freeing Cenarion Expedition Ethereum prisoners", 500, "Freeing Cenarion Expedition Ethereum prisoners", "Freeing Cenarion Expedition Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(942, 1, 8, 500, {[129949] = 1})
		end

		---------------------------
		-- Keepers of Time 989 --
		---------------------------
		---- Instances
		REP_AddInstance(989, 4, 8, zone.Old_Hillsbrad_Foothills, 1133, false)
		REP_AddInstance(989, 4, 8, zone.Old_Hillsbrad_Foothills, 2445, true)
		REP_AddInstance(989, 4, 8, zone.The_Black_Morass, 1110, false)
		REP_AddInstance(989, 4, 8, zone.The_Black_Morass, 1725, true)
		---- General
    REP_AddGeneral(989, 4, 8, "Freeing Keepers of Time Ethereum prisoners", 500, "Freeing Keepers of Time Ethereum prisoners", "Freeing Keepers of Time Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")
    if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(989, 1, 8, 500, {[129950] = 1})
		end

		---------------------------
		-- Netherwing 1015 --
		---------------------------
		---- Quests
		REP_AddQuest(1015, 4, 8, "Netherdust Pollen", 250, {[32468] = 40}, REP.LIMIT_TYPE_Herb) -- Netherdust Pollen QuestID: 11017
		REP_AddQuest(1015, 4, 8, "Nethercite Ore", 250, {[32464] = 40}, REP.LIMIT_TYPE_Mine) -- Nethercite Ore QuestID: 11018
		REP_AddQuest(1015, 4, 8, "Nethermine Flayer Hide", 250, {[32470] = 35}, REP.LIMIT_TYPE_Skin) -- Nethermine Flayer Hide QuestID: 11016
		REP_AddQuest(1015, 4, 8, "A Slow Death", 250) -- A Slow Death QuestID: 11020
		REP_AddQuest(1015, 4, 8, "The Not-So-Friendly Skies...", 250, {[32509] = 10}) -- The Not-So-Friendly Skies... QuestID: 11035
		REP_AddQuest(1015, 4, 8, "Netherwing Crystals", 250, {[32427] = 30}) -- Netherwing Crystals QuestID: 11015
		REP_AddQuest(1015, 5, 8, "Dragons are the Least of Our Problems", 350) -- Dragons are the Least of Our Problems QuestID: 11077
		REP_AddQuest(1015, 5, 8, "Picking Up The Pieces...", 350, {[32723] = 15}) -- Picking Up The Pieces... QuestID: 11076
		REP_AddQuest(1015, 5, 8, "The Booterang: A Cure For The Common Worthless Peon", 350) -- The Booterang: A Cure For The Common Worthless Peon QuestID: 11055
		REP_AddQuest(1015, 6, 8, "Disrupting the Twilight Portal", 500) -- Disrupting the Twilight Portal QuestID: 11086
		REP_AddQuest(1015, 7, 8, "The Deadliest Trap Ever Laid", 500) -- The Deadliest Trap Ever Laid QuestID: 11101
		---- Items
		REP_AddItems(1015, 4, 8, 250, {[32506] = 1}) -- Netherwing egg
		-- REP_AddQuest(1015, 4, 8, "Accepting All Eggs", 250, {[32506] = 1}) -- Accepting All Eggs QuestID: 11050

		---------------------------
		-- Ogri'la 1038 --
		---------------------------
		---- Quests
		REP_AddQuest(1038, 4, 8, "The Relic's Emanation", 350) -- The Relic's Emanation QuestID: 11080
		REP_AddQuest(1038, 4, 8, "Wrangle More Aether Rays!", 350) -- Wrangle More Aether Rays! QuestID: 11066
		REP_AddQuest(1038, 4, 8, "Bomb Them Again!", 500) -- Bomb Them Again! QuestID: 11023
		REP_AddQuest(1038, 6, 8, "Banish More Demons", 350) -- Banish More Demons QuestID: 11051

		---------------------------
		-- Sha'tari Skyguard 1031 --
		---------------------------
		---- Quests
		REP_AddQuest(1031, 4, 8, "World of Shadows", 150, {[32388] = 6}) -- World of Shadows QuestID: 11004
		REP_AddQuest(1031, 4, 8, "Tokens of the Descendants", 350, {[32718] = 1, [32715] = 1, [32717] = 1, [32716] = 1}) -- Tokens of the Descendants QuestID: 11074
		REP_AddQuest(1031, 4, 8, "Fires Over Skettis", 350) -- Fires Over Skettis QuestID: 11008
		REP_AddQuest(1031, 4, 8, "Escape from Skettis", 150) -- Escape from Skettis QuestID: 11085
		REP_AddQuest(1031, 4, 8, "Wrangle More Aether Rays!", 350) -- Wrangle More Aether Rays! QuestID: 11066
		REP_AddQuest(1031, 4, 8, "Bomb Them Again!", 500) -- Bomb Them Again! QuestID: 11023
		---- Mobs
		if (not REP.AfterWotlk) then
			REP_AddMob(1031, 4, 6, "Skettis Kaliri", 2.5, zone.Terokkar_Forest)
			REP_AddMob(1031, 4, 8, "Skettis, Talonpriests, Time-Lost Skettis, Monstrous Kaliri", 5, zone.Terokkar_Forest)
			REP_AddMob(1031, 4, 8, "Talonsworn Forest-Rager", 15, zone.Terokkar_Forest)
		else
			REP_AddMob(1031, 4, 6, "Skettis Kaliri", 5, zone.Terokkar_Forest)
			REP_AddMob(1031, 4, 8, "Skettis, Talonpriests, Time-Lost Skettis, Monstrous Kaliri", 10, zone.Terokkar_Forest)
			REP_AddMob(1031, 4, 8, "Talonsworn Forest-Rager", 30, zone.Terokkar_Forest)
		end
		REP_AddMob(1031, 4, 8, "Karrog, Gezzarak the Huntress", 100, zone.Terokkar_Forest)
		REP_AddMob(1031, 4, 8, "Terokk", 500, zone.Terokkar_Forest)

		---------------------------
		-- Sporeggar 970 --
		---------------------------
		---- Mobs
		REP_AddMob(970, 3, 6, "Bog Lords, Bog Giants", 15)
		REP_AddMob(970, 3, 8, "Marsh Dredger, Marsh Lurker", 15)
		---- Quests
		REP_AddQuest(970, 3, 4, "The Sporelings' Plight", 250, {[24290] = 10}) -- The Sporelings' Plight QuestID: 9739
		-- REP_AddQuest(970, 3, 5, "Natural Enemies", 250, {[24291] = 6}, nil, false) -- Natural Enemies QuestID: 9743
		REP_AddQuest(970, 3, 4, "More Tendrils!", 750, {[24291] = 6}) -- More Tendrils! QuestID: 9744
		-- REP_AddQuest(970, 4, 4, "Glowcap Mushrooms", 250, {[24245] = 10}) -- Glowcap Mushrooms QuestID: 9808
		REP_AddQuest(970, 3, 4, "More Glowcaps", 250, {[24245] = 10}) -- Glowcap Mushrooms QuestID: 9809
		REP_AddQuest(970, 4, 8, "Now That We're Still Friends...", 750) -- Now That We're Still Friends... QuestID: 9727
		REP_AddQuest(970, 4, 8, "More Fertile Spores", 750, {[24449] = 6}) -- More Fertile Spores QuestID: 9807
		REP_AddQuest(970, 4, 8, "Bring Me Another Shrubbery!", 750, {[24246] = 5}) -- QuestID: 9714
		---- Instances
		REP_AddInstance(970, 3, 7, zone.The_Underbog, 15, false)
		REP_AddInstance(970, 3, 7, zone.The_Underbog, 45, true)
    ---- General
    REP_AddGeneral(970, 4, 8, "Freeing Sporeggar Ethereum prisoners", 500, "Freeing Sporeggar Ethereum prisoners", "Freeing Sporeggar Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")

		---------------------------
		-- The Consortium 933 --
		---------------------------
		---- Quests
		REP_AddQuest(933, 4, 4, "More Crystal Fragments", 250, {[25416] = 10}) -- More Crystal Fragments QuestID: 9883
		REP_AddQuest(933, 4, 4, "More Heads Full of Ivory", 250, {[25463] = 3}) -- More Heads Full of Ivory QuestID: 9915
		REP_AddQuest(933, 5, 8, "More Obsidian Warbeads", 250, {[25433] = 10}) -- More Obsidian Warbeads QuestID: 9892
		REP_AddQuest(933, 5, 8, "Another Heap of Ethereals", 250, {[29209] = 10}) -- Another Heap of Ethereals QuestID: 10308
		REP_AddQuest(933, 6, 8, "Ethereum Prisoner I.D. Catalogue", 250, {[31957] = 1}) -- Ethereum Prisoner I.D. Catalogue QuestID: 10972
		REP_AddQuest(933, 7, 8, "A Thousand Worlds", 500, {[29460] = 5}) -- A Thousand Worlds QuestID: 10973
		REP_AddQuest(933, 7, 8, "Purging the Chambers of Bash'ir", 500, {[29460] = 5}) -- Purging the Chambers of Bash'ir QuestID: 10975
		---- Instances
		REP_AddInstance(933, 4, 5, zone.Mana_Tombs, 1200, false)
    
    if REP.ShowCataPhaseOne then
      REP_AddInstance(933, 4, 8, zone.Mana_Tombs, 2400, true)
    else
      REP_AddInstance(933, 6, 8, zone.Mana_Tombs, 2400, true)
    end
		
		if(REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(933, 1, 8, 500, {[129945] = 1})
		end
    ---- General
    REP_AddGeneral(933, 4, 8, "Freeing The Consortium Ethereum prisoners", 500, "Freeing The Consortium Ethereum prisoners", "Freeing The Consortium Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")

		---------------------------
		-- Lower City 1011 --
		---------------------------
		---- Quests
		REP_AddQuest(1011, 4, 5, "More Feathers", 250, {[25719] = 30}) -- More Feathers QuestID: 10918
		---- Instances
		REP_AddInstance(1011, 4, 5, zone.Auchenai_Crypts, 750, false)
    if REP.ShowCataPhaseOne then
      REP_AddInstance(1011, 4, 8, zone.Auchenai_Crypts, 750, true)
    else
      REP_AddInstance(1011, 6, 8, zone.Auchenai_Crypts, 750, true)
    end
		REP_AddInstance(1011, 4, 8, zone.Sethekk_Halls, 1080, false)
		REP_AddInstance(1011, 4, 8, zone.Sethekk_Halls, 1250, true)
		REP_AddInstance(1011, 4, 8, zone.Shadow_Labyrinth, 2000, false)
		REP_AddInstance(1011, 4, 8, zone.Shadow_Labyrinth, 2700, true)
		if(REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1011, 1, 8, 500, {[129951] = 1})
		end
    ---- General
    REP_AddGeneral(1011, 4, 8, "Freeing Lower City Ethereum prisoners", 500, "Freeing Lower City Ethereum prisoners", "Freeing Lower City Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")

		---------------------------
		-- Shattered Sun Offensive 1077 --
		---------------------------
		---- Quests
		REP_AddQuest(1077, 4, 8, "Gaining the Advantage", 250, {[35229] = 8}, REP.LIMIT_TYPE_Gather) -- Gaining the Advantage QuestID: 11877
		REP_AddQuest(1077, 4, 8, "Sunfury Attack Plans", 250) -- Sunfury Attack Plans QuestID: 11877
		REP_AddQuest(1077, 4, 8, "The Multiphase Survey", 150) -- The Multiphase Survey QuestID: 11880
		REP_AddQuest(1077, 4, 8, "Blood for Blood", 250) -- Blood for Blood QuestID: 11515
		REP_AddQuest(1077, 4, 8, "Blast the Gateway", 250) -- Blast the Gateway QuestID: 11516
		REP_AddQuest(1077, 4, 8, "Arm the Wards!", 150) -- Arm the Wards! QuestID: 11523
		REP_AddQuest(1077, 4, 8, "Further Conversions", 150) -- Further Conversions QuestID: 11525
		REP_AddQuest(1077, 4, 8, "Maintaining the Sunwell Portal", 250, {[34246] = 10}) -- Maintaining the Sunwell Portal QuestID: 11514
		REP_AddQuest(1077, 4, 8, "Know Your Ley Lines", 250) -- Know Your Ley Lines QuestID: 11547
		REP_AddQuest(1077, 4, 8, "The Battle Must Go On", 250) -- The Battle Must Go On QuestID: 11537
		REP_AddQuest(1077, 4, 8, "The Air Strikes Must Continue", 150) -- The Air Strikes Must Continue QuestID: 11533
		REP_AddQuest(1077, 4, 8, "Ata'mal Armaments", 350, {[34501] = 5}) -- Ata'mal Armaments QuestID: 11544
		REP_AddQuest(1077, 4, 8, "Don't Stop Now....", 250, {[34479] = 3}) -- Don't Stop Now.... QuestID: 11536
		REP_AddQuest(1077, 4, 8, "Disrupt the Greengill Coast", 250) -- Disrupt the Greengill Coast QuestID: 11541
		REP_AddQuest(1077, 4, 8, "Keeping the Enemy at Bay", 250) -- Keeping the Enemy at Bay QuestID: 11543
		REP_AddQuest(1077, 4, 8, "Crush the Dawnblade", 250) -- Crush the Dawnblade QuestID: 11540
		-- REP_AddQuest(1077, 8, 8, "A Magnanimous Benefactor", 500) -- A Magnanimous Benefactor QuestID: 11549 (Not repeatable?)
		REP_AddQuest(1077, 4, 8, "Your Continued Support", 150, {["Gold"] = 10}) -- Your Continued Support QuestID: 11548
		REP_AddQuest(1077, 4, 8, "Rediscovering Your Roots", 350, {[34254] = 5}) -- Rediscovering Your Roots QuestID: 11521
		REP_AddQuest(1077, 4, 8, "Open for Business", 250, {[34502] = 5}) -- Open for Business QuestID: 11546
		---- Instances
		REP_AddInstance(1077, 4, 7, zone.Magisters_Terrace, 1640, false)
		REP_AddInstance(1077, 4, 8, zone.Magisters_Terrace, 2503, true)

		---------------------------
		-- The Aldor 932 --
		---------------------------
		---- Quests
		REP_AddQuest(932, 1, 3, "More Venom Sacs", 250, {[25802] = 8}) -- More Venom Sacs QuestID: 10019
		REP_AddQuest(932, 4, 5, "Single Mark of Kil'jaeden", 25, {[29425] = 1}) -- Single Mark of Kil'jaeden QuestID: 10327
		REP_AddQuest(932, 4, 5, "More Marks of Kil'jaeden", 250, {[29425] = 10}) -- More Marks of Kil'jaeden QuestID: 10326
		REP_AddQuest(932, 5, 8, "Single Mark of Sargeras", 25, {[30809] = 1}) -- Single Mark of Sargeras QuestID: 10655
		REP_AddQuest(932, 5, 8, "More Marks of Sargeras", 250, {[30809] = 10}) -- More Marks of Sargeras QuestID: 10654
		REP_AddQuest(932, 5, 8, "Fel Armaments", 350, {[29740] = 1}) -- Fel Armaments QuestID: 10421

		---------------------------
		-- The Scryers 934 --
		---------------------------
		---- Quests
		REP_AddQuest(934, 1, 3, "More Basilisk Eyes", 250, {[25744] = 8}) -- More Basilisk Eyes QuestID: 10025
		REP_AddQuest(934, 4, 5, "Single Firewing Signet", 25, {[29426] = 1}) -- Single Firewing Signet QuestID: 10414
		REP_AddQuest(934, 4, 5, "More Firewing Signets", 250, {[29426] = 10}) -- More Firewing Signets QuestID: 10415
		REP_AddQuest(934, 5, 8, "Single Sunfury Signet", 25, {[30810] = 1}) -- Single Sunfury Signet QuestID: 10659
		REP_AddQuest(934, 5, 8, "More Sunfury Signets", 250, {[30810] = 10}) -- More Sunfury Signets QuestID: 10658
		REP_AddQuest(934, 5, 8, "Arcane Tomes", 350, {[29739] = 1}) -- Arcane Tomes QuestID: 10419

		---------------------------
		-- The Sha'tar 935 --
		---------------------------
		---- Quests
		REP_AddQuest(935, 4, 5, "Single Mark of Kil'jaeden", 12.5, {[29425] = 1}) -- Single Mark of Kil'jaeden QuestID: 10327
		REP_AddQuest(935, 4, 5, "More Marks of Kil'jaeden", 125, {[29425] = 10}) -- More Marks of Kil'jaeden QuestID: 10326
		REP_AddQuest(935, 4, 5, "Single Mark of Sargeras", 12.5, {[30809] = 1}) -- Single Mark of Sargeras QuestID: 10655
		REP_AddQuest(935, 4, 5, "More Marks of Sargeras", 125, {[30809] = 10}) -- More Marks of Sargeras QuestID: 10654
		REP_AddQuest(935, 4, 5, "Single Firewing Signet", 12.5, {[29426] = 1}) -- Single Firewing Signet QuestID: 10414
		REP_AddQuest(935, 4, 5, "More Firewing Signets", 125, {[29426] = 10}) -- More Firewing Signets QuestID: 10415
		REP_AddQuest(935, 4, 5, "Single Sunfury Signet", 12.5, {[30810] = 1}) -- Single Sunfury Signet QuestID: 10659
		REP_AddQuest(935, 4, 5, "More Sunfury Signets", 125, {[30810] = 10}) -- More Sunfury Signets QuestID: 10658
		REP_AddQuest(935, 4, 5, "More Venom Sacs", 125, {[25802] = 8}) -- More Venom Sacs QuestID: 10019 TODO: Double check in wotlk.
		REP_AddQuest(935, 4, 5, "More Basilisk Eyes", 125, {[25744] = 8}) -- More Basilisk Eyes QuestID: 10025 TODO: Double check in wotlk.
		REP_AddQuest(935, 4, 5, "Fel Armaments", 175, {[29740] = 1}) -- Fel Armaments QuestID: 10421
		REP_AddQuest(935, 4, 5, "Arcane Tomes", 175, {[29739] = 1}) -- Arcane Tomes QuestID: 10419
		---- Instances
		REP_AddInstance(935, 4, 8, zone.The_Mechanar, 1620, false)
		REP_AddInstance(935, 4, 8, zone.The_Mechanar, 3000, true)
		REP_AddInstance(935, 4, 8, zone.The_Botanica, 2000, false)
		REP_AddInstance(935, 4, 8, zone.The_Botanica, 3000, true)
		REP_AddInstance(935, 4, 8, zone.The_Arcatraz, 1800, false)
		REP_AddInstance(935, 4, 8, zone.The_Arcatraz, 3000, true)
		if(REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(935, 1, 8, 500, {[129946] = 1})
		end
    ---- General
    REP_AddGeneral(935, 4, 8, "Freeing The Sha'tar Ethereum prisoners", 500, "Freeing The Sha'tar Ethereum prisoners", "Freeing The Sha'tar Ethereum prisoners (these are not guaranteed and can be very rare spawns from the prisons).")

		if (REP.IsAlliance) then
			---------------------------
			-- Exodar 930 --
			---------------------------
			if (not REP.AfterWotlk) then
				---- Quests
				REP_AddQuest(930, 4, 8, 10358, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 10358
			else
				REP_AddQuest(930, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
				REP_AddQuest(930, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
			end
			---- Spillover from Alterac Valley
		  REP_AddQuest(930, 4, 8, "Crystal Cluster", 18.75, {[17423] = 5}, nil, true, false, true) -- Crystal Cluster QuestID: 7386
		  REP_AddQuest(930, 4, 8, 6881, 2.5, {[17423] = 1}, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 6943, 10, {[17504] = 1}, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 6942, 10, {[17502] = 1}, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 6941, 10, {[17503] = 1}, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 7027, 2.5, nil, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 7026, 2.5, {[17643] = 1}, nil, true, false, true)
		  REP_AddQuest(930, 4, 8, 6781, 2.5, {[17422] = 20}, nil, true, false, true)
			if (REP.AfterTBC) then
				---- Items
				REP_AddItems(930, 4, 8, 250, {[45715] = 1}) -- Exodar Commendation Badge: 45715
				REP_AddItems(930, 4, 8, 62.5, {[4] = 1})
        if (REP.AfterWotlk) then
          ---- General
          REP_AddGeneral(930, 5, 8, "Killing (grey level) mobs in instances while wearing the Exodar tabard.", 3, "Killing (grey level) mobs in instances while wearing the Exodar tabard.", "Killing (grey level) mobs in instances while wearing the Exodar tabard will reward you roughly 3 reputation per kill.")
          REP_AddGeneral(930, 5, 8, "Killing (grey level) bosses in instances while wearing the Exodar tabard.", 60, "Killing (grey level) bosses in instances while wearing the Exodar tabard.", "Killing (grey level) bosses in instances while wearing the Exodar tabard will reward you roughly 60 reputation per kill.")
          REP_AddGeneral(930, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Exodar tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Exodar tabard.", "Killing (green or higher level) mobs in instances while wearing the Exodar tabard will reward you roughly 15 reputation per kill.")
        end
      end

			---------------------------
			-- Honor Hold 946
			---------------------------
			---- Quests
			REP_AddQuest(946, 4, 7, "Hellfire Fortifications", 150) -- Hellfire Fortifications QuestID: 13410
			---- Instances
			REP_AddInstance(946, 4, 5, zone.Hellfire_Ramparts, 600, false)
			REP_AddInstance(946, 6, 8, zone.Hellfire_Ramparts, 2000, true)
			REP_AddInstance(946, 4, 5, zone.The_Blood_Furnace, 750, false)
			REP_AddInstance(946, 6, 8, zone.The_Blood_Furnace, 2700, true)
			REP_AddInstance(946, 4, 8, zone.The_Shattered_Halls, 1600, false)
			REP_AddInstance(946, 4, 8, zone.The_Shattered_Halls, 2900, true)
			if (REP.AfterWotlk) then
				---- Mobs
        ---- TODO: Test once cata is live.
				-- REP_AddMob(946, 4, 7, REP_TXT.Mob.MoshOgg_Spellcrafter, 5, zone.Northern_Stranglethorn) -- Mosh'Ogg Spellcrafter ID=710
				-- REP_AddMob(946, 4, 8, REP_TXT.Mob.MoshOgg_Spellcrafter, 15, zone.Northern_Stranglethorn) -- Mosh'Ogg Spellcrafter ID=710
				if (REP.AfterMoP) then
					-- Timewalking commendation
					REP_AddItems(946, 1, 8, 500, {[129948] = 1})
				end
			end

			---------------------------
			-- Kurenai 978
			---------------------------
			---- Quests
			REP_AddQuest(978, 4, 8, "More Warbeads", 500, {[25433] = 10}) -- More Warbeads QuestID: 10477
			REP_AddQuest(978, 4, 8, "In Defense of Halaa", 250) -- In Defense of Halaa QuestID: 11502
			---- Mobs
			REP_AddMob(978, 4, 8, "Boulderfist Crusher, Hunter, Mage, Mystic & Warrior", 10, zone.Nagrand) -- REP_TXT.Mob.BoulderfistOgre
			REP_AddMob(978, 4, 8, "Warmaul Brute, Reaver, Shaman & Warlock", 10, zone.Nagrand) -- Warmaul non-elite
			REP_AddMob(978, 4, 8, "Kil'sorrow Cultist, Deathsworn, Ritualist & Spellbinder", 10, zone.Nagrand)
			REP_AddMob(978, 4, 8, "Murkblood Brute, Invader, Putrifier & Raider", 10, zone.Nagrand)
			REP_AddMob(978, 4, 8, "Murkblood Scavenger", 2, zone.Nagrand)
			REP_AddMob(978, 4, 8, "Ortor of Murkblood", 10, zone.Nagrand)
			REP_AddMob(978, 4, 8, "Zorbo the Advisor", 10, zone.Nagrand)
		else
			---------------------------
			-- Silvermoon City 911
			---------------------------
			if (not REP.AfterWotlk) then
				---- Quests
				REP_AddQuest(911, 4, 8, 10363, 75, {[14047] = 20}) -- Additional Runecloth QuestID: 10363
			else
				REP_AddQuest(911, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
				REP_AddQuest(911, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
			end
			---- Spillover from Alterac Valley
			REP_AddQuest(911, 4, 8, "A Gallon of Blood", 18.75, {[17306] = 5}, nil, true, false, true) -- A Gallon of Blood QuestID: 7385
			REP_AddQuest(911, 4, 8, 6801, 2.5, {[17306] = 1}, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 6825, 10, {[17326] = 1}, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 6826, 10, {[17327] = 1}, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 6827, 10, {[17328] = 1}, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 7027, 2.5, nil, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 7002, 2.5, {[17642] = 1}, nil, true, false, true)
			REP_AddQuest(911, 4, 8, 6741, 2.5, {[17422] = 20}, nil, true, false, true)
			if (REP.AfterTBC) then
				---- Items
				REP_AddItems(911, 4, 8, 250, {[45721] = 1}) -- Silvermoon commendation badge: 45721
				REP_AddItems(911, 4, 8, 62.5, {[4] = 1})
        if (REP.AfterWotlk) then
          ---- General
          REP_AddGeneral(911, 5, 8, "Killing (grey level) mobs in instances while wearing the Silvermoon City tabard.", 3, "Killing (grey level) mobs in instances while wearing the Silvermoon City tabard.", "Killing (grey level) mobs in instances while wearing the Silvermoon City tabard will reward you roughly 3 reputation per kill.")
          REP_AddGeneral(911, 5, 8, "Killing (grey level) bosses in instances while wearing the Silvermoon City tabard.", 60, "Killing (grey level) bosses in instances while wearing the Silvermoon City tabard.", "Killing (grey level) bosses in instances while wearing the Silvermoon City tabard will reward you roughly 60 reputation per kill.")
          REP_AddGeneral(911, 5, 8, "Killing (green or higher level) mobs in instances while wearing the Silvermoon City tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Silvermoon City tabard.", "Killing (green or higher level) mobs in instances while wearing the Silvermoon City tabard will reward you roughly 15 reputation per kill.")
        end
      end

			---------------------------
			-- Thrallmar 947
			---------------------------
			---- Quests
		  REP_AddQuest(947, 4, 7, 13410, 150)
			---- Instances
			REP_AddInstance(947, 4, 5, zone.Hellfire_Ramparts, 600, false)
			REP_AddInstance(947, 6, 8, zone.Hellfire_Ramparts, 2000, true)
			REP_AddInstance(947, 4, 5, zone.The_Blood_Furnace, 750, false)
			REP_AddInstance(947, 6, 8, zone.The_Blood_Furnace, 2700, true)
			REP_AddInstance(947, 4, 8, zone.The_Shattered_Halls, 1600, false)
			REP_AddInstance(947, 4, 8, zone.The_Shattered_Halls, 2900, true)
      if (REP.AfterWotlk) then
				---- Mobs
        ---- TODO: Test once cata is live.
				-- REP_AddMob(947, 4, 7, REP_TXT.Mob.MoshOgg_Spellcrafter, 5, zone.Northern_Stranglethorn) -- Mosh'Ogg Spellcrafter ID=710
				-- REP_AddMob(947, 4, 8, REP_TXT.Mob.MoshOgg_Spellcrafter, 15, zone.Northern_Stranglethorn) -- Mosh'Ogg Spellcrafter ID=710
        if (REP.AfterMoP) then
          -- Timewalking Commendation
          REP_AddItems(947, 1, 8, 500, {[129947] = 1})
        end
      end

			---------------------------
			-- The Mag'har 941
			---------------------------
			---- Quests
		  REP_AddQuest(941, 4, 8, "More Warbeads", 500, {[25433] = 10}) -- More Warbeads QuestID: 10479
		  REP_AddQuest(941, 4, 8, "In Defense of Halaa", 250) -- In Defense of Halaa QuestID: 11503
			---- Mobs
			REP_AddMob(941, 4, 8, "Boulderfist Crusher, Hunter, Mage, Mystic & Warrior", 10, zone.Nagrand) -- REP_TXT.Mob.BoulderfistOgre
			REP_AddMob(941, 4, 8, "Warmaul Brute, Reaver, Shaman & Warlock", 10, zone.Nagrand) -- Warmaul non-elite
			REP_AddMob(941, 4, 8, "Kil'sorrow Cultist, Deathsworn, Ritualist & Spellbinder", 10, zone.Nagrand)
			REP_AddMob(941, 4, 8, "Murkblood Brute, Invader, Putrifier & Raider", 10, zone.Nagrand)
			REP_AddMob(941, 4, 8, "Murkblood Scavenger", 2, zone.Nagrand)
			REP_AddMob(941, 4, 8, "Ortor of Murkblood", 10, zone.Nagrand)
			REP_AddMob(941, 4, 8, "Zorbo the Advisor", 10, zone.Nagrand)

			---------------------------
			-- Tranquillien 922
			---------------------------
			---- Quests
		  REP_AddQuest(922, 4, 8, 9217, 500, {[22641] = 10})
		  REP_AddQuest(922, 4, 8, 9219, 500, {[22642] = 10})
		end
	end

--------------------------------------------------
-- Factions released 'after' The Burning Crusade
--------------------------------------------------
	if(REP.AfterTBC) then
		---------------------------
		-- Argent Crusade 1106
		---------------------------
		if (REP.AfterWotlk) then
			---- Mobs
			REP_AddMob(1106, 4, 8, "Crypt Slayer, Crypt Stalker, Crypt Walker, Crypt Horror", 5, zone.Eastern_Plaguelands) -- MobId: 8558, 8555, 8556, 8557
      REP_AddMob(1106, 4, 8, "Vile Tutor, Dark Summoner, Gibbering Ghoul, Hate Shrieker", 5, zone.Eastern_Plaguelands) -- MobId: 8548, 8551, 8531, 8541
      REP_AddMob(1106, 4, 8, "Stitched Horror, Unseen Servant, Scourge Warder", 5, zone.Eastern_Plaguelands) -- MobId: 8543, 8538, 8525
			REP_AddMob(1106, 4, 8, "Cursed Mage, Cannibal Ghoul, Scourge Soldier, Overstuffed Golem", 5, zone.Eastern_Plaguelands) -- MobId: 8524, 8530, 8523, 45851
      -- REP_AddMob(1106, 4, 8, "", 5, zone.Western_Plaguelands) -- MobId: 
		end
		---- Quests
		REP_AddQuest(1106, 4, 8, 12587, 350) -- Troll Patrol QuestID: 12587
		REP_AddQuest(1106, 4, 8, "Congratulations!", 500) -- Congratulations! QuestID: 12604
		if (REP.IsAlliance) then
			REP_AddQuest(1106, 4, 8, 13300, 325) -- Slaves to Saronite QuestID: 13300
		else
			REP_AddQuest(1106, 4, 8, 13302, 325) -- Slaves to Saronite QuestID: 13302
		end
		if (REP.IsDeathKnight) then
			---- Quests
			REP_AddQuest(1106, 4, 8, 13809, 325) -- Threat From Above QuestID: 13809
			REP_AddQuest(1106, 4, 8, 13810, 325) -- Taking Battle To The Enemy QuestID: 13810
			REP_AddQuest(1106, 4, 8, 13862, 325) -- Battle Before The Citadel QuestID: 13862
			REP_AddQuest(1106, 4, 8, 13811, 325) -- Among the Champions QuestID: 13811
		end
		if (not REP.AfterMoP) then
			---- Items
			REP_AddItems(1106, 4, 8, 400, {[44711] = 1}) -- Argent Crusade Commendation Badge
		else
			-- Timewalking Commendation
			REP_AddItems(1106, 1, 8, 500, {[129942] = 1})
		end
		---- General
		REP_AddGeneral(1106, 5, 8, "Killing mobs in instances while wearing the Argent Crusade tabard.", 5, "Killing mobs in instances while wearing the Argent Crusade tabard.", "Killing mobs in instances while wearing the Argent Crusade tabard will reward you roughly 5 reputation per kill.")

		---------------------------
		-- Kirin Tor 1090 --
		---------------------------
		---- Quests
		REP_AddQuest(1090, 4, 8, "Dalaran Jewelcrafting daily", 25, "nil", REP.LIMIT_TYPE_Jewel)
		REP_AddQuest(1090, 4, 8, "Dalaran Cooking daily", 150, "nil", REP.LIMIT_TYPE_Cook)
		REP_AddQuest(1090, 4, 8, "Dalaran Fishing daily", 250, "nil", REP.LIMIT_TYPE_Fish)
		REP_AddQuest(1090, 4, 8, "Waterlogged Recipe", 250, {[49667] = 1}) -- Waterlogged Recipe QuestID: 14203 (Somehow doesn't give questname from API)
		REP_AddQuest(1090, 4, 8, 13845, 250, {[46005] = 1}) -- Sealed Vial of Poison QuestID: 13845
		if (not REP.AfterMoP) then
			---- Items
			REP_AddItems(1090, 4, 8, 400, {[43950] = 1}) -- Kirin Tor Commendation Badge
		else
			-- Timewalking Commendation
			REP_AddItems(1090, 1, 8, 500, {[129940] = 1})
		end
		---- General
		REP_AddGeneral(1090, 5, 8, "Killing mobs in instances while wearing the Kirin Tor tabard.", 5, "Killing mobs in instances while wearing the Kirin Tor tabard.", "Killing mobs in instances while wearing the Kirin Tor tabard will reward you roughly 5 reputation per kill.")

		---------------------------
		-- Knights of the Ebon Blade 1098 --
		---------------------------
		---- Quests
		REP_AddQuest(1098, 4, 8, 12813, 250) -- From Their Corpses, Rise! QuestID: 12813
		REP_AddQuest(1098, 4, 8, 12838, 250) -- Intelligence Gathering QuestID: 12838
		REP_AddQuest(1098, 4, 8, 12995, 250) -- Leave Our Mark QuestID: 12995
		REP_AddQuest(1098, 4, 8, 12815, 250) -- No Fly Zone QuestID: 12815
		REP_AddQuest(1098, 4, 8, 13071, 250) -- Vile Like Fire! QuestID: 13071
		REP_AddQuest(1098, 4, 8, 13069, 250) -- Shoot 'Em Up QuestID: 13069
		REP_AddQuest(1098, 4, 8, 13093, 10, {[43089] = 10}) -- Reading the Bones QuestID: 13093
		if (REP.IsDeathKnight) then
			if (REP.IsAlliance) then
				REP_AddQuest(1098, 4, 8, 13793, 325) -- Among the Champions QuestID: 13793
				REP_AddQuest(1098, 4, 8, 13864, 325) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1098, 4, 8, 13791, 325) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1098, 4, 8, 13788, 250) -- Threat From Above QuestID: 13788
			else
				REP_AddQuest(1098, 4, 8, 13814, 325) -- Among the Champions QuestID: 13814
				REP_AddQuest(1098, 4, 8, 13863, 325) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1098, 4, 8, 13813, 325) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1098, 4, 8, 13812, 250) -- Threat From Above QuestID: 13812
			end
		end
		if (not REP.AfterMoP) then
			---- Items
			REP_AddItems(1098, 4, 8, 400, {[44713] = 1}) -- Knights of the Ebon Blade Commendation Badge
		else
			-- Timewalking Commendation
			REP_AddItems(1098, 1, 8, 500, {[129941] = 1})
		end
		---- General
		REP_AddGeneral(1098, 5, 8, "Killing mobs in instances while wearing the Knights of the Ebon Blade tabard.", 5, "Killing mobs in instances while wearing the Knights of the Ebon Blade tabard.", "Killing mobs in instances while wearing the Knights of the Ebon Blade tabard will reward you roughly 5 reputation per kill.")

		---------------------------
		-- The Ashen Verdict 1156 --
		---------------------------
		---- Instances
		REP_AddInstance(1156, 4, 8, zone.Icecrown_Citadel, 2070, false)
		REP_AddInstance(1156, 4, 8, zone.Icecrown_Citadel, 1005, false)

		---------------------------
		-- The Kalu'ak 1073 --
		---------------------------
		---- Quests
		REP_AddQuest(1073, 4, 8, 11945, 500, {[35711] = 8}) -- Preparing for the Worst QuestID: 11945
		REP_AddQuest(1073, 4, 8, 11960, 500, {[35692] = 12}) -- Planning for the Future QuestID: 11960
		REP_AddQuest(1073, 4, 8, 11472, 500) -- The Way to His Heart... QuestID: 11472

		---------------------------
		-- The Sons of Hodir 1119 --
		---------------------------
		---- Quests
		REP_AddQuest(1119, 5, 8, 13559, 500, {[42780] = 10}) -- Hodir's Tribute QuestID: 13559
		REP_AddQuest(1119, 5, 8, 13421, 350, {[44724] = 1}) -- Remember Everfrost! QuestID: 13421
		REP_AddQuest(1119, 5, 8, 13006, 350, {[42640] = 5}) -- A Viscous Cleaning QuestID: 13006
		REP_AddQuest(1119, 5, 8, 12981, 350, {[42252] = 6}) -- Hot and Cold QuestID: 12981
		REP_AddQuest(1119, 5, 8, 12977, 350) -- Hodir's Call QuestID: 12977
		REP_AddQuest(1119, 6, 8, 12994, 350) -- Spy Hunter QuestID: 12994
		REP_AddQuest(1119, 6, 8, 13003, 500) -- How To Slay Your Dragon QuestID: 13003
		REP_AddQuest(1119, 7, 8, 13046, 350) -- Feeding Arngrim QuestID: 13046
		if (not REP.AfterMoP) then
			---- Items
			REP_AddItems(1119, 4, 8, 400, {[49702] = 1}) -- The Sons of Hodir Commendation Badge
		else
			-- Timewalking Commendation
			REP_AddItems(1119, 1, 8, 501, {[129943] = 1})
		end

		---------------------------
		-- The Wyrmrest Accord 1091 --
		---------------------------
		---- Quests
		REP_AddQuest(1091, 4, 8, 11940, 250) -- Drake Hunt QuestID: 11940
		REP_AddQuest(1091, 4, 8, 12372, 250) -- Defending Wyrmrest Temple QuestID: 12372
		REP_AddQuest(1091, 4, 8, 13414, 250) -- Aces High! QuestID: 13414
		if (not REP.AfterMoP) then
			---- Items
			REP_AddItems(1091, 4, 8, 400, {[44710] = 1}) -- The Wyrmrest Accord Commendation Badge
		else
			-- Timewalking Commendation
			REP_AddItems(1091, 1, 8, 500, {[129944] = 1})
		end
		---- General
		REP_AddGeneral(1091, 5, 8, "Killing mobs in instances while wearing The Wyrmrest Accord tabard.", 5, "Killing mobs in instances while wearing The Wyrmrest Accord tabard.", "Killing mobs in instances while wearing The Wyrmrest Accord tabard will reward you roughly 5 reputation per kill.")
		---- TODO: Double check what this instance rep was.
		if (REP.IsCata) then
			---- Instances
			REP_AddInstance(1091, 5, 8, 5, 800, false)
			REP_AddInstance(1091, 5, 8, 5, 2000, true)
		end

		---------------------------
		-- Frenzyheart Tribe 1104 --
		---------------------------
		---- Quests
		REP_AddQuest(1104, 1, 5, 12582, 51000) -- Frenzyheart Champion QuestID: 12582
		REP_AddQuest(1104, 6, 8, 12703, 700) -- Kartak's Rampage QuestID: 12703
		REP_AddQuest(1104, 6, 8, 12759, 700) -- Tools of War QuestID: 12759
		REP_AddQuest(1104, 6, 8, 12760, 700) -- Secret Strength of the Frenzyheart QuestID: 12760
		REP_AddQuest(1104, 6, 8, 12758, 500) -- A Hero's Headgear QuestID: 12758
		REP_AddQuest(1104, 6, 8, 12702, 500) -- Chicken Party! QuestID: 12702
		REP_AddQuest(1104, 6, 8, 12734, 500) -- Rejek: First Blood QuestID: 12734
		REP_AddQuest(1104, 6, 8, 12741, 500) -- Strength of the Tempest QuestID: 12741
		REP_AddQuest(1104, 6, 8, 12732, 500) -- The Heartblood's Strength QuestID: 12732

		---------------------------
		-- The Oracles 1105 --
		---------------------------
		---- Quests
		REP_AddQuest(1105, 1, 5, 12689, 51000) -- Hand of the Oracles QuestID: 12689
		REP_AddQuest(1105, 6, 8, 12761, 700) -- Mastery of the Crystals QuestID: 12761
		REP_AddQuest(1105, 6, 8, 12705, 700) -- Will of the Titans QuestID: 12705
		REP_AddQuest(1105, 6, 8, 12762, 700) -- Power of the Great Ones QuestID: 12762
		REP_AddQuest(1105, 6, 8, 12704, 500) -- Appeasing the Great Rain Stone QuestID: 12704
		REP_AddQuest(1105, 6, 8, 12735, 500) -- A Cleansing Song QuestID: 12735
		REP_AddQuest(1105, 6, 8, 12737, 500) -- Song of Fecundity QuestID: 12737
		REP_AddQuest(1105, 6, 8, 12736, 500) -- Song of Reflection QuestID: 12736
		REP_AddQuest(1105, 6, 8, 12726, 500) -- Song of Wind and Water QuestID: 12726

		if (REP.IsAlliance) then
			---------------------------
			-- Alliance Vanguard 1037
			---------------------------
			---- Quests
			REP_AddQuest(1037, 4, 8, 11391, 62.5) -- Steel Gate Patrol QuestID: 11391
			REP_AddQuest(1037, 4, 8, 12869, 62.5) -- Pushed Too Far QuestID: 12869
			REP_AddQuest(1037, 4, 8, 13671, 62.5) -- Training In The Field QuestID: 13671
			REP_AddQuest(1037, 4, 8, 13625, 62.5) -- Learning The Reins QuestID: 13625
			REP_AddQuest(1037, 4, 8, 11153, 62.5) -- Break the Blockade QuestID: 11153
			REP_AddQuest(1037, 4, 8, 13309, 62.5) -- Assault by Air QuestID: 13309
			REP_AddQuest(1037, 4, 8, 13284, 62.5) -- Assault by Ground QuestID: 13284
			REP_AddQuest(1037, 4, 8, 13336, 62.5) -- Blood of the Chosen QuestID: 13336
			REP_AddQuest(1037, 4, 8, 13280, 62.5) -- King of the Mountain QuestID: 13280
			REP_AddQuest(1037, 4, 8, 12444, 62.5) -- Blackriver Skirmish QuestID: 12444
			REP_AddQuest(1037, 4, 8, 12296, 62.5) -- Life or Death QuestID: 12296
			REP_AddQuest(1037, 4, 8, 12289, 62.5) -- Kick 'Em While They're Down QuestID: 12289
			REP_AddQuest(1037, 4, 8, 12268, 62.5) -- Pieces Parts QuestID: 12268
			REP_AddQuest(1037, 4, 8, 12244, 62.5) -- Shredder Repair QuestID: 12244
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1037, 4, 8, 13666, 62.5) -- A Blade Fit For A Champion QuestID: 13666
			REP_AddQuest(1037, 4, 8, 33625, 62.5) -- The Edge Of Winter QuestID: 33625
			REP_AddQuest(1037, 4, 8, 13600, 62.5) -- A Worthy Weapon QuestID: 13600
			REP_AddQuest(1037, 4, 8, 13847, 62.5) -- At The Enemy's Gates QuestID: 13847
			REP_AddQuest(1037, 4, 8, 13665, 62.5) -- The Grand Melee QuestID: 13665
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1037, 4, 8, 13788, 125) -- Threat From Above QuestID: 13788
				REP_AddQuest(1037, 4, 8, 13791, 125) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1037, 4, 8, 13864, 125) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1037, 4, 8, 13793, 125) -- Among the Champions QuestID: 13793
			else
				REP_AddQuest(1037, 4, 8, 13682, 125) -- Threat From Above QuestID: 13682
				REP_AddQuest(1037, 4, 8, 13789, 125) -- Taking Battle To The Enemy QuestID: 13789
				REP_AddQuest(1037, 4, 8, 13861, 125) -- Battle Before The Citadel QuestID: 13861
				REP_AddQuest(1037, 4, 8, 13790, 125) -- Among the Champions QuestID: 13790
			end
			---- Instances
			-- REP_AddInstance(1037, 4, 8, 1, 400, false)
			REP_AddInstance(1037, 4, 8, 1, 3000, true)
			if (REP.AfterMoP) then
				-- Timewalking Commendation
				REP_AddItems(1037, 1, 8, 500, {[129955] = 1})
			end

			---------------------------
			-- Explorer's League 1068
			---------------------------
			---- Quests
			REP_AddQuest(1068, 4, 8, 11391, 125) -- Steel Gate Patrol QuestID: 11391
			REP_AddQuest(1068, 4, 8, 12869, 62.5) -- Pushed Too Far QuestID: 12869
			REP_AddQuest(1068, 4, 8, 13671, 62.5) -- Training In The Field QuestID: 13671
			REP_AddQuest(1068, 4, 8, 13625, 62.5) -- Learning The Reins QuestID: 13625
			REP_AddQuest(1068, 4, 8, 11153, 62.5) -- Break the Blockade QuestID: 11153
			REP_AddQuest(1068, 4, 8, 13309, 62.5) -- Assault by Air QuestID: 13309
			REP_AddQuest(1068, 4, 8, 13284, 62.5) -- Assault by Ground QuestID: 13284
			REP_AddQuest(1068, 4, 8, 13336, 62.5) -- Blood of the Chosen QuestID: 13336
			REP_AddQuest(1068, 4, 8, 13280, 62.5) -- King of the Mountain QuestID: 13280
			REP_AddQuest(1068, 4, 8, 12444, 62.5) -- Blackriver Skirmish QuestID: 12444
			REP_AddQuest(1068, 4, 8, 12296, 62.5) -- Life or Death QuestID: 12296
			REP_AddQuest(1068, 4, 8, 12289, 62.5) -- Kick 'Em While They're Down QuestID: 12289
			REP_AddQuest(1068, 4, 8, 12268, 62.5) -- Pieces Parts QuestID: 12268
			REP_AddQuest(1068, 4, 8, 12244, 62.5) -- Shredder Repair QuestID: 12244
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1068, 4, 8, 13666, 125) -- A Blade Fit For A Champion QuestID: 13666
			REP_AddQuest(1068, 4, 8, 33625, 125) -- The Edge Of Winter QuestID: 33625
			REP_AddQuest(1068, 4, 8, 13600, 125) -- A Worthy Weapon QuestID: 13600
			REP_AddQuest(1068, 4, 8, 13847, 125) -- At The Enemy's Gates QuestID: 13847
			REP_AddQuest(1068, 4, 8, 13665, 125) -- The Grand Melee QuestID: 13665
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1068, 4, 8, 13788, 125) -- Threat From Above QuestID: 13788
				REP_AddQuest(1068, 4, 8, 13791, 125) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1068, 4, 8, 13864, 125) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1068, 4, 8, 13793, 125) -- Among the Champions QuestID: 13793
			else
				REP_AddQuest(1068, 4, 8, 13682, 125) -- Threat From Above QuestID: 13682
				REP_AddQuest(1068, 4, 8, 13789, 125) -- Taking Battle To The Enemy QuestID: 13789
				REP_AddQuest(1068, 4, 8, 13861, 125) -- Battle Before The Citadel QuestID: 13861
				REP_AddQuest(1068, 4, 8, 13790, 125) -- Among the Champions QuestID: 13790
			end
			---- Instances
			-- REP_AddInstance(1068, 4, 8, 1, 400, false)
			REP_AddInstance(1068, 4, 8, 1, 1500, true)

			---------------------------
			-- The Frostborn 1126
			---------------------------
			---- Quests
			REP_AddQuest(1126, 4, 8, 11391, 62.5) -- Steel Gate Patrol QuestID: 11391
			REP_AddQuest(1126, 4, 8, 12869, 125) -- Pushed Too Far QuestID: 12869
			REP_AddQuest(1126, 4, 8, 13671, 62.5) -- Training In The Field QuestID: 13671
			REP_AddQuest(1126, 4, 8, 13625, 62.5) -- Learning The Reins QuestID: 13625
			REP_AddQuest(1126, 4, 8, 11153, 62.5) -- Break the Blockade QuestID: 11153
			REP_AddQuest(1126, 4, 8, 13309, 62.5) -- Assault by Air QuestID: 13309
			REP_AddQuest(1126, 4, 8, 13284, 62.5) -- Assault by Ground QuestID: 13284
			REP_AddQuest(1126, 4, 8, 13336, 62.5) -- Blood of the Chosen QuestID: 13336
			REP_AddQuest(1126, 4, 8, 13280, 62.5) -- King of the Mountain QuestID: 13280
			REP_AddQuest(1126, 4, 8, 12444, 62.5) -- Blackriver Skirmish QuestID: 12444
			REP_AddQuest(1126, 4, 8, 12296, 62.5) -- Life or Death QuestID: 12296
			REP_AddQuest(1126, 4, 8, 12289, 62.5) -- Kick 'Em While They're Down QuestID: 12289
			REP_AddQuest(1126, 4, 8, 12268, 62.5) -- Pieces Parts QuestID: 12268
			REP_AddQuest(1126, 4, 8, 12244, 62.5) -- Shredder Repair QuestID: 12244
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1126, 4, 8, 13666, 62.5) -- A Blade Fit For A Champion QuestID: 13666
			REP_AddQuest(1126, 4, 8, 33625, 62.5) -- The Edge Of Winter QuestID: 33625
			REP_AddQuest(1126, 4, 8, 13600, 62.5) -- A Worthy Weapon QuestID: 13600
			REP_AddQuest(1126, 4, 8, 13847, 62.5) -- At The Enemy's Gates QuestID: 13847
			REP_AddQuest(1126, 4, 8, 13665, 62.5) -- The Grand Melee QuestID: 13665
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1126, 4, 8, 13788, 125) -- Threat From Above QuestID: 13788
				REP_AddQuest(1126, 4, 8, 13791, 125) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1126, 4, 8, 13864, 125) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1126, 4, 8, 13793, 125) -- Among the Champions QuestID: 13793
			else
				REP_AddQuest(1126, 4, 8, 13682, 125) -- Threat From Above QuestID: 13682
				REP_AddQuest(1126, 4, 8, 13789, 125) -- Taking Battle To The Enemy QuestID: 13789
				REP_AddQuest(1126, 4, 8, 13861, 125) -- Battle Before The Citadel QuestID: 13861
				REP_AddQuest(1126, 4, 8, 13790, 125) -- Among the Champions QuestID: 13790
			end
			---- Instances
		  -- REP_AddInstance(1126, 4, 8, 1, 400, false)
		  REP_AddInstance(1126, 4, 8, 1, 1500, true)

			---------------------------
			-- The Silver Covenant 1094
			---------------------------
			---- Quests
			REP_AddQuest(1094, 4, 8, 11391, 62.5) -- Steel Gate Patrol QuestID:
			REP_AddQuest(1094, 4, 8, 12869, 62.5) -- Pushed Too Far QuestID: 12869
			REP_AddQuest(1094, 4, 8, 13759, 62.5) -- The Edge Of Winter QuestID: 13759
			REP_AddQuest(1094, 4, 8, 13671, 62.5) -- Training In The Field QuestID: 13671
			REP_AddQuest(1094, 4, 8, 13625, 62.5) -- Learning The Reins QuestID: 13625
			REP_AddQuest(1094, 4, 8, 11153, 62.5) -- Break the Blockade QuestID: 11153
			REP_AddQuest(1094, 4, 8, 13309, 62.5) -- Assault by Air QuestID: 13309
			REP_AddQuest(1094, 4, 8, 13284, 62.5) -- Assault by Ground QuestID: 13284
			REP_AddQuest(1094, 4, 8, 13336, 62.5) -- Blood of the Chosen QuestID: 13336
			REP_AddQuest(1094, 4, 8, 13280, 62.5) -- King of the Mountain QuestID: 13280
			REP_AddQuest(1094, 4, 8, 12444, 62.5) -- Blackriver Skirmish QuestID: 12444
			REP_AddQuest(1094, 4, 8, 12296, 62.5) -- Life or Death QuestID: 12296
			REP_AddQuest(1094, 4, 8, 12289, 62.5) -- Kick 'Em While They're Down QuestID: 12289
			REP_AddQuest(1094, 4, 8, 12268, 62.5) -- Pieces Parts QuestID: 12268
			REP_AddQuest(1094, 4, 8, 12244, 62.5) -- Shredder Repair QuestID: 12244
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1094, 4, 8, 13666, 62.5) -- A Blade Fit For A Champion QuestID: 13666
			REP_AddQuest(1094, 4, 8, 13600, 62.5) -- A Worthy Weapon QuestID: 13600
			REP_AddQuest(1094, 4, 8, 13847, 62.5) -- At The Enemy's Gates QuestID: 13847
			REP_AddQuest(1094, 4, 8, 13665, 62.5) -- The Grand Melee QuestID: 13665
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1094, 4, 8, 13788, 125) -- Threat From Above QuestID: 13788
				REP_AddQuest(1094, 4, 8, 13791, 125) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1094, 4, 8, 13864, 125) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1094, 4, 8, 13793, 125) -- Among the Champions QuestID: 13793
			else
				REP_AddQuest(1094, 4, 8, 13682, 125) -- Threat From Above QuestID: 13682
				REP_AddQuest(1094, 4, 8, 13789, 125) -- Taking Battle To The Enemy QuestID: 13789
				REP_AddQuest(1094, 4, 8, 13861, 125) -- Battle Before The Citadel QuestID: 13861
				REP_AddQuest(1094, 4, 8, 13790, 125) -- Among the Champions QuestID: 13790
			end
			---- Instances
		  -- REP_AddInstance(1094, 4, 8, 1, 400, false)
		  REP_AddInstance(1094, 4, 8, 1, 1500, true)

			---------------------------
			-- Valiance Expedition 1050
			---------------------------
			---- Quests
			REP_AddQuest(1050, 4, 8, 11391, 62.5) -- Steel Gate Patrol QuestID: 11391
			REP_AddQuest(1050, 4, 8, 12869, 125) -- Pushed Too Far QuestID: 12869
			REP_AddQuest(1050, 4, 8, 13671, 62.5) -- Training In The Field QuestID: 13671
			REP_AddQuest(1050, 4, 8, 13625, 62.5) -- Learning The Reins QuestID: 13625
			REP_AddQuest(1050, 4, 8, 11153, 62.5) -- Break the Blockade QuestID: 11153
			REP_AddQuest(1050, 4, 8, 13309, 62.5) -- Assault by Air QuestID: 13309
			REP_AddQuest(1050, 4, 8, 13284, 62.5) -- Assault by Ground QuestID: 13284
			REP_AddQuest(1050, 4, 8, 13336, 62.5) -- Blood of the Chosen QuestID: 13336
			REP_AddQuest(1050, 4, 8, 13280, 62.5) -- King of the Mountain QuestID: 13280
			REP_AddQuest(1050, 4, 8, 12444, 62.5) -- Blackriver Skirmish QuestID: 12444
			REP_AddQuest(1050, 4, 8, 12296, 62.5) -- Life or Death QuestID: 12296
			REP_AddQuest(1050, 4, 8, 12289, 62.5) -- Kick 'Em While They're Down QuestID: 12289
			REP_AddQuest(1050, 4, 8, 12268, 62.5) -- Pieces Parts QuestID: 12268
			REP_AddQuest(1050, 4, 8, 12244, 62.5) -- Shredder Repair QuestID: 12244
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1050, 4, 8, 13666, 62.5) -- A Blade Fit For A Champion QuestID: 13666
			REP_AddQuest(1050, 4, 8, 33625, 62.5) -- The Edge Of Winter QuestID: 33625
			REP_AddQuest(1050, 4, 8, 13600, 62.5) -- A Worthy Weapon QuestID: 13600
			REP_AddQuest(1050, 4, 8, 13847, 62.5) -- At The Enemy's Gates QuestID: 13847
			REP_AddQuest(1050, 4, 8, 13665, 62.5) -- The Grand Melee QuestID: 13665
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1050, 4, 8, 13788, 125) -- Threat From Above QuestID: 13788
				REP_AddQuest(1050, 4, 8, 13791, 125) -- Taking Battle To The Enemy QuestID: 13791
				REP_AddQuest(1050, 4, 8, 13864, 125) -- Battle Before The Citadel QuestID: 13864
				REP_AddQuest(1050, 4, 8, 13793, 125) -- Among the Champions QuestID: 13793
			else
				REP_AddQuest(1050, 4, 8, 13682, 125) -- Threat From Above QuestID: 13682
				REP_AddQuest(1050, 4, 8, 13789, 125) -- Taking Battle To The Enemy QuestID: 13789
				REP_AddQuest(1050, 4, 8, 13861, 125) -- Battle Before The Citadel QuestID: 13861
				REP_AddQuest(1050, 4, 8, 13790, 125) -- Among the Champions QuestID: 13790
			end
			---- Instances
		  -- REP_AddInstance(1050, 4, 8, 1, 400, false)
		  REP_AddInstance(1050, 4, 8, 1, 1500, true)
		else
			---------------------------
			-- Horde Expedition 1052
			---------------------------
			---- Quests
			REP_AddQuest(1052, 4, 8, 12170, 125) -- Blackriver Brawl QuestID: 12170
			REP_AddQuest(1052, 4, 8, 13677, 62.5) -- Learning The Reins QuestID: 13677
			REP_AddQuest(1052, 4, 8, 13676, 62.5) -- Training In The Field QuestID: 13676
			REP_AddQuest(1052, 4, 8, 12284, 62.5) -- Keep 'Em on Their Heels QuestID: 12284
			REP_AddQuest(1052, 4, 8, 12280, 62.5) -- Making Repairs QuestID: 12280
			REP_AddQuest(1052, 4, 8, 12288, 62.5) -- Overwhelmed! QuestID: 12288
			REP_AddQuest(1052, 4, 8, 12270, 62.5) -- Shred the Alliance QuestID: 12270
			REP_AddQuest(1052, 4, 8, 13310, 62.5) -- Assault by Air QuestID: 13310
			REP_AddQuest(1052, 4, 8, 13301, 62.5) -- Assault by Ground QuestID: 13301
			REP_AddQuest(1052, 4, 8, 13330, 62.5) -- Blood of the Chosen QuestID: 13330
			REP_AddQuest(1052, 4, 8, 13283, 62.5) -- King of the Mountain QuestID: 13283
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1052, 4, 8, 13673, 62.5) -- A Blade Fit For A Champion QuestID: 13673
			REP_AddQuest(1052, 4, 8, 13772, 62.5) -- The Grand Melee QuestID: 13772
			REP_AddQuest(1052, 4, 8, 13675, 62.5) -- The Edge Of Winter QuestID: 13675
			REP_AddQuest(1052, 4, 8, 13769, 62.5) -- A Worthy Weapon QuestID: 13769
			REP_AddQuest(1052, 4, 8, 13856, 62.5) -- At The Enemy's Gates QuestID: 13856
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1052, 4, 8, 13812, 125) -- Threat From Above QuestID: 13812
				REP_AddQuest(1052, 4, 8, 13813, 125) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1052, 4, 8, 13863, 125) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1052, 4, 8, 13814, 125) -- Among the Champions QuestID: 13814
			else
				REP_AddQuest(1052, 4, 8, 13809, 125) -- Threat From Above QuestID: 13809
				REP_AddQuest(1052, 4, 8, 13810, 125) -- Taking Battle To The Enemy QuestID: 13810
				REP_AddQuest(1052, 4, 8, 13862, 125) -- Battle Before The Citadel QuestID: 13862
				REP_AddQuest(1052, 4, 8, 13811, 125) -- Among the Champions QuestID: 13811
			end
			---- Instances
			-- REP_AddInstance(1052, 4, 8, 1, 400, false)
			REP_AddInstance(1052, 4, 8, 1, 3000, true)
			if (REP.AfterMoP) then
				---- Timewalking Commendation
				REP_AddItems(1052, 1, 8, 500, {[129954] = 1})
			end

			---------------------------
			-- The Hand of Vengeance 1067
			---------------------------
			---- Quests
			REP_AddQuest(1067, 4, 8, 12170, 125) -- Blackriver Brawl QuestID: 12170
			REP_AddQuest(1067, 4, 8, 13677, 62.5) -- Learning The Reins QuestID: 13677
			REP_AddQuest(1067, 4, 8, 13676, 62.5) -- Training In The Field QuestID: 13676
			REP_AddQuest(1067, 4, 8, 12284, 62.5) -- Keep 'Em on Their Heels QuestID: 12284
			REP_AddQuest(1067, 4, 8, 12280, 62.5) -- Making Repairs QuestID: 12280
			REP_AddQuest(1067, 4, 8, 12288, 62.5) -- Overwhelmed! QuestID: 12288
			REP_AddQuest(1067, 4, 8, 12270, 62.5) -- Shred the Alliance QuestID: 12270
			REP_AddQuest(1067, 4, 8, 13310, 62.5) -- Assault by Air QuestID: 13310
			REP_AddQuest(1067, 4, 8, 13301, 62.5) -- Assault by Ground QuestID: 13301
			REP_AddQuest(1067, 4, 8, 13330, 62.5) -- Blood of the Chosen QuestID: 13330
			REP_AddQuest(1067, 4, 8, 13283, 62.5) -- King of the Mountain QuestID: 13283
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1067, 4, 8, 13673, 62.5) -- A Blade Fit For A Champion QuestID: 13673
			REP_AddQuest(1067, 4, 8, 13772, 62.5) -- The Grand Melee QuestID: 13772
			REP_AddQuest(1067, 4, 8, 13675, 62.5) -- The Edge Of Winter QuestID: 13675
			REP_AddQuest(1067, 4, 8, 13769, 62.5) -- A Worthy Weapon QuestID: 13769
			REP_AddQuest(1067, 4, 8, 13856, 62.5) -- At The Enemy's Gates QuestID: 13856
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1067, 4, 8, 13812, 125) -- Threat From Above QuestID: 13812
				REP_AddQuest(1067, 4, 8, 13813, 125) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1067, 4, 8, 13863, 125) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1067, 4, 8, 13814, 125) -- Among the Champions QuestID: 13814
			else
				REP_AddQuest(1067, 4, 8, 13809, 125) -- Threat From Above QuestID: 13809
				REP_AddQuest(1067, 4, 8, 13810, 125) -- Taking Battle To The Enemy QuestID: 13810
				REP_AddQuest(1067, 4, 8, 13862, 125) -- Battle Before The Citadel QuestID: 13862
				REP_AddQuest(1067, 4, 8, 13811, 125) -- Among the Champions QuestID: 13811
			end
			---- Instances
			-- REP_AddInstance(1067, 4, 8, 1, 400, false)
			REP_AddInstance(1067, 4, 8, 1, 1500, true)

			---------------------------
			-- The Sunreavers 1124
			---------------------------
			---- Quests
			REP_AddQuest(1124, 4, 8, 12170, 125) -- Blackriver Brawl QuestID: 12170
			REP_AddQuest(1124, 4, 8, 13677, 62.5) -- Learning The Reins QuestID: 13677
			REP_AddQuest(1124, 4, 8, 13676, 62.5) -- Training In The Field QuestID: 13676
			REP_AddQuest(1124, 4, 8, 12284, 62.5) -- Keep 'Em on Their Heels QuestID: 12284
			REP_AddQuest(1124, 4, 8, 12280, 62.5) -- Making Repairs QuestID: 12280
			REP_AddQuest(1124, 4, 8, 12288, 62.5) -- Overwhelmed! QuestID: 12288
			REP_AddQuest(1124, 4, 8, 12270, 62.5) -- Shred the Alliance QuestID: 12270
			REP_AddQuest(1124, 4, 8, 13310, 62.5) -- Assault by Air QuestID: 13310
			REP_AddQuest(1124, 4, 8, 13301, 62.5) -- Assault by Ground QuestID: 13301
			REP_AddQuest(1124, 4, 8, 13330, 62.5) -- Blood of the Chosen QuestID: 13330
			REP_AddQuest(1124, 4, 8, 13283, 62.5) -- King of the Mountain QuestID: 13283
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1124, 4, 8, 13673, 62.5) -- A Blade Fit For A Champion QuestID: 13673
			REP_AddQuest(1124, 4, 8, 13772, 62.5) -- The Grand Melee QuestID: 13772
			REP_AddQuest(1124, 4, 8, 13675, 62.5) -- The Edge Of Winter QuestID: 13675
			REP_AddQuest(1124, 4, 8, 13769, 62.5) -- A Worthy Weapon QuestID: 13769
			REP_AddQuest(1124, 4, 8, 13856, 62.5) -- At The Enemy's Gates QuestID: 13856
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1124, 4, 8, 13812, 125) -- Threat From Above QuestID: 13812
				REP_AddQuest(1124, 4, 8, 13813, 125) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1124, 4, 8, 13863, 125) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1124, 4, 8, 13814, 125) -- Among the Champions QuestID: 13814
			else
				REP_AddQuest(1124, 4, 8, 13809, 125) -- Threat From Above QuestID: 13809
				REP_AddQuest(1124, 4, 8, 13810, 125) -- Taking Battle To The Enemy QuestID: 13810
				REP_AddQuest(1124, 4, 8, 13862, 125) -- Battle Before The Citadel QuestID: 13862
				REP_AddQuest(1124, 4, 8, 13811, 125) -- Among the Champions QuestID: 13811
			end
			---- Instances
			-- REP_AddInstance(1124, 4, 8, 1, 400, false)
			REP_AddInstance(1124, 4, 8, 1, 1500, true)

			---------------------------
			-- Warsong Offensive 1085
			---------------------------
			---- Quests
			REP_AddQuest(1085, 4, 8, 12170, 125) -- Blackriver Brawl QuestID: 12170
			REP_AddQuest(1085, 4, 8, 13677, 62.5) -- Learning The Reins QuestID: 13677
			REP_AddQuest(1085, 4, 8, 13676, 62.5) -- Training In The Field QuestID: 13676
			REP_AddQuest(1085, 4, 8, 12284, 62.5) -- Keep 'Em on Their Heels QuestID: 12284
			REP_AddQuest(1085, 4, 8, 12280, 62.5) -- Making Repairs QuestID: 12280
			REP_AddQuest(1085, 4, 8, 12288, 62.5) -- Overwhelmed! QuestID: 12288
			REP_AddQuest(1085, 4, 8, 12270, 62.5) -- Shred the Alliance QuestID: 12270
			REP_AddQuest(1085, 4, 8, 13310, 62.5) -- Assault by Air QuestID: 13310
			REP_AddQuest(1085, 4, 8, 13301, 62.5) -- Assault by Ground QuestID: 13301
			REP_AddQuest(1085, 4, 8, 13330, 62.5) -- Blood of the Chosen QuestID: 13330
			REP_AddQuest(1085, 4, 8, 13283, 62.5) -- King of the Mountain QuestID: 13283
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1085, 4, 8, 13673, 62.5) -- A Blade Fit For A Champion QuestID: 13673
			REP_AddQuest(1085, 4, 8, 13772, 62.5) -- The Grand Melee QuestID: 13772
			REP_AddQuest(1085, 4, 8, 13675, 62.5) -- The Edge Of Winter QuestID: 13675
			REP_AddQuest(1085, 4, 8, 13769, 62.5) -- A Worthy Weapon QuestID: 13769
			REP_AddQuest(1085, 4, 8, 13856, 62.5) -- At The Enemy's Gates QuestID: 13856
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1085, 4, 8, 13812, 125) -- Threat From Above QuestID: 13812
				REP_AddQuest(1085, 4, 8, 13813, 125) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1085, 4, 8, 13863, 125) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1085, 4, 8, 13814, 125) -- Among the Champions QuestID: 13814
			else
				REP_AddQuest(1085, 4, 8, 13809, 125) -- Threat From Above QuestID: 13809
				REP_AddQuest(1085, 4, 8, 13810, 125) -- Taking Battle To The Enemy QuestID: 13810
				REP_AddQuest(1085, 4, 8, 13862, 125) -- Battle Before The Citadel QuestID: 13862
				REP_AddQuest(1085, 4, 8, 13811, 125) -- Among the Champions QuestID: 13811
			end
			---- Instances
			-- REP_AddInstance(1085, 4, 8, 1, 400, false)
			REP_AddInstance(1085, 4, 8, 1, 1500, true)

			---------------------------
			-- The Taunka 1064
			---------------------------
			---- Quests
			REP_AddQuest(1064, 4, 8, 12170, 125) -- Blackriver Brawl QuestID: 12170
			REP_AddQuest(1064, 4, 8, 13677, 62.5) -- Learning The Reins QuestID: 13677
			REP_AddQuest(1064, 4, 8, 13676, 62.5) -- Training In The Field QuestID: 13676
			REP_AddQuest(1064, 4, 8, 12284, 62.5) -- Keep 'Em on Their Heels QuestID: 12284
			REP_AddQuest(1064, 4, 8, 12280, 62.5) -- Making Repairs QuestID: 12280
			REP_AddQuest(1064, 4, 8, 12288, 62.5) -- Overwhelmed! QuestID: 12288
			REP_AddQuest(1064, 4, 8, 12270, 62.5) -- Shred the Alliance QuestID: 12270
			REP_AddQuest(1064, 4, 8, 13310, 62.5) -- Assault by Air QuestID: 13310
			REP_AddQuest(1064, 4, 8, 13301, 62.5) -- Assault by Ground QuestID: 13301
			REP_AddQuest(1064, 4, 8, 13330, 62.5) -- Blood of the Chosen QuestID: 13330
			REP_AddQuest(1064, 4, 8, 13283, 62.5) -- King of the Mountain QuestID: 13283
			---- TODO: Check all the variants of this daily quest
			REP_AddQuest(1064, 4, 8, 13673, 62.5) -- A Blade Fit For A Champion QuestID: 13673
			REP_AddQuest(1064, 4, 8, 13772, 62.5) -- The Grand Melee QuestID: 13772
			REP_AddQuest(1064, 4, 8, 13675, 62.5) -- The Edge Of Winter QuestID: 13675
			REP_AddQuest(1064, 4, 8, 13769, 62.5) -- A Worthy Weapon QuestID: 13769
			REP_AddQuest(1064, 4, 8, 13856, 62.5) -- At The Enemy's Gates QuestID: 13856
			---- Tournament quests
			if (REP.IsDeathKnight) then
				REP_AddQuest(1064, 4, 8, 13812, 125) -- Threat From Above QuestID: 13812
				REP_AddQuest(1064, 4, 8, 13813, 125) -- Taking Battle To The Enemy QuestID: 13813
				REP_AddQuest(1064, 4, 8, 13863, 125) -- Battle Before The Citadel QuestID: 13863
				REP_AddQuest(1064, 4, 8, 13814, 125) -- Among the Champions QuestID: 13814
			else
				REP_AddQuest(1064, 4, 8, 13809, 125) -- Threat From Above QuestID: 13809
				REP_AddQuest(1064, 4, 8, 13810, 125) -- Taking Battle To The Enemy QuestID: 13810
				REP_AddQuest(1064, 4, 8, 13862, 125) -- Battle Before The Citadel QuestID: 13862
				REP_AddQuest(1064, 4, 8, 13811, 125) -- Among the Champions QuestID: 13811
			end
			---- Instances
			-- REP_AddInstance(1064, 4, 8, 1, 400, false)
			REP_AddInstance(1064, 4, 8, 1, 1500, true)
		end
	end

--------------------------------------------------
-- Factions released 'after' Wrath of the lich king
--------------------------------------------------
	if(REP.AfterWotlk) then
		---------------------------
		-- Guild 1168 --
		---------------------------
		---- General
    REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests.")
		REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins while wearing Guild Renown Tabard", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests while wearing the Guild Renown Tabard.", nil, nil, nil, 0.5)
    REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins while wearing Renowned Guild Renown Tabard", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests while wearing the Renowned Guild Renown Tabard.", nil, nil, nil, 1)

		---------------------------
		-- Avengers of Hyjal 1204 --
		---------------------------
		---- Mobs (TODO: Check if this should be REP_AddInstance)
		---- For FIRELAND "NORMAL"  ""HC UNKNOWN""
		---- (courtesy of Henrik H AKA Szereka <Vendredi> At HELLSCREAM-EU)
		REP_AddMob(1204, 4, 6, "Druid of the Flame", 5, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Cinderweb Spider", 5, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Fire Scorpion", 5, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Cinderweb Spinner", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Cinderweb Drone", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Fire Turtle Hatchling", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Beast Handler", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Cauterizer", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Forward Guard", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Hound Master", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Pathfinder", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Sentinel", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Taskmaster", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Trainee", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Giant Fire Scorpion", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Hell Hound", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Molten Surger", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Patriarch Fire Turtle", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Unbound Pyrelord", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Unbound Smoldering Elemental", 15, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Animator", 16, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Flamewalker Centurion", 16, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Harbringer of Flame", 16, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Matriarch Fire Turtle", 16, zone.Firelands)
		REP_AddMob(1204, 4, 6, "Unbound Blazing Elemental", 16, zone.Firelands)
		---- stop at friendly
		REP_AddMob(1204, 4, 7, "Ancient Core Hound", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Blazing Monstrosity", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Flame Archon", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Flamewalker Overseer", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Flamewalker Subjugator", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Kar the Everburning", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Molten Erupter", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Molten Flamefather", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Molten Lord", 50, zone.Firelands)
		REP_AddMob(1204, 4, 7, "Unstable Magma", 50, zone.Firelands)
		---- Stop at Honored
		REP_AddMob(1204, 4, 8, "Beth'tilac", 250, zone.Firelands)
		REP_AddMob(1204, 4, 8, "Lord Rhyolith", 250, zone.Firelands)
		REP_AddMob(1204, 4, 8, "Shannox", 250, zone.Firelands)
		REP_AddMob(1204, 4, 8, "Majordomo Staghelm", 400, zone.Firelands)

		---------------------------
		-- Guardians of Hyjal 1158 --
		---------------------------
		---- Quests
    if REP.ShowCataPhaseTwo then
      REP_AddQuest(1158, 4, 8, 29177, 250)
      REP_AddQuest(1158, 4, 8, 29163, 250)
      REP_AddQuest(1158, 4, 8, 29122, 250)
      REP_AddQuest(1158, 4, 8, 29162, 250)
      REP_AddQuest(1158, 4, 8, 29246, 250)
      REP_AddQuest(1158, 4, 8, 29148, 250)
      REP_AddQuest(1158, 4, 8, 29247, 250)
      REP_AddQuest(1158, 4, 8, 29165, 250)
      REP_AddQuest(1158, 4, 8, 29126, 250)
      REP_AddQuest(1158, 4, 8, 29248, 250)
      REP_AddQuest(1158, 4, 8, 29128, 350)
      REP_AddQuest(1158, 4, 8, 29138, 250)
      REP_AddQuest(1158, 4, 8, 29179, 250)
      REP_AddQuest(1158, 4, 8, 29141, 250)
      REP_AddQuest(1158, 4, 8, 29139, 250)
      REP_AddQuest(1158, 4, 8, 29304, 250)
      REP_AddQuest(1158, 4, 8, 29137, 250)
      REP_AddQuest(1158, 4, 8, 29143, 250)
      REP_AddQuest(1158, 4, 8, 29142, 250)
      REP_AddQuest(1158, 4, 8, 29101, 150)
      REP_AddQuest(1158, 4, 8, 29161, 150)
      REP_AddQuest(1158, 4, 8, 29147, 150)
      REP_AddQuest(1158, 4, 8, 29164, 150)
      REP_AddQuest(1158, 4, 8, 29125, 150)
    end
		---- Mobs
		REP_AddMob(1158, 1, 8, 1, 10, 7)
		REP_AddMob(1158, 1, 8, 1, 15, 8)
		REP_AddMob(1158, 1, 8, 4, 150, 7)
		REP_AddMob(1158, 1, 8, 4, 250, 8)
		---- Instances
		-- REP_AddInstance(1158, 4, 8, 5, 1000, false)
		-- REP_AddInstance(1158, 4, 8, 5, 1800, true)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1158, 1, 8, 500, {[133152] = 1})
		end

		---------------------------
		-- Ramkahen 1173 --
		---------------------------
		---- Spells
		-- REP_AddSpell(1173, 1, 8, 5, 1000)
		-- REP_AddSpell(1173, 1, 8, 5, 1800)
		---- Mobs
		REP_AddMob(1173, 1, 8, 1, 10, 7)
		REP_AddMob(1173, 1, 8, 1, 15, 8)
		REP_AddMob(1173, 1, 8, 4, 150, 7)
		REP_AddMob(1173, 1, 8, 4, 250, 8)
		---- Quests
		REP_AddQuest(1173, 4, 8, 28250, 150)
		REP_AddQuest(1173, 4, 8, 28736, 250)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1173, 1, 8, 500, {[133154] = 1})
		end

		---------------------------
		-- The Earthen Ring 1135 --
		---------------------------
		---- Spells
		-- REP_AddSpell(1135, 1, 8, 5, 1000)
		-- REP_AddSpell(1135, 1, 8, 5, 1800)
		---- Mobs
		REP_AddMob(1135, 1, 8, 1, 10, 7)
		REP_AddMob(1135, 1, 8, 1, 15, 8)
		REP_AddMob(1135, 1, 8, 4, 150, 7)
		REP_AddMob(1135, 1, 8, 4, 250, 8)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1135, 1, 8, 500, {[133159] = 1})
		end

		---------------------------
		-- Therazane 1171 --
		---------------------------
		---- Spells
		-- REP_AddSpell(1171, 1, 8, 5, 1000)
		-- REP_AddSpell(1171, 1, 8, 5, 1800)
		---- Mobs
    REP_AddMob(1171, 1, 4, "Twilight Duskwarden", 5, zone.Deepholm)
    REP_AddMob(1171, 1, 4, "Twilight Laborer", 5, zone.Deepholm)
    REP_AddMob(1171, 1, 4, "Twilight Priestess", 5, zone.Deepholm)
    REP_AddMob(1171, 1, 4, "Dragul Giantbutcher", 10, zone.Deepholm)
		REP_AddMob(1171, 4, 8, 1, 10, 7)
		REP_AddMob(1171, 4, 8, 1, 15, 8)
		REP_AddMob(1171, 4, 8, 4, 150, 7)
		REP_AddMob(1171, 4, 8, 4, 250, 8)
		---- Quests
		REP_AddQuest(1171, 4, 8, 28488, 250)
		REP_AddQuest(1171, 4, 8, 27046, 250)
		REP_AddQuest(1171, 4, 8, 26710, 250)
		REP_AddQuest(1171, 4, 8, 27047, 250)
		REP_AddQuest(1171, 4, 8, 27049, 250)
		REP_AddQuest(1171, 4, 8, 27050, 250)
		REP_AddQuest(1171, 4, 8, 27051, 250)
		REP_AddQuest(1171, 4, 8, 27048, 250)
		REP_AddQuest(1171, 5, 8, 28390, 350)
		REP_AddQuest(1171, 5, 8, 28391, 350)
		if(REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1171, 1, 8, 500, {[133160] = 1})
		end
    ---- General
    if (REP.IsHuman) then
      REP_AddGeneral(1171, 1, 6, "Completing the questline until 'The Stone Throne', will get you past revered.", 55000, "Complete the questline until 'The Stone Throne'.", "Completing the questline until 'The Stone Throne', will get you past revered.")
    else
      REP_AddGeneral(1171, 1, 6, "Completing the questline until 'The Stone Throne', will get you close to revered.", 55000, "Complete the questline until 'The Stone Throne'.", "Completing the questline until 'The Stone Throne', will get you close to revered.")
    end

		if (REP.IsAlliance) then
			---------------------------
			-- Wildhammer Clan 1174
			---------------------------
			---- Quests
			REP_AddQuest(1174, 4, 8, 28864, 250)
			REP_AddQuest(1174, 4, 8, 28861, 250)
			REP_AddQuest(1174, 4, 8, 28860, 250)
			REP_AddQuest(1174, 4, 8, 28862, 250)
			REP_AddQuest(1174, 4, 8, 28863, 350)
			---- Mobs
			REP_AddMob(1174, 1, 8, 1, 10, 7)
			REP_AddMob(1174, 1, 8, 1, 15, 8)
			REP_AddMob(1174, 1, 8, 4, 150, 7)
			REP_AddMob(1174, 1, 8, 4, 250, 8)
			if(REP.AfterMoP) then
        -- Timewalking Commendation
        REP_AddItems(1174, 1, 8, 500, {[133151] = 1})
      end

			---------------------------
			-- Baradin's Wardens 1177
			---------------------------
			---- Quests
			---- Tol Barad Peninsula
      ---- Sergeant Gray
      REP_AddQuest(1177, 4, 8, 27991, 250) -- Taking the Overlook Back QuestID: 27991
      REP_AddQuest(1177, 4, 8, 27975, 250) -- WANTED: Foreman Wellson QuestID: 27975
      REP_AddQuest(1177, 4, 8, 28275, 250) -- Bombs Away! QuestID: 28275
      REP_AddQuest(1177, 4, 8, 27987, 250) -- Cannonball! QuestID: 27987
      REP_AddQuest(1177, 4, 8, 27978, 250) -- Ghostbuster QuestID: 27978
      REP_AddQuest(1177, 4, 8, 27973, 250) -- Watch Out For Splinters! QuestID: 27973
      ---- Commander Marcus Johnson
      REP_AddQuest(1177, 4, 8, 28063, 250) -- Leave No Weapon Behind QuestID: 28063
      REP_AddQuest(1177, 4, 8, 28130, 250) -- Not The Friendliest Town QuestID: 28130
      REP_AddQuest(1177, 4, 8, 28059, 250) -- Claiming The Keep QuestID: 28059
      REP_AddQuest(1177, 4, 8, 28137, 250) -- Teach A Man To Fish.... Or Steal QuestID: 28137
      -- REP_AddQuest(1177, 4, 8, 28065, 250) -- Walk A Mile In Their Shoes QuestID: 28065 (Seems to be removed from the game in patch 4.1.0 initially.)
      ---- Camp Coordinator Brack
		  REP_AddQuest(1177, 4, 8, 27948, 250) -- A Sticky Task QuestID: 27948
		  REP_AddQuest(1177, 4, 8, 27972, 250) -- Boosting Morale QuestID: 27972
		  REP_AddQuest(1177, 4, 8, 27970, 250) -- Captain P. Harris QuestID: 27970
		  REP_AddQuest(1177, 4, 8, 27971, 250) -- Rattling Their Cages QuestID: 27971
		  REP_AddQuest(1177, 4, 8, 28050, 350) -- Shark Tank QuestID: 28050
		  REP_AddQuest(1177, 4, 8, 27944, 250) -- Thinning the Brood QuestID: 27944
			---- Lieutenant Farnsworth
		  REP_AddQuest(1177, 4, 8, 28046, 250) -- Finish The Job QuestID: 28046
		  REP_AddQuest(1177, 4, 8, 27967, 250) -- First Lieutenant Connor QuestID: 27967
		  REP_AddQuest(1177, 4, 8, 27992, 250) -- Magnets, How Do They Work? QuestID: 27992
		  REP_AddQuest(1177, 4, 8, 27966, 250) -- Salvaging the Remains QuestID: 27966
		  REP_AddQuest(1177, 4, 8, 27949, 250) -- The Forgotten QuestID: 27949
      ---- Tol Barad Main
      ---- Sargeant Parker (Base Quests)
      REP_AddQuest(1177, 4, 8, 28122, 350) -- A Huge Problem QuestID: 28122
      REP_AddQuest(1177, 4, 8, 28162, 350) -- Swamp Bait QuestID: 28162
      REP_AddQuest(1177, 4, 8, 28163, 350) -- The Leftovers QuestID: 28163
      ---- 2nd Lieutenant Wansworth (Left Prison)
      REP_AddQuest(1177, 4, 8, 28186, 350) -- Cursed Shackles QuestID: 28186
      REP_AddQuest(1177, 4, 8, 28165, 350) -- D-Block QuestID: 28165
      REP_AddQuest(1177, 4, 8, 28185, 350) -- Svarnos QuestID: 28185
      ---- Commander Stevens (Right Prison)
      REP_AddQuest(1177, 4, 8, 28117, 350) -- Clearing the Depths QuestID: 28117
      REP_AddQuest(1177, 4, 8, 28120, 350) -- Learning From The Past QuestID: 28120
      REP_AddQuest(1177, 4, 8, 28118, 350) -- The Imprisoned Archmage QuestID: 28118
      ---- Marshl Fallows (South Prison)
      REP_AddQuest(1177, 4, 8, 28232, 350) -- Food From Below QuestID: 28232
      REP_AddQuest(1177, 4, 8, 28188, 350) -- Prison Revolt QuestID: 28188
      REP_AddQuest(1177, 4, 8, 28223, 350) -- The Warden QuestID: 28223
      ---- Items
      REP_AddItems(1177, 4, 8, 250, {[63517] = 1})

			---------------------------
			-- Gilneas 1134
			---------------------------
			---- Quests
			REP_AddQuest(1134,4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(1134,4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
			---- General
      REP_AddGeneral(1134, 4, 8, "Killing (grey level) mobs in instances while wearing the Gilneas tabard.", 3, "Killing (grey level) mobs in instances while wearing the Gilneas tabard.", "Killing (grey level) mobs in instances while wearing the Gilneas tabard will reward you roughly 3 base reputation per kill.")
			REP_AddGeneral(1134, 4, 8, "Killing (grey level) bosses in instances while wearing the Gilneas tabard.", 60, "Killing (grey level) bosses in instances while wearing the Gilneas tabard.", "Killing (grey level) bosses in instances while wearing the Gilneas tabard will reward you roughly 60 base reputation per kill.")
      REP_AddGeneral(1134, 4, 8, "Killing (green or higher level) mobs in instances while wearing the Gilneas tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Gilneas tabard.", "Killing (green or higher level) mobs in instances while wearing the Gilneas tabard will reward you roughly 15 base reputation per kill.")
      REP_AddGeneral(1134, 4, 8, "Killing (green or higher level) bosses in instances while wearing the Gilneas tabard.", 300, "Killing (green or higher level) bosses in instances while wearing the Gilneas tabard.", "Killing (green or higher level) bosses in instances while wearing the Gilneas tabard will reward you roughly 300 base reputation per kill.")
		else
			---------------------------
			-- Bilgewater Cartel 1133
			---------------------------
			---- General quests
			REP_AddQuest(1133, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(1133, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
			---- General
			REP_AddGeneral(1133, 4, 8, "Killing (grey level) mobs in instances while wearing the Bilgewater Cartel tabard.", 3, "Killing (grey level) mobs in instances while wearing the Bilgewater Cartel tabard.", "Killing (grey level) mobs in instances while wearing the Bilgewater Cartel tabard will reward you roughly 3 reputation per kill.")
      REP_AddGeneral(1133, 4, 8, "Killing (grey level) bosses in instances while wearing the Bilgewater Cartel tabard.", 60, "Killing (grey level) bosses in instances while wearing the Bilgewater Cartel tabard.", "Killing (grey level) bosses in instances while wearing the Bilgewater Cartel tabard will reward you roughly 60 reputation per kill.")
      REP_AddGeneral(1133, 4, 8, "Killing (green or higher level) mobs in instances while wearing the Bilgewater Cartel tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Bilgewater Cartel tabard.", "Killing (green or higher level) mobs in instances while wearing the Bilgewater Cartel tabard will reward you roughly 15 reputation per kill.")
      REP_AddGeneral(1133, 4, 8, "Killing (green or higher level) bosses in instances while wearing the Bilgewater Cartel tabard.", 300, "Killing (green or higher level) bosses in instances while wearing the Bilgewater Cartel tabard.", "Killing (green or higher level) bosses in instances while wearing the Bilgewater Cartel tabard will reward you roughly 300 base reputation per kill.")

			---------------------------
			-- Dragonmaw Clan 1172
			---------------------------
			---- Quests
		  REP_AddQuest(1172, 4, 8, 28873, 250)
		  REP_AddQuest(1172, 4, 8, 28875, 350)
		  REP_AddQuest(1172, 4, 8, 28871, 250)
		  REP_AddQuest(1172, 4, 8, 28874, 250)
		  REP_AddQuest(1172, 4, 8, 28872, 250)
			---- Mobs
		  REP_AddMob(1172, 1, 8, 1, 10, 5)
		  REP_AddMob(1172, 1, 8, 1, 15, 6)
		  REP_AddMob(1172, 1, 8, 4, 150, 5)
		  REP_AddMob(1172, 1, 8, 4, 250, 6)
			if(REP.AfterMoP) then
			  -- Timewalking Commendation
			  REP_AddItems(1172, 1, 8, 500, {[133150] = 1})
			end

			---------------------------
			-- Hellscream's Reach 1178
			---------------------------
      ---- Quests
			---- Tol Barad Peninsula
      ---- Private Sarlosk
      REP_AddQuest(1178, 4, 8, 28700, 250) -- Taking the Overlook Back QuestID: 28700
      REP_AddQuest(1178, 4, 8, 28695, 250) -- WANTED: Foreman Wellson QuestID: 28695
      REP_AddQuest(1178, 4, 8, 28696, 250) -- Bombs Away! QuestID: 28696
      REP_AddQuest(1178, 4, 8, 28698, 250) -- Cannonball! QuestID: 28698
      REP_AddQuest(1178, 4, 8, 28697, 250) -- Ghostbuster QuestID: 28697
      REP_AddQuest(1178, 4, 8, 28694, 250) -- Watch Out For Splinters! QuestID: 28694
      ---- Commander Larmash
      REP_AddQuest(1178, 4, 8, 28685, 250) -- Leave No Weapon Behind QuestID: 28685
      REP_AddQuest(1178, 4, 8, 28686, 250) -- Not The Friendliest Town QuestID: 28686
      REP_AddQuest(1178, 4, 8, 28682, 250) -- Claiming The Keep QuestID: 28682
      REP_AddQuest(1178, 4, 8, 28687, 250) -- Teach A Man To Fish.... Or Steal QuestID: 28687
      -- REP_AddQuest(1178, 4, 8, 28721, 250) -- Walk A Mile In Their Shoes QuestID: 28721 (Seems to be removed from the game in patch 4.1.0 initially.)
      ---- 3rd Officer Kronkar
		  REP_AddQuest(1178, 4, 8, 28684, 250) -- A Sticky Task QuestID: 28684
		  REP_AddQuest(1178, 4, 8, 28680, 250) -- Boosting Morale QuestID: 28680
		  REP_AddQuest(1178, 4, 8, 28678, 250) -- Captain P. Harris QuestID: 28678
		  REP_AddQuest(1178, 4, 8, 28679, 250) -- Rattling Their Cages QuestID: 28679
		  REP_AddQuest(1178, 4, 8, 28681, 350) -- Shark Tank QuestID: 28681
		  REP_AddQuest(1178, 4, 8, 28683, 250) -- Thinning the Brood QuestID: 28683
			---- Captain Prug
		  REP_AddQuest(1178, 4, 8, 28693, 250) -- Finish The Job QuestID: 28693
		  REP_AddQuest(1178, 4, 8, 28691, 250) -- First Lieutenant Connor QuestID: 28691
		  REP_AddQuest(1178, 4, 8, 28692, 250) -- Magnets, How Do They Work? QuestID: 28692
		  REP_AddQuest(1178, 4, 8, 28690, 250) -- Salvaging the Remains QuestID: 28690
		  REP_AddQuest(1178, 4, 8, 28689, 250) -- The Forgotten QuestID: 28689
      ---- Tol Barad Main
      ---- Commander Zanoth
      REP_AddQuest(1178, 4, 8, 28657, 350) -- A Huge Problem QuestID: 28657
      REP_AddQuest(1178, 4, 8, 28658, 350) -- Swamp Bait QuestID: 28658
      REP_AddQuest(1178, 4, 8, 28659, 350) -- The Leftovers QuestID: 28659
      ---- Drillmaster Razgoth
      REP_AddQuest(1178, 4, 8, 28665, 350) -- Cursed Shackles QuestID: 28665
      REP_AddQuest(1178, 4, 8, 28663, 350) -- D-Block QuestID: 28663
      REP_AddQuest(1178, 4, 8, 28664, 350) -- Svarnos QuestID: 28664
      ---- Private Garnoth
      REP_AddQuest(1178, 4, 8, 28660, 350) -- Clearing the Depths QuestID: 28660
      REP_AddQuest(1178, 4, 8, 28662, 350) -- Learning From The Past QuestID: 28662
      REP_AddQuest(1178, 4, 8, 28661, 350) -- The Imprisoned Archmage QuestID: 28661
      ---- Staff Sergeant Lazgar
      REP_AddQuest(1178, 4, 8, 28670, 350) -- Food From Below QuestID: 28670
      REP_AddQuest(1178, 4, 8, 28668, 350) -- Prison Revolt QuestID: 28668
      REP_AddQuest(1178, 4, 8, 28669, 350) -- The Warden QuestID: 28669
      ---- Items
      REP_AddItems(1178, 4, 8, 250, {[63518] = 1})
		end
	end

--------------------------------------------------
-- Factions released 'after' Cataclysm
--------------------------------------------------
	if (REP.AfterCata) then
		---------------------------
		-- Golden Lotus 1269 --
		---------------------------
		---- Mobs
		REP_AddMob(1269, 1, 8, "All normal mobs", 20, zone.Vale_of_Eternal_Blossoms)
		REP_AddMob(1269, 1, 8, "All rare mobs", 400, zone.Vale_of_Eternal_Blossoms)
		REP_AddMob(1269, 1, 8, "Jade Colossus", 100, zone.Vale_of_Eternal_Blossoms)
		REP_AddMob(1269, 1, 8, "Milau", 60, zone.Vale_of_Eternal_Blossoms)
		---- Quests
		REP_AddQuest(1269, 1, 8, 30261, 350)
		REP_AddQuest(1269, 1, 8, 30242, 250)
		REP_AddQuest(1269, 1, 8, 30240, 250)
		REP_AddQuest(1269, 1, 8, 30306, 250)
		REP_AddQuest(1269, 1, 8, 30280, 250)
		REP_AddQuest(1269, 1, 8, 30277, 250)
		REP_AddQuest(1269, 1, 8, 30243, 250)
		REP_AddQuest(1269, 1, 8, 30266, 250)
		REP_AddQuest(1269, 1, 8, 32648, 300)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1269, 1, 8, 300, {[143937] = 1})
		end

		---------------------------
		-- Shado-Pan 1270 --
		---------------------------
		---- Quests
		REP_AddQuest(1270, 1, 8, 31198, 250)
		REP_AddQuest(1270, 1, 8, 31114, 250)
		REP_AddQuest(1270, 1, 8, 31113, 250)
		REP_AddQuest(1270, 1, 8, 31047, 250)
		REP_AddQuest(1270, 1, 8, 31044, 250)
		REP_AddQuest(1270, 1, 8, 31120, 250)
		REP_AddQuest(1270, 1, 8, 31043, 250)
		REP_AddQuest(1270, 1, 8, 31199, 250)
		REP_AddQuest(1270, 1, 8, 31041, 250)
		REP_AddQuest(1270, 1, 8, 31201, 250)
		REP_AddQuest(1270, 1, 8, 31200, 250)
		REP_AddQuest(1270, 1, 8, 31048, 250)
		REP_AddQuest(1270, 1, 8, 31045, 250)
		REP_AddQuest(1270, 1, 8, 31049, 250)
		REP_AddQuest(1270, 1, 8, 31046, 250)
		REP_AddQuest(1270, 1, 8, 31042, 250)
		REP_AddQuest(1270, 1, 8, 31061, 250)
		REP_AddQuest(1270, 1, 8, 31116, 250)
		REP_AddQuest(1270, 1, 8, 31040, 250)
		REP_AddQuest(1270, 1, 8, 31196, 250)
		REP_AddQuest(1270, 1, 8, 31204, 250)
		REP_AddQuest(1270, 1, 8, 31203, 250)
		REP_AddQuest(1270, 1, 8, 31197, 250)
		REP_AddQuest(1270, 1, 8, 31119, 250)
		REP_AddQuest(1270, 1, 8, 31039, 250)
		REP_AddQuest(1270, 1, 8, 31117, 250)
		REP_AddQuest(1270, 1, 8, 31062, 250)
		REP_AddQuest(1270, 1, 8, 32650, 300)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1270, 1, 8, 300, {[143936] = 1})
		end

		---------------------------
		-- The August Celestials 1341 --
		---------------------------
		---- Items
		REP_AddItems(1341, 1, 8, 1000, {[86592] = 1})
		---- Quests
		REP_AddQuest(1341, 1, 8, 32657, 1000)
		---- Quests (Krasarang Wilds)
		REP_AddQuest(1341, 1, 8, 30740, 250)
		REP_AddQuest(1341, 1, 8, 30716, 250)
		REP_AddQuest(1341, 1, 8, 30730, 350)
		REP_AddQuest(1341, 1, 8, 30725, 250)
		REP_AddQuest(1341, 1, 8, 30739, 350)
		REP_AddQuest(1341, 1, 8, 30727, 350)
		REP_AddQuest(1341, 1, 8, 30732, 350)
		REP_AddQuest(1341, 1, 8, 30728, 350)
		REP_AddQuest(1341, 1, 8, 30737, 350)
		REP_AddQuest(1341, 1, 8, 30717, 250)
		REP_AddQuest(1341, 1, 8, 30734, 350)
		REP_AddQuest(1341, 1, 8, 30273, 350)
		REP_AddQuest(1341, 1, 8, 30729, 250)
		REP_AddQuest(1341, 1, 8, 30731, 350)
		REP_AddQuest(1341, 1, 8, 30735, 250)
		REP_AddQuest(1341, 1, 8, 30726, 350)
		REP_AddQuest(1341, 1, 8, 30718, 350)
		REP_AddQuest(1341, 1, 8, 30738, 350)
		REP_AddQuest(1341, 1, 8, 30733, 350)
		REP_AddQuest(1341, 1, 8, 30736, 250)
		---- Quests (Kun-Lai Summit)
		REP_AddQuest(1341, 1, 8, 31517, 250)
		REP_AddQuest(1341, 1, 8, 30879, 250)
		REP_AddQuest(1341, 1, 8, 30880, 250)
		REP_AddQuest(1341, 1, 8, 30881, 250)
		REP_AddQuest(1341, 1, 8, 30882, 250)
		REP_AddQuest(1341, 1, 8, 30885, 250)
		REP_AddQuest(1341, 1, 8, 30883, 250)
		REP_AddQuest(1341, 1, 8, 30902, 250)
		REP_AddQuest(1341, 1, 8, 30907, 250)
		---- Quests (Townlong Steppes)
		REP_AddQuest(1341, 1, 8, 30065, 250)
		REP_AddQuest(1341, 1, 8, 30063, 250)
		REP_AddQuest(1341, 1, 8, 30068, 250)
		REP_AddQuest(1341, 1, 8, 30066, 250)
		REP_AddQuest(1341, 1, 8, 30064, 250)
		REP_AddQuest(1341, 1, 8, 30006, 250)
		REP_AddQuest(1341, 1, 8, 30067, 250)
		---- Quests (The Jade Forest)
		REP_AddQuest(1341, 1, 8, 30954, 250)
		REP_AddQuest(1341, 1, 8, 30953, 250)
		REP_AddQuest(1341, 1, 8, 30958, 250)
		REP_AddQuest(1341, 1, 8, 30925, 250)
		REP_AddQuest(1341, 1, 8, 30955, 250)
		REP_AddQuest(1341, 1, 8, 30959, 250)
		REP_AddQuest(1341, 1, 8, 30957, 250)
		REP_AddQuest(1341, 1, 8, 30956, 350)
		REP_AddQuest(1341, 1, 8, 30952, 300)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1341, 1, 8, 300, {[143938] = 1})
		end

		---------------------------
		-- The Klaxxi 1337 --
		---------------------------
		---- Quests
		REP_AddQuest(1337, 1, 8, 31268, 130, {[85885] = 3})
		REP_AddQuest(1337, 4, 8, 31603, 250, {[87903] = 5})
		REP_AddQuest(1337, 1, 8, 31808, 130)
		REP_AddQuest(1337, 1, 8, 31232, 130)
		REP_AddQuest(1337, 1, 8, 31270, 130)
		REP_AddQuest(1337, 1, 8, 31271, 130)
		REP_AddQuest(1337, 1, 8, 31238, 130)
		REP_AddQuest(1337, 1, 8, 31109, 130)
		REP_AddQuest(1337, 1, 8, 31216, 130)
		REP_AddQuest(1337, 1, 8, 31237, 130)
		REP_AddQuest(1337, 1, 8, 31231, 130)
		REP_AddQuest(1337, 1, 8, 31111, 130)
		REP_AddQuest(1337, 1, 8, 31509, 130)
		REP_AddQuest(1337, 1, 8, 31494, 130)
		REP_AddQuest(1337, 1, 8, 31272, 130)
		REP_AddQuest(1337, 1, 8, 31024, 130)
		REP_AddQuest(1337, 1, 8, 31598, 130)
		REP_AddQuest(1337, 1, 8, 31507, 130)
		REP_AddQuest(1337, 1, 8, 31267, 130)
		REP_AddQuest(1337, 1, 8, 31235, 130)
		REP_AddQuest(1337, 1, 8, 31504, 130)
		REP_AddQuest(1337, 1, 8, 31234, 130)
		REP_AddQuest(1337, 1, 8, 31510, 130)
		REP_AddQuest(1337, 1, 8, 31496, 130)
		REP_AddQuest(1337, 1, 8, 31233, 130)
		REP_AddQuest(1337, 1, 8, 31506, 130)
		REP_AddQuest(1337, 1, 8, 31503, 130)
		REP_AddQuest(1337, 1, 8, 31487, 130)
		REP_AddQuest(1337, 1, 8, 31508, 130)
		REP_AddQuest(1337, 1, 8, 31599, 130)
		REP_AddQuest(1337, 1, 8, 31269, 130)
		REP_AddQuest(1337, 1, 8, 31505, 130)
		REP_AddQuest(1337, 1, 8, 31502, 130)
		REP_AddQuest(1337, 1, 8, 31677, 130)
		REP_AddQuest(1337, 1, 8, 32659, 400)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1337, 1, 8, 300, {[143935] = 1})
		end

		---------------------------
		-- Order of the Cloud Serpent 1271 --
		---------------------------
		---- Items
		REP_AddItems(1271, 1, 8, 1000, {[86592] = 1})
		REP_AddItems(1271, 4, 8, 500, {[89155] = 1})
		---- Quests (Jenova Longeye - Main Quests)
		REP_AddQuest(1271, 1, 8, 30149, 125)
		REP_AddQuest(1271, 1, 8, 30147, 125)
		REP_AddQuest(1271, 1, 8, 30148, 125)
		REP_AddQuest(1271, 1, 8, 30146, 125)
		---- Quests (Instructor Skythorn)
		REP_AddQuest(1271, 1, 8, 31707, 450)
		REP_AddQuest(1271, 1, 8, 30158, 450)
		REP_AddQuest(1271, 1, 8, 30155, 450)
		REP_AddQuest(1271, 1, 8, 31698, 450)
		REP_AddQuest(1271, 1, 8, 31706, 450)
		---- Quests (Your Hatchling)
		REP_AddQuest(1271, 1, 8, 30151, 450)
		REP_AddQuest(1271, 1, 8, 30156, 450)
		REP_AddQuest(1271, 1, 8, 31704, 450)
		REP_AddQuest(1271, 1, 8, 31708, 450)
		REP_AddQuest(1271, 1, 8, 30150, 450)
		REP_AddQuest(1271, 1, 8, 30154, 450)
		REP_AddQuest(1271, 1, 8, 31710, 450)
		---- Quests (Elder Anli <Serpent Master>)
		REP_AddQuest(1271, 1, 8, 31701, 600)
		REP_AddQuest(1271, 1, 8, 30157, 450)
		REP_AddQuest(1271, 1, 8, 31709, 450)
		REP_AddQuest(1271, 1, 8, 31703, 600)
		REP_AddQuest(1271, 1, 8, 31712, 450)
		REP_AddQuest(1271, 1, 8, 31705, 600)
		REP_AddQuest(1271, 1, 8, 31702, 600)
		REP_AddQuest(1271, 1, 8, 30159, 450)
		REP_AddQuest(1271, 1, 8, 31714, 450)
		REP_AddQuest(1271, 1, 8, 31194, 600)
		REP_AddQuest(1271, 1, 8, 31699, 450)
		REP_AddQuest(1271, 1, 8, 31713, 450)
		REP_AddQuest(1271, 1, 8, 31715, 600)
		REP_AddQuest(1271, 1, 8, 31711, 600)
		REP_AddQuest(1271, 1, 8, 31700, 450)
		REP_AddQuest(1271, 1, 8, 30152, 600)
		REP_AddQuest(1271, 1, 8, 31718, 450)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1271, 1, 8, 300, {[143942] = 1})
		end

		---------------------------
		-- Shang Xi's Academy 1216 --
		---------------------------
		---- Quests
		REP_AddQuest(1216, 1, 8, 5, 1)

		---------------------------
		-- The Black Prince 1359 --
		---------------------------
		---- Mobs
		REP_AddMob(1359, 1, 7, "Granite Quilen", 10)
		REP_AddMob(1359, 1, 7, "Shao-Tien Marauder", 10)
		REP_AddMob(1359, 1, 7, "Kor'thik Warcaller", 100)
		REP_AddMob(1359, 1, 7, "Rare Mobs", 400, "928")
		---- General
		REP_AddGeneral(1359, 1, 8, "Timeless Isle Celestial World Boss", 500, "Timeless Isle Celestial World Boss", "Complete Timless Isle Celestial world boss once a week")

		---------------------------
		-- The Lorewalkers 1345 --
		---------------------------
		---- General
		REP_AddGeneral(1345, 1, 8, "Scroll Quests", 4100, "Complete all scroll quests", "Complete all the scroll quests collected within Pandaria. Each scroll is tied to an achievement, finishing the achievement will have quest item mailed")

		---------------------------
		-- The Anglers 1302 --
		---------------------------
		---- Quests
		REP_AddQuest(1302, 1, 8, 30613, 500)
		REP_AddQuest(1302, 1, 8, 30754, 500)
		REP_AddQuest(1302, 1, 8, 30588, 500)
		REP_AddQuest(1302, 1, 8, 31443, 350, {[86542] = 1})
		REP_AddQuest(1302, 1, 8, 30658, 500)
		REP_AddQuest(1302, 1, 8, 30586, 500)
		REP_AddQuest(1302, 1, 8, 30753, 500)
		REP_AddQuest(1302, 1, 8, 30678, 500)
		REP_AddQuest(1302, 1, 8, 31446, 350, {[86545] = 1})
		REP_AddQuest(1302, 1, 8, 30763, 500)
		REP_AddQuest(1302, 1, 8, 30698, 500)
		REP_AddQuest(1302, 1, 8, 30584, 500)
		REP_AddQuest(1302, 1, 8, 30700, 500)
		REP_AddQuest(1302, 1, 8, 31444, 350, {[86544] = 1})
		REP_AddQuest(1302, 1, 8, 30701, 500)
		REP_AddQuest(1302, 1, 8, 30585, 500)
		REP_AddQuest(1302, 1, 8, 30598, 500)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1302, 1, 8, 300, {[143946] = 1})
		end

		---------------------------
		-- Nat Pagle 1358 --
		---------------------------
		---- Quests
		REP_AddQuest(1358, 1, 8, 36804, 350, {[116820] = 1})
		REP_AddQuest(1358, 1, 8, 39283, 350, {[127994] = 1})
		REP_AddQuest(1358, 1, 8, 36800, 350, {[116819] = 1})
		REP_AddQuest(1358, 1, 8, 36802, 350, {[116818] = 1})
		REP_AddQuest(1358, 1, 8, 36805, 350, {[116821] = 1})
		REP_AddQuest(1358, 1, 8, 38406, 350, {[122696] = 1})
		REP_AddQuest(1358, 1, 8, 36803, 350, {[116817] = 1})
		REP_AddQuest(1358, 1, 8, 36806, 350, {[116822] = 1})
		REP_AddQuest(1358, 1, 8, 31443, 600, {[86542] = 1})
		REP_AddQuest(1358, 1, 8, 31444, 600, {[86544] = 1})
		REP_AddQuest(1358, 1, 8, 31446, 600, {[86545] = 1})

		---------------------------
		-- The Tillers 1272 --
		---------------------------
		---- General
		REP_AddGeneral(1272, 1, 8, "1", 50, "1", "0", nil, 0)
		---- Quests (Farmer Yoon)
		REP_AddQuest(1272, 1, 8, 30337, 1000)
		REP_AddQuest(1272, 1, 8, 30335, 1000)
		REP_AddQuest(1272, 1, 8, 30334, 1000)
		REP_AddQuest(1272, 1, 8, 30336, 1000)
		REP_AddQuest(1272, 1, 8, 30333, 1000)
		---- Quests (Farm)
		REP_AddQuest(1272, 1, 8, 31672, 350)
		REP_AddQuest(1272, 1, 8, 31942, 350)
		REP_AddQuest(1272, 1, 8, 31673, 350)
		REP_AddQuest(1272, 1, 8, 31941, 350)
		REP_AddQuest(1272, 1, 8, 31670, 350)
		REP_AddQuest(1272, 1, 8, 31669, 350)
		REP_AddQuest(1272, 1, 8, 31674, 350)
		REP_AddQuest(1272, 1, 8, 31675, 350)
		REP_AddQuest(1272, 1, 8, 31943, 350)
		REP_AddQuest(1272, 1, 8, 31671, 350)
		---- Quests (Tillers Union)
		REP_AddQuest(1272, 1, 8, 30318, 150)
		REP_AddQuest(1272, 1, 8, 30322, 150)
		REP_AddQuest(1272, 1, 8, 30324, 150)
		REP_AddQuest(1272, 1, 8, 30319, 150)
		REP_AddQuest(1272, 1, 8, 30326, 150)
		REP_AddQuest(1272, 1, 8, 30323, 150)
		REP_AddQuest(1272, 1, 8, 30317, 150)
		REP_AddQuest(1272, 1, 8, 30321, 150)
		REP_AddQuest(1272, 1, 8, 30325, 150)
		REP_AddQuest(1272, 1, 8, 30327, 150)
		---- Quests (Tillers Union: Gifts)
		REP_AddQuest(1272, 1, 8, 30471, 150)
		REP_AddQuest(1272, 1, 8, 30474, 150)
		REP_AddQuest(1272, 1, 8, 30475, 150)
		REP_AddQuest(1272, 1, 8, 30473, 150)
		REP_AddQuest(1272, 1, 8, 30479, 150)
		REP_AddQuest(1272, 1, 8, 30477, 150)
		REP_AddQuest(1272, 1, 8, 30478, 150)
		REP_AddQuest(1272, 1, 8, 30476, 150)
		REP_AddQuest(1272, 1, 8, 30472, 150)
		REP_AddQuest(1272, 1, 8, 30470, 150)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1272, 1, 8, 300, {[143941] = 1})
		end

		---------------------------
		-- Chee Chee 1277 --
		---------------------------
		---- Items
		REP_AddItems(1277, 1, 8, 900, {[79265] = 1})
		REP_AddItems(1277, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1277, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1277, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1277, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1277, 1, 8, 30471, 1400, {[79827] = 1})
		REP_AddQuest(1277, 1, 8, 30402, 1800, {[74647] = 5})
		REP_AddQuest(1277, 1, 8, 30324, 2000)

		---------------------------
		-- Ella 1275 --
		---------------------------
		---- Items
		REP_AddItems(1275, 1, 8, 900, {[79266] = 1})
		REP_AddItems(1275, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1275, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1275, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1275, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1275, 1, 8, 30474, 1400, {[79871] = 1})
		REP_AddQuest(1275, 1, 8, 30386, 1800, {[74651] = 5})
		REP_AddQuest(1275, 1, 8, 30327, 2000)

		---------------------------
		-- Farmer Fung 1283 --
		---------------------------
		---- Items
		REP_AddItems(1283, 1, 8, 900, {[79268] = 1})
		REP_AddItems(1283, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1283, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1283, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1283, 1, 8, 540, {[79267] = 1})
		---- Quests
		REP_AddQuest(1283, 1, 8, 30475, 1400, {[80233] = 1})
		REP_AddQuest(1283, 1, 8, 30421, 1800, {[74654] = 5})
		REP_AddQuest(1283, 1, 8, 30317, 2000)

		---------------------------
		-- Fish Fellreed 1282 --
		---------------------------
		---- Items
		REP_AddItems(1282, 1, 8, 900, {[79266] = 1})
		REP_AddItems(1282, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1282, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1282, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1282, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1282, 1, 8, 30473, 1400, {[79828] = 1})
		REP_AddQuest(1282, 1, 8, 30427, 1800, {[74655] = 5})
		REP_AddQuest(1282, 1, 8, 30326, 2000)

		---------------------------
		-- Gina Mudclaw 1281 --
		---------------------------
		---- Items
		REP_AddItems(1281, 1, 8, 900, {[79268] = 1})
		REP_AddItems(1281, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1281, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1281, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1281, 1, 8, 540, {[79267] = 1})
		---- Quests
		REP_AddQuest(1281, 1, 8, 30479, 1400, {[80231] = 1})
		REP_AddQuest(1281, 1, 8, 30390, 1800, {[74644] = 5})
		REP_AddQuest(1281, 1, 8, 30322, 2000)

		---------------------------
		-- Haohan Mudclaw 1279 --
		---------------------------
		---- Items
		REP_AddItems(1279, 1, 8, 900, {[79264] = 1})
		REP_AddItems(1279, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1279, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1279, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1279, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1279, 1, 8, 30477, 1400, {[80228] = 1})
		REP_AddQuest(1279, 1, 8, 30414, 1800, {[74642] = 5})
		REP_AddQuest(1279, 1, 8, 30319, 2000)

		---------------------------
		-- Jogu the Drunk 1273 --
		---------------------------
		---- Items
		REP_AddItems(1273, 1, 8, 900, {[79267] = 1})
		REP_AddItems(1273, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1273, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1273, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1273, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1273, 1, 8, 30478, 1400, {[80236] = 1})
		REP_AddQuest(1273, 1, 8, 30439, 1800, {[74643] = 5})
		REP_AddQuest(1273, 1, 8, 30321, 2000)

		---------------------------
		-- Old Hillpaw 1276 --
		---------------------------
		---- Items
		REP_AddItems(1276, 1, 8, 900, {[79265] = 1})
		REP_AddItems(1276, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1276, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1276, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1276, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1276, 1, 8, 30476, 1400, {[80229] = 1})
		REP_AddQuest(1276, 1, 8, 30396, 1800, {[74649] = 5})
		REP_AddQuest(1276, 1, 8, 30318, 2000)

		---------------------------
		-- Sho 1278 --
		---------------------------
		---- Items
		REP_AddItems(1278, 1, 8, 900, {[79267] = 1})
		REP_AddItems(1278, 1, 8, 540, {[79264] = 1})
		REP_AddItems(1278, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1278, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1278, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1278, 1, 8, 30472, 1400, {[79870] = 1})
		REP_AddQuest(1278, 1, 8, 30408, 1800, {[74645] = 5})
		REP_AddQuest(1278, 1, 8, 30325, 2000)

		---------------------------
		-- Tina Mudclaw 1280 --
		---------------------------
		---- Items
		REP_AddItems(1280, 1, 8, 900, {[79264] = 1})
		REP_AddItems(1280, 1, 8, 540, {[79265] = 1})
		REP_AddItems(1280, 1, 8, 540, {[79266] = 1})
		REP_AddItems(1280, 1, 8, 540, {[79267] = 1})
		REP_AddItems(1280, 1, 8, 540, {[79268] = 1})
		---- Quests
		REP_AddQuest(1280, 1, 8, 30470, 1400, {[80134] = 1})
		REP_AddQuest(1280, 1, 8, 30433, 1800, {[74652] = 5})
		REP_AddQuest(1280, 1, 8, 30323, 2000)

		---------------------------
		-- Emperor Shaohao 1492 --
		---------------------------
		---- Mobs
		REP_AddMob(1492, 1, 7, "Archiereus of Flame", 50, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Cinderfall", 40, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Flintlord Gairan", 40, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Urdur the Cauterizer", 40, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Champion of the Black Flame", 30, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "High Priest of Ordos", 25, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Blazebound Chanter", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Eternal Kiln", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Eternal Kilnmaster", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Jakur of Ordan", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Molten Guardian", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Watcher Osu", 20, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Burning Berserker", 15, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Ordon Fire-Watcher", 10, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Ordon Oathguard", 10, zone.Timeless_Isle)
		REP_AddMob(1492, 1, 7, "Ordon Candlekeeper", 5, zone.Timeless_Isle)
		---- Quests
		REP_AddQuest(1492, 1, 8, 33335, 250)
		REP_AddQuest(1492, 1, 8, 33340, 250)
		REP_AddQuest(1492, 1, 8, 33341, 250)
		REP_AddQuest(1492, 1, 8, 33342, 250)
		REP_AddQuest(1492, 1, 8, 33343, 250)
		REP_AddQuest(1492, 1, 8, 33374, 250)
		if (REP.AfterMoP) then
			-- Timewalking Commendation
			REP_AddItems(1492, 1, 8, 500, {[143947] = 1})
		end

		---------------------------
		-- Shado-Pan Assault 1435 --
		---------------------------
		---- Mobs
		REP_AddMob(1435, 1, 5, 1, 30, zone.Throne_of_Thunder)
		REP_AddMob(1435, 1, 8, 3, 30, zone.Throne_of_Thunder)
		---- Quests
		REP_AddQuest(1435, 1, 8, 32640, 300, {[94221] = 3})
		REP_AddQuest(1435, 1, 8, 32641, 300, {[94221] = 3})
		REP_AddQuest(1435, 1, 8, 32707, 200, {[94221] = 3})
		REP_AddQuest(1435, 1, 8, 32708, 300)
		if (REP.AfterMoP) then
		-- Timewalking Commendation
		REP_AddItems(1435, 1, 8, 300, {[143945] = 1})
		end

		if (REP.IsAlliance) then
			---------------------------
			-- Operation: Shieldwall 1376 --
			---------------------------
			---- Quests
			REP_AddQuest(1376, 1, 8, 32643, 400)
			---- Lion's Landing
			REP_AddQuest(1376, 1, 8, 32148, 150)
			REP_AddQuest(1376, 1, 8, 32153, 300)
			REP_AddQuest(1376, 1, 8, 32149, 150)
			REP_AddQuest(1376, 1, 8, 32152, 150)
			REP_AddQuest(1376, 1, 8, 32150, 150)
			REP_AddQuest(1376, 1, 8, 32151, 150)
			---- Domination Point
			REP_AddQuest(1376, 1, 8, 32143, 150)
			REP_AddQuest(1376, 1, 8, 32145, 300)
			REP_AddQuest(1376, 1, 8, 32146, 150)
			REP_AddQuest(1376, 1, 8, 32144, 300)
			REP_AddQuest(1376, 1, 8, 32142, 150)
			---- Ruins of Ogudei
			REP_AddQuest(1376, 1, 8, 32347, 150)
			REP_AddQuest(1376, 1, 8, 32119, 150)
			REP_AddQuest(1376, 1, 8, 32122, 300)
			REP_AddQuest(1376, 1, 8, 32346, 150)
			REP_AddQuest(1376, 1, 8, 32115, 150)
			REP_AddQuest(1376, 1, 8, 32121, 150)
			---- Bilgewater Beach
			REP_AddQuest(1376, 1, 8, 32154, 150)
			REP_AddQuest(1376, 1, 8, 32155, 150)
			REP_AddQuest(1376, 1, 8, 32159, 150)
			REP_AddQuest(1376, 1, 8, 32446, 150)
			REP_AddQuest(1376, 1, 8, 32157, 150)
			REP_AddQuest(1376, 1, 8, 32156, 150)
			REP_AddQuest(1376, 1, 8, 32158, 300)
			REP_AddQuest(1376, 1, 8, 32433, 150)
			---- Beastmaster Quests
			------ Huntsman Blake
			REP_AddQuest(1376, 1, 8, 32172, 200)
			REP_AddQuest(1376, 1, 8, 32170, 200)
			REP_AddQuest(1376, 1, 8, 32171, 200)
			---- Timewalking Commendation
			REP_AddItems(1376, 1, 8, 300, {[143944] = 1})

			---------------------------
			-- Kirin Tor Offensive 1387
			---------------------------
			---- Quests
		  REP_AddQuest(1387, 4, 8, 32571, 150)
		  REP_AddQuest(1387, 4, 8, 32558, 150)
		  REP_AddQuest(1387, 4, 8, 32578, 200)
		  REP_AddQuest(1387, 4, 8, 32525, 150)
		  REP_AddQuest(1387, 4, 8, 32485, 150)
		  REP_AddQuest(1387, 4, 8, 32634, 150)
		  REP_AddQuest(1387, 4, 8, 32636, 150)
		  REP_AddQuest(1387, 4, 8, 32555, 150)
		  REP_AddQuest(1387, 4, 8, 32627, 150)
		  REP_AddQuest(1387, 4, 8, 32576, 200)
		  REP_AddQuest(1387, 4, 8, 32551, 150)
		  REP_AddQuest(1387, 4, 8, 32543, 150)
		  REP_AddQuest(1387, 4, 8, 32539, 150)
		  REP_AddQuest(1387, 4, 8, 32537, 150)
		  REP_AddQuest(1387, 4, 8, 32639, 150)
		  REP_AddQuest(1387, 4, 8, 32554, 150)
		  REP_AddQuest(1387, 4, 8, 32553, 150)
		  REP_AddQuest(1387, 4, 8, 32585, 200)
		  REP_AddQuest(1387, 4, 8, 32573, 150)
		  REP_AddQuest(1387, 4, 8, 32635, 150)
		  REP_AddQuest(1387, 4, 8, 32559, 150)
		  REP_AddQuest(1387, 4, 8, 32607, 400)
		  REP_AddQuest(1387, 4, 8, 32724, 200)
		  REP_AddQuest(1387, 4, 8, 32570, 150)
		  REP_AddQuest(1387, 4, 8, 32527, 150)
		  REP_AddQuest(1387, 4, 8, 32540, 150)
		  REP_AddQuest(1387, 4, 8, 32538, 150)
		  REP_AddQuest(1387, 4, 8, 32631, 200)
		  REP_AddQuest(1387, 4, 8, 32581, 200)
		  REP_AddQuest(1387, 4, 8, 32528, 150)
		  REP_AddQuest(1387, 4, 8, 32546, 150)
		  REP_AddQuest(1387, 4, 8, 32560, 150)
		  REP_AddQuest(1387, 4, 8, 32548, 150)
		  REP_AddQuest(1387, 4, 8, 32552, 150)
		  REP_AddQuest(1387, 4, 8, 32632, 150)
		  REP_AddQuest(1387, 4, 8, 32638, 150)
		  REP_AddQuest(1387, 4, 8, 32536, 150)
		  REP_AddQuest(1387, 4, 8, 32586, 150)
		  REP_AddQuest(1387, 4, 8, 32301, 150)
		  REP_AddQuest(1387, 4, 8, 32588, 150)
		  REP_AddQuest(1387, 4, 8, 32557, 150)
		  REP_AddQuest(1387, 4, 8, 32637, 150)
		  REP_AddQuest(1387, 4, 8, 32541, 150)
		  REP_AddQuest(1387, 4, 8, 32544, 150)
		  REP_AddQuest(1387, 4, 8, 32701, 1850)
		  REP_AddQuest(1387, 4, 8, 32703, 1900)
		  REP_AddQuest(1387, 4, 8, 32704, 2150)
		  REP_AddQuest(1387, 4, 8, 32700, 1250)
		  REP_AddQuest(1387, 4, 8, 32608, 400)
		  REP_AddQuest(1387, 4, 8, 32582, 200)
		  REP_AddQuest(1387, 4, 8, 32723, 350)
		  REP_AddQuest(1387, 4, 8, 32532, 150)
		  REP_AddQuest(1387, 4, 8, 32550, 150)
		  REP_AddQuest(1387, 4, 8, 32526, 150)
		  REP_AddQuest(1387, 4, 8, 32633, 150)
		  REP_AddQuest(1387, 4, 8, 32533, 150)
		  REP_AddQuest(1387, 4, 8, 32606, 150)
		  REP_AddQuest(1387, 4, 8, 32542, 150)
		  REP_AddQuest(1387, 4, 8, 32628, 150)
		  REP_AddQuest(1387, 4, 8, 32530, 150)
		  REP_AddQuest(1387, 4, 8, 32529, 150)
		  REP_AddQuest(1387, 4, 8, 32531, 150)
		  REP_AddQuest(1387, 4, 8, 32547, 150)
		  REP_AddQuest(1387, 4, 8, 32556, 150)
		  REP_AddQuest(1387, 4, 8, 32545, 150)
		  REP_AddQuest(1387, 4, 8, 32574, 150)
		  REP_AddQuest(1387, 4, 8, 32535, 150)
		  REP_AddQuest(1387, 4, 8, 32572, 150)
		  REP_AddQuest(1387, 4, 8, 32575, 150)
		  REP_AddQuest(1387, 4, 8, 32583, 200)
		  ---- Timewalking Commendation
		  REP_AddItems(1387, 1, 8, 300, {[143940] = 1})

			---------------------------
			-- Bizmo's Brawlpub 1419
			---------------------------
			---- General quests
			REP_AddQuest(1419, 1, 8, 5, 1)

			---------------------------
			-- Pearlfin Jinyu 1242
			---------------------------
			---- Quests
			REP_AddQuest(1242, 1, 8, 5, 1)

			---------------------------
			-- Tushui Pandaren 1353
			---------------------------
			---- Quests
			REP_AddQuest(1353, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
			REP_AddQuest(1353, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
      ---- General
      REP_AddGeneral(1353, 4, 8, "Killing (grey level) mobs in instances while wearing the Tushui tabard.", 3, "Killing (grey level) mobs in instances while wearing the Tushui tabard.", "Killing (grey level) mobs in instances while wearing the Tushui tabard will reward you roughly 3 base reputation per kill.")
			REP_AddGeneral(1353, 4, 8, "Killing (grey level) bosses in instances while wearing the Tushui tabard.", 60, "Killing (grey level) bosses in instances while wearing the Tushui tabard.", "Killing (grey level) bosses in instances while wearing the Tushui tabard will reward you roughly 60 base reputation per kill.")
      REP_AddGeneral(1353, 4, 8, "Killing (green or higher level) mobs in instances while wearing the Tushui tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Tushui tabard.", "Killing (green or higher level) mobs in instances while wearing the Tushui tabard will reward you roughly 15 base reputation per kill.")
      REP_AddGeneral(1353, 4, 8, "Killing (green or higher level) bosses in instances while wearing the Tushui tabard.", 300, "Killing (green or higher level) bosses in instances while wearing the Tushui tabard.", "Killing (green or higher level) bosses in instances while wearing the Tushui tabard will reward you roughly 300 base reputation per kill.")
		else
      ---------------------------
			-- Huojin Pandaren 1352
			---------------------------
			---- Quests
		  REP_AddQuest(1352, 4, 8, 2, 65, "nil", REP.LIMIT_TYPE_Cook)
		  REP_AddQuest(1352, 4, 8, 4, 65, "nil", REP.LIMIT_TYPE_Fish)
      ---- General
      REP_AddGeneral(1352, 4, 8, "Killing (grey level) mobs in instances while wearing the Huojin tabard.", 3, "Killing (grey level) mobs in instances while wearing the Huojin tabard.", "Killing (grey level) mobs in instances while wearing the Huojin tabard will reward you roughly 3 base reputation per kill.")
			REP_AddGeneral(1352, 4, 8, "Killing (grey level) bosses in instances while wearing the Huojin tabard.", 60, "Killing (grey level) bosses in instances while wearing the Huojin tabard.", "Killing (grey level) bosses in instances while wearing the Huojin tabard will reward you roughly 60 base reputation per kill.")
      REP_AddGeneral(1352, 4, 8, "Killing (green or higher level) mobs in instances while wearing the Huojin tabard.", 15, "Killing (green or higher level) mobs in instances while wearing the Huojin tabard.", "Killing (green or higher level) mobs in instances while wearing the Huojin tabard will reward you roughly 15 base reputation per kill.")
      REP_AddGeneral(1352, 4, 8, "Killing (green or higher level) bosses in instances while wearing the Huojin tabard.", 300, "Killing (green or higher level) bosses in instances while wearing the Huojin tabard.", "Killing (green or higher level) bosses in instances while wearing the Huojin tabard will reward you roughly 300 base reputation per kill.")

			---------------------------
			-- Brawl'gar Arena 1374
			---------------------------
			---- Quests
			REP_AddQuest(1374, 1, 8, 5, 1)

			---------------------------
			-- Forest Hozen 1228
			---------------------------
			---- Quests
		  REP_AddQuest(1228, 1, 8, 5, 1)

			---------------------------
			-- Dominance Offensive 1375
			---------------------------
			---- Quests
		  REP_AddQuest(1375, 1, 8, 32643, 400)
			---- Quests (Lion's Landing)
		  REP_AddQuest(1375, 1, 8, 32148, 150)
		  REP_AddQuest(1375, 1, 8, 32153, 150)
		  REP_AddQuest(1375, 1, 8, 32152, 150)
		  REP_AddQuest(1375, 1, 8, 32150, 150)
		  REP_AddQuest(1375, 1, 8, 32151, 150)
		  REP_AddQuest(1375, 1, 8, 32132, 150)
			---- Quests (Domination Point)
		  REP_AddQuest(1375, 1, 8, 32146, 300)
		  REP_AddQuest(1375, 1, 8, 32145, 150)
		  REP_AddQuest(1375, 1, 8, 32142, 150)
		  REP_AddQuest(1375, 1, 8, 32143, 150)
		  REP_AddQuest(1375, 1, 8, 32144, 150)
			---- Quests (Ruins of Ogudei)
		  REP_AddQuest(1375, 1, 8, 32122, 300)
		  REP_AddQuest(1375, 1, 8, 32121, 150)
		  REP_AddQuest(1375, 1, 8, 32119, 150)
		  REP_AddQuest(1375, 1, 8, 32347, 150)
		  REP_AddQuest(1375, 1, 8, 32115, 150)
		  REP_AddQuest(1375, 1, 8, 32346, 150)
			---- Quests (Bilgewater Beach)
		  REP_AddQuest(1375, 1, 8, 32199, 150)
		  REP_AddQuest(1375, 1, 8, 32149, 150)
		  REP_AddQuest(1375, 1, 8, 32157, 150)
		  REP_AddQuest(1375, 1, 8, 32446, 150)
		  REP_AddQuest(1375, 1, 8, 32158, 300)
			---- Quests (Bilgewater Beach Set two)
		  REP_AddQuest(1375, 1, 8, 32214, 150)
		  REP_AddQuest(1375, 1, 8, 32433, 300)
		  REP_AddQuest(1375, 1, 8, 32197, 150)
		  REP_AddQuest(1375, 1, 8, 32155, 150)
		  REP_AddQuest(1375, 1, 8, 32137, 150)
			---- Quests (Bilgewater Beach Xtra Fuel Set)
		  REP_AddQuest(1375, 1, 8, 32141, 150)
		  REP_AddQuest(1375, 1, 8, 32236, 150)
			---- Beastmaster quests (Huntsman Blake)
		  REP_AddQuest(1375, 1, 8, 32172, 200)
		  REP_AddQuest(1375, 1, 8, 32170, 200)
		  REP_AddQuest(1375, 1, 8, 32171, 200)

			if (REP.AfterWoD) then
			  -- Timewalking Commendation
			  REP_AddItems(1375, 1, 8, 300, {[143943] = 1})
			end

			---------------------------
			-- Sunreaver Onslaught 1388
			---------------------------
			---- Quests
		  REP_AddQuest(1388, 4, 8, 32571, 150)
		  REP_AddQuest(1388, 4, 8, 32578, 200)
		  REP_AddQuest(1388, 4, 8, 32525, 150)
		  REP_AddQuest(1388, 4, 8, 32485, 150)
		  REP_AddQuest(1388, 4, 8, 32634, 150)
		  REP_AddQuest(1388, 4, 8, 32636, 150)
		  REP_AddQuest(1388, 4, 8, 32627, 150)
		  REP_AddQuest(1388, 4, 8, 32576, 200)
		  REP_AddQuest(1388, 4, 8, 32576, 200)
		  REP_AddQuest(1388, 4, 8, 32551, 150)
		  REP_AddQuest(1388, 4, 8, 32543, 150)
		  REP_AddQuest(1388, 4, 8, 32539, 150)
		  REP_AddQuest(1388, 4, 8, 32537, 150)
		  REP_AddQuest(1388, 4, 8, 32639, 150)
		  REP_AddQuest(1388, 4, 8, 32492, 250)
		  REP_AddQuest(1388, 4, 8, 32554, 150)
		  REP_AddQuest(1388, 4, 8, 32297, 150)
		  REP_AddQuest(1388, 4, 8, 32300, 150)
		  REP_AddQuest(1388, 4, 8, 32585, 200)
		  REP_AddQuest(1388, 4, 8, 32573, 150)
		  REP_AddQuest(1388, 4, 8, 32607, 400)
		  REP_AddQuest(1388, 4, 8, 32724, 200)
		  REP_AddQuest(1388, 4, 8, 32570, 150)
		  REP_AddQuest(1388, 4, 8, 32527, 150)
		  REP_AddQuest(1388, 4, 8, 32540, 150)
		  REP_AddQuest(1388, 4, 8, 32538, 150)
		  REP_AddQuest(1388, 4, 8, 32631, 200)
		  REP_AddQuest(1388, 4, 8, 32581, 200)
		  REP_AddQuest(1388, 4, 8, 32528, 150)
		  REP_AddQuest(1388, 4, 8, 32546, 150)
		  REP_AddQuest(1388, 4, 8, 32286, 250)
		  REP_AddQuest(1388, 4, 8, 32210, 250)
		  REP_AddQuest(1388, 4, 8, 32229, 250)
		  REP_AddQuest(1388, 4, 8, 32234, 150)
		  REP_AddQuest(1388, 4, 8, 32548, 150)
		  REP_AddQuest(1388, 4, 8, 32552, 150)
		  REP_AddQuest(1388, 4, 8, 32632, 150)
		  REP_AddQuest(1388, 4, 8, 32266, 150)
		  REP_AddQuest(1388, 4, 8, 32536, 150)
		  REP_AddQuest(1388, 4, 8, 32586, 150)
		  REP_AddQuest(1388, 4, 8, 32301, 150)
		  REP_AddQuest(1388, 4, 8, 32637, 150)
		  REP_AddQuest(1388, 4, 8, 32494, 150)
		  REP_AddQuest(1388, 4, 8, 32541, 150)
		  REP_AddQuest(1388, 4, 8, 32544, 150)
		  REP_AddQuest(1388, 4, 8, 32701, 1850)
		  REP_AddQuest(1388, 4, 8, 32703, 1900)
		  REP_AddQuest(1388, 4, 8, 32704, 2150)
		  REP_AddQuest(1388, 4, 8, 32700, 1250)
		  REP_AddQuest(1388, 4, 8, 32608, 400)
		  REP_AddQuest(1388, 4, 8, 32582, 200)
		  REP_AddQuest(1388, 4, 8, 32532, 150)
		  REP_AddQuest(1388, 4, 8, 32550, 150)
		  REP_AddQuest(1388, 4, 8, 32209, 150)
		  REP_AddQuest(1388, 4, 8, 32526, 150)
		  REP_AddQuest(1388, 4, 8, 32633, 150)
		  REP_AddQuest(1388, 4, 8, 32533, 150)
		  REP_AddQuest(1388, 4, 8, 32606, 150)
		  REP_AddQuest(1388, 4, 8, 32275, 150)
		  REP_AddQuest(1388, 4, 8, 32628, 150)
		  REP_AddQuest(1388, 4, 8, 32482, 250)
		  REP_AddQuest(1388, 4, 8, 32530, 150)
		  REP_AddQuest(1388, 4, 8, 32529, 150)
		  REP_AddQuest(1388, 4, 8, 32531, 150)
		  REP_AddQuest(1388, 4, 8, 32547, 150)
		  REP_AddQuest(1388, 4, 8, 32545, 150)
		  REP_AddQuest(1388, 4, 8, 32574, 150)
		  REP_AddQuest(1388, 4, 8, 32535, 150)
		  REP_AddQuest(1388, 4, 8, 32572, 150)
		  REP_AddQuest(1388, 4, 8, 32575, 150)
		  REP_AddQuest(1388, 4, 8, 32493, 150)
		  REP_AddQuest(1388, 4, 8, 32206, 150)
		  REP_AddQuest(1388, 4, 8, 32233, 150)
		  REP_AddQuest(1388, 4, 8, 32232, 150)
		  REP_AddQuest(1388, 4, 8, 32583, 200)
			if (REP.AfterWoD) then
			  -- Timewalking Commendation
			  REP_AddItems(1388, 1, 8, 300, {[143939] = 1})
			end
		end

		---------------------------
		-- The Brewmasters 1351 --
		---------------------------
		---- Quests
		REP_AddQuest(1351, 1, 8, 6, 1)
	end

--------------------------------------------------
-- Factions released 'after' Mist of Pandaria
--------------------------------------------------
	if (REP.AfterMoP) then
		---------------------------
		-- Arakkoa Outcasts 1515 --
		---------------------------
		---- Items
		REP_AddItems(1515, 1, 8, 1000, {[128315] = 1})
		---- Mobs
		REP_AddMob(1515, 1, 8, "AmoREPic Cognitor at Lost Veil Anzu", 5, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Befuddled Relic-Seeker at Lost Veil Anzu", 5, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 7, "Highmaul Skullcrusher at Lost Veil Anzu", 5,zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Infected Plunderer at Lost Veil Anzu", 5, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Darting Swift Feather at Skettis", 1, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Flighted Storm-Spinner at Skettis", 5, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Skyreach Dawnbreaker at Skettis", 16, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Skyreach Dreadtalon at Skettis", 5, zone.Spires_of_Arak)
		REP_AddMob(1515, 1, 8, "Skyreach Labormaster at Skettis", 5, zone.Spires_of_Arak)

		---------------------------
		-- Steamwheedle Preservation Society 1711 --
		---------------------------
		---- Items
		REP_AddItems(1711, 1, 8, 1000, {[128315] = 1})
		REP_AddItems(1711, 1, 8, 350, {[118100] = 1}) -- Highmaul Relic
		---- Quests
		REP_AddQuest(1711, 1, 8, 35147, 250, {[118099] = 20})
		REP_AddQuest(1711, 1, 8, 37210, 500, {[118654] = 1})
		REP_AddQuest(1711, 1, 8, 37211, 500, {[118655] = 1})
		REP_AddQuest(1711, 1, 8, 37221, 500, {[118656] = 1})
		REP_AddQuest(1711, 1, 8, 37222, 500, {[118657] = 1})
		REP_AddQuest(1711, 1, 8, 37223, 500, {[118658] = 1})
		REP_AddQuest(1711, 1, 8, 37224, 500, {[118659] = 1})
		REP_AddQuest(1711, 1, 8, 37225, 500, {[118660] = 1})
		REP_AddQuest(1711, 1, 8, 37226, 500, {[118661] = 1})
		REP_AddQuest(1711, 1, 8, 37520, 500, {[120172] = 1})

		---------------------------
		-- Order of the Awakened 1849 --
		---------------------------
		---- Items
		REP_AddItems(1849, 1, 8, 1000, {[128315] = 1})
		---- Quests
		REP_AddQuest(1849, 1, 8, 39433, 1500, {[128346] = 10})

		---------------------------
		-- The Saberstalkers 1850 --
		---------------------------
		---- Items
		REP_AddItems(1850, 1, 8, 1000, {[128315] = 1})
		---- Mobs
		REP_AddMob(1850, 1, 8, "Blackfang Hunter", 25, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Blackfang Prowler", 25, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Blackfang Savage", 25, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Blackfang Shaman", 25, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Soulslicer (Rare elite)", 500, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Gloomtalon (Rare elite)", 500, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "Krell the Serene (Rare elite)", 500, zone.Tanaan_Jungle)
		REP_AddMob(1850, 1, 8, "The Blackfang (Rare elite)", 500, zone.Tanaan_Jungle)
		---- Quests
		REP_AddQuest(1850, 1, 8, 39565, 3500)
		if REP.IsAlliance then
			REP_AddQuest(1850, 1, 8, 39582, 1500, {[124099] = 100})
		else
			REP_AddQuest(1850, 1, 8, 39529, 1500, {[124099] = 100})
		end

		if (REP.IsAlliance) then
			---------------------------
			-- Council of Exarchs 1731
			---------------------------
			---- Mobs (Pillars of Fate)
			REP_AddItems(1731, 1, 8, 1000, {[128315] = 1})
			REP_AddMob(1731, 1, 8, "Shadowmoon Warrior/Defiler/Voidtwister at Pillars of Fate", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Skeletal Ancestor/Reanimated Bones/Shadowmoon Void Augur at Pillars of Fate", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Void Fragment at Pillars of Fate", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Shadowmoon Deathcaller at Pillars of Fate", 8, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Void Horror at Pillars of Fate", 16, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Voidreaver Urnae (Rare mob) at Pillars of Fate", 50, zone.Shadowmoon_Valley);
			---- Mobs (Socrethar's Rise)
			REP_AddMob(1731, 1, 8, "Sargerei Binder/Worker/Initiate at Socrethar's Rise", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Sargerei Acolyte/Demonspeaker at Socrethar's Rise", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Shadowglen Thornshooter at Socrethar's Rise", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Sargerei Darkblade at Socrethar's Rise", 8, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Nightshade Consort at Socrethar's Rise", 8, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Sargerei Demonlord at Socrethar's Rise", 16, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Master Sergeant Milgra / Demidos (Rare mobs) at Socrethar's Rise", 50, zone.Shadowmoon_Valley);
			---- Mobs (Darktide Roost)
			REP_AddMob(1731, 1, 8, "Darktide Engineer/Rylakinator/Matron at Darktide Roost", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Darktide Pilferer/Guardian at Darktide Roost", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Controlled Darkwing / Darkwing Matron at Darktide Roost", 5, zone.Shadowmoon_Valley);
			REP_AddMob(1731, 1, 8, "Darktide Machinist/Windstalker at Darktide Roost", 8, zone.Shadowmoon_Valley);

			---------------------------
			-- Wrynn's Vanguard 1682
			---------------------------
			---- Items
		  REP_AddItems(1682, 1, 8, 1000, {[128315] = 1})
			---- General
		  REP_AddGeneral(1682, 1, 8, "Kill enemy faction leader", 2500, "Kill enemy faction leader", "Kill the enemy faction leader to gain 2500 reputation")
		  REP_AddGeneral(1682, 1, 8, "Win a bonus objective", 500, "Win a bonus objective", "Win a bonus objective to gain 500 reputation")
			---- Quests
		  REP_AddQuest(1682, 1, 8, 35927, 2500, {[112015] = 1})
		  REP_AddQuest(1682, 1, 8, 35942, 2500, {[112113] = 1})
		  REP_AddQuest(1682, 1, 8, 35941, 2500, {[112120] = 1})
		  REP_AddQuest(1682, 1, 8, 35940, 2500, {[112122] = 1})
		  REP_AddQuest(1682, 1, 8, 35939, 2500, {[112123] = 1})
		  REP_AddQuest(1682, 1, 8, 35938, 2500, {[112125] = 1})
		  REP_AddQuest(1682, 1, 8, 35937, 2500, {[112128] = 1})

			---------------------------
			-- Sha'tari Defense 1710
			---------------------------
			---- Items
			REP_AddItems(1710, 1, 8, 1000, {[128315] = 1})
			---- Mobs (Shattrath)
			REP_AddMob(1710, 1, 8, "Vicious Felhunter/Observer/Voidwalker in Shattrath", 5, zone.Talador);
			REP_AddMob(1710, 1, 8, "Sargerei Summoner/Huntsman/Felbringer/Soul-Twister/ in Shattrath", 5, zone.Talador);
			REP_AddMob(1710, 1, 8, "Sargerei Fiendmaster in Shattrath", 5, zone.Talador);
			REP_AddMob(1710, 1, 8, "Conniving Shadowblade / Council Soulspeaker in Shattrath", 5, zone.Talador);
			REP_AddMob(1710, 1, 8, "Sargerei Discordant/Ritualist/Soulspewer/Fiendspeaker/ in Shattrath", 8, zone.Talador);
			REP_AddMob(1710, 1, 8, "Sargerei Destructor in Shattrath", 8, zone.Talador);
			REP_AddMob(1710, 1, 8, "Conniving Deathblade / Council Felcaller in Shattrath", 8, zone.Talador);
			REP_AddMob(1710, 1, 8, "Rune Ritualist in Shattrath", 15, zone.Talador);
			---- Mobs (Bladefury Hold)
		  REP_AddMob(1710, 1, 8, "Grom'kar Blademaster/Bulwark/deadeye/Punisher in Bladefury Hold", 5, zone.Talador);

			---------------------------
			-- Hand of the Prophet 1847
			---------------------------
			---- Items
			REP_AddItems(1847, 1, 8, 1000, {[128315] = 1})
			---- General
			REP_AddGeneral(1847, 1, 8, "Lion's Watch command table random daily quest", 500, "Lion's Watch command table random daily quest", "Random daily that awards 500 reputation")
		  REP_AddGeneral(1847, 1, 8, "Vindicator Krethos random daily quest", 250, "Vindicator Krethos random daily quest", "Random daily that awards 250 reputation")
			---- Quests
		  REP_AddQuest(1847, 1, 8, 39574, 250)
		else
			---------------------------
			-- Frostwolf Orcs 1445
			---------------------------
			---- Items
			REP_AddItems(1445, 1, 8, 1000, {[128315] = 1})
			---- Mobs (Stonefury Cliffs)
			REP_AddMob(1445, 1, 8, "Bloodmaul Brute/Dire Boar/Frostbender in Stonefury Cliffs", 5, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Bloodmaul Gladiator in Stonefury Cliffs", 5, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Bloodmaul Geomancer/Magma Shaper/Taskmaster in Stonefury Cliffs", 8, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Bloodmaul Bonecrusher in Stonefury Cliffs", 16, zone.Frostfire_Ridge);
			---- Mobs (Magnarok)
			REP_AddMob(1445, 1, 8, "Frostfire Cragstomper in Magnarok", 8, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Vicious Acidmaw in Magnarok", 8, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Icecrag Mountainbreaker in Magnarok", 16, zone.Frostfire_Ridge);
			---- Mobs (Siegeworks)
			REP_AddMob(1445, 1, 8, "Grom'kar Deadeye/Enforcer/Footsoldier in Iron Siegeworks", 5, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Grom'kar Shocktrooper/Warforger in Iron Siegeworks", 5, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Grom'kar Crippler/Pulverizer in Iron Siegeworks", 16, zone.Frostfire_Ridge);
			REP_AddMob(1445, 1, 8, "Iron Berserker/Crag-Leaper/Gladiator/Talon in Iron Siegeworks", 5, zone.Frostfire_Ridge);

			---------------------------
			-- Vol'jin's Spear 1681
			---------------------------
			---- Items
		  REP_AddItems(1681, 1, 8, 1000, {[128315] = 1})
		  REP_AddItems(1681, 1, 8, 1000, {[128315] = 1})
			---- Items
		  REP_AddGeneral(1681, 1, 8, "Kill enemy faction leader", 2500, "Kill enemy faction leader", "Kill the enemy faction leader to gain 2500 reputation")
		  REP_AddGeneral(1681, 1, 8, "Win a bonus objective", 500, "Win a bonus objective", "Win a bonus objective to gain 500 reputation")
			---- Quests
		  REP_AddQuest(1681, 1, 8, 36884, 2500, {[112119] = 1})
		  REP_AddQuest(1681, 1, 8, 36041, 2500, {[112121] = 1})
		  REP_AddQuest(1681, 1, 8, 36033, 2500, {[112124] = 1})
		  REP_AddQuest(1681, 1, 8, 36034, 2500, {[112126] = 1})
		  REP_AddQuest(1681, 1, 8, 36040, 2500, {[112127] = 1})
		  REP_AddQuest(1681, 1, 8, 36042, 2500, {[112131] = 1})
		  REP_AddQuest(1681, 1, 8, 36038, 2500, {[112113] = 1})

			---------------------------
			-- Laughing Skull Orcs 1708
			---------------------------
			---- Items
		  REP_AddItems(1708, 1, 8, 1000, {[128315] = 1})
		  ---- Mobs (The Pit)
		  REP_AddMob(1708, 1, 8, "Iron Laborer in The Pit", 5, zone.Gorgrond);
		  REP_AddMob(1708, 1, 8, "Iron Enforcer/Deadshot/Cauterizer in The Pit", 15, zone.Gorgrond);
		  REP_AddMob(1708, 1, 8, "Iron Bloodburner/Bulwark/Warden/Reinforcement in The Pit", 15, zone.Gorgrond);
		  ---- Mobs (Everbloom Wilds)
		  REP_AddMob(1708, 1, 8, "Everbloom Shaper/Wasp/Waterspeaker in Everbloom Wilds", 5, zone.Gorgrond);

			---------------------------
			-- Vol'jin's Headhunters 1848
			---------------------------
			---- Items
		  REP_AddItems(1848, 1, 8, 1000, {[128315] = 1})
			---- General
		  REP_AddGeneral(1848, 1, 8, "Vol'mar command table random daily quest", 500, "Vol'mar command table random daily quest", "Random daily that awards 500 reputation")
		  REP_AddGeneral(1848, 1, 8, "Shadow Hunter Denjai random daily quest", 250, "Shadow Hunter Denjai random daily quest", "Random daily that awards 250 reputation")
			---- Quests
			REP_AddQuest(1848, 1, 8, 39526, 250)
		end
	end

--------------------------------------------------
-- Factions released 'after' Warlords of Draenor
--------------------------------------------------
	if (REP.AfterWoD) then
		---------------------------
		-- Armies of Legionfall 2045 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(2045, 1, 8, 250, {[146949] = 1}, {[146950] = 1})
		REP_AddItems(2045, 1, 8, 750, {[147727] = 1}, {[152464] = 1})
		---- Quests (Building contributions)
		REP_AddQuest(2045, 1, 8, 46277, 150, {[1342] = 100})
		REP_AddQuest(2045, 1, 8, 46736, 150, {[1342] = 100})
		REP_AddQuest(2045, 1, 8, 46735, 150, {[1342] = 100})
		---- General (World Quest)
		REP_AddGeneral(2045, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Rare World Quests", 75, "Rare World Quests", "Complete rare world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Rare Elite World Quests", 75, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Elite World Quests", 75, "Elite World Quests", "Complete elite world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Legionfall Dungeon World Quest", 250, "Legionfall Dungeon World Quest", "Complete dungeon world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "World Boss World Quest", 500, "World Boss World Quest", "Complete world boss world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Raid World Quests", 500, "Epic Elite World Quests", "Complete raid world quests with this faction to gain reputation.")
		REP_AddGeneral(2045, 1, 8, "Armies of Legionfall Emissary", 1500, "Armies of Legionfall Emissary", "Complete 4x Armies of Legionfall world quests while the emissary is available to gain reputation")

		---------------------------
		-- Court of Farondis 1900 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1900, 1, 8, 250, {[146937] = 1}, {[146943] = 1})
		REP_AddItems(1900, 1, 8, 1500, {[147410] = 1}, {[150927] = 1})
		---- General (World Quest)
		REP_AddGeneral(1900, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "PvP World Quest", 75, "PvP World Quests", "Complete PvP world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Elite World Quests", 250, "Elite World Quests", "Complete elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Epic Elite World Quests", 250, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Dungeon World Quests", 250, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(1900, 1, 8, "Court of Farondins Emissary", 1500, "Court of Farondins Emissary", "Complete 4x Court of Farondis world quests while the emissary is available to gain reputation")

		---------------------------
		-- Dreamweavers 1883 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1883, 1, 8, 250, {[146936] = 1}, {[146942] = 1})
		REP_AddItems(1883, 1, 8, 1500, {[147411] = 1}, {[150926] = 1})
		---- General (World Quest)
		REP_AddGeneral(1883, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "PvP World Quest", 75, "PvP World Quests", "Complete PvP world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Epic Elite World Quests", 250, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Dungeon World Quests", 250, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(1883, 1, 8, "Dreamweavers Emissary", 1500, "Dreamweavers Emissary Emissary", "Complete 4x Dreamweavers world quests while the emissary is available to gain reputation")

		---------------------------
		-- Highmountain Tribe 1828 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1828, 1, 8, 250, {[146938] = 1}, {[146944] = 1})
		REP_AddItems(1828, 1, 8, 1500, {[147412] = 1}, {[150928] = 1})
		---- General (World Quest)
		REP_AddGeneral(1828, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "PvP World Quest", 75, "PvP World Quests", "Complete PvP world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Epic World Quest", 75, "Epic World Quests", "Complete epic world quests with this faction to gain 75-350 reputation.")
		REP_AddGeneral(1828, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Epic Elite World Quests", 250, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Dungeon World Quests", 250, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(1828, 1, 8, "Highmountain Tribe Emissary", 1500, "Highmountain Tribe Emissary", "Complete 4x Highmountain Tribe world quests while the emissary is available to gain reputation")

		---------------------------
		-- The Nightfallen 1859 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1859, 1, 8, 250, {[146940] = 1}, {[146946] = 1})
		REP_AddItems(1859, 1, 8, 750, {[147413] = 1}, {[150930] = 1})
		---- General (World Quest)
		REP_AddGeneral(1859, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1859, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain 150-250 reputation.")
		REP_AddGeneral(1859, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain 250-350 reputation.")
		REP_AddGeneral(1859, 1, 8, "Epic Elite World Quests", 500, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1859, 1, 8, "Dungeon World Quests", 500, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain reputation.")
		REP_AddGeneral(1859, 1, 8, "Raid World Quests", 500, "Raid World Quests", "Complete Raid world quests with this faction to gain reputation.")
		REP_AddGeneral(1859, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Completework order world quests with this faction to gain reputation.")
		REP_AddGeneral(1859, 1, 8, "The Nightfallen Emissary", 1500, "The Nightfallen Emissary", "Complete 4x Nightfallen world quests while the emissary is available to gain reputation")

		---------------------------
		-- The Wardens 1894 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1894, 1, 8, 250, {[146939] = 1}, {[146945] = 1})
		REP_AddItems(1894, 1, 8, 1500, {[147415] = 1}, {[150929] = 1})
		---- General (World Quest)
		REP_AddGeneral(1894, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1894, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain reputation.")
		REP_AddGeneral(1894, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1894, 1, 8, "Epic Elite World Quests", 350, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1894, 1, 8, "Dungeon World Quests", 250, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain 250-500 reputation.")
		REP_AddGeneral(1894, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(1894, 1, 8, "The Wardens Emissary", 1500, "The Wardens Emissary", "Complete 4x Wardens world quests while the emissary is available to gain reputation")

		---------------------------
		-- Valarjar 1948 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(1948, 1, 8, 250, {[146935] = 1}, {[146941] = 1})
		REP_AddItems(1948, 1, 8, 1500, {[147414] = 1}, {[150925] = 1})
		---- General (World Quest)
		REP_AddGeneral(1948, 1, 8, "Normal World Quest", 75, "Normal World Quests", "Complete Normal world quests with this faction to gain reputation.")
		REP_AddGeneral(1948, 1, 8, "PvP World Quest", 75, "PvP World Quests", "Complete PvP world quests with this faction to gain reputation.")
		REP_AddGeneral(1948, 1, 8, "Rare World Quests", 150, "Rare World Quests", "Complete rare world quests with this faction to gain 150-250 reputation.")
		REP_AddGeneral(1948, 1, 8, "Rare Elite World Quests", 250, "Rare Elite World Quests", "Complete rare elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1948, 1, 8, "Epic Elite World Quests", 250, "Epic Elite World Quests", "Complete epic elite world quests with this faction to gain reputation.")
		REP_AddGeneral(1948, 1, 8, "Dungeon World Quests", 250, "Dungeon World Quests", "Complete dungeon world quests with this faction to gain 250-500 reputation.")
		REP_AddGeneral(1948, 1, 8, "Work Order World Quests", 250, "Work Order World Quests", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(1948, 1, 8, "Valarjar Emissary", 1500, "Valarjar Emissary", "Complete 4x Valarjar world quests while the emissary is available to gain reputation")

		---------------------------
		-- Conjurer Margoss 1975 --
		---------------------------
		---- Items
		REP_AddItems(1975, 1, 8, 50, {[138777] = 1})
		REP_AddItems(1975, 1, 8, 500, {[138777] = 10})

		---------------------------
		-- Ilyssia of the Waters 2097 --
		---------------------------
		---- Items
		REP_AddItems(2097, 1, 8, 75, {[146848] = 1})

		---------------------------
		-- Corbyn 2100 --
		---------------------------
		---- Items
		REP_AddItems(2100, 1, 8, 75, {[146961] = 1})

		---------------------------
		-- Impus 2102 --
		---------------------------
		---- Items
		REP_AddItems(2102, 1, 8, 75, {[146963] = 1})

		---------------------------
		-- Sha'leth 2101 --
		---------------------------
		---- Items
		REP_AddItems(2101, 1, 8, 75, {[146962] = 1})

		---------------------------
		-- Keeper Raynae 2098 --
		---------------------------
		---- Items
		REP_AddItems(2098, 1, 8, 75, {[146959] = 1})

		---------------------------
		-- Akule Riverhorn 2099 --
		---------------------------
		---- Items
		REP_AddItems(2099, 1, 8, 75, {[146960] = 1})

		---------------------------
		-- Talons Vengeance 2018 --
		---------------------------
		---- Items
		REP_AddItems(2018, 1, 8, 100, {[142363] = 1})

		---------------------------
		-- Army of the Light 2165 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(2165, 1, 8, 250, {[152958] = 1}, {[152957] = 1})
		REP_AddItems(2165, 1, 8, 750, {[152956] = 1}, {[152955] = 1})
		---- General (World Quest)
		REP_AddGeneral(2165, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Supplies Needed World Quest", 25, "Supplies Needed World Quest", "Complete supplies needed world quests with this faction to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Supplies Needed: Astral Glory", 10, "Supplies Needed: Astral Glory", "Complete Supplies Needed: Astral Glory to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Work Order World Quest", 25, "Work Order World Quest", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Work Order: Astral Glory", 10, "Work Order: Astral Glory", "Complete Work Order: Astral Glory to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Work Order: Tears of the Naaru", 10, "Work Order: Tears of the Naaru", "Complete Supplies Work Order: Tears of the Naaru to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Work Order: Lightblood Elixirs", 10, "Work Order: Lightblood Elixirs", "Complete Work Order: Lightblood Elixirs to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Army of the Light Emissary", 1500, "Army of the Light Emissary", "Complete 4x Army of the Light world quests while the emissary is available to gain reputation")
		---- General (Weekly Quests)
		REP_AddGeneral(2165, 1, 8, "Invasion Onslaught Weekly", 250, "Weekly Quest", "Complete the Invasion Onslaight weekly quest to gain reputation.")
		REP_AddGeneral(2165, 1, 8, "Supplying the Antoran Campaign Weekly", 75, "Weekly Quest", "Complete the Supplying the Antoran Campaign weekly quest to gain reputation.")

		---------------------------
		-- Argussian Reach 2170 --
		---------------------------
		---- Items (Insignia reputation tokens)
		REP_AddItems(2170, 1, 8, 250, {[152959] = 1}, {[152960] = 1})
		REP_AddItems(2170, 1, 8, 750, {[152961] = 1}, {[152954] = 1})
		---- General (World Quest)
		REP_AddGeneral(2170, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Supplies Needed World Quest", 25, "Supplies Needed World Quest", "Complete supplies needed world quests with this faction to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Supplies Needed: Astral Glory", 10, "Supplies Needed: Astral Glory", "Complete Supplies Needed: Astral Glory to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Work Order World Quest", 25, "Work Order World Quest", "Complete work order world quests with this faction to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Work Order: Astral Glory", 10, "Work Order: Astral Glory", "Complete Work Order: Astral Glory to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Work Order: Tears of the Naaru", 10, "Work Order: Tears of the Naaru", "Complete Supplies Work Order: Tears of the Naaru to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Work Order: Lightblood Elixirs", 10, "Work Order: Lightblood Elixirs", "Complete Work Order: Lightblood Elixirs to gain reputation.")
		REP_AddGeneral(2170, 1, 8, "Argussian Reach Emissary", 1500, "Argussian Reach Emissary", "Complete 4x Argussian Reach world quests while the emissary is available to gain reputation")
		---- General (Weekly Quests)
		REP_AddGeneral(2170, 1, 8, "Fuel of a Doomed World Weekly", 250, "Weekly Quest", "Complete the Fuel of a Doomed World weekly quest to gain reputation.")

		if (REP.IsAlliance) then
			-- Alliance
		else
			-- Horde
		end
	end

--------------------------------------------------
-- Factions released 'after' Legion
--------------------------------------------------
	if (REP.AfterLegion) then
		---------------------------
		-- Champions of Azeroth 2164 --
		---------------------------
		---- General
		REP_AddGeneral(2164, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2164, 1, 8, "Champions of Azeroth Emissary", 1500, "Champions of Azeroth Emissary", "Complete 4x Champions of Azeroth world quests while the emissary is available to gain reputation")

		---------------------------
		-- Tortollan Seekers 2163 --
		---------------------------
		---- General
		REP_AddGeneral(2163, 1, 8, "Tortollan Seekers", 175, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2163, 1, 8, "Tortollan Seekers Emissary", 1500, "Tortollan Seekers Emissary", "Complete 3x Tortollan Seekers world quests while the emissary is available to gain reputation")

		---------------------------
		-- Rustbolt Resistance 2391 --
		---------------------------
		---- General
		REP_AddGeneral(2391, 1, 8, "Daily World Quest", 850, "Daily World Quest", "Complete the daily world quest to gain reputation with this faction")
		REP_AddGeneral(2391, 1, 8, "Daily Pet Battle World Quest", 75, "Daily Pet Battle", "Complete the daily pet battle world quest to gain reputation with this faction")
		REP_AddGeneral(2391, 1, 8, "PVP Daily Quest", 200, "Daily PVP Quest", "Complete a PVP daily quest to gain reputation with this faction")
		REP_AddGeneral(2391, 1, 8, "Daily Quests 75 rep", 75, "Daily Quests", "Daily quests that provide 75 reputation")
		REP_AddGeneral(2391, 1, 8, "Daily Quests 150 rep", 150, "Daily Quests", "Daily quests that provide 150 reputation")

		---------------------------
		-- Rajanji 2045 --
		---------------------------
		---- Quests
		REP_AddQuest(2415, 1, 8, 57008, 500)
		REP_AddQuest(2415, 1, 8, 57728, 500)
		REP_AddQuest(2415, 1, 8, 56064, 1500)
		---- General
		REP_AddGeneral(2415, 1, 8, "Daily Quests 125 rep", 125, "Daily Quests", "Daily quests that provide 125 reputation")
		REP_AddGeneral(2415, 1, 8, "Threat objectives 50-75 rep", 50, "Threat Objectives", "Completing threat objectives marked by a skull or crossed swords on the minimap provide 50-75 reputation.")
		REP_AddGeneral(2415, 1, 8, "Daily Pet Battle World Quest", 75, "Daily Pet Battle", "Complete the daily pet battle world quest to gain reputation with this faction")
		-- TODO: Figure out why this quest was listed for this faction
		-- REP_AddQuest(2045, 1, 8, 46735, 150, {[1342] = 100})

		---------------------------
		-- Uldum Accord 2417 --
		---------------------------
		---- Quests
		REP_AddQuest(2417, 1, 8, 55350, 500)
		REP_AddQuest(2417, 1, 8, 56308, 500)
		REP_AddQuest(2417, 1, 8, 57157, 1500)
		---- General
		REP_AddGeneral(2417, 1, 8, "Daily Quests 125 rep", 125, "Daily Quests", "Daily quests that provide 125 reputation")
		REP_AddGeneral(2417, 1, 8, "Threat objectives 50-75 rep", 50, "Threat Objectives", "Completing threat objectives marked by a skull or crossed swords on the minimap provide 50-75 reputation.")
		REP_AddGeneral(2417, 1, 8, "Daily Pet Battle World Quest", 75, "Daily Pet Battle", "Complete the daily pet battle world quest to gain reputation with this faction")

		---------------------------
		-- Chromie 2135 --
		---------------------------
		---- General
		REP_AddGeneral(2135, 1, 8, "Run Chromie Scenarios In Dragonblight", 3000, "Complete Chromie Scenarios", "Complete Chromie time scenarios in Dragonblight")

		if (REP.IsAlliance) then
			---------------------------
			-- Proudmoore Admiralty 2160 --
			---------------------------
			---- General
			REP_AddGeneral(2160, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2160, 1, 8, "Proudmoore Admiralty Emissary", 1500, "Proudmoore Admiralty Emissary", "Complete 4x Proudmoore Admiralty world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2160, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- Order of Embers 2161 --
			---------------------------
			---- General
			REP_AddGeneral(2161, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2161, 1, 8, "Order of Embers Emissary", 1500, "Order of Embers Emissary", "Complete 4x Order of Embers world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2161, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- Storm's Wake 2162 --
			---------------------------
			---- General
			REP_AddGeneral(2162, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2162, 1, 8, "Storm's Wake Emissary", 1500, "Storm's Wake Emissary", "Complete 4x Storm's Wake world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2162, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- 7th Legion 2159 --
			---------------------------
			---- General
			REP_AddGeneral(2159, 1, 8, "World Quests 75 rep", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2159, 1, 8, "World Quests 150 rep", 150, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2159, 1, 8, "7th Legion Emissary", 1500, "7th Legion Emissary", "Completing 4x 7th Legion world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2159, 1, 8, "Warfront Contribution Quests", 150, "Warfront Contribution Quests", "Complete any warfront contribution quest when available to gain reputation")
			REP_AddGeneral(2159, 1, 8, "Island Expeditions Weekly", 1500, "Island Expeditions Weekly", "Complete the Island Expeditions weekly Azerite for the Alliance to gain reputation")
			REP_AddGeneral(2159, 1, 8, "Call to Arms Quest", 75, "Call to Arms Quest", "Complete Call to Arms quest to gain reputation")
			REP_AddGeneral(2159, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- Waveblade Ankoan 2400 --
			---------------------------
			---- Items
			REP_AddItems(2400, 1, 8, 150, {[170152] = 1})
			---- General
			REP_AddGeneral(2400, 1, 8, "Waveblade Ankoan World Quests", 75, "Waveblade Ankoan Emissary", "Complete Waveblade Ankoan world quests to gain reputation")
			REP_AddGeneral(2400, 1, 8, "Waveblade Ankoan Emissary", 1500, "Waveblade Ankoan Emissary", "Complete 4x Waveblade Ankoan world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2400, 1, 8, "Laboratory of Mardivas Weekly", 500, "Laboratory of Mardivas Weekly", "Complete the Laboratory of Mardivas weekly quest to gain reputation")
			REP_AddGeneral(2400, 1, 8, "Battle for Nazjatar PVP World Quest", 500, "Battle for Nazjatar PVP World Quest", "Complete the Battle for Nazjatar PVP world quest to gain reputation")
			REP_AddGeneral(2400, 1, 8, "Summons from the Depths event", 150, "Summons from the Depths event", "Complete the Summons from the Depths event to have a chance at gaining reputation")
			REP_AddGeneral(2400, 1, 8, "Bounties / Requisition Quests", 50, "Bountes / Requisition Quets", "Complete bounties and requisition quests to gain reputation")

			---------------------------
			-- Honeyback Hive 2395 --
			---------------------------
			---- Items
			REP_AddItems(2395, 1, 8, 20, {[168822] = 1}) -- Thin Jelly
			REP_AddItems(2395, 1, 8, 80, {[168825] = 1}) -- Rich Jelly
			REP_AddItems(2395, 1, 8, 160, {[168828] = 1}) -- Royal Jelly
			---- Mobs
			REP_AddMob(2395, 1, 8, "Honey Smasher (Daily)", 500)
			---- General
			REP_AddGeneral(2395, 1, 8, "Harvester Event rare mob quest drop (Weekly)", 750, "Harvester Event rare mob quest drop", "Quest items have a chance to drop from a harvester event if the event has a relevant rare.")
		else
			---------------------------
			-- Zandalari Empire 2103 --
			---------------------------
			---- General
			REP_AddGeneral(2103, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2103, 1, 8, "Zandalari Empire Emissary", 1500, "Zandalari Empire Emissary", "Complete 4x Zandalari Empire world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2103, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- Talanji's Expedition 2156 --
			---------------------------
			---- General
			REP_AddGeneral(2156, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2156, 1, 8, "Talanji's Expedition Emissary", 1500, "Talanji's Expedition Emissary", "Complete 4x Talanji's Expedition world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2156, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- Voldunai 2158 --
			---------------------------
			---- General
			REP_AddGeneral(2158, 1, 8, "World Quests", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2158, 1, 8, "Voldunai Emissary", 1500, "Voldunai Emissary", "Complete 4x Voldunai world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2158, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- The Honorbound 2157 --
			---------------------------
			---- General
			REP_AddGeneral(2157, 1, 8, "World Quests 75 rep", 75, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2157, 1, 8, "World Quests 150 rep", 150, "World Quests", "Complete world quests with this faction to gain reputation")
			REP_AddGeneral(2157, 1, 8, "The Honorbound Emissary", 1500, "The Honorbound Emissary", "Complete 4x The Honorbound world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2157, 1, 8, "Warfront Contribution Quests", 150, "Warfront Contribution Quests", "Complete any warfront contribution quest when available to gain reputation")
			REP_AddGeneral(2157, 1, 8, "Island Expeditions Weekly", 1500, "Island Expeditions Weekly", "Complete the Island Expeditions weekly Azerite for the Horde to gain reputation")
			REP_AddGeneral(2157, 1, 8, "Call to Arms Quest", 75, "Call to Arms Quest", "Complete Call to Arms quest to gain reputation")
			REP_AddGeneral(2157, 1, 8, "Naga Attack! World Quest", 150, "Naga Attack! World Quest", "Complete the Naga Attack! world quest to gain reputation")

			---------------------------
			-- The Unshackled 2373 --
			---------------------------
			---- Items
			REP_AddItems(2373, 1, 8, 150, {[170152] = 1})
			---- General
			REP_AddGeneral(2373, 1, 8, "The Unshackled World Quests", 75, "The Unshackled Emissary", "Complete The Unshackled world quests to gain reputation")
			REP_AddGeneral(2373, 1, 8, "The Unshackled Emissary", 1500, "The Unshackled Emissary", "Complete 4x The Unshackled world quests while the emissary is available to gain reputation")
			REP_AddGeneral(2373, 1, 8, "Laboratory of Mardivas Weekly", 500, "Laboratory of Mardivas Weekly", "Complete the Laboratory of Mardivas weekly quest to gain reputation")
			REP_AddGeneral(2373, 1, 8, "Battle for Nazjatar PVP World Quest", 500, "Battle for Nazjatar PVP World Quest", "Complete the Battle for Nazjatar PVP world quest to gain reputation")
			REP_AddGeneral(2373, 1, 8, "Summons from the Depths event", 150, "Summons from the Depths event", "Complete the Summons from the Depths event to have a chance at gaining reputation")
			REP_AddGeneral(2373, 1, 8, "Bounties / Requisition Quests", 50, "Bountes / Requisition Quets", "Complete bounties and requisition quests to gain reputation")
		end
	end

--------------------------------------------------
-- Factions released 'after' Battle for Azeroth
--------------------------------------------------
	if (REP.AfterBfA) then
		---------------------------
		-- The Ascended 2407 --
		---------------------------
		---- General
		REP_AddGeneral(2407, 1, 8, "World Quests", 125, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2407, 1, 8, "A Valuable Find Dungeon Quest", 500, "Complete a Valuable Find Dungeon Quest", "Weekly quest from Ta'lan the Antiquary in Oribos")
		REP_AddGeneral(2407, 1, 8, "Trading Favors Dungeon Quest", 500, "Complete Trading Favors Dungeon Quest", "Weekly quest from Finder Ta'sul in Oribos")
		REP_AddGeneral(2407, 1, 8, "Kyrian Assault", 1000, "Complete Bi-Weekly Maw Assault", "Assault in the maw. Only one assault we be active at a time")
		REP_AddGeneral(2407, 1, 8, "Rare Bastion Calling", 1500, "Complete Rare Bastion Calling", "Calling rewards Blue quality cache")
		REP_AddGeneral(2407, 1, 8, "Epic Bastion Calling", 2000, "Complete Epic Bastion Calling", "Calling rewards Purple quality cache")

		---------------------------
		-- The Undying Army 2410 --
		---------------------------
		---- General
		REP_AddGeneral(2410, 1, 8, "World Quests", 125, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2410, 1, 8, "A Valuable Find Dungeon Quest", 500, "Complete a Valuable Find Dungeon Quest", "Weekly quest from Ta'lan the Antiquary in Oribos")
		REP_AddGeneral(2410, 1, 8, "Trading Favors Dungeon Quest", 500, "Complete Trading Favors Dungeon Quest", "Weekly quest from Finder Ta'sul in Oribos")
		REP_AddGeneral(2410, 1, 8, "Maldraxxus Assault", 1000, "Complete Bi-Weekly Maw Assault", "Assault in the maw. Only one assault we be active at a time")
		REP_AddGeneral(2410, 1, 8, "Rare Maldraxxus Calling", 1500, "Complete Rare Maldraxxus Calling", "Calling rewards Blue quality cache")
		REP_AddGeneral(2410, 1, 8, "Epic Maldraxxus Calling", 2000, "Complete Epic Maldraxxus Calling", "Calling rewards Purple quality cache")

		---------------------------
		-- Court of Harvesters 2413 --
		---------------------------
		---- General
		REP_AddGeneral(2413, 1, 8, "World Quests", 125, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2413, 1, 8, "A Valuable Find Dungeon Quest", 500, "Complete a Valuable Find Dungeon Quest", "Weekly quest from Ta'lan the Antiquary in Oribos")
		REP_AddGeneral(2413, 1, 8, "Trading Favors Dungeon Quest", 500, "Complete Trading Favors Dungeon Quest", "Weekly quest from Finder Ta'sul in Oribos")
		REP_AddGeneral(2413, 1, 8, "Venthyr Assault", 1000, "Complete Bi-Weekly Maw Assault", "Assault in the maw. Only one assault we be active at a time")
		REP_AddGeneral(2413, 1, 8, "Rare Revendreth Calling", 1500, "Complete Rare Revendreth Calling", "Calling rewards Blue quality cache")
		REP_AddGeneral(2413, 1, 8, "Epic Revendreth Calling", 2000, "Complete Epic Revendreth Calling", "Calling rewards Purple quality cache")

		---------------------------
		-- Ve'nari 2432 --
		---------------------------
		---- Mobs
		REP_AddMob(2432, 1, 8, "Adjutant Dekaris", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Orophea", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Soulforger Rhovus", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Conjured Death", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Eternas the Tormentor", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Obolos <Prime Collector>", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Yero the Skittish", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Nascent Devourer", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Darklord Taraxis", 80, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Silent Soulstalker", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Stygian Stonecrusher", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Deadsoul Hatcher", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Screaming Shade", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Relic Breaker Krelva", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Consumption", 80, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Borr-Geth", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Ekphoras, Herald of Grief", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Apholeias, Herald of Loss", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Talaporas, Herald of Pain", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Eketra <The Impaler>", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Morguliax <Lord of Decapitation>", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Ikras the Devourer", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Shadeweaver Zeris", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Dolos <Death's Knife>", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Thanassos <Death's Voice>", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Exos, Herald of Dominion ", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Darithis the Bleak", 100, zone.The_Maw)
		REP_AddMob(2432, 1, 8, "Consumption (Rare Elite)", 100, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Observer Yorik", 100, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Yarxhov the Pillager", 100, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Towering Exterminator", 150, zone.Korthia)
		REP_AddMob(2432, 1, 8, "Soul Fragment", 150, zone.Korthia)
		---- Quests
		REP_AddQuest(2432, 1, 8, 63050, 75)
		REP_AddQuest(2432, 1, 8, 63166, 75)
		REP_AddQuest(2432, 1, 8, 60732, 75)
		REP_AddQuest(2432, 1, 8, 63062, 75)
		REP_AddQuest(2432, 1, 8, 63100, 75)
		REP_AddQuest(2432, 1, 8, 63039, 75)
		REP_AddQuest(2432, 1, 8, 63043, 75)
		REP_AddQuest(2432, 1, 8, 63047, 75)
		REP_AddQuest(2432, 1, 8, 63179, 75)
		REP_AddQuest(2432, 1, 8, 63031, 75)
		REP_AddQuest(2432, 1, 8, 60775, 75)
		REP_AddQuest(2432, 1, 8, 61088, 75)
		REP_AddQuest(2432, 1, 8, 60622, 75)
		REP_AddQuest(2432, 1, 8, 61079, 75)
		REP_AddQuest(2432, 1, 8, 60646, 75)
		REP_AddQuest(2432, 1, 8, 60762, 75)
		REP_AddQuest(2432, 1, 8, 61104, 75)
		REP_AddQuest(2432, 1, 8, 61103, 75)
		REP_AddQuest(2432, 1, 8, 61075, 75)
		REP_AddQuest(2432, 1, 8, 61765, 75)
		REP_AddQuest(2432, 1, 8, 62234, 75)
		REP_AddQuest(2432, 1, 8, 62214, 75)
		REP_AddQuest(2432, 1, 8, 63072, 75)
		REP_AddQuest(2432, 1, 8, 62239, 75)
		REP_AddQuest(2432, 1, 8, 63069, 75)
		REP_AddQuest(2432, 1, 8, 64541, 1000)
		---- General
		REP_AddGeneral(2432, 1, 8, "Drifting Sorrow (The Maw)", 40, "Special encounter", "Located at /way 32, 21")
		REP_AddGeneral(2432, 1, 8, "Razkazzar (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Huwerath (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Agonix (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Akros (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Sanngror the Torturer (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Skittering Broodmother (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Odalrik (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Dath Rezara (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Dartanos (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Orrholyn (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Soulsmith Yol-Mattar (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Cyrixia (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Krala (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Malevolent Stygia (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Houndmaster Vasanok (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Valis the Cruel (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Stygian Incinerator (The Maw)", 40, "Special encounter")
		REP_AddGeneral(2432, 1, 8, "Tormentors of Torghast (The Maw)", 200, "Complete Totementors of Torghast Weekly", "Can only be completed once a week")
		REP_AddGeneral(2432, 1, 8, "Wrath of the Jailer (The Maw)", 250, "Complete Wrath of the Jailer Weekly", "Can only be completed once a week")
		REP_AddGeneral(2432, 1, 8, "Beastwarren Hunt Boss (The Maw)", 525, "Complete Beastwarren Event", "Can be completed twice a week, Tuesday 11am EST & Friday 11pm EST")

		---------------------------
		-- The Avowed 2439 --
		---------------------------
		---- Mobs
		REP_AddMob(2439, 5, 8, "Inquisitor", 50, zone.Revendreth)
		REP_AddMob(2439, 5, 8, "High Inquisitor", 100, zone.Revendreth)
		REP_AddMob(2439, 5, 8, "Grand Inquisitor", 200, zone.Revendreth)
		---- Instances
		REP_AddInstance(2439, 1, 6, zone.Halls_of_Atonement, 750, false)

		---------------------------
		-- Stitchmasters 2462 --
		---------------------------
		---- Quests
		REP_AddQuest(2462, 1, 8, 58525, 750)
		REP_AddQuest(2462, 1, 8, 61511, 750)
		REP_AddQuest(2462, 1, 8, 57634, 750)
		REP_AddQuest(2462, 1, 8, 60237, 750)
		REP_AddQuest(2462, 1, 8, 58432, 750)
		REP_AddQuest(2462, 1, 8, 60765, 750)
		REP_AddQuest(2462, 1, 8, 56470, 750)
		REP_AddQuest(2462, 1, 8, 60291, 750)
		REP_AddQuest(2462, 1, 8, 60340, 750)
		REP_AddQuest(2462, 1, 8, 62213, 750)
		REP_AddQuest(2462, 1, 8, 59043, 750)
		REP_AddQuest(2462, 1, 8, 62276, 750)
		REP_AddQuest(2462, 1, 8, 60342, 750)
		REP_AddQuest(2462, 1, 8, 58992, 750)
		REP_AddQuest(2462, 1, 8, 62194, 750)
		REP_AddQuest(2462, 1, 8, 59293, 750)
		REP_AddQuest(2462, 1, 8, 62407, 750)
		REP_AddQuest(2462, 1, 8, 61510, 750)
		REP_AddQuest(2462, 1, 8, 62244, 750)
		REP_AddQuest(2462, 1, 8, 61522, 750)
		REP_AddQuest(2462, 1, 8, 61523, 750)
		REP_AddQuest(2462, 1, 8, 62261, 750)
		REP_AddQuest(2462, 1, 8, 58515, 750)
		REP_AddQuest(2462, 1, 8, 62256, 750)
		REP_AddQuest(2462, 1, 8, 61509, 750)
		REP_AddQuest(2462, 1, 8, 62217, 750)
		REP_AddQuest(2462, 1, 8, 62195, 750)
		REP_AddQuest(2462, 1, 8, 62232, 750)
		REP_AddQuest(2462, 1, 8, 61996, 750)
		REP_AddQuest(2462, 1, 8, 62294, 750)
		REP_AddQuest(2462, 1, 8, 62216, 750)
		REP_AddQuest(2462, 1, 8, 62041, 750)
		REP_AddQuest(2462, 1, 8, 59126, 750)

		---------------------------
		-- Marasmius 2463 --
		---------------------------
		---- TODO: Fix Covenant specific reputations
		--  (Night Fae Only) Will not work until Blizz adds rep to Faction tab
		-- REP_AddQuest(2463, 1, 8, 62615, 350)
		-- REP_AddQuest(2463, 1, 8, 62614, 350)
		-- REP_AddQuest(2463, 1, 8, 62611, 350)
		-- REP_AddQuest(2463, 1, 8, 62610, 350)
		-- REP_AddQuest(2463, 1, 8, 62608, 350)
		-- REP_AddQuest(2463, 1, 8, 62607, 350)
		-- REP_AddQuest(2463, 1, 8, 62606, 350)
		-- REP_AddQuest(2463, 1, 8, 60175, 350)
		-- REP_AddQuest(2463, 1, 8, 57455, 500)
		-- REP_AddQuest(2463, 1, 8, 57458, 500)
		-- REP_AddQuest(2463, 1, 8, 57459, 500)
		-- REP_AddQuest(2463, 1, 8, 57463, 500)
		-- REP_AddQuest(2463, 1, 8, 57583, 500)
		-- REP_AddQuest(2463, 1, 8, 60153, 500)
		-- REP_AddQuest(2463, 1, 8, 62382, 500)
		-- REP_AddQuest(2463, 1, 8, 62296, 500)
		-- REP_AddQuest(2463, 1, 8, 62453, 500)
		-- REP_AddQuest(2463, 1, 8, 60188, 650)
		-- REP_AddQuest(2463, 1, 8, 62263, 650)
		-- REP_AddQuest(2463, 1, 8, 62400, 650)
		-- REP_AddQuest(2463, 1, 8, 62417, 650)
		-- REP_AddQuest(2463, 1, 8, 62459, 650)
		-- REP_AddQuest(2463, 1, 8, 62465, 650)
		-- REP_AddQuest(2463, 1, 8, 62466, 650)

		---------------------------
		-- Court of Night 2464 --
		---------------------------
		---- TODO: Fix Covenant specific reputations
		---- Quests
		REP_AddQuest(2464, 1, 8, 62081, 750)
		REP_AddQuest(2464, 1, 8, 62224, 750)
		REP_AddQuest(2464, 1, 8, 62188, 750)
		REP_AddQuest(2464, 1, 8, 62155, 750)
		REP_AddQuest(2464, 1, 8, 61950, 750)
		REP_AddQuest(2464, 1, 8, 61875, 750)
		REP_AddQuest(2464, 1, 8, 61985, 750)
		REP_AddQuest(2464, 1, 8, 62160, 750)
		REP_AddQuest(2464, 1, 8, 61968, 750)
		REP_AddQuest(2464, 1, 8, 62057, 750)
		REP_AddQuest(2464, 1, 8, 62068, 1000)
		REP_AddQuest(2464, 1, 8, 61717, 1000)
		REP_AddQuest(2464, 1, 8, 62051, 1000)
		REP_AddQuest(2464, 1, 8, 61394, 1000)

		---------------------------
		-- The Wild Hunt 2465 --
		---------------------------
		---- General
		REP_AddGeneral(2465, 1, 8, "World Quests", 125, "World Quests", "Complete world quests with this faction to gain reputation")
		REP_AddGeneral(2465, 1, 8, "A Valuable Find Dungeon Quest", 500, "Complete a Valuable Find Dungeon Quest", "Weekly quest from Ta'lan the Antiquary in Oribos")
		REP_AddGeneral(2465, 1, 8, "Trading Favors Dungeon Quest", 500, "Complete Trading Favors Dungeon Quest", "Weekly quest from Finder Ta'sul in Oribos")
		REP_AddGeneral(2465, 1, 8, "Night Fae Assault", 1000, "Complete Bi-Weekly Maw Assault", "Assault in the maw. Only one assault we be active at a time")
		REP_AddGeneral(2465, 1, 8, "Rare Ardenweald Calling", 1500, "Complete Rare Ardenweald Calling", "Calling rewards Blue quality cache")
		REP_AddGeneral(2465, 1, 8, "Epic Ardenweald Calling", 2000, "Complete Epic Ardenweald Calling", "Calling rewards Purple quality cache")

		---------------------------
		-- Death's Advance 2470 --
		---------------------------
		---- Quests
		REP_AddQuest(2470, 1, 8, 63949, 750)
		---- General
		REP_AddGeneral(2470, 1, 8, "Korthia Dailes", 125, "Complete Korthia Dailies")
		REP_AddGeneral(2470, 1, 8, "Maw World Quest", 200, "World Quests", "Complete Maw world quests")
		REP_AddGeneral(2470, 1, 8, "Maw Assault", 350, "Complete Covenant Maw Assault", "Complete assault in the Maw")

		---------------------------
		-- The Archivists' Codex 2472 --
		---------------------------
		---- Items
		REP_AddItems(2472, 1, 8, 1, {[186685] = 2})
		REP_AddItems(2472, 1, 8, 4, {[187322] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187457] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187324] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187323] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187460] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187458] = 1})
		REP_AddItems(2472, 1, 8, 4, {[187459] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187465] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187327] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187463] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187325] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187326] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187462] = 1})
		REP_AddItems(2472, 1, 8, 24, {[187478] = 1})
		REP_AddItems(2472, 1, 8, 50, {[187336] = 1})
		REP_AddItems(2472, 1, 8, 50, {[187466] = 1})
		REP_AddItems(2472, 1, 8, 50, {[187332] = 1})
		REP_AddItems(2472, 1, 8, 50, {[187328] = 1})
		REP_AddItems(2472, 1, 8, 50, {[187334] = 1})
		REP_AddItems(2472, 1, 8, 75, {[187330] = 1})
		REP_AddItems(2472, 1, 8, 75, {[187329] = 1})
		REP_AddItems(2472, 1, 8, 75, {[187467] = 1})
		REP_AddItems(2472, 1, 8, 75, {[187331] = 1})
		REP_AddItems(2472, 1, 8, 150, {[187311] = 1})
		REP_AddItems(2472, 1, 8, 150, {[187333] = 1})
		REP_AddItems(2472, 1, 8, 150, {[187350] = 1})
		REP_AddItems(2472, 1, 8, 150, {[187335] = 1})
		---- General
		REP_AddGeneral(2472, 1, 8, "Cataloged Research", 1, "Cataloged Research", "Vendor Turn in 1 rep per 2 Research")

		---------------------------
		-- The Enlightened 2478 --
		---------------------------
		---- Mobs
		REP_AddMob(2478, 1, 8, "Corrupted Architect", 10, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Vitiane", 10, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Akkaris", 15, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Furidian", 10, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Chitali the Eldest", 10, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Garudeon", 15, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Mother Phestis", 15, zone.Zereth_Mortis)
		REP_AddMob(2478, 1, 8, "Zatojin", 10, zone.Zereth_Mortis)
		---- Items
		REP_AddItems(2478, 1, 8, 75, {[190339] = 1})
		REP_AddItems(2478, 1, 8, 75, {[190941] = 1})
		---- General
		REP_AddGeneral(2478, 1, 8, "Zereth Mortis World Boss", 500, "Zereth Mortis World Boss", "Complete Zereth Mortis world boss once a week")

		if (REP.IsAlliance) then
			-- Alliance
		else
			-- Horde
		end
	end

--------------------------------------------------
-- Factions released 'after' Shadowlands
--------------------------------------------------
	if (REP.AfterShadowLands) then
		---------------------------
		-- Maruuk Centaur 2503 (Goes to 25 Renown) --
		---------------------------
		---- Quests
		REP_AddQuest(2503, 1, 25, "Teeth For A Tooth", 150, nil, nil, true, true) -- Teeth For A Tooth
		REP_AddQuest(2503, 1, 25, "Where Rivers Sleep", 150, nil, nil, true, true) -- Where Rivers Sleep
		REP_AddQuest(2503, 1, 25, "Counting Argali", 150, nil, nil, true, true) -- Counting Argali
		REP_AddQuest(2503, 1, 25, "Delicacy in the Dark", 150, nil, nil, true, true) -- Delicacy in the Dark
		REP_AddQuest(2503, 1, 25, "Scaling Ever Higher", 150, nil, nil, true, true) -- Scaling Ever Higher
		REP_AddQuest(2503, 1, 25, "Of Wind And Water", 150, nil, nil, true, true) -- Of Wind And Water
		REP_AddQuest(2503, 1, 25, "Darkened Clouds", 150, nil, nil, true, true) -- Darkened Clouds
		REP_AddQuest(2503, 1, 25, "An Apportunistic Approach", 150, nil, nil, true, true) -- An Apportunistic Approach
		REP_AddQuest(2503, 1, 25, "Tradition Not Forgotten", 150, nil, nil, true, true) -- Tradition Not Forgotten
		REP_AddQuest(2503, 1, 25, "Duck, Duck, Trap", 150, nil, nil, true, true) -- Duck, Duck, Trap
		REP_AddQuest(2503, 1, 25, "Thundering Plains", 300, nil, nil, true, true) -- Thundering Plains
		REP_AddQuest(2503, 1, 25, "The Best Defense...", 300, nil, nil, true, true) -- The Best Defense...
		REP_AddQuest(2503, 1, 25, "Blood of Dragons", 300, nil, nil, true, true) -- Blood of Dragons
		REP_AddQuest(2503, 1, 25, "Bakar Dream of Lost Argali", 150, nil, nil, true, true) -- Bakar Dream of Lost Argali
		REP_AddQuest(2503, 1, 25, "Draconic Defensive", 150, nil, nil, true, true) -- Draconic Defensive
		---- Items
		REP_AddItems(2503, 1, 25, 25, {[200093] = 1}, nil, true) -- Centaur Hunting Trophy
		REP_AddItems(2503, 1, 25, 500, {[200093] = 20}, nil, true) -- Centaur Hunting Trophy
    REP_AddItems(2503, 1, 25, 50, {[200288] = 1}, nil, true) -- Maruuk Centaur Insignia

		---------------------------
		-- Dragonscale Expedition 2507 (Goes to 25 Renown) --
		---------------------------
    ---- Quests
    REP_AddQuest(2507, 1, 25, 72259, 30, {[201411] = 1}, nil, true, true) -- Vault Artifacts
    REP_AddQuest(2507, 1, 25, 72260, 150, {[201411] = 5}, nil, true, true) -- Vault Artifacts
		---- Items
		REP_AddItems(2507, 1, 25, 15, {[192055] = 1}, nil, true) -- Dragon Isles Artifact
    REP_AddItems(2507, 1, 25, 50, {[200285] = 1}, nil, true) -- Dragonscale Expedition Insignia

		---------------------------
		-- Valdrakken Accord 2510 (Goes to 30 Renown) --
		---------------------------
    ---- Quests
		REP_AddQuest(2510, 1, 30, 66130, 50, {[191264] = 1}, nil, true, true) -- Unlocking Our Past QuestID: 66130
		---- Items
		REP_AddItems(2510, 1, 30, 15, {[199906] = 1}, nil, true) -- Titan Relic
    REP_AddItems(2510, 1, 30, 50, {[200289] = 1}, nil, true) -- Valdrakken Accord Insignia
		REP_AddItems(2510, 5, 30, 250, {[200072] = 1}, nil, true) -- Dragonbane Keep Strongbox
		---- General
    REP_AddGeneral(2510, 1, 30, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.", nil, nil, true)
		REP_AddGeneral(2510, 1, 30, "Dragon Isles World Boss", 150, "Dragon Isles World Boss", "Defeat Dragon Isles world boss once a week", nil, nil, true)
    REP_AddGeneral(2510, 5, 30, "Siege on Dragonbane Keep", 50, "Siege on Dragonbane Keep", "Complete the Siege on Dragonbane Keep event", nil, nil, true)
    REP_AddGeneral(2510, 5, 30, "First 'Siege on Dragonbane Keep' event of the week", 250, "Siege on Dragonbane Keep", "Complete the Siege on Dragonbane Keep event", nil, nil, true)

		---------------------------
		-- Iskaara Tuskarr 2511 (Goes to 30 Renown) --
		---------------------------
		---- Quests
    REP_AddQuest(2511, 1, 30, 70926, 75, {[200071] = 1}, nil, true, true) -- Stolen Totems QuestID: 70926
		REP_AddQuest(2511, 1, 30, 70927, 75, {[200071] = 5}, nil, true, true) -- More Stolen Totems QuestID: 70927
    REP_AddQuest(2511, 1, 30, 70893, 500, nil, nil, true, true) -- Community Feast QuestID: 70893
    REP_AddQuest(2511, 4, 30, 70199, 100, {[194730] = 20}, nil, true, true) -- Catch and Release: Scalebelly Mackerel QuestID: 70199
    REP_AddQuest(2511, 4, 30, 70200, 100, {[194966] = 20}, nil, true, true) -- Catch and Release: Thousandbite Piranha QuestID: 70200
    REP_AddQuest(2511, 4, 30, 70201, 100, {[194967] = 20}, nil, true, true) -- Catch and Release: Aileron Seamoth QuestID: 70201
    REP_AddQuest(2511, 4, 30, 70202, 100, {[194968] = 20}, nil, true, true) -- Catch and Release: Cerulean Spinefish QuestID: 70202
    REP_AddQuest(2511, 4, 30, 70203, 100, {[194969] = 20}, nil, true, true) -- Catch and Release: Temporal Dragonhead QuestID: 70203
    REP_AddQuest(2511, 4, 30, 70935, 200, {[194970] = 20}, nil, true, true) -- Catch and Release: Islefin Dorado QuestID: 70935
		---- Items
		-- REP_AddItems(2511, 1, 30, 15, {[200071] = 1}, nil, true) -- Sacred Tuskarr Totem
    REP_AddItems(2511, 1, 30, 50, {[200287] = 1}, nil, true) -- Iskaara Tuskarr Insignia
    ---- General
    REP_AddGeneral(2511, 1, 30, "Chef tasks (Community Feast)", 25, "Chef tasks (Community Feast)", "Complete chef tasks during the 'Community Feast'.", nil, nil, true)
    REP_AddGeneral(2511, 1, 30, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.", nil, nil, true)
		---------------------------
		-- Wrathion 2517 --
		---------------------------
		---- Quests
		REP_AddQuest(2517, 1, 6, 66130, 250, {[191264] = 1}, nil, true, true) -- Unlocking Our Past QuestID: 66130
    REP_AddQuest(2517, 1, 6, 66133, 1000, {[191255] = 1}, nil, true, true) -- Keys of Loyalty QuestID: 66133
    ---- Mobs
		REP_AddMob(2517, 1, 6, "Shas'ith", 250, zone.The_Waking_Shores, nil, true)
    REP_AddMob(2517, 1, 6, "Morchok", 100, zone.The_Waking_Shores, nil, true)
    ---- Items
    REP_AddItems(2517, 1, 6, 50, {[201991] = 1}) -- Sargha's Signet

		---------------------------
		-- Sabellian 2518 --
		---------------------------
		---- Quests
		REP_AddQuest(2518, 1, 6, 66131, 250, {[191264] = 1}, nil, true, true) -- Unlocking Our Past QuestID: 66131
    REP_AddQuest(2518, 1, 6, 66805, 1000, {[191255] = 1}, nil, true, true) -- Keys of Loyalty QuestID: 66805
    ---- Mobs
		REP_AddMob(2518, 1, 6, "Death's Shadow", 250, zone.The_Waking_Shores, nil, true)
    REP_AddMob(2518, 1, 6, "Morchok", 100, zone.The_Waking_Shores, nil, true)
    ---- Items
    REP_AddItems(2518, 1, 6, 50, {[200224] = 1}) -- Mark of Sargha

    if (REP.IsAlliance) then
      ---------------------------
      -- Obsidian Warders 2524 --
      ---------------------------
      ---- General
      REP_AddGeneral(2524, 1, 8, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.")
    else
      ---------------------------
      -- Dark Talons 2523 --
      ---------------------------
      ---- General
      REP_AddGeneral(2523, 1, 8, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.")
    end

		---------------------------
		-- Winterpelt Furbolg 2526 --
		---------------------------

		---------------------------
		-- Artisan's Consortium - Dragon Isles Branch 2544 --
		---------------------------
    ---- General
    REP_AddGeneral(2544, 1, 8, "World Quests", 100, "World Quests", "Complete world quests with this faction while having a 'Contract: Artisan's Consortium' active to gain reputation.")

		---------------------------
		-- Cobalt Assembly 2550 --
		---------------------------
    ---- General
    REP_AddGeneral(2550, 1, 8, "Uncommon Moderate Arcana from Sundered Flame enemies", 15, "Sundered Flame enemies", "Defeat Sundered Flame enemies near the Cobalt Assembly.")
    REP_AddGeneral(2550, 1, 8, "Rare Major Arcana from Sundered Flame enemies", 45, "Sundered Flame enemies", "Defeat Sundered Flame enemies near the Cobalt Assembly.")

    ---------------------------
		-- Soridormi 2553 --
		---------------------------
    ---- Instances
    REP_AddInstance(2553, 1, 8, zone.Dawn_Of_The_Infinite, 500)
    REP_AddInstance(2553, 1, 8, zone.Dawn_Of_The_Infinite, 2000, true)

    ---------------------------
		-- Loamm Niffen 2564 (Goes to 20 Renown) --
		---------------------------
    ---- Quests
		REP_AddQuest(2564, 1, 20, 75665, 500, nil, nil, true, true) -- A Worthy Ally: Loamm Niffen QuestID: 75665
    ---- Items
    REP_AddItems(2564, 1, 20, 50, {[205365] = 1}, nil, true) -- Loamm Niffen Insignia
    ---- General
    REP_AddGeneral(2564, 1, 20, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.", nil, nil, true)
    REP_AddGeneral(2564, 5, 20, "Researchers Under Fire", 250, "Researchers Under Fire", "Complete the Researchers Under Fire event", nil, nil, true)

    ---------------------------
		-- Dream Wardens 2574 (Goes to 20 Renown) --
		---------------------------
    ---- Quests
    REP_AddQuest(2574, 1, 20, 78444, 500, nil, nil, true, true) -- QuestID: 78444 - A Worthy Ally: Dream Wardens
    ---- Items
		REP_AddItems(2574, 1, 20, 25, {[211303] = 1}, nil, true) -- Dryad's Supply Pouch
    REP_AddItems(2574, 1, 20, 500, {[210421] = 1}, nil, true) -- Dream Wardens Insignia
    ---- Mobs
		REP_AddMob(2574, 1, 20, "Envoy of Winter", 25, zone.Emerald_dream, nil, true)
    REP_AddMob(2574, 1, 20, "Firebrand Fystia", 25, zone.Emerald_dream, nil, true)
    REP_AddMob(2574, 1, 20, "Greedy Gessie", 25, zone.Emerald_dream, nil, true)
    REP_AddMob(2574, 1, 20, "Nuoberon", 25, zone.Emerald_dream, nil, true)
    REP_AddMob(2574, 1, 20, "Raszageth's Last Breath", 25, zone.Emerald_dream, nil, true)
    REP_AddMob(2574, 1, 20, "Reefbreaker Moruud", 25, zone.Emerald_dream, nil, true)
    ---- General
    REP_AddGeneral(2574, 1, 20, "World Quests", 50, "World Quests", "Complete world quests with this faction to gain reputation.", nil, nil, true)

    ---------------------------
		-- Keg Leg's Crew 2593 (Goes to 40 Renown) --
		---------------------------
    ---- General
    REP_AddGeneral(2593, 1, 40, "Earn plunder in Plunderstorm", 1, "Earn plunder in Plunderstorm", "Earn plunder in Plunderstorm to gain renown with this faction.", nil, nil, true)

    ---------------------------
		-- Azerothian Archives 2615 --
		---------------------------
    ---- Quests
    REP_AddQuest(2615, 1, 8, 79226, 3000) -- QuestID: 79226 - The Big Dig: Traitor's Rest
    ---- Items
		REP_AddItems(2615, 1, 8, 25, {[213185] = 1}) -- Dusty Centaur Tome
    REP_AddItems(2615, 1, 8, 25, {[213175] = 1}) -- Dusty Djaradin Tome
    REP_AddItems(2615, 1, 8, 25, {[213188] = 1}) -- Dusty Dracthyr Tome
    REP_AddItems(2615, 1, 8, 25, {[213187] = 1}) -- Dusty Drakonid Tome
    REP_AddItems(2615, 1, 8, 25, {[213186] = 1}) -- Dusty Niffen Tome
    REP_AddItems(2615, 1, 8, 50, {[213190] = 1}) -- Preserved Djaradin Tome
    REP_AddItems(2615, 1, 8, 50, {[213189] = 1}) -- Preserved Dragonkin Tome
    REP_AddItems(2615, 1, 8, 50, {[213176] = 1}) -- Preserved Isles Tome
    REP_AddItems(2615, 1, 8, 100, {[213177] = 1}) -- Immaculate Tome
    ---- General
    REP_AddGeneral(2615, 1, 8, "Archivist World Quests", 300, "Archivist World Quests", "Complete Archivist World Quests with this faction to gain reputation.")
	end

--------------------------------------------------
-- Factions released 'after' Dragonflight
--------------------------------------------------
	if (REP.AfterDragonflight) then
    ---------------------------
		-- Hallowfall Arathi 2570 (Goes to 25 Renown) --
		---------------------------

    ---------------------------
		-- Council of Dornogal 2590 (Goes to 25 Renown) --
		---------------------------

    ---------------------------
		-- The Assembly of the Deeps 2594 (Goes to 25 Renown) --
		---------------------------

    ---------------------------
		-- The Severed Threads 2600 (Goes to 25 Renown) --
		---------------------------

    ---------------------------
		-- The Weaver 2601 --
		---------------------------

    ---------------------------
		-- The General 2605 --
		---------------------------

    ---------------------------
		-- The Vizier 2607 --
		---------------------------

    ---------------------------
		-- Brann Bronzebeard 2640 (Goes to level 60) --
		---------------------------

    ---------------------------
		-- Delves: Season 1 2644 --
		---------------------------

    ---------------------------
		-- Earthen 2645 --
		---------------------------

		if (REP.IsAlliance) then
			-- Alliance
		else
			-- Horde
		end
	end

  collectgarbage("collect")
end

function REP_InitFactionForGuildOnly()
  if(REP.AfterWotlk) then
		---------------------------
		-- Guild 1168 --
		---------------------------
		---- General
    REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests.")
		REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins while wearing Guild Renown Tabard", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests while wearing the Guild Renown Tabard.", nil, nil, nil, 0.5)
    REP_AddGeneral(1168, 1, 8, "All (yellow or higher level) quest turn ins while wearing Renowned Guild Renown Tabard", 125, "Gain reputation by doing this quest", "Complete any (yellow or higher level) quests while wearing the Renowned Guild Renown Tabard.", nil, nil, nil, 1)
  end
end