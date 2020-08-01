;;; Package --- Summary:

;;; Code:
(defun my/summon-terminal ()
  "Summon a terminal with zero prompts."
  (interactive)
  (my/open-or-run "*ansi-term*" (my/thunk (ansi-term "/bin/sh"))))

(global-set-key (kbd "C-c t t") 'my/summon-terminal)

(defun my/summon-terminal-left ()
  "Summon a terminal on the left of the current window."
  (interactive)
  (split-window-horizontally)
  (my/summon-terminal))

(global-set-key (kbd "C-c t h") 'my/summon-terminal-left)

(defun my/summon-terminal-right ()
  "Summon a terminal on the right of the current window."
  (interactive)
  (split-window-horizontally)
  (windmove-right 1)
  (my/summon-terminal))

(global-set-key (kbd "C-c t l") 'my/summon-terminal-right)

(defun my/summon-terminal-below ()
  "Summon a terminal below the current window."
  (interactive)
  (split-window-vertically)
  (windmove-down 1)
  (my/summon-terminal))

(global-set-key (kbd "C-c t j") 'my/summon-terminal-below)

(defun my/summon-terminal-above ()
  "Summon a terminal above the current window."
  (interactive)
  (split-window-vertically)
  (my/summon-terminal))

(global-set-key (kbd "C-c t k") 'my/summon-terminal-above)

;;; Commentary:

(provide '04-shell)
;;; 04-shell.el ends here
