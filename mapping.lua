local addonName, vars = ...
local REP = vars

local factionPanelFix = true
local showParagonCount = false

local factions = {}
REP.Factions = factions

function REP:GetFactionDataByIndex(index)
  if not index then return end

  local factionDataObj

  if REP.AfterDragonflight then
    factionDataObj = REP_Orig_GetFactionDataByIndex(index)
  else  
    -- name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = REP_Orig_GetFactionDataByIndex(i)
    local factionData = {REP_Orig_GetFactionDataByIndex(index)}
    factionDataObj = {
      name = factionData[1],
      description = factionData[2],
      reaction = factionData[3], -- standingID
      currentReactionThreshold = factionData[4], -- barMin
      nextReactionThreshold = factionData[5], -- barMax
      currentStanding = factionData[6], -- barValue
      atWarWith = factionData[7],
      canToggleAtWar = factionData[8],
      isHeader = factionData[9],
      isCollapsed = factionData[10],
      isHeaderWithRep = factionData[11], -- hasRep
      isWatched = factionData[12],
      isChild = factionData[13],
      factionID = factionData[14],
      hasBonusRepGain = factionData[15],
      canBeLFGBonus = factionData[16],
      canSetInactive = not factionData[9] or factionData[11],
      isAccountWide = false
    }
  end

  return factionDataObj or {}
end

function REP:GetFactionDataByID(factionID)
  if not factionID then return end

  local factionDataObj

  if REP.AfterDragonflight then
    factionDataObj = REP_Orig_GetFactionDataByID(factionID)
  else
    local factionData
    if REP_Orig_GetFactionDataByID then
      factionData = {REP_Orig_GetFactionDataByID(factionID)}
    else
      factionData = {GetFactionInfoByID(factionID)}
    end

    factionDataObj = {
      name = factionData[1],
      description = factionData[2],
      reaction = factionData[3], -- standingID
      currentReactionThreshold = factionData[4], -- barMin
      nextReactionThreshold = factionData[5], -- barMax
      currentStanding = factionData[6], -- barValue
      atWarWith = factionData[7],
      canToggleAtWar = factionData[8],
      isHeader = factionData[9],
      isCollapsed = factionData[10],
      isHeaderWithRep = factionData[11], -- hasRep
      isWatched = factionData[12],
      isChild = factionData[13],
      factionID = factionData[14],
      hasBonusRepGain = factionData[15],
      canBeLFGBonus = factionData[16],
      canSetInactive = not factionData[9] or factionData[11],
      isAccountWide = false
    }
  end

  return factionDataObj or {}
end

