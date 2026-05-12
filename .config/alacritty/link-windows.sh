#!/usr/bin/env bash
set -euo pipefail

# only run in WSL
grep -qi microsoft /proc/version 2>/dev/null || {
  echo "[alacritty] skip: not WSL"
  exit 0
}

A="$HOME/.config/alacritty"
WSL_FILE="$A/alacritty.toml"

# convert to Windows path
WIN_SOURCE=$(wslpath -w "$WSL_FILE")

echo "[alacritty] linking Windows config"

pwsh.exe -NoProfile -Command "
  \$target = \"\$env:APPDATA\\alacritty\\alacritty.toml\"
  \$source = \"$WIN_SOURCE\"
  \$dir = Split-Path \$target

  New-Item -ItemType Directory -Force -Path \$dir | Out-Null

  if (Test-Path \$target) {
    Remove-Item \$target -Force
  }

  New-Item -ItemType SymbolicLink -Path \$target -Target \$source

  Write-Host '✅ linked alacritty.toml'
"
