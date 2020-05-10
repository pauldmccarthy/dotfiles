(add-to-list 'load-path (expand-file-name "~/.emacs.d/lib"))
(load "startup")
(setq custom-file "~/.emacs.d/lib/custom-set-variables.el")
(load custom-file)
