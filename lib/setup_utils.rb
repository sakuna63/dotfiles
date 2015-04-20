URL_GITHUB = 'https://github.com'
URL_GITHUB_CONTENT = 'https://raw.githubusercontent.com'

def tilde_to_home_path(path)
  path.gsub('~', ENV['HOME'])
end

def makedir(path_to_dir)
  path_to_dir = tilde_to_home_path(path_to_dir)
  if Dir.exist?(path_to_dir)
    puts "#{path_to_dir} is already exist"
    return
  end
  puts "created #{path_to_dir}" if Dir.mkdir(path_to_dir)
end

def move(src, dest)
  src = tilde_to_home_path(src)
  dest = tilde_to_home_path(dest)
  puts "moved '#{src} → #{dest}'" if FileUtils.mv(src, dest)
end

def xcode_exists?
  Dir.exists?('/Applications/Xcode.app')
end

def brew_exists?
  `brew`
end

def darwin?
  `uname`.chomp == 'Darwin'
end

def linux?
  `uname`.chomp == 'Linux'
end

module Github
  class << self
    def clone(src, dest)
      puts `git clone #{URL_GITHUB}/#{src} #{dest}`
    end

    def content(src, dest)
      puts `curl -O #{URL_GITHUB_CONTENT}/#{src} #{dest}`
    end
  end
end

module Homebrew
  class << self
    def update
      puts `brew update`
    end

    def upgrade
      puts `brew upgrade`
    end

    def pull(path)
      puts `brew pull #{URL_GITHUB}#{path}`
    end

    def install(*packages)
      packages.each do |package|
        puts `brew install #{package}`
      end
    end

    def tap(*repos)
      repos.each do |repo|
        puts `brew tap #{repo}`
      end
    end

    def clean
      puts `brew cleanup`
    end

    def link
      puts `brew linkapps`
    end
  end
  module Cask
    class << self
      def install(*packages)
        packages.each do |package|
          puts `brew cask install #{package}`
        end
      end

      def clean
        puts `brew cask cleanup`
      end
    end
  end
end
