# Module Architecture

## Overview

Modules live under `scripts/modules/<name>/`.

`config.nu` imports the modules it wants directly. There is no root barrel, and there is no
`source`.

This keeps startup behavior explicit and makes each module responsible for its own public surface
and side effects.

## Import Model

Use `use modules\<name>` when the module needs its `export-env` to run.

Use `use modules\<name> *` when you want the exported command surface from that module.

Some modules may need only one of those forms. Some may need both concerns handled by the same
entrypoint.

## Expected Shape

Not every module needs every file, but this is the preferred layout:

- `mod.nu`: module entrypoint and public surface
- `commands.nu`: optional public command definitions for larger modules
- `build-env.nu`: startup orchestration
- `env.nu`: environment-specific installers
- `hooks.nu`: hook installers
- `keybindings.nu`: keybinding installers
- `completions.nu`: completion providers

## Responsibilities

`mod.nu` owns the public surface.

`commands.nu` is optional. Use it when a module has enough exported commands that `mod.nu` becomes
too busy.

If the module has startup side effects, `mod.nu` also owns `export-env` and calls the module's env
pipeline there.

`mod.nu` should still remain the module entrypoint even when `commands.nu` exists.

`build-env.nu` is an orchestrator. It should call the relevant installers, not hold unrelated logic
directly.

`env.nu`, `hooks.nu`, and `keybindings.nu` hold the concern-specific installers and helpers.

For command-shaped modules, keep `export extern "main"` in `mod.nu` by default unless a split is
known to work cleanly.

## Naming

Use names by behavior:

- `build-*`: pure constructors
- `with-*`: pure transformers
- `install-*`: env mutation
- `nu-complete ...`: Nushell completion entrypoints

These names should be terminologically correct and reusable across modules.

## Aichat Example

`aichat` is the reference shape right now.

- `mod.nu` exports the command surface and owns `export-env`
- `build-env.nu` runs the module startup pipeline
- `env.nu` is reserved for environment-specific setup
- `keybindings.nu` installs the `Alt+e` binding
- `completions.nu` provides completion commands

If a new module needs similar startup behavior, follow the same pattern instead of inventing a new
one.
