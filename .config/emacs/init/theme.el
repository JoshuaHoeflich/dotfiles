(use-package doom-themes)

(defun jlib/color-comments ()
  "Set the color of comments in Emacs."
  (interactive)
  (let ((comment-color "#D2FFC2"))
    (dolist (face '(font-lock-comment-delimiter-face
                    font-lock-comment-face
                    font-lock-doc-face))
      (set-face-attribute
       face nil :foreground comment-color))))

(when window-system
  (load-theme 'doom-dracula t)
  (jlib/color-comments)
  (set-face-attribute
   'flycheck-warning nil :box t :underline nil :box '(:color "#ffff00"))
  (set-face-attribute
   'flycheck-error nil :box '(:color "#ff0000") :underline nil)
  (set-face-attribute
   'flycheck-info nil :box '(:color "#70c0b1") :underline nil)
  (set-face-attribute
   'font-lock-string-face nil :foreground "#33CF25")  
  (set-face-attribute
   'font-lock-warning-face nil :bold t :foreground "#FF4747")
  (set-face-attribute
   'font-lock-string-face nil :foreground "#33CF25")
  (set-face-attribute
   'font-lock-keyword-face nil :bold t)
  (set-face-attribute 'default nil :background "#000000"))
