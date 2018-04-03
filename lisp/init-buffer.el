;;;; buffer controls

;; make window larger
(global-set-key (kbd "M-A-=") 'enlarge-window)
;; make window smaller
(global-set-key (kbd "M-A-\-") 'shrink-window)

;; Tabbar(buffer/tab manager)
(require 'tabbar)
(tabbar-mode 1)
(global-set-key (kbd "C-<tab>")   'tabbar-forward)
(global-set-key (kbd "C-S-<tab>") 'tabbar-backward)
(global-set-key (kbd "C-x m")     'tabbar-move-current-buffer-to-new-frame)

;; swap buffers
(defun swap-buffer-window ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this)))
    (set-window-buffer other this-buffer)
    ;;close current tab
    (tabbar-close-tab)
    ;;swap cursor to new buffer
    (other-window 1)))
(global-set-key (kbd "C-x /") 'swap-buffer-window)

;; Buffer-Move
(use-package buffer-move
  :bind (("C-x <up>"    . buf-move-up)
         ("C-x <down>"  . buf-move-down)
         ("C-x <left>"  . buf-move-left)
         ("C-x <right>" . buf-move-right)))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))

;; nyan-mode(彩虹猫进度条)
(use-package nyan-mode
  :config (nyan-mode 1))


(provide 'init-buffer)
