;; this seems to only be required for 23
;; and only because of package-23.el
(add-to-list 'load-path "~/.emacs.d")

;; Packages

;; load in package if 23
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(setq my-packages '( magit          ;; git
		     paredit        
		     clojure-mode
		     cider          ;; clojure stuff
		     groovy-mode    ;; groovy stuff
		     zenburn-theme))

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

;; put backup files in tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(when window-system (set-frame-size (selected-frame) 100 50))

(require 'ido)
(ido-mode t)

(require 'zenburn-theme)
