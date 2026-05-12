#!/usr/bin/env bash
set -euo pipefail

# only run in WSL
grep -qi microsoft /proc/version 2>/dev/null || {
  echo "[alacritty] skip: not WSL"
  exit 0
}

A="$HOME/.config/alacritty"
SRC="$A/alacritty.toml"
HASH_FILE="$A/.alacritty_hash"

# compute current hash
current_hash=$(sha256sum "$SRC" | awk '{print $1}')

# read previous hash (if exists)
previous_hash=""
[[ -f "$HASH_FILE" ]] && previous_hash=$(cat "$HASH_FILE")

# compare
if [[ "$current_hash" == "$previous_hash" ]]; then
  echo "[alacritty] unchanged"
  exit 0
fi

echo "[alacritty] config changed → updating Windows link"

WIN_SOURCE=$(wslpath -w "$SRC")

pwsh.exe -NoProfile -Command "
  \$target = \"\$env:APPDATA\\alacritty\\alacritty.toml\"
  \$source = \"$WIN_SOURCE\"
  \$dir = Split-Path \$target

  New-Item -ItemType Directory -Force -Path \$dir | Out-Null

  if (Test-Path \$target) {
    Remove-Item \$target -Force
  }

  New-Item -ItemType SymbolicLink -Path \$target -Target \$source | Out-Null
"

# save hash
echo "$current_hash" > "$HASH_FILE"
