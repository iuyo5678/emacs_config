;; -*- Emacs-Lisp -*-

;; Time-stamp: <2021-03-15 15:42:42 Monday by zhangguhua>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;; Prettify Symbols
;; e.g. display “lambda” as “λ”
(use-package prog-mode
  :ensure nil
  :hook (prog-mode . prettify-symbols-mode)
  :init
  (setq-default prettify-symbols-alist centaur-prettify-symbols-alist)
  (setq prettify-symbols-unprettify-at-point 'right-edge))

;;(use-package tree-sitter
;;  :ensure tree-sitter-langs
;;  :diminish
;;  :hook ((after-init . global-tree-sitter-mode)
;;         (tree-sitter-after-on . tree-sitter-hl-mode)))

;; Jump to definition
(use-package dumb-jump
  :pretty-hydra
  ((:title (pretty-hydra-title "Dump Jump" 'faicon "anchor")
    :color blue :quit-key "q")
   ("Jump"
    (("j" dumb-jump-go "Go")
     ("o" dumb-jump-go-other-window "Go other window")
     ("e" dumb-jump-go-prefer-external "Go external")
     ("x" dumb-jump-go-prefer-external-other-window "Go external other window"))
    "Other"
    (("i" dumb-jump-go-prompt "Prompt")
     ("l" dumb-jump-quick-look "Quick look")
     ("b" dumb-jump-back "Back"))))
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window)
         ("C-M-j" . dumb-jump-hydra/body))
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-prefer-searcher 'rg
        dumb-jump-selector 'ivy))

(use-package editorconfig
  :diminish
  :hook (after-init . editorconfig-mode))

;; Run commands quickly
(use-package quickrun
  :bind (("C-<f5>" . quickrun)
         ("C-c X" . quickrun)))


(when (>= emacs-major-version 27)
  (use-package devdocs
    :commands (devdocs--installed-docs devdocs--available-docs)
    :bind (:map prog-mode-map
           ("M-<f1>" . devdocs-dwim)
           ("C-h D"  . devdocs-dwim))
    :init
    (defconst devdocs-major-mode-docs-alist
      '((c-mode          . ("c"))
        (c++-mode        . ("cpp"))
        (python-mode     . ("python~3.10" "python~2.7"))
        (ruby-mode       . ("ruby~3.1"))
        (go-mode         . ("go"))
        (css-mode        . ("css"))
        (html-mode       . ("html"))
        (julia-mode      . ("julia~1.8"))
        (js-mode         . ("javascript" "jquery"))
        (js2-mode        . ("javascript" "jquery"))
        (emacs-lisp-mode . ("elisp")))
      "Alist of major-mode and docs.")

    (mapc
     (lambda (items)
       (add-hook (intern (format "%s-hook" (car items)))
                 (lambda ()
                   (setq-local devdocs-current-docs (cdr items)))))
     devdocs-major-mode-docs-alist)

    (setq devdocs-data-dir (expand-file-name "devdocs" user-emacs-directory))

    (defun devdocs-dwim()
      "Look up a DevDocs documentation entry.

Install the doc if it's not installed."
      (interactive)
      ;; Install the doc if it's not installed
      (mapc
       (lambda (slug)
         (unless (member slug (let ((default-directory devdocs-data-dir))
                                (seq-filter #'file-directory-p
                                            (when (file-directory-p devdocs-data-dir)
                                              (directory-files "." nil "^[^.]")))))
           (mapc
            (lambda (doc)
              (when (string= (alist-get 'slug doc) slug)
                (devdocs-install doc)))
            (devdocs--available-docs))))
       (alist-get major-mode devdocs-major-mode-docs-alist))

      ;; Lookup the symbol at point
      (devdocs-lookup nil (thing-at-point 'symbol t)))))


(use-package cask-mode)
(use-package csharp-mode)
(use-package csv-mode)
(use-package julia-mode)
(use-package lua-mode)
(use-package mermaid-mode)
(use-package plantuml-mode)
(use-package powershell)
(use-package rmsbolt)                   ; A compiler output viewer
(use-package scala-mode)
(use-package swift-mode)
(use-package vimrc-mode)
(use-package cmake-mode)
(use-package protobuf-mode
  :hook (protobuf-mode . (lambda ()
                           (setq imenu-generic-expression
                                 '((nil "^[[:space:]]*\\(message\\|service\\|enum\\)[[:space:]]+\\([[:alnum:]]+\\)" 2))))))

(use-package nxml-mode
  :ensure nil
  :mode (("\\.xaml$" . xml-mode)))

;; New `conf-toml-mode' in Emacs 26
(unless (fboundp 'conf-toml-mode)
  (use-package toml-mode))

;; Batch Mode eXtras
(use-package bmx-mode
  :after company
  :diminish
  :hook (after-init . bmx-mode-setup-defaults))

;; Fish shell
(use-package fish-mode
  :hook (fish-mode . (lambda ()
                       (add-hook 'before-save-hook
                                 #'fish_indent-before-save))))

(provide 'dev-settings)
