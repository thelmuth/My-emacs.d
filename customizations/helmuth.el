;; save backup files to same location
(setq backup-directory-alist `(("." . "~/.emacs-backups")))

;; make sure emacs makes backups by copying
(setq backup-by-copying t)

;; Don't require newline
(setq require-final-newline nil)

;; more backups
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Automatically detect and show changes to files on disk
(global-auto-revert-mode t)

; Adds C-c w as command to toggle font coloring
(global-set-key (kbd "C-c w") 'global-font-lock-mode)

; Turns off emacs toolbar in GUI mode
(if window-system
    (tool-bar-mode -1))

; Inhibit startup window
(if window-system
    (setq inhibit-startup-message t))

; Make all yes/no questions y/n
(fset 'yes-or-no-p 'y-or-n-p)

; For Haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)