source "$HOME/.dotfiles/utils/func.sh"

# Install fresh tmux;
if has brew && ! has tmux; then
	brew install tmux;
fi

# Copy .tmux.conf if it not exists.
if [[ ! -f ~/.tmux.conf ]] || [[ "$DOT_FORCE" -eq "1" ]]; then
	cp "$(dirname $0)/tmux.conf" "$HOME/.tmux.conf"
fi
