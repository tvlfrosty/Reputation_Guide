local addonName, vars = ...
local ReputationGuide = vars

local factions = ReputationGuide.factions or {}
ReputationGuide.factions = factions
ReputationGuide._repSnapshot = {}

local factionPanelFix = true
local MAX_FACTION_ID = 5000
local FACTION_IDS_PER_FRAME = 250
local STEP_TIME_BUDGET = 4 -- milliseconds of work per frame

-- Thanks to the Pretty Reputation Addon (https://www.curseforge.com/wow/addons/pretty-reputation) for the factionPanelFix fix.
function ReputationGuide:IndexFactions(isInitialLogin, isReloadingUi, forceFactionPanelFix)
  if not (isInitialLogin or isReloadingUi or forceFactionPanelFix) then return end
  
  if ReputationGuide.UseScrollBoxReputationUI then
    do
      for _, factionId in ipairs(ReputationGuide.Orig_GetMajorFactionIDs()) do
        ReputationGuide:IndexFaction(ReputationGuide.Orig_GetMajorFactionData(factionId))
      end
    end
  end

  -- Modern clients look factions up by ID (below), so the faction list doesn't need to be expanded first.
  local expandHeaders = not ReputationGuide.UseModernReputationUI

  do
    local collapsedHeaders = expandHeaders and ReputationGuide:saveRepHeaders() or {}
    for i = 1, ReputationGuide.Orig_GetNumFactions() do
      ReputationGuide:IndexFaction(ReputationGuide:GetFactionDataByIndex(i))
    end
    ReputationGuide:restoreRepHeaders(collapsedHeaders)
  end

  if ReputationGuide.UseModernReputationUI or forceFactionPanelFix then
    if factionPanelFix or forceFactionPanelFix then
      factionPanelFix = false

      if forceFactionPanelFix then
        -- Needed right away (a reputation change of an unknown faction).
        ReputationGuide:IndexFactionsByID(1, MAX_FACTION_ID)
        ReputationGuide:MarkFactionIDCacheComplete()
      else
        -- Reputation changes aren't reported until the lookup is done (the snapshot is taken then).
        ReputationGuide.FactionIndexInProgress = true
        ReputationGuide:RunAfterLoadingScreen(function()
          if ReputationGuide:IsFactionIDCacheValid() then
            -- Same game build as a previous full scan: only the faction IDs found then (and since) are looked up.
            ReputationGuide:IndexFactionsByIDInSteps(ReputationGuide:GetCachedFactionIDs())
          else
            ReputationGuide:IndexFactionsByIDInSteps()
          end
        end)
      end
    end
  end
end

-- Factions that aren't in the reputation list (yet), looked up by ID.
function ReputationGuide:IndexFactionsByID(firstID, lastID)
  for factionID = firstID, lastID do
    local factionData = ReputationGuide:GetFactionDataByID(factionID)
    if factionData and factionData.factionID and not factions[factionData.factionID] then
      ReputationGuide:IndexFaction(factionData)
      if factions[factionData.factionID] then
        factions[factionData.factionID].blizzFix = true
      end
    end
  end
end

-- After the loading screen the lookup is spread over several frames (a few milliseconds of work per frame).
-- Reputation changes aren't reported until it is done, then the baseline snapshot is taken.
-- Without a list of IDs all IDs (1 - MAX_FACTION_ID) are scanned and the result is cached for this build;
-- only that full scan (first login on a new game build) is announced in the chat, with its progress.
function ReputationGuide:IndexFactionsByIDInSteps(factionIDs, isManual)
  ReputationGuide.FactionIndexInProgress = true
  ReputationGuide.FactionSyncRunning = true

  local isFullScan = factionIDs == nil
  local total = isFullScan and MAX_FACTION_ID or #factionIDs
  local position = 1
  local announced = false
  local combatAnnounced = false
  local useTimer = debugprofilestop ~= nil

  local function ShowMessages()
    return isFullScan and not (REP_Data and REP_Data.Global and REP_Data.Global.ShowSyncMessages == false)
  end

  local function Announce()
    if announced then return end
    announced = true
    if ShowMessages() then ReputationGuide:Print(isManual and REP_TXT.factionSyncManualStart or REP_TXT.factionSyncStart) end
  end

  local function IndexNext()
    if isFullScan then
      ReputationGuide:IndexFactionsByID(position, position)
    else
      ReputationGuide:IndexFactionsByID(factionIDs[position], factionIDs[position])
    end
    position = position + 1
  end

  local function Step()
    -- Not during combat: wait (checked every second) and go on where it stopped.
    if InCombatLockdown and InCombatLockdown() then
      if not combatAnnounced and ShowMessages() then ReputationGuide:Print(REP_TXT.factionSyncCombat) end
      combatAnnounced = true
      C_Timer.After(1, Step)
      return
    end
    combatAnnounced = false

    Announce()

    if useTimer then
      local started = debugprofilestop()
      repeat IndexNext() until position > total or debugprofilestop() - started >= STEP_TIME_BUDGET
    else
      local last = math.min(position + FACTION_IDS_PER_FRAME - 1, total)
      while position <= last do IndexNext() end
    end

    if position <= total then
      C_Timer.After(0, Step)
    else
      if isFullScan then
        ReputationGuide:MarkFactionIDCacheComplete()
        if ShowMessages() then ReputationGuide:Print(REP_TXT.factionSyncDone) end
      end
      ReputationGuide.FactionIndexInProgress = false
      ReputationGuide.FactionSyncRunning = false
      ReputationGuide:TakeReputationSnapshot()
      if ReputationGuide.RefreshSortedReputationList then ReputationGuide:RefreshSortedReputationList() end
    end
  end

  C_Timer.After(0, Step)
end

-- /rep sync: every faction ID again, with the progress in the chat.
function ReputationGuide:StartManualFactionSync()
  if ReputationGuide.FactionSyncRunning then
    ReputationGuide:Print(REP_TXT.factionSyncBusy)
    return
  end
  ReputationGuide:IndexFactionsByIDInSteps(nil, true)
end

---------------------------------------------------------------------------------------------
-- Faction ID cache (per character)
-- The default reputation list doesn't always contain every faction the character knows (Blizzard
-- drops some of them at login), so every faction ID was looked up at every login. The IDs that
-- exist are now remembered per character and game build:
--  * the first login on a new build still scans every ID (new factions can be added by a patch),
--  * every faction that gets indexed later on (any source) is added to the cache,
--  * factions that appear in the reputation list during play are picked up on every faction update.
---------------------------------------------------------------------------------------------
local buildKey
local function GetBuildKey()
  if not buildKey then
    local version, build, _, interface = GetBuildInfo()
    buildKey = tostring(interface).."-"..tostring(version).."-"..tostring(build)
  end
  return buildKey
