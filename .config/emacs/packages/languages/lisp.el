(use-package sly
  :mode "\\.lisp\\'")

(use-package racket-mode
  :mode "\\.rkt\\'")

(use-package clojure-mode)
(use-package cider)
(use-package rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'sly-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
