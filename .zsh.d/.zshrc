echo 'load .zshrc'

###################
# For zsh option  #
###################

# viライクなキーバインドに
# bindkey -v

# 補完機能の設定
autoload -U compinit; compinit
# 入力しているコマンdの名画間違っている場合にもしかした：を出す
setopt correct
# 色を使う
setopt prompt_subst
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# ディレクトリ名のみで移動
setopt auto_cd
# ディレクトリ移動経歴を記録 cd -[Tab]
setopt auto_pushd
# 表示を詰める
setopt list_packed
# add-zsh-hookを有効化
autoload -Uz add-zsh-hook

autoload -U chpwd_recent_dirs cdr
chpwd_functions+=chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always

# tmuxを自動で起動する
# if [ -z "$TMUX" -a -z "$STY" ]; then
#     if type tmuxx >/dev/null 2>&1; then
#         tmuxx
#     elif type tmux >/dev/null 2>&1; then
#         if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#             tmux attach && echo "tmux attached session "
#         else
#             tmux new-session && echo "tmux created new session"
#         fi
#     elif type screen >/dev/null 2>&1; then
#         screen -rx || screen -D -RR
#     fi
# fi

if [ `uname` = "Darwin" ]; then
  source ~/.zsh.d/darwin/.zshrc
fi

if [ `uname` = "Linux" ]; then
  source ~/.zsh.d/linux/.zshrc
fi

source ~/.zsh.d/.zshrc.antigen
source ~/.zsh.d/.zshrc.package
source ~/.zsh.d/.zshrc.alias
source ~/.zsh.d/.zshrc.funcs
source ~/.zsh.d/.zshrc.last
