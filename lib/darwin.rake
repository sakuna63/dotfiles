desc "check device environment satisfy requirement for executing setup tasks"
task :check do
  puts 'you must install xcode via AppStore' unless xcode_exists?
  puts 'you must install brew via  `ruby -e "$(curl -fsSL #{URL_GITHUB_CONTENT}/Homebrew/install/master/install)"`' unless brew_exists?

  unless xcode_exists? && brew_exists?
    raise "don't satisfy the condition for installing packages"
  end
end

task :last do
  puts `defaults write -g ApplePressAndHoldEnabled -bool false`

  puts `go get github.com/typester/gh-open`
  puts `go get github.com/motemen/ghq`

  # ref http://labocho.github.io/rubydoc-ja-docsets/
  puts `open dash-feed://https%3A%2F%2Fraw.github.com%2Flabocho%2Frubydoc-ja-docsets%2Fmaster%2Ftarball%2FRuby-2.2.0-ja.xml`

  puts `ln -f ~/Dropbox/Configures/Karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml`
  puts `ln -f ~/Dropbox/Configures/AndroidStudio/studio.vmoptions ~/Library/Preferences/AndroidStudio/studio.vmoptions`
end

desc "install package flags=android,ruby,full"
task package: [:check] do
  flags = (ENV['flags'] || '').split(',').map(&:to_sym)
  Rake::Task['homebrew:install'].invoke(flags)
end

