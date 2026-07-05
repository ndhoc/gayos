# Architecture

This repository is structured as a practical starting point for an Arch-based distro.

## Layers

1. `packages/`
Contains Arch packages that define distro identity, defaults, and metapackages.

2. `iso/`
Contains the `archiso` profile used to build the live installation image.

3. `installer/`
Contains Calamares settings, branding, and distribution-specific defaults.

4. `system/`
Contains reference configuration that distro packages can install into the target system.

5. `branding/`
Contains assets and textual branding shared by the live ISO and installed system.

6. `scripts/`
Contains local tooling to build packages, compose a repo, and build an ISO.

## Packaging Strategy

Start with these distro-specific packages:

- `gayos-release`
- `gayos-keyring`
- `gayos-mirrorlist`
- `gayos-desktop-defaults`
- `gayos-base`
- `gayos-kde`

These packages are enough to establish:

- `/etc/os-release` identity
- pacman repository configuration
- package signing policy scaffolding
- system defaults for new installs
- a stable metapackage for installer/package selection
- a first desktop flavor that can be installed consistently

## Desktop Flavor Strategy

Desktop environments should be represented as separate metapackages.

Initial flavor:

- `gayos-kde`

Flavor support packages:

- `gayos-settings-kde`
- `gayos-sddm-theme`
- `gayos-wallpapers`

Future flavors can follow the same pattern:

- `gayos-gnome`
- `gayos-hyprland`
- `gayos-minimal`

This keeps ISO composition, Calamares package selection, and support policy aligned.

The desktop flavor metapackage should depend on distro-owned configuration packages rather than embedding configuration directly in the ISO profile.

## Kernel Strategy

The skeleton assumes Arch kernels first:

- `linux`
- `linux-lts`

Custom kernels should be added later as a separate package, not as an early repository requirement.

## Repository Flow

1. Build distro packages into `repo/x86_64/`.
2. Generate a pacman database with `repo-add`.
3. Point `iso/profile/pacman.conf` at the local or published repository.
4. Build the live ISO with `mkarchiso`.
5. Use Calamares to install `gayos-base` and any desktop flavor metapackages.
