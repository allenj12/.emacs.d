(require 'irony)

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

(with-eval-after-load "irony"
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(require 'company-irony)
(with-eval-after-load "company-irony"
  (push 'company-irony company-backends)
  (add-hook 'irony-mode-hook 'company-mode))

(require 'irony-eldoc)
(with-eval-after-load "irony-eldoc"
  (add-hook 'irony-mode-hook 'irony-eldoc))

(setq irony-additional-clang-options '("-std=c++14"))

(provide 'init-c)
