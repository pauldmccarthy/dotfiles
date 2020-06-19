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
    (setq flycheck-pylintrc        "~/.pylintrc")
    (setq flycheck-flake8rc        "~/.flake8rc")
    (setq flycheck-python-mypy-ini "~/.mypy.ini")
    (flycheck-select-checker   'python-flake8)
    (flycheck-disable-checker  'python-mypy)
    (flycheck-add-next-checker 'python-flake8 'python-pylint))


  (defun pmc/flycheck-show-and-focus-error-list () (interactive)
         (flycheck-list-errors)
         (select-window (get-buffer-window "*Flycheck errors*")))

  (defun pmc/flycheck-error-list-goto-error-keep-focus () (interactive)
         (flycheck-error-list-goto-error)
         (select-window (get-buffer-window "*Flycheck errors*")))

  (defun pmc/flycheck-error-list-quit () (interactive)
         (delete-window (get-buffer-window "*Flycheck errors*")))

  ; nice keybindings for error nav
  (define-key flycheck-mode-map (kbd "C-c n") #'flycheck-next-error)
  (define-key flycheck-mode-map (kbd "C-c p") #'flycheck-previous-error)
  (define-key flycheck-mode-map (kbd "C-c l")  'pmc/flycheck-show-and-focus-error-list)
  (define-key flycheck-mode-map (kbd "C-c c") #'flycheck-clear)

  ; within error list
  (define-key flycheck-error-list-mode-map (kbd "C-<return>") 'pmc/flycheck-error-list-goto-error-keep-focus)
  (define-key flycheck-error-list-mode-map (kbd "C-g")        'pmc/flycheck-error-list-quit)

  (add-hook 'python-mode-hook  'flycheck-python-hook))
