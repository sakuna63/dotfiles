echo 'load .zshrc.darwin'

source ~/.zsh.d/modules/genymotion-peco/bin/genymotion_peco.sh

# commands alias
alias rm="rmtrash"
alias o="open"

############
# Homebrew #
############
alias cask="brew cask"

# alias git as hub
eval "$(hub alias -s)"
