----------------------------------------------------------
-- Reputation Guide | Default reputation list (old reputation UI) --
-- Only loaded by the clients without the modern (ScrollBox) reputation UI.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

-----------------------------------
-- 12 REP_RepFrame_Up Start --
-----------------------------------
function REP_ReputationFrame_Update()
  local numFactionsDisplayed = NUM_FACTIONS_DISPLAYED or 14

  if (REP.OnLoadingScreen == false) then
    local numFactions
    if REP:GetSortByStanding() then
      REP:StandingSort()
      numFactions = REP.OBS_numFactions
    else
      numFactions = REP.Orig_GetNumFactions()
    end

    -- Update scroll frame
    if (not FauxScrollFrame_Update(ReputationListScrollFrame, numFactions, numFactionsDisplayed, REPUTATIONFRAME_FACTIONHEIGHT)) then
      ReputationListScrollFrameScrollBar:SetValue(0)
    end

    if ReputationFrameStandingLabel then
      if (REP_Data.Global.ShowMissing) then
        if string.find(REP.Orig_StandingText, REP_TXT.missing) then
          ReputationFrameStandingLabel:SetText(REP.Orig_StandingText)
        else
          ReputationFrameStandingLabel:SetText(REP.Orig_StandingText.." "..REP_TXT.missing)
        end
      else
        if string.find(REP.Orig_StandingText, REP_TXT.missing) then
          ReputationFrameStandingLabel:SetText(string.gsub(REP.Orig_StandingText, REP_TXT.missing, ""))
        else
          ReputationFrameStandingLabel:SetText(REP.Orig_StandingText)
        end
      end
    end

    local guid = UnitGUID("player")
    local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)

    if REP.AfterWoD and ReputationFrame.paragonFramesPool then
      ReputationFrame.paragonFramesPool:ReleaseAll()
    end

    for i = 1, numFactionsDisplayed, 1 do
      local factionBar
      local factionStanding
      local factionHeader
      local factionCheck
      local factionTitle
      local factionButton
      local factionBackground
      local factionBarPreview
      local factionAtWarIndicator
      local factionRightBarTexture
      local factionIndex

      factionIndex = factionOffset + i
      local name, factionID, inactive
      local factionData = REP:GetFactionDataByIndex(factionIndex)

      if factionData then
        name = factionData.name
        factionID = factionData.factionID
      end

      inactive = REP:IsFactionInactiveByIndex(factionIndex)

      if (guid) then
        REP:InitOrCheckSavedVariables()
        if (inactive and not REP_Data.ProfileKeys[guid].inactiveFactions[factionID]) then
          REP_Data.ProfileKeys[guid].inactiveFactions[factionID] = true
        end
      end

      local factionRow = _G["ReputationBar"..i]
      factionHeader = _G["ReputationHeader"..i]
      factionCheck = _G["ReputationBar"..i.."Check"]
      factionTitle = _G["ReputationBar"..i.."FactionName"]
      factionButton = _G["ReputationBar"..i.."ExpandOrCollapseButton"]
      factionBackground = _G["ReputationBar"..i.."Background"]
      factionBarPreview = _G["REP_StatusBar"..i]
      factionAtWarIndicator = _G["ReputationBar"..i.."AtWarCheck"]
      factionRightBarTexture = _G["ReputationBar"..i.."ReputationBarRight"]

      if REP.AfterTBC then
        factionBar = _G["ReputationBar"..i.."ReputationBar"]
        factionStanding = _G["ReputationBar"..i.."ReputationBarFactionStanding"]
      else
        factionBar = _G["ReputationBar"..i]
        factionStanding = _G["ReputationBar"..i.."FactionStanding"]
      end

      if factionRow and not factionRow._repTooltipHooked then
        factionRow:HookScript("OnEnter", function(self)
          local factionData = REP:GetFactionDataByIndex(self.index)

          if factionData and factionTitle and not string.find(factionTitle:GetText(), "->", 1, true) then
            REP:ShowReputationTooltip(self, factionData.factionID)
          end
        end)
        factionRow:HookScript("OnLeave", function() GameTooltip:Hide() end)
        factionRow._repTooltipHooked = true
      end

      if (factionIndex <= numFactions) then
        if REP:GetSortByStanding() then
          if REP.AfterTBC then
            REP:SortByStandingWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
          else
            REP:SortByStandingWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
          end
        else
          if REP.AfterTBC then
            REP:OriginalRepOrderWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
          else
            REP:OriginalRepOrderWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
          end
        end
      else
        if factionRow then factionRow:Hide() end
        if factionHeader then factionHeader:Hide() end
      end
    end
  end
