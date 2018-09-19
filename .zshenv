# echo 'load .zshenv'

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
  ~/.zsh.d/funcs
  ~/bin
  $path
)

fpath=(
  ~/.zsh.d/modules/zsh-completions/src
  $GOPATH/src/github.com/motemen/ghq/zsh/_ghq
  $fpath
)

### Settings depending on specific commands
if which nvim >/dev/null 2>&1; then
  export EDITOR=nvim
elif which vim >/dev/null 2>&1; then
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

if git help -a | grep credential-osxkeychain >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=osxkeychain
elif git help -a | grep credential-gnome-keyring >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=git-credential-gnome-keyring
elif which gnome-keyring >/dev/null 2>&1; then
  export GIT_CREDENTIAL_HELPER=gnome-keyring
fi

### HOMEBREW
if which brew >/dev/null 2>&1; then
  path=(
    $(brew --prefix)/bin(N-/)
    $path
  )
  fpath=(
    $(brew --prefix)/etc/zsh-completions
    $(brew --prefix)/share/zsh/site-functions
    $fpath
  )
fi

export HOMEBREW_NO_ANALYTICS=1

### JAVA
if [ -e /usr/libexec/java_home ] ; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export JAVA6_HOME=$(/usr/libexec/java_home -v 1.6)
  export JAVA7_HOME=$(/usr/libexec/java_home -v 1.7)
  export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
fi

### GROOVY
if which brew >/dev/null 2>&1; then
  export GROOVY_HOME="$(brew --prefix)"/opt/groovy/libexec
fi

### ANDROID
if which brew >/dev/null 2>&1; then
  export ANDROID_HOME=~/Library/Android/sdk
  export ANDROID_SDK=~/Library/Android/sdk
  export ANDROID_SDK_ROOT=~/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin

  latest_ver="`ls $ANDROID_HOME/build-tools | tail -n 1`"
  export PATH=$PATH:$ANDROID_HOME/build-tools/$latest_ver
fi

export STUDIO_JDK=$JAVA8_HOME
if [ -n $JAVA8_HOME ]; then
  export STUDIO_JDK=$JAVA7_HOME
fi

if [ -e /Applications/Genymotion.app ]; then
  export GENYMOTION_APP_HOME="/Applications/Genymotion.app"
elif [ -e ~/Applications/Genymotion.app ]; then
  export GENYMOTION_APP_HOME="~/Applications/Genymotion.app"
fi

### Local settings
if [ -e ~/.zshenv.local ]; then
  source ~/.zshenv.local
fi
