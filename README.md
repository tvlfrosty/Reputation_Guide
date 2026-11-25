# Reputation Guide
A World of Warcraft addon to help you manage your reputation and factions.

## Supported versions
One code base for every version of the game:
* Retail (The War Within / Midnight)
* World of Warcraft: Forever
* Classic: Mists of Pandaria, Cataclysm, Wrath of the Lich King, The Burning Crusade and Classic Era / Anniversary

## Features
This addon is made to help you reach Exalted (or the next renown / friendship level) with your factions by giving you calculated tips on how to obtain the reputation most efficiently.

* Reputation sources per faction and standing: quests (repeatable, daily and PvP), dungeons and raids, mobs, items and other sources, with how many times you need to do them to reach the next standing.
* Reputation details: needed, current and missing reputation, reputation to Exalted / max, reputation in your bags, bank and quest log, and the reputation gained this session.
* A reputation details panel next to the reputation frame on every version, with At War / Move to Inactive / Show as Experience Bar, filters for the reputation sources, a resizable frame and its own settings page (bar, description, statistics, font size, transparency).
* Order by Standing: the reputation list ordered Paragon > Renown > Exalted > ... > Hated (saved per character).
* Sources of the selected faction can be extended with your own lines (Options > Add manual line in the details panel).
* Reputation changes in chat, including the reputation needed for the next standing and bonus reputation.
* Faction tooltip on the reputation list and the watched reputation bar, including your other characters' standing.
* Records reputation gains from sources that aren't in the data yet (account wide), and lets you add your own sources (manual lines) to a faction.
* Supports renown, friendship and paragon factions, reputation buffs (Darkmoon Faire, Wickerman, Pilgrim's Bounty, guild perks), commendations and the Draenor trading post.
* Works with [ElvUI](https://tukui.org/elvui) (skinned frames) and [Paragon Reputation](https://www.curseforge.com/wow/addons/paragon-reputation) (its bar color and text format are used for paragon factions) when those addons are installed.
* Light on loading: the faction data is synced after the loading screen, in small steps and never during combat.
* Localized in English, German, Spanish, French, Italian, Korean, Portuguese, Russian and Chinese (Simplified and Traditional).

## Commands
`/rep` or `/reputations`
* `/rep help` - Show all commands
* `/rep about` - Show the version and author
* `/rep status` - Show the current settings
* `/rep enable | disable | toggle { mobs | quests | pvpquests | instances | items | general | all }` - Show or hide reputation sources
* `/rep enable | disable | toggle { missing | details | chat | paragon }` - Toggle options
* `/rep list [standing]` - List your factions (by standing)
* `/rep watch <factionID>` - Show a faction as experience bar
* `/rep watchindex <factionIndex>` - Show a faction as experience bar by its position in the reputation list
* `/rep sync` - Look up all factions again (for factions that seem to be missing)
* `/rep verify` - Check the NPC and quest IDs of the reputation data against the game
* `/rep nosources` - List your factions without reputation sources
* `/rep record [status | debug | clear]` - Switch recording of unknown reputation sources off or on (status: show what's recorded, debug: a window to copy the recorded lines from, clear: remove the recorded lines). Quests of the data with a different reputation, and one-time quests turned in again, are recorded too

## Installation
Download the addon via the CurseForge App or the [Curse website](https://www.curseforge.com/wow/addons/reputation-guide).  
To install it manually, extract the contents in this directory: PATH\World of Warcraft\\\_<game_version>\_\\Interface\AddOns\

# Addon wil no longer be updated by me, I am currently not playing wow anymore, people are free to upload their own updated version, thanks for all the feedback through the years, and enjoy wow!


## Issues
#### For any issues please refer to the issues tab [https://github.com/tvlfrosty/Reputation_Guide/issues](https://github.com/tvlfrosty/Reputation_Guide/issues) or in the [#issues](https://discord.com/channels/1006569125449056317/1007076956489142294) channel in discord.

## History/Base
This addon is based on the addon RepHelper, that was initially based on Factionizer.

RepHelper (Retail) on Github: <https://github.com/chawan/RepHelper>  
RepHelper (Classic) on Github: <https://github.com/chawan/RepHelper_Classic>  
RepHelper on Curse: <https://curseforge.com/wow/addons/rephelper>  
Factionizer on Github: <https://github.com/gOOvER/Factionizer>  
Factionizer on Curse: <https://curseforge.com/wow/addons/factionizer>

I appreciate all the work done on these addons.

## Additions/Changes
The main change that was added on top of the existing RepHelper addon is the expansionIndex, this allows the addon to check for each faction exactly what reputation value is correct for the current version of the game, and when certain quests were added. This also allows the addon to check till when a certain faction is active.
This also allows the addon to work for each version of the game, since the Blizzard API went through multiple changes through the years.
Further additions were made to Classic/TBC factions/reputations to be more up to date, by adding more quests/dailies and reputation values.

## Information Sources
* [Classic Wowhead](http://classic.wowhead.com)
* [TBC Wowhead](http://tbc.wowhead.com)
* [Retail Wowhead](http://wowhead.com)
* [QuestieDB](https://github.com/Questie/QuestieDB) (GPLv3): repeatable, daily and weekly quests and localized quest names of the Classic versions, see `tools/questie`

## Contribute
Contributions/Suggestions and bug reports/fixes to the addon are always welcome, to contribute you can make a [pull request](https://github.com/tvlfrosty/Reputation_Guide/pulls) or simply open a [new issue](https://github.com/tvlfrosty/Reputation_Guide/issues) in the repository.

## License
GPLv3: [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html) or see the [license file](https://github.com/tvlfrosty/Reputation_Guide/blob/master/LICENSE)
