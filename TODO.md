# TODO

- [x] Remove electron requirement.
- [x] Add ESlint
- [x] Separate renderer logic from data and models.
- [x] Switch plugins to being ES modules.
- [x] Re-do plugin system to remove 'priority' and rely on dependencies directly.
- [x] Get AI players to move units.
- [x] Convert all raw data files to JS classes.
- [x] Re-do world generation.
- [X] Remove reliance on augmenting Engine directly.
- [X] Work on city build list.
- [X] Combat.
- [X] When building World, ensure there are enough starting squares.
- [X] Add user-definable rules.
- [X] Non-human players.
- [X] Write tests.
- [X] Fix map tiling.
- [X] City Improvements/Wonders.
- [X] Control city improvement costs via `Rule`s.
- [X] Control unit base stats via `Rule`s.
- [X] Fix AI bug with NavalTransports.
- [X] More civilizations.
- [X] Reorganise all existing plugins to extract self-contained entities (perhaps so they they are testable?)
- [X] Fix AI bug where they always trend north-east. Maybe this is just masked - but seems less problematic.
- [X] Add science.
- [X] Add 'trade' tile yield.
- [X] Break all plugins into `core` (parent classes/interfaces/rules) and `base` (implementations).
- [X] Change terrain specials to be augments instead of specific terrain types - this would allow rivers as they are in Civ 2+
- [X] Governments.
- [X] Replace all unit stats (and maybe costs etc) with `Yield`s
- [X] Add trade rates to control how much of a city's yield is tax/science/etc
- [X] Convert science to trade rate
- [X] Add tax trade rate
- [X] Look at the benefit of creating a single entity registry with helper methods like `.is(...)`. - `const [entity] = Registry.getBy(...)` is sufficient for this.
- [X] Obseletion mechanism (primarily units, but potentially anything...) - Covered by research with an extra criteria check.
- [X] Add `Modifier`s to `Yield`s with either a priority field, or a `Queue` of some sort.
- [X] Add Science and Gold multipliers (Library, Marketplace, etc)
- [X] Add maintenance costs
- [X] Re-do tile yields to calculate `Gold`/`Science` immediately, rather than via events.
- [X] Add luxuries trade rate
- [X] City Happiness.
- [X] Convert terrain improvements `availableOn` into `Rule`s.
- [X] Write more tests.
- [X] Replace `Tile#improvements` with `Registry`.
- [X] Move `buildProgress` and the entire `build` mechanism into a value object instead of a property.
- [X] Replace the rest of the `.improvements` with `Registry` pattern
- [X] Add ability to spend gold on city build items.
- [X] Move `foodStorage` into a value object instead of a property.
- [X] Add pathing mechanisms (A*?)
- [X] Add version checking to plugin system. - negated when moving to using npm modules.
- [X] Fix bug where AI wasn't attacking other units
- [X] Change the way events and rules are triggered to make testing feasible. This could be main script in package.json.
- [X] Fix bug when AI is using `NavalTransport` - unit testing the AI might be a good way to do this... (Game hangs)
- [X] Set pathing data for target in SimpleAIPlayer.
- [X] Convert `DelayedAction` to use `Rule`s.
- [X] Fix bug where units will continually fire `NoOrders` when on the coast - this seems to be resolved as part of the fixes applied to SimpleAIPlayer during testing/pathing addition.
- [X] Handle `Unit#transport` somehow. Perhaps this needs to be a `Registry` to avoid adding it to `Unit`?
- [X] Implement `Priority` for `Rule`s to aid processing `Trade`.
- [X] Add wonders.
- [X] Add wealth. - not civ 1 - delay
- [X] Add build-queue. - not civ 1 - delay
- [X] Break `base-civilizations` into individual plugins.
- [X] Break `base-unit` into individual plugins.
- [X] Break `base-city-improvements` into individual plugins.
- [X] Fix bug where `SimpleAIPlayer` can't perform an action for a unit.
- [X] Convert `Notificaiton#when` to use `Rule`s.
- [X] Add `Zulu`, `Egyptian`, `Chinese`, `Mongol` civilizations for Civ1 compatibility.
- [X] Break `base-wonder` into individual plugins.
- [X] Add `Sleep` action definition `Rule`s.
- [X] Add `Pillage` unit action.
- [X] Add goody huts
- [X] Ensure Engine is passed to plugins in read-only mode, but expose events system.
- [X] Convert to TypeScript? - There's no run-time system to handle this at the moment, look into again later... Alongside the "compiler"
- [X] Add `PlayerMap` classes that only see what the Player has discovered and track the state (improvements, cities, etc) - perhaps this is a concern of a `Client`?
- [X] Consider `PlayerActionRegistry` returning a `PlayerAction` entity that can be processed or dismissed. Sub-class with `Mandatory`... and `Optional`... `PlayerAction`s which can be optionally skipped in the `Player#takeTurn` loop. - Used `Rule`s but, implemented.
- [X] Add optional dependencies to plugins. - this will be covered by move to native `npm` modules.
- [X] Convert to TypeScript
- [X] Break the engine into it's own `core-engine` repo.
- [X] Break all plugins into JS modules and manage dependencies via `npm`/`yarn`.
- [X] Make `Player#civilization` use methods instead of bare properties.
- [X] Make `Civilization` and leader choice a bit better - add `Leader` class and use `Player#setCivilization` or something.
- [X] Break `base-terrain` into individual `base-terrain-x` plugins and incorporate `movementCost`s.
- [X] Convert all code to TS.
- [X] (Eventually) Convert all plugins to individual packages on npm so that plugin packs can be provided that combine a bunch of plugins to match the functionality of a desired Civ game.
- [X] Consider building a 'compiler' that can build a static version of the game including all rules that would run better and consider the current state as 'dev' mode.
- [X] Add leader traits
- [X] Replace `Tile#features` with `Registry` pattern - not sure on how useful this is, since it'll necessitate a refactor in `World#build`/`Generator`.
- [X] Fix any tests that rely on global instances.
- [X] Add `provider` to `Yield`s. - Added `YieldValue`s to `Yield`s
- [X] Refactor `Yield`s and `YieldModifier`s so that only `Yield` is used and update all code to make sure it works with that mechanism. - Add `BaseYield` functionality for `Unit`s to avoid this problem.
- [X] Change base-goody-hut-unit to pick the unit based on `Rule`s.
- [X] Add rules to wake enemy units that are `Sleep`ing when moving within their visible range.
- [X] Add unique ID (UUID?) to `DataObject`s, so they can be referenced easily by `Client`s.
- [X] Move client creation from civ1-player, it should be the client that sets this up
- [X] Fix units having `Fortified` applied loads of times.
- [X] Update `Sleep` to use `Unit#visibility` for waking.
- [X] Re-work `DataObject` to handle recursive structures by sending a map and the objects separately.
- [X] Renderer interface - I imagine this to be a separate application that has this repo as a dependency. - Look at NodeGUI - need a canvas or something similar to be implemented. Or wait for Electron to adopt Node 14...
- [X] Input management (keyboard/mouse) - tied to renderer?
- [X] Add Unit#status to store `Busy` `Action`.
- [X] Human players - this is likely dependent on a renderer, although perhaps make it playable within a TTY? - TTY would still be a renderer...
- [X] When client data is sent, filter data by `PlayerWorld` `Tile`s.
- [X] Make the transfer data more efficient - send diffs?
- [X] Add more city improvements.
- [X] Add more units.
- [X] Add starter technologies - need to read why Civ allocates these and set up `Rules` within `base-science`.
- [X] Add more variance in the worlds that are generated again - no islands appear to be generated no matter the settings used.
- [X] You can't activate a previously `Fortified` `Unit`.
- [X] `ClearForest` is broken (and presumably `ClearSwamp`, `ClearJungle`, `PlantForest` too)
- [X] Modify `PlayerWorld` to clone the `Tile` on registration so that future changes aren't immediately visible (via `Rule`).
- [X] Re-think the `Tile` `Yield`s, maybe `Happiness` etc don't need to be on all tiles unless specifically registered?
- [X] Build a DataProvider mechanism to replace `transport.receive()` mechanism in `electron-renderer`.
  - [X] Build a Transport mechanism to replace the basic transport object (ElectronTransport, or NetworkTransport, WorkerTransport would build on this for example)
