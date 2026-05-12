#!/usr/bin/env bash
set -e

# detect OS
case "$(uname -s)" in
  Linux) os="linux" ;;
  Darwin) os="macos" ;;
esac

link_if_exists() {
  local src="$1"
  local dst="$2"

  [[ -f "$src" ]] || {
    echo "[skip] missing: $src"
    return
  }

  if [[ -L "$dst" && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
    echo "[skip] already linked: $dst"
    return
  fi

  ln -sf "$src" "$dst"
  echo "[link] $dst → $src"
}

# link os-specific config
# ln -sf ~/.config/zsh/$os.conf ~/.config/zsh/os.zsh
# ln -sf ~/.config/tmux/$os.conf ~/.config/tmux/os.conf
# ln -sf ~/.config/vim/$os.vim ~/.config/vim/os.vim

# main
CONFIGS=(
  "zsh zsh"
  "tmux conf"
  "vim vim"
)

for entry in "${CONFIGS[@]}"; do
  set -- $entry
  name="$1"
  ext="$2"

  link_if_exists \
    "$HOME/.config/$name/$os.$ext" \
    "$HOME/.config/$name/os.$ext"
done

# alacritty (only special case)
~/.config/alacritty/build.sh

# windows link (run once in WSL)
if grep -qi microsoft /proc/version; then
  FLAG="$HOME/.config/alacritty/.windows_linked"

  if [[ ! -f "$FLAG" ]]; then
    ~/.config/alacritty/link-windows.sh
    touch "$FLAG"
  else
    echo "[alacritty] Windows link already initialized"
  fi
fi
