
; All virtualenvs are stored here
(setq venv-location (expand-file-name "~/.virtualenvs/"))
(setq python-environment-directory venv-location)

; Auto-activate virtualenv on a buffer
; if project-venv-name is set
; maybe manually add ./bin/ to PATH?
(defun pyvenv-auto-activate  ()
  (hack-local-variables)
  (when (boundp 'project-venv-name)
    (venv-workon project-venv-name)))

; Set up flycheck syntax checker
(defun my-flycheck-mode-hook ()
    (flycheck-color-mode-line-mode)

    ;emacs can't find flake8 if it is in a virtualenv/bin ...
    ;(flycheck-select-checker "python-flake8")
    (setq flycheck-check-syntax-automatically '(mode-enabled save))
    (setq flycheck-pylintrc "~/.pylintrc")
    (setq flycheck-flake8rc "~/.flake8rc"))

(defun my-python-mode-hook ()

  (pyvenv-auto-activate)

  ; jedi for auto-completion
  (setq jedi:setup-keys                 t) 
  (setq jedi:complete-on-dot            nil) 
  (setq jedi:tooltip-method             '(popup)) 
  (setq jedi:get-in-function-call-delay 200) 
  (jedi:setup)

  (flycheck-mode)
  
  ; syntax settings
  (subword-mode             1)
  (setq indent-tabs-mode    nil)

  (setq py-indent-offset    4)
  (setq python-guess-indent 4)
  (setq python-indent       4)
  (setq tab-width           4)

  (highlight-symbol-mode            1)
  (setq highlight-symbol-idle-delay 0.25)
  
  (define-key python-mode-map [(control c) (n)] 'flycheck-next-error)
  (define-key python-mode-map [(control c) (p)] 'flycheck-previous-error)
  (define-key python-mode-map [(control c) (c)] 'comment-or-uncomment-region)
  (define-key python-mode-map [(return)]        'newline-and-indent))

(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)
(add-hook 'python-mode-hook   'my-python-mode-hook)
