task default: 'setup'

URL_GITHUB = 'https://github.com'
URL_GITHUB_CONTENT = 'https://raw.githubusercontent.com'

  path_to_dir = path_to_dir.gsub('~', ENV[HOME])
  puts "created #{path_to_dir}" if Dir.mkdir(path_to_dir) 
def makedir(path_to_dir)
end

def move(src, dest)
  src = src.gsub('~', ENV[HOME])
  dest = dest.gsub('~', ENV[HOME])
  puts "moved '#{src} → #{dest}'" if FileUtils.mv(src, dest)
end

def github_clone(src, dest)
  puts `git clone #{URL_GITHUB}/#{src} #{dest}`
end

def github_content_curl(src, dest)
  puts `curl -O #{URL_GITHUB_CONTENT}/#{src} #{dest}`
end

task setup: [:homesick, :package, :vim, :zsh, :tmux] do
  puts `source ~/.zshrc`
end

task :homesick do
  path_to_homesick = "~/homesick"
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
end

task :package do
  case `uname`
  when 'Darwin'
    flags = {}.tap do |hash|
      keys = (ENV['flags'] || '').split(',').map(&:to_sym)
      keys.each { |sym| hash[sym] = true}
    end
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
  def install(*packages)
    packages.each do |package|
      puts "brew install #{package}"
    end
  end

  def tap(*repos)
    repos.each do |repo|
      puts "brew tap #{repo}"
    end
  end

  task :install, [:flags] => :setup do |t, args|
    tasks = %w(utils_essential dev:utils cask:utils_essential cask:dev:utils dev:git)
    tasks = tasks + %w(dev:android cask:dev:android) if args.flags[:android]
    tasks = tasks + %w(dev:ruby) if args.flags[:ruby]
    tasks = tasks + %w(utils cask:utils cask:media) if args.flags[:full]

    tasks.each do |task|
      Rake::Task["homebrew:#{task}"].invoke
    end
    Rake::Task['homebrew:clean'].invoke
  end

  task :setup do
    puts `ruby -e "$(curl -fsSL #{URL_GITHUB_CONTENT}/Homebrew/install/master/install)"`
    repos = %w(
      caskroom/cask
      caskroom/versions
      homebrew/science
      homebrew/binary
      homebrew/versions
      peco/peco
      sanemat/font
      )
    tap(*repos)
    puts `brew update`
    puts `brew upgrade`
    puts `brew pull #{URL_GITHUB}/Homebrew/homebrew/pull/25953`
    install('brew-cask')
  end

  task :clean do
    puts `brew cleanup`
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


    tap('peco/peco', 'sanemat/font')
    install(packages)
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
    install(packages)
  end

  namespace :dev do
    task utils: :setup do
      packages = %w(jq vimpager zsh)
      packages << 'macvim --override-system-vim --with-lua --with-luajit, --with-python2'
      install(packages)
    end

    task ruby: :setup do
      packages = %w(ruby-build rbenv heroku-toolbelt)
    end

    task android: :setup do
      install(*%w(android-sdk android-ndk jad dex2jar pidcat))
    end

    task git: :setup do
      install(*%w(git hub tig))
    end
  end

  namespace :cask do
    def install(*packages)
      packages.each do |package|
        puts "brew cask install #{package}"
      end
    end

    task utils_essential: :setup do
      packages = %w(
        alfred
        caffeine
        karabiner
        spectacle
        flex
        day-o
        evernote
        google-chrome
        google-japanese-ime
        the-unarchiver
        )
      install(*packages)
    end

    task utils: :setup do
      packages = %w(
        appcleaner
        disk-inventry-x
        dropbox
        google-drive
        speedtao
        skype
        shortcat
      )
      install(*packages)
    end

    task media: :setup do
      packages = %w(cooviewer sopcast vlc vox)
      install(*packages)
    end

    namespace :dev do
      task utils: :setup do
        pakcages = %w(
          iterm2
          sourcetree
        )
        install(*packages)
      end

      task android: :setup do
        pakcages = %w(
          virtual-box
          genymotion
          java6
          java7
        )
        install(*packages)
      end
   end
  end
end
