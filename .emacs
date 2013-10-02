;; === CUA Mode ===
 (cua-mode 1)

;; ===IDO Mode ===
(require 'ido)
(ido-mode t)

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
