local addonName, REP = ...

---------------------------------------------------------------------------------------------
--  Changing the default Detail window instead of creating my own to prevent issues
--  with new API where getSelectedFaction returns 0 when default window is hidden....
---------------------------------------------------------------------------------------------

function REP:ChangeReputationDetailFrameUI()
  -----------------------------------
  --  Detail frame UI
  -----------------------------------
  if REP.UseDetailPanel then
    REP:ChangeDetailPanelUI()
    return
  end

  -- Classic clients with the menu API: the addon's own details panel replaces the default details frame.
  if not REP.hasPrettyRepsLoaded and REP.CanUseClassicDetailPanel and REP:CanUseClassicDetailPanel() then
    REP.UseClassicPanel = true
    REP:CreateDetailPanel()
    REP:ApplyDetailFrameMode()
    return
  end

  if REP.hasPrettyRepsLoaded then
    REP.Orig_ReputationDetailFrame = PrettyRepsReputationFrame.ReputationDetailFrame
  else
    if REP.UseModernReputationUI then
      REP.Orig_ReputationDetailFrame = ReputationFrame.ReputationDetailFrame
    else
      REP.Orig_ReputationDetailFrame = ReputationDetailFrame
    end
  end  

  REP.Orig_ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 0, 0)

  if REP.UseModernReputationUI and not REP.hasPrettyRepsLoaded then
    REP_DetailFactionInfoBackground = select(2, REP.Orig_ReputationDetailFrame:GetRegions())
  else
    REP_DetailFactionInfoBackground = select(3, REP.Orig_ReputationDetailFrame:GetRegions())
  end

  if REP_DetailFactionInfoBackground and REP_DetailFactionInfoBackground:IsObjectType("Texture") then
    REP_DetailFactionInfoBackground:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Reputation-DetailBackground")
    
    if REP.UseModernReputationUI then
      REP_DetailFactionInfoBackground:SetSize(260, 128)
    else
      REP_DetailFactionInfoBackground:SetSize(256, 128)
    end
  end

  if REP.UseScrollBoxReputationUI and (not REP.UseModernReputationUI or REP.hasPrettyRepsLoaded) then
    REP_DetailFirstDivider = select(4, REP.Orig_ReputationDetailFrame:GetRegions())
  elseif REP.UseModernReputationUI then
    REP_DetailFirstDivider = select(3, REP.Orig_ReputationDetailFrame:GetRegions())
  else
    REP_DetailFirstDivider = select(5, REP.Orig_ReputationDetailFrame:GetRegions())
  end

  REP_DetailFirstDivider:SetWidth(615)

  if REP.Orig_ReputationDetailFrame.ScrollingDescription then
    REP.Orig_ReputationDetailFrame.ScrollingDescription:SetWidth(260)
    REP.Orig_ReputationDetailFrame.ScrollingDescription:SetPoint("BOTTOMRIGHT", REP_DetailFirstDivider, "TOPRIGHT", -455, 2)
  end
  
  if REP.hasPrettyRepsLoaded then
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox.Label:SetTextColor(1, 1, 1, 1)
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP.Orig_GetSelectedFaction()) end)
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox:ClearAllPoints()
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox:SetPoint("LEFT", REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox.Label, "RIGHT", 3, 0)
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox.Label:SetTextColor(1, 1, 1, 1)
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.FavoriteCheckbox:ClearAllPoints()
    REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.FavoriteCheckbox:SetPoint("LEFT", REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox.Label, "RIGHT", 3, 0)
  
    if REP.UseScrollBoxReputationUI then
      REP.Orig_ReputationDetailFrame.ViewRenownButton:ClearAllPoints()
      REP.Orig_ReputationDetailFrame.ViewRenownButton:SetPoint("TOPLEFT", REP.Orig_ReputationDetailFrame.StateContainer.CheckboxState.AtWarCheckbox, "BOTTOMLEFT", 0, 0)
    end
  else
    if REP.UseModernReputationUI then
      REP.Orig_ReputationDetailFrame.MakeInactiveCheckbox.Label:SetFontObject(ReputationDetailFont)
      REP.Orig_ReputationDetailFrame.WatchFactionCheckbox.Label:SetFontObject(ReputationDetailFont)
      REP.Orig_ReputationDetailFrame.AtWarCheckbox.Label:SetFontObject(ReputationDetailFont)

      REP.Orig_ReputationDetailFrame.MakeInactiveCheckbox.Label:SetTextColor(1, 1, 1, 1)
      REP.Orig_ReputationDetailFrame.MakeInactiveCheckbox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP.Orig_GetSelectedFaction()) end)
      REP.Orig_ReputationDetailFrame.WatchFactionCheckbox:ClearAllPoints()
      REP.Orig_ReputationDetailFrame.WatchFactionCheckbox:SetPoint("LEFT", REP.Orig_ReputationDetailFrame.MakeInactiveCheckbox.Label, "RIGHT", 3, 0)
      REP.Orig_ReputationDetailFrame.WatchFactionCheckbox.Label:SetTextColor(1, 1, 1, 1)
    else
      REP.Orig_DetailAtWarCheckBox:ClearAllPoints()
      REP.Orig_DetailAtWarCheckBox:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 5, 20)
      REP.Orig_DetailAtWarCheckBox:HookScript("OnClick", function(self) REP:CustomTriggerReputationFrameUpdate() end)

      REP.Orig_DetailInactiveCheckBox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP.Orig_GetSelectedFaction()) end)
      REP.Orig_DetailMainScreenCheckBox:ClearAllPoints()
      REP.Orig_DetailMainScreenCheckBox:SetPoint("LEFT", REP.Orig_DetailInactiveCheckBoxText, "RIGHT", 3, 0)
      REP.Orig_DetailMainScreenCheckBox:HookScript("OnClick", function(self) REP:CustomTriggerReputationFrameUpdate() end)
    end

    if REP.UseScrollBoxReputationUI then
      REP.Orig_ReputationDetailFrame.ViewRenownButton:ClearAllPoints()
      REP.Orig_ReputationDetailFrame.ViewRenownButton:SetPoint("TOPLEFT", REP.Orig_ReputationDetailFrame.AtWarCheckbox, "BOTTOMLEFT", 0, 0)
    end
  end

  REP:CreateDetailFrameContent()
