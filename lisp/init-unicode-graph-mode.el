(use-package unicode-graph-mode
  :commands (unicode-graph-mode)
  :mode (("\\.ug\\'" . unicode-graph-mode))
  :init
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (custom-set-faces
                 `(unicode-graph-face ((t (:inherit 'font-lock-keyword-face
                                                    :family "Menlo"
                                                    :foreground "White")))))
                (custom-set-faces
                 `(unicode-graph-rectangle-face ((t (:inherit 'font-lock-keyword-face
                                                              :family "Menlo"
                                                              :foreground "#4396F5")))))))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (custom-set-faces
                 `(unicode-graph-face ((t (:inherit 'font-lock-keyword-face
                                                    :family "Menlo"
                                                    :foreground "Black")))))
                (custom-set-faces
                 `(unicode-graph-rectangle-face ((t (:inherit 'font-lock-keyword-face
                                                              :family "Menlo"
                                                              :foreground "Blue")))))))
  :config (custom-set-faces
           `(unicode-graph-face ((t (:inherit 'font-lock-keyword-face
                                              :family "Menlo"
                                              :foreground "Black"))))))

(unicode-graph-mode)

(provide 'init-unicode-graph-mode)
