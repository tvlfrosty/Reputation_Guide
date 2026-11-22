----------------------------------------------------------
-- Reputation Guide | Reputation --
-- Reputation values per faction, reputation ready to hand in and faction (in)active state.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

-------------------------------------------
-- 15 Getting reputation ready to hand In
-------------------------------------------
function REP:GetReadyReputation(factionIndex)
  local result = 0
  return result 
  --[[-- curently disabled
  if not factionIndex then return result end

  if (not ReputationFrame:IsVisible()) then return result end

  local maxFactionIndex = REP.Orig_GetNumFactions()
  if (factionIndex > maxFactionIndex) then return result end

  local faction, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild = REP.Orig_GetFactionDataByIndex(factionIndex)
  if (isHeader) then return result end

  if (faction) then
    origFaction = faction
    faction = string.lower(faction)

    -- Normalize Values
    local normMax = barMax - barMin
    local normCurrent = barValue - barMin
    local repToNext = barMax - barValue

    local REP_FG_f=REP.FactionGain[faction]
    if (REP_FG_f) then
      local REP_FG_fs=REP_FG_f[standingID]
      if (REP_FG_fs) then
        -- quests (may have items)
        local REP_FG_fs_h=REP_FG_fs.quests
        if (REP_FG_fs_h) then
          for i = 0, REP_FG_fs_h.count do
            local REP_FG_fs_h_d=REP_FG_fs_h.data[i]
            if (not REP_FG_fs_h_d.limit or (normCurrent < REP_FG_fs_h_d.limit)) then
              local toDo = ceil(repToNext / REP_FG_fs_h_d.rep)
              if (REP_FG_fs_h_d.limit) then
                toDo = ceil((REP_FG_fs_h_d.limit - normCurrent) / REP_FG_fs_h_d.rep)
              end

              if (REP_FG_fs_h_d.items) then
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1
                for item in pairs(REP_FG_fs_h_d.items) do
                  _, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(REP_FG_fs_h_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, "nil", item)
                end

                if (currentQuestTimesBag > toDo) then
                  currentQuestTimesBag = toDo
                end

                if (currentQuestTimesBagBank > toDo) then
                  currentQuestTimesBagBank = toDo
                end

                if (currentQuestTimesBagBank > 0) then
                  result = result + currentQuestTimesBagBank * REP_FG_fs_h_d.rep
                elseif (currentQuestTimesBag > 0) then
                  result = result + currentQuestTimesBag * REP_FG_fs_h_d.rep
                else
                -- nothing to add
                end
              else
                -- no items, check if this quest is completed
                local entries, quests = GetNumQuestLogEntries()
                for z=1,entries do
                  local title,level,tag,group,header,collapsed,complete,daily = GetQuestLogTitle(z)
                  if (title and not header and complete) then
                    if string.find(string.lower(REP:Quest_Names(REP_FG_fs_h_d.name)), string.lower(title)) then
                      -- this quest matches
                      result = result + REP_FG_fs_h_d.rep
                    end
                  end
                end
              end
            end
          end
        end

        -- items
        local REP_FG_fs_h=REP_FG_fs.items
        if (REP_FG_fs_h and REP_Data.Global.ShowItems) then
          for i = 0, REP_FG_fs_h.count do
            local REP_FG_fs_h_d=REP_FG_fs_h.data[i]
            if (not REP_FG_fs_h_d.limit or (normCurrent < REP_FG_fs_h_d.limit)) then
              local toDo = ceil(repToNext / REP_FG_fs_h_d.rep)
              if (REP_FG_fs_h_d.limit) then
                toDo = ceil((REP_FG_fs_h_d.limit - normCurrent) / REP_FG_fs_h_d.rep)
              end

              if (REP_FG_fs_h_d.items) then
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1
                for item in pairs(REP_FG_fs_h_d.items) do
                  _, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(REP_FG_fs_h_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, "nil", item)
                end

                if (currentQuestTimesBag > toDo) then
                  currentQuestTimesBag = toDo
                end

                if (currentQuestTimesBagBank > toDo) then
                  currentQuestTimesBagBank = toDo
                end

                if (currentQuestTimesBagBank > 0) then
                  result = result + currentQuestTimesBagBank * REP_FG_fs_h_d.rep
                elseif (currentQuestTimesBag > 0) then
                  result = result + currentQuestTimesBag * REP_FG_fs_h_d.rep
                end
              end
            end
          end
        end
      end
    end
  end

  return result
  --]]--
end	

