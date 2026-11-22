-------------------------------------------------------------------------------
-- Reputation Guide | Order by Standing for the modern reputation frame (World of Warcraft: Forever and retail) --
-- The default list can't be reordered without tainting it, so the addon shows its own list on top of it:
-- Paragon > Renown > Exalted > Revered > Honored > Friendly > Neutral > Unfriendly > Hostile > Hated.
-- Friendships start at Neutral, two friendship levels per standing, the highest level counts as Exalted.
-- Only addon owned frames are created; the default list is only moved off screen (anchors and alpha) while this one is shown,
-- so it can't catch the mouse or the mouse wheel.
-------------------------------------------------------------------------------
local addonName, REP = ...

local ROW_HEIGHT = 26
local GROUP_RENOWN, GROUP_PARAGON = 9, 10
local RENOWN_COLOR = { r = 0.0, g = 0.6, b = 1.0 }
local FRIENDSHIP_COLOR = { r = 0.0, g = 0.6, b = 0.1 }

local listFrame
local collapsedGroups = {}
local entries = {}

local function IsSecret(value)
  return issecretvalue and issecretvalue(value) or false
end

function REP:IsSortedReputationListActive()
  return listFrame ~= nil and REP:GetSortByStanding()
end

---------------------------
-- Data
---------------------------
local function GroupLabel(group)
  if group == GROUP_RENOWN then return REP_TXT.renown or "Renown" end
  if group == GROUP_PARAGON then return REP:getFactionLabel("paragon") end
  return GetText("FACTION_STANDING_LABEL"..group, UnitSex("player")) or tostring(group)
end

local function StandingColor(reaction)
  local color = FACTION_BAR_COLORS and FACTION_BAR_COLORS[reaction]
  return color or { r = 0.5, g = 0.5, b = 0.5 }
end

-- Paragon progress like the default list shows it: the part towards the next cache, full while a reward waits.
local function GetParagonProgress(factionID)
  if not (REP.Orig_IsFactionParagon and REP.Orig_GetFactionParagonInfo and REP.Orig_IsFactionParagon(factionID)) then return end
  local current, threshold, _, hasRewardPending, tooLowLevel = REP.Orig_GetFactionParagonInfo(factionID)
  if tooLowLevel or not current or not threshold or threshold <= 0 then return end
  if IsSecret(current) or IsSecret(threshold) then return end
  local value = current % threshold
  local progress = value
  if hasRewardPending then value = threshold end
  return value, threshold, hasRewardPending, progress
end

local function ApplyParagon(entry, factionID)
  local value, threshold, pending, progress = GetParagonProgress(factionID)
  if not value then return false end
  entry.value, entry.max = value, threshold
  -- The text format of the Paragon Reputation addon when it is loaded.
  entry.text = REP:FormatParagonReputationText(progress, threshold, pending) or REP:getFactionLabel("paragon")
  entry.paragon = true
  entry.rewardPending = pending and true or false
  -- Hovering the bar shows the values like the default list (past the threshold while a reward waits).
  entry.hoverValue = pending and (progress + threshold) or progress
  return true
end