end

function REP_ExpandFactionHeader(index) -- replaces ExpandFactionHeader
  if not index then return end
  
  if REP:GetSortByStanding() then
    if not REP.Entries then return end
    if not REP.Entries[index] then return end
    REP.Collapsed[REP.Entries[index].i] = nil
    ReputationFrame_Update()
  else
    REP.Orig_ExpandFactionHeader(index)
  end
end

function REP_ReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)
  -- rowType is a binary table of type isHeader, isChild

  do
    local factionRowName = factionRow:GetName()
    local factionBar = _G[factionRowName.."ReputationBar"]
    local factionTitle = _G[factionRowName.."FactionName"]
    local factionStanding = _G[factionRowName.."ReputationBarFactionStanding"]
    local factionBackground = _G[factionRowName.."Background"]
    local factionLeftTexture = _G[factionRowName.."ReputationBarLeftTexture"]
    local factionRightTexture = _G[factionRowName.."ReputationBarRightTexture"]
    local factionButton

    if not REP.AfterTBC then
      factionButton = _G[factionRowName.."ReputationHeader"]
    else
      factionButton = _G[factionRowName.."ExpandOrCollapseButton"]
    end

    if (factionLeftTexture) then factionLeftTexture:SetWidth(62) end
    if (factionRightTexture) then factionRightTexture:SetWidth(42) end
    if (factionBar) then factionBar:SetPoint("RIGHT", factionRow, "RIGHT", 0, 0) end

    if (isHeader) then
      -- show indent on child rows (isChild)
      if (false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 35, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 23, 0)
      end

      if (factionButton) then
        factionButton:SetPoint("LEFT", factionRow, "LEFT", 3, 0)
        factionButton:Show()
      end

      factionTitle:SetWidth(145)
      factionTitle:SetPoint("LEFT",factionButton,"RIGHT",10, 0)
      factionTitle:SetFontObject(GameFontNormalLeft)


      if (factionBackground) then factionBackground:Hide() end

      if (factionLeftTexture) then
        factionLeftTexture:SetHeight(15)
        factionLeftTexture:SetWidth(60)
        factionLeftTexture:SetTexCoord(0.765625, 1.0, 0.046875, 0.28125)
      end

      if (factionRightTexture) then
        factionRightTexture:SetHeight(15)
        factionRightTexture:SetWidth(39)
        factionRightTexture:SetTexCoord(0.0, 0.15234375, 0.390625, 0.625)
      end

      if (factionBar) then factionBar:SetWidth(99) end
    else
      -- show indent on child rows (no way of saying when it's a child row of an other child row)
      if(false) then
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 41, 0)
      else
        factionRow:SetPoint("LEFT", ReputationFrame, "LEFT", 29, 0)
      end

      factionTitle:SetWidth(160)
      factionButton:Hide()
      factionTitle:SetPoint("LEFT", factionRow, "LEFT", 10, 0)
      factionTitle:SetFontObject(GameFontHighlightSmall)
      factionBackground:Show()
      factionLeftTexture:SetHeight(21)
      factionRightTexture:SetHeight(21)
      factionLeftTexture:SetTexCoord(0.7578125, 1.0, 0.0, 0.328125)
      factionRightTexture:SetTexCoord(0.0, 0.1640625, 0.34375, 0.671875)
      factionBar:SetWidth(101)
    end

    if ((hasRep) or (not isHeader)) then
      factionStanding:Show()
      factionBar:Show()
      factionBar:GetParent().hasRep = true
    else
      if (factionStanding) then factionStanding:Hide() end
      if (factionBar) then
        factionBar:Hide()
        factionBar:GetParent().hasRep = false
      end
    end
  end
