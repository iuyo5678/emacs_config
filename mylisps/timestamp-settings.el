;;; timestamp-settings --- write timestamp to file before save -*- lexical-binding:t -*-

;; Copyright (C) 2024

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; Custom settings for EIN to use uv and jupyter

;;; Code:

;; Time-stamp: <2021-03-11 14:21:06 星期一 by zhangguhua>

(add-hook 'before-save-hook 'time-stamp)

(eval-after-load "time-stamp"
  '(progn
     (setq time-stamp-pattern "%Y-%02m-%02d %02H:%02M:%02S %:a by %u")))


(provide 'timestamp-settings)
;;; timestamp-settings.el ends here
