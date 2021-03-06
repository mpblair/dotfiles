
;; this seems to only be required for 23
;; and only because of package-23.el
(add-to-list 'load-path "~/.emacs.d")

;; Packages

;; load in package if 23
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(setq my-packages '( magit          ;; git
		     fill-column-indicator
		     paredit        
		     rainbow-delimiters
		     clojure-mode
		     groovy-mode    ;; groovy stuff
		     enh-ruby-mode      ;; ruby stuff
		     zenburn-theme
		     markdown-mode
))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; Preferences
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(setq-default fill-column 80)


;; put backup files in tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(when window-system (set-frame-size (selected-frame) 100 50))

(require 'ido)
(ido-mode t)

(require 'zenburn-theme)

(global-rainbow-delimiters-mode 1)

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda () (fci-mode 1)))
(setq fci-rule-color "yellow")
(global-fci-mode 1)


(set-frame-font "-unknown-Liberation Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
