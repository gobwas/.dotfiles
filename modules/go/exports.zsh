# unalias gb cause it overlaps gb binary
[[ "$(type -a gb | grep "alias")" != "" ]] && unalias gb

export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
