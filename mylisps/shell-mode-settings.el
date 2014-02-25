;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-02-25 13:18:19 Tuesday by work>
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(provide 'shell-mode-settings)
