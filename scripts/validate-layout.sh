#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$repo_root/packages/core/gayos-release/PKGBUILD"
  "$repo_root/packages/core/gayos-keyring/PKGBUILD"
  "$repo_root/packages/core/gayos-mirrorlist/PKGBUILD"
  "$repo_root/packages/core/gayos-release/pacman.conf.append"
  "$repo_root/packages/core/gayos-keyring/gayos.gpg"
  "$repo_root/packages/core/gayos-mirrorlist/mirrorlist-readme"
  "$repo_root/packages/meta/gayos-base/PKGBUILD"
  "$repo_root/packages/meta/gayos-kde/PKGBUILD"
  "$repo_root/packages/meta/gayos-live/PKGBUILD"
  "$repo_root/packages/desktop/gayos-settings-kde/PKGBUILD"
  "$repo_root/packages/desktop/gayos-sddm-theme/PKGBUILD"
  "$repo_root/packages/desktop/gayos-wallpapers/PKGBUILD"
  "$repo_root/iso/profile/profiledef.sh"
  "$repo_root/installer/calamares/settings.conf"
  "$repo_root/docs/build-environment.md"
  "$repo_root/docs/desktop-kde.md"
  "$repo_root/scripts/build-packages-clean-chroot.sh"
  "$repo_root/scripts/qemu-smoke-test.sh"
)

for path in "${required_files[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required file: $path"
    exit 1
  fi
done

echo "Repository layout looks valid."
