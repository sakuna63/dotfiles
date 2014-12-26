# if [ `uname` == "Darwin" -a -e /Applications/Xcode.app ]; then
#   echo 'error :: You must install Xcode.app before running setting script'
#   exit 1
# fi

# create dotifiles dir if not exists
if [ ! -e ~/.homesick ]; then
  mkdir -p ~/.homesick/repos
  mv ../dotfiles ~/.homesick/repos/
fi

# for create symlink to dotfiles
sudo gem install homesick
homesick link


# install some packages
sh ~/.homesick/repos/dotfiles/script/packages.sh
# settings for vim
sh ~/.homesick/repos/dotfiles/script/vim.sh
# settings for zsh
sh ~/.homesick/repos/dotfiles/script/zsh.sh
# settings for tmux
sh ~/.homesick/repos/dotfiles/script/tmux.sh

source ~/.zshrc
