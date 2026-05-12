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
vim -es -u ~/.vimrc -i NONE +PlugInstall +qall

echo "[install] done ✅"