end

function REP_CollapseFactionHeader(index) -- replaces CollapseFactionHeader
  if not index then return end

  if REP:GetSortByStanding() then
    if not REP.Entries then return end
    if not REP.Entries[index] then return end
    REP.Collapsed[REP.Entries[index].i] = true
    ReputationFrame_Update()
  else
    REP.Orig_CollapseFactionHeader(index)
  end
end

function REP_ReputationBar_OnClick(self)
  -- redo from the main Reputation file
  if ((ReputationDetailFrame:IsVisible() or (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible())) and (REP.Orig_GetSelectedFaction() == self.index)) then
    REP:PlayCheckBoxSound(false)
    REP.Orig_ReputationDetailFrame:Hide()
  else
    if (self.hasRep and REP.Orig_ReputationDetailFrame) then
      SetSelectedFaction(self.index)

      REP:PlayCheckBoxSound(true)
      REP.Orig_ReputationDetailFrame:Show()
      REP:FillReputationDetailFrameWithData()

      if (REP_Data.Global.ExtendDetails) then
        REP_BuildUpdateList()
        REP_UpdateList_Update()
      end

      ReputationFrame_Update()
    end
  end
end

function REP:StandingSort()
  local standings = {}
  local guid = UnitGUID("player")

  for i = 1, REP.Orig_GetNumFactions() do
    local reputationInfo = REP:GetFactionDataByIndex(i)

    if not reputationInfo then return end

    local name = reputationInfo.name
    local description = reputationInfo.description
    local standingID = reputationInfo.reaction
    local barMax = reputationInfo.nextReactionThreshold
    local barValue = reputationInfo.currentStanding
    local isHeader = reputationInfo.isHeader
    local hasRep = reputationInfo.isHeaderWithRep
    local isWatched = reputationInfo.isWatched
    local isChild = reputationInfo.isChild
    local factionID = reputationInfo.factionID
    local hasBonusRepGain = reputationInfo.hasBonusRepGain
    
    local friendReputationInfo = REP:GetFriendFactionDataByID(factionID)
    local isFrend = (friendReputationInfo and friendReputationInfo.isFriend) or false

    if isFrend then
      standingID = standingID + 2
    end

    REP:InitOrCheckSavedVariables()

    if (guid and not REP_Data.ProfileKeys[guid].inactiveFactions[factionID]) then
      if (REP.AfterWoD and REP_Data.Global.ShowParagonBar and REP:IsAtParagon(factionID, standingID)) then
        local currentValue, threshold, _, _ = REP.Orig_GetFactionParagonInfo(factionID)
        barMax, barValue, standingID = threshold, mod(currentValue, threshold), 9
      end

      if (not isHeader or hasRep) then
        if not standings[standingID] then
          standings[standingID] = {}
        end

        local size = REP:TableSize(standings[standingID])
        local entry = {}
        local inserted = false
        entry.missing = barMax - barValue
        entry.i = i

        if (size) then
          for j = 1, size do
            if (not inserted) then
              if (standings[standingID][j].missing > entry.missing) then
                table.insert(standings[standingID], j, entry)
                inserted = true
              end
            end
          end

          if (not inserted) then
            table.insert(standings[standingID], entry)
          end
        else
          table.insert(standings[standingID], entry)
        end
      end
    end
  end

  -- find Number of elements to display
  local numFactions = 0
  REP.Entries = {}

  if (not REP.Collapsed) then
    REP.Collapsed = {}
  end

  for i = 9, 1, -1 do
    if REP:TableSize(standings[i]) then
      if (standings[i]) then
        numFactions = numFactions + 1 -- count standing as header
        REP.Entries[numFactions] = {}
        REP.Entries[numFactions].header = true
        REP.Entries[numFactions].i = i	-- this is the standingID
        REP.Entries[numFactions].size = REP:TableSize(standings[i]) -- this is the number of factions with this standing

        if (not REP.Collapsed[i]) then
          for j in pairs(standings[i]) do
            numFactions = numFactions + 1 -- count each faction in the current standing
            REP.Entries[numFactions] = {}
            REP.Entries[numFactions].header = false
            REP.Entries[numFactions].i = standings[i][j].i -- this is the index into the faction table
            REP.Entries[numFactions].size = 0
          end
        end
      end
    end
  end

  REP.OBS_numFactions = numFactions
