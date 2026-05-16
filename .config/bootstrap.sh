#!/usr/bin/env bash
set -euo pipefail
# bootstrap.sh      → clone + checkout only
# install.sh        → orchestrator (install + init + vim + nvim)
# install-pkgs.sh   → packages only
# init.sh           → config + linking

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
# backup everything that might conflict
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y-%m-%d_%H-%M-%S)"
created_backup=false

dotfiles ls-tree -r --name-only HEAD | while read -r file; do
  src="$HOME/$file"
  dst="$BACKUP_DIR/$file"

  if [[ -e "$src" ]]; then
    # create backup dir lazily
    if ! $created_backup; then
      mkdir -p "$BACKUP_DIR"
      created_backup=true
    fi

    mkdir -p "$(dirname "$dst")"
    mv "$src" "$dst"
  fi
done

# now checkout always succeeds
dotfiles checkout

dotfiles config status.showUntrackedFiles no


# -----------------------------
# run full install pipeline ✅
# -----------------------------
"$HOME/.config/install.sh"

echo "[bootstrap] done ✅"


echo
echo "[info] optional: switch git remote to SSH for push access"
echo "  dotfiles remote set-url origin git@github.com:rvrosm/dotfiles.git"
echo

