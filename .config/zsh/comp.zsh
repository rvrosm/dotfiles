#!/usr/bin/env zsh
#
ZSH_COMP_DIR="$HOME/.zsh/completions"
mkdir -p "$ZSH_COMP_DIR"
fpath=("$ZSH_COMP_DIR" $fpath)

generate_completion() {
  local cmd=$1
  local file="$ZSH_COMP_DIR/_$cmd"
  local bin

  (( $+commands[$cmd] )) || return
  bin=$(command -v $cmd)

  if [[ ! -f $file || $bin -nt $file ]]; then
    $cmd completions zsh > "$file" 2>/dev/null
  fi
}

generate_completion rustup
generate_completion kubectl
generate_completion tinty
generate_completion fzf
