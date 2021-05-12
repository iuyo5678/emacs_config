;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; Keywords:
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/edit-misc.el
;; Time-stamp: <2016-03-08 23:16:48 Tuesday by zhangguhua>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Installation:
;;
;; Copy edit-misc.el to your load-path and add to your .emacs:
;;
;; (require 'edit-misc)

;;; History:
;;
;; 2010-4-1
;;      * initial version 1.0.

;;; Code:

;;;###autoload
(defun backward-kill-word-or-kill-region ()
  "`mark-active'时, 剪切选择的区域, 平时向后删除word, 和bash下面一样."
  (interactive)
  (if mark-active
        (if cua-mode
            (progn
              (cua-cut-rectangle t)
              (cua-cancel))
          (call-interactively 'kill-region))
      (call-interactively 'backward-kill-word)))

;;;###autoload
(defun mark-whole-sexp (&optional not-whole)
  "Mark whole sexp.

If NOT-WHOLE is non-nil, do not mark whole sexp."
  (interactive "P")
  (if not-whole
      (mark-sexp)
    (let ((region (bounds-of-thing-at-point 'sexp)))
      (if (not region)
          (message "Can not found sexp.")
        (goto-char (car region))
        (call-interactively 'set-mark-command)
        (forward-sexp)))))

;;;###autoload
(defun kill-whole-sexp (&optional not-whole)
  "Kill whole sexp.

If NOT-WHOLE is non-nil, do not kill whole sexp."
  (interactive)
  (mark-whole-sexp not-whole)
  (backward-kill-word-or-kill-region))

;;;###autoload
(defun copy-sexp (&optional not-whole)
  "Copy whole sexp.

If NOT-WHOLE is non-nil, do not copy whole sexp."
  (interactive)
  (save-excursion
    (mark-whole-sexp not-whole)
    (if mark-active
        (copy-region (region-beginning) (region-end)))))

;;;###autoload
(defun my-kill-word ()
  "删除一个单词, 当光标处于单词中间时也删除整个单词, 这是与`kill-word'的区别"
  (interactive)
  (wcy-mark-some-thing-at-point)
  (backward-kill-word-or-kill-region))

;;;###autoload
(defun mark-function ()
  "Mark function."
  (interactive)
  (cond
   ((or (equal major-mode 'c-mode) (equal major-mode 'c++-mode))
    (c-mark-function))
   ((or (equal major-mode 'emacs-lisp-mode) (equal major-mode 'lisp-mode) (equal major-mode 'lisp-interaction-mode))
    (lisp-mark-function))))

;;;###autoload
(defmacro def-action-on-function-command (fun-name action action-str)
  `(defun ,fun-name ()
     ,(concat (capitalize action-str) " function.")
     (interactive)
     (save-excursion
       (mark-function)
       (call-interactively ,action))))

;;;###autoload
(defun comment-function (&optional arg)
  "Comment function."
  (interactive "P")
  (save-excursion
    (mark-function)
    (comment-region (region-beginning) (region-end) arg)))

;;;###autoload
(defun uncomment-function (&optional arg)
  "unComment function."
  (interactive "P")
  (save-excursion
    (mark-function)
    (uncomment-region (region-beginning) (region-end) arg)))

;;;###autoload
(defun kill-whole-paragraph (&optional arg)
  "Kill whole paragraph."
  (interactive "P")
  (if arg
      (kill-paragraph nil)
    (call-interactively 'mark-paragraph)
    (call-interactively 'kill-region)))


;;;###autoload
(defun copy-whole-paragraph (&optional arg)
  "Copy whole paragraph."
  (interactive "P")
  (save-excursion
    (if arg
        (progn
          (mark-command t)
          (forward-paragraph))
      (call-interactively 'mark-paragraph))
    (call-interactively 'copy-region)))

;;;###autoload
(defun copy-cur-line ()
  "拷贝当前行"
  (interactive)
  (let ((end (min (point-max) (1+ (line-end-position)))))
    (copy-region-as-kill (line-beginning-position) end)))

;;;###autoload
(defun copy-lines (&optional number)
  "从当前行开始拷贝NUMBER行"
  (interactive "p")
  (if (null number)
      (copy-cur-line)
    (let ((lineNo))
      (save-excursion
        (if (< number 0)
            (next-line))
        (setq lineNo (line-number-at-pos nil))
        (move-beginning-of-line nil)
        (set-mark-command nil)
        (goto-line (+ number lineNo))
        (call-interactively 'copy-region-as-kill)))))

;;;###autoload
(defun copy-line-left ()
  "拷贝当前行光标后面的文字"
  (interactive)
  (copy-region-as-kill (point) (min (1+ (line-end-position)) (point-max))))

;;;###autoload
(defun smart-copy ()
  "智能拷贝, 如果`mark-active'的话, 则`copy-region', 否则`copy-lines'"
  (interactive)
  (if mark-active (call-interactively 'copy-region) (call-interactively 'copy-lines)))

;;;###autoload
(defun copy-region-and-paste ()
  "拷贝region并且粘贴到region后"
  (interactive)
  (call-interactively 'copy-region)
  (call-interactively 'yank))

;;;###autoload
(defun which-copy ()
  "如果`mark-active'的话, 则`copy-region-and-paste', 否则`copy-line-left'"
  (interactive)
  (if mark-active (copy-region-and-paste) (copy-line-left)))

;;;###autoload
(defun insert-cur-line ()
  "拷贝当前行并粘贴进当前buffer"
  (interactive)
  (copy-cur-line)
  (forward-line)
  (beginning-of-line)
  (call-interactively 'yank)
  (previous-line)
  (end-of-line))

;;;###autoload
(defun insert-cur-sexp ()
  "拷贝当前sexp并粘贴进当前buffer"
  (interactive)
  (copy-sexp)
  (call-interactively 'yank))

;;;###autoload
(defun copy-sentence ()
  "拷贝sentence"
  (interactive)
  (save-excursion
    (call-interactively 'mark-end-of-sentence)
    (call-interactively 'copy-region-as-kill)))

;; 删除当前光标到行首的字符
;;;###autoload
(defun del-to-begin (&optional arg)
  "Delete characters to line beginning."
  (interactive "P")
  (if (not arg)
      (kill-line 0)
    (copy-region-as-kill (1+ (line-beginning-position)) (point))))

;;;###autoload
(defun lisp-mark-function (&optional allow-extend)
  "`mark-defun'有时候会多mark一个空白行, 这个函数就是解决这个bug的"
  (interactive "p")
  (mark-defun allow-extend)
  (let (next-is-fun)
    (save-excursion (forward-line) (setq next-is-fun (looking-at "[ \t]*(defun")))
    (if (or (looking-at "$") (and next-is-fun (not (looking-at "[ \t]*(defun"))))
        (forward-line))))

;;;###autoload
(defun case-trans ()
  "大小写转换当前字符"
  (interactive)
  (let* ((ochar (char-after (point))) (char ochar))
    (if (and (>= char ?a) (<= char ?z))
        (setq char (upcase char))
      (setq char (downcase char)))
    (if (/= ochar char)
        (save-excursion
          (delete-char 1)
          (insert-char char 1)))))

;;;###autoload
(defun comment (&optional arg)
  "如果`mark-active'的话,就`comment-region',否则注释光标所在行"
  (interactive "P")
  (if mark-active
      (comment-region (region-beginning) (region-end) arg)
    (let (fun)
      (if arg (setq fun 'uncomment-region) (setq fun 'comment-region))
      (funcall fun (line-beginning-position) (line-end-position)))))

;;;###autoload
(defun uncomment (&optional arg)
  "如果`mark-active'的话,就`uncomment-region',否则取消注释光标所在行"
  (interactive "P")
  (if mark-active
      (uncomment-region (region-beginning) (region-end) arg)
    (let (fun)
      (if arg (setq fun 'comment-region) (setq fun 'uncomment-region))
      (funcall fun (line-beginning-position) (line-end-position)))))

;;;###autoload
(defun mark-invisible-region ()
  "Mark invisible region."
  (interactive)
  (if (not (and last-region-beg last-region-end))
      (message "No previous region.")
    (goto-char last-region-beg)
    (if last-region-is-rect
        (if last-region-use-cua
            (call-interactively 'cua-set-rectangle-mark)
          (call-interactively 'rm-set-mark))
      (call-interactively 'set-mark-command))
    (goto-char last-region-end)
    (if (and last-region-is-rect last-region-use-cua)
        (cua--activate-rectangle))))

;;;###autoload
(defun c-electric-backspace-kill ()
  "If `mark-active', run `kill-region', otherwise run `c-electric-backspace'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'c-electric-backspace)))

;;;###autoload
(defun delete-blank-lines-region (beg end)
  "Execute `delete-blank-lines' in region."
  (interactive "*r")
  (save-excursion
    (goto-char beg)
    (let ((blank-line "^\\s-*$")
          (nonblank-line "^.*\\S-.*$")
          blank-beg blank-end)
      (while (and (< (point) end) (setq blank-beg (search-forward-regexp blank-line end t)))
        (save-excursion
          (setq blank-end (search-forward-regexp nonblank-line end t)))
        (if blank-end
            (setq end (- end (- blank-end blank-beg)))
          (setq end 0))
        (previous-line)
        (delete-blank-lines)))))

;;;###autoload
(defun smart-delete-blank-lines (&optional no-region)
  "Smart `delete-blank-lines'.

If NO-REGION is non-nil, always execute `delete-blank-lines',
otherwise, if `mark-active', execute `delete-blank-lines-region',
and execute `delete-blank-lines' if there no mark."
  (interactive "P")
  (if (or no-region (not mark-active))
      (delete-blank-lines)
    (call-interactively 'delete-blank-lines-region)))

;;;###autoload
(defun smart-home (&optional home)
  "Goto home.

If HOME is negative, call `beginning-of-line-text',
otherwise call `move-beginning-of-line'."
  (interactive "P")
  (if (not home)
      (let ((old (point)))
        (beginning-of-line-text)
        (if (= (point) old)
            (move-beginning-of-line 1)))
    (if (< (prefix-numeric-value home) 0)
        (beginning-of-line-text)
      (move-beginning-of-line 1))))

;;;###autoload
(defun smart-kill ()
  "If `mark-active', call `kill-region', otherwise call `kill-whole-line'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'kill-whole-line)))

;;;###autoload
(defun smart-indent ()
  "If `mark-active', call `indent-region', otherwise indent all buffer."
  (interactive)
  (save-excursion
    (unless mark-active
      (call-interactively 'mark-whole-buffer))
    (call-interactively 'indent-region)))

;;;###autoload
(defun fill-paragraph-justify (region)
  "Run `fill-paragraph' with argument justify t."
  (interactive (list t))
  (fill-paragraph 'full region))

;;;###autoload
(defun insert-time ()
  (interactive)
  (insert "Time-stamp: <>\n"))


;;显示当前buffer或region或函数的行数和字符数，绑定到按键C-x l
(defun count-brf-lines (&optional is-fun)
    "显示当前buffer或region或函数的行数和字符数"
    (interactive "P")
    (let (min max)
        (if is-fun
                (save-excursion
                    (beginning-of-defun) (setq min (point))
                    (end-of-defun) (setq max (point))
                    (message "当前函数%s内共有%d行, %d个字符" (which-function) (count-lines min max) (- max min)))
            (if mark-active
                    (progn
                        (setq min (min (point) (mark)))
                        (setq max (max (point) (mark))))
                (setq min (point-min))
                (setq max (point-max)))
            (if (or (= 1 (point-min)) mark-active)
                    (if mark-active
                            (message "当前region内共有%d行, %d个字符" (count-lines min max) (- max min))
                        (message "当前buffer内共有%d行, %d个字符" (count-lines min max) (- max min)))
                (let ((nmin min) (nmax max))
                    (save-excursion
                        (save-restriction
                            (widen)
                            (setq min (point-min))
                            (setq max (point-max))))
                    (message "narrow下buffer内共有%d行, %d个字符, 非narrow下buffer内共有%d行, %d个字符"
                             (count-lines nmin nmax) (- nmax nmin) (count-lines min max) (- max min)))))))
(eal-define-keys-commonly
 global-map
 `(("C-x l" count-brf-lines)
   ))



(defun edit-current-file-as-root ()
    "Edit the file that is associated with the current buffer as root"
    (interactive)
    (if (buffer-file-name)
            (progn
                (setq file (concat "/sudo:root@localhost:" (buffer-file-name)))
                (find-file file))
        (message "Current buffer does not have an associated file.")))


;; C-x C-j open the directory of current buffer
(global-set-key (kbd "C-x C-j")
                (lambda ()
                  (interactive)
                  (if (buffer-file-name)
                      (dired default-directory))))

;; 共享粘贴板
(setq x-select-enable-clipboard t)
(setq mouse-drag-copy-region t)

(provide 'edit-misc)

;;; edit-misc.el ends here
