function REP_InitEnFactions()
local numFactions = GetNumFactions()
	for i=1, numFactions do
		local name, _, _, _, _, _, _, _, isHeader, _, _hasRep, _, _, factionID = GetFactionInfo(i)
		if (not isHeader) then
		--if (not isHeader or hasRep) then
			REP_AddMapping(name, factionID)
		end
	end
end