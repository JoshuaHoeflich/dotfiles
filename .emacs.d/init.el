;;; package --- Summary:

;;; Code:
(setq gc-cons-threshold 100000000)
(let ((file-name-handler-alist nil)
      (startup-files (concat (file-name-directory user-init-file) "startup")))
  (dolist (file (directory-files startup-files t "^\[[:digit:][:digit:]\].*el\$" nil))
    (load file)))

;;; Commentary:
;;; See https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;;; for the inspiration of this file.

(provide 'init)
;;; init.el ends here
