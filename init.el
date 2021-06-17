;; -*- Emacs-Lisp -*-
;; Time-stamp: <2021-03-15 18:15:56 Monday by zhangguhua>
;; zgh的emacs配置启动文件

;; 定义相关的路径，

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(defconst my-emacs-path           "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "mylisps/") "我自己找的一些的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "elpa/") "一些安装lisp包路径，后面想用elpa升级")
(defconst my-custom-config-path (concat my-emacs-path "lisps/") "一些自己自定义的配置信息，如自己的个人信息，个人博客配置等")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "模板路径")
(defconst my-org-file-path "~/Dropbox/docs/org/" "org文件存储路径")

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
(my-add-subdirs-to-load-path my-custom-config-path)

(require 'startup)

;;初始化配置elpa
(require 'init-elpa)

(require 'zgh-misc)

(require 'init-hydra)
;;主题配置
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

;;所有关于模板的配置
(require 'template-settings)
