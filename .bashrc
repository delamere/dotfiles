#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TTY=$(tty)
export GPG_TTY=$TTY

# Shell options
shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
	 nocasematch histappend

set -o interactive-comments -o monitor -o hashall -o braceexpand -o emacs

# enable bash completion.
if [ -a /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
fi

ulimit -S -c 0          # disable core dumps
stty -ctlecho           # turn off control character echoing

# Add custom enviroment
. $HOME/.bash/.path
. $HOME/.bash/.export
. $HOME/.bash/.func
. $HOME/.bash/.alias
. $HOME/.bash/.colors

if [ "$TERM" != "linux" ]; then
    source ~/.pureline/pureline ~/.pureline.conf
fi

alsi -l

# syntax: ssHash
