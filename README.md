# dotfiles

My emacs, zsh, tmux, i3, and git configurations. Of no use to anyone.


## i3


## `tmux`

Clipboard integration depends on the presence of `xclip`.


| Shortcut      | Action                                            |
| ------------- | ------------------------------------------------- |
| C-q           | prefix                                            |
| C-q r         | reload config                                     |
| C-l           | clear history                                     |
| C-q |         | split horizontally                                |
| C-q -         | split vertically                                  |
| C-M-m         | Copy mode                                         |
| M-Left        | Select left pane                                  |
| M-Right       | Select right pane                                 |
| M-Up          | Select pane above                                 |
| M-Down        | Select pane below                                 |
| M-j           | Select left pane                                  |
| M-l           | Select right pane                                 |
| M-i           | Select pane above                                 |
| M-k           | Select pane below                                 |
| M-C-Left      | Resize pane to left                               |
| M-C-Right     | Resize pane to right                              |
| M-C-Up        | Resize pane to top                                |
| M-C-Down      | Select pane to bottom                             |
| M-C-j         | Resize pane to left                               |
| M-C-l         | Resize pane to right                              |
| M-C-i         | Resize pane to top                                |
| M-C-k         | Resize pane to bottom                             |
| C-M-m         | Copy mode                                         |


## `emacs`


Emacs >= 26.x is required.  Emacs is configured primarily for Python
development.  Standard Emacs key bindings are used for most things, except where
overridden/noted below.


### Miscellaneous


| Shortcut      | Action                                            |
| ------------- | ------------------------------------------------- |
| `C-z`         | Undo (in addition to `C-/`, as they're symmetric  |
|               | on my keyboard)                                   |



### Window/session management


| Shortcut        | Action                                            |
| --------------- | ------------------------------------------------- |
| `C-c S-x`       | Exit (I find `C-x C-c` too easy hit accidentally) |
| `C-x 0`         | Close window                                      |
| `C-x 1`         | Maximise window                                   |
| `C-x 2`         | Split vertically                                  |
| `C-x 3`         | Split horizontally                                |
| `M-<left>`      | Move focus left                                   |
| `M-<right>`     | Move focus right                                  |
| `M-<up>`        | Move focus up                                     |
| `M-<down>`      | Move focus down                                   |
| `M-j`           | Move focus left                                   |
| `M-l`           | Move focus right                                  |
| `M-i`           | Move focus up                                     |
| `M-k`           | Move focus down                                   |
| `M-C-<left>`    | Resize window to left                             |
| `M-C-<right>`   | Resize window to right                            |
| `M-C-<up>`      | Resize window upwards                             |
| `M-C-<down>`    | Resize window downwards                           |
| `M-C-j`         | Resize window to left                             |
| `M-C-l`         | Resize window to right                            |
| `M-C-i`         | Resize window upwards                             |
| `M-C-k`         | Resize window downwards                           |
| `M-C-S-<left>`  | Move buffer left                                  |
| `M-C-S-<right>` | Move buffer right                                 |
| `M-C-S-<up>`    | Move buffer up                                    |
| `M-C-S-<down>`  | Move buffer down                                  |
| `M-C-S-j`       | Move buffer left                                  |
| `M-C-S-l`       | Move buffer right                                 |
| `M-C-S-i`       | Move buffer up                                    |
| `M-C-S-k`       | Move buffer down                                  |



### Magit


| Shortcut   | Action     |
| ---------- | ---------- |
| `C-x g`    | Open magit |


### Python development


#### Environments

The Python development configuration currently assumes that:

* You use virtual environments (currently no support for conda)
* You store all of your virtual environments in one directory
* The following packages are installed in all of your virtual
  environments (and maybe some others that I've forgotten):
  - `flake8`
  - `pylint`
  - `python-language-server[all]`

To have the correct environment automatically activated when you
open a given `.py` file:

1. Edit `.emacs.d/lib/custom-python.el`, and change the value of
   `venv-location` to the location in which your virtual environments are
   stored.
2. Create a file called `.dir-locals.el` in the root directory of each
   of your of project(s), containing the following:

   `((python-mode . ((project-venv-name . "<name-of-venv-dir>"))))`


#### Linting

`.emacs.d/lib/custom-flycheck.el` assumes that user configuration
files are stored at:
 - `~/.flake8rc`
 - `~/.pylintrc`


#### Key bindings

| Shortcut                              | Action                                    |
| ------------------------------------- | ----------------------------------------- |
| **`.emacs.d/lib/custom-python.el`**   |                                           |
| `C-c C-n`                             | Go to next function                       |
| `C-c C-p`                             | Go to previous function                   |
| **`.emacs.d/lib/custom-lsp.el`**      |                                           |
| `C-c C-h`                             | Show help                                 |
| `M-.`                                 | Go to definition                          |
| `M-,`                                 | Return from definition                    |
| `M-/`                                 | Find references                           |
| `M-r`                                 | Rename symbol                             |
| **`.emacs.d/lib/custom-helm.el`**     |                                           |
| `C-c C-o`                             | `occur` - fuzzy search in current buffer  |
| `C-c C-j`                             | `imenu` - symbol search in current buffer |
| **`.emacs.d/lib/custom-company.el`**  |                                           |
| `M-<tab>`                             | Complete at point                         |
| **`.emacs.d/lib/custom-flycheck.el`** |                                           |
| `C-c n`                               | Go to next warning/error                  |
| `C-c p`                               | Go to previous warning/error              |
| `C-c l`                               | Show error list                           |
| `C-c c`                               | Clear errors                              |
| **`.emacs.d/lib/custom-origami.el`**  | **disabled because i find it annoying**   |
| `C-<tab>`                             | Fold/unfold current region                |
| `C-S-<tab>`                           | Fold all other regions                    |
| `C-c C-<tab>`                         | Fold/unfold all regions                   |


#### Debugging


| Shortcut      | Action              |
| ------------- | ------------------- |
| `C-c C-d`     | Start `realgud:pdb` |
