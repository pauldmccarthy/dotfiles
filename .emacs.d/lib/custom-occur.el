;;; custom-occur.el ---

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
