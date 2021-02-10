;;; -*- lexical-binding: t -*-
(require 'dired-x)

(defun jlib/path-join (root &rest dirs)
  "Join ROOT with DIRS in an OS-independent way."
  (let ((res root))
    (dolist (el dirs res)
      (setq res (expand-file-name el res)))))

(load (jlib/path-join user-emacs-directory "vanilla" "defaults.el"))
(load (jlib/path-join user-emacs-directory "vanilla" "keybindings.el"))
(load (jlib/path-join user-emacs-directory "vanilla" "alist.el"))

(load (jlib/path-join user-emacs-directory "packages" "bootstrap.el"))
(load (jlib/path-join user-emacs-directory "packages" "base.el"))
(load (jlib/path-join user-emacs-directory "packages" "theme.el"))
(load (jlib/path-join user-emacs-directory "packages" "languages" "markdown.el"))
(load (jlib/path-join user-emacs-directory "packages" "languages" "lisp.el"))
(load (jlib/path-join user-emacs-directory "packages" "languages" "js.el"))
(load (jlib/path-join user-emacs-directory "packages" "languages" "go.el"))
(load (jlib/path-join user-emacs-directory "packages" "languages" "terraform.el"))
