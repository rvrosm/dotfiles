#!/usr/bin/env bash
set -euo pipefail
# detect OS
# → update system
# → install packages
# → setup config


# -----------------------------
# install system packages
# -----------------------------
$HOME/.config/install-pkgs.sh

# -----------------------------
# init config
# -----------------------------
~/.config/init.sh

# -----------------------------
# vim
# -----------------------------
# -----------------------------
# vim-plug
# -----------------------------
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
  echo "[install] installing vim-plug"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# -----------------------------
# vim plugins
# -----------------------------
echo "[install] installing vim plugins"

# IMPORTANT: prevent set -e from killing script
if ! vim -es -u ~/.vimrc -i NONE +PlugInstall +qall; then
  echo "[install] vim plugin install had issues (continuing)"
fi

# -----------------------------
# nvim (lazy.nvim)
# -----------------------------
if command -v nvim >/dev/null 2>&1; then
  echo "[install] installing nvim plugins (lazy)"

  # also non-fatal
  if ! nvim --headless "+Lazy! sync" +qa; then
    echo "[install] nvim plugin install had issues (continuing)"
  fi
fi


echo "[install] done ✅"
