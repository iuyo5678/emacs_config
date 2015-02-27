;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-02-27 16:44:29 Friday by work>
(require 'shell)
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(define-key shell-mode-map (kbd "C-l") 'clear-shell)

(provide 'shell-mode-settings)
