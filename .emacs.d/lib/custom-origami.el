(use-package origami
  :config

  (define-key origami-mode-map (kbd "C-<tab>")         'origami-recursively-toggle-node)
  (define-key origami-mode-map (kbd "C-c C-<tab>")     'origami-toggle-all-nodes)
  (define-key origami-mode-map (kbd "C-<iso-lefttab>") 'origami-show-only-node))
