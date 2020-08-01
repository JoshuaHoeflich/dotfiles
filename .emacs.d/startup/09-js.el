(use-package add-node-modules-path)
(use-package prettier-js)
(use-package emmet-mode)

(defun my/javascript-hook ()
  "My custom JavaScript mode hook."
  (add-node-modules-path)
  (emmet-mode)
  (prettier-js-mode)
  (local-set-key (kbd "M-p") 'lsp-eslint-apply-all-fixes)
  (lsp))

(add-hook 'js-mode-hook 'my/javascript-hook)
