# Kiến Trúc

## Tiếng Việt

Repo này được tổ chức như một điểm bắt đầu thực dụng cho distro nền Arch.

### Các Lớp

1. `packages/`
Chứa các package Arch xác định nhận diện distro, defaults và metapackage.

2. `iso/`
Chứa profile `archiso` dùng để build live installation image.

3. `installer/`
Chứa cấu hình Calamares, branding và defaults riêng của distro.

4. `system/`
Chứa reference configuration mà distro packages có thể cài vào hệ thống đích.

5. `branding/`
Chứa asset và nội dung branding dùng chung cho live ISO và hệ thống đã cài đặt.

6. `scripts/`
Chứa công cụ local để build package, tạo repo và build ISO.

### Chiến Lược Packaging

Nên bắt đầu với các package riêng của distro sau:

- `gayos-release`
- `gayos-keyring`
- `gayos-mirrorlist`
- `gayos-desktop-defaults`
- `gayos-base`
- `gayos-kde`

Những package này đủ để thiết lập:

- nhận diện `/etc/os-release`
- cấu hình repo pacman
- bộ khung chính sách package signing
- system defaults cho máy mới cài đặt
- metapackage ổn định cho installer/package selection
- desktop flavor đầu tiên có thể cài đặt nhất quán

### Chiến Lược Desktop Flavor

Mỗi desktop environment nên được biểu diễn bằng metapackage riêng.

Flavor ban đầu:

- `gayos-kde`

Package hỗ trợ flavor:

- `gayos-settings-kde`
- `gayos-sddm-theme`
- `gayos-wallpapers`

Flavor trong tương lai có thể theo cùng mẫu:

- `gayos-gnome`
- `gayos-hyprland`
- `gayos-minimal`

Cách tổ chức này giữ cho ISO composition, package selection trong Calamares và chính sách support nhất quán.

Metapackage của desktop flavor nên phụ thuộc vào package cấu hình do distro sở hữu, thay vì nhúng cấu hình trực tiếp vào ISO profile.

### Chiến Lược Kernel

Bộ khung này giả định dùng kernel Arch trước:

- `linux`
- `linux-lts`

Custom kernel nên được thêm sau thành package riêng, không nên trở thành yêu cầu sớm của repo.

### Luồng Repo

1. Build distro packages vào `repo/x86_64/`.
2. Tạo pacman database bằng `repo-add`.
3. Trỏ `iso/profile/pacman.conf` đến local repo hoặc published repo.
4. Build live ISO bằng `mkarchiso`.
5. Dùng Calamares để cài `gayos-base` và các metapackage desktop flavor.

## English

This repository is structured as a practical starting point for an Arch-based distro.

### Layers

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

### Packaging Strategy

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

### Desktop Flavor Strategy

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

### Kernel Strategy

The skeleton assumes Arch kernels first:

- `linux`
- `linux-lts`

Custom kernels should be added later as a separate package, not as an early repository requirement.

### Repository Flow

1. Build distro packages into `repo/x86_64/`.
2. Generate a pacman database with `repo-add`.
3. Point `iso/profile/pacman.conf` at the local or published repository.
4. Build the live ISO with `mkarchiso`.
5. Use Calamares to install `gayos-base` and any desktop flavor metapackages.
