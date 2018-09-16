;; -*- Emacs-Lisp -*-

;; Time-stamp: <2018-09-16 21:33:53 Sunday by drakezhang>

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

;; 语法高亮
(global-font-lock-mode t)

;; 增加自定义关键字
(dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode
                       lisp-interaction-mode sh-mode sgml-mode python-mode))
  (font-lock-add-keywords
   mode
   '(("\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\):" 1 font-lock-warning-face prepend)
     ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
     ("(\\|)" . beautiful-blue-face)
     ("\\[\\|]" . yellow-face)
     ("<\\|>" . cyan-face)
     ("{\\|}" . green-face))))

(defun generate-tag-table ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (let ((exp "") (dir ""))
    (setq dir (read-from-minibuffer "generate tags in: " default-directory)
          exp (read-from-minibuffer "suffix: "))
    (with-temp-buffer
      (shell-command
       (concat "find " dir " -name \"" exp "\" | xargs etags ")
       (buffer-name)))))

;; hs-minor-mode,折叠代码
(require 'hs-minor-mode-settings)


;; 动态检查语法错误
(require 'flymake-settings)

(defun skeleton-c-mode-left-brace (arg)
  (interactive "P")
  (if  (c-in-literal (c-most-enclosing-brace (c-parse-state)))
      (self-insert-command 1)
    ;; auto insert complex things.
    (let* ((current-line (delete-and-extract-region (line-beginning-position) (line-end-position)))
           (lines (and arg (mark t) (delete-and-extract-region (mark t) (point))))
           (after-point (make-marker)))
       ;;; delete extra blank begin and after the LINES
      (setq lines (and lines
                       (with-temp-buffer
                         (insert lines)
                         (beginning-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (end-of-buffer)
                         (delete-blank-lines)
                         (delete-blank-lines)
                         (buffer-string))))
      (save-excursion
        (let* ((old-point (point)))
          (insert (if current-line current-line "")  "{\n")
          (and lines (insert lines))
          (move-marker after-point (point))
          (insert "\n}")
          (indent-region old-point (point) nil)))
      (goto-char after-point)
      (c-indent-line))))

;; 所有关于括号的配置
(require 'all-paren-settings)

;; 用来显示当前光标在哪个函数
(require 'which-func-settings)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(require 'autoconf-mode-settings)

;; `gdb'
(require 'gud-settings)

;; 版本控制
(require 'vc-settings)

;; 写配置文件时的mode，ini文件conf文件
(require 'any-ini-mode)
(add-to-list 'auto-mode-alist '(".*\\.ini$" . any-ini-mode))
(add-to-list 'auto-mode-alist '(".*\\.conf$" . any-ini-mode))

;; subversion
(require 'svn-settings)
;; magit按键配置
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)


;; 所有关于lisp方面的配置
(require 'all-lisp-settings)
(require 'go-settings)
;; 开发shell程序的mode配置
(require 'sh-mode-settings)

;; protobuffer mode
(require 'protobuf-mode)
(setq auto-mode-alist (cons '("\\.proto$" . protobuf-mode) auto-mode-alist))

;; json的相关处理
(require 'json-mode)
(require 'json-reformat)
(setq my-shebang-patterns
      (list "^#!\\s-*/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*"
            "^#!\\s-*/usr/.*/sh"
            "^#!\\s-*/usr/.*/bash"
            "^#!\\s-*/bin/sh"
            "^#!\\s-*/.*/perl"
            "^#!\\s-*/.*/awk"
            "^#!\\s-*/.*/sed"
            "^#!\\s-*/.*/tclsh$"
            "^#!\\s-*/.*/expect$"
            "^#!\\s-*/bin/bash"))
(add-hook
 'after-save-hook
 (lambda ()
   (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
       (progn
         ;; This puts message in *Message* twice, but minibuffer
         ;; output looks better.
         (message (concat "Wrote " (buffer-file-name)))
         (save-excursion
           (goto-char (point-min))
           ;; Always checks every pattern even after
           ;; match.  Inefficient but easy.
           (dolist (my-shebang-pat my-shebang-patterns)
             (if (looking-at my-shebang-pat)
                 (if (= (shell-command
                         (concat "chmod u+x " (buffer-file-name)))
                        0)
                     (message (concat
                               "Wrote and made executable "
                               (buffer-file-name))))))))
     ;; This puts message in *Message* twice, but minibuffer output
     ;; looks better.
     (message (concat "Wrote " (buffer-file-name))))))

;; 显示变量, 函数的声明
(require 'eldoc-settings)

;; 方便开发c/c++的配置
(require 'c-settings)

;; 放在kde-emacs后面
(require 'compile-settings)

;;写html的配置
(require 'html-settings)


;; 回车后indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map sh-mode-map
                 awk-mode-map java-mode-map
                 ruby-mode-map c-mode-base-map tcl-mode-map org-mode-map
                 python-mode-map perl-mode-map)
 `(("RET" newline-and-indent)))

(defun copy-current-fun-name ()
  "Copy current function name."
  (interactive)
  (kill-new (which-function)))

(mapc 'require '(;; hide region
                 hide-region-settings
                 ;; 实现程序变量的自动对齐
                 align-settings
                 ;; 生成c程序调用图
                 ;; http://emacser.com/emacs-cflow.htm
                 cflow-mode-settings
                 python-settings
                 sed-settings
                 ))

(add-hook 'php-mode-hook '(lambda ()
                              (auto-complete-mode t)
                              (require 'ac-php)
                              (setq ac-sources  '(ac-source-php ) )
                              (yas-global-mode 1)

                              (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                              (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                              ))

;;hide lines
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key (kbd "C-c /") 'hide-lines)

;;阅读代码的配置，cscope
(require 'xcscope)


;; cedet 强大的开发工具, 包括代码浏览, 补全, 类图生成
;; 用CEDET浏览和编辑C++代码 http://emacser.com/cedet.htm
;; Emacs才是世界上最强大的IDE － cedet的安装 http://emacser.com/install-cedet.htm
(require 'cedet)
(global-ede-mode t)
(semantic-mode t)

(provide 'dev-settings)
