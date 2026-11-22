----------------------------------------------------------
-- Reputation Guide | Slash commands --
-- Slash commands, chat message filter and opening the options.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

------------------------
-- 04 Slash Handler --
------------------------
function REP_SlashHandler(msg)
  if not msg then
    return
  else
    local msgLower = string.lower(msg)
    local words = REP:GetWords(msg)
    local wordsLower = REP:GetWords(msgLower)
    local size = REP:TableSize(wordsLower)
    local FD_SH = REP_Data.Global
    
    if (size > 0) then
      if (wordsLower[0]=="enable") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = true
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = true
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = true
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = true
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = true
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = true
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = true
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = true
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = true
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = true
          elseif (wordsLower[1]=="bar") then
            FD_SH.SwitchFactionBar = true
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = true
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = true
            FD_SH.ShowQuests = true
            FD_SH.ShowPvPQuests = true
            FD_SH.ShowInstances = true
            FD_SH.ShowItems = true
            FD_SH.ShowGeneral = true
            FD_SH.ShowMissing = true
            FD_SH.ExtendDetails = true
            FD_SH.WriteChatMessage = true
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = true
            FD_SH.SwitchFactionBar = true
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if REP.ApplyDetailFrameMode then REP:ApplyDetailFrameMode() end

          if (ReputationFrame:IsVisible() and not REP.UseModernReputationUI) then
            ReputationFrame_Update()
          end

          if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0]=="disable") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = false
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = false
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = false
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = false
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = false
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = false
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = false
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = false
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = false
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = false
          elseif (wordsLower[1]=="bar") then
            FD_SH.SwitchFactionBar = false
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = false
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = false
            FD_SH.ShowQuests = false
            FD_SH.ShowPvPQuests = false
            FD_SH.ShowInstances = false
            FD_SH.ShowItems = false
            FD_SH.ShowGeneral = false
            FD_SH.ShowMissing = false
            FD_SH.ExtendDetails = false
            FD_SH.WriteChatMessage = false
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = false
            FD_SH.SwitchFactionBar = false
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if REP.ApplyDetailFrameMode then REP:ApplyDetailFrameMode() end

          if (ReputationFrame:IsVisible() and not REP.UseModernReputationUI) then
            ReputationFrame_Update()
          end

          if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0]=="toggle") then
        if (size > 1) then
          if (wordsLower[1]=="mobs") then
            FD_SH.ShowMobs = not FD_SH.ShowMobs
          elseif (wordsLower[1]=="quests") then
            FD_SH.ShowQuests = not FD_SH.ShowQuests
          elseif (wordsLower[1]=="pvpquests") then
            FD_SH.ShowPvPQuests = not FD_SH.ShowPvPQuests
          elseif (wordsLower[1]=="dungeons" or wordsLower[1]=="instances") then
            FD_SH.ShowInstances = not FD_SH.ShowInstances
          elseif (wordsLower[1]=="items") then
            FD_SH.ShowItems = not FD_SH.ShowItems
          elseif (wordsLower[1]=="general") then
            FD_SH.ShowGeneral = not FD_SH.ShowGeneral
          elseif (wordsLower[1]=="missing") then
            FD_SH.ShowMissing = not FD_SH.ShowMissing
          elseif (wordsLower[1]=="details") then
            FD_SH.ExtendDetails = not FD_SH.ExtendDetails
          elseif (wordsLower[1]=="chat") then
            FD_SH.WriteChatMessage = not FD_SH.WriteChatMessage
            FD_SH.NoGuildGain = false
          elseif (wordsLower[1]=="preview") then
            FD_SH.ShowPreviewRep = not FD_SH.ShowPreviewRep
          elseif (wordsLower[1]=="preview") then
            FD_SH.SwitchFactionBar = not FD_SH.SwitchFactionBar
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          elseif (wordsLower[1]=="paragon") then
            FD_SH.ShowParagonBar = not FD_SH.ShowParagonBar
          elseif (wordsLower[1]=="all") then
            FD_SH.ShowMobs = not FD_SH.ShowMobs
            FD_SH.ShowQuests = not FD_SH.ShowQuests
            FD_SH.ShowPvPQuests = not FD_SH.ShowPvPQuests
            FD_SH.ShowInstances = not FD_SH.ShowInstances
            FD_SH.ShowItems = not FD_SH.ShowItems
            FD_SH.ShowGeneral = not FD_SH.ShowGeneral
            FD_SH.ShowMissing = not FD_SH.ShowMissing
            FD_SH.ExtendDetails = not FD_SH.ExtendDetails
            FD_SH.WriteChatMessage = not FD_SH.WriteChatMessage
            FD_SH.NoGuildGain = false
            FD_SH.ShowPreviewRep = not FD_SH.ShowPreviewRep
            FD_SH.SwitchFactionBar = not FD_SH.SwitchFactionBar
            FD_SH.NoGuildSwitch = false
            FD_SH.SilentSwitch = false
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end

          if REP.ApplyDetailFrameMode then REP:ApplyDetailFrameMode() end

          if (ReputationFrame:IsVisible() and not REP.UseModernReputationUI) then
            ReputationFrame_Update()
          end

          if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
            REP_BuildUpdateList()
            REP_UpdateList_Update()
          end
        else
          REP:PrintSlash(REP_TXT.command, msgLower)
        end
      elseif (wordsLower[0] == "list") then
        if (size > 1) then
          if (wordsLower[1] == "1" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL1"])) then
            REP:ListByStanding(1)
          elseif (wordsLower[1] == "2" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL2"])) then
            REP:ListByStanding(2)
          elseif (wordsLower[1] == "3" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL3"])) then
            REP:ListByStanding(3)
          elseif (wordsLower[1] == "4" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL4"])) then
            REP:ListByStanding(4)
          elseif (wordsLower[1] == "5" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL5"])) then
            REP:ListByStanding(5)
          elseif (wordsLower[1] == "6" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL6"])) then
            REP:ListByStanding(6)
          elseif (wordsLower[1] == "7" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL7"])) then
            REP:ListByStanding(7)
          elseif (wordsLower[1] == "8" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL8"])) then
            REP:ListByStanding(8)
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end
        else
          REP:ListByStanding()
        end
      elseif (wordsLower[0] == "loc") then
        if (size>1) then
          if (wordsLower[1] == "1" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL1"])) then
            REP:ListByStanding(1)
          elseif (wordsLower[1] == "2" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL2"])) then
            REP:ListByStanding(2)
          elseif (wordsLower[1] == "3" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL3"])) then
            REP:ListByStanding(3)
          elseif (wordsLower[1] == "4" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL4"])) then
            REP:ListByStanding(4)
          elseif (wordsLower[1] == "5" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL5"])) then
            REP:ListByStanding(5)
          elseif (wordsLower[1] == "6" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL6"])) then
            REP:ListByStanding(6)
          elseif (wordsLower[1] == "7" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL7"])) then
            REP:ListByStanding(7)
          elseif (wordsLower[1] == "8" or wordsLower[1] == string.lower(_G["FACTION_STANDING_LABEL8"])) then
            REP:ListByStanding(8)
          else
            REP:PrintSlash(REP_TXT.command, msgLower)
          end
        else
          REP:ListByStanding()
        end
      elseif (wordsLower[0] == "status") then
        REP:Status()
      elseif (wordsLower[0] == "help") then
        REP:Help()
      elseif (wordsLower[0] == "about") then
        REP:About()
      elseif (wordsLower[0] == "watch" and (REP.AfterClassic or REP.UseModernReputationUI)) then
        REP:WatchFactionById(tonumber(wordsLower[1]))
      elseif (wordsLower[0] == "watchindex") then
        REP:WatchFactionByIndex(tonumber(wordsLower[1]))
      elseif (wordsLower[0] == "verify") then
        REP:VerifySourceIDs()
      elseif (wordsLower[0] == "nosources") then
        REP:ListFactionsWithoutSources()
      elseif (wordsLower[0] == "sync") then
        REP:StartManualFactionSync()
      elseif (wordsLower[0] == "record") then
        if wordsLower[1] == "status" then REP:PrintRecordedSources() else REP:ToggleSourceRecording() end
      else
        REP:PrintSlash(REP_TXT.command, msgLower)
      end
    else
      -- do nothing
    end
  end
end

-----------------------------------
-- 05 chat filtering
-----------------------------------
function REP_ChatFilter(chatFrame, event, ...)
  -- chatFrame = self
  --[[
    CHAT_MSG_COMBAT_FACTION_CHANGE
    Fires when player's faction changes. ie: "Your reputation with Timbermaw Hold has very slightly increased." -- NEW 1.9
    arg1
    The message to display

    COMBAT_TEXT_UPDATE
    arg1
    Combat message type.
    Known values include "HONOR_GAINED", and "FACTION".
    arg2
    for faction gain, this is the faction name.
    arg3
    for faction gain, the amount of reputation gained.
  ]]--

  local msg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13 = ...

  local skip = false
  if (REP_Data.Global.WriteChatMessage and event) then

    if (event == "CHAT_MSG_COMBAT_FACTION_CHANGE") then
      skip = true
    end

    if ((event == "COMBAT_TEXT_UPDATE") and (msg == "FACTION")) then
      skip = true
    end
  end

  return skip, msg, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13
end

-----------------------------------
-- 06 show option window
-----------------------------------
function REP_OpenSettings()
  REP.Tools.Settings:Open()
end
