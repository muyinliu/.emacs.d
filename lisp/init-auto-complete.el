(use-package company
  :config (global-company-mode)
  :init
  (setq company-minimum-prefix-length 2)
  (add-hook 'lisp-mode-hook       'company-mode)
  (add-hook 'emacs-mode-hook      'company-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook      'company-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook      #'cider-company-enable-fuzzy-completion))


(provide 'init-auto-complete)
