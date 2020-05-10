# dotfiles

My emacs, zsh, tmux, and git configurations. Of no use to anyone.


## Emacs configuration


Emacs >= 26.x is required.  Emacs is configured primarily for Python
development.  Standard Emacs key bindings are used for most things, except where
overridden/noted below.


### Window/session management


| Shortcut      | Action                                            |
| ------------- | ------------------------------------------------- |
| `C-c S-x`     | Exit (I find `C-x C-c` too easy hit accidentally) |
| `C-x 0`       | Close window                                      |
| `C-x 1`       | Maximise window                                   |
| `C-x 2`       | Split vertically                                  |
| `C-x 3`       | Split horizontally                                |
| `C-<left>`    | Move focus left                                   |
| `C-<right>`   | Move focus right                                  |
| `C-<up>`      | Move focus up                                     |
| `C-<down>`    | Move focus down                                   |
| `C-S-<left>`  | Resize window to left                             |
| `C-S-<right>` | Resize window to right                            |
| `C-S-<up>`    | Resize window upwards                             |
| `C-S-<down>`  | Resize window downwards                           |
| `M-S-<left>`  | Move buffer left                                  |
| `M-S-<right>` | Move buffer right                                 |
| `M-S-<up>`    | Move buffer up                                    |
| `M-S-<down>`  | Move buffer down                                  |


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
| **`.emacs.d/lib/custom-origami.el`**  |                                           |
| `C-<tab>`                             | Fold/unfold current region                |
| `C-S-<tab>`                           | Fold all other regions                    |
| `C-c C-<tab>`                         | Fold/unfold all regions                   |


#### Debugging


I am currently using the standard `pdb` debugger.
