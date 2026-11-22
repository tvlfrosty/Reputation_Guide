----------------------------------------------------------
-- Reputation Guide | Data checks --
-- /rep verify    : checks the NPC and quest IDs of the reputation sources against the game.
-- /rep nosources : lists the factions of this character without reputation sources (with their factionID).
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

local IDS_PER_LINE = 12
local WAIT_SECONDS = 5
local ROUNDS = 3

local function QuestTitle(questID)
  if C_QuestLog and C_QuestLog.GetTitleForQuestID then
    local title = C_QuestLog.GetTitleForQuestID(questID)
    if title and title ~= "" then return title end
    if C_QuestLog.RequestLoadQuestByID then C_QuestLog.RequestLoadQuestByID(questID) end
    return
  end

  return REP:GetQuestTitleByID(questID)
end

-- Title without asking the server again (Classic: C_QuestLog.GetQuestInfo).
local function CachedQuestTitle(questID)
  if C_QuestLog and C_QuestLog.GetTitleForQuestID then
    local title = C_QuestLog.GetTitleForQuestID(questID)
    if title and title ~= "" then return title end
    return
  end
  if C_QuestLog and C_QuestLog.GetQuestInfo then
    local title = C_QuestLog.GetQuestInfo(questID)
    if type(title) == "string" and title ~= "" then return title end
  end
end

local function CollectIDs()
  local npcs, quests = {}, {}

  -- Only the sources that apply to this client (other expansions' quests don't exist here).
  for _, factionSources in pairs(REP.Sources or {}) do
    for _, source in ipairs(factionSources) do
      if source.kind == "mob" and source.npc then
        npcs[source.npc] = npcs[source.npc] or source.name or ""
      elseif source.kind == "quest" and type(source.id) == "number" and source.id >= 100 then
        quests[source.id] = quests[source.id] or (REP.QuestFallbackNames and REP.QuestFallbackNames[source.id]) or false
      end
    end
  end

  return npcs, quests
end

