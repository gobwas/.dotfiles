source utils/func.sh;

# Detect package manager.
pm=
if has brew; then
	pm="brew"
elif has yum; then
	pm="yum"
else
	echo "no package manager =("
	exit 1
fi

# Install zsh.
if ! has zsh; then
	echo "installing zsh..."
	$pm install zsh
	
	# Check that zsh is present in /bin/zsh, cause it listen in /etc/shells.
	# If not, os will not allow us to change shell.
	p=which zsh
	if [ "$p" != "/bin/zsh" ]; then
		ln -s "/bin/zsh" "$p"
	fi
	# Set shell default to zsh.
	if [ -z `echo $0 | grep 'zsh'` ]; then
		echo "changing shell to zsh..."
		chsh -s `which zsh`
	fi
fi

# Copy dotfiles for zsh.
if [ ! -f ~/.zshrc ]; then
	echo "copying .zshrc..."
	cp .zshrc ~/.zshrc
fi

# Install prezto.
if [ ! -d ~/.zprezto ]; then
	echo "installing prezto..."
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
	setopt EXTENDED_GLOB
	for rcfile in "$HOME/.zprezto/runcoms/^README.md(.N)"; do
		ln -s "$rcfile" "$HOME/.${rcfile:t}"
	done
fi

# Copy dotfiles for prezto.
if [ ! -f ~/.zpreztorc ]; then
	echo "copying .zpreztorc..."
	cp .zpreztorc ~/.zpreztorc
fi

# Install gnu tools like gsort, gawk etc.
if [[ "$pm" == "brew" ]]; then
	echo "installing coreutils..."
	brew install coreutils
fi


# Now run install scripts from modules.
# ------------------------------------

include_modules=go,git,brew,python,vim,tmux

for file in $(/bin/zsh -c "echo ~/.dotfiles/modules/{${include_modules}}/install.zsh"); do
	if [ -r "$file" ] && [ -f "$file" ]; then
		echo "running install script $file"
		source "$file"
	fi
done;
