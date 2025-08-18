---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, REP = ...

function REP:SetReputationDetailFrameAndOptionsSkins()
  if REP.hasElvUILoaded and REP_Orig_ReputationDetailFrame then
    local E = unpack(_G.ElvUI)
    local S = E:GetModule('Skins')

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

    for key, value in pairs(REP.renderedProfileFrames) do
      -- Character profile buttons
      table.insert(buttons, value.resetButton)
      table.insert(buttons, value.deleteButton)
    end

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
      REPCheck_ShowAllFactionsGainsBox,
      -- Buffs checkboxes
      REPCheck_HarvestBountyRepBuffBox,
      REPCheck_WickermanRepBuffBox,
      REPCheck_GuildRepBuffRankOneBox,
      REPCheck_GuildRepBuffRankTwoBox,
      REPCheck_DarkmoonFaireWeeRepBuffBox,
      REPCheck_DarkmoonFaireHatRepBuffBox,
      -- DetailFrame checkboxes
      REP_DetailShowNonPvPQuestsButton,
      REP_DetailShowPvPQuestsButton,
      REP_DetailShowInstancesButton,
      REP_DetailShowMobsButton,
      REP_DetailShowItemsButton,
      REP_DetailShowGeneralButton,
    }

    REP_Orig_ReputationDetailFrame:StripTextures()
    REP_Orig_ReputationDetailFrame:SetTemplate("Transparent")

    S:HandleScrollBar(REP_DetailListScrollFrameScrollBar)

    if not REP.AfterDragonflight then
      -- Default UI checkboxes
      table.insert(checkboxes, REP_Orig_DetailInactiveCheckBox)
      table.insert(checkboxes, REP_Orig_DetailMainScreenCheckBox)

      S:HandleCheckBox(REP_Orig_DetailAtWarCheckBox)
      REP_Orig_DetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
      REP_Orig_DetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')
    end

    for _, button in pairs(buttons) do
      S:HandleButton(button)
    end

    for _, checkbox in pairs(checkboxes) do
      S:HandleCheckBox(checkbox)
    end
  end
end