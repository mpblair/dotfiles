(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(package-refresh-contents)

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
