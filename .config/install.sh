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
# Editors
# -----------------------------
# -----------------------------
# plugin cache reuse (optional)
# -----------------------------
USE_LOCAL_CACHE="${USE_LOCAL_CACHE:-1}"

if [[ "$USE_LOCAL_CACHE" == "1" ]]; then
  if [[ "$HOME" != "/root" ]]; then

    # ---------- vim ----------
    if [[ -d /root/.vim/plugged && ! -d "$HOME/.vim/plugged" ]]; then
      echo "[install] reusing cached vim plugins"
      mkdir -p "$HOME/.vim"
      cp -r /root/.vim/plugged "$HOME/.vim/" || true
      chown -R "$USER:$USER" "$HOME/.vim" 2>/dev/null || true
    fi

    # ---------- nvim ----------
    if [[ -d /root/.local/share/nvim/lazy && ! -d "$HOME/.local/share/nvim/lazy" ]]; then
      echo "[install] reusing cached nvim plugins"
      mkdir -p "$HOME/.local/share/nvim"
      cp -r /root/.local/share/nvim/lazy "$HOME/.local/share/nvim/" || true
      chown -R "$USER:$USER" "$HOME/.local/share/nvim" 2>/dev/null || true
    fi

  fi
fi

# -----------------------------
# vim (vim-plug)
# -----------------------------
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
  echo "[install] installing vim-plug"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "[install] installing vim plugins"

# avoid breaking due to non-zero exit
if ! vim -es -u ~/.vimrc -i NONE +PlugInstall +qall; then
  echo "[install] vim plugin install had issues (continuing)"
fi


# -----------------------------
# nvim (lazy.nvim)
# -----------------------------
if command -v nvim >/dev/null 2>&1; then
  echo "[install] installing nvim plugins (lazy)"

  if ! nvim --headless "+Lazy! sync" +qa; then
    echo "[install] nvim plugin install had issues (continuing)"
  fi
fi

# -----------------------------
# set default shell to zsh
# -----------------------------
if command -v zsh >/dev/null 2>&1; then
  target_user="${SUDO_USER:-$USER}"

  current_shell="$(getent passwd "$target_user" | cut -d: -f7)"

  if [[ "$current_shell" != *zsh ]]; then
    echo "[install] setting default shell to zsh for $target_user"
    chsh -s "$(command -v zsh)" "$target_user"
    echo "[install] please log out and log back in"
  fi
fi

echo "[install] done ✅"
