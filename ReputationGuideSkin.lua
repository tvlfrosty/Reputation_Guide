---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, REP = ...

-----------------------------
-- Other Addon loaded vars --
-----------------------------
local hasElvUILoaded = false

if REP.AfterDragonflight then
  hasElvUILoaded = C_AddOns.IsAddOnLoaded("ElvUI")
else
  hasElvUILoaded = IsAddOnLoaded("ElvUI")
end

if hasElvUILoaded then
  local E = unpack(_G.ElvUI)

  local buttons = {
		REP_OptionsButton,
		REP_DetailShowAllButton,
		REP_DetailExpandButton,
		REP_DetailShowNoneButton,
		REP_DetailCollapseButton,
		REP_DetailSupressNoneFactionButton,
		REP_DetailSupressNoneGlobalButton,
		REP_DetailClearSessionGainButton,
	}

	local checkboxes = {
    -- Custom stand-alone checkboxes
    REP_OrderByStandingCheckBox,
    -- Settings checkboxes
		REPCheck_EnableMissingBox,
		REPCheck_ExtendDetailsBox,
		REPCheck_GainToChatBox,
		REPCheck_NoGuildGainBox,
		REPCheck_SupressOriginalGainBox,
		REPCheck_ShowPreviewRepBox,
		REPCheck_SwitchFactionBarBox,
		REPCheck_SilentSwitchBox,
		REPCheck_NoGuildSwitchBox,
    REPCheck_EnableParagonBarBox,
    -- DetailFrame checkboxes
		REP_DetailShowNonPvPQuestsButton,
    REP_DetailShowPvPQuestButton,
		REP_DetailShowInstancesButton,
		REP_DetailShowMobsButton,
		REP_DetailShowItemsButton,
		REP_DetailShowGeneralButton,
		-- Default UI checkboxes
    ReputationDetailInactiveCheckBox,
		ReputationDetailMainScreenCheckBox,
	}

  REP_ReputationDetailFrame:StripTextures()
  REP_ReputationDetailFrame:SetTemplate("Transparent")
  
  E.Skins:HandleScrollBar(REP_DetailListScrollFrameScrollBar)
  E.Skins:HandleCloseButton(REP_ReputationDetailCloseButton)
  E.Skins:HandleCheckBox(ReputationDetailAtWarCheckBox)

  ReputationDetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
  ReputationDetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')  

  for _, button in pairs(buttons) do
    E.Skins:HandleButton(button)
  end

  for _, checkbox in pairs(checkboxes) do
    E.Skins:HandleCheckBox(checkbox)
  end
end
