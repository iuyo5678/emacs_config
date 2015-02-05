;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-02-06 01:06:02 Friday by work>
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))
(define-key shell-mode-map (kbd "C-l") 'clear-shell)

(provide 'shell-mode-settings)
