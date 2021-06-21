;;; TEMPLATE.el.tpl ---

;; Copyright 2021 Zhang Guhua
;;
;; Author: zhangguhua@DRAKEZHANG-MB1
;; Version: $Id: zgh-utils.el,v 0.0 2021/06/18 11:31:19 zhangguhua Exp $
;; Keywords:
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;
(defun centaur--load-theme (theme)
  "Disable others and enable new one."
  (when theme
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t)
    (message "Loaded theme `%s'" theme)))


(defalias 'move-beginning-of-line 'beginning-of-line)
(defalias 'move-end-of-line       'end-of-line)



(defcustom centaur-lsp-format-on-save-ignore-modes '(c-mode c++-mode python-mode)
  "The modes that don't auto format and organize imports while saving the buffers.
`prog-mode' means ignoring all derived modes.
"
  :group 'centaur
  :type '(repeat (symbol :tag "Major-Mode")))

;;;###autoload
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.

HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))
;;;###autoload
(defun revert-buffer-no-confirm ()
  "执行`revert-buffer'时不需要确认"
  (interactive)
  (let ((is-view (if view-mode 1 -1)))
    (when (buffer-file-name)
      (revert-buffer buffer-file-name t)
      (view-mode is-view))))

(defun revert-buffer-with-coding-system-no-confirm (coding-system)
  "Call `revert-buffer-with-coding-system', but when `revert-buffer' do not need confirm."
  (interactive "zCoding system for visited file (default nil): ")
  (let ((coding-system-for-read coding-system))
    (revert-buffer-no-confirm)))

;;;###autoload
(defun revert-buffer-with-gbk ()
  "Call `revert-buffer-with-coding-system-no-confirm' with gbk."
  (interactive)
  (revert-buffer-with-coding-system-no-confirm 'gbk))

;;;###autoload
(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

;;;###autoload
(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

;;;###autoload
(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

;;;###autoload
(defun am-forward-word-or-to-word ()
  "`forward-word' or `forward-to-word'.
If after excute `forward-to-word', current position
is at next line, then rollback and excute `forward-word'"
  (interactive)
  (forward-word)
  )

;;;###autoload
(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, and evaluate BODY there like `progn'.
See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

;;;###autoload
(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))

;;;###autoload
(defun insert-current-date ()
  "Insert the current date"
  (interactive "*")
  ;;(insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
  (insert (format-time-string "%Y/%m/%d" (current-time))))

;;;###autoload
(defun insert-current-time ()
  "Insert the current time"
  (interactive "*")
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
;;(insert (format-time-string "%H:%M:%S" (current-time))))

;;;###autoload
(defun goto-paren ()
  "跳到匹配的括号"
  (interactive)
  (cond
   ((looking-at "[ \t]*[[\"({]") (forward-sexp) (backward-char))
   ((or (looking-at "[]\")}]") (looking-back "[]\")}][ \t]*" 1)) (if (< (point) (point-max)) (forward-char)) (backward-sexp))
   (t (message "找不到匹配的括号"))))


;;;###autoload
(defun unset-key (keymap key)
  "Remove binding of KEY in map KEYMAP.
KEY is a string or vector representing a sequence of keystrokes."
  (define-key keymap key nil))

(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s, mode-name为%s" major-mode mode-name))



(provide 'zgh-utils)
;;; zgh-utils.el ends here
