;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-02-27 21:20:59 Friday by nilin>
(require 'shell)
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(define-key shell-mode-map (kbd "C-l") 'clear-shell)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'shell-mode-settings)