-- Thanks to the Pretty Reputation Addon (https://www.curseforge.com/wow/addons/pretty-reputation) for the factionPanelFix fix.
function REP:IndexFactions(isInitialLogin, isReloadingUi, forceFactionPanelFix)
  if (isInitialLogin or isReloadingUi or forceFactionPanelFix) then
    showParagonCount = REP_Data.Global.ShowParagonBar

    if REP.AfterShadowLands then
      do
        for _, factionId in ipairs(REP_Orig_GetMajorFactionIDs()) do
          REP:IndexFaction(REP_Orig_GetMajorFactionData(factionId))
        end
      end
    end

    do
      local collapsedHeaders = REP:saveRepHeaders()
      for i = 1, REP_Orig_GetNumFactions() do
        REP:IndexFaction(REP:GetFactionDataByIndex(i))
      end
      REP:restoreRepHeaders(collapsedHeaders)
    end

    if REP.AfterDragonflight or forceFactionPanelFix then
      do
        if factionPanelFix or forceFactionPanelFix then
          factionPanelFix = false
          for factionID = 1, 5000 do
            local factionData = REP:GetFactionDataByID(factionID)
            if factionData and factionData.factionID and not factions[factionData.factionID] then
              REP:IndexFaction(factionData)
              if factions[factionData.factionID] then
                factions[factionData.factionID].blizzFix = true
              end
            end
          end
        end
      end
    end
  end
end

function REP:IndexFaction(factionData)
  if factionData and factionData.name and factionData.factionID and factionData.factionID ~= 0 then

    if not factions[factionData.factionID] then
      factions[factionData.factionID] = { id = factionData.factionID, session = 0}
    end

    if not factions[factionData.factionID].id then
      factions[factionData.factionID].id = factionData.factionID
    end

    if not factions[factionData.factionID].session then
      factions[factionData.factionID].session = 0
    end

    if not factions[factionData.factionID].info then
      local info = {}
      info["faction"] = factionData.name
      info["factionID"] = factionData.factionID
      info["change"] = 0
      info["session"] = factions[factionData.factionID].session
      info["expansionID"] = factionData.expansionID
      factions[factionData.factionID].info = REP:getRepInfo(info)
    end
  end
end

function REP:saveRepHeaders()
  local parse = true
  local collapsed = {}
  if not parse then
    if REP_Orig_ExpandAllFactionHeaders then
      REP_Orig_ExpandAllFactionHeaders()
    else
      ExpandAllFactionHeaders()
    end

    return collapsed
  end

  local previousName
  local i = 1

  while true do
    local factionData = REP:GetFactionDataByIndex(i)
    if not factionData or not factionData.name or (factionData.name == previousName and factionData.name ~= GUILD) then break end
    if (factionData.factionID == nil) then factionData.factionID = factionData.name	end
    if factionData.isHeader and factionData.isCollapsed then
      if REP_Orig_ExpandFactionHeader then
        REP_Orig_ExpandFactionHeader(i)
      else
        ExpandFactionHeader(i)
      end
      
      
      collapsed[factionData.factionID] = true
    end
    previousName = factionData.name
    i = i + 1
  end

   -- to be sure every header is expanded
  if REP_Orig_ExpandAllFactionHeaders then
    REP_Orig_ExpandAllFactionHeaders()
  else
    ExpandAllFactionHeaders()
  end
  return collapsed
end

function REP:restoreRepHeaders(collapsed)
  if next(collapsed) == nil then return end
  for i = REP_Orig_GetNumFactions(), 1, -1 do
    local factionData = REP:GetFactionDataByIndex(i)
    if (factionData.factionID == nil) then factionData.factionID = factionData.name	end

    if factionData.isHeader and collapsed[factionData.factionID] then
      if REP_Orig_CollapseFactionHeader then
        REP_Orig_CollapseFactionHeader(i)
      else
        CollapseFactionHeader(i)
      end
    end
  end
end

function REP:getRepInfo(info)
  if (info.factionID and info.factionID ~= 0) then
    local factionData = REP:GetFactionDataByID(info.factionID)
    info["standingId"] = factionData.reaction
    info["name"] = factionData.name
    info["bottom"] = factionData.currentReactionThreshold
    info["top"] = factionData.nextReactionThreshold
    info["isHeader"] = factionData.isHeader
    info["isWatched"] = factionData.isWatched

    info["paragon"] = ""
    info["renown"] = ""
    info["standingTextNext"] = ""
    info["reward"] = ""

    if REP.AfterShadowLands then
      if (REP_Orig_IsMajorFaction(info.factionID)) then
        info["isRenown"] = true
        local data = REP_Orig_GetMajorFactionData(info.factionID)
        local isCapped = REP_Orig_HasMaximumRenown(info.factionID)
        local isParagon = REP_Orig_IsFactionParagon(info.factionID)
  
        if data then
          info["bottom"] = (data.renownLevel - 1) * data.renownLevelThreshold
          info["top"] = data.renownLevel * data.renownLevelThreshold
          info["current"] = isCapped and data.renownLevelThreshold or data.renownReputationEarned or 0
          info["maximum"] = data.renownLevelThreshold
          info["standingText"] = (REP_TXT.renown.." "..data.renownLevel)
          info["renown"] = data.renownLevel
          info["standingTextNext"] = REP_TXT.renown.." "..(data.renownLevel + 1)
          info["standingId"] = 10
          info["standingIdNext"] = 10
          
          if not isCapped or not isParagon then return info end
          if isCapped then info["isCapped"] = true end
  
          local currentValue, threshold, _, hasRewardPending = REP_Orig_GetFactionParagonInfo(info.factionID)
          local paragonLevel = (currentValue - (currentValue % threshold))/threshold

          if showParagonCount and paragonLevel > 0 then
            info["paragon"] = info["paragon"] .. paragonLevel
          end
  
          info["standingTextNext"] = REP:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
          info["standingId"] = 9
          info["standingIdNext"] = 9
          
          if hasRewardPending then
            local reward = "|A:ParagonReputation_Bag:0:0|a"
            info["reward"] = reward
            info["paragon"] = info["paragon"] .. reward

            if not showParagonCount then
              info["standingText"] = info["standingText"] .. " " .. reward
            end
          end
  
          info["current"] = mod(currentValue, threshold)
          info["maximum"] = threshold
          info["bottom"] = info["bottom"] + paragonLevel * threshold
          info["top"] = info["bottom"] + threshold
          return info
        else
          info["current"] = 0
          info["maximum"] = 0
          info["standingText"] = REP_TXT.renown
          return info
        end
      end
    else
      info["isRenown"] = false
    end

    if (factionData.reaction == nil) then
      info["current"] = 0
      info["maximum"] = 0
      info["color"] = {r = 1, b = 0, g = 0}
      info["standingText"] = "??? - " .. (info.factionID .. "?")
      info["bottom"] = 0
      info["top"] = 0
      return info
    end

    if REP.AfterCata then
      if (REP_Orig_IsFactionParagon(info.factionID)) then
        local currentValue, threshold, _, hasRewardPending = REP_Orig_GetFactionParagonInfo(info.factionID);
        local paragonLevel = (currentValue - (currentValue % threshold))/threshold
        info["standingText"] = REP:getFactionLabel("paragon")
        
        if showParagonCount and paragonLevel > 0 then
          info["paragon"] =  info["paragon"] .. paragonLevel
        end
  
        info["standingTextNext"] = REP:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
        info["standingId"] = 9
        info["standingIdNext"] = 9
  
        if hasRewardPending then
          local reward = "|A:ParagonReputation_Bag:0:0|a"
          info["reward"] = reward
          info["paragon"] =  info["paragon"] .. reward
  
          if not showParagonCount then
            info["standingText"] = info["standingText"] .. " " .. reward
          end
        end
  
        info["current"] = mod(currentValue, threshold)
        info["maximum"] = threshold
        info["bottom"] = info["top"] + paragonLevel * threshold
        info["top"] = info["bottom"] + threshold
        return info
      end  
    end

    local friendInfo = REP_Orig_GetFriendshipReputation(info.factionID)
    if (friendInfo.friendshipFactionID and friendInfo.friendshipFactionID ~= 0) then
      info["current"] = 1
      info["maximum"] = 1
      info["bottom"] = friendInfo.reactionThreshold
      info["top"] = friendInfo.reactionThreshold
      info["standingText"] = friendInfo.reaction
      info["isFriend"] = true

      if (friendInfo.nextThreshold) then
        info["current"] = friendInfo.standing - friendInfo.reactionThreshold
        info["maximum"] = friendInfo.nextThreshold - friendInfo.reactionThreshold
        info["top"] = friendInfo.nextThreshold
        info["standingTextNext"] = REP_GetFriendFactionStandingLabel(info.factionID, friendInfo.nextThreshold)
      else
        info["isCapped"] = true
      end
      return info
    else
      info["isFriend"] = false
    end

    info["current"] = factionData.currentStanding - info.bottom
    info["maximum"] = info.top - info.bottom
    info["standingText"] = REP:getFactionLabel(factionData.reaction)
    info["standingTextNext"] = (info.negative and factionData.reaction > 1 and _G["FACTION_STANDING_LABEL".. factionData.reaction - 1]) or (not info.negative and factionData.reaction < 8 and _G["FACTION_STANDING_LABEL".. factionData.reaction + 1]) or ""
    info["standingIdNext"] = (info.negative and factionData.reaction > 1 and (factionData.reaction - 1)) or (not info.negative and factionData.reaction < 8 and (factionData.reaction + 1))
    return info
  end

  return info
end

function REP:getFactionInfo(info)
  if REP.Factions[info.factionID] then
    local session = REP:getFactionSession(info)
    REP.Factions[info.factionID].session = session
    info["lastUpdated"] = time()
    info["session"] = session
    REP.Factions[info.factionID].info = REP:getRepInfo(info)
  end
  return info
end

function REP:getFactionInfoForNewFaction(info)
  if info and info.factionID then
    local factionData = REP:GetFactionDataByID(info.factionID)
    if factionData and factionData.factionID and not factions[factionData.factionID] then
      REP:IndexFaction(factionData)
      REP.Factions = factions
    end

    info = REP:getFactionInfo(info)
  else
    REP:IndexFactions(false, false, true)
    REP.Factions = factions

    for i, factionData in pairs(REP.Factions) do
      if factionData.info and factionData.info.faction and factionData.info.faction == info.faction then
        info = factionData.info
        break
      end
    end
    info = REP:getFactionInfo(info)
  end

  return info
end

function REP:getFactionSession(info)
  return factions[info.factionID] and (factions[info.factionID].session + (info.change * ((info.negative and -1 or 1)))) or 0
end

function REP:getFactionLabel(standingId)
	if standingId == "paragon" then
		return "Paragon"
	end

	if (standingId == "renown") then
		return "Renown"
	end

  if (standingId == "friendship") then
		return "Renown"
	end

	return GetText("FACTION_STANDING_LABEL" .. standingId, UnitSex("player"))
end

function REP_GetFriendFactionStandingLabel(factionID, nextFriendThreshold)
  local REP_BFFLabels = REP.BFFLabels

  if REP_BFFLabels[factionID] ~= nil then
    return REP_BFFLabels[factionID][nextFriendThreshold]
  else
    if REP_BFFLabels[0][nextFriendThreshold] ~= nil then
      return REP_BFFLabels[0][nextFriendThreshold]
    else
      return ""
    end
  end
end