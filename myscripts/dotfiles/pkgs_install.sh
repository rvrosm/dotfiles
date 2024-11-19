#!/usr/bin/env bash
#
# archlinux
if  command -v pacman; then

    # update system
    pacman -Syy archlinux-keyring && pacman -Syyu

    if [[ $1 == "must" ]]; then

	pacman -Syy openssh git vim rsync zsh fzf python python-pipx wireguard-tools shadowsocks-rust ripgrep fd vivid atuin duf eza

	exit 0;
    else if [[ $1 == "gui" ]]; then

	pacman -Sy firefox mpv

    else

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

fi
