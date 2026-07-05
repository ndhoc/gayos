# Đóng Góp Cho GayOS

## Tiếng Việt

Cảm ơn bạn đã đóng góp cho `gayos`.

Repo này là bộ khung distro nền Arch, vì vậy mọi đóng góp nên ưu tiên khả năng bảo trì, tính tái lập và độ rõ ràng hơn là sự phức tạp không cần thiết.

### Phạm Vi

Hoan nghênh đóng góp cho:

- distro packages trong `packages/`
- cập nhật ISO profile trong `iso/`
- cấu hình installer trong `installer/`
- công cụ build và release trong `scripts/`
- tài liệu kiến trúc, build và release trong `docs/`

### Nguyên Tắc

- ưu tiên pull request nhỏ và tập trung
- giữ thay đổi có thể tái lập trong môi trường build Arch
- tránh trộn lẫn docs, packaging, installer và CI nếu không liên quan chặt chẽ
- ưu tiên distro-owned packages cho defaults thay vì patch trực tiếp package upstream
- đánh dấu rõ ràng các giá trị placeholder cho đến khi có giá trị production

### Workflow Phát Triển

1. Tạo branch từ `main`.
2. Thực hiện một thay đổi tập trung.
3. Kiểm tra layout repo bằng `scripts/validate-layout.sh`.
4. Nếu cần, build package bằng `scripts/build-packages.sh` hoặc `scripts/build-packages-clean-chroot.sh`.
5. Nếu cần, build lại ISO bằng `scripts/build-iso.sh`.
6. Gửi thay đổi kèm mô tả rõ ràng về ảnh hưởng và cách đã validation.

### Hướng Dẫn Commit

- dùng commit message ngắn gọn
- giữ một thay đổi logic trong một commit nếu có thể
- tách riêng docs, packaging, installer và CI khi hợp lý
- nếu cần, nêu rõ khu vực bị ảnh hưởng ngay trong commit message

Ví dụ:

- `Add core distro packages`
- `Add Calamares installer scaffold`
- `Update KDE flavor defaults`

### Hướng Dẫn Packaging

- giữ PKGBUILD đơn giản và minh bạch
- chỉ dùng `arch=('any')` khi package thật sự độc lập với kiến trúc
- giữ các file nguồn bên cạnh PKGBUILD nếu không có lý do mạnh để tách ra
- đánh dấu rõ key, mirror và URL placeholder
- không đưa vào custom kernel patch stack nếu chưa có kế hoạch bảo trì rõ ràng

### Thay Đổi Installer Và ISO

Khi thay đổi `installer/` hoặc `iso/`, cần mô tả:

- đường đi boot/install nào đã thay đổi
- thay đổi ảnh hưởng BIOS, UEFI, hay cả hai
- package selection hoặc hành vi sau cài đặt có thay đổi hay không

### Báo Cáo Lỗi

Khi báo cáo lỗi, hãy bao gồm:

- khu vực bị ảnh hưởng, ví dụ package build, ISO boot, Calamares hoặc hệ thống đã cài đặt
- các bước tái hiện
- hành vi mong đợi
- hành vi thực tế
- log hoặc ảnh chụp màn hình nếu có

### Quy Tắc Ứng Xử

Khi tham gia dự án này, bạn đồng ý tuân theo các quy tắc trong `CODE_OF_CONDUCT.md`.

## English

Thank you for contributing to `gayos`.

This repository is an Arch-based distro scaffold, so contributions should prioritize maintainability, reproducibility, and clarity over unnecessary complexity.

### Scope

Contributions are welcome for:

- distro packages under `packages/`
- ISO profile updates under `iso/`
- installer configuration under `installer/`
- build and release tooling under `scripts/`
- architecture, build, and release documentation under `docs/`

### Principles

- prefer small, focused pull requests
- keep changes reproducible in Arch-based build environments
- avoid mixing docs, packaging, installer, and CI changes unless they are tightly related
- prefer distro-owned packages for defaults instead of patching upstream packages directly
- keep placeholders clearly marked until production values are available

### Development Workflow

1. Create a branch from `main`.
2. Make a focused change.
3. Validate repository layout with `scripts/validate-layout.sh`.
4. If relevant, build packages with `scripts/build-packages.sh` or `scripts/build-packages-clean-chroot.sh`.
5. If relevant, rebuild the ISO with `scripts/build-iso.sh`.
6. Submit the change with a clear description of impact and validation.

### Commit Guidelines

- use concise commit messages
- keep one logical change per commit when practical
- separate docs, packaging, installer, and CI changes where possible
- mention the affected area in the commit message when helpful

Examples:

- `Add core distro packages`
- `Add Calamares installer scaffold`
- `Update KDE flavor defaults`

### Packaging Guidelines

- keep PKGBUILDs simple and explicit
- prefer `arch=('any')` only when the package is truly architecture-independent
- keep source files beside the PKGBUILD unless there is a strong reason not to
- mark placeholder keys, mirrors, and URLs clearly
- do not introduce a custom kernel patch stack without a clear maintenance plan

### Installer and ISO Changes

When changing `installer/` or `iso/`, document:

- what boot/install path changed
- whether the change affects BIOS, UEFI, or both
- whether package selection or post-install behavior changed

### Reporting Issues

When reporting a bug, include:

- affected area, such as package build, ISO boot, Calamares, or installed system
- steps to reproduce
- expected behavior
- actual behavior
- logs or screenshots when available

### Code of Conduct

By participating in this project, you agree to follow the rules in `CODE_OF_CONDUCT.md`.
