(setq inhibit-startup-screen t)
(setq max-mini-window-height 1)

;; Set font size for mode line and minibuffer
(set-face-attribute 'mode-line          nil :height 100 :weight 'bold)
(set-face-attribute 'mode-line-inactive nil :height 100 :weight 'normal)
(set-face-attribute 'minibuffer-prompt  nil :height 100 :weight 'bold)

; and main font size
(set-face-attribute 'default nil :family "Anonymous Pro" :height 160)


;; pgup/down keys are too close to arrow keys on my laptop
(global-set-key (kbd "<next>")  (kbd "<right>"))
(global-set-key (kbd "<prior>") (kbd "<left>"))



(defun laptop-font()
  (interactive)
  (set-face-attribute 'mode-line          nil :height 80 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :height 80 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :height 80 :weight 'bold)
  (set-face-attribute 'default nil :family "Anonymous Pro" :height 160))

(defun desktop-font ()
  (interactive)
  (set-face-attribute 'mode-line          nil :family "Sans" :height 80 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :family "Sans" :height 80 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :family "Sans" :height 80 :weight 'bold)
  (set-face-attribute 'default            nil :family "Anonymous Pro"   :height 105))

(defun work-font ()
  (interactive)
  (set-face-attribute 'mode-line          nil :height 100 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :height 100 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :height 100 :weight 'bold)
  (set-face-attribute 'default nil :family "Anonymous Pro" :height 160))

(desktop-font)