- [X] Create a WebClient.
- [X] Add `Corruption` yield.
- [X] Break `civ1-asset-extractor` down to be able to use as a library from within the renderer.
- [X] Add city screens - Added CityStatus, HappinessReport and ScienceReport.
- [X] Add benefits to 'we love the leader' day.
- [X] Change `City`s to slice indices `0`, `4`, `20` amd `24` from the available `Tile` to match civ 1. Manage this via `Rule`s.
- [X] Break down `ElectronClient` into another `Client` type that `ElectronClient` can inherit from.
- [X] Add `civilDisorder` and `leaderCelebration` `AdditionalData` to `City`s.
- [X] Keep track of `CivilDisorder` and event when order is restored.
- [X] Keep state of `Bomber` return to `City` status.
- [X] Fix `Air` `Unit`s being attacked by `Land` `Unit`s.
- [X] Allow building `SpaceShip` parts.
- [X] i18n/l10n - tied to renderer.
- [X] Add diplomacy
- [X] Add `Negotiation` to `core-diplomacy`.
- [X] Add more `Interaction`s and use this data to inform AI decisions on trusting another player.
- [X] Fix bug where Hold does not deplete
- [ ] Look at modular AI info for plugin Unit providing data/weightings on what to do with the unit? `core-strategy` - in progress
  - [ ] Modify AI to adjust trade rates.
  - [ ] Add AI routine to avoid civil disorder.
  - [ ] Break `SimpleAIPlayer` down into smaller routines.
  - [ ] Use `Leader` `Trait`s to control `AIClient` functionality.
