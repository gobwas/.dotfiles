source "$HOME/.dotfiles/utils/func.sh"

# Detect package manager.
pm=
if has brew; then
	pm="brew"
elif has yum; then
	pm="yum"
elif has apt-get; then
	pm="apt-get"
else
	echo "no package manager =("
	exit 1
fi

# Install zsh.
if ! has zsh; then
	echo "installing zsh..."
	$pm install zsh
	if [ $? != 0 ]; then
		exit 1;
	fi	
fi

# Copy dotfiles for zsh.
if [ ! -f $HOME/.zshrc ]; then
	echo "copying .zshrc..."
	cp dot.zshrc $HOME/.zshrc
fi

# Install prezto.
if [ ! -d $HOME/.zprezto ]; then
	echo "installing prezto..."
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
	setopt EXTENDED_GLOB
	for rcfile in "$HOME/.zprezto/runcoms/^README.md(.N)"; do
		ln -s "$rcfile" "$HOME/.${rcfile:t}"
	done
fi

# Copy dotfiles for prezto.
if [ ! -f $HOME/.zpreztorc ]; then
	echo "copying .zpreztorc..."
	cp dot.zpreztorc $HOME/.zpreztorc
fi
