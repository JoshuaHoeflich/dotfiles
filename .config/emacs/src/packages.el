;;; -*- lexical-binding: t -*-

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

(use-package evil
  :config
  (evil-define-command
    jlib/make-directory (directory)
    (interactive "<a>")
    (mkdir directory)
    (revert-buffer))
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-ex-define-cmd "q" 'jlib/kill-bufwin-safe)
  (evil-ex-define-cmd "mkdir" 'jlib/make-directory)
  (evil-ex-define-cmd "wq" 'jlib/killsave-bufwin-safe)
  (evil-ex-define-cmd "q!" 'kill-buffer)
  (evil-ex-define-cmd "b" 'switch-to-buffer)
  (evil-ex-define-cmd "wqa" 'jlib/saveall-quitall)
  (evil-ex-define-cmd "Ex" 'jlib/ex)
  (evil-ex-define-cmd "Rg" 'deadgrep)
  (evil-ex-define-cmd "Vex" 'jlib/vex)
  (evil-ex-define-cmd "sc" 'jlib/set-current-project)
  (evil-ex-define-cmd "rr" 'racket-run)
  (evil-ex-define-cmd "ggh" (jlib/alias (jlib/path-join (getenv "HOME") "github")))
  (evil-ex-define-cmd "gs" (jlib/alias (jlib/path-join (getenv "HOME") "school")))
  (evil-ex-define-cmd "gitconfig" (jlib/alias (jlib/path-join (getenv "HOME") ".gitconfig")))
  (evil-ex-define-cmd "xprofile" (jlib/alias (jlib/path-join (getenv "HOME") ".xprofile")))
  (evil-ex-define-cmd "xsession" (jlib/alias (jlib/path-join (getenv "HOME") ".xsession")))
  (evil-ex-define-cmd "gitignore" (jlib/alias (jlib/path-join (getenv "HOME") ".gitignore")))
  (evil-ex-define-cmd "gsnip" (jlib/alias (jlib/path-join (getenv "HOME") ".config" "emacs" "snippets")))
  (evil-ex-define-cmd "aliases" (jlib/alias (jlib/path-join (getenv "HOME") ".config" "aliases.sh")))
  (evil-ex-define-cmd "dots" (jlib/alias (jlib/path-join (getenv "HOME") ".local" "dotfiles.dots")))
  (evil-ex-define-cmd "emacsrc" (jlib/alias (jlib/path-join (getenv "HOME") ".config" "emacs" "init.el")))
  (evil-ex-define-cmd "rb" 'jlib/revert-buffer)
  (evil-ex-define-cmd "gs" (jlib/alias (jlib/path-join (getenv "HOME") "school")))
  (evil-ex-define-cmd "reset" 'jlib/saveall-quitall)
  (evil-ex-define-cmd "gemacs" (jlib/alias (jlib/path-join (getenv "HOME") ".config" "emacs")))
  (evil-ex-define-cmd "gh" (jlib/alias (getenv "HOME")))
  (evil-ex-define-cmd "eval" 'eval-buffer)
  (evil-ex-define-cmd "gp" 'jlib/goto-current-project)
  (evil-ex-define-cmd "zshrc" (jlib/alias (jlib/path-join (getenv "HOME") ".config" "zsh" ".zshrc")))
  (evil-define-key '(normal) 'global (kbd "C-w") 'other-window)
  (evil-define-key '(normal) 'global (kbd "C-j") 'next-buffer)
  (evil-define-key '(normal) 'global (kbd "C-k") 'previous-buffer)
  (evil-define-key '(normal) 'global (kbd "C-S-r") 'deadgrep))

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

(defun jlib/get-highlighting-color ()
  "Get a sensible highlighting color based on the theme."
  (let ((background-color (string-to-number (substring (face-attribute 'default :background) 1 nil) 16)))
    (if (< background-color #x707070) "#4a4b4d" "#dedede")))

(defun jlib/reload-theme (event)
  "Reload my wal theme automatically."
  (load-theme 'ewal-spacemacs-modern t)
  (set-face-attribute 'region nil :background (jlib/get-highlighting-color)))

(use-package ewal-spacemacs-themes
  :demand t
  :init (progn
	      (setq spacemacs-theme-underline-parens t)
	      (global-hl-line-mode))
  :config (progn 
            (jlib/reload-theme nil)
            (enable-theme 'ewal-spacemacs-modern)))

(require 'filenotify)
(file-notify-add-watch "~/.cache/wal/colors.json" '(change) 'jlib/reload-theme)

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

(defun jlib/company-mode-hook ()
  "Hook for Company mode keybindings."
  (evil-define-key '(normal) 'global (kbd "C-p") 'lsp-format-buffer)
  (evil-define-key '(insert emacs) 'global (kbd "C-n") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous))

(add-hook 'company-mode-hook 'jlib/company-mode-hook)

(defun jlib/prog-mode-hook ()
  "Settings I like while programming."
  (display-line-numbers-mode)
  (yas-minor-mode)
  (company-mode 1))

(add-hook 'prog-mode-hook 'jlib/prog-mode-hook)

(use-package lsp-mode
  :config
  (setq lsp-prefer-capf t)
  (add-to-list 'lsp-file-watch-ignored "[/\\\\].database$"))

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

(use-package racket-mode
  :mode "\\.rkt\\'")

(add-hook 'racket-mode-hook 'racket-start-back-end)

(setq inferior-lisp-program "sbcl")
(use-package sly)
(add-hook 'lisp-mode-hook 'sly)

(add-to-list 'display-buffer-alist
             `("sly-mrepl"
               (display-buffer-no-window)
               (allow-no-window . t)))

(use-package clojure-mode)
(use-package cider)

;; Format Before Save
(defvar
  mode-save-map (make-hash-table)
  "Map of functions to run on save with modes I commonly use.")
(puthash 'go-mode 'gofmt-before-save mode-save-map)
(puthash 'rust-mode 'lsp-format-buffer mode-save-map)

(defun jlib/before-save-hook ()
  "Hook to run before I save any file."
  (funcall (gethash major-mode mode-save-map)))

(add-hook 'before-save-hook 'jlib/before-save-hook)
