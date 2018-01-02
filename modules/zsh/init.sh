# Check that zsh is present in /bin/zsh, cause it listed in /etc/shells.
# If not, os will not allow us to change shell.
p=$(which zsh)
if [[ $p != "/bin/zsh" ]]; then
	echo "creating link at /bin/zsh to $p";
	ln -s "/bin/zsh" "$p"
fi
#
## Set shell default to zsh.
if [[ -z $(echo $0 | grep 'zsh') ]]; then
	chsh -s $(which zsh)
fi
