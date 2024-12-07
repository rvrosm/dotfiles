#!/usr/bin/env bash

echo install vim-plug
pipx install debugpy python-lsp-server
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo install vim plugins
vim -es -u ~/.vimrc -i NONE -c "PlugInstall | qa"
