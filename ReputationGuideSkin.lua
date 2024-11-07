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

function REP:SetReputationDetailFrameAndOptionsSkins()
  if hasElvUILoaded and REP_Orig_ReputationDetailFrame then
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

    E.Skins:HandleScrollBar(REP_DetailListScrollFrameScrollBar)

    if not REP.AfterDragonflight then
      -- Default UI checkboxes
      table.insert(checkboxes, ReputationDetailInactiveCheckBox)
      table.insert(checkboxes, ReputationDetailMainScreenCheckBox)

      E.Skins:HandleCheckBox(ReputationDetailAtWarCheckBox)
      ReputationDetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
      ReputationDetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')
    end

    for _, button in pairs(buttons) do
      E.Skins:HandleButton(button)
    end

    for _, checkbox in pairs(checkboxes) do
      E.Skins:HandleCheckBox(checkbox)
    end
  end
end