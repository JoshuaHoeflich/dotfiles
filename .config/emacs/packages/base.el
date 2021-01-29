(use-package esup)
(use-package prescient)
(use-package selectrum-prescient)
(use-package magit)

(use-package selectrum
  :demand t
  :config (selectrum-mode))

(use-package ctrlf
  :demand t
  :config (ctrlf-mode +1))

(use-package flycheck
  :demand t
  :config (global-flycheck-mode 1))

(use-package yasnippet
  :demand t
  :config (yas-global-mode 1))

(use-package direnv
  :demand t
  :config (direnv-mode))

(use-package company
  :demand t
  :config
  (global-company-mode)
  (global-set-key (kbd "C-S-n") 'company-select-next)
  (global-set-key (kbd "C-S-p") 'company-select-previous)
  (setq company-idle-delay nil))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
