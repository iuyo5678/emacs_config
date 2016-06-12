;; -*- Emacs-Lisp -*-

;; Time-stamp: <2016-06-12 17:20:57 Sunday by zhangguhua>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 14)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 13")))

(provide 'font-settings)
