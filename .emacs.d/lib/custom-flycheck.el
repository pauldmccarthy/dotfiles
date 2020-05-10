(use-package flycheck
  :config

  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.33)))

  (defun flycheck-python-hook ()
    ; It is assumed that user config
    ; files are present at ~/.pylintrc
    ; and  ~/.flake8rc
    (setq flycheck-pylintrc "~/.pylintrc")
    (setq flycheck-flake8rc "~/.flake8rc")
    (flycheck-select-checker   'python-pylint)
    (flycheck-add-next-checker 'python-pylint 'python-flake8))

  ; nice keybindings for error nav
  (define-key flycheck-mode-map (kbd "C-c C-n") #'flycheck-next-error)
  (define-key flycheck-mode-map (kbd "C-c C-p") #'flycheck-previous-error)
  (define-key flycheck-mode-map (kbd "C-c C-l") #'flycheck-list-errors)

  (add-hook 'python-mode-hook  'flycheck-python-hook))
