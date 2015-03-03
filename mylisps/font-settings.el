;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-01-23 16:16:50 Friday by zhangguhua>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 14)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 15")))

(provide 'font-settings)
