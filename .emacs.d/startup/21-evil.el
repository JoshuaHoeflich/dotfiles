(use-package evil)
(evil-mode)
(evil-ex-define-cmd "Ex" 'dired-jump)

(evil-ex-define-cmd "eval" 'my/eval-buffer-elisp)

(defun my/vex () "Port of the Vex command from vim" 
  (split-window-right)
  (windmove-right)
  (dired-jump))

(evil-ex-define-cmd "Vex" 'my/vex)

