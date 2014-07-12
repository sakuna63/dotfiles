mkdir -p ~/.homesick/repos
mv ../dotfiles ~/.homesick/repos/
# for create symlink to dotfiles
gem install homesick
homesick link

# install homebrew
if [ `uname` = "Darwin" ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew bundle
fi

# install neobundle for vim
mkdir -p home/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim home/.vim/bundle/neobundle.vim
mkdir -p home/.vim/backup
mkdir -p home/.vim/swap
mkdir -p home/.vim/undo

# install antigen for zsh
git clone https://github.com/zsh-users/antigen home/.zsh.d/antigen

# download git completions
if [ `uname` = "Linux" ]; then
  mkdir -p home/.zsh.d/completion
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash home/.zsh.d/completion/git-completion.bash
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh home/.zsh.d/completion/git-completion.zsh
  mv home/.zsh.d/completion/git-completion.zsh home/.zsh.d/completion/_git
fi

#download tmux plugins
git clone https://github.com/erikw/tmux-poweline home/.tmux.d/tmux-powerline

tap ~/.zshrc.local

if [ `uname` = "Linux" ]; then
  apt-get install vim zsh golang
  mkdir ~/go
  echo GOPATH=$HOME/go >> ~/.zshrc.local
  echo GOROOT=/usr/lib/go >> ~/.zshrc.local
  go get github.com/peco/peco/cmd/peco
fi
