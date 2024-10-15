#!/usr/bin/env zsh
#
compdir=$HOME/.zsh/completion

# gopass
gopass completion zsh > $compdir/_gopass

# cheat
[ -e ~/.zsh/completion/_cheat ] || curl https://raw.githubusercontent.com/cheat/cheat/refs/heads/master/scripts/cheat.zsh -o $compdir/_cheat