end

function REP_ReputationDetailFrame_IsShown(flag, flag2, i)
  local name, description, atWarWith, canToggleAtWar, isWatched

  local reputationInfo = REP:GetFactionDataByIndex(REP.Orig_GetSelectedFaction())
  name = reputationInfo.name
  description = reputationInfo.description
  atWarWith = reputationInfo.atWarWith
  canToggleAtWar = reputationInfo.canToggleAtWar
  isWatched = reputationInfo.isWatched

  ReputationDetailFactionName:SetText(name)
  ReputationDetailFactionDescription:SetText(description)

  if (atWarWith) then
    REP.Orig_DetailAtWarCheckBox:SetChecked(true)
  else
    REP.Orig_DetailAtWarCheckBox:SetChecked(false)
  end

  if flag then
    REP.Orig_DetailAtWarCheckBox:Enable()
    REP.Orig_DetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
  else
    REP.Orig_DetailAtWarCheckBox:Disable()
    REP.Orig_DetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
  end  

  if flag2 == 2 then
    if (not isHeader) then
      REP.Orig_DetailInactiveCheckBox:Enable()
      REP.Orig_DetailInactiveCheckBoxText:SetTextColor(REP.Orig_DetailInactiveCheckBoxText:GetFontObject():GetTextColor())
    else
      REP.Orig_DetailInactiveCheckBox:Disable()
      REP.Orig_DetailInactiveCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
    end

    if i then
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
    end
  end

  if (REP:IsFactionInactiveByIndex(REP.Orig_GetSelectedFaction())) then
    REP.Orig_DetailInactiveCheckBox:SetChecked(true)
  else
    REP.Orig_DetailInactiveCheckBox:SetChecked(false)
  end

  if (isWatched) then
    REP.Orig_DetailMainScreenCheckBox:SetChecked(true)
  else
    REP.Orig_DetailMainScreenCheckBox:SetChecked(false)
  end
end

