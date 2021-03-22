;;; -*- lexical-binding: t -*-
;; NOTE: We have to load `project' before all other packages to ensure
;; that they use the latest version of this dependency instead of the
;; one that comes bundled with Emacs.
(use-package project
  :demand t)

(use-package esup)
(use-package prescient)
(use-package selectrum-prescient)
(use-package magit)
(defun magit-stage-everything ()
  "Stage all modified and unmodified files."
  (interactive)
  (magit-stage-modified t))

(use-package selectrum
  :demand t
  :config (selectrum-mode))

(use-package ctrlf
  :demand t
  :config (ctrlf-mode +1))

(setq flycheck-disabled-checkers
      '(emacs-lisp emacs-lisp-checkdoc))
(use-package flycheck
  :demand t
  :config (global-flycheck-mode +1))

(use-package yasnippet
  :hook '((prog-mode . yas-minor-mode))
  :config (yas-global-mode 1))

(use-package direnv
  :demand t
  :config (direnv-mode))

(setq company-idle-delay nil)
(use-package company
  :hook '((prog-mode . company-mode))
  :config
  (global-company-mode)
  (global-set-key (kbd "C-S-n") 'company-select-next)
  (global-set-key (kbd "C-S-p") 'company-select-previous))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(web-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(rust-mode . ("rust-analyzer"))))

(use-package olivetti)

(use-package markdown-mode
  :config (add-hook 'markdown-mode-hook 'olivetti-mode))

(use-package yaml-mode)
(use-package lua-mode)
(use-package terraform-mode)
(use-package nix-mode)
(use-package rbenv
  :demand t
  :config (global-rbenv-mode))
(use-package inf-ruby)
