pm-kill-line () {
  zle kill-line
  echo -n $CUTBUFFER | xclip -selection clipboard -i
}

pm-yank-line () {
  CUTBUFFER=$(xclip -selection clipboard -o)
  zle yank
}

zle -N pm-kill-line
zle -N pm-yank-line

bindkey -e '^K' pm-kill-line
bindkey -e '^Y' pm-yank-line
