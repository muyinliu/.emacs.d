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
                      (buffer-face-mode))))
  :config (custom-set-faces
           '(markdown-header-face ((t (:inherit font-lock-function-name-face
                                                :weight bold
                                                :foreground "#1524FB"
                                                :family "Menlo"))))
           '(markdown-list-face ((t (:inherit markdown-markup-face :foreground "Purple"))))
           '(markdown-code-face ((t (:inherit font-lock-function-name-face
                                              :background "#FFFFEA"
                                              :foreground "black"
                                              :family "Monaco"))))
           '(markdown-inline-code-face ((t (:inherit (markdown-code-face
                                                      font-lock-constant-face)
                                                     :height 0.9
                                                     :background "gray95"
                                                     :box (:line-width 1 :color "grey75")))))
           '(markdown-bold-face ((t (:inherit bold
                                              :weight bold
                                              :height 1.1
                                              :family "Menlo"))))))

(provide 'init-markdown)
