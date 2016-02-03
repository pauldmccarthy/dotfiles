; The general structure of this configuration has been gratefully stolen from
;
;   https://github.com/markhepburn/dotemacs
;

; add library directories
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))

; load platform specific customisation file, currently 'darwin' for
; OS X, 'gnu-linux' for linux
(load (subst-char-in-string ?/ ?- (symbol-name system-type)))

(load "dependencies")

(powerline-default-theme)

(require 'my)
(require 'diminish)
(require 'pos-tip)

(when (require 'zenburn-theme nil t)
  (load-theme 'zenburn t))

(load "custom-window")
(load "custom-auto-complete")
(load "custom-magit")
(load "custom-powerline")
(load "custom-insert")
(load "custom-html")
(load "custom-python")
(load "custom-js")
(load "custom-c")
(load "custom-cpp")
(load "custom-org")
(load "custom-tex")
(load "custom-glsl")

;; enable local and directory-local variables
(setq enable-local-eval      t)
(setq enable-local-variables t)

;; save layout on exit
(desktop-save-mode 1)

;; highlight the current line in all modes
(global-hl-line-mode -1)


;; line and tab settings. lots of major modes have their own
;; indentation settings, which is very frustrating
(setq-default fill-column       78)  ;; default column width of 80 characters
(setq-default indent-tabs-mode  nil) ;; no tabs
(setq-default tab-width         2)   ;; 2 spaces for tabs
(setq-default standard-indent   2)   ;; indents are 2 spaces wide
(setq-default tab-always-indent t)   ;; make tab work
(global-hl-line-mode            1)   ;; highlight current line
(line-number-mode               1)   ;; show line number
(column-number-mode             1)   ;; show column number

(require 'helm)
(helm-mode 1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

;; Disable annoying key bindings, because I
;; accidentally hit them far too often.
;; downcase-region and upcase-region
(global-set-key (kbd "C-x C-l") nil)
(global-set-key (kbd "C-x C-u") nil)

;; auto-refresh buffers of files changed on disk
(global-auto-revert-mode t)

;; new buffers are text by default
(setq-default default-major-mode 'text-mode)

;; line wrapping is on by default
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; disable backup and auto save
(setq backup-inhibited t)
(setq auto-save-default nil)

(put 'upcase-region 'disabled nil)

;; disable mouse (thanks http://stackoverflow.com/questions/4906534/disable-mouse-clicks-in-emacs)
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))

(fset 'mouse-buffer-menu nil)

;; globally disable fill/wrap
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; enable copy/paste in X
(setq x-select-enable-clipboard t)
(put 'narrow-to-region 'disabled nil)

;; change default grep-find command
(grep-compute-defaults)
(grep-apply-setting 'grep-find-command "find . -name \"*c\" | xargs grep -in \"\"")

;; use octave-mode for .m files
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; continuous scroll in pdf/dvi view
(setq doc-view-continuous t)

;; disable truncate long lines
(setq-default truncate-lines t)

;; make M-x compile run without prompting for the compile command
(setq compilation-read-command nil)

;; make compile output auto-scroll
(setq compilation-scroll-output t)

;; disable overwrite mode
(put 'overwrite-mode 'disabled t)

;; projectile and helm
;; https://github.com/markhepburn/dotemacs/blob/master/custom-general.el
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-project-root-files (quote (".projectile")))
(setq projectile-project-root-files-bottom-up (quote (".projectile")))
(setq projectile-project-root-files-top-down-recurring (quote (".projectile")))

(after 'projectile
  (setq projectile-completion-system 'helm
        projectile-switch-project-action 'helm-projectile
        ;; http://iqbalansari.github.io/blog/2014/02/22/switching-repositories-with-magit/
        ;; http://irreal.org/blog/?p=4177
        magit-repository-directories (mapcar (lambda (dir)
                                               (substring dir 0 -1))
                                             (nreverse
                                              (remove-if-not (lambda (project)
                                                               (file-directory-p (concat project "/.git/")))
                                                             (projectile-relevant-known-projects)))))
  (diminish 'projectile-mode))

(defun maybe-projectile-find-file ()
  (interactive)
  (call-interactively
   (if (projectile-project-p)
       #'projectile-find-file
     #'helm-find-files)))

;; use helm/projectile for file/buffer selection
(global-set-key (kbd "C-x C-f") 'maybe-projectile-find-file)
(global-set-key (kbd "C-c f")   'helm-find-files)
(global-set-key (kbd "C-c k")   'projectile-find-file-in-known-projects)
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x   b") 'bs-show)

;; change exit key binding; C-x C-c is too easy to accidentally hit
(global-set-key   (kbd "C-c X") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

;; change minibuffer background when active
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:background "#555555")))))
(put 'downcase-region 'disabled nil)

;; start the emacs daemon
(server-start)
