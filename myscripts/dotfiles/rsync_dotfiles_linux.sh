#!/usr/bin/env bash
#
if [[ `uname` == "Linux" ]]; then
    rsync -av ~/.dotfiles_linux/username/ ~

    RIME_DIR="~/.local/share/fcitx5/rime"
    mkdir -p  "${RIME_DIR}" && rsync -av ~/myscripts/Rime/ "${RIME_DIR}"

    # alacritty
    ln -sf ~/.dotfiles_linux/username/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

    # sudo rsync -av ~/.dotfiles_linux/etc/ /etc
fi
