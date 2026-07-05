# Môi Trường Build

## Tiếng Việt

Distro nên được build từ môi trường Arch Linux, có thể là trên Arch host trực tiếp hoặc trong Arch container/VM.

### Công Cụ Cần Thiết

- `base-devel`
- `devtools`
- `git`
- `archiso`
- `pacman-contrib`
- `calamares`
- `squashfs-tools`
- `rsync`
- `qemu-full`
- `edk2-ovmf`

### Workflow Local Được Khuyên Nghị

1. Dùng Arch VM để build package và ISO.
2. Clone repo này vào VM.
3. Build package của distro trước bằng `scripts/build-packages.sh`.
4. Nếu cần tính tái lập cao hơn, ưu tiên `scripts/build-packages-clean-chroot.sh`.
5. Tạo local repo database.
6. Build ISO từ local repo bằng `scripts/build-iso.sh`.

### Workflow Container

Package build có thể chạy trong container, nhưng ISO generation thường ổn định hơn trong VM có quyền cao hơn, vì `mkarchiso` cần loop devices và môi trường Linux gần native hơn.

Phân tách được đề xuất:

- container: package build và tạo repository
- VM: ISO build và installer smoke test

### Ghi Chú Về Production Scaffold

Repo hiện đã có các scaffold hướng production cho:

- pacman repo append snippet trong `gayos-release`
- keyring population hook trong `gayos-keyring`
- mirrorlist placeholder có tài liệu trong `gayos-mirrorlist`
- clean chroot build với `devtools`
- repo publishing qua `PUBLISH_DIR` và `rsync`

### Khuyến Nghị Cho CI

1. Chạy package lint và PKGBUILD validation trên mỗi lần push.
2. Build distro packages trong CI cho `staging`.
3. Chỉ publish signed packages từ protected branches hoặc tags.
4. Build ISO trên release branches hoặc tags.
5. Boot test ISO bằng QEMU trước khi publish.

### Smoke Testing

Các kiểm tra tự động nên có:

1. validation layout của repo
2. package build trong môi trường Arch sạch
3. tạo repo database
4. ISO build trong privileged Arch runner hoặc VM
5. QEMU boot smoke test để xác minh bootloader và live boot path

### Lệnh End-to-End Tối Thiểu

```bash
./scripts/build-packages-clean-chroot.sh
./scripts/build-iso.sh
./scripts/qemu-smoke-test.sh
PUBLISH_DIR=/srv/mirrors/gayos ./scripts/publish-repo.sh
```

## English

The distro should be built from an Arch Linux environment, either directly on an Arch host or inside an Arch container/VM.

### Required Tooling

- `base-devel`
- `devtools`
- `git`
- `archiso`
- `pacman-contrib`
- `calamares`
- `squashfs-tools`
- `rsync`
- `qemu-full`
- `edk2-ovmf`

### Recommended Local Workflow

1. Use an Arch VM for package and ISO builds.
2. Clone this repository into the VM.
3. Build distro packages first with `scripts/build-packages.sh`.
4. For reproducible builds, prefer `scripts/build-packages-clean-chroot.sh`.
5. Build the local repo database.
6. Build the ISO from the local repo with `scripts/build-iso.sh`.

### Container Workflow

Package builds can run inside a container, but full ISO generation often works more reliably in a privileged VM because `mkarchiso` expects loop devices and a closer-to-native Linux environment.

Suggested split:

- container: package builds and repository generation
- VM: ISO builds and installer smoke tests

### Production Scaffold Notes

The repository now includes production-oriented scaffolding for:

- pacman repo append snippets in `gayos-release`
- keyring population hooks in `gayos-keyring`
- documented mirrorlist placeholders in `gayos-mirrorlist`
- clean chroot builds with `devtools`
- repo publishing via `PUBLISH_DIR` and `rsync`

### CI Recommendations

1. Run package lint and PKGBUILD validation on every push.
2. Build distro packages in CI for `staging`.
3. Publish signed packages only from protected branches or tags.
4. Build ISOs on release branches or tags.
5. Boot test the ISO in QEMU before publishing.

### Smoke Testing

Recommended automated checks:

1. package layout validation
2. package build in clean Arch environment
3. repo database generation
4. ISO build in privileged Arch runner or VM
5. QEMU boot smoke test to verify bootloader and live boot path

### Minimal End-to-End Commands

```bash
./scripts/build-packages-clean-chroot.sh
./scripts/build-iso.sh
./scripts/qemu-smoke-test.sh
PUBLISH_DIR=/srv/mirrors/gayos ./scripts/publish-repo.sh
```
