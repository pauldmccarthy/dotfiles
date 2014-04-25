; Install a bunch of third party packages.

(setq el-get-emacswiki-base-url "http://www.emacswiki.org/emacs/download/")

; make sure el-get is present and up to date
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

; custom el-get repositories
(setq el-get-sources
  '((:name      zenburn-theme
     :type      github
     :pkgname   "bbatsov/zenburn-emacs"
     :post-init (add-to-list 'custom-theme-load-path default-directory))
    (:name      org-journal
     :type      github
     :pkgname   "bastibe/org-journal")
    (:name      virtualenvwrapper
     :type      github
     :pkgname   "porterjamesj/virtualenvwrapper.el")))


; all installed packages
(setq *eg/packages*
 '(el-get
    auctex
    auto-complete
    buffer-move
    color-theme
    ctable
    deferred
    epc
    fill-column-indicator
    fuzzy
    gtags
    jedi
    popup
    yasnippet
    zenburn-theme
    zencoding-mode
    org-journal
    virtualenvwrapper
    flycheck))

(el-get-cleanup *eg/packages*)
(el-get 'sync *eg/packages*)
