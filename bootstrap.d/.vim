#!/usr/bin/env bash

cd $HOME/.vim

mkdir bundle backup swap undo

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
