#!/usr/bin/env bash

# https://github.com/rupa/z
git clone https://github.com/rupa/z.git ~/code/z
chmod +x ~/code/z/z.sh

# https://github.com/benitolopez/p
git clone https://github.com/benitolopez/p.git ~/code/p
chmod +x ~/code/p/p.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
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
