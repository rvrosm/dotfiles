#!/usr/bin/env bash
set -euo pipefail

echo "[install-pkgs] start"

# -----------------------------
# detect platform
# -----------------------------
OS=""
DIST=""

case "$(uname -s)" in
  Linux)
    OS="linux"

    if [[ -f /etc/os-release ]]; then
      . /etc/os-release
      DIST="$ID"
    fi
    ;;
  Darwin)
    OS="macos"
    DIST="macos"
    ;;
  *)
    echo "unsupported system"
    exit 1
    ;;
esac

echo "[install-pkgs] detected: $DIST"

# -----------------------------
# package lists
# -----------------------------
PKGS_COMMON=(base-devel git gnupg openssh curl rsync wget  zip unzip 
    fd ripgrep fzf atuin duf
    lsof iotop bc tree jq 
    direnv tmux screen starship zsh alacritty zsh vim 
    neovim tree-sitter-cli
    nodejs npm go rust python 
)

# Arch AUR only
PKGS_AUR=( )

# Ubuntu-specific adjustments (optional)
PKGS_UBUNTU_EXTRA=()

# -----------------------------
# mapping (only when needed)
# -----------------------------
map_pkg() {
  case "$DIST:$1" in
    ubuntu:fd) echo "fd-find" ;;   # Ubuntu uses fd-find
    ubuntu:python) echo "python3" ;;
    ubuntu:rust) echo "rustc" ;;
    ubuntu:base-devel) echo "build-essential" ;;


    *) echo "$1" ;;
  esac
}

map_pkgs() {
  local out=()
  for p in "$@"; do
    out+=("$(map_pkg "$p")")
  done
  echo "${out[@]}"
}

mapped=($(map_pkgs "${PKGS_COMMON[@]}"))

# detect privilege once
if [[ "$EUID" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

# -----------------------------
# helpers
# -----------------------------
install_pacman() {
  $SUDO pacman -Sy --noconfirm
  $SUDO pacman -S --needed --noconfirm "$@"
}

install_aur() {
  # ensure yay exists
  if ! command -v yay >/dev/null 2>&1; then
    echo "[install-pkgs] installing yay (AUR helper)"

    $SUDO pacman -S --needed --noconfirm git base-devel
    tmp=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp/yay"
    cd "$tmp/yay"
    makepkg -si --noconfirm
    cd -
    rm -rf "$tmp"
  fi

  yay -S --needed --noconfirm "$@"
}

install_apt() {
  $SUDO apt update
  $SUDO apt install -y "$@"
}

install_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "[install-pkgs] installing homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # fix path (esp. apple silicon)
    eval "$(/opt/homebrew/bin/brew shellenv || true)"
  fi

  brew update
  brew install "$@"
}

# -----------------------------
# install based on distro
# -----------------------------
case "$DIST" in
  arch)
    install_pacman "${mapped[@]}"
    [[ ${#PKGS_AUR[@]} -gt 0 ]] && install_aur "${PKGS_AUR[@]}"
    ;;

  ubuntu)
    install_apt "${mapped[@]}" "${PKGS_UBUNTU_EXTRA[@]}"
    ;;

  macos)
    install_brew "${mapped[@]}"
    ;;

  *)
    echo "[install-pkgs] unsupported distro: $DIST"
    exit 1
    ;;
esac

# -----------------------------
# fix fd name on ubuntu
# -----------------------------
if [[ "$DIST" == "ubuntu" ]] && command -v fdfind >/dev/null 2>&1; then
  mkdir -p ~/.local/bin
  ln -sf "$(command -v fdfind)" ~/.local/bin/fd
fi

echo "[install-pkgs] done ✅"
