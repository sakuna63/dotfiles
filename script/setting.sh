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
sh ./packages.sh
# settings for vim
sh ./vim.sh
# settings for zsh
sh ./zsh.sh
# settings for tmux
sh ./tmux.sh

source ~/.zshrc
