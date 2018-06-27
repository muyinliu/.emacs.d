;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; for benchmark
(setq emacs-load-start-time (current-time))

(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))

;; (setq user-emacs-directory "~/.emacs.d/")

(require 'init-benchmarking) ;; Measure startup time

(setq *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(let ((file-name-handler-alist nil))
  ;; (require 'init-modeline)
  (require 'init-compat)
  (require 'init-utils)
  (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
  ;; Calls (package-initialize)
  (require 'init-elpa)      ;; Machinery for installing required packages
                                        ; (require 'init-exec-path) ;; Set up $PATH

  ;;----------------------------------------------------------------------------
  ;; Allow users to provide an optional "init-preload-local.el"
  ;;----------------------------------------------------------------------------
  (require 'init-preload-local nil t)

  ;;----------------------------------------------------------------------------
  ;; Load configs for specific features and modes
  ;;----------------------------------------------------------------------------
  (require 'use-package)
  (require 'init-fix)           ;; startup-screen, bell and other things
  (require 'init-charset)       ;; coding-system charset
  (require 'init-editing-utils) ;; 150ms
  (require 'init-buffer)        ;;  10ms
  (require 'init-auto-complete) ;; 
  (require 'init-slime)         ;; 200ms ;; for Common Lisp
  (require 'init-cider)         ;; for Clojure
  (require 'init-highlight)     ;;  40ms
  (require 'init-fonts)         ;; Emoji font
  (require 'init-helm)          ;; 600ms
  (require 'init-org-mode)      ;; 400ms
  (require 'init-markdown)
  (require 'init-unicode-graph-mode))



;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
                                        ; (require 'server)
                                        ; (unless (server-running-p)
                                        ;   (server-start))


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales nil t)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(put 'downcase-region 'disabled nil)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfs--current-profile-name "same-width" t)
 '(cfs--fontsize-steps (quote (4 4 4)) t)
 '(package-selected-packages (quote (parinfer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Local Variables:
;; coding: utf-8-emacs
;; End:

