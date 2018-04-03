
(require 'package)

;; MELPA(package manager, 添加之后就可以直接 M-x package-install 来安装扩展)
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