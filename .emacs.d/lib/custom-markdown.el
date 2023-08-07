(defun my-markdown-mode-hook ()
  (local-set-key (kbd "M-q") 'ignore)
  (visual-line-mode 1))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
