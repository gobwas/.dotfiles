source "$HOME/.dotfiles/utils/func.sh"

if has brew ; then
	# Install shell language translator.
	brew install translate-shell;
	# Install rg tool.
	brew install ripgrep;
fi

