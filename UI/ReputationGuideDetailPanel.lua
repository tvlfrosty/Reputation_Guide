-------------------------------------------------------------------------------
-- Details panel of ReputationGuide (World of Warcraft: Forever, retail and the Classic clients with the menu API).
-- The default reputation details can't be extended, so ReputationGuide shows its own (wider) panel instead:
--  * Forever: it replaces the details side pane of the character frame.
--  * Retail: it replaces the small details popup next to the reputation frame.
--  * Classic: it replaces the default details frame (shown and hidden by the addon's reputation list).
-- Only addon owned frames/variables and widget calls (size, anchors, alpha) are used on default frames,
-- anything else taints the default UI, and Midnight's secret values turn that taint into errors.
-------------------------------------------------------------------------------
local addonName, REP = ...

local PANEL_WIDTH = 560
local PANEL_HEIGHT = 484
local CLASSIC_PANEL_WIDTH = 460
local CLASSIC_PANEL_HEIGHT = 424
local MIN_PANEL_WIDTH = 240
local MIN_PANEL_HEIGHT = 300
local MIN_LIST_ROWS = 3
local MAX_PANEL_SIZE = 1200
local PADDING = 16
-- Font size of the sources list (setting): offset to the list font and the row height.
local LIST_FONT_SIZES = { small = { offset = -2, rowHeight = 14 }, normal = { offset = 0, rowHeight = 16 }, large = { offset = 2, rowHeight = 19 } }
local LIST_FONT_REGIONS = { "Label", "Times", "Name", "Rep", "ItemTimes", "ItemName", "TotalTimes" }
local STAT_ROW_HEIGHT = 15

local function FormatNumber(value)
  if type(value) ~= "number" then return tostring(value or "") end
  if BreakUpLargeNumbers then return BreakUpLargeNumbers(value) end
  return tostring(value)
end

local function ToColor(color)
  if not color then return HIGHLIGHT_FONT_COLOR end
  if color.GetRGB then return color end
  return CreateColor(color.r, color.g, color.b)
end

local function CreateLabel(parent, font, justify)
  local text = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
  text:SetJustifyH(justify or "LEFT")
  text:SetWordWrap(false)
  return text
end

local function CreateCheckbox(parent, label, onClick, tooltip)
  local ok, check = pcall(CreateFrame, "CheckButton", nil, parent, "MinimalCheckboxTemplate")
  if not ok or not check then check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate") end
  check:SetSize(22, 22)
  REP:ElvSkin("check", check)

  check.Label = CreateLabel(check, "GameFontHighlightSmall")
  check.Label:SetPoint("LEFT", check, "RIGHT", 2, 0)
  check.Label:SetText(label)
  check.labelText = label
  check:SetHitRectInsets(0, -(check.Label:GetStringWidth() + 6), 0, 0)

  -- Shows the label only when it fits in the given width, otherwise the label is in the tooltip.
  check.FitLabel = function(self, width)
    local fits = self.Label:GetStringWidth() <= width
    self.Label:SetShown(fits)
    self:SetHitRectInsets(0, fits and -(self.Label:GetStringWidth() + 6) or 0, 0, 0)
  end

  check:SetScript("OnClick", function(self)
    REP:PlayCheckBoxSound(self:GetChecked())
    onClick(self, self:GetChecked() and true or false)
  end)

  check:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(self.labelText or "", 1, 1, 1)
    if tooltip then GameTooltip:AddLine(tooltip, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true) end
    GameTooltip:Show()
  end)
  check:SetScript("OnLeave", function() GameTooltip:Hide() end)

  check.SetEnabledState = function(self, enabled, color)
    self:SetEnabled(enabled)
    local c = enabled and (color or HIGHLIGHT_FONT_COLOR) or GRAY_FONT_COLOR
    self.Label:SetTextColor(c:GetRGB())
  end

  return check
end

-- Label + right aligned value, the value is stored in the global the rest of the addon fills.
-- columnRight: a point at the right side of the column, the rows follow the width of the panel.
local function CreateStatRow(parent, globalLabel, globalValue, labelText, anchor, columnRight)
  local label = CreateLabel(parent, "GameFontNormalSmall")
  label:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
  label:SetPoint("RIGHT", columnRight, "RIGHT", -64, 0)
  label:SetText(labelText)

  local value = CreateLabel(parent, "GameFontHighlightSmall", "RIGHT")
  value:SetPoint("TOP", label, "TOP")
  value:SetPoint("RIGHT", columnRight, "RIGHT", 0, 0)

  _G[globalLabel] = label
  _G[globalValue] = value

  return label
end

-- Forever has a modern reputation bar template, retail's template is the small classic bar,
-- so retail gets a simple bar with the same methods.
function REP:CreateStandingBar(parent)
  if ColoredProgressBarMixin then
    return CreateFrame("Frame", nil, parent, "ReputationBarTemplate")
  end

  local bar = CreateFrame("StatusBar", nil, parent)
  bar:SetHeight(20)
  bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
  bar:SetMinMaxValues(0, 1)

  local background = bar:CreateTexture(nil, "BACKGROUND")
  background:SetAllPoints()
  background:SetColorTexture(0, 0, 0, 0.6)

  local border = CreateFrame("Frame", nil, bar, "BackdropTemplate")
  border:SetPoint("TOPLEFT", -1, 1)
  border:SetPoint("BOTTOMRIGHT", 1, -1)
  border:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
  border:SetBackdropBorderColor(0.35, 0.35, 0.35, 1)
  bar.repBorder = border
  REP:ElvSkin("statusBar", bar)

  bar.Text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  bar.Text:SetPoint("CENTER")

  bar.UpdateBarValues = function(self, minValue, maxValue, value)
    self:SetMinMaxValues(minValue, maxValue)
    self:SetValue(value)
  end
  bar.UpdateBarColor = function(self, color) self:SetStatusBarColor(color:GetRGB()) end
  bar.SetText = function(self, text) self.Text:SetText(text) end

  return bar
end

local function ToggleFactionAtWar(index)
  if C_Reputation and C_Reputation.ToggleFactionAtWar then
    C_Reputation.ToggleFactionAtWar(index)
  elseif FactionToggleAtWar then
    FactionToggleAtWar(index)
  end
end

local function SetWatchedFaction(index, factionID)
  if C_Reputation and C_Reputation.SetWatchedFactionByIndex then
    if index and index > 0 then
      C_Reputation.SetWatchedFactionByIndex(index)
    elseif factionID and C_Reputation.SetWatchedFactionByID then
      C_Reputation.SetWatchedFactionByID(factionID)
    else
      C_Reputation.SetWatchedFactionByIndex(0)
    end
  elseif SetWatchedFactionIndex then
    SetWatchedFactionIndex(index or 0)
  end
end

-- Small menu button (Classic): the dropdown template is too large next to the Classic fonts.
local function CreateCompactMenuButton(parent, text)
  local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  button:SetHeight(20)
  button:SetNormalFontObject("GameFontHighlightSmall")
  button:SetHighlightFontObject("GameFontHighlightSmall")
  button:SetDisabledFontObject("GameFontDisableSmall")
  button:SetText(text)
  REP:ElvSkin("button", button)

  local arrow = button:CreateTexture(nil, "ARTWORK")
  arrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
  arrow:SetSize(10, 10)
  arrow:SetPoint("RIGHT", button, "RIGHT", -6, 0)

  local fontString = button:GetFontString()
  if fontString then
    fontString:ClearAllPoints()
    fontString:SetPoint("CENTER", button, "CENTER", -5, 0)
    button:SetWidth(math.ceil(fontString:GetStringWidth()) + 32)
  else
    button:SetWidth(70)
  end

  return button
end

-- Classic clients use the panel when they have the menu API (dropdowns) and backdrops.
function REP:CanUseClassicDetailPanel()
  return MenuUtil ~= nil and BackdropTemplateMixin ~= nil and ReputationFrame ~= nil
end

