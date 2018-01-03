;;gnu global gtags.el is installed here on os x
(add-to-list 'load-path (expand-file-name "/usr/local/share/gtags/"))

(setq inhibit-startup-screen t)
(setq max-mini-window-height 1)

;;add macports binaries to PATH
(setenv "PATH"
  (concat
   "/opt/local/bin" ":"
   (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))

;; add latex to path
(setenv "PATH"
  (concat
   "/usr/texbin" ":"
   (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/texbin")))

;; add python to path
(setenv "PATH"
  (concat
   "/Library/Frameworks/Python.framework/Versions/2.7/bin" ":"
   (getenv "PATH")))
(setq exec-path (append exec-path '("/Library/Frameworks/Python.framework/Versions/2.7/bin")))

;; disable noise
(setq ring-bell-function 'ignore)

;; make left command key act as meta
(setq mac-command-modifier 'meta)


(defun laptop-font()
  (interactive)
  (set-face-attribute 'mode-line          nil :height 80 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :height 80 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :height 80 :weight 'bold)
  (set-face-attribute 'default nil :family "Anonymous Pro" :height 140))

(defun desktop-font ()
  (interactive)
  (set-face-attribute 'mode-line          nil :height 100 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :height 100 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :height 100 :weight 'bold)
  (set-face-attribute 'default nil :family "Anonymous Pro" :height 170))

(desktop-font)
