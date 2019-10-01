#!/bin/sh

set -e

thisdir=$(cd $(dirname $0) && pwd)

ln -s ~/.emacs.d   $thisdir/.emacs.d
ln -s ~/.emacs     $thisdir/.emacs
ln -s ~/.zshrc     $thisdir/.zshrc
ln -s ~/.gitconfig $thisdir/.gitconfig
ln -s ~/.tmux.conf $thisdir/.tmux.conf

for f in $thisdir/oh-my-zsh-custom/*.zsh; do
  fname=$(basename $f)
  ln -s ~/.oh-my-zsh/custom/$fname $f
done