end

local factionIDCache
local function GetFactionIDCache()
  local guid = UnitGUID("player")
  if not guid or not REP_Data then return end

  local profile = REP_Data.ProfileKeys and REP_Data.ProfileKeys[guid]
  if factionIDCache and profile and profile.factionIDCache == factionIDCache then return factionIDCache end

  ReputationGuide:InitOrCheckSavedVariables()
  profile = REP_Data.ProfileKeys[guid]
  if not profile then return end

  if not profile.factionIDCache or profile.factionIDCache.build ~= GetBuildKey() then
    profile.factionIDCache = { build = GetBuildKey(), complete = false, ids = {} }
  end

  factionIDCache = profile.factionIDCache
  return factionIDCache
end

function ReputationGuide:IsFactionIDCacheValid()
  local cache = GetFactionIDCache()
  return cache and cache.complete and next(cache.ids) ~= nil
end

function ReputationGuide:GetCachedFactionIDs()
  local cache = GetFactionIDCache()
  local ids = {}

  for factionID in pairs(cache and cache.ids or {}) do
    table.insert(ids, factionID)
  end

  table.sort(ids)
  return ids
end

function ReputationGuide:MarkFactionIDCacheComplete()
  local cache = GetFactionIDCache()
  if cache then cache.complete = true end
end

function ReputationGuide:AddToFactionIDCache(factionID)
  if type(factionID) ~= "number" or not ReputationGuide.UseModernReputationUI then return end

  local cache = GetFactionIDCache()
  if cache then cache.ids[factionID] = true end
end

-- Factions that showed up in the reputation list since the last check (for example a faction that was
-- just discovered) are indexed, so their reputation changes are reported like any other faction.
function ReputationGuide:IndexNewFactionsFromList()
  local newFactions = false

  for i = 1, ReputationGuide.Orig_GetNumFactions() do
    local factionData = ReputationGuide:GetFactionDataByIndex(i)

    if factionData and factionData.factionID and factionData.factionID ~= 0 and not factions[factionData.factionID] then
      ReputationGuide:IndexFaction(factionData)
      newFactions = true
    end
  end

  return newFactions
end

