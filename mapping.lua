local addonName, vars = ...
local REP = vars

function REP_InitEnFactions()
  local numFactions
  if REP.AfterDragonflight then
    numFactions = C_Reputation.GetNumFactions()
  else
    numFactions = GetNumFactions()
  end

	for i = 1, numFactions do
    local name, isHeader, hasRep, factionID

    if REP.AfterDragonflight then
      name, _, _, _, _, _, _, _, isHeader, _, hasRep, _, _, factionID = C_Reputation.GetFactionDataByIndex(i)
    else
      name, _, _, _, _, _, _, _, isHeader, _, hasRep, _, _, factionID = GetFactionInfo(i)
    end

		if (not isHeader) then
		--if (not isHeader or hasRep) then
			REP_AddMapping(name, factionID)
		end
	end
end