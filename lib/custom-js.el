(defun my-javascript-mode-hook() (
  (setq js-indent-level 2)))

(add-hook 'javascript-mode-hook 'my-javascript-mode-hook)
