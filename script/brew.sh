brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/science
brew tap homebrew/binary
brew tap homebrew/versions
brew tap peco/peco
brew tap sanemat/font

brew update
brew upgrade

brew pull https://github.com/Homebrew/homebrew/pull/25953

brew install brew-cask

# dev tools
brew install android-sdk
brew install android-ndk
brew install jad
brew instlal dex2jar
brew install jq
brew install pidcat
brew install macvim --with-lua --with-luajit --with-python2
brew install reattach-to-user-namespace
brew install terminal-notifier
brew install tmux
brew install vim --with-lua --with-luajit --with-python3
brew install vimpager
brew install zsh
brew install go
brew install ricty --vim-powerline
brew install ruby-build
brew install rbenv
brew install heroku-toolbelt

# git
brew install git
brew install hub
brew install tig

# util commands
brew install ag
brew install imagemagick
brew install nkf
brew install peco
brew install packer
brew install rmtrash
brew install tree
brew install node
brew install ctags
brew install enscript
brew install rename
brew install renameutils
brew install ghostscript
brew install montage
brew install pdftk
brew install wine
brew install wget

#########
# casks #
#########

# hobby
brew cask install cooviewer
brew cask install sopcast
brew cask install vlc

# start up
brew cask install alfred
brew cask install caffeine
brew cask install dropbox
brew cask install karabiner
brew cask install shortcat
brew cask install skype
brew cask install spectacle
brew cask install speedtao
brew cask install google-drive

# utility
brew cask install appcleaner
brew cask install mailbox
brew cask install dashlane
brew cask install evernote
brew cask install flash-player
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install disk-inventry-x
brew cask install istumbler
brew cask install yorufukurou
brew cask install the-unarchiver
brew cask install asepsis

## develop
brew cask install bee
brew cask install genymotion
brew cask install iterm2
brew cask install xquartz
brew cask install java
brew cask install java6
brew cask install java7
brew cask install sourcetree

# Remove outdated versions
brew cleanup
