#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Running repository layout validation"
"$repo_root/scripts/validate-layout.sh"

if command -v makepkg >/dev/null 2>&1 && command -v repo-add >/dev/null 2>&1; then
  echo "Running package build in current Arch environment"
  "$repo_root/scripts/build-packages.sh"
else
  echo "makepkg/repo-add not present; skipping package build"
fi
