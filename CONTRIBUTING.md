# Contributing

This config is module-first. It does not use `source`.

## Rules

- Prefer adding or changing a module under `scripts/modules/` over growing `config.nu`.
- Keep imports in `config.nu` explicit.
- `mod.nu` is the entrypoint for a module.
- If a module needs startup side effects, put `export-env` in that module's `mod.nu`.
- Keep the public surface small. Internal helpers should stay internal.
- Name helpers by behavior:
  - `build-*` for pure constructors
  - `with-*` for pure transformers
  - `install-*` for env mutation

## Before You Change Module Structure

Read [docs/module-architecture.md](docs/module-architecture.md).

That document explains the import model, the expected file layout, and the naming conventions used
by this config.
