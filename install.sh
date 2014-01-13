#!/bin/bash

#TODO: relative symlinks
#TODO: create a symlink/cp flag (both options would be nice)
#TODO: Fix cp symlink/directory bugs
#TODO: Actually recurse on dirs.

pushd `dirname $0` > /dev/null
sourcedir=`pwd -P`
popd > /dev/null

bkup_dir=~/.dotfiles_bkup
files="Xresources gitconfig inputrc oh-my-fish tmux.conf vim vimrc zlogin zshrc.local"

#TODO: test if $BKUP_DIR exists and print what we're doing if it doesn't
mkdir -p $bkup_dir

for file in $files ;do
  if [ -e ~/.$file ] || [ -h ~/.$file ] ;then
    echo Backing up "~/.$file" to "$bkup_dir/$file"
    cp -r ~/.$file $bkup_dir/$file
    rm -r ~/.$file
  fi
  echo Installing "~/.$file"
  ln -s -T $sourcedir/$file ~/.$file
done
