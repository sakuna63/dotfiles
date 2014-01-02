# 起動時読み込み
source ~/.zsh.d/.zshrc.darwin
source ~/.zsh.d/.zshrc.linux
source ~/.zsh.d/.zshrc.antigen
source ~/.zsh.d/.zshrc.package
source ~/.zsh.d/.zshrc.last

###################
# For zsh option  #
###################

# 補完機能の設定
autoload -U compinit
compinit
# ディレクトリ名のみで移動
setopt auto_cd
# ディレクトリ移動経歴を記録 cd -[Tab]
setopt auto_pushd
# コマンド訂正
setopt correct
# 表示を詰める
setopt list_packed

# tmuxを自動で起動する
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi
