(require 'popup)

(yas-global-mode t)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))
 
(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))


(defun my-html-mode-hook ()
  (zencoding-mode)
  (auto-fill-mode 0)
  (yas/minor-mode)
  (setq-default sgml-basic-offset 2))

(add-hook 'html-mode-hook 'my-html-mode-hook)
