local addonName, REP = ...

---------------------------------------------------------------------------------------------
--  Changing the default Detail window instead of creating my own to prevent issues
--  with new API where getSelectedFaction returns 0 when default window is hidden....
---------------------------------------------------------------------------------------------

function REP:ChangeReputationDetailFrameUI()
  -----------------------------------
  --  Detail frame UI
  -----------------------------------
  if REP.hasPrettyRepsLoaded then
    REP_Orig_ReputationDetailFrame = PrettyRepsReputationFrame.ReputationDetailFrame
  else
    if REP.AfterDragonflight then
      REP_Orig_ReputationDetailFrame = ReputationFrame.ReputationDetailFrame
    else
      REP_Orig_ReputationDetailFrame = ReputationDetailFrame
    end
  end  

  REP_Orig_ReputationDetailFrame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", 0, 0)

  if REP.AfterDragonflight and not REP.hasPrettyRepsLoaded then
    REP_DetailFactionInfoBackground = select(2, REP_Orig_ReputationDetailFrame:GetRegions())
  else
    REP_DetailFactionInfoBackground = select(3, REP_Orig_ReputationDetailFrame:GetRegions())
  end

  if REP_DetailFactionInfoBackground and REP_DetailFactionInfoBackground:IsObjectType("Texture") then
    REP_DetailFactionInfoBackground:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Reputation-DetailBackground")
    
    if REP.AfterDragonflight then
      REP_DetailFactionInfoBackground:SetSize(260, 128)
    else
      REP_DetailFactionInfoBackground:SetSize(256, 128)
    end
  end

  if REP.AfterShadowLands and (not REP.AfterDragonflight or REP.hasPrettyRepsLoaded) then
    REP_DetailFirstDivider = select(4, REP_Orig_ReputationDetailFrame:GetRegions())
  elseif REP.AfterDragonflight then
    REP_DetailFirstDivider = select(3, REP_Orig_ReputationDetailFrame:GetRegions())
  else
    REP_DetailFirstDivider = select(5, REP_Orig_ReputationDetailFrame:GetRegions())
  end

  REP_DetailFirstDivider:SetWidth(615)

  if REP_Orig_ReputationDetailFrame.ScrollingDescription then
    REP_Orig_ReputationDetailFrame.ScrollingDescription:SetWidth(260)
    REP_Orig_ReputationDetailFrame.ScrollingDescription:SetPoint("BOTTOMRIGHT", REP_DetailFirstDivider, "TOPRIGHT", -455, 2)
  end
  
  if REP.hasPrettyRepsLoaded then
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox.Label:SetTextColor(1, 1, 1, 1)
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP_Orig_GetSelectedFaction()) end)
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox:ClearAllPoints()
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox:SetPoint("LEFT", REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.MakeInactiveCheckbox.Label, "RIGHT", 3, 0)
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox.Label:SetTextColor(1, 1, 1, 1)
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.FavoriteCheckbox:ClearAllPoints()
    REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.FavoriteCheckbox:SetPoint("LEFT", REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.WatchFactionCheckbox.Label, "RIGHT", 3, 0)
  
    if REP.AfterShadowLands then
      REP_Orig_ReputationDetailFrame.ViewRenownButton:ClearAllPoints()
      REP_Orig_ReputationDetailFrame.ViewRenownButton:SetPoint("TOPLEFT", REP_Orig_ReputationDetailFrame.StateContainer.CheckboxState.AtWarCheckbox, "BOTTOMLEFT", 0, 0)
    end
  else
    if REP.AfterDragonflight then
      REP_Orig_ReputationDetailFrame.MakeInactiveCheckbox.Label:SetTextColor(1, 1, 1, 1)
      REP_Orig_ReputationDetailFrame.MakeInactiveCheckbox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP_Orig_GetSelectedFaction()) end)
      REP_Orig_ReputationDetailFrame.WatchFactionCheckbox:ClearAllPoints()
      REP_Orig_ReputationDetailFrame.WatchFactionCheckbox:SetPoint("LEFT", REP_Orig_ReputationDetailFrame.MakeInactiveCheckbox.Label, "RIGHT", 3, 0)
      REP_Orig_ReputationDetailFrame.WatchFactionCheckbox.Label:SetTextColor(1, 1, 1, 1)
    else
      REP_Orig_DetailAtWarCheckBox:ClearAllPoints()
      REP_Orig_DetailAtWarCheckBox:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 5, 20)
      REP_Orig_DetailAtWarCheckBox:HookScript("OnClick", function(self) REP:CustomTriggerReputationFrameUpdate() end)

      REP_Orig_DetailInactiveCheckBox:SetScript("OnClick", function(self) REP:CustomSetFactionActiveOrInactive(self:GetChecked(), REP_Orig_GetSelectedFaction()) end)
      REP_Orig_DetailMainScreenCheckBox:ClearAllPoints()
      REP_Orig_DetailMainScreenCheckBox:SetPoint("LEFT", REP_Orig_DetailInactiveCheckBoxText, "RIGHT", 3, 0)
      REP_Orig_DetailMainScreenCheckBox:HookScript("OnClick", function(self) REP:CustomTriggerReputationFrameUpdate() end)
    end

    if REP.AfterShadowLands then
      REP_Orig_ReputationDetailFrame.ViewRenownButton:ClearAllPoints()
      REP_Orig_ReputationDetailFrame.ViewRenownButton:SetPoint("TOPLEFT", REP_Orig_ReputationDetailFrame.AtWarCheckbox, "BOTTOMLEFT", 0, 0)
    end
  end

  REP_DetailSecondDivider = REP_Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailSecondDivider:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Divider")
  REP_DetailSecondDivider:SetSize(615, 32)

  REP_DetailThirdDivider = REP_Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailThirdDivider:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Divider")
  REP_DetailThirdDivider:SetSize(615, 32)
  REP_DetailThirdDivider:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 0, -193)

  REP_DetailNoInformationText = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  REP_DetailNoInformationText:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 15, 15)
  REP_DetailNoInformationText:SetHeight(20)

  -----------------------------------
  --  Detail frame Info
  -----------------------------------
  REP_DetailInfoBackground = REP_Orig_ReputationDetailFrame:CreateTexture(nil, "ARTWORK")
  REP_DetailInfoBackground:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Reputation-DetailBackground")
  REP_DetailInfoBackground:SetSize(375, 128)
  REP_DetailInfoBackground:SetPoint("TOPLEFT", REP_DetailFactionInfoBackground, "TOPRIGHT", -70, 0)

  REP_DetailStandingName = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  REP_DetailStandingName:SetPoint("TOPLEFT", REP_DetailInfoBackground, "TOPLEFT", 10, -10)
  REP_DetailStandingName:SetHeight(10)

  REP_DetailStandingNeeded = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingNeeded:SetPoint("TOPLEFT", REP_DetailStandingName, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingNeeded:SetHeight(10)

  REP_DetailStandingCurrent = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingCurrent:SetPoint("TOPLEFT", REP_DetailStandingNeeded, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingCurrent:SetHeight(10)

  REP_DetailStandingMissing = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingMissing:SetPoint("TOPLEFT", REP_DetailStandingCurrent, "BOTTOMLEFT", 0, -7)
  REP_DetailStandingMissing:SetHeight(10)

  REP_DetailStandingBag = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingBag:SetPoint("TOPLEFT", REP_DetailStandingMissing, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingBag:SetHeight(10)

  REP_DetailStandingBagBank = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingBagBank:SetPoint("TOPLEFT", REP_DetailStandingBag, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingBagBank:SetHeight(10)

  REP_DetailStandingQuests = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingQuests:SetPoint("TOPLEFT", REP_DetailStandingBagBank, "BOTTOMLEFT", 0, -2)
  REP_DetailStandingQuests:SetHeight(10)

  REP_DetailStandingGained = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingGained:SetPoint("TOPLEFT", REP_DetailStandingQuests, "BOTTOMLEFT", 0, -5)
  REP_DetailStandingGained:SetHeight(10)

  REP_DetailStandingToExaltedHeader = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
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
  REP_DetailStandingNextValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingNextValue:SetPoint("TOP", REP_DetailStandingName, "TOP", 0, 0)
  REP_DetailStandingNextValue:SetPoint("RIGHT", REP_Orig_ReputationDetailFrame, "RIGHT", -40, 0)
  REP_DetailStandingNextValue:SetHeight(10)
  REP_DetailStandingNextValue:SetJustifyH("RIGHT")

  REP_DetailStandingNeededValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingNeededValue:SetPoint("TOP", REP_DetailStandingNeeded, "TOP", 0, 0)
  REP_DetailStandingNeededValue:SetPoint("RIGHT", REP_Orig_ReputationDetailFrame, "RIGHT", -15, 0)
  REP_DetailStandingNeededValue:SetHeight(10)
  REP_DetailStandingNeededValue:SetJustifyH("RIGHT")

  REP_DetailStandingCurrentValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingCurrentValue:SetPoint("TOPRIGHT", REP_DetailStandingNeededValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingCurrentValue:SetHeight(10)
  REP_DetailStandingCurrentValue:SetJustifyH("RIGHT")

  REP_DetailStandingMissingValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingMissingValue:SetPoint("TOPRIGHT", REP_DetailStandingCurrentValue, "BOTTOMRIGHT", 0, -7)
  REP_DetailStandingMissingValue:SetHeight(10)
  REP_DetailStandingMissingValue:SetJustifyH("RIGHT")

  REP_DetailStandingBagValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingBagValue:SetPoint("TOPRIGHT", REP_DetailStandingMissingValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingBagValue:SetHeight(10)
  REP_DetailStandingBagValue:SetJustifyH("RIGHT")

  REP_DetailStandingBagBankValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingBagBankValue:SetPoint("TOPRIGHT", REP_DetailStandingBagValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingBagBankValue:SetHeight(10)
  REP_DetailStandingBagBankValue:SetJustifyH("RIGHT")

  REP_DetailStandingQuestsValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingQuestsValue:SetPoint("TOPRIGHT", REP_DetailStandingBagBankValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingQuestsValue:SetHeight(10)
  REP_DetailStandingQuestsValue:SetJustifyH("RIGHT")

  REP_DetailStandingGainedValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingGainedValue:SetPoint("TOPRIGHT", REP_DetailStandingQuestsValue, "BOTTOMRIGHT", 0, -5)
  REP_DetailStandingGainedValue:SetHeight(10)
  REP_DetailStandingGainedValue:SetJustifyH("RIGHT")

  REP_DetailStandingToExaltedValue = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailStandingToExaltedValue:SetPoint("TOPRIGHT", REP_DetailStandingGainedValue, "BOTTOMRIGHT", 0, -2)
  REP_DetailStandingToExaltedValue:SetHeight(10)
  REP_DetailStandingToExaltedValue:SetJustifyH("RIGHT")

  -------------------------------------
  --  Detail frame checkboxes
  -------------------------------------
  REP_DetailShowNonPvPQuestsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowNonPvPQuestsButton", REP_TXT.showQuests, "REP_ShowNonPvPQuestsButton", function(_, checked) REP_Data.Global.ShowQuests = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowNonPvPQuestsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, 18)

  REP_DetailShowPvPQuestsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowPvPQuestsButton", REP_TXT.showPvPQuests, "REP_ShowPvPQuestsButton", function(_, checked) REP_Data.Global.ShowPvPQuests = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowPvPQuestsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, 18)

  REP_DetailShowItemsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowItemsButton", REP_TXT.showItems, "REP_ShowItemsButton", function(_, checked) REP_Data.Global.ShowItems = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowItemsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, 0)

  REP_DetailShowMobsButton = REP:CreateDetailFrameCheckbox("REP_DetailShowMobsButton", REP_TXT.showMobs, "REP_ShowMobsButton", function(_, checked) REP_Data.Global.ShowMobs = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowMobsButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, 0)

  REP_DetailShowInstancesButton = REP:CreateDetailFrameCheckbox("REP_DetailShowInstancesButton", REP_TXT.showInstances, "REP_ShowInstancesButton", function(_, checked) REP_Data.Global.ShowInstances = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowInstancesButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 115, -20)

  REP_DetailShowGeneralButton = REP:CreateDetailFrameCheckbox("REP_DetailShowGeneralButton", REP_TXT.showGeneral, "REP_ShowGeneralButton", function(_, checked) REP_Data.Global.ShowGeneral = checked end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowGeneralButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 10, -20)

  REP_DetailShowNonPvPQuestsButton:SetChecked(REP_Data.Global.ShowQuests)
  REP_DetailShowPvPQuestsButton:SetChecked(REP_Data.Global.ShowPvPQuests)
  REP_DetailShowItemsButton:SetChecked(REP_Data.Global.ShowItems)
  REP_DetailShowMobsButton:SetChecked(REP_Data.Global.ShowMobs)
  REP_DetailShowInstancesButton:SetChecked(REP_Data.Global.ShowInstances)
  REP_DetailShowGeneralButton:SetChecked(REP_Data.Global.ShowGeneral)

  -------------------------------------
  --  Default detail frame buttons
  -------------------------------------
  REP_DetailReputationSuppressHint = REP_Orig_ReputationDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  REP_DetailReputationSuppressHint:SetPoint("TOPLEFT", REP_DetailShowGeneralButton, "BOTTOMLEFT", 0, -2)
  REP_DetailReputationSuppressHint:SetSize(210, 0)
  REP_DetailReputationSuppressHint:SetJustifyH("LEFT")

  REP_DetailShowAllButton = REP:CreateDetailFrameButton("REP_DetailShowAllButton", REP_TXT.showAll, function() REP_ToggleAllTypesToShow(true) end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowAllButton:SetPoint("TOPLEFT", REP_DetailThirdDivider, "BOTTOMLEFT", 285, 18)
  REP_DetailShowAllButton:SetSize(85, 20)

  REP_DetailShowNoneButton = REP:CreateDetailFrameButton("REP_DetailShowNoneButton", REP_TXT.showNone, function() REP_ToggleAllTypesToShow(false) end, REP_Orig_ReputationDetailFrame)
  REP_DetailShowNoneButton:SetPoint("TOPLEFT", REP_DetailShowAllButton, "BOTTOMLEFT", 0, -2)
  REP_DetailShowNoneButton:SetSize(85, 20)

  REP_DetailExpandButton = REP:CreateDetailFrameButton("REP_DetailExpandButton", REP_TXT.expand, function() REP_ShowUpdateEntries(true) end, REP_Orig_ReputationDetailFrame)
  REP_DetailExpandButton:SetPoint("TOPLEFT", REP_DetailShowAllButton, "TOPRIGHT", 5, 0)
  REP_DetailExpandButton:SetSize(85, 20)

  REP_DetailCollapseButton = REP:CreateDetailFrameButton("REP_DetailCollapseButton", REP_TXT.collapse, function() REP_ShowUpdateEntries(false) end, REP_Orig_ReputationDetailFrame)
  REP_DetailCollapseButton:SetPoint("TOPLEFT", REP_DetailShowNoneButton, "TOPRIGHT", 5, 0)
  REP_DetailCollapseButton:SetSize(85, 20)

  REP_DetailSupressNoneFactionButton = REP:CreateDetailFrameButton("REP_DetailSupressNoneFactionButton", REP_TXT.supressNoneFaction, function() REP_SupressNone(false) end, REP_Orig_ReputationDetailFrame)
  REP_DetailSupressNoneFactionButton:SetPoint("TOPLEFT", REP_DetailShowNoneButton, "BOTTOMLEFT", 0, -2)
  REP_DetailSupressNoneFactionButton:SetSize(175, 20)

  REP_DetailSupressNoneGlobalButton = REP:CreateDetailFrameButton("REP_DetailSupressNoneGlobalButton", REP_TXT.supressNoneGlobal, function() REP_SupressNone(true) end, REP_Orig_ReputationDetailFrame)
  REP_DetailSupressNoneGlobalButton:SetPoint("TOPLEFT", REP_DetailSupressNoneFactionButton, "BOTTOMLEFT", 0, -2)
  REP_DetailSupressNoneGlobalButton:SetSize(175, 20)

  REP_DetailClearSessionGainButton = REP:CreateDetailFrameButton("REP_DetailClearSessionGainButton", REP_TXT.clearSessionGain, function() REP_ClearSessionGain() end, REP_Orig_ReputationDetailFrame)
  REP_DetailClearSessionGainButton:SetPoint("TOPRIGHT", REP_DetailSupressNoneGlobalButton, "BOTTOMRIGHT", 0, -2)
  REP_DetailClearSessionGainButton:SetSize(175, 20)

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
  REP_DetailListScrollFrame = CreateFrame("ScrollFrame", "REP_DetailListScrollFrame", REP_Orig_ReputationDetailFrame, "FauxScrollFrameTemplate")
  REP_DetailListScrollFrame:SetSize(430, 208)
  REP_DetailListScrollFrame:SetPoint("TOPLEFT", REP_DetailSecondDivider, "BOTTOMLEFT", 5, 15)
  REP_DetailListScrollFrame:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 16, REP_UpdateList_Update) end)

  local numEntries = 13
  local entries = {}

  for i = 1, numEntries do
    entries[i] = REP:CreateDetailFrameListItem("REP_DetailUpdateEntry"..i, function() end, REP_Orig_ReputationDetailFrame)
    
    if i == 1 then
      entries[i]:SetPoint("TOPLEFT", REP_DetailListScrollFrame, "TOPLEFT", 0, 0)
    else
      entries[i]:SetPoint("TOPLEFT", entries[i - 1], "BOTTOMLEFT")
    end
  end

  REP:SetReputationDetailFrameAndOptionsSkins()
end

function REP:CreateDetailFrameCheckbox(name, label, description, onclick, parent)
  local DetailFrameCheckbox = CreateFrame("CheckButton", name, parent, "ChatConfigCheckButtonTemplate")
  
  local labelFont = DetailFrameCheckbox:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
  labelFont:SetText(label)
  labelFont:SetPoint("LEFT", DetailFrameCheckbox, "RIGHT", -2, 0)
  labelFont:SetHeight(20)

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
  return DetailFrameButton
end

function REP:FillReputationDetailFrameWithData()
  local factionData = REP:GetFactionDataToBuildReputationlist();
  if not factionData or not REP_Orig_ReputationDetailFrame then return end

  if REP.AfterShadowLands then
    local isMajorFaction = C_Reputation.IsMajorFaction(factionData.factionID);

    if isMajorFaction then
      REP_Orig_ReputationDetailFrame:SetSize(482, 565)
      REP_DetailSecondDivider:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 0, -20)
    else
      REP_Orig_ReputationDetailFrame:SetSize(482, 525)
      REP_DetailSecondDivider:SetPoint("TOPLEFT", REP_DetailFirstDivider, "BOTTOMLEFT", 0, 0)
    end
  else
    REP_Orig_ReputationDetailFrame:SetSize(482, 525)
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
  
  local standingID, barMin, barValue, barMax, isFriend, isMajorFaction

  if REP.AfterShadowLands then
    isMajorFaction = factionID and REP_Orig_IsMajorFaction(factionID)
  end

  if isMajorFaction then
    local majorFactionData = REP_Orig_GetMajorFactionData(factionID)
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

    if REP.AfterCata then
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
    if (name == "Alliance") then
      description = "In a time when chaos and uncertainty reign, the Alliance remains steadfast in its determination to bring light to the darkest corners of the world."
    elseif (name == "Horde") then
      description = "In the Horde, action and strength are valued above diplomacy, and its leaders earn respect by the blade, wasting no time with politics. The brutality of the Horde's champions is focused, giving a voice to those who fight for survival."
    end
  end
  -- REP_ReputationDetailFactionDescription:SetText(description)

  ---------------------------------------------------
  --  CurrentStanding Name + color
  ---------------------------------------------------
  local friendReputationInfo = REP_Friend_Detail(factionID, standingID)
  local factionStandingtext = friendReputationInfo.factionStandingtext
  local isCappedFriendship = friendReputationInfo.isCappedFriendship
  local color

  local isParagon = false
  if REP.AfterMoP then
    if (factionID and REP_Orig_IsFactionParagon(factionID)) then
      isParagon = true
    end
  end

  if isParagon then
    colorID = 9
    color = REP.FACTION_BAR_COLORS[colorID]
    REP_DetailStandingName:SetText(REP_TXT.STAND_LV[9])
  else
    if isMajorFaction then
      color = BLUE_FONT_COLOR
      factionStandingtext = REP_TXT.renown.." "..standingID
    else      
      if isFriend then
        colorID = 5
      else
        colorID = standingID
      end  
      color = REP.FACTION_BAR_COLORS[colorID]
    end

    REP_DetailStandingName:SetText(factionStandingtext)
  end
  REP_DetailStandingName:SetTextColor(color.r, color.g, color.b)

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

      if not REP.AfterShadowLands and GetFriendshipReputation then
        _, friendRep, friendMaxRep, _, _, _, _, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
      else
        local friendshipInfo = REP_Orig_GetFriendshipReputation(factionID)
        if friendshipInfo and friendshipInfo.friendshipFactionID > 0 then
          nextFriendThreshold = friendshipInfo.nextThreshold
        end
      end

      color = REP.FACTION_BAR_COLORS[8]
      REP_DetailStandingNextValue:SetText("(--> "..REP:GetFriendFactionStandingLabel(factionID, nextFriendThreshold)..")")
      REP_DetailStandingToExaltedHeader:SetText("Reputation to max") -- TODO: Add to localization file sometime
    end
  elseif isMajorFaction then
    local majorFactionData = REP_Orig_GetMajorFactionData(factionID);
    local renownLevel = majorFactionData.renownLevel
    barMax = majorFactionData.renownLevelThreshold
    barValue = ((renownLevel - 1) *  majorFactionData.renownLevelThreshold) + barValue
    isCapped = REP_Orig_HasMaximumRenown(factionID)

    local maxFactionLevel = 25

    if(REP.MaxFactionLevel[factionID]) then
      maxFactionLevel = REP.MaxFactionLevel[factionID]
    end

    local maxRenown = maxFactionLevel * barMax
    toExalted = maxRenown - reputationGains.reputationGainedTotal

    if isCapped then
      local currentValue, threshold, rewardQuestID, hasRewardPending = REP_Orig_GetFactionParagonInfo(factionID)
      barMax = threshold
      toExalted = threshold

      REP_DetailStandingNextValue:SetText("")
    else
      REP_DetailStandingNextValue:SetText("(--> "..REP_TXT.renown.." "..(majorFactionData.renownLevel + 1)..")")
    end

    REP_DetailStandingToExaltedHeader:SetText(REP_TXT.renown.." to max")
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
  if not REP_CurrentRepInBag then REP_CurrentRepInBag = 0 end
  if not REP_CurrentRepInBagBank then REP_CurrentRepInBagBank = 0 end
  if not REP_CurrentRepInQuest then REP_CurrentRepInQuest = 0 end

  REP_DetailStandingBagValue:SetText(REP_CurrentRepInBag)
  REP_DetailStandingBagBankValue:SetText(REP_CurrentRepInBagBank)
  REP_DetailStandingQuestsValue:SetText(REP_CurrentRepInQuest)

  ------------------------------
  --  Default checkboxes
  ------------------------------
  REP_DetailShowNonPvPQuestsButton:SetChecked(REP_Data.Global.ShowQuests)
  REP_DetailShowPvPQuestsButton:SetChecked(REP_Data.Global.ShowPvPQuests)
  REP_DetailShowItemsButton:SetChecked(REP_Data.Global.ShowItems)
  REP_DetailShowMobsButton:SetChecked(REP_Data.Global.ShowMobs)
  REP_DetailShowInstancesButton:SetChecked(REP_Data.Global.ShowInstances)
  REP_DetailShowGeneralButton:SetChecked(REP_Data.Global.ShowGeneral)

  if (REP_Orig_ReputationDetailFrame:IsVisible()) then
    REP_BuildUpdateList()
    REP_UpdateList_Update()
  end
end