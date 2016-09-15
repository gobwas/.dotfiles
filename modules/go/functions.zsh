devgo() {
	if [[ "$1" != "" ]]; then
		p=$GOPATH/src/$GOREPO/$1
		if [[ -d $p ]]; then
			cd $p
			return 0
		fi

		echo "$p is not a directory"
		return 1
	fi

	project=''
	vared -p "which project of $GOREPO should I switch to? " project
	devgo $project
}
