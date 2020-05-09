# make newly installed/created
# executables available to autocomplete
zstyle ':completion:*' rehash true

# autocomplete functions for more
# complicated git aliases (see .gitconfig)
_git_bd() {
  _git_branch
}
