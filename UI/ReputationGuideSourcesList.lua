----------------------------------------------------------
-- Reputation Guide | Reputation sources list --
-- Builds and shows the list of reputation sources of the selected faction.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

-----------------------------------
-- 12 Update list --
-----------------------------------
REP.UPDATE_LIST_HEIGHT = 13

-- Remove button behind the name of manually added lines.
local function GetRemoveButton(entryFrame)
  if entryFrame.RemoveButton then return entryFrame.RemoveButton end

  local button = CreateFrame("Button", nil, entryFrame)
  button:SetSize(12, 12)
  button:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
  button:SetHighlightTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Highlight", "ADD")
  button:SetPushedTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Down")
  button:SetScript("OnClick", function(self)
    if self.source and REP:RemoveManualSourceByRef(self.source) then
      REP:Print(REP.HELP_COLOUR..addonName..":|r "..REP_TXT.manualRemoved, true)
    end
  end)
  button:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(REP_TXT.manualRemoveTip)
    GameTooltip:Show()
  end)
  button:SetScript("OnLeave", function() GameTooltip:Hide() end)

  entryFrame.RemoveButton = button
  return button
end

local function UpdateRemoveButton(entryFrame, entryName, source)
  if not source then
    if entryFrame.RemoveButton then entryFrame.RemoveButton:Hide() end
    return
  end

  local button = GetRemoveButton(entryFrame)
  local offset = math.min(entryName:GetStringWidth(), entryName:GetWidth() - 14) + 4
  button:ClearAllPoints()
  button:SetPoint("LEFT", entryName, "LEFT", offset, 0)
  button.source = source
  button:Show()
end

-- Filter and options menus of the sources list (details panel and the Classic details frame).
local SOURCE_FILTERS = {
  {"ShowQuests", "showQuests"},
  {"ShowPvPQuests", "showPvPQuests"},
  {"ShowInstances", "showInstances"},
  {"ShowMobs", "showMobs"},
  {"ShowItems", "showItems"},
  {"ShowGeneral", "showGeneral"},
}

-- A DropdownButton gets the menu as its own, any other button opens it as a context menu.
local function AttachMenu(button, generator)
  if button.SetupMenu then
    button:SetupMenu(generator)
  else
    button:SetScript("OnClick", function(self) MenuUtil.CreateContextMenu(self, generator) end)
  end
end

function REP:SetupSourcesFilterMenu(dropdown)
  local function IsFilterSet(key) return REP_Data.Global[key] and true or false end
  local function ToggleFilter(key)
    REP_Data.Global[key] = not REP_Data.Global[key]
    REP_BuildUpdateList()
    REP_UpdateList_Update()
  end

  AttachMenu(dropdown, function(_, rootDescription)
    for _, filter in ipairs(SOURCE_FILTERS) do
      rootDescription:CreateCheckbox(REP_TXT[filter[2]], IsFilterSet, ToggleFilter, filter[1])
    end
    rootDescription:CreateDivider()
    rootDescription:CreateButton(REP_TXT.showAll, function() REP_ToggleAllTypesToShow(true) end)
    rootDescription:CreateButton(REP_TXT.showNone, function() REP_ToggleAllTypesToShow(false) end)
  end)
end

function REP:SetupSourcesOptionsMenu(dropdown)
  if dropdown.SetupMenu then dropdown:SetText(OPTIONS or "Options") end
  AttachMenu(dropdown, function(_, rootDescription)
    rootDescription:CreateButton(REP_TXT.expand, function() REP_ShowUpdateEntries(true) end)
    rootDescription:CreateButton(REP_TXT.collapse, function() REP_ShowUpdateEntries(false) end)
    rootDescription:CreateDivider()
    rootDescription:CreateButton(REP_TXT.supressNoneFaction, function() REP_SupressNone(false) end)
    rootDescription:CreateButton(REP_TXT.supressNoneGlobal, function() REP_SupressNone(true) end)
    rootDescription:CreateDivider()
    rootDescription:CreateButton(REP_TXT.clearSessionGain, function() REP_ClearSessionGain() end)
    if REP.AddManualEntriesToMenu then REP:AddManualEntriesToMenu(rootDescription) end
  end)
end

