;; -*- lexical-binding: t -*-

;; Sensible Defaults
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq show-paren-delay 0)
(setq confirm-kill-processes nil)
(setq initial-buffer-choice "~/github")
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(setq create-lockfiles 'nil)
(set-face-attribute 'default nil :height 140)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq-default mode-line-format '(" %b | %l:%C "))
(put 'dired-find-alternate-file 'disabled nil)
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font:size=22"))

;; Fira Code
;;; Reference: https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
(defun fira-code-mode--make-alist (list)
  "Generate prettify-symbols alist from LIST."
  (let ((idx -1))
    (mapcar
     (lambda (s)
       (setq idx (1+ idx))
       (let* ((code (+ #Xe100 idx))
              (width (string-width s))
              (prefix ())
              (suffix '(?\s (Br . Br)))
              (n 1))
	     (while (< n width)
	       (setq prefix (append prefix '(?\s (Br . Bl))))
	       (setq n (1+ n)))
	     (cons s (append prefix suffix (list (decode-char 'ucs code))))))
     list)))

(defconst fira-code-mode--ligatures
  '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
    "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
    "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
    "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
    ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
    "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
    "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
    "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
    ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
    "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
    "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
    "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
    "x" ":" "+" "+" "*"))

(defvar fira-code-mode--old-prettify-alist)

(defun fira-code-mode--enable ()
  "Enable Fira Code ligatures in current buffer."
  (setq-local fira-code-mode--old-prettify-alist prettify-symbols-alist)
  (setq-local prettify-symbols-alist (append (fira-code-mode--make-alist fira-code-mode--ligatures) fira-code-mode--old-prettify-alist))
  (prettify-symbols-mode t))

(defun fira-code-mode--disable ()
  "Disable Fira Code ligatures in current buffer."
  (setq-local prettify-symbols-alist fira-code-mode--old-prettify-alist)
  (prettify-symbols-mode -1))

(define-minor-mode fira-code-mode
  "Fira Code ligatures minor mode"
  :lighter " Fira Code"
  (setq-local prettify-symbols-unprettify-at-point 'right-edge)
  (if fira-code-mode
      (fira-code-mode--enable)
    (fira-code-mode--disable)))

(defun fira-code-mode--setup ()
  "Setup Fira Code Symbols"
  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol"))

(define-globalized-minor-mode my-global-fira-code-mode fira-code-mode
  (lambda () (fira-code-mode)))

(my-global-fira-code-mode)

;; Personal Functions
;; See https://stackoverflow.com/questions/3964715/what-is-the-correct-way-to-join-multiple-path-components-into-a-single-complete
(defun my/path-join (root &rest dirs)
  "Join ROOT with DIRS in an OS-independent way."
  (if (not dirs) root
    (apply
     'my/path-join
     (expand-file-name (car dirs) root) (cdr dirs))))

(defun my/open-or-run (buffer command-func)
  "Attempt to open BUFFER; if no such buffer exists, run COMMAND-FUNC."
  (let ((buffer-to-find (get-buffer buffer)))
    (if (buffer-live-p buffer-to-find)
	    (switch-to-buffer buffer-to-find)
      (funcall command-func))))

(defun my/indent-buffer ()
  "Auto indent the buffer for me."
  (interactive)
  (indent-region (point-min) (point-max)))

(global-set-key (kbd "C-c i") 'my/indent-buffer)

;; Terminals in Emacs
(defun my/path-to-zsh ()
  "Get the path to my copy of ZSH."
  (my/path-join
   (getenv "HOME")
   ".nix-profile" "bin" "zsh"))

(defun my/summon-terminal ()
  "Summon a terminal with zero prompts."
  (interactive)
  (my/open-or-run
   "*ansi-term*"
   (lambda () (ansi-term (my/path-to-zsh)))))

(global-set-key (kbd "C-c t t") 'my/summon-terminal)

(defun my/summon-new-terminal ()
  "Summon a brand new terminal from the void."
  (interactive)
  (ansi-term (my/path-to-zsh)))

(global-set-key (kbd "C-c t n") 'my/summon-new-terminal)

(defun my/summon-terminal-left ()
  "Summon a terminal on the left of the current window."
  (interactive)
  (split-window-horizontally)
  (my/summon-terminal))

(global-set-key (kbd "C-c t h") 'my/summon-terminal-left)

(defun my/summon-terminal-right ()
  "Summon a terminal on the right of the current window."
  (interactive)
  (split-window-horizontally)
  (windmove-right 1)
  (my/summon-terminal))

(global-set-key (kbd "C-c t l") 'my/summon-terminal-right)

(defun my/summon-terminal-below ()
  "Summon a terminal below the current window."
  (interactive)
  (split-window-vertically)
  (windmove-down 1)
  (my/summon-terminal))

(global-set-key (kbd "C-c t j") 'my/summon-terminal-below)

(defun my/summon-terminal-above ()
  "Summon a terminal above the current window."
  (interactive)
  (split-window-vertically)
  (my/summon-terminal))

(global-set-key (kbd "C-c t k") 'my/summon-terminal-above)

(defun my/zoom-in ()
  "Increase font size by 10 points"
  (interactive)
  (set-face-attribute
   'default nil
   :height
   (+ (face-attribute 'default :height) 20)))

(global-set-key (kbd "C-=") 'my/zoom-in)

(defun my/zoom-out ()
  "Decrease font size by 10 points"
  (interactive)
  (set-face-attribute
   'default nil
   :height (- (face-attribute 'default :height) 20)))

(global-set-key (kbd "C--") 'my/zoom-out)

(defun my/zoom-reset ()
  "Reset the font size to a sensible default."
  (interactive)
  (set-face-attribute 'default nil :height 180))

(global-set-key (kbd "C-0") 'my/zoom-reset)

(defun window/push-border-right (&optional amount)
  "Push the border AMOUNT to the right."
  (interactive)
  (if (window-right (get-buffer-window))
      (enlarge-window-horizontally (or amount 5))
    (shrink-window-horizontally (or amount 5))))

(global-set-key (kbd "C-c l") 'window/push-border-right)

(defun window/push-border-left (&optional amount)
  "Push the border AMOUNT to the left."
  (interactive)
  (if (window-left (get-buffer-window))
      (enlarge-window-horizontally (or amount 5))
    (shrink-window-horizontally (or amount 5))))

(global-set-key (kbd "C-c h") 'window/push-border-left)

(defun window/push-border-down (&optional amount)
  "Push the border AMOUNT down."
  (interactive)
  (let ((window-on-top (eq 0 (nth 1 (window-edges)))))
    (if window-on-top
	    (enlarge-window (or amount 5))
      (shrink-window (or amount 5)))))

(global-set-key (kbd "C-c C-j") 'window/push-border-down)

(defun window/push-border-up (&optional amount)
  "Push the border AMOUNT up."
  (interactive)
  (let ((window-on-top (eq 0 (nth 1 (window-edges)))))
    (if window-on-top
	    (shrink-window (or amount 5))
      (enlarge-window (or amount 5)))))

(global-set-key (kbd "C-c C-k") 'window/push-border-up)

;; Package Configuration
(setq straight-check-for-modifications '(watch-files find-when-checking))
(setq straight-fix-flycheck t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-defer t)

(use-package esup)
(use-package deadgrep)
(use-package selectrum)
(use-package prescient)
(use-package selectrum-prescient)
(use-package ctrlf)
(selectrum-mode)
(ctrlf-mode +1)

(defun my/home-or-bufdir ()
  "Get HOME or the current working directory."
  (if buffer-file-name
      (file-name-directory buffer-file-name)
    (getenv "HOME")))

(defun my/vex ()
  "Invoke dired like Vex in vim"
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (dired (my/home-or-bufdir)))

(defun my/ex ()
  "Invoke dired like Ex in vim"
  (interactive)
  (dired (my/home-or-bufdir)))

(defun my/alias (alias)
  "Create an ALIAS which takes me to a file conveniently."
  (lambda () (interactive) (find-file alias)))

(defun my/kill-bufwin-safe ()
  "Kill the buffer and the current window safely."
  (interactive)
  (kill-this-buffer)
  (when (> (length (window-list)) 1)
    (delete-window)))

(defun my/killsave-bufwin-safe ()
  "Save the current buffer, then kill it and its window safely."
  (interactive)
  (save-buffer)
  (kill-this-buffer)
  (when (> (length (window-list)) 1)
    (delete-window)))

(defun my/get-current-project ()
  "Get my current project."
  (with-temp-buffer
    (insert-file-contents
     (my/path-join
      (getenv "HOME") ".config" "current_project"))
    (buffer-string)))

(global-set-key (kbd "C-c p") (my/alias (my/get-current-project)))

(defun my/saveall-quitall ()
  "Save every open buffer, then close everything."
  (interactive)
  (save-some-buffers t)
  (delete-other-windows)
  (mapc 'kill-buffer (buffer-list))
  (find-file (my/get-current-project)))

(defun my/reload-config ()
  "Reload my Emacs configuration."
  (load-file (concat user-emacs-directory "init.el")))

(use-package evil
  :config
  (evil-define-command
    my/make-directory (directory)
    (interactive "<a>")
    (mkdir directory)
    (revert-buffer))
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-ex-define-cmd "q" 'my/kill-bufwin-safe)
  (evil-ex-define-cmd "mkdir" 'my/make-directory)
  (evil-ex-define-cmd "wq" 'my/killsave-bufwin-safe)
  (evil-ex-define-cmd "q!" 'kill-buffer)
  (evil-ex-define-cmd "b" 'switch-to-buffer)
  (evil-ex-define-cmd "wqa" 'my/saveall-quitall)
  (evil-ex-define-cmd "Ex" 'my/ex)
  (evil-ex-define-cmd "Rg" 'deadgrep)
  (evil-ex-define-cmd "Vex" 'my/vex)
  (evil-ex-define-cmd "gitconfig" (my/alias (my/path-join (getenv "HOME") ".gitconfig")))
  (evil-ex-define-cmd "xprofile" (my/alias (my/path-join (getenv "HOME") ".xprofile")))
  (evil-ex-define-cmd "xsession" (my/alias (my/path-join (getenv "HOME") ".xsession")))
  (evil-ex-define-cmd "gitignore" (my/alias (my/path-join (getenv "HOME") ".gitignore")))
  (evil-ex-define-cmd "aliases" (my/alias (my/path-join (getenv "HOME") ".config" "aliases.sh")))
  (evil-ex-define-cmd "progs" (my/alias (my/path-join (getenv "HOME") ".nix-defexpr" "default.nix")))
  (evil-ex-define-cmd "dots" (my/alias (my/path-join (getenv "HOME") ".local" "dotfiles.dots")))
  (evil-ex-define-cmd "emacsrc" (my/alias (my/path-join (getenv "HOME") ".config" "emacs" "init.el")))
  (evil-ex-define-cmd "gemacs" (my/alias (my/path-join (getenv "HOME") ".config" "emacs")))
  (evil-ex-define-cmd "eval" 'eval-buffer)
  (evil-ex-define-cmd "gp" (my/alias (my/get-current-project)))
  (evil-ex-define-cmd "zshrc" (my/alias (my/path-join (getenv "HOME") ".config" "zsh" ".zshrc")))
  (evil-define-key '(normal) 'dired-mode-map (kbd "g") 'revert-buffer)
  (evil-define-key '(normal) 'global (kbd "C-w") 'other-window)
  (evil-define-key '(normal) 'global (kbd "C-j") 'next-buffer)
  (evil-define-key '(normal) 'global (kbd "C-k") 'previous-buffer)
  (evil-define-key '(normal) 'global (kbd "C-S-r") 'deadgrep))

(defun my/open-file-right ()
  "Open a file to the right of the current window."
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (dired-find-file))

(with-eval-after-load "dired" 
  (require 'dired-x)
  (define-key dired-mode-map (kbd "$") 'evil-end-of-line)
  (define-key dired-mode-map (kbd "C-r") 'revert-buffer)
  (define-key dired-mode-map (kbd "G") 'end-of-buffer))

(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-S-v") 'term-paste))

(use-package evil-commentary)
(evil-mode 1)
(evil-commentary-mode 1)

(use-package ewal
  :init (setq ewal-use-built-in-always-p nil
	          ewal-use-built-in-on-failure-p t
	          ewal-built-in-palette "base16-spacemacs"))

(use-package ewal-spacemacs-themes
  :demand t
  :init (progn
	      (setq spacemacs-theme-underline-parens t)
	      (global-hl-line-mode))
  :config (progn
	        (load-theme 'ewal-spacemacs-modern t)
            (set-face-attribute 'region nil :background "#d8d8d8")
	        (enable-theme 'ewal-spacemacs-modern)))

(defun my/reload-theme (event)
  "Reload my wal theme automatically."
  (load-theme 'ewal-spacemacs-modern t)
  (set-face-attribute 'region nil :background "#d8d8d8"))

(require 'filenotify)
(file-notify-add-watch "~/.cache/wal/colors.json" '(change) 'my/reload-theme)

(use-package flycheck)
(global-flycheck-mode 1)

(set-face-attribute
 'flycheck-warning nil
 :box t
 :underline nil
 :box '(:color "#ffff00"))

(set-face-attribute
 'flycheck-error nil
 :box '(:color "#ff0000")
 :underline nil)

(set-face-attribute
 'flycheck-info nil
 :box '(:color "#70c0b1")
 :underline nil)

(use-package treemacs
  :config 
  (set-face-attribute
   'treemacs-git-added-face nil
   :background nil)
  (set-face-attribute
   'treemacs-git-conflict-face
   nil :background nil)
  (set-face-attribute
   'treemacs-git-modified-face
   nil :background nil)
  (set-face-attribute
   'treemacs-git-untracked-face
   nil :background nil))

(use-package treemacs-evil)
(setq treemacs-width 25)
(global-set-key (kbd "C-c s") 'treemacs)

(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay nil))

(use-package yasnippet :config
  (yas-global-mode))

(use-package editorconfig :config (editorconfig-mode 1))

(use-package magit)
(use-package direnv
  :demand t
  :config (direnv-mode))

(defun my/company-mode-hook ()
  "Hook for Company mode keybindings."
  (evil-define-key '(normal) 'global (kbd "C-p") 'lsp-format-buffer)
  (evil-define-key '(insert emacs) 'global (kbd "C-n") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous))

(add-hook 'company-mode-hook 'my/company-mode-hook)

(defun my/prog-mode-hook ()
  "Settings I like while programming."
  (display-line-numbers-mode)
  (yas-minor-mode)
  (company-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)

(use-package lsp-mode
  :config
  (setq lsp-prefer-capf t))
(use-package lsp-ui)
(setq lsp-ui-doc-enable nil)
(use-package go-mode)

(add-hook 'go-mode-hook 'lsp)

(use-package markdown-mode)

(use-package olivetti)
(add-hook 'markdown-mode-hook 'olivetti-mode)

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package rust-mode)
(add-hook 'rust-mode-hook 'lsp)
(use-package yaml-mode)

;; Format Before Save
(defvar
  mode-save-map (make-hash-table)
  "Map of functions to run on save with modes I commonly use.")
(puthash 'go-mode 'gofmt-before-save mode-save-map)
(puthash 'rust-mode 'lsp-format-buffer mode-save-map)

(defun my/before-save-hook ()
  "Hook to run before I save any file."
  (funcall (gethash major-mode mode-save-map)))

(add-hook 'before-save-hook 'my/before-save-hook)
