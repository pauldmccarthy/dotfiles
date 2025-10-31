(defun my-sh-mode-hook()
  (setq indent-tabs-mode nil)
  (setq sh-basic-offset  4)
  (setq sh-indentation   4))

(add-hook 'sh-mode-hook 'my-sh-mode-hook)
