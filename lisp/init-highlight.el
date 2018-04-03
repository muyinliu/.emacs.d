;;;; highlight

(global-font-lock-mode t) ;; 开启语法高亮
(add-hook 'font-lock-mode-hook
          #'(lambda ()
              (set-face-foreground 'font-lock-comment-face "#009300")))

;; 高亮当前行
(use-package hl-line
  :config
  (global-hl-line-mode 1)
  (set-face-background hl-line-face (if (console-p)
                                        "#262626"
                                      "#E2E3E2")))

;; 行号
(use-package nlinum
  :bind (("M-A-l" . nlinum-mode)
         ("C-M-l" . nlinum-mode)
         ("C-x M-A-l" . global-nlinum-mode)
         ("C-x C-M-l" . global-nlinum-mode)))

;; 高亮匹配的括号
(font-lock-add-keywords 'lisp-mode '("[(]" "[)]"))


;; rainbow-mode(和颜色有关的值显示成以该颜色为底色)
(use-package rainbow-mode
  :init
  (dolist (mode-hook '(emacs-lisp-mode-hook
                       css-mode-hook))
    (add-hook mode-hook 'rainbow-mode)))

;; rainbow-delimiters(用不同的颜色来显示不同层次的括号)
(use-package rainbow-delimiters
  :init
  (dolist (mode-hook '(lisp-mode-hook
                       clojure-mode-hook
                       cider-repl-mode-hook
                       emacs-lisp-mode-hook
                       json-mode-hook))
    (add-hook mode-hook 'rainbow-delimiters-mode))
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#7F017F")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "Orange")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "Green")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "Blue")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "Cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "Magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "windowFrameColor")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "Red")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#009300"))

(require 'parinfer)
(use-package parinfer
  :init
  (setq parinfer-extensions '(defaults pretty-parens smart-tab))
  (add-hook 'clojure-mode-hook     #'parinfer-mode)
  (add-hook 'emacs-lisp-mode-hook  #'parinfer-mode)
  (add-hook 'common-lisp-mode-hook #'parinfer-mode)
  (add-hook 'lisp-mode-hook        #'parinfer-mode)
  :bind (("C-S-p" . parinfer-toggle-mode)))

;; 高亮同样的名称
;; auto-highlight-symbol(ahs, highlight and edit same symbol like Eclipse)
(use-package auto-highlight-symbol
  :commands (global-auto-highlight-symbol-mode)
  :bind (("C-x a h" . auto-highlight-symbol-mode)
         :map
         auto-highlight-symbol-mode-map
         ("M--"   . ahs-back-to-start)
         ("A-C-e" . ahs-edit-mode)
         ("M-b"   . ahs-backward)
         ("M-f"   . ahs-forward))
  :config
  (add-to-list 'ahs-modes 'lisp-mode)
  (add-to-list 'ahs-modes 'clojure-mode)
  (global-auto-highlight-symbol-mode t))



;; highlight changes(高亮被修改的内容, hilit-chg.el)
;; 默认启动高亮修改模式
(use-package hilit-chg
  :commands (global-highlight-changes-mode)
  :init
  ;; 默认不高亮显示修改（之后用 highlight-changes-visible-mode 高亮显示修改）
  (setq highlight-changes-visibility-initial-state nil)
  :bind (("A-M-p" . highlight-changes-previous-change)
         ("A-M-n" . highlight-changes-next-change)
         ("A-M-h" . highlight-changes-visible-mode)
         ("A-M-m" . highlight-changes-remove-highlight))
  :config
  (global-highlight-changes-mode 1)
  (set-face-foreground  'highlight-changes         nil)       ;; 不更改文字颜色
  (set-face-background  'highlight-changes         "#D9FCD8") ;; 绿色底色
  (set-face-foreground  'highlight-changes-delete  nil)       ;; 不更改文字颜色
  (set-face-background  'highlight-changes-delete  "#FFD9D0") ;; 粉红色底色
  (set-face-underline-p 'highlight-changes-delete  nil))       ;; 删除的部分不添加下划线

;; Emacs shell colorization
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; Emacs eshell colorization
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)
(setenv "PAGER" "/bin/cat")


(provide 'init-highlight)
