brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/science
brew tap homebrew/binary
brew tap homebrew/versions
brew tap peco/peco

brew update
brew upgrade

brew install brew-cask

# tools
brew install android-sdk
brew install android-ndk
brew install pidcat
brew install macvim --with-lua --with-luajit --with-python3
brew install reattach-to-user-namespace
brew install terminal-notifier
brew install tmux
brew install vim --with-lua --with-luajit --with-python3
brew install vimpager
brew install zsh

# git
brew install git
brew install hub
brew install tig

# util commands
brew install the_silver_searcher
brew install heroku-toolbelt
brew install imagemagick
brew install nkf
brew install peco
brew install packer
brew install rmtrash
brew install ruby-build
brew install rbenv
brew install tree
brew install node

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
brew caks install dropbox
brew cask install karabiner
brew cask install shortcat
brew cask install skype
brew cask install spectacle
brew cask install speedtao

# utility
# brew cask install airmail
brew cask install appcleaner
brew cask install mailbox
# brew cask install coteditor
brew cask install dashlane
brew cask install evernote
brew cask install flash-player
# brew cask install firefox
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install disk-inventry-x
#brew cask install grandperspective
brew cask install istumbler
# brew cask install latexit
# brew cask install virtualbox
brew cask install yorufukurou
# brew cask install sublime-text
brew cask install the-unarchiver

## develop
# brew cask install android-studio
brew cask install bee
brew cask install genymotion
# brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install xquartz
brew cask install java
brew cask install java6
brew cask install java7
brew cask install sourcetree

# cask install skim
# cask install skitch
# cask install processing
# cask install inkscape
# cask install haroopad
# cask install chromecast
# cask install darteditor
# cask install atom
# cask install cakebrew
# cask install sparrow

# Remove outdated versions
brew cleanup
