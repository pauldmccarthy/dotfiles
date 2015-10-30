;; set up file templates
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (expand-file-name "~/.emacs.d/insert/"))
(setq auto-insert-query nil)

(define-auto-insert "\\.py\\'" ["insert.py" update-insert-file])
(define-auto-insert "\\.hs\\'" ["insert.hs" update-insert-file])

;; in the template files, replace '@filename@' with the file name.
;; Thanks http://www.emacswiki.org/emacs/AutoInsertMode
(defun update-insert-file ()
  (save-excursion
    (while (search-forward "@filename@" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-nondirectory buffer-file-name))
      )
    )
  )
)
