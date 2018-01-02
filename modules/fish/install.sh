source "$HOME/.dotfiles/utils/func.sh"

if ! has fish; then
	if has brew; then
		echo "installing fish...";
		brew install fish;	
		if [ $? != 0 ]; then
			exit 1;
		fi
		
		sudo echo $(which fish) >> /etc/shells

		# Set shell default to zsh.
		if [ -z `echo $0 | grep 'zsh'` ]; then
			echo "changing shell to fish..."
			chsh -s `which fish`
		fi
	fi
fi
