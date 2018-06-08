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
  :config (if (console-p)
              (custom-set-faces
               '(markdown-header-face ((t (:inherit font-lock-function-name-face
                                                    :weight bold
                                                    :foreground "#1524FB"
                                                    :family "Menlo"))))
               '(markdown-list-face ((t (:inherit markdown-markup-face :foreground "Purple"))))
               '(markdown-code-face ((t (:inherit font-lock-function-name-face
                                                  :foreground "white"
                                                  :family "Monaco"))))
               '(markdown-inline-code-face ((t (:inherit (font-lock-constant-face)
                                                         :foreground "#FF8000"
                                                         :family "Monaco"))))
               '(markdown-table-face ((t (:inherit (font-lock-constant-face)
                                                   :foreground "white"))))
               '(markdown-bold-face ((t (:inherit bold
                                                  :weight bold
                                                  :family "Menlo")))))
            (custom-set-faces
             '(markdown-header-face ((t (:inherit font-lock-function-name-face
                                                  :weight bold
                                                  :foreground "#1524FB"
                                                  :family "Menlo"))))
             '(markdown-list-face ((t (:inherit markdown-markup-face :foreground "Purple"))))
             '(markdown-code-face ((t (:inherit font-lock-function-name-face
                                                :foreground "black"
                                                :family "Monaco"))))
             '(markdown-table-face ((t (:inherit (font-lock-constant-face)
                                                 :foreground "black"))))
             '(markdown-inline-code-face ((t (:inherit (font-lock-constant-face)
                                                       :foreground "#FF8000"
                                                       :family "Monaco"))))
             '(markdown-bold-face ((t (:inherit bold
                                                :weight bold
                                                :family "Menlo")))))))

(provide 'init-markdown)
