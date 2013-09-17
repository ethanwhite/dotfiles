;; === CUA Mode ===
 (cua-mode 1)

;; === Add Marmalade package manage ===
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; === Solarized color theme
(load-theme 'solarized-light t)

;; === Emacs for Python setup following https://github.com/gabrielelanaro/emacs-for-python
 (load-file "~/.emacs.d/emacs-for-python/epy-init.el")
 (add-to-list 'load-path "~.emacs.d/emacs-for-python/") ;; tell where to load the various files
 (require 'epy-setup)      ;; It will setup other loads, it is required!
 (require 'epy-python)     ;; If you want the python facilities [optional]
 (require 'epy-completion) ;; If you want the autocompletion settings [optional]
 (require 'epy-editing)    ;; For configurations related to editing [optional]
 ;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
 (require 'epy-nose)       ;; For nose integration

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
