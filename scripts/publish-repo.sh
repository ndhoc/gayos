#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/repo/x86_64"
dest_dir="${PUBLISH_DIR:-}"

if [[ -z "$dest_dir" ]]; then
  echo "Set PUBLISH_DIR to the mirror destination path."
  exit 1
fi

if [[ ! -d "$source_dir" ]]; then
  echo "Source repo directory not found: $source_dir"
  exit 1
fi

mkdir -p "$dest_dir"
rsync -av --delete "$source_dir/" "$dest_dir/"

echo "Published repo to $dest_dir"
