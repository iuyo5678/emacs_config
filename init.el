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
;;主题配置
(require 'face-settings)

(require 'init-hydra)

(require 'edit-settings)

(require 'init-ivy)

(require 'company-settings)

(require 'calendar)

(require 'dired-settings)

(require 'highlight-settings)

(require 'windows-settings)

(require 'dev-settings)

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

;; 状态栏的配置
(require 'mode-line-settings)

(require 'helm-settings)

;;所有关于模板的配置
(require 'template-settings)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(package-selected-packages
   '(counsel-osx-app ivy-hydra magit-todos forge modern-cpp-font-lock overseer helpful macrostep highlight-defined gitignore-mode gitconfig-mode gitattributes-mode browse-at-remote git-messenger git-timemachine ob-mermaid ob-go org-fancy-priorities org-superstar ox-gfm markdown-toc grip-mode shell-pop vterm xterm-color esh-help esh-autosuggest eshell-prompt-extras treemacs-persp treemacs-magit treemacs-projectile shackle yasnippet-snippets company-prescient ws-butler which-key web-mode use-package undo-tree switch-window stickyfunc-enhance paradox mixed-pitch lsp-ui ivy-yasnippet ivy-xref ivy-prescient hide-mode-line helm-xref helm-smex helm-lsp gnu-elpa-keyring-update flycheck exec-path-from-shell elpy diminish default-text-scale dap-mode counsel-world-clock counsel-tramp counsel-projectile company-c-headers company-box comment-dwim-2 color-theme-sanityinc-tomorrow ccls avy-zap auto-package-update anzu amx all-the-icons-ivy-rich aggressive-indent ace-pinyin ace-link))
 '(scroll-bar-mode nil)
 '(template-use-package t nil (template)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:foreground "darkseagreen2" :background nil))))
 '(diff-hl-delete ((t (:background nil))))
 '(diff-hl-insert ((t (:background nil))))
 '(git-timemachine-minibuffer-author-face ((t (:inherit success))))
 '(git-timemachine-minibuffer-detail-face ((t (:inherit warning))))
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil))))
 '(lsp-headerline-breadcrumb-path-error-face ((t :underline (:style wave :color "Red1") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-hint-face ((t :underline (:style wave :color "ForestGreen") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-info-face ((t :underline (:style wave :color "ForestGreen") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-warning-face ((t :underline (:style wave :color "DarkOrange") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-symbols-error-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "Red1"))))
 '(lsp-headerline-breadcrumb-symbols-hint-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "ForestGreen"))))
 '(lsp-headerline-breadcrumb-symbols-info-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "ForestGreen"))))
 '(lsp-headerline-breadcrumb-symbols-warning-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "DarkOrange"))))
 '(lsp-ui-sideline-code-action ((t (:inherit warning))))
 '(macrostep-expansion-highlight-face ((t (:background "lightyellow" :extend t))))
 '(org-ellipsis ((t (:foreground nil))))
 '(pulse-highlight-face ((t (:inherit region))))
 '(pulse-highlight-start-face ((t (:inherit region))))
 '(symbol-overlay-default-face ((t (:inherit (region bold))))))
