;; Install a bunch of third party packages.
(setq package-archives
      '(("gnu"       . "https://elpa.gnu.org/packages/")
        ("melpa"     . "https://melpa.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("org"       . "https://orgmode.org/elpa/")))


(setq *pmc/packages*
  '(buffer-move               ; essentials
    magit
    helm
    helm-lsp
    use-package
    doom-modeline
    all-the-icons
    adaptive-wrap             ; correct indentation in visual-line-mode
    which-key
    realgud                   ; realgud for debugging
    lsp-mode                  ; lsp for IDE features
    lsp-ui
    projectile                ; for project management (i
                              ; don't use it, but lsp does)
    company                   ; company for auto-complete
    flycheck                  ; flycheck for linting
    flycheck-color-mode-line
    virtualenvwrapper         ; for python venvs
    origami                   ; origami for code folding
    dash
    s                         ; string manipulation library
    zenburn-theme
    zencoding-mode
    glsl-mode
    cython-mode
    kotlin-mode))

(require 'cl)
(require 'package)
(package-initialize)

(setq package-check-signature nil)

(defun pmc/all-packages-installed-p ()
  (cl-every (lambda (p) (package-installed-p p))
            *pmc/packages*))

(unless (pmc/all-packages-installed-p)
  (message "Refreshing package database...")
  (package-refresh-contents)
  (message "Done.")
  (dolist (package *pmc/packages*)
   (unless (package-installed-p package)
     (package-install package))))
