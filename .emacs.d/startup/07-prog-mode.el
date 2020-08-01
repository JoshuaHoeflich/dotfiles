(use-package ivy)
(ivy-mode 1)

(use-package swiper)
(global-set-key (kbd "C-s") 'swiper)

(use-package deadgrep)
(global-set-key (kbd "C-r") 'deadgrep)

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

(use-package company)
(global-set-key (kbd "M-n") 'company-complete-common)

(use-package yasnippet)
(yas-global-mode)

(use-package editorconfig)
(editorconfig-mode 1)

(use-package treemacs)
(setq treemacs-width 25)
(global-set-key (kbd "C-c s") 'treemacs)

(use-package magit)

(defun my/prog-mode-hook ()
  "Settings I like while programming."
  (display-line-numbers-mode)
  (company-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)
