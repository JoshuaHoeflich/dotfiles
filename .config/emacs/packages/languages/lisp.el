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

(defun jlib/sly-already-open-p ()
  "Check if sly is already open."
  (interactive)
  (seq-find (lambda (buf) (string-prefix-p "*sly-mrepl" (buffer-name buf)))
            (buffer-list)))

(defun jlib/load-lisp ()
  "When my current project has a current system.lisp, load it."
  (let ((system-path
         (jlib/path-join (jlib/get-current-project)
                         "src" "repl-wm" "system.lisp")))
    (when system-path
      (sly-load-file system-path))))

(add-hook 'sly-connected-hook 'jlib/load-lisp)

(defun jlib/boot-sly ()
  "Start and load SLY when it is appropriate to do so."
  (unless (jlib/sly-already-open-p)
    (sly)))

(defun jlib/lisp-mode-hook ()
  "Hook for Common LISP files."
  (interactive)
  (rainbow-delimiters-mode)
  (jlib/boot-sly))

(add-hook 'lisp-mode-hook #'jlib/lisp-mode-hook)
