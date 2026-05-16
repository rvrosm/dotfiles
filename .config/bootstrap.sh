#!/usr/bin/env bash
set -euo pipefail

echo "[bootstrap] start"

REPO_URL="https://github.com/rvrosm/dotfiles.git"
TARGET="$HOME/.dotfiles"

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
dotfiles checkout || {
  echo "[bootstrap] checkout failed"
  exit 1

}

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
