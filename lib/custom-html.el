(defun my-html-mode-hook ()
  (zencoding-mode)
  (auto-fill-mode 0)
  (yas/minor-mode)
  (setq-default sgml-basic-offset 2))

(add-hook 'html-mode-hook 'my-html-mode-hook)
