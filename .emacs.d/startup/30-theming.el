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
	    (enable-theme 'ewal-spacemacs-modern)))

(defun my/reload-theme (event)
  "Reload my wal theme automatically."
  (load-theme 'ewal-spacemacs-modern t))

(require 'filenotify)
(file-notify-add-watch "~/.cache/wal/colors.json" '(change) 'my/reload-theme)
