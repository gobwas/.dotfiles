source "$HOME/.dotfiles/utils/func.sh"

if ! has mutt && has brew; then
	brew install mutt;
fi
if [ ! -d "$HOME/.mutt" ]; then
	cp -r "$HOME/.dotfiles/modules/mutt/dot.mutt" "$HOME/.mutt"
fi
