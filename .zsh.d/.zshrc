echo 'load .zshrc'

###################
# For zsh option  #
###################

# viライクなキーバインドに
# bindkey -v

# 補完機能の設定
autoload -U compinit; compinit
# 入力しているコマンdの名画間違っている場合にもしかしたらを出す
unsetopt correct
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

### ref: http://grml.org/zsh/zsh-lovers.html
# Some functions, like _apt and _dpkg, are very slow. You can use a cache in order to proxy the list of results (like the list of available debian packages) Use a cache:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
## Prevent CVS files/directories from being completed:
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
## Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
## Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '_*'
## cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

source ~/.zsh.d/.zshrc.modules
source ~/.zsh.d/.zshrc.alias
source ~/.zsh.d/.zshrc.last
