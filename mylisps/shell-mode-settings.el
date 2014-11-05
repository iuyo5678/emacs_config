;; -*- Emacs-Lisp -*-

;; Time-stamp: <2014-09-13 00:12:11 Saturday by nilin>
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(provide 'shell-mode-settings)
