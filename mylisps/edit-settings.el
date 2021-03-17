;; -*- Emacs-Lisp -*-

;; Time-stamp: <2021-03-15 17:20:35 Monday by zhangguhua>

(require 'edit-misc)

;; ;; 在行首C-k时，同时删除该行
(setq-default kill-whole-line t)

;; 缩进设置
;; 不用TAB字符来indent
(setq-default indent-tabs-mode nil
              fill-column 80
              tab-width 4
              tab-stop-list nil)

;;  自动的在文件末增加一新行
(setq require-final-newline t)

(define-key minibuffer-local-completion-map (kbd "C-k") 'kill-line)

(eal-define-keys-commonly
 global-map
 `(("C-x \\"  rm-mark-command)
   ("M-w"     copy-region)))

;;;###autoload
(defun rm-mark-command ()
  "如果是CUA\ mode, 则执行`cua-set-rectangle-mark', 否则执行`rm-set-mark'"
  (interactive)
  (setq last-region-beg (point))
    (call-interactively 'rm-set-mark))

;;;###autoload
(defun copy-region (beg end)
  "根据`mark-active'和`rm-mark-active'来决定是执行`copy-region-as-kill-nomark'还是`rm-kill-ring-save'"
  (interactive "r")
     (copy-region-as-kill beg end))

;;;###autoload
(defmacro def-action-on-area-command (fun-name action mark-area doc)
  `(defun ,fun-name ()
     ,doc
     (interactive)
     (save-excursion
       (funcall ,mark-area)
       (call-interactively ,action))))


;;;###autoload
(defmacro def-redo-command (fun-name redo undo)
  "Make redo command."
  `(defun ,fun-name ()
     (interactive)
     (if (equal last-command ,redo)
         (setq last-command 'undo)
       (setq last-command nil))
     (call-interactively ,undo)
     (setq this-command ,redo)))
(def-redo-command redo 'redo 'undo)

(eal-define-keys-commonly
 global-map
 `(("M-k" kill-whole-paragraph)
   ("M-C-k" kill-paragraph)
   ("M-C" copy-whole-paragraph)
   ("C-x c" copy-whole-buffer)
   ("C-x C" kill-whole-buffer)
   ("M-W" which-copy)
   ("M-w" smart-copy)
   ("C-x M-w" insert-cur-line)
   ("C-x M-W" insert-cur-sexp)
   ("C-M-w" copy-sentence)
   ;; 删除整行
   ("M-K" kill-line)
   ("C-k" smart-kill)
   ("C-\\" delete-indentation)
   ("C-x M-M" mark-invisible-region)
   ("M-U" del-to-begin)
   ("C-^" case-trans)
   ("C-6" case-trans)
   ("C-w" backward-kill-word-or-kill-region)
   ("C-x S" mark-whole-sexp)
   ("C-x W" kill-whole-sexp)
   ("C-x w" copy-sexp)
   ("M-D" my-kill-word)
   ("C-x TAB" indent-whole-buffer)
   ("M-Y" redo)
   ("M-m" beginning-of-line-text)
   ("C-M-\\" smart-indent)
   ("M-q" fill-paragraph-justify)
   ("C-c t" insert-time)
   ("<escape> SPC" just-one-space)))



;;设置自动换行
(setq truncate-partial-width-windows nil)
(add-hook 'org-mode-hook (lambda() (setq truncate-lines nil)))


;; Package: ws-butler
(use-package ws-butler
  :hook ((c-mode-common-hook . ws-butler-mode)
         (prog-mode-hook . ws-butler-mode)
         (text-mode . ws-butler-mode)
         (fundamental-mode . ws-butler-mode)))


;; 和机器共享剪切板
(setq x-select-enable-clipboard t)

;; Show number of matches in mode-line while searching
(use-package anzu
  :diminish
  :bind (([remap query-replace] . anzu-query-replace)
         ([remap query-replace-regexp] . anzu-query-replace-regexp)
         :map isearch-mode-map
         ([remap isearch-query-replace] . anzu-isearch-query-replace)
         ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp))
  :hook (after-init . global-anzu-mode))

;; A comprehensive visual interface to diff & patch
(use-package ediff
  :ensure nil
  :hook(;; show org ediffs unfolded
        (ediff-prepare-buffer . outline-show-all)
        ;; restore window layout when done
        (ediff-quit . winner-undo))
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-merge-split-window-function 'split-window-horizontally))

;; Delete selection if you insert
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package rect
  :ensure nil
  :bind (:map text-mode-map
         ("<C-return>" . rect-hydra/body)
         :map prog-mode-map
         ("<C-return>" . rect-hydra/body))
  :init
  (with-eval-after-load 'org
    (bind-key "<s-return>" #'rect-hydra/body org-mode-map))
  (with-eval-after-load 'wdired
    (bind-key "<C-return>" #'rect-hydra/body wdired-mode-map))
  :pretty-hydra
  ((:title (pretty-hydra-title "Rectangle" 'material "border_all" :height 1.2 :v-adjust -0.225)
    :color amaranth :body-pre (rectangle-mark-mode) :post (deactivate-mark) :quit-key ("q" "C-g"))
   ("Move"
    (("h" backward-char "←")
     ("j" next-line "↓")
     ("k" previous-line "↑")
     ("l" forward-char "→"))
    "Action"
    (("w" copy-rectangle-as-kill "copy") ; C-x r M-w
     ("y" yank-rectangle "yank")         ; C-x r y
     ("t" string-rectangle "string")     ; C-x r t
     ("d" kill-rectangle "kill")         ; C-x r d
     ("c" clear-rectangle "clear")       ; C-x r c
     ("o" open-rectangle "open"))        ; C-x r o
    "Misc"
    (("N" rectangle-number-lines "number lines")        ; C-x r N
     ("e" rectangle-exchange-point-and-mark "exchange") ; C-x C-x
     ("u" undo "undo")
     ("r" (if (region-active-p)
              (deactivate-mark)
            (rectangle-mark-mode 1))
      "reset")))))

;; Automatically reload files was modified by external program
(use-package autorevert
  :ensure nil
  :diminish
  :hook (after-init . global-auto-revert-mode))

;; Jump to things in Emacs tree-style
(use-package avy
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0))
  :hook (after-init . avy-setup-default)
  :config (setq avy-all-windows nil
                avy-all-windows-alt t
                avy-background t
                avy-style 'pre))

;; Kill text between the point and the character CHAR
(use-package avy-zap
  :bind (("M-z" . avy-zap-to-char-dwim)
         ("M-Z" . avy-zap-up-to-char-dwim)))

;; Quickly follow links
(use-package ace-link
  :defines (org-mode-map
            gnus-summary-mode-map
            gnus-article-mode-map
            ert-results-mode-map)
  :bind ("M-o" . ace-link-addr)
  :hook (after-init . ace-link-setup-default)
  :config
  (with-eval-after-load 'org
    (bind-key "M-o" #'ace-link-org org-mode-map))
  (with-eval-after-load 'gnus
    (bind-keys
     :map gnus-summary-mode-map
     ("M-o" . ace-link-gnus)
     :map gnus-article-mode-map
     ("M-o" . ace-link-gnus)))
  (with-eval-after-load 'ert
    (bind-key "o" #'ace-link-help ert-results-mode-map)))

;; Jump to Chinese characters
(use-package ace-pinyin
  :diminish
  :hook (after-init . ace-pinyin-global-mode))

;; Minor mode to aggressively keep your code always indented
(use-package aggressive-indent
  :diminish
  :hook ((after-init . global-aggressive-indent-mode)
         ;; FIXME: Disable in big files due to the performance issues
         ;; https://github.com/Malabarba/aggressive-indent-mode/issues/73
         (find-file . (lambda ()
                        (if (> (buffer-size) (* 3000 80))
                            (aggressive-indent-mode -1)))))
  :config
  ;; Disable in some modes
  (dolist (mode '(asm-mode web-mode html-mode css-mode go-mode scala-mode prolog-inferior-mode))
    (push mode aggressive-indent-excluded-modes))

  ;; Disable in some commands
  (add-to-list 'aggressive-indent-protected-commands #'delete-trailing-whitespace t)

  ;; Be slightly less aggressive in C/C++/C#/Java/Go/Swift
  (add-to-list 'aggressive-indent-dont-indent-if
               '(and (derived-mode-p 'c-mode 'c++-mode 'csharp-mode
                                     'java-mode 'go-mode 'swift-mode)
                     (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                         (thing-at-point 'line))))))


;; An all-in-one comment command to rule them all
(use-package comment-dwim-2
  :bind ([remap comment-dwim] . comment-dwim-2)) ;

;; Drag stuff (lines, words, region, etc...) around
(use-package drag-stuff
  :diminish
  :commands drag-stuff-define-keys
  :hook (after-init . drag-stuff-global-mode)
  :config
  (add-to-list 'drag-stuff-except-modes 'org-mode)
  (drag-stuff-define-keys))



;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

;; Edit multiple regions in the same way simultaneously
(use-package iedit
  :defines desktop-minor-mode-table
  :bind (("C-;" . iedit-mode)
         ("C-x r RET" . iedit-rectangle-mode)
         :map isearch-mode-map ("C-;" . iedit-mode-from-isearch)
         :map esc-map ("C-;" . iedit-execute-last-modification)
         :map help-map ("C-;" . iedit-mode-toggle-on-function))
  :config
  ;; Avoid restoring `iedit-mode'
  (with-eval-after-load 'desktop
    (add-to-list 'desktop-minor-mode-table
                 '(iedit-mode nil))))

;; Increase selected region by semantic units
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Multiple cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c"   . mc/edit-lines)
         ("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-c C-<"       . mc/mark-all-like-this)
         ("C-M->"         . mc/skip-to-next-like-this)
         ("C-M-<"         . mc/skip-to-previous-like-this)
         ("s-<mouse-1>"   . mc/add-cursor-on-click)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         :map mc/keymap
         ("C-|" . mc/vertical-align-with-space)))

;; Smartly select region, rectangle, multi cursors
(use-package smart-region
  :hook (after-init . smart-region-on))

;; On-the-fly spell checker
(use-package flyspell
  :ensure nil
  :diminish
  :if (executable-find "aspell")
  :hook (((text-mode outline-mode) . flyspell-mode)
         (prog-mode . flyspell-prog-mode)
         (flyspell-mode . (lambda ()
                            (dolist (key '("C-;" "C-," "C-."))
                              (unbind-key key flyspell-mode-map)))))
  :init (setq flyspell-issue-message-flag nil
              ispell-program-name "aspell"
              ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together"))
  :config
  ;; Correcting words with flyspell via Ivy
  (use-package flyspell-correct-ivy
    :after ivy
    :bind (:map flyspell-mode-map
           ([remap flyspell-correct-word-before-point] . flyspell-correct-wrapper))
    :init (setq flyspell-correct-interface #'flyspell-correct-ivy)))

;; Hungry deletion
(use-package hungry-delete
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  :config (setq-default hungry-delete-chars-to-skip " \t\f\v"))

;; Framework for mode-specific buffer indexes
(use-package imenu
  :ensure nil
  :bind (("C-." . imenu)))

;; Move to the beginning/end of line or code
(use-package mwim
  :bind (([remap move-beginning-of-line] . mwim-beginning-of-code-or-line)
         ([remap move-end-of-line] . mwim-end-of-code-or-line)))

;; Windows-scroll commands
(use-package pager
  :bind (([remap scroll-up-command] . pager-page-down)
         ([remap scroll-down-command] . pager-page-up)
         ([next]   . pager-page-down)
         ([prior]  . pager-page-up)
         ([M-up]   . pager-row-up)
         ([M-kp-8] . pager-row-up)
         ([M-down] . pager-row-down)
         ([M-kp-2] . pager-row-down)))

;; Treat undo history as a tree
(use-package undo-tree
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-enable-undo-in-region nil
        undo-tree-auto-save-history nil)

  ;; HACK: keep the diff window
  (with-no-warnings
    (make-variable-buffer-local 'undo-tree-visualizer-diff)
    (setq-default undo-tree-visualizer-diff t)))

;; Goto last change
(use-package goto-chg
  :bind ("C-," . goto-last-change))

;; Record and jump to the last point in the buffer
(use-package goto-last-point
  :diminish
  :bind ("C-M-," . goto-last-point)
  :hook (after-init . goto-last-point-mode))

;; Preview when `goto-char'
(use-package goto-char-preview
  :bind ([remap goto-char] . goto-char-preview))

;; Preview when `goto-line'
(use-package goto-line-preview
  :bind ([remap goto-line] . goto-line-preview))

;; Handling capitalized subwords in a nomenclature
(use-package subword
  :ensure nil
  :diminish
  :hook ((prog-mode . subword-mode)
         (minibuffer-setup . subword-mode)))

;; Hideshow
(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :bind (:map hs-minor-mode-map
         ("C-`" . hs-toggle-hiding)))

;; Flexible text folding
(use-package origami
  :pretty-hydra
  ((:title (pretty-hydra-title "Origami" 'octicon "fold" :height 1.1 :v-adjust -0.05)
    :color amaranth :quit-key "q")
   ("Node"
    ((":" origami-recursively-toggle-node "toggle recursively")
     ("a" origami-toggle-all-nodes "toggle all")
     ("t" origami-toggle-node "toggle current")
     ("o" origami-show-only-node "only show current"))
    "Actions"
    (("u" origami-undo "undo")
     ("d" origami-redo "redo")
     ("r" origami-reset "reset"))))
  :bind (:map origami-mode-map
         ("C-`" . origami-hydra/body))
  :hook (prog-mode . origami-mode)
  :init (setq origami-show-fold-header t)
  :config (face-spec-reset-face 'origami-fold-header-face))

;; Open files as another user
(unless sys/win32p
  (use-package sudo-edit))

;; Narrow/Widen
(use-package fancy-narrow
  :diminish
  :hook (after-init . fancy-narrow-mode))

(defun visit-.emacs ()
  "访问.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path "init.el")))
(global-set-key (kbd "C-x E") 'visit-.emacs)


(defun goto-my-emacs-lisps-dir ()
  "Goto `my-emacs-lisps-path'."
  (interactive)
  (dired my-emacs-lisps-path))
(defun goto-my-emacs-my-lisps-dir ()
  "Goto `my-emacs-my-lisps-path'."
  (interactive)
  (dired my-emacs-my-lisps-path))
(defun goto-my-emacs-dir ()
  "Goto `my-emacs-path'."
  (interactive)
  (dired my-emacs-path))
(defun goto-my-org-path ()
  "Go to 'my-org-path'."
  (interactive)
  (dired my-org-file-path))
(defun goto-my-home-dir ()
  "Goto my home directory."
  (interactive)
  (dired "~"))
(define-key-list
  global-map
  `(("C-x G l" goto-my-emacs-lisps-dir)
    ("C-x G m" goto-my-emacs-my-lisps-dir)
    ("C-x G e" goto-my-emacs-dir)
    ("C-x M-H" goto-my-home-dir)
    ("C-x G o" goto-my-org-path)))
(provide 'edit-settings)
