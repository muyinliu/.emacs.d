;; org-mode

(use-package org
  :init
  (add-hook 'org-mode-hook #'(lambda ()
                               (linum-mode 0)
                               (setq truncate-lines nil)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append
    '((lisp . t)
      (python . t)
      (R . t)
      (ruby . t)
      (ditaa . t)
      (dot . t)
      (octave . t)
      (sqlite . t)
      (perl . t)
      (C . t))
    ;; Compatible with newer version v8.2.5+ of org-mode
    (if (require 'ob-shell nil 'noerror)
        '((shell . t))
      '((sh . t)))))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/task.org" "Tasks")
           "* TODO %?\n %i\n %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org") ;; 日记模板
           "* %?\nEntered on %U\n\n"))) ;; %U 是精确到分钟的时间， %i\n %a

  (global-hi-lock-mode 1) ;; 开启全局 hi-lock-mode
  ;; 避免每次开启 hi lock mode 时询问是否需要高亮指定表达式
  (setq hi-lock-file-patterns-policy #'(lambda (dummy) t))
  
  (defface unorder-list-lock-face '((t (:foreground "#FF0000"))) t)
  (defface order-list-lock-face '((t (:foreground "Blue"))) t)
  (defun list-highlight ()
    (interactive)
    (highlight-regexp "^\s*[-\\+\\*] " 'unorder-list-lock-face)
    (highlight-regexp "^\s*[0-9]+[\\)\\.] " 'order-list-lock-face))
  (add-hook 'org-mode-hook 'list-highlight)

  (set-face-attribute 'org-checkbox nil :foreground "#DD9E33")
  (set-face-attribute 'org-code     nil :bold t :foreground "#1200EF")
  (set-face-attribute 'org-verbatim nil :bold t :foreground "Blue")

  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "Red1" :bold t :box "#FF0000"))
          ("DONE" . (:foreground "ForestGreen" :bold t :box "ForestGreen"))
          ("CANCELED" . (:foreground "#5A5A5A" :bold t :strike-through "#5A5A5A"))))

  (defun children-done-parent-done (n-done n-todo)
    "Mark the parent task as done when all children are completed."
    (let ((org-log-done 'time) ;; log like this: CLOSED: [2016-04-11 Mon 19:55]
          (org-log-states 'time)) ; turn on logging
      (org-todo (if (zerop n-todo) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'children-done-parent-done)

  ;; NEXT
  (defun set-next-todo-state ()
    "When marking a todo to DONE, set the next TODO as NEXT.
Do not change habits, scheduled items or repeating todos."
    (when (equal org-state "DONE")
      (save-excursion
        (when (and (ignore-errors (outline-forward-same-level 1) t)
                   (equal (org-get-todo-state) "TODO"))
          (unless (or (org-is-habit-p)
                      (org-entry-get (point) "STYLE")
                      (org-entry-get (point) "LAST_REPEAT")
                      (org-get-scheduled-time (point)))
            (org-todo "NEXT"))))))
  
  ;; 不同状态的工作流
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@/!)")
          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))
  ;; C-c C-t 之后就会在下方弹出一个 buffer 来显示，接着按对应的快捷键就可以切换到对应的状态
  ;; | 用于分割「未完成」和「完成」的状态列表
  ;; 括号里面的第一个字符为快捷键，! 表示切换到该状态要记录时间戳， @ 表示切换到该状态要询问描述，当需要同时使用 !@，要写成 @/!
  
  (setq org-log-done 'time)
  :bind (("C-c c" . org-capture)))

;; Compatible with newer version 9+ of org-mode
(unless (boundp 'org-block-background)
  (defface org-block-background '((t ()))
    "Face used for the source block background."))

;; 用 Unicode 符号高亮显示 titles 标志
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; 用带圈的数字似乎比使用十二生肖 Emoji 更好一点
  (setq org-bullets-bullet-list '("①" "②" "③" "④" "⑤" "⑥" "⑦" "⑧" "⑨" "⑩"
                                  "⓫" "⓬"))
  :config
  (defface org-block-begin-line
    '((t (:foreground "#ABADAD" :background nil)))
    "Face used for the line delimiting the begin of source blocks.")
  (set-face-attribute 'org-block-background nil :background "#FFFFEA")
  (defface org-block-end-line
    '((t (:foreground "#ABADAD" :background nil)))
    "Face used for the line delimiting the end of source blocks."))


;; #+BEGIN_SRC 代码块中的语法高亮
(setq org-src-fontify-natively t)


(provide 'init-org-mode)
