;; -*- Emacs-Lisp -*-

;; Time-stamp: <2016-07-01 19:30:14 Friday by zhangguhua>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      (huangq-fontset-consolas 14)
      (set-default-font "Monospace 15")))  ;;修改emacs字体大小

(provide 'font-settings)