-- Items with details (names) one per line, plain IDs several per line, so the whole list fits in the chat.
local function PrintList(title, lines)
  if #lines == 0 then return end

  REP:Print(REP.HELP_COLOUR..title.."|r ("..#lines..")", true)

  local ids = {}
  for _, line in ipairs(lines) do
    if string.match(line, "^%d+$") then
      table.insert(ids, line)
    else
      REP:Print("  "..line, true)
    end
  end

  for i = 1, #ids, IDS_PER_LINE do
    REP:Print("  "..table.concat(ids, ", ", i, math.min(i + IDS_PER_LINE - 1, #ids)), true)
  end
end

-- Retail/modern clients: quest data is requested in small batches and the answer of the server is waited for
-- (QUEST_DATA_LOAD_RESULT). Asking for hundreds of quests at once makes the server drop most requests, so they
-- looked missing. A quest the server answers "no" for doesn't exist on this client (removed).
local QUEST_BATCH = 20
local BATCH_DELAY = 0.3
local ANSWER_TIMEOUT = 10

local function LoadQuestTitles(questIDs, done)
  local results = {} -- questID -> true (loaded) / false (doesn't exist)
  local pending = {}
  local queue = {}
  for questID in pairs(questIDs) do
    if CachedQuestTitle(questID) then
      results[questID] = true
    else
      table.insert(queue, questID)
    end
  end
  table.sort(queue)

  local listener = CreateFrame("Frame")
  local finished = false
  local lastActivity = GetTime()

  local function Finish()
    if finished then return end
    finished = true
    listener:UnregisterAllEvents()
    listener:SetScript("OnEvent", nil)
    done(results)
  end

  listener:RegisterEvent("QUEST_DATA_LOAD_RESULT")
  listener:SetScript("OnEvent", function(_, _, questID, success)
    if pending[questID] then
      pending[questID] = nil
      results[questID] = success and true or false
      lastActivity = GetTime()
    end
  end)

  local position = 1
  local function NextBatch()
    if finished then return end
    local last = math.min(position + QUEST_BATCH - 1, #queue)
    for i = position, last do
      local questID = queue[i]
      pending[questID] = true
      C_QuestLog.RequestLoadQuestByID(questID)
    end
    position = last + 1
    lastActivity = GetTime()

    if position <= #queue then
      C_Timer.After(BATCH_DELAY, NextBatch)
    else
      -- Wait for the last answers (or until the server stays quiet for a while).
      local function WaitForAnswers()
        if finished then return end
        if next(pending) == nil or GetTime() - lastActivity >= ANSWER_TIMEOUT then
          Finish()
        else
          C_Timer.After(0.5, WaitForAnswers)
        end
      end
      C_Timer.After(0.5, WaitForAnswers)
    end
  end

  if #queue == 0 then Finish() else NextBatch() end
end

local function ReportResults(npcs, quests, questResults, noQuestLoading)
  local compareNames = GetLocale() == "enUS" or GetLocale() == "enGB"
  local npcMissing, npcDifferent, questMissing, questRemoved, questDifferent = {}, {}, {}, {}, {}
  local npcCount, questCount = 0, 0

  for npcID, expected in pairs(npcs) do
    npcCount = npcCount + 1
    local name = REP:GetNpcName(npcID)
    if not name then
      table.insert(npcMissing, npcID.." ("..expected..")")
    elseif compareNames and name ~= expected then
      table.insert(npcDifferent, npcID.." ("..expected..") = "..name)
    end
  end

  for questID, expected in pairs(quests) do
    questCount = questCount + 1
    local title = CachedQuestTitle(questID) or QuestTitle(questID)
    local label = questID..(expected and " ("..expected..")" or "")
    if not title then
      if questResults and questResults[questID] == false then
        table.insert(questRemoved, label)
      else
        table.insert(questMissing, label)
      end
    elseif compareNames and expected and title ~= expected then
      table.insert(questDifferent, questID.." ("..expected..") = "..title)
    end
  end

  table.sort(npcMissing) table.sort(npcDifferent) table.sort(questMissing) table.sort(questRemoved) table.sort(questDifferent)

  -- Clients that can't ask the server for quest data only know the quests the character has seen.
  local missingText = noQuestLoading and "not in the quest cache of this client (can't be checked here)" or "no answer from the server"
  REP:Print(string.format("%s%s|r: %d NPCs (%d not found, %d different name), %d quests (%d not on this client, %d %s, %d different name)",
    REP.HELP_COLOUR, addonName, npcCount, #npcMissing, #npcDifferent, questCount, #questRemoved, #questMissing, missingText, #questDifferent), true)
  PrintList("NPCs not found", npcMissing)
  PrintList("NPCs with a different name", npcDifferent)
  PrintList("Quests that don't exist on this client", questRemoved)
  PrintList(noQuestLoading and "Quests not in the quest cache" or "Quests without an answer from the server", questMissing)
  PrintList("Quests with a different name", questDifferent)

  if REP_Data and REP_Data.Global then
    REP_Data.Global.LastVerify = { npcMissing = npcMissing, npcDifferent = npcDifferent, questRemoved = questRemoved, questMissing = questMissing, questDifferent = questDifferent }
  end
end

function REP:VerifySourceIDs()
  if REP.VerifyRunning then
    REP:Print(REP.HELP_COLOUR..addonName.."|r: the check is already running.", true)
    return
  end

  local npcs, quests = CollectIDs()
  for npcID in pairs(npcs) do REP:GetNpcName(npcID) end

  local count = 0
  for _ in pairs(quests) do count = count + 1 end

  if C_QuestLog and C_QuestLog.RequestLoadQuestByID and (C_QuestLog.GetTitleForQuestID or C_QuestLog.GetQuestInfo) then
    REP.VerifyRunning = true
    REP:Print(string.format("%s%s|r: checking NPC and quest IDs (%d quests, about %d seconds)...", REP.HELP_COLOUR, addonName, count, math.ceil(count / QUEST_BATCH * BATCH_DELAY) + 2), true)
    LoadQuestTitles(quests, function(questResults)
      REP.VerifyRunning = false
      ReportResults(npcs, quests, questResults)
    end)
    return
  end

  -- Older clients: ask for everything, read it back a few times.
  for questID in pairs(quests) do QuestTitle(questID) end
  REP:Print(REP.HELP_COLOUR..addonName.."|r: checking NPC and quest IDs, results in "..WAIT_SECONDS.." to "..(WAIT_SECONDS * ROUNDS).." seconds...", true)

  local round = 0
  local function Report()
    round = round + 1
    local missing = false
    for npcID in pairs(npcs) do if not REP:GetNpcName(npcID) then missing = true break end end
    if not missing then
      for questID in pairs(quests) do if not QuestTitle(questID) then missing = true break end end
    end
    if missing and round < ROUNDS then
      C_Timer.After(WAIT_SECONDS, Report)
      return
    end
    ReportResults(npcs, quests, nil, true)
  end

  C_Timer.After(WAIT_SECONDS, Report)
end

function REP:ListFactionsWithoutSources()
  local lines = {}

  for index = 1, REP.Orig_GetNumFactions() do
    local factionData = REP:GetFactionDataByIndex(index)

    if factionData and factionData.factionID and factionData.factionID ~= 0 and (not factionData.isHeader or factionData.isHeaderWithRep or factionData.hasRep) then
      if not (REP.Sources and REP.Sources[factionData.factionID]) then
        table.insert(lines, factionData.factionID.." "..tostring(factionData.name))
      end
    end
  end

  if #lines == 0 then
    REP:Print(REP.HELP_COLOUR..addonName.."|r: every faction has reputation sources.", true)
  else
    PrintList(addonName..": factions without reputation sources", lines)
  end
end
