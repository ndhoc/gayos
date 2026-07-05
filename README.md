# gayos

`gayos` is an Arch-based Linux distribution skeleton focused on building a maintainable distro foundation first: package layer, binary repo metadata, ISO profile, installer configuration, system defaults, and release tooling.

## Repository Layout

```text
packages/
  core/
  desktop/
  meta/
iso/
  profile/
installer/
  calamares/
system/
branding/
scripts/
repo/
docs/
```

## Initial Scope

- `packages/core/gayos-release`: distro identity and pacman repo configuration
- `packages/core/gayos-keyring`: placeholder package for future package signing keys
- `packages/core/gayos-mirrorlist`: mirror configuration package
- `packages/desktop/gayos-desktop-defaults`: desktop-oriented defaults and services
- `packages/meta/gayos-base`: minimal meta package to bootstrap installations
- `packages/meta/gayos-kde`: KDE Plasma flavor metapackage
- `iso/profile`: `archiso` profile for the live image
- `installer/calamares`: starter Calamares configuration and branding
- `scripts`: build, repo publish, and validation entrypoints
- `docs`: architecture and release process notes

## Next Steps

1. Implement actual signing keys in `gayos-keyring`.
2. Replace placeholder mirror URLs with real mirrors.
3. Expand `packages.x86_64` and Calamares package selection.
4. Add CI for package and ISO builds.
5. Decide whether to introduce `linux-gayos` or stay with Arch kernels initially.

## Build Targets

- `gayos-base`: base system metapackage
- `gayos-kde`: KDE Plasma desktop flavor
- `gayos-settings-kde`: KDE-specific defaults and first-run behavior
- `gayos-sddm-theme`: display manager theme package
- `gayos-wallpapers`: distro wallpaper assets package
- `iso/profile`: live ISO embedding Calamares and the KDE flavor
