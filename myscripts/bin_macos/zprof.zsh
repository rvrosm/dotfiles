#/usr/bin/env bash

zshrc=$HOME/.zshrc

tmpzshrc=${TMPDIR}/profilezsh.zshrc

echo zmodload zsh/zprof > $tmpzshrc

cat $HOME/.zshrc >> $tmpzshrc

echo zprof >> $tmpzshrc

zsh -f -c "source $tmpzshrc; exec zsh -lic exit 0"

rm $tmpzshrc
echo done
