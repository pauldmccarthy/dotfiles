#!/bin/sh

set -e

thisdir=$(cd $(dirname $0) && pwd)

ln -s $thisdir/.emacs.d   ~/.emacs.d
ln -s $thisdir/.zshrc     ~/.zshrc
ln -s $thisdir/.gitconfig ~/.gitconfig
ln -s $thisdir/.tmux.conf ~/.tmux.conf
ln -s $thisdir/.lesskey   ~/.lesskey
for f in $thisdir/oh-my-zsh-custom/*.zsh; do
  fname=$(basename $f)
  ln -s $f ~/.oh-my-zsh/custom/$fname
done

mkdir -p ~/.config/regolith3/
ln -s $thisdir/i3       ~/.config/regolith3/i3
ln -s $thisdir/i3xrocks ~/.config/regolith3/i3xrocks

mkdir -p ~/bin/
for f in $thisdir/bin/*; do
  fname=$(basename $f)
  ln -s $f ~/bin/$fname
done

mkdir -p ~/.ssh
ln -s $thisdir/.ssh/config ~/.ssh/

mkdir -p ~/.config/gdb
ln -s $thisdir/gdbinit ~/.config/gdb/

mkdir -p ~/.config/ruff/
ln -s $thisdir/ruff.toml ~/.config/ruff/ruff.toml

mkdir -p ~/.ipython/profile_default/
ln -s $thisdir/ipython/ipython_config.py ~/.ipython/profile_default/
