
; All virtualenvs are stored here
(setq venv-location (expand-file-name "/home/paulmc/venvs/"))
(setq python-environment-directory venv-location)

; Allow me to set the virtualenv in .dir-locals.el
; without an unsafe variable warning
(put 'project-venv-name 'safe-local-variable
     (lambda (x) t))

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

  (setq jedi:tooltip-method nil)

  ; disable all auto-completion unless explicitly invoked with M-tab
  (setq ac-auto-show-menu nil)
  (setq ac-auto-start nil)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

  ; jedi for auto-completion
  (setq jedi:setup-keys                 t)
  (setq jedi:complete-on-dot            nil)
  (setq jedi:tooltip-method             nil)
  (setq jedi:get-in-function-call-delay 200)
  (jedi:setup)

  (flycheck-mode)

  ; syntax settings
  (subword-mode              1)
  (setq indent-tabs-mode     nil)
  (setq python-indent-offset 4)

  (highlight-symbol-mode            1)
  (setq highlight-symbol-idle-delay 0.25)

  ;; I'll stick with C-c . / C-c ,
  ;; It's too easy to hit these shortcuts.
  (define-key jedi-mode-map (kbd "C-.") nil)
  (define-key jedi-mode-map (kbd "C-,") nil)

  (define-key python-mode-map (kbd "C-c C-n") 'flycheck-next-error)
  (define-key python-mode-map (kbd "C-c C-p") 'flycheck-previous-error)
  (define-key python-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key python-mode-map [(return)]      'newline-and-indent)

  ;; Remove trailing whitespace on save
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)
(add-hook 'python-mode-hook   'my-python-mode-hook)
