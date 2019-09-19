;; -*- Emacs-Lisp -*-

;; Time-stamp: <2019-08-08 11:52:25 Thursday by zhangguhua>
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
