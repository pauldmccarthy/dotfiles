# Big history, separate per terminal
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt nosharehistory

# don't pester me about rm *
setopt rmstarsilent

# i HATE auto_cd
unsetopt auto_cd

# use bash word style for
# alt+f/b navigation
autoload -U select-word-style
select-word-style bash

export EDITOR="/usr/bin/emacsclient -n -a=''"

# Report runtime for long
# commands
export REPORTTIME=10

# Password manager settings
export DEETSDB=~/Dropbox/.deets
export DEETSUSERNAME=pauldmccarthy@gmail.com
export DEETSPASSWORDLENGTH=20
export DEETSPASSWORDCLASS="lowercase uppercase numbers"

# functions.zsh:note
export NOTE_DIR=~/Documents/notes/

# module pager on work cluster defaults to more
export LMOD_PAGER=less
