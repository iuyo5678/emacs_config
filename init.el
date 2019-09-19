;; -*- Emacs-Lisp -*-
;; Time-stamp: <2019-09-20 00:19:48 Friday by zhangguhua>
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

;;主题配置
(require 'face-settings)

;; 自动补全的配置
(require 'company-settings)
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
;;(require 'font-settings)

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))

;; 显示行号
(require 'linum-settings)
(require 'anzu)
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

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

(require 'helm-settings)

(require 'ido-settings)

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

(require 'shell-mode-settings)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(require  'wcy-desktop)
(wcy-desktop-init)
