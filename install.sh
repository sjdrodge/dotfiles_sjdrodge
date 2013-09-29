#!/bin/bash

#TODO: relative symlinks
#TODO: create a symlink/cp flag (both options would be nice)
#TODO: Fix cp symlink/directory bugs
#TODO: Actually recurse on dirs.

pushd `dirname $0` > /dev/null
sourcedir=`pwd -P`
popd > /dev/null

bkup_dir=~/.dotfiles_bkup
files="Xresources gitconfig inputrc tmux.conf vimrc zlogin zshrc.local"
dirs="vim"

#TODO: test if $BKUP_DIR exists and print what we're doing if it doesn't
mkdir -p $bkup_dir

for file in $files ;do
  if [ -e ~/.$file ] ;then
    echo Backing up "~/.$file" to "$bkup_dir/$file"
    cp -r ~/.$file $bkup_dir/$file
    rm -r ~/.$file $bkup_dir/$file
  fi
  echo Installing "~/.$file"
  ln -T -s $sourcedir/$file ~/.$file
done

for dir in $dirs ;do
  if [ -e ~/.$dir ] ;then
    echo Backing up contents of "~/.$dir" to "$bkup_dir/$dir"
    cp -r ~/.$dir $bkup_dir/$dir
  fi
  mkdir -p $dir
  for file in $sourcedir/$dir/* ;do
    if [ -e ~/.$dir/$file ] ;then
      rm -r ~/.$dir/$file
    fi
    echo Installing "~/.$dir/$file"
    ln -T -s $sourcedir/$dir/$file ~/.$dir/$file
  done
done
