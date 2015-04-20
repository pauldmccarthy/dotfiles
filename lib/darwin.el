;;gnu global gtags.el is installed here on os x
(add-to-list 'load-path (expand-file-name "/usr/local/share/gtags/"))

(setq inhibit-startup-screen t)
(setq max-mini-window-height 1)

;;add macports binaries to PATH
(setenv "PATH"
  (concat
   "/opt/local/bin" ":"
   (getenv "PATH")))

;; add latex to path
(setenv "PATH"
  (concat
   "/usr/texbin" ":"
   (getenv "PATH")))

;; disable noise
(setq ring-bell-function 'ignore)

;; make left command key act as meta
(setq mac-command-modifier 'meta)

;; Set font size for mode line and minibuffer
(set-face-attribute 'mode-line          nil :height 80 :weight 'bold)
(set-face-attribute 'mode-line-inactive nil :height 80 :weight 'normal)
(set-face-attribute 'minibuffer-prompt  nil :height 80 :weight 'bold)

; and main font size
(set-face-attribute 'default nil :family "Anonymous Pro" :height 190)
