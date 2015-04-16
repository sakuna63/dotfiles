require './setup_utils'

task default: 'setup'

desc "default task. this task executes all tasks"
task setup: [:check, :homesick, :package, :vim, :tmux, :zsh, :misc] do end

desc "check device environment satisfy requirement for executing setup tasks"
task :check do
  case `uname`.chomp
  when 'Darwin'
    check_darwin
  when 'Linux'
    check_linux
  end
end

def check_darwin
  puts 'you must install xcode via AppStore' unless xcode_exists
  puts 'you must install brew via  `ruby -e "$(curl -fsSL #{URL_GITHUB_CONTENT}/Homebrew/install/master/install)"`' unless brew_exists

  unless xcode_exists && brew_exists
    raise "don't satisfy the condition for installing packages"
  end
end

def check_linux
end

desc "setup homesick environment"
task :homesick do
  path_to_homesick = '~/.homesick'
  if Dir.exist?(path_to_homesick)
    makedir("#{path_to_homesick}/repos")
    move('../dotfiles', "#{path_to_homesick}/repos/")
  end

  puts `sudo gem install homesick`
  puts `homesick link`
end

desc "setup vim environment"
task :vim do
  path_to_vim_dir = "#{ENV['HOME']}/.vim"
  %w(bundle backup swap undo).each do |name|
    makedir("#{path_to_vim_dir}/#{name}")
  end

  Github::clone('Shougo/neobundle.vim', '~/.vim/bundle/neobundle.vim')
  puts `vim +NeoBundleInstall +qall`
end

desc "setup tmux environment"
task :tmux do
  Github::clone('erikw/tmux-powerline', '~/.tmux.d/tmux-powerline')
end

desc "setup zsh environment"
task zsh: [:check] do
  Github::clone('zsh-users/antigen', '~/.zsh.d/antigen')
  prefix = brew_exists ? `brew --prefix` : '/usr/local'
  puts `echo #{prefix}/bin/zsh | sudo tee -a /etc/shells`
  puts `chsh -s #{prefix}/bin/zsh`
  puts `source ~/.zshrc`
end

desc "install package flags=android,ruby,full"
task package: [:check] do
  case `uname`.chomp
  when 'Darwin'
    install_darwin_packages
  when 'Linux'
    install_linux_packages
  end
end

def install_darwin_packages
  flags = (ENV['flags'] || '').split(',').map(&:to_sym)
  Rake::Task['homebrew:install'].invoke(flags)
end

def install_linux_packages
  makedir("#{ENV[HOME]}/zsh.d/completion")
  path_to_git_completion = '/git/git/master/contrib/completion/'
  Github::content("#{path_to_git_completion}/git-completion.bash" '~/.zsh.d/completion/git-completion.bash')
  Github::content("#{path_to_git_completion}/git-completion.zsh" '~/.zsh.d/completion/_git')

  puts `apt-get install vim zsh golang git`
  makedir('~/.go')
  puts `touch ~/.zshrc.local`
  puts `echo 'export GOPATH=$~/go' >> ~/.zshrc.local`
  puts `echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc.local`
  puts `source ~/.zshrc.local`
  puts `go get github.com/peco/peco/cmd/peco`
end

namespace :homebrew do
  task :install, [:flags] => :setup do |t, args|
    tasks = %w(utils_essential dev:utils cask:utils_essential cask:dev:utils dev:git)
    tasks = tasks + %w(dev:android cask:dev:android) if args.flags.include? :android
    tasks = tasks + %w(dev:ruby) if args.flags.include? :ruby
    tasks = tasks + %w(utils cask:utils cask:media) if args.flags.include? :full

    tasks.each do |task|
      Rake::Task["homebrew:#{task}"].invoke
    end
    Rake::Task['homebrew:clean'].invoke
    Rake::Task['homebrew:link'].invoke
  end

  task :setup do
    repos = %w(
      caskroom/cask
      caskroom/versions
      homebrew/science
      homebrew/binary
      homebrew/versions
      sanemat/font
      )
    Homebrew::tap(*repos)
    Homebrew::update
    Homebrew::upgrade
    Homebrew::pull('/Homebrew/homebrew/pull/25953')
    Homebrew::install('brew-cask')
  end

  task :clean do
    Homebrew::clean
    Homebrew::Cask::clean
  end

  task :link do
    Homebrew::link
  end

  task utils_essential: :setup do
    packages = %w(
      ag
      nkf
      peco
      rmtrash
      tree
      wget
      reattach-to-user-namespace
      tarminal-notifier
      tmux
      go
      Caskroom/cask/xquartz
      )
    packages << 'ricty --vim-powerline'
    Homebrew::install(*packages)

    # setup for ricty
    puts `cp -f $(brew --cellar)/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/`
    puts `fc-cache -vf`
  end

  task utils: :setup do
    packages = %w(
      imagemagick
      enscript
      rename
      renameutils
      ghostscript
      montage
      pdftk
      wine
    )
    Homebrew::install(*packages)
  end

  namespace :dev do
    task utils: :setup do
      packages = %w(jq vimpager zsh ssh-copy-id)
      packages << 'macvim --override-system-vim --with-lua --with-luajit, --with-python2'
      Homebrew::install(*packages)
    end

    task ruby: :setup do
      packages = %w(ruby-build rbenv heroku-toolbelt)
      Homebrew::install(*packages)
    end

    task android: :setup do
      Homebrew::install(*%w(android-sdk android-ndk jad dex2jar pidcat))
    end

    task git: :setup do
      Homebrew::install(*%w(git hub tig))
    end
  end

  namespace :cask do
    task utils_essential: :setup do
      packages = %w(
        alfred
        caffeine
        karabiner
        spectacle
        flux
        day-o
        dropbox
        evernote
        fantastical
        google-chrome
        google-japanese-ime
        hyperswitch
        the-unarchiver
        xquartz
        )
      Homebrew::Cask::install(*packages)
    end

    task utils: :setup do
      packages = %w(
        appcleaner
        disk-inventry-x
        google-drive
        skype
        shortcat
      )
      Homebrew::Cask::install(*packages)
    end

    task media: :setup do
      packages = %w(cooviewer sopcast vlc vox)
      Homebrew::Cask::install(*packages)
    end

    namespace :dev do
      task utils: :setup do
        packages = %w(
          iterm2
          sourcetree
        )
        Homebrew::Cask::install(*packages)
      end

      task android: :setup do
        packages = %w(
          virtual-box
          genymotion
          java6
          java7
        )
        Homebrew::Cask::install(*packages)
      end
   end
  end
end

task :misc do
  puts `defaults write -g ApplePressAndHoldEnabled -bool false`

  puts `go get github.com/typester/gh-open`
  puts `go get github.com/motemen/ghq`

  # ref http://labocho.github.io/rubydoc-ja-docsets/
  puts `open dash-feed://https%3A%2F%2Fraw.github.com%2Flabocho%2Frubydoc-ja-docsets%2Fmaster%2Ftarball%2FRuby-2.2.0-ja.xml`
end
