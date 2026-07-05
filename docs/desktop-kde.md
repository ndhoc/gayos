# KDE Flavor

`gayos-kde` is the first desktop flavor for the distro.

## Package Responsibilities

- `gayos-kde`: flavor metapackage
- `gayos-settings-kde`: Plasma, SDDM, and XDG defaults
- `gayos-sddm-theme`: SDDM theme assets and metadata
- `gayos-wallpapers`: wallpapers shipped by the distro

## Goals

- boot to a branded SDDM session
- provide sensible KDE defaults without patching upstream packages
- keep the flavor reproducible via metapackages

## Follow-up Work

- add real wallpaper assets
- add KDE look-and-feel package if needed
- add welcome/first-run app
- tune Discover, Firefox, and terminal defaults
