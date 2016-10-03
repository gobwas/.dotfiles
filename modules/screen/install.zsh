# Copy .vimrc if it not exists.
if [ ! -f ~/.screenrc ]; then
	cp "$(dirname $0)/screen.rc" "$HOME/.screenrc"
fi
