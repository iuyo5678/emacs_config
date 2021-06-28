;;; zgh-misc.el --- Some basic utility function of ahei
;; -*- Emacs-Lisp -*-

;; Time-stamp: <2021-03-15 18:11:32 Monday by zhangguhua>

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


;;; Commentary:
;;

;;; Code:
(use-package zgh-utils
  :ensure nil
  :demand t
  :bind
  (("C-]" . goto-paren))
  :config
  (when (memq window-system '(mac ns))
    (setq default-directory "~"))
  ;; 不要总是没完没了的问yes or no, 为什么不能用y/n
  (fset 'yes-or-no-p 'y-or-n-p)
  ;; 不要闪烁光标, 烦不烦啊
  (blink-cursor-mode -1)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  ;;鼠标更加平平滑
  (when (display-graphic-p)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
          mouse-wheel-progressive-speed nil))

  (setq default-buffer-file-coding-system 'utf-8
	    kill-do-not-save-duplicates t
	    scroll-margin 3
	    scroll-step 1
	    scroll-conservatively 100000
	    show-paren-mode 1  ;; 显示匹配的括号
	    visible-bell t
	    inhibit-compacting-font-caches t  ; Don’t compact font caches during GC.
	    delete-by-moving-to-trash t       ; Deleting files go to OS's trash folder
	    auto-save-default t             ; Disable auto save
	    uniquify-buffer-name-style 'post-forward-angle-brackets ; Show path if names are same
	    adaptive-fill-regexp "[ t]+|[ t]*([0-9]+.|*+)[ t]*"
	    adaptive-fill-first-line-regexp "^* *$"
	    sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*"
	    sentence-end-double-space nil
	    backup-by-copying t ; 自动备份
	    backup-directory-alist
	    '(("." . "~/.em_backup")) ; 自动备份在目录"~/.em_backup"下
	    delete-old-versions t ; 自动删除旧的备份文件
	    kept-new-versions 3 ; 保留最近的3个备份文件
	    kept-old-versions 1 ; 保留最早的1个备份文件
	    version-control t) ; 多次备份
  )
(global-set-key (kbd "C-x m") 'get-mode-name)

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-variables '("PATH" "MANPATH")
	    exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))


;; Start server
(use-package server
  :ensure nil
  :hook (after-init . server-mode))

(use-package recentf
  :ensure nil
  :defer 1
  :bind (("C-x C-r" . recentf-open-files))
  :hook (after-init . recentf-mode)
  :init (setq recentf-max-saved-items 300
              recentf-exclude
              '("\\.?cache" ".cask" "url" "COMMIT_EDITMSG\\'" "bookmarks"
                "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
                "\\.?ido\\.last$" "\\.revive$" "/G?TAGS$" "/.elfeed/"
                "^/tmp/" "^/var/folders/.+$" "^/ssh:" "/persp-confs/"
                (lambda (file) (file-in-directory-p file package-user-dir))))
  :config
  (push (expand-file-name recentf-save-file) recentf-exclude)
  (add-to-list 'recentf-filename-handlers #'abbreviate-file-name))


(use-package simple
  :defer t
  :ensure nil
  :hook ((after-init . size-indication-mode)
         (text-mode . visual-line-mode)
         ((prog-mode markdown-mode conf-mode) . enable-trailing-whitespace))
  :bind ("C-2". set-mark-command)
  :init
  (setq column-number-mode t
        line-number-mode t
        line-move-visual nil
        track-eol t                     ; Keep cursor at end of lines. Require line-move-visual is nil.
        set-mark-command-repeat-pop t)  ; Repeating C-SPC after popping mark pops it again

  ;; Visualize TAB, (HARD) SPACE, NEWLINE
  (setq-default show-trailing-whitespace nil) ; Don't show trailing whitespace by default
  (defun enable-trailing-whitespace ()
    "Show trailing spaces and delete on saving."
    (setq show-trailing-whitespace t)
    (add-hook 'before-save-hook #'delete-trailing-whitespace nil t)))


(use-package so-long
  :hook (after-init . global-so-long-mode)
  :config (setq so-long-threshold 400))

(use-package time
  :ensure nil
  :unless (display-graphic-p)
  :hook (after-init . display-time-mode)
  :init (setq display-time-24hr-format t
              display-time-day-and-date t))


;; Pass a URL to a WWW browser
(use-package browse-url
  :ensure nil
  :defines dired-mode-map
  :bind (("C-c C-z ." . browse-url-at-point)
         ("C-c C-z b" . browse-url-of-buffer)
         ("C-c C-z r" . browse-url-of-region)
         ("C-c C-z u" . browse-url)
         ("C-c C-z e" . browse-url-emacs)
         ("C-c C-z v" . browse-url-of-file))
  :init
  (with-eval-after-load 'dired
    (bind-key "C-c C-z f" #'browse-url-of-file dired-mode-map)))

;; Click to browse URL or to send to e-mail address
(use-package goto-addr
  :ensure nil
  :hook ((text-mode . goto-address-mode)
         (prog-mode . goto-address-prog-mode)))


(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa)

(provide 'zgh-misc)

;;; zgh-misc.el ends here
