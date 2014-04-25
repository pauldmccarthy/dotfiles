
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

;(global-set-key (kbd "C-c C-a") (lambda () (interactive) (adjust-precision 2)))
;(global-set-key (kbd "C-c C-a") (lambda () (interactive) (adjust-precision 4)))




; Thank you http://ignaciopp.wordpress.com/2009/06/10/customizing-emacs-occur/

(defun my-occur (&optional arg)
  (interactive "P")
  (let ((regexp (read-from-minibuffer "regexp: ")))

    (window-configuration-to-register :occur-config)
    (split-window-vertically -20)
    (windmove-down)
    (occur regexp)))

(defun occur-mode-quit ()
  (interactive)
  (windmove-up)
  (point-to-register ?1)
  (switch-to-buffer "*Occur*")
  (kill-buffer "*Occur*")
  (delete-window)
  (jump-to-register :occur-config)
  (register-to-point ?1))

(defun occur-mode-goto-quit ()
  (interactive)
  (occur-mode-display-occurrence)
  (occur-mode-quit))


;; some key bindings defined below. Use "p" ans "n" as in dired mode (without
;; Cntrl key) for previous and next line; just show occurrence without leaving
;; the "occur" buffer; use RET to display the line of the given occurrence,
;; instead of jumping to i,t which you do clicking instead; also quit mode
;; with Ctrl-g.

(define-key global-map     (kbd "C-S-o")      'my-occur)
(define-key occur-mode-map (kbd "q")          'occur-mode-quit)
(define-key occur-mode-map (kbd "C-q")        'occur-mode-quit)
(define-key occur-mode-map (kbd "C-g")        'occur-mode-quit)
(define-key occur-mode-map (kbd "C-<return>") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "RET")        'occur-mode-goto-quit)
(define-key occur-mode-map (kbd "C-p")        'previous-line)
(define-key occur-mode-map (kbd "C-n")        'next-line)
(define-key occur-mode-map (kbd "p")          'previous-line)
(define-key occur-mode-map (kbd "n")          'next-line)