function REP_UpdateList_Update()
  -- usually called In conjuction with REP_BuildUpdateList
  if (not REP.Orig_ReputationDetailFrame or not REP.Orig_ReputationDetailFrame:IsVisible()) then return end

  -- Fix for GetGuildInfo() function returning nil upon first login.
  if (IsInGuild() and REP.GuildName == nil) then
    REP.GuildName = GetGuildInfo("player")
    REP_InitFactionForGuildOnly()
  end

  REP_DetailListScrollFrame:Show()

  local numEntries, highestVisible = REP:GetUpdateListSize()

  -- Update scroll frame
  if (not FauxScrollFrame_Update(REP_DetailListScrollFrame, numEntries, REP.UPDATE_LIST_HEIGHT, REP.UPDATE_LIST_ROW_HEIGHT or 16)) then
    REP_DetailListScrollFrameScrollBar:SetValue(0)
  end

  local entryIndex
  local entryFrameName, entryFrame, entryTexture
  local entryLabel, entryName, entryRep, entryTimes
  local entryItemTimes, entryItemName, entryItemTotal
  local postfix

  local entryOffset = FauxScrollFrame_GetOffset(REP_DetailListScrollFrame)

  local haveInfo = false
  entryIndex = 1
  local i = 0
  local max = REP:TableSize(REP.UpdateList)

  while(i < entryOffset and entryIndex < max) do
    if REP.UpdateList[entryIndex].isShown then
      i = i + 1
    end

    entryIndex = entryIndex + 1
  end

  for i = 1, REP.UPDATE_LIST_HEIGHT, 1 do
    -- The rows of the details panel are created once it is laid out, stop at the rows that exist.
    if not _G["REP_DetailUpdateEntry"..i] then break end

    while ((entryIndex <= highestVisible) and not REP.UpdateList[entryIndex].isShown) do
      entryIndex = entryIndex + 1
    end

    if (entryIndex <= highestVisible) then
      haveInfo = true

      entryFrameName = "REP_DetailUpdateEntry"..i
      entryFrame = _G[entryFrameName]
      entryTexture = _G[entryFrameName.."Texture"]
      entryLabel = _G[entryFrameName.."Label"]
      entryName = _G[entryFrameName.."Name"]
      entryRep = _G[entryFrameName.."Rep"]
      entryTimes = _G[entryFrameName.."Times"]
      entryItemTimes = _G[entryFrameName.."ItemTimes"]
      entryItemName = _G[entryFrameName.."ItemName"]
      entryItemTotal = _G[entryFrameName.."TotalTimes"]
      local F_UL_ei = REP.UpdateList[entryIndex]

      if (entryFrame) then
        entryFrame:Show()
        entryFrame.id = F_UL_ei.index
        entryFrame.tooltipHead = F_UL_ei.tooltipHead
        entryFrame.tooltipTip = F_UL_ei.tooltipTip
        entryFrame.tooltipDetails = F_UL_ei.tooltipDetails
      end

      local color = ""
      if (F_UL_ei.highlight) then
        color = REP.HIGHLIGHT_COLOUR
      elseif (F_UL_ei.suppress) then
        color = REP.SUPPRESS_COLOUR
      elseif (F_UL_ei.lowlight) then
        color = REP.LOWLIGHT_COLOUR
      end

      if (F_UL_ei.type ~= "") then
        -- normal entry
        if (F_UL_ei.suppress) then
          postfix = ""
        else
          postfix = "-Green"
        end

        if (F_UL_ei.hasList) then
          if (F_UL_ei.listShown) then
            entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-MinusButton-Up"..postfix..".tga")
          else
            entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-PlusButton-Up"..postfix..".tga")
          end
        else
          entryTexture:SetTexture("Interface\\Addons\\"..addonName.."\\Textures\\UI-EmptyButton-Up"..postfix..".tga")
        end

        if (F_UL_ei.canSuppress) then
          entryTexture:Show()
        else
          entryTexture:Hide()
        end

        entryLabel:Show()
        entryName:Show()
        entryRep:Show()
        entryTimes:Show()

        entryLabel:SetText(color..F_UL_ei.type)
        entryName:SetText(color..F_UL_ei.name)
        entryRep:SetText(color..F_UL_ei.rep)
        entryTimes:SetText(color..F_UL_ei.times)

        entryItemTimes:Hide()
        entryItemName:Hide()
        entryItemTotal:Hide()

        UpdateRemoveButton(entryFrame, entryName, F_UL_ei.manualSource)
      else
        UpdateRemoveButton(entryFrame, entryName, nil)
        -- item entry
        entryTexture:Hide()
        entryLabel:Hide()
        entryName:Hide()
        entryRep:Hide()
        entryTimes:Hide()

        entryItemTimes:Show()
        entryItemName:Show()

        entryItemTimes:SetText(color..F_UL_ei.times)
        entryItemName:SetText(color..F_UL_ei.name)
      end

      entryIndex = entryIndex + 1
    else
      local entryFrame = _G["REP_DetailUpdateEntry"..i]
      if entryFrame then entryFrame:Hide() end
    end

    if haveInfo then
      REP_DetailNoInformationText:Hide()
    else
      REP_DetailNoInformationText:SetText(REP_TXT.noInfo)
      REP_DetailNoInformationText:Show()
    end
  end
end

function REP_MouseButtonUp(self, button)
  if (button and button == "LeftButton") then
    REP_UpdateEntryClick(self)
  elseif (button and button == "RightButton") then
    REP:UpdateEntrySuppress(self)
  end
end

function REP_UpdateEntryClick(self)
  -- sub function of REP_MouseButtonUp
  if (REP.UpdateList[self.id] and REP.UpdateList[self.id].hasList) then
    if (REP.UpdateList[self.id].listShown) then
      REP:ShowUpdateEntry(self.id, false)
    else
      REP:ShowUpdateEntry(self.id, true)
    end
  end
end

function REP:UpdateEntrySuppress(self)
  -- sub function of REP_UpdateEntryClick
  if (REP.UpdateList[self.id]) then
    if (REP.UpdateList[self.id].type ~= "") then
      if (REP.UpdateList[self.id].faction and REP.UpdateList[self.id].originalName) then
        if (not REP_Suppressed) then
          REP_Suppressed = {}
        end

        if (not REP_Suppressed[REP.UpdateList[self.id].faction]) then
          REP_Suppressed[REP.UpdateList[self.id].faction] = {}
        end

        if (REP_Suppressed[REP.UpdateList[self.id].faction][REP.UpdateList[self.id].originalName]) then
          REP_Suppressed[REP.UpdateList[self.id].faction][REP.UpdateList[self.id].originalName] = nil
        else
          REP_Suppressed[REP.UpdateList[self.id].faction][REP.UpdateList[self.id].originalName] = true
        end

        REP_BuildUpdateList()
      end
    end
  end
