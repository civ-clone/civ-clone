# Where the project is, and what is next

Day-to-day work is tracked as issues on
[`web-renderer`](https://github.com/civ-clone/web-renderer/issues), whichever
package a change ends up in, and every push to its `main` deploys to
[civ.one](https://civ.one) with release notes the game shows. This file is the
long view: what the project set out to do and has done, and the larger pieces
still ahead. It replaces the checklist that lived here since the project's
first years; that list is in the git history.

## Done

The architecture the first checklist was working towards is in place:

- **Packages, not a monolith.** The engine is ~390 TypeScript packages, each its
  own repository: `core-*` abstractions and registries, `base-*` concrete
  things, `library-*` helpers, `civ1-*` for Civilization's own content and
  rules, `simple-*` default implementations. They are published to npm (the
  `civ1-*` and `simple-*` ones resolved from GitHub), and the renderer builds
  its plugin list from its dependencies.
- **Rules for everything.** Yields and their modifiers, costs, availability,
  combat, obsolescence, happiness, what happens on every event: all `Rule`s with
  criteria and effects, registered into a game, so any package can change
  another's behaviour. Requirements (what an advance, improvement, unit or
  government needs) are declared data the rules and the Civilopedia both read.
- **Engine apart from renderer.** The engine runs headless (the test suites and
  the AI arena play whole games without a page) and in the browser's Web Worker.
  Clients are of one kind whether a person or a program plays; the page gets
  what its player may see and sends actions back.
- **Saving and loading.** Every entity serialises by declared state; saves
  record the plugins they need, the seats, the id counters and the pending
  effects, and older files keep loading as formats move.
- **Civilization's rules**, with v474.05 of the original as the reference:
  terrain, movement and roads and railroads, cities, worked tiles and
  specialists, happiness and disorder, improvements and selling them, wonders
  and their effects, science with the original's costs and starting advances,
  governments with anarchy and their yields, trade rates, caravans and trade
  routes, diplomats, diplomacy with meetings and treaties, war and invasions,
  barbarians and respawning civilizations, goody huts, pollution, the space
  race, conquest, Future Technology, scoring and the Hall of Fame, difficulty
  levels, all of the original's civilizations and leaders plus the world's, each
  with its colours and city names, and Earth at three sizes.
- **The renderer**: a map drawn from the engine's data with incremental
  patches, a city screen, reports, notifications and notices, a Civilopedia,
  automation for settlers and exploration, GoTo, cheats, a game setup with
  seats, an observer mode for watching games, release notes in the game, and
  British English alongside the US base.
- **Verification**: a conformance suite that plays a seeded game and checks the
  state checksums; an AI arena that pits a candidate AI against the baseline
  across many seeds; memory and performance testbeds; and the `civ` tool that
  syncs, typechecks, compiles and publishes engine packages in dependency order.

## Next

The larger pieces, roughly in the order they are likely to come. Each links to
the issue that holds the design and the state.

- **Several humans.** Hot-seat in one browser, then network play: a player's
  browser hosting with peers over WebRTC, a lobby with rejoin and saves,
  diplomacy between human players, and a dedicated host
  ([#161](https://github.com/civ-clone/web-renderer/issues/161)–[#165](https://github.com/civ-clone/web-renderer/issues/165)).
  The game setup, the observer and the seat-aware saves were built as the
  ground for this.
- **Other maps and looks.** Hex and isometric maps, several tilesets installed
  at once (the tileset descriptor already declares a tileset's grid and sprite
  scheme), royalty-free art, and renderer themes
  ([#86](https://github.com/civ-clone/web-renderer/issues/86),
  [#56](https://github.com/civ-clone/web-renderer/issues/56),
  [#98](https://github.com/civ-clone/web-renderer/issues/98),
  [#167](https://github.com/civ-clone/web-renderer/issues/167)). The engine's
  world is already abstracted over its grid.
- **Better computer players.** The AI is a set of strategies that the arena
  measures; the open work is island starts and Map Making
  ([#632](https://github.com/civ-clone/web-renderer/issues/632)), improvement
  priorities ([#425](https://github.com/civ-clone/web-renderer/issues/425)),
  terrain work ([#428](https://github.com/civ-clone/web-renderer/issues/428)),
  nuclear weapons ([#399](https://github.com/civ-clone/web-renderer/issues/399)),
  and whatever the arena says next.
- **The rest of Civilization.** Fortresses
  ([#388](https://github.com/civ-clone/web-renderer/issues/388)), global
  warming ([#365](https://github.com/civ-clone/web-renderer/issues/365)), civil
  war on capturing a capital
  ([#125](https://github.com/civ-clone/web-renderer/issues/125)), and the
  Civilopedia's remaining entries
  ([#620](https://github.com/civ-clone/web-renderer/issues/620),
  [#621](https://github.com/civ-clone/web-renderer/issues/621)).
- **Other rulesets.** The point of the packages: Civ2 units on a Civ1 map, or a
  wholly different game on the same engine. An asset extractor for Civ2's files
  has been prototyped; the rules would be new `civ2-*` packages beside the
  `civ1-*` ones.
- **Engine hygiene.** A turn loop driven by an explicit sequencer rather than a
  chain of events ([#119](https://github.com/civ-clone/web-renderer/issues/119)),
  module-level registries moved into the game
  ([#370](https://github.com/civ-clone/web-renderer/issues/370)), and CI across
  every package ([#66](https://github.com/civ-clone/web-renderer/issues/66)).
- **Accessibility** across the interface
  ([#364](https://github.com/civ-clone/web-renderer/issues/364)).
