(require 'eclim)
(require 'eclimd)

(with-eval-after-load 'eclim
  (global-eclim-mode)
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)

  (require 'company)
  (require 'company-emacs-eclim)
  (with-eval-after-load 'company-emacs-eclim
    (company-emacs-eclim-setup)
    (global-company-mode t)))

(provide 'init-eclim)
