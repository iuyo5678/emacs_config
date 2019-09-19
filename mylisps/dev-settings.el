;; -*- Emacs-Lisp -*-

;; Time-stamp: <2019-09-19 21:04:23 Thursday by drakezhang>

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

;; hs-minor-mode,折叠代码
(require 'hs-minor-mode-settings)

;; 所有关于括号的配置
(require 'all-paren-settings)

;; 用来显示当前光标在哪个函数
(require 'which-func-settings)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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

;; 显示变量, 函数的声明
(require 'eldoc-settings)

;; 方便开发c/c++的配置
(require 'c-settings)

;; 放在kde-emacs后面
(require 'compile-settings)

;;写html的配置
(require 'html-settings)

(require 'python-settings)

(require 'sed-settings)


(require 'yasnippet)
(yas-global-mode 1)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))


;; 高亮显示TODO、FIXME、BUG
(require 'fixme-mode)
(defvar my-highlight-words
  '("FIXME" "TODO" "BUG"))
;; Ensure that the variable exists.
(defvar wcheck-language-data nil)
(push '("FIXME"
        (program . (lambda (strings)
                     (let (found)
                       (dolist (word my-highlight-words found)
                         (when (member word strings)
                           (push word found))))))
        (face . highlight)
        (read-or-skip-faces
         (nil)))
      wcheck-language-data)
(fixme-mode 1)
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

;;hide lines
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key (kbd "C-c /") 'hide-lines)

(provide 'dev-settings)
