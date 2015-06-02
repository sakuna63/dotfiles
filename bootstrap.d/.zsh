#!/usr/bin/env bash

if [ -e brew ]; then
  prefix=$(brew --prefix)
fi

echo $prefix/bin/zsh | sudo tee -a /etc/shells
chsh -s $prefix/bin/zsh
