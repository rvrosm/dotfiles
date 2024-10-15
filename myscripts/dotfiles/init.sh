#!/usr/bin/env bash
#
if ! command -v git; then
	echo "no command git.";
	exit 2;
fi

if ! command -v rsync; then
	echo "no command rsync.";
	exit 2;
fi

# First step
git clone --bare https://github.com/rvrosm/dotfiles.git ~/.dotfiles

if [ $? != 0 ]; then
	echo "git error.";
	exit 1;
fi

dotfiles () {
        $(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p ~/.dotfiles-backup

dotfiles checkout

if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | awk '/^\s+/ { print $1}' | xargs -I{} rsync -avR --remove-source-files {} ~/.dotfiles-backup/
fi;

dotfiles checkout

dotfiles config status.showUntrackedFiles no

