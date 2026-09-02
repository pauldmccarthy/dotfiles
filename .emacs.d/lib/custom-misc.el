(defun fill-paragraph-to-point ()
  (interactive)
  (setq oldfill  'fill-column)
  (setq fill-column (current-column))
  (fill-paragraph)
  (setq fill-column 'oldfill))

(defun unfill-paragraph ()
  (interactive)
  (setq oldfill  'fill-column)
  (setq fill-column 9999)
  (fill-paragraph)
  (setq fill-column 'oldfill))

(defun delete-horizontal-space-forward ()
  (interactive "*")
  (delete-region (point) (progn (skip-chars-forward " \t") (point))))


(define-key global-map (kbd "M-M")   'delete-horizontal-space-forward)
(define-key global-map (kbd "C-S-q") 'fill-paragraph-to-point)
(define-key global-map (kbd "C-M-q") 'unfill-paragraph)
