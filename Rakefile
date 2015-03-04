task default: 'setup'

URL_GITHUB = 'https://github.com'
URL_GITHUB_CONTENT = 'https://raw.githubusercontent.com'

def tilde_to_path_to_home(path)
  path.gsub('~', ENV['HOME'])
end

def makedir(path_to_dir)
  path_to_dir = tilde_to_path_to_home(path_to_dir)
  if Dir.exist?(path_to_dir)
    puts "#{path_to_dir} is already exist"
    return
  end
  puts "created #{path_to_dir}" if Dir.mkdir(path_to_dir)
end

def move(src, dest)
  src = tilde_to_path_to_home(src)
  dest = tilde_to_path_to_home(dest)
  puts "moved '#{src} → #{dest}'" if FileUtils.mv(src, dest)
end

def github_clone(src, dest)
  puts `git clone #{URL_GITHUB}/#{src} #{dest}`
end

def github_content_curl(src, dest)
  puts `curl -O #{URL_GITHUB_CONTENT}/#{src} #{dest}`
end

task setup: [:homesick, :package, :vim, :zsh, :tmux, :misc] do
  puts `source ~/.zshrc`
end

task :check do
  case `uname`.chomp
  when 'Darwin'
    Rake::Task['check_darwin'].invoke
  when 'Linux'
    Rake::Task['check_linux'].invoke
  end
end

task :check_darwin do
  xcode_exists = Dir.exists?('/Applications/Xcode.app')
  brew_exists = `brew`

  puts 'you must install xcode via AppStore' unless xcode_exists
  puts 'you must install brew via  `ruby -e "$(curl -fsSL #{URL_GITHUB_CONTENT}/Homebrew/install/master/install)"`' unless brew_exists

  unless false && xcode_exists && brew_exists
    raise "don't satisfy the condition for installing packages"
  end
end

task :check_darwin do
end

task :homesick do
  path_to_homesick = '~/homesick'
  if Dir.exist?(path_to_homesick)
    makedir("#{path_to_homesick}/repos")
    move('../dotfiles', "#{path_to_homesick}/repos/")
  end

  puts `gem install homesick`
  puts `homesick link`
end

task :vim do
  path_to_vim_dir = "#{ENV['HOME']}/.vim"
  %w(bundle backup swap undo).each do |name|
    makedir("#{path_to_vim_dir}/#{name}")
  end

  github_clone('Shougo/neobundle.vim', '~/.vim/bundle/neobundle.vim')
  puts `vim +NeoBundleInstall +qall`
end

task :tmux do
  github_clone('erikw/tmux-powerline', '~/.tmux.d/tmux-powerline')
end

task :zsh do
  github_clone('zsh-users/antigen', '~/.zsh.d/antigen')
  puts `echo '$(brew --prefix)/bin/zsh' | sudo tee -a /etc/shells`
  puts `chsh -s $(brew --prefix)/bin/zsh`
end

task package: [:check] do
  case `uname`.chomp
  when 'Darwin'
    flags = (ENV['flags'] || '').split(',').map(&:to_sym)
    Rake::Task['homebrew:install'].invoke(flags)
  when 'Linux'
    Rake::Task['linux_package'].invoke
  end

  puts `go get github.com/typester/gh-open`
  puts `go get github.com/motemen/ghq`
end


task :linux_package do
  makedir("#{ENV[HOME]}/zsh.d/completion")
  path_to_git_completion = '/git/git/master/contrib/completion/'
  github_content_curl("#{url_to_git_completion}/git-completion.bash" '~/.zsh.d/completion/git-completion.bash')
  github_content_curl("#{url_to_git_completion}/git-completion.zsh" '~/.zsh.d/completion/_git')

  puts `apt-get install vim zsh golang git`
  makedir('~/.go')
  puts `touch ~/.zshrc.local`
  puts `echo 'export GOPATH=$~/go' >> ~/.zshrc.local`
  puts `echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc.local`
  puts `source ~/.zshrc.local`
  puts `go get github.com/peco/peco/cmd/peco`
end

namespace :homebrew do
  def ins(*packages)
    packages.each do |package|
      puts `brew install #{package}`
    end
  end

  def tap(*repos)
    repos.each do |repo|
      puts `brew tap #{repo}`
    end
  end

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
    tap(*repos)
    puts `brew update`
    puts `brew upgrade`
    puts `brew pull #{URL_GITHUB}/Homebrew/homebrew/pull/25953`
    ins('brew-cask')
  end

  task :clean do
    puts `brew cleanup`
  end

  task :link do
    puts `brew linkapps`
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
      tmux
      go)
    packages << 'ricty --vim-powerline'
    ins(*packages)

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
    ins(*packages)
  end

  namespace :dev do
    task utils: :setup do
      packages = %w(jq vimpager zsh)
      packages << 'macvim --override-system-vim --with-lua --with-luajit, --with-python2'
      ins(*packages)
    end

    task ruby: :setup do
      packages = %w(ruby-build rbenv heroku-toolbelt)
      int(*packages)
    end

    task android: :setup do
      ins(*%w(android-sdk android-ndk jad dex2jar pidcat))
    end

    task git: :setup do
      ins(*%w(git hub tig))
    end
  end

  namespace :cask do
    def ins_cask(*packages)
      packages.each do |package|
        puts `brew cask install #{package}`
      end
    end

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
        google-chrome
        google-japanese-ime
        hyperswitch
        the-unarchiver
        )
      ins_cask(*packages)
    end

    task utils: :setup do
      packages = %w(
        appcleaner
        disk-inventry-x
        google-drive
        skype
        shortcat
      )
      ins_cask(*packages)
    end

    task media: :setup do
      packages = %w(cooviewer sopcast vlc vox)
      ins_cask(*packages)
    end

    namespace :dev do
      task utils: :setup do
        packages = %w(
          iterm2
          sourcetree
        )
        ins_cask(*packages)
      end

      task android: :setup do
        packages = %w(
          virtual-box
          genymotion
          java6
          java7
        )
        ins_cask(*packages)
      end
   end
  end
end

task :misc do
  puts `defaults write -g ApplePressAndHoldEnabled -bool false`
end