--------------------------
-- 21 rep Main window
--------------------------
function REP:SortByStandingWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
  local OBS_fi = REP.Entries[factionIndex]
  local OBS_fi_i = OBS_fi.i

  if (OBS_fi.header) then
    REP_ReputationFrame_SetRowType(factionRow, isChild, OBS_fi.header, hasRep)

    -- display the standingID as Header
    if (OBS_fi_i == 9) then
      factionTitle:SetText("Paragon".." ("..tostring(OBS_fi.size)..")")
    elseif (OBS_fi_i == 8) then
      factionTitle:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." ("..tostring(OBS_fi.size)..")")
    else
      factionTitle:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." -> "..GetText("FACTION_STANDING_LABEL"..OBS_fi_i + 1, gender).." ("..tostring(OBS_fi.size)..")")
    end

    if (REP.Collapsed[OBS_fi_i]) then
      factionButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionRow.index = factionIndex
    factionRow.isCollapsed = REP.Collapsed[OBS_fi_i]
  else
    -- get the info for this Faction
    local isParagon
    local isCapped
    local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = REP.Orig_GetFactionDataByIndex(OBS_fi_i)
    
    local friendReputationInfo = REP_Friend_Detail(factionID, standingID, factionRow)
    local colorIndex = friendReputationInfo.colorIndex
    local isCappedFriendship = friendReputationInfo.isCappedFriendship
    local factionStandingtext = friendReputationInfo.factionStandingtext
    local isFriend = friendReputationInfo.isFriend

    -- Normalize Values
    local origBarValue = barValue

    if (standingID == MAX_REPUTATION_REACTION) then
      isCapped = true
    end

    if(REP.AfterCata and (isCappedFriendship or standingID == 8)) then
      -- If exalted show a full green bar
      barMin, barMax, barValue = 0, 1, 1
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if REP.AfterWoD then
      if (factionID and REP:IsAtParagon(factionID, standingID)) then
        isParagon = true
  
        local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()
        local currentValue, threshold, rewardQuestID, hasRewardPending = REP.Orig_GetFactionParagonInfo(factionID)
  
        origBarValue = mod(currentValue, threshold)
        C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
  
        paragonFrame.factionID = factionID
        paragonFrame:SetPoint("RIGHT", factionRow, 11, 0)
        paragonFrame.Glow:SetShown(hasRewardPending)
        paragonFrame.Check:SetShown(hasRewardPending)
        paragonFrame:Show()
  
        colorIndex = 9
  
        -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
        if REP_Data.Global.ShowParagonBar then
          local currentValue, threshold, rewardQuestID, hasRewardPending = REP.Orig_GetFactionParagonInfo(factionID)
          barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
        end
      end
    end

    if(isParagon and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
      factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, barValue, barMax)..FONT_COLOR_CODE_CLOSE
    elseif(isCapped or isCappedFriendship) then
      factionRow.rolloverText = nil
    elseif(REP_Data.Global.ShowMissing ~= true) then
      factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(tostring(REPUTATION_PROGRESS_FORMAT), barValue, barMax)..FONT_COLOR_CODE_CLOSE
    else
      factionRow.rolloverText = nil
    end

    local toExalted = 0
    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    local toBFF = 0
    if (isCappedFriendship ~= true and isFriend) then
      toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
    end

    factionRow.index = OBS_fi_i

    if (REP_Data.Global.ShowMissing) then
      if ((barMax - barValue) ~= 0 and isParagon and REP_Data.Global.ShowParagonBar) then
        factionRow.standingText = tostring(REP_TXT.STAND_LV[9]).." ("..barMax - barValue..")"
      elseif ((barMax - barValue) ~= 0) then
        if(factionStandingtext) then
          factionRow.standingText = factionStandingtext.." ("..barMax - barValue..")"
        else
          factionRow.standingText = "("..barMax - barValue..")"
        end
      else
        factionRow.standingText = factionStandingtext
      end
    else
      if(isParagon and REP_Data.Global.ShowParagonBar) then
        factionRow.standingText = tostring(REP_TXT.STAND_LV[9])
      else
        factionRow.standingText = factionStandingtext
      end
    end

    factionTitle:SetText(name)
    factionStanding:SetText(factionRow.standingText)

    if (isCappedFriendship) then
      factionRow.tooltip = nil
    else
      factionRow.tooltip = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    end

    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)

    local color
    if colorIndex then
      color = REP.FACTION_BAR_COLORS[colorIndex]
    else
      color = REP.FACTION_BAR_COLORS[standingID]
    end

    factionBar:SetStatusBarColor(color.r, color.g, color.b)

    if(REP.AfterMoP) then
      factionBar.BonusIcon:SetShown(hasBonusRepGain)
    end

    local previewValue = 0
    if (REP_Data.Global.ShowPreviewRep) then
      previewValue = REP:GetReadyReputation(OBS_fi_i)
    end

    if ((previewValue > 0) and not ((standingID == 8) and (barMax - barValue == 1))) then
      factionBarPreview:Show()
      factionBarPreview:SetMinMaxValues(0, barMax)
      previewValue = previewValue + barValue

      if (previewValue > barMax) then previewValue = barMax end

      factionBarPreview:SetValue(previewValue)
      factionBarPreview:SetID(factionIndex)
      factionBarPreview:SetStatusBarColor(0.8, 0.8, 0.8, 0.5)
    else
      if factionBarPreview then
        factionBarPreview:Hide()
      end
    end

    REP_ReputationFrame_SetRowType(factionRow, isChild, OBS_fi.header, hasRep)
    factionRow:Show()

    -- Update details if this is the selected Faction
    if (atWarWith) then
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Show()
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Hide()
      _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Hide()
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    if (OBS_fi_i == REP.Orig_GetSelectedFaction()) then
      if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
        local flag = canToggleAtWar and 1 or nil
        REP_ReputationDetailFrame_IsShown(flag, 1)

        REP:FillReputationDetailFrameWithData()

        _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
        _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
      end
    else
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Hide()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Hide()
    end
  end
end

