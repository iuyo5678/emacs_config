;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-02-27 15:30:25 Friday by work>

(require 'ahei-face)
(require 'color-theme-ahei)

;; �Ƿ�ʹ�ú�ɫ����
(defvar use-black-background t "*Use black ground or not.")

;; ������ɫ����
(require 'base-face-settings)

;; mode-line��ɫ����
(require 'mode-line-face-settings)

;; `which-func'��ɫ����
(require 'which-func-face-settings)

;; ������ɫ����
(require 'paren-face-settings)

;; `isearch'��ɫ����
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

(provide 'face-settings)
