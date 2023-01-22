if IsAddOnLoaded("ElvUI") then
  local E = unpack(_G.ElvUI)

  local buttons = {
		REP_OptionsButton,
		REP_ShowAllButton,
		REP_ExpandButton,
		REP_ShowNoneButton,
		REP_CollapseButton,
		REP_SupressNoneFactionButton,
		REP_SupressNoneGlobalButton,
		REP_ClearSessionGainButton,
	}

	local checkboxes = {
		REP_OrderByStandingCheckBox,
		REP_EnableMissingBox,
		REP_ExtendDetailsBox,
		REP_GainToChatBox,
		REP_NoGuildGainBox,
		REP_SupressOriginalGainBox,
		REP_ShowPreviewRepBox,
		REP_SwitchFactionBarBox,
		REP_SilentSwitchBox,
		REP_NoGuildSwitchBox,
		REP_ReputationDetailInactiveCheckBox,
		REP_ReputationDetailMainScreenCheckBox,
		REP_ShowQuestButton,
		REP_ShowInstancesButton,
		REP_ShowMobsButton,
		REP_ShowItemsButton,
		REP_ShowGeneralButton,
		REP_EnableParagonBarBox,
		REP_ShowDarkmoonFaireButton,
	}

  REP_ReputationDetailFrame:StripTextures()
  REP_ReputationDetailFrame:SetTemplate("Transparent")

  REP_OptionsFrame:StripTextures()
  REP_OptionsFrame:SetTemplate("Transparent")

  E.Skins:HandleCloseButton(REP_OptionsFrameClose)
  E.Skins:HandleCloseButton(REP_ReputationDetailCloseButton)

  E.Skins:HandleCheckBox(REP_ReputationDetailAtWarCheckBox)
  REP_ReputationDetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
  REP_ReputationDetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')

  E.Skins:HandleScrollBar(REP_UpdateListScrollFrameScrollBar)

  for _, button in pairs(buttons) do
    E.Skins:HandleButton(button)
  end

  for _, checkbox in pairs(checkboxes) do
    E.Skins:HandleCheckBox(checkbox)
  end
end
