(use-package racket-mode
  :mode "\\.rkt\\'")

(use-package rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)

(use-package sly)

(defun jlib/sly-already-open-p ()
  "Check if sly is already open."
  (interactive)
  (seq-find (lambda (buf) (string-prefix-p "*sly-mrepl" (buffer-name buf)))
            (buffer-list)))

(defun jlib/lisp-mode-hook ()
  "Hook for Common LISP files."
  (interactive)
  (rainbow-delimiters-mode)
  (unless (jlib/sly-already-open-p)
    (sly)))

(add-hook 'lisp-mode-hook #'jlib/lisp-mode-hook)

(setq inferior-lisp-program "sbcl")

(defun jlib/load-lisp-system ()
  "Load the files which define our project into Sly."
  (interactive)
  (let* ((current-project (jlib/get-current-project))
         (current-lisp (concat current-project "system.lisp")))
    (when (file-exists-p current-lisp)
      (sly-eval `(common-lisp:load ,current-lisp)))))

(add-hook 'sly-connected-hook 'jlib/load-lisp-system)

(use-package clojure-mode)
(use-package cider)

