(use-package racket-mode
  :mode "\\.rkt\\'")

(use-package clojure-mode)
(use-package cider)
(use-package rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'sly-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)

(use-package sly)
(defun jlib/lisp-mode-hook ()
  "Hook for Common LISP files."
  (interactive)
  (rainbow-delimiters-mode)
  (sly))
(add-hook 'lisp-mode-hook #'jlib/lisp-mode-hook)
