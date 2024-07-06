;;;; highlight

(global-font-lock-mode t) ;; enable syntax highlight
(add-hook 'font-lock-mode-hook
          #'(lambda ()
              (set-face-foreground 'font-lock-comment-face "#009300")
              (set-face-foreground 'font-lock-comment-delimiter-face "#009300")))

(add-hook 'auto-dark-dark-mode-hook
          #'(lambda ()
              (set-face-foreground 'font-lock-comment-face "#009300")
              (set-face-foreground 'font-lock-comment-delimiter-face "#009300")))
(add-hook 'auto-dark-light-mode-hook
          #'(lambda ()
              (set-face-foreground 'font-lock-comment-face "#009300")
              (set-face-foreground 'font-lock-comment-delimiter-face "#009300")))

;; cursor color
(add-hook 'auto-dark-dark-mode-hook
          #'(lambda ()
              (set-cursor-color "Red")))
(add-hook 'auto-dark-light-mode-hook
          #'(lambda ()
              (set-cursor-color "Red")))

;; selected text color
(add-hook 'auto-dark-dark-mode-hook
          #'(lambda ()
              (set-face-attribute 'region nil :background "#045418")))
(add-hook 'auto-dark-light-mode-hook
          #'(lambda ()
              (set-face-attribute 'region nil :background "#B9D6FB")))

;; highlight current line
(use-package hl-line
  :init
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (set-face-background hl-line-face "gray20")))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-face-background hl-line-face "#E2E3E2")))
  :config
  (global-hl-line-mode 1)
  (set-face-background hl-line-face "#E2E3E2"))

;; line number
(use-package nlinum
  :bind (("M-A-l" . nlinum-mode)
         ("C-M-l" . nlinum-mode)
         ("C-x M-A-l" . global-nlinum-mode)
         ("C-x C-M-l" . global-nlinum-mode))
  :config
  ;; for fix bug of nlinum-mode
  (require 'nlinum-hl)
  ;; A shotgun approach that refreshes line numbers on a regular basis:
  ;; Runs occasionally, though unpredictably
  (add-hook 'post-gc-hook #'nlinum-hl-flush-all-windows)
  ;; whenever Emacs loses/gains focus
  (add-hook 'focus-in-hook  #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-out-hook #'nlinum-hl-flush-all-windows)
  ;; ...or switches windows
  (advice-add #'select-window :before #'nlinum-hl-do-select-window-flush)
  (advice-add #'select-window :after  #'nlinum-hl-do-select-window-flush)
  ;; after X amount of idle time
  (run-with-idle-timer 5 t #'nlinum-hl-flush-window)
  (run-with-idle-timer 30 t #'nlinum-hl-flush-all-windows)
  ;; With `markdown-fontify-code-blocks-natively' enabled in `markdown-mode',
  ;; line numbers tend to vanish next to code blocks.
  (advice-add #'markdown-fontify-code-block-natively
              :after #'nlinum-hl-do-markdown-fontify-region))

;; highlight matched parentheses
(font-lock-add-keywords 'lisp-mode '("[(]" "[)]"))


;; rainbow-mode: display with background color of value of colors, e.g. Red, #7F017F
(use-package rainbow-mode
  :init
  (dolist (mode-hook '(emacs-lisp-mode-hook
                       css-mode-hook))
    (add-hook mode-hook 'rainbow-mode)))

;; rainbow-delimiters: display different color in different level of brackets
(use-package rainbow-delimiters
  :init
  (dolist (mode-hook '(lisp-mode-hook
                       slime-repl-mode-hook
                       clojure-mode-hook
                       cider-repl-mode-hook
                       emacs-lisp-mode-hook
                       json-mode-hook
                       js-mode-hook
                       c++-mode-hook))
    (add-hook mode-hook 'rainbow-delimiters-mode))
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "purple1")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "Orange")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "Green")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "DodgerBlue1")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "Cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "Magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "Brown")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "Red")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#009300"))

(require 'parinfer)
(use-package parinfer
  :init
  (setq parinfer-extensions '(defaults pretty-parens smart-tab smart-yank))
  (add-hook 'clojure-mode-hook     #'parinfer-mode)
  (add-hook 'emacs-lisp-mode-hook  #'parinfer-mode)
  (add-hook 'common-lisp-mode-hook #'parinfer-mode)
  (add-hook 'lisp-mode-hook        #'parinfer-mode)
  :bind (("C-S-p" . parinfer-toggle-mode)))

;; auto-highlight-symbol(ahs, highlight and edit same symbol like Eclipse)
(use-package auto-highlight-symbol
  :commands (global-auto-highlight-symbol-mode auto-highlight-symbol-mode)
  :bind (("C-x a h" . auto-highlight-symbol-mode)
         :map
         auto-highlight-symbol-mode-map
         ("M--"   . ahs-back-to-start)
         ("A-C-e" . ahs-edit-mode)
         ("M-b"   . ahs-backward)
         ("M-f"   . ahs-forward))
  :config
  (add-to-list 'ahs-modes 'lisp-mode)
  (add-to-list 'ahs-modes 'clojure-mode))



;; highlight changes
(use-package hilit-chg
  :commands (global-highlight-changes-mode)
  :init
  ;; not highlight changes by default, use command highlight-changes-visible-mode to enable
  (setq highlight-changes-visibility-initial-state nil)
  :bind (("A-M-p" . highlight-changes-previous-change)
         ("A-M-n" . highlight-changes-next-change)
         ("A-M-h" . highlight-changes-visible-mode)
         ("A-M-m" . highlight-changes-remove-highlight))
  :config
  (global-highlight-changes-mode 1)
  (set-face-foreground  'highlight-changes         nil)
  (set-face-background  'highlight-changes         "#D9FCD8") ;; green
  (set-face-foreground  'highlight-changes-delete  nil)
  (set-face-background  'highlight-changes-delete  "#FFD9D0") ;; pink
  (set-face-underline-p 'highlight-changes-delete  nil))

;; Emacs shell colorization
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; Emacs eshell colorization
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)
(setenv "PAGER" "/bin/cat")


(provide 'init-highlight)
