echo 'load .zshenv'

source ~/.zprezto/runcoms/zshenv

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# for go
export GOPATH=~/.gopath

### Common settings
path=(
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /opt/X12/bin
  $GOPATH/bin
  ~/.zsh.d/modules/adb-peco/bin(N-/)
  $path
)

fpath=(
  ~/.zsh.d/modules/zsh-completions/src
  $GOPATH/src/github.com/motemen/ghq/zsh/_ghq
  $fpath
)

### Settings depending on specific commands
if which vim >/dev/null 2>&1; then
  export EDITOR=vim
elif which vimx >/dev/null 2>&1; then
  export EDITOR=vimx
else
  export EDITOR=nano
fi

if which vimpager >/dev/null 2>&1; then
  export MANPAGER=vimpager
else
  export MANPAGER=less
fi
export PAGER=less

if which rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if which hub >/dev/null 2>&1; then
  eval "$(hub alias -s)"
fi

if which git-credential-osxkeychain >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=osxkeychain
elif which git-credential-gnome-keyring >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=git-credential-gnome-keyring
elif which gnome-keyring >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=gnome-keyring
fi

### Settings for Darwin(osx)
if [ `uname` = "Darwin" ]; then
  path=(
    $(brew --prefix)/bin(N-/)
    $path
  )

  fpath=(
    $(brew --prefix)/share/zsh/site-functions
    $fpath
  )

  export ANDROID_HOME=$(brew --prefix)/opt/android-sdk

  if [ -e /Applications/Genymotion.app ]; then
    export GENYMOTION_APP_HOME="/Applications/Genymotion.app"
  elif [ -e ~/Applications/Genymotion.app ]; then
    export GENYMOTION_APP_HOME="/Applications/Genymotion.app"
  fi

  export PGDATA=/usr/local/var/postgres
fi

### Local settings
if [ -e ~/.zshenv.local ]; then
  source ~/.zshenv.local
fi
