;; -*- Emacs-Lisp -*-

;; Time-stamp: <2018-09-23 22:25:16 Sunday by drakezhang>


(setq my-shebang-patterns
      (list "^#!\\s-*/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*"
            "^#!\\s-*/usr/.*/sh"
            "^#!\\s-*/usr/.*/bash"
            "^#!\\s-*/bin/sh"
            "^#!\\s-*/.*/perl"
            "^#!\\s-*/.*/awk"
            "^#!\\s-*/.*/sed"
            "^#!\\s-*/.*/tclsh$"
            "^#!\\s-*/.*/expect$"
            "^#!\\s-*/bin/bash"))
(add-hook
 'after-save-hook
 (lambda ()
   (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
       (progn
         ;; This puts message in *Message* twice, but minibuffer
         ;; output looks better.
         (message (concat "Wrote " (buffer-file-name)))
         (save-excursion
           (goto-char (point-min))
           ;; Always checks every pattern even after
           ;; match.  Inefficient but easy.
           (dolist (my-shebang-pat my-shebang-patterns)
             (if (looking-at my-shebang-pat)
                 (if (= (shell-command
                         (concat "chmod u+x " (buffer-file-name)))
                        0)
                     (message (concat
                               "Wrote and made executable "
                               (buffer-file-name))))))))
     ;; This puts message in *Message* twice, but minibuffer output
     ;; looks better.
     (message (concat "Wrote " (buffer-file-name))))))

(eal-define-keys
 'sh-mode-map
 `(("<"       self-insert-command)
   ("C-c M-c" sh-case)
   ("C-c C-c" comment)
   ("C-c g"   bashdb)))

(defun sh-mode-settings ()
  "settings for `sh-mode'."
  (font-lock-add-keywords 'sh-mode '(("\\<\\(local\\|let\\)\\>" . font-lock-keyword-face))))

(eval-after-load "sh-script"
  `(sh-mode-settings))

(provide 'sh-mode-settings)
