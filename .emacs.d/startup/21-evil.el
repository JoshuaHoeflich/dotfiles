(use-package evil)
(use-package evil-commentary)
(evil-mode)
(evil-commentary-mode)
(evil-ex-define-cmd "Ex" 'dired-jump)
(evil-ex-define-cmd "Rg" 'deadgrep)
(evil-ex-define-cmd "eval" 'eval-buffer)
(evil-define-key '(normal) 'global (kbd "C-w") 'other-window)
(evil-define-key '(normal) 'global (kbd "C-S-r") 'deadgrep)