function ReputationGuide:IndexFaction(factionData)
  if factionData and factionData.name and factionData.factionID and factionData.factionID ~= 0 then
    ReputationGuide:AddToFactionIDCache(factionData.factionID)

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
      info["factionID"] = factionData.factionID
      info["faction"] = factionData.name
      info["change"] = 0
      info["session"] = factions[factionData.factionID].session
      info["expansionID"] = factionData.expansionID
      factions[factionData.factionID].info = ReputationGuide:getRepInfo(info)
    end

    if factions[factionData.factionID].info then
      local guid = UnitGUID("player")
      ReputationGuide:InitOrCheckSavedVariables()

      -- If you want to recache all factions on login, temp remove "and not REP_Data.ProfileKeys[guid].factions[factionData.factionID]".
      if guid and REP_Data.ProfileKeys[guid].factions and not REP_Data.ProfileKeys[guid].factions[factionData.factionID] then 
        local currentStandingID

        if factions[factionData.factionID].info.isFriend then
          currentStandingID = 5
        else
          currentStandingID = factions[factionData.factionID].info.standingID
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
    if ReputationGuide.Orig_ExpandAllFactionHeaders then
      ReputationGuide.Orig_ExpandAllFactionHeaders()
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
      if ReputationGuide.Orig_ExpandFactionHeader then
        ReputationGuide.Orig_ExpandFactionHeader(i)
      else
        ExpandFactionHeader(i)
      end
      
      
      collapsed[factionData.factionID] = true
    end
    previousName = factionData.name
    i = i + 1
  end

   -- to be sure every header is expanded
  if ReputationGuide.Orig_ExpandAllFactionHeaders then
    ReputationGuide.Orig_ExpandAllFactionHeaders()
  else
    ExpandAllFactionHeaders()
  end
  return collapsed
end

function ReputationGuide:restoreRepHeaders(collapsed)
  if next(collapsed) == nil then return end
  for i = ReputationGuide.Orig_GetNumFactions(), 1, -1 do
    local factionData = ReputationGuide:GetFactionDataByIndex(i)
    if (factionData.factionID == nil) then factionData.factionID = factionData.name	end

    if factionData.isHeader and collapsed[factionData.factionID] then
      if ReputationGuide.Orig_CollapseFactionHeader then
        ReputationGuide.Orig_CollapseFactionHeader(i)
      else
        CollapseFactionHeader(i)
      end
    end
  end
end

function ReputationGuide:getRepInfo(info)
  if (info.factionID and info.factionID ~= 0) then
    local factionData = ReputationGuide:GetFactionDataByID(info.factionID)
    info["standingID"] = factionData.reaction
    info["name"] = factionData.name
    info["bottom"] = factionData.currentReactionThreshold
    info["top"] = factionData.nextReactionThreshold
    info["isHeader"] = factionData.isHeader
    info["isWatched"] = factionData.isWatched
    info["hasBonusRepGain"] = factionData.hasBonusRepGain

    info["paragon"] = 0
    info["renown"] = 0
    info["standingTextNext"] = ""
    info["reward"] = ""

    if ReputationGuide.UseScrollBoxReputationUI then
      if (ReputationGuide.Orig_IsMajorFaction(info.factionID)) then
        info["isRenown"] = true
        local data = ReputationGuide.Orig_GetMajorFactionData(info.factionID)
        local isCapped = ReputationGuide.Orig_HasMaximumRenown(info.factionID)
        local isParagon = ReputationGuide.Orig_IsFactionParagon(info.factionID)
  
        if data then
          info["bottom"] = (data.renownLevel - 1) * data.renownLevelThreshold
          info["top"] = data.renownLevel * data.renownLevelThreshold
          info["current"] = isCapped and data.renownLevelThreshold or data.renownReputationEarned or 0
          info["maximum"] = data.renownLevelThreshold
          info["standingText"] = (REP_TXT.renown.." "..data.renownLevel)
          info["renown"] = data.renownLevel
          info["standingTextNext"] = REP_TXT.renown.." "..(data.renownLevel + 1)
          info["standingID"] = 10
          info["standingIDNext"] = 10
          
          if not isCapped or not isParagon then return info end
          if isCapped then info["isCapped"] = true end
  
          local currentValue, threshold, totalValue, hasRewardPending = ReputationGuide.Orig_GetFactionParagonInfo(info.factionID)
          
          if not currentValue then currentValue = 0 end
          if not totalValue then totalValue = 0 end
          if not threshold then threshold = 10000 end
          
          local paragonLevel = (totalValue - (totalValue % threshold)) / threshold

          info["paragon"] = paragonLevel
          info["standingTextNext"] = ReputationGuide:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
          info["standingID"] = 9
          info["standingIDNext"] = 9
          
          if hasRewardPending then
            local reward = "|A:ParagonReputation_Bag:0:0|a"
            info["reward"] = reward
          end
  
          info["current"] = mod(currentValue, threshold)
          info["maximum"] = threshold
          info["bottom"] = info["bottom"] + paragonLevel * threshold
          info["top"] = info["bottom"] + threshold
          return info
        else
          info["current"] = 0
          info["renown"] = 1
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

    if ReputationGuide.HasParagonAPI and ReputationGuide.Orig_IsFactionParagon then
      if (ReputationGuide.Orig_IsFactionParagon(info.factionID)) then
        local currentValue, threshold, totalValue, hasRewardPending = ReputationGuide.Orig_GetFactionParagonInfo(info.factionID);

        if not currentValue then currentValue = 0 end
        if not totalValue then totalValue = 0 end
        if not threshold then threshold = 10000 end

        local paragonLevel = (totalValue - (totalValue % threshold))/threshold

        info["paragon"] = paragonLevel
        info["standingText"] = ReputationGuide:getFactionLabel("paragon")
        info["standingTextNext"] = ReputationGuide:getFactionLabel("paragon") .. " " .. (paragonLevel + 1)
        info["standingID"] = 9
        info["standingIDNext"] = 9
  
        if hasRewardPending then
          local reward = "|A:ParagonReputation_Bag:0:0|a"
          info["reward"] = reward
        end
  
        info["current"] = mod(currentValue, threshold)
        info["maximum"] = threshold
        info["bottom"] = info["top"] + paragonLevel * threshold
        info["top"] = info["bottom"] + threshold

        return info
      end  
    end

    local friendInfo = ReputationGuide.Orig_GetFriendshipReputation(info.factionID)
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
    info["standingIDNext"] = (info.negative and factionData.reaction > 1 and (factionData.reaction - 1)) or (not info.negative and factionData.reaction < 8 and (factionData.reaction + 1))
    return info
  end

  return info
