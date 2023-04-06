# .bashrc

PS1='\[\e[0m\]\u\[\e[0m\]@\[\e[0m\]\h \[\e[0m\]| \[\e[0m\]\w \[\e[0m\]@\[\e[0m\]branch\[\e[0m\]-\[\e[0m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]>\[\e[0m\]'

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

devdir="/run/media/memgen/1TB/DEV01"

HISTSIZE=2000
HISTFILESIZE=2000

shopt -s histappend

alias rm='rm -v'
alias open='xdg-open'
alias la='ls -la'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias sshpi="sudo ssh -o StrictHostKeyChecking=no mempi@192.168.1.39"
alias waypi="sudo waypipe ssh mempi@192.168.1.39"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"
