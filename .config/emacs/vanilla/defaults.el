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
 cider-repl-display-help-banner nil
 web-mode-auto-close-style 2
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc)
 company-idle-delay nil
 kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions)
 )

(setq-default
 indent-tabs-mode nil
 mode-line-format '(" %b | %l:%C ")
 tab-width 4)

(put 'cider-clojure-cli-aliases 'safe-local-variable #'stringp)
(put 'cider-default-cljs-repl 'safe-local-variable #'stringp)
(put 'cider-shadow-default-options 'safe-local-variable #'stringp)

(let ((repl-config (jlib/path-join (jlib/get-current-project) "resources" "emacs" "repl.el")))
  (when (file-exists-p repl-config)
    (load repl-config)))

(global-auto-revert-mode)
(electric-pair-mode 1)
(show-paren-mode 1)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
