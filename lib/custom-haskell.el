;; haskell-mode for haskell files
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))


(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

