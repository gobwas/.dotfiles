# unalias gb cause it overlaps gb binary
if $(which gb &>/dev/null); then
    [[ ! -z "$(type -a gb | grep "alias")" ]] && unalias gb
fi

export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
