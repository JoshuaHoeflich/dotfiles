;;; -*- lexical-binding: t -*-
(require 'dired-x)

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
 initial-buffer-choice (when window-system
                         (jlib/get-current-project))
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq-default
 indent-tabs-mode nil
 mode-line-format '(" %b | %l:%C ")
 tab-width 4)

(global-auto-revert-mode)
(electric-pair-mode 1)
(show-paren-mode 1)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

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

(defun jlib/indent-lisp ()
  "Indent the buffer in a LISP-y way for me."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "Buffer indented successfully."))

(defun jlib/indent-buffer ()
  "Automatically indent the buffer for me."
  (interactive)
  (pcase (file-name-extension (or buffer-file-name ""))
    ("lisp" (jlib/indent-lisp))
    ("el" (jlib/indent-lisp))
    ("rkt" (jlib/indent-lisp))
    ("clj" (jlib/indent-lisp))
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

(defmacro jlib/def-key-fn (key &rest fn)
  "Takes a key binding and assigns it to an anonymous function."
  (let ((local-fn-name (gensym)))
    `(let ((,local-fn-name
            (lambda ()
              (interactive)
              ,@fn)))
       (global-set-key (kbd ,key) ,local-fn-name))))

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
 (when (> (length (window-list)) 1)
   (if (window-right (get-buffer-window))
       (enlarge-window-horizontally 5)
     (shrink-window-horizontally 5))))

(jlib/def-key-fn
 "C-c h"
 (when (> (length (window-list)) 1)
   (if (window-left (get-buffer-window))
       (enlarge-window-horizontally 5)
     (shrink-window-horizontally 5))))

(jlib/def-key-fn
 "C-c j"
 (when (> (length (window-list)) 1)
   (if (window-in-direction 'below)
       (enlarge-window 5)
     (shrink-window 5))))

(jlib/def-key-fn
 "C-c k"
 (when (> (length (window-list)) 1)
   (if (window-in-direction 'above)
       (enlarge-window 5)
     (shrink-window 5))))

(jlib/def-key-fn
 "C-0"
 (set-face-attribute 'default nil :height 180))

(jlib/def-key-fn
 "C-="
 (set-face-attribute
  'default nil
  :height (+ (face-attribute 'default :height) 20)))

(jlib/def-key-fn
 "C--"
 (set-face-attribute
  'default nil
  :height (- (face-attribute 'default :height) 20)))

(getenv "HOME")

(defvar *jlib/emacs-terminal*
  (jlib/path-join (getenv "HOME") ".nix-profile" "bin" "zsh"))

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
 (when (> (length (window-list)) 1)
   (if (window-right (get-buffer-window))
       (enlarge-window-horizontally 5)
     (shrink-window-horizontally 5))))

(jlib/def-key-fn
 "C-c h"
 (when (> (length (window-list)) 1)
   (if (window-left (get-buffer-window))
       (enlarge-window-horizontally 5)
     (shrink-window-horizontally 5))))

(jlib/def-key-fn
 "C-c j"
 (when (> (length (window-list)) 1)
   (if (window-in-direction 'below)
       (enlarge-window 5)
     (shrink-window 5))))

(jlib/def-key-fn
 "C-c k"
 (when (> (length (window-list)) 1)
   (if (window-in-direction 'above)
       (enlarge-window 5)
     (shrink-window 5))))

(jlib/def-key-fn
 "C-c d h"
 (dired (jlib/path-join (getenv "HOME"))))

(jlib/def-key-fn
 "C-c d g"
 (dired (jlib/path-join (getenv "HOME") "code" "github")))

(jlib/def-key-fn
 "C-c d t"
 (dired (jlib/path-join (getenv "HOME") "code" "scratch")))

(jlib/def-key-fn
 "C-c d e"
 (dired (jlib/path-join (getenv "HOME") ".config" "emacs")))

(jlib/def-key-fn
 "C-c d n"
 (dired (jlib/path-join (getenv "HOME") ".config" "nix")))

(jlib/def-key-fn
 "C-c d j"
 (dired (jlib/path-join (getenv "HOME") "github" "joshuahoeflich")))

(jlib/def-key-fn
 "C-c d p"
 (dired (jlib/get-current-project)))

(jlib/def-key-fn
 "C-c d s"
 (write-region
  (expand-file-name default-directory)
  nil
  (jlib/path-join (getenv "HOME") ".config" "current_project")))