end

function REP_SupressNone(allFactions)
  REP:PlayCheckBoxSound(allFactions)

  if (allFactions == true) then
    REP_Suppressed = {}
    REP_BuildUpdateList()
  else
    local factionData = REP:GetSelectedFactionData() or {}
    local faction = factionData.name
    local factionID = factionData.factionID

    if (faction) then
      if REP.factions[factionID] and REP.factions[factionID].faction then
        faction = REP.factions[factionID].faction
      end

      faction = string.lower(faction)

      if factionID == 1168 then
        faction = faction.." (guild)"
      end

      if (not REP_Suppressed) then
        REP_Suppressed = {}
      end

      if REP_Suppressed[faction] then
        REP_Suppressed[faction] = nil
        REP_Suppressed[factionID] = {}
      else
        REP_Suppressed[factionID] = {}
      end
    end

    REP_BuildUpdateList()
  end
end

-----------------------------------
-- 13 Prepare update entries   --
-----------------------------------
function REP:Update_Tooltip(x, l1,r1)
  x = x + 1
  local ToolTip_ID = {l = l1, r = r1}
  return ToolTip_ID, x
end

function REP_BuildUpdateList()
  if (not REP.Orig_ReputationDetailFrame or not REP.Orig_ReputationDetailFrame:IsVisible()) then return end

  REP.UpdateList = {}
  REP.CurrentRepInBag = 0
  REP.CurrentRepInBagBank = 0
  REP.CurrentRepInQuest = 0

  local index = 1
  local factionData = REP:GetFactionDataToBuildReputationlist()

  if not factionData then return end

  local factionID = factionData.factionID
  local factionName = factionData.factionNameLowercase -- suppressed sources are saved per faction name
  local standingID = factionData.currentStandingID
  local repToNext = factionData.repToNext
  local normCurrent = factionData.normCurrent

  -- Bonus reputation (commendations) can change at any time, read it again for every list.
  REP:ClearBonusReputationFactions()

  do
    local fg_sid = REP:GetStandingSources(factionID, standingID)

    if (fg_sid) then
      -- instances
      if (fg_sid.instance and REP_Data.Global.ShowInstances) then
        local fg_sid_x = fg_sid.instance

        for i = 0, fg_sid.instance.count do
          local fg_sid_x_d = fg_sid_x.data[i]
          if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
            local toDo = string.format("%.2f", repToNext / fg_sid_x_d.rep)
            if (fg_sid_x_d.limit) then
              toDo = string.format("%.2f", (fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
            end

            REP.UpdateList[index] = {}
            local FUL_I = REP.UpdateList[index]
            FUL_I.manualSource = fg_sid_x_d.manualSource
            local bul_name = REP:InitMapName(fg_sid_x_d.name, true)
            FUL_I.type = REP_TXT.instanceShort
            FUL_I.times = math.ceil(toDo).."x"
            FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
            FUL_I.hasList = false
            FUL_I.listShown = nil
            FUL_I.index = index
            FUL_I.belongsTo = nil
            FUL_I.isShown = true
            FUL_I.name = bul_name.." ("..fg_sid_x_d.level..")"
            FUL_I.tooltipHead = REP_TXT.instanceHead
            FUL_I.tooltipTip = REP_TXT.instanceTip
            FUL_I.tooltipDetails = {}
            local FUL_I_TD = FUL_I.tooltipDetails
            local x = 0
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.instance2, bul_name)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mode, fg_sid_x_d.level)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.timesToRun, FUL_I.times)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
            FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
            FUL_I_TD.count = x
            FUL_I.tooltipDetails = FUL_I_TD
            REP.UpdateList[index] = FUL_I
            index = index + 1
          end
        end
      end

      -- mobs
      if (fg_sid.mobs and REP_Data.Global.ShowMobs) then
        local fg_sid_x = fg_sid.mobs

        for i = 0, fg_sid_x.count do
          local fg_sid_x_d = fg_sid_x.data[i]
          if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
            local toDo = ceil(repToNext / fg_sid_x_d.rep)
            if (fg_sid_x_d.limit) then
              toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
            end              

            REP.UpdateList[index] = {}
            local FUL_I = REP.UpdateList[index]
            FUL_I.manualSource = fg_sid_x_d.manualSource
            FUL_I.type = REP_TXT.mobShort
            FUL_I.times = math.ceil(toDo).."x"
            FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
            FUL_I.hasList = false
            FUL_I.listShown = nil
            FUL_I.index = index
            FUL_I.belongsTo = nil
            FUL_I.isShown = true
            FUL_I.tooltipHead = REP_TXT.mobHead
            FUL_I.tooltipTip = REP_TXT.mobTip
            local bul_name = REP:InitMobName(fg_sid_x_d.name)

            if (fg_sid_x_d.zone) then
              local bul_zone = REP:InitMapName(fg_sid_x_d.zone, false)

              if bul_zone then
                FUL_I.name = bul_name.." ("..bul_zone..")"
              else
                FUL_I.name = bul_name
              end

              FUL_I.tooltipDetails = {}
              local FUL_I_TD = FUL_I.tooltipDetails
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mob2, bul_name)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.location, bul_zone)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
            else
              FUL_I.name = bul_name
              local FUL_I_TD = {}
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.mob2, bul_name)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
              FUL_I.tooltipDetails = FUL_I_TD
            end

            REP.UpdateList[index] = FUL_I
            index = index + 1
          end
        end
      end

      -- quests (may have items)
      if (fg_sid.quests and (REP_Data.Global.ShowQuests or REP_Data.Global.ShowPvPQuests)) then
        local sum = 0
        local count = 0
        local fg_sid_x = fg_sid.quests

        for i = 0, fg_sid_x.count do
          local fg_sid_x_d = fg_sid_x.data[i]
          local showQuest = true

          if (not REP_Data.Global.ShowPvPQuests and fg_sid_x_d.isPvp) then
            showQuest = false
          end

          if (not REP_Data.Global.ShowQuests and not fg_sid_x_d.isPvp) then
            showQuest = false
          end

          if (fg_sid_x_d.profession) then
            local fg_sid_x_d_p = fg_sid_x_d.profession

            if ((fg_sid_x_d_p == REP.LIMIT_TYPE_Herb) and not REP.Herb) then
              -- if list of known professions does not contain Herbology
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Skin) and not REP.Skin) then
              -- if list of known professions does not contain Herbology
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Mine) and not REP.Mine) then
              -- if list of known professions does not contain Herbology
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Gather) and not (REP.Herb or REP.Skin or REP.Mine)) then
              -- no gathering profession
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Jewel) and not REP.Jewel) then
              -- if list of known professions does not contain jewelcrafting
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Cook) and not REP.Cook) then
              -- if list of known professions does not contain jewelcrafting
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Arch) and not REP.Arch) then
              -- if list of known professions does not contain jewelcrafting
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Fish) and not REP.Fish) then
              -- if list of known professions does not contain jewelcrafting
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Aid) and not REP.Aid) then
              -- if list of known professions does not contain jewelcrafting
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Blac) and not REP.Black) then
              -- if list of known professions does not contain BLACKsmith
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Tail) and not REP.Tailor) then
              -- if list of known professions does not contain tailor
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Leat) and not REP.Leath) then
              -- if list of known professions does not contain leather
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Ench) and not REP.Enchan) then
              -- if list of known professions does not contain enchanter
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Engi) and not REP.Engin) then
              -- if list of known professions does not contain BLACKsmith
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Incr) and not REP.Incrip) then
              -- if list of known professions does not contain leather
              showQuest = false
            elseif ((fg_sid_x_d_p == REP.LIMIT_TYPE_Alch) and not REP.Alche) then
              -- if list of known professions does not contain enchanter
              showQuest = false
            else
              -- unexpected limit -> ignore this and still show quest ggg
            end
          end

          if (showQuest) then
            if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then               
              local toDo = ceil(repToNext / fg_sid_x_d.rep)

              if (fg_sid_x_d.limit) then
                toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
              end

              REP.UpdateList[index] = {}
              local FUL_I = REP.UpdateList[index]
              FUL_I.manualSource = fg_sid_x_d.manualSource
              FUL_I.type = REP_TXT.questShort
              FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              local bul_name = REP:Quest_Names(fg_sid_x_d.name)
              FUL_I.name = bul_name
              FUL_I.originalName = FUL_I.name
              FUL_I.tooltipHead = REP_TXT.questHead

              if (fg_sid_x_d.repeatable) then
                FUL_I.times = math.ceil(toDo).."x"
                FUL_I.tooltipTip = REP_TXT.questTip
              else
                FUL_I.times = math.ceil(1).."x"
                FUL_I.tooltipTip = REP_TXT.questTipNonRepeatable
              end

              FUL_I.faction = faction
              FUL_I.canSuppress = true
              FUL_I.suppress = nil
              if (REP_Suppressed and REP_Suppressed[factionName] and REP_Suppressed[factionName][FUL_I.originalName]) then
                FUL_I.suppress = true
              end

              FUL_I.tooltipDetails = {}
              local FUL_I_TD = FUL_I.tooltipDetails
              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.quest2, FUL_I.name)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.toDo, FUL_I.times)

              if (not FUL_I.suppress) then
                if (fg_sid_x_d.repeatable) then
                  sum = sum + fg_sid_x_d.rep
                  count = count + 1
                end
              end

              if (fg_sid_x_d.items) then
                FUL_I.hasList = true
                FUL_I.listShown = false
                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.itemsRequired, " ")
                -- quest In log?
                FUL_I.lowlight = nil

                -- check if this quest is known
                local entries = REP:GetNumQuestLogEntries()

                for z = 1, entries do
                  local title, header, complete = REP:GetQuestLogEntry(z)

                  if (title and not header) then
                    if string.find(string.lower(bul_name), string.lower(title)) then
                      -- this quest matches
                      FUL_I.lowlight = true
                      FUL_I.name = FUL_I.name..REP.QUEST_ACTIVE_COLOUR.." ("..REP_TXT.active..")|r"
                    end
                  end
                end

                -- add items
                local itemIndex = index + 1
                local currentQuestTimesBag = -1
                local currentQuestTimesBagBank = -1

                for item in pairs(fg_sid_x_d.items) do
                  REP.UpdateList[itemIndex] = {}
                  local FUL_II = REP.UpdateList[itemIndex]
                  FUL_II.type = ""
                  FUL_II.times = math.ceil((fg_sid_x_d.items[item] * toDo)).."x"
                  FUL_II.rep = nil
                  FUL_II.index = itemIndex
                  FUL_II.belongsTo = index
                  FUL_II.hasList = nil
                  FUL_II.listShown = nil
                  FUL_II.isShown = FUL_I.listShown
                  FUL_II.name = REP:InitItemName(item).." ("..fg_sid_x_d.items[item].."x)"
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, fg_sid_x_d.items[item].."x", REP:InitItemName(item))
                  FUL_II, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, FUL_II, item)
                  REP.UpdateList[itemIndex] = FUL_II
                  itemIndex = itemIndex + 1
                end

                if (currentQuestTimesBag > 0) then
                  FUL_I.highlight = true
                  FUL_I.lowlight = nil
                  FUL_I.name = FUL_I.name..REP.BAG_COLOUR.." ["..currentQuestTimesBag.."x]|r"
                  FUL_I.currentTimesBag = currentQuestTimesBag
                  FUL_I.currentRepBag = currentQuestTimesBag * FUL_I.rep
                  REP.CurrentRepInBag = REP.CurrentRepInBag + FUL_I.currentRepBag
                  --FUL_I.name = FUL_I.originalName
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBag, " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBag))
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBag))
                else
                  FUL_I.currentTimesBag = nil
                  FUL_I.currentRepBag = nil
                end

                if (currentQuestTimesBagBank > 0) then
                  FUL_I.name = FUL_I.name..REP.BAG_BANK_COLOUR.." ["..currentQuestTimesBagBank.."x]|r"
                  FUL_I.currentTimesBagBank = currentQuestTimesBagBank
                  FUL_I.currentRepBagBank = currentQuestTimesBagBank * FUL_I.rep
                  FUL_I.highlight = true
                  FUL_I.name = FUL_I.originalName
                  FUL_I.lowlight = nil
                  REP.CurrentRepInBagBank = REP.CurrentRepInBagBank + FUL_I.currentRepBagBank
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBagBank, " ")
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBagBank))
                  FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBagBank))
                else
                  FUL_I.currentTimesBagBank = nil
                  FUL_I.currentRepBagBank = nil
                end

                if ((currentQuestTimesBag == 0) and (currentQuestTimesBagBank)) then
                  FUL_I.highlight = nil
                end

                index = itemIndex
              else
                -- no items to add
                FUL_I.hasList = false
                FUL_I.listShown = nil
                FUL_I.highlight = nil	-- will be Changed below if needed
                FUL_I.lowlight = nil

                -- check if this quest is known and/or completed
                local entries = REP:GetNumQuestLogEntries()

                for z = 1, entries do
                  local title, header, complete = REP:GetQuestLogEntry(z)

                  if (title) then
                    if string.find(string.lower(bul_name), string.lower(title)) then
                      -- this quest matches
                      if (complete) then
                        FUL_I.highlight = true
                        FUL_I.name = FUL_I.name..REP.QUEST_COLOUR.." ("..REP_TXT.complete..")|r"
                        FUL_I.currentTimesQuest = 1
                        FUL_I.currentRepQuest = FUL_I.rep
                        REP.CurrentRepInQuest = REP.CurrentRepInQuest + fg_sid_x_d.rep
                        FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                        FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.questCompleted, " ")
                        FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepQuest))
                      else
                        FUL_I.lowlight = true
                        FUL_I.name = FUL_I.name..REP.QUEST_ACTIVE_COLOUR.." ("..REP_TXT.active..")|r"
                      end
                    end
                  end
                end

                index = index + 1
              end

              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
            end
          end
        end

        if ((sum > 0) and (count > 1)) then
          -- add virtual quest to show summary of all quests:
          local toDo = ceil(repToNext / sum)
          REP.UpdateList[index] = {}
          local FUL_I = REP.UpdateList[index]
          FUL_I.type = REP_TXT.questShort
          FUL_I.times = math.ceil(toDo).."x"
          FUL_I.rep = string.format("%d", sum)
          FUL_I.index = index
          FUL_I.belongsTo = nil
          FUL_I.isShown = true
          FUL_I.name = string.format(REP_TXT.allOfTheAbove, count)
          FUL_I.tooltipHead = string.format(REP_TXT.questSummaryHead, count)
          FUL_I.tooltipTip = REP_TXT.questSummaryTip
          local FUL_I_TD = {}
          local x = 0
          FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
          FUL_I_TD[x], x  = REP:Update_Tooltip(x, REP_TXT.timesToDo, FUL_I.times)
          FUL_I_TD.count = x-1
          FUL_I.tooltipDetails = FUL_I_TD
          REP.UpdateList[index] = FUL_I
          index = index + 1
        end
      end

      -- items
      if (fg_sid.items and REP_Data.Global.ShowItems) then
        local fg_sid_x = fg_sid.items
        for i = 0, fg_sid_x.count do
          local fg_sid_x_d = fg_sid_x.data[i]
          if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
            local toDo = ceil(repToNext / fg_sid_x_d.rep)
            if (fg_sid_x_d.limit) then
              toDo = ceil((fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
            end

            if (fg_sid_x_d.items) then
              REP.UpdateList[index] = {}
              local FUL_I = REP.UpdateList[index]
              FUL_I.manualSource = fg_sid_x_d.manualSource
              FUL_I.type = REP_TXT.itemsShort
              FUL_I.times = math.ceil(toDo).."x"
              FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
              FUL_I.index = index
              FUL_I.belongsTo = nil
              FUL_I.isShown = true
              FUL_I.name = REP_TXT.itemsName
              FUL_I.hasList = true
              FUL_I.listShown = false
              FUL_I.tooltipHead = REP_TXT.itemsHead
              FUL_I.tooltipTip = REP_TXT.itemsTip
              FUL_I.tooltipDetails = {}
              local FUL_I_TD = FUL_I.tooltipDetails

              local x = 0
              FUL_I_TD[x], x = REP:Update_Tooltip(x, FUL_I.name, " ")
              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.itemsRequired, " ")

              -- add items
              local itemIndex = index + 1
              local currentQuestTimesBag = -1
              local currentQuestTimesBagBank = -1

              for item in pairs(fg_sid_x_d.items) do
                REP.UpdateList[itemIndex] = {}
                local FUL_II = REP.UpdateList[itemIndex]
                FUL_II.type = ""
                FUL_II.times = math.ceil((fg_sid_x_d.items[item] * toDo)).."x"
                FUL_II.rep = nil
                FUL_II.index = itemIndex
                FUL_II.belongsTo = index
                FUL_II.hasList = nil
                FUL_II.listShown = nil
                FUL_II.isShown = FUL_I.listShown
                local tempItemName = REP:InitItemName(item)
                FUL_II.name = tempItemName.." ("..fg_sid_x_d.items[item].."x)"
                FUL_I.name = tempItemName
                FUL_I_TD[x], x = REP:Update_Tooltip(x, fg_sid_x_d.items[item].."x", REP:InitItemName(item))
                FUL_II, currentQuestTimesBag, currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.items[item], currentQuestTimesBag, currentQuestTimesBagBank, FUL_II, item)

                if fg_sid_x_d.alternativeItems ~= nil then
                  for altItem in pairs(fg_sid_x_d.alternativeItems) do
                    local temp_FUL_II, temp_currentQuestTimesBag, temp_currentQuestTimesBagBank = REP:Quest_Items(fg_sid_x_d.alternativeItems[altItem], -1, -1, FUL_II, altItem)

                    if temp_FUL_II then
                      -- Do something
                    end

                    if temp_currentQuestTimesBagBank > 0 then
                      if currentQuestTimesBagBank < 0 then
                        currentQuestTimesBagBank = temp_currentQuestTimesBagBank
                      else
                        currentQuestTimesBagBank = currentQuestTimesBagBank + temp_currentQuestTimesBagBank
                      end
                    end

                    if temp_currentQuestTimesBag > 0 then
                      currentQuestTimesBag = currentQuestTimesBag + temp_currentQuestTimesBag
                    end
                  end
                end

                REP.UpdateList[itemIndex] = FUL_II
                itemIndex = itemIndex + 1
              end

              if (currentQuestTimesBag > 0) then
                FUL_I.highlight = true
                FUL_I.lowlight = nil
                FUL_I.name = FUL_I.name..REP.BAG_COLOUR.." ["..currentQuestTimesBag.."x]|r"
                FUL_I.currentTimesBag = currentQuestTimesBag
                FUL_I.currentRepBag = currentQuestTimesBag * FUL_I.rep
                REP.CurrentRepInBag = REP.CurrentRepInBag + FUL_I.currentRepBag
                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBag, " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBag))
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBag))
              end

              if (currentQuestTimesBagBank > 0) then
                FUL_I.highlight = true
                FUL_I.lowlight = nil
                FUL_I.name = FUL_I.name..REP.BAG_BANK_COLOUR.." ["..currentQuestTimesBagBank.."]|r"
                FUL_I.currentTimesBagBank = currentQuestTimesBagBank
                FUL_I.currentRepBagBank = currentQuestTimesBagBank * FUL_I.rep
                REP.CurrentRepInBagBank = REP.CurrentRepInBagBank + FUL_I.currentRepBagBank
                FUL_I_TD[x] = {}

                if (not REP.UpdateList[index].hasList) then return end	-- not a list Header entry

                FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.inBagBank, " ")
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.turnIns, string.format("%d", FUL_I.currentTimesBagBank))
                FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, string.format("%d", FUL_I.currentRepBagBank))
              end

              if ((currentQuestTimesBag == 0) and (currentQuestTimesBagBank > 0 == false)) then
                FUL_I.highlight = nil
              end

              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
              FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
              FUL_I_TD.count = x
              FUL_I.tooltipDetails = FUL_I_TD
              REP.UpdateList[index] = FUL_I
              index = itemIndex
            end
          end
        end
      end

      -- General
      if (fg_sid.general and REP_Data.Global.ShowGeneral) then
        local fg_sid_x = fg_sid.general
        for i = 0, fg_sid_x.count do
          local fg_sid_x_d = fg_sid_x.data[i]
          if (not fg_sid_x_d.limit or (normCurrent < fg_sid_x_d.limit)) then
            local toDo = string.format("%.2f", repToNext / fg_sid_x_d.rep)
            if (fg_sid_x_d.limit) then
              toDo = string.format("%.2f", (fg_sid_x_d.limit - normCurrent) / fg_sid_x_d.rep)
            end

            -- calculate Number of times to do differently for Guild cap
            REP.UpdateList[index] = {}
            local FUL_I = REP.UpdateList[index]
            FUL_I.manualSource = fg_sid_x_d.manualSource
            FUL_I.type = REP_TXT.generalShort
            FUL_I.times = math.ceil(toDo).."x"
            FUL_I.rep = string.format("%d", fg_sid_x_d.rep)
            FUL_I.index = index
            FUL_I.belongsTo = nil
            FUL_I.isShown = true
            FUL_I.hasList = false
            FUL_I.listShown = nil
            local bul_name = fg_sid_x_d.name
            FUL_I.name = bul_name

            if (fg_sid_x_d.head and fg_sid_x_d.head ~= "") then
              FUL_I.tooltipHead = fg_sid_x_d.head
            else
              FUL_I.tooltipHead = REP_TXT.generalHead
            end

            if (fg_sid_x_d.tip and fg_sid_x_d.tip ~= "") then
              FUL_I.tooltipTip = fg_sid_x_d.tip
            else
              FUL_I.tooltipTip = REP_TXT.generalTip
            end

            FUL_I.tooltipDetails = {}
            local FUL_I_TD = FUL_I.tooltipDetails
            local x = 0
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.general2, bul_name)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.reputation, FUL_I.rep)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, REP_TXT.timesToRun, FUL_I.times)
            FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
            if (fg_sid_x_d.tipList) then
              for tip in pairs(fg_sid_x_d.tipList) do
                FUL_I_TD[x], x = REP:Update_Tooltip(x, tip, fg_sid_x_d.tipList[tip])
              end

              FUL_I_TD[x], x = REP:Update_Tooltip(x, " ", " ")
            end

            FUL_I_TD[x] = REP:Update_Tooltip(x, REP_TXT.maxStanding, _G["FACTION_STANDING_LABEL"..fg_sid_x_d.maxStanding])
            FUL_I_TD.count = x
            local FUL_I_TD = FUL_I.tooltipDetails
            REP.UpdateList[index] = FUL_I
            index = index + 1
          end
        end
      end
    end
  end

  -- Setting "Expand lists by default": show the items of all entries.
  if REP_Data.Global.ExpandSourcesByDefault then
    for _, entry in pairs(REP.UpdateList) do
      if entry.belongsTo == nil then
        if entry.hasList then entry.listShown = true end
      else
        entry.isShown = true
      end
    end
  end

  REP_UpdateList_Update()
