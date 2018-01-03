;; Install a bunch of third party packages.
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))


(setq *pmc/packages*
  '(auctex
    auto-complete
    pos-tip
    buffer-move
    diminish
    dash
    flycheck
    flycheck-color-mode-line
    glsl-mode
    helm
    highlight-symbol
    jedi
    org-journal
    magit
    midnight
    popup
    powerline
    projectile
    virtualenvwrapper
    yasnippet
    zenburn-theme
    zencoding-mode
    cython-mode
    realgud))

(require 'cl)
(require 'package)
(package-initialize)

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
