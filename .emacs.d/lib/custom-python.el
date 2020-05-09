
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


; Set up flycheck syntax checker. We
; assume that flake8 and pylint are available
(defun my-flycheck-mode-hook ()
  (flycheck-color-mode-line-mode)

  (setq flycheck-pylintrc "~/.pylintrc")
  (setq flycheck-flake8rc "~/.flake8rc")
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.33)))

  (flycheck-select-checker 'python-pylint)
  (flycheck-add-next-checker 'python-pylint 'python-flake8))


(defun my-python-mode-hook ()

  ; make sure project-specific venv is activated
  (pyvenv-auto-activate)

  ; enable lsp
  (projectile-mode)
  (lsp)
  (lsp-ui-mode)
  (lsp-enable-imenu)

  ; use company+lsp for auto-complete
  (company-mode)
  (company-quickhelp-mode)
  (add-to-list 'company-backends 'company-lsp)

  ;; use origami for folding
  (origami-mode)
  (define-key origami-mode-map (kbd "C-<tab>")   'origami-recursively-toggle-node)
  (define-key origami-mode-map (kbd "C-S-<tab>") 'origami-show-only-node)
  (define-key origami-mode-map (kbd "C-C C-o")   'origami-toggle-all-nodes)

  ; syntax settings
  (subword-mode              1)
  (setq indent-tabs-mode     nil)
  (setq python-indent-offset 4)

  ; highlight other instances of symbol over point
  (highlight-symbol-mode            1)
  (setq highlight-symbol-idle-delay 0.25)

  ; Remove trailing whitespace on save
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
)

(add-hook 'flycheck-mode-hook 'my-flycheck-mode-hook)
(add-hook 'python-mode-hook   'my-python-mode-hook)
