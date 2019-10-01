

(defun rst-wrap-with (prefix suffix)
  (interactive)
  (let (($temp-syn-table (make-syntax-table)))

    ; treat some characters as part of words
    (modify-syntax-entry ?` "w" $temp-syn-table)
    (modify-syntax-entry ?. "w" $temp-syn-table)
    (modify-syntax-entry ?' "w" $temp-syn-table)

    (with-syntax-table $temp-syn-table
      (let* ((bounds (if (use-region-p)
                         (cons (region-beginning) (region-end))
                       (bounds-of-thing-at-point 'symbol)))
             (text   (buffer-substring-no-properties (car bounds) (cdr bounds))))
        (when bounds
          (delete-region (car bounds) (cdr bounds))
          (insert (concat prefix text suffix)))))))

; TODO make work with period char
(defun rst-class-def ()
  (interactive)
  (rst-wrap-with ":class:`" "`"))


(defun rst-func-def ()
  (interactive)
  (rst-wrap-with ":func:`" "`"))


(defun rst-meth-def ()
  (interactive)
  (rst-wrap-with ":meth:`" "`"))


(defun rst-attr-def ()
  (interactive)
  (rst-wrap-with ":attr:`" "`"))


(defun rst-mod-def ()
  (interactive)
  (rst-wrap-with ":mod:`" "`"))


(defun rst-fixed-width ()
  (interactive)
  (rst-wrap-with "`" "`"))



(define-key global-map (kbd "C-S-m") 'rst-mod-def)
(define-key global-map (kbd "C-S-c") 'rst-class-def)
(define-key global-map (kbd "C-S-a") 'rst-attr-def)
(define-key global-map (kbd "C-S-f") 'rst-func-def)
(define-key global-map (kbd "C-S-e") 'rst-meth-def)
(define-key global-map (kbd "C-S-w") 'rst-fixed-width)
