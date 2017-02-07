;; -*- Emacs-Lisp -*-

;; Time-stamp: <2017-02-07 15:03:16 Tuesday by wls81>
(require 'ahei-face)
(require 'color-theme-ahei)
;;(color-theme-initialize)
;; 是否使用黑色背景
(defvar use-black-background t "*Use black ground or not.")

;; 基本颜色设置
(require 'base-face-settings)

;; mode-line颜色设置
(require 'mode-line-face-settings)

;; `which-func'颜色设置
(require 'which-func-face-settings)

;; 括号颜色设置
(require 'paren-face-settings)

;; `isearch'颜色设置
(require 'isearch-face-settings)

(require 'help-mode-face-settings)
(require 'cedet-face-settings)
(require 'browse-kill-ring-face-settings)
(require 'ido-face-settings)
(require 'linum-face-settings)
(require 'font-lock-face-settings)
(require 'minibuffer-face-settings)
(require 'apropos-face-settings)
(require 'twit-face-settings)
(require 'diff-face-settings)
(require 'ediff-face-settings)
(require 'moccur-face-settings)
(require 'man-face-settings)
(require 'info-face-settings)
(require 'info+-face-settings)
(require 'mic-paren-face-settings)
(require 'log-view-face-settings)
(require 'woman-face-settings)
(require 'replace-face-settings)
(require 'sh-mode-face-settings)
(require 'icomplete+-face-settings)
(require 'compile-face-settings)
(require 'svn-face-settings)
(require 'dired+-face-settings)
(require 'w3m-face-settings)
(require 'highlight-symbol-face-settings)
(require 'highlight-tail-face-settings)
(require 'eldoc-face-settings)
(require 'zjl-hl-face-settings)
(mapc 'require '(pulse-face-settings hs-minor-mode-face-settings perl-face-settings))

(when (fboundp 'color-theme-adjust-hl-line-face)
  (color-theme-adjust-hl-line-face))

(defface hl-line-nonunderline-face
  '((((type tty)))
    (t :background "AntiqueWhite4" :inverse-video nil))
  "`hl-line-face' without `underline'.")

(require 'color-theme-solarized)
(require 'color-theme-tango)
(require 'color-theme-colorful-obsolescence)
(require 'color-theme-folio)
(require 'color-theme-tangotango)
(require 'tomorrow-night-theme)

(provide 'face-settings)
