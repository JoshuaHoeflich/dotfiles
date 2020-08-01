(use-package lsp-mode)

(defvar my/eslint-server-path
  (concat
   (getenv "HOME")
   "/.vscode-oss/extensions/dbaeumer.vscode-eslint-2.1.5/server/out/eslintServer.js"))

(setq lsp-eslint-server-command `("node" ,my/eslint-server-path "--stdio"))

(use-package lsp-ui)
(setq lsp-ui-sideline-delay 0.7)
