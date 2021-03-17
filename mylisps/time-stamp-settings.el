;; -*- Emacs-Lisp -*-

;; Time-stamp: <2021-03-11 14:21:06 Thursday by zhangguhua>

(add-hook 'write-file-hooks 'time-stamp)

(eval-after-load "time-stamp"
  '(progn
     (setq time-stamp-format "%Y-%02m-%02d %02H:%02M:%02S %:a by %u")))

(provide 'time-stamp-settings)
