echo 'load .zshenv.darwin'

# path to java
# export JAVA6_HOME=$(/usr/libexec/java_home -v 1.6)
export JAVA7_HOME=$(/usr/libexec/java_home -v 1.7)
# export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=$JAVA7_HOME

# configure clang （これがないとpipがclang周りでエラーを吐く）
export CC=clang
export CXX=clang++
export LDFLAGS="-L/usr/X11/lib"
export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2"

export MONO_GAC_PREFIX="/usr/local"
export ANDROID_HOME=$(brew --prefix)/opt/android-sdk
export GENYMOTION_APP_HOME="/Applications/Genymotion.app"

export GIT_CREDENTIAL_HELPER=osxkeychain

export PGDATA=/usr/local/var/postgres
