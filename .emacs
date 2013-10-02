;; === CUA Mode ===
 (cua-mode 1)

;; ===IDO Mode ===
(require 'ido)
(ido-mode t)

;; === Autopair parenthese ===
(add-to-list 'load-path "~/.emacs.d/elpa/autopair-0.3/") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; === Add Marmalade package manage ===
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; === Solarized color theme
(load-theme 'solarized-light t)

;; === Python setup following https://github.com/jorgenschaefer/elpy/wiki/Installation
(elpy-enable)
(elpy-use-ipython)
(elpy-clean-modeline)
(setq elpy-rpc-backend "jedi")

;; = Newline and indent =
(add-hook 'python-mode-hook
  #'(lambda ()
      (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; === Set fill defaults ===
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'auto-fill-mode)

;; === Enable markdown mode ===
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; === Copy/paste to/from external programs ===
(setq x-select-enable-clipboard t)

;; === Spell checking in text modes ===
(add-hook 'text-mode-hook 'flyspell-mode)
