pm-kill-line () {
  zle kill-line
  if [[ $(uname -s) = Linux ]]; then
    echo -n $CUTBUFFER | xclip -selection clipboard -i
  elif [[ $(uname -s) = Darwin ]]; then
    echo -n $CUTBUFFER | pbcopy
  fi

}

pm-yank-line () {
  if [[ $(uname -s) = Linux ]]; then
    CUTBUFFER=$(xclip -selection clipboard -o)
  elif [[ $(uname -s) = Darwin ]]; then
    CUTBUFFER=$(pbpaste)
  fi
  zle yank
}

zle -N pm-kill-line
zle -N pm-yank-line

bindkey -e '^K' pm-kill-line
bindkey -e '^Y' pm-yank-line
