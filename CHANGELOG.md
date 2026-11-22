# ReputationGuide

## [2.0.0-release](https://github.com/tvlfrosty/Reputation_Guide/tree/2.0.0-release) (2026-11-22)

### New
- Support for World of Warcraft: Forever (Interface 16001).
- New reputation details panel next to the reputation frame on Forever and Retail, replacing the default faction details:
  - Standing bar, reputation stats, At War / Move to Inactive / Show as Experience Bar options.
  - Filter and options dropdowns for the reputation sources list.
  - Closes and reopens together with the default details, and keeps the selected faction.
- Faction tooltip on the watched reputation bar.
- Missing texts in other languages now fall back to English.
- Reputation sources for the new World of Warcraft: Forever factions (High Order, Windshapers, Nightclaw Druids, Kirin Tor, Earthen Ring, Guardians of Hyjal, Barkskin Burrow, Theramore Expeditionary Force, Darkspear Raiders).
- Recording of unknown reputation sources: reputation gains from quests, kills (also in instances), items and other sources that aren't in the data are saved account wide with the reputation and standing (/rep record to switch it off or on).
- Classic clients: the default details frame is replaced by the details panel of Forever/retail (header, standing bar, statistics, filter and options dropdowns), next to the character frame and as high as it.
- New settings page "Details frame" (Options > ReputationGuide): "Show extended reputation detail frame" (addon details frame or the default one) moved there, plus options for the reputation bar, description, statistics, resizing, expanded lists, list font size and background opacity.
- Order by Standing on Forever and retail: the reputation list can be ordered Paragon > Renown > Exalted > ... > Hated.
  - Friendships: only the first level counts as Neutral, then two levels per standing, the highest level is Exalted.
  - Renown factions at maximum renown with a paragon track are listed under Paragon.
  - Collapsed faction headers are opened when the option is switched on (the inactive factions stay hidden) and closed again when it is switched off.
  - Paragon rewards icon next to the bar (glows with a check mark while a reward waits), hovering a bar shows its values.
  - Saved per character.
- Manual lines: add your own reputation sources to the selected faction (Options > Add manual line in the details frame); they are shown in the sources list and can be removed again.
- View Renown button on the details panel for factions opened from the ordered list (opens the Journeys tab of the Adventure Guide on Midnight).
- ElvUI skins for the details panel, the ordered list, the manual line popup and the settings pages.
- Paragon Reputation integration: the paragon bars and the paragon standing text use the bar color chosen in Paragon Reputation, the ordered list also uses its text format.
- Reputation sources for The K'aresh Trust, the Gallagio Loyalty Rewards Club and the Winterpelt Furbolg.
- /rep sync: looks up all factions again (for factions that seem to be missing).
- Setting "Show faction sync messages" (General).

### Changed
- Updated for Retail 11.2.7 and 12.x (Midnight); Blizzard functions are no longer replaced on modern clients, which prevents taint and "secret value" errors.
- Faster loading: initialization and the faction scan wait until the loading screen is gone; the scan is spread over several frames (a few milliseconds per frame) and pauses during combat.
- The full faction scan (first login after a game update) shows a message in the chat when it starts and when it is done.
- The faction scan (faction IDs 1 - 5000) now only runs on the first login of a character on a new game build; known faction IDs are cached per character, and newly discovered factions are picked up during play.
- The old reputation list code is only loaded on the Classic clients.
- Internal variables moved from the global namespace to the addon table.
- More texts moved to the locale files.
- New data format: the reputation sources are stored once per faction in one file per expansion (data/factions/), with conditions instead of code; reputation bonuses are applied when the list is shown (buff changes don't reload all data anymore).
- Content phases are handled per Classic version (Classic Era, Season of Mastery, Season of Discovery).
- Reputation sources use NPC IDs (localized mob names) and quest IDs where possible; all other texts of the sources moved to the locale files.
- Each client only loads the reputation data of its own expansions.
- New commands: /rep verify (checks the NPC and quest IDs against the game) and /rep nosources (lists factions without reputation sources).
- /rep verify asks the server for the quests in small batches and waits for its answers; quests that don't exist on the client are listed separately.
- Quests that no longer exist on the retail client are hidden there (they stay on the Classic clients).
- The details panel can't be made smaller than its content, the list keeps at least 3 rows.
- The default details frame is hidden behind the details panel on retail.
- Reputation buffs (Wickerman, Pilgrim's Bounty, Darkmoon Faire) are switched off again when the buff is gone, unless the setting was switched on manually; switching a buff off manually while it's active is respected until the buff is gone.
- Reputation values are reloaded right away when a reputation buff setting changes.
- Aura and bag updates are checked once per burst, and only auras of the player are checked (less CPU usage in groups and raids).

### Fixed
- Error when selecting a faction at maximum renown without a paragon track (e.g. Keg Leg's Crew).
- Paragon values on the details panel are shown per paragon cycle.
- Factions with a paragon track below Exalted were shown as Paragon with paragon values; they now show their normal standing.
- Sources of factions at maximum renown or Exalted with a paragon track showed "0x"; they now count towards the next paragon reward.
- Retail: the View Renown button showing the renown of the previously selected faction.
- "Show as Experience Bar" checkbox flickering when clicked.
- Faction tooltip staying open after leaving a faction.
- Bonus reputation (commendations) and Draenor trading post bonuses not being applied, the trading post bonus now also works on non-English clients.
- Non-repeatable quests showing an empty tooltip.
- Season of Discovery: Ahn'Qiraj sources and Commendation Signet quests now follow the Season of Discovery phases (phase 6).
- Tillers farming reputation showing "1" as name at Stranger.
- Several Lua errors on login and when opening the reputation frame.

## [9.2.5-release](https://github.com/tvlfrosty/Reputation_Guide/tree/9.2.5-release) (2022-08-09)
## [3.4.0-release](https://github.com/tvlfrosty/Reputation_Guide/tree/3.4.0-release) (2022-08-09)
## [2.5.4-release](https://github.com/tvlfrosty/Reputation_Guide/tree/2.5.4-release) (2022-08-09)
## [1.14.03-release](https://github.com/tvlfrosty/Reputation_Guide/tree/1.14.03-release) (2022-08-09)

- Initial release for 9.2.5
- Initial release for 3.4.0
- Initial release for 2.5.4
- Initial release for 1.14.03
