# Copy .vimrc if it not exists.
if [ ! -f ~/.screenrc ]; then
	cp screen.rc "$HOME/.screenrc"
fi
