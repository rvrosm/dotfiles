#!/usr/bin/env bash
set -euo pipefail

A="$HOME/.config/alacritty"
OUT="$A/alacritty.toml"

# -----------------------------
# detect OS
# -----------------------------
if grep -qi microsoft /proc/version 2>/dev/null; then
  OS="windows"
  IS_WSL=true
else
  IS_WSL=false
  case "$(uname -s)" in
    Linux) OS="linux" ;;
    Darwin) OS="macos" ;;
    *) OS="linux" ;;
  esac
fi

echo "[alacritty] building for $OS"

tmp=$(mktemp)

{
  echo "# GENERATED FILE - DO NOT EDIT"
  echo
  cat "$A/base.toml"
  echo
  [[ -f "$A/$OS.toml" ]] && cat "$A/$OS.toml"
} > "$tmp"

# only overwrite if changed
if [[ ! -f "$OUT" ]] || ! cmp -s "$tmp" "$OUT"; then
  mv "$tmp" "$OUT"
  echo "[alacritty] updated $OUT"
else
  rm "$tmp"
  echo "[alacritty] unchanged"
fi

# -----------------------------
# WSL: copy to Windows
# -----------------------------
if $IS_WSL; then
  DST="/mnt/c/Users/$USER/AppData/Roaming/alacritty/alacritty.toml"

  mkdir -p "$(dirname "$DST")"

  if [[ ! -f "$DST" ]] || ! cmp -s "$OUT" "$DST"; then
    cp "$OUT" "$DST"
    echo "[alacritty] copied to Windows ✅"
  else
    echo "[alacritty] Windows config unchanged"
  fi
fi
