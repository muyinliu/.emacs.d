;; Set charset(encoding)
(set-language-environment "utf-8")
(set-language-environment-coding-systems "utf-8")

(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8) 

(setq ansi-color-for-comint-mode t)
(setq-default pathname-coding-system 'utf-8) 
(setq default-process-coding-system '(utf-8 . utf-8)) 
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8) 

(modify-coding-system-alist 'process "*" 'utf-8) 
(prefer-coding-system 'utf-8)

(setenv "LANG" "en_US.UTF-8")

(provide 'init-charset)
