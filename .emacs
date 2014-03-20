;; === El-get package management ===
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

(require 'el-get)
(setq el-get-verbose t)

;; my packages
(setq dim-packages
      (append
       ;; list of packages we use straight from official recipes
       '(markdown-mode color-theme-solarized jedi flycheck autopair yasnippet ess ein)

       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync dim-packages)

;; === CUA Mode ===
 (cua-mode 1)

;; ===IDO Mode ===
(require 'ido)
(ido-mode t)

;; === Yasnippet ===
(add-to-list 'load-path "~/.emacs.d/packages/yasnippet-x.y.z")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; === Autopair parenthese ===
(add-to-list 'load-path "~/.emacs.d/elpa/autopair-0.3/") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; = Allow triple quote pairing in Python
(add-hook 'python-mode-hook
          #'(lambda ()
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

;; === Add Marmalade package manage ===
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; === Solarized color theme
(load-theme 'solarized-light t)

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

;; === Python Setup ===
(require 'python)

;; = IPython shell =
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; = Jedi autocompletion =
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; = Flycheck =
(add-hook 'after-init-hook #'global-flycheck-mode)

;; = IPython Notebook integration =
(require 'ein)
(setq ein:use-auto-complete-superpack t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
