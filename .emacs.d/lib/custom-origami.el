(use-package origami
  :config

  (define-key origami-mode-map (kbd "C-<tab>")   'origami-recursively-toggle-node)
  (define-key origami-mode-map (kbd "C-S-<tab>") 'origami-show-only-node))
