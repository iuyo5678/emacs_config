;; -*- Emacs-Lisp -*-
;; Time-stamp: <2016-08-19 19:16:19 Friday by zhangguhua>
;; zgh的emacs配置启动文件

;; 定义相关的路径，

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst my-emacs-path           "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "mylisps/") "我自己找的一些的emacs lisp包的路径")
(defconst my-emacs-lisps-path     (concat my-emacs-path "elpa/") "一些安装lisp包路径，后面想用elpa升级")
(defconst my-custom-config-path (concat my-emacs-path "lisps/") "一些自己自定义的配置信息，如自己的个人信息，个人博客配置等")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "模板路径")


;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
(my-add-subdirs-to-load-path my-custom-config-path)

;;初始化配置elpa
(require 'init-elpa)

;;color theme
(require-package 'color-theme)
(setq color-theme-initialize t)
;;主题配置
(require 'face-settings)
(require 'color-theme-ahei)


;;auto-complete配置
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)


;; slime setup
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'emacs-lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(slime-setup '(slime-fancy))
(slime-setup '(slime-repl))

(require 'exec-path-from-shell) 

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (setq default-directory "~"))

;; 配置yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; 一些基本的小函数
(require 'zgh-misc)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

(require 'util)

;; 一些Emacs的小设置
(require 'misc-settings)
;; 状态栏的配置
(require 'mode-line-settings)

;;个人信息的设置
(require 'personal-info)

;; 编码设置
(require 'coding-settings)

(require 'cua-settings)
(require 'rect-mark-settings)
(require 'mouse-settings)
(require 'mark-settings)
;; 字体配置
(require 'font-settings)

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))

;; 显示行号
(require 'linum-settings)

;; 高亮显示光标的字符
(require 'feng-highlight)
;; 绑定在快捷键M-i上
(global-set-key (kbd "M-i") 'feng-highlight-at-point)

;; 不要menu-bar和tool-bar
(menu-bar-mode -1)
;; GUI下显示toolbar的话select-buffer会出问题
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))


(defun visit-.emacs ()
  "访问.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path "init.el")))
(global-set-key (kbd "C-x E") 'visit-.emacs)
 

(defun goto-my-emacs-lisps-dir ()
  "Goto `my-emacs-lisps-path'."
  (interactive)
  (dired my-emacs-lisps-path))
(defun goto-my-emacs-my-lisps-dir ()
  "Goto `my-emacs-my-lisps-path'."
  (interactive)
  (dired my-emacs-my-lisps-path))
(defun goto-my-emacs-dir ()
  "Goto `my-emacs-path'."
  (interactive)
  (dired my-emacs-path))
(defun goto-my-home-dir ()
  "Goto my home directory."
  (interactive)
  (dired "~"))
(define-key-list
  global-map
  `(("C-x G l" goto-my-emacs-lisps-dir)
    ("C-x G m" goto-my-emacs-my-lisps-dir)
    ("C-x G e" goto-my-emacs-dir)
    ("C-x M-H" goto-my-home-dir)))

;; 用chrome打开链接
(if (executable-find "chrome")
        (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "chrome"))
;;输入命令自动补全
(require 'icomplete-settings)

;; 自动打开压缩文件
(auto-compression-mode 1)

;;智能改变光标形状
(require 'cursor-change)
(cursor-change-mode 1)

(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;(require 'select-buffer)
(require 'ido-settings)
;;
(require 'helm-settings)
;;dired模式的一些配置
(require 'dired-settings)

;; 可以为重名的buffer在前面加上其父目录的名字来让buffer的名字区分开来，而不是单纯的加一个没有太多意义的序号
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; 用一个很大的kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 200)

;; time-stamp, 在文件头记录修改时间, 并动态更新
(require 'time-stamp-settings)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

;;增加丰富的高亮
(require 'generic-x)

;;所有关于模板的配置
(require 'template-settings)

;;显示ascii表
(require 'ascii)

;;编辑方面的设置
(require 'edit-settings)

;;所有开发方面的配置
(require 'dev-settings)


;; 方便的切换major mode
(defvar switch-major-mode-last-mode nil)

(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))

(defun switch-major-mode (mode)
  "切换major mode"
  (interactive
   (let ((fn switch-major-mode-last-mode) val)
     (setq val
           (completing-read
            (if fn (format "切换major-mode为(缺省为%s): " fn) "切换major mode为: ")
            obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
     (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))
(global-set-key (kbd "C-x q") 'switch-major-mode)


(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s, mode-name为%s" major-mode mode-name))
(global-set-key (kbd "C-x m") 'get-mode-name)


(fset 'kill-head-blank
   "\C-a\C-@\C-[m\C-?\C-n")
(require 'shell-mode-settings)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(require  'wcy-desktop)
(wcy-desktop-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode yasnippet switch-window sr-speedbar smex slime org markdown-mode magit jedi ido-ubiquitous helm color-theme)))
 '(template-use-package t nil (template)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-info ((((type tty)) :bold t :foreground "green") (t :foreground "green")))
 '(compilation-warning ((((class color)) :foreground "red" :bold nil)))
 '(completions-first-difference ((((class color) (background dark)) (:foreground "red"))))
 '(diff-added ((((type tty pc)) :foreground "yellow") (t :foreground "aquamarine")))
 '(diff-changed ((((type tty pc)) :foreground "red" :background "blue") (t :foreground "deep pink")))
 '(diff-context ((((class grayscale) (background light)) (:foreground "LightGray" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid")) (((class color) (min-colors 88) (background dark)) (:foreground "cornflower blue")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue")) (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(diff-file-header ((((class color)) :foreground "magenta")))
 '(diff-header ((((class color)) :foreground "green")))
 '(diff-hunk-header ((((type tty pc)) :bold t :foreground "green") (t :foreground "OliveDrab1")))
 '(diff-index ((((class color)) :foreground "cyan")))
 '(diff-indicator-added ((((type tty pc)) :foreground "red" :background "white") (t :foreground "red" :background "white")))
 '(diff-indicator-removed ((((type tty pc)) :foreground "yellow" :background "red") (t :foreground "yellow" :background "red")))
 '(diff-refine-changed ((((type tty pc)) :foreground "white" :background "blue") (t :foreground "dark orchid")))
 '(diff-removed ((((class color)) :foreground "red")))
 '(eldoc-highlight-function-argument ((((type tty)) :bold t :foreground "green") (t :bold nil :foreground "green")))
 '(font-lock-comment-delimiter-face ((((type tty)) :bold t :foreground "red") (t :foreground "chocolate1")))
 '(font-lock-constant-face ((((type tty)) :bold t :background "white" :foreground "blue") (t :background "darkslateblue" :foreground "chartreuse")))
 '(font-lock-doc-face ((((type tty)) :foreground "green") (t (:foreground "maroon1"))))
 '(font-lock-function-name-face ((((type tty)) :bold t :background "yellow" :foreground "blue") (t :background "#45D463DD4FF8" :foreground "yellow")))
 '(font-lock-regexp-grouping-backslash ((((type tty)) :foreground "red") (t (:foreground "red"))))
 '(font-lock-regexp-grouping-construct ((((type tty)) :foreground "yellow") (t (:foreground "yellow"))))
 '(font-lock-type-face ((((type tty)) :bold t :foreground "green") (t (:foreground "green"))))
 '(font-lock-warning-face ((t (:background "red" :foreground "white"))))
 '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
 '(ido-first-match ((((type tty pc)) :foreground "yellow") (t :bold nil :foreground "yellow")))
 '(ido-only-match ((((class color)) (:bold nil :foreground "green"))))
 '(info-header-node ((((class color) (background dark)) (:foreground "red"))))
 '(info-menu-header ((((type tty pc)) :underline t :weight bold) (t :inherit nil :foreground "coral2" :bold nil)))
 '(info-title-1 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "yellow")))
 '(info-title-2 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "lightblue")))
 '(info-title-3 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "violetred1")))
 '(info-title-4 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "green")))
 '(info-xref ((((type tty)) :inherit link) (t :foreground "#165ACBD1FFFF" :underline t)))
 '(isearch-fail ((((class color)) (:background "red"))))
 '(linum ((((background dark)) :foreground "cyan") (t :foreground "gray")))
 '(match ((((class color) (min-colors 88) (background light)) :background "yellow1") (((class color) (min-colors 88) (background dark)) :background "RoyalBlue3" :foreground "cyan") (((class color) (min-colors 8) (background light)) :background "yellow" :foreground "black") (((class color) (min-colors 8) (background dark)) :background "blue" :foreground "white") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold))))
 '(region ((((class color) (min-colors 88) (background dark)) :background "#4CAA4CAA4CAA") (((class color) (min-colors 88) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 16) (background dark)) :background "wheat") (((class color) (min-colors 16) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 8)) :background "blue" :foreground "red") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(svn-status-filename-face ((((type tty)) :bold t :foreground "yellow") (t :foreground "yellow"))))
