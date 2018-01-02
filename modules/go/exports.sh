# unalias gb cause it overlaps gb binary
[[ ! -z "$(type -a gb | grep "alias")" ]] && unalias gb

export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