----------------------------------
-- 16 FSS // RDF_IS // RDF
-----------------------------------
function REP_GetReputationGains(factionIndex, factionID)
  if not factionID and not factionIndex then return end
  if factionIndex and type(factionIndex) ~= 'number' then return end
  if factionID and type(factionID) ~= 'number' then return end

  local name, isMajorFaction, isFriend, isCappedFriendship, isCapped, friendName
  local standingID, barMin, barMax, barValue
  local reputationGainsInfo = {}

  local reputationGainedSession, reputationGainedTotal = 0, 0
  local reputationCurrent, reputationNeededCurrent, reputationMissingCurrent, reputationNeededToMax = 0, 0, 0, 0

  if REP.UseScrollBoxReputationUI then
    isMajorFaction = factionID and REP.Orig_IsMajorFaction(factionID)
  end

  if REP.HasFriendshipAPI then
    local friendReputationInfo = REP_Friend_Detail(factionID)
    isFriend = friendReputationInfo.isFriend
    isCappedFriendship = friendReputationInfo.isCappedFriendship
  end

  if isFriend then
    if not isCappedFriendship then
      local friendRep, friendMaxRep, friendThreshold, nextFriendThreshold

      if REP.AfterMoP and GetFriendshipReputation and not REP.UseScrollBoxReputationUI then
        -- friendID, friendRep, friendMaxRep, friendName, friendText, _, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
        _, friendRep, friendMaxRep, _, friendName, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP.Orig_GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          friendRep = friendshipInfo.standing
          friendMaxRep = friendshipInfo.maxRep
          nextFriendThreshold = friendshipInfo.nextThreshold
          friendThreshold = friendshipInfo.reactionThreshold
          friendName = friendshipInfo.name
        end
      end

      if friendRep and friendThreshold and nextFriendThreshold then
      name = friendName
      reputationGainedTotal = friendRep
      reputationCurrent = friendRep - friendThreshold
      reputationNeededCurrent = nextFriendThreshold - friendThreshold
      reputationMissingCurrent = nextFriendThreshold - friendRep
      reputationNeededToMax = REP_GetFriendFactionRemaining(factionID) or 0
      end
    end
  elseif isMajorFaction then
    local majorFactionData = REP.Orig_GetMajorFactionData(factionID)
    name = majorFactionData.name
    isCapped = REP.Orig_HasMaximumRenown(factionID)

    local currentValue, threshold

    if isCapped and REP.Orig_IsFactionParagon and REP.Orig_IsFactionParagon(factionID) then
      currentValue, threshold = REP.Orig_GetFactionParagonInfo(factionID)
    end

    if isCapped and not (currentValue and threshold) then
      -- Max renown without a paragon track (for example Keg Leg's Crew): nothing left to earn.
      reputationCurrent = majorFactionData.renownLevelThreshold
      reputationGainedTotal = majorFactionData.renownLevelThreshold * majorFactionData.renownLevel
      reputationNeededCurrent = majorFactionData.renownLevelThreshold
      reputationMissingCurrent = 0
      reputationNeededToMax = 0
    elseif isCapped then
      currentValue = currentValue % threshold
      reputationCurrent = currentValue
      reputationGainedTotal = (majorFactionData.renownLevelThreshold * majorFactionData.renownLevel) + currentValue
      reputationNeededCurrent = threshold
      reputationMissingCurrent = threshold - currentValue
      reputationNeededToMax = threshold
    else
      reputationCurrent = majorFactionData.renownReputationEarned
      reputationGainedTotal = (majorFactionData.renownLevelThreshold * (majorFactionData.renownLevel - 1)) + majorFactionData.renownReputationEarned
      reputationNeededCurrent = majorFactionData.renownLevelThreshold
      reputationMissingCurrent = majorFactionData.renownLevelThreshold - majorFactionData.renownReputationEarned
      
      local maxFactionLevel = 25

      if(REP.MaxFactionLevel[factionID]) then
        maxFactionLevel = REP.MaxFactionLevel[factionID]
      end
      
      local maxRenown = maxFactionLevel * majorFactionData.renownLevelThreshold
      reputationNeededToMax = maxRenown - reputationGainedTotal
    end
  else
    local reputationInfo = {}

    if factionIndex then
      reputationInfo = REP:GetFactionDataByIndex(factionIndex)
    else
      reputationInfo = REP:GetFactionDataByID(factionID)
    end

    if reputationInfo then
      name = reputationInfo.name
      reputationCurrent = reputationInfo.currentStanding - reputationInfo.currentReactionThreshold
      reputationGainedTotal = reputationInfo.currentStanding
      reputationNeededCurrent = reputationInfo.nextReactionThreshold
      reputationMissingCurrent = reputationNeededCurrent - reputationCurrent
      standingID = reputationInfo.reaction
      barMin = reputationInfo.currentReactionThreshold
      barValue = reputationInfo.currentStanding
    end

    if standingID == 4 then
      barMax = reputationInfo.nextReactionThreshold
    elseif standingID > 4 then
      barMax = reputationInfo.nextReactionThreshold - reputationInfo.currentReactionThreshold
    else
      barMax = reputationInfo.currentReactionThreshold - reputationInfo.nextReactionThreshold
    end

    barValue = barValue - barMin

    if standingID < 4 then
      if barMin < 0 then barMin = barMin * -1 end
      if barValue < 0 then barValue = barValue * -1 end
      if barMax < 0 then barMax = barMax * -1 end
    end

    local currentValue, threshold

    if (REP.AfterMoP or REP.IsForever) and REP:IsAtParagon(factionID, standingID) then
      currentValue, threshold = REP.Orig_GetFactionParagonInfo(factionID)
    end

    if currentValue and threshold then
      currentValue = currentValue % threshold
      reputationNeededCurrent = threshold
      reputationMissingCurrent = threshold - currentValue
      reputationNeededToMax = threshold
      reputationCurrent = currentValue
      reputationGainedTotal = currentValue
    else
      reputationNeededCurrent = barMax
      reputationMissingCurrent = barMax - barValue
      reputationCurrent = barValue
      reputationGainedTotal = barValue
      reputationNeededToMax = REP.ToExalted[standingID] + barMax - barValue
    end
  end

  if factionID and REP.factions and REP.factions[factionID] then
    reputationGainedSession = REP.factions[factionID].session
  end  

  reputationGainsInfo.factionName = name
  reputationGainsInfo.reputationGainedSession = reputationGainedSession
  reputationGainsInfo.reputationGainedTotal = reputationGainedTotal
  reputationGainsInfo.reputationCurrent = reputationCurrent
  reputationGainsInfo.reputationNeededCurrent = reputationNeededCurrent
  reputationGainsInfo.reputationMissingCurrent = reputationMissingCurrent
  reputationGainsInfo.reputationNeededToMax = reputationNeededToMax

  return reputationGainsInfo
end

function REP_Friend_Detail(factionID, standingID, factionRow)
  local colorIndex, factionStandingtext, isCappedFriendship, isFriend, friendID
  local barMin, barMax, barValue
  local friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold

  if REP.HasFriendshipAPI then
    if (factionID) then
      if REP.AfterMoP and not REP.UseScrollBoxReputationUI then
        friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold = REP.Orig_GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP.Orig_GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          friendID = friendshipInfo.friendshipFactionID
          friendRep = friendshipInfo.standing
          friendMaxRep = friendshipInfo.maxRep
          friendName = friendshipInfo.name
          friendText = friendshipInfo.text
          friendTexture = friendshipInfo.texture
          friendTextLevel = friendshipInfo.reaction
          friendThreshold = friendshipInfo.reactionThreshold
          nextFriendThreshold = friendshipInfo.nextThreshold
        end
      end
    end
  end

  if (friendID ~= nil) then
    if (nextFriendThreshold) then
      barMin, barMax, barValue = friendThreshold, nextFriendThreshold, friendRep
    else	-- max rank, make it look like a full bar
      barMin, barMax, barValue = 0, 1, 1
      isCappedFriendship = true
    end

    colorIndex = 5	-- always color friendships green
    factionStandingtext = friendTextLevel
    isFriend = true

    if not REP.UseModernReputationUI then
      if factionRow then factionRow.friendshipID = friendID end
    end
  else
    isFriend = false

    if standingID then
      factionStandingtext = GetText("FACTION_STANDING_LABEL"..standingID)
      colorIndex = standingID
    end

    if not REP.UseModernReputationUI then
      if factionRow then factionRow.friendshipID = nil end
    end
  end

  local friendReputationInfo = {}
  friendReputationInfo.colorIndex = colorIndex or nil
  friendReputationInfo.isCappedFriendship = isCappedFriendship or nil
  friendReputationInfo.factionStandingtext = factionStandingtext or nil
  friendReputationInfo.isFriend = isFriend or nil
  friendReputationInfo.barMax = nextFriendThreshold or nil
  friendReputationInfo.barValue = friendRep or nil
  friendReputationInfo.barMin = friendThreshold or nil

  return friendReputationInfo
end

-----------------------------------
-- 17 Listing by standing
-----------------------------------
function REP:ListByStanding(standing)
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, hasRep, isCollapsed, isWatched
  local list = {}

  -- get factions by standing
  for i = 1, REP.Orig_GetNumFactions() do
    local factionData = REP:GetFactionDataByIndex(i) or {}
    name, standingID = factionData.name, factionData.reaction
    barMin, barMax, barValue = factionData.currentReactionThreshold, factionData.nextReactionThreshold, factionData.currentStanding
    isHeader, hasRep = factionData.isHeader, factionData.isHeaderWithRep
    if name and standingID and (not isHeader or hasRep) then
      if ((standing == nil) or (standing == standingID)) then
        if (not list[standingID]) then
          list[standingID] = {}
        end

        list[standingID][name] = {}
        list[standingID][name].max = barMax - barMin
        list[standingID][name].value = barValue - barMin
      end
    end
  end

  -- output
  for i = 1, 8 do
    if (list[i]) then
      REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP:RGBToColour_perc(1, REP.FACTION_BAR_COLORS[i].r, REP.FACTION_BAR_COLORS[i].g, REP.FACTION_BAR_COLORS[i].b).."--- "..REP_TXT.STAND_LV[i].." ("..i..") ---|r")

      for p in pairs(list[i]) do
        REP:Print("    "..p..": "..REP_TXT.missing2..": "..list[i][p].max - list[i][p].value)
      end

      if (not standing) then
        REP:Print(" ")
      end
    end
  end
