#!/usr/bin/env bash

git pull origin master;

files="./.*"
excludes=(".bundle" ".config" ".gradle" ".gitignore" ".gitmodules" ".git" "." "..")

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
      ln -sf $(pwd)/$filename $HOME
    fi
  done

  git submodule update --init --recursive
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
