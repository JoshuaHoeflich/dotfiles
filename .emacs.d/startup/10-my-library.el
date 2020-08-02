;;; package --- Summary

;;; Code:
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c j") 'next-buffer)
(global-set-key (kbd "C-c k") 'previous-buffer)
(global-set-key (kbd "C-c C-g") 'delete-window)

(defun my/extension-of-buffer ()
  "Get the extension of the current buffer or an empty string."
  (file-name-extension (or buffer-file-name "")))

(defmacro my/thunk (func)
  "Create a lambda to run FUNC."
  `(lambda () "A thunk which will run FUNC." ,func))

(defmacro my/thunk-interactive (func)
  "Create a lambda to run FUNC."
  `(lambda () "A thunk which will run FUNC." (interactive) ,func))

(defun my/open-or-run (buffer command-func)
  "Attempt to open BUFFER; if no such buffer exists, run COMMAND-FUNC."
  (let ((buffer-to-find (get-buffer buffer)))
    (if (buffer-live-p buffer-to-find)
	(switch-to-buffer buffer-to-find)
      (funcall command-func))))

(defun my/open-eww ()
  "Switch to the open eww buffer or open a new one pointed at duckduckgo."
  (interactive)
  (my/open-or-run "*eww*" (my/thunk-interactive (eww "https://duckduckgo.com"))))

(global-set-key (kbd "C-c b") 'my/open-eww)

(defun my/eval-buffer-elisp ()
  "Evaluate the elisp in the buffer and message success."
  (eval-buffer)
  (message "Buffer evaluated successfully!"))

(defun my/run ()
  "Figure out how to run/compile the current project in the buffer."
  (interactive)
  (pcase (my/extension-of-buffer)
    ("el" (my/eval-buffer-elisp))
    ("js" (message "Write me!"))
    ("jsx" (message "Write me too!"))))

(global-set-key (kbd "C-c c") 'my/run)

(defun my/indent-buffer ()
  "Auto indent the buffer for me."
  (interactive)
  (indent-region (point-min) (point-max)))

(global-set-key (kbd "C-c i") 'my/indent-buffer)

(global-set-key (kbd "C-c g h") (my/thunk-interactive (dired "~")))
(global-set-key
 (kbd "C-c g p")
 (my/thunk-interactive
  (dired
   (with-temp-buffer (insert-file-contents "~/.config/current_project") (buffer-string)))))

;;; Commentary:

(provide '02-my-library)
;;; 02-my-library.el ends here
