;;; package --- Summary:

;;; Code:
(require 'dired-x)
(setq show-paren-delay 0)
(setq confirm-kill-processes nil)
(setq initial-buffer-choice "~/.emacs.d")
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq create-lockfiles 'nil)
(set-face-attribute 'default nil :height 180)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(electric-pair-mode 1)
(fringe-mode 0)
(show-paren-mode 1)
(setq-default mode-line-format '(" %b | %l:%C "))
(put 'dired-find-alternate-file 'disabled nil)
(set-frame-font "FiraCode Nerd Font" nil t)

;;; Commentary:

(provide '00-defaults.el)
;;; 00-defaults.el ends here
