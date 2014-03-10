;;gnu global gtags.el is installed here on os x
(add-to-list 'load-path (expand-file-name "/usr/local/share/gtags/"))

(setq inhibit-startup-screen t)
(setq max-mini-window-height 1)

;;add macports binaries to PATH
(setenv "PATH"
  (concat
   "/opt/local/bin" ":"
   (getenv "PATH")))

;; disable noise
(setq ring-bell-function 'ignore)

;; make left command key act as meta
(setq mac-command-modifier 'meta)
