# Ghi Chú Về Installer

## Tiếng Việt

Repo này dùng Calamares làm installer framework dự kiến.

### Mục Tiêu

- hỗ trợ cài đặt EFI và BIOS
- cài hệ thống cơ sở thông qua metapackage
- giữ package selection cho desktop flavor đơn giản
- tránh viết code installer riêng của distro cho đến khi thật sự cần

### Bộ Module Ban Đầu

- welcome
- locale
- keyboard
- partition
- users
- summary
- install
- finished

### Phần Mở Rộng Dự Kiến

- package selection thông qua `netinstall`
- tinh chỉnh bootloader module
- defaults cho locale/timezone
- enable service sau cài đặt
- branding assets và slideshow content

## English

The repository uses Calamares as the intended installer framework.

### Goals

- support EFI and BIOS installs
- install the base system through metapackages
- keep desktop flavor selection simple
- avoid distro-specific installer code until necessary

### Initial Module Set

- welcome
- locale
- keyboard
- partition
- users
- summary
- install
- finished

### Planned Additions

- package selection via `netinstall`
- bootloader module tuning
- locale/timezone defaults
- post-install service enablement
- branding assets and slideshow content
