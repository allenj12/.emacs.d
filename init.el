;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;load init helper files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;Theme
(require 'init-theme)

;;Setup basics for emacs
(require 'init-elpa)

;;Multi-Language-Deps
(require 'paredit)
(require 'rainbow-delimiters)
(require 'company)
(require 'flycheck)

;;Languages
(require 'init-clojure-cider)
(require 'init-haskell)
(require 'init-c)
(require 'idris-mode)

(require 'init-go)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'factor-mode)
(setq fuel-listener-factor-binary "/home/joe/.factor/factor/factor")
(setq fuel-listener-factor-image "/home/joe/.factor/factor/factor.image")

(require 'init-eclim)
(require 'init-typescript)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;Utility
(require 'ido)
(ido-mode t)
(require 'init-windmove)
(require 'init-buffer-move)
;;(require 'init-mu4e)
(require 'init-erc)
(require 'init-ace-jump)
(setq doc-view-continuous t)

;;Emacs auto
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(package-selected-packages
   (quote
    (idris-mode neotree fuel exec-path-from-shell auto-complete company-go go-mode rainbow-delimiters company-emacs-eclim web-mode tide flycheck company-quickhelp ace-jump-mode buffer-move eclim jdee irony-eldoc company-irony company-ghci haskell-mode ## paredit irony cider)))
 '(x-select-enable-clipboard-manager nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
