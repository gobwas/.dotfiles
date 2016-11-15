ide() {
	tmux new-session -d -n $(basename $PWD) -s 'dev' 'vim'
	tmux setw -g mode-mouse on
	tmux split-window -v -p 25
	tmux -2 attach-session -d -t 'dev' 
}
