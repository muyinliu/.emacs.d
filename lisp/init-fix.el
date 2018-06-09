;; disable startup message
(setq inhibit-startup-screen t)

;; disable bell when TAB
(setq visible-bell t)

;; use y/n to replace yes/no answer
(fset 'yes-or-no-p 'y-or-n-p)

;; disable backup~ or backup~9~ files
(setq make-backup-files nil)

;; config #autosave# files
;;   note: .#autosave only tells other emacs which emacs own file `autosave`
;;   note: use recover-file to restore #autosave# files, will use ~/.emacs.d/auto-save-list/.saves-<N>-localhost~ to find recover files
;;   note:                               
(setq auto-save-interval 60) ;; default: 300 keystrokes
(setq auto-save-timeout 20)  ;; default: 30s
(setq auto-save-file-directory
      (expand-file-name "auto-save-list/" user-emacs-directory))
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-file-directory t)))
(setq auto-save-list-file-prefix
      auto-save-file-directory)

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
