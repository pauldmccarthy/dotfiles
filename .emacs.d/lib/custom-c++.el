(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here
 ;;
 (c-set-offset 'arglist-intro '+)
 ;; arglist-close

 ;; (setq c++-tab-always-indent t)
 ;; (setq c-basic-offset 4)                  ;; Default is 2
 ;; (setq c-indent-level 4)                  ;; Default is 2

 ;; (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 ;; (setq tab-width 4)
 ;; (setq indent-tabs-mode t)  ; use spaces only if nil

 ;; Remove trailing whitespace on save
 (add-to-list 'write-file-functions 'delete-trailing-whitespace)
)

(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
