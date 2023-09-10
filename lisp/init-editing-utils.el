;; Comment 
(global-set-key (kbd "M-'") 'comment-or-uncomment-region-or-line) ;; default: A-'
(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line) ;; Eclipse's hotkey


;;; Selection
;; Extension of selection(mark) Expand-region
(use-package expand-region
  :bind (("M-s s"   . er/mark-inside-pairs)   ;; s of M-s stands for "select"
         ("M-s M-s" . er/mark-outside-pairs)
         ("M-s q"   . er/mark-inside-quotes)
         ("M-s M-q" . er/mark-outside-quotes)
         ("M-s d"   . er/mark-defun)
         ("M-s M-c" . er/mark-method-call)
         ("M-s M-p" . er/mark-text-paragraph)
         ("M-s c"   . er/mark-comment)
         ("M-s v"   . er/mark-symbol)
         ("M-s M-v" . er/mark-symbol-with-prefix)
         ("M-s w"   . er/mark-word)))


;; multiple-cursors: multiple cursors
(use-package multiple-cursors
  :bind (("A-C-c"   . mc/edit-lines)
         ("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))


(defun kill-line-till-next-not-whitespace ()
  "delete from end of line to first visible character of next line"
  (interactive)
  (end-of-line)
  (kill-line)
  (delete-horizontal-space))
(global-set-key (kbd "C-S-k") 'kill-line-till-next-not-whitespace)

;; delete current line hotkey (Eclipse's hotkey)
(global-set-key (kbd "A-d") 'kill-whole-line)

;; move-lines: move current line up or down
(use-package move-lines
  :bind (("C-c i"    . move-lines-up)
         ("M-<up>"   . move-lines-up)
         ("C-c k"    . move-lines-down)
         ("M-<down>" . move-lines-down)))

;; duplicate-thing(duplicate line or duplicate selected range)
(use-package duplicate-thing
  :init
  (defun duplicate-thing-and-move-cursor-to-next-line ()
    "Duplicate current line to next line and move to next line."
    (interactive)
    (duplicate-thing 1)
    (next-line))
  :bind (("M-A-<down>" . duplicate-thing-and-move-cursor-to-next-line)
         ("M-c"        . duplicate-thing))) ;; duplicate select thing/current line 

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))
(global-set-key (kbd "C-S-l") 'select-current-line)


(defun newline-without-break-of-line ()
  "1. move to end of the line.
2. open new line and move to new line"
  (interactive)
  (end-of-line)
  (open-line 1)
  (right-char))
(global-set-key (kbd "C-RET") 'newline-without-break-of-line)


;; input 4 space when use Tab on keyboard
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; smart indent
;; (electric-indent-mode t)
;; Note: only common-lisp-mode use common-lisp-indent-function
(add-hook 'common-lisp-mode-hook
          (lambda ()
            (setq lisp-indent-function 'common-lisp-indent-function)))
(add-hook 'javascript-mode-hook
          (lambda ()
            (setq js-indent-level 2)))


;; find and replace
;; fix warning when opening Aquamacs 3.3dev(Emacs 25.0.5+) for visual-regexp:
;;   Warning (bytecomp): reference to free variable ‘regexp-string’
;;   Warning (bytecomp): reference to free variable ‘replace-string’
(defvar replace-string nil)
(defvar regexp-string nil)
(use-package visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
         ("M-A-f" . vr/query-replace)
         ("C-c q" . vr/query-replace)
         ;; if you use multiple-cursors, this is for you:
         ("C-c m" . vr/mc-mark)
         ;; use visual-regexp-steroids's isearch instead of the built-in regexp isearch
         ("C-r"   . vr/isearch-backward)  ;; C-M-r
         ("C-s"   . vr/isearch-forward))  ;; C-M-s
  :config
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (set-face-foreground 'vr/match-0 "Black")))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-face-foreground 'vr/match-0 "White")))
  ;; do not ignore case when paste to search input field(default value 'not-yanks)
  (setf search-upper-case t))

(global-set-key (kbd "C-x r v") 'revert-buffer)

;; smartparens: auto complete parentheses
(use-package smartparens-config
  :defer 2
  :config
  (add-hook 'auto-dark-dark-mode-hook
            #'(lambda ()
                (set-face-foreground 'sp-pair-overlay-face "#7F017F")))
  (add-hook 'auto-dark-light-mode-hook
            #'(lambda ()
                (set-face-foreground 'sp-pair-overlay-face "DarkBlue")))
  ;; fix CSS indent after input {}, BUT NOT A PERFECT SOLUTION
  (sp-local-pair 'css-mode "{" nil :post-handlers '(:add "
    |
"))
  (add-hook 'lisp-mode-hook       'smartparens-mode)
  (add-hook 'clojure-mode-hook    'smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (add-hook 'js-mode-hook         'smartparens-mode)
  (add-hook 'css-mode-hook        'smartparens-mode)
  (add-hook 'web-mode-hook        'smartparens-mode)
  :bind (("C-A-n"    . sp-next-sexp)
         ("C-A-p"    . sp-previous-sexp)
         ("C-A-a"    . sp-beginning-of-sexp)
         ("C-A-e"    . sp-end-of-sexp)
         ("C-S-M-k"  . sp-backward-kill-sexp)
         ("C-x j"    . sp-forward-slurp-sexp)
         ("C-x l"    . sp-backward-slurp-sexp)
         ;; spit first sexp inside (
         ("C-x J"    . sp-backward-barf-sexp)
         ;; spit last sexp inside (
         ("C-x L"    . sp-forward-barf-sexp)
         ;; eat sexp before outer ( into current cursor
         ("C-x M-l"  . sp-absorb-sexp)
         ;; spit sexp before current cursor out before (, not include first sexp
         ("C-x M-j"  . sp-emit-sexp)
         ("C-x ["    . sp-rewrap-sexp) ;; change bracket () or [], e.g. C-x [ [ switch to []
         ("C-x ("    . sp-unwrap-sexp) ;; kill bracket near by
         ("C-x )"    . sp-backward-unwrap-sexp)
         ("C-x ]"    . sp-splice-sexp) ;; kill outer bracket
         ("C-x 6"    . sp-convolute-sexp) ;; switch outer 2 sexp
         ("C-x 7"    . sp-splice-sexp-killing-backward);; kill outer left sexp
         ("C-x 8"    . sp-raise-sexp)                 ;; kill outer sexp
         ("C-x 9"    . sp-splice-sexp-killing-forward);; kill outer right sexp
         ("C-c M-q"  . sp-indent-defun)
         ("RET"      . newline-and-indent)))


;; Hyperspec(common lisp documentation)
(global-set-key (kbd "C-c d") 'slime-hyperspec-lookup)
(setq common-lisp-hyperspec-root "/usr/local/share/doc/HyperSpec/")


;; browse-url-dwim(use Safari as Emacs's URL browser, only works in Aquamacs)
(use-package browse-url-dwim
  :commands (browse-url-dwim-mode)
  :config (browse-url-dwim-mode 1)
  :init
  (setq browse-url-dwim-always-confirm-extraction nil)
  :bind (("A-b" . browse-url-dwim)     ;; Command + b to open URL in Safari
         ("C-c b" . browse-url-dwim)))


;; show current function's name in status bar
(which-function-mode t)


(provide 'init-editing-utils)
