#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

fpath=(/usr/local/share/zsh-completions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

source $HOME/.dotfiles/init.sh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Change the default ls BSD colors.
# 
# This is from man ls:
# The color designators are as follows:
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
# 
# The order of the attributes are as follows:
# 
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit
# 
# The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default
# background for regular directories, black foreground and red background for
# setuid executables, etc.
export LSCOLORS="Hxfxcxdxbxegedabagacad"
