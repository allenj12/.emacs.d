;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/color-themes")
(load-theme 'noctilux t)

;;load init helper files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;;Setup basics for emacs
(require 'init-elpa)

;;Languages
(require 'init-clojure-cider)
(require 'init-haskell)
(require 'init-c)

;;Utility
(require 'ido)
(ido-mode t)
(require 'init-windmove)
;;Emacs auto
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-ghci haskell-mode ## rainbow-delimiters paredit irony cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
