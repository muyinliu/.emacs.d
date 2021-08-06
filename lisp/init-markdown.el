(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (progn
          (setq markdown-command "multimarkdown")
          (setq markdown-fontify-code-blocks-natively t)
          (add-hook 'markdown-mode-hook
                    (lambda ()
                      (setq buffer-face-mode-face '(:family "Monaco" :height 1.1))
                      (buffer-face-mode)
                      (auto-fill-mode 0)
                      (setq word-wrap nil))))
  :config (custom-set-faces
           `(markdown-header-face ((t (:inherit font-lock-function-name-face
                                                :weight bold
                                                :foreground ,(if (console-p) "#0398FC" "#1524FB")
                                                :family "Menlo"))))
           '(markdown-list-face ((t (:inherit markdown-markup-face :foreground "Purple"))))
           `(markdown-code-face ((t (:inherit 'font-lock-function-name-face
                                              :foreground ,(if (console-p)
                                                               "White"
                                                             "Black")
                                              :height 0.9))))
           '(markdown-inline-code-face ((t (:inherit font-lock-constant-face
                                                     :foreground "#FF8000"))))
           `(markdown-table-face ((t (:inherit 'font-lock-constant-face
                                               :foreground ,(if (console-p)
                                                                "White"
                                                              "Black")
                                               :family "Menlo"
                                               :height 0.9))))
           '(markdown-bold-face ((t (:inherit bold :weight bold :family "Menlo"))))))

(use-package edit-indirect)

(provide 'init-markdown)
