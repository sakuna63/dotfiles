# vim setting
mkdir -p home/.vim/bundle
mkdir -p home/.vim/backup
mkdir -p home/.vim/swap
mkdir -p home/.vim/undo
git clone https://github.com/Shougo/neobundle.vim home/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
