(use-package helm
 :ensure t
 :init
 (helm-mode)

 (setq helm-mode-fuzzy-match                 t)
 (setq helm-completion-in-region-fuzzy-match t)
 (setq helm-autoresize-mode                  1)
 (setq helm-find-files-ignore-thing-at-point t)

 ; memory leak? https://issues.guix.info/43406
 (setq helm-ff-keep-cached-candidates nil)

 ; rebind tab to run persistent action
 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

 ;; use helm for file/buffer selection
 (global-set-key (kbd "C-x C-f") 'helm-find-files)
 (global-set-key (kbd "M-x")     'helm-M-x)
 (global-set-key (kbd "M-y")     'helm-show-kill-ring)
 (global-set-key (kbd "C-x C-b") 'helm-mini)
 (global-set-key (kbd "C-x   b") 'bs-show)
 (global-set-key (kbd "C-c C-o") 'helm-occur)
 (global-set-key (kbd "C-c C-j") 'helm-imenu)
 )
