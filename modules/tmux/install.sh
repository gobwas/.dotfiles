source "$HOME/.dotfiles/utils/func.sh"

# Install fresh tmux;
if has brew && ! has tmux; then
	brew install tmux;
fi

# Copy .tmux.conf if it not exists.
if [[ ! -f $HOME/.tmux.conf ]] || [[ "$DOT_FORCE" -eq "1" ]]; then
	cp "$HOME/.dotfiles/modules/tmux/dot.tmux.conf" "$HOME/.tmux.conf"
fi
