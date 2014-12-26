# install packages for MacOS
if [ `uname` = "Darwin" ]; then
  # install packages via ~brew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # zsh 5.0.2
  # git checkout 52fe004 /usr/local/Library/Formula/zsh.rb
  # tmux 1.9
  # git checkout fcb3161 /usr/local/Library/Formula/tmux.rb
  # brew bundle
  sh ~/.homesick/repos/dotfiles/script/brew.sh
fi

# install packages for Linux
if [ `uname` = "Linux" ]; then
  # download git completions
  mkdir -p ~/.zsh.d/completion
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/.zsh.d/completion/git-completion.bash
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh ~/.zsh.d/completion/_git

  apt-get install vim zsh golang git
  mkdir ~/.go
  touch ~/.zshrc.local
  echo 'export GOPATH=$~/go' >> ~/.zshrc.local
  echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc.local
  source ~/.zshrc.local
  go get github.com/peco/peco/cmd/peco
fi

# install go packages
go get github.com/typester/gh-open
go get github.com/motemen/ghq
