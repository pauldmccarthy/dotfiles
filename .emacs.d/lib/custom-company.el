(use-package company
  :config

  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay            nil)
  
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (add-to-list 'company-backends 'company-capf)

  (defun company-python-hook ()
    (define-key python-mode-map (kbd "M-<tab>") 'company-complete))

  (add-hook 'python-mode-hook 'company-python-hook))