-------------------------------------------------------------------------------
-- Panel
-------------------------------------------------------------------------------
function REP:CreateDetailPanel()
  if REP_DetailPanel then return REP_DetailPanel end

  local isClassic = REP.UseClassicPanel
  local panelWidth = isClassic and CLASSIC_PANEL_WIDTH or PANEL_WIDTH
  local frame

  if isClassic then
    -- Same frame style (border and rock background) as the Classic character frame next to it.
    local ok, created = pcall(CreateFrame, "Frame", "REP_DetailPanel", ReputationFrame, "ButtonFrameTemplate")
    if ok and created then
      frame = created
      if ButtonFrameTemplate_HidePortrait then pcall(ButtonFrameTemplate_HidePortrait, frame) end
      -- Dark inset (as the list of the character frame) below the title bar.
      if frame.Inset then
        frame.Inset:ClearAllPoints()
        frame.Inset:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -24)
        frame.Inset:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -6, 4)
      end
      if frame.CloseButton then frame.CloseButton:SetScript("OnClick", function() frame:Hide() end) end
      REP:ElvSkin("panel", frame)
      REP:ElvSkin("close", frame.CloseButton)
      frame.TitleFont = frame.TitleText or (frame.TitleContainer and frame.TitleContainer.TitleText)
    else
      frame = _G.REP_DetailPanel or CreateFrame("Frame", "REP_DetailPanel", ReputationFrame, "BackdropTemplate")
      frame:SetBackdrop({
        bgFile = "Interface\\FrameGeneral\\UI-Background-Rock",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 256, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
      })

      local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
      close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
      close:SetScript("OnClick", function() frame:Hide() end)
      REP:ElvSkin("panel", frame)
      REP:ElvSkin("close", close)
    end

    -- Escape closes the details first, as it does with the default details frame.
    if UISpecialFrames then table.insert(UISpecialFrames, "REP_DetailPanel") end
  else
    frame = CreateFrame("Frame", "REP_DetailPanel", ReputationFrame, "DefaultPanelFlatTemplate")
  end

  frame:SetFrameStrata("HIGH")
  frame:SetToplevel(true)
  frame:EnableMouse(true)
  frame:SetWidth(panelWidth)
  frame:Hide()

  if isClassic then
    -- Where the default details frame sits (directly next to the visible part of the character frame).
    local x, y = -31, -12
    if ReputationDetailFrame and ReputationDetailFrame.GetPoint then
      local point, relativeTo, relativePoint, offsetX, offsetY = ReputationDetailFrame:GetPoint(1)
      if point == "TOPLEFT" and relativeTo == ReputationFrame and relativePoint == "TOPRIGHT" and offsetX and offsetY then
        x, y = offsetX, offsetY
      end
    end
    frame.anchorX, frame.anchorY = x, y
    frame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", x, y)
    frame:SetHeight(CLASSIC_PANEL_HEIGHT)
  else
    -- Docked to the right of the character frame. While the panel is open the character frame is shown at its
    -- collapsed width (only the faction list), the default details pane underneath is covered by this panel.
    frame.anchorX, frame.anchorY = REP.IsForever and 0 or 2, 0
    frame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", frame.anchorX, frame.anchorY)
    frame:SetHeight(PANEL_HEIGHT)

    if frame.SetTitle then
      frame:SetTitle(addonName)
    elseif frame.TitleContainer and frame.TitleContainer.TitleText then
      frame.TitleContainer.TitleText:SetText(addonName)
    end

    -- The flat panel background is translucent, keep the character frame behind it from showing through.
    local backgroundParent = type(frame.Bg) == "table" and frame.Bg or frame
    local solidBackground = backgroundParent:CreateTexture(nil, "BACKGROUND", nil, -8)
    solidBackground:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -20)
    solidBackground:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
    solidBackground:SetColorTexture(0.05, 0.05, 0.05, 1)
    frame.solidBackground = solidBackground

    if REP:HasElvUISkins() then
      solidBackground:Hide()
      REP:ElvSkin("panel", frame)
    end
  end

  local padding = isClassic and 14 or PADDING
  frame.defaultWidth = panelWidth
  frame.defaultHeight = isClassic and CLASSIC_PANEL_HEIGHT or PANEL_HEIGHT

  ---------------------------------
  -- Header: name, standing, description
  ---------------------------------
  if isClassic and frame.TitleFont then
    -- The faction name is the title of the frame, that leaves more room for the list.
    frame.FactionName = frame.TitleFont

    REP_DetailStandingName = CreateLabel(frame, "GameFontHighlight")
    REP_DetailStandingName:SetPoint("TOPLEFT", frame, "TOPLEFT", padding, -30)

    REP_DetailStandingNextValue = CreateLabel(frame, "GameFontHighlightSmall", "RIGHT")
    REP_DetailStandingNextValue:SetPoint("BOTTOM", REP_DetailStandingName, "BOTTOM", 0, 0)
    REP_DetailStandingNextValue:SetPoint("RIGHT", frame, "RIGHT", -padding, 0)
  else
    frame.FactionName = CreateLabel(frame, "GameFontNormalLarge")
    frame.FactionName:SetPoint("TOPLEFT", padding, isClassic and -20 or -32)
    frame.FactionName:SetPoint("RIGHT", frame, "RIGHT", -(padding + (isClassic and 16 or 0)), 0)

    REP_DetailStandingName = CreateLabel(frame, "GameFontHighlight")
    REP_DetailStandingName:SetPoint("TOPLEFT", frame.FactionName, "BOTTOMLEFT", 0, -4)

    REP_DetailStandingNextValue = CreateLabel(frame, "GameFontHighlightSmall", "RIGHT")
    REP_DetailStandingNextValue:SetPoint("BOTTOMRIGHT", frame.FactionName, "BOTTOMRIGHT", 0, 0)
  end

  if isClassic then
    -- The Classic clients have no scrolling text template, the descriptions there are short.
    frame.Description = CreateLabel(frame, "GameFontHighlightSmall")
    frame.Description:SetWordWrap(true)
    frame.Description:SetJustifyV("TOP")
    if frame.Description.SetMaxLines then frame.Description:SetMaxLines(4) end
    frame.Description:SetPoint("TOPLEFT", REP_DetailStandingName, "BOTTOMLEFT", 0, -4)
    frame.Description:SetPoint("RIGHT", frame, "RIGHT", -padding, 0)
    -- No height set: with a left and right anchor the text sets the height, so the bar below always follows it.
  else
    frame.Description = CreateFrame("Frame", nil, frame, "REP_ScrollingDescriptionTemplate")
    frame.Description:SetPoint("TOPLEFT", REP_DetailStandingName, "BOTTOMLEFT", 0, -8)
    frame.Description:SetPoint("RIGHT", frame, "RIGHT", -(PADDING + 14), 0)
    frame.Description:SetHeight(44)

    frame.DescriptionScrollBar = CreateFrame("EventFrame", nil, frame, "REP_MinimalScrollBarTemplate")
    frame.DescriptionScrollBar:SetPoint("TOPLEFT", frame.Description, "TOPRIGHT", 4, -1)
    frame.DescriptionScrollBar:SetPoint("BOTTOMLEFT", frame.Description, "BOTTOMRIGHT", 4, 1)
    ScrollUtil.RegisterScrollBoxWithScrollBar(frame.Description:GetScrollBox(), frame.DescriptionScrollBar)
    REP:ElvSkin("trimScrollBar", frame.DescriptionScrollBar)
  end

  -- The next standing sits on the line of the name (or standing), when that line is too short it moves to its own
  -- line below the standing and the description follows it. HeaderBottom is what the content below starts at.
  local nameLine = (isClassic and frame.TitleFont) and REP_DetailStandingName or frame.FactionName
  frame.HeaderBottom = REP_DetailStandingName

  frame.LayoutHeader = function(self)
    local available = (self:GetWidth() or 0) - (padding * 2)
    local nextText = REP_DetailStandingNextValue:GetText()
    local nextWidth = (nextText and nextText ~= "") and REP_DetailStandingNextValue:GetStringWidth() or 0
    local stacked = nextWidth > 0 and (nameLine:GetStringWidth() + nextWidth + 10) > available

    REP_DetailStandingNextValue:ClearAllPoints()
    if stacked then
      REP_DetailStandingNextValue:SetPoint("TOPLEFT", REP_DetailStandingName, "BOTTOMLEFT", 0, -2)
      self.HeaderBottom = REP_DetailStandingNextValue
    elseif nameLine == REP_DetailStandingName then
      REP_DetailStandingNextValue:SetPoint("BOTTOM", REP_DetailStandingName, "BOTTOM", 0, 0)
      REP_DetailStandingNextValue:SetPoint("RIGHT", self, "RIGHT", -padding, 0)
      self.HeaderBottom = REP_DetailStandingName
    else
      REP_DetailStandingNextValue:SetPoint("BOTTOMRIGHT", self.FactionName, "BOTTOMRIGHT", 0, 0)
      self.HeaderBottom = REP_DetailStandingName
    end

    self.Description:ClearAllPoints()
    self.Description:SetPoint("TOPLEFT", self.HeaderBottom, "BOTTOMLEFT", 0, isClassic and -4 or -8)
    self.Description:SetPoint("RIGHT", self, "RIGHT", isClassic and -padding or -(PADDING + 14), 0)

    if self.ApplyOptions and self.optionsApplied then self:ApplyOptions(true) end
  end

  ---------------------------------
  -- Standing bar
  ---------------------------------
  frame.StandingBar = REP:CreateStandingBar(frame)
  local barInset = ColoredProgressBarMixin and 6 or 0 -- the Forever bar artwork has padding inside the frame
  local gap = isClassic and 6 or 10
  if isClassic and not ColoredProgressBarMixin then frame.StandingBar:SetHeight(16) end
  frame.StandingBar:SetPoint("TOPLEFT", frame.Description, "BOTTOMLEFT", -barInset, barInset > 0 and -6 or -gap)
  frame.StandingBar:SetPoint("RIGHT", frame, "RIGHT", -(padding - barInset), 0)

  ---------------------------------
  -- Statistics (two columns)
  ---------------------------------
  -- Two columns that share the width of the panel (it can be resized).
  local leftAnchor = CreateFrame("Frame", nil, frame)
  leftAnchor:SetSize(1, 1)
  leftAnchor:SetPoint("TOPLEFT", frame.StandingBar, "BOTTOMLEFT", barInset, barInset > 0 and -6 or -gap)


  local leftColumnRight = CreateFrame("Frame", nil, frame)
  leftColumnRight:SetSize(1, 1)
  leftColumnRight:SetPoint("TOP", leftAnchor, "TOP")
  leftColumnRight:SetPoint("RIGHT", frame, "CENTER", -(padding / 2), 0)

  local rightAnchor = CreateFrame("Frame", nil, frame)
  rightAnchor:SetSize(1, 1)
  rightAnchor:SetPoint("TOP", leftAnchor, "TOP")
  rightAnchor:SetPoint("LEFT", frame, "CENTER", padding / 2, 0)

  local rightColumnRight = CreateFrame("Frame", nil, frame)
  rightColumnRight:SetSize(1, 1)
  rightColumnRight:SetPoint("TOP", leftAnchor, "TOP")
  rightColumnRight:SetPoint("RIGHT", frame, "RIGHT", -padding, 0)

  local row
  row = CreateStatRow(frame, "REP_DetailStandingNeeded", "REP_DetailStandingNeededValue", REP_TXT.neededRep, leftAnchor, leftColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingCurrent", "REP_DetailStandingCurrentValue", REP_TXT.currentRep, row, leftColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingMissing", "REP_DetailStandingMissingValue", REP_TXT.missingRep, row, leftColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingToExaltedHeader", "REP_DetailStandingToExaltedValue", REP_TXT.toExalted, row, leftColumnRight)
  local lastLeftRow = row

  row = CreateStatRow(frame, "REP_DetailStandingBag", "REP_DetailStandingBagValue", REP_TXT.repInBag, rightAnchor, rightColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingBagBank", "REP_DetailStandingBagBankValue", REP_TXT.repInBagBank, row, rightColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingQuests", "REP_DetailStandingQuestsValue", REP_TXT.repInQuest, row, rightColumnRight)
  row = CreateStatRow(frame, "REP_DetailStandingGained", "REP_DetailStandingGainedValue", REP_TXT.factionGained, row, rightColumnRight)

  frame.statRegions = {}
  for _, key in ipairs({ "Needed", "Current", "Missing", "ToExaltedHeader", "Bag", "BagBank", "Quests", "Gained" }) do
    table.insert(frame.statRegions, _G["REP_DetailStanding"..key])
  end
  for _, key in ipairs({ "Needed", "Current", "Missing", "ToExalted", "Bag", "BagBank", "Quests", "Gained" }) do
    table.insert(frame.statRegions, _G["REP_DetailStanding"..key.."Value"])
  end

  ---------------------------------
  -- Faction options (replace the ones of the default pane)
  ---------------------------------
  frame.AtWarCheckbox = CreateCheckbox(frame, AT_WAR or "At War", function(_, checked)
    local index = REP:GetFactionIndexByID(frame.factionID)
    if index > 0 then ToggleFactionAtWar(index) end
    REP:RequestDetailFrameRefresh()
  end, REPUTATION_AT_WAR_DESCRIPTION)
  frame.AtWarCheckbox:SetPoint("TOPLEFT", lastLeftRow, "BOTTOMLEFT", -4, isClassic and -4 or -8)

  frame.InactiveCheckbox = CreateCheckbox(frame, MOVE_TO_INACTIVE or "Move to Inactive", function(_, checked)
    local index = REP:GetFactionIndexByID(frame.factionID)
    if index > 0 then REP:CustomSetFactionActiveOrInactive(checked, index) end
    REP:RequestDetailFrameRefresh()
  end, REPUTATION_MOVE_TO_INACTIVE)
  frame.InactiveCheckbox:SetPoint("LEFT", frame.AtWarCheckbox, "RIGHT", 110, 0) -- spread by LayoutCheckboxes

  frame.WatchCheckbox = CreateCheckbox(frame, SHOW_FACTION_ON_MAINSCREEN or "Show as Experience Bar", function(_, checked)
    local index = REP:GetFactionIndexByID(frame.factionID)
    -- The game applies the change a moment later, until then the clicked state is kept (no flicker).
    frame.pendingWatch = { factionID = frame.factionID, checked = checked and true or false, expires = GetTime() + 1 }
    if checked then
      SetWatchedFaction(index, frame.factionID)
    else
      SetWatchedFaction(0)
    end
    REP:RequestDetailFrameRefresh()
  end, REPUTATION_SHOW_AS_XP)
  frame.WatchCheckbox:SetPoint("LEFT", frame.InactiveCheckbox, "RIGHT", 130, 0)

  -- The checkboxes flow from left to right and continue on the next row when the panel is too narrow,
  -- the frame below them (CheckRowsEnd) marks the bottom of the last row.
  frame.CheckRowsEnd = CreateFrame("Frame", nil, frame)
  frame.CheckRowsEnd:SetSize(1, 1)
  frame.CheckRowsEnd:SetPoint("TOPLEFT", frame.AtWarCheckbox, "BOTTOMLEFT", 4, 0)

  frame.LayoutCheckboxes = function(self)
    local available = (self:GetWidth() or 0) - (padding * 2) + 4
    if available <= 0 then return end

    local CHECK_WIDTH, LABEL_GAP, SPACING, ROW_STEP = 22, 2, 16, 22
    local checks = { self.AtWarCheckbox, self.InactiveCheckbox, self.WatchCheckbox }
    local x, row = 0, 0

    for i, check in ipairs(checks) do
      local labelWidth = check.Label:GetStringWidth()
      -- A label wider than the whole row is only shown in the tooltip.
      local showLabel = CHECK_WIDTH + LABEL_GAP + labelWidth <= available
      local width = CHECK_WIDTH + (showLabel and (LABEL_GAP + labelWidth) or 0)

      if i > 1 and x + width > available then
        x, row = 0, row + 1
      end

      check:FitLabel(showLabel and math.huge or -1)
      if i > 1 then
        check:ClearAllPoints()
        check:SetPoint("TOPLEFT", checks[1], "TOPLEFT", x, -row * ROW_STEP)
      end

      x = x + width + SPACING
    end

    self.CheckRowsEnd:ClearAllPoints()
    self.CheckRowsEnd:SetPoint("TOPLEFT", checks[1], "BOTTOMLEFT", 4, -row * ROW_STEP)
    if self.UpdateDividerPosition then self:UpdateDividerPosition() end
  end

  ---------------------------------
  -- Reputation sources list
  ---------------------------------
  local divider = frame:CreateTexture(nil, "ARTWORK")
  divider:SetColorTexture(1, 1, 1, 0.15)
  divider:SetHeight(1)
  divider:SetPoint("TOPLEFT", frame.CheckRowsEnd, "TOPLEFT", 0, isClassic and -3 or -6)
  divider:SetPoint("RIGHT", frame, "RIGHT", -padding, 0)
  frame.ListDivider = divider

  -- Retail: the "View Renown" button of the default details sits below the checkboxes (DockDetailPanel),
  -- the list starts below it while it is shown.
  frame.UpdateDividerPosition = function(self)
    local offset = isClassic and -3 or -6
    local renown = self.renownButton
    if renown and renown:IsShown() then
      offset = offset - (renown:GetHeight() or 22) - 6
    end

    divider:ClearAllPoints()
    divider:SetPoint("TOPLEFT", self.CheckRowsEnd, "TOPLEFT", 0, offset)
    divider:SetPoint("RIGHT", self, "RIGHT", -padding, 0)
  end

  frame.ListTitle = CreateLabel(frame, "GameFontNormal")
  frame.ListTitle:SetHeight(14) -- keeps the space above the list when a narrow panel shortens the text away
  frame.ListTitle:SetPoint("TOPLEFT", divider, "BOTTOMLEFT", 0, isClassic and -9 or -10)
  frame.ListTitle:SetText(REP_TXT.reputationSources)

  if isClassic then
    frame.OptionsDropdown = CreateCompactMenuButton(frame, OPTIONS or "Options")
    frame.FilterDropdown = CreateCompactMenuButton(frame, FILTER or "Filter")
  else
    frame.OptionsDropdown = CreateFrame("DropdownButton", nil, frame, "WowStyle1FilterDropdownTemplate")
    frame.FilterDropdown = CreateFrame("DropdownButton", nil, frame, "WowStyle1FilterDropdownTemplate")
    REP:ElvSkin("dropdown", frame.OptionsDropdown)
    REP:ElvSkin("dropdown", frame.FilterDropdown)
  end

  -- In line with the title (3 higher, the buttons are taller), on the right side of the panel.
  frame.OptionsDropdown:SetPoint("TOPRIGHT", divider, "BOTTOMRIGHT", 0, (isClassic and -9 or -10) + 3)
  REP:SetupSourcesOptionsMenu(frame.OptionsDropdown)

  frame.FilterDropdown:SetPoint("RIGHT", frame.OptionsDropdown, "LEFT", isClassic and -6 or -10, 0)
  REP:SetupSourcesFilterMenu(frame.FilterDropdown)

  -- A narrow panel shortens the title instead of running it under the buttons.
  frame.ListTitle:SetPoint("TOPRIGHT", frame.FilterDropdown, "TOPLEFT", -6, -3)


  REP_DetailReputationSuppressHint = CreateLabel(frame, "GameFontDisableSmall")
  REP_DetailReputationSuppressHint:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", padding, isClassic and 10 or 10)
  REP_DetailReputationSuppressHint:SetPoint("RIGHT", frame, "RIGHT", -(padding + 18), 0)
  REP_DetailReputationSuppressHint:SetText(REP_TXT.suppressHint)

  local list = CreateFrame("ScrollFrame", "REP_DetailListScrollFrame", frame, "FauxScrollFrameTemplate")
  list:SetPoint("TOPLEFT", frame.ListTitle, "BOTTOMLEFT", 0, isClassic and -12 or -8)
  list:SetPoint("RIGHT", frame, "RIGHT", -(padding + 20), 0)
  list:SetPoint("BOTTOM", REP_DetailReputationSuppressHint, "TOP", 0, isClassic and 5 or 8)
  list:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, REP.UPDATE_LIST_ROW_HEIGHT or 16, REP_UpdateList_Update) end)
  list:SetScript("OnSizeChanged", function()
    frame:CreateListRows()
    if frame:IsVisible() then REP_UpdateList_Update() end
  end)
  REP_DetailListScrollFrame = list
  REP:ElvSkin("scrollBar", list.ScrollBar or _G["REP_DetailListScrollFrameScrollBar"])

  local listBackground = frame:CreateTexture(nil, "BACKGROUND", nil, 2)
  listBackground:SetColorTexture(0, 0, 0, 0.25)
  listBackground:SetPoint("TOPLEFT", list, "TOPLEFT", -4, 4)
  listBackground:SetPoint("BOTTOMRIGHT", list, "BOTTOMRIGHT", 22, -4)

  REP_DetailNoInformationText = CreateLabel(frame, "GameFontDisable")
  REP_DetailNoInformationText:SetPoint("TOPLEFT", list, "TOPLEFT", 6, -6)
  REP_DetailNoInformationText:SetPoint("RIGHT", list, "RIGHT", 0, 0)
  REP_DetailNoInformationText:SetWordWrap(true)

  frame.listRows = {}
  frame.CreateListRows = function(self)
    local rowWidth = math.floor(list:GetWidth())
    if rowWidth <= 0 or not list:GetTop() then
      -- Not laid out yet (first show), the list's OnSizeChanged creates the rows once it is.
      REP.UPDATE_LIST_HEIGHT = #self.listRows
      return
    end

    -- The real space between the title and the hint (GetHeight can't go below 0 when the panel is too low).
    local rowHeight = REP.UPDATE_LIST_ROW_HEIGHT or 16
    local height = (list:GetTop() or 0) - (list:GetBottom() or 0)
    local numRows = math.max(0, math.floor(height / rowHeight))

    for i = 1, numRows do
      local entry = self.listRows[i]
      if not entry then
        local name = "REP_DetailUpdateEntry"..i
        entry = CreateFrame("Button", name, frame, "REP_UpdateEntryTemplate")

        local highlight = entry:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetAllPoints()
        highlight:SetColorTexture(1, 1, 1, 0.08)

        if i == 1 then
          entry:SetPoint("TOPLEFT", list, "TOPLEFT", 0, 0)
        else
          entry:SetPoint("TOPLEFT", self.listRows[i - 1], "BOTTOMLEFT")
        end

        self.listRows[i] = entry
      end

      local name = entry:GetName()
      entry:SetWidth(rowWidth)
      entry:SetHeight(rowHeight)
      self:ApplyRowFont(entry)
      -- Narrow panel: the type, times and name columns move closer together.
      local compact = rowWidth < 380
      local labelX, timesX, timesWidth, nameX, repWidth = 20, 40, 40, 80, 50
      if compact then labelX, timesX, timesWidth, nameX, repWidth = 19, 34, 36, 73, 34 end

      local label, times, itemTimes = _G[name.."Label"], _G[name.."Times"], _G[name.."ItemTimes"]
      label:ClearAllPoints()
      label:SetPoint("LEFT", entry, "LEFT", labelX, 0)
      for _, region in ipairs({ times, itemTimes }) do
        region:ClearAllPoints()
        region:SetPoint("LEFT", entry, "LEFT", timesX, 0)
        region:SetWidth(timesWidth)
      end

      _G[name.."Rep"]:ClearAllPoints()
      _G[name.."Rep"]:SetPoint("RIGHT", entry, "RIGHT", -4, 0)
      _G[name.."Rep"]:SetWidth(repWidth)

      for _, key in ipairs({ "Name", "ItemName" }) do
        local region = _G[name..key]
        region:ClearAllPoints()
        region:SetPoint("LEFT", entry, "LEFT", nameX, 0)
        region:SetWidth(math.max(20, rowWidth - nameX - repWidth - 8))
        -- One line, a long name is shortened ("...").
        region:SetWordWrap(false)
      end
    end

    for i = numRows + 1, #self.listRows do
      self.listRows[i]:Hide()
    end

    REP.UPDATE_LIST_HEIGHT = numRows
    self:UpdateMinimumHeight()
  end

  -- The panel can't get lower than its upper part, the hint and a few list rows, whatever is shown above the list.
  frame.UpdateMinimumHeight = function(self)
    local top, listTop, listBottom, bottom = self:GetTop(), list:GetTop(), list:GetBottom(), self:GetBottom()
    if not (top and listTop and listBottom and bottom) then return end

    local rowHeight = REP.UPDATE_LIST_ROW_HEIGHT or 16
    local minHeight = math.ceil((top - listTop) + (listBottom - bottom) + MIN_LIST_ROWS * rowHeight)
    minHeight = math.max(MIN_PANEL_HEIGHT, minHeight)
    if self.minHeight == minHeight and self:GetHeight() >= minHeight - 0.5 then return end
    self.minHeight = minHeight

    if self.SetResizeBounds then
      self:SetResizeBounds(MIN_PANEL_WIDTH, minHeight, MAX_PANEL_SIZE, MAX_PANEL_SIZE)
    elseif self.SetMinResize then
      self:SetMinResize(MIN_PANEL_WIDTH, minHeight)
    end

    -- While dragging the bounds stop the grip, the height itself is set once dragging is done.
    if not self.isSizing and self:GetHeight() < minHeight - 0.5 then
      self:SetHeight(minHeight)
      if REP_Data and REP_Data.Global and type(REP_Data.Global.DetailPanelSize) == "table" and not self.isSizing then
        REP_Data.Global.DetailPanelSize.height = minHeight
      end
    end
  end

  ---------------------------------
  -- Showing / hiding
  ---------------------------------
  frame:SetScript("OnShow", function(self)
    REP:ApplyDetailPanelSize(self)
    self:ApplyOptions()
    if isClassic then REP:DockClassicDetailPanel(self) else REP:DockDetailPanel(self) end
    self:LayoutCheckboxes()
    self:CreateListRows()
    REP:FillReputationDetailFrameWithData()
  end)

  frame:SetScript("OnHide", function(self)
    if not isClassic then REP:UndockDetailPanel(self) end

    -- Don't keep showing the previous faction the next time the panel opens.
    REP:ShowDetailPanelEmptyState()
  end)

  frame:SetScript("OnSizeChanged", function(self)
    self:LayoutHeader()
    self:LayoutCheckboxes()
    if self:IsShown() then
      self:CreateListRows()
      REP_UpdateList_Update()
    end
  end)

  ---------------------------------
  -- Settings (Options > ReputationGuide > Details frame)
  ---------------------------------
  local function GetOption(key, default)
    local value = REP_Data and REP_Data.Global and REP_Data.Global[key]
    if value == nil then return default end
    return value
  end

  frame.ApplyRowFont = function(self, entry)
    local fontSize = LIST_FONT_SIZES[GetOption("DetailListFontSize", "normal")] or LIST_FONT_SIZES.normal
    if entry.repFontOffset == fontSize.offset then return end
    entry.repFontOffset = fontSize.offset

    local name = entry:GetName()
    for _, key in ipairs(LIST_FONT_REGIONS) do
      local region = _G[name..key]
      if region then
        -- The size of the template font is the base, it is kept the first time.
        if not region.repBaseFont then
          local file, size, flags = region:GetFont()
          if file and size then region.repBaseFont = { file, size, flags } end
        end
        local base = region.repBaseFont
        if base then region:SetFont(base[1], base[2] + fontSize.offset, base[3]) end
      end
    end
  end

  frame.ApplyOptions = function(self, layoutOnly)
    self.optionsApplied = true
    -- Header: description, reputation bar and statistics can be hidden, what is below moves up.
    local showDescription = GetOption("ShowDetailDescription", true)
    local showBar = GetOption("ShowStandingBar", true)
    local showStatistics = GetOption("ShowDetailStatistics", true)

    self.Description:SetShown(showDescription)
    if self.DescriptionScrollBar then self.DescriptionScrollBar:SetShown(showDescription) end
    self.StandingBar:SetShown(showBar)
    for _, region in ipairs(self.statRegions) do region:SetShown(showStatistics) end

    local above = showDescription and self.Description or self.HeaderBottom
    local aboveGap = showDescription and gap or 6

    self.StandingBar:ClearAllPoints()
    self.StandingBar:SetPoint("TOPLEFT", above, "BOTTOMLEFT", -barInset, barInset > 0 and -6 or -aboveGap)
    self.StandingBar:SetPoint("RIGHT", self, "RIGHT", -(padding - barInset), 0)

    leftAnchor:ClearAllPoints()
    if showBar then
      leftAnchor:SetPoint("TOPLEFT", self.StandingBar, "BOTTOMLEFT", barInset, barInset > 0 and -6 or -gap)
    else
      leftAnchor:SetPoint("TOPLEFT", above, "BOTTOMLEFT", 0, -aboveGap)
    end

    self.AtWarCheckbox:ClearAllPoints()
    if showStatistics then
      self.AtWarCheckbox:SetPoint("TOPLEFT", lastLeftRow, "BOTTOMLEFT", -4, isClassic and -4 or -8)
    else
      self.AtWarCheckbox:SetPoint("TOPLEFT", leftAnchor, "TOPLEFT", -4, 2)
    end

    -- Background transparency (the border stays).
    local alpha = tonumber(GetOption("DetailBackgroundAlpha", 1)) or 1
    for _, texture in ipairs({ self.Bg, self.Inset and self.Inset.Bg, self.solidBackground, self.TopTileStreaks }) do
      if type(texture) == "table" and texture.SetAlpha then texture:SetAlpha(alpha) end
    end
    if self.Inset and not self.Inset.Bg then self.Inset:SetAlpha(alpha) end
    if self.repElvBackdropColor then
      local r, g, b, a = unpack(self.repElvBackdropColor)
      self:SetBackdropColor(r or 0, g or 0, b or 0, (a or 1) * alpha)
    elseif self.SetBackdropColor and not self.Bg then
      self:SetBackdropColor(1, 1, 1, alpha)
    end

    if self.ResizeGrip then self.ResizeGrip:SetShown(REP:IsDetailResizeEnabled()) end

    if layoutOnly then return end

    -- List font size: rows follow the new height.
    local fontSize = LIST_FONT_SIZES[GetOption("DetailListFontSize", "normal")] or LIST_FONT_SIZES.normal
    REP.UPDATE_LIST_ROW_HEIGHT = fontSize.rowHeight
    for _, entry in ipairs(self.listRows) do
      entry:SetHeight(fontSize.rowHeight)
      self:ApplyRowFont(entry)
    end
    self:CreateListRows()
    if self:IsVisible() then REP_UpdateList_Update() end
  end

  REP:AddDetailPanelResizing(frame)

  REP.Orig_ReputationDetailFrame = frame
  return frame
end

-------------------------------------------------------------------------------
-- Resizing: drag the grip at the bottom right, right-click it to go back to the default size.
-- The size is saved per installation (REP_Data.Global.DetailPanelSize).
-------------------------------------------------------------------------------
local function IsResizeEnabled()
  return not (REP_Data and REP_Data.Global and REP_Data.Global.AllowDetailResize == false)
end

-- Without resizing (setting) the panel has its default size, the saved size is kept for when it is enabled again.
local function GetSavedSize()
  if not IsResizeEnabled() then return end
  local size = REP_Data and REP_Data.Global and REP_Data.Global.DetailPanelSize
  if type(size) == "table" and tonumber(size.width) and tonumber(size.height) then return size end
end

function REP:IsDetailResizeEnabled()
  return IsResizeEnabled()
end

-- After the resize setting changed: show or hide the grip and use the saved or the default size.
function REP:ApplyDetailResizeOption()
  local frame = REP_DetailPanel
  if not frame then return end

  frame:ApplyOptions()
  REP:ApplyDetailPanelSize(frame)
  if REP.UseClassicPanel and frame:IsShown() then REP:DockClassicDetailPanel(frame) end
  if REP.IsForever and REP.UpdateCharacterFrameWidthForDetailPanel then REP:UpdateCharacterFrameWidthForDetailPanel() end
end

function REP:ApplyDetailPanelSize(frame)
  frame = frame or REP_DetailPanel
  if not frame then return end

  local size = GetSavedSize()
  frame:SetWidth(size and size.width or frame.defaultWidth)
  if size then
    frame:SetHeight(size.height)
  elseif not REP.UseClassicPanel then
    frame:SetHeight(frame.defaultHeight)
  end
  -- Classic without a saved size: the height follows the character frame (DockClassicDetailPanel).
end

function REP:AddDetailPanelResizing(frame)
  frame:SetResizable(true)
  if frame.SetResizeBounds then
    frame:SetResizeBounds(MIN_PANEL_WIDTH, MIN_PANEL_HEIGHT, MAX_PANEL_SIZE, MAX_PANEL_SIZE)
  elseif frame.SetMinResize then
    frame:SetMinResize(MIN_PANEL_WIDTH, MIN_PANEL_HEIGHT)
    frame:SetMaxResize(MAX_PANEL_SIZE, MAX_PANEL_SIZE)
  end

  local grip = CreateFrame("Button", nil, frame)
  grip:SetSize(16, 16)
  grip:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
  grip:SetFrameLevel(frame:GetFrameLevel() + 20)
  grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  grip:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  frame.ResizeGrip = grip

  -- Sizing can move the anchor of the frame, it stays docked next to the reputation frame.
  local function Redock()
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", ReputationFrame, "TOPRIGHT", frame.anchorX or 0, frame.anchorY or 0)
  end

  grip:SetScript("OnMouseDown", function(_, button)
    if button == "LeftButton" then
      frame.isSizing = true
      frame:StartSizing("BOTTOMRIGHT")
    end
  end)

  grip:SetScript("OnMouseUp", function(_, button)
    if frame.isSizing then
      frame.isSizing = false
      frame:StopMovingOrSizing()
      local width, height = frame:GetSize()
      if frame.minHeight and height < frame.minHeight then height = frame.minHeight end
      Redock()
      frame:SetSize(width, height)
      if REP_Data and REP_Data.Global then
        REP_Data.Global.DetailPanelSize = { width = math.floor(width + 0.5), height = math.floor(height + 0.5) }
      end
    end

    if button == "RightButton" then
      if REP_Data and REP_Data.Global then REP_Data.Global.DetailPanelSize = nil end
      Redock()
      REP:ApplyDetailPanelSize(frame)
      if REP.UseClassicPanel then REP:DockClassicDetailPanel(frame) end
    end

    if REP.IsForever and REP.UpdateCharacterFrameWidthForDetailPanel then REP:UpdateCharacterFrameWidthForDetailPanel() end
  end)

  grip:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(REP_TXT.resizeTip)
    GameTooltip:Show()
  end)
  grip:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

