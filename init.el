;; -*- Emacs-Lisp -*-
;; Time-stamp: <2021-03-15 18:15:56 Monday by zhangguhua>
;; zgh的emacs配置启动文件
;;定义所有常用路径
(defconst my-emacs-path           "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "mylisps/") "我自己找的一些的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "elpa/") "一些安装lisp包路径，后面想用elpa升级")
(defconst my-custom-config-path (concat my-emacs-path "personal/") "一些自己自定义的配置信息，如自己的个人信息，个人博客配置等")
(defconst my-emacs-doc-path (concat my-emacs-path "docs/"))
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "模板路径")
(defconst my-org-file-path "~/Documents/EmacsOrg/" "org文件存储路径")

(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("mylisps" "personal"))
    (push (expand-file-name dir user-emacs-directory) load-path)))
(advice-add #'package-initialize :after #'update-load-path)
(update-load-path)


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)

(require 'zgh-startup)

;;初始化配置elpa
(require 'init-elpa)

(require 'zgh-misc)

(require 'init-hydra)


(require 'edit-settings)

(require 'init-ivy)

(require 'company-settings)

(require 'dired-settings)

(require 'highlight-settings)

(require 'windows-settings)

(require 'view-settings)

(require 'docker-settings)

(require 'shell-mode-settings)

(require 'markdown-settings)

(require 'org-settings)

(require 'vcs-settings)

(require 'project-settings)

(require 'lsp-settings)

(require 'elisp-settings)

(require 'c-settings)

(require 'go-settings)

(require 'python-settings)

(require 'web-settings)

(require 'template-settings)

(require 'face-settings)

(require 'dev-settings)

;;custom config saveto personal/personal.el
(setq custom-file (expand-file-name "personal/personal-info.el" user-emacs-directory))
(load custom-file)