end

function REP:Quest_Items(itemsNeed, currentQuestTimesBag, currentQuestTimesBagBank, QuestItem, item)
  if not QuestItem.times then
    QuestItem = {}
    QuestItem.name = "James"
  end

  local itemCountIncludingBank, itemCountExcludingBank, currencyInfo

  if C_Item and C_Item.GetItemCount then
    itemCountIncludingBank = C_Item.GetItemCount(item, true)
    itemCountExcludingBank = C_Item.GetItemCount(item)
  elseif GetItemCount then
    itemCountIncludingBank = GetItemCount(item, true)
    itemCountExcludingBank = GetItemCount(item)
  end

  if (type(item) == "number") then
    if C_CurrencyInfo and type(C_CurrencyInfo.GetCurrencyInfo) == "function" then
      currencyInfo = C_CurrencyInfo.GetCurrencyInfo(item)
    elseif GetCurrencyInfo then
      currencyInfo = GetCurrencyInfo(item)
    end
  end

  local itemBag, itemTotal = 0, 0

  if (itemCountIncludingBank == 0 and not currencyInfo) then -- not enough of this item for quest -> set to 0
    currentQuestTimesBag = 0
  else
    if (itemCountIncludingBank == 0) then -- If GetItemCount is 0 then this is a currency and not a item
      if type(currencyInfo) == "table" then
        itemBag = currencyInfo.quantity
      else
        _, itemBag = currencyInfo
      end

      itemTotal = itemBag
    else
      itemBag = itemCountExcludingBank
      itemTotal = itemCountIncludingBank
    end

    ---- Weird bug in classic where it saw 0 as nil in some situations...
    if not itemTotal then itemTotal = 0 end
    if not itemBag then itemBag = 0 end
    
    local itemBank = itemTotal - itemBag

    if ((itemBag >= itemsNeed) and (itemsNeed > 0)) then
      QuestItem.currentTimesBag = floor(itemBag / itemsNeed)
      QuestItem.name = QuestItem.name..REP.BAG_COLOUR.." ["..itemBag.."x]|r"

      if (currentQuestTimesBag == -1) then
        -- first items for this quest --> take value
        currentQuestTimesBag = QuestItem.currentTimesBag
      else
        -- some items already Set
        if (QuestItem.currentTimesBag < currentQuestTimesBag) then
          -- fewer of this item than of others, reduce quest count
          currentQuestTimesBag = QuestItem.currentTimesBag
        end
      end
    else
      -- not enough of this item for quest -> set to 0
      currentQuestTimesBag = 0
      QuestItem.name = QuestItem.name.." ["..itemBag.."x]"
    end

    if itemBank > 0 then
      if ((itemTotal >= itemsNeed) and (itemsNeed > 0)) then
        QuestItem.name = QuestItem.name..REP.BAG_BANK_COLOUR.." ["..itemTotal.."x]|r"
        QuestItem.currentTimesBagBank = floor(itemBank / itemsNeed)

        if (currentQuestTimesBagBank == -1) then
          -- first items for this quest --> take value
          currentQuestTimesBagBank = QuestItem.currentTimesBagBank
        else
          -- some items already Set
          if (QuestItem.currentTimesBagBank < currentQuestTimesBagBank) then
            -- fewer of this item than of others, reduce quest count
            currentQuestTimesBagBank = QuestItem.currentTimesBagBank
          end
        end
      else
        -- not enough of this item for quest -> set to 0
        currentQuestTimesBagBank = 0
        QuestItem.name = QuestItem.name.." ["..itemBank.."x]"
      end
    else
    -- none of this carried In bank
    end
  end

  return QuestItem, currentQuestTimesBag, currentQuestTimesBagBank
