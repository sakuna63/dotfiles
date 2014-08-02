# install packages for MacOS
if [ `uname` = "Darwin" ]; then
  # install packages via homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  # zsh 5.0.2
  git checkout 52fe004 /usr/local/Library/Formula/zsh.rb
  # tmux 1.9
  git checkout fcb3161 /usr/local/Library/Formula/tmux.rb
  brew bundle
fi

# install packages for Linux
if [ `uname` = "Linux" ]; then
  # download git completions
  mkdir -p home/.zsh.d/completion
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash home/.zsh.d/completion/git-completion.bash
  curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh home/.zsh.d/completion/_git

  apt-get install vim zsh golang git
  mkdir ~/.go
  touch ~/.zshrc.local
  echo 'export GOPATH=$HOME/go' >> ~/.zshrc.local
  echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc.local
  source ~/.zshrc.local
  go get github.com/peco/peco/cmd/peco
fi

# install go packages
go get github.com/typester/gh-open
go get github.com/motemen/ghq
