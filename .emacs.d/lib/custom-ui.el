; skip startup screen and be quiet
(setq inhibit-startup-screen t)
(setq ring-bell-function     'ignore)

; turn off trimmings
(menu-bar-mode              0)
(tool-bar-mode              0)
(scroll-bar-mode            0)
(horizontal-scroll-bar-mode 0)

; smooth scrolling
; (thanks https://awesomeopensource.com/project/MatthewZMD/.emacs.d)
; Vertical Scroll
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
;; Horizontal Scroll
(setq hscroll-step 1)
(setq hscroll-margin 1)

; use same buffer for multiiple invocations
(add-to-list 'same-window-buffer-names "*Occur*")
(add-to-list 'same-window-buffer-names "*Help*")
(add-to-list 'same-window-buffer-names "*grep*")


; Disable default nex/prev buffer
; shortcuts, because i always
; accidentally hit them and end
; up editing a different file
; without realising it.
(global-unset-key (kbd "C-x <left>"))
(global-unset-key (kbd "C-x <right>"))


;; use shift+arrows for focus switching
(windmove-default-keybindings 'shift)

;; use C-S-arrows for window resizing
(global-set-key (kbd "C-S-<up>")    (lambda () (interactive (shrink-window               5))))
(global-set-key (kbd "C-S-<down>")  (lambda () (interactive (enlarge-window              5))))
(global-set-key (kbd "C-S-<left>")  (lambda () (interactive (shrink-window-horizontally  5))))
(global-set-key (kbd "C-S-<right>") (lambda () (interactive (enlarge-window-horizontally 5))))

;; use M-S+arrows for buffer moving
(global-set-key (kbd "M-S-<left>")  'buf-move-left)
(global-set-key (kbd "M-S-<right>") 'buf-move-right)
(global-set-key (kbd "M-S-<up>")    'buf-move-up)
(global-set-key (kbd "M-S-<down>")  'buf-move-down)


;; Make those window keybindings
;; work in org mode
(add-hook 'org-mode-hook
  (lambda ()
    (local-unset-key (kbd "S-<up>"))
    (local-unset-key (kbd "S-<down>"))
    (local-unset-key (kbd "S-<left>"))
    (local-unset-key (kbd "S-<right>"))
    (local-unset-key (kbd "C-S-<up>"))
    (local-unset-key (kbd "C-S-<down>"))
    (local-unset-key (kbd "C-S-<left>"))
    (local-unset-key (kbd "C-S-<right>"))
    (local-unset-key (kbd "M-S-<up>"))
    (local-unset-key (kbd "M-S-<down>"))
    (local-unset-key (kbd "M-S-<left>"))
    (local-unset-key (kbd "M-S-<right>"))))
