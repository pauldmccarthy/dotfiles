

(defun my-latex-mode-hook () 
  (reftex-mode t)

  ;; make auctex aware of multi file documents
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default Tex-master nil)

  ;;make dvi output the default
  (setq-default TeX-PDF-mode nil)

  (setq reftex-plug-into-AUCTeX t)

  ; stop reftex prompting for reference type
  (setq reftex-ref-macro-prompt nil))

(add-hook 'LaTeX-mode-hook 'my-latex-mode-hook)
(add-hook 'latex-mode-hook 'my-latex-mode-hook)


