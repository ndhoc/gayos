#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
work_dir="$repo_root/out/archiso"
profile_dir="$repo_root/iso/profile"
repo_dir="$repo_root/repo/x86_64"
dist_dir="$repo_root/dist"

mkdir -p "$work_dir"
mkdir -p "$dist_dir"

if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "mkarchiso is required and must be run from an Arch-based environment."
  exit 1
fi

if [[ ! -f "$repo_dir/gayos.db.tar.gz" ]]; then
  echo "Local repo database not found at $repo_dir/gayos.db.tar.gz"
  echo "Run scripts/build-packages.sh first."
  exit 1
fi

mkarchiso -v -w "$work_dir" -o "$dist_dir" "$profile_dir"
