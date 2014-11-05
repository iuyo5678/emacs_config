;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-09-12 20:38:35 Friday by nilin>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 17)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 18")))

(provide 'font-settings)
