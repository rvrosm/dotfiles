#!/usr/bin/env bash
#
# archlinux
if  ! command -v pacman; then
    exit 1;
fi

if [[ $1 == "update" ]]; then
    pacman -Syy archlinux-keyring && pacman -Syyu

elif [[ $1 == "must" ]]; then

    pacman -Syy base-devel git curl rsync wget screen zip unzip vim man net-tools dnsutils openssh zsh fzf python python-pipx wireguard-tools shadowsocks-rust ripgrep fd vivid atuin duf eza


elif [[ $1 == "gui" ]]; then

    pacman -Sy firefox mpv

elif [[ $1 == "others" ]]; then


    # terminal
    pacman -Sy alacritty tmux tmuxp 

    # utilities
    pacman -Sy bc gnupg unzip usbutils tree jq dnsutils

    # new tools
    pacman -S bfs

    # riir 
    pacman -S bat zoxide

    # build in golang
    pacman -S doggo

    # multimedia tools
    pacman -Sy mp3wrap mp3splt mediainfo imagemagick 

    # devel
    pacman -Sy base-devel linux-headers go rust nodejs 

    # networks wifi wireguard
    pacman -Sy iw iwd systemd-resolvconf ethtool

    # system management
    pacman -Sy lsof tcpdump iperf3 iotop

    # fonts
    # pacman -Sy otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra 
fi
