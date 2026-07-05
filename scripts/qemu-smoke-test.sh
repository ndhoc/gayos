#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
iso_dir="$repo_root/dist"

cat <<EOF
QEMU smoke test checklist:

1. Build the ISO into $iso_dir.
2. Boot with qemu-system-x86_64 using OVMF for UEFI validation.
3. Verify the live environment reaches the desktop.
4. Confirm Calamares starts successfully.
5. Repeat with BIOS boot if you support BIOS installs.

Suggested command:
qemu-system-x86_64 -m 4096 -enable-kvm -cdrom <iso> -boot d
EOF
