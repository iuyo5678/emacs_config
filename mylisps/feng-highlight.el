;;; feng-highlight.el --- 

;; Copyright 2016 zhangguhua
;;
;; Author: zhangguhua@baidu.com
;; Version: $Id: feng-highlight.el,v 0.0 2016/02/26 08:53:25 zhangguhua Exp $
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'feng-highlight)

;;; Code:

(require 'thingatpt)

(defface feng-highlight-at-point-face
    `((((class color) (background light))
       (:background "light green"))
      (((class color) (background dark))
       (:background "royal blue")))
    "Face for highlighting variables"
    :group 'feng-highlight)

(defvar current-highlighted nil)
(defvar highlighted-history-length 1)
(defvar highlighted-history '())

(make-variable-buffer-local 'current-highlighted)
(make-variable-buffer-local 'highlighted-history)

(defun feng-highlight-regex (target)
    (if (and (eq major-mode 'clojure-mode) ; clojure-mode
             (eq (search ":" target) 0))
            (concat (regexp-quote target) "\\>")
        (concat "\\<" (regexp-quote target) "\\>")))

(defun feng-at-point-prev ()
    (interactive)
    (when current-highlighted
        (unless (re-search-backward
                 (feng-highlight-regex current-highlighted) nil t)
            (message "search hit TOP, continue from BOTTOM")
            (goto-char (point-max))
            (feng-at-point-prev))))

(defun feng-at-point-next ()
    (interactive)
    (when current-highlighted
        (forward-char (+ 1 (length current-highlighted))) ; more out of current
        (if (re-search-forward
             (feng-highlight-regex current-highlighted) nil t)
                (backward-char (length current-highlighted))
            (backward-char (+ 1 (length current-highlighted)))
            (message "search hit BOTTOM, continue from TOP")
            (goto-char (point-min))
            (feng-at-point-next))))

(defun feng-at-point-replace ()
    (interactive)
    (when current-highlighted
        (save-excursion
            (goto-char (point-min))           ;; back to top
            (feng-at-point-next)              ;; find first
            (setq isearch-string current-highlighted)
            (isearch-query-replace))))

(defvar feng-highlight-at-point-keymap
    (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-n") 'feng-at-point-next)
        (define-key map (kbd "M-r") 'feng-at-point-replace)
        (define-key map (kbd "M-p") 'feng-at-point-prev)
        map))

(defun feng-highlight-add-to-hisotry (target)
    (let ((l (remove-if (lambda (h)
                            (string= target (second h))) highlighted-history))
          (n (list (point) target)))
        (setq highlighted-history (subseq (cons n l) 0 highlighted-history-length))))

(defun feng-highlight-at-point (&optional arg)
    (interactive "p")
    (remove-overlays (point-min) (point-max) 'feng-highlight t)
    (let* ((target-symbol (symbol-at-point))
           (target (symbol-name target-symbol)))
        (when target-symbol
            (setq current-highlighted target)
            (save-excursion
                (goto-char (point-min))
                (let* ((regexp (feng-highlight-regex target))
                       (len (length target))
                       (end (re-search-forward regexp nil t)))
                    (while end
                        (let ((ovl (make-overlay (- end len) end)))
                            (overlay-put ovl 'keymap feng-highlight-at-point-keymap)
                            (overlay-put ovl 'face 'feng-highlight-at-point-face)
                            (overlay-put ovl 'feng-highlight t))
                        (setq end (re-search-forward regexp nil t))))))))

;;; cycle highlight-hisoty ring
(defun feng-highlight-history-prev ()
    (interactive)
    (if highlighted-history
            (let ((f (car highlighted-history)))
                (setq highlighted-history
                      (append (remove-if-not 'identity (rest highlighted-history)) (list f)))
                (goto-char (car f))
                (feng-highlight-at-point 10))
        (message "No history yet")))

(provide 'feng-highlight)

;;; feng-highlight.el ends here