----------------------------------------------
-- REP:OriginalRepOrderWithoutFactionHeader
----------------------------------------------
function REP:OriginalRepOrderWithoutFactionHeader(i, factionIndex, factionRow, factionBar, factionBarPreview, factionTitle, factionButton, factionStanding, factionAtWarIndicator, factionBackground)
  -- get the info for this Faction
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, isAccountWide
  local isParagon

  name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain = REP.Orig_GetFactionDataByIndex(factionIndex)

  factionTitle:SetText(name)

  if (isCollapsed) then
    factionButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
  else
    factionButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
  end

  factionRow.index = factionIndex
  factionRow.isCollapsed = isCollapsed

  local friendReputationInfo = REP_Friend_Detail(factionID, standingID, factionRow)
  local colorIndex = friendReputationInfo.colorIndex
  local isCappedFriendship = friendReputationInfo.isCappedFriendship
  local factionStandingtext = friendReputationInfo.factionStandingtext
  local isFriend = friendReputationInfo.isFriend

  local origBarValue = barValue

  if REP.AfterWoD then
    if (factionID and REP.Orig_IsFactionParagon(factionID)) then
      isParagon = true

      local currentValue, threshold, rewardQuestID, hasRewardPending = REP.Orig_GetFactionParagonInfo(factionID)
      local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()

      paragonFrame.factionID = factionID
      paragonFrame:SetPoint("RIGHT", factionRow, 11, 0)

      origBarValue = mod(currentValue, threshold)
      C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
      paragonFrame.Glow:SetShown(hasRewardPending)
      paragonFrame.Check:SetShown(hasRewardPending)
      paragonFrame:Show()

      colorIndex = 9
    end
  end

  local isCapped
  if (standingID == MAX_REPUTATION_REACTION) then
    isCapped = true
  end

  if(REP.AfterCata and (isCappedFriendship or standingID == 8)) then
    -- If exalted show a full green bar
    barMin, barMax, barValue = 0, 1, 1
  end

  -- Set reputation bar to paragon values if user option is activated and faction is at paragon rep
  if(isParagon and REP_Data.Global.ShowParagonBar) then
    local currentValue, threshold, rewardQuestID, hasRewardPending = REP.Orig_GetFactionParagonInfo(factionID)
    barMin, barMax, barValue = 0, threshold, mod(currentValue, threshold)
  end

  -- Normalize Values
  barMax = barMax - barMin
  barValue = barValue - barMin
  barMin = 0

  if(isParagon and REP_Data.Global.ShowParagonBar and REP_Data.Global.ShowMissing ~= true) then
    factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, barValue, barMax)..FONT_COLOR_CODE_CLOSE
  elseif(isCapped or isCappedFriendship) then
    factionRow.rolloverText = nil
  elseif(REP_Data.Global.ShowMissing ~= true) then
    factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(tostring(REPUTATION_PROGRESS_FORMAT), barValue, barMax)..FONT_COLOR_CODE_CLOSE
  else
    factionRow.rolloverText = nil
  end

  local toExalted = 0
  if (standingID < 8) then
    toExalted = REP.ToExalted[standingID] + barMax - barValue
  end

  local toBFF = 0
  if (isCappedFriendship ~= true and isFriend) then
    toBFF = REP_GetFriendFactionRemaining(factionID, factionStandingtext, barMax, barValue)
  end

  if (REP_Data.Global.ShowMissing) then
    if ((barMax - barValue) ~= 0 and isParagon and REP_Data.Global.ShowParagonBar) then
      factionRow.standingText = "Paragon".." ("..barMax - barValue..")"
    elseif ((barMax - barValue) ~= 0) then
      if factionStandingtext then
        factionRow.standingText = factionStandingtext.." ("..barMax - barValue..")"
      else
       factionRow.standingText = "("..barMax - barValue..")"
      end
    else
      factionRow.standingText = factionStandingtext
    end
  else
    if(isParagon and REP_Data.Global.ShowParagonBar) then
      factionRow.standingText = "Paragon"
    else
      factionRow.standingText = factionStandingtext
    end
  end

  factionStanding:SetText(factionRow.standingText)

  if (isCappedFriendship) then
    factionRow.tooltip = nil
  else
    factionRow.tooltip = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
  end

  REP_ReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)
  factionRow:Show()

  factionBar:SetMinMaxValues(0, barMax)
  factionBar:SetValue(barValue)

  local color
  if colorIndex then
    color = REP.FACTION_BAR_COLORS[colorIndex]
  else
    color = REP.FACTION_BAR_COLORS[standingID]
  end

  factionBar:SetStatusBarColor(color.r, color.g, color.b)

  if(REP.AfterMoP) then
    factionBar.BonusIcon:SetShown(hasBonusRepGain)
  end

  local previewValue = 0
  if (REP_Data.Global.ShowPreviewRep) then
    previewValue = REP:GetReadyReputation(factionIndex)
  end

  if ((previewValue > 0) and not ((standingID == 8) and (barMax - barValue == 1))) then
    factionBarPreview:Show()
    factionBarPreview:SetMinMaxValues(0, barMax)
    previewValue = previewValue + barValue

    if (previewValue > barMax) then previewValue = barMax end

    factionBarPreview:SetValue(previewValue)
    factionBarPreview:SetID(factionIndex)
    factionBarPreview:SetStatusBarColor(0.8, 0.8, 0.8, 0.5)
  else
    -- factionBarPreview:Hide()
  end

  -- Update details if this is the selected Faction
  if (atWarWith) then
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Show()
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Show()
    if factionAtWarIndicator then
      factionAtWarIndicator:Show()
    end
  else
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Hide()
    _G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Hide()
    if factionAtWarIndicator then
      factionAtWarIndicator:Hide()
    end
  end

  if (factionIndex == REP.Orig_GetSelectedFaction()) then
    if (ReputationDetailFrame:IsShown()) then
      if (canToggleAtWar and (not isHeader)) then local flag = 1 end
      REP_ReputationDetailFrame_IsShown(flag, 2)
    end

    if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
      REP:FillReputationDetailFrameWithData()
      _G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
      _G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
    end
  else
    _G["ReputationBar"..i.."ReputationBarHighlight1"]:Hide()
    _G["ReputationBar"..i.."ReputationBarHighlight2"]:Hide()
  end
