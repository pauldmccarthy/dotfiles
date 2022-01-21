(defun fill-paragraph-to-point ()
  (interactive)
  (setq oldfill  'fill-column)
  (setq fill-column (current-column))
  (fill-paragraph)
  (setq fill-column 'oldfill))

(define-key global-map (kbd "C-S-q") 'fill-paragraph-to-point)
