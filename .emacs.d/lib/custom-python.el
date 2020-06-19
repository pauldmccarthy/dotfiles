
(use-package python
  :config

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
    (when (not (boundp 'project-venv-name))
      (setq project-venv-name "default"))
    (when (file-directory-p project-venv-name)
      (venv-workon project-venv-name)))

  ; realgud for debugging
  (use-package realgud
    :ensure t
    :commands (realgud:pdb)
    :config
    (setq realgud-safe-mode nil))

  (defun my-python-mode-hook ()

    ; First thing - make sure project-specific
    ; venv is activated (using machinery above
    ; to auto-identify and activate venv). It
    ; is assumed that any packages required by
    ; all the stuff below are installed in the
    ; venv. This includes at least:
    ;  - pylint
    ;  - flake8
    ;  - flake8-mypy
    ;  - python-language-server
    (pyvenv-auto-activate)

    (projectile-mode)       ; projectile (used by lsp, not me)
    (flycheck-mode)         ; flycheck for linting
    (company-mode)          ; company for auto completion
    (lsp)                   ; lsp-mode for IDE features
    (lsp-ui-mode)
    (origami-mode)          ; origami for code folding

    (setq flycheck-check-syntax-automatically '(mode-enabled save))

    ; add project root to $PYTHONPATH
    (setenv "PYTHONPATH"
            (concat (projectile-project-root) ":" (getenv "PYTHONPATH")))

    ; General syntax settings
    (subword-mode              1)
    (setq indent-tabs-mode     nil)
    (setq python-indent-offset 4)

    ; Remove trailing whitespace on save
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)

    ; unbind keys i don't use (i use
    ; them in flycheck/lsp instead)
    (define-key python-mode-map (kbd "C-c C-p") nil)
    (define-key python-mode-map (kbd "C-c C-l") nil)
    (define-key python-mode-map (kbd "C-c C-r") nil)
    (define-key python-mode-map (kbd "C-c C-j") nil)

    (define-key python-mode-map (kbd "C-c C-n") 'python-nav-forward-defun)
    (define-key python-mode-map (kbd "C-c C-p") 'python-nav-backward-defun)

    (define-key python-mode-map (kbd "C-c C-d") 'realgud:pdb)
  )

  (add-hook 'python-mode-hook  'my-python-mode-hook)
)
