;; -*- Emacs-Lisp -*-

;; Time-stamp: <2016-12-05 15:48:22 Monday by wls81>

(require 'compile-settings)
(require 'edit-misc)

;; ;; 在行首C-k时，同时删除该行
(setq-default kill-whole-line t)

;; 缩进设置
;; 不用TAB字符来indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list nil)
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))

;;  自动的在文件末增加一新行
(setq require-final-newline t)

(define-key minibuffer-local-completion-map (kbd "C-k") 'kill-line)

;;(autoload 'copy-region-as-kill "pc-select"  t)

;;;###autoload
(defmacro def-action-on-area-command (fun-name action mark-area doc)
  `(defun ,fun-name ()
     ,doc
     (interactive)
     (save-excursion
       (funcall ,mark-area)
       (call-interactively ,action))))

(apply-args-list-to-fun
 'def-action-on-area-command
  `((copy-function        'copy-region   'mark-function     "Copy function.")
    (kill-function        'kill-region   'mark-function     "Kill function.")
    (indent-function      'indent-region 'mark-function     "Indent function.")
    (indent-paragraph     'indent-region 'mark-paragraph    "Indent paragraph.")
    (copy-whole-buffer    'copy-region   'mark-whole-buffer "Copy whole buffer.")
    (kill-whole-buffer    'kill-region   'mark-whole-buffer "Kill whole buffer.")
    (indent-whole-buffer  'indent-region 'mark-whole-buffer "Indent whole buffer.")))

(eal-define-keys
 (append
  makefile-mode-map-list
  `(emacs-lisp-mode-map lisp-interaction-mode-map
                    conf-javaprop-mode-map html-mode-map tcl-mode-map
                    autoconf-mode-map perl-mode-map nxml-mode-map
                    graphviz-dot-mode-map sh-mode-map python-mode-map py-mode-map))
 `(("C-c c" comment)
   ("C-c x" uncomment)))

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

(eal-define-keys
 'c-mode-base-map
  `(("C-c f" copy-function)
    ("C-c F" kill-function)
    ("C-c C" comment-function)
    ("C-M-h" mark-function)))

(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map)
 `(("C-M-h" mark-function)
   ("C-c D"  edebug-defun)
   ("C-c C-d" eval-defun)
   ("C-c B"  eval-buffer)
   ("C-c f" copy-function)
   ("C-c F" kill-function)
   ("C-c C-q" indent-function)
   ("C-c C" comment-function)
   ("C-c X" uncomment-function)))

(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
(require 'auto-indent-mode)
(auto-indent-global-mode)
(setq auto-indent-assign-indent-level 4) ; Changes the indent level to 4

;;设置自动换行
(setq truncate-partial-width-windows nil) 
;;org-mode 设置自动换行
(require 'org-settings)
(add-hook 'org-mode-hook (lambda() (setq truncate-lines nil)))
;;设置orgmode中图片默认宽度为500
(setq org-image-actual-width '(500))

;; ace-jump-mode 配置，快速查找
(autoload 'ace-jump-mode "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
    '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; switch-window 快速切换窗口
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(provide 'edit-settings)
