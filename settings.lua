local addonName, REP = ...

REP.Tools = {}

local REPT = REP.Tools

REPT.Settings = {
  Panel = CreateFrame("Frame")
}

local REPSettings = REPT.Settings
local panel = REPSettings.Panel

panel.name = addonName
panel:Hide()

---- Fix for removed standard tooltips from the InterfaceOptionsCheckButtonTemplate
local function SetCustomTooltip(self, text)
	self:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(text, nil, nil, nil, nil, true)
		GameTooltip:Show()
	end)

	self:SetScript("OnLeave", function(self)
		if GameTooltip:GetOwner() == self then
			GameTooltip:Hide()
		end
	end)
end

local function checkbox(name, label, description, onclick)
  local check = CreateFrame("CheckButton", "REPCheck_" .. name, panel, "InterfaceOptionsCheckButtonTemplate")
  check:SetScript("OnClick", function(self)
    local checked = self:GetChecked()
    PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
    onclick(self, checked and true or false)
  end)
  check.label = _G[check:GetName() .. "Text"]
  check.label:SetText(label)
  check.tooltipText = label
  check.tooltipRequirement = description

  if REP.AfterShadowLands then
    SetCustomTooltip(check, description)
  end

  return check
end

local function button(text, tooltip, onclick)
  local btn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
  btn:SetText(text)
  btn.tooltipText = tooltip
  btn:SetScript("OnClick", function(self) onclick(self) end)
  btn:SetHeight(24)
  return btn
end

local function HideBlizzOptions()
  HideUIPanel(InterfaceOptionsFrame)
  HideUIPanel(GameMenuFrame)
end

local function REP_ToggleReputationBuff()
  REP_FactionGain = {}
  REP_InitEnFactionGains(REP.GuildName)
  ReputationFrame_Update()
end

local function ToggleMrPopularityRank(lowerRank, higherRank)
  lowerRank:Enable()
  lowerRank:SetAlpha(1)
  higherRank:Enable()
  higherRank:SetAlpha(1)
  
  if REP_Data.Global.GuildRepBuffRankOne then
    higherRank:Disable()
    higherRank:SetAlpha(0.4)
  elseif REP_Data.Global.GuildRepBuffRankTwo then
    lowerRank:Disable()
    lowerRank:SetAlpha(0.4)
  end
end

local function ToggleDarkmoonFaireBuff(buffOne, buffTwo)
  buffOne:Enable()
  buffOne:SetAlpha(1)
  buffTwo:Enable()
  buffTwo:SetAlpha(1)

  if REP_Data.Global.DarkmoonfaireWeeRepBuff then
    buffTwo:Disable()
    buffTwo:SetAlpha(0.4)
  elseif REP_Data.Global.DarkmoonfaireHatRepBuff then
    buffOne:Disable()
    buffOne:SetAlpha(0.4)
  end
end

function REPSettings:Open()
  if REP.AfterDragonflight then
    Settings.OpenToCategory(REP.settingsCategory.ID)
  else
    InterfaceOptionsFrame_OpenToCategory(panel)
  end
end