end

function ReputationGuide:getFactionInfo(info)
  if ReputationGuide.factions[info.factionID] then
    local session = ReputationGuide:getFactionSession(info)
    ReputationGuide.factions[info.factionID].session = session
    info["lastUpdated"] = time()
    info["session"] = session
    ReputationGuide.factions[info.factionID].info = ReputationGuide:getRepInfo(info)
  end
  return info
end

function ReputationGuide:getFactionInfoForNewFaction(info)
  if info and info.factionID then
    local factionData = ReputationGuide:GetFactionDataByID(info.factionID)
    if factionData and factionData.factionID and not factions[factionData.factionID] then
      ReputationGuide:IndexFaction(factionData)
      ReputationGuide.factions = factions
    end

    info = ReputationGuide:getFactionInfo(info)
  else
    ReputationGuide:IndexFactions(false, false, true)
    ReputationGuide.factions = factions

    for i, factionData in pairs(ReputationGuide.factions) do
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

function ReputationGuide:BuildReputationSnapshot()
  local snapshot = {}

  for factionID, faction in pairs(ReputationGuide.factions) do
    if faction.info then
      -- OLD INFO
      local oldInfo = faction.info
      local oldBottom = oldInfo.bottom or 0
      local oldTop = oldInfo.top or 0
      local oldCurrent = oldInfo.current or 0
      local oldAbsolute = oldBottom + oldCurrent
      local oldStandingID = oldInfo.standingID or 0
      local oldRenown = oldInfo.renown or 0
      local oldParagon = oldInfo.paragon or 0
      -- NEW INFO
      local newInfo = ReputationGuide:getRepInfo(oldInfo) or {}
      local newBottom = newInfo.bottom or 0
      local newTop = newInfo.top or 0
      local newCurrent = newInfo.current or 0
      local newAbsolute = newBottom + newCurrent
      local newStandingID = newInfo.standingID or 0
      local newRenown = newInfo.renown or 0
      local newParagon = newInfo.paragon or 0

      local change = 0
      local tierChanged = (oldStandingID ~= newStandingID) or (oldRenown ~= newRenown) or (oldParagon ~= newParagon)

      if not tierChanged then
        change = newAbsolute - oldAbsolute
      else
        if (newStandingID > oldStandingID) or (newRenown > oldRenown) or (newParagon > oldParagon) then
          change = (oldTop - oldAbsolute) + newCurrent
        else
          change = -((oldAbsolute - oldBottom) + (newTop - newAbsolute))
        end
      end

      snapshot[factionID] = change or 0
    end
  end

  return snapshot
end

function ReputationGuide:TakeReputationSnapshot()
  local snapshot = ReputationGuide:BuildReputationSnapshot()
  self._repSnapshot = snapshot
end