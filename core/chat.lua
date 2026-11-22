----------------------------------------------------------
-- Reputation Guide | Reputation changes to chat --
-- Reputation gains and losses printed to the chat.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

-----------------------------------
-- 14 reputation Changes to chat --
-----------------------------------
function REP:DumpReputationChangesToChatOnUpdate()
  -- The baseline snapshot is taken once all factions are indexed.
  if REP.FactionIndexInProgress then return end

  local changes = REP:DetectReputationChanges()
  if not changes or #changes == 0 then return end

  if REP.RecordReputationChanges then REP:RecordReputationChanges(changes) end

  if REP_Data.Global.ShowAllFactionsGains then
    REP:DumpReputationChangesToChatForAllFactions(changes)
  else -- Print ONLY the last change
    local last = changes[#changes]
    if last then
      REP:DumpReputationChangesToChatForSingleFaction(last.info)

      if REP_Data.Global.SwitchFactionBar and not last.info.isWatched then
        if REP.UseModernReputationUI or (REP.AfterClassic and C_Reputation.SetWatchedFaction) then
          REP:WatchFactionById(last.factionID)
        else
          local watchIndex = REP:GetFactionIndexBasedOnFactionID(last.factionID)
          REP:WatchFactionByIndex(watchIndex)
        end
      end
    end
  end
end

function REP:DumpReputationChangesToChatForAllFactions(changes)
  if (REP.OnLoadingScreen == false) then
    local factionIndex, watchIndex, watchID, watchedIndex, watchedID
    local name, standingID, barMin, barMax, barValue, isHeader, hasRep
    local factionID

    if not changes then return end

    for _, v in ipairs(changes) do
      local info = REP:getRepInfo(v.info)

      if info.isWatched then
        if REP.UseModernReputationUI or (REP.AfterClassic and C_Reputation.SetWatchedFaction) then
          watchedID = info.factionID
        else
          watchedIndex = REP:GetFactionIndexBasedOnFactionID(info.factionID)
        end
      end

      REP:DumpReputationChangesToChatForSingleFaction(info)

      if (REP_Data.Global.SwitchFactionBar and not info.negative and (not REP_Data.Global.NoGuildSwitch or info.factionID ~= 1168)) then
        if REP.UseModernReputationUI or (REP.AfterClassic and C_Reputation.SetWatchedFaction) then
          watchID = info.factionID
        else
          watchIndex = REP:GetFactionIndexBasedOnFactionID(info.factionID)
        end
      end
    end

    if REP_Data.Global.SwitchFactionBar then
      if(not REP.AfterTBC and factionsChanged and REP:TableSize(factionsChanged) > 1) then
        table.sort(factionsChanged, REP:TableSort())
        watchIndex = factionsChanged[1].watchIndex
      end

      if REP.UseModernReputationUI or (REP.AfterClassic and C_Reputation.SetWatchedFaction) then
        if (watchID and watchID > 0 and watchID ~= watchedID) then
          REP:WatchFactionById(watchID)
        end
      else
        if (watchIndex and watchIndex > 0 and watchIndex ~= watchedIndex) then
          REP:WatchFactionByIndex(watchIndex)
        end
      end
    end
  end
end

function REP:PrintReputationChangesToChat(args)
  if not args or not args.format or not args.name then return end

  local format           = args.format
  local name             = args.name
  local change           = args.change or 0
  local changeString     = args.changeString or ""
  local session          = args.session or 0
  local repToGo          = args.repToGo or 0
  local nextStandingText = args.nextStandingText or ""

  REP:Print(REP.NEW_REP_COLOUR..string.format(format, name, change, changeString, session, nextStandingText, repToGo))
end

function REP:DumpReputationChangesToChatForSingleFaction(info)
  if info == nil or info.name == nil then return end

  if (REP_Data.Global.WriteChatMessage and (not REP_Data.Global.NoGuildGain or info.factionID ~= 1168)) then
    local format, name, change, changeString, session, repToGo, nextStandingText

    name = info.name
    change = info.change
    session = info.session
    repToGo = info.maximum - info.current

    if info.negative then -- Decreased reputation
      changeString = ""

      if not info.isRenown then
        if (info.standingID >= 1 and not info.isFriend) then
          format = FACTION_STANDING_DECREASED..REP_TXT.statsNextStanding
          nextStandingText = _G["FACTION_STANDING_LABEL"..info.standingID + 1]
        else
          format = FACTION_STANDING_DECREASED..REP_TXT.stats
        end
      end
    else -- Increased reputation
      changeString = "+"

      if info.isCapped then
        format = FACTION_STANDING_INCREASED..REP_TXT.stats
      else
        if info.isRenown then
          if info.change >= (info.maximum - info.current) then
            format = FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding
            nextStandingText = REP_TXT.renown.." "..(info.renown + 1) + 1
          else
            format = FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding
            nextStandingText = REP_TXT.renown.." "..info.renown + 1
          end
        elseif info.isFriend then
          format = FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding
          nextStandingText = REP:GetFriendshipStandingLabelAsBackup(info)
        else
          if REP_Data.Global.ShowBonusGainsInChat and info.hasBonusRepGain then
            local baseReputation = info.change / 2 -- Commendations are added last after other bonuses, so it's always 100% bonus, so half of total.
            local bonusReputation = REP:RoundToOneDecimal(baseReputation)
            local changeMessage = tostring(info.change)..". (+"..tostring(bonusReputation).." "..REP_TXT.bonus..")"
            local factionStringWithBonus = FACTION_STANDING_INCREASED:gsub("%%d", "%%s")

            change = changeMessage

            if info.standingID < 8 then
              format = factionStringWithBonus..REP_TXT.statsNextStanding
              nextStandingText = _G["FACTION_STANDING_LABEL"..info.standingID + 1]
            else
              format = factionStringWithBonus..REP_TXT.stats
            end
          else
            if info.standingID < 8 then
              format = FACTION_STANDING_INCREASED..REP_TXT.statsNextStanding
              nextStandingText = _G["FACTION_STANDING_LABEL"..info.standingID + 1]
            else
              format = FACTION_STANDING_INCREASED..REP_TXT.stats
            end
          end
        end
      end
    end

    REP:PrintReputationChangesToChat{format = format, name = name, change = change, changeString = changeString, session = session, nextStandingText = nextStandingText, repToGo = repToGo}
  end

  REP:InitOrCheckSavedVariables()

  local guid = UnitGUID("player")
  if guid then
    local currentStandingID

    if info.isFriend then
      currentStandingID = 5
    else
      currentStandingID = info.standingID
    end

    REP_Data.ProfileKeys[guid].factions[info.factionID] = {
      standing = info.standingText or "",
      standingID = currentStandingID or 0,
      current = info.current or 0,
      max = info.maximum or 0
    }
  end
end

function REP:GetFriendshipStandingLabelAsBackup(info)
  if info.standingTextNext then
    return info.standingTextNext
  else
    info["standingTextNext"] = REP:GetFriendFactionStandingLabel(info.factionID, info.top)
    
    if info.standingTextNext then
      return info.standingTextNext
    else
      return ""
    end
  end
end

function REP_ClearSessionGain()
  REP:PlayCheckBoxSound(false)

  local factionData = REP:GetSelectedFactionData()
  local factionID = factionData and factionData.factionID

  if (factionID and REP.factions and REP.factions[factionID]) then
    REP.factions[factionID].session = 0
  end

  if REP.UseModernReputationUI then
    REP:FillReputationDetailFrameWithData()
  else
    ReputationFrame_Update()
  end
end
