;; === Emacs for Python setup following https://github.com/gabrielelanaro/emacs-for-python
 (load-file "~/.emacs.d/emacs-for-python/epy-init.el")
 (add-to-list 'load-path "~.emacs.d/emacs-for-python/") ;; tell where to load the various files
 (require 'epy-setup)      ;; It will setup other loads, it is required!
 (require 'epy-python)     ;; If you want the python facilities [optional]
 (require 'epy-completion) ;; If you want the autocompletion settings [optional]
 (require 'epy-editing)    ;; For configurations related to editing [optional]
 ;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
 (require 'epy-nose)       ;; For nose integration

;; === Set the fill column to 80 ===
(setq-default fill-column 80)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