-------------------------------------------------------------------------------
-- Docking: hide the default details and keep the default buttons reachable.
-------------------------------------------------------------------------------
local function MoveButtonToPanel(panel, button, key, x, y)
  if not button then return end

  panel[key.."Strata"] = panel[key.."Strata"] or button:GetFrameStrata()
  panel[key.."Level"] = panel[key.."Level"] or button:GetFrameLevel()
  button:ClearAllPoints()
  button:SetPoint("TOPRIGHT", panel, "TOPRIGHT", x, y)
  button:SetFrameStrata(panel:GetFrameStrata())
  button:SetFrameLevel(panel:GetFrameLevel() + 600)
end

-- Retail: the default details stay shown under the panel (Blizzard shows and refreshes them), only their
-- artwork is made invisible (alpha of their own textures and child frames), so no edge shows next to or through
-- the panel. Their close button and View Renown button keep working, they are used by the panel.
local function SetDefaultDetailsArtShown(panel, defaultDetails, shown)
  if not defaultDetails then return end
  local keep = { [defaultDetails.CloseButton or false] = true, [defaultDetails.ViewRenownButton or false] = true }

  for _, region in ipairs({ defaultDetails:GetRegions() }) do
    if region.SetAlpha then region:SetAlpha(shown and 1 or 0) end
  end
  for _, child in ipairs({ defaultDetails:GetChildren() }) do
    if not keep[child] and child ~= panel then child:SetAlpha(shown and 1 or 0) end
  end
