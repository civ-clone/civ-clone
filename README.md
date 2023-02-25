# civ-clone

Open source, plugin-driven, Civilization clone, written in TypeScript.

Play online at https://civ-clone.github.io/ (Original game files required!)

## Aims

The aims for this project are to:

- build a working clone of the original Civilization.
- make the engine extensible enough that concepts from any Civilization game can be written and included or excluded.
- make the engine decoupled from a renderer so that it's possible to run a headless, AI-driven game, as well as a single
  or multi-player game driven via either a rich GUI or even command-line.
- allow third-party contributed plugins to augment the game.

## Current State

This originally started as: [`@dom111/civ-clone`](https://github.com/dom111/civ-clone). The historical commits here will
provide insight into where a lot of the core concepts have originated and might be interest.

All plugins are written in TypeScript and future ones will be too. An Electron renderer has been started and is in a
working state. The `Client`s are set up in such a way that adding a networked client should be possible (ignoring all
the potential networking specific problems!). The assets are currently generated using the original game's assets.

The current flow is that a string of dependencies are utilised so that, for example, `civ-clone-electron` would depend
on `electron-renderer` and the `civ1-*` packages and would be able to give an experience that's comparable with the
original Civilization. Then the aim would be to make similar packages for the other Civilization games so that all the
core concepts and functionality can be easily transplanted to older games. Like Civ1 but want to add religion? Done.
Want to add custom units for the Mongols? Easy.

The world generation is currently pretty rudimentary, but would be easy to replace with something else in the future.

### Screenshots

![Main menu](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/main-menu.png?raw=true)
![City screen](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/city-screen.png?raw=true)
![City screen showing build options](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/city-build.png?raw=true)
![Game map showing a notification after capturing an enemy city](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/city-capture.png?raw=true)
![Game map showing the Adjust Trade Rates menu](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/adjust-trade-rates.png?raw=true)
![Game map with civ reports visible](https://github.com/civ-clone/civ-clone/blob/master/Screenshots/civ-reports.png?raw=true)

### Missing features

- Diplomatic negotiation (and `Diplomat`s)
- `Caravan`s and trade routes
- Save and load
- Choosing the worked tiles in a city and employing entertainers/tax men/scientists
- Selling city improvements
- Victory conditions
- Palace
- `GoTo` for `Unit`s
- No save/load functionality.
- `Pollution` isn't implemented.
- Probably a bunch more stuff

### Broken features

- There's no `Anarchy` period when changing governments.
- Some of the `Wonder`s don't actually do anything yet.

### Currently available

- Move units
- Build cities and irrigate, mine, road the terrain
- Build units, city improvements and wonders
- Attack enemies and capture cities
- Discover Advances
- Unit obsolescence
- Goody huts (Gold, Advance, Unit - Horseman or Swordman, Advanced Tribe)
- All 14 Civilizations from the original game (with "modern" city names - where applicable)
- Civ 5-style notification system for delaying choosing advances/choosing what to build in cities
- Change governments and utilise the features of each
- Change the `Tax`, `Research`, `Luxuries` rates
- Play on Earth
- Some charts and civilization-wide breakdowns/info

## Get in touch

Feel free to ask anything in the discussions section of the organisation:

https://github.com/civ-clone/civ-clone/discussions/new/choose

I'm also trying to post updates when there are any interesting changes, and I'll post screenshots of anything fun at the
following thread:

https://forums.civfanatics.com/threads/yet-anther-clone.680494/latest

You can also follow this project to see when updates are made.

The web-renderer available at https://civ-clone.github.io/ shows a simple changelog when clicking on the version in the
corner of the main menu too.

## How to get this running

The Electron renderer is currently decommissioned, but only whilst I'm working on the `web-renderer`. The aim is that
the web-renderer will be split out separating the UI from the Engine further.

The `web-renderer` is available to play online via:

https://civ-clone.github.io/

You currently need a copy of the original game files (`TER257.PIC` and `SP257.PIC`) to provide the basic assets.

## Core Concepts

### Packages

The entirety of the logic for a component is provided via a stand-alone package, some are `core` or `base` which are the
primary components of the game itself and would need a suitable replacement to be removed, but should be possible to
augment as required. `core-*` packages only expose base classes/interfaces which `base-*` packages implement and extend.

### Rules

`Rule`s should control all the interactions from how resources are counted and accumulated, to what governments are
available, to A/D/M/V values for `Unit`s etc. 

## TODO

Loads! See [`TODO`](https://github.com/civ-clone/civ-clone/blob/master/TODO.md) for the bigger ideas that are
outstanding as well as looking for `// TODO` in the codebase.

## Contributing

To contribute to the project, fork the relevant repo, create a branch and make your changes. Once you are happy with
them, ensure that `npm run build` (or `yarn build`) runs successfully and open a PR!
