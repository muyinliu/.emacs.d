;; Set load path
(eval-when-compile (require 'cl))
(if (fboundp 'normal-top-level-add-to-load-path)
    (let* ((my-lisp-dir (expand-file-name "site-lisp/" user-emacs-directory))
           (default-directory my-lisp-dir))
      (progn
        (setq load-path
              (append
               (loop for dir in (directory-files my-lisp-dir)
                     unless (string-match "^\\." dir)
                     collecting (expand-file-name dir))
               load-path)))))

(provide 'init-site-lisp)
