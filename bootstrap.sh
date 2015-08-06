#!/usr/bin/env bash

git pull origin master;

files="./.*"
excludes=(".git" "." "..")

function is_excluded() {
  for exclude in ${excludes[@]}; do
    if [ $exclude = $1 ]; then
      return 1
    fi
  done

  return 0
}

function doIt() {
  for filepath in ${files}
  do
    filename=$(basename $filepath)
    is_excluded $filename
    if [ $? == 0 ]; then
      ln -sf $(pwd)/$filename $HOME/$filename
    fi
  done

  if [ ! -e ~/.gradle ]; then
    mkdir ~/.gradle
  fi
  ln -sf ~/dotfiles/gradle.properties ~/.gradle/gradle.properties

  git submodule update --init --recursive
  if which bundle >/dev/null 1>&2 ; then
    sudo gem install bundler
  fi
  bundle install
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
