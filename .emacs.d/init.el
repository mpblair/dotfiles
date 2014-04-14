;; make emacs init.el compatible with 23
(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(ido
		      clojure-mode
		      zenburn-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(require 'ido)
(ido-mode t)

(load-theme 'zenburn t)
