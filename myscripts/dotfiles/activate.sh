#!/usr/bin/env bash
#
cd ~/myscripts/dotfiles

if [  -f activated.txt ]; then
    echo already did this;
    exit 1;
fi

# pkgs
sh pkgs.sh

zsh

# prompt
starship preset tokyo-night -o ~/.config/starship.toml

./init_vim.sh


if [[ `uname` == "Linux" ]]; then

    RIME_DIR="~/.local/share/fcitx5/rime"
    mkdir -p  "${RIME_DIR}" && rsync -av ~/myscripts/Rime/ "${RIME_DIR}"
fi

date > activated.txt
