# 
dev() {
	if [[ ! -d $DEVPATH ]]; then
		echo "DEVPATH is not set"
		return 1
	fi
	
	if [[ "$1" != "" ]]; then
		p=$DEVPATH/$1
		if [[ -d $p ]]; then
			cd $p
		else
			echo "$p is not a directory"
			return 1
		fi
	else
		cd $DEVPATH
	fi
}