-- One faction of the list: group, bar values and the order inside the group.
local function DescribeFaction(index, data)
  local factionID = data.factionID
  local entry = { index = index, factionID = factionID, name = data.name }

  if REP.Orig_IsMajorFaction and REP.Orig_IsMajorFaction(factionID) then
    local major = REP.Orig_GetMajorFactionData and REP.Orig_GetMajorFactionData(factionID)
    local level = major and major.renownLevel or 0
    entry.group = GROUP_RENOWN
    entry.value = major and major.renownReputationEarned or 0
    entry.max = major and major.renownLevelThreshold or 1
    entry.text = (REP_TXT.renown or "Renown").." "..level
    entry.color = RENOWN_COLOR
    if REP.Orig_HasMaximumRenown and REP.Orig_HasMaximumRenown(factionID) then
      if ApplyParagon(entry, factionID) then
        entry.group = GROUP_PARAGON
        entry.order = entry.max - entry.value
        return entry
      else
        entry.value, entry.max = 1, 1
      end
    end
    entry.order = -(level * 1000000 + (entry.max > 0 and entry.value / entry.max or 0) * 1000)
    return entry
  end

  local friendship = C_GossipInfo and C_GossipInfo.GetFriendshipReputation and C_GossipInfo.GetFriendshipReputation(factionID)
  if friendship and friendship.friendshipFactionID and friendship.friendshipFactionID > 0 then
    local ranks = C_GossipInfo.GetFriendshipReputationRanks and C_GossipInfo.GetFriendshipReputationRanks(factionID)
    local level = ranks and ranks.currentLevel or 1
    local maxLevel = ranks and ranks.maxLevel or level

    -- Only the first level is Neutral, then two levels per standing (Friendly from level 2), the highest level is Exalted.
    if level >= maxLevel and maxLevel > 1 then
      entry.group = 8
    elseif level <= 1 then
      entry.group = 4
    else
      entry.group = math.min(7, 5 + math.floor((level - 2) / 2))
    end

    local minValue = friendship.reactionThreshold or 0
    local nextValue = friendship.nextThreshold
    entry.value = (friendship.standing or 0) - minValue
    entry.max = nextValue and (nextValue - minValue) or 0
    if entry.max <= 0 then entry.value, entry.max = 1, 1 end
    entry.text = friendship.reaction or ""
    entry.color = FRIENDSHIP_COLOR
    entry.order = -(level * 1000000) + (entry.max - entry.value)
    if entry.group == 8 and ApplyParagon(entry, factionID) then
      entry.group = GROUP_PARAGON
      entry.order = entry.max - entry.value
    end
    return entry
  end

  local reaction = data.reaction or 4
  local minValue = data.currentReactionThreshold or 0
  entry.group = reaction
  entry.value = (data.currentStanding or 0) - minValue
  entry.max = (data.nextReactionThreshold or minValue) - minValue
  entry.text = GetText("FACTION_STANDING_LABEL"..reaction, UnitSex("player"))
  entry.color = StandingColor(reaction)

  if reaction >= 8 and ApplyParagon(entry, factionID) then
    entry.group = GROUP_PARAGON
  end

  if entry.max <= 0 then entry.value, entry.max = 1, 1 end
  entry.order = entry.max - entry.value -- closest to the next standing first
  return entry
end

