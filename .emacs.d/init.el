;; -*- lexical-binding: t -*-
(setq gc-cons-threshold (* 100 1024 1024))

; {{{ Enable Sensible Defaults
(setq show-paren-delay 0)
(setq confirm-kill-processes nil)
(setq initial-buffer-choice "~/.emacs.d")
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq create-lockfiles 'nil)
(set-face-attribute 'default nil :height 180)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
; (tool-bar-mode 0)
; (menu-bar-mode 0)
; (scroll-bar-mode 0)
(electric-pair-mode 1)
; (fringe-mode 0)
(show-paren-mode 1)
(setq-default mode-line-format '(" %b | %l:%C "))
(put 'dired-find-alternate-file 'disabled nil)
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font:size=26"))
; }}}

; Fira Code: Enable Ligatures {{{
;; Reference: https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
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

(provide 'fira-code-mode)
; }}}

; Resize Font {{{
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
; }}}

; (setq straight-check-for-modifications '(watch-files find-when-checking))
; (defvar bootstrap-version)
; (let ((bootstrap-file
;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;       (bootstrap-version 5))
;   (unless (file-exists-p bootstrap-file)
;     (with-current-buffer
;         (url-retrieve-synchronously
;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;          'silent 'inhibit-cookies)
;       (goto-char (point-max))
;       (eval-print-last-sexp)))
;   (load bootstrap-file nil 'nomessage))
; (straight-use-package 'use-package)
; (setq straight-use-package-by-default t)
; (setq use-package-always-defer t)


; (use-package no-littering
;   :demand t)
; (straight-use-package
;  '(org :host github :repo "emacs-straight/org-mode" :local-repo "org"))
