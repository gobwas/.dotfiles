modules={git,go}
echo "MODULES $modules"
for file in ~/.dotfiles/modules/${modules}/{init,exports,aliases,functions,extra}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
