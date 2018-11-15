;; -*- Emacs-Lisp -*-

;; Time-stamp: <2018-11-06 00:31:26 Tuesday by zhangguhua>
(require 'shell)
(require 'term)
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(define-key shell-mode-map (kbd "C-l") 'clear-shell)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
 (add-hook 'eshell-preoutput-filter-functions
           'ansi-color-filter-apply)

(provide 'shell-mode-settings)