end

function REP:GetUpdateListSize()
  -- sub function of	REP_UpdateList_Update()
  local count = 0
  local highest = 0
  for i in pairs(REP.UpdateList) do
    if (REP.UpdateList[i].isShown) then
      count = count + 1
      if (i > highest) then
        highest = i
      end
    end
  end

  return count, highest
end

function REP:ShowUpdateEntry(index, show)
  if (not REP.UpdateList[index]) then return end		-- invalid index
  if (not REP.UpdateList[index].hasList) then return end	-- not a list Header entry
  if (type(show) ~= "boolean") then return end -- wrong data type

  REP.UpdateList[index].listShown = show
  for i in pairs(REP.UpdateList) do
    if (REP.UpdateList[i].belongsTo == index) then
      REP.UpdateList[i].isShown = show
    end
  end

  REP_UpdateList_Update()
end

function REP_ShowUpdateEntries(show)
  if (type(show) ~= "boolean") then return end -- wrong data type

  for i in pairs(REP.UpdateList) do
    if (REP.UpdateList[i].belongsTo == nil) then
      -- always show parent entries, show or Hide their children
      REP.UpdateList[i].isShown = true
      REP.UpdateList[i].listShown = show
    else
      -- show or Hide child entries
      REP.UpdateList[i].isShown = show
    end
  end

  REP_UpdateList_Update()
  REP:PlayCheckBoxSound(show)
