# has checks whether this term has command or not.
has() {
	if which $1 1>/dev/null 2>&1; then
	#if [ -z `which $1 | grep 'not found'` ]; then
		return 0
	else
		return 1
	fi
}

project() {
	for dir in "$HOME/Development"; do
		if [ -d "$dir/$1" ]; then
			echo "$dir/$1";
			return;
		fi
	done
}
