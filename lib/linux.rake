task :check do
end

desc "install package"
task :package do
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

task :last do
end

