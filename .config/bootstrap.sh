#!/usr/bin/env bash
set -euo pipefail

echo "[bootstrap] start"

REPO_URL="https://github.com/rvrosm/dotfiles.git"
TARGET="$HOME/.dotfiles"

# -----------------------------
# privilege + sudo check
# -----------------------------
if [[ "$EUID" -ne 0 ]]; then
  if ! command -v sudo >/dev/null 2>&1; then
    echo "[bootstrap] ERROR: 'sudo' is required for non-root user"
    echo "Please install it first, then re-run bootstrap."
    exit 1
  fi
fi

command -v git >/dev/null || {
  echo "git required"
  exit 2
}

# -----------------------------
# clone bare repo if needed
# -----------------------------
if [[ ! -d "$TARGET" ]]; then
  git clone --bare "$REPO_URL" "$TARGET"
fi

dotfiles() {
  git --git-dir="$TARGET" --work-tree="$HOME" "$@"
}

# -----------------------------
# checkout config
# -----------------------------
if dotfiles checkout 2>/tmp/dotfiles-checkout.log; then
  echo "[bootstrap] checked out config"
else
  echo "[bootstrap] conflicts detected, backing up existing files"

  BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y-%m-%d_%H-%M-%S)"
  mkdir -p "$BACKUP_DIR"

  sed -n 's/^\s\+\(.*\)$/\1/p' /tmp/dotfiles-checkout.log | while read -r file; do
    mkdir -p "$BACKUP_DIR/$(dirname "$file")"
    mv "$HOME/$file" "$BACKUP_DIR/$file"
  done

  echo "[bootstrap] retry checkout"
  dotfiles checkout
fi

dotfiles config status.showUntrackedFiles no

# -----------------------------
# install packages
# -----------------------------
"$HOME/.config/install-pkgs.sh"

# -----------------------------
# apply configs
# -----------------------------
"$HOME/.config/init.sh"


echo "[bootstrap] done ✅"


echo
echo "[info] optional: switch git remote to SSH for push access"
echo "  dotfiles remote set-url origin git@github.com:rvrosm/dotfiles.git"
echo

