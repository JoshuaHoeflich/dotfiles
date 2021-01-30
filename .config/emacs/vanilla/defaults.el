;;; -*- lexical-binding: t -*-

(defun jlib/get-current-project ()
  "Get my current project."
  (with-temp-buffer
    (insert-file-contents
     (jlib/path-join
      (getenv "HOME") ".config" "current_project"))
    (buffer-string)))

(setq 
 use-dialog-box nil
 show-paren-delay 0
 initial-buffer-choice (jlib/get-current-project)
 confirm-kill-processes nil
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 create-lockfiles 'nil
 inferior-lisp-program "sbcl"
 web-mode-auto-close-style 2
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2)

(setq-default
 indent-tabs-mode nil
 mode-line-format '(" %b | %l:%C ")
 tab-width 4)

(electric-pair-mode 1)
(show-paren-mode 1)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
