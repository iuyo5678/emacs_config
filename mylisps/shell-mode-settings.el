;; -*- Emacs-Lisp -*-

;; Time-stamp: <2019-08-08 11:52:25 Thursday by zhangguhua>
(use-package eshell
  :ensure nil
  :defines eshell-prompt-function
  :functions eshell/alias
  :hook (eshell-mode . (lambda ()
                         (bind-key "C-l" 'eshell/clear eshell-mode-map)
                         ;; Aliases
                         (eshell/alias "f" "find-file $1")
                         (eshell/alias "fo" "find-file-other-window $1")
                         (eshell/alias "d" "dired $1")
                         (eshell/alias "l" "ls -lFh")
                         (eshell/alias "ll" "ls -l")
                         (eshell/alias "la" "ls -lAFh")
                         (eshell/alias "lr" "ls -tRFh")
                         (eshell/alias "lrt" "ls -lFcrt")
                         (eshell/alias "lsa" "ls -lah")
                         (eshell/alias "lt" "ls -ltFh")))
  :config
  (with-no-warnings
    ;; For compatibility
    (unless (fboundp 'flatten-tree)
      (defalias 'flatten-tree #'eshell-flatten-list))

    (defun eshell/clear ()
      "Clear the eshell buffer."
      (interactive)
      (let ((inhibit-read-only t))
        (erase-buffer)
        (eshell-send-input)))

    (defun eshell/emacs (&rest args)
      "Open a file (ARGS) in Emacs.  Some habits die hard."
      (if (null args)
          ;; If I just ran "emacs", I probably expect to be launching
          ;; Emacs, which is rather silly since I'm already in Emacs.
          ;; So just pretend to do what I ask.
          (bury-buffer)
        ;; We have to expand the file names or else naming a directory in an
        ;; argument causes later arguments to be looked for in that directory,
        ;; not the starting directory
        (mapc #'find-file (mapcar #'expand-file-name (flatten-tree (reverse args))))))
    (defalias 'eshell/e #'eshell/emacs)
    (defalias 'eshell/ec #'eshell/emacs)

    (defun eshell/ebc (&rest args)
      "Compile a file (ARGS) in Emacs. Use `compile' to do background make."
      (if (eshell-interactive-output-p)
          (let ((compilation-process-setup-function
                 (list 'lambda nil
                       (list 'setq 'process-environment
                             (list 'quote (eshell-copy-environment))))))
            (compile (eshell-flatten-and-stringify args))
            (pop-to-buffer compilation-last-buffer))
        (throw 'eshell-replace-command
               (let ((l (eshell-stringify-list (flatten-tree args))))
                 (eshell-parse-command (car l) (cdr l))))))
    (put 'eshell/ebc 'eshell-no-numeric-conversions t)

    (defun eshell-view-file (file)
      "View FILE.  A version of `view-file' which properly rets the eshell prompt."
      (interactive "fView file: ")
      (unless (file-exists-p file) (error "%s does not exist" file))
      (let ((buffer (find-file-noselect file)))
        (if (eq (get (buffer-local-value 'major-mode buffer) 'mode-class)
                'special)
            (progn
              (switch-to-buffer buffer)
              (message "Not using View mode because the major mode is special"))
          (let ((undo-window (list (window-buffer) (window-start)
                                   (+ (window-point)
                                      (length (funcall eshell-prompt-function))))))
            (switch-to-buffer buffer)
            (view-mode-enter (cons (selected-window) (cons nil undo-window))
                             'kill-buffer)))))

    (defun eshell/less (&rest args)
      "Invoke `view-file' on a file (ARGS).

\"less +42 foo\" will go to line 42 in the buffer for foo."
      (while args
        (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
            (let* ((line (string-to-number (match-string 1 (pop args))))
                   (file (pop args)))
              (eshell-view-file file)
              (forward-line line))
          (eshell-view-file (pop args)))))
    (defalias 'eshell/more #'eshell/less))

  ;;  Display extra information for prompt
  (use-package eshell-prompt-extras
    :after esh-opt
    :defines eshell-highlight-prompt
    :commands (epe-theme-lambda epe-theme-dakrone epe-theme-pipeline)
    :init (setq eshell-highlight-prompt nil
                eshell-prompt-function #'epe-theme-lambda))

  ;; Fish-like history autosuggestions
  (use-package esh-autosuggest
    :defines ivy-display-functions-alist
    :bind (:map eshell-mode-map
           ([remap eshell-pcomplete] . completion-at-point))
    :hook ((eshell-mode . esh-autosuggest-mode)
           (eshell-mode . eshell-setup-ivy-completion))
    :init (defun eshell-setup-ivy-completion ()
            "Setup `ivy' completion in `eshell'."
            (setq-local ivy-display-functions-alist
                        (remq (assoc 'ivy-completion-in-region
                                     ivy-display-functions-alist)
                              ivy-display-functions-alist))))

  ;; `eldoc' support
  (use-package esh-help
    :init (setup-esh-help-eldoc))

  ;; `cd' to frequent directory in `eshell'
  (use-package eshell-z
    :hook (eshell-mode . (lambda () (require 'eshell-z)))))


(use-package shell
  :ensure nil
  :hook ((shell-mode . my-shell-mode-hook)
         (comint-output-filter-functions . comint-strip-ctrl-m))
  :init
  (setq system-uses-terminfo nil)

  (with-no-warnings
    (defun my-shell-simple-send (proc command)
      "Various PROC COMMANDs pre-processing before sending to shell."
      (cond
       ;; Checking for clear command and execute it.
       ((string-match "^[ \t]*clear[ \t]*$" command)
        (comint-send-string proc "\n")
        (erase-buffer))
       ;; Checking for man command and execute it.
       ((string-match "^[ \t]*man[ \t]*" command)
        (comint-send-string proc "\n")
        (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
        (setq command (replace-regexp-in-string "[ \t]+$" "" command))
        ;;(message (format "command %s command" command))
        (funcall 'man command))
       ;; Send other commands to the default handler.
       (t (comint-simple-send proc command))))

    (defun my-shell-mode-hook ()
      "Shell mode customization."
      (local-set-key '[up] 'comint-previous-input)
      (local-set-key '[down] 'comint-next-input)
      (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)

      (ansi-color-for-comint-mode-on)
      (setq comint-input-sender 'my-shell-simple-send))))

;; ANSI & XTERM 256 color support
(use-package xterm-color
  :defines (compilation-environment
            eshell-preoutput-filter-functions
            eshell-output-filter-functions)
  :functions (compilation-filter my-advice-compilation-filter)
  :init
  ;; For shell and interpreters
  (setenv "TERM" "xterm-256color")
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
  (add-hook 'shell-mode-hook
            (lambda ()
              ;; Disable font-locking to improve performance
              (font-lock-mode -1)
              ;; Prevent font-locking from being re-enabled
              (make-local-variable 'font-lock-function)
              (setq font-lock-function #'ignore)))

  ;; For eshell
  (with-eval-after-load 'esh-mode
    (add-hook 'eshell-before-prompt-hook
              (lambda ()
                (setq xterm-color-preserve-properties t)))
    (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
    (setq eshell-output-filter-functions
          (remove 'eshell-handle-ansi-color eshell-output-filter-functions)))

  ;; For compilation buffers
  (setq compilation-environment '("TERM=xterm-256color"))
  (defun my-advice-compilation-filter (f proc string)
    (funcall f proc
             (if (eq major-mode 'rg-mode) ; compatible with `rg'
                 string
               (xterm-color-filter string))))
  (advice-add 'compilation-filter :around #'my-advice-compilation-filter)
  (advice-add 'gud-filter :around #'my-advice-compilation-filter))

;; Better term
;; @see https://github.com/akermu/emacs-libvterm#installation
(when (and module-file-suffix           ; dynamic module
           (executable-find "cmake")
           (executable-find "libtool")
           (executable-find "make"))
  (use-package vterm
    :bind (:map vterm-mode-map
           ([f9] . shell-pop))))

;; Shell Pop
(use-package shell-pop
  :bind ([f9] . shell-pop)
  :init (setq shell-pop-window-size 30
              shell-pop-shell-type
              (cond ((fboundp 'vterm) '("vterm" "*vterm*" #'vterm))
                    (sys/win32p '("eshell" "*eshell*" #'eshell))
                    (t '("terminal" "*terminal*"
                         (lambda () (term shell-pop-term-shell)))))))

(provide 'shell-mode-settings)
