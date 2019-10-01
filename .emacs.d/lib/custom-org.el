(defun my-org-mode-hook ()
  ;; syntax highlighting of code blocks in org-mode
  (setq org-src-fontify-natively 1))

(defun my-journal-mode-hook ()
  ;; auto-fill in journal mode
  (auto-fill-mode 1)
  ;; set  directory for org-journal entries
  (setq org-journal-dir "~/Documents/journal/"))

(add-hook 'org-mode-hook     'my-org-mode-hook)
(add-hook 'journal-mode-hook 'my-journal-mode-hook)
