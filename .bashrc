# if not running interactively, don't do anything
[[ $- != *i* ]] && return

black="\[\033[0;30\]"
darkgray="\[\033[1;30\]"
blue="\[\033[0;34\]"
lightblue="\[\033[1;34\]"
green="\[\033[0;32\]"
lightgreen="\[\033[1;32\]"
cyan="\[\033[0;36\]"
lightcyan="\[\033[1;36\]"
red="\[\033[0;31\]"
lightred="\[\033[1;31\]"
purple="\[\033[0;35\]"
lightpurple="\[\033[1;35\]"
brown="\[\033[0;33\]"
yellow="\[\033[1;33\]"
lightgray="\[\033[0;37\]"
white="\[\033[1;37\]"

set -o vi                   # vi mode
shopt -s autocd             # cd by naming directory
shopt -s cdable_vars        # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell            # autocorrects cd misspellings
shopt -s checkwinsize       # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist            # save multi-line commands in history as single line
shopt -s dotglob            # include dotfiles in pathname expansion
shopt -s expand_aliases     # expand aliases
shopt -s extglob            # enable extended pattern-matching features
shopt -s histappend         # append to (not overwrite) the history file
shopt -s hostcomplete       # attempt hostname expansion when @ is at the beginning of a word
shopt -s nocaseglob         # pathname expansion will be treated as case-insensitive

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
unset HISTFILESIZE
PROMPT_COMMAND='history -a'

export EDITOR="vim"
export FCEDIT="vim"

BROWSER=/usr/bin/firefox

PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin
PATH=$PATH:$HOME/scripts

eval $(dircolors -b ~/.dircolors)
export GREP_COLOR="1;33"

[ -n "$TMUX" ] && export TERM=screen-256color

export PERL_SIGNALS=unsafe # sh

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# colourize terminal output with cope
#PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:$PATH

gitpromptfile="$HOME/scripts/gitprompt"
[ -f $gitpromptfile ] && source $gitpromptfile || echo "$gitpromptfile not found!"

gitcompletionfile="$HOME/scripts/gitcompletion"
[ -f $gitcompletionfile ] && source $gitcompletionfile || echo "$gitcompletionfile not found!"

cnffile="/usr/share/doc/pkgfile/command-not-found.bash"
[ -f $cnffile ] && source $cnffile || echo "$cnffile not found!"

aliasesfile="$HOME/.aliases"
[ -f $aliasesfile ] && source $aliasesfile || echo "$aliasesfile not found!"

funcsfile="$HOME/.functions"
[ -f $funcsfile ] && source $funcsfile || echo "$funcsfile not found!"

termcolorsfile="$HOME/.termcolors"
[ -f $termcolorsfile ] && source $termcolorsfile || echo "$termcolorsfile not found!"


