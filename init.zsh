include_modules=go,git,brew,python

for file in $(/bin/zsh -c "echo ~/.dotfiles/modules/{${include_modules}}/{init,exports,aliases,functions,extra}.zsh"); do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
