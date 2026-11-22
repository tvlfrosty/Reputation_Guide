----------------------------------------------------------
-- Reputation Guide | Reputation source names --
-- Name lookups for the maps, mobs, items and quests of the reputation sources.
----------------------------------------------------------
local addonName, vars = ...
local REP = vars

-----------------------------------
-- 10 Faction map --
-----------------------------------
function REP:InitMapName(fimap, returnMapNameAsString)
  local map

  if (type(fimap) == "number") then
    if fimap == 1 then
      map = REP_TXT.srfd
    elseif fimap == 2 then
      map = REP_TXT.tbd
    elseif fimap == 3 then
      map = REP_TXT.mnd
    elseif fimap == 5 then
      map = REP_TXT.nci
    elseif fimap == 6 then
      map = REP_TXT.hci
    elseif fimap == 7 then
      map = REP_TXT.ncit
    elseif fimap == 8 then
      map = REP_TXT.hcit
    elseif not fimap then
      map = " "
    else
      local mapObj
      local mapName
      if C_Map and type(C_Map.GetMapInfo) == "function" then
        mapObj = C_Map.GetMapInfo(fimap)

        if mapObj then mapName = mapObj.name end
      elseif type(GetMapInfo) == "function" then
        mapObj = GetMapInfo(fimap)

        if mapObj then mapName = mapObj.name end
      end

      map = mapName
    end

    if not map and type(GetRealZoneText) == "function" then
      map = GetRealZoneText(fimap)
    end
  else
    if fimap == "ScholomanceOLD" and type(GetRealZoneText) == "function" then
      map = GetRealZoneText(289) -- Fix for scholomance not properly returning with 306-309, and default 289 is blackwing lair.
    end
  end

  if (not map or map == "") and returnMapNameAsString then
    map = fimap
  end

  return map
end

function REP:InitMobName(fimob)
  local mob

  if fimob == 1 then
    mob = REP_TXT.tmob
  elseif fimob == 2 then
    mob = REP_TXT.oboss
  elseif fimob == 3 then
    mob = REP_TXT.aboss
  elseif fimob == 4 then
    mob = REP_TXT.pboss
  elseif fimob == 5 then
    mob = REP_TXT.fclear
  elseif fimob == 11 then
    mob = (REP_TXT.AU.." "..REP_TXT.BB)
  elseif fimob == 12 then
    mob = (REP_TXT.AU.." "..REP_TXT.SSP)
  elseif fimob == 13 then
    mob = (REP_TXT.AU.." "..REP_TXT.Wa)
  elseif fimob == 14 then
    mob = REP_TXT.VCm
  elseif fimob == 15 then
    mob = (REP_TXT.AN.." "..REP_TXT.BB)
  elseif fimob == 16 then
    mob = (REP_TXT.AN.." "..REP_TXT.SSP)
  elseif fimob == 17 then
    mob = (REP_TXT.AN.." "..REP_TXT.Wa)
  else
    --[[--
      local mobName = GetmobNameByID(fimob)
      mob = mobName
    --]]--
  end

  if not mob then
    mob = fimob
  end

  return mob
end

function REP:InitItemName(fiitem, amt)
  local item_name

  if fiitem == 1 then
    item_name = REP_TXT.cdq
  elseif fiitem == 2 then
    item_name = REP_TXT.fdq
  elseif fiitem == 3 then
    item_name = REP_TXT.ndq
  elseif fiitem == 4 then
    item_name = REP_TXT.cbadge
  elseif fiitem == 5 then
    item_name = REP_TXT.deleted
  else
    if C_Item and C_Item.GetItemInfo then
      item_name = C_Item.GetItemInfo(fiitem)
    elseif GetItemInfo then
      item_name = GetItemInfo(fiitem)
    end
  end

  if not item_name then
    item_name = fiitem

    -- item = C_CurrencyInfo.GetCurrencyInfo(fiitem)

    -- if item then
      -- item_name = item.name
    -- end
  end

  if not item_name then
    item_name = fiitem
  end

  return item_name
end

function REP:Quest_Names(questIndex)
  local quest = nil

  if (type(questIndex) == "number") then
    if (REP_QuestDB[questIndex]) then
      local localization = GetLocale()
      if localization == "esMX" then localization = "esES" end
      if localization == "zhTW" then localization = "zhCN" end

      quest = REP_QuestDB[questIndex][localization]
    else
      quest = REP:GetQuestTitleByID(questIndex) or (REP.QuestFallbackNames and REP.QuestFallbackNames[questIndex])

      if not quest then
        quest = "Quest name translation not available. QuestID: "..questIndex
      end
    end
  else
    quest = questIndex
  end

  if questIndex == 1 then
    quest = REP_TXT.cdq
  elseif questIndex == 2 then
    quest = REP_TXT.coq
  elseif questIndex == 3 then
    quest = REP_TXT.fdq
  elseif questIndex == 4 then
    quest = REP_TXT.foq
  elseif questIndex == 5 then
    quest = REP_TXT.ndq
  elseif questIndex == 6 then
    quest = REP_TXT.deleted
  elseif questIndex == 7 then
    quest = REP_TXT.Championing
  elseif questIndex == 8 then
    quest = REP_TXT.bpqfg
  elseif questIndex == 9 then
    quest = REP_TXT.djdq
  elseif questIndex == 99 then
    quest = REP_TXT.tbd
  else
    if not quest then
      quest = questIndex
    end
  end

  return quest
end
