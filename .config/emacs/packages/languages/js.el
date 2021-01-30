(use-package prettier-js)
(use-package add-node-modules-path)
(use-package json-mode
  :demand t
  :mode "\\.json\\'")

(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-mode))
(flycheck-add-mode 'javascript-eslint 'web-mode)

(defun jlib/web-base-hook ()
  "Hooks for webby programming languages."
  (add-node-modules-path)
  (prettier-js-mode))

(defun jlib/web-mode-hook ()
  "Hooks for web mode specifically."
  (interactive)
  (jlib/web-base-hook)
  (-when-let (checker (and
                       (member web-mode-content-type '("jsx" "js"))
                       'javascript-eslint))
    (flycheck-mode)
    (eglot-ensure)
    (flycheck-select-checker checker)))

(add-hook 'js-mode-hook 'jlib/web-base-hook)
(add-hook 'json-mode-hook 'jlib/web-base-hook)
(add-hook 'web-mode-hook 'jlib/web-mode-hook)
