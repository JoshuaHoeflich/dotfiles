(use-package sly
  :mode "\\.lisp\\'")

(use-package racket-mode
  :mode "\\.rkt\\'")

(use-package clojure-mode)
(use-package cider)
(use-package rainbow-delimiters)

(defun jlib/lisp-mode-hook ()
  "Special hook for LISPy modes."
  (rainbow-delimiters-mode)
  (show-paren-mode t)
  (setq show-paren-delay 0))

(add-hook 'sly-mode-hook #'jlib/lisp-mode-hook)
(add-hook 'clojure-mode-hook #'jlib/lisp-mode-hook)
(add-hook 'racket-mode-hook #'jlib/lisp-mode-hook)
