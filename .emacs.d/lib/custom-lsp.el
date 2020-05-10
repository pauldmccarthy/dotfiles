(use-package lsp-mode
  :config

  (lsp-enable-which-key-integration)
  (setq lsp-ui-imenu-enable nil)
  (setq lsp-ui-peek-enable  nil)
  (setq lsp-prefer-flymake  nil)

  ; lsp minibuffer signature show is buggy
  (setq lsp-signature-auto-activate nil)

  ; nicer keybindings
  (define-key lsp-mode-map (kbd "C-c C-r") 'lsp-rename))

(use-package lsp-ui
  :after lsp-mode
  :config

  ; manually bring up help
  (setq lsp-ui-doc-delay             nil)
  (setq lsp-ui-doc-include-signature t)

  ; customise sideline popups
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-hover        t)
  (setq lsp-ui-sideline-ignore-duplicate  t)
  (setq lsp-ui-sideline-delay             0.0)

  ; make help popup use sensible key bindings
  (defun show-and-focus-help () (interactive)
    (lsp-ui-doc-show)
    (lsp-ui-doc-focus-frame))

  (defun unfocus-and-hide-help () (interactive)
    (lsp-ui-doc-unfocus-frame)
    (lsp-ui-doc-hide))

  (define-key lsp-ui-mode-map           (kbd "C-c C-h") 'show-and-focus-help)
  (define-key lsp-ui-doc-frame-mode-map (kbd "q")       'unfocus-and-hide-help)
  (define-key lsp-ui-doc-frame-mode-map (kbd "C-g")     'unfocus-and-hide-help)


  ; nice keybindings for goto/return from definnition
  (define-key lsp-ui-mode-map (kbd "C-c C-.") 'lsp-find-definition)
  (define-key lsp-ui-mode-map (kbd "C-c C-,") 'show-and-focus-help)

)
