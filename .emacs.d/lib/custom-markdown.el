; wrap with correct indentation
(setq-default adaptive-wrap-extra-indent 0)
(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)

(defun my-markdown-mode-hook ()
  (local-set-key (kbd "M-q") 'ignore)
  (visual-line-mode 1))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
