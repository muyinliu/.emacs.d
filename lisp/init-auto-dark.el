(use-package auto-dark
  :init
  (setq auto-dark-allow-osascript t)
  (setq auto-dark-dark-theme 'deeper-blue)
  (when (aquamacs-p)
    (setq auto-dark-light-theme 'aquamacs-autoface-frame-look))
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (set-background-color "#181A26")))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-background-color "#FFFFFF")))
  :config (auto-dark-mode t))

(provide 'init-auto-dark)
