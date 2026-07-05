#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
chroot_dir="${CHROOT_DIR:-$HOME/chroot/gayos-x86_64}"
output_dir="$repo_root/repo/x86_64"

if ! command -v mkarchroot >/dev/null 2>&1 || ! command -v arch-nspawn >/dev/null 2>&1; then
  echo "devtools is required. Install it on Arch Linux first."
  exit 1
fi

if ! command -v makechrootpkg >/dev/null 2>&1; then
  echo "makechrootpkg is required. Install devtools on Arch Linux first."
  exit 1
fi

mkdir -p "$output_dir"

if [[ ! -d "$chroot_dir" ]]; then
  echo "==> Creating clean chroot at $chroot_dir"
  mkarchroot "$chroot_dir/root" base-devel git pacman-contrib
fi

mapfile -t pkgbuilds < <(find "$repo_root/packages" -name PKGBUILD | sort)

for pkgbuild in "${pkgbuilds[@]}"; do
  pkgdir="$(dirname "$pkgbuild")"
  echo "==> Clean chroot building $(basename "$pkgdir")"
  (
    cd "$pkgdir"
    PKGDEST="$output_dir" makechrootpkg -c -r "$chroot_dir"
  )
done

shopt -s nullglob
packages=("$output_dir"/*.pkg.tar.zst)

if [[ ${#packages[@]} -eq 0 ]]; then
  echo "No packages were produced in clean chroot build."
  exit 1
fi

repo-add "$output_dir/gayos.db.tar.gz" "${packages[@]}"
