(require 'cnfonts)
(use-package cnfonts
  :init
  ;; same width of both Chinese and English,
  ;;   width of single Chinese character equal to 2 English characters
  (setq cnfonts-profiles '("default" "same-width" "other"))
  ;; modified cfs config file path
  (setq cnfonts-profiles-directory
        (expand-file-name "cnfonts-config/" user-emacs-directory))
  (defun toggle-chinese-engligh-same-width-fonts ()
    (interactive)
    (let* ((prev-profile-name (cnfonts--get-current-profile t))
           (profile-name (if (string-equal "default" prev-profile-name)
                             "same-width"
                           "default")))
      (cnfonts--select-profile profile-name)
      (message "cnfonts switch from %s to %s" prev-profile-name profile-name)))
  ;; Emoji font(support show Emoji in Emacs)
  (defun add-emoji-font (fontsizes-list)
    (when (and *is-a-mac* (fboundp 'set-fontset-font))
      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
      (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)))
  (add-hook 'cnfonts-set-font-finish-hook 'add-emoji-font)
  :bind (("C-S-f" . toggle-chinese-engligh-same-width-fonts))
  :config
  (cnfonts-enable)
  (define-key (current-global-map) [remap zoom-font] 'cnfonts-increase-fontsize)
  (define-key (current-global-map) [remap zoom-font-out] 'cnfonts-decrease-fontsize))


(provide 'init-fonts)
