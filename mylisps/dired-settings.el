;; -*- Emacs-Lisp -*-

;; Time-stamp: <2013-11-29 00:28:05 Friday by nilin>

(require 'dired-single)
(add-hook 'dired-load-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'joc-dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'joc-dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (joc-dired-single-buffer "..")))
            (setq joc-dired-use-magic-buffer t)
            (setq joc-dired-magic-buffer-name "*dired*")))
(global-set-key (kbd "C-x d")
                'joc-dired-magic-buffer)

(require 'dired-view)
(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)

(provide 'dired-settings)
