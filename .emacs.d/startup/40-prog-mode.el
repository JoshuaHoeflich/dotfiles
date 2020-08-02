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
(global-company-mode)

(use-package yasnippet)
(yas-global-mode)

(use-package editorconfig)
(editorconfig-mode 1)

(use-package treemacs)
(use-package treemacs-evil)
(setq treemacs-width 25)
(global-set-key (kbd "C-c s") 'treemacs)

(use-package magit)

(defun my/company-mode-hook ()
  "Hook for Company mode keybindings."
  (evil-define-key '(insert) 'global (kbd "C-n") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous))

(add-hook 'company-mode-hook 'my/company-mode-hook)

(defun my/prog-mode-hook ()
  "Settings I like while programming."
  (display-line-numbers-mode)
  (company-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)