end
----------------------------------------------
-- REP:SortByStandingWithFactionHeader
----------------------------------------------
function REP:SortByStandingWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
  local OBS_fi = REP.Entries[factionIndex]
  local OBS_fi_i = OBS_fi.i

  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = REP.Orig_GetFactionDataByIndex(OBS_fi_i)
  local origBarValue = barValue
  local toExalted

  if (OBS_fi.header) then
    if (OBS_fi_i == 8) then
      factionHeader.Text:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." ("..tostring(OBS_fi.size)..")")
    else
      factionHeader.Text:SetText(GetText("FACTION_STANDING_LABEL"..OBS_fi_i, gender).." -> "..GetText("FACTION_STANDING_LABEL"..OBS_fi_i + 1, gender).." ("..tostring(OBS_fi.size)..")")
    end

    if (REP.Collapsed[OBS_fi_i]) then
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionHeader.index = factionIndex
    factionHeader.isCollapsed = REP.Collapsed[OBS_fi_i]

    factionBar:Hide()
    factionHeader:Show()
    factionCheck:Hide()
  else
    factionStandingText = GetText("FACTION_STANDING_LABEL"..standingID, gender)
    factionStanding:SetText(factionStandingText)
    factionTitle:SetText(name)

    if (atWarWith) then
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    factionBar.index = OBS_fi_i
    factionBar.standingText = factionStandingText
    factionBar.tooltip  = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)
    color = REP.FACTION_BAR_COLORS[standingID]
    factionBar:SetStatusBarColor(color.r, color.g, color.b)
    factionBar:SetID(factionIndex)
    factionBar:Show()
    factionHeader:Hide()

    if (REP_Data.Global.ShowMissing) then
      if (barMax - barValue ~= 0) then
        factionStanding:SetText(factionStandingText .. " ("..barMax - barValue..")")
        factionBar.standingText = factionStandingText .. " ("..barMax - barValue..")"
        factionBar.tooltip = nil
      end
    end

    if (hasRep) or (not isHeader) then
      factionBar.hasRep = true
    else
      factionBar.hasRep = false
    end

    if (isWatched) then
      factionCheck:Show()
      factionTitle:SetWidth(100)
      factionCheck:SetPoint("LEFT", factionTitle, "LEFT", factionTitle:GetStringWidth(), 0)
    else
      factionCheck:Hide()
      factionTitle:SetWidth(110)
    end

    if (OBS_fi_i == REP.Orig_GetSelectedFaction()) then
      if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
        local flag = canToggleAtWar and 1 or nil
        REP_ReputationDetailFrame_IsShown(flag, 1)

        REP:FillReputationDetailFrameWithData()

        _G["ReputationBar"..i.."Highlight1"]:Show()
        _G["ReputationBar"..i.."Highlight2"]:Show()
      end
    else
      _G["ReputationBar"..i.."Highlight1"]:Hide()
      _G["ReputationBar"..i.."Highlight2"]:Hide()
    end
  end
