#!/bin/sh

set -e

thisdir=$(cd $(dirname $0) && pwd)

ln -s $thisdir/.emacs.d   ~/.emacs.d
ln -s $thisdir/.zshrc     ~/.zshrc
ln -s $thisdir/.gitconfig ~/.gitconfig
ln -s $thisdir/.tmux.conf ~/.tmux.conf
ln -s $thisdir/i3         ~/.i3
ln -s $thisdir/.lesskey   ~/.lesskey
for f in $thisdir/oh-my-zsh-custom/*.zsh; do
  fname=$(basename $f)
  ln -s $f ~/.oh-my-zsh/custom/$fname
done

mkdir -p ~/bin/
for f in $thisdir/bin/*; do
  fname=$(basename $f)
  ln -s $f ~/bin/$fname
done


mkdir -p ~/.config/gdb
ln -s $thisdir/gdbinit ~/.config/gdb/
