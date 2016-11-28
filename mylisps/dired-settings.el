;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-02-27 16:24:18 Friday by work>
(require 'dired)
(require 'dired-single)
(add-hook 'dired-mode-hook
          (lambda ()
            (require 'dired-sort-menu)
            (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (dired-single-buffer "..")))
            (setq dired-single-use-magic-buffer t)
            (setq dired-single-magic-buffer-name "*dired*")))

(global-set-key (kbd "C-x d")
                'dired-single-magic-buffer)
(global-set-key (kbd "C-x 4 d")
                (lambda (directory)
                  (interactive "D")
                  (let ((win-list (window-list)))
                    (when (null (cdr win-list)) ; only one window
                      (split-window-vertically))
                    (other-window 1)
                    (dired-single-magic-buffer directory))))

(require 'dired-view)
(add-hook 'dired-mode-hook 'dired-view-minor-mode-on)
(define-key dired-mode-map (kbd ";") 'dired-view-minor-mode-toggle)

(provide 'dired-settings)