end

function REP_ToggleAllTypesToShow(toggled)
  REP_Data.Global.ShowQuests = toggled
  REP_Data.Global.ShowPvPQuests = toggled
  REP_Data.Global.ShowMobs = toggled
  REP_Data.Global.ShowInstances = toggled
  REP_Data.Global.ShowItems = toggled
  REP_Data.Global.ShowGeneral = toggled

  REP_BuildUpdateList()
  REP_UpdateList_Update()
  REP:PlayCheckBoxSound(toggled)
  REP:FillReputationDetailFrameWithData()
end

function REP_ShowLineToolTip(self)
  if not self then return end

  if (self.tooltipHead) then
    GameTooltip_SetDefaultAnchor(GameTooltip, self)
    GameTooltip:SetText(self.tooltipHead, 1, 1, 0.5, 1)
    if (self.tooltipTip) then
      GameTooltip:AddLine(self.tooltipTip, 1, 1, 1, 1)
    end

    if (self.tooltipDetails and type(self.tooltipDetails) == "table") then
      GameTooltip:AddLine(" ", 1, 1, 1, 1)
      for i = 0, self.tooltipDetails.count do
        if (self.tooltipDetails[i].l and self.tooltipDetails[i].r) then
          if (self.tooltipDetails[i].r == " " or self.tooltipDetails[i].r=="") then
            GameTooltip:AddDoubleLine(self.tooltipDetails[i].l, self.tooltipDetails[i].r, 1, 1, 0, 1, 1, 1)
          else
            GameTooltip:AddDoubleLine(self.tooltipDetails[i].l, self.tooltipDetails[i].r, 1, 1, 0.5, 1, 1, 1)
          end
        end
      end
    end

    GameTooltip:Show()
  end
