#!/usr/bin/env bash

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim
rm ./installer.sh

pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
