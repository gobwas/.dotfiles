#!/bin/bash

source "$HOME/.dotfiles/variables.sh"
source "$HOME/.dotfiles/utils/func.sh"

# Install fresh tmux;
if has brew; then
	# Install gnu tools like gsort, gawk, find etc.
	brew install bash coreutils findutils gnu-getopt
	brew link gnu-getopt --force
fi

# Now run install scripts from modules.
# ------------------------------------

install_modules $(modules)
init_modules $(modules)
