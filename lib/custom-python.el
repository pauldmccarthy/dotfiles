
(require 'virtualenvwrapper)
(setq venv-location "~/.virtualenvs/")


(defun my-python-mode-hook ()
  (subword-mode             1)
  (setq indent-tabs-mode    nil)

  (setq py-indent-offset    4)
  (setq python-guess-indent 4)
  (setq python-indent       4)
  (setq tab-width           4)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (global-set-key (kbd "C-c c" 'comment-or-uncomment-region))
  (define-key python-mode-map "\C-m" 'newline-and-indent))


(defun pyvenv-auto-activate  ()
  (hack-local-variables)
  (when (boundp 'project-venv-name)
    (venv-workon project-venv-name)))

(defun enable-flycheck ()
  (flycheck-select-checker "python-pylint")
  (setq flycheck-pylintrc "~/.pylintrc")
  (flycheck-mode)
)


;(setq jedi:setup-keys                 t) 
;(setq jedi:complete-on-dot            nil) 
;(setq jedi:tooltip-method             nil) 
;(setq jedi:get-in-function-call-delay 200) 
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'python-mode-hook 'pyvenv-auto-activate)

; jedi for auto-complete
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

; flycheck for syntax checking (flake8 and pylint need 
; to be installed in the python environment)
(add-hook 'python-mode-hook 'flycheck-mode)
