echo 'load .zshenv.darwin'

# load command installed by conscript
export PATH=$PATH:~/bin
# load git completions
export FPATH=$FPATH:$(brew --prefix)/share/zsh/site-functions

# default editor
export EDITOR=/usr/local/bin/vim
# default pager
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# path to java
# export JAVA6_HOME=$(/usr/libexec/java_home -v 1.6)
# export JAVA7_HOME=$(/usr/libexec/java_home -v 1.7)
# export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
# export JAVA_HOME=$JAVA8_HOME

# path to scala
export SCALA_HOME=/usr/local/opt/scala/idea

# path to groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# configure clang （これがないとpipがclang周りでエラーを吐く）
export CC=clang
export CXX=clang++
export LDFLAGS="-L/usr/X11/lib"
export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2"

export MONO_GAC_PREFIX="/usr/local"
export ANDROID_HOME="/usr/local/opt/android-sdk"
export GENYMOTION_APP_HOME="/Applications/Genymotion.app"


if [ `which rbenv` ]; then
  eval "$(rbenv init --no-rehash -)"
fi