end

--------------------------
-- 19 classic options
--------------------------
function REP_OnShowOptionFrame()
  if not REP.UseScrollBoxReputationUI then
    REP_OrderByStandingCheckBox:SetChecked(REP:GetSortByStanding())
  end
end

function REP_GetFriendFactionRemaining(factionID)
  local friendRep, friendMaxRep
  local bodyguards = {1738, 1740, 1733, 1741, 1737, 1736, 1739}

  if (REP.HasFriendshipAPI and factionID) then
    if REP.AfterMoP and GetFriendshipReputation and not REP.UseScrollBoxReputationUI then
      _, friendRep, friendMaxRep, _, _, _, _, _, _ = GetFriendshipReputation(factionID)
    else
      local friendshipInfo = REP.Orig_GetFriendshipReputation(factionID)
      if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
        friendRep = friendshipInfo.standing
        friendMaxRep = friendshipInfo.maxRep

        if friendRep > friendMaxRep and REP.MaxFactionReputation[factionID] then
          friendMaxRep = REP.MaxFactionReputation[factionID]
        end
      end
    end
  end

  -- WoD bodyguards are capped at 20k reputation but GetFriendshipReputation still returns 42k reputation as maximum so we need to check for that and set max to 20k
  if tContains(bodyguards, factionID) then
    friendMaxRep = 20000
  end

  if not friendMaxRep or not friendRep then return end

  return friendMaxRep - friendRep
