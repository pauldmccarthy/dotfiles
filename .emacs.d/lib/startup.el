; The general structure of this configuration has been gratefully stolen from
;
;   https://github.com/markhepburn/dotemacs

(load "dependencies")

(load "custom-ui")
(load "custom-modeline")
(load "custom-helm")
(load "custom-insert")
(load "custom-theme")
(load "custom-magit")
(load "custom-origami")
(load "custom-company")
(load "custom-flycheck")
(load "custom-lsp")
(load "custom-python")
(load "custom-rst")
(load "custom-org")
(load "custom-sh")
(load "custom-glsl")

(which-key-mode)

; load platform specific customisation
; file, currently 'gnu-linux' for linux
(load (subst-char-in-string ?/ ?- (symbol-name system-type)))

; disable/simplify prompts
(fset 'yes-or-no-p 'y-or-n-p)                 ; replace "yes"/"no" prompts with "y"/"n"
(setq confirm-nonexistent-file-or-buffer nil) ; no prompt on new file
(setq revert-without-query '(".*"))           ; no prompt on revert-buffer

; enable local and directory-local variables
(setq enable-local-eval      t)
(setq enable-local-variables t)

; resolve and always follow symlinks
(setq find-file-visit-truename t)
(setq vc-follow-symlinks       t)

; save layout on exit
(desktop-save-mode 1)

; line and tab settings. lots of major modes have their own
; indentation settings, which is very frustrating
(setq-default fill-column       78)  ; default column width of 78 characters
(setq-default indent-tabs-mode  nil) ; no tabs
(setq-default tab-width         4)   ; 4 spaces for tabs
(setq-default standard-indent   4)   ; indents are 4 spaces wide
(setq-default tab-always-indent t)   ; make tab work
(global-hl-line-mode            1)   ; highlight current line
(line-number-mode               1)   ; show line number
(column-number-mode             1)   ; show column number


; Disable annoying key bindings, because I
; accidentally hit them far too often or
; use them for other things.
(global-set-key (kbd "C-x C-l") nil) ; downcase-region
(global-set-key (kbd "C-x C-u") nil) ; upcase-region
(global-set-key (kbd "C-z")     nil) ; suspend-frame
(global-set-key (kbd "C-x C-z") nil) ; suspend-frame
(global-set-key (kbd "C-x C-c") nil) ; save-buffers-kill-terminal
(global-set-key (kbd "M-/")     nil) ;
(global-set-key (kbd "M-r")     nil) ;
;; pgup/down keys are too close to arrow keys on my laptop
(global-set-key (kbd "<next>")  (kbd "<right>"))
(global-set-key (kbd "<prior>") (kbd "<left>"))

; ctrl+z for undo, in addition to ctrl+/
; (they're symmetric on my keyboard)
(global-set-key (kbd "C-z") 'undo)

(put 'upcase-region   'disabled nil)
(put 'downcase-region 'disabled nil)

; custom exit keybinding - this
; is harder to accidentally hit
(global-set-key   (kbd "C-c X") 'save-buffers-kill-terminal)

; auto-refresh buffers of files changed on disk
(global-auto-revert-mode t)

; new buffers are text by default
(setq-default default-major-mode 'text-mode)

; line wrapping is on by default
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; disable backup and auto save
(setq backup-inhibited t)
(setq auto-save-default nil)

; disable mouse (thanks http://stackoverflow.com/questions/4906534/disable-mouse-clicks-in-emacs)
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]))
  (global-unset-key k))

(fset 'mouse-buffer-menu nil)

; globally disable fill/wrap
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

; enable copy/paste in X
(setq x-select-enable-clipboard t)
(put 'narrow-to-region 'disabled nil)

; change default grep-find command
(grep-compute-defaults)
(grep-apply-setting 'grep-find-command "find . -name \"*py\" | xargs grep -in \"\"")

; disable truncate long lines
(setq-default truncate-lines t)

; disable overwrite mode
(put 'overwrite-mode 'disabled t)

; start the emacs daemon, disabling the
; "directory is unsafe" error, because
; my ~/.emacs.d/ is typically a symlink
(require 'server)
(defun server-ensure-safe-dir (dir) "Noop" t)
(setq server-socket-dir "~/.emacs.d/")
(server-start)
