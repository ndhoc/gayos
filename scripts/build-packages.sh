#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="$repo_root/repo/x86_64"
repo_name="gayos"

mkdir -p "$output_dir"

if ! command -v makepkg >/dev/null 2>&1; then
  echo "makepkg is required and must be run from an Arch-based environment."
  exit 1
fi

if ! command -v repo-add >/dev/null 2>&1; then
  echo "repo-add is required and is provided by pacman-contrib."
  exit 1
fi

mapfile -t pkgbuilds < <(find "$repo_root/packages" -name PKGBUILD | sort)

if [[ ${#pkgbuilds[@]} -eq 0 ]]; then
  echo "No PKGBUILD files found."
  exit 1
fi

for pkgbuild in "${pkgbuilds[@]}"; do
  pkgdir="$(dirname "$pkgbuild")"
  echo "==> Building $(basename "$pkgdir")"
  (
    cd "$pkgdir"
    makepkg -sf --noconfirm
    find . -maxdepth 1 -type f -name '*.pkg.tar.zst' -exec cp -v {} "$output_dir/" \;
  )
done

shopt -s nullglob
packages=("$output_dir"/*.pkg.tar.zst)

if [[ ${#packages[@]} -eq 0 ]]; then
  echo "No built packages were copied into $output_dir"
  exit 1
fi

repo-add "$output_dir/$repo_name.db.tar.gz" "${packages[@]}"
