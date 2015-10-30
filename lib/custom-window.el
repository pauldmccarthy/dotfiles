;; turn off trimmings
(menu-bar-mode   0)
(tool-bar-mode   0)
(scroll-bar-mode 0)


(add-to-list 'same-window-buffer-names "*Occur*")
(add-to-list 'same-window-buffer-names "*Help*")
(add-to-list 'same-window-buffer-names "*grep*")



;; use shift+arrows for window switching
(windmove-default-keybindings 'shift)

;; use C-S-arrows for window resizing
(global-set-key (kbd "C-S-<up>")    'shrink-window)
(global-set-key (kbd "C-S-<down>")  'enlarge-window)
(global-set-key (kbd "C-S-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)

;; use C-c arrows for buffer moving
(global-set-key (kbd "C-c <left>")  'buf-move-left)
(global-set-key (kbd "C-c <right>") 'buf-move-right)
(global-set-key (kbd "C-c <up>")    'buf-move-up)
(global-set-key (kbd "C-c <down>")  'buf-move-down)


;; Make those window keybindings
;; work in org mode
(add-hook 'org-mode-hook
  (lambda ()
    (local-unset-key (kbd "<S-up>"))
    (local-unset-key (kbd "<S-down>"))
    (local-unset-key (kbd "<S-left>"))
    (local-unset-key (kbd "<S-right>"))
    (local-unset-key (kbd "<C-S-up>")) 
    (local-unset-key (kbd "<C-S-down>"))  
    (local-unset-key (kbd "<C-S-left>")) 
    (local-unset-key (kbd "<C-S-right>"))
    (local-unset-key (kbd "C-c <up>"))
    (local-unset-key (kbd "C-c <down>")) 
    (local-unset-key (kbd "C-c <left>"))
    (local-unset-key (kbd "C-c <right>"))))
