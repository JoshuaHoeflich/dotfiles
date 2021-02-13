(use-package rust-mode)
(use-package flycheck-rust)
(defun jlib/rust-hook ()
  "Hook for entering Rust mode."
  (interactive)
  (flycheck-rust-setup))

(add-hook 'rust-mode-hook 'jlib/rust-hook)