local function BuildEntries()
  local groups = {}

  for index = 1, REP.Orig_GetNumFactions() do
    local data = REP:GetFactionDataByIndex(index)
    local factionID = data and data.factionID

    if factionID and not IsSecret(factionID) and factionID > 0 and (not data.isHeader or data.isHeaderWithRep)
      and not REP:IsFactionInactiveByIndex(index) then
      local entry = DescribeFaction(index, data)
      groups[entry.group] = groups[entry.group] or {}
      table.insert(groups[entry.group], entry)
    end
  end

  wipe(entries)
  for group = GROUP_PARAGON, 1, -1 do
    local factions = groups[group]
    if factions and #factions > 0 then
      table.sort(factions, function(a, b)
        if a.order ~= b.order then return a.order < b.order end
        return (a.name or "") < (b.name or "")
      end)

      table.insert(entries, { header = true, group = group, count = #factions })
      if not collapsedGroups[group] then
        for _, faction in ipairs(factions) do table.insert(entries, faction) end
      end
    end
  end
end

---------------------------
-- Rows
---------------------------
local function SetupRow(row)
  if row.repSetup then return end
  row.repSetup = true
  row:SetHeight(ROW_HEIGHT)
  row:RegisterForClicks("LeftButtonUp")

  local highlight = row:CreateTexture(nil, "HIGHLIGHT")
  highlight:SetAllPoints()
  highlight:SetColorTexture(1, 1, 1, 0.08)

  row.Selected = row:CreateTexture(nil, "BACKGROUND")
  row.Selected:SetAllPoints()
  row.Selected:SetColorTexture(1, 0.82, 0, 0.15)

  row.Toggle = row:CreateTexture(nil, "ARTWORK")
  row.Toggle:SetSize(14, 14)
  row.Toggle:SetPoint("LEFT", row, "LEFT", 6, 0)

  row.HeaderText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  row.HeaderText:SetPoint("LEFT", row.Toggle, "RIGHT", 6, 0)
  row.HeaderText:SetJustifyH("LEFT")

  row.Bar = CreateFrame("StatusBar", nil, row)
  row.Bar:SetSize(120, 15)
  row.Bar:SetPoint("RIGHT", row, "RIGHT", -22, 0) -- room for the paragon icon on the right
  row.Bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
  -- Hovering the bar shows its values (as the default list does), a click on it still selects the row.
  row.Bar:EnableMouse(true)
  row.Bar:SetScript("OnEnter", function()
    local entry = row.entry
    row:LockHighlight()
    if entry and not entry.header and entry.max and entry.max > 1 then
      row.Bar.Text:SetText(BreakUpLargeNumbers(entry.hoverValue or entry.value).." / "..BreakUpLargeNumbers(entry.max))
    end
    row:GetScript("OnEnter")(row)
  end)
  row.Bar:SetScript("OnLeave", function()
    row:UnlockHighlight()
    if row.entry then row.Bar.Text:SetText(row.entry.text or "") end
    row:GetScript("OnLeave")(row)
  end)
  row.Bar:SetScript("OnMouseUp", function(_, button)
    if button == "LeftButton" and row:IsMouseOver() then row:Click() end
  end)
  REP:ElvSkin("statusBar", row.Bar)
  local barBackground = row.Bar:CreateTexture(nil, "BACKGROUND")
  barBackground:SetAllPoints()
  barBackground:SetColorTexture(0, 0, 0, 0.7)
  row.Bar.Text = row.Bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  row.Bar.Text:SetPoint("CENTER")

  -- Paragon rewards: the bag, glowing with a check mark while a reward waits (like the default list).
  row.Paragon = CreateFrame("Frame", nil, row)
  row.Paragon:SetSize(16, 16)
  row.Paragon:SetPoint("LEFT", row.Bar, "RIGHT", 2, 0)
  row.Paragon:EnableMouse(true)
  -- The rewards tooltip of the default UI where it exists, otherwise the row tooltip.
  row.Paragon:SetScript("OnEnter", function(self)
    local entry = row.entry
    if not entry or not entry.factionID then return end
    self.factionID = entry.factionID
    if ReputationUtil and ReputationUtil.ShowParagonRewardsTooltip then
      ReputationUtil.ShowParagonRewardsTooltip(self, entry.factionID)
    elseif ReputationParagonFrame_SetupParagonTooltip then
      EmbeddedItemTooltip:SetOwner(self, "ANCHOR_RIGHT")
      ReputationParagonFrame_SetupParagonTooltip(self)
      EmbeddedItemTooltip:Show()
    else
      row:GetScript("OnEnter")(row)
    end
  end)
  row.Paragon:SetScript("OnLeave", function()
    if EmbeddedItemTooltip then EmbeddedItemTooltip:Hide() end
    GameTooltip:Hide()
  end)
  row.Paragon:SetScript("OnMouseUp", function() row:Click() end)
  row.Paragon.Glow = row.Paragon:CreateTexture(nil, "BACKGROUND")
  row.Paragon.Glow:SetPoint("CENTER")
  row.Paragon.Glow:SetSize(26, 26)
  row.Paragon.Glow:SetAtlas("ParagonReputation_Glow")
  row.Paragon.Glow:SetBlendMode("ADD")
  row.Paragon.Icon = row.Paragon:CreateTexture(nil, "ARTWORK")
  row.Paragon.Icon:SetAllPoints()
  row.Paragon.Icon:SetAtlas("ParagonReputation_Bag")
  row.Paragon.Check = row.Paragon:CreateTexture(nil, "OVERLAY")
  row.Paragon.Check:SetSize(10, 10)
  row.Paragon.Check:SetPoint("BOTTOMRIGHT", row.Paragon, "BOTTOMRIGHT", 2, -2)
  row.Paragon.Check:SetAtlas("ParagonReputation_Checkmark")
  row.Paragon:Hide()

  row.Name = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  row.Name:SetPoint("LEFT", row, "LEFT", 24, 0)
  row.Name:SetPoint("RIGHT", row.Bar, "LEFT", -6, 0)
  row.Name:SetJustifyH("LEFT")
  row.Name:SetWordWrap(false)

  row:SetScript("OnEnter", function(self)
    local entry = self.entry
    if not entry or entry.header then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine(entry.name or "", 1, 1, 1)
    GameTooltip:AddLine(entry.text or "", entry.color.r, entry.color.g, entry.color.b)
    if entry.max and entry.max > 1 then
      GameTooltip:AddLine(BreakUpLargeNumbers(entry.value).." / "..BreakUpLargeNumbers(entry.max), 1, 1, 1)
    end

    GameTooltip:Show()
  end)
  row:SetScript("OnLeave", function(self)
    if GameTooltip:GetOwner() == self then GameTooltip:Hide() end
  end)

  row:SetScript("OnClick", function(self)
    local entry = self.entry
    if not entry then return end

    if entry.header then
      collapsedGroups[entry.group] = not collapsedGroups[entry.group]
      REP:RefreshSortedReputationList()
    else
      REP:SelectSortedFaction(entry.factionID)
    end
  end)
end

local function UpdateRow(row, entry)
  row.entry = entry
  if not entry then return end

  if entry.header then
    row.Toggle:Show()
    row.Toggle:SetTexture(collapsedGroups[entry.group] and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up")
    row.HeaderText:Show()
    row.HeaderText:SetText(GroupLabel(entry.group).." ("..entry.count..")")
    row.Name:Hide()
    row.Bar:Hide()
    row.Paragon:Hide()
    row.Selected:Hide()
  else
    row.Toggle:Hide()
    row.HeaderText:Hide()
    row.Name:Show()
    row.Name:SetText(entry.name or "")
    row.Bar:Show()
    row.Bar:SetMinMaxValues(0, entry.max)
    row.Bar:SetValue(entry.value)
    local r, g, b = entry.color.r, entry.color.g, entry.color.b
    if entry.paragon then
      -- The bar color of the Paragon Reputation addon when it is loaded.
      local pr, pg, pb = REP:GetParagonReputationColor()
      if pr then r, g, b = pr, pg, pb end
    end
    row.Bar:SetStatusBarColor(r, g, b)
    row.Bar.Text:SetText(entry.text or "")
    row.Paragon:SetShown(entry.paragon and true or false)
    row.Paragon.Glow:SetShown(entry.rewardPending and true or false)
    row.Paragon.Check:SetShown(entry.rewardPending and true or false)
    local panelOpen = REP_DetailPanel and REP_DetailPanel:IsShown()
    row.Selected:SetShown(panelOpen and entry.factionID == REP.SelectedFactionID and true or false)
  end
end

-- Only the visible rows, after a selection change.
local function UpdateRows()
  if not listFrame then return end
  listFrame.ScrollBox:ForEachFrame(function(row) UpdateRow(row, row.entry) end)
end

local function SetDataProvider()
  local dataProvider = CreateDataProvider()
  for _, entry in ipairs(entries) do dataProvider:Insert(entry) end
  listFrame.ScrollBox:SetDataProvider(dataProvider, ScrollBoxConstants and ScrollBoxConstants.RetainScrollPosition)
end

---------------------------
-- Showing the list instead of the default one
---------------------------
-- The default list stays shown (it keeps laying itself out), it is only moved off screen with alpha 0,
-- so the mouse and the mouse wheel can't reach it. Its own anchors are restored when it comes back.
local OFFSCREEN_X = -10000
local savedPoints = {}
local defaultListAway = false
local movingDefaultList = false

local function DefaultListFrames()
  return { ReputationFrame.ScrollBox, ReputationFrame.ScrollBar }
end

-- Invisible copies of the default list frames with the same anchors, so this list follows every size change
-- of the reputation/character frame exactly like the default one would (also while that one is off screen).
local proxies = {}

local function AnchorListFrame()
  local frames = DefaultListFrames()
  for _, frame in ipairs(frames) do
    proxies[frame] = proxies[frame] or CreateFrame("Frame", nil, ReputationFrame)
  end

  for _, frame in ipairs(frames) do
    local proxy = proxies[frame]
    local points = savedPoints[frame]
    if not points then
      points = {}
      for i = 1, frame:GetNumPoints() do points[i] = { frame:GetPoint(i) } end
    end
    if #points == 0 then return false end

    proxy:ClearAllPoints()
    proxy:SetSize(frame:GetSize()) -- for frames with one anchor and their own size
    for _, point in ipairs(points) do
      local anchor, relativeTo, relativePoint, x, y = unpack(point)
      proxy:SetPoint(anchor, proxies[relativeTo] or relativeTo, relativePoint, x, y)
    end
  end

  local box, bar = proxies[ReputationFrame.ScrollBox], proxies[ReputationFrame.ScrollBar] or proxies[ReputationFrame.ScrollBox]
  listFrame:ClearAllPoints()
  listFrame:SetPoint("TOPLEFT", box, "TOPLEFT", 0, 0)
  listFrame:SetPoint("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 0, 0)
  return true
end

local function MoveDefaultListAway()
  if defaultListAway then return true end

  local frames = DefaultListFrames()
  local moved = {}
  for _, frame in ipairs(frames) do
    moved[frame] = true
    local points = {}
    for i = 1, frame:GetNumPoints() do points[i] = { frame:GetPoint(i) } end
    if #points == 0 then return false end
    savedPoints[frame] = points
  end
  AnchorListFrame()

  movingDefaultList = true
  for _, frame in ipairs(frames) do
    local points = savedPoints[frame]

    frame:ClearAllPoints()
    for _, point in ipairs(points) do
      local anchor, relativeTo, relativePoint, x, y = unpack(point)
      -- Anchored to the other moved frame: it moves along already.
      if not moved[relativeTo] then x = (x or 0) + OFFSCREEN_X end
      frame:SetPoint(anchor, relativeTo, relativePoint, x, y)
    end
    frame:SetAlpha(0)
  end
  movingDefaultList = false

  defaultListAway = true
  return true
end

local function RestoreDefaultList()
  if not defaultListAway then return end

  movingDefaultList = true
  for _, frame in ipairs(DefaultListFrames()) do
    local points = savedPoints[frame]
    if points then
      frame:ClearAllPoints()
      for _, point in ipairs(points) do frame:SetPoint(unpack(point)) end
    end
    frame:SetAlpha(1)
  end
  movingDefaultList = false

  defaultListAway = false
end

-- The default UI may anchor its list again (frame size changes): keep it away while this list is shown.
local function OnDefaultListSetPoint()
  if movingDefaultList or not defaultListAway then return end
  defaultListAway = false
  for _, frame in ipairs(DefaultListFrames()) do frame:SetAlpha(1) end
  C_Timer.After(0, function()
    if REP:IsSortedReputationListActive() and ReputationFrame:IsVisible() then MoveDefaultListAway() end
  end)
end

local function SetDefaultListShown(shown)
  if shown then
    RestoreDefaultList()
  elseif not MoveDefaultListAway() then
    -- Not laid out yet (first show after a reload), try again after it is drawn.
    for _, frame in ipairs(DefaultListFrames()) do frame:SetAlpha(0) end
    C_Timer.After(0, function()
      if REP:IsSortedReputationListActive() then MoveDefaultListAway() end
    end)
  end
end

function REP:RefreshSortedReputationList()
  if not listFrame then return end

  local active = REP:IsSortedReputationListActive()
  listFrame:SetShown(active)
  SetDefaultListShown(not active)

  if REP_OrderByStandingCheckBox then REP_OrderByStandingCheckBox:SetChecked(REP:GetSortByStanding() and true or false) end

  if not active then
    if REP.SortedSelectionOpen then
      REP.SortedSelectionOpen = false
      REP:UpdateDetailPanelVisibility()
    end
    return
  end

  if not ReputationFrame:IsVisible() then return end
  BuildEntries()
  SetDataProvider()
end

local refreshPending
local function RequestRefresh()
  if refreshPending then return end
  refreshPending = true
  C_Timer.After(0.1, function()
    refreshPending = false
    if listFrame and listFrame:IsVisible() then REP:RefreshSortedReputationList() end
  end)
end

-- The default list selects the same faction (a plain API call, the default frames themselves aren't touched),
-- so it is the highlighted one once the ordered list is switched off again.
local function SelectInDefaultList(factionID)
  if not (factionID and REP.Orig_SetSelectedFaction) then return end
  local index = REP:GetFactionIndexByID(factionID)
  if index and index > 0 then REP.Orig_SetSelectedFaction(index) end
end

-- Clicking a faction opens the details panel of the addon for it, clicking it again closes it.
function REP:SelectSortedFaction(factionID)
  if REP.SortedSelectionOpen and REP.SelectedFactionID == factionID and REP_DetailPanel and REP_DetailPanel:IsShown() then
    REP.SortedSelectionOpen = false
  else
    REP.SelectedFactionID = factionID
    REP.SortedSelectionOpen = true
    SelectInDefaultList(factionID)
  end

  REP:PlayCheckBoxSound(REP.SortedSelectionOpen)
  REP:UpdateDetailPanelVisibility()
  if REP_DetailPanel and REP_DetailPanel:IsVisible() then REP:FillReputationDetailFrameWithData() end
  UpdateRows()
end

-- Next to the options button without covering it, the reputation filter dropdown or the frame edge.
function REP:PositionOrderByStandingCheckBox()
  local check = REP_OrderByStandingCheckBox
  if not check then return end
  local gear = REP_OptionsButton
  local text = REP_OrderByStandingCheckBoxText
  local textWidth = text and math.ceil(text:GetStringWidth() or 0) or 0
  if textWidth <= 0 then textWidth = 110 end
  local boxWidth = check:GetWidth() or 24
  local needed = boxWidth + textWidth + 8

  check:SetHitRectInsets(0, -(textWidth + 4), 0, 0)
  check:ClearAllPoints()

  if not gear then
    check:SetPoint("TOPLEFT", ReputationFrame, "TOPLEFT", 90, -30)
    return
  end

  local placeLeft = REP.IsForever and true or false
  local gearLeft, gearRight = gear:GetLeft(), gear:GetRight()
  if gearLeft and gearRight then
    local limitRight = ReputationFrame:GetRight()
    local dropdown = ReputationFrame.filterDropdown or ReputationFrame.FilterDropdown
    if dropdown and dropdown:IsShown() and dropdown:GetLeft() and dropdown:GetLeft() > gearRight then
      limitRight = dropdown:GetLeft()
    end
    local limitLeft = ReputationFrame:GetLeft()
    local fitsRight = limitRight and (gearRight + 4 + needed <= limitRight)
    local fitsLeft = limitLeft and (gearLeft - 4 - needed >= limitLeft)
    if fitsRight then
      placeLeft = false
    elseif fitsLeft then
      placeLeft = true
    end
  end

  if placeLeft then
    check:SetPoint("RIGHT", gear, "LEFT", -(textWidth + 8), 0)
  else
    check:SetPoint("LEFT", gear, "RIGHT", 4, 0)
  end
end

---------------------------
-- Collapsed headers: opened when the ordered list is switched on, closed again when it is switched off
---------------------------
local function HeaderKey(data)
  if data.factionID and not IsSecret(data.factionID) and data.factionID > 0 then return data.factionID end
  return data.name
end

local function IsInactiveHeader(data)
  return FACTION_INACTIVE and data.name == FACTION_INACTIVE
end

-- Opens every collapsed header (also headers inside headers), except the one with the inactive factions.
function REP:ExpandHeadersForSortedList()
  if not REP.Orig_ExpandFactionHeader then return end
  local profile = REP:GetCharacterProfile()
  local expanded = {}

  for _ = 1, 10 do
    local changed = false
    -- From the bottom up, so opening a header doesn't move the ones still to come.
    for index = REP.Orig_GetNumFactions(), 1, -1 do
      local data = REP:GetFactionDataByIndex(index)
      if data and data.isHeader and data.isCollapsed and not IsInactiveHeader(data) then
        local key = HeaderKey(data)
        if key then table.insert(expanded, key) end
        REP.Orig_ExpandFactionHeader(index)
        changed = true
      end
    end
    if not changed then break end
  end

  if profile then profile.SortExpandedHeaders = #expanded > 0 and expanded or nil end
end

-- Closes the headers that were opened for the ordered list (the ones the player opened himself stay open).
function REP:RestoreHeadersAfterSortedList()
  local profile = REP:GetCharacterProfile()
  local expanded = profile and profile.SortExpandedHeaders
  if profile then profile.SortExpandedHeaders = nil end
  if not expanded or not REP.Orig_CollapseFactionHeader then return end

  local collapse = {}
  for _, key in ipairs(expanded) do collapse[key] = true end

  for index = REP.Orig_GetNumFactions(), 1, -1 do
    local data = REP:GetFactionDataByIndex(index)
    if data and data.isHeader and not data.isCollapsed and collapse[HeaderKey(data)] then
      REP.Orig_CollapseFactionHeader(index)
    end
  end
end

function REP:InitSortedReputationList()
  if listFrame or not ReputationFrame or not ReputationFrame.ScrollBox or not CreateScrollBoxListLinearView or not ScrollUtil then return end

  local scrollBox = ReputationFrame.ScrollBox
  local scrollBar = ReputationFrame.ScrollBar

  listFrame = CreateFrame("Frame", "REP_SortedReputationList", ReputationFrame)
  -- Same spot as the default list (anchored to copies of it once it is moved away, see AnchorListFrame).
  listFrame:SetPoint("TOPLEFT", scrollBox, "TOPLEFT", 0, 0)
  listFrame:SetPoint("BOTTOMRIGHT", scrollBar or scrollBox, "BOTTOMRIGHT", 0, 0)
  for _, frame in ipairs(DefaultListFrames()) do hooksecurefunc(frame, "SetPoint", OnDefaultListSetPoint) end
  listFrame:SetFrameLevel(math.max(scrollBox:GetFrameLevel(), scrollBar and scrollBar:GetFrameLevel() or 0) + 10)
  listFrame:EnableMouse(true)
  listFrame:Hide()

  local background = listFrame:CreateTexture(nil, "BACKGROUND")
  background:SetAllPoints()
  background:SetColorTexture(0.04, 0.04, 0.04, 0.9)

  listFrame.ScrollBox = CreateFrame("Frame", nil, listFrame, "WowScrollBoxList")
  listFrame.ScrollBox:SetPoint("TOPLEFT", listFrame, "TOPLEFT", 4, -4)
  listFrame.ScrollBox:SetPoint("BOTTOMRIGHT", listFrame, "BOTTOMRIGHT", -20, 4)

  listFrame.ScrollBar = CreateFrame("EventFrame", nil, listFrame, "MinimalScrollBar")
  REP:ElvSkin("trimScrollBar", listFrame.ScrollBar)
  listFrame.ScrollBar:SetPoint("TOPLEFT", listFrame.ScrollBox, "TOPRIGHT", 6, 0)
  listFrame.ScrollBar:SetPoint("BOTTOMLEFT", listFrame.ScrollBox, "BOTTOMRIGHT", 6, 0)

  local view = CreateScrollBoxListLinearView()
  view:SetElementExtent(ROW_HEIGHT)
  view:SetElementInitializer("Button", function(row, entry)
    SetupRow(row)
    UpdateRow(row, entry)
  end)
  ScrollUtil.InitScrollBoxListWithScrollBar(listFrame.ScrollBox, listFrame.ScrollBar, view)

  listFrame:SetScript("OnShow", function() REP:RefreshSortedReputationList() end)

  for _, event in ipairs({ "UPDATE_FACTION", "MAJOR_FACTION_RENOWN_LEVEL_CHANGED", "MAJOR_FACTION_UNLOCKED" }) do
    REP:RegisterEventSafe(listFrame, event)
  end
  listFrame:SetScript("OnEvent", RequestRefresh)

  ReputationFrame:HookScript("OnShow", function() REP:RefreshSortedReputationList() end)
  ReputationFrame:HookScript("OnHide", function()
    REP.SortedSelectionOpen = false
    SetDefaultListShown(true)
  end)

  -- Retail: the close button on the panel belongs to the default details, it also closes a faction opened here.
  local defaultDetails = ReputationFrame.ReputationDetailFrame
  if defaultDetails and defaultDetails.CloseButton then
    defaultDetails.CloseButton:HookScript("OnClick", function()
      if REP.SortedSelectionOpen then
        REP.SortedSelectionOpen = false
        REP:UpdateDetailPanelVisibility()
        UpdateRows()
      end
    end)
  end

  -- The "Order by Standing" checkbox of the addon, next to its options button.
  if REP_OrderByStandingCheckBox then
    local check = REP_OrderByStandingCheckBox
    if REP_OrderByStandingCheckBoxText then REP_OrderByStandingCheckBoxText:SetText(REP_TXT.orderByStanding) end
    REP:PositionOrderByStandingCheckBox()
    if not check.repPositionHooked then
      check.repPositionHooked = true
      ReputationFrame:HookScript("OnShow", function() REP:PositionOrderByStandingCheckBox() end)
      ReputationFrame:HookScript("OnSizeChanged", function() REP:PositionOrderByStandingCheckBox() end)
    end
    check:SetFrameLevel(math.max(listFrame:GetFrameLevel() + 5, ReputationFrame:GetFrameLevel() + 20))
    check:SetScript("OnClick", function(self)
      REP:SetSortByStanding(self:GetChecked())
      REP:PlayCheckBoxSound(REP:GetSortByStanding())
      if REP:GetSortByStanding() then
        REP:ExpandHeadersForSortedList()
        REP:RefreshSortedReputationList()
      else
        local openedFactionID = REP.SortedSelectionOpen and REP.SelectedFactionID
        REP:RestoreHeadersAfterSortedList()
        -- Closing headers changes the indexes: select the faction again (if it is still in the list), then
        -- an open panel takes over the faction the default list has selected.
        if openedFactionID then SelectInDefaultList(openedFactionID) end
        REP.SortedSelectionOpen = false
        REP:RefreshSortedReputationList()
        REP:SyncSelectedFactionFromDefaultUI()
        REP:UpdateDetailPanelVisibility()
        if REP_DetailPanel and REP_DetailPanel:IsShown() and REP.FillReputationDetailFrameWithData then
          REP:FillReputationDetailFrameWithData()
        end
      end
    end)
    check:Show()
  end

  REP:RefreshSortedReputationList()
end
