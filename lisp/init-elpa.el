
(require 'package)

;; MELPA: package manager, use M-x package-install to install packages
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives 
               '("gnu" . "http://elpa.gnu.org/packages/") t))

;;; Fire up package.el
(setq package-enable-at-startup nil)
(package-initialize)


(provide 'init-elpa)
