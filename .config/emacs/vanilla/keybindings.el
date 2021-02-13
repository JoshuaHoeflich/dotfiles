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

(defun jlib/tear-window ()
  "Tear the current window out into a new frame."
  (interactive)
  (let ((buffer (current-buffer)))
    (unless (one-window-p)
      (delete-window))
    (display-buffer-pop-up-frame buffer nil)))

(global-set-key (kbd "C-c w t") 'jlib/tear-window)

(defun jlib/lisp-indent ()
  "Indent the buffer in a LISP-y way for me."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun jlib/try-auto-format (fn)
  "Attempt to autoformat using FN; fail gracefully when unbound."
  (when (fboundp fn)
    (funcall fn)))

(defun jlib/indent-lisp ()
  "Automatically indent LISP code for me."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun jlib/try-prettify ()
  "Try to run prettier for me."
  (interactive)
  (jlib/try-auto-format 'prettier-js))

(defun jlib/indent-buffer ()
  "Automatically indent the buffer for me."
  (interactive)
  (pcase (file-name-extension (or buffer-file-name ""))
    ("lisp" (jlib/indent-lisp))
    ("el" (jlib/indent-lisp))
    ("rkt" (jlib/indent-lisp))
    ("clj" (jlib/indent-lisp))
    ("cljs" (jlib/indent-lisp))
    ("edn" (jlib/indent-lisp))
    ("js" (jlib/try-prettify))
    ("ts" (jlib/try-prettify))
    ("jsx" (jlib/try-prettify))
    ("tsx" (jlib/try-prettify))
    ("json" (jlib/try-prettify))
    ("go" (jlib/try-auto-format 'gofmt))
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

(defun jlib/saveall-quitall ()
  "Save every open buffer, then close everything."
  (interactive)
  (save-some-buffers t)
  (delete-other-windows)
  (mapc 'kill-buffer (buffer-list))
  (find-file (jlib/get-current-project)))

(defvar *jlib/emacs-terminal*
  (jlib/path-join "/" "usr" "bin" "fish"))

(defun jlib/kill-terminal-process ()
  "Run kill-process when we're in an ansi-term buffer."
  (interactive)
  (when (and (string-match-p (regexp-quote "ansi-term") (buffer-name))
             (get-buffer-process (current-buffer)))
    (kill-process)))

(defmacro jlib/def-key-fn (key &rest fn)
  "Takes a key binding and assigns it to an anonymous function."
  (let ((local-fn-name (gensym)))
    `(let ((,local-fn-name
            (lambda ()
              (interactive)
              ,@fn)))
       (global-set-key (kbd ,key) ,local-fn-name))))

(jlib/def-key-fn
 "C-x k"
 (jlib/kill-terminal-process)
 (kill-buffer))

(jlib/def-key-fn
 "C-x 4 0"
 (jlib/kill-terminal-process)
 (kill-buffer-and-window))

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
 "C-c d p"
 (dired (jlib/get-current-project)))

(jlib/def-key-fn
 "C-c d s"
 (write-region
  (expand-file-name default-directory)
  nil
  (jlib/path-join (getenv "HOME") ".config" "current_project")))

(jlib/def-key-fn
 "C-c r l"
 (let ((buf (get-buffer "*sly-mrepl for sbcl*")))
   (when buf
     (split-window-horizontally)
     (windmove-right)
     (switch-to-buffer buf)
     (windmove-left))))

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
 "C-c d j"
 (dired (jlib/path-join (getenv "HOME") "github" "joshuahoeflich")))
