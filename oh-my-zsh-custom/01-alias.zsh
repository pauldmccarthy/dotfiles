# custom aliases
alias l="ls"
alias p="pwd"
alias ll="ls -hl"
alias la="ls -ahl"
alias e=${EDITOR}
alias enw="emacs --no-window-system --no-desktop"
alias g=git
alias o=open
alias dud="du -h -d 1 ."

alias ff="find . -name"
alias fc="find . -type f | xargs grep -i"

alias md5="md5sum"
alias tmux="tmux attach || tmux new"
alias less="less -RFXN"
alias diff="colordiff"
alias dev=". ~/bin/dev"
alias workon=". ~/bin/workon"
alias ifconfig="ip address show"

#alias o="/usr/local/bin/myopen"
alias push="pushd > /dev/null"
alias pop="popd   > /dev/null"
alias esg="env|sort|grep -i"
alias esl="env|sort|less"

# clipcopy/clippaste are zsh functions
alias clipc="clipcopy"
alias clipp="clippaste"
alias sshp="sshpass -f ~/.ssh/fmrib_password ssh"
alias scpp="sshpass -f ~/.ssh/fmrib_password scp"
alias sshr="sshpass -f ~/.ssh/rescomp_password ssh"
alias scpr="sshpass -f ~/.ssh/rescomp_password scp"

# docker

alias dim="docker images"
alias drmi="docker rmi"
alias dki="docker kill"
alias dps="docker ps"
alias drun="docker run"
alias dex="docker exec -it"
