;; -*- Emacs-Lisp -*-

;; Time-stamp: <2018-11-15 23:38:31 Thursday by zhangguhua>

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

;; Xrefactory
;;(require 'xref-settings)

;; snavigator
(require 'sn)

(eal-define-keys
 `(c-mode-base-map)
 `(("C-h"     c-electric-backspace)
   ("C-c M-a" beginning-of-defun)
   ("C-c M-e" end-of-defun)
   ("C-c M-F" copy-current-fun-name)))

;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)

;; Set key bindings
(eval-after-load "helm-gtags"
    '(progn
         
         (setq helm-gtags-ignore-case t
               helm-gtags-auto-update t
               helm-gtags-use-input-at-cursor t
               helm-gtags-pulse-at-cursor t
               helm-gtags-prefix-key "\C-cg"
               helm-gtags-suggested-key-mapping t)

         (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
         (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
         (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
         (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
         (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
         (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
         (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
         (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
         (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
         (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))


(defvar buffer-size-threshold (* 1024 300)
    "Delta in size over which the user will be warned when saving.")
(defun check-buffer-too-large ()
    "Warn user if buffer has changed by more than CHECK-BUFFER-SIZE-DELTA since last save"
        (if (> (buffer-size) buffer-size-threshold)
                (nlinum-mode)))

(defun cc-mode-settings ()
  "Settings for `cc-mode'."
  (defun c-mode-common-hook-settings ()
    "Settings for `c-mode-common-hook'."
    (c-set-style "awk")
    ;; 饥饿的删除键
    (c-toggle-hungry-state)
    ;; 对subword进行操作，而不是整个word
    (subword-mode t))

  (add-hook 'c-mode-common-hook 'c-mode-common-hook-settings)

  (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (global-cwarn-mode 1)

  ;; 快速include一个系统/用户头文件
  (mapc
   (lambda (mode)
     (define-abbrev-table mode '(("incy" "" skeleton-include 1)))
     (define-abbrev-table mode '(("incz" "" skeleton-include-user 1))))
   '(c-mode-abbrev-table c++-mode-abbrev-table))

  ;; 输入incy,可以自动提示输入文件名称,可以自动补全.
  (define-skeleton skeleton-include
    "产生#include<>" "" > "#include <"
    (completing-read "包含系统头文件: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    system-head-file-dir)))) ">\n")
  (define-skeleton skeleton-include-user
    "产生#include\"\"" "" > "#include \""
    (completing-read "包含用户头文件: "
                     (mapcar #'(lambda (f) (list f ))
                             (apply 'append (mapcar #'(lambda (dir) (directory-files dir))
                                                    user-head-file-dir)))) "\"\n")

  (defvar c/c++-hightligh-included-files-key-map nil)
  (unless c/c++-hightligh-included-files-key-map
    (setq c/c++-hightligh-included-files-key-map (make-sparse-keymap))
    (define-key-list
      c/c++-hightligh-included-files-key-map
      `(("<RET>"    find-file-at-point)
        ("<return>" find-file-at-point))))
  (defun c/c++-hightligh-included-files ()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode))
      (save-excursion
        (goto-char (point-min))
        ;; remove all overlay first
        (mapc (lambda (ov) (if (overlay-get ov 'c/c++-hightligh-included-files)
                               (delete-overlay ov)))
              (overlays-in (point-min) (point-max)))
        (while (re-search-forward "^[ \t]*#include[ \t]+[\"<]\\(.*\\)[\">]" nil t nil)
          (let* ((begin  (match-beginning 1))
                 (end (match-end 1))
                 (ov (make-overlay begin end)))
            (overlay-put ov 'c/c++-hightligh-included-files t)
            (overlay-put ov 'keymap c/c++-hightligh-included-files-key-map)
            (overlay-put ov 'face 'underline))))))
  ;; 这不是一个好办法，也可以把它加载到c-mode-hook or c++-mode-hook中
  (setq c/c++-hightligh-included-files-timer (run-with-idle-timer 0.5 t 'c/c++-hightligh-included-files))
  ;; c中隐藏ifdef
  (require 'hide-ifdef-settings)

  ;; cedet 强大的开发工具, 包括代码浏览, 补全, 类图生成
  ;; 用CEDET浏览和编辑C++代码 http://emacser.com/cedet.htm
  (require 'cc-mode)
  (require 'semantic)

  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-idle-summary-mode 1)
  
  (semantic-mode 1)

  (defun alexott/cedet-hook ()
      (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
      (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

  (add-hook 'c-mode-common-hook 'alexott/cedet-hook)
  (add-hook 'c-mode-hook 'alexott/cedet-hook)
  (add-hook 'c++-mode-hook 'alexott/cedet-hook)

  (add-hook 'c-mode-hook 'check-buffer-too-large)
  (add-hook 'c++-mode-hook 'check-buffer-too-large)


  (require 'ede)
  (global-ede-mode)
  (require 'company-c-headers)
  (add-to-list 'company-backends 'company-c-headers)
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete)
  (add-hook 'c-mode-common-hook 'check-buffer-too-large)
  (defalias 'cpp-mode 'c++-mode))

;;在第一行显示函数名称
;;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;;(require 'stickyfunc-enhance)


(eval-after-load "cc-mode"
  `(cc-mode-settings))



(provide 'c-settings)
