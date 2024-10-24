#!/usr/bin/zsh

TERM=linux 

if [[ $1 = "off" ]]; then
    setterm --blank force </dev/tty1 >/dev/tty1
else
    setterm --blank poke </dev/tty1 >/dev/tty1
fi

