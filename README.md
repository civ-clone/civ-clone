# civ-clone

Open source, plugin-driven, Civilization clone, written in TypeScript.

## Aims

The aims for this project are to:

- build a working clone of the original Civilization.
- make the engine extensible enough that concepts from any Civilization game can be written and included.
- make the engine decoupled from a renderer so that it's possible to run a headless, AI-driven game, as well as a single
  or multi-player game driven via either a rich GUI or even command-line.
- allow third-party contributed plugins to augment the game.

## Current State

This originally started as: https://github.com/dom111/civ-clone. The historical commits here will provide insight into
where a lot of the core concepts have originated and might be interest.

I'm currently going through the process of updating all the previous plugins to TypeScript and moving them all to their
own repos within this organisation. Once that's done, this architecture lends itself to working with the current version
of Electron again (although not exclusively, but that should allow me to get a renderer up and running relatively
quickly).

The aim will be to have a string of dependencies so that, for example, `civ-clone-electron` would depend on
`electron-renderer` and the `base-civ1-*` packages and would be able to give an experience that's comparable with the
original Civilization. Then the aim would be to make similar packages for the other Civilization games so that all the
core concepts and functionality can be easily transplanted to older games. Like Civ1 but want to add religions? Done.
Want to add custom units for the Mongols? Easy.

The world generation is currently pretty rudimentary, but would be easy to replace with something else in the future.

## Core Concepts

### Packages

The entirety of the logic for a component is provided via a stand-alone package, some are `core` or `base` which are the
primary components of the game itself and would need a suitable replacement to be removed, but should be possible to
augment as required. `core-*` packages should only really expose a set of constraints and `base-*` packages would
implement then.

### Rules

`Rule`s should control all the interactions from how resources are counted and accumulated, to what governments are
available, to A/D/M values for `Unit`s etc. 

## TODO

Loads! See [`TODO`](TODO.md) for the bigger ideas that are outstanding as well as looking for `// TODO` in the
codebase.

## Contributing

To contribute to the project, fork the relevant repo, create a branch and make your changes. Once you are happy with
them, ensure that `yarn build` runs successfully and open a PR!

