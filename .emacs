
;; === Package management ===

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("elpy" . "http://jorgenschaefer.github.io/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; === CUA Mode ===
 (cua-mode 1)

;; ===IDO Mode ===
(require 'ido)
(ido-mode t)

;; === Yasnippet ===
(use-package yasnippet
  :ensure t)
;;  :init
;;  (progn
;;    (yas-global-mode 1))

;; === Solarized color theme
(use-package solarized-theme
  :ensure t
  :init (load-theme 'solarized-light t))

;; = Newline and indent =
(add-hook 'python-mode-hook
  #'(lambda ()
      (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; === Set fill defaults ===
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; === Enable markdown mode ===
(use-package markdown-mode
  :ensure t
  :mode(("\\.markdown$" . markdown-mode)
	("\\.md$" . markdown-mode))
  :init (add-hook 'markdown-mode-hook 'auto-fill-mode))

;; === Copy/paste to/from external programs ===
(setq x-select-enable-clipboard t)

;; === Spell checking in text modes ===
(add-hook 'text-mode-hook 'flyspell-mode)

;; === Python Setup ===
(use-package flycheck
  :ensure t
  :diminish ""
  :init
  (progn
    (setq flycheck-indication-mode 'left-fringe)
    ;; disable the annoying doc checker
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
  :config
  (global-flycheck-mode 1))

;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Use Company for auto-completion interface.
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package elpy
  :ensure t
  :defer 2
  :config
  (progn
    ;; Use Flycheck instead of Flymake
    (when (require 'flycheck nil t)
      (remove-hook 'elpy-modules 'elpy-module-flymake)
      (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
      (add-hook 'elpy-mode-hook 'flycheck-mode))
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")))

;; = IPython Notebook integration =
(use-package ein
  :ensure t)

;;(setq ein:use-auto-complete-superpack t)
;;(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;; = ESS =
(use-package ess
  :ensure t)
;; (ess-toggle-underscore nil)

;; = Projectile for project management
(use-package projectile
  :ensure    projectile
  :config    (projectile-global-mode t))

;; = Magit =
(use-package magit)
(global-set-key (kbd "C-x C-g") 'magit-status)
