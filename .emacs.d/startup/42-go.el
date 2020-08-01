(use-package go-mode)

(defun my/go-settings ()
  "My settings for programming in Golang."
  (add-hook 'before-save-hook 'gofmt-before-save)
  (lsp))

(add-hook 'go-mode-hook 'my/go-settings)
