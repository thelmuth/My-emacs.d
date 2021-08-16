;;;;
;; TMH additions
;;;;

;; Company mode allows for autocompletion and listing of possible completions
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Rainbow parens
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; Paredit hooks for square and curly braces
(add-hook 'clojure-mode-hook '(lambda () (define-key clojure-mode-map "\M-[" 'paredit-wrap-square)))
(add-hook 'clojure-mode-hook '(lambda () (define-key clojure-mode-map "\M-{" 'paredit-wrap-curly)))

;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
;(require 'clojure-mode-extra-font-locking)

;; syntax hilighting for midje
;; (add-hook 'clojure-mode-hook
;;           (lambda ()
;;             (setq inferior-lisp-program "lein repl")
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; Refresh Cider with C-c C-r
;; See:
;;  - http://blog.jenkster.com/2013/12/a-cider-excursion.html
;;  - https://github.com/clojure/tools.namespace
;;  - http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded
(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
  (clojure.tools.namespace.repl/refresh)"))
(add-hook 'clojure-mode-hook '(lambda () (define-key clojure-mode-map (kbd "C-c C-r") 'cider-namespace-refresh)))

;; key bindings
;; these help me out with the way I usually develop web apps
;; (defun cider-start-http-server ()
;;   (interactive)
;;   (cider-load-current-buffer)
;;   (let ((ns (cider-current-ns)))
;;     (cider-repl-set-ns ns)
;;     (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
;;     (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


;; (defun cider-refresh ()
;;   (interactive)
;;   (cider-interactive-eval (format "(user/reset)")))

;; (defun cider-user-ns ()
;;   (interactive)
;;   (cider-repl-set-ns "user"))

;; (eval-after-load 'cider
;;   '(progn
;;      (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
;;      (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
;;      (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
;;      (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
