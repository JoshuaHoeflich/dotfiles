;;; -*- lexical-binding: t -*-
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq show-paren-delay 0)
(setq confirm-kill-processes nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq create-lockfiles 'nil)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq-default mode-line-format '(" %b | %l:%C "))
(put 'dired-find-alternate-file 'disabled nil)
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font:size=20"))

(setq use-dialog-box nil)
(defun set-buffer-save-without-query ()
  "Set `buffer-save-without-query' to t."
  (unless (variable-binding-locus 'buffer-save-without-query)
    (setq buffer-save-without-query t)))
(add-hook #'find-file-hook #'set-buffer-save-without-query)

(defun jlib/open-or-run (buffer command-func)
  "Attempt to open BUFFER; if no such buffer exists, run COMMAND-FUNC."
  (let ((buffer-to-find (get-buffer buffer)))
    (if (buffer-live-p buffer-to-find)
	    (switch-to-buffer buffer-to-find)
      (funcall command-func))))

(defun jlib/indent-buffer ()
  "Auto indent the buffer for me."
  (interactive)
  (indent-region (point-min) (point-max)))

(global-set-key (kbd "C-c p") 'jlib/indent-buffer)

;; Terminals in Emacs
(defvar *jlib/ansi-shell*
  (jlib/path-join "/" "usr" "bin" "zsh"))

(defun jlib/summon-terminal ()
  "Summon a terminal with zero prompts."
  (interactive)
  (jlib/open-or-run
   "*ansi-term*"
   (lambda () (ansi-term *jlib/ansi-shell*))))

(global-set-key (kbd "C-c t t") 'jlib/summon-terminal)

(defun jlib/summon-new-terminal ()
  "Summon a brand new terminal from the void."
  (interactive)
  (ansi-term (jlib/path-to-zsh)))

(global-set-key (kbd "C-c t n") 'jlib/summon-new-terminal)

(defun jlib/summon-terminal-left ()
  "Summon a terminal on the left of the current window."
  (interactive)
  (split-window-horizontally)
  (jlib/summon-terminal))

(global-set-key (kbd "C-c t h") 'jlib/summon-terminal-left)

(defun jlib/summon-terminal-right ()
  "Summon a terminal on the right of the current window."
  (interactive)
  (split-window-horizontally)
  (windmove-right 1)
  (jlib/summon-terminal))

(global-set-key (kbd "C-c t l") 'jlib/summon-terminal-right)

(defun jlib/summon-terminal-below ()
  "Summon a terminal below the current window."
  (interactive)
  (split-window-vertically)
  (windmove-down 1)
  (jlib/summon-terminal))

(global-set-key (kbd "C-c t j") 'jlib/summon-terminal-below)

(defun jlib/summon-terminal-above ()
  "Summon a terminal above the current window."
  (interactive)
  (split-window-vertically)
  (jlib/summon-terminal))

(global-set-key (kbd "C-c t k") 'jlib/summon-terminal-above)

(defun jlib/zoom-in ()
  "Increase font size by 10 points"
  (interactive)
  (set-face-attribute
   'default nil
   :height
   (+ (face-attribute 'default :height) 20)))

(global-set-key (kbd "C-=") 'jlib/zoom-in)

(defun jlib/zoom-out ()
  "Decrease font size by 10 points"
  (interactive)
  (set-face-attribute
   'default nil
   :height (- (face-attribute 'default :height) 20)))

(global-set-key (kbd "C--") 'jlib/zoom-out)

(defun jlib/zoom-reset ()
  "Reset the font size to a sensible default."
  (interactive)
  (set-face-attribute 'default nil :height 180))

(global-set-key (kbd "C-0") 'jlib/zoom-reset)

(defun jlib/home-or-bufdir ()
  "Get HOME or the current working directory."
  (if buffer-file-name
      (file-name-directory buffer-file-name)
    (getenv "HOME")))

(defun jlib/vex ()
  "Invoke dired like Vex in vim."
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (dired (jlib/home-or-bufdir)))

(defun jlib/ex ()
  "Invoke dired like Ex in vim."
  (interactive)
  (dired (jlib/home-or-bufdir)))

(defun jlib/alias (alias)
  "Create an ALIAS which takes me to a file conveniently."
  (lambda () (interactive) (find-file alias)))

(defun jlib/kill-bufwin-safe ()
  "Kill the buffer and the current window safely."
  (interactive)
  (kill-this-buffer)
  (when (> (length (window-list)) 1)
    (delete-window)))

(defun jlib/killsave-bufwin-safe ()
  "Save the current buffer, then kill it and its window safely."
  (interactive)
  (save-buffer)
  (kill-this-buffer)
  (when (> (length (window-list)) 1)
    (delete-window)))

(defun jlib/get-current-project ()
  "Get my current project."
  (with-temp-buffer
    (insert-file-contents
     (jlib/path-join
      (getenv "HOME") ".config" "current_project"))
    (buffer-string)))

(defun jlib/goto-current-project ()
  "Goto the current project on which I am working."
  (interactive)
  (dired (jlib/get-current-project)))

(defun jlib/set-current-project ()
  "Set my current project."
  (interactive)
  (write-region
   (expand-file-name default-directory)
   nil
   (jlib/path-join (getenv "HOME") ".config" "current_project")))

(defun jlib/saveall-quitall ()
  "Save every open buffer, then close everything."
  (interactive)
  (save-some-buffers t)
  (delete-other-windows)
  (mapc 'kill-buffer (buffer-list))
  (find-file (jlib/get-current-project)))

(defun jlib/reload-config ()
  "Reload my Emacs configuration."
  (load-file (concat user-emacs-directory "init.el")))

(defun jlib/revert-buffer ()
  "Revert the buffer without asking me."
  (interactive)
  (revert-buffer t t t))

(defun jlib/open-file-right ()
  "Open a file to the right of the current window."
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (dired-find-file))

(setq initial-buffer-choice (jlib/get-current-project))
