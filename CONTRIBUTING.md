# Contributing to GayOS

Thank you for contributing to `gayos`.

This repository is an Arch-based distro scaffold, so contributions should prioritize maintainability, reproducibility, and clarity over novelty.

## Scope

Contributions are welcome for:

- distro packages under `packages/`
- ISO profile updates under `iso/`
- installer configuration under `installer/`
- build and release tooling under `scripts/`
- architecture, build, and release documentation under `docs/`

## Principles

- prefer small, focused pull requests
- keep changes reproducible in Arch-based build environments
- avoid mixing docs, packaging, installer, and CI changes unless they are tightly related
- prefer distro-owned packages for defaults instead of patching upstream packages directly
- keep placeholders clearly marked until production values are available

## Development Workflow

1. Create a branch from `main`.
2. Make a focused change.
3. Validate repository layout with `scripts/validate-layout.sh`.
4. If relevant, build packages with `scripts/build-packages.sh` or `scripts/build-packages-clean-chroot.sh`.
5. If relevant, rebuild the ISO with `scripts/build-iso.sh`.
6. Submit the change with a clear description of impact and validation.

## Commit Guidelines

- use concise commit messages
- keep one logical change per commit when practical
- separate docs, packaging, installer, and CI changes where possible
- mention affected area in the commit message when helpful

Examples:

- `Add core distro packages`
- `Add Calamares installer scaffold`
- `Update KDE flavor defaults`

## Packaging Guidelines

- keep PKGBUILDs simple and explicit
- prefer `arch=('any')` only when the package is truly architecture-independent
- keep source files beside the PKGBUILD unless there is a strong reason not to
- mark placeholder keys, mirrors, and URLs clearly
- do not introduce a custom kernel patch stack without a clear maintenance plan

## Installer and ISO Changes

When changing `installer/` or `iso/`, document:

- what boot/install path changed
- whether the change affects BIOS, UEFI, or both
- whether package selection or post-install behavior changed

## Reporting Issues

When reporting a bug, include:

- affected area, such as package build, ISO boot, Calamares, or installed system
- steps to reproduce
- expected behavior
- actual behavior
- logs or screenshots when available

## Code of Conduct

By participating in this project, you agree to follow the rules in `CODE_OF_CONDUCT.md`.
