;;; lsp-settings.el ---

;; Copyright 2021 Zhang Guhua
;;
;; Author: zhangguhua@DRAKEZHANG-MB1
;; Version: $Id: lsp-settings.el,v 0.0 2021/03/15 15:14:22 zhangguhua Exp $
;; Keywords:
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;

;; Put this file into your load-path and the following into your ~/.emacs:


;;; Code:
;; Emacs client for the Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode#supported-languages

(use-package lsp-mode
  :diminish
  :defines (lsp-clients-python-library-directories
            lsp-rust-server)
  :autoload lsp-enable-which-key-integration
  :commands (lsp-format-buffer
             lsp-organize-imports
             lsp-install-server)
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'protobuf-mode 'emacs-lisp-mode 'lisp-mode)
                          (lsp-deferred))))
         (lsp-mode . (lambda ()
                       ;; Integrate `which-key'
                       (lsp-enable-which-key-integration)
                       ;; Format and organize imports
                       (unless (apply #'derived-mode-p lsp-format-on-save-ignore-modes)
                         (add-hook 'before-save-hook #'lsp-format-buffer t t)
                         (add-hook 'before-save-hook #'lsp-organize-imports t t)))))
  :bind (:map lsp-mode-map
         ("C-c C-d" . lsp-describe-thing-at-point)
         ([remap xref-find-definitions] . lsp-find-definition)
         ([remap xref-find-references] . lsp-find-references))
  :init
  ;; @see https://emacs-lsp.github.io/lsp-mode/page/performance
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-use-plists t)
  (setq lsp-keymap-prefix "C-c l"
        lsp-keep-workspace-alive nil
        lsp-signature-auto-activate nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-modeline-workspace-status-enable nil
	lsp-lens-enable nil
	lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-symbol-highlighting nil
        lsp-enable-text-document-color nil

        lsp-enable-indentation nil
        lsp-enable-on-type-formatting nil
        lsp-diagnostics-disabled-modes '(markdown-mode gfm-mode)
        ;; For `lsp-clients'
        lsp-clients-python-library-directories '("/usr/local/" "/usr/"))
  (setq lsp-clients-clangd-args '("--clang-tidy"  "--all-scopes-completion" "--completion-style=detailed" "--background-index" "--j=5" "--log=error"))
  :config
  (with-no-warnings
    ;; Disable `lsp-mode' in `git-timemachine-mode'
    (defun my-lsp--init-if-visible (fn &rest args)
      (unless (bound-and-true-p git-timemachine-mode)
        (apply fn args)))
    (advice-add #'lsp--init-if-visible :around #'my-lsp--init-if-visible)

    ;; Enable `lsp-mode' in sh/bash/zsh
    (defun my-lsp-bash-check-sh-shell (&rest _)
      (and (memq major-mode '(sh-mode bash-ts-mode))
           (memq sh-shell '(sh bash zsh))))
    (advice-add #'lsp-bash-check-sh-shell :override #'my-lsp-bash-check-sh-shell)
    (add-to-list 'lsp-language-id-configuration '(bash-ts-mode . "shellscript"))

    ;; Only display icons in GUI
    (defun my-lsp-icons-get-symbol-kind (fn &rest args)
      (and (icons-displayable-p) (apply fn args)))
    (advice-add #'lsp-icons-get-by-symbol-kind :around #'my-lsp-icons-get-symbol-kind)

    ;; For `lsp-headerline'
    (defun my-lsp-icons-get-by-file-ext (fn &rest args)
      (and (icons-displayable-p) (apply fn args)))
    (advice-add #'lsp-icons-get-by-file-ext :around #'my-lsp-icons-get-by-file-ext)

    (defun my-lsp-icons-get-by-file-ext (file-ext &optional feature)
      (when (and file-ext
                 (lsp-icons--enabled-for-feature feature))
        (nerd-icons-icon-for-extension file-ext)))
    (advice-add #'lsp-icons-get-by-file-ext :override #'my-lsp-icons-get-by-file-ext)
    (defvar lsp-symbol-alist
      '(
        (misc          nerd-icons-codicon "nf-cod-symbol_namespace" :face font-lock-warning-face)
        (document      nerd-icons-codicon "nf-cod-symbol_file" :face font-lock-string-face)
        (namespace     nerd-icons-codicon "nf-cod-symbol_namespace" :face font-lock-type-face)
        (string        nerd-icons-codicon "nf-cod-symbol_string" :face font-lock-doc-face)
        (boolean-data  nerd-icons-codicon "nf-cod-symbol_boolean" :face font-lock-builtin-face)
        (numeric       nerd-icons-codicon "nf-cod-symbol_numeric" :face font-lock-builtin-face)
        (method        nerd-icons-codicon "nf-cod-symbol_method" :face font-lock-function-name-face)
        (field         nerd-icons-codicon "nf-cod-symbol_field" :face font-lock-variable-name-face)
        (localvariable nerd-icons-codicon "nf-cod-symbol_variable" :face font-lock-variable-name-face)
        (class         nerd-icons-codicon "nf-cod-symbol_class" :face font-lock-type-face)
        (interface     nerd-icons-codicon "nf-cod-symbol_interface" :face font-lock-type-face)
        (property      nerd-icons-codicon "nf-cod-symbol_property" :face font-lock-variable-name-face)
        (indexer       nerd-icons-codicon "nf-cod-symbol_enum" :face font-lock-builtin-face)
        (enumerator    nerd-icons-codicon "nf-cod-symbol_enum" :face font-lock-builtin-face)
        (enumitem      nerd-icons-codicon "nf-cod-symbol_enum_member" :face font-lock-builtin-face)
        (constant      nerd-icons-codicon "nf-cod-symbol_constant" :face font-lock-constant-face)
        (structure     nerd-icons-codicon "nf-cod-symbol_structure" :face font-lock-variable-name-face)
        (event         nerd-icons-codicon "nf-cod-symbol_event" :face font-lock-warning-face)
        (operator      nerd-icons-codicon "nf-cod-symbol_operator" :face font-lock-comment-delimiter-face)
        (template      nerd-icons-codicon "nf-cod-symbol_snippet" :face font-lock-type-face)))
    (defun my-lsp-icons-get-by-symbol-kind (kind &optional feature)
      (when (and kind
                 (lsp-icons--enabled-for-feature feature))
        (let* ((icon (cdr (assoc (lsp-treemacs-symbol-kind->icon kind) lsp-symbol-alist)))
               (args (cdr icon)))
          (apply (car icon) args))))
    (advice-add #'lsp-icons-get-by-symbol-kind :override #'my-lsp-icons-get-by-symbol-kind)

    (setq lsp-headerline-arrow (nerd-icons-octicon "nf-oct-chevron_right"
                                                   :face 'lsp-headerline-breadcrumb-separator-face)))
  )

(defun lsp-update-server ()
  "Update LSP server."
  (interactive)
  ;; Equals to `C-u M-x lsp-install-server'
  (lsp-install-server t))

(use-package lsp-ui
  :custom-face
  (lsp-ui-sideline-code-action ((t (:inherit warning))))
  :pretty-hydra
  ((:title (pretty-hydra-title "LSP UI" 'faicon "rocket" :face 'nerd-icons-green)
    :color amaranth :quit-key "q")
   ("Doc"
    (("d e" (progn
              (lsp-ui-doc-enable (not lsp-ui-doc-mode))
              (setq lsp-ui-doc-enable (not lsp-ui-doc-enable)))
      "enable" :toggle lsp-ui-doc-mode)
     ("d s" (setq lsp-ui-doc-include-signature (not lsp-ui-doc-include-signature))
      "signature" :toggle lsp-ui-doc-include-signature)
     ("d t" (setq lsp-ui-doc-position 'top)
      "top" :toggle (eq lsp-ui-doc-position 'top))
     ("d b" (setq lsp-ui-doc-position 'bottom)
      "bottom" :toggle (eq lsp-ui-doc-position 'bottom))
     ("d p" (setq lsp-ui-doc-position 'at-point)
      "at point" :toggle (eq lsp-ui-doc-position 'at-point))
     ("d h" (setq lsp-ui-doc-header (not lsp-ui-doc-header))
      "header" :toggle lsp-ui-doc-header)
     ("d f" (setq lsp-ui-doc-alignment 'frame)
      "align frame" :toggle (eq lsp-ui-doc-alignment 'frame))
     ("d w" (setq lsp-ui-doc-alignment 'window)
      "align window" :toggle (eq lsp-ui-doc-alignment 'window)))
    "Sideline"
    (("s e" (progn
              (lsp-ui-sideline-enable (not lsp-ui-sideline-mode))
              (setq lsp-ui-sideline-enable (not lsp-ui-sideline-enable)))
      "enable" :toggle lsp-ui-sideline-mode)
     ("s h" (setq lsp-ui-sideline-show-hover (not lsp-ui-sideline-show-hover))
      "hover" :toggle lsp-ui-sideline-show-hover)
     ("s d" (setq lsp-ui-sideline-show-diagnostics (not lsp-ui-sideline-show-diagnostics))
      "diagnostics" :toggle lsp-ui-sideline-show-diagnostics)
     ("s s" (setq lsp-ui-sideline-show-symbol (not lsp-ui-sideline-show-symbol))
      "symbol" :toggle lsp-ui-sideline-show-symbol)
     ("s c" (setq lsp-ui-sideline-show-code-actions (not lsp-ui-sideline-show-code-actions))
      "code actions" :toggle lsp-ui-sideline-show-code-actions)
     ("s i" (setq lsp-ui-sideline-ignore-duplicate (not lsp-ui-sideline-ignore-duplicate))
      "ignore duplicate" :toggle lsp-ui-sideline-ignore-duplicate))
    "Action"
    (("h" backward-char "←")
     ("j" next-line "↓")
     ("k" previous-line "↑")
     ("l" forward-char "→")
     ("C-a" mwim-beginning-of-code-or-line nil)
     ("C-e" mwim-end-of-code-or-line nil)
     ("C-b" backward-char nil)
     ("C-n" next-line nil)
     ("C-p" previous-line nil)
     ("C-f" forward-char nil)
     ("M-b" backward-word nil)
     ("M-f" forward-word nil)
     ("c" lsp-ui-sideline-apply-code-actions "apply code actions"))))
  :bind (("C-c u" . lsp-ui-imenu)
         :map lsp-ui-mode-map
         ("M-<f6>" . lsp-ui-hydra/body)
         ("M-RET" . lsp-ui-sideline-apply-code-actions))
  :hook (lsp-mode . lsp-ui-mode)
  :init (setq lsp-ui-sideline-show-diagnostics nil
              lsp-ui-sideline-ignore-duplicate t
              lsp-ui-doc-position 'at-point
              lsp-ui-doc-border (face-foreground 'font-lock-comment-face)
              lsp-ui-imenu-colors `(,(face-foreground 'font-lock-keyword-face)
                                    ,(face-foreground 'font-lock-string-face)
                                    ,(face-foreground 'font-lock-constant-face)
                                    ,(face-foreground 'font-lock-variable-name-face)))
  :config
  ;; `C-g'to close doc
  (advice-add #'keyboard-quit :before #'lsp-ui-doc-hide)

  ;; Reset `lsp-ui-doc-background' after loading theme
  (add-hook 'after-load-theme-hook
            (lambda ()
              (setq lsp-ui-doc-border (face-foreground 'font-lock-comment-face))
              (set-face-background 'lsp-ui-doc-background (face-background 'tooltip)))))

;; Ivy integration
(use-package lsp-ivy
  :after lsp-mode
  :bind (:map lsp-mode-map
         ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)
         ("C-s-." . lsp-ivy-global-workspace-symbol))
  :config
  (with-no-warnings
    (when (icons-displayable-p)
      (defvar lsp-ivy-symbol-kind-icons
        `(,(nerd-icons-codicon "nf-cod-symbol_namespace") ; Unknown - 0
          ,(nerd-icons-codicon "nf-cod-symbol_file") ; File - 1
          ,(nerd-icons-codicon "nf-cod-symbol_namespace" :face 'nerd-icons-lblue) ; Module - 2
          ,(nerd-icons-codicon "nf-cod-symbol_namespace" :face 'nerd-icons-lblue) ; Namespace - 3
          ,(nerd-icons-codicon "nf-cod-package") ; Package - 4
          ,(nerd-icons-codicon "nf-cod-symbol_class" :face 'nerd-icons-orange) ; Class - 5
          ,(nerd-icons-codicon "nf-cod-symbol_method" :face 'nerd-icons-purple) ; Method - 6
          ,(nerd-icons-codicon "nf-cod-symbol_property") ; Property - 7
          ,(nerd-icons-codicon "nf-cod-symbol_field" :face 'nerd-icons-lblue) ; Field - 8
          ,(nerd-icons-codicon "nf-cod-symbol_method" :face 'nerd-icons-lpurple) ; Constructor - 9
          ,(nerd-icons-codicon "nf-cod-symbol_enum" :face 'nerd-icons-orange) ; Enum - 10
          ,(nerd-icons-codicon "nf-cod-symbol_interface" :face 'nerd-icons-lblue) ; Interface - 11
          ,(nerd-icons-codicon "nf-cod-symbol_method" :face 'nerd-icons-purple) ; Function - 12
          ,(nerd-icons-codicon "nf-cod-symbol_variable" :face 'nerd-icons-lblue) ; Variable - 13
          ,(nerd-icons-codicon "nf-cod-symbol_constant") ; Constant - 14
          ,(nerd-icons-codicon "nf-cod-symbol_string") ; String - 15
          ,(nerd-icons-codicon "nf-cod-symbol_numeric") ; Number - 16
          ,(nerd-icons-codicon "nf-cod-symbol_boolean" :face 'nerd-icons-lblue) ; Boolean - 17
          ,(nerd-icons-codicon "nf-cod-symbol_array") ; Array - 18
          ,(nerd-icons-codicon "nf-cod-symbol_class" :face 'nerd-icons-blue) ; Object - 19
          ,(nerd-icons-codicon "nf-cod-symbol_key") ; Key - 20
          ,(nerd-icons-codicon "nf-cod-symbol_numeric" :face 'nerd-icons-dsilver) ; Null - 21
          ,(nerd-icons-codicon "nf-cod-symbol_enum_member" :face 'nerd-icons-lblue) ; EnumMember - 22
          ,(nerd-icons-codicon "nf-cod-symbol_structure" :face 'nerd-icons-orange) ; Struct - 23
          ,(nerd-icons-codicon "nf-cod-symbol_event" :face 'nerd-icons-orange) ; Event - 24
          ,(nerd-icons-codicon "nf-cod-symbol_operator") ; Operator - 25
          ,(nerd-icons-codicon "nf-cod-symbol_class") ; TypeParameter - 26
          ))
      (lsp-defun my-lsp-ivy--format-symbol-match
        ((sym &as &SymbolInformation :kind :location (&Location :uri))
         project-root)
        "Convert the match returned by `lsp-mode` into a candidate string."
        (let* ((sanitized-kind (if (< kind (length lsp-ivy-symbol-kind-icons)) kind 0))
               (type (elt lsp-ivy-symbol-kind-icons sanitized-kind))
               (typestr (if lsp-ivy-show-symbol-kind (format "%s " type) ""))
               (pathstr (if lsp-ivy-show-symbol-filename
                            (propertize (format " · %s" (file-relative-name (lsp--uri-to-path uri) project-root))
                                        'face font-lock-comment-face)
                          "")))
          (concat typestr (lsp-render-symbol-information sym ".") pathstr)))
      (advice-add #'lsp-ivy--format-symbol-match :override #'my-lsp-ivy--format-symbol-match))))

;; Debug
(when (>= emacs-major-version 26)
  (use-package dap-mode
    :defines dap-python-executable
    :diminish
    :bind (:map lsp-mode-map
           ("<f5>" . dap-debug)
           ("M-<f5>" . dap-hydra))
    :hook ((after-init . dap-auto-configure-mode)
           (dap-stopped . (lambda (_args) (dap-hydra)))

           (python-mode . (lambda () (require 'dap-python)))
           (ruby-mode . (lambda () (require 'dap-ruby)))
           (go-mode . (lambda () (require 'dap-go)))
           (java-mode . (lambda () (require 'dap-java)))
           ((c-mode c++-mode objc-mode swift-mode) . (lambda () (require 'dap-lldb)))
           (php-mode . (lambda () (require 'dap-php)))
           ((js-mode js2-mode) . (lambda () (require 'dap-chrome)))
           (powershell-mode . (lambda () (require 'dap-pwsh))))
    :init
    (when (executable-find "python3")
      (setq dap-python-executable "python3"))))


;; Python: pyright
(use-package lsp-pyright
  :preface
  ;; Use yapf to format
  (defun lsp-pyright-format-buffer ()
    (interactive)
    (when (and (executable-find "yapf") buffer-file-name)
      (call-process "yapf" nil nil nil "-i" buffer-file-name)))
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (add-hook 'after-save-hook #'lsp-pyright-format-buffer t t)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))


(with-eval-after-load 'projectile
  (setq projectile-project-root-files-bottom-up
        (append '("BUILD" "compile_commands.json" ".ccls")
                projectile-project-root-files-bottom-up)))

;; whichkey
(use-package which-key
  :config
  (which-key-mode))

(when 'lsp-mode
  ;; Enable LSP in org babel
  ;; https://github.com/emacs-lsp/lsp-mode/issues/377
  (cl-defmacro lsp-org-babel-enable (lang)
    "Support LANG in org source code block."
    (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
           (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
      `(progn
         (defun ,intern-pre (info)
           (let ((file-name (->> info caddr (alist-get :file))))
             (unless file-name
               (user-error "LSP:: specify `:file' property to enable"))

             (setq buffer-file-name file-name)
             (pcase 'lsp-mode
               ('eglot
                (and (fboundp 'eglot-ensure) (eglot-ensure)))
               ('lsp-mode
                (and (fboundp 'lsp-deferred) (lsp-deferred)))
               (_ (user-error "LSP:: invalid `'lsp-mode' type")))))
         (put ',intern-pre 'function-documentation
              (format "Enable `%s' in the buffer of org source block (%s)."
                      'lsp-mode (upcase ,lang)))

         (if (fboundp ',edit-pre)
             (advice-add ',edit-pre :after ',intern-pre)
           (progn
             (defun ,edit-pre (info)
               (,intern-pre info))
             (put ',edit-pre 'function-documentation
                  (format "Prepare local buffer environment for org source block (%s)."
                          (upcase ,lang))))))))

  (defvar org-babel-lang-list
    '("go" "python" "ipython" "ruby" "js" "css" "sass" "C" "rust" "java"))
  (add-to-list 'org-babel-lang-list (if (>= emacs-major-version 25.2) "shell" "sh"))
  (dolist (lang org-babel-lang-list)
    (eval `(lsp-org-babel-enable ,lang))))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'lsp-settings)
