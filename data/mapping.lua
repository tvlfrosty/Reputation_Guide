local addonName, vars = ...
local ReputationGuide = vars

local factions = ReputationGuide.factions or {}
ReputationGuide.factions = factions

local factionPanelFix = true
local showParagonCount = false

-- Thanks to the Pretty Reputation Addon (https://www.curseforge.com/wow/addons/pretty-reputation) for the factionPanelFix fix.
function ReputationGuide:IndexFactions(isInitialLogin, isReloadingUi, forceFactionPanelFix)
  if not (isInitialLogin or isReloadingUi or forceReload) then return end
  
  showParagonCount = REP_Data.Global.ShowParagonBar

  if ReputationGuide.AfterShadowLands then
    do
      for _, factionId in ipairs(REP_Orig_GetMajorFactionIDs()) do
        ReputationGuide:IndexFaction(REP_Orig_GetMajorFactionData(factionId))
      end
    end
  end

  do
    local collapsedHeaders = ReputationGuide:saveRepHeaders()
    for i = 1, REP_Orig_GetNumFactions() do
      ReputationGuide:IndexFaction(ReputationGuide:GetFactionDataByIndex(i))
    end
    ReputationGuide:restoreRepHeaders(collapsedHeaders)
  end

  if ReputationGuide.AfterDragonflight or forceFactionPanelFix then
    do
      if factionPanelFix or forceFactionPanelFix then
        factionPanelFix = false
        for factionID = 1, 5000 do
          local factionData = ReputationGuide:GetFactionDataByID(factionID)
          if factionData and factionData.factionID and not factions[factionData.factionID] then
            ReputationGuide:IndexFaction(factionData)
            if factions[factionData.factionID] then
              factions[factionData.factionID].blizzFix = true
            end
          end
        end
      end
    end
  end
end

function ReputationGuide:IndexFaction(factionData)
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
      factions[factionData.factionID].info = ReputationGuide:getRepInfo(info)
    end

    if factions[factionData.factionID].info then
      local guid = UnitGUID("player")

      if not REP_Data.ProfileKeys then REP_Data.ProfileKeys = {} end
      
      -- If you want to recache all factions on login, temp remove "and not REP_Data.ProfileKeys[guid].factions[factionData.factionID]".
      if guid and REP_Data.ProfileKeys and REP_Data.ProfileKeys[guid] and REP_Data.ProfileKeys[guid].factions and not REP_Data.ProfileKeys[guid].factions[factionData.factionID] then
        local currentStandingID

        if factions[factionData.factionID].info.isFriend then
          currentStandingID = 5
        else
          currentStandingID = factions[factionData.factionID].info.standingId
        end
        
        REP_Data.ProfileKeys[guid].factions[factionData.factionID] = {
          standing = factions[factionData.factionID].info.standingText or "",
          standingID = currentStandingID or 0,
          current = factions[factionData.factionID].info.current or 0,
          max = factions[factionData.factionID].info.maximum or 0
        }
      end
    end
  end
end

function ReputationGuide:saveRepHeaders()
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
    local factionData = ReputationGuide:GetFactionDataByIndex(i)
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

function ReputationGuide:restoreRepHeaders(collapsed)
  if next(collapsed) == nil then return end
  for i = REP_Orig_GetNumFactions(), 1, -1 do
    local factionData = ReputationGuide:GetFactionDataByIndex(i)
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

function ReputationGuide:getRepInfo(info)
  if (info.factionID and info.factionID ~= 0) then
    local factionData = ReputationGuide:GetFactionDataByID(info.factionID)
    info["StandingID"] = factionData.reaction
    info["name"] = factionData.name
    info["bottom"] = factionData.currentReactionThreshold
    info["top"] = factionData.nextReactionThreshold
    info["isHeader"] = factionData.isHeader
    info["isWatched"] = factionData.isWatched
    info["hasBonusRepGain"] = factionData.hasBonusRepGain

    info["paragon"] = ""
    info["renown"] = ""
    info["standingTextNext"] = ""
    info["reward"] = ""

    if ReputationGuide.AfterShadowLands then
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
          info["StandingID"] = 10
          info["StandingIDNext"] = 10
          
          if not isCapped or not isParagon then return info end
          if isCapped then info["isCapped"] = true end
  
          local currentValue, threshold, _, hasRewardPending = REP_Orig_GetFactionParagonInfo(info.factionID)
          local paragonLevel = (currentValue - (currentValue % threshold))/threshold

          if showParagonCount and paragonLevel > 0 then
            info["paragon"] = info["paragon"] .. paragonLevel
          end
  
          info["standingTextNext"] = ReputationGuide:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
          info["StandingID"] = 9
          info["StandingIDNext"] = 9
          
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

    if ReputationGuide.AfterWoD then
      if (REP_Orig_IsFactionParagon(info.factionID)) then
        local currentValue, threshold, _, hasRewardPending = REP_Orig_GetFactionParagonInfo(info.factionID);
        local paragonLevel = (currentValue - (currentValue % threshold))/threshold
        info["standingText"] = ReputationGuide:getFactionLabel("paragon")
        
        if showParagonCount and paragonLevel > 0 then
          info["paragon"] =  info["paragon"] .. paragonLevel
        end
  
        info["standingTextNext"] = ReputationGuide:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
        info["StandingID"] = 9
        info["StandingIDNext"] = 9
  
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
        info["standingTextNext"] = ReputationGuide:GetFriendFactionStandingLabel(info.factionID, friendInfo.nextThreshold)
      else
        info["isCapped"] = true
      end
      return info
    else
      info["isFriend"] = false
    end

    info["current"] = factionData.currentStanding - info.bottom
    info["maximum"] = info.top - info.bottom
    info["standingText"] = ReputationGuide:getFactionLabel(factionData.reaction)
    info["standingTextNext"] = (info.negative and factionData.reaction > 1 and _G["FACTION_STANDING_LABEL".. factionData.reaction - 1]) or (not info.negative and factionData.reaction < 8 and _G["FACTION_STANDING_LABEL".. factionData.reaction + 1]) or ""
    info["StandingIDNext"] = (info.negative and factionData.reaction > 1 and (factionData.reaction - 1)) or (not info.negative and factionData.reaction < 8 and (factionData.reaction + 1))
    return info
  end

  return info
end

function ReputationGuide:getFactionInfo(info)
  if ReputationGuide.Factions[info.factionID] then
    local session = ReputationGuide:getFactionSession(info)
    ReputationGuide.Factions[info.factionID].session = session
    info["lastUpdated"] = time()
    info["session"] = session
    ReputationGuide.Factions[info.factionID].info = ReputationGuide:getRepInfo(info)
  end
  return info
end

function ReputationGuide:getFactionInfoForNewFaction(info)
  if info and info.factionID then
    local factionData = ReputationGuide:GetFactionDataByID(info.factionID)
    if factionData and factionData.factionID and not factions[factionData.factionID] then
      ReputationGuide:IndexFaction(factionData)
      ReputationGuide.Factions = factions
    end

    info = ReputationGuide:getFactionInfo(info)
  else
    ReputationGuide:IndexFactions(false, false, true)
    ReputationGuide.Factions = factions

    for i, factionData in pairs(ReputationGuide.Factions) do
      if factionData.info and factionData.info.faction and factionData.info.faction == info.faction then
        info = factionData.info
        break
      end
    end
    info = ReputationGuide:getFactionInfo(info)
  end

  return info
end

function ReputationGuide:getFactionSession(info)
  return factions[info.factionID] and (factions[info.factionID].session + (info.change * ((info.negative and -1 or 1)))) or 0
end