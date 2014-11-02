echo 'load .zshenv'

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# gradleを常にdaemon起動する
export GRADLE_OPTS="-Dorg.gradle.daemon=true"
# for go
export GOPATH=~/.gopath

path=(
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /opt/X12/bin
  /usr
  $HOME/.cabal/bin
  $GOPATH/bin
  /Applications/MacVim.app/Contents/MacOS(N-/)
  /Applications/UpTeX.app/teTeX/bin(N-/)
  $path
)


fpath=(
  /usr/local/share/zsh-completions
  $GOPATH/src/github.com/motemen/ghq/zsh/_ghq
  ~/.zsh.d/completion
  $fpath
)

source ~/.zsh.d/.zshenv.darwin