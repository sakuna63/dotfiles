require "#{__dir__}/lib/setup_utils"
load "#{__dir__}/lib/darwin.rake" if darwin?
load "#{__dir__}/lib/linux.rake" if linux?

task default: 'setup'

desc "default task. this task executes all tasks"
task setup: [:check, :homesick, :package, :vim, :tmux, :zsh, :last] do end

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
  prefix = brew_exists? ? `brew --prefix` : '/usr/local'
  puts `echo #{prefix}/bin/zsh | sudo tee -a /etc/shells`
  puts `chsh -s #{prefix}/bin/zsh`
  puts `source ~/.zshrc`
end
