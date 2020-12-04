# custom aliases
alias emacs="emacs26"
export EDITOR="emacsclient27 -a '' -s ~/.emacs.d/server -nq"
alias l="ls"
alias ll="ls -hl"
alias la="ls -ahl"
alias e=$EDITOR
alias g=git

alias md5="md5sum"
alias tmux="tmux attach || tmux new"
alias less="less -RFX"
alias diff="colordiff"
alias fslconf=". /home/paulmc/fsl/fslconf.sh"
alias fedev=". /home/paulmc/Projects/fsleyes/fsleyes.gtk3.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fedev3=". /home/paulmc/Projects/fsleyes/fsleyes.gtk3.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fedev2=".  /home/paulmc/Projects/fsleyes/fsleyes.gtk2.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fundev=". /home/paulmc/Projects/funpack/funpack_dev.sh; pushd /home/paulmc/Projects/funpack"
alias workon=". /usr/local/bin/workon"
alias o="/usr/local/bin/myopen"
alias push="pushd"
alias pop="popd"

# clipcopy/clippaste are zsh functions
alias clipc="clipcopy"
alias clipp="clippaste"
