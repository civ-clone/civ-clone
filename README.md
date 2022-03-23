# civ-clone

Open source, plugin-driven, Civilization clone, written in TypeScript.

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

### Missing features

- Diplomatic negotiation (and `Diplomat`s)
- `Caravan`s and trade routes
- Save and load
- Play on Earth
- Charts and civilization-wide breakdowns/info
- Changing the worked tiles in a city and employing entertainers/tax men, scientists
- Selling city improvements
- Victory conditions
- Disabling auto End of Turn
- Palace
- Activating `Unit`s on the city screen
- Probably a bunch more stuff, but the stuff above is next on the hit list

### Broken features

- Navigation over terrain that you don't have the moves for lets you keep trying until you're successful
- Defeated units still appear on the map
- Spending `Gold` on stuff in `City`s, it just always works!

### Currently available

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

## How to get this running:

### Prerequisites

- `NodeJS`, `npm` and `yarn` commands.
- A copy of the original Civilization game files.

__Note: `yarn` is recommended for the `electron-renderer` package again as `npm install`/`npm upgrade` seem to struggle to resolve without setting my machine on fire...__

### Process

Clone the [@civ-clone/electron-renderer](https://github.com/civ-clone/electron-renderer) and
[@civ-clone/civ1-asset-extractor](https://github.com/civ-clone/civ1-asset-extractor) components, copy `TER257.PIC` and
`SP257.PIC` files from the original game files into the root of where you cloned `civ1-asset-extractor`. 

Navigate via the commandline to that directory and run `npm install` and `node index.js`, which should install the
required dependencies and generate all the required image assets in the `assets/` directory. That `assets/` directory
needs to then be copied to the `electron-renderer` project into the `view/` directory.

Once the assets are in place, you need to navigate to the `electron-renderer` directory and run `yarn install` and
`npm run start`. You should be good to go!

## Core Concepts

### Packages

The entirety of the logic for a component is provided via a stand-alone package, some are `core` or `base` which are the
primary components of the game itself and would need a suitable replacement to be removed, but should be possible to
augment as required. `core-*` packages only expose base classes/interfaces which `base-*` packages implement and extend.

### Rules

`Rule`s should control all the interactions from how resources are counted and accumulated, to what governments are
available, to A/D/M/V values for `Unit`s etc. 

## TODO

Loads! See [`TODO`](TODO.md) for the bigger ideas that are outstanding as well as looking for `// TODO` in the
codebase.

## Contributing

To contribute to the project, fork the relevant repo, create a branch and make your changes. Once you are happy with
them, ensure that `npm run build` (or `yarn build`) runs successfully and open a PR!
