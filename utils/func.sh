init_modules() {
	source_files $1 "init,exports,aliases,functions,extra"
}

install_modules() {
	source_files $1 "install"
}

source_files() {
	local module file filepath
	
	for module in $(echo $1 | tr "," " "); do
		for file in $(echo $2 | tr "," " "); do
			filepath="$HOME/.dotfiles/modules/$module/$file.sh"
			if [ -f "$filepath" ]; then
				echo "sourcing $filepath";
				source $filepath;
			fi
		done;
	done
}

# has checks whether this term has command or not.
has() {
	if which $1 1>/dev/null 2>&1; then
	#if [ -z `which $1 | grep 'not found'` ]; then
		return 0
	else
		return 1
	fi
}

directories() {
	dirs="$HOME/Development"
	if [ -d $GOPATH ]; then
		dirs=$(echo "$dirs\n$(ls -d $GOPATH/src/*)")
	fi
	echo $dirs
}

project() {
	opts=""
	count=0
	for dir in $(directories); do
		for sub in $(find $dir -maxdepth 3 -name "*$1*" -type d); do
			((count++))
			if [ -z $opts ]; then
				opts=$sub
			else
				opts=$(echo "$opts $sub")
			fi
		done
	done
	if [ $count -le 1 ]; then
		echo "$opts"
		return
	fi	
	arr=(`echo ${opts}`);
	select resp in $arr; do
		case $resp in
			* ) echo "$resp"; return;;
			q ) return;;
		esac
	done
}
