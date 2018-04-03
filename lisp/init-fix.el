;; disable startup message
(setq inhibit-startup-screen t)

;; disable bell when TAB
(setq visible-bell t)

;; use y/n to replace yes/no answer
(fset 'yes-or-no-p 'y-or-n-p)

;; disable temp files
(setq-default make-backup-files nil)

;; Disabled `Options have changed — save them? (y or n)` on Aquamacs
(when (boundp 'aquamacs-save-options-on-quit)
  (custom-set-variables '(aquamacs-save-options-on-quit nil)))

;; disable toolbar of GUI
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; make scroll slower
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)


(provide 'init-fix)
