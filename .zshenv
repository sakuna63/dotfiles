echo 'load .zshenv'

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# for go
export GOPATH=~/.gopath

# default editor
export EDITOR=vim
# default pager
export PAGER=vimpager
export MANPAGER=vimpager

path=(
  $(brew --prefix)/bin
  /bin
  /opt/X12/bin
  /usr/bin
  /usr/local/bin
  $GOPATH/bin
  ~/.zsh.d/modules/adb-peco/bin(N-/)
  $path
)


fpath=(
  /usr/local/share/zsh-completions
  ~/.zsh.d/completions
  $GOPATH/src/github.com/motemen/ghq/zsh/_ghq
  $fpath
)

if [ `uname` = "Darwin" ]; then
  source ~/.zsh.d/darwin/.zshenv
fi

if [ -e ~/.zshenv.local ]; then
  echo "load .zshenv.local"
  source ~/.zshenv.local
fi
