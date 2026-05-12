#!/usr/bin/env zsh

# -----------------------------
# setup dir
# -----------------------------
ZSH_COMP_DIR="$HOME/.zsh/completions"
mkdir -p "$ZSH_COMP_DIR"

# add to fpath BEFORE compinit
fpath=("$ZSH_COMP_DIR" $fpath)

# -----------------------------
# commands
# -----------------------------
CMDS=(kubectl rustup starship fzf tinty)

for cmd in $CMDS; do
  (( $+commands[$cmd] )) || continue

  file="$ZSH_COMP_DIR/_$cmd"
  bin="$(command -v $cmd)"

  # skip if up-to-date
  [[ -f "$file" && "$bin" -ot "$file" ]] && continue

  # map command to completion generator
  case "$cmd" in
    kubectl)   gen="kubectl completion zsh" ;;
    rustup)    gen="rustup completions zsh" ;;
    starship)  gen="starship completions zsh" ;;
    fzf)       gen="fzf --zsh" ;;
    tinty)     gen="tinty completion zsh" ;;
    *) continue ;;
  esac

  eval "$gen" > "$file" 2>/dev/null
done
