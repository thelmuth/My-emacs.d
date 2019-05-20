;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

; list the packages you want
(setq package-list '(cider company ido-completing-read+ paredit projectile rainbow-delimiters smex monokai-theme))

; Avoid prompt about coding systems
(prefer-coding-system 'utf-8)

; activate all the packages (in particular autoloads)   
;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setenv "PATH" (concat (getenv "PATH") ":/Users/thelmuth/bin"))
(setq exec-path (append exec-path '("/Users/thelmuth/bin")))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-completing-read+
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; TMH Tom Helmuth's customizations
(load "helmuth.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; Clojure Langauage-specific
(load "setup-clojure.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Modes for other languages
(load "language-modes.el")


;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("93f9654f91d31e9a9ec6ea2fcffcfcab38353a9588673f2b750e591f704cd633" "f5b591870422cd28da334552aae915cdcae3edfcfedb6653a9f42ed84bbec69f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (smooth-scroll magit haskell-mode solarized-theme paredit rainbow-delimiters company projectile smex ido-completing-read+ cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
