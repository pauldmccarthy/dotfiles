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

# assume emacs is running
export EDITOR="emacsclient -a '' -s ~/.emacs.d/server -nq"

# point CVS to the fmrib cvs repository
export CVSROOT=:ext:jalapeno.fmrib.ox.ac.uk:/usr/local/share/sources
export CVS_RSH=ssh
