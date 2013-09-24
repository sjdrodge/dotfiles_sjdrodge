#!/bin/bash

#TODO: create a symlink/cp flag (both options would be nice)
#TODO: Fix cp symlink/directory bugs

#TODO: find the dir correctly
dir=~/src/dotfiles_tehminkeh
bkup_dir=~/.dotfiles_bkup
excludes="install.sh"

#TODO: test if $bkup_dir exists and print what we're doing if it doesn't
mkdir -p $bkup_dir

cd $dir
for file in * ;do
  isexcluded=0
  for exclude in $excludes ;do
    if [ "$file" == "$exclude" ] ;then
      isexcluded=1
    fi
  done
  if [ $isexcluded == 1 ] ;then
    echo Ignoring "$file"
  else
    if [ -e ~/.$file ] ;then
      echo Backing up "~/.$file" as "$bkup_dir/$file"
      cp -r ~/.$file $bkup_dir/$file
      rm -r ~/.$file
    fi
    echo Installing "$file" as "~/.$file"
    ln -T -s $dir/$file ~/.$file
  fi
done
