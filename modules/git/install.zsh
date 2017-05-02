# Copy .gitconfig if it not exists.
if [ ! -f ~/.gitconfig ] || [ "$DOT_FORCE" -eq "1" ]; then
	cp "$(dirname $0)/dot.gitconfig" "$HOME/.gitconfig"
fi
