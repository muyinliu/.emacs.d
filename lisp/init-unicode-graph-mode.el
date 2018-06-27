(use-package unicode-graph-mode
  :commands (unicode-graph-mode)
  :mode (("\\.ug\\'" . unicode-graph-mode))
  :config (custom-set-faces
           `(unicode-graph-face ((t (:inherit 'font-lock-keyword-face
                                              :family "Menlo"
                                              :foreground ,(if (console-p)
                                                               "White"
                                                             "Black")))))))

(unicode-graph-mode)

(provide 'init-unicode-graph-mode)
