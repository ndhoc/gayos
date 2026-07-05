#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

cat <<EOF
Example Arch container workflow:

1. Start an Arch Linux container with this repository mounted.
2. Install: pacman -Syu --noconfirm base-devel git archiso pacman-contrib
3. Build packages: ./scripts/build-packages.sh
4. Optionally use clean chroot builds: ./scripts/build-packages-clean-chroot.sh
5. Build ISO from an Arch VM or privileged environment: ./scripts/build-iso.sh
6. Smoke test the ISO: ./scripts/qemu-smoke-test.sh

Repository root:
$repo_root
EOF
