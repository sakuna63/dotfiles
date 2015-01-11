echo 'load .zshrc.darwin'

eval "$(rbenv init -)"
source ~/.zsh.d/modules/genymotion-peco/bin/genymotion_peco.sh

# commands alias
alias rm="rmtrash"

alias o="open"

############
# Homebrew #
############
alias cask="brew cask"
# alias b="brew"
# alias bs="brew search"
# alias bins="brew install"
# alias binf="brew info"
# alias c="cask"
# alias cs="brew search"
# alias cins="brew install"
# alias cinf="brew info"
alias runserv="python -m SimpleHTTPServer"

# alias git as hub
function git(){hub "$@"}