end

local function RestoreButton(panel, button, key, relativeTo, x, y)
  if not button then return end

  button:ClearAllPoints()
  button:SetPoint("TOPRIGHT", relativeTo, "TOPRIGHT", x, y)
  if panel[key.."Strata"] then button:SetFrameStrata(panel[key.."Strata"]) end
  if panel[key.."Level"] then button:SetFrameLevel(panel[key.."Level"]) end
end

function REP:DockRenownButton(panel)
  local renown = panel.renownButton
  if not renown then return end

  panel.isDockingRenown = true
  -- The default details clip their children to their own (smaller) size, so the button gets this panel as parent.
  if renown:GetParent() ~= panel then renown:SetParent(panel) end
  renown:ClearAllPoints()
  renown:SetPoint("TOPLEFT", panel.CheckRowsEnd, "TOPLEFT", -4, -4)
  renown:SetFrameStrata(panel:GetFrameStrata())
  renown:SetFrameLevel(panel:GetFrameLevel() + 600)
  panel.isDockingRenown = false

  panel:UpdateDividerPosition()
end

function REP:DockDetailPanel(panel)
  local defaultDetails = ReputationFrame.ReputationDetailFrame
  if defaultDetails then
    panel:SetFrameLevel(defaultDetails:GetFrameLevel() + 20)
  end

  if REP.IsForever then
    REP:UpdateCharacterFrameWidthForDetailPanel()

    if defaultDetails then defaultDetails:SetAlpha(0) end

    -- The background of the default right pane sticks out from under the narrowed character frame.
    if CharacterFrame.RightPaneHost then CharacterFrame.RightPaneHost:SetAlpha(0) end

    -- Keep the character frame tabs reachable on the right side of this panel.
    if CharacterFrame.ModeTabs then
      CharacterFrame.ModeTabs:ClearAllPoints()
      CharacterFrame.ModeTabs:SetPoint("TOPLEFT", panel, "TOPRIGHT", 0, -30)
    end

    -- The character frame close button closes everything (clicked by the player, so it stays secure).
    MoveButtonToPanel(panel, CharacterFrame.CloseButton, "characterClose", 1, 0)
  else
    -- Retail: the small default popup stays (covered by this panel), its close button closes both.
    MoveButtonToPanel(panel, defaultDetails and defaultDetails.CloseButton, "detailsClose", 1, 0)
    SetDefaultDetailsArtShown(panel, defaultDetails, false)

    REP:UpdatePanelRenownButton(panel)
  end
