#!/bin/bash

source "$HOME/.dotfiles/variables.sh"
source "$HOME/.dotfiles/utils/func.sh"

# Install fresh tmux;
if has brew && [[ ! -d /usr/local/Cellar/coreutils ]]; then
	echo "installing coreutils..."
	# Install gnu tools like gsort, gawk etc.
	brew install coreutils
fi

# Now run install scripts from modules.
# ------------------------------------

install_modules $(modules)
init_modules $(modules)
