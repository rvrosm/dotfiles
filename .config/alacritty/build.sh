#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/.config/alacritty"
OUT="$DIR/alacritty.toml"

# detect GUI OS (WSL -> windows)
if grep -qi microsoft /proc/version 2>/dev/null; then
  OS="windows"
else
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
  cat "$DIR/base.toml"
  echo

[[ -f "$DIR/$OS.toml" ]] && cat "$DIR/$OS.toml"
} > "$tmp"

# only update if changed
if [[ ! -f "$OUT" ]] || ! cmp -s "$tmp" "$OUT"; then
  mv "$tmp" "$OUT"
  echo "[alacritty] updated $OUT"
else
  rm "$tmp"
  echo "[alacritty] unchanged"
fi
``