end

-- Puts Blizzard's button back on the default details (its own parent, anchors and levels).
local function RestoreDefaultRenownButton(panel)
  local renown = panel.defaultRenownButton
  if panel.renownButton ~= renown then return end
  panel.renownButton = nil -- before restoring, so the SetPoint hook leaves it alone
  if renown and panel.renownPoints then
    if panel.renownParent and renown:GetParent() ~= panel.renownParent then renown:SetParent(panel.renownParent) end
    renown:ClearAllPoints()
    for _, point in ipairs(panel.renownPoints) do renown:SetPoint(unpack(point)) end
    if panel.renownStrata then renown:SetFrameStrata(panel.renownStrata) end
    if panel.renownLevel then renown:SetFrameLevel(panel.renownLevel) end
  end
end

-- The renown window lives in a load on demand part of the default UI; ToggleMajorFactionRenown expects it loaded.
local RENOWN_ADDONS = { "Blizzard_MajorFactions", "Blizzard_MajorFactionRenown", "Blizzard_MajorFactionsRenown", "Blizzard_Renown" }

local function LoadRenownFrame()
  if MajorFactionRenownFrame then return true end
  if MajorFactions_LoadUI then pcall(MajorFactions_LoadUI) end
  if MajorFactionRenownFrame then return true end

  local loadAddOn = (C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn
  if loadAddOn then
    for _, name in ipairs(RENOWN_ADDONS) do
      pcall(loadAddOn, name)
      if MajorFactionRenownFrame then return true end
    end
  end
  return MajorFactionRenownFrame ~= nil
end

-- Opens the renown window of a major faction the way the default "View Renown" button does (not in combat).
local function ToggleRenownFrame(factionID)
  if not factionID or (InCombatLockdown and InCombatLockdown()) then return end

  -- Midnight: renown is the Journeys tab of the Adventure Guide (load on demand).
  if OpenEncounterJournalToJourney or EncounterJournal_OpenToJourney then
    if not EncounterJournal then
      if EncounterJournal_LoadUI then
        pcall(EncounterJournal_LoadUI)
      else
        local loadAddOn = (C_AddOns and C_AddOns.LoadAddOn) or LoadAddOn
        if loadAddOn then pcall(loadAddOn, "Blizzard_EncounterJournal") end
      end
    end

    local open = OpenEncounterJournalToJourney or EncounterJournal_OpenToJourney
    if open and pcall(open, factionID) then return end
    if EncounterJournal_OpenToJourney and open ~= EncounterJournal_OpenToJourney and pcall(EncounterJournal_OpenToJourney, factionID) then return end
  end

  if not LoadRenownFrame() then
    REP:Print(REP_TXT.renownFrameUnavailable)
    return
  end

  -- The function the default UI itself uses to open the renown window, where it exists.
  if ToggleMajorFactionRenown then
    ToggleMajorFactionRenown(factionID)
    return
  end

  local renownFrame = MajorFactionRenownFrame
  local current = renownFrame.GetCurrentFactionID and renownFrame:GetCurrentFactionID()
  if renownFrame:IsShown() and current == factionID then
    HideUIPanel(renownFrame)
  else
    HideUIPanel(renownFrame)
    if EventRegistry then EventRegistry:TriggerEvent("MajorFactionRenownMixin.MajorFactionRenownRequest", factionID) end
    ShowUIPanel(renownFrame)
  end
end

local function GetOwnRenownButton(panel)
  if panel.OwnRenownButton then return panel.OwnRenownButton end
  local button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
  button:SetText(REP_TXT.viewRenown)
  button:SetSize(math.max(120, (button:GetFontString() and button:GetFontString():GetStringWidth() or 90) + 30), 22)
  button:SetScript("OnClick", function() ToggleRenownFrame(REP.SelectedFactionID) end)
  REP:ElvSkin("button", button)
  button:SetScript("OnShow", function() if panel:IsShown() then panel:UpdateDividerPosition() end end)
  button:SetScript("OnHide", function() if panel:IsShown() then panel:UpdateDividerPosition() end end)
  button:Hide()
  panel.OwnRenownButton = button
  return button
end

-- Retail, the "View Renown" button below the checkboxes of this panel:
--  * a faction selected in the default list: Blizzard's own button (it follows the default details),
--    only anchors and levels are changed, nothing that taints;
--  * a faction opened from the ordered list: the default details still show the faction selected before,
--    so their button would open that one; the panel shows a button of its own for the faction it shows.
function REP:UpdatePanelRenownButton(panel)
  panel = panel or REP_DetailPanel
  if not panel or REP.IsForever or REP.UseClassicPanel then return end

  local defaultDetails = ReputationFrame.ReputationDetailFrame
  local fromOrderedList = REP.SortedSelectionOpen and REP.IsSortedReputationListActive and REP:IsSortedReputationListActive()

  if fromOrderedList then
    RestoreDefaultRenownButton(panel)

    local own = GetOwnRenownButton(panel)
    local factionID = REP.SelectedFactionID
    local data = factionID and REP.Orig_IsMajorFaction and REP.Orig_IsMajorFaction(factionID) and REP.Orig_GetMajorFactionData and REP.Orig_GetMajorFactionData(factionID)
    panel.renownButton = own
    own:ClearAllPoints()
    own:SetPoint("TOPLEFT", panel.CheckRowsEnd, "TOPLEFT", 0, -4)
    own:SetFrameLevel(panel:GetFrameLevel() + 600)
    -- Like the default button: shown for every renown faction, only clickable once its renown is unlocked.
    own:SetShown(data and panel:IsShown() and true or false)
    own:SetEnabled(data and data.isUnlocked ~= false and true or false)
    panel:UpdateDividerPosition()
    return
  end

  if panel.OwnRenownButton then panel.OwnRenownButton:Hide() end
  if panel.renownButton == panel.OwnRenownButton then panel.renownButton = nil end

  local renown = defaultDetails and defaultDetails:IsShown() and defaultDetails.ViewRenownButton
  if renown then
    if not panel.renownPoints then
      panel.renownPoints = {}
      for i = 1, renown:GetNumPoints() do panel.renownPoints[i] = { renown:GetPoint(i) } end
      panel.renownStrata, panel.renownLevel = renown:GetFrameStrata(), renown:GetFrameLevel()
      panel.renownParent = renown:GetParent()
      panel.defaultRenownButton = renown
      renown:HookScript("OnShow", function() if panel:IsShown() then panel:UpdateDividerPosition() end end)
      renown:HookScript("OnHide", function() if panel:IsShown() then panel:UpdateDividerPosition() end end)

      -- The default details lay out their children again on every refresh, which puts the button back
      -- under this panel: dock it again after each of those.
      hooksecurefunc(renown, "SetPoint", function()
        if panel.renownButton == renown and not panel.isDockingRenown then REP:DockRenownButton(panel) end
      end)
    end

    panel.renownButton = renown
    REP:DockRenownButton(panel)
  end
  panel:UpdateDividerPosition()
end

function REP:UndockDetailPanel(panel)
  local defaultDetails = ReputationFrame.ReputationDetailFrame

  if REP.IsForever then
    REP:UpdateCharacterFrameWidthForDetailPanel()

    if defaultDetails then defaultDetails:SetAlpha(1) end
    if CharacterFrame.RightPaneHost then CharacterFrame.RightPaneHost:SetAlpha(1) end

    if CharacterFrame.ModeTabs then
      CharacterFrame.ModeTabs:ClearAllPoints()
      CharacterFrame.ModeTabs:SetPoint("TOPLEFT", CharacterFrame, "TOPRIGHT", 0, -30)
    end

    RestoreButton(panel, CharacterFrame.CloseButton, "characterClose", CharacterFrame, 1, 0)
  elseif defaultDetails then
    RestoreButton(panel, defaultDetails.CloseButton, "detailsClose", defaultDetails, -2, -2)
    SetDefaultDetailsArtShown(panel, defaultDetails, true)

    RestoreDefaultRenownButton(panel)
    if panel.OwnRenownButton then panel.OwnRenownButton:Hide() end
    panel.renownButton = nil
  end
end

-- Classic: as high as the visible part of the character frame (down to the tabs), the default details stay hidden.
function REP:DockClassicDetailPanel(panel)
  if ReputationDetailFrame and ReputationDetailFrame:IsShown() then ReputationDetailFrame:Hide() end

  if GetSavedSize() then return end

  local function UpdateHeight()
    if GetSavedSize() then return end
    local tab = CharacterFrameTab1
    local top, tabTop = panel:GetTop(), tab and tab:GetTop()
    if top and tabTop and top - tabTop > 200 then
      panel:SetHeight(top - tabTop + 2)
    end
  end

  UpdateHeight()
  -- The first time the positions aren't known before the frame is drawn.
  C_Timer.After(0, UpdateHeight)
end

-------------------------------------------------------------------------------
-- Fill the parts that only exist in this panel
-------------------------------------------------------------------------------
function REP:UpdateDetailPanel(factionData, reputationGains, standingColor)
  local frame = REP_DetailPanel
  if not frame or not factionData then return end

  local name = factionData.name or ""
  if factionData.factionID == 1168 then name = name.." (guild)" end

  frame.factionID = factionData.factionID
  frame.FactionName:SetText(name)
  frame.Description:SetText(factionData.description or "")

  -- Standing bar
  local current = tonumber(reputationGains and reputationGains.reputationCurrent) or 0
  local needed = tonumber(reputationGains and reputationGains.reputationNeededCurrent) or 0
  local isCapped = factionData.reaction == 8 and needed <= 1

  local bar = frame.StandingBar
  if isCapped or needed <= 0 then
    bar:UpdateBarValues(0, 1, 1)
    bar:SetText(REP_DetailStandingName:GetText() or "")
  else
    bar:UpdateBarValues(0, needed, current)
    bar:SetText(FormatNumber(current).." / "..FormatNumber(needed))
  end
  bar:UpdateBarColor(ToColor(standingColor))

  -- Paragon (Exalted and higher): bar color of the Paragon Reputation addon when it is loaded (the text keeps the values).
  if REP.hasParagonReputationLoaded and REP.IsAtParagon and REP:IsAtParagon(factionData.factionID, factionData.reaction) then
    local r, g, b = REP:GetParagonReputationColor()
    if r then
      bar:UpdateBarColor(CreateColor(r, g, b))
      -- The standing text ("Paragon") below the faction name in the same color.
      if REP_DetailStandingName then REP_DetailStandingName:SetTextColor(r, g, b) end
    end
  end
  if type(bar.BonusIcon) == "table" then bar.BonusIcon:SetShown(factionData.hasBonusRepGain and true or false) end

  -- Faction options
  local index = REP:GetFactionIndexByID(factionData.factionID)
  local canToggleAtWar = factionData.canToggleAtWar and not factionData.isHeader and index > 0
  frame.AtWarCheckbox:SetChecked(factionData.atWarWith)
  frame.AtWarCheckbox:SetEnabledState(canToggleAtWar, RED_FONT_COLOR)

  local isInactive = index > 0 and REP:IsFactionInactiveByIndex(index)
  frame.InactiveCheckbox:SetChecked(isInactive)
  frame.InactiveCheckbox:SetEnabledState(factionData.canSetInactive and index > 0)

  local isWatched
  if REP.UseModernReputationUI then
    local watchedData = REP.Orig_GetWatchedFactionData and REP.Orig_GetWatchedFactionData()
    isWatched = (watchedData and watchedData.factionID == factionData.factionID) or false
  else
    isWatched = factionData.isWatched and true or false
  end
  local pending = frame.pendingWatch

  if pending then
    if pending.factionID == factionData.factionID and pending.checked ~= isWatched and GetTime() < pending.expires then
      isWatched = pending.checked
    else
      frame.pendingWatch = nil
    end
  end

  frame.WatchCheckbox:SetChecked(isWatched)
  frame.WatchCheckbox:SetEnabledState(true)

  frame:LayoutHeader()
end

-------------------------------------------------------------------------------
-- Visibility: the panel replaces the default details, so it follows them.
-------------------------------------------------------------------------------
-- "Show extended reputation detail frame": the details panel of the addon, or the default details of the game.
function REP:IsCustomDetailFrameEnabled()
  return not (REP_Data and REP_Data.Global and REP_Data.Global.ExtendDetails == false)
end

function REP:ApplyDetailFrameMode()
  local panel = REP_DetailPanel
  if not panel then return end

  if REP.UseClassicPanel then
    -- The reputation list shows and hides REP.Orig_ReputationDetailFrame, switch which frame that is.
    local default = ReputationDetailFrame
    local wasShown = (panel:IsShown() or (default and default:IsShown())) and REP:HasSelectedFaction()

    if REP:IsCustomDetailFrameEnabled() then
      REP.Orig_ReputationDetailFrame = panel
      if default then default:Hide() end
      if wasShown then panel:Show() end
    else
      REP.Orig_ReputationDetailFrame = default or panel
      panel:Hide()
      if wasShown and default then default:Show() end
    end

    if ReputationFrame:IsVisible() and REP_ReputationFrame_Update then REP_ReputationFrame_Update() end
  else
    REP:UpdateDetailPanelVisibility()
  end
end

function REP:UpdateDetailPanelVisibility()
  local frame = REP_DetailPanel
  if not frame then return end

  local show

  if not REP:IsCustomDetailFrameEnabled() then
    show = false
  elseif REP.SortedSelectionOpen and REP.IsSortedReputationListActive and REP:IsSortedReputationListActive() then
    -- A faction clicked in the list ordered by standing (UI/ReputationGuideSortedList.lua).
    show = ReputationFrame:IsShown()
  elseif REP.IsForever then
    -- Follows the collapse/expand arrow of the character frame.
    show = ReputationFrame:IsShown() and CharacterFrame and not CharacterFrame:IsRightPaneCollapsed()
  else
    -- Follows the default details popup (shown while a faction is selected).
    local defaultDetails = ReputationFrame.ReputationDetailFrame
    show = ReputationFrame:IsShown() and defaultDetails and defaultDetails:IsShown()
  end

  frame:SetShown(show and true or false)

  -- Retail, faction opened from the ordered list: the default details (and their close button) are hidden,
  -- the panel gets a close button of its own.
  if not REP.IsForever and not REP.UseClassicPanel then
    local defaultDetails = ReputationFrame.ReputationDetailFrame
    local ownClose = show and REP.SortedSelectionOpen and not (defaultDetails and defaultDetails:IsShown())

    if ownClose and not frame.SortedCloseButton then
      frame.SortedCloseButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
      frame.SortedCloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 1, 0)
      frame.SortedCloseButton:SetFrameLevel(frame:GetFrameLevel() + 600)
      REP:ElvSkin("close", frame.SortedCloseButton)
      frame.SortedCloseButton:SetScript("OnClick", function()
        REP.SortedSelectionOpen = false
        REP:UpdateDetailPanelVisibility()
        if REP.RefreshSortedReputationList then REP:RefreshSortedReputationList() end
      end)
    end
    if frame.SortedCloseButton then frame.SortedCloseButton:SetShown(ownClose and true or false) end
    if show then REP:UpdatePanelRenownButton(frame) end
  end
