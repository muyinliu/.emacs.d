(defun cider-call-defun-in-repl (&optional arg)
  "Insert a call to the toplevel form defined around point into the REPL."
  (interactive "P")
  (let* ((string-list (split-string (cider-defun-at-point)))
         (define-name (car string-list))
         (defun-p (equal "(defn" define-name))
         (fn-name (cadr string-list))
         (form (if defun-p
                   (concat "(" fn-name " )")
                   (concat " " fn-name))))
    (cider-repl-set-ns (cider-current-ns))
    (cider-insert-in-repl form nil)
    (goto-char (+ cider-repl-input-start-mark
                  (if defun-p
                      (1- (length form))
                      0)))))

(use-package clojure-mode
  :bind (:map clojure-mode-map
         ("C-c C-y" . cider-call-defun-in-repl))
  :mode
  ("\\.clj\\'" . clojure-mode)
  ("\\.edn\\'" . clojure-mode)
  :config
  (add-hook 'clojure-mode-hook 'cider-mode)
  ;; color for Clojure keyword
  (set-face-foreground 'clojure-keyword-face "#BB00BB") ;; magenta
  ;; color for Clojure package name, Java Class
  (set-face-foreground 'font-lock-type-face "#E76007")) ;; orange

(use-package cider
  :commands (cider-mode cider-connect cider-jack-in)
  :config
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  :bind (:map cider-repl-mode-map
         ("C-c M-o" . cider-repl-clear-buffer)
         ("A-k" . cider-repl-clear-buffer)
         :map cider-mode-map
         ("C-M-x" . cider-eval-defun-at-point)))


(provide 'init-cider)
