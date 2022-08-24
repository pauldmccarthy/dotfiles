# custom aliases
alias emacs="emacs26"
export EDITOR="emacsclient27 -a '' -s ~/.emacs.d/server -nq"
alias l="ls"
alias p="pwd"
alias ll="ls -hl"
alias la="ls -ahl"
alias e=$EDITOR
alias g=git

alias md5="md5sum"
alias tmux="tmux attach || tmux new"
alias less="less -RFXN"
alias diff="colordiff"
alias fslconf=". /home/paulmc/fsl/fslconf.sh"
alias fedev=". /home/paulmc/Projects/fsleyes/fsleyes.gtk3.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fedev2=".  /home/paulmc/Projects/fsleyes/fsleyes.gtk2.dev.sh; pushd /home/paulmc/Projects/fsleyes"
alias fundev=". /home/paulmc/Projects/funpack/scripts/funpack_dev.sh; pushd /home/paulmc/Projects/funpack"
alias guidev=". /home/paulmc/Projects/fsl-gui/source.sh; pushd /home/paulmc/Projects/fsl-gui"
alias workon=". /usr/local/bin/workon"
alias o="/usr/local/bin/myopen"
alias push="pushd"
alias pop="popd"
alias esg="env|sort|grep -i"
alias esl="env|sort|less"

# clipcopy/clippaste are zsh functions
alias clipc="clipcopy"
alias clipp="clippaste"
alias sshp="sshpass -f ~/.ssh/fmrib_password ssh"
alias scpp="sshpass -f ~/.ssh/fmrib_password scp"
alias sshr="sshpass -f ~/.ssh/rescomp_password ssh"
alias scpr="sshpass -f ~/.ssh/rescomp_password scp"
