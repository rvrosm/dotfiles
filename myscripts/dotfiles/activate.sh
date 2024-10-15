#!/usr/bin/env bash
#
cd ~/myscripts/dotfiles

# install packages
if [ ! -f activated.txt ]; then
sh pkgs_install.sh must
fi

echo install vim-plug
pipx install debugpy python-lsp-server
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo install vim plugins
vim -es -u ~/.vimrc -i NONE -c "PlugInstall | qa"

date > activated.txt

if [[ `uname` == 'Linux' ]]; then
    . rsync_dotfiles_linux.sh
fi
