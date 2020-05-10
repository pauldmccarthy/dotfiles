(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq git-commit-finish-query-functions '())
  (setq magit-revert-buffers nil)
  (setq magit-save-repository-buffers nil)

  ;; tell magit not to restore the previous window
  ;; config when killing the magit buffer
  (setq magit-bury-buffer-function 'magit-mode-quit-window))
