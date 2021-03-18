;;; -*- lexical-binding: t -*-

(defun jlib/path-join (root &rest dirs)
  "Join ROOT with DIRS in an OS-independent way."
  (let ((res root))
    (dolist (el dirs res)
      (setq res (expand-file-name el res)))))

(load (jlib/path-join user-emacs-directory "init" "defaults.el"))
(load (jlib/path-join user-emacs-directory "init" "fira-code.el"))
(load (jlib/path-join user-emacs-directory "init" "bootstrap.el"))
(load (jlib/path-join user-emacs-directory "init" "base-packages.el"))
(load (jlib/path-join user-emacs-directory "init" "theme.el"))
(load (jlib/path-join user-emacs-directory "init" "lisp.el"))
