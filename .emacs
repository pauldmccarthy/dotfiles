; The general structure of this configuration has been gratefully stolen from
;
;   https://github.com/markhepburn/dotemacs
;

; add library directories
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))

; load platform specific customisation file, currently 'darwin' for
; OS X, 'gnu-linux' for linux
(load (subst-char-in-string ?/ ?- (symbol-name system-type)))

(load "dependencies")

(powerline-default-theme)

(require 'my)

(when (require 'zenburn-theme nil t)
  (load-theme 'zenburn t))

(require 'auto-complete)
(global-auto-complete-mode t)

(load "custom-html")
(load "custom-python")
(load "custom-c")
(load "custom-org")

(yas-global-mode t)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))
 
(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))

(global-hl-line-mode -1)


(add-to-list 'same-window-buffer-names "*Occur*")
(add-to-list 'same-window-buffer-names "*Help*")
(add-to-list 'same-window-buffer-names "*grep*")


;; haskell-mode for haskell files
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

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

;; bind copy word under cursor to C-c w
(global-set-key (kbd "C-c w") 'copy-word)

;; turn off trimmings
(menu-bar-mode   0)
(tool-bar-mode   0)
(scroll-bar-mode 0)

;; use bs-show instead of standard buffer list
(global-set-key (kbd "C-x C-b") 'bs-show)

;; use shift+arrows for window switching
(windmove-default-keybindings 'shift)

;; use C-S-arrows for window resizing
(global-set-key (kbd "C-S-<up>")    'shrink-window)
(global-set-key (kbd "C-S-<down>")  'enlarge-window)
(global-set-key (kbd "C-S-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)

;; use C-c arrows for buffer moving
(global-set-key (kbd "C-c <left>")  'buf-move-left)
(global-set-key (kbd "C-c <right>") 'buf-move-right)
(global-set-key (kbd "C-c <up>")    'buf-move-up)
(global-set-key (kbd "C-c <down>")  'buf-move-down)

;; auto-refresh buffers of files changed on disk
(global-auto-revert-mode t)`

;; new buffers are text by default
(setq-default default-major-mode 'text-mode)

;; line wrapping is on by default
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; enable reftex in auctex
(add-hook 'LaTeX-mode-hook (lambda () (reftex-mode t)))
(add-hook 'latex-mode-hook (lambda () (reftex-mode t)))
(setq reftex-plug-into-AUCTeX t)

;; disable backup and auto save
(setq backup-inhibited t)
(setq auto-save-default nil)

;; make auctex aware of multi file documents
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default Tex-master nil)

;;make dvi output the default
(setq-default TeX-PDF-mode nil)

;; set up file templates
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (expand-file-name "~/.emacs.d/insert/"))
(setq auto-insert-query nil)

(define-auto-insert "\\.py\\'" ["insert.py" update-insert-file])
(define-auto-insert "\\.hs\\'" ["insert.hs" update-insert-file])

;; in the template files, replace '@filename@' with the file name.
;; Thanks http://www.emacswiki.org/emacs/AutoInsertMode
(defun update-insert-file ()
  (save-excursion
    (while (search-forward "@filename@" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-nondirectory buffer-file-name))
      )
    )
  )
)



(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)




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

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; change exit key binding; C-x C-c is too easy to accidentally hit
(global-set-key   (kbd "C-c X") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))


(global-set-key (kbd "C-c f") 'find-name-dired)

;; Set font size for mode line and minibuffera
(set-face-attribute 'mode-line          nil :height 140 :weight 'bold)
(set-face-attribute 'mode-line-inactive nil :height 140 :weight 'normal)
(set-face-attribute 'minibuffer-prompt  nil :height 140 :weight 'bold)

; and main font size
(set-face-attribute 'default nil :family "Anonymous Pro" :height 220)

;; change minibuffer background when active
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist '(default (:background "#555555")))))
(put 'downcase-region 'disabled nil)

;; start the emacs daemon
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((project-venv-name . "pyfsl-env")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "#ff3333" :foreground "#efefef" :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning :background "#aaaa00" :foreground "#efefef" :weight normal)))))
