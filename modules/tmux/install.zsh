# Copy .vimrc if it not exists.
if [ ! -f ~/.tmux.conf ]; then
	cp tmux.conf "$HOME/.tmux.conf"
fi
