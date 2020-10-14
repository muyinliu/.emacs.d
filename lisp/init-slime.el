(defun slime-startup-message-x ()
  (interactive)
  (when (and (boundp 'slime-header-line-p)
             slime-header-line-p)
    (setq header-line-format 
          (format "%s  Port: %s  Pid: %s"
                  (slime-lisp-implementation-type)
                  (slime-connection-port (slime-connection))
                  (slime-pid))))
  (when (zerop (buffer-size))
    (let ((welcome (concat "; SLIME " (or (and (fboundp 'slime-changelog-date)
                                               (slime-changelog-date))
                                          (and (boundp 'slime-version)
                                               slime-version)
                                          "- ChangeLog file not found")
                           (format "; %s:%s"
                                   slime-lisp-host
                                   (slime-connection-port (slime-connection)))
                           (format ", instance: %s" (slime-machine-instance)))))
      (if slime-startup-animation
          (animate-string welcome 0 0) 
        (insert welcome)))))


(unless (boundp 'quicklisp-base)
  (setq quicklisp-base "~/quicklisp/"))

(unless (boundp 'quicklisp-dist)
  (setq quicklisp-dist "quicklisp"))

(defun file-contents (file)
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(defun quicklisp-system-directory (system)
  (let ((location-file (concat quicklisp-base
                               "dists/"
                               quicklisp-dist
                               "/installed/systems/"
                               system
                               ".txt")))
    (when (file-exists-p location-file)
      (let ((relative (file-contents location-file)))
        (file-name-directory (concat quicklisp-base relative))))))

(unless (boundp 'quicklisp-slime-directory)
  (setq quicklisp-slime-directory
        (quicklisp-system-directory "swank")))

(use-package slime
  :load-path quicklisp-slime-directory
  :commands (slime slime-connect)
  :init
  ;; Use `M-- M-x slime` to choose slime-lisp-implementations before slime run
  (setq slime-lisp-implementations
        '((sbcl ("sbcl" "--dynamic-space-size" "2048") :coding-system utf-8-unix)
          (ccl ("ccl"))
          (ecl ("ecl"))
          (cmucl ("lisp" "-quiet"))
          (clisp ("clisp"))
          (roswell ("ros" "dynamic-space-size=2048" "-Q" "-l" "~/.sbclrc" "run"))))
  (setq slime-default-lisp 'sbcl)
  (setf slime-startup-animation nil)
  (setq slime-repl-banner-function 'slime-startup-message-x)
  :config (slime-setup '(slime-fancy slime-repl-ansi-color slime-company))
  :bind (:map
         lisp-mode-map
         ("C-c M-k" . slime-compile-file)
         ("C-c C-a" . slime-list-callers)
         ("C-c C-e" . slime-macroexpand-1)
         :map
         slime-repl-mode-map
         ("A-k" . slime-repl-clear-buffer)))


(provide 'init-slime)