function REPSettings:Show()
  ---------------------------
  -- General options --
  ---------------------------
  ---- General options init
  local title = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  title:SetText(addonName)
  local showMissing = checkbox("EnableMissingBox", REP_TXT.showMissing, REP_TXT.elements.tip.REP_EnableMissingBox, function(_, checked) REP_Data.Global.ShowMissing = checked end)
  local extendDetails = checkbox("ExtendDetailsBox", REP_TXT.extendDetails, REP_TXT.elements.tip.REP_ExtendDetailsBox, function(_, checked) REP_Data.Global.ExtendDetails = checked end)
  local gainToChat = checkbox("GainToChatBox", REP_TXT.gainToChat, REP_TXT.elements.tip.REP_GainToChatBox, function(_, checked) REP_Data.Global.WriteChatMessage = checked end)
  local showPreviewRep = checkbox("ShowPreviewRepBox", REP_TXT.showPreviewRep, REP_TXT.elements.tip.REP_ShowPreviewRepBox, function(_, checked) REP_Data.Global.ShowPreviewRep = checked end)
  local switchFactionBar = checkbox("SwitchFactionBarBox", REP_TXT.switchFactionBar, REP_TXT.elements.tip.REP_SwitchFactionBarBox, function(_, checked) REP_Data.Global.SwitchFactionBar = checked end)
  local silentSwitch = checkbox("SilentSwitchBox", REP_TXT.silentSwitch, REP_TXT.elements.tip.REP_SilentSwitchBox, function(_, checked) REP_Data.Global.SilentSwitch = checked end)
  ---- General options positioning
  title:SetPoint("TOPLEFT", 16, -16)
  showMissing:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -16)
  extendDetails:SetPoint("TOPLEFT", showMissing, "BOTTOMLEFT", 0, 0)
  gainToChat:SetPoint("TOPLEFT", extendDetails, "BOTTOMLEFT", 0, 0)
  switchFactionBar:SetPoint("TOPLEFT", showPreviewRep, "BOTTOMLEFT", 0, 0)  
  silentSwitch:SetPoint("TOPLEFT", switchFactionBar, "BOTTOMLEFT", 20, 0)
  ------------------------------
  -- Reputation Buffs options --
  ------------------------------
  ---- Reputation Buffs options init
  local noGuildGain, noGuildSwitch, enableParagonBar, wickermanRepBuff, harvestBountyRepBuff, guildRepBuffRankOne, guildRepBuffRankTwo, darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff
  local buffsDivider = self:CreateLine()
  local buffTitle = self:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
  local buffSubTitle = self:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
  ---- Buff divider
  buffsDivider:SetColorTexture(0.82, 0.82, 0.82, 0.2)
  buffsDivider:SetThickness(1)
  ---- Buff title
  buffTitle:SetText(REP_TXT.settings.buffTitle)
  buffTitle:SetPoint("TOPLEFT", buffsDivider, "BOTTOMLEFT", 0, -16)
  ---- Buff subtitle
  buffSubTitle:SetJustifyH("LEFT")
  buffSubTitle:SetText(REP_TXT.settings.buffSubTitle)
  buffSubTitle:SetWidth(640)
  buffSubTitle:SetTextColor(1, 1, 1, 0.8)
  buffSubTitle:SetPoint("TOPLEFT", buffTitle, "BOTTOMLEFT", 0, -10)
  buffSubTitle:SetWordWrap(true)

  ---- Reputation Buffs options init part 2
  if REP.AfterTBC then
    harvestBountyRepBuff = checkbox("HarvestBountyRepBuffBox", REP_TXT.settings.harvestBountyRepBuff, REP_TXT.settings.info.harvestBountyRepBuff, function(_, checked) REP_Data.Global.HarvestBountyRepBuff = checked REP_ToggleReputationBuff() end)
  end

  if REP.AfterWotlk then
    noGuildGain = checkbox("NoGuildGainBox", REP_TXT.noGuildGain, REP_TXT.elements.tip.REP_NoGuildGainBox, function(_, checked) REP_Data.Global.NoGuildGain = checked end)
    noGuildSwitch = checkbox("NoGuildSwitchBox", REP_TXT.noGuildSwitch, REP_TXT.elements.tip.REP_NoGuildSwitchBox, function(_, checked) REP_Data.Global.NoGuildSwitch = checked end)
    
    if REP.IsAlliance then -- Alliance
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffUnburdened, REP_TXT.settings.info.wickermanRepBuffUnburdened, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)
    else -- Horde
      wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuffGrimVisage, REP_TXT.settings.info.wickermanRepBuffGrimVisage, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)
    end

    noGuildGain:SetPoint("TOPLEFT", gainToChat, "BOTTOMLEFT", 20, 0)
    showPreviewRep:SetPoint("TOPLEFT", noGuildGain, "BOTTOMLEFT", -20, 0)
    noGuildSwitch:SetPoint("TOPLEFT", silentSwitch, "BOTTOMLEFT", 0, 0)
    
    if not REP.AfterMoP then
      guildRepBuffRankOne = checkbox("GuildRepBuffRankOneBox", REP_TXT.settings.MrPopularityRankOne, REP_TXT.settings.info.MrPopularityRankOne, function(_, checked) REP_Data.Global.GuildRepBuffRankOne = checked ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo) REP_ToggleReputationBuff() end)
      guildRepBuffRankTwo = checkbox("GuildRepBuffRankTwoBox", REP_TXT.settings.MrPopularityRankTwo, REP_TXT.settings.info.MrPopularityRankTwo, function(_, checked) REP_Data.Global.GuildRepBuffRankTwo = checked ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo) REP_ToggleReputationBuff() end)
      guildRepBuffRankOne:SetPoint("TOPLEFT", harvestBountyRepBuff, "BOTTOMLEFT", 0, 0)
      guildRepBuffRankTwo:SetPoint("TOPLEFT", guildRepBuffRankOne, "BOTTOMLEFT", 0, 0)
      ToggleMrPopularityRank(guildRepBuffRankOne, guildRepBuffRankTwo)
    end

    if REP.AfterCata then
      darkmoonfaireWeeRepBuff = checkbox("DarkmoonFaireWeeRepBuffBox", REP_TXT.settings.DarkmoonFaireWeeRepBuff, REP_TXT.settings.info.DarkmoonFaireWeeRepBuff, function(_, checked) REP_Data.Global.DarkmoonfaireWeeRepBuff = checked REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
      darkmoonfaireHatRepBuff = checkbox("DarkmoonFaireHatRepBuffBox", REP_TXT.settings.DarkmoonFaireHatRep, REP_TXT.settings.info.DarkmoonFaireHatRep, function(_, checked) REP_Data.Global.DarkmoonfaireHatRepBuff = checked REP_ToggleReputationBuff() ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff) end)
      ToggleDarkmoonFaireBuff(darkmoonfaireWeeRepBuff, darkmoonfaireHatRepBuff)

      if REP.AfterMoP then
        darkmoonfaireWeeRepBuff:SetPoint("TOPLEFT", harvestBountyRepBuff, "BOTTOMLEFT", 0, 0)
      else
        darkmoonfaireWeeRepBuff:SetPoint("TOPLEFT", guildRepBuffRankTwo, "BOTTOMLEFT", 0, 0)
      end

      darkmoonfaireHatRepBuff:SetPoint("TOPLEFT", darkmoonfaireWeeRepBuff, "BOTTOMLEFT", 0, 0)
    end

    if REP.AfterWoD then
      enableParagonBar = checkbox("EnableParagonBarBox", REP_TXT.EnableParagonBar, REP_TXT.elements.tip.REP_EnableParagonBarBox, function(_, checked) REP_Data.Global.ShowParagonBar = checked end)
      enableParagonBar:SetPoint("TOPLEFT", noGuildSwitch, "BOTTOMLEFT", -20, 0)

      buffsDivider:SetStartPoint("BOTTOMLEFT", enableParagonBar, 0, -16)
      buffsDivider:SetEndPoint("BOTTOMRIGHT", enableParagonBar, 400, -16)
    else
      buffsDivider:SetStartPoint("BOTTOMLEFT", noGuildSwitch, -15, -16)
      buffsDivider:SetEndPoint("BOTTOMRIGHT", noGuildSwitch, 400, -16)
    end
  else
    wickermanRepBuff = checkbox("WickermanRepBuffBox", REP_TXT.settings.wickermanRepBuff, REP_TXT.settings.info.wickermanRepBuff, function(_, checked) REP_Data.Global.WickermanRepBuff = checked REP_ToggleReputationBuff() end)

    showPreviewRep:SetPoint("TOPLEFT", gainToChat, "BOTTOMLEFT", 0, 0)
    buffsDivider:SetStartPoint("BOTTOMLEFT", silentSwitch, -14, -16)
    buffsDivider:SetEndPoint("BOTTOMRIGHT", silentSwitch, 400, -16)
  end

  wickermanRepBuff:SetPoint("TOPLEFT", buffSubTitle, "BOTTOMLEFT", -5, -16)
  if REP.AfterTBC then
    harvestBountyRepBuff:SetPoint("TOPLEFT", wickermanRepBuff, "BOTTOMLEFT", 0, 0)
  end

  local function initOptions()
    showMissing:SetChecked(REP_Data.Global.ShowMissing)
    extendDetails:SetChecked(REP_Data.Global.ExtendDetails)
    gainToChat:SetChecked(REP_Data.Global.WriteChatMessage)
    showPreviewRep:SetChecked(REP_Data.Global.ShowPreviewRep)
    switchFactionBar:SetChecked(REP_Data.Global.SwitchFactionBar)
    silentSwitch:SetChecked(REP_Data.Global.SilentSwitch)
    wickermanRepBuff:SetChecked(REP_Data.Global.WickermanRepBuff)

    if REP.AfterTBC then
      harvestBountyRepBuff:SetChecked(REP_Data.Global.HarvestBountyRepBuff)
    end

    if REP.AfterWotlk then
      noGuildGain:SetChecked(REP_Data.Global.NoGuildGain)
      noGuildSwitch:SetChecked(REP_Data.Global.NoGuildSwitch)
      
      if not REP.AfterMoP then
        guildRepBuffRankOne:SetChecked(REP_Data.Global.GuildRepBuffRankOne)
        guildRepBuffRankTwo:SetChecked(REP_Data.Global.GuildRepBuffRankTwo)
      end
    end

    if REP.AfterCata then
      darkmoonfaireWeeRepBuff:SetChecked(REP_Data.Global.DarkmoonfaireWeeRepBuff)
      darkmoonfaireHatRepBuff:SetChecked(REP_Data.Global.DarkmoonfaireHatRepBuff)
    end

    if REP.AfterWoD then
      enableParagonBar:SetChecked(REP_Data.Global.ShowParagonBar)
    end
  end

  initOptions()
  self:SetScript("OnShow", initOptions)
end

panel:SetScript("OnShow", function(self) REPSettings.Show(self) end)

if InterfaceOptions_AddCategory then
	InterfaceOptions_AddCategory(panel)
else
	local category, layout = Settings.RegisterCanvasLayoutCategory(panel, panel.name);
	Settings.RegisterAddOnCategory(category);
	REP.settingsCategory = category
end