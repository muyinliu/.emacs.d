(require 'imenu-anywhere)

;; helm(Emacs incremental completion and selection narrowing framework)
(use-package helm
  :init
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (set-face-foreground 'helm-selection "Black")))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-face-foreground 'helm-selection "White"))))
(use-package helm-command
  :config (helm-mode 1))
(use-package helm-imenu
  :init
  (setq helm-imenu-fuzzy-match t)
  :bind (("C-." . helm-imenu)
         ("C-," . helm-imenu-anywhere)
         ("C-/" . helm-imenu-in-all-buffers)))
(use-package helm-ring
  :bind (("C-S-j" . helm-all-mark-rings)))
(global-set-key (kbd "C-S-m") '(lambda () (interactive) (push-mark)))
(use-package helm-files)
(use-package helm-find)
(use-package helm-locate
  :init
  (setq helm-locate-command
        (case system-type
          ('gnu/linux "locate %s -e --regex %s")
          ('berkeley-unix "locate -i %s")
          ('windows-nt "es %s")
          ('darwin "mdfind -name %s %s")
          (t "locate %s")))
  :bind (("C-x M-f" . helm-locate)))
(use-package helm-for-files)

(setq-default helm-follow-mode-persistent t)
(global-set-key (kbd "C-S-o") 'helm-occur)
(setq helm-source-grep (helm-build-dummy-source "init_grep" :follow 1))
(add-hook 'helm-before-initialize-hook
          #'(lambda () (helm-attrset 'follow 1 helm-source-grep)))

(global-set-key (kbd "M-x") 'helm-M-x) ;; prefix argument fix: M-x slime M-- RET
(setq helm-M-x-fuzzy-match t) ;; 启用模糊匹配
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "C-h v") 'helm-apropos)
(setq helm-apropos-fuzzy-match t)
(global-set-key (kbd "C-x B") 'helm-browse-project)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; find file recursively by name(include sub dirs)
(global-set-key (kbd "C-x C-S-f") 'helm-find)
;; find file recursively by content(include sub dirs)
(global-set-key (kbd "C-x a g") 'helm-do-grep-ag)

(require 'helm-projectile)
(use-package helm-projectile
  :bind (;; switch project
         ("C-x p s" . helm-projectile-switch-project)
         ;; find file recursively by content(include sub dirs) in current project
         ("C-x p a g" . helm-projectile-ag)
         ;; find file recursively by filename(include sub dirs) in current project
         ("C-x p f" . helm-projectile-find-file))
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (projectile-mode))

(global-set-key (kbd "C-x f") 'helm-recentf) ;; recent open file
(setf recentf-max-saved-items 500)

(global-set-key (kbd "S-SPC") 'helm-toggle-visible-mark) ;; or use C-@


(provide 'init-helm)