end

----------------------------------------------
-- 20 Trigger ReputationFrame Update
----------------------------------------------
function REP:CustomTriggerReputationFrameUpdate()
  if REP.UseModernReputationUI then return end
  REP_ReputationFrame_Update()
end

----------------------------------------------
-- SetFactionActive Or SetFactionInactive
----------------------------------------------
function REP:CustomSetFactionActiveOrInactive(isChecked, factionIndex)
  if not factionIndex then return end

  local shouldBeActive = not isChecked
  local reputationInfo = REP:GetFactionDataByIndex(factionIndex)

  if not reputationInfo then return end

  local name = reputationInfo.name
  local isHeader = reputationInfo.isHeader
  local factionID = reputationInfo.factionID

  if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsShown() and isChecked and not REP.UseDetailPanel) then
    REP.Orig_ReputationDetailFrame:Hide()
  end

  if REP.UseModernReputationUI then
    C_Reputation.SetFactionActive(factionIndex, shouldBeActive)
  else
    if shouldBeActive then
      SetFactionActive(factionIndex)
    else
      SetFactionInactive(factionIndex)
    end

    REP_ReputationFrame_Update()
  end

  if (factionID) then
    local guid = UnitGUID("player")
    REP:InitOrCheckSavedVariables()

    if shouldBeActive then
      REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = nil
    else
      REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = true
    end
  end

  REP:PlayCheckBoxSound(isChecked)
end
