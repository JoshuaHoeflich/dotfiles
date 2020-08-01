(use-package markdown-mode)
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
(use-package olivetti)
(add-hook 'markdown-mode-hook 'olivetti-mode)
