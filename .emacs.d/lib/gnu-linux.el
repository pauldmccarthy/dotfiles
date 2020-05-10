
; and main font size
(set-face-attribute 'default nil :family "Input Mono" :height 160)

;; Set font size for mode line and minibuffer
(set-face-attribute 'mode-line          nil :family "DejaVu Sans" :height 100 :weight 'bold)
(set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans" :height 100 :weight 'normal)
(set-face-attribute 'minibuffer-prompt  nil :family "DejaVu Sans" :height 100 :weight 'bold)


;; pgup/down keys are too close to arrow keys on my laptop
(global-set-key (kbd "<next>")  (kbd "<right>"))
(global-set-key (kbd "<prior>") (kbd "<left>"))


(defun laptop-font()
  (interactive)
  (set-face-attribute 'mode-line          nil :family "DejaVu Sans" :height 120 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans" :height 120 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :family "DejaVu Sans" :height 120 :weight 'bold)
  (set-face-attribute 'default nil :family "Input Mono" :height 140))

(defun desktop-font ()
  (interactive)
  (set-face-attribute 'mode-line          nil :family "DejaVu Sans" :height 100 :weight 'bold)
  (set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans" :height 100 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :family "DejaVu Sans" :height 100 :weight 'bold)
  (set-face-attribute 'default            nil :family "Input Mono"   :height 100))

(laptop-font)
