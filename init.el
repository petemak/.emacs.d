(require 'package)

;; Add MELPA tp package archives
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Always load newest byte code
;; (setq load-prefer-newer t)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; Enable structural editing of  lisp expressions much, much easier
    paredit

    ;; Enable key bindings and code colorization for Clojure
    clojure-mode

    ;; Provides additional font-locking for clojure-mode.
    clojure-mode-extra-font-locking

    ;; Enable CIDER is the Clojure(Script) Interactive Development Environment that Rocks!
    cider

    ;; Enable colorful parenthesis matching
    rainbow-delimiters

    ;; Enable auto-completion with Company-Mode
    company

    ;; Simplifies project management and navigation
    projectile

    ;; Edit HTML tags like s-expressons.
    tagedit

    ;; Interface to the version control system Git,
    magit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

;; Enable Paredit in Cider and repl
(add-hook 'cider-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; Turn on auto-completion with Company-Mode
(add-hook 'after-init-hook 'global-company-mode)

;; Enable rainbow delimiters for highlighting parentheses,
;; brackets, and braces according to their depth
(add-hook 'cider-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

;; Show parenthesis mode
(show-paren-mode 1)

(require 'projectile)
(projectile-mode +1)

;; Configure Neotree and toggle F8
(add-to-list 'load-path "/Users/peterjoelmakumbi/.emacs.d/elpa/neotree-0.5.2/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Disable menu and toolbars
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(cider-lein-command "/usr/local/bin/lein")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(package-selected-packages
   (quote
    (all-the-icons which-key monokai-theme solarized-theme rainbow-delimiters magit company paredit cider)))
 '(scroll-bar-mode nil))


(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