end

-- Only the size of the character frame is changed (a widget call), Blizzard's own collapse state is left alone,
-- so nothing in the default UI gets tainted.
function REP:UpdateCharacterFrameWidthForDetailPanel()
  if not CharacterFrame or not CHARACTER_FRAME_COLLAPSED_WIDTH or not CHARACTER_FRAME_WIDTH then return end

  local panelShown = REP_DetailPanel and REP_DetailPanel:IsShown() and ReputationFrame:IsShown()
  local collapsed = panelShown or CharacterFrame:IsRightPaneCollapsed()
  local width = collapsed and CHARACTER_FRAME_COLLAPSED_WIDTH or CHARACTER_FRAME_WIDTH

  if math.abs(CharacterFrame:GetWidth() - width) > 0.5 then
    CharacterFrame:SetWidth(width)
  end
end

function REP:ShowDetailPanelEmptyState()
  local frame = REP_DetailPanel
  if not frame then return end

  frame.FactionName:SetText(REP_TXT.selectFaction)
  frame.Description:SetText("")
  REP_DetailStandingName:SetText("")
  REP_DetailStandingNextValue:SetText("")
  frame.StandingBar:UpdateBarValues(0, 1, 0)
  frame.StandingBar:SetText("")
  frame.AtWarCheckbox:SetEnabledState(false)
  frame.InactiveCheckbox:SetEnabledState(false)
  frame.WatchCheckbox:SetEnabledState(false)

  REP.UpdateList = {}
  REP_UpdateList_Update()
end
