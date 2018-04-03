(require 'cnfonts)
(use-package cnfonts
  :init
  ;; 调整字体使得实现「中英等宽」（一个中文字符的宽度 == 2个英文字符的宽度）
  (setq cnfonts-profiles '("default" "same-width" "other"))
  ;; 修改 cfs 配置文件路径
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
