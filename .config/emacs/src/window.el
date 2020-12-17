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

(defun window/push-border-down (&optional amount)
  "Push the border AMOUNT down."
  (interactive)
  (let ((window-on-top (eq 0 (nth 1 (window-edges)))))
    (if window-on-top
	    (enlarge-window (or amount 5))
      (shrink-window (or amount 5)))))

(global-set-key (kbd "C-c C-j") 'window/push-border-down)

(defun window/push-border-up (&optional amount)
  "Push the border AMOUNT up."
  (interactive)
  (let ((window-on-top (eq 0 (nth 1 (window-edges)))))
    (if window-on-top
	    (shrink-window (or amount 5))
      (enlarge-window (or amount 5)))))

(global-set-key (kbd "C-c C-k") 'window/push-border-up)