end

----------------------------------------------
-- REP:OriginalRepOrderWithFactionHeader
----------------------------------------------
function REP:OriginalRepOrderWithFactionHeader(i, factionIndex, factionBar, factionHeader, factionCheck, factionTitle, factionStanding, factionAtWarIndicator, factionRightBarTexture)
  -- get the info for this Faction
  local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = REP.Orig_GetFactionDataByIndex(factionIndex)
  local origBarValue = barValue
  local toExalted

  if (isHeader) then
    factionHeader.Text:SetText(name)

    if (isCollapsed) then
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
    else
      factionHeader:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
    end

    factionHeader.index = factionIndex
    factionHeader.isCollapsed = isCollapsed

    factionBar:Hide()
    factionHeader:Show()
    factionCheck:Hide()
  else
    factionStandingText = GetText("FACTION_STANDING_LABEL"..standingID, gender)
    factionStanding:SetText(factionStandingText)
    factionTitle:SetText(name)

    if (atWarWith) then
      if factionAtWarIndicator then
        factionAtWarIndicator:Show()
      end
    else
      if factionAtWarIndicator then
        factionAtWarIndicator:Hide()
      end
    end

    barMax = barMax - barMin
    barValue = barValue - barMin
    barMin = 0

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
    end

    factionBar.index = factionIndex
    factionBar.standingText = factionStandingText
    factionBar.tooltip  = HIGHLIGHT_FONT_COLOR_CODE.." "..barValue.." / "..barMax..FONT_COLOR_CODE_CLOSE
    factionBar:SetMinMaxValues(0, barMax)
    factionBar:SetValue(barValue)
    color = REP.FACTION_BAR_COLORS[standingID]
    factionBar:SetStatusBarColor(color.r, color.g, color.b)
    factionBar:SetID(factionIndex)
    factionBar:Show()
    factionHeader:Hide()

    if (REP_Data.Global.ShowMissing) then
      if (barMax - barValue ~= 0) then
        factionStanding:SetText(factionStandingText .. " ("..barMax - barValue..")")
        factionBar.standingText = factionStandingText .. " ("..barMax - barValue..")"
        factionBar.tooltip = nil
      end
    end

    if (hasRep) or (not isHeader) then
      factionBar.hasRep = true
    else
      factionBar.hasRep = false
    end

    if (isWatched) then
      factionCheck:Show()
      factionTitle:SetWidth(100)
      factionCheck:SetPoint("LEFT", factionTitle, "LEFT", factionTitle:GetStringWidth(), 0)
    else
      factionCheck:Hide()
      factionTitle:SetWidth(110)
    end

    if (factionIndex == REP.Orig_GetSelectedFaction()) then
      if (REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible()) then
        REP_ReputationDetailFrame_IsShown(1, 2)

        REP:FillReputationDetailFrameWithData()

        _G["ReputationBar"..i.."Highlight1"]:Show()
        _G["ReputationBar"..i.."Highlight2"]:Show()
      end
    else
      _G["ReputationBar"..i.."Highlight1"]:Hide()
      _G["ReputationBar"..i.."Highlight2"]:Hide()
    end
  end
end
