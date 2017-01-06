source $(dirname "$0")/../../utils/func.sh;

ide() {
	wd=$PWD
	if [[ "$1" ]]; then
		wd=$(project $1);
		if [ -z $wd ]; then
			echo "Could not find project $1"
			return 1
		fi
	fi

    id=$RANDOM

	tmux new-session -d -n $(basename $wd) -s "dev-${id}" -c $wd 'vim'
	tmux setw -g mode-mouse on
	tmux split-window -v -p 25 -c $wd
	tmux select-pane -l
	tmux -2 attach-session -d -t "dev-${id}"
}
