# 起動時読み込み
source ~/.zprezto/runcoms/zshrc
source ~/.zsh.d/.zshrc

if [ -e ~/.zshrc.local ]; then
  echo "load .zshrc.local"
  source ~/.zshrc.local
fi

