(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font:size=20"))
(add-to-list 'display-buffer-alist
             `("sly-mrepl"
               (display-buffer-no-window)
               (allow-no-window . t)))
(add-to-list 'display-buffer-alist
             `("Racket REPL"
               (display-buffer-below-selected display-buffer-at-bottom)
               (window-height . 7)))
