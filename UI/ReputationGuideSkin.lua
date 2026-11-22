---------------------------
-- Initialize Addon vars --
---------------------------
local addonName, REP = ...

---------------------------
-- ElvUI skins for the frames of the addon (only when ElvUI is loaded, every call is protected so an
-- ElvUI change can't break the addon). REP:ElvSkin(kind, object) is called where the objects are created.
---------------------------
local function GetElvUI()
  local elv = _G.ElvUI
  if not elv then return end
  local ok, E = pcall(unpack, elv)
  if not ok or not E or not E.GetModule then return end
  local okSkins, S = pcall(E.GetModule, E, "Skins")
  if not okSkins or not S then return end
  return E, S
end

function REP:HasElvUISkins()
  return GetElvUI() ~= nil
end

local handlers = {
  -- A panel: own textures gone, ElvUI's transparent backdrop.
  panel = function(E, S, frame)
    if frame.NineSlice then frame.NineSlice:SetAlpha(0) end
    if frame.Inset then
      if frame.Inset.StripTextures then frame.Inset:StripTextures() end
      if frame.Inset.NineSlice then frame.Inset.NineSlice:SetAlpha(0) end
    end
    frame:StripTextures()
    frame:SetTemplate("Transparent")
    frame.repElvBackdropColor = { frame:GetBackdropColor() }
  end,
  close = function(E, S, button) S:HandleCloseButton(button) end,
  button = function(E, S, button) S:HandleButton(button) end,
  check = function(E, S, check) S:HandleCheckBox(check) end,
  dropdown = function(E, S, dropdown, width) S:HandleDropDownBox(dropdown, width) end,
  -- MinimalScrollBar (description, ordered list)
  trimScrollBar = function(E, S, bar) S:HandleTrimScrollBar(bar) end,
  -- Old style scroll bar (list of sources, options pages)
  scrollBar = function(E, S, bar) S:HandleScrollBar(bar) end,
  editBox = function(E, S, box) S:HandleEditBox(box) end,
  slider = function(E, S, slider) S:HandleSliderFrame(slider) end,
  -- Plain status bar: ElvUI's bar texture and border.
  statusBar = function(E, S, bar)
    if not bar.SetStatusBarTexture then return end
    bar:SetStatusBarTexture(E.media.normTex)
    if E.RegisterStatusBar then E:RegisterStatusBar(bar) end
    if bar.CreateBackdrop and not bar.backdrop then bar:CreateBackdrop() end
    if bar.repBorder then bar.repBorder:Hide() end
  end,
  -- A text box with a backdrop of its own (description of a manual line).
  box = function(E, S, frame)
    frame:StripTextures()
    frame:SetTemplate()
  end,
}

function REP:ElvSkin(kind, object, ...)
  if not object or object.repElvSkinned then return end
  local handler = handlers[kind]
  if not handler then return end
  local E, S = GetElvUI()
  if not E then return end

  local ok = pcall(handler, E, S, object, ...)
  if ok then object.repElvSkinned = kind end
end

function REP:ElvSkinAll(kind, objects)
  for _, object in pairs(objects) do REP:ElvSkin(kind, object) end
end

function REP:SetReputationDetailFrameAndOptionsSkins()
  -- The reset and delete buttons of the character profiles are icons, they stay as they are.
  if REP.hasElvUILoaded then
    REP:ElvSkin("check", REP_OrderByStandingCheckBox)
  end

  -- The old detail frame (clients without the panel of the addon).
  if REP.hasElvUILoaded and REP.Orig_ReputationDetailFrame and not REP.UseDetailPanel and not REP.UseClassicPanel then
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
      REP_DetailManualEntryButton,
    }


    local checkboxes = {
      -- Custom stand-alone checkboxes
      REP_OrderByStandingCheckBox,
      -- Settings checkboxes
      REPCheck_EnableMissingBox,
      REPCheck_ExtendDetailsBox,
      REPCheck_ShowStandingBarBox,
      REPCheck_AllowDetailResizeBox,
      REPCheck_ShowDetailDescriptionBox,
      REPCheck_ShowDetailStatisticsBox,
      REPCheck_ExpandSourcesByDefaultBox,
      REPCheck_GainToChatBox,
      REPCheck_NoGuildGainBox,
      REPCheck_SupressOriginalGainBox,
      REPCheck_ShowPreviewRepBox,
      REPCheck_SwitchFactionBarBox,
      REPCheck_SilentSwitchBox,
      REPCheck_NoGuildSwitchBox,
      REPCheck_EnableParagonBarBox,
      REPCheck_ShowAllFactionsGainsBox,
      REPCheck_ShowSyncMessagesBox,
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

    REP.Orig_ReputationDetailFrame:StripTextures()
    REP.Orig_ReputationDetailFrame:SetTemplate("Transparent")

    S:HandleScrollBar(REP_DetailListScrollFrameScrollBar)

    if not REP.UseModernReputationUI then
      -- Default UI checkboxes
      table.insert(checkboxes, REP.Orig_DetailInactiveCheckBox)
      table.insert(checkboxes, REP.Orig_DetailMainScreenCheckBox)

      S:HandleCheckBox(REP.Orig_DetailAtWarCheckBox)
      REP.Orig_DetailAtWarCheckBox:SetCheckedTexture('Interface\\Buttons\\UI-CheckBox-SwordCheck')
      REP.Orig_DetailAtWarCheckBox:SetDisabledCheckedTexture('Interface\\Buttons\\UI-CheckBox-Check-Disabled')
    end

    REP:ElvSkinAll("button", buttons)
    REP:ElvSkinAll("check", checkboxes)
  end
end