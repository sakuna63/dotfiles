  # 機器ごとの環境に依存するような設定はここに書く

# 起動時読み込み
source ~/.zsh.d/.zshrc.common
source ~/.zsh.d/.zshrc.darwin
source ~/.zsh.d/.zshrc.linux
source ~/.zsh.d/.zshrc.antigen
source ~/.zsh.d/.zshrc.package
source ~/.zsh.d/.zshrc.last

# configure clang （これがないとpipがclang周りでエラーを吐く）
export CC=clang
export CXX=clang++
export LDFLAGS="-L/usr/X11/lib"
export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2"

# THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/sakuna63/.gvm/bin/gvm-init.sh" ]] && source "/Users/sakuna63/.gvm/bin/gvm-init.sh"
