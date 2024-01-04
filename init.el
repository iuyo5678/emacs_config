;; -*- Emacs-Lisp -*-
;; Time-stamp: <2021-03-15 18:15:56 Monday by zhangguhua>
;; zgh的emacs配置启动文件

(if (eq system-type 'windows-nt)
    (setenv "PATH"
       (concat
        "C:/Users/drakezhang/scoop/shims" ";"
        "C:/Users/drakezhang/scoop/apps/coreutils/current/bin" ";"
        (getenv "PATH"))
       )
  nil)
;;(message (getenv "PATH"))
;;定义所有常用路径
(defconst my-emacs-path           "C:/Users/drakezhang/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "mylisps/") "我自己找的一些的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "elpa/") "一些安装lisp包路径，后面想用elpa升级")
(defconst my-custom-config-path (concat my-emacs-path "personal/") "一些自己自定义的配置信息，如自己的个人信息，个人博客配置等")
(defconst my-emacs-doc-path (concat my-emacs-path "docs/"))
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "模板路径")
(defconst my-org-file-path "~/Documents/WorkDir/EmacsOrg/" "org文件存储路径")

(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("mylisps" "personal"))
    (push (expand-file-name dir my-emacs-path) load-path)))
(advice-add #'package-initialize :after #'update-load-path)
(update-load-path)

(require 'zgh-startup)

;;初始化配置elpa
(require 'init-elpa)

(require 'zgh-misc)

(require 'init-hydra)

(require 'face-settings)

(require 'edit-settings)

(require 'init-ivy)

(require 'company-settings)

(require 'dired-settings)

(require 'highlight-settings)

(require 'windows-settings)

(require 'view-settings)

(require 'dev-settings)

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
