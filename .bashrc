# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.
#
alias linux='cd'
alias windows="cd /mnt/c/Users/user"
alias unity="cd /mnt/c/Users/user/Documents/unity-projects"
alias python='python3'
alias vi='nvim'
alias vim='nvim'
alias ls='exa -l'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dev="cd .development"
alias github-token="gpg -d ~/.personal/access-token/github-token.txt.gpg"
# alias github-token="gpg -d ~/.personal/access-token/token.txt.gpg"

test -s ~/.alias && . ~/.alias || true

##-----------------------------------------------------
## synth-shell-greeter.sh
if [ -f /home/geloman/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/geloman/.config/synth-shell/synth-shell-greeter.sh
fi

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/geloman/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/geloman/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/geloman/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/geloman/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/geloman/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/geloman/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/geloman/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/geloman/.config/synth-shell/better-history.sh
fi
