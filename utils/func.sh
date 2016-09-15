# has checks whether this term has command or not.
has() {
	if [ -z `which $1 | grep 'not found'` ]; then
		return 0
	else
		return 1
	fi
}
