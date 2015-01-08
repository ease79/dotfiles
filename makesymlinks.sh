#!/usr/bin/env bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir
files="zshrc zsh vimrc vim tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
if [ ! -d $olddir ]
	then
		printf "Creating $olddir for backup of any existing dotfiles in ~ ...\t"
		mkdir -p $olddir
		printf "done.\n"
	fi

# change to the dotfiles directory
if [ "$PWD"!="$dir" ]
	then
	printf "We are in $PWD right now, changing to the $dir directory ...\t"
	cd $dir
	printf "done\n"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

printf "Moving any existing dotfiles from ~ to $olddir\n\n"
for file in $files; do
    if [ -a ~/.$file ]
	then
        printf "Moving ~/.$file to $olddir/... \t"
    	mv ~/.$file $olddir/ && printf "done.\n"
    fi
    printf "Creating symlink to $file in home directory ...\t"
    ln -s $dir/$file ~/.$file && printf "done.\n"
done
