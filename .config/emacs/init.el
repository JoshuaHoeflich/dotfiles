;;; -*- lexical-binding: t -*-

(require 'dired-x)

(defun jlib/path-join (root &rest dirs)
  "Join ROOT with DIRS in an OS-independent way."
  (let ((res root))
    (dolist (el dirs res)
     (setq res (expand-file-name el res)))))

(load (jlib/path-join user-emacs-directory "src" "fira-code.el"))
(load (jlib/path-join user-emacs-directory "src" "defaults.el"))
(load (jlib/path-join user-emacs-directory "src" "keybindings.el"))
(load (jlib/path-join user-emacs-directory "src" "packages.el"))
(load (jlib/path-join user-emacs-directory "src" "alist.el"))
