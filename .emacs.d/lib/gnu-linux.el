(setq pmc/text-font     "Hermit")
(setq pmc/modeline-font "DejaVu Sans")

(defun laptop-font()
  (interactive)
  (set-face-attribute 'default            nil :family pmc/text-font     :height 140 :weight 'normal)
  (set-face-attribute 'mode-line          nil :family pmc/modeline-font :height 120 :weight 'normal)
  (set-face-attribute 'mode-line-inactive nil :family pmc/modeline-font :height 120 :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :family pmc/modeline-font :height 120 :weight 'bold))

(defun desktop-font ()
  (interactive)
  (set-face-attribute 'default            nil :family 'pmc/text-font     :height 100 :weight 'normal)
  (set-face-attribute 'mode-line          nil :family 'pmc/modeline-font :height 80  :weight 'normal)
  (set-face-attribute 'mode-line-inactive nil :family 'pmc/modeline-font :height 80  :weight 'normal)
  (set-face-attribute 'minibuffer-prompt  nil :family 'pmc/modeline-font :height 60  :weight 'bold))

(laptop-font)