end

function REP:ChangeDetailPanelUI()
  REP:CreateDetailPanel()
  REP:HookDetailPanelReputationFrame()
  if REP.InitSortedReputationList then REP:InitSortedReputationList() end
end

function REP:CreateDetailFrameContent()
  REP_DetailSecondDivider = REP.Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailSecondDivider:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Divider")
  REP_DetailSecondDivider:SetSize(615, 32)

  REP_DetailThirdDivider = REP.Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailThirdDivider:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Divider")
  REP_DetailThirdDivider:SetSize(615, 32)
  REP_DetailThirdDivider:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 0, -193)

  REP_DetailNoInformationText = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailNoInformationText:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 15, 15)
  REP_DetailNoInformationText:SetHeight(20)

  -----------------------------------
  --  Detail frame Info
  -----------------------------------
  REP_DetailInfoBackground = REP.Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailInfoBackground:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Reputation-DetailBackground")
  REP_DetailInfoBackground:SetSize(375, 128)
  REP_DetailInfoBackground:SetPoint("TOPLEFT", REP_DetailFactionInfoBackground, "TOPRIGHT", -70, 0)

  REP_DetailStandingName = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingName:SetPoint("TOPLEFT", REP_DetailInfoBackground, "TOPLEFT", 10, -10)
  REP_DetailStandingName:SetHeight(10)

  REP_DetailStandingNeeded = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingNeeded:SetPoint("TOPLEFT", REP_DetailStandingName, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingNeeded:SetHeight(10)

  REP_DetailStandingCurrent = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingCurrent:SetPoint("TOPLEFT", REP_DetailStandingNeeded, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingCurrent:SetHeight(10)

  REP_DetailStandingMissing = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingMissing:SetPoint("TOPLEFT", REP_DetailStandingCurrent, "BOTTOMLEFT", 0, -7)
  REP_DetailStandingMissing:SetHeight(10)

  REP_DetailStandingBag = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingBag:SetPoint("TOPLEFT", REP_DetailStandingMissing, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingBag:SetHeight(10)

  REP_DetailStandingBagBank = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingBagBank:SetPoint("TOPLEFT", REP_DetailStandingBag, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingBagBank:SetHeight(10)

  REP_DetailStandingQuests = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingQuests:SetPoint("TOPLEFT", REP_DetailStandingBagBank, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingQuests:SetHeight(10)

  REP_DetailStandingGained = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingGained:SetPoint("TOPLEFT", REP_DetailStandingQuests, "BOTTOMLEFT", 0, -5)
  REP_DetailStandingGained:SetHeight(10)

  REP_DetailStandingToExaltedHeader = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingToExaltedHeader:SetPoint("TOPLEFT", REP_DetailStandingGained, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingToExaltedHeader:SetHeight(10)

  REP_DetailStandingCurrent:SetText(REP_TXT.currentRep)
  REP_DetailStandingNeeded:SetText(REP_TXT.neededRep)
  REP_DetailStandingMissing:SetText(REP_TXT.missingRep)
  REP_DetailStandingBag:SetText(REP_TXT.repInBag)
  REP_DetailStandingBagBank:SetText(REP_TXT.repInBagBank)
  REP_DetailStandingQuests:SetText(REP_TXT.repInQuest)
  REP_DetailStandingGained:SetText(REP_TXT.factionGained)
  REP_DetailStandingToExaltedHeader:SetText(REP_TXT.toExalted)

  -----------------------------------
  --  Detail frame Info values
  -----------------------------------
  REP_DetailStandingNextValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingNextValue:SetPoint("TOP", REP_DetailStandingName, "TOP", 0, 0)
  REP_DetailStandingNextValue:SetPoint("RIGHT", REP.Orig_ReputationDetailFrame, "RIGHT", -40, 0)
  REP_DetailStandingNextValue:SetHeight(10)
  REP_DetailStandingNextValue:SetJustifyH("RIGHT")

  REP_DetailStandingNeededValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingNeededValue:SetPoint("TOP", REP_DetailStandingNeeded, "TOP", 0, 0)
  REP_DetailStandingNeededValue:SetPoint("RIGHT", REP.Orig_ReputationDetailFrame, "RIGHT", -15, 0)
  REP_DetailStandingNeededValue:SetHeight(10)
  REP_DetailStandingNeededValue:SetJustifyH("RIGHT")

  REP_DetailStandingCurrentValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingCurrentValue:SetPoint("TOPRIGHT", REP_DetailStandingNeededValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingCurrentValue:SetHeight(10)
  REP_DetailStandingCurrentValue:SetJustifyH("RIGHT")

  REP_DetailStandingMissingValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingMissingValue:SetPoint("TOPRIGHT", REP_DetailStandingCurrentValue, "BOTTOMRIGHT", 0, -7)
  REP_DetailStandingMissingValue:SetHeight(10)
  REP_DetailStandingMissingValue:SetJustifyH("RIGHT")

  REP_DetailStandingBagValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingBagValue:SetPoint("TOPRIGHT", REP_DetailStandingMissingValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingBagValue:SetHeight(10)
  REP_DetailStandingBagValue:SetJustifyH("RIGHT")

  REP_DetailStandingBagBankValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingBagBankValue:SetPoint("TOPRIGHT", REP_DetailStandingBagValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingBagBankValue:SetHeight(10)
  REP_DetailStandingBagBankValue:SetJustifyH("RIGHT")

  REP_DetailStandingQuestsValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingQuestsValue:SetPoint("TOPRIGHT", REP_DetailStandingBagBankValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingQuestsValue:SetHeight(10)
  REP_DetailStandingQuestsValue:SetJustifyH("RIGHT")

  REP_DetailStandingGainedValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingGainedValue:SetPoint("TOPRIGHT", REP_DetailStandingQuestsValue, "BOTTOMRIGHT", 0, -5)
  REP_DetailStandingGainedValue:SetHeight(10)
  REP_DetailStandingGainedValue:SetJustifyH("RIGHT")

  REP_DetailStandingToExaltedValue = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailStandingToExaltedValue:SetPoint("TOPRIGHT", REP_DetailStandingGainedValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingToExaltedValue:SetHeight(10)
  REP_DetailStandingToExaltedValue:SetJustifyH("RIGHT")

  REP:CreateDetailFrameButtonLayout()

  REP:SetReputationDetailFrameAndOptionsSkins()
end

function REP:CreateDetailFrameButtonLayout()
  -------------------------------------
  --  Detail frame checkboxes
  -------------------------------------
  REP_DetailShowOneTimeQuestsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowOneTimeQuestsButton", REP_TXT.showQuests, "REP_ShowOneTimeQuestsButton", function(_, checked) REP_Data.Global.ShowNonRepeatableQuests = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowOneTimeQuestsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, 18)

  REP_DetailShowNonPvPQuestsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowNonPvPQuestsButton", REP_TXT.showRepeatableQuests, "REP_ShowNonPvPQuestsButton", function(_, checked) REP_Data.Global.ShowQuests = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowNonPvPQuestsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, 18)

  REP_DetailShowPvPQuestsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowPvPQuestsButton", REP_TXT.showPvPQuests, "REP_ShowPvPQuestsButton", function(_, checked) REP_Data.Global.ShowPvPQuests = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowPvPQuestsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, 0)

  REP_DetailShowItemsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowItemsButton", REP_TXT.showItems, "REP_ShowItemsButton", function(_, checked) REP_Data.Global.ShowItems = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowItemsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, 0)

  REP_DetailShowMobsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowMobsButton", REP_TXT.showMobs, "REP_ShowMobsButton", function(_, checked) REP_Data.Global.ShowMobs = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowMobsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, -20)

  REP_DetailShowInstancesButton = REP:CreateDetailFrameCheckbox("REP_DetailShowInstancesButton", REP_TXT.showInstances, "REP_ShowInstancesButton", function(_, checked) REP_Data.Global.ShowInstances = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowInstancesButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, -20)

  REP_DetailShowGeneralButton = REP:CreateDetailFrameCheckbox("REP_DetailShowGeneralButton", REP_TXT.showGeneral, "REP_ShowGeneralButton", function(_, checked) REP_Data.Global.ShowGeneral = checked end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowGeneralButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, -40)

  REP_DetailShowOneTimeQuestsButton:SetChecked(REP_Data.Global.ShowNonRepeatableQuests)
  REP_DetailShowNonPvPQuestsButton:SetChecked(REP_Data.Global.ShowQuests)
  REP_DetailShowPvPQuestsButton:SetChecked(REP_Data.Global.ShowPvPQuests)
  REP_DetailShowItemsButton:SetChecked(REP_Data.Global.ShowItems)
  REP_DetailShowMobsButton:SetChecked(REP_Data.Global.ShowMobs)
  REP_DetailShowInstancesButton:SetChecked(REP_Data.Global.ShowInstances)
  REP_DetailShowGeneralButton:SetChecked(REP_Data.Global.ShowGeneral)

  -------------------------------------
  --  Default detail frame buttons
  -------------------------------------
  REP_DetailReputationSuppressHint = REP.Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "ReputationDetailFont")
  REP_DetailReputationSuppressHint:SetPoint("TOPLEFT", REP_DetailShowGeneralButton, "BOTTOMLEFT", 0, -2)
  REP_DetailReputationSuppressHint:SetSize(210, 0)
  REP_DetailReputationSuppressHint:SetJustifyH("LEFT")

  REP_DetailShowAllButton = REP:CreateDetailFrameButton("REP_DetailShowAllButton", REP_TXT.showAll, function() REP_ToggleAllTypesToShow(true) end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowAllButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 285, 18)
  REP_DetailShowAllButton:SetSize(85, 20)

  REP_DetailShowNoneButton = REP:CreateDetailFrameButton("REP_DetailShowNoneButton", REP_TXT.showNone, function() REP_ToggleAllTypesToShow(false) end, REP.Orig_ReputationDetailFrame)
  REP_DetailShowNoneButton:SetPoint("TOPLEFT", REP_DetailShowAllButton, "BOTTOMLEFT", 0, -2)
  REP_DetailShowNoneButton:SetSize(85, 20)

  REP_DetailExpandButton = REP:CreateDetailFrameButton("REP_DetailExpandButton", REP_TXT.expand, function() REP_ShowUpdateEntries(true) end, REP.Orig_ReputationDetailFrame)
  REP_DetailExpandButton:SetPoint("TOPLEFT", REP_DetailShowAllButton, "TOPRIGHT", 5, 0)
  REP_DetailExpandButton:SetSize(85, 20)

  REP_DetailCollapseButton = REP:CreateDetailFrameButton("REP_DetailCollapseButton", REP_TXT.collapse, function() REP_ShowUpdateEntries(false) end, REP.Orig_ReputationDetailFrame)
  REP_DetailCollapseButton:SetPoint("TOPLEFT", REP_DetailShowNoneButton, "TOPRIGHT", 5, 0)
  REP_DetailCollapseButton:SetSize(85, 20)

  REP_DetailSupressNoneFactionButton = REP:CreateDetailFrameButton("REP_DetailSupressNoneFactionButton", REP_TXT.supressNoneFaction, function() REP_SupressNone(false) end, REP.Orig_ReputationDetailFrame)
  REP_DetailSupressNoneFactionButton:SetPoint("TOPLEFT", REP_DetailShowNoneButton, "BOTTOMLEFT", 0, -2)
  REP_DetailSupressNoneFactionButton:SetSize(175, 20)

  REP_DetailSupressNoneGlobalButton = REP:CreateDetailFrameButton("REP_DetailSupressNoneGlobalButton", REP_TXT.supressNoneGlobal, function() REP_SupressNone(true) end, REP.Orig_ReputationDetailFrame)
  REP_DetailSupressNoneGlobalButton:SetPoint("TOPLEFT", REP_DetailSupressNoneFactionButton, "BOTTOMLEFT", 0, -2)
  REP_DetailSupressNoneGlobalButton:SetSize(175, 20)

  REP_DetailClearSessionGainButton = REP:CreateDetailFrameButton("REP_DetailClearSessionGainButton", REP_TXT.clearSessionGain, function() REP_ClearSessionGain() end, REP.Orig_ReputationDetailFrame)
  REP_DetailClearSessionGainButton:SetPoint("TOPRIGHT", REP_DetailSupressNoneGlobalButton, "BOTTOMRIGHT", 0, -2)
  REP_DetailClearSessionGainButton:SetSize(175, 20)

  REP_DetailManualEntryButton = REP:CreateDetailFrameButton("REP_DetailManualEntryButton", REP_TXT.manualAdd, function() REP:OpenManualEntry() end, REP.Orig_ReputationDetailFrame)
  REP_DetailManualEntryButton:SetPoint("RIGHT", REP_DetailClearSessionGainButton, "LEFT", -5, 0)
  REP_DetailManualEntryButton:SetSize(130, 20)
  REP_DetailManualEntryButton:SetText(REP_TXT.manualAdd)

  REP_DetailShowAllButton:SetText(REP_TXT.showAll)
  REP_DetailShowNoneButton:SetText(REP_TXT.showNone)
  REP_DetailExpandButton:SetText(REP_TXT.expand)
  REP_DetailCollapseButton:SetText(REP_TXT.collapse)
  REP_DetailSupressNoneFactionButton:SetText(REP_TXT.supressNoneFaction)
  REP_DetailSupressNoneGlobalButton:SetText(REP_TXT.supressNoneGlobal)
  REP_DetailReputationSuppressHint:SetText(REP_TXT.suppressHint)
  REP_DetailClearSessionGainButton:SetText(REP_TXT.clearSessionGain)

  -------------------------------------
  --  Detail frame Scroll list
  -------------------------------------
  REP_DetailListScrollFrame = CreateFrame("ScrollFrame", "REP_DetailListScrollFrame", REP.Orig_ReputationDetailFrame, "FauxScrollFrameTemplate")
  REP_DetailListScrollFrame:SetSize(430, 208)
  REP_DetailListScrollFrame:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 5, 15)
  REP_DetailListScrollFrame:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 16, REP_UpdateList_Update) end)

  local numEntries = 13
  local entries = {}

  for i = 1, numEntries do
    entries[i] = REP:CreateDetailFrameListItem("REP_DetailUpdateEntry"..i, function() end, REP.Orig_ReputationDetailFrame)
    
    if i == 1 then
      entries[i]:SetPoint("TOPLEFT", REP_DetailListScrollFrame, "TOPLEFT", 0, 0)
    else
      entries[i]:SetPoint("TOPLEFT", entries[i - 1], "BOTTOMLEFT")
    end
  end

end


function REP:CreateDetailFrameCheckbox(name, label, description, onclick, parent)
  local DetailFrameCheckbox = CreateFrame("CheckButton", name, parent, "ChatConfigCheckButtonTemplate")
  
  local labelFont = DetailFrameCheckbox:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
  labelFont:SetText(label)
  labelFont:SetPoint("LEFT", DetailFrameCheckbox, "RIGHT", -2, 0)
  labelFont:SetHeight(20)
  labelFont:SetFontObject(ReputationDetailFont)
  labelFont:SetTextColor(1, 1, 1, 1)

  DetailFrameCheckbox.Text = labelFont
  DetailFrameCheckbox.tooltipText = label
  DetailFrameCheckbox.tooltipRequirement = description
  DetailFrameCheckbox:SetSize(20, 20)
  DetailFrameCheckbox:SetHitRectInsets(0, -80, 0, 0)

  DetailFrameCheckbox:SetScript("OnClick", function(self)
    local checked = self:GetChecked()
    PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
    onclick(self, checked and true or false)
    REP_BuildUpdateList()
    REP_UpdateList_Update()
  end)

  DetailFrameCheckbox:SetScript("OnEnter", function(self) REP_ShowHelpToolTip(self, description) end)
  DetailFrameCheckbox:SetScript("OnLeave", function(self) if GameTooltip:GetOwner() == self then GameTooltip:Hide() end end)

  return DetailFrameCheckbox
end

function REP:CreateDetailFrameListItem(name, onclick, parent)
  local DetailFrameListItem = CreateFrame("Button", name, parent, "REP_UpdateEntryTemplate")

  return DetailFrameListItem
end

function REP:CreateDetailFrameButton(name, label, onclick, parent)
  local DetailFrameButton = CreateFrame("Button", name, parent, "SmallFontButton")
  DetailFrameButton:SetScript("OnClick", function(self) onclick() end)
  DetailFrameButton:SetScript("OnEnter", function(self) REP_ShowHelpToolTip(self, name) end)
  DetailFrameButton:SetScript("OnLeave", function(self) if GameTooltip:GetOwner() == self then GameTooltip:Hide() end end)

  local highlightFont = _G["DetailFontHighlighted"]
  local disabledFont = _G["DetailFontGrey"]

  if highlightFont and disabledFont then
    DetailFrameButton:SetNormalFontObject(highlightFont)
    DetailFrameButton:SetHighlightFontObject(highlightFont)
    DetailFrameButton:SetDisabledFontObject(disabledFont)
  end

  return DetailFrameButton
end

function REP:FillReputationDetailFrameWithData()
  local factionData = REP:GetFactionDataToBuildReputationlist();

  if not factionData and REP.UseDetailPanel then
    REP:ShowDetailPanelEmptyState()
    return
  end

  if not factionData or not REP.Orig_ReputationDetailFrame then return end

  -- Classic with the default details frame chosen: the game fills that frame itself.
  if REP.UseClassicPanel and REP.Orig_ReputationDetailFrame ~= REP_DetailPanel then return end

  if REP.UseDetailPanel or REP.UseClassicPanel then
    -- The details panel has its own size and layout
  elseif REP.UseScrollBoxReputationUI then
    local isMajorFaction = C_Reputation.IsMajorFaction(factionData.factionID);

    if isMajorFaction then
      REP.Orig_ReputationDetailFrame:SetSize(482, 565)
      REP_DetailSecondDivider:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 0, -20)
    else
      REP.Orig_ReputationDetailFrame:SetSize(482, 525)
      REP_DetailSecondDivider:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 0, 0)
    end
  else
    REP.Orig_ReputationDetailFrame:SetSize(482, 525)
    REP_DetailSecondDivider:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 0, 0)
  end

  --------------------------------------------
  --  Faction specific detail frame settings
  --------------------------------------------
  local name = factionData.name
  local description = factionData.description
  local factionID = factionData.factionID
  local atWarWith = factionData.atWarWith
  local canToggleAtWar = factionData.canToggleAtWar
  local isHeader = factionData.isHeader
  local isCollapsed = factionData.isCollapsed
  local hasRep = factionData.isHeaderWithRep
  local isWatched = factionData.isWatched
  local isChild = factionData.isChild
  local hasBonusRepGain = factionData.hasBonusRepGain
  local isAccountWide = factionData.isAccountWide
  
  local standingID, barMin, barValue, barMax, isFriend, isMajorFaction, colorID

  if REP.UseScrollBoxReputationUI then
    isMajorFaction = factionID and REP.Orig_IsMajorFaction(factionID)
  end

  if isMajorFaction then
    local majorFactionData = REP.Orig_GetMajorFactionData(factionID)
    barMin = 0
    barMax = majorFactionData.renownLevelThreshold
    barValue = majorFactionData.renownReputationEarned
    standingID = majorFactionData.renownLevel
  else
    standingID = factionData.reaction
    barMin = factionData.currentReactionThreshold
    barValue = factionData.currentStanding

    if standingID == 4 then
      barMax = factionData.nextReactionThreshold
    elseif standingID > 4 then
      barMax = factionData.nextReactionThreshold - factionData.currentReactionThreshold
    else
      barMax = factionData.currentReactionThreshold - factionData.nextReactionThreshold
    end

    if REP.HasFriendshipAPI then
      local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
      isFriend = friendReputationInfo.isFriend
    end

    -- if standingID < 4 then barMax = barMax - barMin end
    -- if not isMajorFaction then
    if standingID < 4 or (isFriend and standingID < 4) then
      if barMin < 0 then barMin = barMin * -1 end
      if barValue < 0 then barValue = barValue * -1 end
      if barMax < 0 then barMax = barMax * -1 end
    end
    -- end
  end

  --------------------------------------------
  --  Faction name
  --------------------------------------------
  if factionID == 1168 then
    name = name.." (guild)"
  end

  --------------------------------------------
  --  Faction descroption
  --------------------------------------------
  if description == nil or description == '' then
    if factionID == 469 then
      description = REP_TXT.allianceDescription
    elseif factionID == 67 then
      description = REP_TXT.hordeDescription
    end
  end

  factionData.description = description
  -- REP_ReputationDetailFactionDescription:SetText(description)

  ---------------------------------------------------
  --  CurrentStanding Name + color
  ---------------------------------------------------
  local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
  local factionStandingtext = friendReputationInfo.factionStandingtext
  local isCappedFriendship = friendReputationInfo.isCappedFriendship
  local color

  local isParagon = false
  if REP.AfterMoP or REP.IsForever then
    if isFriend then
      isParagon = isCappedFriendship and REP:IsAtParagon(factionID) or false
    else
      isParagon = REP:IsAtParagon(factionID, not isMajorFaction and standingID or nil)
    end
  end

  if isMajorFaction then
    local isCapped = REP.Orig_HasMaximumRenown(factionID)

    if isCapped and isParagon then
      colorID = 9
      color = REP.FACTION_BAR_COLORS[colorID]
      REP_DetailStandingName:SetText(REP_TXT.STAND_LV[9])
    else
      color = BLUE_FONT_COLOR
      REP_DetailStandingName:SetText(REP_TXT.renown.." "..standingID)
    end
  else
    if isParagon then
      colorID = 9
      color = REP.FACTION_BAR_COLORS[colorID]
      REP_DetailStandingName:SetText(REP_TXT.STAND_LV[9])
    else
      if isFriend then
        colorID = 5
      else
        colorID = standingID
      end

      color = REP.FACTION_BAR_COLORS[colorID]
      REP_DetailStandingName:SetText(factionStandingtext)
    end
  end

  REP_DetailStandingName:SetTextColor(color.r, color.g, color.b)
  local standingColor = color

  -----------------------------------------------------------------
  --  Reputation needed/missing for next rank + current reputation
  --  NextStanding Name + color + reputation till exalted/max
  -----------------------------------------------------------------
  local reputationGains = REP_GetReputationGains(factionIndex, factionID)
  local toExalted, toBFF = 0, 0

  REP_DetailStandingNeededValue:SetText(reputationGains.reputationNeededCurrent)
  REP_DetailStandingCurrentValue:SetText(reputationGains.reputationCurrent)
  REP_DetailStandingMissingValue:SetText(reputationGains.reputationMissingCurrent)
  REP_DetailStandingToExaltedValue:SetText(reputationGains.reputationNeededToMax)

  if isFriend then
    if isCappedFriendship then
      REP_DetailStandingNextValue:SetText("")
      REP_DetailStandingToExaltedHeader:SetText("")
      REP_DetailStandingToExaltedValue:SetText("")
    else
      local friendRep, friendMaxRep, friendThreshold, nextFriendThreshold

      if not REP.UseScrollBoxReputationUI and GetFriendshipReputation then
        _, friendRep, friendMaxRep, _, _, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP.Orig_GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          nextFriendThreshold = friendshipInfo.nextThreshold
        end
      end

      color = REP.FACTION_BAR_COLORS[8]
      REP_DetailStandingNextValue:SetText("(--> "..REP:GetFriendFactionStandingLabel(factionID, nextFriendThreshold)..")")
      REP_DetailStandingToExaltedHeader:SetText(REP_TXT.reputationToMax)
    end
  elseif isMajorFaction then
    local majorFactionData = REP.Orig_GetMajorFactionData(factionID);
    local renownLevel = majorFactionData.renownLevel
    barMax = majorFactionData.renownLevelThreshold
    barValue = ((renownLevel - 1) *  majorFactionData.renownLevelThreshold) + barValue
    local isCapped = REP.Orig_HasMaximumRenown(factionID)

    local maxFactionLevel = 25

    if(REP.MaxFactionLevel[factionID]) then
      maxFactionLevel = REP.MaxFactionLevel[factionID]
    end

    local maxRenown = maxFactionLevel * barMax
    toExalted = maxRenown - reputationGains.reputationGainedTotal

    if isCapped then
      local currentValue, threshold = REP.Orig_GetFactionParagonInfo(factionID)
      barMax = threshold or barMax
      toExalted = threshold or 0

      REP_DetailStandingNextValue:SetText("")
    else
      REP_DetailStandingNextValue:SetText("(--> "..REP_TXT.renown.." "..(majorFactionData.renownLevel + 1)..")")
    end

    REP_DetailStandingToExaltedHeader:SetText(REP_TXT.renownToMax)
  else
    if (standingID >= 7) then
      REP_DetailStandingToExaltedHeader:SetText("")
      REP_DetailStandingToExaltedValue:SetText("")
    end

    if (standingID < 8) then
      toExalted = REP.ToExalted[standingID] + barMax - barValue
      color = REP.FACTION_BAR_COLORS[standingID + 1]
      REP_DetailStandingNextValue:SetText("(--> "..GetText("FACTION_STANDING_LABEL"..standingID + 1, gender)..")")

      if (standingID < 7) then
        REP_DetailStandingToExaltedHeader:SetText(REP_TXT.toExalted)
      end
    else
      REP_DetailStandingNextValue:SetText("")
    end
  end

  REP_DetailStandingNextValue:SetTextColor(color.r, color.g, color.b)

  ------------------------------------
  --  Reputation gained this session 
  ------------------------------------
  REP_DetailStandingGainedValue:SetText(reputationGains.reputationGainedSession)

  ------------------------------
  --  Reputation in bags/bank
  ------------------------------
  if not REP.CurrentRepInBag then REP.CurrentRepInBag = 0 end
  if not REP.CurrentRepInBagBank then REP.CurrentRepInBagBank = 0 end
  if not REP.CurrentRepInQuest then REP.CurrentRepInQuest = 0 end

  REP_DetailStandingBagValue:SetText(REP.CurrentRepInBag)
  REP_DetailStandingBagBankValue:SetText(REP.CurrentRepInBagBank)
  REP_DetailStandingQuestsValue:SetText(REP.CurrentRepInQuest)

  ------------------------------
  --  Default checkboxes
  ------------------------------
  if REP.UseDetailPanel or REP.UseClassicPanel then
    REP:UpdateDetailPanel(factionData, reputationGains, standingColor)
  elseif REP_DetailShowNonPvPQuestsButton then
    REP_DetailShowOneTimeQuestsButton:SetChecked(REP_Data.Global.ShowNonRepeatableQuests)
    REP_DetailShowNonPvPQuestsButton:SetChecked(REP_Data.Global.ShowQuests)
    REP_DetailShowPvPQuestsButton:SetChecked(REP_Data.Global.ShowPvPQuests)
    REP_DetailShowItemsButton:SetChecked(REP_Data.Global.ShowItems)
    REP_DetailShowMobsButton:SetChecked(REP_Data.Global.ShowMobs)
    REP_DetailShowInstancesButton:SetChecked(REP_Data.Global.ShowInstances)
    REP_DetailShowGeneralButton:SetChecked(REP_Data.Global.ShowGeneral)
  end

  if (REP.Orig_ReputationDetailFrame:IsVisible()) then
    REP_BuildUpdateList()
    REP_UpdateList_Update()
  end
end
---------------------------------------------------------------------------------------------
--  Addon details panel (World of Warcraft: Forever and retail)
---------------------------------------------------------------------------------------------
local function GetSelectedFactionIDFromDefaultUI()
  local index = C_Reputation.GetSelectedFaction()
  if not index or index == 0 then return end

  local factionData = C_Reputation.GetFactionDataByIndex(index)
  if factionData and factionData.factionID and factionData.factionID > 0 then
    return factionData.factionID
  end
end

-- Takes over the faction that is selected in the default reputation list (if any).
function REP:SyncSelectedFactionFromDefaultUI()
  local factionID = GetSelectedFactionIDFromDefaultUI()
  if factionID then
    REP.SelectedFactionID = factionID
  end
end

-- Coalesces bursts of updates (bag updates, faction updates) into one refresh.
function REP:RequestDetailFrameRefresh()
  if REP._detailRefreshPending then return end
  REP._detailRefreshPending = true

  C_Timer.After(0.2, function()
    REP._detailRefreshPending = false

    if REP.Orig_ReputationDetailFrame and REP.Orig_ReputationDetailFrame:IsVisible() then
      REP:FillReputationDetailFrameWithData()
    end
  end)
end

function REP:HookDetailPanelReputationFrame()
  if REP._detailPanelHooksInstalled then return end
  REP._detailPanelHooksInstalled = true

  -- The selection of the default reputation list is leading, the addon only remembers it (by factionID)
  -- so the same faction can be selected again when the reputation frame is reopened.
  if EventRegistry then
    EventRegistry:RegisterCallback("ReputationFrame.NewFactionSelected", function()
      local factionID = GetSelectedFactionIDFromDefaultUI()
      if not factionID or factionID == REP.SelectedFactionID then return end

      REP.SelectedFactionID = factionID

      if REP_DetailPanel and REP_DetailPanel:IsVisible() then
        REP:FillReputationDetailFrameWithData()
      end
    end, REP)
  end

  -- Only addon owned frames and variables are changed from here: anything written into the default UI
  -- (selection events, pane state) taints it, and Midnight's secret values turn that taint into errors.
  ReputationFrame:HookScript("OnShow", function()
    -- The default UI selects a faction when it opens, show that one so the list and the panel match.
    REP:SyncSelectedFactionFromDefaultUI()

    REP:UpdateDetailPanelVisibility()

    -- The panel can be shown (and filled) before this hook runs, so fill it again with the selection from above.
    if REP_DetailPanel and REP_DetailPanel:IsVisible() then
      REP:FillReputationDetailFrameWithData()
    end
  end)

  -- Retail: the panel replaces the small default details popup, it opens and closes together with it.
  if not REP.IsForever and ReputationFrame.ReputationDetailFrame then
    local defaultDetails = ReputationFrame.ReputationDetailFrame

    defaultDetails:HookScript("OnShow", function()
      REP:SyncSelectedFactionFromDefaultUI()
      REP:UpdateDetailPanelVisibility()
    end)

    defaultDetails:HookScript("OnHide", function()
      REP:UpdateDetailPanelVisibility()
    end)
  end

  -- Forever: the default UI resizes the character frame on every refresh, keep it at the collapsed width while the panel is open.
  if REP.IsForever and CharacterFrame and CharacterFrame.UpdateSize then
    hooksecurefunc(CharacterFrame, "UpdateSize", function()
      REP:UpdateCharacterFrameWidthForDetailPanel()
    end)
  end

  -- Forever: the collapse/expand arrow of the character frame shows or hides the details pane.
  if REP.IsForever and CharacterFrame and CharacterFrame.RefreshRightPane then
    hooksecurefunc(CharacterFrame, "RefreshRightPane", function()
      -- Clicking a faction while the pane is collapsed expands it before the selection event fires,
      -- so take over the current selection before the panel shows.
      local collapsed = CharacterFrame:IsRightPaneCollapsed()
      if REP._rightPaneCollapsed and not collapsed then
        REP:SyncSelectedFactionFromDefaultUI()
      end
      REP._rightPaneCollapsed = collapsed

      REP:UpdateDetailPanelVisibility()
    end)
  end
end
