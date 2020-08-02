;; -*- lexical-binding: t -*-
;; Makes emacs much faster on modern hardware, also good for lsp mode
(setq gc-cons-threshold (* 100 1024 1024))

;; These operations take *surpising* amount of time, which is why we're doing
;; them here instead of init.el
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(fringe-mode 0)

;; Prevent package.el from modifying our init files.
; (setq package-enable-at-startup nil)

;; Prevent Custom from modifying our init files.
; (setq 
;   custom-file 
;   (expand-file-name
;     (format "custom-%d-%d.el" (emacs-pid) (random)) temporary-file-directory))
