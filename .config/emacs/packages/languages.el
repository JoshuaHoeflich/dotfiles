(use-package olivetti)
(use-package markdown-mode
  :config (add-hook 'markdown-mode-hook 'olivetti-mode))
(use-package sly
  :mode "\\.lisp\\'")
(use-package racket-mode
  :mode "\\.rkt\\'")
