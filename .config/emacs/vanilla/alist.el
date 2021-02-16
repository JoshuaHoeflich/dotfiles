(add-to-list 'default-frame-alist '(font . "Inconsolata:size=24"))
(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
(add-to-list 'display-buffer-alist
             `("sly-mrepl"
               (display-buffer-no-window)
               (allow-no-window . t)))
