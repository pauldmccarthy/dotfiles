# custom aliases
alias l="ls"
alias ll="ls -hl"
alias la="ls -ahl"
alias e=$EDITOR

alias tmux="tmux attach || tmux new"
alias less="less -RFX"
alias diff="colordiff"
alias pp='export PATH=$(pwd):$PATH; echo $PATH'
alias pyp='export PYTHONPATH=$(pwd):$PYTHONPATH; echo $PYTHONPATH'
alias pyclean='find . -name "__pycache__" -exec rm -r "{}" \; ; find . -name "*.pyc" -delete; find . -name "*.pye" -delete'
alias fslconf=". /home/paulmc/fsl/fslconf.sh"
alias fedev3=". /home/paulmc/Projects/fsleyes/fsleyes.gtk3.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fedev=".  /home/paulmc/Projects/fsleyes/fsleyes.gtk2.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fundev=". /home/paulmc/Projects/funpack/funpack_dev.sh; pushd /home/paulmc/Projects/funpack"
alias workon=". /usr/local/bin/workon"
alias o="/usr/local/bin/myopen"

# clipcopy/clippaste are zsh functions
alias clipc="clipcopy"
alias clipp="clippaste"
