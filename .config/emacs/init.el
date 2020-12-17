;;; -*- lexical-binding: t -*-

;; See https://stackoverflow.com/questions/3964715/what-is-the-correct-way-to-join-multiple-path-components-into-a-single-complete
(defun jlib/path-join (root &rest dirs)
  "Join ROOT with DIRS in an OS-independent way."
  (if (not dirs) root
    (apply
     'jlib/path-join
     (expand-file-name (car dirs) root) (cdr dirs))))

(load (jlib/path-join user-emacs-directory "src" "fira-code.el"))

(load (jlib/path-join user-emacs-directory "src" "jlib.el"))

(load (jlib/path-join user-emacs-directory "src" "window.el"))

(load (jlib/path-join user-emacs-directory "src" "packages.el"))
