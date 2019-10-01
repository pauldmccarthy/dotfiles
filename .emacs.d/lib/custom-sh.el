(defun my-sh-mode-hook()
  (setq indent-tabs-mode nil)
  (setq sh-basic-offset  2)
  (setq sh-indentation   2))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)
