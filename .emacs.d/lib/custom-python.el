; Machinery for auto-activating project-specific
; virtualenvs. All virtual environments are stored
; in the venv-location directory. In each project
; directory, add a .dir-locals.el file which contains
; the following:
;
;   ((python-mode . ((project-venv-name . "name-of-venv-dir"))))

; All virtualenvs are stored here
(setq venv-location (expand-file-name "/home/paulmc/venvs/"))
(setq python-environment-directory venv-location)

; Allow me to set the virtualenv in .dir-locals.el
; without an unsafe variable warning
(put 'project-venv-name 'safe-local-variable (lambda (x) t))

; Auto-activate virtualenv on a buffer
; if project-venv-name is set
; maybe manually add ./bin/ to PATH?
(defun pyvenv-auto-activate  ()
  (hack-local-variables)
  (when (boundp 'project-venv-name)
    (venv-workon project-venv-name)))


(defun my-python-mode-hook ()

  ; First thing - make sure project-specific
  ; venv is activated (using machinery above
  ; to auto-identify and activate venv). It
  ; is assumed that any packages required by
  ; all the stuff below are installed in the
  ; venv. This includes at least:
  ;  - pylint
  ;  - flake8
  ;  - python-language-server
  (pyvenv-auto-activate)

  (projectile-mode)  ; projectile (used by lsp, not me)
  (flycheck-mode)    ; flycheck for linting
  (company-mode)     ; company for auto completion
  (lsp)              ; lsp-mode for IDE features
  (lsp-ui-mode)
  (origami-mode)     ; origami for code folding

  ; General syntax settings
  (subword-mode              1)
  (setq indent-tabs-mode     nil)
  (setq python-indent-offset 4)

  ; highlight other instances of symbol over point
  (highlight-symbol-mode            1)
  (setq highlight-symbol-idle-delay 0.25)

  ; Remove trailing whitespace on save
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)

  ; unbind keys i don't use (i use
  ; them in flycheck/lps instead)
  (define-key python-mode-map (kbd "C-c C-p") nil)
  (define-key python-mode-map (kbd "C-c C-l") nil)
  (define-key python-mode-map (kbd "C-c C-r") nil)
  (define-key python-mode-map (kbd "C-c C-j") nil)
)

(add-hook 'python-mode-hook  'my-python-mode-hook)
