;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-11-08 00:28:11 Saturday by nilin>

(require 'cn-weather)

(defalias 'weather 'cn-weather-today)
(defalias 'weather-now 'cn-weather-now)

(provide 'weather-settings)
