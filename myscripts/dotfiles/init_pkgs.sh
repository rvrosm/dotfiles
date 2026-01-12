#!/usr/bin/env bash
#
# archlinux
if  ! command -v pacman; then
    exit 1;
fi

case "$1" in
    update)
	pacman -Syy archlinux-keyring && pacman -Syyu
	;;
    gui)
	pacman -Sy firefox mpv
	;;
    others)
	# terminal
	pacman -Sy tmux tmuxp 
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
	;;
    *)
	pacman -Syy base-devel git curl rsync wget screen zip unzip vim man net-tools openssh zsh fzf python wireguard-tools shadowsocks-rust ripgrep fd vivid atuin duf eza bc gnupg unzip usbutils tree jq dnsutils
	;;
esac
