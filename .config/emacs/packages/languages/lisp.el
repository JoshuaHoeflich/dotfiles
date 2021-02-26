(use-package racket-mode
  :mode "\\.rkt\\'")

(use-package clojure-mode)
(use-package cider)
(put 'cider-clojure-cli-aliases 'safe-local-variable #'stringp)
(put 'cider-default-cljs-repl 'safe-local-variable #'stringp)
(put 'cider-shadow-default-options 'safe-local-variable #'stringp)
(use-package rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'sly-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)

(defun jlib/load-lisp-configs ()
  "Load lisp configuration files specific to the projects I am hacking on."
  (let* ((cur-proj (jlib/get-current-project))
         (configs (list
                   (jlib/path-join cur-proj "resources" "emacs" "repl.el")
                   (jlib/path-join cur-proj "dev" "replwm.el"))))
    (dolist (config configs)
      (when (file-exists-p config)
        (load config)))))

(jlib/load-lisp-configs)

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

(add-hook 'sly-db-hook 'sly-db-quit)
