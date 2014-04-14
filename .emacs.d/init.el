(add-to-list 'load-path "~/.emacs.d")

;; make emacs init.el compatible with 23
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(setq my-packages '(clojure-mode magit
		    paredit zenburn-theme))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(require 'ido)
(ido-mode t)

(require 'zenburn-theme)
