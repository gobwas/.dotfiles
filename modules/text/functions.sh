function rmtabs() {
	find . -name $1 ! -type d -exec echo "{}" \;;
	vared -p 'These files will be changed. Continue? (y/n): ' -c tmp;
	if [[ $tmp =~ ^[Yy]$ ]]; then
		find . -name $1 ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
	fi;
}

