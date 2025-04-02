; skip startup screen and be quiet
(setq inhibit-startup-screen t)
(setq ring-bell-function     'ignore)

; turn off trimmings
(menu-bar-mode              0)
(tool-bar-mode              0)
(scroll-bar-mode            0)
(horizontal-scroll-bar-mode 0)
(set-fringe-mode          '(2 . 2))
; (toggle-frame-fullscreen)


; window modification undo/redo
; via C-c <left> and C-c <right>
(winner-mode 1)

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

; Disable emacs help, as I  frequently hit
; it accidentally, and it does my head in
(global-unset-key (kbd "C-h n"))
(global-unset-key (kbd "C-h C-n"))

;; use meta+(jkli) for window switching
(global-set-key (kbd "M-j")       'windmove-left)
(global-set-key (kbd "M-l")       'windmove-right)
(global-set-key (kbd "M-i")       'windmove-up)
(global-set-key (kbd "M-k")       'windmove-down)
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)

;; use C-S-(jkli) for window resizing
(global-set-key (kbd "M-C-i")       (lambda () (interactive (shrink-window               5))))
(global-set-key (kbd "M-C-k")       (lambda () (interactive (enlarge-window              5))))
(global-set-key (kbd "M-C-j")       (lambda () (interactive (shrink-window-horizontally  5))))
(global-set-key (kbd "M-C-l")       (lambda () (interactive (enlarge-window-horizontally 5))))
(global-set-key (kbd "M-C-<up>")    (lambda () (interactive (shrink-window               5))))
(global-set-key (kbd "M-C-<down>")  (lambda () (interactive (enlarge-window              5))))
(global-set-key (kbd "M-C-<left>")  (lambda () (interactive (shrink-window-horizontally  5))))
(global-set-key (kbd "M-C-<right>") (lambda () (interactive (enlarge-window-horizontally 5))))

;; use M-C-S+arrows for buffer moving
(global-set-key (kbd "M-C-S-j")       'buf-move-left)
(global-set-key (kbd "M-C-S-l")       'buf-move-right)
(global-set-key (kbd "M-C-S-i")       'buf-move-up)
(global-set-key (kbd "M-C-S-k")       'buf-move-down)
(global-set-key (kbd "M-C-S-<left>")  'buf-move-left)
(global-set-key (kbd "M-C-S-<right>") 'buf-move-right)
(global-set-key (kbd "M-C-S-<up>")    'buf-move-up)
(global-set-key (kbd "M-C-S-<down>")  'buf-move-down)

;; window mgmt shortcuts are
;; invariant w.r.t. shift state
(global-set-key (kbd "C-x S-0") 'delete-window)
(global-set-key (kbd "C-x S-1") 'delete-other-windows)
(global-set-key (kbd "C-x S-2") 'split-window-below)
(global-set-key (kbd "C-x S-3") 'split-window-right)

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