end

function REP_ShowHelpToolTip(self, element)
  if not element then return end

  local name = ""
  -- cut off leading frame name
  --if (string.find(element, GLDG_GUI)) then
  --	name = string.sub(element, string.len(GLDG_GUI)+1)
  --elseif (string.find(element, GLDG_COLOUR)) then
  --	name = string.sub(element, string.len(GLDG_COLOUR)+1)
  --elseif (string.find(element, GLDG_LIST)) then
  name = element
  --end

  -- cut off trailing Number In case of line and collect
  --local s,e = string.find(name, "Line")
  --if (s and e) then
  --	name = string.sub(name, 0, e)
  --end
  --s,e = string.find(name, "Collect")
  --if (s and e) then
  --	name = string.sub(name, 0, e)
  --end

  -- cut off colour button/texture
  --if (string.find(name, "Colour") == 1) then
  --	-- ["ColourGuildNewButton"] = true,
  --	s,e = string.find(name, "Button")
  --	if (s and e) then
  --		name = string.sub(name, 0, s-1)
  --	end
  --	-- ["ColourGuildNewColour"] = true,
  --	s,e = string.find(name, "Colour", 2)	-- start at 2 to skip the initial Colour
  --	if (s and e) then
  --		name = string.sub(name, 0, s-1)
  --	end
  --end

  local tip = ""
  local head = ""
  if (REP_TXT.elements and
    REP_TXT.elements.name and
    REP_TXT.elements.tip and
    REP_TXT.elements.name[name] and
    REP_TXT.elements.tip[name]) then
    tip = REP_TXT.elements.tip[name]
    head = REP_TXT.elements.name[name]

    if (REP_Data.Global.needsTip and REP_Data.Global.needsTip[name]) then
      REP_Data.Global.needsTip[name] = nil
    end
  else
    if (not REP_Data.Global.needsTip) then
      REP_Data.Global.needsTip = {}
    end

    REP_Data.Global.needsTip[name] = true
  end

  --GameTooltip_SetDefaultAnchor(GameTooltip, self)
  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")

  if (head ~= "") then
    GameTooltip:SetText(head, 1, 1, 0.5, 1.0, 1)
    GameTooltip:AddLine(tip, 1, 1, 1, 1.0, 1)
    -- GameTooltip:AddLine(name, 1, 0, 0, 1.0, 1)
    -- else
    -- GameTooltip:SetText(element, 1, 1, 0.5, 1.0, 1)
    -- GameTooltip:AddLine(name, 1, 1, 1, 1.0, 1)
  end

  GameTooltip:Show()
end
