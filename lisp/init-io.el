(use-package io-mode)

(use-package io-mode-inf
  :bind (:map
         io-mode-inf-map
         ("C-c C-r" . io-eval-region)
         ("C-M-x" . io-eval-region)))

(provide 'init-io)
