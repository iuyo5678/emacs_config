;;; -*- lexical-binding: t; -*-
;;; go-settings.el ---

;; Copyright 2017 Zhang Guhua
;;
;; Author: iuyo5678@gmail.com
;; Version: $Id: go-settings.el,v 0.0 2017/12/19 20:35:00 zhangguhua Exp $
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
;;   (require 'go-settings)

;;; Code:


;; Golang
(use-package go-mode
  :functions go-update-tools
  :commands godoc-gogetdoc
  :bind (:map go-mode-map
         ("C-c R" . go-remove-unused-imports)
         ("<f1>" . godoc-at-point))
  :init
  (setq godoc-at-point-function #'godoc-gogetdoc)
  (setq go-ts-mode-indent-offset 4)
  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-envs '("GOPATH" "GO111MODULE" "GOPROXY")))

  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-bottom-up
          (append '("Dockerfile" "go.sum" "go.mod")
                  projectile-project-root-files-bottom-up)))
  :config
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4)))
  (add-hook 'go-mode-hook #'lsp)
  ;; Install or update tools
  (defconst go--tools
    '("golang.org/x/tools/gopls"
      "golang.org/x/tools/cmd/goimports"
      "honnef.co/go/tools/cmd/staticcheck"
      "github.com/go-delve/delve/cmd/dlv"
      "github.com/zmb3/gogetdoc"
      "github.com/josharian/impl"
      "github.com/cweill/gotests/..."
      "github.com/fatih/gomodifytags"
      "github.com/davidrjenni/reftools/cmd/fillstruct")
    "All necessary go tools.")

  (defun go-update-tools ()
    "Install or update go tools."
    (interactive)
    (unless (executable-find "go")
      (user-error "Unable to find `go' in `exec-path'!"))

    (message "Installing go tools...")
    (dolist (pkg go--tools)
      (set-process-sentinel
       (start-process "go-tools" "*Go Tools*" "go" "install" "-v" "-x" (concat pkg "@latest"))
       (lambda (proc _)
         (let ((status (process-exit-status proc)))
           (if (= 0 status)
               (message "Installed %s" pkg)
             (message "Failed to install %s: %d" pkg status)))))))

  ;; Try to install go tools if `gopls' is not found
  (unless (executable-find "gopls")
    (go-update-tools))
  (use-package go-projectile
    :init (go-projectile-tools-add-path))
  ;; Misc
  ;;(use-package dap-dlv-gou)
  (use-package go-fill-struct)
  (use-package go-impl)

  (use-package go-tag
    :bind (:map go-mode-map
           ("C-c t t" . go-tag-add)
           ("C-c t T" . go-tag-remove))
    :init (setq go-tag-args (list "-transform" "camelcase")))

  (use-package go-gen-test
    :bind (:map go-mode-map
           ("C-c t g" . go-gen-test-dwim)))

  (use-package gotest
    :config
    (setq go-test-verbose t
          word-wrap t)
    :bind (:map go-mode-map
           ("C-c t f" . go-test-current-file)
           ("C-c t t" . go-test-current-test)
           ("C-c t j" . go-test-current-project)
           ("C-c t b" . go-test-current-benchmark)
           ("C-c t c" . go-test-current-coverage)
           ("C-c t x" . go-run))))

;; Local Golang playground for short snippets
(use-package go-playground
  :diminish
  :commands (go-playground-mode))

(provide 'go-settings)

;;; go-settings.el ends here
