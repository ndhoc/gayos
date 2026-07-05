# Installer Notes

The repository uses Calamares as the intended installer framework.

## Goals

- support EFI and BIOS installs
- install the base system through metapackages
- keep desktop flavor selection simple
- avoid distro-specific installer code until necessary

## Initial Module Set

- welcome
- locale
- keyboard
- partition
- users
- summary
- install
- finished

## Planned Additions

- package selection via `netinstall`
- bootloader module tuning
- locale/timezone defaults
- post-install service enablement
- branding assets and slideshow content
