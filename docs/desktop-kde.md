# Flavor KDE

## Tiếng Việt

`gayos-kde` là desktop flavor đầu tiên của distro.

### Trách Nhiệm Của Từng Package

- `gayos-kde`: metapackage của flavor
- `gayos-settings-kde`: defaults cho Plasma, SDDM và XDG
- `gayos-sddm-theme`: assets và metadata cho theme SDDM
- `gayos-wallpapers`: wallpaper của distro

### Mục Tiêu

- boot vào một phiên SDDM có branding
- cung cấp KDE defaults hợp lý mà không patch trực tiếp package upstream
- giữ flavor có thể tái lập thông qua metapackage

### Việc Cần Làm Tiếp

- thêm wallpaper thật
- thêm package look-and-feel cho KDE nếu cần
- thêm ứng dụng welcome/first-run
- tinh chỉnh Discover, Firefox và defaults cho terminal

## English

`gayos-kde` is the first desktop flavor for the distro.

### Package Responsibilities

- `gayos-kde`: flavor metapackage
- `gayos-settings-kde`: Plasma, SDDM, and XDG defaults
- `gayos-sddm-theme`: SDDM theme assets and metadata
- `gayos-wallpapers`: wallpapers shipped by the distro

### Goals

- boot to a branded SDDM session
- provide sensible KDE defaults without patching upstream packages
- keep the flavor reproducible via metapackages

### Follow-up Work

- add real wallpaper assets
- add KDE look-and-feel package if needed
- add welcome/first-run app
- tune Discover, Firefox, and terminal defaults
