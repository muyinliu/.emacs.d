(use-package auto-dark
  :init
  (setq auto-dark-allow-osascript t)
  (setq auto-dark-dark-theme 'deeper-blue)
  (when (aquamacs-p)
    (setq auto-dark-light-theme 'aquamacs-autoface-frame-look))
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (let ((class '((class color) (min-colors 89)))
                      (background-color (if (console-p)
                                            "black"
                                          "#181A26")))
                  (custom-theme-set-faces
                   'deeper-blue
                   `(default ((,class (:background ,background-color :foreground "gray80"))))))))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-background-color "#FFFFFF")))
  :config (auto-dark-mode t))

(provide 'init-auto-dark)
