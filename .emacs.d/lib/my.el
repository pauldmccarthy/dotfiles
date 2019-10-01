
(provide 'my)

;; thanks http://www.emacswiki.org/emacs/CopyWithoutSelection




(defun copy-word (&optional arg )
 "Copy words at point into kill-ring"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9_-]" 1) (backward-word 1)) (point)))
        (end (progn (forward-word arg) (point))))
    (copy-region-as-kill beg end))
)


(defun dvi-pdf ()
  "Run dvipdf on the current buffer name (the suffix is replaced with 'dvi')."
  (interactive)
  (save-window-excursion
    (async-shell-command
      (concat "dvipdf "
                (replace-regexp-in-string "\.[^\.]*$" ".dvi" (buffer-name)))))
)

(defun regexp-start (regexp)
  (interactive "sRegexp: ")
  (if (re-search-backward regexp (line-beginning-position) 1)
    (goto-char (+ (point) 1)))
)

(defun regexp-end (regexp)
  (interactive "sRegexp: ")
  (if (re-search-forward regexp (line-end-position) 1)
    (goto-char (- (point) 1)))
)

(defun del-by-regexp (regexp)
  (interactive "sRegexp: ")
  (let ((beg (progn (regexp-start regexp) (point)))
        (end (progn (regexp-end regexp) (point))))
        (delete-and-extract-region beg end))
)
(defun adjust-precision (arg)
  (interactive "p")
  (let ((fmtstr (format "%%0.%df" arg)))
   (insert (format fmtstr (string-to-number (del-by-regexp "[^0-9.]")))))
  )


;; https://github.com/markhepburn/dotemacs/blob/master/custom-functions.el
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

;(global-set-key (kbd "C-c C-a") (lambda () (interactive) (adjust-precision 2)))
;(global-set-key (kbd "C-c C-a") (lambda () (interactive) (adjust-precision 4)))
