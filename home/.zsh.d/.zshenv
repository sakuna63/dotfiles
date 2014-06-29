echo 'load .zshenv'

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# gradleを常にdaemon起動する
export GRADLE_OPTS="-Dorg.gradle.daemon=true"
# for go
export GOPATH=~/.gopath


# もし .zshenv を複数のマシンで共有していて、
# あるマシンには存在するが別のマシンには存在しないパスを PATH に追加したいなら、
# パスの後ろに (N-/) をつけるとよい
# こうすると、パスの場所にディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
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
  ~/.zsh.d/completion
  ~/.zsh.d/modules/zsh-completions/src
  $fpath
)

source ~/.zsh.d/.zshenv.darwin
