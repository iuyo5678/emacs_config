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

;;; History:
;;
;; 2010-4-1
;;      * initial version 1.0.

;;; Code:

(setq kill-ring-max 200)
;; Save clipboard contents into kill-ring before replace them
(setq save-interprogram-paste-before-kill t)

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
(defun copy-region (beg end)
  "根据`mark-active'和`rm-mark-active'来决定是执行`copy-region-as-kill-nomark'还是`rm-kill-ring-save'"
  (interactive "r")
  (copy-region-as-kill beg end))


;;###autoload
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
(defun smart-copy ()
  "智能拷贝, 如果`mark-active'的话, 则`copy-region', 否则`copy-lines'"
  (interactive)
  (if mark-active (call-interactively 'copy-region) (call-interactively 'copy-lines)))

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
(defun smart-kill ()
  "If `mark-active', call `kill-region', otherwise call `kill-whole-line'."
  (interactive)
  (if mark-active
   (call-interactively 'kill-region)
   (call-interactively 'kill-whole-line)))

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


(provide 'edit-misc)

;;; edit-misc.el ends here
