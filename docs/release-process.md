# Release Process

## Package Release

1. Build packages with `scripts/build-packages-clean-chroot.sh` or `scripts/build-packages.sh`.
2. Sign packages and repository metadata.
3. Publish the updated binary repository.
4. Smoke test install and upgrade paths for `gayos-base` and each desktop flavor.

## ISO Release

1. Freeze package set for the release.
2. Rebuild the live ISO with `scripts/build-iso.sh`.
3. Test boot in BIOS and UEFI.
4. Test Calamares installation on GPT and Btrfs/Ext4 layouts.
5. Verify the installed system reaches the display manager and desktop session.
6. Publish checksums and signatures.

## Stability Channels

- `staging`: package development and integration
- `testing`: pre-release validation
- `stable`: public release channel

## Pre-Release Gate

Before promoting packages or an ISO to `stable`, verify:

1. distro packages built in clean chroot
2. local repo database updated correctly
3. live ISO boots in QEMU with UEFI
4. installer reaches summary page without module failures
5. installed system boots to SDDM
