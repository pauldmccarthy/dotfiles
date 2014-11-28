(defun my-c++-mode-hook ()
  (setq c-basic-offset          2)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-cont  0 )
  (c-set-offset 'arglist-close 0 )
  (c-set-offset 'case-label    '+)
  (c-set-offset 'defun-close   0 ))

(add-hook 'c++-mode-hook 'my-c-mode-hook)

