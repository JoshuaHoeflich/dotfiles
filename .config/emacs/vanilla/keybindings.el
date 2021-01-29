
;;; -*- lexical-binding: t -*-

(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)
(global-set-key (kbd "C-S-w") 'kill-ring-save)
(global-set-key (kbd "C-S-e") 'forward-sentence)
(global-set-key (kbd "C-S-a") 'backward-sentence)
(global-set-key (kbd "C-S-g") 'goto-line)
(global-set-key (kbd "C-S-x") 'execute-extended-command)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-z") 'undo)

(defun jlib/lisp-indent ()
  "Indent the buffer in a LISP-y way for me."
  (indent-region (point-min) (point-max)))

(defun jlib/indent-buffer ()
  "Automatically indent the buffer for me."
  (interactive)
  (pcase (file-name-extension (or buffer-file-name ""))
    ("el" (indent-region (point-min) (point-max)))
    (_ nil)))

(global-set-key (kbd "C-c p") 'jlib/indent-buffer)

(defun jlib/eval-emacs-lisp ()
  "Evaluate the Emacs LISP in the current buffer."
  (interactive)
  (eval-buffer)
  (message "Emacs Lisp evaluated successfully!"))

(defun jlib/run-buffer ()
  "Automatically run the current buffer for me."
  (interactive)
  (pcase (file-name-extension (or buffer-file-name ""))
    ("el" (jlib/eval-emacs-lisp))
    (_ nil)))

(global-set-key (kbd "C-c C-c") 'jlib/run-buffer)

(defvar *jlib/emacs-terminal*
  (jlib/path-join "/" "usr" "bin" "zsh"))

(defmacro jlib/def-key-fn (key &rest fn)
  "Takes a key binding and assigns it to an anonymous function."
  (let ((local-fn-name (gensym)))
    `(let ((,local-fn-name
            (lambda ()
              (interactive)
              ,@fn)))
       (global-set-key (kbd ,key) ,local-fn-name))))

(jlib/def-key-fn
 "C-0"
 (set-face-attribute 'default nil :height 180))

(jlib/def-key-fn
 "C-="
 (set-face-attribute
  'default nil
  :height
  (+ (face-attribute 'default :height) 20)))

(jlib/def-key-fn
 "C--"
 (set-face-attribute
  'default nil
  :height (- (face-attribute 'default :height) 20)))

(defun jlib/get-or-create-terminal ()
  "Get a new terminal or go to the buffer containing one."
  (interactive)
  (let ((buffer-to-find (get-buffer "*ansi-term*")))
    (if (buffer-live-p buffer-to-find)
	    (switch-to-buffer buffer-to-find)
      (ansi-term *jlib/emacs-terminal*))))

(global-set-key (kbd "C-c t t") 'jlib/get-or-create-terminal)

(jlib/def-key-fn
 "C-c t h"
 (split-window-horizontally)
 (jlib/get-or-create-terminal))

(jlib/def-key-fn
 "C-c t j"
 (split-window-vertically)
 (windmove-down 1)
 (jlib/get-or-create-terminal))

(jlib/def-key-fn
 "C-c t k"
 (split-window-vertically)
 (jlib/get-or-create-terminal))

(jlib/def-key-fn
 "C-c t l"
 (split-window-horizontally)
 (windmove-right 1)
 (jlib/get-or-create-terminal))

(jlib/def-key-fn
 "C-c l"
 (if (window-right (get-buffer-window))
     (enlarge-window-horizontally 5)
   (shrink-window-horizontally 5)))

(jlib/def-key-fn
 "C-c h"
 (if (window-left (get-buffer-window))
     (enlarge-window-horizontally 5)
   (shrink-window-horizontally 5)))

(jlib/def-key-fn
 "C-c d p"
 (dired (jlib/get-current-project)))

(jlib/def-key-fn
 "C-c d o"
 (write-region
  (expand-file-name default-directory)
  nil
  (jlib/path-join (getenv "HOME") ".config" "current_project")))

(jlib/def-key-fn
 "C-c d h"
 (dired (jlib/path-join (getenv "HOME"))))

(jlib/def-key-fn
 "C-c d g"
 (dired (jlib/path-join (getenv "HOME") "github")))

(jlib/def-key-fn
 "C-c d s"
 (dired (jlib/path-join (getenv "HOME") "school")))
