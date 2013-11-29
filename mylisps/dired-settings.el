;; -*- Emacs-Lisp -*-

;; Time-stamp: <2013-11-29 11:53:31 Friday by zhangguhua>

(require 'dired-single)
(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (dired-single-buffer "..")))
            (setq dired-single-use-magic-buffer t)
            (setq dired--single-magic-buffer-name "*dired*")))
(global-set-key (kbd "C-x d")
                'dired-single-magic-buffer)

(require 'dired-view)
(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)

(provide 'dired-settings)