- [ ] Abstract World class to allow implementation of hexes rather than squares and other world generators.
- [ ] Remote network players.
- [ ] Difficulties.
- [ ] Write more tests.
- [ ] Feature parity with Civilization.
- [ ] Add Barbarians.
- [ ] Add `load` and `save` methods to `World` - need to consider the available plugins when saving/loading - mandating the exact plugins seems too much, but need to consider this before working on this functionality.
- [ ] Add ability to sell `CityImprovement`s.
- [ ] Add `Caravan` and `Diplomat` and correctly exclude these from `city:cost`s. (`Diplomatic` type of `Unit`?)
- [ ] Investigate why units STILL trend north-east.
- [ ] Add effects for `GreatWall`.
- [ ] Add revolution delay in changing governments (`Anarchy`).
- [ ] Add effects for `Pyramids`.
- [ ] Convert `activate`, `disband`, etc from methods to `Action`s for `Unit`s.
- [ ] Add `GoTo` action for `Unit`s.
- [ ] Add `CityWalls` `Defence` `YieldModifier`.
- [ ] Look at availability build rules and change so all must pass so e.g. Spearman can be overridden to Phalanx for one Civ.
- [ ] Add pathfinding tests where two comparable routes exist one taking advantage of roads etc
- [ ] Add obsolescence and provider maps for `Unit`s, `CityImprovement`s, `Advance`s etc - This would help with displaying "civilopedia" data
- [ ] Perhaps replace `Generator` (`core-world-generator`) with `Provider` and have `Generator` be a subset. Naming makes more sense for loaders that way...
- [ ] Look at using workers to generate worlds and pick start tiles to prevent UI blocking.
- [ ] Break down interface to make it data driven and component based so that other plugins can easily extend the interface.
- [ ] Add victory conditions.
- [ ] Add `RuleSet`s and toggleable statuses for `Rule`s so that they can be easily toggled on/off in groups via the interface.
- [ ] Add continent identifiers.
- [ ] Add renderer "Theme"s that could (for example) be Civ1, Civ2, FreeCiv, custom, etc.
- [ ] Try keeping a large object around, and current strategy, make it easier to trial alternatives - perhaps track memory usage...
- [ ] Add `Pollution`.
- [ ] Add `WonderHappiness` and `WonderContent` `City` `Yield`s.
