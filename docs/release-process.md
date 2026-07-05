# Quy Trình Release

## Tiếng Việt

### Release Package

1. Build package bằng `scripts/build-packages-clean-chroot.sh` hoặc `scripts/build-packages.sh`.
2. Ký package và repository metadata.
3. Publish binary repository đã cập nhật.
4. Smoke test đường cài đặt và nâng cấp cho `gayos-base` và từng desktop flavor.

### Release ISO

1. Đóng băng package set cho bản release.
2. Build lại live ISO bằng `scripts/build-iso.sh`.
3. Test boot ở BIOS và UEFI.
4. Test cài đặt Calamares trên GPT và layout Btrfs/Ext4.
5. Xác minh hệ thống đã cài đặt vào được display manager và desktop session.
6. Publish checksums và signatures.

### Các Kênh Ổn Định

- `staging`: phát triển và tích hợp package
- `testing`: xác thực trước release
- `stable`: kênh public

### Điều Kiện Trước Khi Đưa Lên Stable

Trước khi đưa package hoặc ISO lên `stable`, cần xác minh:

1. distro packages build thành công trong clean chroot
2. local repo database được cập nhật đúng
3. live ISO boot được trong QEMU với UEFI
4. installer đến được màn hình summary mà không lỗi module
5. hệ thống đã cài đặt boot lên SDDM

## English

### Package Release

1. Build packages with `scripts/build-packages-clean-chroot.sh` or `scripts/build-packages.sh`.
2. Sign packages and repository metadata.
3. Publish the updated binary repository.
4. Smoke test install and upgrade paths for `gayos-base` and each desktop flavor.

### ISO Release

1. Freeze package set for the release.
2. Rebuild the live ISO with `scripts/build-iso.sh`.
3. Test boot in BIOS and UEFI.
4. Test Calamares installation on GPT and Btrfs/Ext4 layouts.
5. Verify the installed system reaches the display manager and desktop session.
6. Publish checksums and signatures.

### Stability Channels

- `staging`: package development and integration
- `testing`: pre-release validation
- `stable`: public release channel

### Pre-Release Gate

Before promoting packages or an ISO to `stable`, verify:

1. distro packages built in clean chroot
2. local repo database updated correctly
3. live ISO boots in QEMU with UEFI
4. installer reaches summary page without module failures
5. installed system boots to SDDM
