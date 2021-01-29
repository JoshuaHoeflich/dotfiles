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
  (set-face-attribute
   'ctrlf-highlight-passive
   nil :background (jlib/get-highlighting-color))
  (set-face-attribute
   'region
   nil :background (jlib/get-highlighting-color)))

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
