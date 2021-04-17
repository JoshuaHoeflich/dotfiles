(use-package add-node-modules-path)
(use-package prettier-js)
(use-package typescript-mode)

(defun jlib/typescript-hook ()
  "Hook for entering TypeScript mode."
  (eglot-ensure)
  (add-node-modules-path)
  (prettier-js-mode))

(add-hook 'typescript-mode-hook 'jlib/typescript-hook)
