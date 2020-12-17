;;; -*- lexical-binding: t -*-

(defun window/push-border-right (&optional amount)
  "Push the border AMOUNT to the right."
  (interactive)
  (if (window-right (get-buffer-window))
      (enlarge-window-horizontally (or amount 5))
    (shrink-window-horizontally (or amount 5))))

(global-set-key (kbd "C-c l") 'window/push-border-right)

(defun window/push-border-left (&optional amount)
  "Push the border AMOUNT to the left."
  (interactive)
  (if (window-left (get-buffer-window))
      (enlarge-window-horizontally (or amount 5))
    (shrink-window-horizontally (or amount 5))))

(global-set-key (kbd "C-c h") 'window/push-border-left)
