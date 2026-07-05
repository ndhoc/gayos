# gayos

## Tiếng Việt

`gayos` là bộ khung distro Linux nền Arch, tập trung vào một nền tảng dễ bảo trì: lớp package, metadata binary repo, profile ISO, cấu hình installer, system defaults và công cụ release.

### Cấu Trúc Repo

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

### Phạm Vi Ban Đầu

- `packages/core/gayos-release`: nhận diện distro và cấu hình repo pacman
- `packages/core/gayos-keyring`: gói khung cho package signing key trong tương lai
- `packages/core/gayos-mirrorlist`: cấu hình mirror
- `packages/desktop/gayos-desktop-defaults`: defaults và service theo hướng desktop
- `packages/meta/gayos-base`: metapackage tối thiểu để bootstrap hệ thống
- `packages/meta/gayos-kde`: metapackage cho flavor KDE Plasma
- `iso/profile`: profile `archiso` cho live image
- `installer/calamares`: cấu hình và branding khởi đầu cho Calamares
- `scripts`: script build, publish repo và validation
- `docs`: tài liệu kiến trúc và quy trình release

### Mục Tiêu Tiếp Theo

1. Thêm signing key thật cho `gayos-keyring`.
2. Thay mirror URL placeholder bằng mirror thật.
3. Mở rộng `packages.x86_64` và package selection trong Calamares.
4. Thêm CI cho package build và ISO build.
5. Quyết định có thêm `linux-gayos` hay giữ kernel Arch gốc ở giai đoạn đầu.

### Mục Tiêu Build

- `gayos-base`: metapackage hệ thống cơ sở
- `gayos-kde`: flavor desktop KDE Plasma
- `gayos-settings-kde`: defaults và hành vi khởi động đầu tiên cho KDE
- `gayos-sddm-theme`: package theme cho display manager
- `gayos-wallpapers`: package wallpaper của distro
- `iso/profile`: live ISO tích hợp Calamares và flavor KDE

### Tài Liệu Dự Án

- `CONTRIBUTING.md`: quy trình đóng góp và kỳ vọng kỹ thuật
- `CODE_OF_CONDUCT.md`: quy tắc ứng xử trong cộng đồng
- `docs/architecture.md`: cấu trúc distro và lớp package
- `docs/build-environment.md`: môi trường build Arch và workflow
- `docs/release-process.md`: quy trình release package và ISO

## English

`gayos` is an Arch-based Linux distribution skeleton focused on a maintainable foundation: package layer, binary repo metadata, ISO profile, installer configuration, system defaults, and release tooling.

### Repository Layout

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

### Initial Scope

- `packages/core/gayos-release`: distro identity and pacman repository configuration
- `packages/core/gayos-keyring`: scaffold package for future signing keys
- `packages/core/gayos-mirrorlist`: mirror configuration package
- `packages/desktop/gayos-desktop-defaults`: desktop-oriented defaults and services
- `packages/meta/gayos-base`: minimal metapackage to bootstrap the system
- `packages/meta/gayos-kde`: KDE Plasma desktop flavor metapackage
- `iso/profile`: `archiso` profile for the live image
- `installer/calamares`: starter Calamares configuration and branding
- `scripts`: build, repo publish, and validation entrypoints
- `docs`: architecture and release process documentation

### Next Steps

1. Add real signing keys to `gayos-keyring`.
2. Replace placeholder mirror URLs with real mirrors.
3. Expand `packages.x86_64` and Calamares package selection.
4. Add CI for package and ISO builds.
5. Decide whether to introduce `linux-gayos` or stay with Arch kernels initially.

### Build Targets

- `gayos-base`: base system metapackage
- `gayos-kde`: KDE Plasma desktop flavor
- `gayos-settings-kde`: KDE-specific defaults and first-run behavior
- `gayos-sddm-theme`: display manager theme package
- `gayos-wallpapers`: distro wallpaper assets package
- `iso/profile`: live ISO embedding Calamares and the KDE flavor

### Project Docs

- `CONTRIBUTING.md`: contribution workflow and engineering expectations
- `CODE_OF_CONDUCT.md`: community behavior expectations
- `docs/architecture.md`: distro structure and package layering
- `docs/build-environment.md`: Arch build environment and workflow
- `docs/release-process.md`: package and ISO release process
