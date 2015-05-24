#!/usr/bin/env bash

git clone https://github.com/zsh-users/antigen ~/.zsh.d/antigen

prefix=$(brew --prefix)
echo $prefix/bin/zsh | sudo tee -a /etc/shells
chsh -s $prefix/bin/zsh
